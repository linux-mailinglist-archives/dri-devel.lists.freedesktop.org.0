Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95F736D722
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A996E1F3;
	Wed, 28 Apr 2021 12:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF596E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:18:50 +0000 (UTC)
IronPort-SDR: qH47gEu7oPOiapZ2YQDgMOubS5aXkHXXEpJUbvbiVxbvUkVlUvEOp6otk6zkEhRhYtV74J2Bld
 KKf/0XN/2Z1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="258026308"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="258026308"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 05:18:47 -0700
IronPort-SDR: eDm7ab0DkK/pzJoimL2z2SYafvcMD9mAFy6PRaWC46nF21ne50PBsNKTUdekcBcsTLNLwAdLHc
 s2u0uKj0iBZQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="430274743"
Received: from ajalsove-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.247])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 05:18:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Display notch support
In-Reply-To: <YIlOoHcPyk91Pone@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
 <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
 <20210428104403.1e49f270@eldfell> <YIlOoHcPyk91Pone@phenom.ffwll.local>
Date: Wed, 28 Apr 2021 15:18:41 +0300
Message-ID: <87tunq38m6.fsf@intel.com>
MIME-Version: 1.0
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
Cc: martijn@brixit.nl, Caleb Connolly <caleb@connolly.tech>,
 dri-devel@lists.freedesktop.org, dri-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Apr 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Apr 28, 2021 at 10:44:03AM +0300, Pekka Paalanen wrote:
>> This seems more like a job for the hypothetical liboutput, just like
>> recognising HMDs (yes, I know, kernel does that already, but there is a
>> point that kernel may not want to put fbcon on a HMD).
>
> I think the desktop linux solution would be hwdb entries, except we've
> never done this for anything display related. So yeah liboutput sounds
> about right for this :-)
>
> Btw on fbcon on HMD, I thought we're already taking care of that?

This is a bit off-topic, but DisplayID 2.0 defines primary use cases for
head mounted VR and AR, so we wouldn't have to quirk them.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
