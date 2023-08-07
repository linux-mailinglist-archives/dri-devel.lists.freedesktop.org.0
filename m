Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B77C772CE4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555B810E362;
	Mon,  7 Aug 2023 17:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A2E10E360;
 Mon,  7 Aug 2023 17:28:19 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bfafe8a425so2310107fac.3; 
 Mon, 07 Aug 2023 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429299; x=1692034099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6FY/UHSIx30Eyl3JB6lbFhNoI7t76m1Z5h0FHFcD3Q=;
 b=MYw0o2mS1cTy+1qyqEKIAgKE7BzKVVUvpaT2XZdx3nB2IZEHgOkKbL4BfL/tAT7lw1
 jHMMyGzKb6oFcXfvnBa0iAYbORSMk/1ne/+3Xe7qWFQTGEc3Jjn6TrYcQeY8R1fML0Uj
 j77kIqGN3ChpU5cD/a1rHQnpHZ4Wlkc0ezRVwJYA5srFGs58eCGn2F88hXA7++wHYCzH
 tnjFbNBppzC4A86iRy71wFSdtTYfUnoJSzCCFmLOAoPr/Qh/pZUmXFeKfIPBnFcORbx1
 VTSC1vQ1pzw5JngwVdeZr0vaXuchbTwneqGKn1cKiPsf9gPdE4MHzZMDeuvWuLIlQyWF
 Er+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429299; x=1692034099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6FY/UHSIx30Eyl3JB6lbFhNoI7t76m1Z5h0FHFcD3Q=;
 b=MVB4xdVY3QAuprEy536lUf/dlneGXoT1g/1A654GuysVdm8lBuvg+2rrB9177c8Chx
 3XKha1d6MYKB9pvC63ioLtpR63Gu+rqTAsOR1c4DNgVvNQMyxe/2XmKLCcog+flKpu35
 /fKm+ugtO6mUUWwuliXrfUr0wEZGDrWFTHwf0AscQyTyC4oAvDZKZxBXagTnpE6SDc8m
 wK3fgYMfVQPYlHyzxDxPA8BdNesVsz9FW7t2iwUP7ofmLye0zFpDN71Ok8Dfd03688VV
 0u1t3t7o0P3v7TLcc65FT963uvSwFskMYuRVfhJ689Fh2tzsdBwuINn6H/ukrSf0ebu2
 JM6A==
X-Gm-Message-State: AOJu0YxIGZPqRNhZWymqXNahh/kEbV4KK7rBY1z2V3ra1p0BYEChZF/C
 ACkJyLmGj5ylGUzKyri326ERrxBUlR126MoRYqfLPARr
X-Google-Smtp-Source: AGHT+IHASMiUy5XrNmZvfsMZItI1yzQbhJ7cbtQGgY7fuzl77I6Cwqlpqrq0rHwSHjFykof0W4qkKe9uQC7EKB45UoU=
X-Received: by 2002:a05:6870:4694:b0:1be:cc5b:6ce with SMTP id
 a20-20020a056870469400b001becc5b06cemr11564723oap.20.1691429299068; Mon, 07
 Aug 2023 10:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072621.13162-1-sunran001@208suo.com>
In-Reply-To: <20230802072621.13162-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:28:08 -0400
Message-ID: <CADnq5_NS0yx5pu3S1WE38OaYV=O2-Tp1QGgfWD+v2r6AJWoSiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in amdgpu_trace.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:26=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: "foo* bar" should be "foo *bar"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_trace.h
> index 525dffbe046a..2fd1bfb35916 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -432,7 +432,7 @@ TRACE_EVENT(amdgpu_vm_flush,
>                            ),
>             TP_printk("ring=3D%s, id=3D%u, hub=3D%u, pd_addr=3D%010Lx",
>                       __get_str(ring), __entry->vmid,
> -                     __entry->vm_hub,__entry->pd_addr)
> +                     __entry->vm_hub, __entry->pd_addr)
>  );
>
>  DECLARE_EVENT_CLASS(amdgpu_pasid,
> @@ -494,7 +494,7 @@ TRACE_EVENT(amdgpu_cs_bo_status,
>  );
>
>  TRACE_EVENT(amdgpu_bo_move,
> -           TP_PROTO(struct amdgpu_bo* bo, uint32_t new_placement, uint32=
_t old_placement),
> +           TP_PROTO(struct amdgpu_bo *bo, uint32_t new_placement, uint32=
_t old_placement),
>             TP_ARGS(bo, new_placement, old_placement),
>             TP_STRUCT__entry(
>                         __field(struct amdgpu_bo *, bo)
> --
> 2.17.1
>
