Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58289B2E2BE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 18:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E43610E269;
	Wed, 20 Aug 2025 16:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="RCTI9CMl";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="RRlI+FCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9025710E269
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:56:36 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57K5PCwF325598; Wed, 20 Aug 2025 17:56:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=pnXNTi+u/8s4T1gkS3QNQpZSz
 NXixIT8ldKGzKLdNR4=; b=RCTI9CMlciG9IfCUHk6xpLExU32Yl2q5SWJHjYRjP
 tCNvBUrC+Rxl1DVsZ4eh9VpnMh9Kz566BcOCxCWeuc5fHR5elPmAnYNqe2ce4g8m
 8tUXjoXf480UctkpzMy3hOA9q45JMBVdjMa7o5wJplPDAeU/W/ycv5TDcB39Hzk0
 ijrbpiMJAemzV4W8kT2xFo5T5CXNttKScyakFhvVowSPqj+s42nBFGtXc28w+IwO
 WjNm11mNxlWlXiiAcyC4Lm4LE0rSpN/7fKTyjOAdHOM7xFmd7Hueekv55jfkG9LM
 AeMDHWwuzjB3984CaN2NrJR8L6t2cyIGJIg9d78O6ST8A==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020086.outbound.protection.outlook.com [52.101.196.86])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 48jj2qmkkv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 17:56:17 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xc/j+KA21wMPw1FwskUdaKkPJN7gRUUD74mdutNus3BkKcun6O6eaBfLAC1Q/ZK7ueE8rbmOiCXo8KrnBGprKrIpUqz/su0QK/Ru6TYWCiJF+6hxq3I1OMJnpefEvvgMX9ZJ9kmkRGcpuU7r0dlK4yN/EQ4VNzv1I8qu2paYG9hSYy9mqiPTjZBr0tgYrBLn1ekr0QveFGt7G0MZb7n8pRTy/QJsWAb+GQxf4F8TXoyXkd8o//b/0f/MCo6bLHLmbwwSyE+OVKrGUJdsn4+zI9E9IJPrH3cckZMnW6dlR/4JR8Z1P5qrxmm5IbVyscvByJ4vPiEoSyl08h4yjS8aPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnXNTi+u/8s4T1gkS3QNQpZSzNXixIT8ldKGzKLdNR4=;
 b=WfoY8ZWz7/QctZO9vRmoFwG8MCw1+qRV+jZToVN9M5FZcJE2wdrQEwuY1NxkRlignT8YZtIVIZ+G6Tbi7ikE+afQgqRG/+FIcS9zv9Pssb4M/4fyVZ+4KFULvOK9MJjj0gTToodkEry0epOowUP/euSjJEtftp8+E3KBlVehtp5Igtct/jInx/V/ISTd+AzKkEdSuiwnrzjgidpHWeUHoeONXOYPLsJOBiheN7y1D5Lh1lYKZsCQUnLbuBo11gDxKN7zgBKQvqMzEJHSOsheY5dL33cskKz1PlKBGh98aDsn8cEOFpYJYIlU927cmENOxxp3HOiS5k6DOHra2Um2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnXNTi+u/8s4T1gkS3QNQpZSzNXixIT8ldKGzKLdNR4=;
 b=RRlI+FCW/eAM9dDUhU0LvA8dd1yAqwoELHbzovoI0W7eKyUzbLu2gvjmR/dsRuPc+A0UAPlm6OQQoF79i+qVbK3TD+/2wRn1X1kL0D4U6X0d6DH7SM3/ZbPJDzBokZPvAARgptRDgxpb92K9ZyKZRvI1IzaspIg3BJYUlYEKCz0=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO3P265MB2250.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:109::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Wed, 20 Aug 2025 16:56:15 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 16:56:15 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Boris Brezillon <bbrezillon@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Matthew Brost
 <matthew.brost@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Thread-Topic: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Thread-Index: AQHcEeKdd6FmjWzqrkGtxlPHVrhvILRrwucA
Date: Wed, 20 Aug 2025 16:56:14 +0000
Message-ID: <100807c5-89f2-47f1-97a9-78cdfed2ce0e@imgtec.com>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO3P265MB2250:EE_
x-ms-office365-filtering-correlation-id: 664d5bbf-dd22-4e6e-ece5-08dde00a7994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?S0tPL1AyekNWdlBJMjFEbVFvZkNob1Z6VlRwb3VGWGczcFNicHRybjJ0M3Zu?=
 =?utf-8?B?dHJuUmtna29iL3NmRkUrcUNiOTUzS3d0WVE1ckNtekJRVXFHbWl4RjVrVzR4?=
 =?utf-8?B?NCt1eWs0MWE1Um9GekE0OU5CRDlGNnFuN3RaVGsreDNSRjNJOExJRDJVSWdB?=
 =?utf-8?B?MHh3U1Ewb3hwK2tROUd6RlBsNzBZV3Rjd21jOTVBQjlRUENoSko2WExibkZm?=
 =?utf-8?B?VThjYUwvWUh6VlZ1d2k1bUVyNE5sOFFkUWRiWEMyeVZCZlBuUVI3OU55TFhx?=
 =?utf-8?B?WWZneGV4Zm50bTAyOXF4UTdEaTV4N3pZZFN4OGJCazJKaVoyRWNPVldPNTdQ?=
 =?utf-8?B?bUIzVW9UNXJ2dUl3YW5ZK0tSNWorNjdSQXhkOTZaWVVFWXF1YWIzd3VNOXBI?=
 =?utf-8?B?L29MQVVESE90clJUc3VlWG93bUVJUTg3ZGhJb3l2TDdaSVZxcElCRmsvbnI1?=
 =?utf-8?B?SlVmbnFCRVVVNUdCMk5OSDUxb25OdjY5U2F5TFpjbGtpSGtQVmNidW1qU2pt?=
 =?utf-8?B?LzRyV2ZyWTUwOWxrSTZ3Zjh5eUlKd1Z4NFltOG0zTTkxWStaR1ZycmZOMndk?=
 =?utf-8?B?ZXhXdzJLbUkyMEd5TmthVngzMGphbXh2emMzMGhzOWFOTjNCbFZMcHI5Q00z?=
 =?utf-8?B?eE1vbmJFa2JTMjZycE10WHJFcU4zMlhQN3FrQkhOS0dQbUFtN2tmUjUwL2JE?=
 =?utf-8?B?amx2SGtnMmlzRkxjaGd4eG5pekc3UWpPVTBGdjg0a1RrSTVTMEk5VmhJVEJp?=
 =?utf-8?B?NFhvMEhFcCtrS1UzYm9tU2FQQmJDTlNidVZnZzAyeHd0anlmVmc2eTRJbFcr?=
 =?utf-8?B?a2YwRE5XMis4MHZuVTVybS9vUk9mTytCbndHR0sxNkk4SFZEZXJEUExqdHQ5?=
 =?utf-8?B?UmYwdlR1T1ZDMGowbElaMDVqbkZpWnZ5dHBvSUtENFhsSm1uMjJBNEU1eHV2?=
 =?utf-8?B?d2d5Ti9ndDByKzNITjdBcjVwblg4bXJEWnk4V0tJcmhWWWIwRzBNSkhGUmNy?=
 =?utf-8?B?SzFqVU10Zkx5MFd2amFNQkwwOXJPUEw4NzRCVklPa1p5NFpkNHlXOUJmSnJP?=
 =?utf-8?B?ZEYyWHYwalpxbldpaVNremhwbG5wQVFNNS92SXJCNk9RYm85VFduVnlYNVB0?=
 =?utf-8?B?SUtRTlVFRE9sNFoxdzJOOGNCN213RlF0S1ZobTY4Q1pDOCs2VjVqVzYzQmg4?=
 =?utf-8?B?L2tuTFRTOTgya2xvd1dqRzZPODlzcjhMa1U1eERVN0MwTXVIUlFSV0hRL2pI?=
 =?utf-8?B?YS9KUzJ1Vm45ZFJ6RG1GVS8wU29GTmdiVndiNUpaYTZwS2VGc1A3SCtGVkZj?=
 =?utf-8?B?WEt2UVhRSExkMFJOcFppalM4N3djU3hHWHNxVC9kN1ZVY29tQ0Q5Um9nVFhC?=
 =?utf-8?B?Ykx4T2RCOVJvL3ZuWDBwNFEvdS8rRUNRTDhBS0dKRnR3cHBtTEtvVXAxZnl6?=
 =?utf-8?B?MmFMMm9MNlhNWXVNUFdITUdMSmZlUllCWHBjMUY2MUhQcE9TM2NSTDBubkMr?=
 =?utf-8?B?SjU4WDFWLzE5SytvT0U2QkJBNHJRdkoxZU45TVRqSTBTV3dBNDNieW9hNzdG?=
 =?utf-8?B?d2NrYzVySzFUcTNEeVlxZFMrbHk2V0UwN0xGK3pzSm5COWY0bUUvYjFwWlFm?=
 =?utf-8?B?Y2dGL01Fb0hhdHFzUVZkQnM2djh2WmVsNVh1anR2TEtXMkYyOXZWSHZFck5Y?=
 =?utf-8?B?UEpKNmNGTXd2d25SNEhEaEUxWkI4V0pteE9NWFR2T09zVnBBUnR4ZVJuVDRE?=
 =?utf-8?B?d1d4eHI0a3ZlMDgva244RlNjcFlVdnluT1NwWGY3Z1R1b3pDRzRjaWxYT0Zo?=
 =?utf-8?B?YjVVZkZobmdNQytTZHZ1NDNodWlPNy9aaHl5VkxGTXFMLzVQRFprL3dtZnZF?=
 =?utf-8?B?dVl0OVk4MHY1OUZXNU1jTU83RjV5aEU3OGxSTy9LclpLdk83QmxOUzE3SHlN?=
 =?utf-8?B?ZjBqRXlNeUhsU1JQQnliYnJSVHN2NUYyVTlTV2JCKzM2cHQzNXJvSENtM2Vy?=
 =?utf-8?Q?t0nQ5EqA6SoDWy5r9G7oPpFx2687DY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHNuTllYZEtuUXFLYTdSa3psN0lUZzJmOGFTS2tXMTY2cW1HckNHbFh5OVQz?=
 =?utf-8?B?ZGdWNHFJM28xc0VseCtmVUM1Ry90QlBkdkV6MVk0QzBCb2lSeUNjRll2TVJL?=
 =?utf-8?B?VXhUTm9TMmNsVkZFWjVZaG1qeUhaOEg1VkpSQ1J2VFNGU1hiQU4rTUtHcjJx?=
 =?utf-8?B?NThhL2svN2taOFlXWW9VL0Nka1JnSHpkUVpxbHdZNTFIUGJwT1VORWcxZkZC?=
 =?utf-8?B?TUhnVEEzYjR3amwzZlJ3MXBCYjFaUmNWaHc2WlpieHIxMUZQbTdBYVlXVjFy?=
 =?utf-8?B?Snh2T0g0VXFpQ05keXRCODdGb0tMRExSbG1vV1NQOU5qcVNzamdaTWFjM01S?=
 =?utf-8?B?aFBsTkFzdU5ybm5ybDY3YTc2U2JORmVRR0h5dlFBL1hxTnVuL0pWV05OUzh5?=
 =?utf-8?B?ZnU3NzFRUzJPS3VVSlhZcG85WDlidlBURDV5cjZ4R2t4T1Q5ZnJ5c01mRjBj?=
 =?utf-8?B?ZnlxV1lMMDFoeFR4ZXpMSlFHSTZQTE9Mb1JESm0rb3ZkbVJmb1JLeVdCekNI?=
 =?utf-8?B?SzBtSWkzMENYWHFyNWwzTXIrTmRPVFlTZGxtWVlFbE1sUmtvZUJaMy90WmhJ?=
 =?utf-8?B?dmZrMHhRZ1hBVE1DTHZvT2cxYUpEME9SSGlqejlTUjNHOFhHdFZ6VDJZZHUy?=
 =?utf-8?B?K2NsclBVTkgrZ2wxVC92RkY4cXJvbUZ2eUFJZ0ZkamZ5OG5VYVBCdlNQTDBP?=
 =?utf-8?B?aWpFOTc3cmxqLzhmVzV6K1RWVlhPR0JDQ2hFME45b3VuWnN1ZS9MWTZ3UUZ3?=
 =?utf-8?B?YjFUd1pXNVMvMXlpektxQUF5SXlTeVVIckhRbUYyajg0UEIyeUc5RmVTQnR5?=
 =?utf-8?B?K2FFbytJRUhvYnBxckNrY1laNk0yR3JiaUh3cVpzVGh4SkZ5T053WUhET3Bx?=
 =?utf-8?B?ZjFiT2luRmRhVy9pWHdueVR2WE44UnVDdWJYVFZMcVJ3Wk1JdVUrajR3aHNu?=
 =?utf-8?B?NlYvOG0rb20zV2tLSmJrNU5UOFBwUGk5bzFuSVlBeUtDTWNQb0lVcDJGclRy?=
 =?utf-8?B?QkxBTjJ1bXFuOVloMFBQYklYSktGNlpUa2hIbHFGRnB2M0JIdXlxSG4zL29W?=
 =?utf-8?B?Ri9FSW5MU1hkR0JHakJ1NjcxT2pLaUJjNG9hSkZuRWpyRGJQRk5SSjhEZGt1?=
 =?utf-8?B?NnloVU9leExyaHZaS2ZvbWdWLzRJVC9HV3cxNmNWZlhrY3lEa0toR0tIc0pS?=
 =?utf-8?B?QnRHVmVwRGxXMDhGcGZ5Ykc4aUlqZkl1ckRDQ2d0dWs1bTFFMGRuOVUzVk9t?=
 =?utf-8?B?VnhNNC8wajEyTGNmUUJPbmFkaDlFUmVKNS81bG81ZjhSVytJSzdxQUFiMUx0?=
 =?utf-8?B?ZHI1cFBQYjRVY3VMUE45NU85R3F5Q3FnS2JpRFVqK29keno2d2pnZW9pa2ZQ?=
 =?utf-8?B?SXpudGtoenNEUHoxTVUyamhLWkg0Y1k1UEhLQW9nUFo5cGEvZnJYT0MxQ0xE?=
 =?utf-8?B?dVFXYi9wY2I0K0tVSkpNM20rejdwbGVTVGZiMjltYUI2ZWhnQXg5aU1na3B0?=
 =?utf-8?B?UitxNTNQSzBZV2Y1TnhjakMzeTRlWDNFMXdrOXB2alhWUiszcllIVmw0RFdE?=
 =?utf-8?B?bTcxNjMxWmQ0NWZnZzdVRmZua3EvSFdXR1RXSlNjOWtPMStUK0lEUHlmRUNZ?=
 =?utf-8?B?eTUwSDdLSlpGa3gzb3d6TDBpYkQzTjd1V213NVFLSmxHTFphaExkOTN2MlAy?=
 =?utf-8?B?aG81TVRTNTl1T244WGJTOGpwTVFJdjJTUXhtSUhzS213VnQ3OEREU05DYktu?=
 =?utf-8?B?TW4wN0w1WVVRRzR0ZnAraXFDQ1BCZC9Vd0xhR2ZOaGZzVGVRYTFoQm43Qmtz?=
 =?utf-8?B?aGFMT0RNMUdZSTAyOFluV2NWTTFWbUg5N2lORnpuc3A3ZW8vdEI0OGZ2dW81?=
 =?utf-8?B?MDAwNE1zNHMzNFl4L0gxMDBrWE9HUjAxMURZN1huSGZKeDhnbk0xd0VPTnda?=
 =?utf-8?B?cDU5T2lLK2ZhUTNZak5JMjREdTd0Q29jb1JGa1lQbDdiY3VuSFFONnYwWUxJ?=
 =?utf-8?B?QlNJNm03YnFaRHZLb0F6eG5Xak5Wc3AyTTFhaE9BZlZUT0M3cnMrMlBPaTNh?=
 =?utf-8?B?ZW8rZDEyV21sSkNyR01VSDUycEYxU3F0TnExNzNGVExOd3JkdXRtU2srNmNP?=
 =?utf-8?B?VGlQZEVDN1ZuWWNSSkx4UUltMHgyN1JHb3l5YkI4R3daUjdWeGlqdGUwb2lw?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qkfFzdS0dKI40c1bQyMermCg"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 664d5bbf-dd22-4e6e-ece5-08dde00a7994
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 16:56:15.0092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUVW4BdQ9X5Kr8q/ww3tl3iiKsv7JOdIylZ4thjS1rX+BKDN09pGnFGE8DNqjP/OMwbYNGIc74ruYkGb7yJYSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2250
X-Authority-Analysis: v=2.4 cv=FodcP2rq c=1 sm=1 tr=0 ts=68a5fe32 cx=c_pps
 a=q3SjaOqng8XEwczaaYvNcQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=jh7G9yOzeCGl_cSskAMA:9 a=QEXdDO2ut3YA:10
 a=8IZzrmSlm-e_sxg7VE4A:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: VVnwAyvoc5sSbL1sNmCjqa-7zBt-vOv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDE0OSBTYWx0ZWRfX9Vhs4Zb0N91E
 pe/OOXCgJoHedUtLeBORMyR8T5+Wd8dWQQ5bkFIBryTmAEjIYQS5UmzhSinCP7Y1IDo7ENSUmGs
 //vQaeX4DOQ2ZLYnrXYBogEM5MrYggTvRq3RdpOznAgF6pDaPH+5b2yOqISPQQNyhdeHA9LlOIu
 fDmCroj1+KLNJPX74gPwbahEF4UpGSd74TRWA/zpVJ5mNqiay+z0n5Ac7nRbCmUx83Y/7g6Tp77
 l98zFyEwE7BmranXxF7nJ5oE3P8aD16UGrUyCfTc4yf22NB1W37NOYlUE7Ep5LA8/0P8Lw+uH/0
 WUSLg2kzurORVa2IRd5F9TnL0L8hJ1hTtSJJzNxKukkvLeQWZYfTAewEsA2+CbEQJyUAmSe4vsU
 /I5cOPk0nsPYLadrBMVGBNCXXW2RfA==
X-Proofpoint-GUID: VVnwAyvoc5sSbL1sNmCjqa-7zBt-vOv1
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

--------------qkfFzdS0dKI40c1bQyMermCg
Content-Type: multipart/mixed; boundary="------------5q0EhW86bizNazV0QlJD98Eg";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Message-ID: <100807c5-89f2-47f1-97a9-78cdfed2ce0e@imgtec.com>
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>

--------------5q0EhW86bizNazV0QlJD98Eg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/08/2025 16:23, Himal Prasad Ghimiray wrote:
> Renamed 'map' to 'op' in drm_gpuvm_map_req for clarity and added
> corresponding documentation. No functional changes introduced.
>=20
> Fixes: baf1638c0956 ("drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create=
")
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 36 +++++++++++++-------------=

>  drivers/gpu/drm/imagination/pvr_vm.c   |  8 +++---
>  drivers/gpu/drm/msm/msm_gem_vma.c      | 16 ++++++------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  8 +++---
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  8 +++---
>  drivers/gpu/drm/xe/xe_vm.c             |  8 +++---
>  include/drm/drm_gpuvm.h                |  4 +--
>  7 files changed, 44 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 39f934a91a7b..e9aaf9b287e7 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -552,11 +552,11 @@
>   *				  struct drm_gem_object *obj, u64 offset)
>   *	{
>   *		struct drm_gpuvm_map_req map_req =3D {
> - *		        .map.va.addr =3D addr,
> - *	                .map.va.range =3D range,
> - *	                .map.gem.obj =3D obj,
> - *	                .map.gem.offset =3D offset,
> - *	           };
> + *		        .op.va.addr =3D addr,
> + *	                .op.va.range =3D range,
> + *	                .op.gem.obj =3D obj,
> + *	                .op.gem.offset =3D offset,
> + *	        };
>   *		struct drm_gpuva_ops *ops;
>   *		struct drm_gpuva_op *op
>   *		struct drm_gpuvm_bo *vm_bo;
> @@ -2132,10 +2132,10 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void =
*priv,
>  		return 0;
> =20
>  	op.op =3D DRM_GPUVA_OP_MAP;
> -	op.map.va.addr =3D req->map.va.addr;
> -	op.map.va.range =3D req->map.va.range;
> -	op.map.gem.obj =3D req->map.gem.obj;
> -	op.map.gem.offset =3D req->map.gem.offset;
> +	op.map.va.addr =3D req->op.va.addr;
> +	op.map.va.range =3D req->op.va.range;
> +	op.map.gem.obj =3D req->op.gem.obj;
> +	op.map.gem.offset =3D req->op.gem.offset;
> =20
>  	return fn->sm_step_map(&op, priv);
>  }
> @@ -2180,12 +2180,12 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_map_req *req,
>  		   bool madvise)
>  {
> -	struct drm_gem_object *req_obj =3D req->map.gem.obj;
> +	struct drm_gem_object *req_obj =3D req->op.gem.obj;
>  	const struct drm_gpuvm_map_req *op_map =3D madvise ? NULL : req;
>  	struct drm_gpuva *va, *next;
> -	u64 req_offset =3D req->map.gem.offset;
> -	u64 req_range =3D req->map.va.range;
> -	u64 req_addr =3D req->map.va.addr;
> +	u64 req_offset =3D req->op.gem.offset;
> +	u64 req_range =3D req->op.va.range;
> +	u64 req_addr =3D req->op.va.addr;
>  	u64 req_end =3D req_addr + req_range;
>  	int ret;
> =20
> @@ -2272,8 +2272,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> =20
>  				if (madvise) {
>  					struct drm_gpuvm_map_req map_req =3D {
> -						.map.va.addr =3D  req_addr,
> -						.map.va.range =3D end - req_addr,
> +						.op.va.addr =3D  req_addr,
> +						.op.va.range =3D end - req_addr,
>  					};
> =20
>  					ret =3D op_map_cb(ops, priv, &map_req);
> @@ -2340,8 +2340,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> =20
>  				if (madvise) {
>  					struct drm_gpuvm_map_req map_req =3D {
> -						.map.va.addr =3D  addr,
> -						.map.va.range =3D req_end - addr,
> +						.op.va.addr =3D  addr,
> +						.op.va.range =3D req_end - addr,
>  					};
> =20
>  					return op_map_cb(ops, priv, &map_req);
> @@ -2583,7 +2583,7 @@ drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuv=
m,
>  			   struct drm_exec *exec, unsigned int num_fences,
>  			   struct drm_gpuvm_map_req *req)
>  {
> -	struct drm_gem_object *req_obj =3D req->map.gem.obj;
> +	struct drm_gem_object *req_obj =3D req->op.gem.obj;
> =20
>  	if (req_obj) {
>  		int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fences);
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/ima=
gination/pvr_vm.c
> index 3d97990170bf..983165eb3e6a 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -187,10 +187,10 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind=
_op *bind_op)
>  	switch (bind_op->type) {
>  	case PVR_VM_BIND_TYPE_MAP: {
>  		const struct drm_gpuvm_map_req map_req =3D {
> -			.map.va.addr =3D bind_op->device_addr,
> -			.map.va.range =3D bind_op->size,
> -			.map.gem.obj =3D gem_from_pvr_gem(bind_op->pvr_obj),
> -			.map.gem.offset =3D bind_op->offset,
> +			.op.va.addr =3D bind_op->device_addr,
> +			.op.va.range =3D bind_op->size,
> +			.op.gem.obj =3D gem_from_pvr_gem(bind_op->pvr_obj),
> +			.op.gem.offset =3D bind_op->offset,
>  		};
> =20
>  		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> index 210604181c05..9b5d003bc5a2 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1179,10 +1179,10 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job=
 *job, struct drm_exec *exec)
>  			case MSM_VM_BIND_OP_MAP:
>  			case MSM_VM_BIND_OP_MAP_NULL: {
>  				struct drm_gpuvm_map_req map_req =3D {
> -					.map.va.addr =3D op->iova,
> -					.map.va.range =3D op->range,
> -					.map.gem.obj =3D op->obj,
> -					.map.gem.offset =3D op->obj_offset,
> +					.op.va.addr =3D op->iova,
> +					.op.va.range =3D op->range,
> +					.op.gem.obj =3D op->obj,
> +					.op.gem.offset =3D op->obj_offset,
>  				};
> =20
>  				ret =3D drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
> @@ -1296,10 +1296,10 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job=
)
>  			fallthrough;
>  		case MSM_VM_BIND_OP_MAP_NULL: {
>  			struct drm_gpuvm_map_req map_req =3D {
> -				.map.va.addr =3D op->iova,
> -				.map.va.range =3D op->range,
> -				.map.gem.obj =3D op->obj,
> -				.map.gem.offset =3D op->obj_offset,
> +				.op.va.addr =3D op->iova,
> +				.op.va.range =3D op->range,
> +				.op.gem.obj =3D op->obj,
> +				.op.gem.offset =3D op->obj_offset,
>  			};
> =20
>  			ret =3D drm_gpuvm_sm_map(job->vm, &arg, &map_req);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> index d94a85509176..314121a857e7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1277,10 +1277,10 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job=
 *job,
>  		case OP_MAP: {
>  			struct nouveau_uvma_region *reg;
>  			struct drm_gpuvm_map_req map_req =3D {
> -				.map.va.addr =3D op->va.addr,
> -				.map.va.range =3D op->va.range,
> -				.map.gem.obj =3D op->gem.obj,
> -				.map.gem.offset =3D op->gem.offset,
> +				.op.va.addr =3D op->va.addr,
> +				.op.va.range =3D op->va.range,
> +				.op.gem.obj =3D op->gem.obj,
> +				.op.gem.offset =3D op->gem.offset,
>  			};
> =20
>  			reg =3D nouveau_uvma_region_find_first(uvmm,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> index 2003b91a8409..3799e2c6ea59 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2204,10 +2204,10 @@ panthor_vm_exec_op(struct panthor_vm *vm, struc=
t panthor_vm_op_ctx *op,
>  	switch (op_type) {
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
>  		const struct drm_gpuvm_map_req map_req =3D {
> -			.map.va.addr =3D op->va.addr,
> -			.map.va.range =3D op->va.range,
> -			.map.gem.obj =3D op->map.vm_bo->obj,
> -			.map.gem.offset =3D op->map.bo_offset,
> +			.op.va.addr =3D op->va.addr,
> +			.op.va.range =3D op->va.range,
> +			.op.gem.obj =3D op->map.vm_bo->obj,
> +			.op.gem.offset =3D op->map.bo_offset,
>  		};
> =20
>  		if (vm->unusable) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f35d69c0b4c6..66b54b152446 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2339,10 +2339,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, stru=
ct xe_vma_ops *vops,
>  	case DRM_XE_VM_BIND_OP_MAP:
>  	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
>  		struct drm_gpuvm_map_req map_req =3D {
> -			.map.va.addr =3D addr,
> -			.map.va.range =3D range,
> -			.map.gem.obj =3D obj,
> -			.map.gem.offset =3D bo_offset_or_userptr,
> +			.op.va.addr =3D addr,
> +			.op.va.range =3D range,
> +			.op.gem.obj =3D obj,
> +			.op.gem.offset =3D bo_offset_or_userptr,
>  		};
> =20
>  		ops =3D drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 4a22b9d848f7..751c96a817ed 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1054,9 +1054,9 @@ struct drm_gpuva_ops {
>   */
>  struct drm_gpuvm_map_req {
>  	/**
> -	 * @op_map: struct drm_gpuva_op_map
> +	 * @op: struct drm_gpuva_op_map
>  	 */
> -	struct drm_gpuva_op_map map;
> +	struct drm_gpuva_op_map op;
>  };
> =20
>  struct drm_gpuva_ops *


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------5q0EhW86bizNazV0QlJD98Eg--

--------------qkfFzdS0dKI40c1bQyMermCg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKX+LgUDAAAAAAAKCRB5vBnz2d5qsMMB
APoClTe/mGSOK/WfcpmcY5TwZMkta/mSkG8GiWjEpKID7gEA1r/llSOBTxf9hRm2v78y2DDvOv3w
z/8i1P3rW7fZNQI=
=+dCT
-----END PGP SIGNATURE-----

--------------qkfFzdS0dKI40c1bQyMermCg--
