Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CBA90F410
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C15510ED24;
	Wed, 19 Jun 2024 16:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="YSzGg+Hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9A810ED25
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:33:10 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6b4fec3a1a7so121066d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718814789; x=1719419589; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UxqMh14wh6rgt2Gb04HuzckvnrRRbYR5Yps3CaoDEDg=;
 b=YSzGg+HxtTVPHjnBLGEeYvSBxFWk7Y40mM8yrUy9oWdS1EiZ2y0yepuFkQhp6+XjED
 WGH+gqKzeU7n/Kl6uG0MTsPau4oxSJMtlPSlif0RQxE9SqFXgmQ5tz0QoamAL+YNYfPX
 OnvMoNYDgFYlLOez9tAg/MUszxiRGZRqQECsI6+4bJ6j0vk5/X/pya22t1Ud/O4B/xPJ
 4jS/bwSBHoq9COzAE1oPXBip2RWWRq5yQE/+uKG0SBd6Zqie0X+6ycJyflEJBj/oocgC
 ikenEvkZsUtqoIzT3WG2750xaIl9JvRNhTgk+ENwx2UiOcLFcDH4lM2TXlUU0rcoGhcV
 +zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718814789; x=1719419589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxqMh14wh6rgt2Gb04HuzckvnrRRbYR5Yps3CaoDEDg=;
 b=MCzavR2i7me89RPWSiz8KxDWXxi+0sk1Tw76+6aqMmaaCB2vpsR/EO7axiihHP1Joc
 cGm0F01NyoIpJrILOZ3/3+0jL3R96yRFk7rUNiNo0Go5lPtkyl8TVolemupoLwu0qwmB
 xqMCuMZJh2WNxsTbeLEhQFzteo6+R39qzSrk+SlKrJvZ2yhFnaPL1P7sG8alRO6w5hik
 qtpWw5FwZCZFI0q6aHja8sHy8K7BWeFjLeWCg1CiQmN3UIGffTWIZduEzw5wsGYmHy1q
 33dHksVAdJCWN8EtxJvFYpjgA/75REpeMGajksnmYrWPE6eGI7lk/WImeIp52ONFkGgG
 GO+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7nvBWf2Ye6e30Xe8GQ9pzUMsxJ4Q7I+HhUZbwzsNp39tmJaMX2y7uKFvF2lCHp3VB8z6Z42d5U4n8wDagE8CTQB/M+B3P/AvcpXAtrwHx
X-Gm-Message-State: AOJu0YzkZ8YQMSiQSPOYBQSyrRMERJ96TEUYHdKPDsJEcVB6fqt9QEEZ
 QqrAu0AxnWmu5DJZfS8ZmDrodg3JXRDm+9+A8K4AijgoeiwUDqFLS7tjLaHhElA=
X-Google-Smtp-Source: AGHT+IEi+7foZgh/9Z0anYpjxAAXArw1uJUHOfsFSQr7PUdyfMayYNr0/bYNAmiUhoW9f3jLzo/I0A==
X-Received: by 2002:ad4:55e3:0:b0:6b2:1094:83bf with SMTP id
 6a1803df08f44-6b501df81a9mr31902396d6.4.1718814788824; 
 Wed, 19 Jun 2024 09:33:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb4cf9sm78898276d6.97.2024.06.19.09.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 09:33:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJyF9-005AMj-BB;
 Wed, 19 Jun 2024 13:33:07 -0300
Date: Wed, 19 Jun 2024 13:33:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Message-ID: <20240619163307.GL791043@ziepe.ca>
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
 <85f5250f-0d50-4aa3-93c9-2008c6ccb8fb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f5250f-0d50-4aa3-93c9-2008c6ccb8fb@arm.com>
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

On Mon, Jun 17, 2024 at 04:13:41PM +0100, Robin Murphy wrote:
> On 23/05/2024 6:52 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> > would be traversed for a given iova access.
> 
> Have to say I'm a little torn here - with my iommu-dma hat on I'm not super
> enthusiastic about adding any more overhead to iova_to_phys, but in terms of
> maintaining io-pgtable I do like the overall shape of the implementation...

If you mark arm_lpae_pgtable_walk() and the callbacks as
__always_inline then the compiler should generate the same code as
today for arm_lpae_iova_to_phys().

Jason
