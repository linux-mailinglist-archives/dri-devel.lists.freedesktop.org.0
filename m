Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2D9313CC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830EC10E377;
	Mon, 15 Jul 2024 12:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPE6b/eQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BBC10E372;
 Mon, 15 Jul 2024 12:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721045608; x=1752581608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zn83j3eNWdHYHMJ+UEUHTLaYD3lLIIF14eNqyo8jTtc=;
 b=fPE6b/eQ8N3oV/Ilu9VwZcAwLbXJD/KQUXP+BMb4jVbeH7ioOkSEW3/U
 2f5LhTsOAKWrW1x2HY7PoFY69nazHwvpH/3CYU1Zr2zEcO3uMxjbsqoOr
 i3SP7QwhUcd8P01zfJLY0dQ5ZhnLcEtlHtrNi7DB47hz7LuwxE4XuO+l8
 hOMLh4OHjmsMm4bqHQ50JuwzugdGuISBTgvfg02fxO548tq9oqQUlz/kN
 oAZD4YIEiIpZdGsXdDJSuqKbNTRgz+27dQzWNdirLFArdLM8ZPKZ49AaN
 gP29HXOUVqU7ZvNmNCoWP5j6Kmntetgr5xigkCyGQ53Zrt6ywsyxymp7X g==;
X-CSE-ConnectionGUID: qlffbtaoQSaGWjO6qJlKWA==
X-CSE-MsgGUID: 0qjKmSCgQ4O1LD1+2C1zPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29010146"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29010146"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 05:13:28 -0700
X-CSE-ConnectionGUID: K8N519t3SiGQNzO/0yegBg==
X-CSE-MsgGUID: 04/0i0imSR6PN1Pm890slQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="50371332"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.220])
 ([10.245.245.220])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 05:13:23 -0700
Message-ID: <679e9674-9611-48a8-8f94-4285b080d3f6@intel.com>
Date: Mon, 15 Jul 2024 14:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the drm-intel tree
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240612141110.3aebb166@canb.auug.org.au>
 <20240715091234.5e8b2701@canb.auug.org.au>
 <774fa28d-b196-0030-2fb2-5d5fb8a7d1cc@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <774fa28d-b196-0030-2fb2-5d5fb8a7d1cc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Den 2024-07-15 kl. 06:21, skrev Golani, Mitulkumar Ajitkumar:
>
> On 15-07-2024 04:42, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Wed, 12 Jun 2024 14:11:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> After merging the drm-intel tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> include/drm/display/drm_dp_helper.h:127: warning: Function parameter or struct member 'target_rr_divider' not described in 'drm_dp_as_sdp'
>>>
>>> Introduced by commit
>>>
>>>    a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
>> I am now seeing that warning after the merge of the drm tree.
> Hi Stephen Rothwell,
>
> I have already floated changes : https://patchwork.freedesktop.org/patch/604143/?series=136072&rev=1
>
> Need help on Ack from drm-maintainers to merge.

There you go, does it need to go through drm-misc too?

Cheers,

~Maarten

