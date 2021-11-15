Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67B45029B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53F76EC0C;
	Mon, 15 Nov 2021 10:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFDC6EC08
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:38:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="233256227"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="233256227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:38:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505869251"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:38:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
In-Reply-To: <FA_pOwZDBfWW7NDxnHcCdMMqwbgstLNzftE9m4Dgtyewq8lYjHNSsdBZWpO_ULCLt2hCO0SVW5xku_qcEghQMtawUVdbmQeu7c4hBtg19pQ=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YZARol5A5hS+5a5m@gineta.localdomain> <87ilwt3ei7.fsf@intel.com>
 <FA_pOwZDBfWW7NDxnHcCdMMqwbgstLNzftE9m4Dgtyewq8lYjHNSsdBZWpO_ULCLt2hCO0SVW5xku_qcEghQMtawUVdbmQeu7c4hBtg19pQ=@emersion.fr>
Date: Mon, 15 Nov 2021 12:38:43 +0200
Message-ID: <87czn13dqk.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Simon Ser <contact@emersion.fr> wrote:
> On Monday, November 15th, 2021 at 11:22, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> - Adding drm_dbg_connector() which would take drm_connector as context,
>>   and do drm_dbg_kms() with the above prefix.
>
> This wouldn't work great in case multiple connectors/planes/etc are involved,
> or when drm_dbg_atomic() is used.

That's a good point, though you could still roll those cases manually.

It's also misleading as otherwise drm_dbg_* are categories that can be
enabled/disabled via drm.debug.

Again, just musing here.

BR,
Jani.





-- 
Jani Nikula, Intel Open Source Graphics Center
