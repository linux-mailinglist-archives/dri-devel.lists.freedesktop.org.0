Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E151FA29
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3A910EA30;
	Mon,  9 May 2022 10:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9362610EA30
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:44:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w4so18795578wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 03:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oLgVaTlTDXgUX6d5oxdF7XG7KD8YlqPFqEct4VY7hn0=;
 b=74qYgLEXsGy0sAQjUC9BCLUS84imSTbMaWZW9LMAf1QJdmlywMXtqwnBYQsPYBvwmp
 ZQ+qoiuTJ9JwhUmDnirSHWP8hY0cyhf1DXedDh083rHqx3czDdXVLbtoIQXbP9E2T2zP
 LXRVBDeYl9jQ6KRBTYCjUA4r/XyG5fvscuQsUFNczwJOWUHsTaHg62FKJfw3SAV4GKab
 YGsE4aIfU6rNmRGm3AljHUhHVFn7XM6BUbxbAmUt5IwIKsSbIZn/MEs/rWrIxeSG1YSR
 EISeBpBtgDzg0bFj3td17A4vuttM17HVO8QRG1YwCC0GCPBjZezTW+iRuPPcej+D+c9w
 3ENQ==
X-Gm-Message-State: AOAM530kIZJavys3B8LpFy6hmg5g3aSs+dfuWmfCXylg4JLW9GhPbG6w
 jFy2NXOaCzBb3eR5V3Wqis8=
X-Google-Smtp-Source: ABdhPJwDKaChWloXe++r5p1goEJJuS40KKco4mLZWce3U6q798YBSkWjgoJuS1gFOHxVdXkf6GhOpA==
X-Received: by 2002:a5d:590d:0:b0:20a:c3eb:2584 with SMTP id
 v13-20020a5d590d000000b0020ac3eb2584mr13000908wrd.18.1652093087866; 
 Mon, 09 May 2022 03:44:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 q1-20020adf9dc1000000b0020c5253d8b8sm11582748wre.4.2022.05.09.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:44:47 -0700 (PDT)
Date: Mon, 9 May 2022 10:44:45 +0000
From: Wei Liu <wei.liu@kernel.org>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Message-ID: <20220509104445.umicxfdpy65nm4us@liuwe-devbox-debian-v2>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
 <20220504172307.GB1623@bug>
 <PH0PR21MB302590D20E95D9076FDA9C99D7C79@PH0PR21MB3025.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR21MB302590D20E95D9076FDA9C99D7C79@PH0PR21MB3025.namprd21.prod.outlook.com>
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
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 vkuznets <vkuznets@redhat.com>, KY Srinivasan <kys@microsoft.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "deller@gmx.de" <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 08, 2022 at 03:43:26PM +0000, Michael Kelley (LINUX) wrote:
> From: Pavel Machek <pavel@ucw.cz> Sent: Wednesday, May 4, 2022 10:23 AM
> > 
> > Hi!
> > 
> > > Linux code for running as a Hyper-V guest includes special cases for the
> > > first released versions of Hyper-V: 2008 and 2008R2/Windows 7. These
> > > versions were very thinly used for running Linux guests when first
> > > released more than 12 years ago, and they are now out of support
> > > (except for extended security updates). As initial versions, they
> > > lack the performance features needed for effective production usage
> > > of Linux guests. In total, there's no need to continue to support
> > > the latest Linux kernels on these versions of Hyper-V.
> > >
> > > Simplify the code for running on Hyper-V by removing the special
> > > cases. This includes removing the negotiation of the VMbus protocol
> > > versions for 2008 and 2008R2, and the special case code based on
> > > those VMbus protocol versions. Changes are in the core VMbus code and
> > > several drivers for synthetic VMbus devices.
> > 
> > > 2008 and 2008R2, so if the broader Linux kernel community surfaces
> > > a reason why this clean-up should not be done now, we can wait.
> > > But I think we want to eventually stop carrying around this extra
> > > baggage, and based on discussions with the Hyper-V team within
> > > Microsoft, we're already past the point that it has any value.
> > 
> > Normal way to do such deprecations is to put printks in first, then hide it
> > under config option noone sets, and wait for year or so if anyone complains.
> > 
> 
> Are there any examples of doing these deprecation steps that you can
> point me to?  I did not see anything in the Documentation directory
> covering the deprecation process you describe.
> 
> I'd also make the case that we are already well down the deprecation
> path.  For at least the last 5 years, the public Microsoft documentation
> for Linux guests has listed Hyper-V 2012 R2 as the earliest supported
> Hyper-V version.  Other current and new Microsoft products aren't
> supported on Hyper-V 2008/Win7 either -- the usual Word/Excel/
> PowerPoint, etc. fall into this category as well as Windows 10 and Windows
> 11 as guests.  So for a rare user who might still be using Hyper-V
> 2008/Win7, there's no reasonable expectation of being able to run
> the latest upstream Linux kernel on Hyper-V 2008/Win7.  Other
> current software doesn't.
> 
> Given that running Linux guests on Hyper-V sort of implicitly
> combines Microsoft commercial thinking and Linux open source
> thinking about version support, I could see putting the old Hyper-V
> version support under a config option that defaults to "no", with a 
> deprecation comment, and seeing if that garners any complaints.
> But given the broader situation with Hyper-V 2008/Win7, in my
> judgment even that is more cautious than we need to be.
> 

In general we should trust the judgement from the main developers.

There have been recent examples that things are dropped without any
deprecation warnings. See below.

By and large the usefulness of the code in kernel relies on a lot of
factors. In this particular case, I don't think adding a KCONFIG makes
sense. Printing a warning in _guest_ won't help. Whoever still runs
these ancient versions has had ample warnings.

Thanks,
Wei.

commit c645a883df34ee10b884ec921e850def54b7f461
Author:     NeilBrown <neilb@suse.de>
AuthorDate: Thu Sep 2 11:15:29 2021 +1000
Commit:     J. Bruce Fields <bfields@redhat.com>
CommitDate: Sat Oct 2 15:51:10 2021 -0400

    NFSD: drop support for ancient filehandles

    Filehandles not in the "new" or "version 1" format have not been handed
    out for new mounts since Linux 2.4 which was released 20 years ago.
    I think it is safe to say that no such file handles are still in use,
    and that we can drop support for them.

    Signed-off-by: NeilBrown <neilb@suse.de>
    Signed-off-by: J. Bruce Fields <bfields@redhat.com>

commit 9b472e85d098a40b84dd8b33fbf8a15ab1452025
Author:     Nick Desaulniers <ndesaulniers@google.com>
AuthorDate: Thu May 6 18:04:54 2021 -0700
Commit:     Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: Fri May 7 00:26:32 2021 -0700

    gcov: clang: drop support for clang-10 and older

    LLVM changed the expected function signatures for llvm_gcda_start_file()
    and llvm_gcda_emit_function() in the clang-11 release.  Drop the older
    implementations and require folks to upgrade their compiler if they're
    interested in GCOV support.

    Link: https://reviews.llvm.org/rGcdd683b516d147925212724b09ec6fb792a40041
    Link: https://reviews.llvm.org/rG13a633b438b6500ecad9e4f936ebadf3411d0f44
    Link: https://lkml.kernel.org/r/20210312224132.3413602-3-ndesaulniers@google.com
    Link: https://lkml.kernel.org/r/20210413183113.2977432-1-ndesaulniers@google.com
    Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
    Suggested-by: Nathan Chancellor <nathan@kernel.org>
    Acked-by: Peter Oberparleiter <oberpar@linux.ibm.com>
    Reviewed-by: Nathan Chancellor <nathan@kernel.org>
    Reviewed-by: Fangrui Song <maskray@google.com>
    Cc: Prasad Sodagudi <psodagud@quicinc.com>
    Cc: Johannes Berg <johannes.berg@intel.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
