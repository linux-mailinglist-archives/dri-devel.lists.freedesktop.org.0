Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1458AE8C1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129171133DD;
	Tue, 23 Apr 2024 13:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV7Qk80/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA521133DE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713880507; x=1745416507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+PK+oBMAJmxbGUBApziMyZiWq0jsi78ILrJZcvOsOnE=;
 b=LV7Qk80/tE1j/6lBwqynVEP0KT6TBQiMMlt4ZZGUHjE9AxRfUU9M35g+
 aDT8ORzwCWy/6JeMS6dAFcFZNO0+5J1HPocIRKfrdjGIs9b3gZn2odJoY
 fFIT/OCGUyUPYssEinyR1Qm4xQ6wuNWFVsHhJC1GIOLdDGzRnOiZUfayf
 XPLHkXk8J8S4BHVk5hoKedygi0p0rFOgQdmQ/zok2JEfMMDolr0mTaPKG
 6Y8gtKiU/sHpldvXHQR68Vhs1xzEAZF0/uGapEy4M2lQQfnHNRUc2O3vT
 mgTMZcE9bR03fv622MQdWe9XLWnp7bX3McNd5jfaUZijNNYuLb2UU/cbX g==;
X-CSE-ConnectionGUID: ZqE/Dw7OSwiY5B4+bYheHw==
X-CSE-MsgGUID: /O3WVRrgQmSZGjc/YWUClA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9316058"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9316058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:55:07 -0700
X-CSE-ConnectionGUID: CgQsHSIARYiUxxj7DuaRlw==
X-CSE-MsgGUID: p59mQK6vSwqt7bn3zuLksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24427031"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.117])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:55:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: move DRM-related CONFIG options into DRM submenu
In-Reply-To: <081ae10b-0a64-48fc-9be9-540e67900527@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240423102443.453261-1-masahiroy@kernel.org>
 <081ae10b-0a64-48fc-9be9-540e67900527@app.fastmail.com>
Date: Tue, 23 Apr 2024 16:55:00 +0300
Message-ID: <875xw8rxor.fsf@intel.com>
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

On Tue, 23 Apr 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Tue, Apr 23, 2024, at 12:24, Masahiro Yamada wrote:
>> When you create a submenu using the 'menu' syntax, there is no
>> ambiguity about the end of the submenu because the code between
>> 'menu' and 'endmenu' becomes the submenu.
>>
> ...
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> I think this is a useful cleanup.

Yeah, thanks for the good explanation!

However, it won't apply to current drm trees.

BR,
Jani.


-- 
Jani Nikula, Intel
