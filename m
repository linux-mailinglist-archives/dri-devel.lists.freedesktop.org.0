Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC146A86F1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394DA10E25C;
	Thu,  2 Mar 2023 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5510E25C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 16:40:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i28so119974lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=clemDdlw5AVVfbBMfMMVk1mB/n91ZZIxJxGYFhtaE10=;
 b=ZcWzd2VISv7VbjUNUOKAd/ScIHUIlD+kat046CfvIzTRNnRvWidoivUQJBI3P2pjEZ
 CX+7iV9lc2HS9oMSqLt+RlZy/vON+VOJlP80aYDi62yiZnqnbfZU+sV082TlH2Ke1dGT
 gWITtMMdjJOOHllC5SmBmxo5X6qF8xdJBoyLTyNAjEgb9ABPnWCtZ7CRyNwI1sQOEEOj
 LDAE8Jgl0CkqG7rSUE7WHa2tiPGyLmMyer7I6eu4DqcYHosmuUrkbXuHOj8+8O9st8O6
 qmzZrGuZ3/VKs4dkrfb1X+PZWK8sqxeb8v9+xmFTTQdnevZt4L6a8bcyHWWtoB7MgbmC
 KWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clemDdlw5AVVfbBMfMMVk1mB/n91ZZIxJxGYFhtaE10=;
 b=mdVAONtdIv0h097WdtU2c1hiSIwJL6BHy6tmHqDDim1vfmi7zzyTkXiu8k6Hg5L7hQ
 id66BfG03SWkrTpYZNsUfAV2BFs2FLOzgL+fgLa/mS3VZrCZEzGq0GpcCJt60zBYOXD9
 HM4mM0t9nFm5lv/h4TvM3wMpGgPdhKa3C9zmHL/VaI/spKvXynWr0s0P7/P2Ra2PpmVC
 QJuWJzM326y5/6zd9rW6QvkFHC/KCeXJWSmQRYJGR2vCfrDN0Uq01tvHhppABzOtUcBD
 80IuUupe05lD+yEMctocz1LZK4fN9wQQU/kmyoWUojBcVh+Kw3OsIkbjMFeH29A9sdZq
 ERlA==
X-Gm-Message-State: AO0yUKVUQ74XrAJlO4ouLFBSF/mZvnVakRl+l+KlW2ig4ZQxf9kPBOnq
 iRtA8xgJtHU7NTccbyEVms0Jhw==
X-Google-Smtp-Source: AK7set8kh2kDzBB4CHJkTz1iDmV3/IKPUx0riwaparu6P77949nYB2XB727Wg3k9aIn+VVypxEti2Q==
X-Received: by 2002:ac2:5d41:0:b0:4de:ca63:b2d2 with SMTP id
 w1-20020ac25d41000000b004deca63b2d2mr2956571lfd.26.1677775204510; 
 Thu, 02 Mar 2023 08:40:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e19-20020ac25473000000b0048a9e899693sm2211229lfn.16.2023.03.02.08.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 08:40:04 -0800 (PST)
Message-ID: <7de00f26-cc93-b549-f66e-8d1f8867f8b7@linaro.org>
Date: Thu, 2 Mar 2023 18:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR
 support
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2023 18:33, Vinod Polimera wrote:
> For the PSR to kick in, self_refresh_aware has to be set.
> Initialize it based on the PSR support for the eDP interface.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

