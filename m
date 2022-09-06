Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4AA5AF559
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB3F10E22A;
	Tue,  6 Sep 2022 20:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A46C10E173;
 Tue,  6 Sep 2022 20:06:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a70so472036edf.10;
 Tue, 06 Sep 2022 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ck2CZ63xlROKRuum+VYM3RwNiQt6GcNFVn5yjUBlhbU=;
 b=ga9QR8QkKm4EnEDibK+a4UuClq5Nes777nVtiyAuRinh0/Ie7mM1tSBVCLqEH1ugiO
 IlouNRGGlGMh8PAy0X4s9054Xim8TCwe/VTCAwjrlTZXNA3deVSy1W+0kPuHUKF5mEwa
 VTWo3H/ib5eNxXgdPa14jDUVTGHJ2tK67OXVAXeaI/dAT1e8V0IliyVBcbFMyNqRUK8J
 Nl9Ll59iDrM4I1zhPVWBkq3EN3RcA+ihfnEWg5akxMCg2CZM9H0H54FiZ+VU7vHQEVyq
 o1TomSxBabXQ1G2qK6IA+bOsodqiGTNWSOoMkVt0Vubj6i/Ya4sZOl9R2Aq5jCViRSCd
 ZuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ck2CZ63xlROKRuum+VYM3RwNiQt6GcNFVn5yjUBlhbU=;
 b=hr3tRtNkjrpztCc/LxaL2A007hkvE5oF411ymyNWlXPsJmnKj37Cef+5xsMiqxodUP
 tTvCh0Y6oDpuUiTWNfF1BWvTrGIpUkefwrpNYREScYiqBii+ZztdbJ6knAgBMuZ9jv/K
 yt24N/6KeND76rTukE3tprV/xcglMRbpd2cQQNUZ5Kk2ApUwmp/XUJLT4DpbV+sm5iuE
 9SnuYCpWzybC/r1+Cm3Pj3OYT4zAf5+6EQmsbjH5udKvLR4hlW7iwpbZ0L8HtsPhN+ql
 jyiIVG3QqmPggybGYAd3cDnFLx9+yU5RhzIXFIygn4iU55fkgP5JpBNfr5/dnZPuWSuW
 utIQ==
X-Gm-Message-State: ACgBeo02rxhxuxHbYJw4ms/XlAasiMLQpCfBJPsDGzrbi/vLzdeqKPYG
 bwwP/MtCXbeWVDlfQUN2hlo=
X-Google-Smtp-Source: AA6agR7CUAhPy+9MFPuH6DzgDy2S60+/E2h57c49ihYMLFNyPbmAh/8ehJuHA/jwsSZISEkVJfO+GA==
X-Received: by 2002:aa7:d803:0:b0:44e:af34:e47e with SMTP id
 v3-20020aa7d803000000b0044eaf34e47emr233791edq.310.1662494773089; 
 Tue, 06 Sep 2022 13:06:13 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 wl23-20020a170907311700b0073d645e6dd8sm7123443ejb.223.2022.09.06.13.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:06:12 -0700 (PDT)
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
Subject: Re: [PATCH v2 37/41] drm/sun4i: tv: Remove useless function
Date: Tue, 06 Sep 2022 22:06:10 +0200
Message-ID: <1903427.PYKUYFuaPT@kista>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-37-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-37-459522d653a7@cerno.tech>
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

Dne ponedeljek, 29. avgust 2022 ob 15:11:51 CEST je Maxime Ripard napisal(a):
> The drm_connector_to_sun4i_tv() function isn't used anywhere in the driver,
> so let's remove it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


