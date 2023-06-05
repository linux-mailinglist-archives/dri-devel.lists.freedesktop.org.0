Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C1F7232EC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 00:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860B910E151;
	Mon,  5 Jun 2023 22:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1604C10E151;
 Mon,  5 Jun 2023 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686002851; x=1717538851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6hQIH6kxB5Uh7a61381O9b4ml6Fjzkz+M/wgyetbKkQ=;
 b=TpszJsj6syZEBdnP9zVri6EuQpXcVoHtw8Fvut3pT3uhGT5exUkYyysW
 28sp+bP5eqlRr2ziX9Q7qjyupl0HPjihZmlNYVfYKXvZu6OnowIBa6Eqj
 j7U70YCedPuacd30yL7KaBTOUddIJ5eLHWSGnOkquOKq7Oe5yO3iOKJjr
 lcKMOptdHUFpXy3onypcugSbCu5FKIBgZBPStJKpyJInST3qRywJVO7ju
 XMhmbDlpwWYEtVXPntmczDFg2iMMsxLRSmP7fjLmBhH/UPAX3epGPVGvf
 DavNCFmfr4SQTys1UV5R3iLr9975i0GJfwhE5ttiCDydTwTRQ06cx879z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="353989831"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="353989831"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 15:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773885702"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="773885702"
Received: from twgeistx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.176])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 15:07:28 -0700
Date: Tue, 6 Jun 2023 00:07:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use the fdinfo helper
Message-ID: <ZH5cnHHd7Iz+/ygs@ashyti-mobl2.lan>
References: <20230605123224.373633-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605123224.373633-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Jun 05, 2023 at 01:32:24PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use the common fdinfo helper for printing the basics. Remove now unused
> client id allocation code.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rob Clark <robdclark@chromium.org>

looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
