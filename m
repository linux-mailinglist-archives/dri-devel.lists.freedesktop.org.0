Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F03BC1CE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 18:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0C78999E;
	Mon,  5 Jul 2021 16:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D178999E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 16:52:28 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id d2so8511570qvh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TRW2liv0KvxRpEn1sZgxByQ6WPmBTh1GhCnSHVjnwbg=;
 b=jBFIqWpkHJUwhFRIEXpavqYg2lOBnFUgtfMCAa51Keo5p1e7uaLLRwx5ShUDeIlhdM
 2If2zjmjcfC5T6RoGkkweicUk3Qsx+2vRdseYI/0mJ+ciw96iBmUkpkVkiJE+86t8cyr
 2oJc7CwvfA5oUIWZzMzGPAFug62Z67fj3p3Z3WgSBFHsqz4/BWGoOCucw+iLuagpvAH1
 PpbSwCitf8MOcMx6/0YLotNGXe8rFb+KOw2NMKF5n5y/HAuQN75chVqThR99yPOEQKYA
 xDWvGJSbbwBNR2Hg29azK+xEHKNYDfvZIIv02WRktmpruBPJPenBbq+963N6aPphnsv4
 Bn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TRW2liv0KvxRpEn1sZgxByQ6WPmBTh1GhCnSHVjnwbg=;
 b=hrgismtWjuEOBfJes/BXyP8v1V8bMViOVnfndIrl7AzlpqhTPE76QSsTLatvXVdm+6
 NWYczvglnIhugOVAOeWJa9ZhHSPAkO1Aasiz+rUZn3YbrgI/r0M1J9NezRQBCSIkpenF
 FuES+GcasVeiVOu+aLboxxHEfOPcs3n024XLwxcVF+cnGuXRX588SVtmrZeqgRKq0dJR
 wX/V2VxbKgiVj0V8Ebl+IhKQZYhVbfrEkqmsnhmirJmmS9anuArat40+xKPvtmypivVn
 fSuWf4rbIthQy4Kn1zC/MaKTIFolcmai79Xd4JXtmsUim2Bd2UtWLVDWSOZevkwSHMMq
 W9SA==
X-Gm-Message-State: AOAM530KYEuWL69MjfGp3oHg5ksrrFbUYoObbsGdDu/o5dycrPYB5asY
 vdBesR+Ia3msMcxMcjMlzsZpEw==
X-Google-Smtp-Source: ABdhPJw/xzr3myWPCDkP4OYKH+JUqyzPcaaW7tJ0//CdDzso+M0bp2m0674/I/B/gC+TTQwFiqkSng==
X-Received: by 2002:a0c:ef51:: with SMTP id t17mr13560008qvs.14.1625503947734; 
 Mon, 05 Jul 2021 09:52:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id 82sm5694070qke.63.2021.07.05.09.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:52:27 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1m0Rpa-003sCS-IC; Mon, 05 Jul 2021 13:52:26 -0300
Date: Mon, 5 Jul 2021 13:52:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v4 2/2] habanalabs: add support for dma-buf exporter
Message-ID: <20210705165226.GJ4604@ziepe.ca>
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <20210705130314.11519-3-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705130314.11519-3-ogabbay@kernel.org>
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
Cc: linux-rdma@vger.kernel.org, daniel.vetter@ffwll.ch, sleybo@amazon.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 galpress@amazon.com, linaro-mm-sig@lists.linaro.org, dledford@redhat.com,
 hch@lst.de, amd-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 alexander.deucher@amd.com, Tomer Tayar <ttayar@habana.ai>,
 christian.koenig@amd.com, leonro@nvidia.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 04:03:14PM +0300, Oded Gabbay wrote:

> +	rc = sg_alloc_table(*sgt, nents, GFP_KERNEL | __GFP_ZERO);
> +	if (rc)
> +		goto error_free;

If you are not going to include a CPU list then I suggest setting
sg_table->orig_nents == 0

And using only the nents which is the length of the DMA list.

At least it gives some hope that other parts of the system could
detect this.

> +
> +	/* Merge pages and put them into the scatterlist */
> +	cur_page = 0;
> +	for_each_sgtable_sg((*sgt), sg, i) {

for_each_sgtable_sg should never be used when working with
sg_dma_address() type stuff, here and everywhere else. The DMA list
should be iterated using the for_each_sgtable_dma_sg() macro.

> +	/* In case we got a large memory area to export, we need to divide it
> +	 * to smaller areas because each entry in the dmabuf sgt can only
> +	 * describe unsigned int.
> +	 */

Huh? This is forming a SGL, it should follow the SGL rules which means
you have to fragment based on the dma_get_max_seg_size() of the
importer device.

> +	hl_dmabuf->pages = kcalloc(hl_dmabuf->npages, sizeof(*hl_dmabuf->pages),
> +								GFP_KERNEL);
> +	if (!hl_dmabuf->pages) {
> +		rc = -ENOMEM;
> +		goto err_free_dmabuf_wrapper;
> +	}

Why not just create the SGL directly? Is there a reason it needs to
make a page list?

Jason
