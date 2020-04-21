Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C11B1F3B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8889248;
	Tue, 21 Apr 2020 06:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5135289248;
 Tue, 21 Apr 2020 06:51:47 +0000 (UTC)
IronPort-SDR: e2TQ5jgNbHWN8rpDN7eHM8Hg96mW7RzyUkEVVMH1zYUtUnDmgOCZ1qz4/I35+fX8wCBQ2lXnOz
 2bOF+Xw1191A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:51:46 -0700
IronPort-SDR: dJgnj9LtJxS9ebZ/S0njP5sYfexPvZ4NgMfEfFHz5F0bZkUuEcdzxlgfKs8wSnygkqF4emsbFK
 jkm+0153uf8w==
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; d="scan'208";a="429422153"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.214.210.219])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:51:41 -0700
MIME-Version: 1.0
In-Reply-To: <20200420161514.GB1963@sultan-box.localdomain>
References: <20200404024156.GA10382@sultan-box.localdomain>
 <20200407064007.7599-1-sultan@kerneltoast.com>
 <20200414061312.GA90768@sultan-box.localdomain>
 <158685263618.16269.9317893477736764675@build.alporthouse.com>
 <20200414144309.GB2082@sultan-box.localdomain>
 <20200420052419.GA40250@sultan-box.localdomain>
 <158737090265.8380.6644489879531344891@jlahtine-desk.ger.corp.intel.com>
 <20200420161514.GB1963@sultan-box.localdomain>
Subject: Re: [PATCH v4] drm/i915: Synchronize active and retire callbacks
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 21 Apr 2020 09:51:37 +0300
Message-ID: <158745189706.5265.10618964185012452715@saswiest-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sultan Alsawaf (2020-04-20 19:15:14)
> On Mon, Apr 20, 2020 at 11:21:42AM +0300, Joonas Lahtinen wrote:
> > So it seems that the patch got pulled into v5.6 and has been backported
> > to v5.5 but not v5.4.
> 
> You're right, that's my mistake.

Did applying the patch to v5.4 fix the issue at hand?

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
