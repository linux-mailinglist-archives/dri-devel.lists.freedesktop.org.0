Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D61EA0FB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 11:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFCC6E216;
	Mon,  1 Jun 2020 09:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57076E216
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 09:31:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l11so10833238wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 02:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aed0KpZa+n6oM+Y9/I8ZaZIih3OG/g+XsWiovI6NGqw=;
 b=FzzyZCEszTFYNLlJIsocEWdkB6RDd1ZMb3J5bjPqpI7wn/QynpRJzJ2Hf2ZRJf4bZi
 +KoY1ffy8KlQpZH5LkWhsLYDy4/zpfOV3+1gcSrKPCdBo+Dgnv+5bUGFGh9iq/YZqRFK
 NsfIHWflgpbdd452sNVOZqcewy6FW39+UX7IK6Rz2lx4LpHlrS8zKJlhIfIBOoeE/avg
 xGgqPjHBDpaLt2aFcDOAbDYQI7qRe/exZkY78KKt2q6FmdDCjWjIzDCzrdzXthXeKw7E
 9+46oGylU3MJgkbwDMBc1qcGtnKDyLKUuH1dLZikPB0SEdhOOVmG2ijylKNMHkgl4nS5
 N8hg==
X-Gm-Message-State: AOAM533GrW6/hO5vfMP6X2N6Z8wZyAGUs8LBa+FFV0+iRdt8u4AgOjSM
 7TO6828LlrqqyBJ8TuOIcd0=
X-Google-Smtp-Source: ABdhPJyNRSkjW3exixOApKgLqXfkA+TPWPp2VUJc1IXLtetyf1hcrTpaqzjXBbn/FyFfHL9NEXFW/A==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr21256376wrs.356.1591003905547; 
 Mon, 01 Jun 2020 02:31:45 -0700 (PDT)
Received: from localhost (ip-37-188-178-109.eurotel.cz. [37.188.178.109])
 by smtp.gmail.com with ESMTPSA id u13sm10152697wmm.6.2020.06.01.02.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 02:31:44 -0700 (PDT)
Date: Mon, 1 Jun 2020 11:31:42 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: next-20200515: Xorg killed due to "OOM"
Message-ID: <20200601093142.GE1161@dhcp22.suse.cz>
References: <20200526091054.GA12103@amd>
 <20200528090517.GA27484@dhcp22.suse.cz>
 <20200528120354.GB22054@duo.ucw.cz>
 <20200528120750.GC27484@dhcp22.suse.cz>
 <20200531121601.GA14196@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200531121601.GA14196@duo.ucw.cz>
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
Cc: Andrew Morton <akpm@osdl.org>, airlied@linux.ie, x86@kernel.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun 31-05-20 14:16:01, Pavel Machek wrote:
> On Thu 2020-05-28 14:07:50, Michal Hocko wrote:
> > On Thu 28-05-20 14:03:54, Pavel Machek wrote:
> > > On Thu 2020-05-28 11:05:17, Michal Hocko wrote:
> > > > On Tue 26-05-20 11:10:54, Pavel Machek wrote:
> > > > [...]
> > > > > [38617.276517] oom_reaper: reaped process 31769 (chromium), now anon-rss:0kB, file-rss:0kB, shmem-rss:7968kB
> > > > > [38617.277232] Xorg invoked oom-killer: gfp_mask=0x0(), order=0, oom_score_adj=0
> > > > > [38617.277247] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200515+ #117
> > > > > [38617.277256] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 ) 03/31/2011
> > > > > [38617.277266] Call Trace:
> > > > > [38617.277286]  dump_stack+0x54/0x6e
> > > > > [38617.277300]  dump_header+0x45/0x321
> > > > > [38617.277313]  oom_kill_process.cold+0x9/0xe
> > > > > [38617.277324]  ? out_of_memory+0x167/0x420
> > > > > [38617.277336]  out_of_memory+0x1f2/0x420
> > > > > [38617.277348]  pagefault_out_of_memory+0x34/0x56
> > > > > [38617.277361]  mm_fault_error+0x4a/0x130
> > > > > [38617.277372]  do_page_fault+0x3ce/0x416
> > > > 
> > > > The reason the OOM killer has been invoked is that the page fault
> > > > handler has returned VM_FAULT_OOM. So this is not a result of the page
> > > > allocator struggling to allocate a memory. It would be interesting to
> > > > check which code path has returned this. 
> > > 
> > > Should the core WARN_ON if that happens and there's enough memory, or
> > > something like that?
> > 
> > I wish it would simply go away. There shouldn't be really any reason for
> > VM_FAULT_OOM to exist. The real low on memory situation is already
> > handled in the page allocator.
> 
> Umm. Maybe the WARN_ON is first step in that direction? So we can see
> what driver actually did that, and complain to its authors?

This is much harder done than it seems. But maybe this doesn't really
need a full coverage. Some of the code paths which return VM_FAULT_OOM
will simply not fail. But checking for vma->vm_ops->fault() failures
might be interesting. Does the following tell you more about the failure
you can see

diff --git a/mm/memory.c b/mm/memory.c
index 9ab00dcb95d4..5ff023ab7b49 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3442,8 +3442,11 @@ static vm_fault_t __do_fault(struct vm_fault *vmf)
 
 	ret = vma->vm_ops->fault(vmf);
 	if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY |
-			    VM_FAULT_DONE_COW)))
+			    VM_FAULT_DONE_COW))) {
+		if (unlikely(ret & VM_FAULT_OOM))
+			pr_warn("VM_FAULT_OOM returned from %ps\n", vma->vm_ops->fault);
 		return ret;
+	}
 
 	if (unlikely(PageHWPoison(vmf->page))) {
 		if (ret & VM_FAULT_LOCKED)

-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
