Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9F3B0905
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD356E0DB;
	Tue, 22 Jun 2021 15:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70366E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 15:28:29 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id g12so16318081qtb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gSIT2aB7rHsSORmJBVTerFLvPUzJvuTh9nq+ipo1OW4=;
 b=jMJSjWzPfPzqnKB8B3d0txI+f1QCXRwofrHYktBL6Dp/RhK8mDhbKSZcIAeOroGN79
 9QKZyuK/IHnSXDzJVZS3X6lKP7w6E8KyRCjjniSQVc0jCI0AkxFDLwDCLmcInmPgiCnf
 jgWG0hhVMC1nVN8HteDjeVRfh514OJrhlEcH2R925fh0DHPJTQOuXuBlI4DUwVhGyPRl
 DthIYUE4NB1fnKp7n1suCV8ABft4OFetd4l8JY9SJSPUN6ozC3ygwCBUw+HE0mNeNlWt
 b8N9Y1O7r/s/b3RUVZtkPQ9u0U0mfuUS0aqx+/yNM9XPrMJnox3nrIaQn6+gPefKB6rN
 j1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gSIT2aB7rHsSORmJBVTerFLvPUzJvuTh9nq+ipo1OW4=;
 b=YvwkA/dTzTq20UtT4+wpkc13vMlqWbKVmghqLzPrClRh+kWYlJy2fh5MD8fPTK1VX7
 jVCeJz2UxlKDRJYVun49mFsW8oXKZ104V1MKzDiCF5hFpRg1RQpCdOnrK3HvBe/Y8CH0
 960nSQFWlxHivpdWJbfbgRKF+vQhb58AlsH1e7KeKaKTSGWQNSSEirUP40nOxk1O5ZjG
 qF1l5bChrqQAbUxub12TEaXPxTlveHAAV3V/JpwllwFYcXxuQwHw4Bt+QGarIRlCeDKW
 IuHVd5aFTWeey71hzoW+aNsY/HFjrzQM4JcLG7cS3iaYfe0B/S3S/lCBpvZsMmOoGmt/
 sJ4w==
X-Gm-Message-State: AOAM533lgpGuDDWW/NsZ7B5DjxI3hjZYFEBLHD4BAlc98On/ydpsPjD9
 9KMBKaLE29KlvVFgnWueSG5Fwg==
X-Google-Smtp-Source: ABdhPJwvGxEjOXxCirTSFPJmIHH9j6VoDmK24La5Ry2f+RuAq8/L4z8p3qLfsHgu2FnFM9CaTb3hKA==
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr3797369qtd.166.1624375708968; 
 Tue, 22 Jun 2021 08:28:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id f19sm13636743qkg.70.2021.06.22.08.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:28:28 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lviKC-00ADKO-08; Tue, 22 Jun 2021 12:28:28 -0300
Date: Tue, 22 Jun 2021 12:28:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622152827.GQ1096940@ziepe.ca>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a37216d-7c4c-081e-3325-82466f30b6eb@amd.com>
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
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
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

On Tue, Jun 22, 2021 at 05:24:08PM +0200, Christian König wrote:

> > > I will take two GAUDI devices and use one as an exporter and one as an
> > > importer. I want to see that the solution works end-to-end, with real
> > > device DMA from importer to exporter.
> > I can tell you it doesn't. Stuffing physical addresses directly into
> > the sg list doesn't involve any of the IOMMU code so any configuration
> > that requires IOMMU page table setup will not work.
> 
> Sure it does. See amdgpu_vram_mgr_alloc_sgt:
> 
>         amdgpu_res_first(res, offset, length, &cursor);
         ^^^^^^^^^^

I'm not talking about the AMD driver, I'm talking about this patch.

+		bar_address = hdev->dram_pci_bar_start +
+				(pages[cur_page] - prop->dram_base_address);
+		sg_dma_address(sg) = bar_address;

Jason
