Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE1D3B087
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE8610E34D;
	Mon, 19 Jan 2026 16:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="elC4Fmpn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F8410E34D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:24:26 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id
 af79cd13be357-8c5386f1c9fso687810985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768839866; x=1769444666; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zCRrpohPCspJo8o5qWVDG1aTKo63AMTSXJRpwyKl02I=;
 b=elC4Fmpn55wFtJ79hAWSleyxWT/4wyCIjOdS6Ix40SLTDTcFJrR7fP0/2ze5wKe1qy
 2/yJRyLGht7HwO9M/IrL1yBVTPfR1T/waxXj43Nhx+W0HzG4Bx6OzmGX62GH9VqIsW1T
 f/V9H4Y4uzntIuJld20dFGDJ1rsO/bEH6cevfR0du37nXy6AWx6flyzi+IU149Gk2T49
 Ja9Wbv6yvZ3Vk+4LxAZU1OhkqmzeAlpQG6yZNzkOYIaVhFx4cbfgqitkjXEXA8f+LUrv
 2zxFvYjzbx1Q0TXifjuzyYzI6gPwfOePGQzvjNXIkTPyRIdjz2xAnYXy9qExiEzPw9ae
 0h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768839866; x=1769444666;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCRrpohPCspJo8o5qWVDG1aTKo63AMTSXJRpwyKl02I=;
 b=ddsPizLwfrDzR3vNn8KnJxd8x6KB0v2Du6TdE+32z4+S/GR7oij5VPpI/kzzp1G0iL
 GkmflvnZNkmFG94/pCGmMJEGAezgpP+T3j6EcRu9wt3QlXjEpsgUi6rTDblXH7V3w2h3
 OFKp3xSsYC2S2d49F5zC23zmXbQ2eDed03YKZ5wy24WJk16Apc/viPlecXs5VIY230wC
 q9vQFV9Ll64ueOSf1rEn2ypjXym4OSOk+pgADhxrIXlM31mRAViY5q0uA6k8gK7ebKYy
 /Z2ZkD0mEn10ev/pzyrg8OVjMB8YJoLC1U5v3J78pu4x3veEjI/GSEEOYA9nvgkT5C1T
 LXwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIrKpSPl9d8U9ylFylI8JfIsEtQlfFocAhBQEUydMJ2146AYq63+bLjc6QFiTnn27YpEUp6mYD+eE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2NocUjr8+vyJiDprOcHDK2Idj0F6/KeTFriMPyiCm/ahSGo5Z
 mxTIK4r19LKANnf4C7PJD0WVfLmrNqNTSpXqVxSReBerndAitWG5NN88IsHGz3cId3Q=
X-Gm-Gg: AY/fxX6595V5rHj2oBwX7R38X3zPAqxDGphiNqtNetd53QMn8QByZdVor5o6IBDOpnR
 3+rgDev9c2k97TAj1BEM9UoyCBctLRsQWarDDbQY1WfowCvrCAmDrroBwUpDubvH9W8Sv2Jo7D5
 CzGFYZvY51LzfwBMMCUYgDXh6KZCdmINSRV91FkQ4+IGctYCCCffLNdvm1Qkp2YhovnTbiwzBCe
 9XkkX+X0xh3JaS/b6IjaPXnEDxxqfo2kxBvfEdNuXJ1YFvjVfm7mIYwPMd4WFv8F0oY5ktD3aIS
 /4fLx6L1p/tW7elXlkHoe2RRt8Yxn6gVV47sROYpMaELH9TcmnEFCkeVYJnZQDKs4e3A2UfPzSi
 KA0TpdswE0SyxtNrtGYgnQyiSFyoodYQuMHHZZWU4Ra4AOOJystjRZs0tGhBi8JvFswesQXlRfK
 aZBh9vgMEt7kV6WIihtfg1PLHwqYoH2en0lA/7iIFh76yPPjGzUc4rp6XhIcBSHH1kYOQ=
X-Received: by 2002:a05:620a:2a02:b0:8c5:33bf:5252 with SMTP id
 af79cd13be357-8c6a6963403mr1445548485a.70.1768839865634; 
 Mon, 19 Jan 2026 08:24:25 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a724a484sm800372485a.33.2026.01.19.08.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:24:25 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhs3E-00000005I0S-2Krj;
 Mon, 19 Jan 2026 12:24:24 -0400
Date: Mon, 19 Jan 2026 12:24:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
Message-ID: <20260119162424.GE961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
 <20260119075229.GE13201@unreal>
 <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
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

On Mon, Jan 19, 2026 at 10:27:00AM +0100, Thomas Hellström wrote:
> this sounds like it's not just undocumented but also in some cases
> unimplemented. The xe driver for one doesn't expect move_notify() to be
> called on pinned buffers, so if that is indeed going to be part of the
> dma-buf protocol,  wouldn't support for that need to be advertised by
> the importer?

Can you clarify this?

I don't see xe's importer calling dma_buf_pin() or dma_buf_attach()
outside of tests? It's importer implements a fully functional looking
dynamic attach with move_notify()?

I see the exporer is checking for pinned and then not calling
move_notify - is that what you mean?

When I looked through all the importers only RDMA obviously didn't
support move_notify on pinned buffers.

Jason
