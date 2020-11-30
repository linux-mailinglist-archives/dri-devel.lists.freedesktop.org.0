Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237942C880B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 16:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E986E526;
	Mon, 30 Nov 2020 15:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F84B6E520;
 Mon, 30 Nov 2020 15:33:12 +0000 (UTC)
IronPort-SDR: CrhOzpJ6Nm2ptsxcSGaMr2sfx49nYv1sUWSQ2JogO9dPltZLyPRkL4G6UzB+eNsqoqMzxeF+Yo
 zm835GhMCW4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172755191"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="172755191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 07:33:11 -0800
IronPort-SDR: Jq1AKKxoXAEAwnC9KuPFZgFTsqjG4klRDNPLrvRVXkfGYWkwZHv3N8Gnq79Wg+JJI4bF2S/jBZ
 JxtxMGQH2PeQ==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="549143479"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 07:33:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [ANNOUNCE] upcoming mandated dim upgrade due to drm-intel branch
 change
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 30 Nov 2020 17:33:05 +0200
Message-ID: <87sg8qkgge.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


TL;DR:
- On 2020-12-05, drm-intel-next-queued will be decommissioned
- drm-intel committers need to start using drm-intel-next instead
- Everyone needs to upgrade dim *after* the change


Full story:

For historical reasons, we've had separate drm-intel-next-queued
("dinq") and drm-intel-next ("din") branches for development and pull
requests, respectively. This split has not been necessary for a while
now, so we'll finally remove dinq, and start applying patches directly
to drm-intel-next.

We'll make the switch on 2020-12-05.

This change requires a flag-day change in dim, i.e. everyone will need
to upgrade dim *after* the switch. (The details of the flag-day change
are covered in [1].)

All the current dinq related commands and aliases (such as 'dim conq',
'dim aq', and 'dim pq') will continue to work, except they'll operate on
drm-intel-next.


BR,
Jani.


[1] http://marc.info/?i=20201113095658.16655-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
