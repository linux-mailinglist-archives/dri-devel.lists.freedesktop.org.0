Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9894C5808AB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 02:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7345E10E8C7;
	Tue, 26 Jul 2022 00:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32810EA14
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 00:12:39 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id j195so3456291ybj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 17:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9JSe3z9pGkzgL7xUiS8Yr/5UR7RYsGogFav7UDOeLH8=;
 b=E1wN9qXuZl7RNgnoeAdISeng0a2iXHtFQZCmOLLF1QHOR0tb0+irVqrji81HMAKTR3
 Rf8ApMLfd8zkYF+aepDEdAv42XMa3vj3isKbVJZqTnehX1P4HkgsVpBv6hKvWZcAEwBm
 Hl/H3J8Zm5ZW7dzJWQgoJ0S5qJCXEChcqnMyQFG6592BeeXaA1AxEB9dzoqdP3r7L/qa
 ovddjUVMA0LEMQeWNStbGGJTImVO2Iov35ysqKIjAekEQh3d47Xbg86FEkAIRKnAabQz
 pFzc7m+e5mhq8CoZJp9ccOTpUOgJ14j4Jpk0nIy9jdgFkK4kRvCLbRnSd/3qywUdGYbA
 CxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9JSe3z9pGkzgL7xUiS8Yr/5UR7RYsGogFav7UDOeLH8=;
 b=iGZ2zDQR6jXjqMU1UdSjEGSU+RewqVZuIzKpF+4ygtxVRVWhHAGbiQL/LeRiiIjErB
 ag8ZeBjt6eBkZ2xu9VYwY7An8qwUYuComBVnJTme4TOGT3MmDVDJpf3CFCtNou9L+RIb
 HNvT0RXOqmKmQ0Ub4ZW7GjFEHXFYpL/JQNLD6j55DZu1bGDXAItE+0gp2cmeJMFqEg6N
 7XEEt8Es55bQQPwVpGGYMZ9FgWx+Qt48y8EliF7YlJvqZTpxaD/9Wf4UJVF8L4na1THh
 useiIm4Zf5oKvHAIm0uZuuszh1MqM5mM2qv3gaUvZH+xkQ+nUEMKGjA21x9Uy8xtm5ba
 qXMw==
X-Gm-Message-State: AJIora8dvTp+jQXtsunFo1lgqmCWMqPuf4LV4bsmejRFInrwdYyBFBbq
 5X1M61wGxoG1OU9FjckgGMKod6nzmJGb+tmIkvOYTw==
X-Google-Smtp-Source: AGRyM1vo0SJOssrzz1Zhq2nhkvNWvbLvRZXEWuEx3ZdKz1ghxpU2Qk4orNgieYmRo5PCLyR7iBSsnqME2JzCqF08st8=
X-Received: by 2002:a5b:cc6:0:b0:66e:45c6:2a25 with SMTP id
 e6-20020a5b0cc6000000b0066e45c62a25mr11461206ybr.304.1658794358302; Mon, 25
 Jul 2022 17:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220725233629.223223-1-nathan@kernel.org>
In-Reply-To: <20220725233629.223223-1-nathan@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Jul 2022 17:12:02 -0700
Message-ID: <CABCJKuf1gYZZb9U-zwjkvvRUUh9GvYsHF=8zub=pr9tG4BqtkA@mail.gmail.com>
Subject: Re: [PATCH] drm/simpledrm: Fix return type of
 simpledrm_simple_display_pipe_mode_valid()
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>,
 Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 "# 3.4.x" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 4:37 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> When booting a kernel compiled with clang's CFI protection
> (CONFIG_CFI_CLANG), there is a CFI failure in
> drm_simple_kms_crtc_mode_valid() when trying to call
> simpledrm_simple_display_pipe_mode_valid() through ->mode_valid():
>
> [    0.322802] CFI failure (target: simpledrm_simple_display_pipe_mode_va=
lid+0x0/0x8):
> ...
> [    0.324928] Call trace:
> [    0.324969]  __ubsan_handle_cfi_check_fail+0x58/0x60
> [    0.325053]  __cfi_check_fail+0x3c/0x44
> [    0.325120]  __cfi_slowpath_diag+0x178/0x200
> [    0.325192]  drm_simple_kms_crtc_mode_valid+0x58/0x80
> [    0.325279]  __drm_helper_update_and_validate+0x31c/0x464
> ...
>
> The ->mode_valid() member in 'struct drm_simple_display_pipe_funcs'
> expects a return type of 'enum drm_mode_status', not 'int'. Correct it
> to fix the CFI failure.
>
> Cc: stable@vger.kernel.org
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1647
> Reported-by: Tomasz Pawe=C5=82 Gajc <tpgxyz@gmail.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simp=
ledrm.c
> index 768242a78e2b..5422363690e7 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -627,7 +627,7 @@ static const struct drm_connector_funcs simpledrm_con=
nector_funcs =3D {
>         .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
>  };
>
> -static int
> +static enum drm_mode_status
>  simpledrm_simple_display_pipe_mode_valid(struct drm_simple_display_pipe =
*pipe,
>                                     const struct drm_display_mode *mode)
>  {

Thanks for fixing this, Nathan! The patch looks correct to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
