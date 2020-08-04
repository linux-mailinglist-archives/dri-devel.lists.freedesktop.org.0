Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C823B5A1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1164F89A5D;
	Tue,  4 Aug 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCE86E177
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:11:11 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id r63so12436341uar.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k9EPoA/TZ6oFdobQPbI92mloUpSocVCmYhmgQ9XTICk=;
 b=QADiLWYDVY5sDxEYuLEuvcCNAPfU3goGeGw7YEgVuEfcRmX+WQZUvyrbIKtcB7k7iQ
 YxtIg+05jbwODdVdONyVxvmTrVZkmGIM0V8YH0Opo5g6s04ssZ+E7raI4lMc6wipoLsR
 mtgY7uBETHz6kZN968nSb549MAS66ZiRjzYJIBh4V2KqbBYjvi0sk8NkJGObyROZ26Rz
 wr0T342klm0lF2dZp+0E7GYYrZV1oLV7ImOHoLhAfA2b6vuOhpxgD4QGTMNTY6xao7VS
 tnWQeeqa1y9yCWAdCkdmUq6sTQ5PXziy0Z7S8lVg41R2Av1E7muXD5VKHWwh+4EHg+RB
 Rqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k9EPoA/TZ6oFdobQPbI92mloUpSocVCmYhmgQ9XTICk=;
 b=BNICMKVREHBdy+VMXliFCN4BaxZq6hLvHh3T15sbAlQCuwFZWsQYLY51jiHNDedWrN
 RVKqRDpKFdC3orqRSipZOlu3JzYUMvR2/YddpBn59uF9NJsU/liyyUjplLJdz3FA8+sE
 9rtmDCaQXaS4o6AZWWVVEOQi9JuKHaBy1cGU3z4ZlW190vBGsu9bnXs4y+c2Ii7M/Ph6
 wBzMzvce7cK4hWO/GrSbK/x900Dn2iyJtMY0Z5RI0TQyiu7ADsaiGV1e92H92nWtwugD
 LlaW2IFiDJCVL1mCa3R2XEEHwtyfZLsY+G//KbiknTZgqE6849JYqWda8GFrddTdjlqK
 XGYA==
X-Gm-Message-State: AOAM532XTmvVvXu1megcn/HhvVlq5HKpdqyLRs1qsTadVuDxJo3aYBke
 pIv/yTaoYAm66blwW2bRc5YEu+xcQPpwbTqoHX7kHg==
X-Google-Smtp-Source: ABdhPJxsSSJwioh1fipswY2Sg0TuZ8kexPdrIAJWw0UnM4xG9WSpH2NU05FlGdWBuHZgMZ+Mu0VvpeSV2QDEBT1mDD8=
X-Received: by 2002:ab0:5eaa:: with SMTP id y42mr13300969uag.118.1596507070267; 
 Mon, 03 Aug 2020 19:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
 <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk>
 <20200804010913.GA2096725@ZenIV.linux.org.uk>
In-Reply-To: <20200804010913.GA2096725@ZenIV.linux.org.uk>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Aug 2020 19:10:59 -0700
Message-ID: <CAJuCfpE3fqCDfNmKphg6ZkHVb-B07_jvhquVgwgPHPi1CTupmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-doc@vger.kernel.org,
 Ioannis Ilkos <ilkos@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Ingo Molnar <mingo@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, kernel-team <kernel-team@android.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 6:09 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
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

Thanks for your feedback, Al. I see your points and sorry for not
realizing these shortcomings.

> >
> > You are looking at the drastically wrong abstraction level.  Please, describe what
> > it is that you are trying to achieve.
>
> _IF_ it's "who keeps a particularly long-lived sucker pinned", I would suggest
> fuser(1) run when you detect that kind of long-lived dmabuf.  With events generated
> by their constructors and destructors, and detection of longevity done based on
> that.

That is the intention here. IIUC fuser(1) would require root access to
collect this information from a process other than the caller. Ideally
what we would like to have is a non-root process with specific
capabilities (in our case a process that can access BPF maps) to be
able to obtain the information on dma-buf users.
However, it might make more sense to track dma-buf usage from
dma_buf_getfile, dma_buf_get and dma_buf_put since these calls are the
ones that affect file refcount. Will dig some more into this.
Thanks for your time and sorry for not thinking it through beforehand.

>
> But that's only a semi-blind guess at the things you are trying to achieve; please,
> describe what it really is.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
