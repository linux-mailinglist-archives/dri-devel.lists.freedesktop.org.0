Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BC925518
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 10:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582EB10E747;
	Wed,  3 Jul 2024 08:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="curRtKzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3877F10E747
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 08:12:54 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec50a5e230so50899401fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1719994372; x=1720599172; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bdyT6ioPy1VNeKmL4j3XjcoiZwneAHmBRTL0mGefOq4=;
 b=curRtKzm6jmkpbB/z6hsvkIw6UOqeOvX+g59knBn+88jNnYLSrQ21unYPt63y6Eb6R
 X9zhwYvUyJf+n/sz/2CEPvAkTtPt0/eN30YvgozCYjNLduA6LqDfgBVBNBkjl2j4Ac0+
 uuqrIwwfQYn5xwGXzv/RDQL0a9qm4VFLm8z2NJwEo1z7Z5q4BRjDfQOOv+39ke7/YWya
 UwW/YT1eSIfAqumRUxUMs9T3EIPhtM+/8udgskqAruk376pJxvRfU+ni2bjsK5lsslba
 S7YIlwXfqstaki5wYhJvNP9c8N1FHqLgOn9jj4waJq48Eqfl+bXcIKd+Sto3s75TKkX9
 WHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719994372; x=1720599172;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdyT6ioPy1VNeKmL4j3XjcoiZwneAHmBRTL0mGefOq4=;
 b=DXbrleIKL64wP+4f+5Oy0a+J9Vmh+pwUmSO3DL1ojKb2wOcQFe9RO5hsZre+xpddwE
 YLmuhV2A9hEvDCYqHxiy0cXaOSDanVp6RjCUyfRQ8aoJgNv0LCOp5cAtqhqt2lixv1Xn
 iQy5D/GnhLdjhzAbilyKgswakIhlln5errUMg7BjFwJ5Awf6ae7ypKNdA+ffM7hzw0Zl
 Ar9wQj9A1YCAWyCxlCgKvm6UmNtsIvOmdZMsP1G6mPI7aF6lTPTKLDMbmccLqQtkispC
 H0yhtsOvknRf0lvKAh5UnUc6djapE8IUkWxIU4nViuxQiw3yEF64CpPLv9Y1I1gPodmS
 Bgig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOY4mYtbGmxKl32ZV1fuXOPKo5pn8ELb0Q7yr4An6RKXfef3DlxrludVQng0oQHLkoRxJZi2PfgaCUp89OvcSVQ8bFP59LKWWJegX8EJhH
X-Gm-Message-State: AOJu0Yx3ImYNCFMwMKQoYkUUJMEvJnmNTXGkM7nhiKdYgHuekpiFGEXC
 aDdRH+lOckQs/OPmp+3tKLGeK3fXBJKRgH2G+3jSJJm/TbRtWe8dPZq7zujIpnc=
X-Google-Smtp-Source: AGHT+IFCrx5O8SyoDb7pv8NJaiksMiDUk0MIzdtkS+naCkfqpA17Gjg/ppieWiNLDo4J+A42AblrZQ==
X-Received: by 2002:a05:651c:2010:b0:2ec:550e:24f3 with SMTP id
 38308e7fff4ca-2ee5e337c3emr70900071fa.10.1719994372235; 
 Wed, 03 Jul 2024 01:12:52 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb0c2e10dasm15659175ad.223.2024.07.03.01.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:12:51 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:12:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
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
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
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
Message-ID: <ZoUH8S4j164Ovfiq@pathway.suse.cz>
References: <20240702122639.248110-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
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

On Tue 2024-07-02 14:26:04, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> v2:
>  * Use a struct kmsg_dump_detail to hold the reason and description
>    pointer, for more flexibility if we want to add other parameters.
>    (Kees Cook)
>  * Fix powerpc/nvram_64 build, as I didn't update the forward
>    declaration of oops_to_nvram()
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Looks good to me. With the minor fixes suggested by Kees:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
