Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0F3569BC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 12:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313EB6E8F2;
	Wed,  7 Apr 2021 10:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC1489C82;
 Wed,  7 Apr 2021 10:31:50 +0000 (UTC)
IronPort-SDR: WeKhbQjk11Q9kArfyaBWg2wA22L3/EZRPCKjjSJW6x6eOuUNT1fh2VoBflHRyqkFiQxgLposU7
 xvzrfB8Dk0qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="278543319"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="278543319"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 03:31:49 -0700
IronPort-SDR: Fgx5Ycqar1NE1kTy6z4KBpu2sNQ95Zo5AiW9lZfxLvSPUlQO9mM6rgB5saoIpXm/2wf7qIj50l
 NF3JLOS4uLCw==
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="421645848"
Received: from shochwel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.33.133])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 03:31:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 xorg-devel@lists.x.org, linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
In-Reply-To: <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
Date: Wed, 07 Apr 2021 13:31:43 +0300
Message-ID: <87mtuajshc.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> It is the most complete EDID parser I know based on the various standards.

Does it support pure DisplayID in addition to DisplayID blocks embedded
to EDID extension blocks? I think we'll be needing that sometime in the
near future. (We don't yet support that in the kernel either.)

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
