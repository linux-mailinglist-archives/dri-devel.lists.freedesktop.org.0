Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6996286A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB22610E515;
	Wed, 28 Aug 2024 13:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="MQF+pp4L";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="hHKN7uCA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5E10E515
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:17:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S65SJQ027701;
 Wed, 28 Aug 2024 14:09:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:message-id:mime-version:subject:to; s=
 dk201812; bh=+zvV9byuqDMnVUBdDzwRq4xcdd0a3cR2UBm1oXNHWhQ=; b=MQF
 +pp4LCQhznYfZ/OTuhxdXCZ5RE54j9+KTXY8J2ShY3gOtsS9UB3aGMjuScg0mlTx
 SxWlSp5O+lC3SINTWiu2qXqxsbN6K5wvCVVCayUCwsE/yNJ0H+Zz2756fPBzXIbf
 0cwH6ZyNGL9vVc03CQiNNCA1CK7MvRYVWa5gDoAXupqIUxzmuYnMxybt2f6rt1b1
 J4D6Ohyhs1E6LJoFuoBQf1TK1qq81drxkxsDxUjm8QxW+KQuFRnNR1SsNx3pNyGK
 6lQ2ouEMA2+0RGiG1xuRgAGB7eAMfoTPYjUWxYCsAbkbumRpm2K49Q6SvZnFxLmr
 hdREjUsqAqDRWWc23AA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4175ss31pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Aug 2024 14:09:15 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 28 Aug 2024 14:09:14 +0100
Received: from LO2P265CU024.outbound.protection.outlook.com (40.93.67.27) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Wed, 28 Aug 2024 14:09:14 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obbQoJ07ntu1hrNCfFlWwo/CaP8aIzQ7SRcM/1UZohEqWFKmHVilcV1j7Sp+a9k+DvNeVfwVaHAb2pqRrBhgg0fn/6Sjs9dtxb/elUWcyHMI+3+LryQo7iIYsZaeyz9vb68wbyGphnLQlV8KherHW6s5Q16W2b+A/mXJbs9kvwcSaWm5MtrBU8obwEeSC9VdTdDhchwjnjnCOLU91zSizLB7II4Oc6pnJE7EQfJdpQSgcfgFAvfJ4ishUyPqZ7QLzOHuYK1t4xoqYhcNI17Cu4KRwBk0L3FONPJOoERi3O+DTX/WyvhCXkSz+Vp+1V2MAJ8alNZR3qhJN4MyK7ScbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zvV9byuqDMnVUBdDzwRq4xcdd0a3cR2UBm1oXNHWhQ=;
 b=dH+d2DuJ4xGEvNnEgSMCdkxsqVhjmmekFXta8FzhSFHQMljUGaZhIld1tae0V7AYc/UlDNE3IGwmwP6kJsFKmhLfAWfpr+Ar5J6Oz4XJ2z7ZdQ7KuUGPmLrrdycROJnqRT4h0P09jg4q46iJ1HcqDKB3Iv6kG6YRurNDlT8L5uB7aSa1Uvawi9Z/fzADgEdDiz4tGLrzyYqthQXL+vhZHwOTz4EB3rSkn/qBHtkAI6/Zvq2s6krO7hSXywnFyjCuN2k815CGE8cFfpvPVFv591zQWmk0ar1GrGUpoCn+70HEvcZjefUPJI7EdLG8Cxnyc4GQh0pYoPcAnxSm+j/+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zvV9byuqDMnVUBdDzwRq4xcdd0a3cR2UBm1oXNHWhQ=;
 b=hHKN7uCA+89NXoj3WJ5+egIoz0MUb5BPM/ysvMb0DWGD9rjKXsDdps1H1BFqn8Agxa26lAf0wNBCxPXG/eWLiaRoycKRItjiV8oss85fFURKzxsrZG4AqR1xiL4UAg5MYQ+TEX+BspnuSYEturxRUfqrRYUWdLKxUkGu5QjTC14=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2642.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.27; Wed, 28 Aug 2024 13:09:13 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 13:09:12 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>
Subject: [PATCH] drm/imagination: Use pvr_vm_context_get()
Thread-Topic: [PATCH] drm/imagination: Use pvr_vm_context_get()
Thread-Index: AQHa+Ut63vojNAp1DkeCGFbhPXW9+w==
Date: Wed, 28 Aug 2024 13:09:12 +0000
Message-ID: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2642:EE_
x-ms-office365-filtering-correlation-id: 04499bb8-5b48-4471-fafc-08dcc7629c9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmNxeHk5RjV4QnlxTkRoV0Rzb3p0NzM5aWFOckppalhWUXN1bDRIU3l5MDFT?=
 =?utf-8?B?Z2ZBWXJhQThVMkt3d2ZYZE9qcFVxQXVwTEtPbXNyM3p1RWRrWE9OYlJWakdx?=
 =?utf-8?B?b3Q3dVZDdkdMY2xCTHJnUGsvVUpNd3d1ZzlvenBJcDR3Ym9zMkdlZnhYQWtX?=
 =?utf-8?B?WmRmRDY4N3J4QXdQb0pKYWlNamhvQVpHVXFYb1VrNDFZVks2Ry9GbEJjYmYz?=
 =?utf-8?B?L2dPbXgvcXR0TG9md2c1REVEajkxc0JiQ3liUnVYWDVWaGhrT0tWNktza0xV?=
 =?utf-8?B?S2FkQmp0Y0sxMitzMFNtUHRab0R5elMvKy9lNlRLWnk3dWhOaDdiK2NSV0JG?=
 =?utf-8?B?YlBRR09DcHRQZWU0RDFzV0F3YU9NS0xRczNEaXhxWjJ6RzU5MWRURk0ySGxo?=
 =?utf-8?B?TWY0NENta3BRYjVNcFJrdS8rWTZjb29ISkVmY3U2Qkd4UXo3V1pJOWVzb3lz?=
 =?utf-8?B?OVdzNDBHb3pQa2tKblByeFpMb1VrRks1RVNVb1B6NTNQOGNEL3pYeXFkWWRQ?=
 =?utf-8?B?NVJwTVZwN0pSN3pVTjFKWkFFeEswNDdmbXFNYmgzMmNRUXduS0Vhclo0eHpG?=
 =?utf-8?B?bGtpcGxrOVczMGkvRitEOXpNR05ock1mY1lLSlJhRHkyNnUyeGt0OTNBaE05?=
 =?utf-8?B?K1pLT3ZtSEdxSnhRZ0FlME5GT3RBMjZXNmZnM3ZuUXdtMnlKaGxWdWVUVzVv?=
 =?utf-8?B?dnFoRjNOTnhLMmpuZ2pua3ZHU0cyc2VtdEhXZ1hXZUdLbG53ZDV3dHdxdG8z?=
 =?utf-8?B?ZVA4SjFtNWs0Z2Y5bFMwKzdGbDR3ZXh2d3RaalJ6TEd4b2ZaTUJLOStKaFNS?=
 =?utf-8?B?b25wSEJqeElBdjk2cVorNUoxMi9wSmtxaGNscTJmc3hnUHpsV1ZSM1M0aVpZ?=
 =?utf-8?B?ODNsMHlEa3lOVVBDSEJ6VDRDRG90dnJWb0dDMEZTU3NkOWZXUEwxUWhPc3Qz?=
 =?utf-8?B?UmZxMkxCYzg0WmdvMGx3UzkwUnZhaVdlaG9oQmZib21LZGlJRTc2dHBIb3gy?=
 =?utf-8?B?aUJqV3FuSVlOU1NTNGc2QnovbitTL2dRcHRYbGxVYXN3YUMzUUdPZGF2bm44?=
 =?utf-8?B?ZWRtK3VQMkFUV1kzVEVEWkFhVDFZV3VFc2R4V3F6bnMxcmU5MS84LzduUVRZ?=
 =?utf-8?B?ZUZBRUNsS2xWT09tM3RRWmJMMm9Zd2JVZ25NYmlzVENpMzgySUJrTVB0WVZH?=
 =?utf-8?B?NTF5U3dkZXowZFNxZ2FZVEFjN1I1UWVsTGR5SG5RdnZlUFRWM0NsMjBQcGpi?=
 =?utf-8?B?S3NtN2t4OXIzQ2R4enNPUVdXeDQzL1J1bGZkZ3NIY0ZSdk9NV2YyYndzT2Fn?=
 =?utf-8?B?K2Q3SFJyTlNlNkZINVlTRzZTUkJGbS9RN1dPSFBsdEVzL0hRZHFYbENoc1JJ?=
 =?utf-8?B?ZXEvMVN6UWxENHo3NVA4NTdUa0J3VHN3cnZnanFRcEkwS3FQQndleExCMHA1?=
 =?utf-8?B?MExEYkZYZUJCK2V6cGp2ZStDdmVGb21Ea1JycFllUGNNa1luQk9FME4yUnJl?=
 =?utf-8?B?cGE1WG9NTXVwMGwvVXN2TWN6NXJLK3ZURUk4djlEaDBJVzdaQ3ZIakx4TlJM?=
 =?utf-8?B?ajI0Nmo5YWpEYnlzNW5vbnFJMDRqcU5CT0l1YmRmbnhxSlFsTTVXMHh0MWMv?=
 =?utf-8?B?aXpEa2FNTlN4dU13cHhxQk1jNUU1OGsxK1pkdFErdTdrQk5GRmNLUWF6ZzFR?=
 =?utf-8?B?aU9HR2lQcjVuVHphRDAvZEkzY1dwaGVoOE1laUhpWUJ3d2w5MEJmakF2Z24r?=
 =?utf-8?B?dk5WUUFDRlNBem9PYm8zZ0dtRG44dFIyRVQ4WDZtN2FFc0swa2NpNFk2dlUr?=
 =?utf-8?B?cWd3c3VZem1KRmtxRlYrdVlNbTNvMDkyVERhb0l3V2ZqNFp4SGNqZHgweWhh?=
 =?utf-8?B?RDgzZjdsZy9XYWxKNEc4WjdaTUJZRUJBUmVJakpBVUIxWFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2JOVmg0c2FiSzR1ai85TERXUzlQSG1BVnpJUnZVY3NxMGtQTlI3aU03a1hn?=
 =?utf-8?B?ZnZPVWRHcXA3THNWSzcxWUphandTaGNJcDFMZGpxZUkrOXZyblRSZDMzWlZl?=
 =?utf-8?B?aWEza3RCZmJnajhsUlN5cVhsZE50ZTZORTZldkNYR1JCTTVWcm5DVmsvRlR4?=
 =?utf-8?B?SlhVUU1jV21nTEgwaGlxQ1JFam5yS2dlUFdqSlYrUS83Rko5YkoxcGVjTG5r?=
 =?utf-8?B?Q3NSVTF2czN0U2M5Mzg0d3F5cTJlZlJmMGh5WCtOOUpnS3VkUUloOVVoa1Ft?=
 =?utf-8?B?OWp5VEZEVDcwaklrYzRKTUY2VlVkNVVrTFI2S0N3d3BvUWlQRXdUUDRNMlFY?=
 =?utf-8?B?OTZiRzFPS25zeGdnMWNmYTlvNlkwd1RlMDY1OWd6d3NGckNSK1EwV2RwdXR4?=
 =?utf-8?B?c05FM2Ntcm5Cd1I3R09GbTBCK0tUNGFYZmdkaTVwbDNEdVdXWGdjSndQdWNo?=
 =?utf-8?B?ZS94clE1OEtTVjg1SXIxS3ZSQ2xQMXhRM3p5RE9KZFRHVVVENkRkeUlHNjFK?=
 =?utf-8?B?Nzc0SXlneHlxWjN5andsSlF3eFZRaW5WTlFDV1VoYjArT1BXMldwajJsQjdl?=
 =?utf-8?B?QlhVRktrS2dwYWJIZEM5R2FrVlgwQ0hqbDVobnJrV1Ftc2ZoZU1KY3dEeFE3?=
 =?utf-8?B?YnlKWFp6YVV3STFtY2Q4VDc4OXlOVTBCeUVNWGRNU09lb2w5QXhWOHltY0Z1?=
 =?utf-8?B?ZHB6NkxQWVRkNS82NkhDWkxwRElmeTJMVkE0dlE1b0tKZi8yZE5hMTlXK3Fq?=
 =?utf-8?B?emEyUW4wVno2T1M3dVNtM2VmdXh2NjJQdGFrOEhiSVZSclZSUjlOZzMyWVYz?=
 =?utf-8?B?bWNhUFR1d0VHbW1YRTcvZHQ3eWhZWGxFbkJsYiszL0NKb3lMK1NVYVg2QUVH?=
 =?utf-8?B?SFgwbVZORWN5ZENpM0hYOFBaNGFXMllPcWRvMXhBMTV1V0o3cHZUNlViaGVM?=
 =?utf-8?B?ZTZYY3FLWXFJRTBJbitIV3A5RE9yQUFSbTlTOXI3NzNaSjZRUEVnNEdETStG?=
 =?utf-8?B?UTR0STBBT1R1OGxQU2NOeXZYbi9SUDF2NUZMM0t3YjBvRXZXSGxDSU9Sd01z?=
 =?utf-8?B?OGRmZnlSV1FlNTNNM3VONjFLeUY0VmNnbjNOSHhwOVRhb0xkMFc0dTl4SDE4?=
 =?utf-8?B?ZDZSQm92WUZqTXVOOEExaytNelYvR3BxZTZJc21xZ1ZsNXF1dnVZRUlQemtl?=
 =?utf-8?B?WUlEQVhyQUg4OHVFYVRkcldqK3ZnVlJtdlhZSFhnUzdaSllBSEprU1Aza2RO?=
 =?utf-8?B?ZHlDNHRoZXFpOUh1UStnRFkvODAxY3VkTWFBaWFWR1pJeGVnVVBBc1dVeHpV?=
 =?utf-8?B?YWhqVFJKUnBLTkJkcGZpQnk3SncvM3ZhT2pyTGZWQkMzRmN5elR3NmdyT0wv?=
 =?utf-8?B?QkRtejFJQjFhUlgxbzh3U0V3Zk9qZm5KRFNYNlQ2TnF4bzhUY0gxTGJ0VWtw?=
 =?utf-8?B?SVZXazlBdXh0Sm0wWWdmNTRONzBZcFFicTY3ejJUQ1V4aTlidTRxeGt5Nmp1?=
 =?utf-8?B?VDhmaTdGOHdvQ3pSd0JCd0o3RzM2eDlYcmFWbENTVUc0aGJDUEVYbzVENWY0?=
 =?utf-8?B?eFRmUmg3bFJ3TTk2Y3RDcXMvYUo0MTFlMHFIaDg4Y2syaU15WE1vaWs0SkFk?=
 =?utf-8?B?ZTFaZUhIK0gyVDN4MnZQVC9IZ2JuVWMvT1NhYmgyYUdYSTFRSkFhYWJXOXJR?=
 =?utf-8?B?N0JUMCtYaHVEMFZvTGJPZUhqRG1ESFovTU1pUWlZTTR6b0swT1l4cjJZb2pO?=
 =?utf-8?B?OFZFQjJGVmUxalJkUzZrMy8wU3U4bFNJcVpDNnhsREc2VithYU51djAzUFNQ?=
 =?utf-8?B?RmhFeEZiRys5VThuMXAxbm9rNFQzcnpJeGs1ZVFXb3RnUUhVUG9PSlJDMUJJ?=
 =?utf-8?B?Y1ZFdFRCYUx5NEEydkNKUTJaU1hUZEFWL0FPMEtwaDhDWnQ1cVB0MGlwdDJR?=
 =?utf-8?B?ZFlsa3M2RllJNlhxV29wWW84bjlXSEM5cXRpTkNDbWVtV1gwS1Y4VThZSFNr?=
 =?utf-8?B?OUpEMi9HN3loNklUK2F2aEc3blFFNHBnTndZZWlFb29Cc3pGdzRuS1pOeUs3?=
 =?utf-8?B?c04yNDMrM1o1T2dxRUdGQUc2dmxJaVlDclYva1hQVG4zSm1UajlJeWRZbXZN?=
 =?utf-8?B?ZjdsWndvcW15T3pEZXVqdmxDMDduc0tvQVBrWmVxdkVJcmczeVVncUM3eVNs?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DJTMR0iPx4dhmdUHIsXgUbEG"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04499bb8-5b48-4471-fafc-08dcc7629c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 13:09:12.7956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQQZ0nYOjFxmYLVoNH8D3BYghaR/FV2t49/bOeicXVa79W2mcVy9P4+Yh+eVjtvKSP6VZiAOL4onoySW7Sk7nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2642
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MeE+uI/f c=1 sm=1 tr=0 ts=66cf217c cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=8YfA8XZME4H0u7Jv9v8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uQsQWgxg_WxSIe_9pxsA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: Bx8YLoHigcNRFIqnzoUipl56urXxVaIC
X-Proofpoint-ORIG-GUID: Bx8YLoHigcNRFIqnzoUipl56urXxVaIC
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

--------------DJTMR0iPx4dhmdUHIsXgUbEG
Content-Type: multipart/mixed; boundary="------------IT9AhD0KPeY4p9m0AahBxtQc";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Frank Binns <frank.binns@imgtec.com>
Message-ID: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
Subject: [PATCH] drm/imagination: Use pvr_vm_context_get()

--------------IT9AhD0KPeY4p9m0AahBxtQc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSBtaXNzZWQgdGhpcyBvcGVuLWNvZGVkIGtyZWZfZ2V0KCkgd2hpbGUgdHJ5aW5nIHRvIGRl
YnVnIGEgcmVmY291bnQNCmJ1Zywgc28gbGV0J3MgdXNlIHRoZSBoZWxwZXIgZnVuY3Rpb24g
aGVyZSB0byBhdm9pZCB0aGF0IHdhc3RlIG9mIHRpbWUNCmFnYWluIGluIHRoZSBmdXR1cmUu
DQoNClNpZ25lZC1vZmYtYnk6IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29t
Pg0KRml4ZXM6IGZmNWY2NDNkZTBiZiAoImRybS9pbWFnaW5hdGlvbjogQWRkIEdFTSBhbmQg
Vk0gcmVsYXRlZCBjb2RlIikNCi0tLQ0KICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX3ZtLmMgfCA0ICstLS0NCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAz
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0
aW9uL3B2cl92bS5jIA0KYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMN
CmluZGV4IGU1OTUxN2JhMDM5ZS4uZmZkNDY2NTA5ZDBiIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
aW1hZ2luYXRpb24vcHZyX3ZtLmMNCkBAIC02MzYsOSArNjM2LDcgQEAgcHZyX3ZtX2NvbnRl
eHRfbG9va3VwKHN0cnVjdCBwdnJfZmlsZSAqcHZyX2ZpbGUsIHUzMiANCmhhbmRsZSkNCiAg
IAl4YV9sb2NrKCZwdnJfZmlsZS0+dm1fY3R4X2hhbmRsZXMpOw0KICAJdm1fY3R4ID0geGFf
bG9hZCgmcHZyX2ZpbGUtPnZtX2N0eF9oYW5kbGVzLCBoYW5kbGUpOw0KLQlpZiAodm1fY3R4
KQ0KLQkJa3JlZl9nZXQoJnZtX2N0eC0+cmVmX2NvdW50KTsNCi0NCisJcHZyX3ZtX2NvbnRl
eHRfZ2V0KHZtX2N0eCk7DQogIAl4YV91bmxvY2soJnB2cl9maWxlLT52bV9jdHhfaGFuZGxl
cyk7DQogICAJcmV0dXJuIHZtX2N0eDsNCi0tIA0KMi40Ni4wDQoNCg0K

--------------IT9AhD0KPeY4p9m0AahBxtQc--

--------------DJTMR0iPx4dhmdUHIsXgUbEG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZs8hdwUDAAAAAAAKCRB5vBnz2d5qsB5v
AQDVVQtx59oPkNPZc1bHmHxVbrs3fLwrBDVcLmtGSLwY3wEApR8yzboo9/tkf6q4/7ss/XmJ9382
Gil2B1sOIUkLzQ8=
=mOk5
-----END PGP SIGNATURE-----

--------------DJTMR0iPx4dhmdUHIsXgUbEG--
