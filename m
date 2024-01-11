Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868382B53D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 20:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A5010E963;
	Thu, 11 Jan 2024 19:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35810E926
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:59:30 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd880ceaf2so11187281fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 09:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704995968; x=1705600768; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VkUIDS+5DUxARs/d76r2eCYCpkZW1h0feDuRDsIT1tI=;
 b=inCtgi49omp1SUutZav93M+1625y6FmJrGvT3ofEBKhtO0CVMxtKKJBAZ6WBv9OEUN
 3mg2fuiSfOEAJxH2a4bkOIoiua3ZqOXgot2R/B/dbkB0celUKIBmsuHSCTd7/WsG1OLj
 RAfZMzpYi7JdU0V6jG1tbymozgDQTH6RFZrjcndD4J1T7yxkRFHwtv3iKs+cLwhsdHLA
 Cfs3OJWHbqyVKrjfQ+KoxxGJMPiW9FkNAkFi84yH+cmkT3SC1FcSDsu8HX2KVg/nYmxd
 b1RmX0L/OURL1aufPneAcYTDFQDW/HPwdgEHTfKmfW6rcOC1wurbzU93aGhrlKb+XV/2
 LTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704995968; x=1705600768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VkUIDS+5DUxARs/d76r2eCYCpkZW1h0feDuRDsIT1tI=;
 b=DO+uyjEjcDZXQjDv3pQwzCD8wC6pM6Hz3H0tDWsvQLXt6rUPWVaD+1iKnxOGaQtkeD
 mSr7YvnM+k8Od/gyS5L2riSVCP9gPJWpg6aLYw5C/mVS/lgidU195cZWXZ4eeznr1ufS
 +C1JzP6tIJvETpA52pb9ncpVekoA5BZrCnvMLdqQDCOZd/weR25VEMkZq38sFAY3LQ89
 GW+4OyG4f+RylV7WSgX5xhDcGK4xtqcuA0L/gU/htSsOYYoCtOQvRKA4mCc7IUCvA5r/
 Hg0FEe9Jx+AMBEfvhoYMDBD0BJbnNw9Q1uUTwULvG69nyg+GXJOffZZRfRSF59k/ODyn
 od2A==
X-Gm-Message-State: AOJu0YxgBrJQ91YkVCOfhTp7kyIC+zz6oa2aykxQFAia/VLmvc4zLMEt
 fxr3YrPpwJqQUCrtzBc+n1b4rv2Be4m/iHOkgaM=
X-Google-Smtp-Source: AGHT+IFJce7a+UzDs6IxpVsQobdZyD4b4MK0foTQax74rLun1czX8pDfDD542URkh8yBXlL6wVEskkLntLRKVtmbwZQ=
X-Received: by 2002:ac2:4da3:0:b0:50e:7bf5:5424 with SMTP id
 h3-20020ac24da3000000b0050e7bf55424mr46655lfe.47.1704995968411; Thu, 11 Jan
 2024 09:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20240111165615.27587-1-xaver.hugl@gmail.com>
 <ID9ZgIO-0g8gNMKtaQFJTKRl5uh6UBgKViGwKB8634Pa4d6c8a-EQD4aaTiIbIqkqFiVChj4SLN2Ufs5PEF3F084HHLGn8gK-2-onYXES4g=@emersion.fr>
In-Reply-To: <ID9ZgIO-0g8gNMKtaQFJTKRl5uh6UBgKViGwKB8634Pa4d6c8a-EQD4aaTiIbIqkqFiVChj4SLN2Ufs5PEF3F084HHLGn8gK-2-onYXES4g=@emersion.fr>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 11 Jan 2024 18:59:16 +0100
Message-ID: <CAFZQkGx0jp2KmCaKOwRqORfAUMwwPkdSPfh_dMegXMu0ax2cyA@mail.gmail.com>
Subject: Re: [PATCH] drm: allow IN_FENCE_FD and FB_DAMAGE_CLIPS to be changed
 with async commits
To: Simon Ser <contact@emersion.fr>
Content-Type: multipart/alternative; boundary="0000000000000a69aa060eaf4f29"
X-Mailman-Approved-At: Thu, 11 Jan 2024 19:35:12 +0000
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
Cc: andrealmeid@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000a69aa060eaf4f29
Content-Type: text/plain; charset="UTF-8"

Am Do., 11. Jan. 2024 um 18:13 Uhr schrieb Simon Ser <contact@emersion.fr>:

> Are we sure that all drivers handle these two props properly with async
> page-flips? This is a new codepath not taken by the legacy uAPI.
>
I've only tested on amdgpu so far. Afacs the other drivers that would need
testing / that support atomic and async pageflips are
- i915
- noueveau (though atomic is disabled by default, so maybe it doesn't
matter?)
- vc4
- atmel-hlcdc

The first two I can test, the latter I don't have the hardware for. I don't
know if I can
extensively test fb_damage_clips either / how I'd even know if it's being
applied
correctly, but in the worst case I'd expect the driver to not do the
optimizations the
property allows.

As an alternative to this, would it be okay to expose a driver hook for
optional
driver-specific checks that drm_atomic_set_property can delegate to, and
only
allow this with the properties and hardware that's been tested? Then more
properties (like cursor position changes on amdgpu) could be easily added
later
on too.

--0000000000000a69aa060eaf4f29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div></div></div><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 11. Jan. 2024 um 18:13=C2=
=A0Uhr schrieb Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact=
@emersion.fr</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Are we sure that all drivers handle these two props properly with asy=
nc<br>
page-flips? This is a new codepath not taken by the legacy uAPI.<br></block=
quote><div>I&#39;ve only tested on amdgpu so far. Afacs the other drivers t=
hat would need</div><div>testing / that support atomic and async pageflips =
are</div><div>- i915<div></div><div>- noueveau (though atomic is disabled b=
y default, so maybe it doesn&#39;t matter?)<br></div></div><div>- vc4</div>=
<div>- atmel-hlcdc</div><div><br></div><div>The first two I can test, the l=
atter I don&#39;t have the hardware for. I don&#39;t know if I can</div><di=
v>extensively test fb_damage_clips either / how I&#39;d even know if it&#39=
;s being applied</div><div>correctly, but in the worst case I&#39;d expect =
the driver to not do the optimizations the</div><div>property allows.<br></=
div><div><br></div><div>As an alternative to this, would it be okay to expo=
se a driver hook for optional</div><div>driver-specific checks that drm_ato=
mic_set_property can delegate to, and only</div><div>allow this with the pr=
operties and hardware that&#39;s been tested? Then more</div><div>propertie=
s (like cursor position changes on amdgpu) could be easily added later</div=
><div>on too.</div></div></div>

--0000000000000a69aa060eaf4f29--
