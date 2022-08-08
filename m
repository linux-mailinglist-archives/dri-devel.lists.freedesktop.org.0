Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEB58CC71
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8023010E2F2;
	Mon,  8 Aug 2022 16:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7410E155;
 Mon,  8 Aug 2022 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659977938; x=1691513938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CyZ9KFHsK3W8qpzogvHPOd+GVdfB3OgqatLSpmKZvks=;
 b=gver6fXtOJrP1CliWmoplgP1yrmKkplLEHQAMfSLu9DDrBZk1THPGDQV
 alO5SQYjSWy6QUwbXi7zkm0tBb90JAWs0lrUB6HctogTWaWmtXCTbAgkh
 aYSZPuTyGA/DXuUOqndRyRP7SS2NiJt10l/M4euHdBICg/bv4jB9WBr3l
 UvkdC5tGnPJ3QTS3U/pp6AhgDJJXd+4AlQ69m/0qt5FDph6/9C4c4u3Wc
 po+Zd4Rc1iZgfAjJilR5MFQbZtNNjVEaL7W1EQQNYZcOj3isKEfienZQf
 +QPG6iQiw+ZXgmxnuyBq+g+0pb5uE7Bk755Z1b6nNpLGHMMQc386/aTbL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="273692049"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="273692049"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 09:58:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="664040274"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.40.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 09:58:53 -0700
Date: Mon, 8 Aug 2022 18:58:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 3/3] drm/i915/gt: document TLB cache invalidation
 functions
Message-ID: <YvFAyhjeGSwJkEjc@alfio.lan>
References: <cover.1659598090.git.mchehab@kernel.org>
 <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, linux-doc@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Thu, Aug 04, 2022 at 09:37:24AM +0200, Mauro Carvalho Chehab wrote:
> Add a description for the TLB cache invalidation algorithm and for
> the related kAPI functions.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
