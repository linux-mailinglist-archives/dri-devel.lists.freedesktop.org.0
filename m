Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED84BA9F1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0603710E739;
	Thu, 17 Feb 2022 19:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6010E739;
 Thu, 17 Feb 2022 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645126729; x=1676662729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kk8HHBr8VqLjNLfLjGNY0PRG+AE7b1Fj94OFxG/T97E=;
 b=HUoOxGeFjKUc4ba1pl6sMiNKpkakaBu582eXdnQf7MWIHnNBLv3dvpic
 6XhhhwIJODHJ6ly/KCn6R2PGTw3kiMCBD1zLjE1TNZuyHQiENS9Hq+r+C
 PUXBLlmt/xYA15o+0g1BEgkAl7hELtGNA3g2EpFhsJ6BB7UZVSa/DweW3
 6FN88oKqTLW211N1by7k8msiPHZpYAKIW1wqjMRpgmvNBgioGWUD7sqTO
 UNf/WCItGcWH4hLLpMEveInG+rzwqNoXkaqCALwBQ4qa48VnQZatwJd7g
 iYXfGjtMqweTaqBPqDaM8qqmhU0AOidwB+kuMhdEbyVn0S/sYdanfG2Eb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231584442"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="231584442"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:38:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="488628177"
Received: from csavery-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.47.201])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:38:37 -0800
Date: Thu, 17 Feb 2022 11:38:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Message-ID: <20220217193836.mpnyh7s6otom5ako@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215055154.15363-4-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 11:21:54AM +0530, Ramalingam C wrote:
>From: Jouni Högander <jouni.hogander@intel.com>
>
>Currently ICL_PHY_MISC macro is returning offset 0x64C10 for PHY_E
>port. Correct offset is 0x64C14.
>
>Fix this by handling PHY_E port seprately.

order of the patch here is wrong. This patch should come before
the patch initializing the 5th port. Then the commit message is not
a fix.

This can be done while applying since it's more an order to avoid
breaking the tree.

Lucas De Marchi
