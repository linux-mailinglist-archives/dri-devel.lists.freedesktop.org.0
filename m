Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB7A18E61
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E68810E303;
	Wed, 22 Jan 2025 09:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3MtEEOBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F334310E303
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:31:13 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso10058655a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 01:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737538212; x=1738143012;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dkmmUhMKpRoyMmBceYoqw6kv4FrN51LZ6eFb08/QUE4=;
 b=3MtEEOBe30f/v6+l1hddpKKcXAJMqP3OfBchDpPYPxilZluTUSmrzqbvv2+sgVdrse
 86cVpWFArQjx3dsPanlk92Xt7YEj6POj1MYwj1R+bMF+qkK2n7LHeZpozDOTn2uXhKnL
 F+4xU//A0o8CYIXUuMWT7YBfuEwmMorUG1IKN3HHX2GBbBNI1r7NhiCoqadGM+LKKd4y
 27y19heDd7yBpequKppP3tdU3SPSMn52N4rmtUT+rI5k0scdjKkgeCxiwXoZVYbxozHq
 HLuoP+bTXLS8jOLnK8b5c5JFfAznWCQKHlfoD230MCWqlxnPg+gkeJrk7q5X8kWz9Z75
 4E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737538212; x=1738143012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dkmmUhMKpRoyMmBceYoqw6kv4FrN51LZ6eFb08/QUE4=;
 b=SdP1dgKGwMhejm7vM1h4fxe+SFr2R9H8aam4W5NA1sUqkGyt6D88iLQwfwqtKgcn/M
 f7BsbPmT4yDBiqfA4yyavkCWasulAmm9n//GDCv4bJPE1GPpKLU54jlSvm9VD1NSEIe4
 47GXhdFeBJZSUtAnGpdmvArMYzLUPRZqlsk/M/xFf689LKTHwkm2XYwwL/sS0zc3tMZF
 Tfd1K2TKrRKb3zgUxbIRLVFnzPRlfqHDd6IHcoqDbYAXvOJfWCtsHMbURIZbC9plLgMv
 iMTOZ5fZ7KE7t6eOZ0YtNqczlUECx+x0YOMjTJuSoPR078q5HsIQ52qBiyvvN/ZlC2rW
 z+KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2gJ0PJvRLO3pDcWqutsq7f7KNupOfWdfdm1C/NbjZTOvQ0jSrAHW/xMCPGiaBk7H4jVYHfllUt5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtDIpXetg2gdu2djr9GmMODkT1JFP7oPMHVgo6ivKAfA/o8vKE
 KTMNr1XxgpgltJ86JSLedW8ykzNCQJfTp/vrK+9YKBxkxow8fL2QElLZoatKO62dnN7LChzPCqZ
 GHQKouAcDTZC5zTIne5MGntC8ckK5yiWS769P4w==
X-Gm-Gg: ASbGncuhnzenKd1bu/hQQaLB24LEjQxDoMWoWRgsrko+CHGRXW6BQvRMyn6+vT/glAs
 pqvJXt4NtMsGdSeUxgd8u3d2LKXM1+crBvel45rxkGVW/tSX0zrGO
X-Google-Smtp-Source: AGHT+IGcK+HVjsRq+mVi+Uu+OtPcHXqjVSfGScWMYMzIq4BtbnbhsQrfxEGut41NK8LD0iwmdZNcV84kFlnCNYm5XFo=
X-Received: by 2002:a17:906:79a:b0:ab3:a0ad:17a9 with SMTP id
 a640c23a62f3a-ab3a0ad203cmr1345275566b.24.1737538212276; Wed, 22 Jan 2025
 01:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Wed, 22 Jan 2025 17:30:00 +0800
X-Gm-Features: AbW1kva5kPvJRUjCnjsmKQjaQcEYCqMvJiOipT9YsXbDoQ8BkhlXPFiiU_okV8Y
Message-ID: <CA++9cvo18fMuaf+iPeXgMA2_+QMJ3YCAY1=odG31NKO3s5Vt4Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Resend and include all necessary To entries
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Doug Anderson <dianders@chromium.org>
Cc: Xinxiong Xu <xuxinxiong@huaqin.corp-partner.google.com>
Content-Type: multipart/alternative; boundary="000000000000ed57a4062c4823cc"
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

--000000000000ed57a4062c4823cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,
Can you spare some time to help review it? Thanks a lot.

On Fri, Jan 17, 2025 at 5:14=E2=80=AFPM Langyan Ye <
yelangyan@huaqin.corp-partner.google.com> wrote:

> Fix the workflow of the previous email and resend it with all necessary
> recipient entries
>
> Changes in v3:
> - Link to v2:
> https://lore.kernel.org/all/20250117050410.933312-1-yelangyan@huaqin.corp=
-partner.google.com/
>
> Changes in v2:
> - PATCH 1/4: Add compatible for KINGDISPLAY KD110N11-51IE
> - PATCH 2/4: Add compatible for STARRY 2082109QFH040022-50E
> - Link to v1:
> https://lore.kernel.org/all/20250116130530.3010117-1-yelangyan@huaqin.cor=
p-partner.google.com/
>
> Langyan Ye (4):
>   dt-bindings: display: panel: Add compatible for KINGDISPLAY
>     KD110N11-51IE
>   dt-bindings: display: panel: Add compatible for STARRY
>     2082109QFH040022-50E
>   drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
>     MIPI-DSI panel
>   drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
>     MIPI-DSI panel
>
>  .../display/panel/boe,tv101wum-nl6.yaml       |   4 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 270 ++++++++++++++++++
>  2 files changed, 274 insertions(+)
>
> --
> 2.34.1
>
>

--000000000000ed57a4062c4823cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Doug,<div>Can you spare some time to help review it? Th=
anks a lot.</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 17, 2025 at 5:14=E2=80=
=AFPM Langyan Ye &lt;<a href=3D"mailto:yelangyan@huaqin.corp-partner.google=
.com">yelangyan@huaqin.corp-partner.google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Fix the workflow of the previ=
ous email and resend it with all necessary recipient entries<br>
<br>
Changes in v3:<br>
- Link to v2: <a href=3D"https://lore.kernel.org/all/20250117050410.933312-=
1-yelangyan@huaqin.corp-partner.google.com/" rel=3D"noreferrer" target=3D"_=
blank">https://lore.kernel.org/all/20250117050410.933312-1-yelangyan@huaqin=
.corp-partner.google.com/</a><br>
<br>
Changes in v2:<br>
- PATCH 1/4: Add compatible for KINGDISPLAY KD110N11-51IE<br>
- PATCH 2/4: Add compatible for STARRY 2082109QFH040022-50E<br>
- Link to v1: <a href=3D"https://lore.kernel.org/all/20250116130530.3010117=
-1-yelangyan@huaqin.corp-partner.google.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/all/20250116130530.3010117-1-yelangyan@huaq=
in.corp-partner.google.com/</a><br>
<br>
Langyan Ye (4):<br>
=C2=A0 dt-bindings: display: panel: Add compatible for KINGDISPLAY<br>
=C2=A0 =C2=A0 KD110N11-51IE<br>
=C2=A0 dt-bindings: display: panel: Add compatible for STARRY<br>
=C2=A0 =C2=A0 2082109QFH040022-50E<br>
=C2=A0 drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie<b=
r>
=C2=A0 =C2=A0 MIPI-DSI panel<br>
=C2=A0 drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e=
<br>
=C2=A0 =C2=A0 MIPI-DSI panel<br>
<br>
=C2=A0.../display/panel/boe,tv101wum-nl6.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +<br>
=C2=A0.../gpu/drm/panel/panel-boe-tv101wum-nl6.c=C2=A0 =C2=A0 | 270 +++++++=
+++++++++++<br>
=C2=A02 files changed, 274 insertions(+)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000ed57a4062c4823cc--
