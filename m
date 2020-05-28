Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E41E5FDB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A396E504;
	Thu, 28 May 2020 12:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966E66E504
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:07:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r9so2877004wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fX1cujbgfbt/VM5a/7eMs0kHkEp+fJc6bInREoz+SAI=;
 b=dR/1mV0L9RHURLnul10Svgg2+n3ijFbQfFGxsDHR+et91DK4iGugWr1o4vZia/1s5E
 PruJdzAULbOnsCZSpyxfNDH6DjHXou6JV0vqSfRZDqhP+uONrZdvn3/bF2F07hUsTdyt
 cFJ/MnkPOy7QudR8nOzQ61VkszMzpashLSlVw9yxoCVhR60iLx7g87K5kg47iO2OcAQg
 6/iIxGdSSQUn+lljHDLZ65MNA884LU2quUTLGf5ZcbGMwuQlT1j1Q3aULfpNpvOjqctt
 w0ZBLmxKXXMgZYJilfrgj4uzRU4VUzRqNxfnKH+/IQFhDbm36D35uniVBg2KifAYG6nd
 rdzw==
X-Gm-Message-State: AOAM5332pTXjJ+3d8h7BdpxjUB4bdpFVuQBWekqTMi9VwgBJsT8NPhbw
 +41+cx4IUOrHzmAQRrLTeag=
X-Google-Smtp-Source: ABdhPJw2dn25o5ZhsRcMskgXExklPfpC8pBiTQuJ7MSlKTB+XEWW9AxfZMKa8mVSNRnjxPHc3rxpfA==
X-Received: by 2002:a1c:117:: with SMTP id 23mr3291422wmb.90.1590667673252;
 Thu, 28 May 2020 05:07:53 -0700 (PDT)
Received: from localhost (ip-37-188-185-40.eurotel.cz. [37.188.185.40])
 by smtp.gmail.com with ESMTPSA id 62sm5912776wrm.1.2020.05.28.05.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:07:52 -0700 (PDT)
Date: Thu, 28 May 2020 14:07:50 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: next-20200515: Xorg killed due to "OOM"
Message-ID: <20200528120750.GC27484@dhcp22.suse.cz>
References: <20200526091054.GA12103@amd>
 <20200528090517.GA27484@dhcp22.suse.cz>
 <20200528120354.GB22054@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528120354.GB22054@duo.ucw.cz>
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

On Thu 28-05-20 14:03:54, Pavel Machek wrote:
> On Thu 2020-05-28 11:05:17, Michal Hocko wrote:
> > On Tue 26-05-20 11:10:54, Pavel Machek wrote:
> > [...]
> > > [38617.276517] oom_reaper: reaped process 31769 (chromium), now anon-rss:0kB, file-rss:0kB, shmem-rss:7968kB
> > > [38617.277232] Xorg invoked oom-killer: gfp_mask=0x0(), order=0, oom_score_adj=0
> > > [38617.277247] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200515+ #117
> > > [38617.277256] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 ) 03/31/2011
> > > [38617.277266] Call Trace:
> > > [38617.277286]  dump_stack+0x54/0x6e
> > > [38617.277300]  dump_header+0x45/0x321
> > > [38617.277313]  oom_kill_process.cold+0x9/0xe
> > > [38617.277324]  ? out_of_memory+0x167/0x420
> > > [38617.277336]  out_of_memory+0x1f2/0x420
> > > [38617.277348]  pagefault_out_of_memory+0x34/0x56
> > > [38617.277361]  mm_fault_error+0x4a/0x130
> > > [38617.277372]  do_page_fault+0x3ce/0x416
> > 
> > The reason the OOM killer has been invoked is that the page fault
> > handler has returned VM_FAULT_OOM. So this is not a result of the page
> > allocator struggling to allocate a memory. It would be interesting to
> > check which code path has returned this. 
> 
> Should the core WARN_ON if that happens and there's enough memory, or
> something like that?

I wish it would simply go away. There shouldn't be really any reason for
VM_FAULT_OOM to exist. The real low on memory situation is already
handled in the page allocator.

-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
