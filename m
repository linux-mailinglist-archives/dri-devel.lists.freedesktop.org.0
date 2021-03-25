Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287533490FA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F3F6EB59;
	Thu, 25 Mar 2021 11:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224866EB59;
 Thu, 25 Mar 2021 11:43:49 +0000 (UTC)
IronPort-SDR: f9bhK24MhbIIyrL7NdMyCwjgCFVAVxhV6jz5tGbEBVz08vroyr31wfySiXn4AVSyA/7VzAt0Yh
 N7oF3Qx9zWSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="178026875"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="178026875"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 04:43:48 -0700
IronPort-SDR: c1OqmUg9f/MaiybHPiDXQl0yHXMoE4GARgzZLpUDJNBntTSTw2LCmNS/6+D76ARavyktntLIRs
 9aqkcxLV6b5w==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="409334700"
Received: from rabl-mobl2.ger.corp.intel.com (HELO [10.252.39.171])
 ([10.252.39.171])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 04:43:44 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <72d4c9ce-6709-4e0f-a715-79fdcebb48e7@linux.intel.com>
Date: Thu, 25 Mar 2021 12:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2021-03-25:
drm-misc-fixes for v5.12:
- Use FOLL_FORCE and FOLL_LONGTERM in etnaviv
The following changes since commit 6909115442759efef3d4bc5d9c54d7943f1afc14:

  drm/omap: dsi: fix unsigned expression compared with zero (2021-03-17 13:59:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-03-25

for you to fetch changes up to 50891bead80bc79871528c2962d65c781c02330b:

  drm/etnaviv: User FOLL_LONGTERM in userptr (2021-03-19 20:15:48 +0100)

----------------------------------------------------------------
drm-misc-fixes for v5.12:
- Use FOLL_FORCE and FOLL_LONGTERM in etnaviv

----------------------------------------------------------------
Daniel Vetter (2):
      drm/etnaviv: Use FOLL_FORCE for userptr
      drm/etnaviv: User FOLL_LONGTERM in userptr

 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
