Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C337523C
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 12:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912746ECB3;
	Thu,  6 May 2021 10:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E101B6ECB2;
 Thu,  6 May 2021 10:23:40 +0000 (UTC)
IronPort-SDR: MftYsarp29WMCvhKkVB15nT57FUN7NQab9Haun5zPC1A6BGuKLjuDsNGKHsG9L8qpqilFCdE44
 XENCI0KVS3pA==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178674305"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="178674305"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 03:23:40 -0700
IronPort-SDR: 5I3kMzgzvJNNNpzTYA8mcEXEMTkYotZxmJ4qj06DGbdCqtxoAx3g43W3tlBjbQPe8gjorZSBC8
 S4PLdrEZ33jA==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="434283575"
Received: from tchrzano-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.214])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 03:23:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Andi
 Kleen <ak@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] i915: Increase *_latency array size
In-Reply-To: <YJKq15HgIWQqFeho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210505033737.1282652-1-ak@linux.intel.com>
 <87r1ily9k5.fsf@intel.com> <20210505141830.GP4032392@tassilo.jf.intel.com>
 <YJKq15HgIWQqFeho@intel.com>
Date: Thu, 06 May 2021 13:23:35 +0300
Message-ID: <87mtt8w47s.fsf@intel.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 Andi Kleen <andi@firstfloor.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 May 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, May 05, 2021 at 07:18:30AM -0700, Andi Kleen wrote:
>> What do I miss when you say there is no bug?
>
> We always use dev_priv->wm.skl_latency[] for gen9+. See
> {pri,spr,cur}_wm_latency_show(), skl_setup_wm_latency(), etc.

Granted, we should probably make this more obvious and/or pass in the
buf size to make it easier to see what's going on.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
