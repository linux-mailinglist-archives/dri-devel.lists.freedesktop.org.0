Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230471F5AF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 00:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404910E5EA;
	Thu,  1 Jun 2023 22:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CA310E5EB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 22:11:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f4e71a09a7so1874254e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 15:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685657468; x=1688249468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cUjU1QLapAN+UOQb7bMW7gqVswYS7FmmwKe3gGeC7nU=;
 b=NzQu6xWyAFPvysWLbKbjyISj5llZOGjpXFor0IW7wWZYGGutpqSrbRPegCB1UNXbj1
 +Cfo6V6omcyq+wguGbUPSpbmATrIfifLQFztqwQ6zwKuyhp7cYRUceC5BzwBguLzGOG4
 HMh/jBDMKhW7pSVQGRt6iviF3gkVXhuU0fwbSdeSKwt4bDV3R3xrdccEGuie2JFzOwjX
 UYt7JQ3Sw4Wi5FObT3oob6cNsgLye6KZePYWne+7CYZBM+Dw10aZSZSKH5V3xxj2XjZ6
 UOQWGJxst7qfSD7cqJ8yHghKi1KL3dCUrtnmzAhC7eud1LJx/flZqmDAaNHsI/Jwb6FJ
 99Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685657468; x=1688249468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUjU1QLapAN+UOQb7bMW7gqVswYS7FmmwKe3gGeC7nU=;
 b=OHfGtnE5jhwokRSfjQcbY6CDV6OW2MD6DuquHm/5qJQv7+HF+5Ap3NlljgWg+aOJb2
 yAsDkOroTyjMEwyz0o20EfKlaO8CFO3fRVFzBQNPbnU+Keh1HWbETE8/QIJDiwoLkEIb
 ycK3cXR+xS8exDlVSuJQd1H7YeNkvRy+llXyZF6M5bry69K4/p8ufZZVrHiH20tLFrfA
 epot+Q6g2kgODH52kRldHb0jVul0OCMXgDSAYfLdUUzgoNMiTwkyLGaisI5GaasYX8K7
 mb6iK2rifJnarexZ3N+paLEiNnRH+LdBoN5oB5HDXuRolg7wvWPH1/sTQIynjA+ry+6D
 j26Q==
X-Gm-Message-State: AC+VfDwnyBCMH4vYrmcr+Ny9LteKUVE099P1MsPhTv6HncUdwzYUiGbH
 1LvbyLJnh/KAl9D9M66huNyj9Q==
X-Google-Smtp-Source: ACHHUZ4Z1RCAMlDskOyhcoYf/TmzLDNh/sz5WfMVyoGVLrhlKAvsxKhMJilmOZ4JHXoYcwc2vHQpug==
X-Received: by 2002:ac2:560c:0:b0:4f0:13e3:a291 with SMTP id
 v12-20020ac2560c000000b004f013e3a291mr319581lfd.28.1685657467880; 
 Thu, 01 Jun 2023 15:11:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e2-20020ac25462000000b004f38e55ae79sm1205559lfn.278.2023.06.01.15.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 15:11:07 -0700 (PDT)
Message-ID: <22853a86-b327-60db-3c47-cbb2e407c10e@linaro.org>
Date: Fri, 2 Jun 2023 01:11:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] retrieve DSI DSC through DRM bridge
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2023 01:08, Kuogee Hsieh wrote:
> move retrieving DSC from setup_display to atomic_check() and delete struct drm_dsc_config
> from struct msm_display_info.

This is obvious from the patches themselves. You should be describing 
_why_ the changes are necessary, not what is changed.


What was changed between v1 and v2?

> 
> Kuogee Hsieh (2):
>    drm/msm/dpu: retrieve DSI DSC struct at atomic_check()
>    drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 --
>   3 files changed, 13 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

