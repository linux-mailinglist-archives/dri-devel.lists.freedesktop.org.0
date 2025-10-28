Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD196C16BBD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0152110E65B;
	Tue, 28 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeA27dsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954CF10E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682203; x=1793218203;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vMnPWw/Ro5XjDPl9UW7RlVIxlIAwYtpN1NkTj+qovQA=;
 b=WeA27dsdKfBzHF5fE50kExDZMjLgU/zh5jNk26SIzA5iX1/mHjZacGKt
 R5ZtO9VQcBvTk/5YURjj1e7jXAK599WZsL/AycdKgbf6kLRt5ESPp9QO7
 dXcFJNqVDqkdETIMeEn2T8RXNC77H50N4PMEBrK7a23yWtnHFoWZa+y0F
 WfcI+Cynfjwo8jvXFWaJxXLX1Nlpk4+CUR8NiMt7w0PgJu4QM799GTukQ
 pRnhm8ebMw6tSb0bsvO4i2qtOzg+ausfgclNI4WLcJAw6BkwVQswNEfNU
 hLzn1KoaT1rmGEGnDlYc/niZhNir90nijTKTIVaB0qCYNghqexTJDqerA g==;
X-CSE-ConnectionGUID: HpC18JahThuEBw12fKtTfQ==
X-CSE-MsgGUID: 4gDZnKs7QceKEbt0VuEuyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63681007"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63681007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:10:03 -0700
X-CSE-ConnectionGUID: /eFrF1d2SIqYOLt+QCBRKQ==
X-CSE-MsgGUID: m2sEBGDATQOcGyjr4ubJ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="184627202"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:09:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tiago Martins =?utf-8?Q?Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, mpearson-lenovo@squebb.ca
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
In-Reply-To: <CACRbrPEDJa_mMTrB3aGtEsmF4+_XZCrpmRj2TgA2hnhUhroNNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
 <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
 <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
 <CACRbrPEDJa_mMTrB3aGtEsmF4+_XZCrpmRj2TgA2hnhUhroNNw@mail.gmail.com>
Date: Tue, 28 Oct 2025 22:09:57 +0200
Message-ID: <64f7c8cae1b49f1626fddc536b3a41bf52621e65@intel.com>
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
> I'm glad to see there are more reports about this problem. Let me know if
> need my getting info about this monitor, or testing anything.

I just sent a patch series [1] that might help. Please try. It's
untested, I hope I didn't botch up anything... I was also getting too
tired to double check the quirk against your EDID in patch 3. Fingers
crossed.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1761681968.git.jani.nikula@intel.com

--=20
Jani Nikula, Intel
