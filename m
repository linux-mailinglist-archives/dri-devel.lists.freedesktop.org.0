Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D89956D86
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7CE88EA1;
	Mon, 19 Aug 2024 14:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QFBlFKwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98910E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:40:29 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-81f94ce22f2so166191439f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724078429; x=1724683229;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=301FMW/n8JCFLWqbQJAnkAFXSG75rqD9oikm5QQuftM=;
 b=QFBlFKwuOQL2jdB+3nAxAdNpFBnUlriuszrVZBdAbgwyVOkOwo8Ww6c6JaqX4epXFK
 odVknDWKIm68c+jqwUnmoAYHUXbqP7u4ZpBntcfCuHyJgtvbxfGzJp1Ns6UG6SJhZ1kl
 ofY6JRn3AfHFT0Dn3tTCkpT61HA3E6FTmbywQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724078429; x=1724683229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=301FMW/n8JCFLWqbQJAnkAFXSG75rqD9oikm5QQuftM=;
 b=ay9Ty6cOkIcKMKJl6CKymghyCnX+mPsZL4StWrhg5k8gn2NU+A8khHD1bPjHz2n/Fu
 W5GFMqlwwIOXV7n2Ig6ycKdOUXZcNCUUxsDMwtSfLXCkmaA7LqWSSsSydjJD3tgG20zj
 EXloSGQNJztH6VaNzWTTqS3fyh7U2SNmrK1DA6MbOfKDMNjlSQLPZI78pRRX+5SMrHy+
 bckBCvXdW80KEyo5cJP+MJiS4wRS3qU4CE/Ztlhz4orX8DmmqrCvb2+9gRlDPC3XGSMh
 REcuTKLHI7edwSUDVrdEEfnJx+0Qe5brKZ26n0jv71is+k6wdna/BcjVQmTG7LW5bswI
 DGNw==
X-Gm-Message-State: AOJu0YzOLAbtEuqR6j5O5/57RAjE5twEsKiUPk+8yXTQhIh6yyDvUSRb
 fQdZQpiCV1xZqlsXtoDZErdlidDY8C7NhgmQs80l+Ecejc6JGiz7PI965Xy/jeKMaO2GxTv9l7u
 /MWcnZ3oNFg6JpwShlFMF2RGSLdrMYQSqcjhluEsOdlJi4nwhHpHhtXA=
X-Google-Smtp-Source: AGHT+IEXLJKV2GkV8QrWz+628JPxbASh3dQ34W7YFKbZ3OLCXemSsQEkKKbqc8EhwpLFOIkk8V/6Y06OmBaWyekpQHg=
X-Received: by 2002:a05:6602:27d3:b0:81f:880d:ec18 with SMTP id
 ca18e2360f4ac-824fe1a078fmr1263355939f.3.1724078429124; Mon, 19 Aug 2024
 07:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
In-Reply-To: <20240816183332.31961-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 19 Aug 2024 17:40:17 +0300
Message-ID: <CAKLwHdW8Fz1AAojsk+QAeJLb2goRLLTC=VjSeXkSFGihNqG86g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Various prime/dumb buffer fixes
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
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

Still LGTM.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Fri, Aug 16, 2024 at 9:33=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> This is the same series I've sent out earlier but with one extra patch,
> that fixes the dumb buffer coherency on low mem systems.
>
> The second patch has also been updated to not use math functions.
>
> Zack Rusin (3):
>   drm/vmwgfx: Prevent unmapping active read buffers
>   drm/vmwgfx: Fix prime with external buffers
>   drm/vmwgfx: Disable coherent dumb buffers without 3d
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c    | 114 +++++++++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  13 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |   3 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |  12 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   6 +-
>  6 files changed, 136 insertions(+), 16 deletions(-)
>
> --
> 2.43.0
>
