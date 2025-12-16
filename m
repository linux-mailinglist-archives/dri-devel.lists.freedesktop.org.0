Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0692CC0ABB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 04:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2455C10E621;
	Tue, 16 Dec 2025 03:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kmr+nmv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FFC10E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 03:03:35 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso788282466b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765854213; x=1766459013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCsYpP4kG57ll11sX6pA37ofQFrcZscIKNKIIFf6+7U=;
 b=kmr+nmv51VCoENgGN1PYBJmoDGhK0WNC2XSbw63pquLkronVbdNQGPPjoIqBqkN0hM
 td7+054MPUIW7KFGxBNoZJbpHHppUz1PB2RM+lsVSTdUsioHbIKkF+tSFsHn8jjQbSLy
 nTMIaEA6NYazExDwotBIBA9j4klkIciX3ul2LpiFr/WlDQqoR/NCpPPCECkmY7D/kURd
 T2vgO88eg0npi7PwYQ+k+EpSCCTZyWSUduRYc43wwTI4SCL0S90CVb/pEnz/3EsqRw0Q
 nq9W4ad+fdrBcfrVgtJY7ttgwZp017tqoZYdaIXavCPaZ3mZ52NQFlTSNQvaq1Dz7eck
 juDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765854213; x=1766459013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vCsYpP4kG57ll11sX6pA37ofQFrcZscIKNKIIFf6+7U=;
 b=UPekIO/EDE564WLMoDpgKAKEYlPAHiK7fEuazuPhH+ce4SL7lo7s9ztmlREJjxKSMT
 hHOn0V6i3yQl2PQ7lY5wQC9XTLdPYxh/C15IdEYfyos+aYAuJOktJZrGVkwRrlT83JHf
 kyaMRqiNIuje34q+Qqresk074uIQwfvVm2wLgSQWcOmII44hM+X+/kPyAqECFTzVqoBq
 7eIWSDn5IEhwccEuIIIuAV4Of/k+akbePuwpFzVEmZa/5ufsuOGmD1z+lnrIJh4sOikQ
 pJBHxGryj5UDnH8KgGK4+dU7OV72r2PvTa1c2neYcK206MnjqzbnI8/kunlK5ebKynPC
 jiEw==
X-Gm-Message-State: AOJu0YxVppjcBPnkhaZ0mFCy240Q0mLrV7mT4mnWe7xVCQtV8B6G426A
 mgDlWSNf6WHYfBOxCBqFCV2FpXWe9K1HdJpzsrdeLJ3hmwLPmrgMcbSShMKHKTh1nSxJ3hR/VaN
 UFlf3e4+TNS0eE2DeTDnVlrLFIwRWMO4=
X-Gm-Gg: AY/fxX44t8Buhug8/qfDSF/tJyQBhENL4eVathgoA0tPz9nbTM23z0qqjEj0c/mET5q
 Ae4lylI2gozpRa/jGbe8RG8y3Er9cSfFmamBJ068Ycv56LKA+ZD5pGNUbZ29R+Mlx2GjJNcezzo
 CWV7ayhmDO15Si4PngrsIBdRtTcXt3Ah74fYlBfq8Yb0DBeM3XKXI/TkC1EE2al/jTVO92NoOJV
 eiOwHQUyhmwK6knKZlUFAeHrGdhBTc8GaNbm4pJyVu4Lo00ZD3nXGeNo9/C8vUC48uLJfIB
X-Google-Smtp-Source: AGHT+IHi78t43mdDJwWUQLX5294p4FXlpYBzrWdjP3wVNK8yi2OvPo+22UY7uYARNOiXVqBhUWaPnGfElHZWs/Pl6hQ=
X-Received: by 2002:a17:907:3c91:b0:b73:32c7:6e6a with SMTP id
 a640c23a62f3a-b7d23665a3emr1246788866b.25.1765854212905; Mon, 15 Dec 2025
 19:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
 <20251215150807.58819-21-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251215150807.58819-21-tvrtko.ursulin@igalia.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 16 Dec 2025 11:03:19 +0800
X-Gm-Features: AQt7F2qp7kXjU0BkBzroysuOZQ6ms4OfftVAxdLTz1keITVqgV7U-l8_XxQ7ekQ
Message-ID: <CAKGbVbtziYenWBOHQA+BJMS_1suM-CQMF8i=gpA83he_iKYFZg@mail.gmail.com>
Subject: Re: [PATCH v4 20/28] drm/lima: Remove drm_sched_init_args->num_rqs
 usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.or, 
 intel-xe@lists.freedesktop.org, kernel-dev@igalia.com, 
 lima@lists.freedesktop.org
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

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Mon, Dec 15, 2025 at 11:08=E2=80=AFPM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: lima@lists.freedesktop.org
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 9a1e6b9ecbe5..0a01213c4878 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -521,7 +521,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe=
, const char *name)
>                                lima_sched_timeout_ms : 10000;
>         const struct drm_sched_init_args args =3D {
>                 .ops =3D &lima_sched_ops,
> -               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
>                 .credit_limit =3D 1,
>                 .hang_limit =3D lima_job_hang_limit,
>                 .timeout =3D msecs_to_jiffies(timeout),
> --
> 2.51.1
>
