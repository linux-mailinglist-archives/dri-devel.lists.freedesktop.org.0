Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81AA3BC24
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 11:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF5810E267;
	Wed, 19 Feb 2025 10:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcikSjAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04E10E230;
 Wed, 19 Feb 2025 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739962512; x=1771498512;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=EClwj13NTX8Hj8zFPBap13BgTHic0dr2s/0ap1cNuT4=;
 b=TcikSjApwweqh2QLvEPtqUz8baUj72ZdyLieP3xvK230SgfVHDbSq+kj
 pmxZWD2B9eRhUo1F2LbLJ/fUxg952CjKUp9TP5WnxHn9LwNmSJ1rasuVb
 80p0LEwX7yiOtR5aorTgIvnESIboGppxDAZoWMAGpRPyQBS/hyijY4tWK
 UWTcy5O94PTFQp6ZZ2xTOIHPrg8fnU7UZCHp8infuMnzkhtyo7lg4y5op
 xWqe8KxyhSQTm9UM7V90gOGfO6IggxgqoW1S/rj81+fsEzKj/p1DkNT7i
 Ey/CiDJ8QOZrN0FyLb7UnJbl/7UKVo3Mw/OR2mkJFS9WrfxwlH6ePHufP w==;
X-CSE-ConnectionGUID: W7Zy94RaQNy9JDx42dJZmQ==
X-CSE-MsgGUID: TCGBXbT6S1OmwFOJaX6BXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51334342"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="51334342"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:55:12 -0800
X-CSE-ConnectionGUID: gUCTNculRwauUosko+Ni1Q==
X-CSE-MsgGUID: M7TIyD8VSaS8Y/Fl9tzTEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115160418"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.210])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:55:09 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a712ee97-1851-4f6d-97b1-7d1cc136481f@linux.intel.com>
References: <20250114082303.1319508-1-jacek.lawrynowicz@linux.intel.com>
 <a712ee97-1851-4f6d-97b1-7d1cc136481f@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Add VM_DONTEXPAND to exported buffers
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, karol.wachowski@intel.com,
 tomasz.rusinowicz@intel.com, Krzysztof Karas <krzysztof.karas@intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 19 Feb 2025 12:55:06 +0200
Message-ID: <173996250609.74092.8072729956400006000@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Jacek Lawrynowicz (2025-02-11 17:57:03)
> Hi, can I submit this to drm-misc or should someone commit this to drm-in=
tel?

Is the this happening in linux-next or is it still completely out-of-tree?

Feels weird that the splat would not have happened in any hybrid GPU
systems in the past. Did you look what is the difference between your
driver and amdgpu/nouveau?

Regards, Joonas
