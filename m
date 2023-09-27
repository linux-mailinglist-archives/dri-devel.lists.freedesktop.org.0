Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281857B0337
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5B810E4E3;
	Wed, 27 Sep 2023 11:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B3110E4DB;
 Wed, 27 Sep 2023 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814725; x=1727350725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Rp92qpkkaY3VwqKjaObRBWapzifPxcg04ZFJ7CLTD4s=;
 b=BdYhBtyZrriGATCpGpUikGfKtyPDLehCQuwRybZFQUZ29/PqBAUNCfeN
 EnrV9HaAuvCtgOA7pC45EQm6eIc9GOExWC1oWwXayZL5p8xsPZgMFI4gp
 vEc4yUC7UHVvP/HEZGPNr3yQZgeldjodENY1lcBp1m0OyLjyHJV+X3mGe
 rS6/2dS/ol3oNdIQe0TL/7mHRQmcdRnsZ3enGqa6cOXt8amqke/tTqn2a
 xXWvTbqEOjcdrcvFhgx5swS3osGTC9AhUsrpkCW7olcpapQdYUqJMR20M
 Ib6+w30TMZF2rGBvWnAkc7f7NHC6IR5zDt7ypb0s7rf3QqFj8aHDB90KO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384591144"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="384591144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784289895"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="784289895"
Received: from xueqilim-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.83])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:38:39 -0700
Date: Wed, 27 Sep 2023 13:38:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v4 3/3] drm/i915/mtl: Skip MCR ops for ring fault register
Message-ID: <ZRQUOVzHWzUWs8qZ@ashyti-mobl2.lan>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
 <20230927102237.30773-3-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927102237.30773-3-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

> +	/*
> +	 * For the media GT, this ring fault register is not replicated,
> +	 * so don't do multicast/replicated register read/write operation on it.
> +	 */

thanks!

Andi
