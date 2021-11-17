Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F3453EF3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 04:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202FE6E1A7;
	Wed, 17 Nov 2021 03:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357796E1A7;
 Wed, 17 Nov 2021 03:30:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id o4so1282416pfp.13;
 Tue, 16 Nov 2021 19:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=895YRPhGbbjFFaWKhBPRuX0mIQNHTjsRgPz9absSumc=;
 b=Km50OKg0MlphKjrfW3BuIv0bzGFV2p0dZpedVNcVwLbi4SyfUfu7dlj2qRxChw4ODz
 i4iVjdovI+9BZYpmON6a7+nbuVgRMuMhPMkCJF0jdH53UB0GUD+d90vgV3igHhElYhfu
 8egcOk6t/MsxcIcclWESN2GXpVgD3E9GrgMWfnaub/ujr0/L0HkqWyDLvXn3RG4hjcVx
 1UMSw20Y1V/4b2G62R5mK4RQjp7+r45+KXeky9SCCaU27hxB06hLekqg5j6ryz9CiWfy
 ZgajRkxuOgkUv87G/sxQfI8AoQsq6+4zAChFtKx6xS3LXP0mMFrY81In8d9XBkOhyAgu
 u6YQ==
X-Gm-Message-State: AOAM532P9caYoO0Uasx2XuOKt7EXTbAl8kHHcw8LQtkvTtY5PFnfdYPg
 noIVmTq9BYTPkqrzasx++WU=
X-Google-Smtp-Source: ABdhPJwU/IwET3zdClUb2Z5KLHH7EaHhfI8Rb/CQE2Ip9HWx6ygcuQpN7cUyD79BCdr2B54OGTZmNQ==
X-Received: by 2002:a63:f94d:: with SMTP id q13mr2926410pgk.13.1637119809592; 
 Tue, 16 Nov 2021 19:30:09 -0800 (PST)
Received: from garbanzo (136-24-173-63.cab.webpass.net. [136.24.173.63])
 by smtp.gmail.com with ESMTPSA id j7sm3623767pjf.41.2021.11.16.19.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 19:30:08 -0800 (PST)
Date: Tue, 16 Nov 2021 19:30:06 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 12/13] sysctl: add helper to register empty subdir
Message-ID: <20211117033006.qct3ve3tknfy3xy7@garbanzo>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-13-mcgrof@kernel.org>
 <878shasxkp.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878shasxkp.fsf@x220.int.ebiederm.org>
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
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, viro@zeniv.linux.org.uk,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 08:03:02AM -0500, Eric W. Biederman wrote:
> Luis Chamberlain <mcgrof@kernel.org> writes:
> 
> > The way to create a subdirectory from the base set of directories
> > is a bit obscure, so provide a helper which makes this clear, and
> > also helps remove boiler plate code required to do this work.
> 
> I agreee calling:
> register_sysctl("fs/binfmt_misc", sysctl_mount_point)
> is a bit obscure but if you are going to make a wrapper
> please make it the trivial one liner above.
> 
> Say something that looks like:
> 	struct sysctl_header *register_sysctl_mount_point(const char *path)
>         {
>         	return register_sysctl(path, sysctl_mount_point);
>         }
> 
> And yes please talk about a mount point and not an empty dir, as these
> are permanently empty directories to serve as mount points.  There are
> some subtle but important permission checks this allows in the case of
> unprivileged mounts.
> 
> Further code like this belong in proc_sysctl.c next to all of the code
> it is related to so that it is easier to see how to refactor the code if
> necessary.

Alrighty, it's been a while since this kernel/sysctl.c kitchen sink
cleanup... so it's time to respin this now that the merge window is
open.  I already rebased patches, addressed all input and now just
waiting to fix any compilation errors.  I'm going to split the patches
up into real small sets so to ensure we just get this through becauase
getting this in otherwise is going to be hard.

I'd appreciate folk's review once the patches start going out. I think
a hard part will be deciding what tree this should got through.

  Luis
