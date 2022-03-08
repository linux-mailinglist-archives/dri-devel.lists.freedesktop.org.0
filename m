Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCBE4D14A2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E9C10E74A;
	Tue,  8 Mar 2022 10:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E710E766
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646734909; x=1678270909;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tlfAGEzWZupbhLz4z0/Y6/HTRgwEljOiRNv5zyXFBDo=;
 b=HxhFgXCzcCAv4X2iKWaZXPMiLg9K+YefXIUSOjiCG40dq+n+lV887J0w
 O5hqeNG/74tXQu/YYTzSyRYM7TGN7i7j3T3iOgYPPUjJL/YEcTTYURh/b
 9FC8Qx7zw1ruABqcDC2pBVIbe/IA7HL9GdstGEyBPGwFagzGDoUvb6gAE
 ZH5FRqh4fD2VWLqmTyYkRAA3Q5/JNeEM6z+oamMnI1k9A+aMiFDV/mk+s
 K6YRCBl5/TDYdnu73ofOgr7nVnrF16Kyl51rJTtILIJODahDmDM7mG3pu
 1C+n0gA3/z6eBVNNjaz/3YZpmGa2l80G4Zp9/GfJyYtmaBGTSQSTbXIOT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="315364660"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="315364660"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:21:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="513055616"
Received: from acushion-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.29.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:21:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi
 funcs and delay mipi high to cooperate with panel sequence
In-Reply-To: <9e3cd215a2f771236855bdb2f5faa172dcbd1aec.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
 <87lexq2aw4.fsf@intel.com>
 <9e3cd215a2f771236855bdb2f5faa172dcbd1aec.camel@mediatek.com>
Date: Tue, 08 Mar 2022 12:21:42 +0200
Message-ID: <87tuc8218p.fsf@intel.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Mar 2022, xinlei.lee <xinlei.lee@mediatek.com> wrote:
> On Fri, 2022-03-04 at 13:51 +0200, Jani Nikula wrote:
>> Please also prefix cover letters with drm/mediatek if that's the only
>> place you're touching.
>
> Thanks for your review.
> Is your suggestion for me to put the fix id on the cover ?

Heh, it's not really review, just something to ease me going through the
dri-devel mails in the future.

The cover letter subject is "Cooperate with DSI RX devices to modify dsi
funcs and delay mipi high to cooperate with panel sequence" and I don't
know whether the thread is about drm dsi helpers or some drivers and
what drivers. If the cover letter subject also had the prefix
"drm/mediatek:" like all the patches, I could've just skipped it
altogether.

Just something to consider in the future, no need to do anything here.

Thanks,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
