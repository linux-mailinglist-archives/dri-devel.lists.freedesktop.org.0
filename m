Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E11E7C3E
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 13:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531016E8D3;
	Fri, 29 May 2020 11:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1386E8D0;
 Fri, 29 May 2020 11:49:15 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q24so1249351pjd.1;
 Fri, 29 May 2020 04:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tKgvLnMoVN03KmyidTRu63JbswSykU0phmRWaMSE1pQ=;
 b=DHg1gPkel40Qa6EBvlFf9TNSNOIR63bMPPSM8LL6XuYcY4xSNxHRnfKk5wdSrhlSOP
 /xdX9sicPFWLLTKewdKNeCA8RYzMgXtqahBjGPe2hTNA5imHmglvWRaZqQ3k1E75JTP1
 FWbnVMbg0MxMY3YrtVmECF0JLVte1bSQWb/BejnfuWr0yppiGgcWVegApUsq1w96cxKd
 K/kvVDiYKLmQ5gVFtIBZUGIapk73eI4HXaPacK0o+anlKq5MbuEVTeLei5gGn8mtoo32
 8l1rxGWznhyPzZOhm3NXFzfrjfR03qTRKlvRP3FesNoX9ll+jVlHmju1ayKBlzsS1+U4
 GZJw==
X-Gm-Message-State: AOAM531xGA3OaTdCb/Rn2HZ96AqHRyyYPhe1Ok6xJSO9i4ocxEQxPW4b
 Mq0KXyFYoqtkL8xrh7/IZZ0=
X-Google-Smtp-Source: ABdhPJxrT0WKEXd0Z0T8tqO8BKoAs/7a7rNPvktegNOfLVWuhUKQCRCyfP/hkaSF2EJJ+Sxqdt5Lrw==
X-Received: by 2002:a17:90a:c7d8:: with SMTP id
 gf24mr8959455pjb.218.1590752955275; 
 Fri, 29 May 2020 04:49:15 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id go1sm7188741pjb.26.2020.05.29.04.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 04:49:13 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id D2F254046C; Fri, 29 May 2020 11:49:12 +0000 (UTC)
Date: Fri, 29 May 2020 11:49:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [Intel-gfx] [PATCH 06/13] ocfs2: use new sysctl subdir helper
 register_sysctl_subdir()
Message-ID: <20200529114912.GC11244@42.do-not-panic.com>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-7-mcgrof@kernel.org>
 <202005290121.C78B4AC@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202005290121.C78B4AC@keescook>
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
 rdna@fb.com, yzaikin@google.com, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, jlbec@evilplan.org,
 nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk, tytso@mit.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 01:23:19AM -0700, Kees Cook wrote:
> On Fri, May 29, 2020 at 07:41:01AM +0000, Luis Chamberlain wrote:
> > This simplifies the code considerably. The following coccinelle
> > SmPL grammar rule was used to transform this code.
> > 
> > // pycocci sysctl-subdir.cocci fs/ocfs2/stackglue.c
> > 
> > @c1@
> > expression E1;
> > identifier subdir, sysctls;
> > @@
> > 
> > static struct ctl_table subdir[] = {
> > 	{
> > 		.procname = E1,
> > 		.maxlen = 0,
> > 		.mode = 0555,
> > 		.child = sysctls,
> > 	},
> > 	{ }
> > };
> > 
> > @c2@
> > identifier c1.subdir;
> > 
> > expression E2;
> > identifier base;
> > @@
> > 
> > static struct ctl_table base[] = {
> > 	{
> > 		.procname = E2,
> > 		.maxlen = 0,
> > 		.mode = 0555,
> > 		.child = subdir,
> > 	},
> > 	{ }
> > };
> > 
> > @c3@
> > identifier c2.base;
> > identifier header;
> > @@
> > 
> > header = register_sysctl_table(base);
> > 
> > @r1 depends on c1 && c2 && c3@
> > expression c1.E1;
> > identifier c1.subdir, c1.sysctls;
> > @@
> > 
> > -static struct ctl_table subdir[] = {
> > -	{
> > -		.procname = E1,
> > -		.maxlen = 0,
> > -		.mode = 0555,
> > -		.child = sysctls,
> > -	},
> > -	{ }
> > -};
> > 
> > @r2 depends on c1 && c2 && c3@
> > identifier c1.subdir;
> > 
> > expression c2.E2;
> > identifier c2.base;
> > @@
> > -static struct ctl_table base[] = {
> > -	{
> > -		.procname = E2,
> > -		.maxlen = 0,
> > -		.mode = 0555,
> > -		.child = subdir,
> > -	},
> > -	{ }
> > -};
> > 
> > @r3 depends on c1 && c2 && c3@
> > expression c1.E1;
> > identifier c1.sysctls;
> > expression c2.E2;
> > identifier c2.base;
> > identifier c3.header;
> > @@
> > 
> > header =
> > -register_sysctl_table(base);
> > +register_sysctl_subdir(E2, E1, sysctls);
> > 
> > Generated-by: Coccinelle SmPL
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  fs/ocfs2/stackglue.c | 27 ++++-----------------------
> >  1 file changed, 4 insertions(+), 23 deletions(-)
> > 
> > diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
> > index a191094694c6..addafced7f59 100644
> > --- a/fs/ocfs2/stackglue.c
> > +++ b/fs/ocfs2/stackglue.c
> > @@ -677,28 +677,8 @@ static struct ctl_table ocfs2_mod_table[] = {
> >  	},
> >  	{ }
> >  };
> > -
> > -static struct ctl_table ocfs2_kern_table[] = {
> > -	{
> > -		.procname	= "ocfs2",
> > -		.data		= NULL,
> > -		.maxlen		= 0,
> > -		.mode		= 0555,
> > -		.child		= ocfs2_mod_table
> > -	},
> > -	{ }
> > -};
> > -
> > -static struct ctl_table ocfs2_root_table[] = {
> > -	{
> > -		.procname	= "fs",
> > -		.data		= NULL,
> > -		.maxlen		= 0,
> > -		.mode		= 0555,
> > -		.child		= ocfs2_kern_table
> > -	},
> > -	{ }
> > -};
> > +	.data		= NULL,
> > +	.data		= NULL,
> 
> The conversion script doesn't like the .data field assignments. ;)
> 
> Was this series built with allmodconfig? I would have expected this to
> blow up very badly. :)

Yikes, sense, you're right. Nope, I left the random config tests to
0day. Will fix, thanks!

  Luis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
