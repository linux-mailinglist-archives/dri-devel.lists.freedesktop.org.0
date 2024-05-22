Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD268CBEFF
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEBC10E1A8;
	Wed, 22 May 2024 10:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPE7JHk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419B10E206;
 Wed, 22 May 2024 10:07:48 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6206ed9d3d5so6723447b3.1; 
 Wed, 22 May 2024 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716372467; x=1716977267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYAIfZw1pkV8spolfI/p1xvCTUqzpLywcb68T4prkxU=;
 b=hPE7JHk4aXe364n9LTKa7nv8YsaSOkGIE4jcB66X4KAzWiMQZP4g7440TwlBkWyba4
 3DJI/QZk8fA7rEpmJGm6vxx+SPV8xF3oVOxIOqkq5PC7NPAMD5/ogODfuSaXaNqEn7VZ
 JsoLYOtucz8j/ii97YPCRcFpYUUsm8heSISZnt36yGalLDXd9RHWOX5nRK6uiNHBp6DR
 GVj+Bkc2/oLV1cASPGTLl4akJPvRWQVkw+mD2Qu0z+8sUEabX3D18UyXj38VQu/AX3kc
 +cwx3Kz2EhMMn9nNWKZIUPt7VshvsJO4lxL46Sl13GqVYuy6A1o8EaeH8vGEi9he2Q26
 ZdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716372467; x=1716977267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYAIfZw1pkV8spolfI/p1xvCTUqzpLywcb68T4prkxU=;
 b=Lzg83p7gzGqOM6IShfxNZd05DotDptXDwma5eXa3s4nnvli0LxkliqVy1WgF2FY3p8
 lbMo8/22vZNzz+QcfAHO0iV2IFzuJnW6mXKjUjN5xgQ+k+E7/k3NFdMFEDKGyQ+Ql447
 KiS6JENi2vOKV3DMmFWHYMv0e95aGjigxhJGDWY6KffqOLsvzww92BcyyTPuo9mCXlQb
 p9Z2vW+qzyEWtv9Cm947HOAdSl/ocWu+XbJJstUhfrNgBwGDK7bMOlxRBp7oxwZg9F6e
 +Vz4BOe8EXigWyv3cVK5f0+EgZosjgCAVQI48gxZi/KtOsU1uHJe9zuT2qjVBDS7KRYm
 4VFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrSivxvg9AUpmN65LsM69UgZ8QnqQfwL1g6pbVkOqfJCDrvlXw49pNxpCu4SGFkXQdaFPWs3svfSNfZJ1pp/4SNinqYoxDz5KGCDy+EMHiO6jf0A8md1NJzfAc2c3E2QewDXvrrRg8GnkRozjFfw==
X-Gm-Message-State: AOJu0YxC1z2sA2g025q9fkDBRMEGCVvNJHNuIT1ZOTOsaDNW0Ckxxu99
 MQZxjLUABRwcE2UmAlDAPUeONjAygLUcfZROauBspofhdVDsP+Eya4Te0dReyzSIjiKYLvTwMSZ
 0E6AHUdQlqjPssMQi6Y8Vq40I4Xg=
X-Google-Smtp-Source: AGHT+IFel+c4KStAAY5NfiWIEWgcD+1V1XSEK0JgYjZA0oyC4mhxOzw8ugHhfEf2pZ74D22tA6V11fBr2krncREDYeQ=
X-Received: by 2002:a05:6902:2411:b0:df4:4724:8755 with SMTP id
 3f1490d57ef6-df4e0a80fedmr1699384276.1.1716372467286; Wed, 22 May 2024
 03:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
 <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
 <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
 <86410711-9b88-448c-9148-109f81b1ca55@amd.com>
In-Reply-To: <86410711-9b88-448c-9148-109f81b1ca55@amd.com>
From: =?UTF-8?Q?Rino_Andr=C3=A9_Johnsen?= <rinoandrejohnsen@gmail.com>
Date: Wed, 22 May 2024 12:07:36 +0200
Message-ID: <CAACkh=9hY7eg_uuH7Psm=XJfSzwQTvzs8bvOXQ=wwkMPrC44SA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

To be perfectly honest with you, I haven't given that much though. I
used the 'bpc' and 'colorspace' property in debugfs, since I could not
find that information anywhere else. And since I also needed to verify
the pixel encoding being used, I added it where those other values
were. That made for a simple and easy addition for this property.

If you want me to do this differently, let me know. And please point
me to the standardized DRM property where I should expose the values.

Rino

On Tue, May 21, 2024 at 10:55=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 5/21/2024 15:06, Rino Andr=C3=A9 Johnsen wrote:
> > What is already there in debugfs is 'bpc' and 'colorspace', but not
> > the pixel encoding/format.
> > I have searched high and low for that to be able to verify that my
> > monitor and computer are using my preferred combination of all those
> > three values.
> >
> > I do think it should be available as a standard DRM CRTC property, but
> > for the time being, I figured that a simple debugfs property would be
> > sufficient for time being.
> >
>
> It's just about as much work either way to populate it though, why do it
> twice instead of just doing it right the first time?
>
> > Rino
> >
> >
> > On Tue, May 21, 2024 at 9:04=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> Am 21.05.24 um 07:11 schrieb Rino Andre Johnsen:
> >>> [Why]
> >>> For debugging and testing purposes.
> >>>
> >>> [How]
> >>> Create amdgpu_current_pixelencoding debugfs entry.
> >>> Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencodin=
g
> >>
> >> Why isn't that available as standard DRM CRTC property in either sysfs
> >> or debugfs?
> >>
> >> I think the format specifiers should already be available somewhere th=
ere.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> 1. Do not initialize dm_crtc_state to NULL.
> >>> ---
> >>>    .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++=
++++
> >>>    1 file changed, 47 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.=
c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> >>> index 27d5c6077630..4254d4a4b56b 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> >>> @@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(stru=
ct seq_file *m, void *data)
> >>>    }
> >>>    DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
> >>>
> >>> +/*
> >>> + * Returns the current pixelencoding for the crtc.
> >>> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_=
pixelencoding
> >>> + */
> >>> +static int amdgpu_current_pixelencoding_show(struct seq_file *m, voi=
d *data)
> >>> +{
> >>> +     struct drm_crtc *crtc =3D m->private;
> >>> +     struct drm_device *dev =3D crtc->dev;
> >>> +     struct dm_crtc_state *dm_crtc_state;
> >>> +     int res =3D -ENODEV;
> >>> +
> >>> +     mutex_lock(&dev->mode_config.mutex);
> >>> +     drm_modeset_lock(&crtc->mutex, NULL);
> >>> +     if (crtc->state =3D=3D NULL)
> >>> +             goto unlock;
> >>> +
> >>> +     dm_crtc_state =3D to_dm_crtc_state(crtc->state);
> >>> +     if (dm_crtc_state->stream =3D=3D NULL)
> >>> +             goto unlock;
> >>> +
> >>> +     switch (dm_crtc_state->stream->timing.pixel_encoding) {
> >>> +     case PIXEL_ENCODING_RGB:
> >>> +             seq_puts(m, "RGB");
> >>> +             break;
> >>> +     case PIXEL_ENCODING_YCBCR422:
> >>> +             seq_puts(m, "YCBCR422");
> >>> +             break;
> >>> +     case PIXEL_ENCODING_YCBCR444:
> >>> +             seq_puts(m, "YCBCR444");
> >>> +             break;
> >>> +     case PIXEL_ENCODING_YCBCR420:
> >>> +             seq_puts(m, "YCBCR420");
> >>> +             break;
> >>> +     default:
> >>> +             goto unlock;
> >>> +     }
> >>> +     res =3D 0;
> >>> +
> >>> +unlock:
> >>> +     drm_modeset_unlock(&crtc->mutex);
> >>> +     mutex_unlock(&dev->mode_config.mutex);
> >>> +
> >>> +     return res;
> >>> +}
> >>> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
> >>>
> >>>    /*
> >>>     * Example usage:
> >>> @@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
> >>>                            crtc, &amdgpu_current_bpc_fops);
> >>>        debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->d=
ebugfs_entry,
> >>>                            crtc, &amdgpu_current_colorspace_fops);
> >>> +     debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc-=
>debugfs_entry,
> >>> +                         crtc, &amdgpu_current_pixelencoding_fops);
> >>>    }
> >>>
> >>>    /*
> >>
>
