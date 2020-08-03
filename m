Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB223B5B4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682096E443;
	Tue,  4 Aug 2020 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA7589D63
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 16:23:05 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id r7so3716980vsq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DuAzZZbtTCD/FunpRik00QhyAGnIAetc0b9NRlFShwk=;
 b=X2X2zOxVAHLGT14KTEzVrxN+YVOkB2JZ0AWCYwVkpNrjN6xpv7uJnHGDexGy1sYLXG
 u/2rrBX3dMh04chIdQxxkJZchGHaLBKxcZhngBPpI1VFasSgC4v1CV7ao/cPQ61yQjy5
 ei0pqTZOsbFHSlEAAvLyJh1RUzkIfIjxAaqWt3bX0QCKKb22uShKmM1/tC5A0sQV9bLo
 QHCzx1vKs8h0kr/EDTHq8Cf9LqsmD8iZjyzKETpTtAK5K04DbnFqrnx1to7mISTevhDg
 GejktA8vH2oS1es01S5SLWtAQx5+3/6aT9BW6iASea+uli0QssQRtAcK331OucnyZJcl
 +Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DuAzZZbtTCD/FunpRik00QhyAGnIAetc0b9NRlFShwk=;
 b=ZYYPNlvxgOlRrXo5qpDFtU+9EiQZjWxzc5rqmu/VaMTEn+JrTJtNcItFMkXcgaYPcK
 OjhmylEDfzB+TK4joQ33K5cLKqKUTeTponWvjKIMwF145pvbWKOTFVyP8t/oZ0u0194m
 YygO9huSL7M5GMfQdxdZCvSdVWFnWwIRO4f1Ga+FGElgM+tfVHLpMZUfTGCVu1Urlnfi
 NpfPkLbG+fR4WCR3EXKnztgy4vIgUs/+VUlNSZIqDhuieKHNbercl1om7DAVWmo3VrdB
 4YSuX+iE7tG47ufCJroroESJkTB3u4UTuXlQfaTFV6dYXxUov5b5YYg/w+2l1ipP28nz
 /b1w==
X-Gm-Message-State: AOAM532EcHnlDBnVV8cnWFj7ij00+UJb25V5eigQlXF1OU0j3+Oso0DZ
 b8mtBwtXwSNJFUfBdTpnlO/FLOm54LdNjkgyL1zR1g==
X-Google-Smtp-Source: ABdhPJw4q/ZXP9VLpgKpRjolRWqGRWM7lRrYpiraKWz+WS2rqxzSA2J4h04p9yxEq05Q+UN+KZ6A3bHJZXLviXDzUZw=
X-Received: by 2002:a67:6441:: with SMTP id y62mr12434936vsb.82.1596471784607; 
 Mon, 03 Aug 2020 09:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
In-Reply-To: <20200803161230.GB23808@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Aug 2020 09:22:53 -0700
Message-ID: <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
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

On Mon, Aug 3, 2020 at 9:12 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 03, 2020 at 09:00:00AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > > > +static void dma_buf_fd_install(int fd, struct file *filp)
> > > > +{
> > > > +     trace_dma_buf_fd_ref_inc(current, filp);
> > > > +}
> > >
> > > You're adding a new file_operation in order to just add a new tracepoint?
> > > NACK.
> >
> > Hi Matthew,
> > The plan is to attach a BPF to this tracepoint in order to track
> > dma-buf users. If you feel this is an overkill, what would you suggest
> > as an alternative?
>
> I'm sure BPF can attach to fd_install and filter on file->f_ops belonging
> to dma_buf, for example.

Sounds like a workable solution. Will explore that direction. Thanks Matthew!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
