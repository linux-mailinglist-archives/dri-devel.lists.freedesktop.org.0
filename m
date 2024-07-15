Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7F931057
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5410E313;
	Mon, 15 Jul 2024 08:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Zuh4YkhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F67010E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:45:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42671c659e4so3184585e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721033110; x=1721637910; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPt43vWv7W7uWoCMBzaMsxBX+ZmRLoqnMa3kAMiQQGg=;
 b=Zuh4YkhGanY+eLSssTNeaxx3d2F9/74+poWZu30D/nyPAw5VgF3gaeaa+kjUqz5jyh
 zADcvYHRf+wygpJCszqEFiJ+G7YvHUgFagptsYxkie8dxA2JP+kMjykEMztOLTiTjmkq
 cmGKmECgQ33NB67JAT5k+5BlGR3s67xkVOFCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721033110; x=1721637910;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mPt43vWv7W7uWoCMBzaMsxBX+ZmRLoqnMa3kAMiQQGg=;
 b=dxxQRjeVftoZoLIprJkL1MfiNWeKwLq8jPiX4CxEd/nnvp11DpoAYiv004wTDyAF+T
 U2/00mQjiT7vVYLTPtx27TBAT+cdQOo+pDomVQCpq39gKx2ugv0pFEtUXK9VEUboV00e
 KXJWg94ce9Tb59EbI0be6oZRodeiTK2iGGFsY6EwjEPp4wTETVJoceO08FX8mhy7h9K7
 ul5ozBbR94wqeSS3cWGH9bp4yGUqztpU/cjjYN+k5S/6tiwcie6hWZ7oxNG3Tktysf8T
 KutQgGTRTK7HTRq0WMLPphfMAbC9BGI0utXwrGYbOUcpgnEr1e2AU+sDUTa+EKXvE54B
 Xiig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOmLE3cq7PNVzTHnpX3MiKg+Ilqi3fC9bI7zM0szA/LfGPyVAWR8nYrVbX1Sdt/hGQHhF9VWolqCvHlis3Gxuxs9Kt+/iM8AbfmkLbXLY4
X-Gm-Message-State: AOJu0Yx5X6U0oIXi2Kr1yvdc6wYYYitO97k4s0PhZtXWVpV+KqEFF/WT
 tmfF4yhqu3zfssKDJIq6APZOkQL7cslTzmE3u9fR1vEDYnpiKKsdKCe6ULOGhHs=
X-Google-Smtp-Source: AGHT+IHkDheiQWPRAvAOHQTkNQHOAUKicTVB0J2JBhxVC1tcwLKXg6dTru289RnVzPDELy4A5wdRbw==
X-Received: by 2002:a05:6000:2a4:b0:360:872b:7e03 with SMTP id
 ffacd0b85a97d-367f05439c1mr7021710f8f.0.1721033110619; 
 Mon, 15 Jul 2024 01:45:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccbd2sm5664721f8f.49.2024.07.15.01.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 01:45:10 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:45:08 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: John Ogness <john.ogness@linutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] bcachefs: no console_lock in bch2_print_string_as_lines
Message-ID: <ZpThlAGUsPXZArvk@phenom.ffwll.local>
Mail-Followup-To: John Ogness <john.ogness@linutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20240710093120.732208-2-daniel.vetter@ffwll.ch>
 <20240710130335.765885-1-daniel.vetter@ffwll.ch>
 <87jzhtcp26.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzhtcp26.fsf@jogness.linutronix.de>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Wed, Jul 10, 2024 at 04:19:53PM +0206, John Ogness wrote:
> On 2024-07-10, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > console_lock is the outermost subsystem lock for a lot of subsystems,
> > which means get/put_user must nest within. Which means it cannot be
> > acquired somewhere deeply nested in other locks, and most definitely
> > not while holding fs locks potentially needed to resolve faults.
> >
> > console_trylock is the best we can do here. But John pointed out on a
> > previous version that this is futile:
> >
> > "Using the console lock here at all is wrong. The console lock does not
> > prevent other CPUs from calling printk() and inserting lines in between.
> >
> > "There is no way to guarantee a contiguous ringbuffer block using
> > multiple printk() calls.
> >
> > "The console_lock usage should be removed."
> >
> > https://lore.kernel.org/lkml/87frsh33xp.fsf@jogness.linutronix.de/
> >
> > Do that.
> 
> Note that there is more of this incorrect usage of console lock in:
> 
> fs/bcachefs/debug.c:bch2_btree_verify_replica()
> 
> fs/bcachefs/bset.c:bch2_dump_btree_node()
> 
> from commit 1c6fdbd8f246("bcachefs: Initial commit")
> 
> ... and its parent bcache:
> 
> drivers/md/bcache/debug.c:bch_btree_verify()
> 
> drivers/md/bcache/bset.c:bch_dump_bucket()
> 
> from commit cafe56359144("bcache: A block layer cache")
> 
> These should also be removed. Although Kent should verify that the
> console lock is not providing some sort of necessary side-effect
> synchronization.

I'll take a look, at least some of them seem doable to audit without deep
bcachefs understanding. Thanks for pointing them out, I should have looked
a bit more at git grep ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
