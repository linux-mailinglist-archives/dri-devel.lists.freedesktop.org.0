Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0530484F4C9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 12:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5610910F33F;
	Fri,  9 Feb 2024 11:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX4ZE+Oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0D110F33F;
 Fri,  9 Feb 2024 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707478855; x=1739014855;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vtBO4scxv+MTOpSImnubLPd2Z8g6ZaKuKP+ptugnLNE=;
 b=mX4ZE+Oek/t8RNFtwTBzPaWeGcctm7ABSKD262UHPqkiPmDV8doVE44O
 QE1U1mTDZupQd1bm3Ska949GTRAFMrOtQEkm99fSC1wmK/XeHHIJKimuj
 cDIbWU6n0lPxNd+6FeDEp/a4jCR5JP2B+jSiwK5ZCswO3EjrkoGgxKu9w
 Q/7vnd14SICSTgtnyfI4wVnAYC42S7B9DvyrzI9IXddP/mkY1w8aQxz6O
 Zl7dPJ9NTXdWiHTcMYWnA9eU5fYw5rWK3mYGwIeFYgJsGkObp02hgT4B6
 qgcfUewuMTrRV/9uqFXcxVa+rNJP6pgKp7PkJ2Boov9PZVVcOBotmodpx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="26867681"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="26867681"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910686096"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="910686096"
Received: from dfischbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:40:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH 00/10] drm: drm debug and error logging improvements
In-Reply-To: <henxwxlna777w6fzrhqrjp7wczlgbhpf5sxqnxsb6jguynwen7@5bhi7lrce5ve>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1705410327.git.jani.nikula@intel.com>
 <871q9wgxfi.fsf@intel.com>
 <henxwxlna777w6fzrhqrjp7wczlgbhpf5sxqnxsb6jguynwen7@5bhi7lrce5ve>
Date: Fri, 09 Feb 2024 13:40:44 +0200
Message-ID: <87ttmhamrn.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Feb 01, 2024 at 02:51:13PM +0200, Jani Nikula wrote:
>> On Tue, 16 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> > This is resend and more patches on top of [1]. I don't think I've
>> > changed anything since then.
>> 
>> Hi drm-misc maintainers -
>> 
>> I've got R-b from Luca, but given there's no comments outside of Intel,
>> are you okay with me merging this to drm-misc?
>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for the reviews and acks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
