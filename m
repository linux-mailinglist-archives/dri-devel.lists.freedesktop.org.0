Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B58F200242
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A1D899D4;
	Fri, 19 Jun 2020 06:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751386EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 17:23:41 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id dp10so3113864qvb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C9fZMsXo2SZ80We4hmJmwmW4hWECtoNb2OioHXlz4pQ=;
 b=pQnJk2BkLr+MSY/ZKoRYO3N7SBKy2now/VahbHpiE0ODVcJ+6O7j84vau1mwIApvP7
 GOdC6OeYk1H3WeQLOrd9w3MqHQZy0OvARyydS7GgAQeW47MnQWfeepZVJrUJjSv717D6
 71Y1Jcf/9bD++nyhtsm877xpne1ScehVboFxAFrIK686JYR5j1zM1IYedzgkhSMFLH+q
 BA1fweTgPgjhYb+wikYXhEAlUND0ztF/D51np5BJ3v4C46sZQvCASI5ckldnPRlU+3hi
 s8pkLypTSa4SZ0xCcdQBCFHr3EIFZ3G/Xkv9NnnR/g9tJLHfZHgrYGhT36a3jHhTjSZ1
 XJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C9fZMsXo2SZ80We4hmJmwmW4hWECtoNb2OioHXlz4pQ=;
 b=Fd3t/6dS0qSiwrURK7nFqsJrCx+mnEu64S1rIKyGlZuKx7FS9BmNTIhU4AOKCBJYFc
 QrBg7HCLnO7LQH2oZlMu9IAKiQfTqa/Yf7HCAyYSASEf1wyUUgjsC4fit+fJtb/ztYew
 AoBgWSAjHGa70tnY58LhgOMSDtV+hU1yR7Y5RqkKT+7cKUCwqr/VEYgXqX7gsZkPuXPB
 t6at6yG65lCsVq651wpFU/hFpTLLdm55dwnGv7vEs5rdAiQhlPOgkI59Tjc7hN5RvEFw
 H6vSenumryQelClAoIqLz3YSJtbiKkJfsFpykBKxqY7qsmelM3OMZzDM6JTMi/XVGHCW
 gQpA==
X-Gm-Message-State: AOAM532L0RhOy3+20UPmqgm9SHCAVHyF21aao+NUIRR12N6L0Zo3hhnF
 viHkDOxfV7Ep3Wk9gZdxY/RNnw==
X-Google-Smtp-Source: ABdhPJwk2YUvEzLHMclGfpDEafJPYyQ0A/CvUD7gNhvGjyNa2/WErZ+AilnbN9Hdt0RsaqZHbhBdmA==
X-Received: by 2002:a05:6214:1705:: with SMTP id
 db5mr4740498qvb.14.1592501020440; 
 Thu, 18 Jun 2020 10:23:40 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id r7sm2644175qtm.66.2020.06.18.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 10:23:39 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jlyGI-00AEEp-Qj; Thu, 18 Jun 2020 14:23:38 -0300
Date: Thu, 18 Jun 2020 14:23:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200618172338.GM6578@ziepe.ca>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca>
 <20200618150051.GS20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618150051.GS20149@phenom.ffwll.local>
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 05:00:51PM +0200, Daniel Vetter wrote:
> On Wed, Jun 17, 2020 at 12:28:35PM -0300, Jason Gunthorpe wrote:
> > On Wed, Jun 17, 2020 at 08:48:50AM +0200, Daniel Vetter wrote:
> > 
> > > Now my understanding for rdma is that if you don't have hw page fault
> > > support,
> > 
> > The RDMA ODP feature is restartable HW page faulting just like nouveau
> > has. The classical MR feature doesn't have this. Only mlx5 HW supports
> > ODP today.
> > 
> > > It's only gpus (I think) which are in this awkward in-between spot
> > > where dynamic memory management really is much wanted, but the hw
> > > kinda sucks. Aside, about 10+ years ago we had a similar problem with
> > > gpu hw, but for security: Many gpu didn't have any kinds of page
> > > tables to isolate different clients from each another. drivers/gpu
> > > fixed this by parsing&validating what userspace submitted to make sure
> > > it's only every accessing its own buffers. Most gpus have become
> > > reasonable nowadays and do have proper per-process pagetables (gpu
> > > process, not the pasid stuff), but even today there's still some of
> > > the old model left in some of the smallest SoC.
> > 
> > But I still don't understand why a dma fence is needed inside the GPU
> > driver itself in the notifier.
> > 
> > Surely the GPU driver can block and release the notifier directly from
> > its own command processing channel?
> > 
> > Why does this fence and all it entails need to leak out across
> > drivers?
> 
> So 10 years ago we had this world of every gpu driver is its own bucket,
> nothing leaks out to the world. But the world had a different idea how
> gpus where supposed to work, with stuff like:

Sure, I understand DMA fence, but why does a *notifier* need it?

The job of the notifier is to guarentee that the device it is
connected to is not doing DMA before it returns.

That just means you need to prove that device is done with the buffer.

As I've understood GPU that means you need to show that the commands
associated with the buffer have completed. This is all local stuff
within the driver, right? Why use fence (other than it already exists)

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
