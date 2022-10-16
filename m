Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965C600286
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 19:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA79310E8D0;
	Sun, 16 Oct 2022 17:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C5D10E837;
 Sun, 16 Oct 2022 17:51:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id m23so11539899lji.2;
 Sun, 16 Oct 2022 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FSvBiCYAFX6lPPhtdeLD4dtO79D7my2I84dZLy/XCHA=;
 b=ay7zBp6erCUcdx6FCqT2TK/HFdYqQN5L/xbUe1GlX5+3Crva5NM/VI5goKhyYCSDr/
 C3a2cTjgiv2cwV9Jf5grm1XNi83lynnESdVLS/CAJWiYr4Kx+nAA8S7JVhdymP9samaF
 FxNpKzY+0hk83mw8X6eEOgPij9413yyZzcoRk1QpY0HS+li7n0fwtJe5SYxhABuK/CSB
 5IchUWAz7SI+rV2710qacP4Zc4axHL432f76uZ0OERw0Zls5PqGWfywzmDCIO8Wod2Cm
 KMzbrnuvXRvglZ1oOjabABd/gR6IRbHjcHXuE5WxxNzxwMZ5ymInbJi7k2FNnw63GuOC
 2jAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSvBiCYAFX6lPPhtdeLD4dtO79D7my2I84dZLy/XCHA=;
 b=Pbw7u5qMc4p4Qe4KWM5DUZ1LxhKd+ZTnlbCRD7aoLTHg63W3m86jKOCI1Uy9Dg5V9z
 9ng8ByaH1UmxbUKJhWVRTIMsXASDrrb3QkVRbuBolqUlx6+KHqXCCqG3dWj0M5WC/Ajv
 /42X0JJdGnjkXMd8zaT25ItokceCJLV6VRYfxZckvVG4797c2v1ZYunIsEkXYJ5z+ZPY
 dnMu+O271/Q4uCb8yWUEKLDZnCWFvdTiPo6AflaAsttwH+X9dmT25HpJQ5MdBwIsdqXw
 5nCnju621wPDCYF++VHyEk18LuXR9Fp1ej3P6jyXUX0T3IynWqtTn2C8JejOrRufNltg
 yBlA==
X-Gm-Message-State: ACrzQf3VU1xLkZmPaZhwoUk9Nw1EG3Sdmv/vObAjmvO5dv0WqWtx55Pl
 ypkgfUcz8lNXpfqrxT+AnEY=
X-Google-Smtp-Source: AMsMyM5LYmnlAPf1vl21rN/RrRZ7Perh4kso+zSaAUOKAYAg23YrPXCFUqcYyrDs9LnLqQm4wTNUeA==
X-Received: by 2002:a2e:a7cc:0:b0:26f:cb7a:f375 with SMTP id
 x12-20020a2ea7cc000000b0026fcb7af375mr2869772ljp.392.1665942712788; 
 Sun, 16 Oct 2022 10:51:52 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0?
 ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
 by smtp.googlemail.com with ESMTPSA id
 i4-20020a2ea364000000b0026dfedff58csm1205644ljn.99.2022.10.16.10.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 10:51:52 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <fdeadf0d-8f38-8edf-ae92-e2d9c5aa90b4@gmail.com>
Date: Sun, 16 Oct 2022 19:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 13/22] drm/modes: Introduce the tv_mode property as a
 command-line option
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-13-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-13-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime, Noralf & everyone,

I'd like to address Noralf here in particular, and refer to these discussions
from the past:

- https://lore.kernel.org/linux-arm-kernel/2f607c7d-6da1-c8df-1c02-8dd344a92343@gmail.com/
- https://lore.kernel.org/linux-arm-kernel/9e76a508-f469-a54d-ecd7-b5868ca99af4@tronnes.org/

> @@ -2230,20 +2256,22 @@ struct drm_named_mode {
>  	unsigned int xres;
>  	unsigned int yres;
>  	unsigned int flags;
> +	unsigned int tv_mode;
>  };

I saw that you (Noralf) opposed my suggestion about the DRM_MODE_TV_MODE_NONE
enum value in enum drm drm_connector_tv_mode. I get your argumentation, and I'm
not gonna argue, but I still don't like the fact that struct drm_named_mode now
includes a field that is only relevant for analog TV modes, has no "none" value,
and yet the type is supposed to be generic enough to be usable for other types
of outputs as well.

It's true that it can just be ignored (as Maxime mentioned in his response to
my e-mail linked above), and now the value of 0 corresponds to
DRM_MODE_TV_MODE_NTSC, which is a rather sane default, but it still feels messy
to me.

I'm not gonna force my opinion here, but I wanted to bring your attention to
this issue, maybe you have some other solution in mind for this problem. Or if
you don't see that as a problem at all, that's fine, too.

Best regards,
Mateusz Kwiatkowski

