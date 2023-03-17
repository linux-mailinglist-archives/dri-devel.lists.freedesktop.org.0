Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48006BEAC5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 15:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC5010E3A5;
	Fri, 17 Mar 2023 14:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B156610E385
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679062361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp87O6wnvt7RQSGAMv2L+yB9U1AJut+1ZDcle+GOMDo=;
 b=IjdzIhqHLgK61VQosMWVWRb8iL1z+zdoG0GTO+0rofqjjmDObGnCRtonBhHZrqP1GmhClV
 GO/zgqiTofs0CDpuhfRQ5D5Ksv7G0VhBtL6SMPISYAFzvENm7PJMpWAmQYV05YQhPQzFPx
 m1qWRR/amPvkcOFUGHN/R8jsymBKAro=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-KmxzwB0QNr6Ry4reVRtlLw-1; Fri, 17 Mar 2023 10:12:40 -0400
X-MC-Unique: KmxzwB0QNr6Ry4reVRtlLw-1
Received: by mail-lf1-f69.google.com with SMTP id
 f8-20020a056512360800b004b8825890a1so2046872lfs.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 07:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679062358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yp87O6wnvt7RQSGAMv2L+yB9U1AJut+1ZDcle+GOMDo=;
 b=EamEu2LzGYVFZGdbtWGggTDnDJDbtxhQGiuOD7DoY6kYaVffGeMreQHO624f5TRM5E
 R1/Ik44FMbK7wZZOR6ovjEvbNPwysCMBfWjC8cX0D9Fuv0mAj3G/mfSz29Y4QPCJT5rZ
 zGeSnKYaWOzPimvLyJOG0mAA8TMO8um+q7/al3cUyrhTMO5+zZ0Lye/buwn+3Ext4fJ/
 0bGLXonB1F44qeUwQQ59vqytVoDKCJ87mUJwsMY1/WYyOaG/E+CWAsVxf6Y7lI46imds
 1uNn9fp/2+xdud8b+2CVSsNs1YyOVeUlYKEBoNLVUvs051U3n2VLQ9TJbFMg3Ypdf1Nh
 2I9Q==
X-Gm-Message-State: AO0yUKV6u/8eUaaIiumlpV3zhpI8uW1WwNqhVWj35b6eAxxLZpUgFllu
 FNsWllRL6La6Y0sYjSMCY3NjFOLwqlP1cWXsZQs70I6KHfO+KGg51NqIRKnTLOZzXwDw7ccQFPm
 t5+oZTRi02dLrr2nhudhjbx4u6ngU93htBG0dsXyLXX5KMS7ckGmbKAA=
X-Received: by 2002:ac2:5f0e:0:b0:4dd:a9e5:aa09 with SMTP id
 14-20020ac25f0e000000b004dda9e5aa09mr4264611lfq.11.1679062358652; 
 Fri, 17 Mar 2023 07:12:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set+gife62n4XCWkrR4+tagPTjJbFZJF9q30pel5qgQh2IP2UWNPkn6gpFTJqvxpuh0cZgm/VqXngWGM2qrRSjIk=
X-Received: by 2002:ac2:5f0e:0:b0:4dd:a9e5:aa09 with SMTP id
 14-20020ac25f0e000000b004dda9e5aa09mr4264607lfq.11.1679062358352; Fri, 17 Mar
 2023 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-32-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-32-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Mar 2023 15:12:26 +0100
Message-ID: <CACO55ttNWZ8=Ma4m+-zFP3yAPpHYqsq3QF6fCd4jYpEK6uwypg@mail.gmail.com>
Subject: Re: [PATCH 31/37] drm/nouveau/dispnv04/crtc: Demote kerneldoc abuses
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau changes up to here are:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Mar 17, 2023 at 9:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:453: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:629: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/no=
uveau/dispnv04/crtc.c
> index a6f2e681bde98..7794902df17d5 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct dr=
m_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] =3D 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_fr=
amebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>

