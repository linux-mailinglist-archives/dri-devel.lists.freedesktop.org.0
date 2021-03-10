Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD73333924
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 10:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888B6E514;
	Wed, 10 Mar 2021 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E983089C2C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 09:35:40 +0000 (UTC)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@canonical.com>) id 1lJvFj-00086j-45
 for dri-devel@lists.freedesktop.org; Wed, 10 Mar 2021 09:35:39 +0000
Received: by mail-ed1-f71.google.com with SMTP id i19so8116535edy.18
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 01:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ftVdUr9F7AHKavJWsV/WnPi5WDLeKje7PJ4qiKh1hck=;
 b=OfiP1QVM+zqjrZ4YglocxZoCTBIh8ty7L5M39tmqrmku83T1JSqT4/mswkrFLacQeM
 CWLHd0PVSQEvRgnXSkJeZcvk03aPo4hN5dwxeYuN3gBX62zTJzT/gRGEk6fWR5YoryI6
 xgz71rySRqc3nqcMdXmUnisbUBqrUZrVatHYzGlmiNGPQxeqL+rCEivCHADK1ynpvEso
 YUM1+EruG+ybLUZkEn40nBbKzjwzNIXR/slHob7ZStwkz+ZgHeSg94Wb3LCcs3QvXgba
 GX10J7IM839hKQG8M0f6iY0eTVrdRM6jb5BbqOMi5hHkWAzvfapfmmdbutSOYf7vKRFT
 fNcQ==
X-Gm-Message-State: AOAM532dgmFOCv2pWeSCLdDz4wGCHzZNHqgUKO6509D8xgnSV5DMUbhz
 EklwHh4tBbC4uzohtGJaSWCqVWLw0S6ezxz25rWZOXzcDzQa1hrH3eIzP1T21V7Q3+Ftvi9Xfac
 fwwatCiaK10MCqcelY1zFGyXiBkuSojX6kN6i9KH688/7lQ==
X-Received: by 2002:aa7:cb4d:: with SMTP id w13mr2231945edt.249.1615368938786; 
 Wed, 10 Mar 2021 01:35:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKM4jWVMgAtlSQkiU252tjiKuhRmDMSNYvDzZOnsMhIIvOmtcr+xfyqFDOCgMHfGsUcv8k2Q==
X-Received: by 2002:aa7:cb4d:: with SMTP id w13mr2231923edt.249.1615368938641; 
 Wed, 10 Mar 2021 01:35:38 -0800 (PST)
Received: from gmail.com (ip5f5af0a0.dynamic.kabel-deutschland.de.
 [95.90.240.160])
 by smtp.gmail.com with ESMTPSA id dg26sm10364101edb.88.2021.03.10.01.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:35:38 -0800 (PST)
Date: Wed, 10 Mar 2021 10:35:37 +0100
From: Christian Brauner <christian.brauner@canonical.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] fs: add an argument-less alloc_anon_inode
Message-ID: <20210310093537.7azjgcywllkda7lg@gmail.com>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-3-hch@lst.de>
X-Mailman-Approved-At: Wed, 10 Mar 2021 09:47:12 +0000
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 04:53:41PM +0100, Christoph Hellwig wrote:
> Add a new alloc_anon_inode helper that allocates an inode on
> the anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good!
Reviewed-by: Christian Brauner <christian.brauner@ubuntu.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
