Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91063520D91
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB3A10E635;
	Tue, 10 May 2022 06:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6910E457;
 Tue, 10 May 2022 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652162725; x=1683698725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5pffL91vsUiBWY5qEHNDpxq7EjhrIyoovBxZ2X26yMY=;
 b=ZJrlU0ZcjPy5FylMCMN0GiGi+hhEydR7pJ9k9AsXoTwfuXXCiegDeE4Y
 1/vJzXiravWgdd1DCYggvb++vxakUcicK3NdjJhmqXlxY0iZueyp947qD
 uIYgRwd/oqTvVsBF9ncqbd5PDqz144bAX9UTzwg7UnqNBerF+/4j0HRzZ
 1ItNvFaWpC+lnTG9wW6EUzlQADu/GxzW+EMC4XmaE0Uk07qKmpesllgyI
 pJhhWMyv4DiTiPCZqQmYvuNY/5MUclJTdIO6BwvX2aoVkKPELVPiWBkCx
 EZ9ornaL8CvRM8NBw8cnEpM++KQ+udw/VIp+jlYo8kRKfYAjYmErf9ae5 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268113657"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="268113657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:05:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="541611050"
Received: from syedpash-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.130.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:05:22 -0700
Date: Mon, 9 May 2022 23:05:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 07/12] drm/i915/gvt: Use
 intel_engine_mask_t for ring mask
Message-ID: <20220510060521.yzpwverld25vn2wg@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
 <20220505213812.3979301-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220505213812.3979301-8-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 02:38:07PM -0700, Matt Roper wrote:
>When i915 adds additional PVC blitter instances (in an upcoming patch),
>the definition of VECS0 will change from bit(10) to bit(18), causing
>GVT's R_ALL mask to overflow the u16 storage that's currently used.
>Let's replace the u16 with an intel_engine_mask_t to ensure we avoid
>this.
>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>Cc: Zhi Wang <zhi.a.wang@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
