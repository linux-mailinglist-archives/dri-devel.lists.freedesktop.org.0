Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4433B095D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3A96E5B6;
	Tue, 22 Jun 2021 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8B6E5B2;
 Tue, 22 Jun 2021 15:41:12 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id t40so24218497oiw.8;
 Tue, 22 Jun 2021 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jgaz579QWdtxXB8nWqcH6rzqF6qFCj5oOGxmdOSH2CQ=;
 b=u0XMgd5ruUtJjM/nF+7PWab6GDpci7JslYc9OxFlQ6lxKqsy1oudi2TK6jNH47GZ+v
 Y57oVO6hv69UI1JFsgHef/tnt00AwLlYx+SHKFv/NWmkXVgR3t8VrITuUBLNXdnr8pqY
 dKePYkYzljnzqMLmdSCKAbrYJTyR1oHoNFWMnKDZD+es0mXMJSBf5vBmOxIc3R5RAXNJ
 T9wcJR+xYc/bd+zOFm8jt7ferXgVC+QUbdCOHFG5g7g6fdi6f5J5tz218/RJh2chgPju
 JbUy+m0qcvyjjqyqR9YEn+9lDdMnS3VoV4MTA8dRQxzeqQwH3baFPX4/pPQTiQ/e9abq
 BTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jgaz579QWdtxXB8nWqcH6rzqF6qFCj5oOGxmdOSH2CQ=;
 b=M9N/YO2/9RvuW+guHtUddIpf8FOzTC6poagANul2tGoX0w1gk4ULzsEJu1mOB7YYd9
 8KRJnG/qJWvm7dXF88wQOFujgqaC2XV45yG+hEJg42ioPlDKOxUbuiXBixoSKOskbecb
 XQcQ7LGXq3JtVEujc4fdc1OqETLLu/CUNYpOLklaNLlPAVoNBX8Tzhpj/roDHY2McmdF
 ZD9eOG4eTzSwwXgRpmxK+r++dLCFZBgEpCH/btxEqe1ySE4vhHoymnWktLUu4+ZtitQb
 RfDLPCTxW87Uzd8yGtLVYayNs883fC1BzOPIVPIO5m4Kf6nx4mhDWZl5QpCoCxc3ri+J
 b5RA==
X-Gm-Message-State: AOAM533ZMvX2Tz0svkwJ0SXPWEl9W8FewoCgsv9qW/NKLCjWBmE/MO5R
 u4elui0Yt8XotuuCr/jSyqDGvDQ0opeooWT1qxE=
X-Google-Smtp-Source: ABdhPJz+KuMjB+Vj8SljFh6w9ERIpM1RHLusPzFhPRwCq/V4Ax+B3UFH6tJ7zE3LnkZjvcQbS/i0fDTXzllWy0LhI4Y=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr3399388oia.102.1624376471543; 
 Tue, 22 Jun 2021 08:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
 <20210622151142.GA2431880@ziepe.ca>
 <4a37216d-7c4c-081e-3325-82466f30b6eb@amd.com>
 <20210622152827.GQ1096940@ziepe.ca>
 <9ff1a7ef-a5a4-dd80-6f19-304b668d82a1@amd.com>
In-Reply-To: <9ff1a7ef-a5a4-dd80-6f19-304b668d82a1@amd.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 22 Jun 2021 18:40:44 +0300
Message-ID: <CAFCwf13w74qFDchEsdCAtpOvnYkzvcsU0RAdBLNGJq-e5srfHA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 6:31 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 22.06.21 um 17:28 schrieb Jason Gunthorpe:
> > On Tue, Jun 22, 2021 at 05:24:08PM +0200, Christian K=C3=B6nig wrote:
> >
> >>>> I will take two GAUDI devices and use one as an exporter and one as =
an
> >>>> importer. I want to see that the solution works end-to-end, with rea=
l
> >>>> device DMA from importer to exporter.
> >>> I can tell you it doesn't. Stuffing physical addresses directly into
> >>> the sg list doesn't involve any of the IOMMU code so any configuratio=
n
> >>> that requires IOMMU page table setup will not work.
> >> Sure it does. See amdgpu_vram_mgr_alloc_sgt:
> >>
> >>          amdgpu_res_first(res, offset, length, &cursor);
> >           ^^^^^^^^^^
> >
> > I'm not talking about the AMD driver, I'm talking about this patch.
> >
> > +             bar_address =3D hdev->dram_pci_bar_start +
> > +                             (pages[cur_page] - prop->dram_base_addres=
s);
> > +             sg_dma_address(sg) =3D bar_address;
>
> Yeah, that is indeed not working.
>
> Oded you need to use dma_map_resource() for this.
>
> Christian.
Yes, of course.
But will it be enough ?
Jason said that supporting IOMMU isn't nice when we don't have struct pages=
.
I fail to understand the connection, I need to dig into this.

Oded

>
>
>
> >
> > Jason
>
