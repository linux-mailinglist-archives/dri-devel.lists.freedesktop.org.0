Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6AF9EB354
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB56910E8F4;
	Tue, 10 Dec 2024 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jQNlkG+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E65310E8F4;
 Tue, 10 Dec 2024 14:30:59 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3a7d690479eso29266755ab.0; 
 Tue, 10 Dec 2024 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733841058; x=1734445858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2N7XAtorM72yACmDgop2No+2dzqpehTFwae9k1iios=;
 b=jQNlkG+FRwmqdlb7LR+ZVJQviDPKi/h3LdFAcQVhwQBDh+f/W/GpGmNIxUq1pqJv/q
 mKM9FQH4m03EkIEy9NhoqalW+/YlWxqJ0lBSt/a23L8/KvfkQfyNpTcNkw5zC7ZFq/Se
 tFJ0kM/Ls++1d536DK8mbuzQj8j1c119egWEnPrdISzcSGWH9GNmwG6Ee066dXlrT4Tm
 jRxsCjC3LPIOu4jnGVkZF2f6pM5FqWRizkbjW0oVfgx+ePH0xceCiEUqGr6Rm8L+dRNH
 PHwF97KY02fuxvVNeZyJE/Ol9cfB1FiZh1hhurfervOMZsEKm9cv6PplDzbJHQVbaeFr
 eH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733841058; x=1734445858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2N7XAtorM72yACmDgop2No+2dzqpehTFwae9k1iios=;
 b=psd6ZhjP2cWSLvxs5pkLHOmO6dKVLu7NttfsH3lODMjuPyiMPVIDevk3cfCQ/E/rDa
 KNHtq4fCnb9Tu7tCwVs4frZzDTpPwMGGERuo0NJbevo1ozk3lKAKH6vXSNgwl8V3dXsm
 /5H7AlauiDatu7aMeE8nFW3PocwnvBkFQIRQ/ARU8rrSQ/L5yNZQd7vPLT1As5usisKm
 BWDkD3VNs/FwZ2V0zxcwrxfQyVZOhGb3rxVmFztHi7EkqNdG+Qnz6FjQvDUq1gsDSSev
 LN51ucs6aB+9E+1Hsci3fwpGnUl8KynvWntzV2MnhTBBnwrw+bkuTWR9HNX6QjMdpNlc
 4IQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrM62SrCBfw+2BmFRbdrxxUSGNX1DI6ELKFKc1Rjfdgm8nQb27tbXTL84jfqXu1acr2a+xnpdJnnsE@lists.freedesktop.org,
 AJvYcCXtpox+dtqpTb/jVGMCBnGAdmo1P86S5/ijNijP4S1i4BuxO09O8MRUnZ6Fws/Yg3p5rLImVfB9AtY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxviUd8++YNKFGFfScGiG/Z+tQTL3gH/1RkEKI9OYqLOPcOsuxO
 xTcn45ItjeJKXziaFBnlVb3ZSngiEtkc4YDFpmqnEa7gP2G5QX2TJo8iRkSOsS/gEDyCwH+Vx9m
 kJT32NBcSvbDetSX91kRHRi1XAT0=
X-Gm-Gg: ASbGncuuIIgBIboAZlyiUK3B03PJtsXayzsoEsVNoEBUpJpcgQ9Sprw155twHWM8Zfy
 GB9NRI1ABEaaf5MbKMv0NIjLXz+UffmEo3KU=
X-Google-Smtp-Source: AGHT+IGZsjUHNHgZScctt9GhUUISo0b3ncG99pwHqmoX8StIWNsTQgzRKfAm5Fp0Di2hDokmvL3agPwZ+93jj5g8oTU=
X-Received: by 2002:a05:6e02:1ca7:b0:3a7:6e34:9219 with SMTP id
 e9e14a558f8ab-3a811db26admr175649315ab.14.1733841056498; Tue, 10 Dec 2024
 06:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241210111450.GA14735@willie-the-truck>
In-Reply-To: <20241210111450.GA14735@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Dec 2024 06:30:44 -0800
Message-ID: <CAF6AEGs72rxvguSYbALWPL2FrO5coyijQXY4HEQdwvr8Fj4XKQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
 Mostafa Saleh <smostafa@google.com>, Rob Clark <robdclark@chromium.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Joao Martins <joao.m.martins@oracle.com>, Joerg Roedel <jroedel@suse.de>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>
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

On Tue, Dec 10, 2024 at 3:14=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Rob,
>
> On Mon, Oct 28, 2024 at 02:31:36PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This series extends io-pgtable-arm with a method to retrieve the page
> > table entries traversed in the process of address translation, and then
> > beefs up drm/msm gpu devcore dump to include this (and additional info)
> > in the devcore dump.
> >
> > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > (minus a patch that was already merged)
> >
> > v2:  Fix an armv7/32b build error in the last patch
> > v3:  Incorperate Will Deacon's suggestion to make the interface
> >      callback based.
> > v4:  Actually wire up the callback
> > v5:  Drop the callback approach
> > v6:  Make walk-data struct pgtable specific and rename
> >      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty(=
)
> > v8:  Pass pte pointer to callback so it can modify the actual pte
> > v9:  Fix selftests_running case
> > v10: Call visit cb for all nodes traversed, leave the decision about
> >      whether to care about non-leaf nodes to the callback
>
> Do you plan to respin this? I see Mostafa left a proposal on patch 3.

Yeah, his suggestion looked reasonable.  I'll try to get back to this
patchset today.

BR,
-R
