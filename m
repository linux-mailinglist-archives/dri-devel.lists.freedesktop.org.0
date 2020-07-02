Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE392135FB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7046EB3F;
	Fri,  3 Jul 2020 08:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B404E6E1DE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 12:27:38 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id h16so683200ilj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KbXF3rVnE9Y+VvMzTuHkqkyR4wyjUs/wKLmuVOcm6+0=;
 b=gP3cBBNSsS80JZ9P5WC6YNQZ7v0N/xYCN2O+TyWeFsxablR8ZFXbLP4q37u6ltcfHR
 CUSk25nlb5msSP3XQUmNiPsyAR2mBpSFEso6szQhgfM2ptS3Ia1K+6kTRTOBl1RDtrjF
 d1Q/DOyk4kNSzS5hMLx9n6xKDPB+nE12lAGqg/wOyVDjn9ceKJ48fDXA2rjCloEONxvS
 2nRThEbBdg2vDGJjjZjk0WDQ+PTBGVJJKcGDDYx/jtSsjVdSY5ERqe/lDink9KKM0QOc
 /lckCOfIP7rbu9cSQdZW3jq5yygjJ07SeWmdoDo5CD5OGpc7+V+J+ppvEmcFYKv4DfBM
 mg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KbXF3rVnE9Y+VvMzTuHkqkyR4wyjUs/wKLmuVOcm6+0=;
 b=mc5kDMQe2CwoVabAGki+iosFUoNjnKtxviBvU2ZBURiR0ze+16z7zEDa5Q24uzkqJk
 VQ0GscKqcMyhkH8bwqPR4UHv1IKqqh6zeNdeC5r+CPbs52YoluA7ovZlLntguRH4IlQn
 1W3IuFd8O+xiEExBW03H7qsL1OUWOldFCWxUY7gECzb0Q5i6UDoL2XQHNa5FxTSwIZKr
 5/eZ+pYkIaDs8311d/gTCbtQpUcTri5UBjNRxkXW+dpDP8NDpx79+yWc7kgmL5zbxk+t
 5Ls78ivXSC8SvfF0qJEwJQDi9Y0EPs4rXjvfKiLnIg5HF/5+b5K/skd54N5G5hPJTr13
 ztiw==
X-Gm-Message-State: AOAM530Jc3WBLfdIMcYmeYTMUKXOnfLhjHJh2dF00FggZ4dSEF0+pEK0
 wQ+x6tDZtfuY3UnBm02iSgj11A==
X-Google-Smtp-Source: ABdhPJy97My/0BHrvS8CjsBg5Hl5wpr2Xfxh8eavaInlBkgzXSCZgRpkLqT4lq3H4wuhX4XIGaiFuA==
X-Received: by 2002:a92:bb55:: with SMTP id w82mr12721102ili.146.1593692857820; 
 Thu, 02 Jul 2020 05:27:37 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id d77sm5062859ill.67.2020.07.02.05.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 05:27:37 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jqyJU-002qqy-B3; Thu, 02 Jul 2020 09:27:36 -0300
Date: Thu, 2 Jul 2020 09:27:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200702122736.GR25301@ziepe.ca>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630191700.GL25301@ziepe.ca>
 <MW3PR11MB4555223B6D3C6E4829795798E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555223B6D3C6E4829795798E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
 Christian Koenig <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 08:08:46PM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Tuesday, June 30, 2020 12:17 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; Doug Ledford <dledford@redhat.com>; Sumit Semwal <sumit.semwal@linaro.org>; Leon Romanovsky
> > <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>; dri-
> > devel@lists.freedesktop.org
> > Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
> > 
> > > >
> > > > On Tue, Jun 30, 2020 at 05:21:33PM +0000, Xiong, Jianxin wrote:
> > > > > > > Heterogeneous Memory Management (HMM) utilizes
> > > > > > > mmu_interval_notifier and ZONE_DEVICE to support shared
> > > > > > > virtual address space and page migration between system memory
> > > > > > > and device memory. HMM doesn't support pinning device memory
> > > > > > > because pages located on device must be able to migrate to
> > > > > > > system memory when accessed by CPU. Peer-to-peer access is
> > > > > > > possible if the peer can handle page fault. For RDMA, that means the NIC must support on-demand paging.
> > > > > >
> > > > > > peer-peer access is currently not possible with hmm_range_fault().
> > > > >
> > > > > Currently hmm_range_fault() always sets the cpu access flag and
> > > > > device private pages are migrated to the system RAM in the fault handler.
> > > > > However, it's possible to have a modified code flow to keep the
> > > > > device private page info for use with peer to peer access.
> > > >
> > > > Sort of, but only within the same device, RDMA or anything else generic can't reach inside a DEVICE_PRIVATE and extract anything
> > useful.
> > >
> > > But pfn is supposed to be all that is needed.
> > 
> > Needed for what? The PFN of the DEVICE_PRIVATE pages is useless for anything.
> 
> Hmm. I thought the pfn corresponds to the address in the BAR range. I could be
> wrong here. 

No, DEVICE_PRIVATE is a dummy pfn to empty address space.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
