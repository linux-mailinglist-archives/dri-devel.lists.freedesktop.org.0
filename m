Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3A492613
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 13:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA26B10E2ED;
	Tue, 18 Jan 2022 12:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757AD10E2ED;
 Tue, 18 Jan 2022 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642510192; x=1674046192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=giH6FUZ+eYqzQs5QEmAZOh2DvzvFkyaYRr2gH21bW7E=;
 b=JtazJ8P4TDSo9CHHhm4Zirx110xQTnPZGZgVrlSXvDLeAw8xW4FoSRks
 kSyl6XGKQWSrnPaSgYRpFGOucda4DmfYGKRHpq3AgUa4a5Cwvuq/HtLQv
 z21LJh+eFbZXgxtteuAc8XAhP77vkkIWQhESGR5XXOtJBGsAhe/H0Rrfx
 mKiwpd+r6wIu+f1TrSuFMkcMqyZcka01V5V6Wns8t+BYLUGJMhDORfJHk
 ebjPv2OPzvQ3tsB9tJxTa7byJTebK+OPwo8xovnats/3ydHQrkG2UCMQF
 H8E0Su3UOCL636mZJXpvOnPPtPJucDZgaj0R4hSX7BHiPiC5j87SiL1Bs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="232166485"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="232166485"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 04:49:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="517757138"
Received: from igosu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.44.207])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 04:49:50 -0800
Date: Tue, 18 Jan 2022 14:49:47 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 2/2] drm/i915/gt: make a gt sysfs group
 and move power management files
Message-ID: <Yea3a6fTYEqs6FSg@intel.intel>
References: <20220117193255.236599-1-andi.shyti@linux.intel.com>
 <20220117193255.236599-3-andi.shyti@linux.intel.com>
 <c2fe4be4-8b7b-6aae-7477-a4da8e3ac337@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2fe4be4-8b7b-6aae-7477-a4da8e3ac337@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > +bool is_object_gt(struct kobject *kobj)
> 
> Not sure if you will need it exported in a later patch but for now it seems
> only users are local to this file.

it is actually used by sysfs_gt.c and sysfs_gt_pm.c.

Thank you,
Andi

PS. in this v4 I forgot to replace many drm_err() with
    drm_warn(), will do it properly in the next version.
