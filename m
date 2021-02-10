Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDE316D79
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 18:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678CF6ECB8;
	Wed, 10 Feb 2021 17:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C0D6ECB4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 17:59:15 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id t18so1261029qvn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mEPuatLoyym+J6ItA3BIfCEOLL8sQ3QwAzMr1dNPupk=;
 b=jW9PVjGrRwIiTu0DvrBNx4ykL4I0ErasGCeEaMHeyrXRbfEG9LB3dcE8vE11UBawk6
 1G1tcdRNTWBDtUg+fhfGsQMXOWfqjp3mTLwZKFq4HmTvwSr/K8tGSYW63Zm+KpQxHBXW
 u0ZOrWnXE5JBPOQyNkpBsjDIpzJF/xZBBZ9sBVx4nngGJfwe8dUE8XiCc/Io+j7LyXb3
 qrq9PeYWhfP2y1Eo2XwOk5F4UEKCmphlVy4z7L2moVXVcz43s9cOi+RdntHzTecyr9XT
 0EAPy3emAM7JVX2q3gq8vXafguG5d+qLtIeyiWB7Whu98AaOeG5oA/d4Anm2Sc/eA5pZ
 rwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mEPuatLoyym+J6ItA3BIfCEOLL8sQ3QwAzMr1dNPupk=;
 b=adiHq74prREjznrsoZneioPhnYLwlvASDLEU+yjEFNQnQ/fs26dAZXZrstx4CDygV0
 z1B64lhyR09sqcJqaKTV4qDslJPsClbQHClLqc+reSf91XsyWjzCMbOBspbB/c2kMbub
 a9Bo+vAr1P8RM7eYNwRMc0rmI+frwtZqXPnAFxCzDpxxeBeYLtKASuAEc4sGrZgNaPpy
 xmRO/jibhK3e9rqTbgjpKliDbKMLthla9lEWMf1iLpOwra/XntIw3iB5cgml1vmSV15R
 KJcz6wUSs7yQFYMplHm+YXn257qkeCxb/AQSPg83x9TAgpci1fr5IcFfxRnez/ZGCT3q
 DgzQ==
X-Gm-Message-State: AOAM531paS4FcozFcDdTy6EaTzpDKwNyCJ5FKPLc9xkz6lRCU/jdnuly
 yxZaLlS9KITc2xDAUE5LLtX3Zw==
X-Google-Smtp-Source: ABdhPJxwZzRaoXxpNKuY9U9fnfERIckZW7aYN7mA/qmqVG4TxZ7Frx9umWXL+42aGA2CymOfvFagoA==
X-Received: by 2002:a0c:ed42:: with SMTP id v2mr3900087qvq.15.1612979954649;
 Wed, 10 Feb 2021 09:59:14 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id p16sm1742656qtq.24.2021.02.10.09.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 09:59:14 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9tlh-006895-Mz; Wed, 10 Feb 2021 13:59:13 -0400
Date: Wed, 10 Feb 2021 13:59:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
Message-ID: <20210210175913.GO4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
 <CAKMK7uHp+BzHF1=JhKjv5HYm_j0SVqsGdRqjUxVFYx4GSEPucg@mail.gmail.com>
 <57fe0deb-8bf6-d3ee-3545-11109e946528@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57fe0deb-8bf6-d3ee-3545-11109e946528@nvidia.com>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:53:27PM -0800, John Hubbard wrote:

> This direction sounds at least...possible. Using MMU notifiers instead of pins
> is definitely appealing. I'm not quite clear on the callback idea above, but
> overall it seems like taking advantage of the ZONE_DEVICE tracking of pages
> (without having to put anything additional in each struct page), could work.

It isn't the ZONE_DEVICE page that needs to be tracked.

Really what you want to do here is leave the CPU page in the VMA and
the page tables where it started and deny CPU access to the page. Then
all the proper machinery will continue to work.

IMHO "migration" is the wrong idea if the data isn't actually moving.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
