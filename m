Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A91CB22F
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 16:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2C56E231;
	Fri,  8 May 2020 14:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8236E231
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 14:45:27 +0000 (UTC)
IronPort-SDR: 5unPOYSNCHoIfZtfeyBfaHvJKyLg3FOHMrtJEqlqcQ44jKK8EntpiK9bBbQkgzxvBgxuanQxaO
 yt1o9hFsJPWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 07:45:27 -0700
IronPort-SDR: cqpEcHdTL5qne1DldFcJWbKCQonIydNxY4PkRBHApiw8UL8pOZzvsDXhQQz71jHz+xOh7K/yo4
 F0EBQ+Eh1Cpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="251940472"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2020 07:45:26 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 07:45:26 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 fmsmsx122.amr.corp.intel.com ([169.254.5.179]) with mapi id 14.03.0439.000;
 Fri, 8 May 2020 07:45:26 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 03/36] drm/todo: mention i915 in the struct_mutex section
Thread-Topic: [PATCH 03/36] drm/todo: mention i915 in the struct_mutex section
Thread-Index: AQHWJIG9FLoEwQqhDEG+r2WLUmdI4aieRX6Q
Date: Fri, 8 May 2020 14:45:25 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E20C339@FMSMSX108.amr.corp.intel.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-4-emil.l.velikov@gmail.com>
In-Reply-To: <20200507150822.114464-4-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Emil
>Velikov
>Sent: Thursday, May 7, 2020 11:08 AM
>To: dri-devel@lists.freedesktop.org
>Cc: emil.l.velikov@gmail.com
>Subject: [PATCH 03/36] drm/todo: mention i915 in the struct_mutex section
>
>From: Emil Velikov <emil.velikov@collabora.com>
>
>Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>---
>i915 uses the _unlocked version of the grm_gem_object API. Yet makes an
>extensive use of the struct_mutex.

s/grm_/drm_/ ?

M

>
>Did not check how exactly it all work though.
>---
> Documentation/gpu/todo.rst | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>index 658b52f7ffc6..2ce52c5917f8 100644
>--- a/Documentation/gpu/todo.rst
>+++ b/Documentation/gpu/todo.rst
>@@ -157,8 +157,8 @@ private lock. The tricky part is the BO free functions,
>since those can't
> reliably take that lock any more. Instead state needs to be protected with
> suitable subordinate locks or some cleanup work pushed to a worker thread.
>For
> performance-critical drivers it might also be better to go with a more
>-fine-grained per-buffer object and per-context lockings scheme. Currently
>only the
>-``msm`` driver still use ``struct_mutex``.
>+fine-grained per-buffer object and per-context lockings scheme. Currently
>only
>+the ``msm`` and `i915` drivers use ``struct_mutex``.
>
> Contact: Daniel Vetter, respective driver maintainers
>
>--
>2.25.1
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
