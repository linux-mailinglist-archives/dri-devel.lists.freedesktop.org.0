Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9317413E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 22:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6004F6F4CF;
	Fri, 28 Feb 2020 21:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304B46F4CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 21:02:01 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id f10so3969025ils.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 13:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rn2DIfF6sd7SkDVeP73KbikxOZR1fwDL3nOwe2UlPWQ=;
 b=I8pOUUbGNNlBXtH/PBMqy6BuK/RlqW2jXmck47O8oFj0JxtHLjp4YxQCl8zXDhkjmx
 w8zh5PdXdrTp9HrKVjRaC/M8F+qqnq24BKVoXEUypkvRGxmWHWwUrUSGBYqtvV/g7QuR
 p59F9iwuYtsdBraNLF/Z9StB29iBqUeakFWgqb3oda6ouU6lhRqTsDRpljhRrCcUR8jk
 WV5EQEG+BUaSo1XJQZUcalAqVz1xWODoVvSBADHqVZw5GoHh5uKrgqGYKSQsj21UNGrF
 tw9A9bNPcWOjc3oKM6Hk/iygd2rDxn+aO8hakMK3H+T3BUFLIXufA0XSQZB8M9zccB4B
 oKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rn2DIfF6sd7SkDVeP73KbikxOZR1fwDL3nOwe2UlPWQ=;
 b=X8WM2elRNRutHxsIG8pRrnUyR390zsAnTMF41XAUXqkrfxK+8Q3RhM/iE+2pibl2DC
 5ZNkhqaWFt8HcAJDfNzteC6asV3dk/HBF+oo/5hEUgyXchdXhyuhFlKLOlyK44wW1D7K
 jfwOFn5SE5xPlypVsh+waAcD+k63Ogg7jsCAmbIqPqJC3OgyH7r4gohLnnIMZLaWcsE0
 0GpAJpb691hnosROZh2W6RJsgXNo6hkYuv2/KzjUoFwFJ+YEdB2qv/x8keU5Qq3UBGtJ
 HaScoP79eXfl7JRxumgaqmoToIXj9f+G7Gzrj8IhdmtE25CWvlIkDluZqjCr3wb6hmT5
 HSkQ==
X-Gm-Message-State: APjAAAXQp0euRriPXaGa+hzFLG/f9FaCo5U/Dh5mT5rOOuNf7SToToev
 n4nEc9CtAnj6YEmvg3IH6lMOjCP95u4ui4GVjSw=
X-Google-Smtp-Source: APXvYqz7SVAtWFegUkArXHrHfjA+Wd+nkz21Xop8hxKyIAS4zymslsQG8aWzRt10Tj15oa4QuYkX5ofa4TyFbut5O90=
X-Received: by 2002:a92:7b10:: with SMTP id w16mr5918923ilc.93.1582923720501; 
 Fri, 28 Feb 2020 13:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20191002014935.33171-1-gurchetansingh@chromium.org>
 <20191002014935.33171-2-gurchetansingh@chromium.org>
 <20191002084942.jnm6brnuadwztonh@sirius.home.kraxel.org>
 <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
In-Reply-To: <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 28 Feb 2020 13:01:49 -0800
Message-ID: <CAPaKu7TwKx+0QCyu4orDD1fmEhsNSUn_ab7-QhQNsOyg3bzApQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] drm/virtgpu: modify uapi with
 stride/layer_stride fix
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 2, 2019 at 5:18 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> On Wed, Oct 2, 2019 at 1:49 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Tue, Oct 01, 2019 at 06:49:35PM -0700, Gurchetan Singh wrote:
> > > This doesn't really break userspace, since it always passes down
> > > 0 for stride/layer_stride currently. We could:
> > >
> > > (1) modify UAPI now and add a VIRTGPU_PARAM_STRIDE_FIX feature
> >
> > This I think.
> > But IMO it's not a fix, it is an added feature ...
> >
> > Also missing the big picture here.  Why do we need this?
>
> Two reasons:
I don't fully get the picture, but drm_virtgpu_resource_create has
stride.  Can we send that down in transfers?  It lacks layer_stride
though...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
