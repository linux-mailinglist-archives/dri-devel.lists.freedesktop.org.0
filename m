Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6CA26D94
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3961310E2C9;
	Tue,  4 Feb 2025 08:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWP/tj3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3EF10E167
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:19:34 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ee8aa26415so8446301a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 13:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738617574; x=1739222374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1RprFycDuHJldRn/ezrS+F5IM4jHFkaXUl211fTz08=;
 b=NWP/tj3VTwycjk2C38NIpUQ2s9IP90Bs2YdtIoqn0Er/fBiSs4V27/jQ3llk/N/0m6
 4TuUT14gBlDqHIa5tzkDTFjXF28VWv6lTeVFPbULejBeWEs7jGVqia17OZac42RBAiUJ
 8gzfWddtWnaxzor0JldnwfNVJ0jp0WhIihzr1rjrD+yf+D9dr2FUGW4xI8K002l2EEWi
 MWyL6WVWIPFkUdsUtz6CbFVOxFkjazJ6yO7bsIDmcCNZ8eLvifmEVPTRGl+Ar6S0akHy
 LFyfQKyFHF0Ygdvn7VWH4oEZXt8/anZlO58gV7kaDshgcFrue4SQD5zRbj2nLnjDVPfL
 Od1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738617574; x=1739222374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1RprFycDuHJldRn/ezrS+F5IM4jHFkaXUl211fTz08=;
 b=auw7h2As/D5JHbP1fm2UZJowxmU077dhohOboTf1b1alGZzT/wq4Y+j4v+BJkRrKIv
 lZ5c4J07aeFvWejc7jME5h9Hc1rFN96qaG1snNn8BSeXDHPlQmgQgrwPYxMBBy5Hc+qW
 qkPGor21SdrU4AbNfQfUrmkDTVXHDMnMto84S/lHDSn95112HbExvFKRSuz9wgDfamm5
 mQVQzhiQvDnlWtM36X+ssix9sjOiixLRN3B+CCB/zTAkQLS1m8vH6692/4blb/5DrClG
 kcBBJq0UOshkkbyWESFfBV6+2KOexpH+GUjWLhWoHZQYD3t5qz9Hm3pFjNW+31cxafzf
 VKMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgbPDXqvQMcEn8ycXSSaQ1aNqsUvmiFh5QtIbqB2jBAcxPwY8oYsQ3Xc63qq1FqQCx+qUQTc+Llsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU4feV0zg8BmLQrG4UnGRnAgdkFT0RTf+my1zymuy09p+5yzb3
 3fCeIThwpErhn7mQf5Jg9OOGVEXjz/+dh9X0MNpc8ZupmGwGwzas0vaXwHZ2BABo09e2GqK29k0
 8urOMkzAd5ma9h3XfbHr9hIASG+A=
X-Gm-Gg: ASbGnct+uSCalxTbgsoWCUVlt2L30pwpfq4Tpp2KX09h3iLwT9HPFWW9loUd+LGw6GX
 fZqP+j65eXxMopIAbw1u6iMq73BcxQaMXDgOA4pHphsCwucFwoFWLq6e5ZpPiGUeNj11HGBE0
X-Google-Smtp-Source: AGHT+IG/z3EJhnf9SR0K4H9KlI981FGgmyEgJkvQWHpkkih0UJEnWjGg3KJxlOWE94AU8gGejkz3MNO9Uh3+nXXaTBI=
X-Received: by 2002:a17:90b:5146:b0:2ea:3f34:f18d with SMTP id
 98e67ed59e1d1-2f83abdebdfmr37965262a91.10.1738617574433; Mon, 03 Feb 2025
 13:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128-converge-secs-to-jiffies-part-two-v1-6-9a6ecf0b2308@linux.microsoft.com>
 <dd0358b1-7c8a-4c9e-88c5-2e1db69a3a35@linux.microsoft.com>
In-Reply-To: <dd0358b1-7c8a-4c9e-88c5-2e1db69a3a35@linux.microsoft.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 3 Feb 2025 22:19:23 +0100
X-Gm-Features: AWEUYZmGyX5TH9PuhG1vFlJR4zNh-9wcNWLcslfb_ZiDi-fTNv4o-akZqj7ScMc
Message-ID: <CAOi1vP_UTjuF5y5oEVquk45udBZ41WqxQpHufD5oK2wbQkobhA@mail.gmail.com>
Subject: Re: [PATCH 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, 
 Jens Axboe <axboe@kernel.dk>, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, 
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Carlos Maiolino <cem@kernel.org>, 
 "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Keith Busch <kbusch@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Frank Li <Frank.Li@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Selvin Xavier <selvin.xavier@broadcom.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, cocci@inria.fr, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

On Wed, Jan 29, 2025 at 10:03=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 1/28/2025 10:21 AM, Easwar Hariharan wrote:
> > Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> > secs_to_jiffies().  As the value here is a multiple of 1000, use
> > secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplicati=
on.
> >
> > This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci w=
ith
> > the following Coccinelle rules:
> >
> > @depends on patch@
> > expression E;
> > @@
> >
> > -msecs_to_jiffies
> > +secs_to_jiffies
> > (E
> > - * \( 1000 \| MSEC_PER_SEC \)
> > )
> >
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > ---
> >  drivers/block/rbd.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> <snip>
>
> > @@ -6283,9 +6283,9 @@ static int rbd_parse_param(struct fs_parameter *p=
aram,
> >               break;
> >       case Opt_lock_timeout:
> >               /* 0 is "wait forever" (i.e. infinite timeout) */
> > -             if (result.uint_32 > INT_MAX / 1000)
> > +             if (result.uint_32 > INT_MAX)
> >                       goto out_of_range;
> > -             opt->lock_timeout =3D msecs_to_jiffies(result.uint_32 * 1=
000);
> > +             opt->lock_timeout =3D secs_to_jiffies(result.uint_32);
> >               break;
> >       case Opt_pool_ns:
> >               kfree(pctx->spec->pool_ns);
> >
>
> Hi Ilya, Dongsheng, Jens, others,
>
> Could you please review this hunk and confirm the correct range check
> here? I figure this is here because of the multiplier to
> msecs_to_jiffies() and therefore unneeded after the conversion. If so, I

Hi Easwar,

I'm not sure why INT_MAX / 1000 was used for an option which is defined
as fsparam_u32 and accessed through result.uint_32, but yes, this check
appears to be unneeded after the conversion to me.

> noticed patch 07 has similar range checks that I neglected to fix and
> can do in a v2.

Go ahead but note that two of them also reject 0 -- that part needs to
stay ;)

Thanks,

                Ilya
