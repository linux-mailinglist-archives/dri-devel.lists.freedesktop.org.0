Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8904AC054
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482EB10E4AF;
	Mon,  7 Feb 2022 14:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A1910E4AF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:01:30 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id b35so10919186qkp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+VH5Yzc0FArtBDlyVciKdTaJzlAuXtplA0CDhVkYZVw=;
 b=TUJuhAgjjswNVQ7JzTkg9iKkOgM430mBd5iaZFyVB8juiwGMelroxSVc/tEeoVjS03
 SBBJAs6XyaJLOH0zNh1fMB11MocmBy0vZW3lQVqwc7nmLVkUib5NLDfgXeW1egoLcrUl
 0zJ1M9G8GricJAi2JHxOQgJzIsENPf4oXdSlLGMn1ou/GSiwitfE+Re74s2OC3cGYiXS
 WAB6PyKR8iNz2aNJcgzl/Jv2b00SlxQrNVuEW+ZJ8pyVvgvQpU41dl5hiuO86kWk7vjX
 6XluH9RnX42crAJsdacFsF/M+gN0YxPG9aqIQm6tHe1mZG9Uo38/MZ0gAIlPcqFBC8jG
 7hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+VH5Yzc0FArtBDlyVciKdTaJzlAuXtplA0CDhVkYZVw=;
 b=BYOwM9rlwa56XYIJs0//QdHKShhQ0UMfPQpd1NnkFcHY3D2jJsymaeaj1icHq0mmwh
 d7kyzZ8oRolP0wqsdU4v42DTVEQiiawRZxLwEzzipUhHjeNO2sbahjW++WACuZ7w+IAX
 0HZuqf3RS771vhU+TvVmAfgm9QTzu78q/izsTIIA6X2EIh0wM/16M8fvG9cyRF6I0VJZ
 EMhmkLROpt3SrnH9MfxzygIsh9thMM8FnX26pbjQlDP+7A7Rhq0NzD6MDjQ2wkirygHZ
 XNUYH1rdxQsJLgqqZtxoAlMd5uXP0s2Ktq0HsaQ1abJ2KMVqR2dZdBjxHIEmey3qIO5T
 bHMw==
X-Gm-Message-State: AOAM533ldYUQEUGyvxSSjvzgWPKisH+W3DQVntE/Ln7s9pICzOsl+8Ha
 tfYXGxBCjGIGsCd9MNRmhbKsOQ==
X-Google-Smtp-Source: ABdhPJxewUAI8RDxJecgMQqK84dnZDRSuWWALhikOi914YekMnNecZIoiX1AIBCzbrtZ6bBwZBwWpw==
X-Received: by 2002:a37:2c02:: with SMTP id s2mr6217893qkh.76.1644242489492;
 Mon, 07 Feb 2022 06:01:29 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id f4sm5480989qko.72.2022.02.07.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 06:01:28 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH4a7-000CyH-Do; Mon, 07 Feb 2022 10:01:27 -0400
Date: Mon, 7 Feb 2022 10:01:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/8] mm: remove pointless includes from <linux/hmm.h>
Message-ID: <20220207140127.GA49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-4-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 07:32:44AM +0100, Christoph Hellwig wrote:
> hmm.h pulls in the world for no good reason at all.  Remove the
> includes and push a few ones into the users instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
>  include/linux/hmm.h                      | 9 ++-------
>  lib/test_hmm.c                           | 2 ++
>  4 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
