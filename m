Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFABC245F9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E40110E196;
	Fri, 31 Oct 2025 10:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9uO33aE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F05310E196
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761905628; x=1793441628;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gCxYbZKZRdLmHWLTrxNB8yWYfg08uE7xbjE/pKQQK9w=;
 b=M9uO33aEbgDeTdJ414zanjhAad6L9k2BdGx2Nq/Z4VqjzAYGYRmjrAlb
 g/VwqlpoZURBR+U7Kx2rBDbdCxJxdo939VGHjUO+LPQhXqcn28D/HvJtT
 n5K5NMelNestibWVuglEo17fVuHgh8q8R3Pa3FLZRdHdVy9PR3tAEbKWn
 /O3kNi7zmKVGddP8gufBG4GuWNgqjTd83qo/DfphEhJZP1YkbrNBN0sq5
 kbrJw3vYs5nSpAjqXCDnfWrdnrsV6WT4nV5ZlrNqX+PlwJgtaXD/p6/pF
 x6t36VIBCeuh6/1yWzixaR6CLnB4v0Uagf1OoT/ym8GOhSIp2w7WecTNZ Q==;
X-CSE-ConnectionGUID: vHWplZe2RjasFJvDVOvjcA==
X-CSE-MsgGUID: lLUI/lLETlKPRSu5BEbf9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63270948"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63270948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:13:48 -0700
X-CSE-ConnectionGUID: u0qdtMqPSYKiTjl6FkDMig==
X-CSE-MsgGUID: R8MDj+tgQYa0/dVaoJiHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="216855397"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:13:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tiago Martins =?utf-8?Q?Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
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
Date: Fri, 31 Oct 2025 12:13:42 +0200
Message-ID: <b009275b35fdc8536ea80689ce46425b0bd1b948@intel.com>
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

May I add your

Tested-by: Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.com>

to the commits?

BR,
Jani.


--=20
Jani Nikula, Intel
