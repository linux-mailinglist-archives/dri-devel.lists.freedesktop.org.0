Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8690285958
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04BB6E0F1;
	Wed,  7 Oct 2020 07:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BF06E138
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 11:46:30 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v123so16229950qkd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=khls/uJRiiihhpviNhiZwsjCwrKDMmXzS3nICWnkoE0=;
 b=agizYAIKwE8nBdCa5FoqruUUgBMZurpzsRC/wNwcTfsnDpXFpX+QcbtpQZNad/gVxa
 Ejl6u02QYnFEvkiLjpKZ89TQcWssfDx6i1puGgdAIuUB6ND5BzNSJb8mCyvibixY/EdF
 pgB/nl85OHsSwiBYpCSL7eI4xgkqvC8eyTW5baeGzGZtamDu1VrTEVHS2Fh2e5EwIdCa
 l+bmTT2IpUpEbcBgO/Vn+7GdNx0SxYlBrsPTJWV6ElQQYg1Sr5wjBNab9QjBywAk8rRQ
 P2SnLftBpoJJDcabtclfyifyvMC+FfaH8IiaW3kaxddjvGyMpMoG34dBGPgpiVQuLKfY
 N8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=khls/uJRiiihhpviNhiZwsjCwrKDMmXzS3nICWnkoE0=;
 b=bWDffE2I1Hi7V95omejx24Oo/17Yvc7FRW0TwudWjON2ySRD14wINVCM3EbdDf4mmx
 v57D/emKUfjarXkcce+w7tVrx4uGoqJrrINGt09GQ5Mh68d6JfFpbfYkCYVQ6w0oG2j/
 EsXy1FdTuXTnzJ57X+9Lh2LA+KHBRKh8zzWb4aFXs7Pp5NwH36THe4kh4vuLBDbhpqCa
 BS3PvHlrXvLyVusd5+3BjXXZKYRd8fb9LcJrxcr5t2TN2z9q+IZEsa/Dz1ONXLTwZ/6m
 Of+Li7r5v3+m9XCLVbsfYpwGPgOmLySOIx46v2H4tkPNi/kugvV0QePqvaADCmMggVQ7
 9ytg==
X-Gm-Message-State: AOAM531Zl3zuepkyUPXKrnlTuq2wctRfNtHUX+1FQPjktI2Aje8WkY/7
 QlL8qTrm61vl71EoAFFMttKFrw==
X-Google-Smtp-Source: ABdhPJxGjy8GMWaeQn4E93BfLwEPNtp1gYfctvZFDUSCXr33xy4Gvvi+lX1EpAqLKazySn71iDwf0Q==
X-Received: by 2002:a37:4e45:: with SMTP id c66mr4918962qkb.36.1601984789486; 
 Tue, 06 Oct 2020 04:46:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id j88sm1989818qte.96.2020.10.06.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 04:46:28 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPlQJ-000VYo-SU; Tue, 06 Oct 2020 08:46:27 -0300
Date: Tue, 6 Oct 2020 08:46:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maor Gottlieb <maorg@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH rdma-next v5 0/4] Dynamicaly allocate SG table from the
 pages
Message-ID: <20201006114627.GE5177@ziepe.ca>
References: <20201004154340.1080481-1-leon@kernel.org>
 <20201005235650.GA89159@nvidia.com>
 <20201006104122.GA438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006104122.GA438822@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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

On Tue, Oct 06, 2020 at 12:41:22PM +0200, Daniel Vetter wrote:
> On Mon, Oct 05, 2020 at 08:56:50PM -0300, Jason Gunthorpe wrote:
> > On Sun, Oct 04, 2020 at 06:43:36PM +0300, Leon Romanovsky wrote:
> > > This series extends __sg_alloc_table_from_pages to allow chaining of
> > > new pages to already initialized SG table.
> > > 
> > > This allows for the drivers to utilize the optimization of merging contiguous
> > > pages without a need to pre allocate all the pages and hold them in
> > > a very large temporary buffer prior to the call to SG table initialization.
> > > 
> > > The second patch changes the Infiniband driver to use the new API. It
> > > removes duplicate functionality from the code and benefits the
> > > optimization of allocating dynamic SG table from pages.
> > > 
> > > In huge pages system of 2MB page size, without this change, the SG table
> > > would contain x512 SG entries.
> > > E.g. for 100GB memory registration:
> > > 
> > >              Number of entries      Size
> > >     Before        26214400          600.0MB
> > >     After            51200            1.2MB
> > > 
> > > Thanks
> > > 
> > > Maor Gottlieb (2):
> > >   lib/scatterlist: Add support in dynamic allocation of SG table from
> > >     pages
> > >   RDMA/umem: Move to allocate SG table from pages
> > > 
> > > Tvrtko Ursulin (2):
> > >   tools/testing/scatterlist: Rejuvenate bit-rotten test
> > >   tools/testing/scatterlist: Show errors in human readable form
> > 
> > This looks OK, I'm going to send it into linux-next on the hmm tree
> > for awhile to see if anything gets broken. If there is more
> > remarks/tags/etc please continue
> 
> An idea that just crossed my mind: A pin_user_pages_sgt might be useful
> for both rdma and drm, since this would avoid the possible huge interim
> struct pages array for thp pages. Or anything else that could be coalesced
> down into a single sg entry.
> 
> Not sure it's worth it, but would at least give a slightly neater
> interface I think.

We've talked about it. Christoph wants to see this area move to a biovec
interface instead of sgl, but it might still be worthwhile to have an
interm step at least as an API consolidation.

Avoiding the page list would be complicated as we'd somehow have to
code share the page table iterator scheme.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
