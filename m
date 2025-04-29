Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C6AA0E16
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 16:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CC910E49E;
	Tue, 29 Apr 2025 14:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="fyMl7SRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0CF10E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:05:06 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6ed0cc5eca4so84491446d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1745935506; x=1746540306; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=;
 b=fyMl7SRv9s9R+tc6iXjZSw0lqxTqyV05VIDDyFdmopzsK6vVR4j243DLwXZQdcASDx
 R+McOmYnaMMYXSiIeoeLQlHQZcauk3vbg23moEG9SmJbP5TrMbyMWPFsbnK4vkNCJdv0
 /FB+CvfZ+5IQfSFJ9zHYFbRdO2dD+Z2jHJNVn0xDf0eMQJ3W6oJw1WlqJnrUilHnHcQW
 EsdP7qdJN//cJgje/DZaC8a7tiuaBlbAb25aSDabCGNXITQuouLA67flHLF/vhn/2c5L
 kdYw+mZXf+nFdhCdBVDxlab6HcuPe9HMs1q/4hGzU8k8URAoC7MdAY1AS7oAxtyripIO
 /w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745935506; x=1746540306;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67ZN/XRJXAlmBnQmnjPx+NwiyFFUpfzzQma2UEWB8yw=;
 b=kG4o3rRod85lhV9LBBPUrU2s8VFA1wRf2Oo/6ccfqNhlhMoYHkHGkjU0A7gxrt8Ro2
 1jma/EcnVSZVAmGzIyBhOwrJ/h9jf4Fp0e67i1dCAVubZn0FoUFlZXClPx5g30Ahi+Q0
 zmgjsBpsTFlixUxIKyS9SlbYqepaXx9ysQ6umCasS+zbzkpWP/2vXLDeYhbY9Iu7Mxn3
 NdmKd18czPrlqCdk0hh/niLIzASENzM1NebJgoRCxqonZ1SxJWUkLc7tgAxhcwBsFSap
 Vkhff2hXVthJ8nBGJBYBxLu1F+u3g77pKYiRK1rCWkuF7xjkv66DdOEYIh12bqFQ5TNL
 EBmw==
X-Gm-Message-State: AOJu0YwZT3jgbab24MMH4oe5KPLPRM+qlZMd09oOAM3IP1PtdKC6g+1X
 C6TxTTF2CWVvSBRzitdUZCNQM3vUUybXl8kO636acqT5+5wWzqlJ/0TeuuHi1xc=
X-Gm-Gg: ASbGncv4P4vI4RruHyyD4Yy1/PudL56Oke9sf2YrTuSlfqZ5wSyKpbPwV4DcFmATwE9
 ikiGk7U06NTY58ijNt3kz+/Y9OsRF27Qv56fTpdCs7GmWyNgn03ty3oZNTSpLcMtSsZMXxDfFqP
 9p8RmdMRDIEimQIQHPbeq20Dl98cqvlqq9Kv30+4hO3/6bC5N0ZS32XoisK1ppfX6C9xZ4+L3To
 JVBOkGq/LGWzpA5rahtAfROZA6WBFYVUhbdj7UGJAl3LSHHtjKTDAnZs6RbwI3dCXgEnugb6Hzt
 yjJMU6wepHogC+8n8ktkIVVftOpXmQBIMrI54/pcIvaTfsBSgbJxF3iwfQI0mBRFAjK9Hx1b0Sh
 x9vDFtpm3SlROX+DCr8U=
X-Google-Smtp-Source: AGHT+IEGHHMBFCeWwt68ed4umDEC8R1Cxg2x3qg5I1VMmEylqtVgAx6JEUyqfbECn9olvSAU7wat3w==
X-Received: by 2002:a05:6214:5005:b0:6f4:c939:a3f5 with SMTP id
 6a1803df08f44-6f4f1bcfe99mr47285726d6.17.1745935505592; 
 Tue, 29 Apr 2025 07:05:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.219.86]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f4e0d8495asm30959186d6.18.2025.04.29.07.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 07:05:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1u9la4-0000000AAyC-2M6z;
 Tue, 29 Apr 2025 11:05:04 -0300
Date: Tue, 29 Apr 2025 11:05:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250429140504.GD2260621@ziepe.ca>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
 <20250429122834.GA2260621@ziepe.ca>
 <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
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

On Tue, Apr 29, 2025 at 06:58:32AM -0700, Rob Clark wrote:
> On Tue, Apr 29, 2025 at 5:28 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In situations where mapping/unmapping squence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> >
> > I think if you want to do something like that using the iommu API the
> > expectation is for the caller to do a iova_to_phys to check what is
> > mapped first? That seems kind of lame..
> >
> > Maybe page table driver should not not be doing these WARNs at all. If
> > we want to check for that the core iommu code should have the WARN_ON?
> >
> > eg iommufd already has a WARN_ON around iommu_unmap failures so having
> > one in the ARM page table is a double WARN.
> >
> > Don't really like using a quirk to change the API contract.
> 
> I'd also be ok to have the WARN_ON instead in the iommu code.  In the
> case where this quirk is needed, I'm using the io_pgtable helpers
> directly, not going via the iommu layer.

Yes, that was my thought

Then all the iommu_map/unmap() calls behave consistently here..

Jason
