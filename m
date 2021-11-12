Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC244E741
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D846E197;
	Fri, 12 Nov 2021 13:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275F96E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:24:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso6791562wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pvQoleAGM9Zrph+RM13dsCV9NkoY/kMYM5P43VaVlns=;
 b=qaVKsAW0Aq9EIXUGVOdi0/rsBJ+wQM59iVEqQzmRET3Igj3lB4KgSF4gV1PHP/2oil
 0gn+LQAap+LbA3zly0Dz0cBAY7Ea6r0dPr4O6+ryKnwDP2MXTdtNyQUFjnhalEQVYGUb
 Mfum9u0hKUt7/TspQcmZE8SFI3SE6J1AeXuJWPjzLDKCunSDyDTShULfmXf6CdKzXYc5
 eRy2yPr1k+CsvDcr5rgKWSpCrQ6sZ/4nPGyPCOJ7qKf8qUkFZuiYA+mpGw3ZaVLEi42x
 9T6Hncf4kQPbuy6MPRtuEFvNn1TeY5fQyderi57bb7C83Ob6XVnQDrBjfD2aX/kB/rgG
 KQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pvQoleAGM9Zrph+RM13dsCV9NkoY/kMYM5P43VaVlns=;
 b=PqNXY48yGV4ti6F5WwU6zu5Na2tCZA4pcfBqXFbivvFlKQyB8IqYWJG26+r8PI8W7B
 V1UaSn/PweOki0jN9Tu3QJ5rIw5rYUgQjQ/3pRTWLJcAnCgFMKiJP8/Fuz2hJqNl/siG
 bXJAc5SVtkylKD8bGeyqFEZXSt8R6JJcPDtF+Ysj9tg4oZfMrxuQnoJo3xmRwjS/vyru
 ayL/5ODTxFjvN2nlK4I2/keqJQhPXu56somxs6hN5X99XmpAKrkwKnwy2C41ae2MSJjR
 O+e9koNoeLL2ERr4jbJoaJUk73JXWDdXLoWtPkrZzsRbbQysxyRht7e6UyzGuEfU1NJ/
 9YmA==
X-Gm-Message-State: AOAM531PaF+b5dH3S8F/Nkd6PRWCcTJhx8oS3giOwgQGxVA0rXITnW8v
 ISTs35Y2QpKt48j97BQChCa78w==
X-Google-Smtp-Source: ABdhPJypVrEMaaFxG9GsLct4xeTHd0tGCt2OsXltLtPd9pGRzvEezB5JSb8+HTfZRNCYd5lod1o2EQ==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr33442835wmi.107.1636723466539; 
 Fri, 12 Nov 2021 05:24:26 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:15c5:4746:b404:ed78?
 ([2001:861:44c0:66c0:15c5:4746:b404:ed78])
 by smtp.gmail.com with ESMTPSA id h204sm5979057wmh.33.2021.11.12.05.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 05:24:26 -0800 (PST)
Subject: Re: [PATCH v3 0/6] drm/meson: rework encoders to pass
 ATTACH_NO_CONNECTOR
To: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3e0e5a2f-a81b-dcba-e379-4786c4a5de7b@baylibre.com>
Date: Fri, 12 Nov 2021 14:24:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/10/2021 14:39, Neil Armstrong wrote:
> This serie finnally reworks the drm/meson driver by extracting the encoders
> in their own file and moves to bridge-only callbacks.
> 
> This permits passing the ATTACH_NO_CONNECTOR bridge attach flag and finally
> use the CVBS & HDMI display-connector driver.
> 
> This will ease Martin Blumenstingl writing the HDMI transceiver driver for
> the older Meson8/8b SoCs, and sets the proper architecture for the work in
> progress MIPI-DSI support.
> 
> Finally, this serie will path the way to a removal of the device component
> and use the drmm memory management.
> 
> Changes since v2 at [2]:
>  - patch 1: no changes
>  - patch 2: added martin's ack
>  - patch 3: moved ->enable & ->disable to atomic, added sam's & martin's acks
>  - patch 4: added martin's ack
>  - patch 5: added martin's ack
>  - patch 6: moved ->enable & ->disable to atomic, added martin's ack
> 
> Changes since v1 at [1];
>  - patch 1: added sam's review tag, fixed include order, fixed doc wording
>  - patch 2: added sam's ack tag, switched to dev_dbg()
>  - patch 3: moved mode_set to atomic_enable, removed DRM_DEBUG, fixed include order
>  - patch 4: added sam's ack tag & applied to drm-misc-next
>  - patch 5 & 6: added sam's ack tag
>  - patch 7: added sam's review tag, stopped saving connector, moved mode_set to atomic_enable,
>  	added missing atomic state callbacks, fixed include order, switched to dev_dbg/dev_err
> 
> [1] https://lore.kernel.org/r/20211014152606.2289528-1-narmstrong@baylibre.com
> [2] https://lore.kernel.org/r/20211015141107.2430800-1-narmstrong@baylibre.com
> 
> Neil Armstrong (6):
>   drm/bridge: display-connector: implement bus fmts callbacks
>   drm/meson: remove useless recursive components matching
>   drm/meson: split out encoder from meson_dw_hdmi
>   drm/meson: encoder_hdmi: switch to bridge
>     DRM_BRIDGE_ATTACH_NO_CONNECTOR
>   drm/meson: rename venc_cvbs to encoder_cvbs
>   drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR
> 
>  drivers/gpu/drm/bridge/display-connector.c    |  86 ++++
>  drivers/gpu/drm/meson/Kconfig                 |   2 +
>  drivers/gpu/drm/meson/Makefile                |   3 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  71 ++-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c         | 342 +-------------
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c    | 284 +++++++++++
>  ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |   2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 446 ++++++++++++++++++
>  drivers/gpu/drm/meson/meson_encoder_hdmi.h    |  12 +
>  drivers/gpu/drm/meson/meson_venc_cvbs.c       | 293 ------------
>  10 files changed, 881 insertions(+), 660 deletions(-)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
>  rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
>  delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c
> 
> 
> base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
> 

Applied to drm-misc-next

Now https://lore.kernel.org/all/20211029135947.3022875-1-narmstrong@baylibre.com/ has been applied, we should have no regression.

Neil
