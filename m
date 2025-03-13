Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D634A5F1B1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B910E838;
	Thu, 13 Mar 2025 10:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iN0T1JWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3A10E20E;
 Thu, 13 Mar 2025 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741863564; x=1773399564;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZpmHv5uC4dr+hhjveEJ2sWXsdbKyqlJNimcLN8wZQbQ=;
 b=iN0T1JWiJdncpaL/0ah6iK3/lVKLpE7pHHYgiXwoYTypR7yk2sOMbXq4
 A6vfhymW56DCVnJQbW3+2I9lyFsc2dPjl2iPSzEcTCyxVh+28NPP0tYqV
 AK6MmcVl7nFwFHkdizYX1MplHKXZ+qgIrURVfTiDy0lPMnAIenuZFAVBY
 OyIq6/lTYQ/YS+Y1ytR1htvIhWeRXqxftSUaKjj9DQv2kWGqt0Cpy1HoW
 xqTW3Co103JAv0xs2U+y4XJ7vFfOjyr2LySlAK25mC+85nXWv/fIHvV0Q
 oDMMJl9i6zGHoyUQzVe7coUMaGcskQMdWfYpEBH5PlEB2ln0JhPmfHdnH w==;
X-CSE-ConnectionGUID: 3pbD/LrxQfm0o6uW1XO09g==
X-CSE-MsgGUID: 8zAZMzYUSTihEZ+C87GMVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30563337"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="30563337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:59:23 -0700
X-CSE-ConnectionGUID: 0oM4srwZQx20QMgjxi8NNw==
X-CSE-MsgGUID: R6OOXVH9TAOYHLLoqdm3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120716004"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:59:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
In-Reply-To: <CAK7LNATYi5HPR+J0cdS33itHUdq5Qd+543X=z+AFyHxQssSJRw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
 <87r03e1lft.fsf@intel.com>
 <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
 <8734fu1arq.fsf@intel.com>
 <CAK7LNATu9OLEANiSzY3Smo=Bm_9M75EDyvmD6HT5kaS2sxRorw@mail.gmail.com>
 <20250305-modest-finch-of-genius-917605@houat>
 <CAK7LNATYi5HPR+J0cdS33itHUdq5Qd+543X=z+AFyHxQssSJRw@mail.gmail.com>
Date: Thu, 13 Mar 2025 12:59:16 +0200
Message-ID: <8734fhdwmz.fsf@intel.com>
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

On Sun, 09 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Mar 5, 2025 at 10:59=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
>> As far as I'm concerned, I find this extremely helpful for DRM. If only
>> to ensure that the huge amount of work that went into cleaning up our
>> headers doesn't get lost.
>>
>> Nobody here claims that it should be enabled globally, just that it
>> should be enabled for DRM. We already have plenty of exceptions like
>> that for compiler flags, checkpatch, contribution process, etc. so I'm
>> not sure why those would be ok, but additional checks limited to a
>> subsystem wouldn't.
>>
>> Maxime
>
> Because we learned this feature is broken.
> It was broken under include/linux/, so it will be broken under include/dr=
m/ too.

I don't think that's a valid conclusion.


BR,
Jani.


--=20
Jani Nikula, Intel
