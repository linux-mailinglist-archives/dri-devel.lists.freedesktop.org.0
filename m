Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178464B59D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD7C10E1C3;
	Tue, 13 Dec 2022 13:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F0A10E0F0;
 Tue, 13 Dec 2022 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670936646; x=1702472646;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p3Om1Xik+AF19WESY2NinSd/maoIdpr/rAqtx93iZE4=;
 b=hRJVXJp5AL83fahteJy0sD2Th3cSysFlIrLdJevw11rGYm53E4MUxt/V
 iNk83SrWGX/d2miLQkjOFxVyl8ezftz65nslkN0Fh7boO9VehRNSchfP3
 PkKKug9EEzd/Sigf/si4rJ3pXKs+WT6Dx8rGuhL/rLpdRX8w0ZO9E58mU
 aJkqbSWtD95aJ7Cp8QFo4IjNHcjyus0hn2pRd+Z94kdtE9XXpJd54iJ8m
 12wtBMzQBkfTUPQ+z3QGyKoWZwFUEx8sVu1LezdLW/yG4CPek1RuQwsLO
 8b39/VEz62hlxVZplLa9t6lDv8MenASwbZmX/jQBE02nUMSVur5/zeuuX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="382426734"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="382426734"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 05:04:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="893915997"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="893915997"
Received: from rreill2x-mobl.ger.corp.intel.com (HELO [10.252.5.17])
 ([10.252.5.17])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 05:04:05 -0800
Message-ID: <984e9000-520b-e93b-9f93-a7b178208059@intel.com>
Date: Tue, 13 Dec 2022 13:04:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/i915/selftests: Remove hardcoded value with a macro
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221213120010.5857-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221213120010.5857-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2022 12:00, Nirmoy Das wrote:
> Use MI_USE_GGTT instead of hardcoded value.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
