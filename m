Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4997A7D2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 21:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A767610E3CD;
	Mon, 16 Sep 2024 19:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/0XT/uN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD0C10E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 19:33:30 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d87a57c06fso742034a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726515210; x=1727120010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdVG9kJTSsyd1MnLtlWcHTYmc5/C16VpC2Az70/1ZD8=;
 b=W/0XT/uNDlb/WNd4I3z3bDuBVqApbyAC46HQOJaBoWHjEdubUXYcP0RMv+u9myNWfI
 zPcFMEKGaHe47NSwDx4rbBue3MgJdFouyLkn+aKJ7Wp7mGmEuoZDFtp4aeERPkgnFvpN
 iMAL6ogcpOIbmEXOAnKURIOywxjTI0lIERVzuRYGm8b5dJDk7jvX9jIN0inX6fVIr0w2
 uE9frEuCVdhmQIRY9O22s7v73HdneRJsS42qy5M8ZXaq7cfvAL3Z9q+Myixo3Jl9JHdM
 p22X6Klrf38l74K7zpLgHPC9FNm/LBVvshzebWurqNACbDEiP4af4SGJhh10wIYqGSmJ
 tlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726515210; x=1727120010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdVG9kJTSsyd1MnLtlWcHTYmc5/C16VpC2Az70/1ZD8=;
 b=Mo2s69X5b87kb/7UopeL0laE7gXyibBzeTuiw8PBHuFpNzNUpj8JTfeCY8xv3tfQbl
 eabIKF7hCIcL308mvB8I46HgbdzzvO15bmJ6IMHLVvE2i55wSmiXWZj6FMzeb42HcWX8
 qCg6Y3MZNao73syQhTTp9aP9fGO2OVlnDjm6YfgRujv/OJWGsyxwAnh37b2W/CF8z3DL
 BlKSlHxS/6PLt38Tt9Cp24wmZsghPn3jJxN9lKf1E8Y9PGTgiyo85+X+EoAv19M8mcqX
 QfRDsDAzh1FDlGueqVz8r/N7K9UVlrJxeW9EEYUgNhHA+VZgRCijP6uTJRhH3UxJzX8G
 EcIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXewHFzIrpzJTNczpj36QmSACiizC9pmHAel2OoSeYVlX7+wXXJ1uVjbnqz27Hsis32uBIiEh+A3bM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2cMfosKRevXkoYhCnDJltZb8AYs7u0re3M/Ul3tqECi0zv1U8
 6NcqDKJ3dkpTZeVLMNzKP9tQkg1CQcJ8Eejvayg89dZkzHUjWe5dxGSxMPMIuzPAPIA6UJ1U0Sb
 XMOI4ISMkzUe580LTkqT7Suyu4Zo=
X-Google-Smtp-Source: AGHT+IFzWHeK/CLww1PcQw75RJhh602iYNqoaAB2CiAxnBOicoHCFayY9htxMAkWxH1CAEhSBqhWoWtWto6/rDgJ5tg=
X-Received: by 2002:a17:90a:d806:b0:2d8:8254:b913 with SMTP id
 98e67ed59e1d1-2dba0014995mr8218624a91.4.1726515209726; Mon, 16 Sep 2024
 12:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240916185159.35727-3-pstanner@redhat.com>
In-Reply-To: <20240916185159.35727-3-pstanner@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Sep 2024 15:33:17 -0400
Message-ID: <CADnq5_N6dMAm0525Hqpq+yKFDRLfky0Ybu_78DZgYHYvjQu_Gw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: drm/sched: Add new maintainers
To: Philipp Stanner <pstanner@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
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

On Mon, Sep 16, 2024 at 3:03=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> DRM's GPU scheduler is arguably in need of more intensive maintenance.
> Danilo and Philipp volunteer to help with the maintainership.
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10430778c998..fc2d8bf3ee74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7710,6 +7710,8 @@ F:        drivers/gpu/drm/xlnx/
>  DRM GPU SCHEDULER
>  M:     Luben Tuikov <ltuikov89@gmail.com>
>  M:     Matthew Brost <matthew.brost@intel.com>
> +M:     Danilo Krummrich <dakr@kernel.org>
> +M:     Philipp Stanner <pstanner@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
> --
> 2.46.0
>
