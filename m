Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E021DB80C
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 17:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A216E867;
	Wed, 20 May 2020 15:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F486E862;
 Wed, 20 May 2020 15:23:54 +0000 (UTC)
IronPort-SDR: XDaXQAt6AT4baR99dVfYm3kNC07io1vYOi13Ww1ygrjvpfsdUrgrnTAlo8BFLhg90s2Qk8bFVU
 ZxswFI5u7Gzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 08:23:53 -0700
IronPort-SDR: AkeQM6LZ3P7X6Oi8bFUdxbhbbvsvujPavT2OPZY5Aa8oNm0QW2ltDRhi5803B9ircrW61/80KB
 0byOG3sFXlVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="253700519"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga007.fm.intel.com with ESMTP; 20 May 2020 08:23:53 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 20 May 2020 08:23:53 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.97]) by
 fmsmsx115.amr.corp.intel.com ([169.254.4.85]) with mapi id 14.03.0439.000;
 Wed, 20 May 2020 08:23:53 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher
 <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: off by on in
 amdgpu_device_attr_create_groups() error handling
Thread-Topic: [PATCH v2] drm/amdgpu: off by on in
 amdgpu_device_attr_create_groups() error handling
Thread-Index: AQHWLqgW9uvuDNiQMEi3BV2xZkJF36ixF+EA
Date: Wed, 20 May 2020 15:23:52 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E2302FA@FMSMSX108.amr.corp.intel.com>
References: <20200520125209.GP3041@kadam> <20200520130812.GA177222@mwanda>
In-Reply-To: <20200520130812.GA177222@mwanda>
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Rui
 Huang <ray.huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yintian Tao <yttao@amd.com>, Evan Quan <evan.quan@amd.com>, Kenneth
 Feng <kenneth.feng@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"off by on"

or =


"off by one"

?

M

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dan
>Carpenter
>Sent: Wednesday, May 20, 2020 9:08 AM
>To: Alex Deucher <alexander.deucher@amd.com>; Kevin Wang
><kevin1.wang@amd.com>
>Cc: David Airlie <airlied@linux.ie>; kernel-janitors@vger.kernel.org; linu=
x-
>kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; Hawking Zhang
><Hawking.Zhang@amd.com>; Rui Huang <ray.huang@amd.com>; dri-
>devel@lists.freedesktop.org; Evan Quan <evan.quan@amd.com>; Kenneth
>Feng <kenneth.feng@amd.com>; Christian K=F6nig
><christian.koenig@amd.com>; Yintian Tao <yttao@amd.com>
>Subject: [PATCH v2] drm/amdgpu: off by on in
>amdgpu_device_attr_create_groups() error handling
>
>This loop in the error handling code should start a "i - 1" and end at
>"i =3D=3D 0".  Currently it starts a "i" and ends at "i =3D=3D 1".  The re=
sult
>is that it removes one attribute that wasn't created yet, and leaks the
>zeroeth attribute.
>
>Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
>v2: style change
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c           | 3 +--
> 1 files changed, 1 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>index b75362bf0742..e809534fabd4 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>@@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct
>amdgpu_device *adev,
> 	return 0;
>
> failed:
>-	for (; i > 0; i--) {
>+	while (i--)
> 		amdgpu_device_attr_remove(adev, &attrs[i]);
>-	}
>
> 	return ret;
> }
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
