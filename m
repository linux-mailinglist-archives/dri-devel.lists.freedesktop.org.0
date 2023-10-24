Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20A7D59A1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 19:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D443710E435;
	Tue, 24 Oct 2023 17:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E87C10E435;
 Tue, 24 Oct 2023 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698168070; x=1729704070;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V/uodZNr7TyqXquVtaux6W2Gu+SFFZ5AS8/76K7YFJs=;
 b=bJNUuwF6dzeXg0wULEjI9tzZzTvsDBq+Nqjw6zEORs9+hnKnMoqA6YII
 7J9a4YaGbtnneRGlRC563Sq2x3RWmkqXwU4mBs7bmXV1UqsyEpsA7fzE8
 DOFDbdNWYokWVWchn9/Qw+5/Y41ieyCiACwncGoy3zQPauIwIS+0aiS3I
 yntJAP2MlUTM44tCOTaykDAn1R1CQCYX7WKyRs/9LykYPgXYLNUc7gVjK
 XxMbLTnkOrgHC+YG/ynXcmYXTK6HBH4SkW+6AtMS9zmAtHZS2wG/2Q2j4
 +4xW158S6OX+iikvvKxRDVf+hfzFw04RVtFUeQUZaqcVocPVX8o9GM6fG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="366462340"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="366462340"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 10:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762180650"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="762180650"
Received: from yaminehx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 10:21:03 -0700
Date: Tue, 24 Oct 2023 19:21:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/guc: Create the guc_to_i915() wrapper
Message-ID: <ZTf8_TsnaDiw-N6o@ashyti-mobl2.lan>
References: <20231005211626.778227-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005211626.778227-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 05, 2023 at 11:16:26PM +0200, Andi Shyti wrote:
> Given a reference to "guc", the guc_to_i915() returns the
> pointer to "i915" private data.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

just a kind reminder.

Andi
