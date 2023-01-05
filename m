Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119ED65EAAE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF1F10E6FF;
	Thu,  5 Jan 2023 12:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D11210E702
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:31:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id cf42so54802950lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oIFqJ2FUub3KBG2R5dCykiETjNtSxdajFNxKC1jZqWM=;
 b=kAN8oyePsPoUHtkrmxcy9IcLC5UnpjIIvcquPhkZoCUbA9T1IYV6Div3yuGVjfbMZU
 44xU7l8pE3pFMHfb+N3Hq9KUlnGzrpGQhC9RlSzuCJSv+26GOoQ594Ba/W0IuU0tfKuv
 wo42ISHQjzIbbUZoaXnB1Xb03WcNAqIwqycJnVsenBRlgXULm7wZl6tsgrKvMwKNByiY
 qnzp1/zkUv1nkzWmcAc5tUbXpMTL1GlyuEmoo4ECvU+h0yctKpmG1l4YOHlJQYtUe9eA
 abu4MetJBupouhtU/qV/DIYHkd07wFt5yb0cJWa4V1ysjozHAddLjBQ5FeafC1bLWjEM
 Q5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oIFqJ2FUub3KBG2R5dCykiETjNtSxdajFNxKC1jZqWM=;
 b=rFVc/cbGjSstOqvPLab/mqDAj/xwO7Yw++Jn8+bojer4ID76awSM4YS99W4V+J/V3R
 h02aQ/VKeiCsZsK8yPDp6wZcZBJnFuviS8ZVxhj6BQO7NDKXDHf/5rDYAnm7pPbcG03v
 IbYiQmN/DigtPhASldlDDAidpMpZTlhgoCaViZBZeQgyS7QetUQavmHduVjUVKNyXx4a
 +q38NZ7ai8sepYZn5e3iEJue1J1DCRJ+WRsKqX7alMRbK/Uq384gcxNy/GBDJBLDBc/M
 66RKESynBqLzxjomOamgW2+ZUTx2py4fJ5/PnV8B4DktOsmA7jNvWgvI1M78Q9hlsJLi
 SFkQ==
X-Gm-Message-State: AFqh2kqUiN2UU8bGjIib6m9Hp9K6ZZY1jZXc5IPwb6g23OtsynIJ/wcL
 FyHdF8uEhi0zT581Z93VH4O7/Q==
X-Google-Smtp-Source: AMrXdXs1Ic63PTBM7olfEHl8M8WpZbHuxq/8HDfCGzBrF4O5dxEmZvRBQOxx6bkwpIsT35uxwKQrxg==
X-Received: by 2002:ac2:58e1:0:b0:4b5:4606:7ad9 with SMTP id
 v1-20020ac258e1000000b004b546067ad9mr14544367lfo.39.1672921904371; 
 Thu, 05 Jan 2023 04:31:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a056512130300b004cb10601096sm3471695lfu.136.2023.01.05.04.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 04:31:43 -0800 (PST)
Message-ID: <64c66b81-b347-f659-1038-c104eb5c5468@linaro.org>
Date: Thu, 5 Jan 2023 14:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-GB
To: neil.armstrong@linaro.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <362452c5-8858-9ac5-e0ca-8ff993e966b7@linaro.org>
 <baa8df6b-ecd4-6df8-9fb5-6a3a39e1a04f@ideasonboard.com>
 <37e48125-072d-e55d-d997-67fd3796a779@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37e48125-072d-e55d-d997-67fd3796a779@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 11:05, Neil Armstrong wrote:
> On 04/01/2023 08:29, Tomi Valkeinen wrote:
>> On 28/12/2022 23:58, Dmitry Baryshkov wrote:
>>> On 02/11/2022 20:06, Dmitry Baryshkov wrote:
>>>>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
>>>> DRM driver do a proper work of calling
>>>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>>>> teaching each and every driver how to properly handle
>>>> drm_bridge_connector's HPD, make that automatic.
>>>>
>>>> Add two additional drm_connector helper funcs: enable_hpd() and
>>>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>>>> is the time where the drm_bridge_connector's functions are called by 
>>>> the
>>>> drivers too).
>>>
>>> Since we are at the beginning of the development window, gracious 
>>> ping for this patchset.
>>>
>>> It would be nice to finally handle the bridge_connector's hpd 
>>> properly. Calling drm_bridge_connector_enable_hpd() from 
>>> drm_bridge_connector_init() is not a proper way to do this. It 
>>> results in calling bridge->funcs->hpd_enable() before the rest of the 
>>> pipeline was set up properly.
>>
>> For the series:
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> I've been using this series in my local branch for quite a while to 
>> fix the HPD issues. Works for me.

Thanks!

>>
>> I still think the "fix" aspect should be highlighted more here, as the 
>> current upstream triggers a WARN for "Hot plug detection already 
>> enabled" (at least) on OMAP.
> 
> LGTM then !
> 
> Tomi, Dmitry, I can push the whole serie via drm-misc-next or -fixes 
> then, as you wish.


I'm fine either way. We have been living with the warning for some time, 
so I don't think there is any urgency to get rid of it immediately.

-- 
With best wishes
Dmitry

