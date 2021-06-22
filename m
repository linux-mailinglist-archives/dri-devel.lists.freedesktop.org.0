Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E5C3B059C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB596E4FE;
	Tue, 22 Jun 2021 13:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFA76E4F9;
 Tue, 22 Jun 2021 13:12:53 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s23so23684214oiw.9;
 Tue, 22 Jun 2021 06:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zo8AMbVZ0Bpk+i0daFhjZFD9mbDtHeyM5fWaVTiW44c=;
 b=M05I4XSyQvJq3QrAd4YBgso50a64XymDeEWCojzzYqEGpvV4rh82mK2VGpP2ZpQw/K
 qKLMFRbXqv6tTtNOrZ0DfZ/7XN9zk8aAO7H29pjKNlXbwyFKm1mGbOqZSO36X7wT3m7P
 81j0l7w9IdikOL9pXOvSfc2I4ej0eigFsmLjVhpf6rAwucqQvM2hTGGC03uozjBCzjhM
 b0RYRSapW0yTEw7Ctcr7dBktk7sjweeCgQXLqe0Djkdv/UeVSGwRA1/91NCbYrZi3ufl
 11gmazwOPS8f0/v7rNXQbB349lJ4lS6Zf/6sYR4bj+imOJbN3S+rAay06cfD0bzrE63T
 LGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zo8AMbVZ0Bpk+i0daFhjZFD9mbDtHeyM5fWaVTiW44c=;
 b=JZ5mEuEab/fNo2tJG/vVX+6LGReloVPp4hrc6qHJ1rlIgYRCTJObRVRHUZjaaxBsXp
 RL3ng3RP/GIcrzdDh5fMmgv2no/zY9Wi1BymC+yVm0MuUc+cB1pmPSAUbjxjK2/Ygs9y
 gDC8fJ29UCWCbo60ARasL9lTzigJP3+eWWpCmLEAILZtTVm4TkbaBprcKu1PXCa9zfxi
 yHWBBvA8gIExMvn2LuKaI9RBZsBS2Mu8wYfh238TI/JjaK2T1KlntNKLhTwPQI+YuJM9
 3rA/7iP5EPuOupUdfTtWjYGrLBDPfxKuz6zL2g9o4zhIt0+WJrl0wY/LhN7Azq91U/WC
 r+wQ==
X-Gm-Message-State: AOAM533ekYc9jPy2zmDb7dzkOhKLclU9cZDAqvHM8YqawgfhuujKgUFi
 gkVeBC2gb3+V0e48+3xPcBETa0KU5RCw0fOZ/4E=
X-Google-Smtp-Source: ABdhPJx0VEzjKsRYKDZvxAXPUrSx4rHDbmALWmjVLs/sT+gDzBTdktbxkHUJKd8+jHZcNZxQ6zZrih+vNRQS+TgBW6w=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr2878226oia.102.1624367572833; 
 Tue, 22 Jun 2021 06:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
In-Reply-To: <20210622121546.GN1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 22 Jun 2021 16:12:26 +0300
Message-ID: <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 3:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jun 22, 2021 at 03:04:30PM +0300, Oded Gabbay wrote:
> > On Tue, Jun 22, 2021 at 3:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
> > > > On Tue, Jun 22, 2021 at 9:37 AM Christian K=C3=B6nig
> > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > >
> > > > > Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > > > > > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> > > > > >
> > > > > >> Another thing I want to emphasize is that we are doing p2p onl=
y
> > > > > >> through the export/import of the FD. We do *not* allow the use=
r to
> > > > > >> mmap the dma-buf as we do not support direct IO. So there is n=
o access
> > > > > >> to these pages through the userspace.
> > > > > > Arguably mmaping the memory is a better choice, and is the dire=
ction
> > > > > > that Logan's series goes in. Here the use of DMABUF was specifi=
cally
> > > > > > designed to allow hitless revokation of the memory, which this =
isn't
> > > > > > even using.
> > > > >
> > > > > The major problem with this approach is that DMA-buf is also used=
 for
> > > > > memory which isn't CPU accessible.
> > >
> > > That isn't an issue here because the memory is only intended to be
> > > used with P2P transfers so it must be CPU accessible.
> > >
> > > > > That was one of the reasons we didn't even considered using the m=
apping
> > > > > memory approach for GPUs.
> > >
> > > Well, now we have DEVICE_PRIVATE memory that can meet this need
> > > too.. Just nobody has wired it up to hmm_range_fault()
> > >
> > > > > > So you are taking the hit of very limited hardware support and =
reduced
> > > > > > performance just to squeeze into DMABUF..
> > > >
> > > > Thanks Jason for the clarification, but I honestly prefer to use
> > > > DMA-BUF at the moment.
> > > > It gives us just what we need (even more than what we need as you
> > > > pointed out), it is *already* integrated and tested in the RDMA
> > > > subsystem, and I'm feeling comfortable using it as I'm somewhat
> > > > familiar with it from my AMD days.
> > >
> > > You still have the issue that this patch is doing all of this P2P
> > > stuff wrong - following the already NAK'd AMD approach.
> >
> > Could you please point me exactly to the lines of code that are wrong
> > in your opinion ?
>
> 1) Setting sg_page to NULL
> 2) 'mapping' pages for P2P DMA without going through the iommu
> 3) Allowing P2P DMA without using the p2p dma API to validate that it
>    can work at all in the first place.
>
> All of these result in functional bugs in certain system
> configurations.
>
> Jason

Hi Jason,
Thanks for the feedback.
Regarding point 1, why is that a problem if we disable the option to
mmap the dma-buf from user-space ? We don't want to support CPU
fallback/Direct IO.
In addition, I didn't see any problem with sg_page being NULL in the
RDMA p2p dma-buf code. Did I miss something here ?

Regarding points 2 & 3, I want to examine them more closely in a KVM
virtual machine environment with IOMMU enabled.
I will take two GAUDI devices and use one as an exporter and one as an
importer. I want to see that the solution works end-to-end, with real
device DMA from importer to exporter.
I fear that the dummy importer I wrote is bypassing these two issues
you brought up.

So thanks again and I'll get back and update once I've finished testing it.

Oded
