Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B16A6D0C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2D110E0E5;
	Wed,  1 Mar 2023 13:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00B810E0E5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677677514; x=1709213514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wmwwd/pzr6EugzygXH4idfi46yMA+/94T2QvkhPwN6A=;
 b=f+lYMmc8iYWsSxu5XfT+Ih9o/dtBTVuV9GNoNl6I9FkPenLgxNp8gEex
 3t01bruOfptSwgzSgOnfJLPp+33keZ5T3zCJ+ZSQl2w7/ycoHtyRWWrqU
 lvFPXr/Ql0Fxs0nEwEus0vOA2UfD+TS29hfaWmpsnIfBFAU3XW/gXX8st
 vGfkdor719Nk87Ay4DSGWSBI4CHrq3dTsvgos6w9nJRXxDMaPxxEw05nq
 g1zvjxjtzrGaw3V8cXRIH/PrQCZZtTuh/uvj1EgGEOHo8hk4NMkZhFdHX
 VSPl7+434vpMX90RV4aeMggaWsvZabtpYAVe6LD4JvDoj+9SrRRCA3HyR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="396975174"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="396975174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:31:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="920235887"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="920235887"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:31:53 -0800
Date: Wed, 1 Mar 2023 14:31:51 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 4/6] habanalabs: assert return value of hw_fini
Message-ID: <20230301133151.GG3815307@linux.intel.com>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
 <20230227111306.3985896-4-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111306.3985896-4-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 01:13:04PM +0200, Oded Gabbay wrote:
> From: Dafna Hirschfeld <dhirschfeld@habana.ai>
> 
> Since hw_fini return error code for failure indication, we should
> check its return value. Currently it might only fail upon soft-reset
> from hl_device_reset. Later patch will add hw_fini failure in case of
> polling timeout in hard-reset.
> 
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
