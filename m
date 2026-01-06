Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBCDCF8433
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 13:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E2010E1E0;
	Tue,  6 Jan 2026 12:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pobox.com header.i=@pobox.com header.b="YSD09Kel";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="cwuQEl+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 578 seconds by postgrey-1.36 at gabe;
 Tue, 06 Jan 2026 12:16:08 UTC
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270310E1E0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 12:16:08 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 829E61D0013A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 07:06:29 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-01.internal (MEProxy); Tue, 06 Jan 2026 07:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1767701189; x=1767787589; bh=5PdhtH8RHhPbBHcFZ3zrkUFPIcmBFLIX
 mhaWLAMZYcc=; b=YSD09KelGtAzsGWvwFiwVmIo7mRWBhUNRymNAIdYBbLvQOVU
 heRcEtFkdcvluGmL7debdaicWVBatVTUSXcOhdhHClCF1tIfgxFbEz5la+Va9QXj
 grqPZjLRsOnzR5gFqnzBQZ93yT6pYl6G4wB/2Rsze13A7Bo/3c9pKylYrhFdB5uh
 tuHS2TGxby8Z5f1MX1h/nM9AtnYgNyL88bZRKYn9E091+F6EiWaqUJokwxQsFgg5
 Dw5QvNrYl/O2iiZJEmwcKLlOe84iw7usFk7i2B7eHUiJoNL/QgbyOF58+e3xKNz0
 nPNe23p/97zazD46DqNV0Z2Y7R7M0D22v3mvAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767701189; x=
 1767787589; bh=5PdhtH8RHhPbBHcFZ3zrkUFPIcmBFLIXmhaWLAMZYcc=; b=c
 wuQEl+6dGJF6i2nq0V9qaH7itTTT0NDAyKT37mTDvATn10lL9+0DDj6xfMnUJbUX
 68oksVBmjIjiiEbD3NWeHr0VFlyyWzdJJMjgec2wmXoVZoAeyvksP4IlXyhdPFts
 vVNJVEqj++zAXIMYJJcL7Qk5i9QjN4qoY7nPrlh2pIpPR9OreXDoRI0dSp+p5Szw
 W2TRHFmKrpjtfMErRkG3uqs899K9jyOghWDv1ZAx5rhQycU3GeUK+C703HFmNG93
 ZSM3DMq9sbsqZJNhCxEtzFuT5H9m+czj+fRvVgGSW/DWv0ybtgbkIhqKiwaC1tRQ
 02FGzAcYvnLiQtDyZsSgw==
X-ME-Sender: <xms:xfpcaYFNmQv-Qsmi9_F9ruQEKHV3-vNeiiiTS-GYCQPELs97cGPVFA>
 <xme:xfpcaYT6c6PZIoI6hqA4lNO5iR-OnyU1RGDXKlVGPm4fkl43hoV6A5AJQDhMiVEvA
 AYOEmDAEHUXNK1uQyg71_p8_H4pC9LlNtMWhHUr2BiKp6XBFLDVgRg>
X-ME-Received: <xmr:xfpcaXytRrGn3Nw8twMnsY1YlCCFNYpHIzzfHz4EFxp9vj_5pd3RTbHXhld_K4GnygylBTO2YFEBEEkVtQxRkP8Zd8jojDgKgVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtudegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpegghfffkffuvfgtsegrtderredttdejne
 cuhfhrohhmpefqlhhivhhivghrucfirghlihgsvghrthcuoehgrghlihgsvghrthesphho
 sghogidrtghomheqnecuggftrfgrthhtvghrnhephfeuheefteevueetieejieejkeffff
 ffleeigfduhefhieefheevhffghfdvgeeknecuffhomhgrihhnpehgihhthhhusgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrg
 hlihgsvghrthesphhosghogidrtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvug
 gvshhkthhophdrohhrgh
X-ME-Proxy: <xmx:xfpcafPGutmWhzMrxSq0NTbU1lBNtiWg1xFBZxsCOm_xRSJh_HS-YA>
 <xmx:xfpcaeP8bUZ-ullIkbNt-Vs7qc18ftWujQ6pmkEmDG8lUD1Mh-paqw>
 <xmx:xfpcaZSL94qk8-QZ5qCzrRANaSEgQD9OK-KZ1NSvax5e46fv5c7Pzg>
 <xmx:xfpcaYBvPKZ-dTO_z8QJkW0wHhkSeXoPKQZNuv2PSmfxcwOyUI9DsQ>
 <xmx:xfpcaRdNIGMuZawih5vGtRuDJweeJFP0_xSp2hRkMdA7tfPek8-24ZGK>
Feedback-ID: i28e94971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 07:06:28 -0500 (EST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b7cee045187so159133766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 04:06:28 -0800 (PST)
X-Gm-Message-State: AOJu0YyPRdg8o48hMCDwTEO5unzEDrI9m5PcEtyFgS2QG7tsRQzDinG2
 zds8FSS1xnbs0mQbBlhZL2So20FdHUgP8MfZO+5gyJfie/bnVN+liao+LBquRMjb6MEcJM4732N
 d9Srb6kpoEyCm0t+6IDxyuPxJHDNR1B0=
X-Google-Smtp-Source: AGHT+IGww9WxgKuJvmSbXSqGJJs16sh/BDEx0iygAVnmWhpaiKGxksyJmVOtkqkIyXwmnU2g2gphtOjbNoHfDLrrvIs=
X-Received: by 2002:a17:907:3f1b:b0:b83:3295:15d2 with SMTP id
 a640c23a62f3a-b84299bdd0dmr266525266b.30.1767701188130; Tue, 06 Jan 2026
 04:06:28 -0800 (PST)
MIME-Version: 1.0
From: Olivier Galibert <galibert@pobox.com>
Date: Tue, 6 Jan 2026 13:06:16 +0100
X-Gmail-Original-Message-ID: <CAMFK0gsNg05ipEcXgNAfVrnx_na5mSDv7=8SFEbO0jEsq+aVfw@mail.gmail.com>
X-Gm-Features: AQt7F2rSZgL74wfHSgx1oVE0aiDw7Xena2eahyLYir-nBzHjEfK3YsTAKVqjDPM
Message-ID: <CAMFK0gsNg05ipEcXgNAfVrnx_na5mSDv7=8SFEbO0jEsq+aVfw@mail.gmail.com>
Subject: TTM vs. GEM
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000633ce40647b70131"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000633ce40647b70131
Content-Type: text/plain; charset="UTF-8"

  Hi,

I hope it's not a controversial topic.  There is a contradiction between
the documentation (drm-mm.rst specifically) and what seems to be the
reality of the code.  The documentation says that GEM is UMA only, but it
seems that essentially every device in drm/* implements some sort of GEM
support (and only a handful still use TTM?) , drm_gem_vram_helper.c seems
to be about non-UMA, and the nice kms-vulkan example (
https://github.com/nyorain/kms-vulkan) seems to be GEM-only and works
nicely with a very-non-UMA 2080.

So what's the reality at this point?  Is it just that the introduction of
the documentation needs to be updated?  Is TTM to be considered legacy and
avoided?  Or are there things I'm missing that are important?

Best regards,

  OG.

--000000000000633ce40647b70131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0 Hi,</div><div><br></div><div>I hope it&#39;s n=
ot a controversial topic.=C2=A0 There is a contradiction between the docume=
ntation (drm-mm.rst specifically) and what seems to be the reality of the c=
ode.=C2=A0 The documentation says that GEM is UMA only, but it seems that e=
ssentially every device in drm/* implements some sort of GEM support (and o=
nly a handful still use TTM?) ,=C2=A0drm_gem_vram_helper.c seems to be abou=
t non-UMA, and the nice kms-vulkan example (<a href=3D"https://github.com/n=
yorain/kms-vulkan">https://github.com/nyorain/kms-vulkan</a>) seems to be G=
EM-only and works nicely with a very-non-UMA 2080.</div><div><br></div><div=
>So what&#39;s the reality at this point?=C2=A0 Is it just that the introdu=
ction of the documentation needs to be updated?=C2=A0 Is TTM to be consider=
ed legacy and avoided?=C2=A0 Or are there things I&#39;m missing that are i=
mportant?</div><div><br></div><div>Best regards,</div><div><br></div><div>=
=C2=A0 OG.</div><div><br></div></div>

--000000000000633ce40647b70131--
