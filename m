Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DD9DB799
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 13:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DAC10E36F;
	Thu, 28 Nov 2024 12:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jq/53W59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AE810E36F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732796958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
 b=Jq/53W59pPenUxjAm376VhsQppZUhS+gOz2TZIdqdG1AgoHmZiK4pRr3J6KGSMDY03rD/S
 qyiX9M2Gs16irK9gSz0fdVdPMvipV/ohjHijyMxUaMefJBjrT29v3j+SZYtlbdzeUfijB2
 PZ2nElKbyKvkl/WBixDZDqn9WMkEY9I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-9aiuMoxPNRqarBQWwBfj9Q-1; Thu, 28 Nov 2024 07:29:15 -0500
X-MC-Unique: 9aiuMoxPNRqarBQWwBfj9Q-1
X-Mimecast-MFC-AGG-ID: 9aiuMoxPNRqarBQWwBfj9Q
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5cfb912729dso487208a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 04:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732796952; x=1733401752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
 b=RSHJPMn55lrqsnEWnS7e8KUppYOcs62q/d9krsK7l8db9x3HJkzOm7DWyJoFMopDT/
 4CHoAAtDAFQp1PAzaje30tAz0DNtIryGkozM0XwCUnfGHMPCvHSIBhtaWJpVlS16DhR3
 8BA4f410LtqKw0APdyZWELfmWqDIe5YNrure9LB0GlNMLb7inmvge7iw5nuyDpjz/l63
 BUUW5Mg2AAbAVi8zDUzFwJCAZUQ9QwxNJVdeudpIps5FFYKR/339YDb3DgFeRxUXXKX3
 7PGUg0/OJslMRngOUw1cuWTRZIGcGIywS0p5llX2e5YiHE2y22EMc5rl7CgC6DLpkbUo
 pW8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEeruRCxd3nRiPcSHwFgUq2mk6cchB7toGqoWBwrq+JtkW6BZdPlU02SjYFOha98QRt5qJVOX/HhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNA1agIQHHLEogA6rnMaBlCKevKNQ6XycsdRauuxxgHgeSZiA5
 TLPr4mOVovRoF/RlBCpvz+Azh4Clbf13T88pyUktQFdFHvrq0p7unarWxBcqxXnlICbNQNpXtFo
 oQpacExOeM/gd6ojoDHUodMJ/yY6s2lcNAPCzyA2sblaPssAY83xbknK+ehv100AJX3SrGmS+rQ
 lkg/kOzN8bYliPKV7p8SATGcndFufYotKtVnBp9sNy
X-Gm-Gg: ASbGncu6xsZY05c2VXzvf9pGxkHhjKvutCjnbVjRtoZzPvzFsEB3whR9m6adrI68WNP
 EGfAdOPSXE9AStfNT/q9n6R0KAXTRP24=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id
 4fb4d7f45d1cf-5d080c604fcmr5605095a12.29.1732796951923; 
 Thu, 28 Nov 2024 04:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuE0zkJ6zJza+fGet7qX+06h7Jmet7/bu0xRwgqC9A06SMAgod8PaoQJd1k5pY7KRDfw0cJAGqmNIglvOyUZo=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id
 4fb4d7f45d1cf-5d080c604fcmr5605060a12.29.1732796951475; Thu, 28 Nov 2024
 04:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 28 Nov 2024 14:29:00 +0200
Message-ID: <CAO8a2SjKS2nWWVkAcqXkZhR+Q1TocULkwRk09ABf8XQjjzwJPQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] ceph: Convert timeouts to secs_to_jiffies()
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
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J5q0dKJ8oALR4SrToWuZTOOGXj_xDoIwt0_P9KGl61o_1732796952
X-Mimecast-Originator: redhat.com
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

looks good

On Fri, Nov 15, 2024 at 11:35=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
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
> ---
>  fs/ceph/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/quota.c b/fs/ceph/quota.c
> index 06ee397e0c3a6172592e62dba95cd267cfff0db1..d90eda19bcc4618f98bfed833=
c10a6071cf2e2ac 100644
> --- a/fs/ceph/quota.c
> +++ b/fs/ceph/quota.c
> @@ -166,7 +166,7 @@ static struct inode *lookup_quotarealm_inode(struct c=
eph_mds_client *mdsc,
>         if (IS_ERR(in)) {
>                 doutc(cl, "Can't lookup inode %llx (err: %ld)\n", realm->=
ino,
>                       PTR_ERR(in));
> -               qri->timeout =3D jiffies + msecs_to_jiffies(60 * 1000); /=
* XXX */
> +               qri->timeout =3D jiffies + secs_to_jiffies(60); /* XXX */
>         } else {
>                 qri->timeout =3D 0;
>                 qri->inode =3D in;
>
> --
> 2.34.1
>
>

