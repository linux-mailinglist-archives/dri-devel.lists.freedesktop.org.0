Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F7C1FA49
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 11:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9E710E970;
	Thu, 30 Oct 2025 10:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXjr3gC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF6910E96E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761821494; x=1793357494;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Q/XgIGOm4jbJiYdr3gA4Hw69Uike+Itt5DlfWf7Bu00=;
 b=CXjr3gC9/2F233+8ZZrc3W6dKhpH/WRnAPOH8HZYWQR+kK84NverBvRP
 TWxFItqZaKVFU8XYnRKkwdjqBZ/nfbURg7NHbL1NUAiPmfXAMp6wN+mr0
 GNnKl9EWz9SzVfRg/8B7RZw4j7Llg124PPX6SlD5xQbRidj5xiN62b1mY
 adGGJbwAxHPGducV3wbVIRFVlAPW3oI5k9lUvcH6i8hiJRIHJAt/4XgVA
 qaH6WWIGpyCqxeXEyzD+nNcnRjlcS9SOqN8j8xpJOa8spAI7xoK3rIK1j
 S+ONolBOj2x2eXSCTMTP2A2uQyeOB1C3sEJLlXoW3ucBV5OcE6oIq5AYi A==;
X-CSE-ConnectionGUID: dkbuD3wgRpmSfqRz4lhrmQ==
X-CSE-MsgGUID: 39YEhYpiTZaB2UG1neNyGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63991864"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63991864"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 03:51:33 -0700
X-CSE-ConnectionGUID: wk+6kcy7QxC6Tes1SNvyhg==
X-CSE-MsgGUID: w99uFf5UQIq7jL0SjzoTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="189997461"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 03:51:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tiago Martins =?utf-8?Q?Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>,
 Harry Wentland
 <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, mpearson-lenovo@squebb.ca
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
In-Reply-To: <CACRbrPEkT5bqRG_z8C17wNe_nHbDD3+w70iqvRcnmasrTzqxoQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
 <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
 <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
 <CACRbrPEDJa_mMTrB3aGtEsmF4+_XZCrpmRj2TgA2hnhUhroNNw@mail.gmail.com>
 <64f7c8cae1b49f1626fddc536b3a41bf52621e65@intel.com>
 <CACRbrPEkT5bqRG_z8C17wNe_nHbDD3+w70iqvRcnmasrTzqxoQ@mail.gmail.com>
Date: Thu, 30 Oct 2025 12:51:27 +0200
Message-ID: <dd8f7fb7214874e085bf6d17d3b8b881dceda42d@intel.com>
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

On Tue, 28 Oct 2025, Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.=
com> wrote:
> I've tested your DisplayID quirk patch series [1] and can confirm it works
> perfectly!

Awesome, thanks for testing!

Cc: Harry, Alex, Leo, since this issue is present on both Intel and AMD
based machines, could you find someone to review [1] please?

> Perhaps I should just buy a Thinkpad next time :)

Well, I think the listing at [2] is a more reliable indication for Linux
support from Lenovo than just "ThinkPad".

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1761681968.git.jani.nikula@intel.com

[2] https://support.lenovo.com/us/en/solutions/pd031426-linux-for-personal-=
systems


--=20
Jani Nikula, Intel
