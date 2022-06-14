Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A954AB68
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 10:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC28510E032;
	Tue, 14 Jun 2022 08:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405ED10E032;
 Tue, 14 Jun 2022 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655193847; x=1686729847;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KZzXxsIQ/BkHZJZFBiewA/lydW7z2ASZ2NCJbI4nX6s=;
 b=FReztXEFdNA3osC6RIuLiy5wK+JnV8uQiVkzXMvclfwJeaVhi/tQx6t/
 g8HYpGWh4gBjz4gYPLMTLsnyv9Y6OTiTMqfldt4UB/Xm6J+Xt9lOpak/+
 RzVGviMe/sSExDwRey/2UiHlVwn3pwiTChlRv22t3wuTJ3qk2pbjP22Mg
 oF5PEMmYMU3Ib3N1np91zDsNVmtTLIVLmNHk5SjS/mk0BDuM5j0DFH8mr
 AmlSdJu6BwNB6EfBz0hNbeeJoFsk4xRxOl7vkixsf1eEcwoayd9FxT3HC
 I8T8llWFuHckNAJyfPG9EvJtiXXPmOcYpjBt3SQ09oJwPNglvYP1dnWCT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="303951782"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="303951782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 01:04:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="640207705"
Received: from arossa-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.114])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 01:04:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm: Clean up drm_crtc.h
In-Reply-To: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
Date: Tue, 14 Jun 2022 11:04:03 +0300
Message-ID: <877d5jzn64.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Eliminate unnecessary includes from drm_crtc.h to avoid
> pointless rebuilds of the entire universe when touching
> some random header.
>
> I didn't really feel like splitting this up per-driver since
> that would have ended up being metric ton of one liners.
> I'm thinking the conflicts (if any) should be trivial enough
> to deal with even with bigger patches.
>
> Also the cc list would have been massive so didn't do it.
> Hopefully enough people actually read dri-devel...

Seems like a good idea to me. FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

Both the CI and the kernel bot found some issues, obviously those need
to be addressed, but otherwise I'd just rely on build results for
merging.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
