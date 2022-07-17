Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E65774D2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 08:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A28E6A9;
	Sun, 17 Jul 2022 06:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FF58E6A9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 06:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658040848; x=1689576848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g+ejKtr9Hy0i4+xqsZ6Lrtqy/FCD/1bvZELCN6HO28s=;
 b=M5SVRABBUSEq/FI+62210LckfMgd7PI4YLsglRREa+GXNUVv3hcfaYCh
 KPOODl5iKtVwWZ5bkeEizGYQDYS0PxxvYnIuvZH5jz2RV8ZVFKmFPK/ip
 5JvxwrpF/gXpYXEC+iMzpOsdlHWX1Ty7IlSlB01Tq9wu4f/wC5/oT3dCG
 x19ZWNW1EEYveq/83TYJOFKPWyYcHAoUidyL12qxtxQVv2JCDif2QU0J6
 OF2QV2TuHdEHYOnHHkOoirCBGNELqfWC74hQMFa6rSqpeZN4Q22ZUcCyh
 Ssto8PfQab0SVfCTIDUEieSgPDTAwhytLYMsv1lzWDbuHHk0pXanSY4Or A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286056921"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; d="scan'208";a="286056921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 23:54:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; d="scan'208";a="572027121"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com)
 ([10.237.72.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 23:54:03 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id EA91F20497;
 Sun, 17 Jul 2022 09:54:00 +0300 (EEST)
Date: Sun, 17 Jul 2022 06:54:00 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Folks,

> Laurent Pinchart (6):
>   dt-bindings: media: Add macros for video interface bus types
>   dt-bindings: Use new video interface bus type macros in examples
>   ARM: dts: freescale: Use new media bus type macros
>   ARM: dts: omap: Use new media bus type macros
>   ARM: dts: renesas: Use new media bus type macros
>   ARM: dts: stm32: Use new media bus type macros

What's the preference on the tree through which these would be merged?

The two first should probably go through the media tree but what about the
DTS? There's a dependency to the first patch. I can take these all if
people are fine with that.

-- 
Kind regards,

Sakari Ailus
