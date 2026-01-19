Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D923ED3B31B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 18:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F0510E4D3;
	Mon, 19 Jan 2026 17:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Z6TPRuYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D8110E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:03:35 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5ec96028b32so3108609137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768842214; x=1769447014; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xPF37M4OZRPT3BtJHYXM5EEOm0b3fHdtNnzMGWb7xcQ=;
 b=Z6TPRuYtomHhTBeFZIgMWviJSMbcBE2fNtKf36Znh1aZLvLYdheJPhf1X2bALW/brH
 27V9tlMlKMazmNkLilW/8IEvUqXwPkdEPd+o6SZoIlpr7gPKB7Q9NTEjZn/fUJoEHnet
 Sl4seCcJpF9sAEo3cx/xrjI3WtMxM1miUfDxgRlj2FaUpqyHwB6wuewGIVxouNd0PEc6
 7KOi/FiA3HqttbUwlqnEorYYzbQJuc7j+eQ8P6jj0fQOU68ygUtUsP5zHitRA8AuXMPm
 QoX/6I5krfzITY01HQ/tSOoQjhFbP6cMcZEO9k2NshkEn7/jQupB/6sOgjKdRBAr5hx3
 JP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768842214; x=1769447014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPF37M4OZRPT3BtJHYXM5EEOm0b3fHdtNnzMGWb7xcQ=;
 b=Se837Fe/ABsh7GFDyDjV1WZ90MS1GkNeCBPx9aoBvMAROw7LJn/mzYc78YTqrdQ668
 ETWazr6pk4L3aDRUqLCx22WDLbDnwgF2RZLn0wtctWbAS6/Ci+kwv/5bahQIIYmSwojR
 90HPwb0e4j9cmN8tcFGOAF0fpTJO/y0tEAW2NCOuFWGtkVn9KQ+X/9nbo5uKRhet4Qzm
 WAIHAsJftJ9LAYE4CpAzS43QZsD7zxCTJFIoFxv2hNeiCBD5+r4CJIL3UFGNiazqREWi
 IuxFDzuIdVWPqpHG8vYUUIe7CrB+Wy10lL475XqPAYPwHid5YJOJwpMIBCtKYKZppxSt
 tquw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3keZw8Qiyoy2QeO3HuAOjqgdpIN6nPMVNk5YFbEXkcA7+F46PDAwCAJkJkdhQcXZ/xiX1sz9RPEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc+plmOGwOO3FDwgIxDSL70ZD90zMYsMckpG0XQWTKtQ/sP1tA
 OWIho1CzBh5TxND8nuv9mNKBR7poer5OMsDkhm5vX3O4ndLS3TCIOsJYbqS2xXNkdKc=
X-Gm-Gg: AY/fxX65K2ZiHuPqDKkH1SNoZgxraimUA47SAsrK+ncYUOivV8uhfU6wk4pDKVqdI9t
 Yn4U4pfsDF9UGm7mFKWC0TPtCj4yQtJAIF1cQkE4CLD79VnP0UWfIWk3OM/h1lp39hGUNVbvIws
 +wEvI17W4ln2cs8WBnAg0GDuMqY64O1mWNglm+MS4+0N0ds2MoWAComiVZ1DO42obctFX5Rt1SQ
 +5i1rHg6X/vp+meHRU8aRt0z5dkSHVCDckxT+oo15a0yI9aWq1JA1CpV/nuOB97zcjcjig0IcTU
 G3T7DB6G7psmGFGDDr+G8JSqHiu920AruEsn2cu4rQn/yw9C/4EX+a++qgRx6E9n66+VjcbGlrH
 H0Em/gx/CYfiEOHucvFRjXugg/F37eTPorpojRkffsRcyDzai7wTCN3aLGRJVkhq5+61sj9LiEI
 TiyAbM+GVd4n2yH2x6RVbEVUO4Qh8+uVxFJDPfxbKHuV6tnh2tIiMapzrvGeAv4ocgTY4=
X-Received: by 2002:a05:6102:2ac9:b0:5db:d07c:218f with SMTP id
 ada2fe7eead31-5f1a55dacc2mr3505780137.40.1768842212920; 
 Mon, 19 Jan 2026 09:03:32 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e6027c9sm90833946d6.13.2026.01.19.09.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 09:03:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhsf5-00000005ITl-3vB3;
 Mon, 19 Jan 2026 13:03:31 -0400
Date: Mon, 19 Jan 2026 13:03:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
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
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] vfio: Add pinned interface to perform revoke
 semantics
Message-ID: <20260119170331.GJ961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
 <bd37adf0-afd0-49c4-b608-7f9aa5994f7b@amd.com>
 <20260119130244.GN13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119130244.GN13201@unreal>
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

On Mon, Jan 19, 2026 at 03:02:44PM +0200, Leon Romanovsky wrote:

> We (VFIO and IOMMUFD) followed the same pattern used in  
> amdgpu_bo_move_notify(), which also does not wait.

You have to be really careful copying anything from the GPU drivers as
they have these waits hidden and batched in other parts of their
operations..

Jason
