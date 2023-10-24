Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678937D59A0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 19:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DEA10E432;
	Tue, 24 Oct 2023 17:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5616D10E42E;
 Tue, 24 Oct 2023 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698168021; x=1729704021;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oapaMcxI+KpCYh2zdIRHvQ9gfOEWpMQ05geZu/OsvC0=;
 b=Xn35B/9+yo7O3S2T0vx45iKVXH+Q9JFc3gC0lAI2eyo4RhtsAXfpvgBs
 6+UyDwE8I6dfSy6n0OxvqeD3B4cxIVlUk5zN3l7ePBjmWgqqfOgAiQYNy
 5lO7Sb0cSTAVrX/xMDTXxG3V6nWHtEO3uuzJ+MKvFvIgKk/DZVm9ZNHVo
 +OkvFtZ8Lsc4/IvcyZe+vXRA62I/2+y9cRXgcv20MwwLfFs8uDIQPzI6K
 2aBzaV6Jbqp2HA8bVu8C38DBvLDnCaIt2PlF7q4pgRRGTzxXgUhBjNLit
 1U8+HaulVuNvY2aEJ4/ZpwljBRfryxJ7DrtEit9bXcg4fG+41w9/VTq2r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="418243105"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="418243105"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 10:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="793577222"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="793577222"
Received: from yaminehx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 10:20:17 -0700
Date: Tue, 24 Oct 2023 19:20:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH RESEND v2 0/2] Add drm_dbg_ratelimited()
Message-ID: <ZTf8znCftXaEBVZr@ashyti-mobl2.lan>
References: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> I might have picked up the wrong series and missed some reviews
> and the extra patch from Nirmoy with a real use of the
> drm_dbg_ratelimited() that John was looking for.

just a kind reminder.

Andi
