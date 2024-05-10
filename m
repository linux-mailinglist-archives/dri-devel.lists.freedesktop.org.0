Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE18C234F
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 13:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092D710E16C;
	Fri, 10 May 2024 11:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFxZj0gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875910E16C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 11:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715340471; x=1746876471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aANSSUvUc/Jg9oLoo6P63WSiKIet7EGu6f4hUvfSXkc=;
 b=lFxZj0gsf6Y47TFCYEtL3suuFDOys1ZWWm5mWJ29+SlR8HIo5SYRQU09
 YxAkJPAXPgitXZRkuMLl/4+6hCavD6gIE8tkycBbOih63N/UeFtsMKM2D
 KdkDLrenEKlB50nmbq36jm/nCI2hG6YaE3g9oENYDGuj+8NbId3XEYw+0
 bjTb6EAfU0mweFdvk574dBmIRQelqd0f+v06vrYEIYq3pnEH9efkZSdRj
 kFP2uy6MSZ4BkatGNT0+cnlb6fhwUfAfpySoFodp5+pS6Zyg1b9KqFNxQ
 83h3Pp3W0BwbxDTT2SnuzzkSXQwhsMSyIkJ0p2TPLlmjQrZCd6HNRfWvb g==;
X-CSE-ConnectionGUID: ripakiNWQryJGz4QolMeLw==
X-CSE-MsgGUID: Bk+/ZKhAT2yAn1MODU9zJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21988054"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="21988054"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 04:27:50 -0700
X-CSE-ConnectionGUID: ocveNKGZTIqcD+m/mfZGtg==
X-CSE-MsgGUID: NlwU2s0wTVeIuf/ciOKKlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29543350"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 04:27:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com, mac.shen@mediatek.com, liankun.yang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add PHY-dp bindings
In-Reply-To: <20240510110523.12524-1-liankun.yang@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
Date: Fri, 10 May 2024 14:27:38 +0300
Message-ID: <87frupj49h.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 May 2024, Liankun Yang <liankun.yang@mediatek.com> wrote:
> Update write DP phyd register and add phy-dp bindings.
>
> Liankun Yang (2):
>   Add write DP phyd register from parse dts
>   Add dp PHY dt-bindings

Please use the proper subject prefix for the driver. git log suggests
"phy: phy-mtk-dp:".

Thanks,
Jani.


>
>  .../display/mediatek/mediatek.phy-dp.yaml     | 45 +++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-dp.c             | 37 +++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml

-- 
Jani Nikula, Intel
