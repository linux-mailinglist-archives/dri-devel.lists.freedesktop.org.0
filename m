Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D079E0D9D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 22:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AA810E420;
	Mon,  2 Dec 2024 21:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hQ8JmeqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8E910E14F;
 Mon,  2 Dec 2024 21:17:05 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7f71f2b136eso3329114a12.1; 
 Mon, 02 Dec 2024 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733174225; x=1733779025; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
 b=hQ8JmeqTlwcJ1VZN3qD+t/m0LdShqv33lJz8xEMEkYyDm4yxStwPTeSEdLUR7G6kkw
 PzTOGYx3OrL4hrcaCPGvuOEq8lb/7wXEVtb17ULsf+0ZnQNQ08pj1WXEJWMDzv9B7i84
 kwlJC5YOt+BUatkVtisfd4/9MOpDfaxU/TyQl7kTiOf1tKRMKPHxhQmvFBgS5qRMGKlj
 BazzLOo5ZJTMBlkbZ04rcr05jS84kEO2+eBbvzf/J4z2jLn+TU5/dWfcUzmEyI7USheV
 HWYaXpUkIBhxnp1OELdOww1v0HvYtiLynS5OBNNWrMiJ6D/F4OhQd8K1oNm1o0czyLJT
 capw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733174225; x=1733779025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
 b=GJypjknULnVDRPHxJkuLzxTSx+kYn4h5IrLOs1dz/ngplUcgRTpKd7w0Hh3nuAkpXy
 unBs11kDn1H/Rf9QEiTz5dz9Fszpn9Rw7xqcIOOB4R91zTDdwKljnJzR+882oj6o8dj2
 J36m2ezFqbImTCPBl3qr9nZ+KGPGAGsRovfwriXyq5Y5k9zGqslGsScFcru8l7mw4gN6
 2TZNLWY3jH9kzIaHtm/9Q+dmzs+Qb3rk3nekOx28atd81/VR+HoJv3y4sgZ1egxZvs49
 S38Le3Bv+1a1GMtO6a9IBROytKKAJL/VwPJhQcWLw9OEASUEVUTJvsRuMKxMnuDuqCWl
 Yo0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR71eDsdkfzjJJLStf24ClMnHcIcAbOuSuoVfr0OW0tFPI8zXEOiCQVCcu8V+CrtyZfpJxjN2dvLI=@lists.freedesktop.org,
 AJvYcCWbzy05lpPqSwkaeKIgsgHDqwUf4O2msRPyJxKlAmFhfXs9cPfzT3WHr60DMYBdKpIqTM71/JgM1w==@lists.freedesktop.org,
 AJvYcCXMm546Sg990szLzvZXTvl/rVS+wyE4ryVomQaR8VA9iwADVCN5+/gZPAChTcAAdpLps4/5E+PrOG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZuzQHyWhyq9hpKM1Wa2bPvTjmcIJ+21EUK9f3pwMIG1FpPsro
 CoqymK4qSc5Z9FVJdF3Y8Hv4lY98lNmrZqDDZpo1b0/uwNNW98wqtvRbrOB0BcaPPFzMXxAj6uf
 9kHheAUDD0VEySCYHf+Vz4C31BM0=
X-Gm-Gg: ASbGncs66Sy5veznpohK1DCojizpuM9sDxDOlQ7xzR4bZYxgljRrqm/kKGkQq8bdoGm
 UBDLrjnLNvdRNXW3scjE22k9j4CCE8A==
X-Google-Smtp-Source: AGHT+IFDh1yb6d6zM40EzPJelJu2iVMH0WClLwmjysRWgfnYNSB8awfS5UuhO/EqqMc0eH1dffTLKgwFM99xaAmy4L8=
X-Received: by 2002:a17:90b:1c09:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2ef0124c720mr32029a91.29.1733174224966; Mon, 02 Dec 2024
 13:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-9-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-9-911fb7595e79@linux.microsoft.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 2 Dec 2024 22:16:53 +0100
Message-ID: <CAH9NwWdjXKH-AcKa-prwdqj2JqWLYVp1qM+0kxtQYSwo1J1c7g@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] drm/etnaviv: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cocci@inria.fr, linux-arm-kernel@lists.infradead.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-mm@kvack.org, linux-bluetooth@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 ceph-devel@vger.kernel.org, live-patching@vger.kernel.org, 
 linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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

>
> Changes made with the following Coccinelle rules:
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> index 721d633aece9d4c81f0019e4c55884f26ee61c60..0f5a2c885d0ab7029c7248e15d6ea3c31823b782 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -100,7 +100,7 @@ int etnaviv_cmdbuf_init(struct etnaviv_cmdbuf_suballoc *suballoc,
>                 mutex_unlock(&suballoc->lock);
>                 ret = wait_event_interruptible_timeout(suballoc->free_event,
>                                                        suballoc->free_space,
> -                                                      msecs_to_jiffies(10 * 1000));
> +                                                      secs_to_jiffies(10));
>                 if (!ret) {
>                         dev_err(suballoc->dev,
>                                 "Timeout waiting for cmdbuf space\n");
>
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
