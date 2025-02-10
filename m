Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83EA2EC66
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 13:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E186F10E191;
	Mon, 10 Feb 2025 12:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxX0wiXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA8C10E191
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739190165; x=1770726165;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=D5szCVESMN9ourmiO6CU01qZfUnW6l4QuLPfuu1uUuc=;
 b=KxX0wiXIcCBaKdfQyyi4cmEovmwFCtO95sMvebOBsJ69KYLFg80ZuMf+
 AMeEtmrDtR0T6P7kKVuNI4IKFJWklfIjDdZlpyBHRXCUfwebWA71NY/Jd
 tq+fzYJJX/hYDUF/ZR5dzu8+z/nhyExflG7qm3svX1SwofmFwZ5jdDpI1
 d1vFKWOqxKQQyEbgtc9trAp5bKyD25B3T+du/UloTxGQjK6UG0us3Bgw9
 DE00YiqN8fN+IIu4g58QPAPayzrkQuXFWlFo9p3vW8ugAC7c0Ap3a5Zbl
 LwgiJTcP+BOseBlitQSQFf3at65zXJwqKkoPh3jXqFrqONC/cgiqV4dFu A==;
X-CSE-ConnectionGUID: 0AYnDBYrQI+F+yBOyjw0dg==
X-CSE-MsgGUID: ogQl4aH+Qj2fkuwA1zMFCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50752331"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="50752331"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 04:22:44 -0800
X-CSE-ConnectionGUID: pliT4yuvRAG2cNeKqxyD/g==
X-CSE-MsgGUID: VpMN6canQqaD3B0ni3pGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112616824"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 04:22:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Lanzano <lanzano.alex@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, tzimmermann@suse.de, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: lanzano.alex@gmail.com
Subject: Re: Maintaining Repaper and MI0283QT
In-Reply-To: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
Date: Mon, 10 Feb 2025 14:22:37 +0200
Message-ID: <87bjva3s6q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 07 Feb 2025, Alex Lanzano <lanzano.alex@gmail.com> wrote:
> I saw that Noralf has to unfortunately step down from maintaining the
> repaper and mi0283qt drivers. I would be more than happy to maintain
> these two if need be. The repaper device is very similar to the
> sharp-memory display I currently maintain and I've worked with mi0283qt
> displays before.

I think please just send a MAINTAINERS patch!

BR,
Jani.


-- 
Jani Nikula, Intel
