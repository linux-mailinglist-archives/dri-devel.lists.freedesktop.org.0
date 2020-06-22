Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE9204B8A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858546E957;
	Tue, 23 Jun 2020 07:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFD96E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 11:46:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id e11so5843090qkm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NBKzXepzy68inRcMiAHpgcaZ+EYis2uiV6fI4xhZtmM=;
 b=k8sCtVsIXQZTIM44uTx5XoGTEDbrW/uXOY8fvY9Nd/4DXh4saPSxYGA0cCfUbnlyLl
 tHW4PMUz+IUIg6iJElEk/IVvMc03r9mZCDo7PkP58fQDAGJJHKTvWbHlwGlvSkCSJBE9
 Ppej67LhjF9DHjvuE14BQiJBd6KnkgcnIxlNFcmKmCUHQqePe85Gy7qlE4M8VsBeHKUS
 yKX1U0jk0j5Ks8Y76HvcbvQtdxXTdUE006wQlY/5i2fjpanXsf+qNhaiup+oN8Qg8/ox
 /U6VE787P4r0dXZDbqERqe83AX626e55WkuKobSm/QiJ7uDeG7xH7wfc6SCv8Inqo2Uq
 QFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NBKzXepzy68inRcMiAHpgcaZ+EYis2uiV6fI4xhZtmM=;
 b=JRS0g0u/LJ5Lqmjyw58v7CMttJ4LbAqh6IfvGOU2+LAxwTHFbZ9kPszvMws6VPSyAv
 +3CJgwljkz8SeZIMZK9cWlB3axyVwikBog0lrsucDkJgobW/sY1JDcGZMsexA4nOAh3+
 TlTKcp9DNVYNDAykcN3jq5zlwt+rpNIoKtxNLt8N0P64YnmO6Mo5ZFLyPW3ZBQT0sLAg
 3/C33x6ElUvYs3rJcIet0knU7CQUJI7nDQZSFMQYj2uhaxNz9f+9h349FoLJJc/wCxYc
 zDss30hN/BCyTboT2f2nPg+KQlgCSm48KFi0EsxCM4bVMCA/kKNNFlW40LWEKpbI7b75
 hCvg==
X-Gm-Message-State: AOAM531GwUt2BHxHFXQF6jHOlhSaYRUXjvh8uEEnEsnyy0UuZFItYJ7o
 90XXbLqgWZdYC9MOeYZB1uoKhg==
X-Google-Smtp-Source: ABdhPJxthYjyMVCe6ZAxMUNKsmIMBTQD1YPg4YWyLhscgW6iJ+jy7QK2ERT6it0ZxPEWrnvgAqzIOg==
X-Received: by 2002:ae9:c00d:: with SMTP id u13mr15622504qkk.434.1592826379164; 
 Mon, 22 Jun 2020 04:46:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id r37sm14964604qtk.34.2020.06.22.04.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:46:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jnKu1-00Brwt-CA; Mon, 22 Jun 2020 08:46:17 -0300
Date: Mon, 22 Jun 2020 08:46:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200622114617.GU6578@ziepe.ca>
References: <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
 <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
 <20200619195538.GT6578@ziepe.ca>
 <20200619203147.GC13117@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619203147.GC13117@redhat.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
 Felix Kuehling <felix.kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 04:31:47PM -0400, Jerome Glisse wrote:
> Not doable as page refcount can change for things unrelated to GUP, with
> John changes we can identify GUP and we could potentialy copy GUPed page
> instead of COW but this can potentialy slow down fork() and i am not sure
> how acceptable this would be. Also this does not solve GUP against page
> that are already in fork tree ie page P0 is in process A which forks,
> we now have page P0 in process A and B. Now we have process A which forks
> again and we have page P0 in A, B, and C. Here B and C are two branches
> with root in A. B and/or C can keep forking and grow the fork tree.

For a long time now RDMA has broken COW pages when creating user DMA
regions.

The problem has been that fork re-COW's regions that had their COW
broken.

So, if you break the COW upon mapping and prevent fork (and others)
from copying DMA pinned then you'd cover the cases.

> Semantic was change with 17839856fd588f4ab6b789f482ed3ffd7c403e1f to some
> what "fix" that but GUP fast is still succeptible to this.

Ah, so everyone breaks the COW now, not just RDMA..

What do you mean 'GUP fast is still succeptible to this' ?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
