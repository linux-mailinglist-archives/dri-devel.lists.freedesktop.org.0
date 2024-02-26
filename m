Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDC86743D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27FD10F0FB;
	Mon, 26 Feb 2024 12:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGeiQY/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B16710F0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708949039; x=1740485039;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0Ag07OET7Kpj3p09B0v7440GRo9FCkq0ZojZsgcVstQ=;
 b=eGeiQY/T+51JTv9KQod3TY2Vof/VLftnAYH8BZIWRsXCBAcQbRXyH9VG
 uIwOPmXvL/2dfbx5IDInsTCyNqqm4fhcNoo5kKhfMZ3Q0IqY/uSnrH6UT
 a9WxdEP2O8jB19HVmrUh1nWWGID6/IXrMBIBOfdte4gos1cJs6YtxIlU0
 S7U+Lj3aDXnhDMQ4QDaCeBAhmFH2kX1s6vQpomCMfnBLiOHcTu74HhAqf
 dqVyhNUYrEp+vC4ptUIBeVj1zg2jQWJRrgZBdKUn9E5+8KPJ5+G6Vwk7E
 0wHBhjoxKDi5fpENqOwIvDLQWWji3uJaTx1TIKhsZEU4sjwH7hPWqhU1f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="7011640"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7011640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11278457"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:03:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
In-Reply-To: <CAPj87rPB9+o1g8gJyZk3m2DLhW=FC+3m5Nrm=Mxq3SwqxX3KCg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <87bk83o3y3.fsf@intel.com>
 <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
 <871q8zo2tn.fsf@intel.com>
 <CAPj87rPB9+o1g8gJyZk3m2DLhW=FC+3m5Nrm=Mxq3SwqxX3KCg@mail.gmail.com>
Date: Mon, 26 Feb 2024 14:03:53 +0200
Message-ID: <87y1b7mnyu.fsf@intel.com>
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

On Mon, 26 Feb 2024, Daniel Stone <daniel@fooishbar.org> wrote:
> On Mon, 26 Feb 2024 at 11:57, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Mon, 26 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > For the recent-ish subscriptions, it's possible since we've required to
>> > open a Gitlab issue for a while, so we have the association between the
>> > Gitlab account and the SSH account already.
>> >
>> > During the Gitlab setup, the groups were also created already with the
>> > people that had an SSH account at the time, and Gitlab account.
>> >
>> > But for the rest, yeah, I had to ping Daniel S. about it. He could find
>> > a few matches, but there's some where we just don't know if or what the
>> > Gitlab account is.
>> >
>> > Generally speaking, we've been conservative about it, and only added
>> > accounts we were sure of.
>>
>> Ah, I didn't make myself clear. I'm more interested in the process going
>> forward, for new access requests. Anyone can create an account and
>> request access; how does a maintainer verify the request? For our
>> purposes it's basically just matching againt the email addresses in
>> existing commits in the repo.
>
> It's a fair question. If you want to verify that someone is
> @intel.com, maybe get them to email you out-of-band to check it. If
> you want to check something else, just ask an admin I suppose.

I thought you wanted not to be bothered with access requests! ;D

BR,
Jani.

-- 
Jani Nikula, Intel
