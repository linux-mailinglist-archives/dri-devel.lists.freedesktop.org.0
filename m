Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF72925546
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 10:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACA210E754;
	Wed,  3 Jul 2024 08:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="J0+Hc0MH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402BD10E754
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 08:22:31 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so67727371fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1719994949; x=1720599749; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TMQqT/Muz0iwxmBm/vQkZCAi7Byb2pCrA2WM9iHg1No=;
 b=J0+Hc0MHAXqrHFxAjnbsuQKhvM9LZblHYgS/a2KV7nE3DtLKLho+vtOWLCsW9m7wyz
 B7fJ1nR6vhj3IlKUNZSE8Yyg1k8HkKLn+yVbY+Bh5YgesrrMyxPzYt3nbMYu/zvZ6yKR
 y9UtlDjzUaDH4wN/uYelT3qocVjbJk2Jk7iX/aHWJh6WHtXBoL8p9E1TUJGSrpL/j68q
 Tg1F1o48xhEFmyrspbnA1dyoBILi/iAJY66geN8oSu+SlH+YE3sdvPs2DT0eEp0C8SOa
 tVrXO1eufUbbGqlwENI1hfqQ+wHZNg2Fiba6aCH3y65fv1SiRkrzi8bpzyvYOAlxu1rd
 rwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719994949; x=1720599749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMQqT/Muz0iwxmBm/vQkZCAi7Byb2pCrA2WM9iHg1No=;
 b=j861+xtJwiUZtZtVMEUAhASx5mEMDNoerrLLO/leYmrBpGbhWOtnCtZvEBGiPwMx4P
 7US0ODOL43v79pHLpf+59jto+y/yGNveSyAGELPoxox/FIhPG11p0Vacyc0+hxzxGfEa
 OeGdGgytbrRB3DxQ6dbHtbqBgBDL9zfbvSI05mE2Nf2hv6xPVF1OF5ih0KVMrVEhMJ9p
 xbmsO3iIl2ZbTb4xTSh9MJjshRk2BeYVeLKHeEsb0Vi2ZIGO3BOxhPEbXXxA5jsQvCpz
 358zI2G2G97LN3TyAO0WmWtKJDBJEihN1iHID0rJkkUDpEoRCZ9dma+BmVzfQI9fROkN
 2IWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL9IoaTqX/sr+mjCBTCvycsH589Rak1AA8SkMWf0NxMfFM5e1pUrSXGAt+kkF/RJAr7vlARXInwlEtjR83kTl9APWUocVemzMK7E6djgIX
X-Gm-Message-State: AOJu0Yy/X+kBAxcIFfyzVrfPP/krkDVpobcAnbQXLD2velok7bjN7lhz
 O+TU7pAu8qBdeGSvxMfk0fwl6PgJ9J6MUMxOO0lObKBgQdhjqEFHlf+4wsIl7TM=
X-Google-Smtp-Source: AGHT+IGgmL2y9QM4c4g0Wf6Xz0uaCMi9coDigbGLy4p0by/hZmKG4KPflaiBbCeCe+DcbaFV7kidJA==
X-Received: by 2002:a2e:bc88:0:b0:2ee:7a54:3b14 with SMTP id
 38308e7fff4ca-2ee7a543b8dmr26465461fa.7.1719994949278; 
 Wed, 03 Jul 2024 01:22:29 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70802959d41sm10094847b3a.96.2024.07.03.01.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:22:28 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:22:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
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

On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
> 
> 
> On 02/07/2024 22:29, Kees Cook wrote:
> > On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> > > kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> > > callback.
> > > This patch adds a new struct kmsg_dump_detail, that will hold the
> > > reason and description, and pass it to the dump() callback.
> > 
> > Thanks! I like this much better. :)
> > 
> > > 
> > > To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> > > function and a macro for backward compatibility.
> > > 
> > > I've written this for drm_panic, but it can be useful for other
> > > kmsg_dumper.
> > > It allows to see the panic reason, like "sysrq triggered crash"
> > > or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> > > 
> > > v2:
> > >   * Use a struct kmsg_dump_detail to hold the reason and description
> > >     pointer, for more flexibility if we want to add other parameters.
> > >     (Kees Cook)
> > >   * Fix powerpc/nvram_64 build, as I didn't update the forward
> > >     declaration of oops_to_nvram()
> > 
> > The versioning history commonly goes after the "---".
> 
> ok, I was not aware of this.
> > 
> > > [...]
> > > diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> > > index 906521c2329c..65f5a47727bc 100644
> > > --- a/include/linux/kmsg_dump.h
> > > +++ b/include/linux/kmsg_dump.h
> > > @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
> > >   	u64	next_seq;
> > >   };
> > > +/**
> > > + *struct kmsg_dump_detail - kernel crash detail
> > 
> > Is kern-doc happy with this? I think there is supposed to be a space
> > between the "*" and the first word:
> > 
> >   /**
> >    * struct kmsg...
> > 
> > 
> Good catch, yes there is a space missing.
> 
> I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
> is not indexed for kernel documentation.
> And you can't find the definition of struct kmsg_dumper in the online doc.
> https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
> 
> > Otherwise looks good to me!
> > 
> 
> Thanks.
> 
> As this patch touches different subsystems, do you know on which tree it
> should land ?

Andrew usually takes patches against kernel/panic.c.

Or you could take it via the DRM tree, especially if you already have the code
using the string.

Also I could take it via the printk tree. The only complication is
that I am going to be away the following two weeks and would come
back in the middle of the merge window. I do not expect much problems
with this change but...

Best Regards,
Petr
