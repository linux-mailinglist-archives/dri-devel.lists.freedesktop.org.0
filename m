Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273288CB611
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 00:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D6510F159;
	Tue, 21 May 2024 22:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="b2EWdtw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67E610F159
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 22:41:43 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-61e04fcf813so2168077b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 15:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716331302; x=1716936102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6Mpck0RGojeaLZXzpvpltg44SWf27C8Fn+3pNrIhfw=;
 b=b2EWdtw8bprt+2hpN9BAbMaezTn482sSM2Ev8D11a1Nv353HhGpUcO1jYp6Rv4Xkuy
 ZZbI1M1QsCxqJqHe/1zliljaHdueR+jx8+M0bR6vyDRM74IAxOG2S1gRDOsNbzXFiI29
 4aPkYxKzJ7xh12eI2I33RWxcZQpj5DyIRlKjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716331302; x=1716936102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6Mpck0RGojeaLZXzpvpltg44SWf27C8Fn+3pNrIhfw=;
 b=UHRo7RDLA4naCtEJ+6ftSemePHR5poA+dLQUhVSya7m/HePr2KZszwZp0E0Bcotexr
 c0r7xkKhFmv796vBpONTxgrsmufKFUosC4sUfwfx/YiLeHmA0QphQgOpS5jPUSK6wtUV
 ZxtrxxFZg4idwNd8KrXxyNEUEa6BkZ5s1vDHq0opBbZSbZ1mUH54tgHrr+dF0Y1SFxGD
 9bcVvnk+SMutOn3fiOxuz99DMLR1kpersKE1kUv/mjgdGacEqezS8drBpAzNDHjoFVjT
 yXR+7VgZvJcGtOm6hdxPY7p8eVf/ctHtDrfvvkClQZ/83KhslktjNyIrFRCxUs0mHZKO
 D+ZA==
X-Gm-Message-State: AOJu0YwVTXEKVpawFYCBalLSw6B4mMpGtFJvV9FG3PQGuVpA8QUD5pmJ
 vX2ap75VlfbiPEHzYSPUhL/5Lhw83JT3huYxNM5cNnUoGzLzlDT8OPiXqx6avRpRtW95w6wov1E
 NOzNVC/yNqnm0b+ZCoEsA6zv3f/xn+du8QZGg
X-Google-Smtp-Source: AGHT+IGeFpoW5qwZInZo/kwsp71ne4tNSItShyqOIjCLOqg+0qkWkwz2ZCwUxpfQ/q0pFZomXSg+f/5Mff7kkesI0g8=
X-Received: by 2002:a0d:d516:0:b0:627:de8e:c951 with SMTP id
 00721157ae682-627e46b21a6mr5328587b3.12.1716331302473; Tue, 21 May 2024
 15:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240521184720.767-1-ian.forbes@broadcom.com>
In-Reply-To: <20240521184720.767-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 21 May 2024 18:41:31 -0400
Message-ID: <CABQX2QOHO=Lifjpsijqv0t39McoRRzv9XhgYLtmkOJGqnuv_6Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix memory limits for STDU
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Tue, May 21, 2024 at 2:47=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Fixes a bug where modes that are too large for the device are exposed
> and set causing a black screen on boot.
>
> v2: Fixed llvmpipe over-alignment bug.
> v3: Fix comment formatting.
>
> Ian Forbes (4):
>   drm/vmwgfx: Filter modes which exceed graphics memory
>   drm/vmwgfx: 3D disabled should not effect STDU memory limits
>   drm/vmwgfx: Remove STDU logic from generic mode_valid function
>   drm/vmwgfx: Standardize use of kibibytes when logging
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 19 +++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  3 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 26 ++++-------
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 45 ++++++++++++++++++-
>  5 files changed, 60 insertions(+), 37 deletions(-)

Looks great. For the series:
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
