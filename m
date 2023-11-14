Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4567EAC19
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 09:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC0A10E1C0;
	Tue, 14 Nov 2023 08:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CB610E1C0;
 Tue, 14 Nov 2023 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699952021; x=1731488021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yAw9k3gw5sgGKUi8oLnxSsuyohYC1OCk82oksGDoQpk=;
 b=YI/9Ap2R4N41jCBfKvE5PmWQHpPkv6/8S5Hb+G1+S+LTKvNOiTSoRANO
 SwA3tQseFUOb/3halXpXbZ7ZtqBwENaHoueieGuAhIGuylVovRphETv0F
 QLTDkcgtqe3LChwfBbiDA5QilCBQ+9XeKpaHNNoEidu2H0zKOK5BdDVgH
 ByD4ZzyaqEZb5FNprCEL5Meil2CwM8qfCKKwNyQccWiI+FJDD749nYwqv
 +I0BiXEI54QfJbc4RCcXcTh19SmCOz4NP3Q+65IqGK//uL61hK5geXODj
 MBiCQw7TKmiBrptELTN6UH+SIJNQJweSveFymSfUwov1t8tvxdk5wPThg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394526087"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="394526087"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 00:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011849315"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="1011849315"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 00:53:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
In-Reply-To: <8734x8u4la.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114141715.6f435118@canb.auug.org.au>
 <8734x8u4la.fsf@intel.com>
Date: Tue, 14 Nov 2023 10:53:30 +0200
Message-ID: <87y1f0sol1.fsf@intel.com>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 14 Nov 2023, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> After merging the drm-intel tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5484: ERROR: Unexpected indentation.
>> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5488: WARNING: Block quote ends without a blank line; unexpected unindent.
>>
>> Introduced by commit
>>
>>   1cd0a5ea4279 ("drm/dp_mst: Factor out a helper to check the atomic state of a topology manager")
>
> Imre, please fix this.

Just noticed there's a fix [1]. Need to merge that via drm-intel.

BR,
Jani.

[1] https://patchwork.freedesktop.org/patch/msgid/20231114081033.27343-1-bagasdotme@gmail.com

>
> Thanks,
> Jani.

-- 
Jani Nikula, Intel
