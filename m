Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727FB27AA7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 10:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59B810E353;
	Fri, 15 Aug 2025 08:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXrB35I7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356810E353
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755245593; x=1786781593;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=CfUlkHevcJg6532LhLuN1OeyloSvHqIr3YcBdRPxSm0=;
 b=FXrB35I7iXxDsarcI9r3LBFhQ9lKJdfabDPuoI9rWPnBrgffZW+WhocV
 Eup3j5F9Tbxj0CiNa37155/VhvfBzZU9WPo2EQMjgXP8sOW1KrR+vs3ET
 305628fekI15WfuspeOLLM2nhZDQ73nnCXo9qA2T2SzC2/HrC7/KdQL0r
 cMxSsRJcDxCsSfHQV6vQErC0/XhrvKzm9hgzLTNmJP2tmyg1NmCBTxxWy
 nQym+z0tAl8t5psFhqUgPrdFYI8XdvK84j96v16Qnz4IADp/kBSjdVEAA
 IQuEyINbBK/eqvF+A/RAj76R5us+xMBUKN9Lrxc1RGQNNFA60MoFVtfuJ Q==;
X-CSE-ConnectionGUID: 57UavPSwR7G4zY4Up74z8A==
X-CSE-MsgGUID: u9DOWmtORxib77kF/iRM6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61375572"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61375572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:13:13 -0700
X-CSE-ConnectionGUID: 0/kQrM0+RkGSA7tZNtpTNw==
X-CSE-MsgGUID: +Qfm5rT9TYyh/KAZhA8v0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167780022"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:13:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "David C. Manuelda" <stormbyte@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: Proposal: Make CONFIG_DRM_TTM_HELPER a user-configurable option
In-Reply-To: <51e650f7-39f3-4e06-a3ed-9941e0ccb0c0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <51e650f7-39f3-4e06-a3ed-9941e0ccb0c0@gmail.com>
Date: Fri, 15 Aug 2025 11:13:07 +0300
Message-ID: <d78f5ee29decaf595363baf93e0b184e0a7a3177@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Aug 2025, "David C. Manuelda" <stormbyte@gmail.com> wrote:
> Hi all,
>
> I'm working with external DRM drivers (such as NVIDIA's proprietary=20
> module), and I've noticed that `CONFIG_DRM_TTM_HELPER` is currently not=20
> user-selectable=E2=80=94it gets pulled in only when enabling other driver=
s like=20
> `nouveau`, `amdgpu`, etc.
>
> This creates a situation where, in order to build support for external=20
> drivers that depend on `DRM_TTM_HELPER`, one must also enable unrelated=20
> DRM drivers, which may not be desired in certain setups.
>
> In my humble opinion, it would be beneficial to make `DRM_TTM_HELPER` a=20
> directly selectable option in `menuconfig`. This would allow users to=20
> enable it independently, without dragging in other drivers.

You can either enable it in your .config directly, or add "select
DRM_TTM_HELPER" in the out-of-tree module.

IMO convenience for out-of-tree modules is not really a consideration,
because adding new user selectable kconfig options is an inconvenience
for in-tree users.

BR,
Jani.

--=20
Jani Nikula, Intel
