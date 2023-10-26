Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA5D7D89FF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4051910E8B0;
	Thu, 26 Oct 2023 21:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69110E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 21:03:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40859c46447so9478095e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354233; x=1698959033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B/wgqf7zM8eB9vC8458/vz6gwRWY3/cTZbVdubKjZKo=;
 b=JIMw503Co1BbcSmLkMxT5/uZZ+bjDGmhIat2CvOXlL4fpQrU4vRRev5LRzq5lOMKJv
 ajBAVOcpCwbDkMxrbbGUzJgZjdgh7+503qgkpMlQ0WgymcsKEmbBnYFnou8GpXO9JdgE
 BJsUQLMEiZo0kxW5Y/7fWNcPuiS0jG9H05skCzrZjDuzuojqsHxr4OJPk+Kk9NWEEUAb
 0xxPhsv85c2cOAkMHGoWuMgIIqSrc/YWV9kQjMNCFMkogmTbDqZz7gpyel+Jv+kQrwX7
 spIym7je2VqGxiBYUn8SyVbDPo9oQiNNO/5SC1omA+LMtvVdL+i4IntYJGiLTNPWPQF0
 rnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354233; x=1698959033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B/wgqf7zM8eB9vC8458/vz6gwRWY3/cTZbVdubKjZKo=;
 b=rJR+rcyqKYdRCDlV4/QlWZT4PN3N/Jq1onaLfuCoYBHerhCerys9SjqgVSN5D3yOIN
 bdXz1DteWxHJRErTHq+FdqCTA93EWGIY7C2Wcobf0QnMMuZ1HSusFOEHnGEVyjtqEQEz
 707gS5F4RVnyECqt8hhq0GTh4Z0VNxRRweMXbzmR89rmWgFvBTzf6cik29BdHNFWLqJg
 GNYmRnOYShXGRg0rcGeQoOLo8et2ihaO63QVwMs2IA8cQV7CEgXE0QQEFR0c1CfrAMYw
 ys5/MBN+Oam21tAkW1sM5Cf33p2gcNub70DqWS9LiIeO87DZdDO5B6oEWx/tSSYtn02x
 GEXQ==
X-Gm-Message-State: AOJu0Yw7AOEl4zLqtri+NiBZS1eJ4ljxeG7WHwJhmFjRbyBd/uONOrbh
 oUzqboaJVw1MSnxOEaK9MhVAAA==
X-Google-Smtp-Source: AGHT+IHCcKAcemS8hwf9I07v2oLrBnbMRG5xiXH08cWmqWS1KElMruGadt46xV+u93VTSaietpea8w==
X-Received: by 2002:a5d:598d:0:b0:32d:827e:7bd8 with SMTP id
 n13-20020a5d598d000000b0032d827e7bd8mr612280wri.70.1698354232769; 
 Thu, 26 Oct 2023 14:03:52 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 r16-20020a5d4950000000b0032d81837433sm256158wrs.30.2023.10.26.14.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 14:03:52 -0700 (PDT)
Message-ID: <e081ca54-e8a6-40da-b101-194e6a6a351b@linaro.org>
Date: Thu, 26 Oct 2023 23:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] phy: qualcomm: add QMP HDMI PHY driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Port Qualcomm QMP HDMI PHY to the generic PHY framework. Split the
> generic part and the msm8996 part. When adding support for msm8992/4 and
> msm8998 (which also employ QMP for HDMI PHY), one will have to provide
> the PLL programming part only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Taking a quick look, my comments from v2 were not taken into account

https://lore.kernel.org/linux-arm-msm/1513ea17-2807-4f7c-30f2-6158b5f3e55e@linaro.org/

Konrad
