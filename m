Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A190838F81
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395910E32E;
	Tue, 23 Jan 2024 13:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E010E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:12:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 04F0B61DC8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E34C43601
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706015533;
 bh=ueru+mw1cE0XRlZEGPUaiKo7r27Ceou9vCB7MrFSjAE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gGu8sojmykuWlHHtnhyPY+0ZtEO+PukTGSgIo6Dz3zo9o2W6lzcCxz/tJArjxiLqk
 w8CGzYTNVmRd0v45K0Pn1bx4rSk5w3Xmw1+TVlWlDX57f5o7dpeCPAr8CnUCKGB9i+
 6w90I3r/AQp/G3hdWsQ6tN72nvOy5PRItQ8Oo/purfPQ5Ktuz5Zi7lts+g0sgjBQ0e
 EYhWgFp5iMmd5PxMknCsTDOd/fsXhw/nB8oAbZElYi5ZpG6ZSfEk5gcdrU9omBbguB
 kwC0JO+2s8cqjvqgKkGZHf5gNp2xXKHCKpIC7hhXE76vt8x37o0CcOjZyrpeqzO2WJ
 eRSCE5r4CtCSw==
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40e76109cdeso48227885e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 05:12:13 -0800 (PST)
X-Gm-Message-State: AOJu0YzmKS2uU8L28HPES38CrEEPNaDHXu1QzDLirkHsu9O9MFMqBwTF
 +xFOaQV2EeisF62Ooxqd++0fF3IyaExGGB+r16/L5VuNCYslcHgmTMpO3V668u36KPGav6M4s0S
 zGuab1o54HYCVlifXJXUWgQhLpNI=
X-Google-Smtp-Source: AGHT+IEqHaafUVaYlL/dBnjdbyP0fljln5ORzbWGDdirMJ4HGsgSzWIh9KlIGx7RsG6VnsKDDs8KO4xQIApwjVc5wqo=
X-Received: by 2002:a05:600c:538e:b0:40e:6d7a:f9dd with SMTP id
 hg14-20020a05600c538e00b0040e6d7af9ddmr138840wmb.47.1706015532072; Tue, 23
 Jan 2024 05:12:12 -0800 (PST)
MIME-Version: 1.0
References: <20240123120937.27736-1-tzimmermann@suse.de>
In-Reply-To: <20240123120937.27736-1-tzimmermann@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Jan 2024 21:12:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6z1mNqbyq-0ZhgkVgWXf-WK+XAxG8hTREhaM_R3J+s3g@mail.gmail.com>
Message-ID: <CAAhV-H6z1mNqbyq-0ZhgkVgWXf-WK+XAxG8hTREhaM_R3J+s3g@mail.gmail.com>
Subject: Re: [PATCH] Revert "drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync"
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm very sorry to hear that, If Jaak can respond, I think I can find
the root cause and fix that...

Huacai

On Tue, Jan 23, 2024 at 8:09=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> This reverts commit 60aebc9559492cea6a9625f514a8041717e3a2e4.
>
> Commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
> device_initcall to subsys_initcall_sync") messes up initialization order
> of the graphics drivers and leads to blank displays on some systems. So
> revert the commit.
>
> To make the display drivers fully independent from initialization
> order requires to track framebuffer memory by device and independently
> from the loaded drivers. The kernel currently lacks the infrastructure
> to do so.
>
> Reported-by: Jaak Ristioja <jaak@ristioja.ee>
> Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomai=
n/T/#t
> Reported-by: Huacai Chen <chenhuacai@loongson.cn>
> Closes: https://lore.kernel.org/dri-devel/20231108024613.2898921-1-chenhu=
acai@loongson.cn/
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10133
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/firmware/sysfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 82fcfd29bc4d2..3c197db42c9d9 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -128,4 +128,4 @@ static __init int sysfb_init(void)
>  }
>
>  /* must execute after PCI subsystem for EFI quirks */
> -subsys_initcall_sync(sysfb_init);
> +device_initcall(sysfb_init);
> --
> 2.43.0
>
