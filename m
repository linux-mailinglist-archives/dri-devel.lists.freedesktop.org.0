Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99521AE718
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 23:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBD86EB08;
	Fri, 17 Apr 2020 21:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707F76EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 21:03:59 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s30so3237425qth.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rayXkPMTvyEUYklaCAtMjFG9Chmi5MuVc5AOhvk8N7Q=;
 b=YPNeihe8y1OAZFazdpXRjIQpI3r+nJVGEdfGAbNf5sYUf0qUhr8nj2WB/cVcf2K7WO
 PgLDX2OHZG2G7hGYobOwJX8Q4Yg1dkOOaba8wIMc9vt+OQsPwFtiHBnb1hUyjGqX4LAe
 ++wecYiw1HIsF+Avn+rrzd1SxpNqmZbVtGjGQmXbtl5jX2QIGIs5mLCs5g4ZzThIJiVc
 1c6e5h2qpziyXZt5NqQdn8LlJfBNtHl1n843IUMSiEDrD3BY/tj7gOkhAnMl/cv+1SuW
 cZc3gfv8k5daaugxxpOZS1I0iOI9iYqUyKEtbvZkyzlx/WTz26IOiWdb/OZvYK6GwOMD
 EkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=rayXkPMTvyEUYklaCAtMjFG9Chmi5MuVc5AOhvk8N7Q=;
 b=jAHDes59qztJEQlSaS34uc9vmKrrcgOY2xoKTdYRV6W2XxhBH3SxGE1/bOf7sVVUOk
 bKMjRWMPutma5HOp/xPOGSKUK0wzLbMzMfyJuOH8OSaFj7oIJQX19JVtu+eYBCq68djO
 w3dtATEaHDPZt8deb3pfbTab6Z0DkXBcc3SiAsl52feKxwKiAk6W7iHaJxiN0425Y6dz
 2moU5gw34cqQkcA8/NeCggBxjl7D0d7WV8NwsP7pzJ3WYJLXlVQq87R5E1gfWdeQN7Nf
 +BKX6HLJn5dHWP/gFTG9Z9ZuaEPKhumYzJCd3xOka/bJowqvd/lBcIib187qqDKS15Ha
 sQfQ==
X-Gm-Message-State: AGi0Puak0v0/2z+fzRIIzTHl35QpRIXna0uLCAsAnC5bGsZwv7yQ34Mc
 6by1BybDlnGWkS2Dm/DZ4n8=
X-Google-Smtp-Source: APiQypKIVQ8hdaQ1vCuE867BQCUCmtBXe+Xpywn6R7+5hJxsZTFQRclqRPdZKOoS8F649kM4cVnHXg==
X-Received: by 2002:ac8:5645:: with SMTP id 5mr5021838qtt.151.1587157438243;
 Fri, 17 Apr 2020 14:03:58 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::c4b0])
 by smtp.gmail.com with ESMTPSA id l24sm9684293qtp.8.2020.04.17.14.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 14:03:57 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:03:56 -0400
From: Tejun Heo <tj@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Poke: Tejun] Re: [RFC v3 03/11] drm/vblank: Add vblank works
Message-ID: <20200417210356.GD43469@mtj.thefacebook.com>
References: <20200417194145.36350-1-lyude@redhat.com>
 <20200417194145.36350-4-lyude@redhat.com>
 <ef9da9d93022822fe4bec7e906540fcc9852ce59.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef9da9d93022822fe4bec7e906540fcc9852ce59.camel@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Apr 17, 2020 at 04:16:28PM -0400, Lyude Paul wrote:
> Hey Tejun! So I ended up rewriting the drm_vblank_work stuff so that it used
> kthread_worker. Things seem to work alright now. But while we're doing just
> fine with vblank workers on nouveau, we're still having trouble meeting the
> time constraints needed for using vblank works for i915's needs. There still
> seems to be a considerable latency between when the irq handler for the vblank
> interrupts fires, and when the actual drm_vblank_work we scheduled starts:
...
> Tejun, do you have any idea if we might be able to further reduce the latency
> from the scheduler here? I believe we're already using pm_qos to at least
> reduce the latency between when the vblank interrupt fires and the interrupt
> handler starts, but that still isn't enough to fix the other latency issues
> apparently. We're also already setting the priority of kthread_worker->task to
> RT_FIFO as well.

I don't think the kernel can do much better than what you're seeing. I don't
know the time scale that you need - is it some tens of microseconds range? I'm
definitely not an expert on the subject but on generic kernels I don't think
you can achieve anything sub millisec with any kind of reliability.

If the timing is that tight and it's not a hot path, the right solution may be
polling for it rather than yielding the cpu and hoping to get scheduled in
time.

> Also, of course, let me know if you're not happy with the
> __kthread_queue_work() changes/kthread_worker usage in drm_vblank_work as well

Just glanced over it and I still wonder whether it needs to be that tightly
integrated, but we can look into that once we settle on whether this is the
right direction.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
