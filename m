Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP7oJ/Ofb2ktKAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F0461D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2A10E612;
	Tue, 20 Jan 2026 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK2+AgZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C7710E612
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768920869; x=1800456869;
 h=from:to:cc:in-reply-to:references:subject:message-id:
 date:mime-version:content-transfer-encoding;
 bh=F+DWabZl6xIi5iH6LLpOUpaXsGT055xFXlruElhPR/k=;
 b=ZK2+AgZEMJrvcHb7BF2oTSxew1U9DVPlLklhPx7zquxQbAfS988raJ6T
 K4CsJqa/R26RFXHVB+cctv28HdTxZfCrOStmkTg18kHunIY1WRRicKCij
 djkJZoWT0Ax6tsXc8d8jQULmIVk7xJlFdCLFs/AVjQ1YHDPpZUDnCY1PT
 m4/SwoGq55hQcdKG5vY6/eGBqhlAT9vJFfEoSXDwugrt26pdJ8JKTDKDn
 dZz+n6KxuI4XX6X6jIlg8JlxS0ov+kqUJO3vUn2EvMyFeMq6gVUXt6dbS
 7wzzhjvmX8OOSulq6xYkjyFL45TPLyJ9lVj6aXjhM+IzHc5ABcrDOFoJI Q==;
X-CSE-ConnectionGUID: cU/4mlAtSjO3tcx2LHKEsg==
X-CSE-MsgGUID: iWmYAl0fQ9ak3uV5gFqfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80433178"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="80433178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:54:15 -0800
X-CSE-ConnectionGUID: WckCCuChTvi7AZjytnptag==
X-CSE-MsgGUID: EchR/NK3Rc+4/Ku4s8C0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210286819"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:54:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: ogabbay@kernel.org, maciej.falkowski@linux.intel.com, hansg@kernel.org, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Lizhi Hou <lizhi.hou@amd.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 max.zhen@amd.com, sonal.santan@amd.com, mario.limonciello@amd.com, 
 platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com, 
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
In-Reply-To: <20260115173448.403826-1-lizhi.hou@amd.com>
References: <20260115173448.403826-1-lizhi.hou@amd.com>
Subject: Re: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Message-Id: <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com>
Date: Tue, 20 Jan 2026 16:54:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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
X-Rspamd-Queue-Id: 5A5F0461D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:hansg@kernel.org,m:jeff.hugo@oss.qualcomm.com,m:lizhi.hou@amd.com,m:Shyam-sundar.S-k@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,m:platform-driver-x86@vger.kernel.org,m:VinitKumar.Shukla@amd.com,m:Patil.Reddy@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.intel.com:mid,intel.com:dkim];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DNSWL_BLOCKED(0.00)[131.252.210.177:from,198.175.65.11:received,10.64.159.143:received];
	DWL_DNSWL_BLOCKED(0.00)[intel.com:dkim];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[198.175.65.11:received];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from]

On Thu, 15 Jan 2026 09:34:48 -0800, Lizhi Hou wrote:

> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
> interface to make NPU metrics accessible to other drivers like AMDXDNA
> driver, which can access and utilize this information as needed.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Introduce new interface to export NPU metrics
      commit: 15e19bd95be5c79f2f98b727edda002ba86f8d03

--
 i.

