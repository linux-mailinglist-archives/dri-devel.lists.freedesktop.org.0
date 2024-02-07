Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D754084C76C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9C9113195;
	Wed,  7 Feb 2024 09:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvj1xyNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74851113195;
 Wed,  7 Feb 2024 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707298423; x=1738834423;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JsN+70aPTg6lEAOrTx+Lx2fwdJbbiG3vSS3htAIip4A=;
 b=kvj1xyNvu92BUmuUtWoOPnIrGfdIJOQTnhh5tFQwvaB9LNGThmUY/IAV
 9GVbGffsEWMM1QVI1Aq93uHYLuQea8KGyOLyzXAeRo954CuQHXz9jyhKM
 ATySjbjubFaIJ2s9PgwF2bTI8gA+jt/uymeQ/ssXnzSJJvDdjH+dfVU+n
 bwVDJBteTCTt0Xm6WVNkAv+2+uI4lNxlaUJ8tl1UFYkMRXnCxlMn621bp
 LhZhqBbxphjshy+pUFgjlJC2JfUFghIR5w7wuEbaMOq7jB/ZLRAM5YSNd
 PEebjXMoqDvUqN6tg1QOE+UbeWR1XCfJsms9rBg6yfZXknLxq7H6oJcRD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436085938"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="436085938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 01:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1601780"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.65])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 01:33:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Dave Airlie <airlied@gmail.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <5b3adb702cfaa944fdaa1b49ee7f10e4d0e86b2f.camel@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240206122822.12a2df89@canb.auug.org.au>
 <f9a027765a3c65c69c2d49cf2964fe1155e914f4.camel@linux.intel.com>
 <tughiv3y52m6ruczgb3g6mvvek7ihfrxaxh7ovoogzqfi6jmun@jcn6xap7vwcg>
 <5b3adb702cfaa944fdaa1b49ee7f10e4d0e86b2f.camel@linux.intel.com>
Date: Wed, 07 Feb 2024 11:33:34 +0200
Message-ID: <87il30d3f5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed, 07 Feb 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> Indeed. Not even drm-misc itself compiles with xe enabled. I'll ping
> drm-misc maintainers.

We'll need CONFIG_DRM_XE=3Dm enabled in drm-rerere/drm-misc-*_defconfig,
and get people to use that.

BR,
Jani.


--=20
Jani Nikula, Intel
