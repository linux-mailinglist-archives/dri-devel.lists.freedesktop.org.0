Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B204C29993E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 23:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECCD6EA79;
	Mon, 26 Oct 2020 22:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BEB6EA79
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 22:02:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a72so13167484wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 15:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nnyXk2pMcKjBK4+Fq7Fk4IbVXn2gczxbne31w99Uqrk=;
 b=aNdxfyvHxW5EhJys38x8msSr36mwdr8ntNEXWK/+T2/MzKfU0VCnCWyghyZeK0cVeb
 rA0iLh+uHuE4kyJ2TJC3GpOOr5wl+e2jm2smdq02RkePbEEuN++cEauu/TxifEzN74sA
 tq59FL7KLoIUR9iPLa6VmUTM39rV8IcMJlYBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nnyXk2pMcKjBK4+Fq7Fk4IbVXn2gczxbne31w99Uqrk=;
 b=Q7xPc2buFJUjnlvRVjoeX3UcDGCPU/78eKGbCVJf9iQKLc7GcySqymArsLbqKxoOOS
 62fJKnEcj7NQiwTRpjNvXybscK9LtPY3wXf30qf+x0OWJX5cHzq6Z0GcDPWueGEZGzt+
 IU852ztnp6NB6C8CFoRJDl6d3h3VNr2Cwpfh3Pod1hr+37P6DT7tvMQqYxwgGZB2yBbT
 hVU4fz0kp8xqNhlufZj/MTmml0iGILqdE1fuUofPX0zEczK7zu0+5kVHwvq+s3V67DZl
 Npjpoo86ZCpaI7wCkd+EQjNIf6E1TchwMu2BFDDTcUwHfEqXfrqF5fjBAlH+KmR1kVVv
 TwYQ==
X-Gm-Message-State: AOAM5320RB/Q5RJQ6DoUfAYxprWr23W+voUNr/YBxt1Dx0j3OSBPUHES
 rI0GM1mcXFebcEQtqjt2r34LNg==
X-Google-Smtp-Source: ABdhPJwXQQfk3H55i6k/BF7MPc09Wr29zTiROpPA8yChYSvzhbxp82tIcqHTWfVny/00bz/9GBIJdQ==
X-Received: by 2002:a1c:bc06:: with SMTP id m6mr19364153wmf.68.1603749728982; 
 Mon, 26 Oct 2020 15:02:08 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id t7sm23634700wrx.42.2020.10.26.15.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 15:02:08 -0700 (PDT)
Date: Mon, 26 Oct 2020 22:02:06 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 09/15] media/videbuf1|2: Mark follow_pfn usage as unsafe
Message-ID: <20201026220206.GA2802004@chromium.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026105818.2585306-10-daniel.vetter@ffwll.ch>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Mon, Oct 26, 2020 at 11:58:12AM +0100, Daniel Vetter wrote:
> The media model assumes that buffers are all preallocated, so that
> when a media pipeline is running we never miss a deadline because the
> buffers aren't allocated or available.
> =

> This means we cannot fix the v4l follow_pfn usage through
> mmu_notifier, without breaking how this all works. The only real fix
> is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
> tell everyone to cut over to dma-buf memory sharing for zerocopy.
> =

> userptr for normal memory will keep working as-is, this only affects
> the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
> videobuf2-dma-sg: Support io userptr operations on io memory").

Note that this is true only for the videobuf2 change. The videobuf1 code
was like this all the time and does not support normal memory in the
dma_contig variant (because normal memory is rarely physically contiguous).

If my understanding is correct that the CONFIG_STRICT_FOLLOW_PFN is not
enabled by default, we stay backwards compatible, with only whoever
decides to turn it on risking a breakage.

I agree that this is a good first step towards deprecating this legacy
code, so:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Of course the last word goes to Mauro. :)

Best regards,
Tomasz

> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
> Cc: Michel Lespinasse <walken@google.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> --
> v3:
> - Reference the commit that enabled the zerocopy userptr use case to
>   make it abundandtly clear that this patch only affects that, and not
>   normal memory userptr. The old commit message already explained that
>   normal memory userptr is unaffected, but I guess that was not clear
>   enough.
> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/medi=
a/common/videobuf2/frame_vector.c
> index 6590987c14bd..e630494da65c 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -69,7 +69,7 @@ int get_vaddr_frames(unsigned long start, unsigned int =
nr_frames,
>  			break;
>  =

>  		while (ret < nr_frames && start + PAGE_SIZE <=3D vma->vm_end) {
> -			err =3D follow_pfn(vma, start, &nums[ret]);
> +			err =3D unsafe_follow_pfn(vma, start, &nums[ret]);
>  			if (err) {
>  				if (ret =3D=3D 0)
>  					ret =3D err;
> diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/medi=
a/v4l2-core/videobuf-dma-contig.c
> index 52312ce2ba05..821c4a76ab96 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-contig.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
> @@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(struct videob=
uf_dma_contig_memory *mem,
>  	user_address =3D untagged_baddr;
>  =

>  	while (pages_done < (mem->size >> PAGE_SHIFT)) {
> -		ret =3D follow_pfn(vma, user_address, &this_pfn);
> +		ret =3D unsafe_follow_pfn(vma, user_address, &this_pfn);
>  		if (ret)
>  			break;
>  =

> -- =

> 2.28.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
