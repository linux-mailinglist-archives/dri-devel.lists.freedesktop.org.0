Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1F7D6692
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE65810E60F;
	Wed, 25 Oct 2023 09:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15DD10E60F;
 Wed, 25 Oct 2023 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698225531; x=1729761531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VKZaWKRzncOuvfeeEacHAU7Yg5OLgefyKjeLOiPbgx0=;
 b=ZdqHge3wkExYzluKVLZG+wY7rplnKrFJjK5EsOIL0IWcE/FCDIGdluHy
 0JoEXsNlvTLRKK468qD/KE8C29BlMZl4x49FrIyMsb5dluLV1/Re4jGz9
 2m0czt8P47SSY8D27oqOG9hX9cvU3oWxE+5EILPUSouDh7AUrW7Xb5HiN
 TwcTqF1jiC/Grd86y+msCb9PbmaR2vK8LQKUD0h1KAR6+gK1bZl6WYl6o
 Bta7dUZJTd3iKjkfqybDmu02cp5gZoOB096fgBGxyR4it/3dWglW8hUsW
 ZpmOUNoPE39BXABMT9NoMllS0KRUXqnAlB+KZAuD5UBsg3KZ9PG/qD++c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384480468"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384480468"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882394875"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882394875"
Received: from shenkel-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.63.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:18:48 -0700
Date: Wed, 25 Oct 2023 11:18:45 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/7] drm/i915/dsi: Get rid of redundant
 'else'
Message-ID: <ZTjddaEfiDAZQ2a1@ashyti-mobl2.lan>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024155739.3861342-3-andriy.shevchenko@linux.intel.com>
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

Hi Andy,

On Tue, Oct 24, 2023 at 06:57:34PM +0300, Andy Shevchenko wrote:
> In the snippets like the following
> 
> 	if (...)
> 		return / goto / break / continue ...;
> 	else
> 		...
> 
> the 'else' is redundant. Get rid of it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
