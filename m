Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A46D17EE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 09:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65B710F104;
	Fri, 31 Mar 2023 07:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177BA10F104;
 Fri, 31 Mar 2023 07:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680246142; x=1711782142;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yHMOEUPKsjHNBby8lcaub9KEv8oA6ClqWvka4yCdPFo=;
 b=BpmtrWsIKVPtYdeRbUh+TW/g8L4lBhowhgbaGIEXxYxRv+mRl5AGwZxA
 Jse5fJr7e1CbJLowF9V22Dd76edRhDM3PT+O8BYzuWMRJG5wgTPiFCa1F
 xbOhpLBQnZ84gcYcG44nA2BC561eOkVFkgL5EZI93kj18yT+blImI0jQT
 awpEgi3n3Fcf315xMvso8aSjmDpTVHj7pxuBcliS5VSDwzD4Xl+Lts68s
 5K9gQnQUwT+AMNsjYYEPBqbzPzRr4STRmrhQkrsZdoo3oxmFRf4y4WXSs
 DLyFtO1E9lvCHl8Jb/QLUbf8L1Oz1Z6vmr/7Y4HwU4ped3GnKjLcn+O78 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321766921"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321766921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 00:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="715347402"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="715347402"
Received: from colintro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.4])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 00:02:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH][next] drm/i915/uapi: Replace fake flex-array with
 flexible-array member
In-Reply-To: <ef8d083a-a82b-669c-0b0a-959e0f120a26@embeddedor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZBSu2QsUJy31kjSE@work>
 <ef8d083a-a82b-669c-0b0a-959e0f120a26@embeddedor.com>
Date: Fri, 31 Mar 2023 10:02:05 +0300
Message-ID: <87ileh2yky.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023, "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
> Friendly ping: who can take this, please? =F0=9F=98=84

It's in drm-intel-gt-next.

commit 02abecdeebfcd3848b26b70778dd7f6eb0db65e1
Author:     Gustavo A. R. Silva <gustavoars@kernel.org>
AuthorDate: Fri Mar 17 12:18:01 2023 -0600
Commit:     Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CommitDate: Tue Mar 21 08:41:18 2023 +0000

    drm/i915/uapi: Replace fake flex-array with flexible-array member


--=20
Jani Nikula, Intel Open Source Graphics Center
