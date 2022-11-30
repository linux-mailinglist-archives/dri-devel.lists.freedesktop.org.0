Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E74E63D671
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC58210E460;
	Wed, 30 Nov 2022 13:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10F489B99;
 Wed, 30 Nov 2022 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669814211; x=1701350211;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=1J8j29kd3cVprqqNaos1jO/IxAG2mZlw3pbTq9io6Og=;
 b=LZmiLqNCgh5w0M8FGPNOvtYyB7H1rMiK6eaPD7MZHb8+nn2eYibB5LrJ
 AUOMkjYtYXMeR7bvYUz8Mnzga8zlWY/k5nfHvr9onkTPfYuxa/Mt/J6xB
 xNOt4KAK3KaVmU6SV/xg62rRWwwmYicstX/SItkOoisdgAn5fr0GBr/nI
 G8rInH8nXedvTLdgioO3XiV0CtmLitVXtKSPLU6cQoR+kpm0PO/1UKkN+
 yBOhYUNG8DJG+v1MKkeEAW1rI8jv0YFC3Rt/qAJYQlPlm3RSUDn9ugNRe
 /S0lABjE58O1I7KuobNe41s1XMwI133Vbadh65FLv0hFCj70WPnrUZJ0+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295755332"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
 d="scan'208,217";a="295755332"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:16:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="637986386"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
 d="scan'208,217";a="637986386"
Received: from msauter-mobl.ger.corp.intel.com (HELO [10.249.35.238])
 ([10.249.35.238])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:16:45 -0800
Content-Type: multipart/alternative;
 boundary="------------bKayhUs6vIJF08KfYFAq0WQ8"
Message-ID: <b37af070-21f9-fa40-89f5-5a1be6aaa20b@linux.intel.com>
Date: Wed, 30 Nov 2022 14:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-fixes
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------bKayhUs6vIJF08KfYFAq0WQ8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Daniel and Dave,

A single fix to vmwgfx mks-guest-stats ioctl.
I lost my internet connection when pushing the tag, so I put together this mail
manually. I hope you remember where drm-misc is hosted. :)

Enjoy!
Maarten Lankhorst

drm-misc-fixes-2022-11-30:
drm-misc-fixes for v6.1-rc8/final:
- Single fix  for mks-guest-stats ioctl userpages pinning.

Dawei Li (1):
       drm/vmwgfx: Fix race issue calling pin_user_pages

  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

--------------bKayhUs6vIJF08KfYFAq0WQ8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hey Daniel and Dave,

A single fix to vmwgfx mks-guest-stats ioctl.
I lost my internet connection when pushing the tag, so I put together this mail
manually. I hope you remember where drm-misc is hosted. :)

Enjoy!
Maarten Lankhorst

drm-misc-fixes-2022-11-30:
drm-misc-fixes for v6.1-rc8/final:
- Single fix  for mks-guest-stats ioctl userpages pinning.

Dawei Li (1):
      drm/vmwgfx: Fix race issue calling pin_user_pages

 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

</pre>
  </body>
</html>

--------------bKayhUs6vIJF08KfYFAq0WQ8--
