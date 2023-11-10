Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97927E7C3E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AF810E076;
	Fri, 10 Nov 2023 12:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D4810E076
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699620278; x=1731156278;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tX1LIC3d6l6mISYMbbsIy2jPTKy76R3JIXQfnWdPr/w=;
 b=Y4NZmiloUAhnpz9UthiXc6mE1v4cTTOkTFbd2PjsUqBNjiZGeFd3khlt
 i/2S4gQICWLWhosnEKJKhSzLMzX3GeyeEmMQmugil9kfkiBe7A8j3+i/N
 faWAvNCdBUVkm8Y+WecKNTWOkXrMjH6FBsYXM55LMzgvpIy69ar6k0Hsp
 5Uuf2MosPqW9HWAH5ZnyF/TU/1QbuMXQ0siZGsGs3/f0fcNjxM7VZ3ocf
 rhy5OJeBkmSfjowSlQti8WYPyoEuye6+YytMPiMZg2gnnjQUt54B0XLmn
 fthP4dG+H5jI73IitL5g5mix77MK5h7gxyF0Y3DEmo02nfrjnPSpLVNfG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3164505"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="3164505"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 04:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713632749"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="713632749"
Received: from ruehl-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.12])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 04:44:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Direct Rendering Infrastructure -
 Development <dri-devel@lists.freedesktop.org>, Danilo Krummrich
 <dakr@redhat.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
In-Reply-To: <878r75wzm9.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com>
Date: Fri, 10 Nov 2023 14:44:32 +0200
Message-ID: <871qcxwzf3.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Nov 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 09 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, especially
>> when no devices are available. This makes it easier to browse kernel logs.
>
> Please do not merge patches before people have actually had a chance to
> look at them. This was merged *way* too quickly.

Also, what's this "drm/sched" prefix here?

BR,
Jani.

-- 
Jani Nikula, Intel
