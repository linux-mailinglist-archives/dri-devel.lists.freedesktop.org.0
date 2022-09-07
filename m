Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822205B0811
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 17:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D4A10E7A7;
	Wed,  7 Sep 2022 15:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF4010E7A7;
 Wed,  7 Sep 2022 15:09:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u9so31109874ejy.5;
 Wed, 07 Sep 2022 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=q+70v53buIxQaWBchIFk8shCKU1WJV1DdLwWTP+ddeI=;
 b=PsSk7c5ChVk3DJTul0PslXYL3Ii3rxu7S+9k3ZdWO7J5+Rg3SJKW/GHR+l1IdCcqbD
 QzOSg+X20xKhDWwzVNp1EVZBeuM2og/eiCkM9VRatVBVuKtFUtC1IFd6TnphWbjqABrV
 lPI8ekc2MCGq7SaNBqXRHV/YntEXs/I2px8KM7Uiih87ZHZU+6OWWEzoS4qPY0Dysev9
 Kf1PW1ximX/Nir+q+GFzRH9fkY+Yz9NccxBJ97dIkXFYKX6Fbwdx2rSEm5fgP9TwN8TP
 Yn0/K6m8BPkKDGCZQYLjYFkzq7AqD2/EwCvermdk+S+d7m7gCF9XDJd4z+oxXRFK59CM
 CsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=q+70v53buIxQaWBchIFk8shCKU1WJV1DdLwWTP+ddeI=;
 b=I/kCHXxfRBGEPyaz5IeFZPqXIoVuZYzsc6rXxxYpKvS7iQFjap2j0JuBePDa0EZMe8
 m67qRwnG4VEeU/iLQy/y5+kBZiXWCNIAk17IvdUswIKqmC7viihFqSlaolJ1oK0kg088
 oItWZ470qiq9brjOjLIPb+zlTqCOZaVuxnwYEcoPKrA4qyZFxHgBxl8ZCgyJ8hIgTJpM
 iR/3Mv9ZglaEo48QG4O4YDKHmTjscqxkO0cTPnpslojDX29wtvcRHtUWkJz5XWl6YHAq
 yt0Z7AEo0XZqJ/Z8jCvfdz3fpaVp9ie71BOUdveXZJJ7qoyCiUE/BMt5Bipc1gy4tjXa
 u6XQ==
X-Gm-Message-State: ACgBeo0THWwmEqoLcSHQeca4+EZ0iFkk3vNIW0eipxxU3glmWslvBNu3
 brNgFhsrUL6t/E90Vg5mTLI=
X-Google-Smtp-Source: AA6agR7+yo4NVJ1b3xBSrgRyiVKs02kmJQtjtA3mve9GOkmdtQU6KrWKBuLTC8Uj3eslmjookwi2Eg==
X-Received: by 2002:a17:907:7d8e:b0:742:8ea0:686c with SMTP id
 oz14-20020a1709077d8e00b007428ea0686cmr2603244ejc.591.1662563347199; 
 Wed, 07 Sep 2022 08:09:07 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 p23-20020a056402501700b0043ba7df7a42sm10858179eda.26.2022.09.07.08.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 08:09:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: Re: [PATCH v2 36/41] drm/sun4i: tv: Merge mode_set into
 atomic_enable
Date: Wed, 07 Sep 2022 17:09:04 +0200
Message-ID: <4210281.ejJDZkT8p0@kista>
In-Reply-To: <20220907074134.36yysxrnnpty4ngw@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <10138422.nUPlyArG6x@kista> <20220907074134.36yysxrnnpty4ngw@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 07. september 2022 ob 09:41:34 CEST je Maxime Ripard napisal(a):
> On Tue, Sep 06, 2022 at 10:04:32PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 29. avgust 2022 ob 15:11:50 CEST je Maxime Ripard=20
napisal(a):
> > > Our mode_set implementation can be merged into our atomic_enable
> > > implementation to simplify things, so let's do this.
> >=20
> > Are you sure this is a good thing in long term? What if user wants to
> > change mode? Unlikely, but why not.
>=20
> It doesn't change anything feature-wise: whenever the mode is changed on
> the CRTC, the encoder is going to be disabled and enabled.
>=20
> It's disabled here:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic=
_he
> lper.c#L1064
>=20
> And enabled here:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic=
_he
> lper.c#L1403
>=20
> With drm_atomic_crtc_needs_modeset() being defined here:
> https://elixir.bootlin.com/linux/latest/source/include/drm/drm_atomic.h#L=
104
> 9

Right.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


