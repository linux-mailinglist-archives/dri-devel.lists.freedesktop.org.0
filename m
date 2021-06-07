Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990B39D64C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29C26E4FE;
	Mon,  7 Jun 2021 07:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A46E4A1;
 Mon,  7 Jun 2021 07:48:09 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 32DD95C003F;
 Mon,  7 Jun 2021 03:48:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 03:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=vBtkPcIZrwvMlH7F9lW4sMLdlaj
 mNTMwQPWW2GilFcI=; b=UU4Qv23CynjrdKsoxal3BjH94da6Z1sTmpagxUrV5Op
 wA3W+wHiIQ9X4rtcuh3AbL94P6XCe3NekiY1xO+g3KSqMVvvIASs++nVwIhld9uo
 yfcmUBHWV8CCzs+hIDBfufvytsVImEsZsRCSL56mWyHq1CMmOIUanzU1bpFkTeFb
 K6AqiXE+77I8DAiAb9b4wyPtH+sTi/4t1yl0H041diwKUguq6BUPr+A3YSUVstH0
 qtKkuq8EplV7YZM6eI6zgAh1tEkov3genL8OWPGeEQ1HQYTADMjOO83kPRB6lmdr
 68lv2yfqrkCokUD8Nuhit/PdgrUROQbykpTogjIrslw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vBtkPc
 IZrwvMlH7F9lW4sMLdlajmNTMwQPWW2GilFcI=; b=RVOmv6L8C+/OsJGaVW4FrZ
 Az4dNOcszBLKHGHTgTWXtaVMfnHy7exIIm6+YjG7uc/88eny5+U0m/dJq4NQFodw
 PT6eTTjeESAfXnHOTMXGC8HrBcIwdnBOWhfPvA+cIMQ6pKWM5sISaWLOyJRiKaYo
 Ovmj36pBYfVpr6lfkmat1WCz7XrYVi6M8n+m3TrIyNHEoFEQSGZaOczmAFE4xNmP
 H/0ylZhDpgFjKNTof/F/w2t13piDgxpjMjZ1Nsfs6DXAdG51e3hEoyhfuAiv1P2E
 H3nWjVMfyGcIjBQwma5Kz3ITuSA81STpsc6S2UdYHiN7/GXTq8Q+mO4iEC52J5BQ
 ==
X-ME-Sender: <xms:N8-9YKolrz2u2xwl0tAARfjC6KUhrf21Iyczc-OJUO4khgCnZCVs2w>
 <xme:N8-9YIrhFwzxyF2NCwjqnaY2zjXnQbbfdpjNnfPlkiTEKAzRST1cmCLc2FLYB7eXw
 Km1ROVM6BBr5OHXG3M>
X-ME-Received: <xmr:N8-9YPNbZSlu2bbN_QxfENtfB_D8ju6ZbZWwr7SC5hknFyzndqp-OfhZmXXXR6YtHNj1LypNPfHK_PyKiIrec70lV2L3VfbFI1rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevtdethedtteeuieehfedvleeuveegvddufeefleehfeehudejhfeuteff
 keejleenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdplhhkmhhlrdhorh
 hgpdgsohhothhlihhnrdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrth
 gvtghh
X-ME-Proxy: <xmx:N8-9YJ7kq3O-TS6hs2X5gnVlCI7TAkTvCAGVXRcllqicuMeRjN_ReA>
 <xmx:N8-9YJ4PgrHbBHwpkDJDSDbLHhabdS7VJSBKE9BoI0j02KIF6VQS7g>
 <xmx:N8-9YJg291id-wPs3noJSLtyZdLqaW-mnFRzG__k4ZecaufYzyfYFg>
 <xmx:OM-9YDnXZjTfPJAxOwRycBz3UgaS-OWcP6jGOAVUeuJ18TKKdhUXzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 03:48:06 -0400 (EDT)
Date: Mon, 7 Jun 2021 09:48:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <20210607074805.bmonbg5nhr4etab2@gilmour>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r6l2znqg6rwave7q"
Content-Disposition: inline
In-Reply-To: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r6l2znqg6rwave7q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote:
> Hello,
>=20
> In addition to the existing "max bpc", and "Broadcast RGB/output_csc"
> drm properties I propose 4 new properties: "preferred pixel encoding",
> "active color depth", "active color range", and "active pixel
> encoding"
>=20
>=20
> Motivation:
>=20
> Current monitors have a variety pixel encodings available: RGB, YCbCr
> 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
>=20
> In addition they might be full or limited RGB range and the monitors
> accept different bit depths.
>=20
> Currently the kernel driver for AMD and Intel GPUs automatically
> configure the color settings automatically with little to no influence
> of the user. However there are several real world scenarios where the
> user might disagree with the default chosen by the drivers and wants
> to set his or her own preference.
>=20
> Some examples:
>=20
> 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color
> information, some screens might look better on one than the other
> because of bad internal conversion. The driver currently however has a
> fixed default that is chosen if available (RGB for Intel and YCbCr
> 4:4:4 for AMD). The only way to change this currently is by editing
> and overloading the edid reported by the monitor to the kernel.
>=20
> 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some
> hardware might report that it supports the higher port clock, but
> because of bad shielding on the PC, the cable, or the monitor the
> screen cuts out every few seconds when RGB or YCbCr 4:4:4 encoding is
> used, while YCbCr 4:2:0 might just work fine without changing
> hardware. The drivers currently however always default to the "best
> available" option even if it might be broken.
>=20
> 3. Some screens natively only supporting 8-bit color, simulate 10-Bit
> color by rapidly switching between 2 adjacent colors. They advertise
> themselves to the kernel as 10-bit monitors but the user might not
> like the "fake" 10-bit effect and prefer running at the native 8-bit
> per color.
>=20
> 4. Some screens are falsely classified as full RGB range wile they
> actually use limited RGB range. This results in washed out colors in
> dark and bright scenes. A user override can be helpful to manually fix
> this issue when it occurs.
>=20
> There already exist several requests, discussion, and patches
> regarding the thematic:
>=20
> - https://gitlab.freedesktop.org/drm/amd/-/issues/476
>=20
> - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
>=20
> - https://lkml.org/lkml/2021/5/7/695
>=20
> - https://lkml.org/lkml/2021/5/11/416
>=20
>=20
> Current State:
>=20
> I only know bits about the Intel i915 and AMD amdgpu driver. I don't
> know how other driver handle color management
>=20
> - "max bpc", global setting applied by both i915 (only on dp i think?)
> and amdgpu. Default value is "8". For every resolution + frequency
> combination the highest possible even number between 6 and max_bpc is
> chosen. If the range doesn't contain a valid mode the resolution +
> frequency combination is discarded (but I guess that would be a very
> special edge case, if existent at all, when 6 doesn't work but 10
> would work). Intel HDMI code always checks 8, 12, and 10 and does not
> check the max_bpc setting.
>=20
> - "Broadcast RGB" for i915 and "output_csc" for the old radeon driver
> (not amdgpu), overwrites the kernel chosen color range setting (full
> or limited). If I recall correctly Intel HDMI code defaults to full
> unless this property is set, Intel dp code tries to probe the monitor
> to find out what to use. amdgpu has no corresponding setting (I don't
> know how it's decided there).
>=20
> - RGB pixel encoding can be forced by overloading a Monitors edid with
> one that tells the kernel that only RGB is possible. That doesn't work
> for YCbCr 4:4:4 however because of the edid specification. Forcing
> YCbCr 4:2:0 would theoretically also be possible this way. amdgpu has
> a debugfs switch "force_ycbcr_420" which makes the driver default to
> YCbCr 4:2:0 on all monitors if possible.
>=20
>=20
> Proposed Solution:
>=20
> 1. Add a new uAPI property "preferred pixel encoding", as a per port
>    setting.
>=20
> =A0=A0=A0 - An amdgpu specific implementation was already shared here:
>       https://gitlab.freedesktop.org/drm/amd/-/issues/476
>=20
> =A0=A0=A0 - It also writes back the actually used encoding if the one
>     	requested was not possible, overwriting the requested value in
>     	the process. I think it would be better to have this feedback
>     	channel as a different, read-only property.
>=20
> =A0=A0=A0 - Make this solution vendor agnostic by putting it in the
>     	drm_connector_state struct next do max_bpc
>     	https://elixir.bootlin.com/linux/v5.13-rc1/source/include/drm/drm_co=
nnector.h#L654
>     	and add patches to amdgpu and i915 to respect this setting
>=20
> 2. Convert "Broadcast RGB" to a vendor agnostic setting/replace with a
>    vendor agnostic setting.
>=20
> =A0=A0=A0 - Imho the name is not very fitting, but it pops up in many
>     	tutorials throughout the web (some other opinions? how could a
>     	rename be handled?".
>=20
> =A0=A0=A0 - Also move it from Intel specific structs to the
>       drm_connector_state struct (please let me know if there is a
>       better place)
>=20
> 3. Strive for full implementation of "max bpc"
>=20
> =A0=A0=A0 - I need to double check the Intel HDMI code.
>=20
> 4. Add 3 feedback channels "active color depth", "active color range",
>    and "active pixel encoding" as vendor agnostic settings in the
>    drm_connector_state struct
>=20
> =A0=A0=A0 - Possible values are:
>=20
> =A0=A0=A0 =A0=A0=A0 - unknown, undefined, 6-bit, 8-bit, 9-bit, 10-bit, 11=
-bit,
>     	    12-bit, 14-bit, 16-bit (alternatively: an integer from -1
>     	    (unknown), 0 (undefined) to 16, let me know what would be
>     	    more suitable)
>=20
> =A0=A0=A0 =A0=A0=A0 - unknown, undefined, full, limited
>=20
> =A0=A0=A0 =A0=A0=A0 - unknown, undefined, rgb, ycbcr444, ycbcr422, ycbcr4=
20

I've started to implement this for the raspberrypi some time ago.

https://github.com/raspberrypi/linux/pull/4201

It's basically two properties: a bitmask of the available output pixel
encoding to report both what the display and the controller supports,
and one to actually set what the userspace wants to get enforced (and
that would return the active one when read).

Maxime

--r6l2znqg6rwave7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL3PNQAKCRDj7w1vZxhR
xanoAP4hthuIJEgo/s/RvnQlfOXJOa0+uFW/P3cwx8kLSI5DHwEAhkaA13YaxWWT
7H7SPwY01g1oboQ1706gAT4Oujw8Rw4=
=zzFM
-----END PGP SIGNATURE-----

--r6l2znqg6rwave7q--
