Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8F401743
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 09:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76A789B18;
	Mon,  6 Sep 2021 07:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942B89A72;
 Mon,  6 Sep 2021 07:39:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219928948"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="219928948"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 00:39:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="536560328"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 00:39:01 -0700
Date: Mon, 6 Sep 2021 10:32:32 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/audio: Use BIOS provided value for RKL HDA link
In-Reply-To: <20210906041300.508458-1-kai.heng.feng@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2109061031450.3554566@eliteleevi.tm.intel.com>
References: <20210906041300.508458-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Mon, 06 Sep 2021 07:47:01 +0000
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

Hi,

On Mon, 6 Sep 2021, Kai-Heng Feng wrote:

> Commit 989634fb49ad ("drm/i915/audio: set HDA link parameters in
> driver") makes HDMI audio on Lenovo P350 disappear.
> 
> So in addition to TGL, extend the logic to RKL to use BIOS provided
> value to fix the regression.

thanks Kai-Heng! We were not aware of commercial RKL systems following the
old BIOS guidance, but given you just hit one, then this definitely is
needed:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>          

Br, Kai
