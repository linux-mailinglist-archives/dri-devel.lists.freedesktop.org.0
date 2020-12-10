Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A82D582D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 11:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FADA6EA61;
	Thu, 10 Dec 2020 10:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743186EA61
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 10:27:31 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g25so2493264wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 02:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=l92zaKGCsUqQ/gxEstrfL6NDn1q+kjEay4OgM6ksKek=;
 b=lZnohFRO2aVOHIRtc3z7i6lGYCNLnPZdXaB3qWvhukrz58enBHe7EHIJSqX/nuzAHW
 yCJOYIELLDkG00HMP/i9sB90hTKotuEEX6XtZ6vbPgpiCE8od//LiE17cKbqsGFu6+WI
 k8DYSm7F76nBrjKCaWmwkM3P9FtvSoRRTYJ2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=l92zaKGCsUqQ/gxEstrfL6NDn1q+kjEay4OgM6ksKek=;
 b=k8EhpEdLz0rHApdsBEU4kVKLLhNJ9Tfa2U3SdsdmMxulpO/dWTbRw+mOAT2JxH9zRM
 cI+S7F/cTmGyrzrBp0XQzE2ZVXzXTbYk/N8Vo8d/BRwIuAHnAgBobRqj/gtI5loRGPKw
 4P8qjxxZ1rw4TEP0xJCkTo6JI8kQfv3DE+tTiyXCpBymZCaiAIFo9aHQna7J3JiDIARa
 zhCIgxQuY/omYBKd5PpXuJzxyur5q+4vPgpbPz1ql6a7DR1MYKm0h0XgVI1PoAr81veG
 wZdfpt2iyxuBNsCGsuaSb9w9Dj0P2NJgNl+/GnqBG0TPVDDQSBJAinSaqZmJENLQIai6
 phIg==
X-Gm-Message-State: AOAM530ON1PSYYH/PODMSHSpmq5vpkWtcMTqx4N/hs6/5fjmgCsCBZt6
 +m+78Vc7bzFSA5wNZMu9knY9eg==
X-Google-Smtp-Source: ABdhPJy6LrEU5I4bHa6NTCpIKzGWxUmYOzrDc8WN0RwYWzeap6wdM7DkzQUMvCNV9lfiw29hflZUpw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr7288798wma.93.1607596050214;
 Thu, 10 Dec 2020 02:27:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z64sm8259746wme.10.2020.12.10.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:27:29 -0800 (PST)
Date: Thu, 10 Dec 2020 11:27:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <20201210102727.GE401619@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 surenb@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
 linux-media@vger.kernel.org
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9H0JREcdxDsMtLX@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, surenb@google.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian K=F6nig wrote:
> > In general a good idea, but I have a few concern/comments here.
> > =

> > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > This patch allows statistics to be enabled for each DMA-BUF in
> > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > =

> > > The following stats will be exposed by the interface:
> > > =

> > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > /sys/kernel/dmabuf/<inode_number>/size
> > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > =

> > > The inode_number is unique for each DMA-BUF and was added earlier [1]
> > > in order to allow userspace to track DMA-BUF usage across different
> > > processes.
> > > =

> > > Currently, this information is exposed in
> > > /sys/kernel/debug/dma_buf/bufinfo.
> > > However, since debugfs is considered unsafe to be mounted in producti=
on,
> > > it is being duplicated in sysfs.
> > =

> > Mhm, this makes it part of the UAPI. What is the justification for this?
> > =

> > In other words do we really need those debug information in a production
> > environment?
> =

> Production environments seem to want to know who is using up memory :)

This only shows shared memory, so it does smell a lot like $specific_issue
and we're designing a narrow solution for that and then have to carry it
forever.

E.g. why is the list of attachments not a sysfs link? That's how we
usually expose struct device * pointers in sysfs to userspace, not as a
list of things.

Furthermore we don't have the exporter device covered anywhere, how is
that tracked? Yes Android just uses ion for all shared buffers, but that's
not how all of linux userspace works.

Then I guess there's the mmaps, you can fish them out of procfs. A tool
which collects all that information might be useful, just as demonstration
of how this is all supposed to be used.

Finally we have kernel internal mappings too. Not tracked.

There's also some things to make sure we're at least having thought about
how other things fit in here. E.d. dma_resv attached to the dma-buf
matters in general a lot. It doesn't matter on Android because
everything's pinned all the time anyway.

Also I thought sysfs was one value one file, dumping an entire list into
dev_info_map with properties we'll need to extend (once you care about
dma_resv you also want to know which attachments are dynamic) does not
smell like sysfs design at all.

So yeah, why? worksformeonandroidweneeditthere not good enough for uapi of
something this core to how the gpu stack works on linux in general, at
least imo.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
