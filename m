Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1769A45891
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F2210E892;
	Wed, 26 Feb 2025 08:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="bMIDavjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79D810E866
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 07:29:00 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5ded51d31f1so11633202a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 23:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1740554939; x=1741159739; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jy5UzyKzocsSx5cSXomfjfFL//CTemBkcuebkephmC0=;
 b=bMIDavjXG1s1cc9BFFO6sDo0FiN4dJNWtTxapC3i5VrD/ye7Gty3xR9muCRLnBjWNH
 NVjtBxVJMWm1vwqIuqw63SWaYCVwqscRGq5jjFJA5DiGqOy6iHhi9RW4v1h9Wl1Oa9B0
 TysllLf9pXkDaznFTvR0+9vfnfqgpvOEZDnMuGkT1VTkqmiBWgt9U6q04aCfagK4/Bks
 5zRU7hchzT5AdndCKDxLdYloVXuP1k7JzHgDJ99sI0SH+x+ZsgYhG7IzpBusRAjWzdXZ
 VUCq45h0yy1BfilgkEhz/jprDpS1OZbPHCzegJgghkMDVs8RY0mA3oQQnHpLw7uONjys
 OG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740554939; x=1741159739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jy5UzyKzocsSx5cSXomfjfFL//CTemBkcuebkephmC0=;
 b=cuvTbQ54FAcY8NhqGeCDr3MiWM9L2+P3ceVSrNXP5ShDixNm00bsNjXwdZm/Wp2X4y
 nunX+yTssrPUJMjtKmp3CTJ7LPXT91UjLLy3sOCAZOmzYEd9si37+4mM1lZFkbPsMZVO
 Cgy1f80Wan0baTfPKibSb643Xc3V4M2/TO+iVQSDmssHkKrbjU/HkRvSIq54A2ruDgAS
 Cu9XKbq4Prcb/pcttqCAjFerZkcsW9iy86h78qxPY2KpKY9cbjq1S2WNKVDSyPENmwal
 iz0K22ociYyVlC4o8B+QrUhKODJ9UYZTEL84UJKPzzL3rFVoRkZ5VomagHexUvYMmIVy
 YzTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyhDNrMMu3DCwgGTYHEcmj9V2qQfP46at6norN5Zk08r4i35q/S23UI3ohE99sPs2g2TfNpDSXdVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz10OCaoxgk3GiW+h0+TJOhQDz4hWhDtdl5qHjIrnLco7FgmIWh
 3vC7LzG2yvo88YPmXJE6Z3eO15CfwNEJ1IhkiMT3sZGRDgZ/IsiVOm0lBjHzDuDFpPCKG6jLGec
 b33TfaAUocDX03Ik9FCKQtQd+4G1nTc+b99hAag==
X-Gm-Gg: ASbGncuEAqcqSMc+gSPoKMzSOrdEzeqBDHqPUzRx6ximQ1f43B3ZmdYgcMVJFbNsDVg
 HlX1W8ag8Qj+mIlkQJdhyAPFkXl6Q286Ed1lPkLXvCd39D7aPu9vMzNn5HjF+iS5F8wRAFUbxhD
 BQh0tEDg==
X-Google-Smtp-Source: AGHT+IFYP8Tba+z3P6zhrfLVohTtXs/BwRHQBKKRVXu59ZSzqEPbWtjoPmnK2n59Ee5Tugvqu0RIdPnu12lt6iEjWaU=
X-Received: by 2002:a17:906:18b1:b0:ab6:ed8a:601f with SMTP id
 a640c23a62f3a-abeeed1123amr202024966b.12.1740554939189; Tue, 25 Feb 2025
 23:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-6-a43967e36c88@linux.microsoft.com>
 <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
In-Reply-To: <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 26 Feb 2025 08:28:48 +0100
X-Gm-Features: AQ5f1JpekOKemtGu2BHsnbGs6fr563e7jHjxxRB5HZ2bESNce9YNZRbPCIKk9Cc
Message-ID: <CAPjX3Fcr+BoMRgZGbqqgpF+w-sHU+SqGT8QJ3QCp8uvJbnaFsQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Frank.Li@nxp.com, 
 James.Bottomley@hansenpartnership.com, Julia.Lawall@inria.fr, 
 Shyam-sundar.S-k@amd.com, akpm@linux-foundation.org, axboe@kernel.dk, 
 broonie@kernel.org, cassel@kernel.org, cem@kernel.org, 
 ceph-devel@vger.kernel.org, clm@fb.com, cocci@inria.fr, 
 dick.kennedy@broadcom.com, djwong@kernel.org, dlemoal@kernel.org, 
 dongsheng.yang@easystack.cn, dri-devel@lists.freedesktop.org, 
 dsterba@suse.com, festevam@gmail.com, hch@lst.de, hdegoede@redhat.com, 
 hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, idryomov@gmail.com, 
 ilpo.jarvinen@linux.intel.com, imx@lists.linux.dev, james.smart@broadcom.com, 
 jgg@ziepe.ca, josef@toxicpanda.com, kalesh-anakkur.purayil@broadcom.com, 
 kbusch@kernel.org, kernel@pengutronix.de, leon@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org, 
 martin.petersen@oracle.com, nicolas.palix@imag.fr, ogabbay@kernel.org, 
 perex@perex.cz, platform-driver-x86@vger.kernel.org, s.hauer@pengutronix.de, 
 sagi@grimberg.me, selvin.xavier@broadcom.com, shawnguo@kernel.org, 
 sre@kernel.org, tiwai@suse.com, xiubli@redhat.com, yaron.avizrat@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 26 Feb 2025 08:39:53 +0000
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

On Tue, 25 Feb 2025 at 22:10, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 25/02/2025 =C3=A0 21:17, Easwar Hariharan a =C3=A9crit :
> > Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> > secs_to_jiffies().  As the value here is a multiple of 1000, use
> > secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multiplica=
tion
> >
> > This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci w=
ith
> > the following Coccinelle rules:
> >
> > @depends on patch@ expression E; @@
> >
> > -msecs_to_jiffies(E * 1000)
> > +secs_to_jiffies(E)
> >
> > @depends on patch@ expression E; @@
> >
> > -msecs_to_jiffies(E * MSEC_PER_SEC)
> > +secs_to_jiffies(E)
> >
> > While here, remove the no-longer necessary check for range since there'=
s
> > no multiplication involved.
>
> I'm not sure this is correct.
> Now you multiply by HZ and things can still overflow.

This does not deal with any additional multiplications. If there is an
overflow, it was already there before to begin with, IMO.

> Hoping I got casting right:

Maybe not exactly? See below...

> #define MSEC_PER_SEC    1000L
> #define HZ 100
>
>
> #define secs_to_jiffies(_secs) (unsigned long)((_secs) * HZ)
>
> static inline unsigned long _msecs_to_jiffies(const unsigned int m)
> {
>         return (m + (MSEC_PER_SEC / HZ) - 1) / (MSEC_PER_SEC / HZ);
> }
>
> int main() {
>
>         int n =3D INT_MAX - 5;
>
>         printf("res  =3D %ld\n", secs_to_jiffies(n));
>         printf("res  =3D %ld\n", _msecs_to_jiffies(1000 * n));

I think the format should actually be %lu giving the below results:

res  =3D 18446744073709551016
res  =3D 429496130

Which is still wrong nonetheless. But here, *both* results are wrong
as the expected output should be 214748364200 which you'll get with
the correct helper/macro.

But note another thing, the 1000 * (INT_MAX - 5) already overflows
even before calling _msecs_to_jiffies(). See?

Now, you'll get that mentioned correct result with:

#define secs_to_jiffies(_secs) ((unsigned long)(_secs) * HZ)

Still, why unsigned? What if you wanted to convert -5 seconds to jiffies?

>         return 0;
> }
>
>
> gives :
>
> res  =3D -600
> res  =3D 429496130
>
> with msec, the previous code would catch the overflow, now it overflows
> silently.

What compiler options are you using? I'm not getting any warnings.

> untested, but maybe:
>         if (result.uint_32 > INT_MAX / HZ)
>                 goto out_of_range;
>
> ?
>
> CJ
>
>
> >
> > Acked-by: Ilya Dryomov <idryomov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.or=
g>
> > Signed-off-by: Easwar Hariharan <eahariha-1pm0nblsJy7Jp67UH1NAhkEOCMrvL=
tNR@public.gmane.org>
> > ---
> >   drivers/block/rbd.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> > index faafd7ff43d6ef53110ab3663cc7ac322214cc8c..41207133e21e9203192adf3=
b92390818e8fa5a58 100644
> > --- a/drivers/block/rbd.c
> > +++ b/drivers/block/rbd.c
> > @@ -108,7 +108,7 @@ static int atomic_dec_return_safe(atomic_t *v)
> >   #define RBD_OBJ_PREFIX_LEN_MAX      64
> >
> >   #define RBD_NOTIFY_TIMEOUT  5       /* seconds */
> > -#define RBD_RETRY_DELAY              msecs_to_jiffies(1000)
> > +#define RBD_RETRY_DELAY              secs_to_jiffies(1)
> >
> >   /* Feature bits */
> >
> > @@ -4162,7 +4162,7 @@ static void rbd_acquire_lock(struct work_struct *=
work)
> >               dout("%s rbd_dev %p requeuing lock_dwork\n", __func__,
> >                    rbd_dev);
> >               mod_delayed_work(rbd_dev->task_wq, &rbd_dev->lock_dwork,
> > -                 msecs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT * MSEC_PER_SE=
C));
> > +                 secs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT));
> >       }
> >   }
> >
> > @@ -6283,9 +6283,7 @@ static int rbd_parse_param(struct fs_parameter *p=
aram,
> >               break;
> >       case Opt_lock_timeout:
> >               /* 0 is "wait forever" (i.e. infinite timeout) */
> > -             if (result.uint_32 > INT_MAX / 1000)
> > -                     goto out_of_range;
> > -             opt->lock_timeout =3D msecs_to_jiffies(result.uint_32 * 1=
000);
> > +             opt->lock_timeout =3D secs_to_jiffies(result.uint_32);
> >               break;
> >       case Opt_pool_ns:
> >               kfree(pctx->spec->pool_ns);
> >
>
>
