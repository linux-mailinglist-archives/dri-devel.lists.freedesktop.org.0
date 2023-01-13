Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3716691F2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A2810E36A;
	Fri, 13 Jan 2023 08:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592F410E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:57:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g13so32183574lfv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ysmHHp/43jCoR62RWa7j7U0fIOfTEzPcP5KkwYW03+Y=;
 b=JSQ9xgftTgc+3wChXekfPAhq633giaFDfteRLlk662EuogEM1yyTybzvAs6JUU/+yC
 eNIF1kkjxwXwhNvUW/gsqLNtNK05X+jWily8sQ+HYu5OdZY7ixMtw1gB1pc4/qvzC3Wn
 VTy6p3Zh3kRQf38km99+OrYx/mu5/hsETlOXWDbJYYKMY2EbE/aOns8YPUtulVjbu17G
 mw/qbhx8aj7KehXUPGMZVTgpsMkg5E3g8714UEE29BALMQ3joIu+r/y5Bx9eknQdZtku
 nnwCirFJ46KtEfZDpGTS7InzMD02NBOk2969DPioKPJE4hZAFbYT8z1JeBb2XQlw934g
 YSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ysmHHp/43jCoR62RWa7j7U0fIOfTEzPcP5KkwYW03+Y=;
 b=qqHkALU+X83YWfsjaxjwhPhFr4sOisgi6a5otTN8KSThbszIzmeMwmfGrGG0iLlTh4
 NB2Me5n51r0onROLwBGUr3Fr4mIbpMgF7v+n3b9XF0dvFPFaQbdawTVI3zMc1VmBOfID
 igYao6Etadu+xr5RdUZCy6UoxgwaGZv85aJA5Fd/YVrRtFP8hWPY/rki5MowxH4hMyCq
 J5jd/ckfKFGEP53yAuva0Hcr74Ne4NVAE+V3XMqgVaJEc6jleOZPbrCFSc0rxBh9Zlw6
 R29n29/nQGupocph9tVeFdpgcRBhTZ+nlJrPoF0gjRSNefJFil6paxh4a0j0ftDn6Byb
 OPNQ==
X-Gm-Message-State: AFqh2kqszntaapzjAZG4Cywxg//fDVvDs9D7Auxn555Pde79ynToSnmZ
 0fVESfB0Iko4Xt0/nAcXdvrQfA==
X-Google-Smtp-Source: AMrXdXtBlsg3TCrCR6Yu2JIdPZC5uS8fWSZfkc3geFs8erjGiBE3AGQjYSZ0FPjxIX17l3lKzpd9tQ==
X-Received: by 2002:a05:6512:368a:b0:4b5:b90a:829d with SMTP id
 d10-20020a056512368a00b004b5b90a829dmr19917438lfs.66.1673600241703; 
 Fri, 13 Jan 2023 00:57:21 -0800 (PST)
Received: from [192.168.2.31] ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 br11-20020a056512400b00b0048a934168c0sm3758739lfb.35.2023.01.13.00.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:57:21 -0800 (PST)
Message-ID: <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
Date: Fri, 13 Jan 2023 10:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Johan Hovold <johan@kernel.org>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
In-Reply-To: <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2023 06:23, Dmitry Baryshkov wrote:
> On 13/01/2023 06:10, Bjorn Andersson wrote:
>> Invoking drm_bridge_hpd_notify() on a drm_bridge with a HPD-enabled
>> bridge_connector ends up in drm_bridge_connector_hpd_cb() calling
>> drm_kms_helper_hotplug_event(), which assumes that the associated
>> drm_device's mode_config.funcs is a valid pointer.
>>
>> But in the MSM DisplayPort driver the HPD enablement happens at bind
>> time and mode_config.funcs is initialized late in msm_drm_init(). This
>> means that there's a window for hot plug events to dereference a NULL
>> mode_config.funcs.
>>
>> Move the assignment of mode_config.funcs before the bind, to avoid this
>> scenario.
> 
> Cam we make DP driver not to report HPD events until the enable_hpd() 
> was called? I think this is what was fixed by your internal_hpd patchset.

Or to express this in another words: I thought that internal_hpd already 
deferred enabling hpd event reporting till the time when we need it, 
didn't it?


-- 
With best wishes
Dmitry

