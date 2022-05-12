Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13845252D3
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 18:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F16B10EF8B;
	Thu, 12 May 2022 16:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2138510EF8B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:41:54 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q4so5414561plr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6TwX+Uem+RX7yFMEQloRfhp790CWUfMnBz6v8ZFXqWw=;
 b=W0iepvlelCLBuiCrQ0b37NsVuwjZqmnDvDuXQwTxPwqmfcisydLXhlvB+5bIBxb9Mo
 DDIm9SAd9GCqOj8Y1mqJ3sPE2DDD2VG+CyW+x8zKZGJ1ncvmUcgmSj5NWAatP+ff85TH
 ZnWqN4wW+Xvd09HvOI7ErGXsWF0qITMEkVBE8CptKkPKH0y41qpN2h8EhYFt/EnyW95X
 LUnS06SYFHbr1Fd4ZdIEgY2aNXkWlf7fBX3yTTPM4sIzGKDRzP8t5PBqeY5+wGCWKGeI
 4l9xLi0L1UoF0RefF/g+HEKdfK0lgVXEOyZZ3Lz8Yy/OIJTAikD/cX/wCLx1Gu2ea24/
 QN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=6TwX+Uem+RX7yFMEQloRfhp790CWUfMnBz6v8ZFXqWw=;
 b=ViRCcAWQCjkjFwULKk46kgCd+kQA+di5SXlUqLtF+PS+mTUfV5PuU7UMQVFWATrZQp
 gcw5jvQlEOXVaYynTeMfuLijj6Q6BsGmrrY7NpNpuGJvDJ465cvMaz2kkE8IXq8fDw2X
 NzMPUBBbeDe3Lr9yn+GUJzz1TexveV4Rp1WkNfYfd0J4eeycHBM/7BLv+8p10Jr+NNS4
 GlqAF+Dyjp/RYP0KpfEWkfo3jV4Bc9zC2FEy4ctT8Y9lxqEIqPQOyRFTZFf7ZUGNjYp3
 vbN+5GyBI7+Fz4mi4X/JuKkyvy/tCTHelwXsbtn/7ExjkjstDEAsrmEq456uLlBKsGgr
 ReKw==
X-Gm-Message-State: AOAM532hr9JyGmd7Qhdh3IiBzOpD/uQ+TAEsNsIuKyDBzG8Z/Mwe6mvO
 kZGpyehLvafgFTk8tyQ5wOI=
X-Google-Smtp-Source: ABdhPJzsb54QRB11Kg0xwOQPwsZz32Td9eLOjqUbH9eOlCaQUD4CO9IvOZZ+4QXL8vYjVErb6WonGA==
X-Received: by 2002:a17:902:ab96:b0:159:1ff:4ea0 with SMTP id
 f22-20020a170902ab9600b0015901ff4ea0mr779294plr.60.1652373713356; 
 Thu, 12 May 2022 09:41:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::4:6c64])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a62fb04000000b0050dc76281a9sm46574pfm.131.2022.05.12.09.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:41:52 -0700 (PDT)
Date: Thu, 12 May 2022 06:41:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [REPORT] syscall reboot + umh + firmware fallback
Message-ID: <Yn04z6xzqJQqYNOX@slm.duckdns.org>
References: <YnzQHWASAxsGL9HW@slm.duckdns.org>
 <1652354304-17492-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652354304-17492-1-git-send-email-byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, ngupta@vflare.org, johannes.berg@intel.com,
 jack@suse.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, linux-block@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, mcgrof@kernel.org, holt@sgi.com, hannes@cmpxchg.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu, May 12, 2022 at 08:18:24PM +0900, Byungchul Park wrote:
> > 1. wait_for_completion_killable_timeout() doesn't need someone to wake it up
> >    to make forward progress because it will unstick itself after timeout
> >    expires.
> 
> I have a question about this one. Yes, it would never been stuck thanks
> to timeout. However, IIUC, timeouts are not supposed to expire in normal
> cases. So I thought a timeout expiration means not a normal case so need
> to inform it in terms of dependency so as to prevent further expiraton.
> That's why I have been trying to track even timeout'ed APIs.
> 
> Do you think DEPT shouldn't track timeout APIs? If I was wrong, I
> shouldn't track the timeout APIs any more.

Without actually surveying the use cases, I can't say for sure but my
experience has been that we often get pretty creative with timeouts and it's
something people actively think about and monitor (and it's usually not
subtle). Given that, I'm skeptical about how much value it'd add for a
dependency checker to warn about timeouts. It might be net negative than the
other way around.

> > 2. complete_all() from __fw_load_abort() isn't the only source of wakeup.
> >    The fw loader can be, and mainly should be, woken up by firmware loading
> >    actually completing instead of being aborted.
> 
> This is the point I'd like to ask. In normal cases, fw_load_done() might
> happen, of course, if the loading gets completed. However, I was
> wondering if the kernel ensures either fw_load_done() or fw_load_abort()
> to be called by *another* context while kernel_halt().

We'll have to walk through the code to tell that. On a cursory look tho, up
until that point (just before shutting down usermode helper), I don't see
anything which would actively block firmware loading.

Thanks.

-- 
tejun
