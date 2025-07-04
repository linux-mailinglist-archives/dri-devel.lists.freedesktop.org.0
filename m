Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF4AF9AE2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 20:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915BC10E36E;
	Fri,  4 Jul 2025 18:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaxU07/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570A910E36E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 18:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751654956; x=1783190956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J9EQTPgtZAkbyKrP7A7mUG1ocGbnw/61oiNBNTbXCyk=;
 b=IaxU07/JnRkQBb2f+geI7TpM4/hbaNzD38AELqTO1Aga34nSKkCylVc7
 B1ClviwdENFMAfblLfQxj8y7LKeKkJOZcCjE7NT319yrsG/xT2WPvDbMt
 qDp8Xi0tTRnYn0/AqulMhT7Rlf69ZzPhL8172/HZ7S9AiVKVvNnJpIK5+
 EXgieQgIe0I2bYNc2+vdIMryN+fNdbe/muWtiQobeKOlr4DXlEBA/oKKw
 v14l2k7l5IPrccShqdRIaY6ECnPDVJcwtQM8KOVNsRRnknIR0y4AoVjPl
 29Ar2KPbllPZUaj76SlDMpjH14kWed/KAr87ewKerQzbID7/vUtqbim31 w==;
X-CSE-ConnectionGUID: F4kN/xH3SVG/gCf3idmAhg==
X-CSE-MsgGUID: I0MkJMxZQDKGLWEiKrfP3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53911561"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="53911561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:49:16 -0700
X-CSE-ConnectionGUID: Z6mKSEV4SRKUf1qDC9tUWw==
X-CSE-MsgGUID: VCg8jltGQDeSFGNzkygrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="178363162"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:49:13 -0700
Date: Fri, 4 Jul 2025 21:49:10 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v3 3/3] drm/doc: Fix grammar for "Task information"
Message-ID: <aGgiJgn2S4e93KU6@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <20250627171715.438304-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627171715.438304-3-andrealmeid@igalia.com>
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

On Fri, Jun 27, 2025 at 02:17:15PM -0300, André Almeida wrote:
> Remove the repetitive wording at the end of "Task information" section.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
