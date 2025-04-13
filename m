Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E4A874D9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 00:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F45A10E05E;
	Sun, 13 Apr 2025 22:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="A9cDzpkT";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="exyQ7Ye5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F182F10E262
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:51:10 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DGmSFX020276;
 Sun, 13 Apr 2025 16:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=hcceCU1iimdgNTu3ki2AckQFSF3M0sCVKxaemJH0CgM=; b=
 A9cDzpkTPEYVHHGNfbfljOcJFVGDO3tl2hvsddy7kWXJy3BEuiDfd49eSeI5bWUx
 vTKKGYX1LIMIJXazL0z9dkGbNzaA/ROj+CiszSKqVbJi0ChZ4le+UYHgsJ8EYI5N
 //95x0PLYkLfBdDiCu11+fPwFPy6gE1tQ7hK5O+hE1/3YQcNkTGqGvQWKL2RvWWo
 YfKPfnggwZMyILABE3h8wmgWsf7PPS2n57iV1BMAcmJ8+qp7drGFdke9GVpLBAbH
 k7lOJasumANGWq7Ig9X4wEfcIvLL63MBhvaDkjbCzR/mAEX83nq3cONQUtVObOA3
 hkbpg/mlPjml7env4sex/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460h3a803h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Apr 2025 16:51:01 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53DCVlK2039168; Sun, 13 Apr 2025 16:51:01 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazlp17012010.outbound.protection.outlook.com
 [40.93.14.10])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 460d4nv8ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Apr 2025 16:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbSp9RWoCytX523waMVG/e/y42fe4Gq3Aq7ahXnNwSf6x+vAZgc5UAT3Rey5qzng3Uo1dfOE2WSmqkzn/zfPybU3DHDJSP5lYBoeUVa50AsouHqYgmM1+/3XJ/sWTVC0/wwLBdSQvgyre/7KeybRx53YYvdidJBNsvKl26J7J9t+2P3+O+0ReRUDrj9Y9mYzYBhZYJnADU7ACY6qsyA8/gEO5t0aufRYcUkBJYxoTkpcYFFnA8gjVkGnCQ3ZQQjdo6wUYRjw1SAC3CH2VrZxgF3MHgjYzRW8pqpp5V2oRGNNTG0mOXS7DeOZbz97eF9kAm9i4VHu6t54xCtJ01Suiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcceCU1iimdgNTu3ki2AckQFSF3M0sCVKxaemJH0CgM=;
 b=Ips9+vZlnhMlHHgaRSHKpvv93TYHQk7WNkC1ansQE5c7fKs6zonnosAUphMPmzR0FGSw3mPp6wCGur1DSNjb46d2WIN4quG5LzoDPoqItqvIFUDybVsurDEh1qyNrTCqJ5AQAHLAAfEzqhY9x/1/alXivvJCCQ3m2amssaR3deN19zo8JTNHKB3V6ShBTFghn2OJ1klgsmnZ6WibEA+nnS0hAljA6hPBBDYrj3/0H6pUbOGrAnaGe0aBURHRm1UsMvQu5onRbQnGQWfA/ETWw7cu3RyITGg7BC0hL6d2YDKI4qkhqPoqb7Ij5Dx7K9eHGtjg64T6nnnBenx/8eTdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcceCU1iimdgNTu3ki2AckQFSF3M0sCVKxaemJH0CgM=;
 b=exyQ7Ye5loSy+i6DS4sBWWNpiZ3aUQh+IEq6K+e90Ci4JCYCKMRZbymhxP4rNXhQy4odluHAfJCxsLk7QXMXRu3UfbkAvHXz54+9FGwubyqDfx/++y4kcKlF/wo9Zf1ObWmfv/9HkY92+0RlENrtLLmjBq8hj7zd/RU3czWUHTU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BN0PR10MB5016.namprd10.prod.outlook.com (2603:10b6:408:12e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Sun, 13 Apr
 2025 16:50:58 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 16:50:58 +0000
Message-ID: <d25f220b-880d-4d26-9025-44ba80622459@oracle.com>
Date: Sun, 13 Apr 2025 22:20:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] drm: panel: Add support for Renesas R69328 based
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413112401.12543-1-clamor95@gmail.com>
 <20250413112401.12543-5-clamor95@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250413112401.12543-5-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BN0PR10MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: 236ebe74-0d65-48d7-f24f-08dd7aab5d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnlUN1poZVo1TWhScktMTXdBRk9oYzdvYlVJbjgzbGVRRCtuOTVYbm45YTBk?=
 =?utf-8?B?WDdHcHl1TTZIR1RkOXI0QW9KMUlYM1NoSktOeFgrZi9ILzF4ZnVod3pTa29W?=
 =?utf-8?B?SXE0OEVyNW1vdThHMXo1MnRkYVdWN1grUDY1eFpCditSYVBPMytNelFhSktP?=
 =?utf-8?B?VWVkMVVvNXU0Q3NXV1dSTFZQd0NneTEwYkNBbnlIZ3Z6T1o5WGdZTXRJWnlz?=
 =?utf-8?B?VVZ2VnA3MEJkdUxySzF0QXNDQUluRDJ2STMzSi9XYmM0cTRYK1JhVlI1eU9O?=
 =?utf-8?B?K21ycjN5VGZnL0FLV1VZaUY2QXAyb2xNekM4RXN3Y2RJM0FlOXFPRjJIdzFt?=
 =?utf-8?B?UnVGbStPRGxxQ1JlbFNOOHRyMURxRVhCYXZ0bEVVR2kzdjNma3ppaDdBb1FR?=
 =?utf-8?B?MGs2RFl3SE9HZXlEcUV1OXZ3TTdBNzNIOURkMWtvYVFpVFJRaFVxR1ZOY1VJ?=
 =?utf-8?B?SmVQRmlHRHhkSmtvRHFJWTBoWDJ6N3JUcVpQQkphSVNoY0hld2ZLOVUxenpw?=
 =?utf-8?B?VzF3M25nbkt0eEFROXFqcU5PWDMwZFdnbTh2NUFhcnpodGVlT3FaRGYyNGhP?=
 =?utf-8?B?TDFpMjdBR3ZPUkt4YTZVeElnTmdydzBXaGtZdmErSmtvRFRNNVk3eXVlaGlz?=
 =?utf-8?B?c1Q0VUVTUGpOR1pKNmpGSDY4WmJWK3RaZVlka2lsaElpTW5pYWZadFh6bmpO?=
 =?utf-8?B?Yk5zZGx1aS90TmtFZy90anNvdURsUlNxYkpWc0J4ekZMdHJEQ3IrMHFSK3hV?=
 =?utf-8?B?TkI3MUg4WWROeVlWTDRSMHF0OGp0bXc4SUtwUmsyc2k5MjRDVFQ3Vis1YXRF?=
 =?utf-8?B?R2xOa2hleHlrcjZ5Z1ZrbHhyZGxmZ2R5emtzUE1zZnc2bkRxdlEyNStBYVk4?=
 =?utf-8?B?T3AzRkpBV0Z6QWZZQy95NDVaUi9rc1FyMjYrQlk5L045RWVMZG9KQktacWZ0?=
 =?utf-8?B?dCtJRm4rTmhPSzZxMGlRQWN3UERFTlFNM3ZuNWt0WFNsaSs2OUxhWCszSTJT?=
 =?utf-8?B?S0pFRHhmR3A0VllZYWNqZ2trSGl4QWlyTWF2N0dkNzJ2b3lRRGdsUXhncDZs?=
 =?utf-8?B?cWc4eVRlbEJlaUw5UEh5cHBsU2ZkNkl0eXFueFAyQWsyZzZpRVJwSWhiL09v?=
 =?utf-8?B?cmRXR3F1Sm81RCtGRFZRRHFjK0ZmdmVEeVlGQ21LVmI2cDRWS1QxbkhwL3Zk?=
 =?utf-8?B?MlEvYXFYcEYzSTQzN2laUWFYNmY4MUllcm4zSFREZFZIVTZmR3BZTUtZYnk5?=
 =?utf-8?B?TUpiK1YyeHRCYnhyVWprMzVqMVlUZXhoSS9PLzZYVUw4c09NQnVWTkl3VmN5?=
 =?utf-8?B?TnhibFRwZTB2VUQ4eEdHanZXL2NCYzhIY3piakJDbkQrYmkxRU9oTHo3SElm?=
 =?utf-8?B?TVczTW9WeGRRRUZGMmRUbTgwc0Yzd2U2c1Q5bXhDSEFIQ29oSk5MU3NsVDhM?=
 =?utf-8?B?Q1dVUXI1YWdJUnVLT2FLZTRYb1NkUFJSTmlXMEYxRHlhQlMxVTZ3QTZTMHlD?=
 =?utf-8?B?aTN4ZjBXVENpKzhVRVNkbjcxbmhnVm1GQWxkS2pzdUkxR25TWTA0ZXpQb2x4?=
 =?utf-8?B?bXlWVmFNVkM3SXN6NG4xVFAzR24yU0RxdC9oV3NkK2k1VjZTNEZNTUNWeEFS?=
 =?utf-8?B?Yng2T2prQUNuUWUrOW05ak1TNlJpM0lBNDZTR211dVFQSFNudUd0ZStMYWJK?=
 =?utf-8?B?d1o2UEVpR0s1T1ZmOFhCajJBam1Gb01XTHhzd3VOSnNUSE5vR1QvV00wNUd5?=
 =?utf-8?B?c3lmdHRIUzFpZjVOdG5PQXh0QVp2QzNOQmJnNkxSQXQ1TzhJVmxGSlVXTWQ4?=
 =?utf-8?B?S2QrY0FXK3ViQURVY1IxQWRQYStwaUdGVEk1dUx4bitjNTQydTdmanVjQ0lQ?=
 =?utf-8?B?b0E4NE9jOVgyMDA3WEtjOTgwb0d2bXZuOGRvcVJDYW81UmJOZkJtdW51bjYy?=
 =?utf-8?B?QlAxL1E0SzhmNEhoeXRXdHl3NG5QVTNmZzQxRzhQNmtMeWxuN2VPcU5mZnNC?=
 =?utf-8?B?aGhFQVRKazFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTh6NHBBdlpvODF2Qkd1bE9KbUZWU21sY3NoRW9xUEtta3B5V1V5S2VmRW5y?=
 =?utf-8?B?MXY5L0pBY1M3cFdZN3A1TVk3dnBPVDBhcG8yRFlLZ2R2Y3RsNlFOekxjaEx0?=
 =?utf-8?B?SDN0MkVNRmtZTGN4NXByWTZNdStEdGJxaUl2bURZazdxZGJZT21Ha1l0NGtr?=
 =?utf-8?B?SGplRmp5S0h2WUVJcWRnSUhaWXhUYzNOSFNrRTVCQ1BuQ1FCM0JON1NYQWY1?=
 =?utf-8?B?eXphbllnazl2cTh4TlRoZXNMbGdRcUVycEsrZHA2cm9NUFBWS3dONVREMHlP?=
 =?utf-8?B?d3hGNitHdjdFSE1xMzdSeUh5Mm01aEZFTEozSExlNHB0b0U5YmRsNkZiUkxI?=
 =?utf-8?B?MXJzcjFXWDc2cytvTXBMT3djMWkzMXlHNHZMSExwRjhYd3hDQ0pkVmxoR1E2?=
 =?utf-8?B?Rm9jQmtnU0ZvczRyb0FuK1JYUVI1NkpEL3JjSmNKcFdQMmFKRzBwdXVIRHF5?=
 =?utf-8?B?MW9RMkFBbUlFYVpiQlc1WTE5ZXRWZE5oakFtUkNhK294Mm9pSFBubmdZL2NN?=
 =?utf-8?B?T1FXT212bDJORFNZc3l6SmN0K2VEQmNHamM1aUxvQU9ZUElKRWtncWFzajBu?=
 =?utf-8?B?K1NUMkFxajBSdTJWblUwTW1JN2M3ODN1MFpaMnE3RWFGZzlZUjRyZ0JwOTVS?=
 =?utf-8?B?RmFpSnBabXZEdUMxaHNSY2VvYmZVUVN4eElRakNQSXBTMGthZmVJTkphUmxn?=
 =?utf-8?B?TmVRcCtkUnNVbVZ6UVR1Y0RCM01JZW0xdW5VWVc5ZFYzc3ptYTBKNCt6dUh3?=
 =?utf-8?B?NEc2QTgxc3hMbG9QWXRQNUtHL0YxbEQyUUlqaGt0Z3JhS3pHMlZsOVdjeWRC?=
 =?utf-8?B?OUxER0FBSFZaMk8vWGF5YlBNYWFJS2NDeWNaQitZSEIvSkdubW9ZbjRORUFq?=
 =?utf-8?B?REtTQjNoTU5CU2FzNXUvWHFPeGM5QXBWOWFyaVEySHZYdDV3N3N3ZFZOZFhU?=
 =?utf-8?B?NHI4RmRiL3E1NTdzeTB3QytIaTNPU29xQjcrUVZ4Q1JQS3NXbFltNGtUUkJr?=
 =?utf-8?B?QldMY08vUnl1UGRsZElxQWRJQisyR1VHZ0sraVFwYTJxemUwSjNRM2phQXhN?=
 =?utf-8?B?alVnQ2x1NEdXVUg2Z1JEbFY2MjZWbE8xb0dWN2swY3NRK29ZeFpZVzlTQ1FR?=
 =?utf-8?B?aGZPM08yVHJybm56dTI5Y0MwVlAvQzFQa21iMTNhWHBOMUhnMWVMMmw5RkZG?=
 =?utf-8?B?dTNKSjl0U21FV0VkRTRUSlA5NkZ0OFM1UUJ3TncrbEJrT2d3S0Z5enFRY1Rm?=
 =?utf-8?B?RGpIdFlFTGhzQnBuZ1VRdzFzMERjcmJNdERLU0JFMjY0Y0FQR2pzdlBWVnUv?=
 =?utf-8?B?bUdIaS90cFJQUFowN3VCdnNoYWJjenk0cDliZ01ES0VhOEdKcGh4bjJQYkU5?=
 =?utf-8?B?azJZZVFvMVFJMFBZNCt3M2J4VVcxZUovb3JXQjFUSENWNWVaMklhS005Tktp?=
 =?utf-8?B?K20vSk9vclJNMlZhMktKMm5Lay9TWnRaNTN6bEhHUm9SSXc2SlNidnA0ZDZh?=
 =?utf-8?B?ZDNXVXJlZll2LzNvYnptVmZDem9KeHowMHV5cGF0clFKY1FLS1J4Sk1zc2x4?=
 =?utf-8?B?K2RkNnBWbk1NQngrM2p4ei9HMGk1a09ZYlVJNXhLbWVabkxVMXl4eDRtZ0Rh?=
 =?utf-8?B?NUplNG0xU3U4anJibDZzR2NsQW1WSHlGUTh0djBsK2EyV2YzTXFtNE15WjN5?=
 =?utf-8?B?eDYvdCtpK0Q2OUJ4RmgzQUhldkUxZi9QaktnM0MxcWx1S0ZYUFh3K2xlMDNR?=
 =?utf-8?B?VEU3QXdQaU82QUZoL0ZQVFQ5MjNVbjBJVmVRQ0F1R1pYYTl3SlVwWWxZT2hK?=
 =?utf-8?B?Sk9WUjdZZU5meC9UVDJhUjBoUnkvSndGcGRySWdTeGdJcVJlQ3hwOU9Zci9u?=
 =?utf-8?B?NGs3VFdoemRMaW8rME03eDRycy9ZUkRCa0Fkb0g5SGFoQmRyTmR2SW5KdGkz?=
 =?utf-8?B?RkNIWHF4SGgrcWtaNEJYc3h4akcweVN3cFptTFpDdEJYNE1tSDdXWEVRRFY5?=
 =?utf-8?B?aytBenR4QU0rc3JKSGxzZ0VZRVR0QlR2VXMxdlhjRG8zS21ad2Q0dmc5eGNH?=
 =?utf-8?B?RVJTeEl4TTB2WEZCR1FnRWFzdFFrWXViQ0JDQXZqTmNOZzRqcVg2eFc5NFlt?=
 =?utf-8?B?TG4wK2tOTVFiaGtvcmY5WnlDTkFuRkpZdllPOE9iN1RXNy9BN05hUnBRUGJx?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GllgRrsj0OQmfGgcl/4hIBQZxe44k6IkQs5aX+2VFopbBoGzLCS/ziKdsRZhWk7N3NW2nfaJzvUA3s2iwlcj37mjB2eZMHIblXOoD8ZYt+Siu5BXd1xIa7S79UlLkgW4b1yZvPrw/irO6qJXP9huGlmaDx5ZG5QSRioM0uuvFR24dOmyEBJ4fUt1EO+C8zgRmxJeOq3H0ac2DMowecLdUo5hYbC27r9cb0Vjd+FzKCHxqQVS/7dRi0LCX1h+W6MprRSdKtOWgXSTZMXbEHSKSvLyVliNooZljxFVAdtRGBYoAaTyrKemumZG914bmp6DvcuRtgx73kaBagxZ2qb+Rqa2vvLy0XQhgHHw0Qvywp242ecfxw4c45Y+s86u0VgsDv41a1JiipMevBaj79Ksk7Og3IHq/D1/AQ+lOM/w4RP7wX6XR9nr19wZAOdcwltoKrSj5qTUWcL7Ke4XbKo4oo7uY5e0jUv/r707B36WbHAhEzb1mg35zpL1WalKMASsE4ZP9KQuTWYUYpshJTTDuX5yrT3gemDD2WfgP5K4SfNNOzxVBXB6kPnlyCeEjqf2ErLcqQQurl/ii3GrBWGkA2xCCBlx69evoUjNhSOrY6E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236ebe74-0d65-48d7-f24f-08dd7aab5d4c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2025 16:50:58.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cnp6z93FQDrWoHedH0ND5wIP2XIPhQ0MAB5gh/mrwn/HU1VgpGotsEkg2Jbp/X7QM+HcUSpZ5Wi6x96p7VTsqf74N1CgVowxJURFQE3/rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5016
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504130129
X-Proofpoint-GUID: MQijhhg4ex_E5rPywVSAG6RCbQG33Blk
X-Proofpoint-ORIG-GUID: MQijhhg4ex_E5rPywVSAG6RCbQG33Blk
X-Mailman-Approved-At: Sun, 13 Apr 2025 22:58:19 +0000
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



On 13-04-2025 16:54, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Driver adds support for panels with Renesas R69328 IC
> 
> Currently supported compatible is:
> - jdi,dx12d100vm0eaa
> 
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  13 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 282 +++++++++++++++++++
>   3 files changed, 296 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index e8723f42cafb..86c66f818a11 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -618,6 +618,19 @@ config DRM_PANEL_RENESAS_R61307
>   	  This panel controller can be found in LG Optimus Vu P895 smartphone
>   	  in combination with LCD panel.
>   
> +config DRM_PANEL_RENESAS_R69328
> +	tristate "Renesas R69328 720x1280 DSI video mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for JDI dx12d100vm0eaa
> +	  IPS-LCD module with Renesas R69328 IC. The panel has a 720x1280
> +	  resolution and uses 24 bit RGB per pixel.
> +
> +	  This panel controller can be found in LG Optimus 4X P895 smartphone
> +	  in combination with LCD panel.
> +
>   config DRM_PANEL_RONBO_RB070D30
>   	tristate "Ronbo Electronics RB070D30 panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 61d8853df1a7..37e4e13165a9 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
>   obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
> +obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
>   obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> new file mode 100644
> index 000000000000..207067b29473
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0

add Blank line

> +#include <linux/array_size.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#define R69328_MACP		0xb0 /* Manufacturer Access CMD Protect */
> +#define   R69328_MACP_ON	0x03
> +#define   R69328_MACP_OFF	0x04

remove extra ' ' after #define

> +
> +#define R69328_GAMMA_SET_A	0xc8 /* Gamma Setting A */
> +#define R69328_GAMMA_SET_B	0xc9 /* Gamma Setting B */
> +#define R69328_GAMMA_SET_C	0xca /* Gamma Setting C */
> +
> +#define R69328_POWER_SET	0xd1
> +
> +struct renesas_r69328 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +
> +	struct regulator *vdd_supply;
> +	struct regulator *vddio_supply;
> +	struct gpio_desc *reset_gpio;
> +
> +	bool prepared;
> +};
> +
> +static inline struct renesas_r69328 *to_renesas_r69328(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct renesas_r69328, panel);
> +}
> +
> +static void renesas_r69328_reset(struct renesas_r69328 *priv)
> +{
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(2000, 3000);
> +}
> +
> +static int renesas_r69328_prepare(struct drm_panel *panel)
> +{
> +	struct renesas_r69328 *priv = to_renesas_r69328(panel);
> +	struct device *dev = &priv->dsi->dev;
> +	int ret;
> +
> +	if (priv->prepared)
> +		return 0;
> +
> +	ret = regulator_enable(priv->vdd_supply);
> +	if (ret) {
> +		dev_err(dev, "failed to enable vdd power supply\n");
> +		return ret;
> +	}
> +
> +	usleep_range(10000, 11000);
> +
> +	ret = regulator_enable(priv->vddio_supply);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable vddio power supply\n");
> +		return ret;
> +	}
> +
> +	usleep_range(10000, 11000);
> +
> +	renesas_r69328_reset(priv);
> +
> +	priv->prepared = true;

a '\n' before return

> +	return 0;
> +}
> +
> +static int renesas_r69328_enable(struct drm_panel *panel)
> +{
> +	struct renesas_r69328 *priv = to_renesas_r69328(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
> +
> +	/* Set address mode */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +	mipi_dsi_dcs_set_pixel_format_multi(&ctx, MIPI_DCS_PIXEL_FMT_24BIT << 4);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +
> +	mipi_dsi_msleep(&ctx, 100);
> +
> +	/* MACP Off */
> +	mipi_dsi_generic_write_seq_multi(&ctx, R69328_MACP, R69328_MACP_OFF);
> +
> +	mipi_dsi_generic_write_seq_multi(&ctx, R69328_POWER_SET, 0x14, 0x1d,
> +					 0x21, 0x67, 0x11, 0x9a);
> +
> +	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_A, 0x00, 0x1a,
> +					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
> +					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
> +					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
> +					 0x11, 0x18, 0x1e, 0x1c, 0x00);
> +
> +	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_B, 0x00, 0x1a,
> +					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
> +					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
> +					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
> +					 0x11, 0x18, 0x1e, 0x1c, 0x00);
> +
> +	mipi_dsi_generic_write_seq_multi(&ctx, R69328_GAMMA_SET_C, 0x00, 0x1a,
> +					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
> +					 0x11, 0x18, 0x1e, 0x1c, 0x00, 0x00, 0x1a,
> +					 0x20, 0x28, 0x25, 0x24, 0x26, 0x15, 0x13,
> +					 0x11, 0x18, 0x1e, 0x1c, 0x00);
> +
> +	/* MACP On */
> +	mipi_dsi_generic_write_seq_multi(&ctx, R69328_MACP, R69328_MACP_ON);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 50);
> +
> +	return 0;
> +}
> +
> +static int renesas_r69328_disable(struct drm_panel *panel)
> +{
> +	struct renesas_r69328 *priv = to_renesas_r69328(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 60);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +
> +	return 0;
> +}
> +
> +static int renesas_r69328_unprepare(struct drm_panel *panel)
> +{
> +	struct renesas_r69328 *priv = to_renesas_r69328(panel);
> +
> +	if (!priv->prepared)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +
> +	usleep_range(5000, 6000);
> +
> +	regulator_disable(priv->vddio_supply);
> +	regulator_disable(priv->vdd_supply);
> +
> +	priv->prepared = false;

a '\n' before return

> +	return 0;
> +}
> +
> +static const struct drm_display_mode renesas_r69328_mode = {
> +	.clock = (720 + 92 + 62 + 4) * (1280 + 6 + 3 + 1) * 60 / 1000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 92,
> +	.hsync_end = 720 + 92 + 62,
> +	.htotal = 720 + 92 + 62 + 4,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 6,
> +	.vsync_end = 1280 + 6 + 3,
> +	.vtotal = 1280 + 6 + 3 + 1,
> +	.width_mm = 59,
> +	.height_mm = 105,
> +};
> +
> +static int renesas_r69328_get_modes(struct drm_panel *panel,
> +				    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &renesas_r69328_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs renesas_r69328_panel_funcs = {
> +	.prepare = renesas_r69328_prepare,
> +	.enable = renesas_r69328_enable,
> +	.disable = renesas_r69328_disable,
> +	.unprepare = renesas_r69328_unprepare,
> +	.get_modes = renesas_r69328_get_modes,
> +};
> +
> +static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r69328 *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->vdd_supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(priv->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vdd_supply),
> +				     "Failed to get vdd-supply\n");
> +
> +	priv->vddio_supply = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(priv->vddio_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vddio_supply),
> +				     "Failed to get vddio-supply\n");
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&priv->panel, dev, &renesas_r69328_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_of_backlight(&priv->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");


drm_panel_of_backlight, 0 on success, or a negative error code on failure so
	if( ret > 0)

> +
> +	drm_panel_add(&priv->panel);
> +
> +	ret = mipi_dsi_attach(dsi);

if ( ret > 0) it return negative error code

> +	if (ret) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&priv->panel);
> +		return ret;

use return dev_err_probe

> +	}
> +
> +	return 0;
> +}
> +
> +static void renesas_r69328_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct renesas_r69328 *priv = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);

if ( ret > 0) it return negative error code

> +	if (ret)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&priv->panel);
> +}
> +
> +static const struct of_device_id renesas_r69328_of_match[] = {
> +	{ .compatible = "jdi,dx12d100vm0eaa" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, renesas_r69328_of_match);
> +
> +static struct mipi_dsi_driver renesas_r69328_driver = {
> +	.probe = renesas_r69328_probe,
> +	.remove = renesas_r69328_remove,
> +	.driver = {
> +		.name = "panel-renesas-r69328",
> +		.of_match_table = renesas_r69328_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(renesas_r69328_driver);
> +
> +MODULE_AUTHOR("Maxim Schwalm <maxim.schwalm@gmail.com>");
> +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> +MODULE_DESCRIPTION("Renesas R69328-based panel driver");
> +MODULE_LICENSE("GPL");


Thanks
Alok
