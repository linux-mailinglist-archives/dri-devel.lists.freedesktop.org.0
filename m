Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE725AF53D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F9610EA78;
	Tue,  6 Sep 2022 20:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E8710EA7E;
 Tue,  6 Sep 2022 20:03:03 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 29so11530534edv.2;
 Tue, 06 Sep 2022 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=F6ib7HMkD8OZCaZPl3GcVqEvWmm4ctxdEGHR+aqIKVc=;
 b=ArRU4YWH8hE+2Z1UVe6QOKE5hPjwCYDsbvdE1/PUCWN56FAMQZ/4zqvMIxfOOB2keG
 VETEDtrmessAghGKMzFBp8CyQVDdAQqU4x+gj9gaRUZoj5nIhCcQp0TbKqYFac2p/l7c
 s8E+JhqrISyguo1blQmfoTPAnbUnCSoWPxO87AW5Jnu7jG9ZsEG2SFveoy3yVuaEmC/j
 AJGJVNakAM7s7v3qVwNh9qCbZDvWMeFX5CX+Yh1J7gk3RyIO+elUjPVl8TzAtf+ajC+9
 gJrzytdJaqd/ImlOWyICFY6pKT6Gkrs3MV9zjaV5uubNzgLGsQ1rDLq1Oj3ES5Fk9n3N
 yT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F6ib7HMkD8OZCaZPl3GcVqEvWmm4ctxdEGHR+aqIKVc=;
 b=8QL+g4PCMSfc6OyB3qBxs5pxN0YGjrt9tW8kDkAenlLX8B4H+5GtcK+dpP0AYP+0cM
 GlkNCO85K0dKqOMn4pzVcewZ8CCNSQtThiYz0VrZOjoGpYzrNe/FspGU0dkSyKk85HaG
 MXIluqfZHphwwz+PWrlVjsefCtFzrlHfgs9Oy9+Z8K4cDT4WpZGM6GcsVrY7FRZ1ZOqe
 cLMF8R7UHATmfQnCSN36sO22I3OJtUCwb69iry2JS68UzUn8HuVU6G8qxZBO8S8fAgKN
 SxG2I/P2XGcJFNPZWBzrfzvIz1juMKGTSKOot30nlyZRhwTJPVpTQPB8EQJ6e30I/7jp
 sHtg==
X-Gm-Message-State: ACgBeo3aK0bwEziimuFhATsBNHeaKqB/CLPTZ3d2DG4dOH17tZMNUSsC
 xsUz6hOuSUNkfSHBpzrdxao=
X-Google-Smtp-Source: AA6agR5gwvJ8nN16z0kDOnfFe8gSYaFolah5D1v/bfxdS5M65ePk383S/fOmy1b3my8s0GvcbJd5jQ==
X-Received: by 2002:a05:6402:2499:b0:440:942a:40c2 with SMTP id
 q25-20020a056402249900b00440942a40c2mr225612eda.37.1662494582166; 
 Tue, 06 Sep 2022 13:03:02 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b006fee7b5dff2sm7207555ejg.143.2022.09.06.13.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:03:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 35/41] drm/sun4i: tv: Convert to atomic hooks
Date: Tue, 06 Sep 2022 22:02:59 +0200
Message-ID: <3192228.44csPzL39Z@kista>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 29. avgust 2022 ob 15:11:49 CEST je Maxime Ripard napisal(a):
> The sun4i TV driver still uses legacy enable and disable hook
> implementation. Let's convert to the atomic variants.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

BTW, I suggest you merge fixes/cleanups, no need to drag them in this super 
long series.

Best regards,
Jernej


