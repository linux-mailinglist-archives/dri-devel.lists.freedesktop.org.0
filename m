Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C0A90966
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 18:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAF310E296;
	Wed, 16 Apr 2025 16:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ghEDRtDI";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="cVJQGm8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A358F10E296
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:54:03 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G5YQBs010904;
 Wed, 16 Apr 2025 17:53:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=49BH7xOs4LVPR15l2kb5S20/s
 V6Wk5mgmoSRz7WpJ7s=; b=ghEDRtDI2FeVioetzkQpw1XWhMUYdIPda2xuBlTnd
 ZRecAZya5u7/yHFle5nlrV0tvyICqFtRbu6IPW1hnEI39OuynKWtqVmXg9O/kM26
 jIy+RVLWFFTBu7sfM9xKqnSkk2FpD+TZlGlUmGjr+k9PkXpUpZaoGzXrWgYkJQuz
 wRi0EZcEDVvuJz9aqshe8doSrDa4PMJOqvZchnqE9jB+ajXJeZEGWkhwAQMrIZ9J
 gIJaG8x/0r6kVxNAM3eFiTsjbEFaI+i7Tjyalch52Rol520s16QWUQtqiCcW2JmI
 9TEZ8IfDtkLoUbXquUxgGc2svWu/UyyIACVcWXydr6z5A==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010007.outbound.protection.outlook.com [40.93.68.7])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 461y2mgmtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Apr 2025 17:53:35 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqB9r9aM5kdKAyP/J6M+Xfz5wedbw1yhP7oCrgTnNLuWsVgvR1XXRftyIcdnSKCNhmET2KqtoMZ6lG5V8TQHV93tXr7no+v0u2VDKZgRxRNm+yEnOIKIFL+tSZ6NN5+3IGk3yzOLXsFWYcsw+TRVBB2RiNlVTKfer420VfiQdfwIfh9myHxg8cP6C1FdmWGINkzITIqTTZpVAScnpRd1HnruqKQqAj/3zuEeYV7ElT/IVQkLOQvt0VOuAGMmhrMc037PhyOEyEkhmv207NqJzXe1XGMJ5w8U5W8Br5jAaa4gV0nS9GrxBVUBHeYvHjOkHoZGDHRBrh1nSkf0+ejzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49BH7xOs4LVPR15l2kb5S20/sV6Wk5mgmoSRz7WpJ7s=;
 b=c/YUg1ausbvFxgyVPO0sB1JWHa9yjz03pBKO/mW695XwK4ihtgOhZ3jNTUmqE3870duuQ9gXW056lQDT/PFLuO0+yS3OLASnsAXDyW9AyXSnH7UNr1KoXpRzfDVwgCv4CLOkvfcWHVu7NyI+qg4ejZ8bItiyueCgqaDgUCpaA/9+JOEvEU3B2Es4rBlrkyhf7VVm4KltRmxJB2PFmRGbgMo8whfgxl61pxnHlXxa6FubFFIeQS5hiE/q2eRnx7cakJiU+IensXm+DpuSAD/GxVElGJQiiaDRT3L4AUK7XpNioHXbGGsT2bT7s/vu3dnE9Q5A+7CnRJ7llxkmnjLttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49BH7xOs4LVPR15l2kb5S20/sV6Wk5mgmoSRz7WpJ7s=;
 b=cVJQGm8zF0lxnOS8LXCudui7gP01t2FnD3wbWWpOcTpSx2qM62YmE/XNGs8nk23mQxsRoj0hm46lIsdFx3VqZLwFSgjrl0U4Nrb0a6rDkvfoBFrmOBrlzQQRL8WgDP1HEI6cGdMiPRn733aSrXJ0oxR5u8DU8clQkId4LGw/iyc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB6321.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.20; Wed, 16 Apr 2025 16:53:31 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.018; Wed, 16 Apr 2025
 16:53:31 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "jszhang@kernel.org" <jszhang@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "guoren@kernel.org"
 <guoren@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "wefu@redhat.com" <wefu@redhat.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "drew@pdp7.com"
 <drew@pdp7.com>, "robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 13/21] drm/imagination: Add reset controller support
 for GPU initialization
Thread-Topic: [PATCH v5 13/21] drm/imagination: Add reset controller support
 for GPU initialization
Thread-Index: AQHbrvAVnfhhX9uovES9h5ibMx9gpQ==
Date: Wed, 16 Apr 2025 16:53:31 +0000
Message-ID: <c74db6a7-146b-4937-974d-2110b587f662@imgtec.com>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e@eucas1p1.samsung.com>
 <20250219140239.1378758-14-m.wilczynski@samsung.com>
 <60914de9-f507-4099-be53-ea1fc282c537@samsung.com>
In-Reply-To: <60914de9-f507-4099-be53-ea1fc282c537@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB6321:EE_
x-ms-office365-filtering-correlation-id: 5a8bcd83-aef0-4940-8ca8-08dd7d0737fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?OVVLeDMxVHVuU3dPVjdpeGxNdnNCd29yZ3pHQXh6OUxNTndjaDhvM1NLWk5z?=
 =?utf-8?B?Rzh3ZU85VUdCNDJ4NWNBQ0toM2xpNi81amJsZkFUNmJPa08rTVlzeFh6cFgw?=
 =?utf-8?B?SHpxSXd0em4xK3ExZ29HbndPUHMvT1RSY1ovZWs1ZCtVdDFPa3B5TzFjOU9F?=
 =?utf-8?B?QTNGR0g3d3UvNjNsc29NV0VtWG9TeUhxMnJJMHd4MmhwMGlwNkJ1MDgrMEt5?=
 =?utf-8?B?YWx4TVRpNFpzaURINGpLSFVqUkxqL3RyQmJMbU9hNlZhUGZwUlMwM0ZPTWw3?=
 =?utf-8?B?WkdxdFNtZXJRNkI2dUxleTB0RHpJMzNQc29lOU9iRWZuTU43Z3FNZ1U3U1Vm?=
 =?utf-8?B?VjZKb2x3a2tMZ1hPbm1pakMvWU45L1BHUEJRbTlIajJzdnlaeVZhMHdaRmFy?=
 =?utf-8?B?YzBJNVNwanl4NFFqQmZnQU5DaHJvd3QvV1p1RDYxSS9SajNjWldUNmNuVmlX?=
 =?utf-8?B?VkhldmxhenEzZ3NwMmRyRU5zYVdQVUMzNytBSnNObFpqQzlVak1tcXFzN0Y3?=
 =?utf-8?B?RmhlQmdDaTA2L3RERFRPS1RWL2NMVHJMbVorRlhBb2FJR3dqaDB3SVpoWkR2?=
 =?utf-8?B?MHJ6cXZMeWp1aEFGaHdkOHFHb1IvZGI0QTV1M2crdWpiVStyU3l3UVZVa0Ur?=
 =?utf-8?B?djdTYnlEVWlPWENUTitBWVhqYlpZMkJCUUNycnhiWEtobWVkRlR0TVI3N3pN?=
 =?utf-8?B?OHRzQTJVQmoyUG95NWdETmFSTW9TeXM4YkpvV1AvQ3RndkQ4bkQzWGpTbzFM?=
 =?utf-8?B?NGU1NUJWV0p0a0E4bmh3VG9ORU5mUUJsNFkwRm40Ky9QVVRCSkx5WkJmVEdm?=
 =?utf-8?B?SWZGZzFUcFFPWmcyRzVMaUVKK1NCZmN3eE5aa2IvbFpScjVITlRvb1kvbFJp?=
 =?utf-8?B?RVQ4MFZOVkc5RXpwbHU4akd5QmRiZ0JtQmFSWE5lRmRQdi9WemtpbTR6UTdY?=
 =?utf-8?B?SjNHL2UzWVlEQmc2WXNEeHdYNFpuTzNjT3RaUi9mYWtKMGhTVDc4SW5INkRM?=
 =?utf-8?B?Q0V2V2dWdnc4UFMwRDNsUVFkQnVsVm1yKzNYUFErc205M0p0U2FHcjlGNEN4?=
 =?utf-8?B?SHNyT005TGFxblI2RC9VNFVqWSs1Ny83ekZGMFNQUXJEcEs4eWhzYnd1V3pY?=
 =?utf-8?B?SEtNT05ub0tNaTQzYUM0TWh2WDFuRDcxWUJINno5d2lzRXlPSDFlNnlBdzJy?=
 =?utf-8?B?NU5EN21Hd25nVDVPelUvWnR1bGJMNFk5Qy9LMDlWS3JqQis5VGZWazlrQWlH?=
 =?utf-8?B?TWYvREM0UGs2bnYyclJHNFhPM1dJbXhLeXdRWXViZkhXNE0zamEyeTVwOUlJ?=
 =?utf-8?B?OGlvU0RzQjdhWFhtOXFzdGJ0UGtrUHhSYWVFaWdNcGlMZEVnRGhsLzZ2Q3pT?=
 =?utf-8?B?N1ZGblovUmJVVjA2WW5oUkZLUEVxcDNZL3dQTVhPNTdCaGh1QkVoS3NYdGVE?=
 =?utf-8?B?RVRiYlZVanpWL0tLR1ZjS1BQNmwvSHlqNHZvNitVMFBVVlFSRWh1bVNRVWEx?=
 =?utf-8?B?bG82eVNTTG1MODA2RkFZSmdObDR4WS9JNGp2T0VsRjVqcW9JOXE4c1laalpr?=
 =?utf-8?B?b1hrWG90ekdIVC9sVU9rNXcyWDNrVVJoUFg0bUFFTnMyVGFzdjV4dlZMQ1RO?=
 =?utf-8?B?YUptbXc2Y09UMUcvL1kzNWpFNS9zTCtwUFo0eHVmNlNLeXJyd3BsaEIyQWlJ?=
 =?utf-8?B?T042SHZWMldRZUlUc1A1a0cvWkp0TytTZWJKZVhwSmpON2Z3anNTL3hLTm15?=
 =?utf-8?B?RmozaWVyKy9CQkYwaHIzSEgxWXRaQnBaSGJTZTFwNnlLemVXY2pBV29TVldz?=
 =?utf-8?B?aXArK0labUE3SmtHaXhtdTNIdFZqUzhFWVZBNGZKejM3UllwM0F3ZGdvdkMx?=
 =?utf-8?B?ZmU2WDl5TFVVL0FzczFGL0V4QjAyZ2pCZTBmNTJYYXIzUytNeGZUVUl2SVhE?=
 =?utf-8?B?VG9FZUpZdExIRm13aTBGS0JFQkV1dlZnNGgwYUZpemdlWk10KzY2SVFPZlFv?=
 =?utf-8?Q?4GnpHom2pKX4+IWTOzlpz9ZRaD/OF4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWhkTzN0WHdDTTg5YlpSVVNiOVNvMWlWSGVUQmUzaHBURUlUZGFVMVYzOFFq?=
 =?utf-8?B?WFRoVVQyZGRoQ2xEV0REdVh4cmpwUnpPQ2ZxVGhDUytEVnZkRDNMNWI5bFB2?=
 =?utf-8?B?OEZpQ2tpOVBhOFVQZFhMcDBma2R1UzQrYlZjWFlvTGk1Z2RxNTYyTkZMQUxi?=
 =?utf-8?B?U1RUT01CZ0dHMFNVUnFSOVFsVFFXMWcrYmFPaG1qMkMwQ2N1Mm9UdGJTYVlX?=
 =?utf-8?B?R2tITGVYTXZMYVU5bnF0NEZadWFFQzRCZ1RVZ3ZVSHMxMFZwdE05RkN4YzlZ?=
 =?utf-8?B?UVIvQm5aUzB4Q3k3TjZ3R0dNUENXU0laZDVnMzM1dXFuMCtFUmdZZ3NXUEND?=
 =?utf-8?B?czFoM2FBSDhBeUt6MHkvVDJiY1Uya2JuOWZvV2dEYlNUZmkxUm9SVVE5RkJW?=
 =?utf-8?B?bXI4WG56M1pwWlJ2eGg4MTc3aUwvSW00QWZBZHhEcHhQLytCcm54eWpxam9I?=
 =?utf-8?B?bUpFU0UzK1hwL3QveXR3S0Y1djNOejRHVm5ibHFGVlRvQXVESm94clJiZ2R4?=
 =?utf-8?B?L3A3MUJnM01qOENRdmUrbzdYUTVJSlBOZGpqSms0QzRhLzJjekxlYlNqZUJK?=
 =?utf-8?B?a3pWKzlMMnNMeFgzOHpwdlJER2ZtbWhaS2ZueUpJRFZLeTgrbkdXVXBGUnVJ?=
 =?utf-8?B?ZmkxUm9tblhGSjJMMmRadVo2OEUvSnE2QVJYRy93bzRvVkhlSUtoN1c4dTBZ?=
 =?utf-8?B?Zk1Ob3lUeWdxK2NoR1BKQWxxRnhjMGhxbXFNVksrQUxLUmUvQkwxbitqblls?=
 =?utf-8?B?cHFUcGRtVi9OKyswVnF2QnNScmU5eVRpbE1UaHJJbWgrUzdKL2VUdkJnSTVY?=
 =?utf-8?B?SEtWUmsxcEw1bXZXeHRNbHVibi8wdnNWbWw4ZHV2azRYYVdRWWo2MkpzTytq?=
 =?utf-8?B?R2tPLzVPNVlPeS9Cc0VTSTVWUzk4cWpBZXhDUEFnUkEzY3UxeWFrZTZwVHJZ?=
 =?utf-8?B?bnlub2hBQ3pKQ2xzM3RBYU9UWEI1M01KN0tIbVZIdkI5Q0dvdEtRSzZ3Vm5S?=
 =?utf-8?B?QzVDaUVaSEF0UDdqZWpmeUYxN0RMZjIxSklxSVdqM2gvYmFybGgzdEFFTi9r?=
 =?utf-8?B?Rmo0V1VLQlA4MjlURTF1RkNsaXNlZzlKMFVCckhkT2txNlJBejVMM3JQbU5P?=
 =?utf-8?B?NDZDcHloNWtiOXlDWHQ2eTlHQnF1ejdGVUFmaXBoUWR0bUZtUUxQMmlHSHZ1?=
 =?utf-8?B?d1RsMDFuUHdFRFJUMldLQVlPWnpVYWpCWGdtdXVpamoxeXZZNjFDTXgzaWhU?=
 =?utf-8?B?SzMzdWVhRHpqelZHVkRGbHBRUnVvVitNNHZZMWp0bUhFSGZNWmhJQnJMRlg5?=
 =?utf-8?B?Y1pRYVIrY3BhQU1RdlI3TzRRZ0NVMzZsSmhOaXFHcG9URWlPbXdRV3ZIeElX?=
 =?utf-8?B?NmhFUFR5QmRXN2hKTThhT0pRRWJ6MCtXNWpPV05PNVl0RzdiUldwMmJ3VTdn?=
 =?utf-8?B?cmx6ZHNDV0dYUjlVS2pzSnFKZkU2Y3dIUnlpaUtIMzBpZ2hHTGE0c2tKMVNG?=
 =?utf-8?B?VVFGU3ZmMnpISkFBSU5Kb2xkVkRkVmZYRXIvTWtwY3B5NXV3NDBUS2N3TXF5?=
 =?utf-8?B?NXhrVldWUVhnM0JiNzRTMjZFblhOOWdqK0o5MDFNendsN0tWeWlCSk1vRThM?=
 =?utf-8?B?aGJQOWFQNitpMEVwWVZiWDFXVy9USlZoWmhBYVo5ZnFVRnFwUXpvdDZuODNW?=
 =?utf-8?B?WXpDN0dQajBiTGQyajBjK0RuSnRvYmcyMnhrUlVBSENOY0hOWkVSVTRWeHZa?=
 =?utf-8?B?MG8wWDdQbjhPSGpISS9GYnRKQWlSZGxJZXh6WGV3N2JxcEZOWWdDanhyS3lB?=
 =?utf-8?B?ZmxNcUhpcWhsbEZtU2ZObE9waFQ1WVczSjdZSGlMcjk4YnVVZW50Skhrc1di?=
 =?utf-8?B?NGxEb2htdmRWS3NoR0htUmN1RHJ0MmlYakdDQWpSYVZUUFV0VC9KT0E1eDNw?=
 =?utf-8?B?c0JDWk1UM3czUUdxOTArZ0JFYTRtWEJ3Mk9sL2NuSHgzYkNtMUt3Z2cwR2M4?=
 =?utf-8?B?SEpOQ01rYmZSc2dBNW5Eb1dkQ1dOVW1BclluMHZTanEyOUcwZzRHSTFkbzFt?=
 =?utf-8?B?NWpJSFdKRXNJMDJlSWJ2d0Z1UmpFR3dVUmxYTHdpNFB1Z1VqM1oxeGswVnBZ?=
 =?utf-8?B?WnlKQUJ5S2hnOUlWSlAvT0NIck9hR3RtUVJPaWZETDY1RnVKWTdkS0RPVDUz?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3bbxVraumoGi2fJRQ3W4IyqC"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8bcd83-aef0-4940-8ca8-08dd7d0737fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 16:53:31.3518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dCJlh8BsQNgI5xUDAMaCGFEYLS8AVJu+UcbnsnMKw4uIOeTjw/UVr3j2Aicj4HfFxnavqyKGnJh9aYaetBTN7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6321
X-Authority-Analysis: v=2.4 cv=LbU86ifi c=1 sm=1 tr=0 ts=67ffe090 cx=c_pps
 a=NemD1F2luIWN0MFc5Cn7GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=HeIl7KPV_oWCO7BD_oYA:9
 a=QEXdDO2ut3YA:10 a=yvwrtV5x0iyCBtp8CqIA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: mKPNdfxSzvEJDvha3RZYXcfW6bZOWSx3
X-Proofpoint-ORIG-GUID: mKPNdfxSzvEJDvha3RZYXcfW6bZOWSx3
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

--------------3bbxVraumoGi2fJRQ3W4IyqC
Content-Type: multipart/mixed; boundary="------------LpNi1Hs9Dq38QRgXf0Ws2hpK";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: frank.binns@imgtec.com, p.zabel@pengutronix.de, m.szyprowski@samsung.com,
 linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 linux-riscv@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch,
 aou@eecs.berkeley.edu, dri-devel@lists.freedesktop.org,
 ulf.hansson@linaro.org, linux-pm@vger.kernel.org, jszhang@kernel.org,
 palmer@dabbelt.com, guoren@kernel.org, maarten.lankhorst@linux.intel.com,
 wefu@redhat.com, paul.walmsley@sifive.com, jassisinghbrar@gmail.com,
 drew@pdp7.com, robh@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 krzk+dt@kernel.org
Message-ID: <c74db6a7-146b-4937-974d-2110b587f662@imgtec.com>
Subject: Re: [PATCH v5 13/21] drm/imagination: Add reset controller support
 for GPU initialization
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e@eucas1p1.samsung.com>
 <20250219140239.1378758-14-m.wilczynski@samsung.com>
 <60914de9-f507-4099-be53-ea1fc282c537@samsung.com>
In-Reply-To: <60914de9-f507-4099-be53-ea1fc282c537@samsung.com>

--------------LpNi1Hs9Dq38QRgXf0Ws2hpK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16/04/2025 15:25, Michal Wilczynski wrote:
> On 2/19/25 15:02, Michal Wilczynski wrote:
>> All IMG Rogue GPUs include a reset line that participates in the
>> power-up sequence. On some SoCs (e.g., T-Head TH1520 and Banana Pi
>> BPI-F3), this reset line is exposed and must be driven explicitly to
>> ensure proper initialization.  On others, such as the currently
>> supported TI SoC, the reset logic is handled in hardware or firmware
>> without exposing the line directly. In platforms where the reset line =
is
>> externally accessible, if it is not driven correctly, the GPU may rema=
in
>> in an undefined state, leading to instability or performance issues.
>>
>> This commit adds a dedicated reset controller to the drm/imagination
>> driver.  By managing the reset line (where applicable) as part of norm=
al
>> GPU bring-up, the driver ensures reliable initialization across
>> platforms regardless of whether the reset is controlled externally or
>> handled internally.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
>>  drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
>>  drivers/gpu/drm/imagination/pvr_power.c  | 22 +++++++++++++++++++++-
>>  3 files changed, 51 insertions(+), 1 deletion(-)
>>
>=20
> Hi Matt,
>=20
> This commit, along with the corresponding change in the DT bindings,
> doesn=E2=80=99t appear to conflict with the work you're doing for Rogue=
 series
> enablement.

Agreed, it still applies cleanly on top of drm-misc-next after we landed
the BXS series.

>=20
> Would you prefer if I re-send them as a mini-series so you can consider=

> picking them up for the next kernel release?

That would be ideal, thank you!

Cheers,
Matt

>=20
> Regards,
> Micha=C5=82


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------LpNi1Hs9Dq38QRgXf0Ws2hpK--

--------------3bbxVraumoGi2fJRQ3W4IyqC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ//giwUDAAAAAAAKCRB5vBnz2d5qsJQX
AQCIH3DDZLfQgm47Y2OoZWbKPy9xpV7MMB8qQEzDe0wnrQEAu7V4VWYaezrbJWvCy/FNmr7GJ4ru
JSNTbJfgJozbtgg=
=cpD4
-----END PGP SIGNATURE-----

--------------3bbxVraumoGi2fJRQ3W4IyqC--
