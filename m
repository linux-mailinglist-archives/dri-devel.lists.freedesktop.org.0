Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9323C6B6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506626E504;
	Wed,  5 Aug 2020 07:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D756E247
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 15:44:56 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id p25so21211309vsg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H4JQaTkH18iHZhr5mRcUoCQ7w0Oz4NhHM6QKGzTo1bo=;
 b=ldFkcUFp7ri+IazwVWH1DnJFGu4x0mPAE5c8LizFVx2rdt1FE7sAuwon3cwzJKF5LL
 ZNJqk1Re7Ztm4LTRTSxLIblqxv1Tdv3kmXSjg7auDZuvC8yZ0w69Nn/DGRo8tp0Eil14
 jFciSc7TK05orgQRJRd7XKd6eTpBBIMNXzVXQ2Jed9/2SZYXTu2h73RR/N6qsNl/Pca7
 9+8tv7nrB+KevcGtu4bJtd0lxUtz9q8jECfBtEGtUXeOl6f4BACUpXlr/k4Faqg/qrCp
 Hx6izzJsxcomSTRM+gxPrYoa/pz+vZQZOFj3Rncam1GLYEBX+eB0thlPgKUiM/AR0tKS
 NIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H4JQaTkH18iHZhr5mRcUoCQ7w0Oz4NhHM6QKGzTo1bo=;
 b=uSOLDcwrFlHAg3YzWTH8kSFo7ojvGKvLnNDBQ2GWh/kUA2dJw4oeUOW6I5CNZdAka5
 TYxiGSRxbE7tKJsH1XFtKQtQGg65vMd3bfz/IcOtsA6kS9gFM83s7xKol4diob4CzurM
 JXKA5BYZbAs0S3UCLAvxtZPq5uR/oWKq9tC1+53vcjOkPB9gUrjrl1Y7bBb0In+C8wET
 J5Ljbqx1fHEa3j8nxlztYx40RID+bNDKse9eaJhWqKDvc5FcwqNCmHzh/fSs8NgeXEe8
 fZQnde54c/WVpGUL6wjG/bovROhO94gLA68n+N5tw2XJp7AkO4e+696c0BDKlOkAjVNM
 0ewg==
X-Gm-Message-State: AOAM530sRGL6/HK12v9PTlCTFfZmM+mVAzaevykZK4HuwZh7qiWvD30F
 /jWvhp05Cf/Acj3bMVonKVZV9A==
X-Google-Smtp-Source: ABdhPJyukknUS02GVsM5w7GzAW9AGOdf699gjZwqpksqLXYiV70ZhFCdPmPPK94v0vzmxZDb4/5nug==
X-Received: by 2002:a67:ef81:: with SMTP id r1mr8018212vsp.37.1596555894889;
 Tue, 04 Aug 2020 08:44:54 -0700 (PDT)
Received: from google.com (182.71.196.35.bc.googleusercontent.com.
 [35.196.71.182])
 by smtp.gmail.com with ESMTPSA id b138sm3212924vka.48.2020.08.04.08.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 08:44:54 -0700 (PDT)
Date: Tue, 4 Aug 2020 15:44:51 +0000
From: Kalesh Singh <kaleshsingh@google.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200804154451.GA948167@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
 <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk>
 <20200804010913.GA2096725@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804010913.GA2096725@ZenIV.linux.org.uk>
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

On Tue, Aug 04, 2020 at 02:09:13AM +0100, Al Viro wrote:
> On Mon, Aug 03, 2020 at 11:28:31PM +0100, Al Viro wrote:
> 
> > IOW, what the hell is that horror for?  You do realize, for example, that there's
> > such thing as dup(), right?  And dup2() as well.  And while we are at it, how
> > do you keep track of removals, considering the fact that you can stick a file
> > reference into SCM_RIGHTS datagram sent to yourself, close descriptors and an hour
> > later pick that datagram, suddenly getting descriptor back?
> > 
> > Besides, "I have no descriptors left" != "I can't be currently sitting in the middle
> > of syscall on that sucker"; close() does *NOT* terminate ongoing operations.
> > 
> > You are looking at the drastically wrong abstraction level.  Please, describe what
> > it is that you are trying to achieve.

Hi Al. Thank you for the comments. Ultimately what we need is to identify processes
that hold a file reference to the dma-buf. Unfortunately we can't use only
explicit dma_buf_get/dma_buf_put to track them because when an FD is being shared
between processes the file references are taken implicitly.

For example, on the sender side:
   unix_dgram_sendmsg -> send_scm -> __send_scm -> scm_fp_copy -> fget_raw
and on the receiver side:
   unix_dgram_recvmsg -> scm_recv -> scm_detach_fds -> __scm_install_fd -> get_file

I understand now that fd_install is not an appropriate abstraction level to track these.
Is there a more appropriate alternative where we could use to track these implicit file
references?

> _IF_ it's "who keeps a particularly long-lived sucker pinned", I would suggest
> fuser(1) run when you detect that kind of long-lived dmabuf.  With events generated
> by their constructors and destructors, and detection of longevity done based on
> that.
> 
> But that's only a semi-blind guess at the things you are trying to achieve; please,
> describe what it really is.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
