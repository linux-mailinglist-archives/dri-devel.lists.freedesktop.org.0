Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC93FC99B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D016E063;
	Tue, 31 Aug 2021 14:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111396E063;
 Tue, 31 Aug 2021 14:19:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="218491667"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="218491667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:19:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="460136303"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:19:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/edid: parse the DisplayID v2.0 VESA vendor block
 for MSO
In-Reply-To: <87wno2avaq.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630319138.git.jani.nikula@intel.com>
 <09f57d55813f916578d1dd1e28bee3a621068bdd.1630319138.git.jani.nikula@intel.com>
 <YSz1AhsVUc7m3Ng7@intel.com> <87wno2avaq.fsf@intel.com>
Date: Tue, 31 Aug 2021 17:19:51 +0300
Message-ID: <87mtoxbss8.fsf@intel.com>
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

On Tue, 31 Aug 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 30 Aug 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om> wrote:
>> Don't we need to check the OUI to make sure the block is the right
>> type? I don't have the v2 spec at hand atm, but I presume a vendor
>> specific block could contain all kinds of different things?
>
> You're right.

I resent the entire series because I added an OUI helper patch. I don't
think patchwork could handle that as an in-reply-to update.

https://patchwork.freedesktop.org/series/94161/

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
