Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94FB1E7CA3
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 14:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094846E8DF;
	Fri, 29 May 2020 12:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49676E8DA;
 Fri, 29 May 2020 12:09:14 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id 5so1270156pjd.0;
 Fri, 29 May 2020 05:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6vvgKHZv01UUvGrvhAsOqf6+UpVrlcy+OwWplQqQmoA=;
 b=UUVtofIwQNHqPTitzSAJjBz9ueAdSfUpALXKo4+RjiPgO/EgXDkNGXc+BwlvQEIgZq
 iw+1PoCNVP462mcYd9Qf9xmE2zYnjjQNjcxQ8KUj2YzVAP3Pp127N9j0C7XRaCMeE/ur
 BGjVMrOTi565aowPxyHTrxelVIf+k1q1F3IuztwpQIGNFSxm/QgiVAx7Yapr/HddizeW
 JMm3IvolNORwH6hpehAF0BRQ2NFCKqDT2idGGgXykeK49M7ircRKsWNnU3yTA6E7vhu/
 Po/QUYKGXuZSZTQF1iXVqj4r05qFviFaMmexfyDSyux/ePCRuS3sl8JAT63kpPEi4kvR
 pnjw==
X-Gm-Message-State: AOAM531NQMqpWsgIPXtwP0deb6xn1EFezLJnImJoT4nGYns2Ng/rIumq
 DGskBbcxTVlAZvVRTOuXNoY=
X-Google-Smtp-Source: ABdhPJwH0ItHfFV94FqIi+i7pGGCJoHNOMavuCMZwaTSNJ24JRmSNe+lTFt06Kawbit8Fif5KqcKXw==
X-Received: by 2002:a17:90a:ce11:: with SMTP id
 f17mr2283340pju.123.1590754154418; 
 Fri, 29 May 2020 05:09:14 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id l187sm7199102pfl.218.2020.05.29.05.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:13 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id AE8314046C; Fri, 29 May 2020 12:09:12 +0000 (UTC)
Date: Fri, 29 May 2020 12:09:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 09/13] firmware_loader: simplify sysctl declaration with
 register_sysctl_subdir()
Message-ID: <20200529120912.GD11244@42.do-not-panic.com>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-10-mcgrof@kernel.org>
 <20200529102613.GA1345939@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529102613.GA1345939@kroah.com>
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
 tytso@mit.edu, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 12:26:13PM +0200, Greg KH wrote:
> On Fri, May 29, 2020 at 07:41:04AM +0000, Luis Chamberlain wrote:
> > From: Xiaoming Ni <nixiaoming@huawei.com>
> > 
> > Move the firmware config sysctl table to fallback_table.c and use the
> > new register_sysctl_subdir() helper. This removes the clutter from
> > kernel/sysctl.c.
> > 
> > Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  drivers/base/firmware_loader/fallback.c       |  4 ++++
> >  drivers/base/firmware_loader/fallback.h       | 11 ++++++++++
> >  drivers/base/firmware_loader/fallback_table.c | 22 +++++++++++++++++--
> >  include/linux/sysctl.h                        |  1 -
> >  kernel/sysctl.c                               |  7 ------
> >  5 files changed, 35 insertions(+), 10 deletions(-)
> 
> So it now takes more lines than the old stuff?  :(

Pretty much agreed with the other changes, thanks for the review!

But this diff-stat change, indeed, it is unfortunate that we end up
with more code here than before. We'll try to reduce it instead
somehow, however in some cases during this spring-cleaning, since
the goal is to move code from one file to another, it *may* require
more code. So it won't always be negative. But we'll try!

  Luis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
