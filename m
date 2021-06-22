Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12003B03A5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9014B6E104;
	Tue, 22 Jun 2021 12:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E866E104;
 Tue, 22 Jun 2021 12:04:58 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id s17so653477oij.0;
 Tue, 22 Jun 2021 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UXu33zooM1Crc13Vebp8C5tdePhjb755cOhdTYx1RhI=;
 b=IBxYEyz8qFrpyXjdmOhua9qpGyNdwX02NaojZVpftJeAz4cyuDCEAd0+qADxitTYR9
 7LRSirAlbT/vLaBcd+EYJxNpTrceIy3pY9v4vL2s6kVGve2mWavF/S9gdoUEARKwK86J
 MRxtY7QJRKDwFpOVd1o8eFa7zoGV0XWD+kEyUY9F4Fya8NeamnK6jjoUDTk28fAgr6hp
 xtzu8p/laLWYbN9YzUjaZnlg2BzkAEBUrlpuilkihQrotRNoB1aKYIzadRsiBb/qRf5P
 5eigpS//hdZK/xPV9k2CHEAQdna490dEykBfiNm2Sx4X4XKQnb3AfoUMJXKOf+KtYuYs
 /9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UXu33zooM1Crc13Vebp8C5tdePhjb755cOhdTYx1RhI=;
 b=THpQIk1mCnxpKcsDANz9Vqn4PebibnggTp2D6qn1yorFJZeCyfTHOoARYGYZHxq9jb
 L925OVhEF8v3TSNrS6Fie/dh4D7Ex0gLV4nAxPyrUuhGaCwi0pgNyaLVfm9T9jKRW3u7
 ilU1wTdsvxEIDm3nKybeMJThi6Q4/+gEkVF7wdZi7UukWePykEn8GdYhO9sbNrVlTbsO
 Ivi9ec24UVrReqhhz5+iw/Rjo9JRLr890vQzUGuRzZw8TDk7F7EW+6cxjSfOTv6+THR9
 XkHAcfynVDS2EsAivdGHjNrjZEi/5AXYqzBO3oabElaJR02Mjtk0ERulIW8m/TX9nwyq
 vd6Q==
X-Gm-Message-State: AOAM531EFIEXKmSjRnlYP9WEKIArA/Os48H0QhtqrheSWlb10qz5jcpj
 v6wY9Nn0bM1LoQFim+3E1Zi0zHEGrAC0Mraf2x4=
X-Google-Smtp-Source: ABdhPJz9eTOAYS/A5LDYycSvFHQxs/rBQ2qipYP0MTUC17z8ZF/zeA2uqIWquOAnXIrUs1z3RzFaGSzZm9SwmWCsolo=
X-Received: by 2002:aca:ac02:: with SMTP id v2mr2855756oie.154.1624363497566; 
 Tue, 22 Jun 2021 05:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
In-Reply-To: <20210622120142.GL1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 22 Jun 2021 15:04:30 +0300
Message-ID: <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
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

On Tue, Jun 22, 2021 at 3:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
> > On Tue, Jun 22, 2021 at 9:37 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > > > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> > > >
> > > >> Another thing I want to emphasize is that we are doing p2p only
> > > >> through the export/import of the FD. We do *not* allow the user to
> > > >> mmap the dma-buf as we do not support direct IO. So there is no ac=
cess
> > > >> to these pages through the userspace.
> > > > Arguably mmaping the memory is a better choice, and is the directio=
n
> > > > that Logan's series goes in. Here the use of DMABUF was specificall=
y
> > > > designed to allow hitless revokation of the memory, which this isn'=
t
> > > > even using.
> > >
> > > The major problem with this approach is that DMA-buf is also used for
> > > memory which isn't CPU accessible.
>
> That isn't an issue here because the memory is only intended to be
> used with P2P transfers so it must be CPU accessible.
>
> > > That was one of the reasons we didn't even considered using the mappi=
ng
> > > memory approach for GPUs.
>
> Well, now we have DEVICE_PRIVATE memory that can meet this need
> too.. Just nobody has wired it up to hmm_range_fault()
>
> > > > So you are taking the hit of very limited hardware support and redu=
ced
> > > > performance just to squeeze into DMABUF..
> >
> > Thanks Jason for the clarification, but I honestly prefer to use
> > DMA-BUF at the moment.
> > It gives us just what we need (even more than what we need as you
> > pointed out), it is *already* integrated and tested in the RDMA
> > subsystem, and I'm feeling comfortable using it as I'm somewhat
> > familiar with it from my AMD days.
>
> You still have the issue that this patch is doing all of this P2P
> stuff wrong - following the already NAK'd AMD approach.

Could you please point me exactly to the lines of code that are wrong
in your opinion ?
I find it hard to understand from your statement what exactly you
think that we are doing wrong.
The implementation is found in the second patch in this patch-set.

Thanks,
Oded
>
> > I'll go and read Logan's patch-set to see if that will work for us in
> > the future. Please remember, as Daniel said, we don't have struct page
> > backing our device memory, so if that is a requirement to connect to
> > Logan's work, then I don't think we will want to do it at this point.
>
> It is trivial to get the struct page for a PCI BAR.
>
> Jason
