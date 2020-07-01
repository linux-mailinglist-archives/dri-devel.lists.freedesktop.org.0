Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F4210AC2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 14:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D3B6E8A0;
	Wed,  1 Jul 2020 12:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3C36E8A0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:07:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s10so23499015wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 05:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pOXon1Ft3QMg3+DEMg4mx9AZ1Fo3HFIDsxx5A7Uw3OM=;
 b=SLVD34LLoqY7t0/tirDSuJAH3V+LGnhPDD2+/MLpl0IAyGT4a9aWxyc43k3/9HsLQA
 alJ9jmV7QTNBCBWyrBPAQ+z2iX0xI4HT+2SsSIGrz5THRF6zNvjqY6FRIRmD7UhbhBPi
 avOdo+CdsaWaQXYk4g3dQMixtlrJJ4fsbzuIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pOXon1Ft3QMg3+DEMg4mx9AZ1Fo3HFIDsxx5A7Uw3OM=;
 b=cDS+ZodOdM5TvPklYPL3+pOvG24G0fNdPyADuXsJnLTJBy4WodDFKRYjKVfGH+3o7c
 Fn5o1RsFsc8JOU8HZA/fsm1lpuFygK6tOGwC32g7wqJtZ2PIhcRMDp9K+6z4KWxTaMZz
 nVixhqUe0DnFBlStR1PakjhZcYrkelWjbXHUdoz+DQ4meAjl6Zlnek7K1rmdfDxSqP40
 33v9lbDXWLtl1IEl/aiD6xCM60cIinW671fXPVByDM02bre0p1br7VZwHIdyjvigsr1S
 eAKgzdnEnJWb60U11lJj3Pr/Fi0Fi5KYE6PB9dxrs9cXP6lmarTrcUhGhmftZyx1niiW
 KFzA==
X-Gm-Message-State: AOAM532oTc4/EHwOzWwyoBPrluo/YMiAuQGY2BI0/cyJE0GF62REu8mL
 J4jTQob65hEi6mlJmTmljHoZOA==
X-Google-Smtp-Source: ABdhPJzq6Q6lQ24v0Mu+Y1BeLgLXnunLAxECuhLi5f0xY/dZtGuv3xDTR5tJt0iDtbxkj7mQkkzsDw==
X-Received: by 2002:adf:eec8:: with SMTP id a8mr26858146wrp.421.1593605268036; 
 Wed, 01 Jul 2020 05:07:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l132sm7136119wmf.6.2020.07.01.05.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 05:07:47 -0700 (PDT)
Date: Wed, 1 Jul 2020 14:07:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200701120744.GU3278063@phenom.ffwll.local>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Either my mailer ate half the thread or it's still stuck somewhere, so
jumping in the middle a bit.

On Wed, Jul 01, 2020 at 11:03:06AM +0200, Christian K=F6nig wrote:
> Am 30.06.20 um 20:46 schrieb Xiong, Jianxin:
> > > -----Original Message-----
> > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > Sent: Tuesday, June 30, 2020 10:35 AM
> > > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > > Cc: linux-rdma@vger.kernel.org; Doug Ledford <dledford@redhat.com>; S=
umit Semwal <sumit.semwal@linaro.org>; Leon Romanovsky
> > > <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>; Christia=
n Koenig <christian.koenig@amd.com>
> > > Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
> > > =

> > > On Tue, Jun 30, 2020 at 05:21:33PM +0000, Xiong, Jianxin wrote:
> > > > > > Heterogeneous Memory Management (HMM) utilizes
> > > > > > mmu_interval_notifier and ZONE_DEVICE to support shared virtual
> > > > > > address space and page migration between system memory and devi=
ce
> > > > > > memory. HMM doesn't support pinning device memory because pages
> > > > > > located on device must be able to migrate to system memory when
> > > > > > accessed by CPU. Peer-to-peer access is possible if the peer can
> > > > > > handle page fault. For RDMA, that means the NIC must support on=
-demand paging.
> > > > > peer-peer access is currently not possible with hmm_range_fault().
> > > > Currently hmm_range_fault() always sets the cpu access flag and dev=
ice
> > > > private pages are migrated to the system RAM in the fault handler.
> > > > However, it's possible to have a modified code flow to keep the dev=
ice
> > > > private page info for use with peer to peer access.
> > > Sort of, but only within the same device, RDMA or anything else gener=
ic can't reach inside a DEVICE_PRIVATE and extract anything useful.
> > But pfn is supposed to be all that is needed.
> > =

> > > > > So.. this patch doesn't really do anything new? We could just mak=
e a MR against the DMA buf mmap and get to the same place?
> > > > That's right, the patch alone is just half of the story. The
> > > > functionality depends on availability of dma-buf exporter that can =
pin
> > > > the device memory.
> > > Well, what do you want to happen here? The RDMA parts are reasonable,=
 but I don't want to add new functionality without a purpose - the
> > > other parts need to be settled out first.
> > At the RDMA side, we mainly want to check if the changes are acceptable=
. For example,
> > the part about adding 'fd' to the device ops and the ioctl interface. A=
ll the previous
> > comments are very helpful for us to refine the patch so that we can be =
ready when
> > GPU side support becomes available.
> > =

> > > The need for the dynamic mapping support for even the current DMA Buf=
 hacky P2P users is really too bad. Can you get any GPU driver to
> > > support non-dynamic mapping?
> > We are working on direct direction.
> > =

> > > > > > migrate to system RAM. This is due to the lack of knowledge abo=
ut
> > > > > > whether the importer can perform peer-to-peer access and the la=
ck
> > > > > > of resource limit control measure for GPU. For the first part, =
the
> > > > > > latest dma-buf driver has a peer-to-peer flag for the importer,
> > > > > > but the flag is currently tied to dynamic mapping support, which
> > > > > > requires on-demand paging support from the NIC to work.
> > > > > ODP for DMA buf?
> > > > Right.
> > > Hum. This is not actually so hard to do. The whole dma buf proposal w=
ould make a lot more sense if the 'dma buf MR' had to be the
> > > dynamic kind and the driver had to provide the faulting. It would not=
 be so hard to change mlx5 to be able to work like this, perhaps. (the
> > > locking might be a bit tricky though)
> > The main issue is that not all NICs support ODP.
> =

> You don't need on-demand paging support from the NIC for dynamic mapping =
to
> work.
> =

> All you need is the ability to stop wait for ongoing accesses to end and
> make sure that new ones grab a new mapping.

So having no clue about rdma myself much, this sounds rather interesting.
Sure it would result in immediately re-acquiring the pages, but that's
also really all we need to be able to move buffers around on the gpu side.
And with dma_resv_lock there's no livelock risk if the NIC immediately
starts a kthread/work_struct which reacquires all the dma-buf and
everything else it needs. Plus also with the full ww_mutex deadlock
backoff dance there's no locking issues with having to acquire an entire
pile of dma_resv_lock, that's natively supported (gpus very much need to
be able to lock arbitrary set of buffers).

And I think if that would allow us to avoid the entire "avoid random
drivers pinning dma-buf into vram" discussions, much better and quicker to
land something like that.

I guess the big question is going to be how to fit this into rdma, since
the ww_mutex deadlock backoff dance needs to be done at a fairly high
level. For gpu drivers it's always done at the top level ioctl entry
point.

> Apart from that this is a rather interesting work.
> =

> Regards,
> Christian.
> =

> > =

> > > > > > There are a few possible ways to address these issues, such as
> > > > > > decoupling peer-to-peer flag from dynamic mapping, allowing more
> > > > > > leeway for individual drivers to make the pinning decision and
> > > > > > adding GPU resource limit control via cgroup. We would like to =
get
> > > > > > comments on this patch series with the assumption that device
> > > > > > memory pinning via dma-buf is supported by some GPU drivers, and
> > > > > > at the same time welcome open discussions on how to address the
> > > > > > aforementioned issues as well as GPU-NIC peer-to-peer access so=
lutions in general.
> > > > > These seem like DMA buf problems, not RDMA problems, why are you
> > > > > asking these questions with a RDMA patch set? The usual DMA buf p=
eople are not even Cc'd here.
> > > > The intention is to have people from both RDMA and DMA buffer side =
to
> > > > comment. Sumit Semwal is the DMA buffer maintainer according to the
> > > > MAINTAINERS file. I agree more people could be invited to the discu=
ssion.
> > > > Just added Christian Koenig to the cc-list.


MAINTAINERS also says to cc and entire pile of mailing lists, where the
usual suspects (including Christian and me) hang around. Is that the
reason I got only like half the thread here?

For next time around, really include everyone relevant here please.
-Daniel

> > > Would be good to have added the drm lists too
> > Thanks, cc'd dri-devel here, and will also do the same for the previous=
 part of the thread.
> > =

> > > > If the umem_description you mentioned is for information used to
> > > > create the umem (e.g. a structure for all the parameters), then thi=
s would work better.
> > > It would make some more sense, and avoid all these weird EOPNOTSUPPS.
> > Good, thanks for the suggestion.
> > =

> > > Jason
> =

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
