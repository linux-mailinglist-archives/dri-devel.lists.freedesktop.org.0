Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4BB49E07
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 02:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0D10E217;
	Tue,  9 Sep 2025 00:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TwFBLT76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331F010E217
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 00:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757377986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8aPDPeVVXVtlPJcL2fF7xrY3LH7ZYbZX2+8L20uXkw=;
 b=TwFBLT76+YAF6CRjKU6UPVbgHrC5x/HpF7G7GAtelHBi3jTVpC2tT6nKNQTl6RlWOEI8uq
 zBA2D8HKHGzVradeY7JLLFsHpV5GgKqEaXHnH6zR4wayTsMVVpScvv6XeXYPCwsGwvVQTu
 vmwRFBo2SZcWwxi4n5VYNDPP/rP1+bY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-zDiOaOVdOnaEguw0zlKrNA-1; Mon, 08 Sep 2025 20:33:05 -0400
X-MC-Unique: zDiOaOVdOnaEguw0zlKrNA-1
X-Mimecast-MFC-AGG-ID: zDiOaOVdOnaEguw0zlKrNA_1757377984
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-323766e64d5so5214703a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 17:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757377984; x=1757982784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8aPDPeVVXVtlPJcL2fF7xrY3LH7ZYbZX2+8L20uXkw=;
 b=Xqf5ufNOLcxPSuKRJX2JdiQbzN29Our1WmsQPD9paOCcv3rE8QJTjHXCBZ551Q/KZK
 yb0KF+FRIn9h1zKSsVV46O/7znH7Y+QZS3RSvgSwJklZ5Q0XnhMfWL4U4tFjWvpWBX+T
 7n3JXP1U07FQGOpJMIYlMFTTmxgJ0am5f3IrdmkO3zcRi26jz7mwIIyQj/qvKgIPrGHX
 hL3/RQh5Rny+IJZ3FdxWUPj/repb/lf6Up0Gxuivp6DNb63xHS3d/GaGed+INC/6rcNl
 2aVG3EhM0IXw3SMgUrDxtz+VnjVSZbYbllhsVWPs0xRY65XBhAAyaFLPJ2da+VP4OAmV
 0iTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWTUoz8/kaZAohGAHHjiu5FKLLomcvFCLteTAhNgxeCbSTEhbBZDQ3n2QM8VVQI00thNVX/lmYpsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymF5+/ONc5kcN5RPFl0AneFc2EoHGJowt5EfwkgF2+PgPFP4NF
 fZV4s3K1T5RTz1aPNIHHdcph2FE/F+Ak6RG6A52HjOPnsMJa+33OKwvBLqrFnB6EzMUpb37aqzc
 wvq27ZxZu3M18EPw1/AtwTJoPkWJPc0zsFes8LcyfQMtNEcv8/QFZMBwnS/M1U7QB7j3DHb80gM
 uVPUZ886MRCNYvbpTyLdQTygQKsW/xYxGagATLiEOfaGxp
X-Gm-Gg: ASbGncumN1dXMZLNd5A1dfgmClr1CzOZSR3MiNGP3uOmlfRWaCNNRHeM9b8B4fldcVO
 f8nWx7x90SqMI7Pa7fa3WD2VL2oLPZiGmZRIqmix4CLwBi3znoMU5l5xhT/Qxf/lpJY4+HRUkxZ
 vbSg8wEnMYPmTUoVWJ8rMDQK2j3110/2sYtBI8OO/i9UPprdAxfcoLTOw=
X-Received: by 2002:a17:90b:39c7:b0:31c:39c2:b027 with SMTP id
 98e67ed59e1d1-32d4504c0cdmr13473012a91.7.1757377983863; 
 Mon, 08 Sep 2025 17:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB/7LKq5lsBlOebRNDfBxkvSFu1ws6h5PabFN+juLJlOdDrCGtCm03aAPGBXPWywjfdxSvB2eI+Wr2hUmomAI=
X-Received: by 2002:a17:90b:39c7:b0:31c:39c2:b027 with SMTP id
 98e67ed59e1d1-32d4504c0cdmr13472983a91.7.1757377983421; Mon, 08 Sep 2025
 17:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250908141152.221291-1-ryasuoka@redhat.com>
In-Reply-To: <20250908141152.221291-1-ryasuoka@redhat.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Tue, 9 Sep 2025 09:32:52 +0900
X-Gm-Features: Ac12FXxmRNXE6fd6lYzBI7AoKQmUGq7MfnSQvaMDdMQMA8oaYPI_f6j8sooIhak
Message-ID: <CAHpthZqD_r_671GhFf4SgMMxcqq-pkzPKigEajgzozn-NMFQnA@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v2 0/1] add drm_panic_support for vmwgfx-stdu
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 ian.forbes@broadcom.com, jfalempe@redhat.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Iq_sTXojauVHi8q2htnEwsqrgXXN-jMzxq7WyjppzAU_1757377984
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 8, 2025 at 11:12=E2=80=AFPM Ryosuke Yasuoka <ryasuoka@redhat.co=
m> wrote:
>
> Add drm_panic support for stdu in vmwgfx. This patch was tested in
> a VM with VMSVGA on Virtual Box.
>
> I got 2 type of suggestions from reviewers:
> 1. Write the panic screen to guest_memory_bo and send dirty/flush
> command
> 2. Write it to VRAM directly and then switch back to legacy mode
>
> Since option 2 is simpler than another one and ldu might be able
> to re-use some codes if ldu supports drm_panic, I re-write this
> v2 patch with option 2.
>
> Ryosuke Yasuoka (1):
>   drm/vmwgfx: add drm_panic support for stdu
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  | 73 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  | 18 +++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  |  9 ++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 43 ++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 34 +++++++++++++
>  6 files changed, 178 insertions(+)
>
>
> base-commit: 306c8959b5fdfdc3900aebe4e56257a349f5765f
> --
> 2.51.0
>

This is the history of this patch.

v1:
https://lore.kernel.org/all/20250901083701.32365-1-ryasuoka@redhat.com/

v2:
- Map a scanout_buffer to VRAM in .get_scanout_buffer
- And then write to VRAM directly using fifo in legacy mode to avoid
allocations or command submissions.

Regards,
Ryosuke

