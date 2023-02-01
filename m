Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC06869F4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54D10E40D;
	Wed,  1 Feb 2023 15:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9266010E0BC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675264817; x=1706800817;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Co+f7Vf78df10Ju8htEljf3pm7UP9SaK97ZqGP05ozk=;
 b=WYbxZTynrKz7S1s4Abx/Sh+mVzD3bH3BRQCyL7aJXA9h2fM6L8XAyDtA
 ro3okAbD5lZu//82alAdq3BQplEMhyvOTWAglH+ePlahlD84R381PpFkW
 nd2GGs9HT6XVHUyPVyy5DKBFes5frImTw+nGwjVhi0/tpQiwJrhWa0XOs
 s0bPqTN4mYLrMskFM0FsZGoYAI1s/gycNTPJhyAHLZ5PElnEVP2yuJ7Do
 7TPXjXBqPjOoW+cfJC4fQ8NNVg1PwPnVceFxD5VNeO2TMm2zW36SIWu7q
 hmYoTn58N2k6pwXDeVBXu3Hz0ds2MOT8Fuxa5PlpT3oZ9PKI7A5DjVLRH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308510704"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="308510704"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 07:20:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658344329"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="658344329"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 07:20:05 -0800
Date: Wed, 1 Feb 2023 16:20:03 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: DRM accel and debugfs/sysfs
Message-ID: <20230201152003.GA2623449@linux.intel.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

I was about to send debugfs support for ivpu and noticed that there
are current changes that deprecate drm_devel->debugfs_init callback.

Further I looked at this commit [1], that stated we should not
use drm_minor for debugfs and sysfs. What is quite contrary to 
what drm accel framework did in the first place. 

So my question is how we should use debugfs/sysfs in accel?
Use it with old fashioned minor-centric way or change
the framework somehow ?

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a26

Regards
Stanislaw

