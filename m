Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFBB573E1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD33910E342;
	Mon, 15 Sep 2025 09:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJR574Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93F10E342
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757926835; x=1789462835;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7/gKyXng2FNM1+ylf4/66OjWlHSHjblyoQ7bJIY1Fuo=;
 b=cJR574WxWg0d7eSw83r+C3pEt6oGc8L//0u4zGrapf+CsEraSddhTFwg
 6uoCxKc3T37Jk4gWBQPV7O8hWJt9WSWlVwimf2yCXfLDfufNTF0NB/wbp
 LGxX2DuJbLplzvCtiCxa68YbHP8gj+BgT5G9c4q03XzX05F6gS36ejF2l
 Rrpb5eu7deRtC/+3tdY71x5QJ2uTuFPk+uE16dy6p8Dg2uy1hwBxuwfPA
 ZDvrL+sPo7VsklqzSszC47QEttBAsMwa0PZ3I6FiNjher5vcr4HGYrB4H
 snjqylxLGGAN3aoKVZERW0N8UswD/1uGPmIOJg9B6o1EFu5yJ5OLL7QGu w==;
X-CSE-ConnectionGUID: FU730Fg7QXiIHhIm34J+KA==
X-CSE-MsgGUID: vFf2xImjQf69ynVmwI0fEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77783414"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77783414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:00:35 -0700
X-CSE-ConnectionGUID: fzq1fQLrTiay/X3SOWyPMA==
X-CSE-MsgGUID: cIoewTf7Tk+0UHbk0OVQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174948062"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:00:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tiago Martins =?utf-8?Q?Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
In-Reply-To: <2da1034168eecf015640f84e6e1180b3ae1d3b94@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <2da1034168eecf015640f84e6e1180b3ae1d3b94@intel.com>
Date: Mon, 15 Sep 2025 12:00:29 +0300
Message-ID: <e164367cec1aaeaa00a065628b7ab72c3e12eaa5@intel.com>
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

On Mon, 15 Sep 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> That's not the complete EDID data, though. It's missing 6*16 bytes. If
> you go by the hex offsets, 0x100 does not follow 0x090.

Alternatively, there's extra garbage at the end. I'm not really sure
what happens because we have no logs, and we discard extension blocks
that fail the checksum. (This is something I've been meaning to change
no matter what; we shouldn't modify the EDID.)


-- 
Jani Nikula, Intel
