Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F404D489F54
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 19:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BD210E59D;
	Mon, 10 Jan 2022 18:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B5C10E42D;
 Mon, 10 Jan 2022 18:37:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so16031041otg.2; 
 Mon, 10 Jan 2022 10:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7RDlnoeMMtaCidCqn8V2aaFhuGEcHAhns4iW4e9qdnM=;
 b=VjFp/WLcs6GbIfJmypSr2K7VuO1ew6VCjVRgmHxGjIea/Cm3msMQzGm1VjEuN251zy
 faFdW6V3W2CNHCys3PjbHhczDEuuB8TeZCZWemA49uf4TAEk05szO2Cswf0nu/bZxsYA
 iKYF7hXT/N6tjdvrf6Jmu8Hp3zTmpWd1TdpjNyc+FBBGznkem8PTKpGS+DcaccOAN1IS
 AcXVq7Z0uMVC15Xm+eTgOTe0MaKag1D+wrRu4rnjpo00yqB+Mq2qVawOK13KA807RRH1
 +5DVHyLJ8K+QHMR6b7xJPuKIZRmpBzh6D/mRLwCoWpXNfsGDR5rjyYKW6tZ/X8pGY2Dm
 NFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7RDlnoeMMtaCidCqn8V2aaFhuGEcHAhns4iW4e9qdnM=;
 b=73wN6d2DpM29BTmCMDMzQ/tAZoHL7UCYMHFHZMR2lLAWEZj2snfkIzNPZbQ+qorQe4
 tp1PecF6w78Cl29T5nnzbsxjgtxLCDe/ShG2jZpVEPvBA25LhPqtPIcKBXpYu+SW0VXi
 7kGaGlpt2N0VCbEel0yud2TCbNydgiiejYBtBg3CQBW8wNW0OdDV+dba+yExECMJ+gg+
 kEv2Iho3kTp2WeeeqAZy/AeHcUp14qW5JqYKy0NnYW1QDxuq3AqdjuwGTP0uBD+qbo5H
 KBlkUVuyjnPj9RIA9orew9NK7CKUkyVEqGVX2Zjor4puaeSZc3C3g63zJrHjOaJjdizy
 Ztkw==
X-Gm-Message-State: AOAM530O2u4OscTfBSiVtAA+ybNr+LuUJHXTH4cKnSysXTJPY4VJxSQj
 1QB9OWQhZTi8R1alW5xRTAmaxLDrvYWAcoC6Mac=
X-Google-Smtp-Source: ABdhPJxg2UhJ+8PlYBDJNAgt4LXO7EPhRJbjnm22Ybn0KY7F3AAAM5Whi/nHt7mQ5Dz0kggNNlLjgFB1qLbBjrHVsHo=
X-Received: by 2002:a9d:f09:: with SMTP id 9mr833994ott.299.1641839866004;
 Mon, 10 Jan 2022 10:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20220109184245.124850-1-jose.exposito89@gmail.com>
 <139784cd-6cb7-18e0-bb09-b35113bd83ef@amd.com>
In-Reply-To: <139784cd-6cb7-18e0-bb09-b35113bd83ef@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jan 2022 13:37:34 -0500
Message-ID: <CADnq5_N1-kKfhZ9mttcRq7RON0DsEjs1cpvxo4M7jJN3M8Sx9w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: invalid parameter check in
 dmub_hpd_callback
To: Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Jude Shih <shenshih@amd.com>,
 Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 10, 2022 at 11:34 AM Harry Wentland <harry.wentland@amd.com> wr=
ote:
>
> On 2022-01-09 13:42, Jos=C3=A9 Exp=C3=B3sito wrote:
> > The function performs a check on the "adev" input parameter, however, i=
t
> > is used before the check.
> >
> > Initialize the "dev" variable after the sanity check to avoid a possibl=
e
> > NULL pointer dereference.
> >
> > Fixes: e27c41d5b0681 ("drm/amd/display: Support for DMUB HPD interrupt =
handling")
> > Addresses-Coverity-ID: 1493909 ("Null pointer dereference")
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index e727f1dd2a9a..7fbded7a6d9c 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -656,7 +656,7 @@ void dmub_hpd_callback(struct amdgpu_device *adev, =
struct dmub_notification *not
> >       struct drm_connector_list_iter iter;
> >       struct dc_link *link;
> >       uint8_t link_index =3D 0;
> > -     struct drm_device *dev =3D adev->dm.ddev;
> > +     struct drm_device *dev;
> >
> >       if (adev =3D=3D NULL)
> >               return;
> > @@ -673,6 +673,7 @@ void dmub_hpd_callback(struct amdgpu_device *adev, =
struct dmub_notification *not
> >
> >       link_index =3D notify->link_index;
> >       link =3D adev->dm.dc->links[link_index];
> > +     dev =3D adev->dm.ddev;
> >
> >       drm_connector_list_iter_begin(dev, &iter);
> >       drm_for_each_connector_iter(connector, &iter) {
>
