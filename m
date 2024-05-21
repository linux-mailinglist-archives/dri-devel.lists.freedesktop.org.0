Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B778CB489
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 22:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C4710E074;
	Tue, 21 May 2024 20:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YMUyvqGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE55A10E074;
 Tue, 21 May 2024 20:06:33 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-df1ceefd864so15379276.0; 
 Tue, 21 May 2024 13:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716321992; x=1716926792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MR5DjSv8xW5VPd+KWcp/T0DpzQM38Nn27tvEAji7BQ=;
 b=YMUyvqGhvYZ8MdCUV0BgG05LabkeDO0+ZJgBKkVHcZJ3SFIrANwOEUCzie4uBuygZ8
 UyrL5dre85Wg57/AGq+Oe09UNtLQjIiRIzMjK8ULaMc19GxhXWmpuPA2XTifhaq+YfJ7
 zTRIEfL6xV7ztwkjSXerFmbDw+LvjzzEj07hxd6owFxZuTAYCbX0Y1grkOyCfFrrNnXZ
 ARCkUJOn8SeAhrhDP7QLyc2azRruglMj3sqWPw6kMGebclAY8rFHIe7QtNznH1sksuF2
 KD0lHTN08IGDyQZhEMVpg/6ZYDazwTsAwffL0e471t+saIOgdA+Z9wz/Uc91KlmfhWmv
 1T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716321992; x=1716926792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MR5DjSv8xW5VPd+KWcp/T0DpzQM38Nn27tvEAji7BQ=;
 b=b/kL3xsppGDxYWj7V48/5ZXS655EPjnFxPTzXRLS3LuC7WK0VWNsvMQpIlbgH3wy/Q
 AB+UHmRqzv4GEoAcrYKTNdW4ikc6ZkzoynQq64jzgJxA4zRVrFtxPcOOwpDiUKScIcHF
 RqlJXqlLjSEhLqaFb5D+KAcvMXj2gsbq89IYKp5EawJpQ+jYYUxoWscIeb4Ba8xtZgmn
 MMKzSBjVUXpTN2oPtXHJLsW4tKjOdrg0/trSuMbS58FkO3Hlx6w5OnqaYGnAFf8GmpK5
 TOvcv3NlkZqoMi0meBH516UV0Iv3DFvXchS58Gab9dD+AquqcT07zXx2MyWCgGRTm9MT
 LOIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0InXPpNioHqH2ZJaKS8oevHHQtexCIIWSy+DpfuWzcXy6m5FVdYjy5VyKwRsBtl062AOeuYOa+rQTXPzUFe7ILp68NPecUDaZtXRhtEJqqAe7uQUDUfIsTSuQZm6zZqHVpY8BqFmJhLWBVlePcA==
X-Gm-Message-State: AOJu0YxJRO5IR6OCenRrwfKwVPxamoW+UNKcdvkNkMTk7XhAIERW42fa
 tKtksuZHPESHKzT0+MUpFaPwQCPOAO6F9KlfPcKS/Ww9lr0jAeOCLgoTFyBsgEbQZSjPbIVzpoM
 pyJsurV+ixMa4kQ9yhkRGMUNRYNA=
X-Google-Smtp-Source: AGHT+IH9ydijh7ECa75vs0HHHE6Ew1epoA/bhjnzTRRSWClpr4GNuvnDgBkbRVrKvtoiMy0L/6EgqNr4XwkjbQ2Fz2Q=
X-Received: by 2002:a05:6902:1587:b0:df4:8c19:1da6 with SMTP id
 3f1490d57ef6-df4e0ebdadbmr106482276.6.1716321992557; Tue, 21 May 2024
 13:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
 <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
In-Reply-To: <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
From: =?UTF-8?Q?Rino_Andr=C3=A9_Johnsen?= <rinoandrejohnsen@gmail.com>
Date: Tue, 21 May 2024 22:06:21 +0200
Message-ID: <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

What is already there in debugfs is 'bpc' and 'colorspace', but not
the pixel encoding/format.
I have searched high and low for that to be able to verify that my
monitor and computer are using my preferred combination of all those
three values.

I do think it should be available as a standard DRM CRTC property, but
for the time being, I figured that a simple debugfs property would be
sufficient for time being.

Rino


On Tue, May 21, 2024 at 9:04=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 21.05.24 um 07:11 schrieb Rino Andre Johnsen:
> > [Why]
> > For debugging and testing purposes.
> >
> > [How]
> > Create amdgpu_current_pixelencoding debugfs entry.
> > Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding
>
> Why isn't that available as standard DRM CRTC property in either sysfs
> or debugfs?
>
> I think the format specifiers should already be available somewhere there=
.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
> > ---
> >
> > Changes in v2:
> > 1. Do not initialize dm_crtc_state to NULL.
> > ---
> >   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 ++++++++++++++++++=
+
> >   1 file changed, 47 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > index 27d5c6077630..4254d4a4b56b 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > @@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(struct=
 seq_file *m, void *data)
> >   }
> >   DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
> >
> > +/*
> > + * Returns the current pixelencoding for the crtc.
> > + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_pi=
xelencoding
> > + */
> > +static int amdgpu_current_pixelencoding_show(struct seq_file *m, void =
*data)
> > +{
> > +     struct drm_crtc *crtc =3D m->private;
> > +     struct drm_device *dev =3D crtc->dev;
> > +     struct dm_crtc_state *dm_crtc_state;
> > +     int res =3D -ENODEV;
> > +
> > +     mutex_lock(&dev->mode_config.mutex);
> > +     drm_modeset_lock(&crtc->mutex, NULL);
> > +     if (crtc->state =3D=3D NULL)
> > +             goto unlock;
> > +
> > +     dm_crtc_state =3D to_dm_crtc_state(crtc->state);
> > +     if (dm_crtc_state->stream =3D=3D NULL)
> > +             goto unlock;
> > +
> > +     switch (dm_crtc_state->stream->timing.pixel_encoding) {
> > +     case PIXEL_ENCODING_RGB:
> > +             seq_puts(m, "RGB");
> > +             break;
> > +     case PIXEL_ENCODING_YCBCR422:
> > +             seq_puts(m, "YCBCR422");
> > +             break;
> > +     case PIXEL_ENCODING_YCBCR444:
> > +             seq_puts(m, "YCBCR444");
> > +             break;
> > +     case PIXEL_ENCODING_YCBCR420:
> > +             seq_puts(m, "YCBCR420");
> > +             break;
> > +     default:
> > +             goto unlock;
> > +     }
> > +     res =3D 0;
> > +
> > +unlock:
> > +     drm_modeset_unlock(&crtc->mutex);
> > +     mutex_unlock(&dev->mode_config.mutex);
> > +
> > +     return res;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
> >
> >   /*
> >    * Example usage:
> > @@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
> >                           crtc, &amdgpu_current_bpc_fops);
> >       debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debu=
gfs_entry,
> >                           crtc, &amdgpu_current_colorspace_fops);
> > +     debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc->d=
ebugfs_entry,
> > +                         crtc, &amdgpu_current_pixelencoding_fops);
> >   }
> >
> >   /*
>
