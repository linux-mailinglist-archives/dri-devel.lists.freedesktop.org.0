Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A92B18B46
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F53610E110;
	Sat,  2 Aug 2025 08:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kJYv3e+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C06D10E3AC;
 Fri,  1 Aug 2025 06:11:34 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-313910f392dso428156a91.2; 
 Thu, 31 Jul 2025 23:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754028694; x=1754633494; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0ko16HVi9ZPbBwhIj2VqJyHD6N02PwGWvkY6qgm70FA=;
 b=kJYv3e+m5LH7ja9jT2lVIAln3PKjNqcriBeOjOvBDnD5AilXPhJg+XMyic0t75EaNq
 2FV0L4rBBaoqZ98Hnz6UH1Y75qXArCzm1LFrugbiKgXAtej68s/YfHe/2WYtL1EhDE/h
 gRmHB7sGy1DU92gZuXoFaWECHtYR48NX5VzEyoisFYYOVHJvv2mCJpqt88YtZo+q/U3D
 +AIRjeMd5pH6KscFTpoMqL8s+NGZ033YPGmbRZua6NoRwm/2FMIXW4fHTDfb/i8hyXwU
 KZPXOC6cynHIWnNqUuLnXX73YQV4HZVdV+0Eac5/KPRlYMSot9cYb7SGDuM9TCIQ6BeA
 JZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754028694; x=1754633494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ko16HVi9ZPbBwhIj2VqJyHD6N02PwGWvkY6qgm70FA=;
 b=iGptHzp5/9A7p1tPBR2aVHSJ4KDOX1wuYtwZHfleeuSS05ZUPV5VjWICW5w5sRvjZo
 MllIXVGmc+J5c3U40njMwP5eC7z4OLxRLxeYL2MemH7mfaP/Dr7x75jPZmt8hGtMN93w
 fWEGK3xtTGTF7RyqRg7ZetpzxHbHLLmapHkO/0k8/2+BqA7jfxJQ2RhW4h43uiVXUTPg
 osbCViwoXNXvPOOO8S/l20m04gPNeHIKDmv1VrC9sQzJTRebr40ronhPy034uwdYuqnq
 BYmOBDohu5F/cvwzZnFM3FVA3kstWOe9OjAvpi+L8uTovWmVAmKzGgiKChvtOh3g3+X9
 tCHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMLjFtG83AT/pRpqqdFO5QvEy4uH1q/M77GjVqjTDGccqgl2cI/YwtmVmGBRITQeCeCaDKQBsg@lists.freedesktop.org,
 AJvYcCW+12S/+t/jCeN0o9H51xTBahGylMz1kBX7Yzb6IJWj9dzglEO3qfqnmDacE3eG/YH3sid71QpSR/22@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbc8karcbXlCBLrmPnFa8iEyCUTYoDMxp9G2+oHAfM2WYEqWXJ
 hLqkweLFiQBM9ECojS+luiYYhRgB17vKUGUFsHOqWP92rXHeBxePZUf5YiffT0wUcO4Yz113gH7
 fWytxLddlb/hrJ2FuG/BmjNHVUYGKJWU=
X-Gm-Gg: ASbGncv8gbanjVPJtujRaH6k8g/Xxo7w/VnL6RJKqhS5D9o8de1172lJDRDtSWe8MtT
 QZBd5twrZkw1pT6PhF9Slnk/Nu1P87nPLCCZa8oNFSFb7TI7WrRPs9qxtJv/V/BHBUzLOI3AHR4
 eqawd1ZewJlvbS88MZWkbZ7BHgDi5Ea9yw3ujtusV9BBEfCoITh7Hv4Km7KnzDlwNsWTdt7edCK
 JGzYJo=
X-Google-Smtp-Source: AGHT+IHP5f0oXGiOrttrHBImpIiuQeP4ljVNIuB7tpCkUe7xYlaM0ikqTUnOdcQq1Ul7QI4J9HRPqfYROgBiKnI0g/k=
X-Received: by 2002:a17:90b:2cc6:b0:312:2bb:aa89 with SMTP id
 98e67ed59e1d1-31f5de34a48mr14645187a91.20.1754028693622; Thu, 31 Jul 2025
 23:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
 <20250731-b4-dont-wake-next-v1-5-e51bdc347fa3@gmail.com>
 <CADnq5_PG1Am4OGkfKo9o9cfnvSdzwRFeYudbvw220+P1AHO4xA@mail.gmail.com>
In-Reply-To: <CADnq5_PG1Am4OGkfKo9o9cfnvSdzwRFeYudbvw220+P1AHO4xA@mail.gmail.com>
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Fri, 1 Aug 2025 08:11:21 +0200
X-Gm-Features: Ac12FXy4Bp7cHwpfA3_SJEVsnOgcLffltweyrxbaKSDp7VKM1SkzOyKNjBrWNao
Message-ID: <CA+gwMcc41Hh=or7NLMnG++miHj_dNLZ04iFYdf=U7_LLG1gSZw@mail.gmail.com>
Subject: Re: [PATCH RFC 5/6] drm/amdgpu: don't wake up the GPU for
 mmGB_ADDR_CONFIG register read
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000359306063b47a15a"
X-Mailman-Approved-At: Sat, 02 Aug 2025 08:22:22 +0000
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

--000000000000359306063b47a15a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 9:38=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:

> On Thu, Jul 31, 2025 at 3:33=E2=80=AFAM Philipp Zabel <philipp.zabel@gmai=
l.com>
> wrote:
> >
> > Don't wake the GPU if libdrm queries the mmGB_ADDR_CONFIG register
> > value during amdgpu_query_gpu_info_init(). Instead, return the already
> > cached value adev->gfx.config.gb_addr_config.
> >
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
> > Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > index fe1347a4075c4..ed4d7d72f2065 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > @@ -883,6 +883,16 @@ int amdgpu_info_ioctl(struct drm_device *dev, void
> *data, struct drm_file *filp)
> >
> >                 alloc_size =3D info->read_mmr_reg.count * sizeof(*regs)=
;
> >
> > +               if (info->read_mmr_reg.dword_offset =3D=3D 0x263e &&
>
> I think the offset of this register varies across chip families.
> You'll need some way to determine what the offset is for each family.
>

Thank you. This workaround was specifically intended for the following call
in libdrm [1]:

        r =3D amdgpu_read_mm_registers(dev, 0x263e, 1, 0xffffffff, 0,
                                             &dev->info.gb_addr_cfg);

[1]
https://gitlab.freedesktop.org/mesa/libdrm/-/blob/9ea8a8e93d542fe61d82716d1=
a721e8d1d257405/amdgpu/amdgpu_gpu_info.c#L215-216

which also seem to hard-code the dword_offset?

The same is now copied into Mesa [2] as:

   r =3D ac_drm_read_mm_registers(dev, 0x263e, 1, 0xffffffff, 0,
&info->gb_addr_cfg);

[2]
https://gitlab.freedesktop.org/mesa/mesa/-/blob/c64c6a0c31f9cb1339bc700d236=
932171f7444a3/src/amd/common/ac_linux_drm.c#L722

regards
Philipp

--000000000000359306063b47a15a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 31, 2025 at 9:38=E2=80=AFPM Alex =
Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, Jul 31, 2025 at 3:33=E2=80=AFAM Philipp Zabel &lt;<a href=3D"mailto:=
philipp.zabel@gmail.com" target=3D"_blank">philipp.zabel@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; Don&#39;t wake the GPU if libdrm queries the mmGB_ADDR_CONFIG register=
<br>
&gt; value during amdgpu_query_gpu_info_init(). Instead, return the already=
<br>
&gt; cached value adev-&gt;gfx.config.gb_addr_config.<br>
&gt;<br>
&gt; Link: <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/2295"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/am=
d/-/issues/2295</a><br>
&gt; Signed-off-by: Philipp Zabel &lt;<a href=3D"mailto:philipp.zabel@gmail=
.com" target=3D"_blank">philipp.zabel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 10 ++++++++++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_kms.c<br>
&gt; index fe1347a4075c4..ed4d7d72f2065 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; @@ -883,6 +883,16 @@ int amdgpu_info_ioctl(struct drm_device *dev, voi=
d *data, struct drm_file *filp)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alloc_siz=
e =3D info-&gt;read_mmr_reg.count * sizeof(*regs);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&gt;r=
ead_mmr_reg.dword_offset =3D=3D 0x263e &amp;&amp;<br>
<br>
I think the offset of this register varies across chip families.<br>
You&#39;ll need some way to determine what the offset is for each family.<b=
r></blockquote><div><br></div><div style=3D"font-family:courier new,monospa=
ce" class=3D"gmail_default">Thank you. This workaround was specifically int=
ended for the following call in libdrm [1]:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 r =3D amdgpu_read_mm_registers(dev, 0x263e, 1, 0xffffffff, 0,<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;dev-&gt;info.gb_addr_cfg);<br><br>[1] <a href=3D"https://gitlab.=
freedesktop.org/mesa/libdrm/-/blob/9ea8a8e93d542fe61d82716d1a721e8d1d257405=
/amdgpu/amdgpu_gpu_info.c#L215-216">https://gitlab.freedesktop.org/mesa/lib=
drm/-/blob/9ea8a8e93d542fe61d82716d1a721e8d1d257405/amdgpu/amdgpu_gpu_info.=
c#L215-216</a><br><br>which also seem to hard-code the dword_offset?</div><=
div style=3D"font-family:courier new,monospace" class=3D"gmail_default"><br=
></div><div style=3D"font-family:courier new,monospace" class=3D"gmail_defa=
ult">The same is now copied into Mesa [2] as:<br><br>=C2=A0 =C2=A0r =3D ac_=
drm_read_mm_registers(dev, 0x263e, 1, 0xffffffff, 0, &amp;info-&gt;gb_addr_=
cfg);<br><br>[2] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/blob=
/c64c6a0c31f9cb1339bc700d236932171f7444a3/src/amd/common/ac_linux_drm.c#L72=
2">https://gitlab.freedesktop.org/mesa/mesa/-/blob/c64c6a0c31f9cb1339bc700d=
236932171f7444a3/src/amd/common/ac_linux_drm.c#L722</a></div></div><div cla=
ss=3D"gmail_quote gmail_quote_container"><br><div style=3D"font-family:cour=
ier new,monospace" class=3D"gmail_default">regards</div><div style=3D"font-=
family:courier new,monospace" class=3D"gmail_default">Philipp</div><br></di=
v></div>

--000000000000359306063b47a15a--
