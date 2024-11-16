Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A89CFE3B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 11:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B830C10E3F1;
	Sat, 16 Nov 2024 10:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bO37/hdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83C210E1AA
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 10:40:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so23159575e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731753625; x=1732358425; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
 b=bO37/hdWDQ98wYwmIU/QCIvgZ6syhyFcpW09bimwxt/aDgd+rQLZBIhjf/OySztycT
 77/z2Jb60LRqp7Ky9R2Vf8VBlP9tbkm5NFV3tvb561OG2s0ycVpN0VzBJwITSqwJ889C
 PxSkW0wUVcr/AhRtRHR5Fssb1Q0DoQrAqE9txnCk/s+UipCUC6lkRTl39638pUfwTGAP
 8PLlVgirI6n3U5Xcjgl8f4F11Mrtwm09/GUoYft+qVnQjhLj46KT3leYSwq6tjZHgvSX
 ybhBAmA7Ep0CiJANjWy3ct/ABzm/zrdC47ox+VyEKO3Yr9suLFJ2HirwJA4mC5w5dD4A
 7dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731753625; x=1732358425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
 b=XIbwzmpXcQ0/ZfiJ0xSqQGpeLdEtM3WIan+U/LZ8615IwXhCs2x5eoihqCkR8InjKg
 7Fgc+eWGb5dcfjc7dd2S/JfEqKQbrdc12qo/tUM5OqhuxFei2fDgBnVPEmOGh2ocnBDV
 xxEcGrYAN27yTaUYspbniZbeKzS6lPtkzVc2QG2K8qEmyQjkqJp9YdvRhJcitas5U6lV
 lbX1NGZ7SVOOudYDDkSx8cz6POg3KCX23ga4CxCy8zi5Ge9Bs6A2JYT+Fn0geWciVLDc
 0ZFxWBbBFBFCx30Dr4wvomLrKH6p/dB+sztloMaI30AhHg2T1ICsEzsq09MxB+XFJjAE
 P5Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuJypQ9W8g2E+7ExFdgwJ2y2U8aUyTpKRJCcanUEQacdGuYktNGD9zZXeOhA8kf/s7OOSwkwNvYnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyjDKl94ie322El2/Ci2YV9/gT6LyvEVFakFVQ0nI18YJR3gk+
 vla5zjmOiiFwBV5XkkajBdUAEo61Hqf7kJ3ZMPr+ENVfnId8fJsupIPNkBriJZc=
X-Google-Smtp-Source: AGHT+IH8fBA+4s5F3P6X/kjn5LT5A4plOne9CKmDoZ8QUK+uLzjM3K0QAglApJbsapoZYtb9Ft2RHQ==
X-Received: by 2002:a05:600c:1d1c:b0:431:4e82:ffa6 with SMTP id
 5b1f17b1804b1-432df78c5b5mr46184285e9.24.1731753625076; 
 Sat, 16 Nov 2024 02:40:25 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da2800absm87243245e9.25.2024.11.16.02.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 02:40:24 -0800 (PST)
Date: Sat, 16 Nov 2024 13:40:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v2 05/21] powerpc/papr_scm: Convert timeouts to
 secs_to_jiffies()
Message-ID: <e4872a15-ff3d-4619-9b03-c7f0b6230934@stanley.mountain>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-5-911fb7595e79@linux.microsoft.com>
 <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>
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

On Sat, Nov 16, 2024 at 11:06:55AM +0100, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index 9e297f88adc5d97d4dc7b267b0bfebd58e5cf193..9e8086ec66e0f0e555ac27933854c06cfcf91a04 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -543,7 +543,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
> > 
> >          /* Jiffies offset for which the health data is assumed to be same */
> >          cache_timeout = p->lasthealth_jiffies +
> > -               msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
> > +               secs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL);
> 
> Wouldn't it now fit on a single line ?
> 

Some maintainers still prefer to put a line break at 80 characters.  It's kind
of a nightmare for an automated script like this to figure out everyone's
preferences.  In this particular file, there are some lines which go over 80
characters so sure.  Earlier in the patchset one of these introduced a line
break that wasn't there before so I think maybe Coccinelle is applying the 80
character line break rule?

There are sometimes where the 80 character rule really hurts readability, but
here it doesn't make any difference.

regards,
dan carpenter

