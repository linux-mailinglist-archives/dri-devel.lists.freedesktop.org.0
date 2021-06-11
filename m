Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D823A3C4E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 08:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025B56E4F3;
	Fri, 11 Jun 2021 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCE789F63;
 Fri, 11 Jun 2021 06:53:27 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEC082199B;
 Fri, 11 Jun 2021 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623394405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqNvodPNBORJ6igEE1+hcEdi6I+wirmgwKdhkjS5HmA=;
 b=DlythV2KMcl12l72TixwNio78VbiexuGBJLaVbZqac4QbHhwf6zWzPj+SQhfjRRgfN5nSC
 6SAzduiRaXkcle8TjYnAFH1UD7Z50by+qCIj3hiH7VApihr0d1rfJ4VFx5ML4QjvlCmWzO
 xvuaGv/vS/6KuKGdyH9to6LOsmdVB2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623394405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqNvodPNBORJ6igEE1+hcEdi6I+wirmgwKdhkjS5HmA=;
 b=3mPFfk4NpE4CE1jEP5MioWcs5zJJ5nrNDGDTf8auZzMU5y+yFfbUC6moYKilK3yJ/MP/Gj
 Op1mfpph+2DcptBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A9A5B118DD;
 Fri, 11 Jun 2021 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623394405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqNvodPNBORJ6igEE1+hcEdi6I+wirmgwKdhkjS5HmA=;
 b=DlythV2KMcl12l72TixwNio78VbiexuGBJLaVbZqac4QbHhwf6zWzPj+SQhfjRRgfN5nSC
 6SAzduiRaXkcle8TjYnAFH1UD7Z50by+qCIj3hiH7VApihr0d1rfJ4VFx5ML4QjvlCmWzO
 xvuaGv/vS/6KuKGdyH9to6LOsmdVB2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623394405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqNvodPNBORJ6igEE1+hcEdi6I+wirmgwKdhkjS5HmA=;
 b=3mPFfk4NpE4CE1jEP5MioWcs5zJJ5nrNDGDTf8auZzMU5y+yFfbUC6moYKilK3yJ/MP/Gj
 Op1mfpph+2DcptBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id K/lbKGUIw2B9fwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Jun 2021 06:53:25 +0000
Subject: Re: [PULL] drm-misc-next
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <YMH0ad8qoREx9YZK@linux-uq9g>
 <CAKMK7uEtDw_OTgyTDHH6LhyccqsKWdrbwxQSztJdp=YefGWpeg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <daee547c-718d-e9f0-71e7-cfe14ca6041f@suse.de>
Date: Fri, 11 Jun 2021 08:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEtDw_OTgyTDHH6LhyccqsKWdrbwxQSztJdp=YefGWpeg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="srDKZOr21ymNErwIMOh9zfbluS8dyj5x5"
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
Cc: Sean Paul <sean@poorly.run>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--srDKZOr21ymNErwIMOh9zfbluS8dyj5x5
Content-Type: multipart/mixed; boundary="Mi2hnhDlEidZCgKSR4PYiftGnBwwP2dqY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "DRM maintainer tools announcements, discussion, and development"
 <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Message-ID: <daee547c-718d-e9f0-71e7-cfe14ca6041f@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <YMH0ad8qoREx9YZK@linux-uq9g>
 <CAKMK7uEtDw_OTgyTDHH6LhyccqsKWdrbwxQSztJdp=YefGWpeg@mail.gmail.com>
In-Reply-To: <CAKMK7uEtDw_OTgyTDHH6LhyccqsKWdrbwxQSztJdp=YefGWpeg@mail.gmail.com>

--Mi2hnhDlEidZCgKSR4PYiftGnBwwP2dqY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.06.21 um 15:32 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi Dave and Daniel,
>>
>> here's the second PR for drm-misc-next for this week, and the final on=
e
>> for 5.14. I backmerged drm-next for the TTM changes. As for highlights=

>> nouveau now has eDP backlight support and udmabuf supports huge pages.=

>=20
> Why did you do this backmerge? It's done now so nothing to fix, but
> I'm not really seeing the reason - the backmerge is the last patch
> right before you've done the pull request.

 From what I understood, there was a TTM change (coming from intel-gt)=20
that created significant conflicts between trees. I backmerged to get=20
these changes into drm-misc-next. If the drm-next side was outdated,=20
people shouldn't have to make patches against it.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>> drm-misc-next-2021-06-10:
>> drm-misc-next for 5.14:
>>
>> UAPI Changes:
>>
>> Cross-subsystem Changes:
>>
>>   * dma-buf: Support huge pages in udmabuf
>>
>> Core Changes:
>>
>>   * Backmerge of drm/drm-next
>>
>>   * drm/dp: Import eDP backlight code from i915
>>
>> Driver Changes:
>>
>>   * drm/bridge: TI SN65DSI83: Fix sparse warnings
>>
>>   * drm/i915: Cleanup eDP backlight code before moving it into helper
>>
>>   * drm/nouveau: Support DPCD backlights; Fix GEM init for internal BO=
s
>> The following changes since commit c707b73f0cfb1acc94a20389aecde65e638=
5349b:
>>
>>    Merge tag 'amd-drm-next-5.14-2021-06-09' of https://gitlab.freedesk=
top.org/agd5f/linux into drm-next (2021-06-10 13:47:13 +1000)
>>
>> are available in the Git repository at:
>>
>>    git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-=
06-10
>>
>> for you to fetch changes up to 86441fa29e57940eeb00f35fefb1853c1fbe67b=
b:
>>
>>    Merge drm/drm-next into drm-misc-next (2021-06-10 12:18:54 +0200)
>>
>> ----------------------------------------------------------------
>> drm-misc-next for 5.14:
>>
>> UAPI Changes:
>>
>> Cross-subsystem Changes:
>>
>>   * dma-buf: Support huge pages in udmabuf
>>
>> Core Changes:
>>
>>   * Backmerge of drm/drm-next
>>
>>   * drm/dp: Import eDP backlight code from i915
>>
>> Driver Changes:
>>
>>   * drm/bridge: TI SN65DSI83: Fix sparse warnings
>>
>>   * drm/i915: Cleanup eDP backlight code before moving it into helper
>>
>>   * drm/nouveau: Support DPCD backlights; Fix GEM init for internal BO=
s
>>
>> ----------------------------------------------------------------
>> Christian K=C3=B6nig (1):
>>        drm/nouveau: init the base GEM fields for internal BOs
>>
>> Lyude Paul (9):
>>        drm/i915/dpcd_bl: Remove redundant AUX backlight frequency calc=
ulations
>>        drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values co=
rrectly
>>        drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() =
a bit
>>        drm/i915/dpcd_bl: Cache some backlight capabilities in intel_pa=
nel.backlight
>>        drm/i915/dpcd_bl: Move VESA backlight enabling code closer toge=
ther
>>        drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we=
 can't read PWMGEN_BIT_COUNT
>>        drm/i915/dpcd_bl: Print return codes for VESA backlight failure=
s
>>        drm/dp: Extract i915's eDP backlight code into DRM helpers
>>        drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nou=
veau
>>
>> Marek Vasut (1):
>>        drm/bridge: ti-sn65dsi83: Fix sparse warnings
>>
>> Thomas Zimmermann (1):
>>        Merge drm/drm-next into drm-misc-next
>>
>> Vivek Kasireddy (1):
>>        udmabuf: Add support for mapping hugepages (v4)
>>
>>   drivers/dma-buf/udmabuf.c                          |  50 ++-
>>   drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  21 +-
>>   drivers/gpu/drm/drm_dp_helper.c                    | 347 +++++++++++=
++++++++++
>>   drivers/gpu/drm/i915/display/intel_display_types.h |   2 +-
>>   .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 329 +++--------=
--------
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c            |  28 ++
>>   drivers/gpu/drm/nouveau/nouveau_backlight.c        | 166 +++++++++-
>>   drivers/gpu/drm/nouveau/nouveau_bo.c               |   6 +
>>   drivers/gpu/drm/nouveau/nouveau_connector.h        |   9 +-
>>   drivers/gpu/drm/nouveau/nouveau_encoder.h          |   1 +
>>   include/drm/drm_dp_helper.h                        |  48 +++
>>   11 files changed, 682 insertions(+), 325 deletions(-)
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Mi2hnhDlEidZCgKSR4PYiftGnBwwP2dqY--

--srDKZOr21ymNErwIMOh9zfbluS8dyj5x5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDDCGUFAwAAAAAACgkQlh/E3EQov+A2
2xAAseXY1rgIP4ApDSLHkS0zx6k4BP+x/2/mNdeJJmsTaDkZUsupieWAgueEgUCGqfJyyyZGRBgq
fq/dL/D28cH1zkLL8NVh++pn+T8JzIsq6gkumwwxu5y7wimBLjO/9gW0bkhPyzyxmt9y+bCbjx6n
eUuGHrGTZ/GQVngMntzCvEWCh+TkNOGbrn3uf7tfikjlOoLrk2B/kZboz3gdWwbM5no7e6vx9F/y
rtkcpMJFguS7Gr9p59uhlUNsoC02S26LCxQPf7hQFHTQ6caLIpVrdE5UYvxw+kdFuJ9QXFk2DWuD
+7Mldxtnit/NuD5K/VgYw3V7B5LCi29DCEeuoMO+nciq28JWEnFdxcluUIyTZBVyJq8xAv6WMHm2
zJDOtkApALW+x8GJ7Vkjbj3/4Vmdp4dE4nf+QLu2DWsS6wk/20wSHKddfZzZHwWUKVKWdFHlRTpL
qayHpT6RUryL59Q6Nb8sTGVLiyKN7hlx/zt2k4K+L7Tmm+ymBiLospTxtIAnjvFDISyUKZTP0sJh
ZX0eJRkhAk5naLFVo9e9WTzASjOCJSep2KlEDjo8E6J2AaywZFaGfQAdgOVM7fnh4xfpohtFum8W
wHgDEggsUwL0imcIkcG4p4rzL2ktjAOo1I/ap1pUqqhRZ7uCZL9kZAaqHwUnvpZ7VGsISYkpk4/u
znk=
=lyF1
-----END PGP SIGNATURE-----

--srDKZOr21ymNErwIMOh9zfbluS8dyj5x5--
