Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F296C4721
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3010E8E3;
	Wed, 22 Mar 2023 10:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0591F10E8E3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679479320; x=1711015320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b/pDjDAGBcg5WhI+AQMf4x0J3VeVkUcdJvmTMh6YlXI=;
 b=igbE8euMcJAoYLe6kCdaM6eUtZgd5B98r0vhQzd/8BHfu0pMGssJ5sEs
 F64zFcgQaXYDVuOLW5xZYMYWLj83aWJZdtS22iMbNVVAT7SHSENv7My73
 5Etg+IrrJ3MMWBGFDFWd7KeiQkds7vlvc2igjIKe520eCU14WEr8O8rw5
 DgbfzVJdiH3EvqzYsWHmMSgA2MdIpwS640lKhBetfhbttzPXydpF1lymQ
 8vqtEVQnN0i9lUA+3/VXNhdOQl2dlDwPHT+9yE70ZtxC2z9sql4TBpbcf
 Iu+msj6drs4V4CIzA7klRes+mwZuaKo27HbGfjl2FEMPpbFU1Kk5aGpnN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339214452"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="339214452"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 03:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750975537"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="750975537"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 03:01:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pevHt-0075cJ-2t; Wed, 22 Mar 2023 12:01:45 +0200
Date: Wed, 22 Mar 2023 12:01:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 0/8] Support ROHM BU27034 ALS sensor
Message-ID: <ZBrSCYp+QrHK47dS@smile.fi.intel.com>
References: <cover.1679474247.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679474247.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 11:05:23AM +0200, Matti Vaittinen wrote:

> Revision history:
> v4 => v5: Mostly fixes to review comments from Andy and Jonathan.
> - more accurate change-log in individual patches

> - copy code from DRM test helper instead of moving it to simplify
>   merging

1) Why do you think this is a problem?
2) How would we avoid spreading more copies of the same code in the future?


1) Merge conflicts is not a bad thing. It shows that people tested their code
in isolation and stabilized it before submitting to the upper maintainer.

https://yarchive.net/comp/linux/git_merges_from_upstream.html

2) Spreading the same code when we _know_ this, should be very well justified.
Merge conflict is an administrative point, and not a technical obstacle to
avoid.

> - document all exported GTS helpers.
> - inline a few GTS helpers
> - use again Milli lux for the bu27034 with RAW IIO_LIGHT channel and scale
> - Fix bug from added in v4 bu27034 time setting.

-- 
With Best Regards,
Andy Shevchenko


