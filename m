Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3EAA0E03
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6525610E49C;
	Tue, 29 Apr 2025 13:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFP13JLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBC010E4A6;
 Tue, 29 Apr 2025 13:58:48 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3d8020ba858so67467585ab.0; 
 Tue, 29 Apr 2025 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745935124; x=1746539924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=;
 b=BFP13JLAtjQo1QvzGM/JHXRA5JsRTkm5j49/rI9Ta0ZRYEXmKefgWiF4Drbe/ZFHgD
 4UftMbpLiAJTnoHtdKnfwT27LdkKT0vJJcsRI3TF9wjYCwpAToLBhDThJRSy69607Z8o
 Y1vz6/BxVO7UbXsrvncvepBHNsbCHuIp23FWzqeCsxPXb+6jaOMQvk5M0Z96XoqXHNSm
 yoqYX57J8JildT/zmrxJYy3pEnDGtvIZq9oxC2GsKwe9LEs5Jym/mjgCFZX6bXos8flg
 9kGX8fVfn7o7Lr5V6I8ZgEFuuLeU6rYXSeo8G6NYtMckf/ByNGaxvQJybHSDv7t4+6Nw
 XsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745935124; x=1746539924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=;
 b=u+OZkE/lLgRC0cJGnCSYgVUqF0eMaBp9DUooU0gElvDYog0W2wrIi5uSARTxrKdVT6
 +aGleQ3p8Q8mGjgN6yWQC0yaEUjmW0FpOrA51d2ENpPXzjVhowt4WynyNWbmt1ACAnOn
 Rmgl6PUfTWCAti20x921t7yoKIyQ9YxdPd5sq3TSD5ALfq3J41yBkvidhTITAMqnUfOC
 S9hBbNNc5dFDpa5u36CJkl1VQBK2lJPS9VspY/Mq+E0Gyi3EPKqxUdUtzJWpnRSlNyFG
 M3lt6OKHJTIIwmcZKRxMFI1U3AnNeFw0ZXNiTF36tHgd4CjwQTA1g0Wl0puU5j6n8z+f
 JWgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzry2UwqtkMMYXbzDlFIe/2Kqyy6eZPsxbPAzLFDdE/cWg8b0KidIA7hSdj8zpOQne1TlxvNOjq2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoqi2EnETW01vmskN9p7eQx4ctZhE90mNA1vx8hMp96z4uUjYj
 ZdxNA+engiISOxsqrSmYVSBdOk5MUYheA17JDeqEB9ZfKf8aGpQy5MoUD/mJlC2c3qEebnRwH+g
 Xr+zp3bsbBMjVr9OBv7M3qDmMNJI=
X-Gm-Gg: ASbGncuIAICUbYWLWMV4r5wkU9jLzei+rXc4AAxKSIHItsFV20WtTVofYHDBL8kAiMD
 VqXWkhMus7fx5GW3lg7Ut6rLgwqIWh9Bapwrfj8q7muur3KkMSPUd46kVnkFDSMKROrEDHgqWRU
 meL2U41Gux5YgR3j6U/IitfPHfG4Vu4sVJEwTeMrhk2A8TAeUkDGH8lVjNgEIuXg==
X-Google-Smtp-Source: AGHT+IH1nUpjoSz6b/R8czY4xnY2bsj4Qtmd4LwhtuxBaf5F+Zjq1Yfe6RP1zEzp5FQni5VkJn1doj3WcQsEWRWuaUQ=
X-Received: by 2002:a05:6e02:194f:b0:3d4:e6:d872 with SMTP id
 e9e14a558f8ab-3d95d262d3amr36052445ab.9.1745935123936; Tue, 29 Apr 2025
 06:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
 <20250429122834.GA2260621@ziepe.ca>
In-Reply-To: <20250429122834.GA2260621@ziepe.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Apr 2025 06:58:32 -0700
X-Gm-Features: ATxdqUGRQLIGoOBhYNTDnXlEra9K_SUIOqCbRuVfNJ5xIkADqjZJJUiOpnz8BvY
Message-ID: <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
 Joao Martins <joao.m.martins@oracle.com>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 29, 2025 at 5:28=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping squence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
>
> I think if you want to do something like that using the iommu API the
> expectation is for the caller to do a iova_to_phys to check what is
> mapped first? That seems kind of lame..
>
> Maybe page table driver should not not be doing these WARNs at all. If
> we want to check for that the core iommu code should have the WARN_ON?
>
> eg iommufd already has a WARN_ON around iommu_unmap failures so having
> one in the ARM page table is a double WARN.
>
> Don't really like using a quirk to change the API contract.

I'd also be ok to have the WARN_ON instead in the iommu code.  In the
case where this quirk is needed, I'm using the io_pgtable helpers
directly, not going via the iommu layer.

BR,
-R
