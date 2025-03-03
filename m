Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47EA4C271
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454C110E41C;
	Mon,  3 Mar 2025 13:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxPAwHC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D522E10E413;
 Mon,  3 Mar 2025 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741009985; x=1772545985;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TNhLVKKg7mgrhaXogzcKHNa5uVOgg882a9yCcqvBM3E=;
 b=SxPAwHC2VPq6ESXOHsiy9QULEsVN1UlOb3PIMnQU4yo2/qvRuhY/8FHs
 XyxWTBbzkd9dMegxmvaBCqW0S3Bdg2Dgs7A9mmOPKPs0EfcgEQraliYDl
 KwGNd0wIfYVjp6xB0uMmIzyYUESrOd+RIGAw4miLtJEv49+w+1bM/Ce6O
 WInDWEPI2u8XXcyDdfFkRUL78aloIIQF22YSUGVs1Tq/vul3oBI+1+3qv
 wnyw70foBcivVKXGWVB2ORZVIFVSX+TGdWrcdAgz08EH/3J7gPELcNk+h
 37mDq7VeNnufFOfq9p0cJk6Nos7/CRNDKuJJLGCxPYXPwpgg7Z1HIoCHc w==;
X-CSE-ConnectionGUID: h7/rNVtOQumK1KpWYbiq0A==
X-CSE-MsgGUID: gyq7Glu+RDOluLOR6tSl0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53276185"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="53276185"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 05:53:05 -0800
X-CSE-ConnectionGUID: /VL33A33SR26Wi7sCeBEnw==
X-CSE-MsgGUID: xuAQNdn5QpeVb7F0FusYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155197923"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.144])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 05:53:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
In-Reply-To: <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
 <87r03e1lft.fsf@intel.com>
 <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
Date: Mon, 03 Mar 2025 15:52:57 +0200
Message-ID: <8734fu1arq.fsf@intel.com>
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

On Mon, 03 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Mon, Mar 3, 2025 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>>
>> On Mon, 03 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
>> And one of the underlying goals is to make for minimal headers with
>> minimal includes and minimal dependencies, preferring forward
>> declarations over includes, splitting functionality by header, etc. It's
>> just that doing that often leads to broken headers, unless you actually
>> build test them... and here we are.
>
>
> What I learned from my last attempt is that we cannot avoid
> false positives without adding a lot of exceptions.

All of the drm core, xe and i915 headers build fine without
exceptions. There are no false positives. (*)

> We can never be certain whether you are making DRM headers
> self-contained for valid reasons or for hypothetical, invalid ones.

Please enlighten me. What are hypothetical, invalid reasons for making
headers self-contained?

IMO headers should almost invariably be self-contained, instead of
putting the burden on their users to include other headers to make it
work. It's a PITA in a project the size of the kernel, or even just the
drm subsystem, to track these cases when you modify includes in either
users or the headers being included.

The exception to this are headers that are not to be included directly
by users, but rather by other headers as an implementation detail. There
may be such cases in include/linux, but not under include/drm.


BR,
Jani.


(*) Fine, there's one *intentional* special case in i915.

--=20
Jani Nikula, Intel
