Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FF8D4E7A
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 16:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46AC10E5D1;
	Thu, 30 May 2024 14:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OyOXMKcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CD010E0B8;
 Thu, 30 May 2024 14:58:11 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70222db9bf1so902904b3a.0; 
 Thu, 30 May 2024 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717081090; x=1717685890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pcneh6OdbXB2yw8eBub3uBTS5tn1ef9zWgBOmoSp/pE=;
 b=OyOXMKcWCuzXbIf2O4yquLPo24/YaVoBtRYTuOHqIL1MsTmbPCKiM5p/4rpnMajU8D
 YuoPNNjaB8b6zxMsz/tuF/X7ZSdvQ1ymXIjB+0wGN7gqjyEc0r0e8JG/GutZRtvOsf1V
 UhlBVwFruF7QcV5BBmTbZx0kAZdmw8OaBNUrvsqMlfpxmm00TdyjzAdRjiZmMU1jb1Qa
 9RTFqdCsnoaoGMIFw6zDRgnDd5oKTyJfVLwfhGTH4acdPOJWan3of+oQFWThDpLQnTEk
 QN4Hi82EO4yDdY7JXgcFrMjLU4Ic73HzMC/14AKCHedCfRTzF3vsrmzzRGF7aOpsag4+
 rjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717081090; x=1717685890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pcneh6OdbXB2yw8eBub3uBTS5tn1ef9zWgBOmoSp/pE=;
 b=maHA84/z7GL93qZ0F0ZEzUAqwNz7TqPIzWI8p/Rwqg6vAQKoPU7ZSdNzB3L81s6l1O
 jBKy5sST7qTLSWlP9FIKhAZmlyaL+vhe4lEWwsMEjTA18iUqu9eDYgo0rNhJZdd7Oda2
 jJzHjJLGpx4Zo9GKAyRuetUAoRM7d9F+hW2CB23TYJIT08qJsOjQKgSR282tvsPNAJg6
 eqv9BZW4SCH1E7wAOF3Ccl5nZT0J2OruH21eEZQrTnrGQnK1ms3pLTfbgAOKyjjN6ZMJ
 1wdE9ht4bsL/+a7dkaCHEOldImrBb6iX4RC0IG6pRNap0fxDwakuNx2oyVqzg+28zumZ
 Q1Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6mxAzky66cl7c0Lap13zYAaaRrtYm1PEWmnUrEImXDPeR+lMgc5pyjG2g1bzcqMGStUymAclI9fS9OYz2aUEOt87dZ+6zI/vQ1FJDVkakIRTEBVcxwyncL2Tuo+QUCYOBId7+rQ3fcZqpTVCJMQ==
X-Gm-Message-State: AOJu0Yz6X9m0du27QGi63zzjMqcnjPJos4+qAgZoKaHs5L3cPb2n1o0+
 Klq4/CIa4LrbRb8JQqj0Omcr1pY3t/b9ByS4niK7/8hx76v2ZrAxVzh6NouHMqqFYIo19+FW1gD
 NNuWGgkj/y/y190UGo671pcbUEo4=
X-Google-Smtp-Source: AGHT+IG/K9bjenhk0+Nldu2e8TDBOCESyblInvnkPhmih6+zxEhLkPmDFwz2LvGoFVaBBs/bIA3IpcKiiLGStFQRrDc=
X-Received: by 2002:a05:6a00:4214:b0:6ed:60a4:6d9c with SMTP id
 d2e1a72fcca58-702310e53cdmr2970675b3a.4.1717081090330; Thu, 30 May 2024
 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-drop-counted-by-radeon-states-state-array-v1-1-5cdc1fb29be7@kernel.org>
In-Reply-To: <20240529-drop-counted-by-radeon-states-state-array-v1-1-5cdc1fb29be7@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 May 2024 10:57:58 -0400
Message-ID: <CADnq5_P5Mz=Acm0HURUUHu03eBmemcu7jYe8nYJ5WtBjb93Qgg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Remove __counted_by from StateArray.states[]
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
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

Applied.  Thanks!

On Wed, May 29, 2024 at 5:54=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> From: Bill Wendling <morbo@google.com>
>
> Work for __counted_by on generic pointers in structures (not just
> flexible array members) has started landing in Clang 19 (current tip of
> tree). During the development of this feature, a restriction was added
> to __counted_by to prevent the flexible array member's element type from
> including a flexible array member itself such as:
>
>   struct foo {
>     int count;
>     char buf[];
>   };
>
>   struct bar {
>     int count;
>     struct foo data[] __counted_by(count);
>   };
>
> because the size of data cannot be calculated with the standard array
> size formula:
>
>   sizeof(struct foo) * count
>
> This restriction was downgraded to a warning but due to CONFIG_WERROR,
> it can still break the build. The application of __counted_by on the
> states member of 'struct _StateArray' triggers this restriction,
> resulting in:
>
>   drivers/gpu/drm/radeon/pptable.h:442:5: error: 'counted_by' should not =
be applied to an array with element of unknown size because 'ATOM_PPLIB_STA=
TE_V2' (aka 'struct _ATOM_PPLIB_STATE_V2') is a struct type with a flexible=
 array member. This will be an error in a future compiler version [-Werror,=
-Wbounds-safety-counted-by-elt-type-unknown-size]
>     442 |     ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
>
> Remove this use of __counted_by to fix the warning/error. However,
> rather than remove it altogether, leave it commented, as it may be
> possible to support this in future compiler releases.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2028
> Fixes: efade6fe50e7 ("drm/radeon: silence UBSAN warning (v3)")
> Signed-off-by: Bill Wendling <morbo@google.com>
> Co-developed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/radeon/pptable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pp=
table.h
> index b7f22597ee95..969a8fb0ee9e 100644
> --- a/drivers/gpu/drm/radeon/pptable.h
> +++ b/drivers/gpu/drm/radeon/pptable.h
> @@ -439,7 +439,7 @@ typedef struct _StateArray{
>      //how many states we have
>      UCHAR ucNumEntries;
>
> -    ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
> +    ATOM_PPLIB_STATE_V2 states[] /* __counted_by(ucNumEntries) */;
>  }StateArray;
>
>
>
> ---
> base-commit: e64e8f7c178e5228e0b2dbb504b9dc75953a319f
> change-id: 20240529-drop-counted-by-radeon-states-state-array-01936ded4c1=
8
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
