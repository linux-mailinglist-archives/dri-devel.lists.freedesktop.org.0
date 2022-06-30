Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA3562CB3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3166810FA88;
	Fri,  1 Jul 2022 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCEF1129AF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:30:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so25182wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rBlnAHZeL5VXmWVXaof16R/ixBz+W8sUAmztG7bWwdA=;
 b=K/Dd7SQmYF1n30wjzfyn+wicHPLnbgHBONWFA8yAzv5u7Fky/uX0TGZGQaO+6dFuom
 awxlBLCLS0X9hQhgqJoAMg6wxGndw53pbu69G315tkgEUpHyFbeY3Vpkjirw3+vb3tsw
 kNoYgqP9blq7fPXcJEIZzxuE2kCGoQrJMzxEMeOs6A1FPTa++hVZHHveIt8jEWbTf5Vt
 sCpqz0irESo8uEhacBZmzgdgVIJPeRrkYnCmhBNcXs7TrBn3tDc7J7VYMcCXHCI2wxgR
 oQdua2yioRJKcxkhcmgDSVtH8LOas0DUeKKZe0WnAmVmagyolaBzbSzPqiudslvlVrnY
 sdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rBlnAHZeL5VXmWVXaof16R/ixBz+W8sUAmztG7bWwdA=;
 b=a8E3UfE+g9Hwo+h/IQXH5Xu+697YYx/zrz3phRFJyzq464huMOfQEt5mcyzAKsrdhs
 zxqwBUKbnFNz9gHUTskS9sZU5On2zJNpK0uCNmh6yVZbESPXzmmDzPrmb5WP/FApBsGf
 ENPZ2ePALcQnnLodBCSceh86JnPuCFpnsqw285Scyd2ltSz/PQdn9pAININYIzE5Dv2K
 l/Xd8YiT3Eg8qO0LijoGwmSFKdVpBQqcW9WeH4rK2fN3/1aa1ATgD8AkzMg8Q2v4XjW8
 IDqxlwV7eqaD6bFSLT14zmVkno3eTMwxNBcQbnRG/zwN/6ypq0YDPBu4TTbpeeEK3uzB
 XgYQ==
X-Gm-Message-State: AJIora+jWg+TXzXpRjFApCuostdNwxayxftLYvR9zagxgr17yY2jf5pw
 qo24UuQSV4GnXOnFJwdgeXScAw==
X-Google-Smtp-Source: AGRyM1tLj/vYf0am5BBMHwtKy2IXo0Ez0eVYfADzx1DrAlAhLtgm15DK4/UdzX7sr7zxKR5O2uYPJg==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id
 l20-20020a7bc354000000b0039c675321f8mr11578038wmj.113.1656610204470; 
 Thu, 30 Jun 2022 10:30:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a7bc758000000b003a018e43df2sm3323922wmk.34.2022.06.30.10.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:30:04 -0700 (PDT)
Message-ID: <d177d650-0c61-0ae0-17bb-9d4311582652@linaro.org>
Date: Thu, 30 Jun 2022 18:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
 <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 18:16, Dmitry Baryshkov wrote:
> 
> All three descriptions are the same. This looks like a c&p issue

Those are what the previous values were.

I'll come up with something less robotic though.
