Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1FE23B5B7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912DF6E44C;
	Tue,  4 Aug 2020 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FF36E077
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 16:00:13 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id x142so5374165vke.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQC5OSI+ot4HICgMI1hBiF+Gos4KF9rtoTAXqBLWz5k=;
 b=gP0hGxdZpv7oi/HJF0iairUbhXDSeECExkx/WUmvKbJIKYqRHFbhrSant0W/qarBAu
 pt2QS00SD0C3sScBrjjH8PuJSo/uiRusGI8NdinY72x5wOlbs+la767nkgtU1+AdO/4R
 sVgh/KH5EXT8KXDfD+VCxBTK4X1AEadmwBpBrMVvntYBujslfuoMPSdeAJPR+0zoXtmU
 az8f0YQ3IGNq2/+IKVQAVs5iYU/bcziJbdbgOWftXf0g+mybpPTS5/8EnV/nQwq4dSqm
 ZRV9gMwTdIcvKiJF/9J0XUaNMTR7Pm4yz/Nv7W/qKW98y0pV5r5ge3KKLHyEx2GZZhW8
 O0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQC5OSI+ot4HICgMI1hBiF+Gos4KF9rtoTAXqBLWz5k=;
 b=fIkOfRS7vIlCA0oPtxBxEUOiHbPeqYmu95Y2sOAfCI7zwkvDP/IAHj31hZakBzZGFm
 WOwVDyIGiExVmi//kOa2GZWbHh0o9JptSEys3Zdmj8tPmmd3EomE0AWV56co4H3UiUeu
 12eQf3qcfSpolbBX4ZkcevE7JyzrWxlZL0F1SWLIzf8o9HFR2gu3e0n4qtDwM+Oc9KKU
 z0Ac8gQoiQQv6Xl5OWJzG5ziaXm0icb2TeOLi6FDhd7tZrK2jIcDod0T4BSBBf7+/cO3
 EofaRtiToBzOOa96z4yne1JNiNayqgA++dmaKzGNuFVnOFJIuR7WtvSOOxsS/ZZT0p+K
 DjFA==
X-Gm-Message-State: AOAM532S0FOgwD0cHABvggQNCAdrk41vG5ti+BuWgk2xzWIiw1a2xwNl
 xozSvsaMGd374HYxUOnWT6x+OqPBfdgUmwe4gbU9Dw==
X-Google-Smtp-Source: ABdhPJxBkWFzXg/y1w5xTYtUJSHjvCQFO/a1nE0RcfXFpI2HgJqGujkazyU0S+p/ymKJ5J9VS+bR1YpMln1PD/g9du0=
X-Received: by 2002:a1f:9651:: with SMTP id y78mr1828501vkd.5.1596470412618;
 Mon, 03 Aug 2020 09:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
In-Reply-To: <20200803154125.GA23808@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Aug 2020 09:00:00 -0700
Message-ID: <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
To: Matthew Wilcox <willy@infradead.org>
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
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org,
 kernel-team <kernel-team@android.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > +static void dma_buf_fd_install(int fd, struct file *filp)
> > +{
> > +     trace_dma_buf_fd_ref_inc(current, filp);
> > +}
>
> You're adding a new file_operation in order to just add a new tracepoint?
> NACK.

Hi Matthew,
The plan is to attach a BPF to this tracepoint in order to track
dma-buf users. If you feel this is an overkill, what would you suggest
as an alternative?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
