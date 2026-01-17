Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B4D38EF0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 15:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4110E0B9;
	Sat, 17 Jan 2026 14:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nDmr/d22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4F810E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 14:10:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a0d67f1877so19569515ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768659036; x=1769263836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LS4zezA5zWDHI1TzJGTvFcU5cfzTeVoC136inl8tl/Y=;
 b=nDmr/d22UDMxEwzNhjTUnHrosws+ylV7e/5Qr5zCCOHoBcGu8brYCNo4P5sG6PPMs9
 45CyVYXD/Yon+XRfZ6k+mobfngsbOY+gd5NlYdrllS1sQLcdLw1JXsY/2muczjCEA0n4
 +1QD7AW/isrOriG5nzU867Akl5R7x+c+Yrr34XbcNuhHQlMZUjFjF2+SrAdMSmjUyPng
 bY50VBB4qHs5M/oirBRcHZNeDeRe5u4V2XliCg0WmBiBOhE77AuxkDlMzhSEL7h6a4/a
 0rTsjPYu/2srBdgDaSaak1VIGrt/xXStb2XhNlwRmeECU22/5bwXKK8LrJ0cymjvSK4y
 oBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768659036; x=1769263836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LS4zezA5zWDHI1TzJGTvFcU5cfzTeVoC136inl8tl/Y=;
 b=Hk27ky8zNj09N+As02xZ0CZp15o8vbvpNC3WuJ69taBxpSgKiiKOdX7fAWy1WDqAZx
 T6L5tdtnf7stzj0HoVMEuWMwwthTYIYZWlIV/fUKCFkiGDQARbd8vqmmSWlBrqxawo8E
 7zA1SsI5+cMOLgWRkO11RqzjkskigBdKVrM1IpGGVTc5EBJlIX2z+2/c9mHvtSmdd6MP
 CjOJfVLjdLzeLF5ws5fDESEeEUvVGoyjuVgnEOMDdSfnJXtQiBFchs0hZqm/0zID4UY1
 5EVGSR4UV+VYaMaUtvXEYVBOXKqVfuUBUB0Z7cScriiZNONrpm8gvn/9jbTYnYU7NPYB
 3qpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhQAtJGSLD431yL55n+tfQcvjjstoKMVpgO7twkdO2ksHBRX8tpX3yNvpW+1XA/l38I6taJcz2fic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWGV7DtSJO/9gK7fqkI7zaalXydOcDu6WF6Bq6QCdID6EF1KjR
 RNoY95Sr7Bm5lNE5UchM+wjiw3pXipRHnUDF9p5qaX/XLrmaYOYsFk6hbgJ7eY9ubNVWpvbyDPs
 oKjlaoP++fT85V+xqYN7Ams69rzZ9PWM=
X-Gm-Gg: AY/fxX7d2VgcPVA6B5JiEgDlMJin1klKvQYCwwJ+yCGQgP89dvuKJnAoH38lUw3CpV7
 nyXnCAS3m7P0uEwOthlxMgw7vcRT1R4tc1qrONQqv9dpCJp6BfjuAHAG2Z7ddhwhyrQzPiNVp/0
 hJhPTtg8DOsOypIPyrRLF/Yu4IkKyMQ5436lUQIEGP1rFFkufNeFBKMOgID0qEc03mbQo7zLnx8
 /Ls/cGFxjgaTKi9aYmxQ9s4b6k/ZyzotpqZlm1rFIzwjo4oEANm4yaWQe/+hMX37dbqWHM0LqDi
 FH1O
X-Received: by 2002:a17:902:f601:b0:295:fe17:83e with SMTP id
 d9443c01a7336-2a7188a9654mr56251115ad.19.1768659035580; Sat, 17 Jan 2026
 06:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20260112123249.3523369-1-xjdeng@buaa.edu.cn>
 <2026011650-gravitate-happily-5d0c@gregkh>
In-Reply-To: <2026011650-gravitate-happily-5d0c@gregkh>
From: Xingjing Deng <micro6947@gmail.com>
Date: Sat, 17 Jan 2026 22:10:25 +0800
X-Gm-Features: AZwV_QiTCXCQyKNQnGgsaWolDN840KiArFFxTvmYD37MsiVp_TLVyXDoiyw1nEk
Message-ID: <CAK+ZN9riLwTU7C9GZrjsrUNh69oTeF=5C6xg+2ifFz=0E+4H0g@mail.gmail.com>
Subject: Re: [PATCH v2] misc: fastrpc: possible double-free of
 cctx->remote_heap
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, I have released v3. Thanks for your help.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=BA=94 22:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 12, 2026 at 08:32:49PM +0800, Xingjing Deng wrote:
> > fastrpc_init_create_static_process() may free cctx->remote_heap on the
> > err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remov=
e()
> > frees cctx->remote_heap again if it is non-NULL, which can lead to a
> > double-free if the INIT_CREATE_STATIC ioctl hits the error path and the=
 rpmsg
> > device is subsequently removed/unbound.
> > Clear cctx->remote_heap after freeing it in the error path to prevent t=
he
> > later cleanup from freeing it again.
> >
> > Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> > Cc: stable@vger.kernel.org # 6.2+
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > v2 changes:
> > Add Fixes: and Cc: stable@vger.kernel.org.
> > ---
> >  drivers/misc/fastrpc.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> The version changes goes below the --- line, otherwise it ends up in the
> changelog commit.
>
> Can you fix that up and resend a v3?
>
> thanks,
>
> greg k-h
