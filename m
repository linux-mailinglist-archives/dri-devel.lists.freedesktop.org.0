Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63352D9587
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 10:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4C96E12E;
	Mon, 14 Dec 2020 09:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F2C6E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 09:52:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a11so8056350wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 01:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Is54IP16ttSo/VNvqr/hFl8/mWm4JUrt7UNDEyOpIRE=;
 b=jtoE+j4EvDfGFYAHIOrUQobSiK+iCBZq7nQIqFo4CghFgRW6EvK+bpv8Ei4MbAUCfv
 BCMxW30nzS41RYzhz705An3EY2Rb1Jsf3yK8AqKqAfHwQS/kHXaaowZQ+uS/37rb/A4P
 XUv3IxrDK+/9ODqUOGCmOUvx/6ttqyq7wB3jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Is54IP16ttSo/VNvqr/hFl8/mWm4JUrt7UNDEyOpIRE=;
 b=Ph7QurybcpnHiCYphnMFEOBl7YKbf5bDmg+E5qEpT8EukNdysk+DCx+TqyNkBa86Gs
 z4pMGLcbooucYRIDZGx/TMYWr1dxVzoNhB58lzAhY4gopQ3Km+XGewZVypgSD0Sl9830
 cWcRqhBDPxu49TZnuW8y4RRbnZUCSHEFAoQOfGSJSZBXyE2CLk1a+XEdreAcbXM/7VpW
 0mxBje8VlcQ0WFiQHxZaQjXAtESL4XKyOJOchZn8SneKKueLdLvXtzTubLvOBo7Tce74
 CHpNwgBszX6B4hqUFDL70uZBPsbVrJe8gSGbKgk0u+EecHAMNE9KHr/xKLPaDZh3ox+D
 WCMg==
X-Gm-Message-State: AOAM532/MIt/DRY3KM2YtVCQKhfMdCfaI5caEffK87HZxBSCwObzyvva
 toqjrLzU8wdPokomNpi3ajPGWw==
X-Google-Smtp-Source: ABdhPJyG3aUDYzxeiyqsL9q8bNxB3GjCWQCdKuR/dxCzX21zyRps6pbnLy5wrRbtvY04MXWeHfjhRA==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr24280689wrv.384.1607939560392; 
 Mon, 14 Dec 2020 01:52:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h4sm5361555wrt.65.2020.12.14.01.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 01:52:39 -0800 (PST)
Date: Mon, 14 Dec 2020 10:52:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
Message-ID: <20201214095237.GX401619@phenom.ffwll.local>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
 <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
 <20201211124618.GC552508@nvidia.com>
 <ae0e1e69-6550-94fb-c2b2-1ea04a0ae936@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae0e1e69-6550-94fb-c2b2-1ea04a0ae936@shipmail.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 13, 2020 at 04:09:25PM +0100, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 12/11/20 1:46 PM, Jason Gunthorpe wrote:
> > On Fri, Dec 11, 2020 at 08:50:53AM +0100, Thomas Hellstr=F6m (Intel) wr=
ote:
> > =

> > > My understanding of this particular case is that hardware would conti=
nue to
> > > DMA to orphaned pages that are pinned until the driver is done with
> > > DMA,
> > mmu notifier replaces pinning as the locking mechanism. Drivers using
> > mmu notifier should not be taking pins.
> > =

> > Keep in mind this was all built for HW with real shadow page tables
> > that can do fine grained manipulation.
> OK yes, that makes sense and in that context the fence wait is easier to
> understand. Looks like for example the radeon driver is using the notifie=
r +
> get_user_pages() but there it looks like it's used to avoid having
> get_user_pages() clash with invalidation.

I think the radeon userptr implementation is bad enough that Christian
wants to outright remove it. At least he keeps talking about doing that.

So maybe not a good example to look at :-)
-Daniel

> > The GPU version of this to instead manipulate a command queue is a big
> > aberration from what was intended.
> > =

> > Jason
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
