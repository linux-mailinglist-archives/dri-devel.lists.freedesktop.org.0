Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844214EE0FD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB5210F489;
	Thu, 31 Mar 2022 18:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1D10F48D;
 Thu, 31 Mar 2022 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752386; x=1680288386;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ycIavbnN5Vq7Lc/HdN8u5JyGJ0thZenvJF0SF4p7i9c=;
 b=GOSmMJkRqVPBmv6cor4FkiCzBWofu+wJokegWQXlEI19OKpnsriEGG81
 sotUnlmEV6aokhde7JgrCXXCmUCKl3Bp3Z+y5zuim5WMez6UkDSXVGb+V
 Ef3nHfQU/KTGLBFRb8pPY04TVIyklxK76jQGS0L27LANmGVzGbSZN1s4U
 yZ4ervmV1n5IK5fTnBhlqm/NbUAjPDO+8SyecqxSUN5y1Y+f67EQyFZVg
 j+Ov87G7dJNw9hQD+O9BhtcnSk45KrAz+GaSalQLHrTBpzwjHsmPA/SO7
 XijoodUUxWqscMYKzTtfm/zGaXbd4m89e9CYppnhCECjuSBDvTYuopgC2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="247422093"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="247422093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:46:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="586546497"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:46:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/12] drm/edid: use struct edid * in drm_do_get_edid()
In-Reply-To: <YkRViiFfSOJQnsoI@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648578814.git.jani.nikula@intel.com>
 <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
 <YkRViiFfSOJQnsoI@intel.com>
Date: Thu, 31 Mar 2022 21:46:04 +0300
Message-ID: <87h77e7yfn.fsf@intel.com>
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
> On Tue, Mar 29, 2022 at 09:42:08PM +0300, Jani Nikula wrote:
>> +	if (valid_extensions !=3D edid->extensions) {
>> +		struct edid *base;
>
> This one points to extension blocks too so using=20
> struct edid doesn't seem entirely appropriate.

Settled on calling it struct edid *dest_block in v2 with hopes that's a
good enough compromise.

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
