Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F833D4C09
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 07:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831FA737F7;
	Sun, 25 Jul 2021 05:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EE76F91A;
 Sun, 25 Jul 2021 05:02:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10055"; a="211788159"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="211788159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 22:02:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="565875077"
Received: from mvargasp-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.51.206])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 22:02:16 -0700
Date: Sat, 24 Jul 2021 22:02:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 02/30] drm/i915/display: split DISPLAY_VER 9 and 10 in
 intel_setup_outputs()
Message-ID: <20210725050215.s2ejpin6xkwzba5h@ldmartin-desk2>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-3-lucas.demarchi@intel.com>
 <YPxQwdEAcNRIX9ep@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YPxQwdEAcNRIX9ep@infradead.org>
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
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 06:41:21PM +0100, Christoph Hellwig wrote:
>Still tests fine:
>
>Tested-by: Christoph Hellwig <hch@lst.de>

I just pushed this  to drm-intel-next as part of another series and
added your Tested-by.

Rodrigo, can you pick this up for -fixes? This should go with your other
patch to fix the port mask, too.

Thanks for the bug report and test.

Lucas De Marchi
