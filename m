Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9BB3BE5FC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E03C6E086;
	Wed,  7 Jul 2021 09:52:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEE76E083;
 Wed,  7 Jul 2021 09:52:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196552495"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="196552495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 02:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="427882592"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2021 02:52:16 -0700
Received: from [10.249.150.24] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.24])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 1679qFWW012432; Wed, 7 Jul 2021 10:52:15 +0100
Subject: Re: [PATCH 0/2] Update to new HuC for TGL+ and enable GuC/HuC on ADL-P
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20210626004522.1699509-1-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <f523332c-ce86-81bc-2455-22239201433a@intel.com>
Date: Wed, 7 Jul 2021 11:52:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626004522.1699509-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On 26.06.2021 02:45, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There is a new HuC version available for TGL and compatible platforms,
> so switch to using it. Also, there is now a GuC and HuC for ADL-P, so
> use those too.

I recall discussion about splitting UC_FW meta macro into two: one for
GUC firmwares and other for HUC firmwares - what happen to this idea?

Maybe we can do it in this series as a first step ? then changing just
HuC version will be limited to HUC meta macro only.

Michal

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> 
> John Harrison (2):
>   drm/i915/huc: Update TGL and friends to HuC 7.9.3
>   drm/i915/adlp: Add ADL-P GuC/HuC firmware files
> 
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
