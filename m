Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9D23C6B7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24D36E516;
	Wed,  5 Aug 2020 07:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374706E08C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 20:43:03 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id i20so935199vkk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TlCjdbRMbP/wUOWxhVpHiQRbe/DkH4AfQXHxlQhoVjA=;
 b=EOi3TYycOATstmP6d5D/4kHK77cpmm07nIj5AHuvfKmnLxKlJXrFY2QFvli6qNNCKA
 wqQ6Gx1OjpknqNrHPOsQ6i5pA4Nsl/0P+o8YnHG9NApjT17RZYWFm2ppHG2Oa91sfuxA
 V7/UnvO5E3bSeNaQiSfAOAo3JPrbiEZyVWI1xZBomo1Dr5q+3bfJwXgF9dxiWHQGZQ2B
 pLhcuu+09iTwu7nNQoaBdcI38gAj4GsGHfeAu8E+COwEkQ7qG41AYUnujdSx6sdIvWGB
 LIzkgD64Cktj4Lrk9qYaJk7E7mh6dWZ2/a0BboxrjqurpZNuVBcAGleuhJxvMUPytp7k
 494Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TlCjdbRMbP/wUOWxhVpHiQRbe/DkH4AfQXHxlQhoVjA=;
 b=KJk3u6F+ufaUSfzDCowWCipy78+RfKjpWV0bxy0pGLMRMdqQWBv/ADUwg8JWOB20i5
 bkBo73GmadYE95eoKCk0z5hLfCpGXC4OpXK8w0Hdx5rI1G+cu5T5AgnfJN7P1kG98h95
 yufa7utsDYKuIeP2T8c2/5b53EGWk22rTQjbdUlMUIQYhM83pyGfBZt1yLBhcnFgr0fl
 O9LyjePI09p9gXE56WIYxYbZUmSYJMKfpjclw+paMr+EujZavwgBgfOsxdHL1OPhhgY3
 g54L+k2lWg/RJe5ATxsoJDGsByuLEwMRPpb+UGqbLmqZnQ4gNvidEtoY+XBJvH0p1c5b
 fEAA==
X-Gm-Message-State: AOAM530lSLnEw76rPw6VAGdmfTeQ4z3qhdG7wa0imlo6p8JlVZP8/zXE
 hxkNRfaS4xRHUqrTciDg0gniAg==
X-Google-Smtp-Source: ABdhPJw4pSB0K0iA7nRulTXnJfiqTxaQf1+i2vnos6vZbo7/HN0GM59TI/tMLvET0NGIlCFNwPQn1A==
X-Received: by 2002:a1f:eac1:: with SMTP id i184mr80498vkh.66.1596573782070;
 Tue, 04 Aug 2020 13:43:02 -0700 (PDT)
Received: from google.com (182.71.196.35.bc.googleusercontent.com.
 [35.196.71.182])
 by smtp.gmail.com with ESMTPSA id a3sm2560129vsh.31.2020.08.04.13.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:43:01 -0700 (PDT)
Date: Tue, 4 Aug 2020 20:42:58 +0000
From: Kalesh Singh <kaleshsingh@google.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200804204258.GA1002979@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
 <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk>
 <20200804010913.GA2096725@ZenIV.linux.org.uk>
 <20200804154451.GA948167@google.com>
 <20200804182724.GK1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804182724.GK1236603@ZenIV.linux.org.uk>
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Jonathan Corbet <corbet@lwn.net>, kernel-team <kernel-team@android.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-doc@vger.kernel.org,
 Ioannis Ilkos <ilkos@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Ingo Molnar <mingo@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 07:27:24PM +0100, Al Viro wrote:
> On Tue, Aug 04, 2020 at 03:44:51PM +0000, Kalesh Singh wrote:
> 
> > Hi Al. Thank you for the comments. Ultimately what we need is to identify processes
> > that hold a file reference to the dma-buf. Unfortunately we can't use only
> > explicit dma_buf_get/dma_buf_put to track them because when an FD is being shared
> > between processes the file references are taken implicitly.
> > 
> > For example, on the sender side:
> >    unix_dgram_sendmsg -> send_scm -> __send_scm -> scm_fp_copy -> fget_raw
> > and on the receiver side:
> >    unix_dgram_recvmsg -> scm_recv -> scm_detach_fds -> __scm_install_fd -> get_file
> > 
> > I understand now that fd_install is not an appropriate abstraction level to track these.
> > Is there a more appropriate alternative where we could use to track these implicit file
> > references?
> 
> There is no single lock that would stabilize the descriptor tables of all
> processes.  And there's not going to be one, ever - it would be a contention
> point from hell, since that would've been a system-wide lock that would have
> to be taken by *ALL* syscalls modifying any descriptor table.  Not going to
> happen, for obvious reasons.  Moreover, you would have to have fork(2) take
> the same lock, since it does copy descriptor table.  And clone(2) either does
> the same, or has the child share the descriptor table of parent.
> 
> What's more, a reference to struct file can bloody well survive without
> a single descriptor refering to that file.  In the example you've mentioned
> above, sender has ever right to close all descriptors it has sent.   Files
> will stay opened as long as the references are held in the datagram; when
> that datagram is received, the references will be inserted into recepient's
> descriptor table.  At that point you again have descriptors refering to
> that file, can do any IO on it, etc.
> 
> So "the set of processes that hold a file reference to the dma-buf" is
> 	* inherently unstable, unless you are willing to freeze every
> process in the system except for the one trying to find that set.
> 	* can remain empty for any amount of time (hours, weeks, whatever),
> only to get non-empty later, with syscalls affecting the object in question
> done afterwards.
> 
> So... what were you going to do with that set if you could calculate it?
> If it's really "how do we debug a leak?", it's one thing; in that case
> I would suggest keeping track of creation/destruction of objects (not
> gaining/dropping references - actual constructors and destructors) to
> see what gets stuck around for too long and use fuser(1) to try and locate
> the culprits if you see that something *was* living for too long.  "Try"
> since the only reference might indeed have been stashed into an SCM_RIGHTS
> datagram sitting in a queue of some AF_UNIX socket.  Note that "fuser
> needs elevated priveleges" is not a strong argument - the ability to
> do that sort of tracking does imply elevated priveleges anyway, and
> having a root process taking requests along the lines of "gimme the
> list of PIDs that have such-and-such dma_buf in their descriptor table"
> is not much of an attack surface.
> 
> If you want to use it for something else, you'll need to describe that
> intended use; there might be sane ways to do that, but it's hard to
> come up with one without knowing what's being attempted...

Hi Al. Thanks for the guidance and detailed explanation. It appears what we
were trying to accomplish here is not feasible.

Thanks, Kalesh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
