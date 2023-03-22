Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3E6C48F5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 12:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30D210E921;
	Wed, 22 Mar 2023 11:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01CF10E91F;
 Wed, 22 Mar 2023 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679484008; x=1711020008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oFkem9rIujBoqVeQvfgA9l4aoAczXyugj84MB3ez9UI=;
 b=L2M34ao6rOnBDLOxXdUtS8/xxFpuSVIXE0yc+vyfr29DZb94sUl9NX6N
 Dtt10nrxjLirql8s0IzyQxagojDof8rOlPicj5NSyZv+LV/OE7eGQ7qDG
 RUv75C8WjQPg+RVuTB/yfwcgfOJEQjtQw5iNA1jWrU2yqQbaPZ5hlgaT4
 oFqdXTKUV2dr/vHUhHnb3mu7UKnvCaQaG0sgXJFscYdf3rbf2lKnRorcg
 1/48PfiLEWVBVWDOF2VElpDMHwtM5HEcxZixIBs1MMMAq8rBBr2poJ+r2
 +NipivETABjDOcTy9xwUrm9ZPzT6aMKRGWG+c+4yyVF4kjFl2KeyBsCcY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366923639"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366923639"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 04:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="659161869"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="659161869"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 04:20:05 -0700
Date: Wed, 22 Mar 2023 12:20:03 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: DRM debugfs cleanup take 3
Message-ID: <20230322112003.GB2066233@linux.intel.com>
References: <20230316082035.567520-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316082035.567520-1-christian.koenig@amd.com>
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
 mcanal@igalia.com, mwen@igalia.com, maxime@cerno.tech,
 intel-gfx@lists.freedesktop.org, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 09:20:28AM +0100, Christian König wrote:
> Hi guys,
> 
> I've messed up the last send out. Cleanup up some issues reported by people with the accel drivers (duplicated files) and rebased the result.
> 
> Apart from that the same approach we already discussed previously.

I tested the whole set with accel/ivpu driver and everything works as expected.

Regards
Stanislaw
