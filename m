Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7401B43C2E9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699989CE2;
	Wed, 27 Oct 2021 06:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEA889CE2;
 Wed, 27 Oct 2021 06:22:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="293547282"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="293547282"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:22:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="537409953"
Received: from dzhang-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.142.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:22:23 -0700
Date: Tue, 26 Oct 2021 23:22:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/11] drm/i915: rework some irq functions to
 take intel_gt as argument
Message-ID: <20211027062219.ey3gydc2qfcstw6q@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211008215635.2026385-2-matthew.d.roper@intel.com>
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

On Fri, Oct 08, 2021 at 02:56:25PM -0700, Matt Roper wrote:
>From: Paulo Zanoni <paulo.r.zanoni@intel.com>
>
>We'll be adding multi-tile support soon; on multi-tile platforms
>interrupts are per-tile and every tile has the full set of
>interrupt registers.
>
>In this commit we start passing intel_gt instead of dev_priv for the
>functions that are related to Xe_HP irq handling. Right now we're still
>passing tile 0 everywhere, but in later patches we'll start actually
>passing the correct tile.
>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Co-authored-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


mostly replacing the i915->uncore with the gt->uncore, which right now
should be the same. The other changes are just changing

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
