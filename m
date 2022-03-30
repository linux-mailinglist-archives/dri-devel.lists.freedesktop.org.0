Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B624ECA4E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 19:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ACA10E58C;
	Wed, 30 Mar 2022 17:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A10F10E59A;
 Wed, 30 Mar 2022 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648660196; x=1680196196;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Km/MN9LUMpjJC7AonAt4cMh3QZkvBxCyqc9DyVLalAs=;
 b=XcgCLkXRmybHu4zCgeGp+NbPsUXLvhPIPRsufLnHnyZXPTspzo7lt+jO
 gGTCIDSBhfkFXYJLT1z9eh7DTbkmjz/IZVKHJevMx/EWbMvyctDYSJaKJ
 zAjwVWeSIW1chEdXWtKNTpq/bl530Rnqyn9RSKdmQ3nTkDrXuafAJ1cb6
 48cKaVEVANuF3GsxMll9QZf+q111Dg49ifbBUaJzf9/zBceVViyNpmNz8
 k8HUPa1UoT+KjoNH+pZa8RXcJBVjtVovVnKSLcVcQ1uvZNFOomC8k/X2j
 aI1zlj2xY9LIajebv3wWsxQXwmxf62rVdAuUlQP+wpNCCx3vMb5S5hH7M Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284506921"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284506921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:09:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="565657031"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:09:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/edid: use struct edid * in
 drm_do_get_edid()
In-Reply-To: <YkSKVRi8g+jGeeSd@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648578814.git.jani.nikula@intel.com>
 <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
 <YkRViiFfSOJQnsoI@intel.com> <87r16jbhdq.fsf@intel.com>
 <YkR5pPQViri6nIep@intel.com> <87lewrbe0n.fsf@intel.com>
 <YkSKVRi8g+jGeeSd@intel.com>
Date: Wed, 30 Mar 2022 20:09:43 +0300
Message-ID: <87czi3bc4o.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> I'd fix this up front so we don't end having to backport the whole
> thing if/when some security scan gizmo stumbles on this.

Sent separately [1]. I'll rebase this series on top once that gets
merged, but the conflict is trivial so I think the first round of review
could go on here in parallel.


BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20220330170426.349248-1-j=
ani.nikula@intel.com


--=20
Jani Nikula, Intel Open Source Graphics Center
