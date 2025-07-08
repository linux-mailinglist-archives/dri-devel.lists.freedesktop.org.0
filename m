Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F195AFDA0F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 23:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F4310E1D9;
	Tue,  8 Jul 2025 21:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fex40+fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E718410E1D9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 21:40:17 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-70e5d953c0bso53209897b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 14:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752010817; x=1752615617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iaAH589LZlMraY4A9Bpzm4rHlPQ4aZ5HSThFI0Eph4U=;
 b=Fex40+fh0MKU5d0SIlzCLrxY4HQ7Rzvz/2Xc+VDpAcnoHiaZlWzozCnMsiuAHEq/0j
 Aomwflw8Ap9+eL98E5sSvLJ6DAz0PbaJwTbyvkHe7Cgaefd1g28e8RcUbM0RzQZk+o2X
 lMsNkN1AIQ5RCSztDW4oH1VVMwlsU4UrrH2UJb7CVnqcCmuoEZg3nlbglr1RaCSzITrj
 qHhQ7IYMFdf8I3w9asaoJC2oE53KdzdA9EQix/CBrgjIMSoGZ69fKu2PSwjrJS3XP4TT
 l4JAf4kNX5TmMMs4ekjJBABDpgluuH+Vh1/EH2nBU8jOpFwjiGwFz+oH+n82xem5rTSF
 mK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752010817; x=1752615617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iaAH589LZlMraY4A9Bpzm4rHlPQ4aZ5HSThFI0Eph4U=;
 b=bAO2dsX/Ju5VfKEVrH+HoLAC6X96HFZqAdwycKJ+lk85XmUkFvRVk3MDIe12pzIgyl
 7UEdSFF5/yKj1u2vp5OKUnJswj522Sl1l0JJsKitLSg5ewTMrqp/VODhe0lfc16IB3kf
 8I5/GiC0+ByKk6zeQLoGK+FjhhvXPaf+GIxwlFzGqfkDgDzGXxL+T9lJE3Atq5Wtj5+Q
 y7jzQ40MJUzk/28M8C4uA0Ar9teyJSQ5bjhDLS/mgSw5FNPwePXh1j1JmWLPl1z6MMRS
 9bypM5/6PlFcqwTpL2QeEqpJ8sMvOVo2k6egQWTDlIei+RilvsfJ41Yrp+DYk+QI0fBt
 yuzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV6iesce0Qsqw7WMdgVVAWpI9chFS3BjSheITf6lyyPZYS7cvaMfnfxuWQTxFxxpGCIIpOL1AjXrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrBEkpru7Te2Gw3QNqDaJdZXismIgsVi61X96zED3Bns0FuhWQ
 0ShWETQN6uJdCSkMreT+GRdnmR5bJxVOb6i+F7m39g3SJiCa6P/1tV49voTJyf29JddD/Sr3Gqr
 PHFR0CkwnLbdOIiV9TpFhWG35uF6oRZg=
X-Gm-Gg: ASbGncvvzvXTrXKrehr3sizJ2dfGP44Jj1c6Q72xKm4SEeWQuVyIxiSMMU4hJB4nqDq
 VMGsntOmYCKLL/kyKGHwcBWxNELqkhr7oDZ+nUaaDFbLtmKdI75Yrpler+xl640kXVpk+vc+O+N
 A5lYKqo5RafSSlXPE6onfCIo1l4uOCqDWfjbw8khrmroe7kTFIwnQ9QrEhT2q56I4Rwu8sL9bV8
 L8=
X-Google-Smtp-Source: AGHT+IEZyewEjFiJ13mMUMT2SWnwYaChgZGIEiM8RaBPQnvGx962PDUYUOvqRPNL/uLL7zq31VHakjyVm1m7zHbDitw=
X-Received: by 2002:a05:690c:660a:b0:711:9770:161f with SMTP id
 00721157ae682-717b1b589eemr4928217b3.2.1752010816854; Tue, 08 Jul 2025
 14:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250618145550.1901618-1-olvaffe@gmail.com>
 <20250623083241.02127feb@fedora>
In-Reply-To: <20250623083241.02127feb@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 8 Jul 2025 14:40:06 -0700
X-Gm-Features: Ac12FXzNJw14_2WStep6IjZp_-TrHnrbk-yIF8wqDQTY4HkXSi3wfVh2bACab1k
Message-ID: <CAPaKu7TTR4prUqt=AL2Lh=od9B_RqQpH+5redvFb3FY749Ebgg@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: always set fence errors on CS_FAULT
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Sun, Jun 22, 2025 at 11:32=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 18 Jun 2025 07:55:49 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > It is unclear why fence errors were set only for CS_INHERIT_FAULT.
> > Downstream driver also does not treat CS_INHERIT_FAULT specially.
> > Remove the check.
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index a2248f692a030..1a3b1c49f7d7b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -1399,7 +1399,7 @@ cs_slot_process_fault_event_locked(struct panthor=
_device *ptdev,
> >       fault =3D cs_iface->output->fault;
> >       info =3D cs_iface->output->fault_info;
> >
> > -     if (queue && CS_EXCEPTION_TYPE(fault) =3D=3D DRM_PANTHOR_EXCEPTIO=
N_CS_INHERIT_FAULT) {
> > +     if (queue) {
> >               u64 cs_extract =3D queue->iface.output->extract;
> >               struct panthor_job *job;
> >
>
> Now that I look at the code, I think we should record the error when
> the ERROR_BARRIER is executed instead of flagging all in-flight jobs as
> faulty. One option would be to re-use the profiling buffer by adding an
> error field to panthor_job_profiling_data, but we're going to lose 4
> bytes per slot because of the 64-bit alignment we want for timestamps,
> so maybe just create a separate buffers with N entries of:
>
> struct panthor_job_status {
>    u32 error;
> };
The current error path uses cs_extract to mark exactly the offending
job faulty.  Innocent in-flight jobs do not seem to be affected.

I looked into emitting LOAD/STORE after SYNC_ADD64 to copy the error
to panthor_job_status.  Other than the extra instrs and storage,
because group_sync_upd_work can be called before LOAD/STORE, it will
need to check both panthor_job_status and panthor_syncobj_64b.  That
will be a bit ugly as well.
