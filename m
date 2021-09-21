Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721F7413D9D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 00:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C7189FA6;
	Tue, 21 Sep 2021 22:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48C689FA6;
 Tue, 21 Sep 2021 22:35:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223520561"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="223520561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 15:35:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="454536979"
Received: from ewarnerx-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.115.97])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 15:35:09 -0700
Date: Tue, 21 Sep 2021 15:35:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 6/6] drm/i915/dg2: Add DG2-specific shadow register
 table
Message-ID: <20210921223508.33y7relbettym6ty@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
 <20210910201030.3436066-7-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210910201030.3436066-7-matthew.d.roper@intel.com>
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

On Fri, Sep 10, 2021 at 01:10:30PM -0700, Matt Roper wrote:
>We thought the DG2 table of shadowed registers would be the same as the
>gen12/xehp table, but it turns out that there are a few minor
>differences that require us to define a new DG2-specific table:
> * One register is removed (0xC4D4)
> * One register is added (0xC4E0)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I did the conversion from the table to this array and arrived at the
same result.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
