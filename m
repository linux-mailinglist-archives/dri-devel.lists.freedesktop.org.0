Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3426966AE19
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 22:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC4A10E073;
	Sat, 14 Jan 2023 21:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E0910E073;
 Sat, 14 Jan 2023 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673731129; bh=3TmlAYNT5GDcotyrQzGG/ieTPPZo+e5QhheiYHUPMHY=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=AvFRc7+n8i2Nw7E7jr053MWfQ3L+4QV74ebbNGgh02HmrJS7l7Ud4DhvINXL/0abD
 pfbHyHPNKw3yfeQF7xMqkoAxrEXgf1UW5/Ppm5I9Tlo8QvjFoTFObGTT4k/DRHt8+o
 V1ULwSMTT30mchpwgC2/Sju75f070DoziBcPsp74=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 14 Jan 2023 22:18:49 +0100 (CET)
X-EA-Auth: uVnKFoCMuV/obeMLZg8OScqnQxIJEr+NAWTtfpnll7R0imO4Icz5jqfWj1Y0SEym1IVEkawUgpbFlxBdodPz4zy952dcvsaR
Date: Sun, 15 Jan 2023 02:48:45 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/amd/display: Use min()/max() helper macros
Message-ID: <cover.1673730293.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series proposes using standard min() / max() helper macros instead of
direct variable comparison using the ternary operator or if/else evaluations. I
have tested the change using a dummy module and similar simulations on my x86
machine.

Deepak R Varma (4):
  drm/amd/display: Use min()/max() macros in dcn_calc_math
  drm/amd/display: dcn20: Use min()/max() helper macros
  drm/amd/display: dcn21: Use min()/max() helper macros
  drm/amd/display: dcn32: Use min()/max() helper macros

 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.c   | 10 +++++-----
 .../drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c |  5 +----
 .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c   |  5 +----
 .../drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c |  5 +----
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  4 ++--
 5 files changed, 10 insertions(+), 19 deletions(-)

-- 
2.34.1



