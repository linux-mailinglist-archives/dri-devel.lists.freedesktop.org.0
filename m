Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A999664FF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D07510E1B9;
	Fri, 30 Aug 2024 15:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="f0BXo5kX";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="QC4Usvf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917E810E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:07:33 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UCc7KV004246;
 Fri, 30 Aug 2024 16:07:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=/4SghRQjJA23TrED2Dnut9pJN
 +AtQa8o7GFfpUKhlAU=; b=f0BXo5kX8mqNIlR3ikz1DkspuZsAzzFIj1S8bja4o
 /XZt8KQH2duF8A34I2fwaeO7ekCh/9aQ7OOwxAin8jSLrGwpfyI1OWTZL+ncnlvE
 kKO94FZ75ZVsIAWA3K9dUp+V+jhOt0/og7AtJjkKJGxLmDcVi0Kw/q40WCcEt7/I
 JGWRYNFBhGAS5fjJ0ZwnZwuj/JuTI731d5WSBI21upZWIGv/lZCbprmRbR8IevmW
 11c889qj+sm5il6wwZuokZvZ3q7Xxcej3iVaGD3Wuw7Rq6ZHh9Z4WDD4RkJIyg+N
 6dbKT13sEM/XMl2e395Alg3huAsAe7MhwKqIK3pG5IoTA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4175ss4qmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Aug 2024 16:07:20 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 30 Aug 2024 16:07:19 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.0) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Fri, 30 Aug 2024 16:07:19 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU+6Y83rZtUzWJZqvaF9nzEu1yYATYaWgWeoBvXZY7fggRdsmEyIzIncKcjI443cxFmi2Y8ki9XTQR6Kw71rnDiWQys64jGHENCTYqpLm0w24vPGsnpLP+P6YJOVlch9WZdxzs3lp/MoRJyyAXFz5Sr6WSnfP0jAVoG3Zw5Sib1jIpV9S3YTyRgwxf13QpjHeY3J1IiE/9HJ76twNhsTwfknh+vpw8Kjwt8tYVovMVKv0UX70yQVfsRnLB9tIr1cBDcczXv6CtDU7bCy6r8e0TBByOx5Y7D/mv2Zd2mSFmREiaK4SthHinlI4gWTE5RPWhxqz43oSedj32AF+5EUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4SghRQjJA23TrED2Dnut9pJN+AtQa8o7GFfpUKhlAU=;
 b=obeXWmC3gzmT6t/wkYaZhOchs5i4LUe17Trv9lPcBH5t1O5KKeEcsor3I9ZOeyGZAdc9Yp8Hc7SM9GQruIR9v9R8ag/S9BB9B74ZWIfMkrdMqhn/vI4s/r98CncLndy3SkXBB9VoqZ2/6LbSK14OPL7poiGxVSstsTLR/ENDuf6OWI2mJ8v+Qn2m5jLn2KBnijk7+jPyxfXjUbjCSKDIB934L3xsDj8E2pZrVKTC2HvKvUyze153tJoye05kN+s1V8NtZ7sRyBTOEyjzGO9BOR2bXB7OWYM1+/EmsYQ7owCzU9rVc2cdroKYGJOCOOmf4W7yUTEHpgyrao7awNXdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4SghRQjJA23TrED2Dnut9pJN+AtQa8o7GFfpUKhlAU=;
 b=QC4Usvf2Pw2umw3QByyNnHK/lTDBxxR+ff8do7Clj8/7Zv+ZsTyIk7ZC+tV1rFd89BjIU5iLZTwdYl7CLhVqCdwmX1OaPqHH0RAiR9EpCmdKXzCatFxo0iBZ2hNyaobmMKJuiwS03MDLK4TFCnM5cUbzK9mKbwmBPcdxgaFMNYU=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO7P265MB7800.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:413::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Fri, 30 Aug 2024 15:07:18 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 15:07:18 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Frank Binns
 <Frank.Binns@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Topic: [PATCH RESEND] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Index: AQHa+u5O/u8rBoZPnkmBNlko2NOpjw==
Date: Fri, 30 Aug 2024 15:07:18 +0000
Message-ID: <35867394-d8ce-4698-a8fd-919a018f1583@imgtec.com>
References: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
In-Reply-To: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO7P265MB7800:EE_
x-ms-office365-filtering-correlation-id: b0c7d224-349a-4539-5688-08dcc90570b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q2RjL2pkVVcxaUxXUFJ4WkdKRHcxU3ZaNGhMTENjM3RKU2ZHUTlhbmFDd2RN?=
 =?utf-8?B?ZTFnSjhPRFRMajJyQ0dqVTlMRjJLd1d6SVlyVXJtZHRNeGRzek9LRk1Rcmlr?=
 =?utf-8?B?NU9GdmVOSXYxZlB0QjgrTjlSVU9pOEZzOWxvOFZnQVZ0NTg0NkZyUCtsVjJu?=
 =?utf-8?B?VTh3TURrM2N0cEJXRzQ4Y3NLclpuWEZhTFZpRDEvdUFaelgraVRrUzRRejZ0?=
 =?utf-8?B?YVNXOUFsY0FML1AvMTErcHgwbmFVT0ZFandEYUZzOHl0VHhqdXoxeE5EdlIw?=
 =?utf-8?B?ZzFYd1pqZ3hKME4ydDV5cWtwbHlCbEpZWmM3eEFpSmlBTjNFT1hNc1JJbzNn?=
 =?utf-8?B?bUpLeTZBY2VnZGRBMjlXcHJ4d0pKZWRRWVFKeWlveGFFTnRRT2VkbXhzcmZl?=
 =?utf-8?B?eFo0WGNjbGoxc1V0R093VGdiSWhyWVJhUUM3WnBlWWRGS0FlbEtmWGF3SEYw?=
 =?utf-8?B?V0FKc1VSV2ZQUGc2ajFhSnZtTS9TR2YrK1kwbUV3VGtSL0hTcXQ1RWllNHMx?=
 =?utf-8?B?SGlMTmFZelk4Qlc0R242VE9ZWHZ4VGcrOXRYdlhPRFNybWwrQ2lFbzdJMzR4?=
 =?utf-8?B?RXp4VXc5MDRVTVoxNXpuS2dYeVVRVWNCY2pQMS9USm9nZ1NjRWd2WVRES1M4?=
 =?utf-8?B?aHhMRXRVNTRid2ZRNm8rWkt0a05WdVB4QytFdG54RG9nQmlOTHpvVUdMVThq?=
 =?utf-8?B?MUZKZ1BZRGhaVlRyRFRaOGZIbVBQdUhQTXo4RjJCRTBZREtDUk5aQ0Z4eFBL?=
 =?utf-8?B?aDFtUVQ1bmNvTXRENlJTSHdPQUx6SWNlVm9uRzFyRCtDeUhwTjZpbm1LNVQ5?=
 =?utf-8?B?elZERjhIQkdGc09aaGtTbGg2TDlXTWZOcFNQQTFIQURJT1hOVGxWUWZLbXVT?=
 =?utf-8?B?TVFZazVEMzZHTmtpRVA4VldaZXBlTzFNSTFwcGltdlNaa05oUVhGMHdoM2FR?=
 =?utf-8?B?VkpTQVd5YUkzSTdvaXI5M1BiSXlYM08rRE04em8yRXU3ZVpFUXZGc05jVG5K?=
 =?utf-8?B?ZkZGTUUrQkhFOEpkS0ZDQ1Y1UHpYWG1NYlE2cVJTWVpUektJaGtSd2M1Vlhp?=
 =?utf-8?B?TVN3NUllV0NGczJ3cmtUUVZrWFNvam1ZbGsyWkdYbTh0VlZvaGdKOFVMVzNv?=
 =?utf-8?B?VmJMV1g5TjRKRUhkNnJtUE9naUZxSEpVVmxkL3pwc0pRV3V6KzV4TFpvRnVZ?=
 =?utf-8?B?MW16MjYzQnRObE5uNDcxWkZDSXNLUWszNTVHaXk2Mk1keU1tL3R4eVlXcGJv?=
 =?utf-8?B?SlRHaUFRSVd3YW5yU0ZsUGc0cTI5aWlpT3lzaE5mV000UG9HS1RnU3p2dVNP?=
 =?utf-8?B?MnFCRXY1N0k1NTRXVjBvcHNmYlllUE8reWFjTGFvM2lubmt6YjF5Y1o4OUJh?=
 =?utf-8?B?QXpyQTNzbXpublg0eGo2dldWR3ZJMWNjVzFsMFVPZFdpUENNTXJjcjFvN3BM?=
 =?utf-8?B?YkxpWTl0Y2thY0tHd1VISzBDZEliR2s1c3MvUjNhL0tDcTJJbEoydjVQWmVW?=
 =?utf-8?B?WVB4THJIbDBQMmo2U2ZIV0VIOGFUR3AyNzJQL0N0c2srWnNTQURYTG5kUUxo?=
 =?utf-8?B?YnhVSkxpKzdleTMyYXhrWmgrd21ZVGlnR2VLTVR6d2Z4MmczaFhXR3BYMXdZ?=
 =?utf-8?B?L1p4TDE1dEg5cndWTzZxaVd4cms1dnFxSk5NRW5PZjVJYlY2ckkzYTRTV28x?=
 =?utf-8?B?NjhISjhuU3pHZm5ubysvYmZ2TTR4VWZXZlFIZFF0cGxxSXQyZlowUzdnK2RN?=
 =?utf-8?B?cjBIY01TOGhlL0JicHM1dzFLS0NERU5oTkNNWlNCNm9temxUUTNzQW9EUnN3?=
 =?utf-8?B?UkJzU1JNblNNbXVCSjdLWmV2N1pEaHlCTVFvSTV6ZlhJeUlMVlNtMkVEeXRt?=
 =?utf-8?B?VlpKZDdGQVBrdlIwRzV2c0FVbytrZE16WmJ3TEdkWUt5Tnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3VJQVAvdVdMcVNBSFc5MFBVR0s4bFlaTndwSTh0SW9wTzIxUUN3MVU1MERD?=
 =?utf-8?B?akJqZFJYY3Q1SVFPS3IvVDFMS1hjK2pvb2trRncwV2NFNTBVVllVckd4bE1n?=
 =?utf-8?B?NCtKSGYzbC9YdDRQeXhJM2diN0xkcnRyWnhtd04zM2FHTDEzeG9qaGVnaFRp?=
 =?utf-8?B?VkJTTENINzlCdXBndkYrK2xoTmg2MDQ3NHN1UlVDeTFJWFVpNCtTSFVRMkNh?=
 =?utf-8?B?a2J4bVpwc29YUHRmVlZTUDV2TTZ1ODdReE12aTJXaFN0SksxYVFzdGJqUkZI?=
 =?utf-8?B?cmoyRnNxYnQyL1pMM0swMTh4ZTk2WDc3cTVoM05BNCs1MTBFRWJIbmZ6VklN?=
 =?utf-8?B?azUvSGhrWk5Ib2s1enlZenBaZDNTMUk3djdITVJ2dXpaVmtUUWhmS09kOVRy?=
 =?utf-8?B?U0RhTmNpRE96bDZudWh0WXg5YU1hUnd0SDFqQm84T1N6eEhLRjJKZ3c0TUVM?=
 =?utf-8?B?UjY5UXNxamtsd1JJeVluUHh2Qm12YXJLYTd4bldHeHdobHRGVG1HWE1RNGgv?=
 =?utf-8?B?UUxpU2d4TDNmUnAzQW9IdVliaHV6OTV1V3VqRWJjeElmNGFHN3Y1a1Z6Nk9r?=
 =?utf-8?B?RG0vQnpCUENjWWlMaFh2ekEzcDYrUG5Dc1V5QjZHUVEyRlNiYkdEQmdmL1Vz?=
 =?utf-8?B?Mk5IQ1RNU3UxWUI1blNudktZZ1N0b0JucENyU0p2MXFnbGxTOGxURCtXRmdM?=
 =?utf-8?B?bE1uK2hEZVZTcmhyYUJaWjBsWVE1L1hMREVOODYxOE1xZFVTRHhlSEp4a2RL?=
 =?utf-8?B?d1c0OWdhZm9zc251aFlDSTY4RGFadjRkMFBTL1JjV1A5WWw0a00wN2NXajd0?=
 =?utf-8?B?Z0U3L2twNVlyd2xzOHVNTHlDY3NYUHlFWWRITGRjOGVieHVMR0M2T3Z3MVBB?=
 =?utf-8?B?NG5TemZRczhybjlleTc0M2hWRDBWRWV6UDlsMzBhalhMTlNFNkkyQTkzMWg3?=
 =?utf-8?B?TldqV0JUUURlVWlzRHd3eDRxZFlxeGp4Rk5ENlNvUmE0TS80dzlZR0xqcXhE?=
 =?utf-8?B?eUEwUHE1OFdEWjdNMWxERXVWbzlmTGlyRHdwRGFYUHdXUjVBdk9kWjEyd00v?=
 =?utf-8?B?aHVuMndaUStOcTZ4c2g3ampxQlA0c2VSbVNQZTVUY2h5V2VPOTNEbVNpZk8y?=
 =?utf-8?B?Y29mVVRnZzJNaHZtRWhzU05oMVF1VlhqZE5vMmx2alB3QmRiSlUwYi9JMHZD?=
 =?utf-8?B?ZExhbldBekNwQmFKejNlT25VWm9sYlFVZzRKZGVTblhtR2MyN3Z1Y1lUV3R1?=
 =?utf-8?B?S1hDbzQ4VG9ZaS9aTXIyaCtST1YvaHNPYlFjSk9tdWFiNFgrNDJ4NlFhbis5?=
 =?utf-8?B?TDQrOXRlRmV1U2FUenN6aldwcVdqV3JFU0l3RC9HYzkvRm1tcVhmUTFlUTZy?=
 =?utf-8?B?bzd1OUNKb3ZlQ2p4bHM2MEJsUU9NN1luL2swVTFaQ0dUSmhaT28zSnhiTCtI?=
 =?utf-8?B?YkM3R2ZPazM2OGxDRXg2QnVMRlBBVWUxL1RPdHlBbTFSWnhRYkdGMDNEWnBY?=
 =?utf-8?B?SEdSVWpVTTA3SnlKeUVOdHo0SXpUWmZtWTBTemJNTDk2UUhMVSs3TEdFWDhq?=
 =?utf-8?B?R0lkMUdGeTJLajF6b0hWQjJrMHBZSTRybDN2dXRUUnVCcWZadldUWHhYSzJK?=
 =?utf-8?B?VVpZbU4vaXdaVWlGUGd2UVh0blZGU3J3UnpjQWloRFhoS2FsUm1KUTRySm9p?=
 =?utf-8?B?Z3hzTDNic2c3SnRWUDdrZHhZUHI0UWpIS2ZxcUVzbzVCekZzYm93akt3Z0JC?=
 =?utf-8?B?YVRJb3ZNRW1xK01CSUlXTURKd3VNR3ZqNHNtOTFtNmxqdy9UQS9KbnJmaXNy?=
 =?utf-8?B?RTZuWndwOGtQb1BqbnlFSVIwZmhMSEk2VTRDV2c3bnBkYkg5b3R0MDBScUI5?=
 =?utf-8?B?a0cya2ZnVUkrWXpHeGowU2dwa1I3RTgzS01GNXNlWU5xcmxRZWxOZjI4K25J?=
 =?utf-8?B?VXFkT0hRMWpWbjYzTnpOaXBiUUxsVEp5TXV2dkhmSXF2cisvTi9PMXQ0eU96?=
 =?utf-8?B?YjYwRkRSSzlDc0wrRis1aGk5dW53MU5sUTdBVlRhS2lyYjlaUmQvVHZ5K1Nm?=
 =?utf-8?B?R2Z0SEJieVJSaEkyQXkrbTZUUG00Y21BTWkzUzFDdkZHRjBtcll3MXJOOGVr?=
 =?utf-8?B?NlFCclV6S3JrdlVwMGl1amxid0NTL2JZamc4SlFrQktrVnY4NU1uMUU5N05t?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4tTqikYTyPaOCJOp1it00W46"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c7d224-349a-4539-5688-08dcc90570b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 15:07:18.1981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZIK3JuzL9SehEzlElRjJWfmaVk20QvRW5W38jWUXBUwOiLhzUn8PminSqYw/Sj6MdqwDJXfnG8zM5G9qcXf24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7800
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MeE+uI/f c=1 sm=1 tr=0 ts=66d1e029 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=5cLMoERiDscuWAzwkZIA:9 a=QEXdDO2ut3YA:10
 a=XlWX-oXg8HAwOG9o_2MA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: -38OLcI0SSdXrnDV13JWnLyVFCMXGabO
X-Proofpoint-ORIG-GUID: -38OLcI0SSdXrnDV13JWnLyVFCMXGabO
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

--------------4tTqikYTyPaOCJOp1it00W46
Content-Type: multipart/mixed; boundary="------------hKuqfdZPj2R89xODccUxYfsW";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <35867394-d8ce-4698-a8fd-919a018f1583@imgtec.com>
Subject: [PATCH RESEND] drm/imagination: Free pvr_vm_gpuva after unlink
References: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
In-Reply-To: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>

--------------hKuqfdZPj2R89xODccUxYfsW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This caused a measurable memory leak. Although the individual
allocations are small, the leaks occurs in a high-usage codepath
(remapping or unmapping device memory) so they add up quickly.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/imagination/pvr_vm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
index e59517ba039e..97c0f772ed65 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -114,6 +114,8 @@ struct pvr_vm_gpuva {
 	struct drm_gpuva base;
 };
=20
+#define to_pvr_vm_gpuva(va) container_of_const(va, struct pvr_vm_gpuva, =
base)
+
 enum pvr_vm_bind_type {
 	PVR_VM_BIND_TYPE_MAP,
 	PVR_VM_BIND_TYPE_UNMAP,
@@ -386,6 +388,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_=
ctx)
=20
 	drm_gpuva_unmap(&op->unmap);
 	drm_gpuva_unlink(op->unmap.va);
+	kfree(to_pvr_vm_gpuva(op->unmap.va));
=20
 	return 0;
 }
@@ -433,6 +436,7 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_=
ctx)
 	}
=20
 	drm_gpuva_unlink(op->remap.unmap->va);
+	kfree(to_pvr_vm_gpuva(op->remap.unmap->va));
=20
 	return 0;
 }
--=20
2.46.0



--------------hKuqfdZPj2R89xODccUxYfsW--

--------------4tTqikYTyPaOCJOp1it00W46
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtHgJQUDAAAAAAAKCRB5vBnz2d5qsFb4
APoCTyhqMOiutN6pRnBkK98YNeDejurHHc1ZOaBmnYva2gD8C/lRNi3cer5cL1x4UDV357iztyF5
5OO45d4tiDz8AQg=
=sZkg
-----END PGP SIGNATURE-----

--------------4tTqikYTyPaOCJOp1it00W46--
