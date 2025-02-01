Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CEFA24AEA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 18:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C13610E3AA;
	Sat,  1 Feb 2025 17:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="TWsq1E3g";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iSgnVzkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924A210E16C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 17:06:33 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511BDgqP010233;
 Sat, 1 Feb 2025 17:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=K8zjT/K+QdffRWjOYh
 vH2XOl5UPsG//XM/8APGCD9wk=; b=TWsq1E3gwig3yzMMuxqF5bfmIY0V8n2k54
 9/rJHy698RD8ACsO2p99sFwlecSSURE4vPHkWPXUAUHDDoiU8NTkw9fO1QMiJ2DQ
 11bYq65zGcvpjQQ2raMBcybccwDRI9UV2WU6GQTVphS+9s8tQF/KWmh37ViMMZB+
 TnhuZU4/0GvOeTT40ficOij3PzuoSdpCSDBUxRgjTpAXbUg+NKTY4ALo2a8ISvSI
 U/fuYD+So3jEKVwV4tEFHq8ichjeTZD6VJXyzGkY0WSYpik+6qcGkCqj8WXtzWq9
 Lx0SUlQZ4WWLFeHEQBIZlW2aUqE62I2qLyUKmP3lVqe4NVbg4oJg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hh73g72m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2025 17:06:08 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 511F0bsb027922; Sat, 1 Feb 2025 17:06:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44ha25w6b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2025 17:06:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrlwMhh9jA8uow003MU8wIm3RKfNlCOSczfTqPWAGnshZrJ+iMAHqa8xpZpCqLd+19kunzrsuHwi26PlrepDTG/S0fStw6Qp/YVjWEQnsf2gVxpPoxWsKGP8WAsvee53hvBJadOXAnMoSQc8iqVd93FA/idivP77FTcDvTw5Splh12RIqXGbjsSKdrRPK12nsbgxWwQGM/tHYeLAOaemRqN+nBeqXEpk1T1X99dcd+z5u8fj4creYIXiKhUEahAADOp5Yi+S7In27Gb/64v/xcrGsnQmGKiIkVszUAC8SoCMC/ZFZv4xX+dNuCHSdhYS5ZRr5gOnvd0PbnD87sFDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8zjT/K+QdffRWjOYhvH2XOl5UPsG//XM/8APGCD9wk=;
 b=gACTQhaL6F3w6yF9xmQh0dP7ByWB9qCmWfqqj1B0X1oH7M93bRTsMSKUvsQJjgux7nl6aDXBal+5e2YcI/yxgQBjatwr8ygBerIDI7Lx1T8PxyQfxJsW1gL/Q+/clBMsqreH20cMVcw0V3zA5700PRhW3CNsG+ZDv3xzwVqAYMWpAPz0um7Fujek3fi0eoecuVpzYI7sh+v2RklxOo58QB1x+x8rF1ZCJ8TAKmAT/dWggb0QG9+6OD11S08rygq/gZcNR0jYk+L+FBlhQHiPC5fbQ9q8l9qqXwU3r2ee3OMOOUeZQB0GUbziep2bYqLy/IR/+yu2hNIfcwfQrMnQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8zjT/K+QdffRWjOYhvH2XOl5UPsG//XM/8APGCD9wk=;
 b=iSgnVzkUmvilip/1ehZLz8lxhTXVMh9rf67/MbCBUAgahtZ+Qo8eC3NRPoyRlWBAHONpmVHdhDGwjftuVahgRVGU34j3tQ1c/0e54XMAHRHeMu4+5S2VvlPOOVbBh2DHzuBjC4/anzCtaUJ5StBn0A/9KCesqjXrOU+SIrmaLko=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Sat, 1 Feb 2025 17:06:04 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Sat, 1 Feb 2025
 17:06:04 +0000
Date: Sat, 1 Feb 2025 17:06:01 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 3/3] fb_defio: do not use deprecated page->mapping, index
 fields
Message-ID: <e38046bc-fa35-4f4d-b0e8-00ac4637c725@lucifer.local>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
 <3542c5bb74d2487cf45d1d02ee5e73a05c4d279a.1738347308.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3542c5bb74d2487cf45d1d02ee5e73a05c4d279a.1738347308.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 844b7a0c-5feb-47f3-d9e5-08dd42e2b631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dsac8bFwHHDc2a8rXlaosJBSwsiaNVhD9EeCbt+2jrHlFpFL2Bah9UDAFYiL?=
 =?us-ascii?Q?SKz1i/2YEgZvkptXSK7OBRU0FXcSjdR+XiDp6leGZqLF0L/NUKjT80++/00x?=
 =?us-ascii?Q?PLKMFeCOT2+Qfa+OazkBrbnKGVxKYMjRaunBdji1JMQmd4FvPjWFhEPIcubc?=
 =?us-ascii?Q?lYo2k96eFr6eJVAKpdgzESPtfWSZPeL/CxzBhm64k6AbjQctdcWp0Phy5qPC?=
 =?us-ascii?Q?hRrTpKYtyF+cjIf66MiGMn/JUNxabydsHL8fIFvNCgSPERNoxfmh5XZP5SG6?=
 =?us-ascii?Q?FKCo+BPveBvG3w5gdUUJgFo5AZFGuSD6TFylj5gfArV5VsopRBjT89IQqFzc?=
 =?us-ascii?Q?x3wlRIcx+pfyFZUk24gDbx57bTWnJGD8XzwmoQN2xMytxsck6M+lJYfMjFPE?=
 =?us-ascii?Q?JwofhhahZkswrTYjkpY7sY1D7odf+FR/AGsL/aVqgJQPf+MVUTbdPyB7Xuf3?=
 =?us-ascii?Q?afX0072dJ7vuBMdNVbCDv7MHMC67T0VMYkYdWCrQ+qBYH0XtQj80w+0aE74a?=
 =?us-ascii?Q?QVPG0sGsiuOMDAEW1NIkBFmWmNNPz+tRk2x0M4rt4tjbNx7mK/4X7YQh2mr1?=
 =?us-ascii?Q?56NUBqiuWzDrTF68+YaeG90lpO3ziAFHWe4SrwJQLGjQlfKfmoZrqBzS6zvM?=
 =?us-ascii?Q?2Nw2IrKOCOpQ2H+KqNk5OQ57aebdkIIe1L6RodzKbmps8Iqdi8i+Sf2Y06Ev?=
 =?us-ascii?Q?YAkyOqU5dSG3idnGY11KfQDSPdKrgd+Y0n0Ud9njkTCdW4bslV4usx1tclrI?=
 =?us-ascii?Q?JNX2NSG2RvZwGz3sq9v4UILEJRc9+N1SOtEEQBq4PkJY+KICgNWA0kdC9Aqi?=
 =?us-ascii?Q?8hLetp3DbnzkfNH4aQnFClcdtuU8ag3PTxuHyRPDKaqaMfo03u5aZmIUPm4c?=
 =?us-ascii?Q?hEwuwOAeRU91hH+ikKKZ0/11YeNXW3vYIlDtT6hoKzoRbnRvzUHXRN27FUfa?=
 =?us-ascii?Q?GxC1envoFbKHj1Nh1gX7rFXC2m6ZvBhqK3sC1l1xHtmXEyFP/qEN0KGX7ZkM?=
 =?us-ascii?Q?9CADMjKbMDhEh5VviVogTzWFaZMvaUcp6qLm/nvEklc0OyI1XLPsjmSN3yNf?=
 =?us-ascii?Q?2Zi8S1jOXFFM57wecKK57tNvgEuJFaAd6rrF/2LYZB+aV+Dgf+4rnrqimIfR?=
 =?us-ascii?Q?GtGpI7PJ9vnHR8dCX+WEuNGz1DD8jHrNL3u223rxBIlW22WlV/MM4v16FO7M?=
 =?us-ascii?Q?m2WeTq7IKC+2D+OasWRzgf4oa5XrWnwSg6uJeS2txAVuyDwFtN5FvyOn6W76?=
 =?us-ascii?Q?NvFyB8cSpjX1TzwuMmJzTKAQifYHj3PWPv9des32myXPXG+F1doC29ctjkDX?=
 =?us-ascii?Q?BgYhW2bwwvIP+JNQ0sCIJ4ypgbQufO2yxXwu7wkyULgSA/BV/nsksfNq60tE?=
 =?us-ascii?Q?PdCdsQr+L8xT3Ay/NS8qa1nhf4vo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2DWg7ytrLiVE+EXODTp4+u7xkpQbH0bDC0SEPseT8/xJJngozKDBO5uoDJS2?=
 =?us-ascii?Q?gxs7IKsJFFyAHmZWfuG3SRtvir+XFzHd5G5cvXab58RUMENjoKXHWZ/nxWa5?=
 =?us-ascii?Q?RTd/VejpeH1JUbt43ZIvWV8N8nhpRLuDTr3Lvi0KGKaDwKTs6xqgtabAKq6Q?=
 =?us-ascii?Q?oNcE7uI6+k9fJlNQBB6oXSZOinPCUFBZPgs3CJl26fy5RkNXuw3UzrhjgzEg?=
 =?us-ascii?Q?2DignkyxMWXv+JfMgHznjQRPIRtQAw23xJFy9dmBGlurJNAILCeEYYZmMORx?=
 =?us-ascii?Q?m5tzkSuspBSXCt7vkbYK30PFLcQPS8JIjJ7BGioDUtubZv5tGnJIXfbN8lF4?=
 =?us-ascii?Q?5e2ErsqtD5F56j3R6cV8kOEEqpyt3ZOCjTn1DZLtfiytK4YYswC+TkXbmhsb?=
 =?us-ascii?Q?60GyRFN8ORHCybrM0mqsUxmHokmIjEAwoPR3wxwX3gk8E5NR/K3tif+9NUBU?=
 =?us-ascii?Q?zXcfR5HmnS6vDpiRzi2A6rUJb5AH5mm/kl0+v+SbwqVbGfdfBYYJpeWvu23d?=
 =?us-ascii?Q?BQVmJixbhnt2QZlvIlgpJAIzN8665yiwe2MIlL70NDq1w5gfDq5XKbc+KbHp?=
 =?us-ascii?Q?EqH7vZmkCGClxAt6w/5ZegR4Rwvh/oACAPvS8meo7IPQODcLvtGyicuJbQOl?=
 =?us-ascii?Q?PnIa+LwlMoAzBceQbvoP93TK2Mt7Cyv/1EqHji/nDqLbfLOTAhHmDvqTizQl?=
 =?us-ascii?Q?w8YmdupbEEZ4K661UfSh+qvwuqB2iW5XM8OyJGQAjevl5HHNnCsZ/j3xyemz?=
 =?us-ascii?Q?KyhTy2k9yeIx2yWbQhO7dxyyJ4VFPhQI6UtSqI0NCAzczWaD1XqstM8IJ2CS?=
 =?us-ascii?Q?3c46dDLFAHGx8GiIDc35gawTj6Ur48chHDiHlxxTd3KAcDUIbKC9rdHv8WmS?=
 =?us-ascii?Q?Byzg6VKoq8MTk+ccKssKKaNLJCa8GMBcqyv8cRjM2DHc+OEC5CCSuRtojgK1?=
 =?us-ascii?Q?A2OXnoh1r0Lw3GFGqpBS8wYmoHYUu1GXEunQxHD9Iu78jjADOUi3F+MbzEY4?=
 =?us-ascii?Q?+03VHnmxN/FiMzZ2ykrcld6PPeYWBQ1mn3/nyfpYBjjDp7dvgDePzDR5JPEN?=
 =?us-ascii?Q?fmTGYRbiA4A4Xg1H6Qx7PYxsOKi2J1qIjD27bKbXJCXRjk+TWWFFBD+k8ONf?=
 =?us-ascii?Q?hy/M6luGigk0iJnRP7r/LKjA6yt1U0pnQaOZ6eTU9pXh96nrQ3sutXQNo0/b?=
 =?us-ascii?Q?vc9s2SfZkH4WKaaQVAmJtYKHcj3pwpwTN0Q3+lHwg9JsJOgKgx0CTi0On750?=
 =?us-ascii?Q?dR0ZFtQszuWoHRb9dGndn6Ow1GM3Xmyv8d0dfU71xi7xlOGj2PdLz1dvjgbh?=
 =?us-ascii?Q?VfsnPgTF6plUO/wJS0NLuvtfTEU3Q7Y2fBrVPo84NwJnUHHafEJs23OnFXCp?=
 =?us-ascii?Q?8CI3yajzzTN3ZVrP005jNDHVy+tmXzERmQCEzu7ab4KIQ3uusU7HYLV4F1BM?=
 =?us-ascii?Q?gycJfqK/ECdJJG2CAKfDev1h+AyrQN0vZ4gyhFZ5vq/DW1OMxwTofyNLhu3T?=
 =?us-ascii?Q?HqQZ3ywTo73oTZe2CvdENaHeoI/9NvXwItGgnSFTxlDietXe9BOlGaji/snG?=
 =?us-ascii?Q?fMZoIm81Zif9XDQJik13zGWqWu/ORB/vqVhxshulAH5qjK2OqhEnCTuWrrDq?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xfLEuEx9kgfJbzFL9Jo2uydANkihZnBuJI97bZbCVSXhL90ecP1WTGlcMFSHbZPw3p+dIDtCyswgro70mFEv4nRWrUUqvmC6j8/qpdfT1406zR2SLMyJbtMVBH2/ZXYRchjcc5ardThW0afvmEnmpaRA+clQmuwqMxWInecFDO7zKMJacH9MW3tKJfHUqPseny2ZlA6bbbWiUGqnHUDUvftNeJm54spFba6gzJhh6VbXCDp8rVWWJxoMPJ8txxXMrXnLuUtc62Qog79h/l1mhDSPhI3NuzfHQ2aGYDo8U7lC6otRGymsm8//lHLtCF0BSn7PL1alvosA5/Luliv+Vc0UnYpUxI8AVQzfGOLzEtM1nn3pv7mohh6192yfdA252nKmCkL5sd1PrJLx8ei+bBGiy7Y7z+jnFul3LvPsChwtuVOHvxD69nCmpmoy888I1FLdtKj/Zc16brxBXxf7AS75o3SKWYSgnVV/RpAPtCrGU8HtVh8SPBkDl6TdF6kZBEBQFmfXwIeTHdblMjKiSK0B803HdBAomP5iPGnlSQ0sXIsaFq2juk5UihawsJE8ShzgEPSFjNDkUVthxiNjWqdFDDwxt7uP/1sQerdHHHw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844b7a0c-5feb-47f3-d9e5-08dd42e2b631
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 17:06:04.4292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWMK/2mCfC4TcoPfBJyWUW0gddIV5D3UWQ44fpXZb6RHrTyqDnd6ojblb9MSttW29Uav4Iv2lYwXwtINHx3rIW34ZEkGqhlknSJRdTXHCKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502010148
X-Proofpoint-ORIG-GUID: QKTESQvBG2cdjSo5vtERlQNFw3286j9Z
X-Proofpoint-GUID: QKTESQvBG2cdjSo5vtERlQNFw3286j9Z
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

(This time sent in reply to the correct series...)

On Fri, Jan 31, 2025 at 06:28:58PM +0000, Lorenzo Stoakes wrote:
> With the introduction of mapping_wrprotect_page() there is no need to use
> folio_mkclean() in order to write-protect mappings of frame buffer pages,
> and therefore no need to inappropriately set kernel-allocated page->index,
> mapping fields to permit this operation.
>
> Instead, store the pointer to the page cache object for the mapped driver
> in the fb_deferred_io object, and use the already stored page offset from
> the pageref object to look up mappings in order to write-protect them.
>
> This is justified, as for the page objects to store a mapping pointer at
> the point of assignment of pages, they must all reference the same
> underlying address_space object. Since the life time of the pagerefs is
> also the lifetime of the fb_deferred_io object, storing the pointer here
> makes snese.
>
> This eliminates the need for all of the logic around setting and
> maintaining page->index,mapping which we remove.
>
> This eliminates the use of folio_mkclean() entirely but otherwise should
> have no functional change.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Tested-by: Kajtar Zsolt <soci@c64.rulez.org>

Andrew -

Sorry to be a pain but could you please apply the attached fix-patch to
avoid build bot failures when randconfig generates invalid
configurations. The defio mechanism entirely relies upon the page faulting
mechanism, and thus an MMU to function.

This was previously masked, because folio_mkclean() happens to have a
!CONFIG_MMU stub. It really doesn't make sense to apply such a stub for
mapping_wrprotect_page() for architectures without an MMU.

Instead, correctly express the actual dependency in Kconfig, which should
prevent randconfig from doing the wrong thing and also helps document this
fact about defio.

Thanks!

----8<----
From 32abcfbb8dea92d9a8a99e6a86f45a1823a75c59 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Sat, 1 Feb 2025 16:56:02 +0000
Subject: [PATCH] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU

Frame buffer deferred I/O is entirely reliant on the page faulting
mechanism (and thus, an MMU) to function.

Express this dependency in the Kconfig, as otherwise randconfig could
generate invalid configurations resulting in build errors.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502020030.MnEJ847Z-lkp@intel.com/
---
 drivers/video/fbdev/core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index d554d8c543d4..154804914680 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -135,6 +135,7 @@ config FB_SYSMEM_FOPS
 config FB_DEFERRED_IO
 	bool
 	depends on FB_CORE
+	depends on MMU

 config FB_DMAMEM_HELPERS
 	bool
--
2.48.1
