Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784052BD89
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 16:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB03410F209;
	Wed, 18 May 2022 14:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD0210F1FA;
 Wed, 18 May 2022 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652883847; x=1684419847;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y127+Te/ENnw7JXZQrKAKqeaTVP6PTWIk9yF6kkQytc=;
 b=gnhi8aDs6VTgphtLbRakTyAxlILoGlWhDWvWNTet41ONtxntbLZCny0p
 +pTtTKicI37qkjyFui0k8WRYqpMCNo28lFzv9yqOFrnji7GhXTuPZkhKi
 BcRa2xPyRmfDr3Z9enYB6yDweRq6DwuGYkCS8CEQJig7jXGT7Tq9XtWgC
 etWBtHILhmMonEsppO/6tkQLvt2fZtRQO4MxdkXrwCWfuPhFl90nQ7cvd
 CtuUMXxUfA/cNqL/16OdnlOLVYiFWfD+lKyQQnhRpHKhnJ8Ifkn+HE3ML
 Fxh+d+aGM9/F4kWAGZ1AzMacBLGrSZo4t6aenv7JQkI66Wydo18X2UNNw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="259263026"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="259263026"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 07:23:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="545480756"
Received: from jwasiuki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 07:23:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, wayland
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
In-Reply-To: <5423103a-3707-ba99-f45e-8608bc594bbd@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <87pmljerpi.fsf@intel.com>
 <5423103a-3707-ba99-f45e-8608bc594bbd@redhat.com>
Date: Wed, 18 May 2022 17:23:36 +0300
Message-ID: <8735h6ex7b.fsf@intel.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> So how about: display_brightness or panel_brightness ?

This is a prime opportunity to look at all the existing properties, and
come up with a new combination of capitalization, spacing, hyphens,
underscores, etc. to accompany the total lack of unification we
currently have. DisPLay_brIgh7ne55. :p

I think "display_brightness" is probably fine.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
