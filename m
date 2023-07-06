Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F939749928
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298D10E4C4;
	Thu,  6 Jul 2023 10:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1EB10E4C4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688638500; x=1720174500;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=N0ruEIgL8V7d5TGw/1d31/UbHMDYeEQG4BDFltYaJRg=;
 b=V3OrB6rSvsNGGI+dyAz7VXxf+RFnkUdjMt1c+4eWKej8Hm8Pef93125P
 KxrpB0ntVJ5O5xgmpSLtLUFjmJ5NIuBNPaIW28alAwajHjEskL7ktvJOx
 KU2dVBF7Kr6JtLmHODcHZZPF18llV58lPGvyNe0fxMaUU4O9f/sjlWpy3
 wbjrx/o2lvGShlTJoUE+bZnU4DU9BVsoSqDGQMga9P2zv1U6F9dp3YuVr
 w2mGXE9GoE38QaoBpqP9dPKfPAXhD0ke/iGFJsHxBYCUxQxoaRbkgAGiW
 9I2mH0BCZbUiDgrGenbfelGcUNLmwyWFGnB0dc4dZVnONAudX/0OSYnn0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429607606"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="429607606"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 03:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="789492642"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="789492642"
Received: from jmvuilla-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.105])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 03:14:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
In-Reply-To: <fdb25b67-92fa-d010-39b4-a14ab3fa4edc@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com>
 <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <87h6qhxu4h.fsf@intel.com>
 <fdb25b67-92fa-d010-39b4-a14ab3fa4edc@redhat.com>
Date: Thu, 06 Jul 2023 13:14:47 +0300
Message-ID: <87edllxs6g.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Jul 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Yes, so maybe a better way would be to add a remote/bmc connector, with 
> proper default resolution ?
> That will better reflect what the hardware does.

I'm afraid I don't know enough about the hardware or use case to say.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
