Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C588B799
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 03:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4E10E0D6;
	Tue, 26 Mar 2024 02:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=g.clemson.edu header.i=@g.clemson.edu header.b="2Xn5Jm6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A053A10E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 02:47:59 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-609fc742044so53721017b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=g.clemson.edu; s=google; t=1711421278; x=1712026078;
 darn=lists.freedesktop.org; 
 h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=W3RHnlDNM7ucEGSanjOfjX8tJ7kAUHNm5z9LD1vv6sw=;
 b=2Xn5Jm6+Unmrouu0Dy6RhRbFABv6caPCCwFCEDrk5sSCO+jQ3tLL1EOu4S/gIDlMCJ
 lG20kysFU+aMFqqiuiur2lOwwDAPYeIsBG9YCnRDj4WBDia3Gc8LQUez/EkhG2Zp7zOj
 I76jA80NuLAkR0YzwUhUztv++r4t91PNsOGLzqm6dYR+ueui8QNXOmnl4OFj0Sa1cV0N
 RDmFM0cm6ypx1+UriRzHq1bTdqzM4j2cb4EzLu66UriZ/LBQPfMKMyFn31etjb+oYVtn
 EZuo0kK+k6cIst8OZLGcExrVBZOQYiSG+nSX2qZA0h4sjmxcTpZNyFp/vBZj+4WFiSKz
 ha3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711421278; x=1712026078;
 h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W3RHnlDNM7ucEGSanjOfjX8tJ7kAUHNm5z9LD1vv6sw=;
 b=ersfkwg2cAmfOelZdq5PpsOeNIYWK41RrvC+L4Q0k5NWJqoItQsEHadV9FDyJzpYe6
 eYr3dcbpC6uTENYW6qKxD8I9n8HEJbqKMyr0a9v2skTeeAJF82X5rFPpnRDKB6B1xFQ+
 Vfqta+0G1L9qAMpDauKKw1UQzfAbuTgevoZO6kY/iLpG/e3hnJVq0EWSam3nZuK+T0Vl
 IvyHU8j464en8mIiziFvFGTkgP8hnZA1eVobH08G+mjFZazLGIVYATr2/HIc6rDKLsJE
 UpjudTYzsBcLKLSbcN/vwrJHxNktKu+aAKDMSrRNui3HuerYi+NKoFASFDRAZytSTcO1
 Xi2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3dsWpu3KXoJbuEVAo1zv6Ln0dp8dR9DpT2RqtU9TBfsLiJVlcByj9RI5v1vpWVd4c1MoS5IDwQ/VfJxHhfmoGND6VLh5ocFVwqi5CeGX3
X-Gm-Message-State: AOJu0YyIlUt3WuxVGNN9952jLsgPs1o9UzyjK6Cpa4BPbwhUq9Tmslvh
 +YhNqECobGF4wcw3cin7LspxQxPgRzEzRu+wa9wXeVbqfWoeJzgPZDLuYTPbEw==
X-Google-Smtp-Source: AGHT+IEFw+0DGYfsMzH16oQHyl0akzJkCQqjhfDyRjjebopXltPsY+q3DZqxvdFXzN0+oTtyPvxLZA==
X-Received: by 2002:a0d:cc16:0:b0:610:f5db:697f with SMTP id
 o22-20020a0dcc16000000b00610f5db697fmr8826026ywd.11.1711421278201; 
 Mon, 25 Mar 2024 19:47:58 -0700 (PDT)
Received: from mephi-laptop.localnet (130-127-40-81.lever.resnet.clemson.edu.
 [130.127.40.81]) by smtp.gmail.com with ESMTPSA id
 i189-20020a0df8c6000000b00610ba2e251dsm1285688ywf.119.2024.03.25.19.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 19:47:57 -0700 (PDT)
From: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
To: Doug Anderson <dianders@chromium.org>,
 Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/panel: Remove redundant checks in multiple panels
Date: Mon, 25 Mar 2024 22:47:57 -0400
Message-ID: <3454518.e9J7NaK4W3@mephi-laptop>
In-Reply-To: <CAD=FV=X8N0g0P1d85P0nJHHSkb9xZ-hxJATYD2+b_nNrwqfsUg@mail.gmail.com>
References: <12472820.O9o76ZdvQC@mephi-laptop>
 <CAD=FV=X8N0g0P1d85P0nJHHSkb9xZ-hxJATYD2+b_nNrwqfsUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3807596.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
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

--nextPart3807596.aeNJFYEL58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
Date: Mon, 25 Mar 2024 22:47:30 -0400
Message-ID: <3454518.e9J7NaK4W3@mephi-laptop>
MIME-Version: 1.0

Hi, I'd like to first thank you for your time and for looking at my patch.

On Monday, March 25, 2024 8:21:20=E2=80=AFPM EDT Doug Anderson wrote:
> Aside from the formatting issues (several lines start with an extra
> "-" and there is the PGP stuff), there are a few high-level issues
> here:
Yeah so sorry about the PGP stuff. Didn't realize my mail client did
inline until after it sent. Whoops.=20

> For instance, look at the first panel here
> ("panel-boe-himax8279d.c"). The panel_shutdown() function in that
> driver _directly_ calls boe_panel_disable() and boe_panel_unprepare()
> rather than calling the drm_panel equivalent function. That means that
> they _won't_ get the benefit of the checking I added to drm_panel.c.
Yeah I didn't notice that. Sorry, I am very new to kernel development.

> 2. As much as possible, not only should you be removing the checks,
> but you should also be removing all the code that tracks the state of
> prepared/enabled in the panel drivers and then removing the "prepared"
> / "enabled" members from the structs. If the panel driver needs to
> track prepared/enabled for something else, you might need to keep it
> though. One example would be sony-acx565akm, as per my previous
> attempt [1].
I see, yeah I noticed some of these panels also checked for prepared/
enabled in other functions that don't have to do with preparing/enabling
them so those would probs be some that would have to keep the check or
would need more thorough refactoring. =20

> In general, maybe a good approach would be to actually start with
> patches #5 - #9 in my previous series [2] but instead of calling
> drm_panel_helper_shutdown() just do:
>  drm_panel_disable(...);
>  drm_panel_unprepare(...);
Alright I will look into that.=20

> Feel free to take my patches, change them, and post them. If you want,
> you could add a Co-Developed-by (see submitting-patches.rst).
Thanks I will start with that then.=20

> Leaving the drm_panel_disable() / drm_panel_unprepare() in the panel
> driver shutdown/remove code is not an ideal long term solution, but it
> at least moves us on the right path and at least lets us get rid of
> most of the prepared / enabled tracking. IMO that should be landable,
> though perhaps others would have different opinions.
>=20
> After doing all that, then you could submit patches that simply get
> rid of the drm_panel_disable() / drm_panel_unprepare() for any panel
> drivers if you know that those panels are only used by DRM drivers
> that properly call the DRM shutdown code. See my series that tried to
> add that to a bunch of DRM drivers [3]. Not everything landed, but
> quite a bit of it did. As Maxime and I talked about [4] that _should_
> be as simple as tracking down the panel's compatible string, seeing
> which device trees use it, and then seeing if the associated DRM
> driver is properly shutting things down.
Alright I'll keep this in mind.=20

> Finally, after you've removed the calls to drm_panel_disable() /
> drm_panel_unprepare() from the majority of the panel drivers then you
> could go forward with your patch #2 where you change this to a WARN().
> Personally, I'd be a little hesitant to land that change, though,
> until at least panel-simple and panel-edp got rid of the calls since
> that would add WARN for A LOT of people. Unfortunately, those two
> panels drivers are also among the hardest to validate since they're
> used with nearly all DRM drivers out there. However, IMO even if we
> aren't ready to convert to a full WARN all the rest of the stuff I've
> talked about here is worth doing.
Yeah, that makes sense. I can see how making it a full WARN would result
in a bunch of bug reports and wasted time with the current state of the
panels.=20

> Hopefully that's not too overwhelming.
We'll see. I'll see what I can do. Thanks again for all this usefull info.
Hopefully, I'll have a draft of a more complete patch soon.

Thanks,
EMR
--nextPart3807596.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTcaZbABwnECYA0cZI0LAN3EqikFgUCZgI3QgAKCRA0LAN3Eqik
FhXFAP4o225efxCCysV0GZmUPS2Q6rfuH4B+TKszU8o3WpKvaAD+J/qOGqAeIs4J
u0DgW5XLyj22Jwyb79TZ9WR9SYLfZwg=
=8iip
-----END PGP SIGNATURE-----

--nextPart3807596.aeNJFYEL58--



