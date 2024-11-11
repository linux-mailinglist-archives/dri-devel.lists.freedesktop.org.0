Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1F9C4593
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 20:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BA110E1FC;
	Mon, 11 Nov 2024 19:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBNOLVK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882BA10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 19:07:02 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-288642376bcso2496517fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 11:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731352022; x=1731956822; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vo9ePyR6Ot09Yjlr2LvTjC+iZ3PY9fYIt8EGdZbRUZU=;
 b=YBNOLVK4kiMCidf7EYW/xR/soZvrAON561lNmh8SoEIUJVbXxuBeMw2zWjG1VmpBt7
 7N2KCgikLChLLsYjtrdRB0/tjQVtsJZItl7yMCg7v6azAfJ3/wpDkmRNGsdisJvGAUJR
 wd2HLwwjexx1AUfhqRUs0l8T2wKiQ1vy1NqSfeZzX9mwZkoTr4EK5vQtPydCxOj5yIDL
 KHj+OVVrIgoD+CHzTotlVxdW4Be5egqweE/ryNlej2dMnFNzUQhXtpw7h3ksABRuhgo1
 43HcSRp0HU/9nNKds3w8Cvqv603jLyULI96MBiPkw4legMJnsKLVXDFvddOM9BzrOmtK
 qd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731352022; x=1731956822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vo9ePyR6Ot09Yjlr2LvTjC+iZ3PY9fYIt8EGdZbRUZU=;
 b=Jg2aYSiUGj/8m2vDewSI9jFmbQ6Szfd1tNhNvlQCRpS/QufXP+hILxDAVEUK6PXGc+
 KUIdT0Pnkx6rQVG40rlwJlGnCgktvkKr/I2G8JB7IscaCTx3OzRVBHYpFBUwAN+zNOat
 pX76wItqfFKS8Hjc+vqsIhSaENPAWBMSSDFK0oqd31cxHmUKyU6PhEmhzDzwh7si/ZCu
 TGVl6wHighg+PXDPZNGRo2q8y7XthMOu3lH6r4okYDfCactlGEVyqjHahFARfwFwki8Z
 b6iIR9G21cckLH7JVnstTWcGtxZct5TjmHv+5vLWhwz41iFSKVTZq6WbcmIgL68eD0dG
 REGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV05zOcn+tqZ3yX/ku9Gse3/xqdKTDBrG5YC29xQE4TgqqU9+vjlR8io5aJWE2uPTtmgDaiKMwKI4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyicU0Pl6yCu2VApC5uMS6em9hLj+WhL+oSZ7VdxqvzQ+adX2Pl
 kzxDxYLxpSvz2dJTgp5QscBLAhc4SabnTVGex5WFFH/ehtvZ7VvVajDnUqzad3MZrArU1JTwxKt
 0/IdOB6FW6xcV88sEtbmtWUmB83w=
X-Google-Smtp-Source: AGHT+IHNz7h0rKW0ZnD8D7ZqImNKGrw5zHKgpdLofUL1aSmit5upPyP7Y1Al4PLK5KsS0IUC3otBBKQhYNU2td9nXFg=
X-Received: by 2002:a05:6870:e6c4:b0:288:2b44:5577 with SMTP id
 586e51a60fabf-2956008f6dfmr9815183fac.18.1731352021702; Mon, 11 Nov 2024
 11:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <c392b606-e2a4-4644-9ce6-217fdcabfdeb@suse.de>
In-Reply-To: <c392b606-e2a4-4644-9ce6-217fdcabfdeb@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 11 Nov 2024 19:06:51 +0000
Message-ID: <CAEXMXLRDDC+PB7S9VtqyMr1MUPPb7NYngwu4gcn9-K2kyHm3rQ@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000003c21d90626a7ceb6"
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

--0000000000003c21d90626a7ceb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024, 14:37 Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>
>
> Am 11.11.24 um 14:42 schrieb Nuno Gon=C3=A7alves:
> > On Mon, Nov 11, 2024 at 1:22=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de>
> wrote:
> >> The patch in question changes the whole memory management of the
> >> affected code. It's also noteworthy that most of it has been reworked
> >> for the upcoming v6.12. Maybe this already fixed the problem. Kernel
> >> v6.11-rc7 added commit 5a498d4d06d6 ("drm/fbdev-dma: Only install
> >> deferred I/O if necessary"), which possibly fixes the problem as well.
> >>
> >> But there's no explicit fix for this problem and I have not seen any
> >> other related reports. Any further information is welcome.
> > Issue was present since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and
> > tested until 6.12-rc3.
> > Is there any suggestion on how to dig down?
>
> Do you have a stack trace of this problem?
>

No. I need to build kernel with debug?



> Which hardware platform is affected?
>

ARM64 with ili9225 and display size 220, 176. It also
happens in another board with a different tinydrm driver and size 320,
240.

--0000000000003c21d90626a7ceb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><br><div class=3D"gmail_quote=
" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 2024, =
14:37 Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmerm=
ann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br>
<br>
<br>
Am 11.11.24 um 14:42 schrieb Nuno Gon=C3=A7alves:<br>
&gt; On Mon, Nov 11, 2024 at 1:22=E2=80=AFPM Thomas Zimmermann &lt;<a href=
=3D"mailto:tzimmermann@suse.de" target=3D"_blank" rel=3D"noreferrer">tzimme=
rmann@suse.de</a>&gt; wrote:<br>
&gt;&gt; The patch in question changes the whole memory management of the<b=
r>
&gt;&gt; affected code. It&#39;s also noteworthy that most of it has been r=
eworked<br>
&gt;&gt; for the upcoming v6.12. Maybe this already fixed the problem. Kern=
el<br>
&gt;&gt; v6.11-rc7 added commit 5a498d4d06d6 (&quot;drm/fbdev-dma: Only ins=
tall<br>
&gt;&gt; deferred I/O if necessary&quot;), which possibly fixes the problem=
 as well.<br>
&gt;&gt;<br>
&gt;&gt; But there&#39;s no explicit fix for this problem and I have not se=
en any<br>
&gt;&gt; other related reports. Any further information is welcome.<br>
&gt; Issue was present since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and<b=
r>
&gt; tested until 6.12-rc3.<br>
&gt; Is there any suggestion on how to dig down?<br>
<br>
Do you have a stack trace of this problem?<br></blockquote></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">No. I need to build kernel with debug=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div class=
=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Which hardware platform is affected?<br></blockquote></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">ARM64 with ili9225 and display size 220, 176.=
 It also</div><div dir=3D"auto">happens in another board with a different t=
inydrm driver and size 320,</div><div dir=3D"auto">240.</div></div>

--0000000000003c21d90626a7ceb6--
