Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64A7D66B2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B7710E610;
	Wed, 25 Oct 2023 09:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8516710E610;
 Wed, 25 Oct 2023 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698225895; x=1729761895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z5QuHEH9/Il1E5F4X+UOg9jbSOOGe6HK4yUv0ZPfB/w=;
 b=idUasxdNicP7LVYk+nceEsvJXvMxxbvsbEuZbLkrbNtuqtEQi+wT4tH+
 QV1DsIOg1x/jfZyti+41vfmshBDw+4YsoogUyDKhPm74yLUcwtx9Pt+9w
 +Dl8hqBXL25E5ZHeNyCtZMfBSDT0Vw4OgK5W0mnNze+pEUw3+S6h8kvz6
 C9xTSt55C5YOst/YKjf3QqCvXHmPRwli4AGnuY9ary4tD6jBpjUSDoVZe
 qSa0jqIxGaqNFh1+Q3nDa5xjbuGBUS/LyNwynSDCk4/sw0hbTpBe+0Ytx
 8K6vkZfam4IpJn58z+WrHkIsLef0wsJR5hwiiuarJvzHCkYHM45LT25aO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473508353"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="473508353"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005946234"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1005946234"
Received: from shenkel-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.63.39])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:24:52 -0700
Date: Wed, 25 Oct 2023 11:24:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/7] drm/i915/dsi: Replace check with a
 (missing) MIPI sequence name
Message-ID: <ZTje4ZFzDLuVWkxB@ashyti-mobl2.lan>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024155739.3861342-4-andriy.shevchenko@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 06:57:35PM +0300, Andy Shevchenko wrote:
> Names of the MIPI sequence steps are sequential and defined, no
> need to check for the gaps. However in seq_name the MIPI_SEQ_END
> is missing. Add it there, and drop unneeded NULL check in
> sequence_name().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
