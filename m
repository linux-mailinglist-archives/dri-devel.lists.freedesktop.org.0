Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F026279E865
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB110E010;
	Wed, 13 Sep 2023 12:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE5810E010
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:55:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50098cc8967so10948427e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694609709; x=1695214509; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FBLmprqMznqvsNo4BlY3BI8teGbJT5a4oyp31xLgPZc=;
 b=gD69fXqwELrRmuJtOelD6XdBcZkjCB1vIuAaqxclk/Bl5a0dHLdd/MvRw2dyYxk+Cn
 vzp3u8EJzPihTmwQVDFHjcX4Xj8Rsb/xsEzW+s0N1/B8RIUU+RFvF2KY9MCfMSk2J3QK
 U32jfS7aoztSaz+FOvZ4u44IYlzJCjuJJbtLLyY3vGmh+uOkpAQt5xNsWmHOt0V7OacE
 tRfnKar6dex448gDgDZyjhg8qC+lBRdKFcIvpfavzv5vlEtyQRY+VyQrz3R0dsdu1M3x
 7Kdyvx3a7zucXT3I8DkMgmdiPuwSk6QzeeDudXATSC05NT5ULv2z7g8lXuX4DTz65ElS
 m56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694609709; x=1695214509;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FBLmprqMznqvsNo4BlY3BI8teGbJT5a4oyp31xLgPZc=;
 b=KNPFcoufnkR6D40Kd3hXPJ0orAnOrYMOj30aKye4nZ7pgZP2+uCfLaFEZPztZjScjv
 FMi4rFLlVDNKyphZZWv1oDMuHbDcl0VAinGFq+1aqHjuqSHdg8Tk3noXP8tqto+5U2XO
 YH306HQcgYNWN3ub96tPgDUTGup9vX9azkAr4X8VzovMl77HgrpxUEnOx+U4y68LV4Vz
 /cuW6lddiTHTIAh42C9u96vjG/PzL4aNFajOkjOiJsBP2qgZ4U5XX0ct2DABM7IHZHCf
 pQKVYbs6SANF3M6ls7MgJ89UMPwSs2yZgCROirxS4UBhTgKNfbDbknX3rz1JCp+2CxP6
 VKcQ==
X-Gm-Message-State: AOJu0Yxo+jJmSSJQ5GAgvAgw+eAVYd31xlwa1eZOFqhh1nESoEVI7kGK
 cUWNlipMLtDb1S1Tiw39NsR0Rg==
X-Google-Smtp-Source: AGHT+IEg2jjdFCghXpK0VKM5rNLUqnXfSFdE9B4y6LBztGWV/ddOAMCFxBCTTvTQ53MRyH3o0P6YKQ==
X-Received: by 2002:a05:6512:3f15:b0:500:bffa:5b85 with SMTP id
 y21-20020a0565123f1500b00500bffa5b85mr2378368lfa.32.1694609709518; 
 Wed, 13 Sep 2023 05:55:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r21-20020ac252b5000000b00501be736dc8sm2138848lfm.300.2023.09.13.05.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 05:55:08 -0700 (PDT)
Message-ID: <e16ebefd-2014-4089-baad-6c0d09813144@linaro.org>
Date: Wed, 13 Sep 2023 15:55:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] drm/bridge_connector: implement OOB HPD handling
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20230824235636.1436665-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230824235636.1436665-1-dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2023 02:56, Dmitry Baryshkov wrote:
> Note, numbering for this series starts from v5, since there were several
> revisions for this patchset under a different series title ([1]).
> 
> USB altmodes code would send OOB notifications to the drm_connector
> specified in the device tree. However as the MSM DP driver uses
> drm_bridge_connector, there is no way to receive these event directly.
> Implement a bridge between oob_hotplug_event and drm_bridge's
> hpd_notify.
> 
> Merge strategy: since this series touches i915 code, it might make sense
> to merge all three patches through drm-intel.

Dear drm-misc and drm-intel maintainers. Since the merge window has 
ended and the trees are fully open for the patches, I'd like to massage 
this patch series. We have R-B on all three patches. Heikki has acked 
the first patch, so it seems to be fine from the i915 point of view.

Is it fine to be merged via drm-misc? Would you like to pick it up into 
drm-intel?


> 
> [1] https://patchwork.freedesktop.org/series/103449/
> 
> Changes since v6:
> - Rebased on top of linux-next. Fixed the freshly added
>    new drm_connector_oob_hotplug_event() call.
> 
> Changes since v5:
> - Fixed checkpatch warning in the first patch (noted by intel-gfx CI).
> 
> Changes since v4:
> - Picked up the patchset
> - Dropped msm-specific patches
> - Changed drm_bridge_connector_oob_hotplug_event to call connector's HPD
>    callback directly, rather than going through the last bridge's
>    hpd_notify
> - Added proper fwnode for the drm_bridge_connector
> 
> Bjorn Andersson (1):
>    drm: Add HPD state to drm_connector_oob_hotplug_event()
> 
> Dmitry Baryshkov (2):
>    drm/bridge_connector: stop filtering events in
>      drm_bridge_connector_hpd_cb()
>    drm/bridge_connector: implement oob_hotplug_event
> 
>   drivers/gpu/drm/drm_bridge_connector.c        | 34 ++++++++++++++-----
>   drivers/gpu/drm/drm_connector.c               |  6 ++--
>   .../gpu/drm/i915/display/intel_display_core.h |  3 ++
>   drivers/gpu/drm/i915/display/intel_dp.c       | 17 ++++++++--
>   drivers/usb/typec/altmodes/displayport.c      | 17 +++++-----
>   include/drm/drm_connector.h                   |  6 ++--
>   6 files changed, 60 insertions(+), 23 deletions(-)
> 

-- 
With best wishes
Dmitry

