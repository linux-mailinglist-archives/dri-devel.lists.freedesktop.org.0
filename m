Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609427DD81
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 02:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB076E4A1;
	Wed, 30 Sep 2020 00:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9916E4A1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 00:48:56 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id u3so128204pjr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 17:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jfDxSkmpPjqtsnMdFLpAkBQJrfG5Oh0rLzmY203/J8Q=;
 b=fHcGrnQkLaCp+GP2WXdS/8+17sMxE6Exgu/8HJoq8GDh/Eql+Lkf0WNyQGeD4bTKRo
 eLKMZlmMcovC3ncFDCH7+X6AqjWM3hfTOrT7IqMttOTvSWOv18wnyn8fQTj2Q1FHIZqZ
 FFVFz6JkUurMhciKXo7irkeSNXneQPsp9jOrhEt9qTvDlz6pvQWfqevJVS9nbpr0n8f7
 xLZU3kY8aWrDTmL5Lg+n/IwG5JgDM1cyd/cTM9toTpxQD8hWsv7pOviLBbXI1OfC64W+
 E54nMpWT7Ov+YZHEBHDj7afFLOEvxm9iHts7Yzz22RHGxTy/C/s1TAV0KbcEscoGSMrN
 n2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jfDxSkmpPjqtsnMdFLpAkBQJrfG5Oh0rLzmY203/J8Q=;
 b=LQuaO8fkHpFrwsD1XHS+pkE0JH4+Ks9QUCoRIUzbveuZT5nbXhsNQRDT34dM73DVqc
 uwGcsRPtjubTeRQXHFk31+kJPlSlkJ2oBZ1G9L9x92t+rN9+gIkOp6++UbQKwDIV2t4U
 OZSd+46JDwI7RyGOEI1OtT6Y+NxL45TxRHmwR2cMckRNPm19ZP/vcRNuj3Xsie06PWEJ
 QgDm2JB4b5lHeb5pcjVdowvVf5ct5MeJ2GUlBc4l0/IF7w/ghyOTSTy8NwiGWRvmPxZj
 64AMuP8+ArHEt8jcNJnfYL324NGj3V21LROtShTl/ZmJKgFtYgI/uf1tGWKN4rGFpj7A
 i1EA==
X-Gm-Message-State: AOAM533WPv7wcbjByRULmSvm9NpYlFxR963P6wdhCQEumXgeyFGmfjZt
 /2+RYmrns4zaZmtSgznE8QQ=
X-Google-Smtp-Source: ABdhPJy9FBbKj5N52pO00whzAXKOxk2MPPEDOlfxBFIP2v8O6ew2JFpzwVY/2se0ETWEgL1lerE+vQ==
X-Received: by 2002:a17:90a:14a4:: with SMTP id
 k33mr181739pja.236.1601426935677; 
 Tue, 29 Sep 2020 17:48:55 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id u2sm74238pji.50.2020.09.29.17.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 17:48:54 -0700 (PDT)
Date: Wed, 30 Sep 2020 09:48:52 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [External] Re: [PATCH 2/2] sched: mark
 PRINTK_DEFERRED_CONTEXT_MASK in __schedule()
Message-ID: <20200930004852.GA987@jagdpanzerIV.localdomain>
References: <20200927161130.33172-1-zhouchengming@bytedance.com>
 <20200927161130.33172-2-zhouchengming@bytedance.com>
 <20200928073202.GA2611@hirez.programming.kicks-ass.net>
 <40ab934e-5b8b-735b-da65-3043efab9fdc@bytedance.com>
 <20200928090143.GA2628@hirez.programming.kicks-ass.net>
 <688eadd7-4ca3-3e32-3520-25977ff059a6@bytedance.com>
 <20200928102559.GF2611@hirez.programming.kicks-ass.net>
 <20200929142750.GT6442@alley>
 <20200929150933.GR2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929150933.GR2628@hirez.programming.kicks-ass.net>
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
Cc: juri.lelli@redhat.com, Petr Mladek <pmladek@suse.com>,
 vincent.guittot@linaro.org, john.ogness@linutronix.de, airlied@linux.ie,
 songmuchun@bytedance.com, linux-kernel@vger.kernel.org, bsegall@google.com,
 sergey.senozhatsky@gmail.com, mingo@redhat.com, rostedt@goodmis.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, mgorman@suse.de,
 dietmar.eggemann@arm.com, Chengming Zhou <zhouchengming@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (20/09/29 17:09), Peter Zijlstra wrote:
> > 2. The registration and unregistration of consoles should not longer
> >    be handled by console_lock (semaphore). It should be possible to
> >    call most consoles without a sleeping lock. It should remove all
> >    these deadlocks between printk() and scheduler().
> 
> I'm confused, who cares about registation? That only happens once at
> boot, right?

You can modprobe or rmmod (register/unregister) netconsole anytime,
for example.

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
