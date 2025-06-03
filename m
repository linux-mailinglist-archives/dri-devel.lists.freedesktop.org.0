Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC67ACC833
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FBD10E5A2;
	Tue,  3 Jun 2025 13:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BlNh+VJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F384310E5A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:47:50 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2e3dea42465so3500066fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958469; x=1749563269; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
 b=BlNh+VJ51n6N4EkPPcZYDOCtrRSDUV1gd3zMLuOqCydIJATKfrLkQLgyu1RHLE/+HO
 Y3nmZVSjmYoyuKJ91zk/hcGOAWeb3wsqXAdACp3a0S838sjOLot+bROZ57wSwDesaj9n
 jTxrsJWo0dLlplyF9fgIIEZG23C1hgCbTwZm8kqHq+Z6vcaXYSznRy6T86Nu5WPOt9Bn
 xzL2gk3gfmKNDmO+duux6n486eDuqSMUc0+u2WEJn/wYAa3vutaazWFelvXUTbSPz2U3
 WXRoZZejcKE7H0/wtojGQxlEX0ohZU2zZeEflq0TACgmjS2+glErtxlEiypmMaUW/tPr
 LJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958469; x=1749563269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
 b=VYT/YGqxAyhLtNlv+70H7y5gjDkDV9ljbwqhWo6VR8BGGvQpOpkXBNM31vdUk9kzY/
 HgINrIBLyewt8XPZEghPxF5DYjj4ma8b2fwAgpBw9rMb4FXoqTVJZ0CxoSN3pQQ9cddr
 72r1lZa/CjBlSXeoktftG1EZb5URYVgcrLRWgH82SUEq8nvKWp0qTKz7Ylgi7duGSfzh
 yS2rEctARLM9uizADlpnnhS4OtntEh+D7nNpXnwRhPQGtvv3GAQqHnKnsfaRDt3i0J9l
 V26GpF4+KCr1fZgOh1Z1wnjcGNXxkELQA7q9Chb8E/G2t5fwKWsuiotD59Fx8LxBNWmT
 MHPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsTYruv63iLT6JJ2fTZPNjGWZ7HaYlLorXZogKd4qQYz1sAfu//Uw1Ar9St0FRzfTF6B1lNUxRc+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/jjma8ZdoBdvnjoRIBmtMKLS6MzS3z3gYLnSZgzjxsnZqTLxy
 Y1XgxGaRTqtJWWDDk9qCP12sjFnAjDkGlmy60TCDkFd7dYufhmJXs6bWOz69lknQijHhFLQPZ7t
 eOq1z
X-Gm-Gg: ASbGnct0qS++Y5+JV9IcOQ25S0qMAhZW8qcYcMwQpGe4EplPygjzS+e7rF4NtUM4Wvz
 z/xiTsImfunQc6NuCOUQlYdz8XiMaRjFHr2E7OmoEZHoZcJvfvElsmhsElzBYia5Wvpds49g/i6
 oWBOTRusQB0rMdVbSOMtkRevWHwof7V2iusIU0reQLZjN2CaRdhgjJls1DzGyuA83BKDFLMPf3K
 dnmAT3hqu06DwWwg8j/fozMxQEICTFSeMA+JIIlGvx2x5tSfnVlrWOguPM6+PsYGprK/nly6pCC
 q1WTk7bdc0c3UUJwq63SW8Dezok1M3xaTg2tQdvono1FMn3ISPPiCRH3yAMZv8sAWTUskLwzGoZ
 sqZXGiuUOavoh1KQXI9O0/xwKyjw=
X-Google-Smtp-Source: AGHT+IEn/uCXnqGk9mGrQEIlQbsguMg4s70jmRhOs28+dV79kPuZtTFgI19mnXFgGkPMbOXTAF/Qjg==
X-Received: by 2002:a05:620a:278d:b0:7c5:d71c:6a47 with SMTP id
 af79cd13be357-7d211676724mr394455585a.8.1748958459265; 
 Tue, 03 Jun 2025 06:47:39 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a195d7dsm840098585a.78.2025.06.03.06.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:47:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRzO-00000001hB3-1CmA;
 Tue, 03 Jun 2025 10:47:38 -0300
Date: Tue, 3 Jun 2025 10:47:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 06/12] mm/gup: Remove pXX_devmap usage from
 get_user_pages()
Message-ID: <20250603134738.GG386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 29, 2025 at 04:32:07PM +1000, Alistair Popple wrote:
> GUP uses pXX_devmap() calls to see if it needs to a get a reference on
> the associated pgmap data structure to ensure the pages won't go
> away. However it's a driver responsibility to ensure that if pages are
> mapped (ie. discoverable by GUP) that they are not offlined or removed
> from the memmap so there is no need to hold a reference on the pgmap
> data structure to ensure this.

Yes, the pgmap refcounting never made any sense here.

But I'm not sure this ever got fully fixed up?

To solve races with GUP fast we need a IPI/synchronize_rcu after all
VMAs are zapped and before the pgmap gets destroyed. Granted it is a
very small race in gup fast, it still should have this locking.

> Furthermore mappings with PFN_DEV are no longer created, hence this
> effectively dead code anyway so can be removed.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   3 +-
>  mm/gup.c                | 162 +----------------------------------------
>  mm/huge_memory.c        |  40 +----------
>  3 files changed, 5 insertions(+), 200 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
