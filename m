Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056A5B4C5F
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 08:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5B810E206;
	Sun, 11 Sep 2022 06:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B251D10EC99;
 Fri,  9 Sep 2022 15:49:34 +0000 (UTC)
Received: from 82-65-29-218.subs.proxad.net (unknown
 [IPv6:2a01:e0a:5ef:1450:250:fcff:fe42:7bed])
 by smtp5-g21.free.fr (Postfix) with ESMTP id 0279C5FFD8;
 Fri,  9 Sep 2022 17:49:26 +0200 (CEST)
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
 by 82-65-29-218.subs.proxad.net (Postfix) with ESMTP id 94269A527;
 Fri,  9 Sep 2022 17:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
 t=1662738566; bh=KAUFs8Gddcy6mYnYueQePctsnpjY/cWYwMOTf14lGE0=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=K+185GNFdnN324begdB4IiWbweBPfej2xuzvN336Wb5nkV61eUf3qdaqHUyNRsN3o
 ax2eaJNZkM1axPcFuxge0+fTTb/EZndSPSHppeYn6WSoMFQAS7zwytmSyeedRuGrq0
 roOLfIanXnSaU8/7Wx1EM6306Cqo0m4eR2ok6qPo=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from 82-65-29-218.subs.proxad.net ([127.0.0.1])
 by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 6iVLbpusZ5py; Fri,  9 Sep 2022 17:49:25 +0200 (CEST)
Received: from drive.ap2c.org (imap.ap2c.org [10.8.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by 82-65-29-218.subs.proxad.net (Postfix) with ESMTPSA;
 Fri,  9 Sep 2022 17:49:25 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 09 Sep 2022 15:49:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.16.0
From: "=?utf-8?B?QXVyw6lsaWVu?=" <aurelien.intel@ap2c.com>
Message-ID: <115b5a5ebddcd268ee5f7688400448a2@ap2c.com>
Subject: Re: [Intel-gfx] Developing a new backlight driver for specific
 OLED screen
To: "Jani Nikula" <jani.nikula@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Hans de Goede" <hdegoede@redhat.com>, "Lyude"
 <lyude@redhat.com>, dri-devel@lists.freedesktop.org
In-Reply-To: <878rms7emr.fsf@intel.com>
References: <878rms7emr.fsf@intel.com>
 <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
 <YxsMcH37rRkt0cfj@intel.com>
X-Mailman-Approved-At: Sun, 11 Sep 2022 06:36:37 +0000
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=20

>=20+ dri-devel mailing list that looks more appropriated.
> + Hans and Lyude who were recently working to standardize some of the
> backlight stuff.

Thank you for these contacts. I'll try there if I need.

> I don't believe you want to use the i915 API, but move the common funct=
ions
> to the drm subsystem itself and then reuse as a drm device.

If there is enough generic code I'll do everything with the DRM API. Unfo=
rtunately I can't spend too much time in order to generalize the i915 com=
mon functions.

> Aur=C3=A9lien, are you aware of drivers/gpu/drm/display/drm_dp_helper.c=
 and
> all the functions around struct dp_aux_backlight and struct
> drm_edp_backlight_info?

Not yet. Since I'm not familiar with GPU/display drivers I didn't know wh=
at could be a good starting point.=20
Indeed=20I already checked the intel_dp_aux_backlight.c code. That's why =
I told about using the "i915 API code" at first. But since this display i=
s independent from the GPU i didn't want to link both code.=20
Then=20that's a really good point if there is already an independant API.=
 I'll have a look this evening.

> Does the display use some proprietary, non-VESA DPCD registers? There's
> already some of that in i915 for Intel proprietary interfaces.

For sure. It's an OLED display. Thus there is no backlight. It uses speci=
fic registers to control the brightness of the screen.
Unfortunately I guess the mechanism is not shared with many OLED displays=
...

Thank you for your help.

Aur=C3=A9lien
