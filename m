Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BC898848
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D017211B5CC;
	Thu,  4 Apr 2024 12:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ML5LsS6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A40E11B5D1;
 Thu,  4 Apr 2024 12:52:00 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a4a387ff7acso119918466b.2; 
 Thu, 04 Apr 2024 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712235118; x=1712839918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnnhlpaHNCUCIrrWDg/RL2L2v9aF/5YKbhFHqy0aII8=;
 b=ML5LsS6EY8X1x7snPJaeBc4qLKW/fF1zB/exdpCC5dFP9jhBoMFVeQeVvf/A3RxmFd
 bMrPBYL+VuaS2T7PGUm2yyDAeBlhJKO5PHfzZmOn2oZrmqvnge1dcWeV2U3q4IXJ6/OU
 aALAf+vg505PoNuo9TYjxYBc0PcTh+aI/l92lDtZGsmCVNl0LjhsWuI2GGHdTxn0yQYD
 CwZFl97TlyituEvcxQWrR+bg+67Zzkh57qzgou5qawRCh6EI64cNVIMXwBNPABDOPAwf
 c1Qjk27X9PzV1fIXFIX0+WFBjUXIugyLaY/U96k086oAH5LPvNUBwkWZ75ONIHGH4d7o
 jnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712235118; x=1712839918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnnhlpaHNCUCIrrWDg/RL2L2v9aF/5YKbhFHqy0aII8=;
 b=tV+cY8ZUPye2F8usPsK1K8VQjeqQZobrzwQb3tTaVtjlVH8K1G12b2yChvTsJE412k
 OjXnxo4DJLkNVIoeZMtNXI8six6p347pEI6r9+QgVxyDW2Cf2D9/jNoXpeN1DBjdhQrF
 EhVrIG735VmXsaqQNJRQmKt05LaoEoCsQbkj021WbGChg5dbmj++3H4HFPJImsZBIUaf
 HuzUuvpwgldifagcsfMvZuuCaMVwGTIJlExFVhwgwdZClJr80/BYeVyDUtQLaSiU6JTQ
 MxKXqhPbOTYTCZ7pvzncCR/xTJtoPoIYSjIXHg6ftNr7iGslAFjLXdgjcVSccvlDAC1l
 mLqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDZWRQX8+fEkt3R/28m7Rlxe14L4hrEqtbIp4IEJqPwR7TU7HXFCSksEQ+Q25TM1LAeZA7LcquWeHASo3oo4ApLSDwEIFfXNha9uYuU76vZF93VZYasJUbGmttaW9CewvAD9kkFCbYMJiYfw==
X-Gm-Message-State: AOJu0YyXUvcNpEveRS9cKIKQ900KdixuuxYVkGgD2p1JyE39RoOl12+5
 mkWKQ4T1PUnz2xe8feqGdk7ub0gsS71wcyuDqY3grhdUyFyeEBz0jjkiZGtwIR8UDO02jZOTCC9
 3gCIKVF3e1V4Plou/xGpuKFlE2+Q=
X-Google-Smtp-Source: AGHT+IEAbu57T3CEw3mRcXuQKUKAbPMz0MmW5SuVqjvtMKR/CDDjvR12TFadTmieeFLw/af6A9WId94r6dBGaIvl5w8=
X-Received: by 2002:a17:906:3a81:b0:a46:3ce4:5acb with SMTP id
 y1-20020a1709063a8100b00a463ce45acbmr1583695ejd.75.1712235118422; Thu, 04 Apr
 2024 05:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240401224329.1228468-1-nunes.erico@gmail.com>
In-Reply-To: <20240401224329.1228468-1-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 4 Apr 2024 20:51:46 +0800
Message-ID: <CAKGbVbuvX3qN-0LU9Sj4dWxCY3CoLnj+wcSKx2=D1-K0Qn8WpA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/lima: two driver cleanups
To: Erico Nunes <nunes.erico@gmail.com>
Cc: anarsoul@gmail.com, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
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

Serial is Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Tue, Apr 2, 2024 at 6:43=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com> =
wrote:
>
> Patch 1 is a fix for a crash which triggers on removing the module on
> kernels with CONFIG_DEBUG_SHIRQ enabled, such as the Fedora kernel.
>
> Patch 2 is a fix to this warning:
>   drivers/gpu/drm/lima/lima_drv.c:387:13: error: cast to smaller integer
>   type 'enum lima_gpu_id' from 'const void *'
>   [-Werror,-Wvoid-pointer-to-enum-cast]
> which we have received as a repeated report from the kernel test bot to
> the lima mailing list.
> The warning only reproduces with recent clang on aarch64, but the patch
> does get rid of it and there seem to be no more warnings for W=3D1.
>
> Erico Nunes (2):
>   drm/lima: fix shared irq handling on driver remove
>   drm/lima: fix void pointer to enum lima_gpu_id cast warning
>
>  drivers/gpu/drm/lima/lima_drv.c | 21 ++++++++++++++++++---
>  drivers/gpu/drm/lima/lima_drv.h |  5 +++++
>  drivers/gpu/drm/lima/lima_gp.c  |  2 ++
>  drivers/gpu/drm/lima/lima_mmu.c |  5 +++++
>  drivers/gpu/drm/lima/lima_pp.c  |  4 ++++
>  5 files changed, 34 insertions(+), 3 deletions(-)
>
> --
> 2.44.0
>
