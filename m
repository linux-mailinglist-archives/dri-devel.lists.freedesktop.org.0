Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921DC3D7201
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B546E9CF;
	Tue, 27 Jul 2021 09:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76926E9CF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:30:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="209294111"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="209294111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 02:30:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="505416671"
Received: from fdelgusx-mobl.ger.corp.intel.com (HELO [10.252.33.199])
 ([10.252.33.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 02:30:08 -0700
Subject: Re: [PATCH v5 00/15] drm/i915: Introduce Intel PXP
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <211c6c61-3b30-8e76-c432-f14f8717bf6a@intel.com>
Date: Tue, 27 Jul 2021 12:30:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Gaurav Kumar <kumar.gaurav@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Jason Ekstrand <jason@jlekstrand.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/07/2021 07:10, Daniele Ceraolo Spurio wrote:
> PXP (Protected Xe Path) is an i915 component, available on
> GEN12+, that helps to establish the hardware protected session
> and manage the status of the alive software session, as well
> as its life cycle.
>
> The main changes in v5 are:
>
> - Rebased to new proto_ctx implementation.
>
> - Squashed all uapi changes in a single patch and slightly updated docs.
>
> - Now handling mei_pxp loading after i915
>
> Tested with: https://patchwork.freedesktop.org/series/87570/
>
> Cc: Gaurav Kumar <kumar.gaurav@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Juston Li <juston.li@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@intel.com>


Updated the Mesa series for GL/Vulkan.
UAPI looks good :

Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Cheers,

-Lionel
