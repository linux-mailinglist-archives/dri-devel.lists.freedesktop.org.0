Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09809B1B2CA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 13:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3041C10E267;
	Tue,  5 Aug 2025 11:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Re7CAhx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301F610E267
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 11:51:22 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4dfa2aeec86so4353466137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754394681; x=1754999481; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yIELNjFT4Fu0p36VR+VRRXixCVsWV6Jkn6kfP5ffsxA=;
 b=Re7CAhx99X6re6yPffzVwfQzK+dySXdSGCKdhMstO5dXLHdEVjb1Dc0uoiL47mV+0+
 M0AUy7wJIBYoCM6qVwAn9qxY051dCHJkLpI/NSK6rchoP3jF/PTak2VXAIsttTELhkdj
 yC1hnJMme+lRjMJwT14XNeqEyeJRRWyqdYFaKMrkHgvuApydLnTFXJ7H28rEqt619+6y
 kSy2KV/30PPr2ZnXpwVANPk6xODP1TUNHBGiZLYI/wZ2QIRM2k+mhzQEWqMR9VM8RQlX
 rjiIJ14S+gZc7nGnDlMXfM/Blz9+e9Jtj5rXGFSLFfNs4dHlkbecXxgcNKLWIh0YGMdN
 amLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754394681; x=1754999481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yIELNjFT4Fu0p36VR+VRRXixCVsWV6Jkn6kfP5ffsxA=;
 b=Cd2lshKt/qe8HrF9bqZndnbB9o2Z66KUdvmKth8RPas9/z3/GHc5rFWfTCrFUut8g6
 U0A1aARApv2T2LqLrhWU2dxofByn6xxZRb4SFyVlp4refQMc/earS3qQ1t3KesFjAAUe
 S1p1gFyTm6YqcHqRKquivcJQKg1EWe+AOVXNYdQL/VDep48n962E4o9weqT/em+XeVEw
 kX+mVp43D35Y/EQxiE9WprXsLQzW1JYVOZ9Ov1ew1VssKWM9Yh/TaWlPEHXp2E1L8Jma
 Xo80yrRbglcHtm+nWuZpXIhzoeg+GcOraazo4K+8qHcurKQtmhZyfpKQnk602aiOGSND
 3APw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnhQmmjD3uPJgQJHJ/zSdo6OumbM+5ZncDc1xZ8FJMSpccwIVHTWM2rMAitRzGdfDu5/8RstWdQxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygA0Mz37rXiW+FFC8RHd6zEQhtNHzKPUQ/y5Lf/yasdWnZHWNu
 9nP9sgZUzQyd4JqYc6xPdbALarIGmIvq9E2iQw47G9ivOoMKa+X9RJIPV2e6OLd8LVLhbNXcbZA
 kp5TG6CnbzEOOG4Jle5RexcwAozcJSGY=
X-Gm-Gg: ASbGnctuHLXy16oM33vIye65ET2RZIjw7MBlfFRKA5gYf5o4ZhxDFdzYKttsWYofBLd
 j1TRpqq/HRTb5g9qpROndHUj70TKAANZZp3NvIlyePPK8ZU0ovP+FLHgguwwAAfWycTLSNA0Wdd
 dDPbKGQ+JvWA2WQHhhwNdVddW10brTir7qMLGGpZb8asXO01HF+Rk7MDbihYsiSHfdplhJACqa2
 qK5
X-Google-Smtp-Source: AGHT+IGA/IFYP5vuaO/pw+M2tTlOYQcCJhDEbEjVaelagQI0l7hPSUE5qmYk5hqSKt0B8+vTPUz92k+4aqhntjLXtu4=
X-Received: by 2002:a05:6102:4427:b0:4e9:b8bf:17f8 with SMTP id
 ada2fe7eead31-4fdc4314a2dmr5253651137.21.1754394681061; Tue, 05 Aug 2025
 04:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250804212902.22554-1-rampxxxx@gmail.com>
 <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
In-Reply-To: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
From: Giant Sand Fans <rampxxxx@gmail.com>
Date: Tue, 5 Aug 2025 13:51:08 +0200
X-Gm-Features: Ac12FXwwnTuPdK-cdR2z1YzgSbAkDdUJZ-WCNaMI_ZPxhmwMi_HYOpaqfjMofJM
Message-ID: <CABPJ0vjfHxsznE-2+Y0m2DL+f0ni+ZfiQyHxonHxfbA2NHpqpg@mail.gmail.com>
Subject: Re: [PATCH] drm: Add directive to format code in comment
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000c2b595063b9cd70f"
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

--000000000000c2b595063b9cd70f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 5 ago 2025, 12:49, Dmitry Baryshkov <
dmitry.baryshkov@oss.qualcomm.com> escribi=C3=B3:

> On Mon, Aug 04, 2025 at 11:29:02PM +0200, Javier Garcia wrote:
> > Fixes the warnings:
> >
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without
> a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends
> without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends
> without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends
> without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends
> without a blank line; unexpected unindent.
> >   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends
> without a blank line; unexpected unindent.
> >
> > Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Fixes tag?
>

Sorry, what do you mean?

>
> --
> With best wishes
> Dmitry
>

--000000000000c2b595063b9cd70f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div>El mar, 5 ago 2025, 12:49, Dmitry Baryshkov &lt=
;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">dmitry.baryshkov@oss.=
qualcomm.com</a>&gt; escribi=C3=B3:</div><div class=3D"gmail_quote gmail_qu=
ote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Mon, Aug 04, 2025 at 11:29=
:02PM +0200, Javier Garcia wrote:<br>
&gt; Fixes the warnings:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected in=
dentation.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote e=
nds without a blank line; unexpected unindent.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition li=
st ends without a blank line; unexpected unindent.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition li=
st ends without a blank line; unexpected unindent.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected in=
dentation.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition li=
st ends without a blank line; unexpected unindent.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition li=
st ends without a blank line; unexpected unindent.<br>
&gt;=C2=A0 =C2=A0Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition li=
st ends without a blank line; unexpected unindent.<br>
&gt; <br>
&gt; Signed-off-by: Javier Garcia &lt;<a href=3D"mailto:rampxxxx@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">rampxxxx@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_gpuvm.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
<br>
Reviewed-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qu=
alcomm.com" target=3D"_blank" rel=3D"noreferrer">dmitry.baryshkov@oss.qualc=
omm.com</a>&gt;<br>
<br>
Fixes tag?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sorry, what do you mean?</div><div dir=3D"auto"><div class=3D"gma=
il_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div></div></div>

--000000000000c2b595063b9cd70f--
