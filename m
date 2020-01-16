Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C185D1404FD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C876F415;
	Fri, 17 Jan 2020 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43A6EDE6;
 Thu, 16 Jan 2020 16:48:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 08:48:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="218595443"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga008.jf.intel.com with ESMTP; 16 Jan 2020 08:48:35 -0800
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id E65295C1DF1; Thu, 16 Jan 2020 18:47:58 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: akeem.g.abodunrin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, omer.aran@intel.com,
 pragyansri.pathi@intel.com, d.scott.phillips@intel.com,
 david.c.stewart@intel.com, tony.luck@intel.com, jon.bloomfield@intel.com,
 sudeep.dutt@intel.com, daniel.vetter@intel.com, joonas.lahtinen@intel.com,
 jani.nikula@intel.com, chris.p.wilson@intel.com
Subject: Re: [PATCH 1/2] drm/i915: Add mechanism to submit a context WA on
 ring submission
In-Reply-To: <20200116161601.26110-1-mika.kuoppala@linux.intel.com>
References: <20200114174549.74643-2-akeem.g.abodunrin@intel.com>
 <20200116161601.26110-1-mika.kuoppala@linux.intel.com>
Date: Thu, 16 Jan 2020 18:47:58 +0200
Message-ID: <877e1rqrep.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: Balestrieri Francesco <francesco.balestrieri@intel.com>,
 Kumar Valsan Prathap <prathap.kumar.valsan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mika Kuoppala <mika.kuoppala@linux.intel.com> writes:

>Subject: Re: [PATCH 1/2] drm/i915: Add mechanism to submit a context WA
>on ring submission

I forgot to add RFC into patch subject. This should carry
the RFC status as it is v2 on a RFC patch.

This patch squashes Chris Wilson's ctx switch optimization
and the development is still continuing.

-Mika
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
