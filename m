Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058241E7CF5
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 14:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D056E8DC;
	Fri, 29 May 2020 12:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EDD6E8DC;
 Fri, 29 May 2020 12:16:43 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z26so1286334pfk.12;
 Fri, 29 May 2020 05:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1QRcJc+0V37tU9/CoMttBOeUhGM/q++JCRSrvKfZi1c=;
 b=Zu+zP9v5T1sxGmfLKjSOdmmJwnFKNbKi6U+K8CxImeDj1zFL0WWILzOyQ5rm7vaJj0
 bcPhCVekiIcvZ2jaafrCXFy8jZR3jOVQTStSlCKfVlXTp76hZD5rerl8L2qXvoWBS2H0
 oJqX8n44giR9Xdbe1TvhzBzPI/cbONRTAbyOKNQGJ5N7nD3KVKkYvI4DeZLygq9vVQWQ
 yyjeJVvHtLsBSx6zslsWrhsWiUiPVvmhqyiiRyUJHgGoiT6DTybd3LF30nXkoCQ0h3Ev
 Em9c+hBn8bW7elAt1s4/iLHZYsj7tZz6/pRKcb+ejUgbWQQc7FJouaGmHl7QMK29gngD
 DEUA==
X-Gm-Message-State: AOAM533uzSqvhJoCuzyDOWQXwb02COhj8Rh892FuIqZ4uWDBVQtsT14W
 DHNjQeVGNK3PJ/ZaKCS899Y=
X-Google-Smtp-Source: ABdhPJyXXen44MBfu6MyEx4C7z2Ttl/Mr2eBWsGlqpPiqejkkDLE4gTu0+5b69yRv2/USHCPT392yg==
X-Received: by 2002:a63:dc0f:: with SMTP id s15mr7843478pgg.182.1590754602683; 
 Fri, 29 May 2020 05:16:42 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id z13sm7663876pfj.153.2020.05.29.05.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:16:41 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 982654046C; Fri, 29 May 2020 12:16:40 +0000 (UTC)
Date: Fri, 29 May 2020 12:16:40 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 01/13] sysctl: add new register_sysctl_subdir() helper
Message-ID: <20200529121640.GE11244@42.do-not-panic.com>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-2-mcgrof@kernel.org>
 <87d06n17mm.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d06n17mm.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, keescook@chromium.org, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, jlbec@evilplan.org,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 11:13:21AM +0300, Jani Nikula wrote:
> On Fri, 29 May 2020, Luis Chamberlain <mcgrof@kernel.org> wrote:
> > Often enough all we need to do is create a subdirectory so that
> > we can stuff sysctls underneath it. However, *if* that directory
> > was already created early on the boot sequence we really have no
> > need to use the full boiler plate code for it, we can just use
> > local variables to help us guide sysctl to place the new leaf files.
> 
> I find it hard to figure out the lifetime requirements for the tables
> passed in; when it's okay to use local variables and when you need
> longer lifetimes. It's not documented, everyone appears to be using
> static tables for this. It's far from obvious.

I agree 2000% that it is not obvious. What made me consider it was that
I *knew* that the base directory would already exist, so it wouldn't
make sense for the code to rely on earlier parts of a table if part
of the hierarchy already existed.

In fact, a *huge* part of the due dilligence on this and futre series
on this cleanup will be to be 100% sure that the base path is already
created. And so this use is obviously dangerous, you just *need* to
know that the base path is created before.

Non-posted changes also deal with link order to help address this
in other places, given that link order controls how *initcalls()
(early_initcall(), late_initcall(), etc) are ordered if you have
multiple of these.

I had a link order series long ago which augmented our ability to make
things clearer at a link order. Eventually I believe this will become
more important, specially as we end up wanting to async more code.

For now, we can only rely on manual code inspection for ensuring
proper ordering. Part of the implicit aspects of this cleanup is
to slowly make these things clearer for each base path.

So... the "fs" base path will actually end up being created in
fs/sysctl.c after we are *fully* done with the fs sysctl cleanups.

  Luis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
