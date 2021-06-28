Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886E3B653A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 17:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F189E26;
	Mon, 28 Jun 2021 15:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873F989E26;
 Mon, 28 Jun 2021 15:20:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="207795570"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="207795570"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 08:20:50 -0700
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="419203320"
Received: from vipulcha-mobl.ger.corp.intel.com (HELO [10.213.225.54])
 ([10.213.225.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 08:20:49 -0700
Subject: Re: [PATCH v3 3/5] drm/i915/display: Migrate objects to LMEM if
 possible for display
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ea351b0a-2c7c-fea5-6db0-f8177ac7767d@intel.com>
Date: Mon, 28 Jun 2021 16:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628144626.76126-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 28/06/2021 15:46, Thomas Hellström wrote:
> Objects intended to be used as display framebuffers must reside in
> LMEM for discrete. If they happen to not do that, migrate them to
> LMEM before pinning.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Looks reasonable to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
