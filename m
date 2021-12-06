Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194A469755
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A377AB01;
	Mon,  6 Dec 2021 13:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3FC7AB02;
 Mon,  6 Dec 2021 13:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRqY7w1LIJvbuce+yZMDmzRw+T5lCecGF/l88Q31SNqzhF4Y6FQRS1Cb51cvjlDgwgpvpdiZmjZmpsjOSafuointLHrKBKYy70yW8BBh+3jgjd9k2oHo/TjRzPe/4liW728ZnLETGl7c4oDcYpW4wpxrNX69gWKNvBilMjSCe+UpBgnpevhGxw1I9FnNLr8UnCUCE69xR4To/3tDr2tE/m329Hc7suIoFOI7kTsfHvsqROIK7ydUOKvrv6oGlknRUlXHM9XVD5K+7tkAqK54XkNTEZUhadMplNKFsCJK/DunxjJ4ga8QqALboEp4o0Q4MfxwDJbWgULC1HmTA3FScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2KB8Ivff2jfVNUDWc4td87ZjsDAvLZo1td3rknfTRw=;
 b=WFqyVX6fwZZGwi23QzCYpsy78JoSOrVsszu8bSQjeTDD6m/AAJmjtpTLGK/q8Md0C2BdHtfHwMJAJHs3IbDdn2Kcm1DDOHan2JRUqgwt7+mpHvIguzmNFupA1T2UhcnN/GXue3cF0uy5+aturLAYX4uyV8TVM+l8/QnOtHezv3JhksUXfMHgxFmyTu65QTzjDw2X7sZnWBT/K1N+3UNdAtlRoler5J1kKzAm8HcUFbrluXEgvOxnyOqcEHjT1i1ZGv17R8VOJoHMuZZk0oT9jnG//vSUyadvZxRLrEqrFCAHvDDIF1A8aFHwx6+E4af84YVE8XLcJ/6TZcVtuc5Awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2KB8Ivff2jfVNUDWc4td87ZjsDAvLZo1td3rknfTRw=;
 b=euNwlEFNu4W9z7bLzidlMyI+GEq6VWl0S3zjoOY9AxURDWU1aA4qJqrey7p4tVGP07CyIoSlCbk3PvUcFOY1UzYtqv4NEHi5OcFmKB23Gu/JcGKxnkpbw07pz3R5UflDcGFw5yNTgpBVCIfLYXmllw0puLli6KeINRWxVjDsoSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2364.namprd12.prod.outlook.com
 (2603:10b6:907:b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:42:04 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 13:42:04 +0000
Subject: Re: Regression in 5.15 in nouveau
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Stefan Fritsch <sf@sfritsch.de>, nouveau@lists.freedesktop.org
References: <da142fb9-07d7-24fe-4533-0247b8d16cdd@sfritsch.de>
 <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <330828d7-7d5f-61b8-37e4-2809b283f0cb@amd.com>
Date: Mon, 6 Dec 2021 14:41:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::34) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.191.248) by
 AM4P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 13:42:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68599888-7124-4dda-5d67-08d9b8be3019
X-MS-TrafficTypeDiagnostic: MW2PR12MB2364:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB23642BB14429AC2726E804DA836D9@MW2PR12MB2364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLZR6hI5ICGQI/8Lme74XjYUPbFdqhyju6ffZprwsjCuGqcwMJUoLypkauGBS9oJTEAx+b3dRw5DAmsMwj49y6obZnLUz1f2sCRbYCxolkN1qet0FpTNW1fLUXPL63C+7N2Gl2NNRZIK5T2YENcZGDQ9jMLnGq2KFe3BUXGkXnDsWYbpAhCpPkI56JcvKn1FfAJBdXHaX414kil6w5jqeEUkrwTEE0g8KUeYRbqNx9I+9I/yVZohXCYiP/wn2zGZPLuLC1oj+OaSPTi01QQZiqRYHZpHZC44nGmBf+3l2i4LCN4luqNJH00Auk+6Eaxx2TRZ0FHC05rC8fYFm8JF/UcSTwJZdUa+g7T/dKGo1Y6r9lAXPStuP1GaEpgK3L0bvPjsEHoY33un/kT93hNWbqhbBFOSDIpCRyGAqGBW4WPBnAtN95TaI/gDwxo8O+BtNV/87ZFB9XAfuReHsxowuhrKmRwZy4utN2RV17+W0lsBF4KRPk5qzaINqjLDfzhEev663WwWebIHDyfbyhTQ8OG4CgkoLi7hgRvgq8tJyimwG379Cgv7wDliDX4+PGm24jWUd6cAcbuTiN5MI7zPK5pYsI0jFdmaU/tcIKo3disYrsXSdmbA/aR5KsHe2WCNntwr8BNcEVGYjV+cPBwBYQLMS2BB+w6C06Lag4m06LVxG2XyDorHCrGgS06azpCEfTaErSHfg0/tj/ycm7iMPq7z3VZCAeoMW6f7DcMvvp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(36756003)(2906002)(8676002)(8936002)(86362001)(26005)(956004)(66556008)(4326008)(6666004)(66946007)(38100700002)(31686004)(66476007)(53546011)(2616005)(5660300002)(6486002)(16576012)(110136005)(316002)(31696002)(83380400001)(54906003)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVo2Z1ZDcWVzZ1VIQzErWUR1WGZZS1IxQU84SWxTNmh3Q3lwS3pxRktwQ1V3?=
 =?utf-8?B?dk4wVEM3dE00UllrMU1NQ2lDM25TU0o3N2lmNllqV3UrZ3BjWmJLbVVuUUpT?=
 =?utf-8?B?Y0VDSXR1RnBtTHBVUmwzdzRMd2laSEFma1pYTGRKY2k3UVV1TFV4a1JrZjJR?=
 =?utf-8?B?Y3dtRjNjTzl3NVVtQlpqdmNvSk02alIyQXFzYktPNmwzeWNmQnVZNW5UWUY1?=
 =?utf-8?B?cUNIaFJjbTFBSTRlcHdzcFRnTnByNnJPVUlCejVsSHR6ZWZSeG4zdnBiWmVx?=
 =?utf-8?B?K3VVa0VLMTVpR0pHbFdjTU90SWhFbmZwWkRGNjNWZ2puQXVtaU91WHpWSGl2?=
 =?utf-8?B?OFRhM0tQTlVsS1FRTUY5YzVMNFlZRDFFN2lFazgzWTd0eWxnVmVkd2JzbXRY?=
 =?utf-8?B?bHVRY2pReWY0d1pyNCtEclJSMGVHZUtVRE4vQ0Yzb0pBQzJNeHF5U1dCdC9h?=
 =?utf-8?B?ZDJmeFBxelhjZ29ybEt6K3I5RlB6cW9SVVlMV1pwYWJzNi96WGM5dXZXTW53?=
 =?utf-8?B?T1NLMVVTbkdEL0g0SlNaQVRMN0hiczBjbW5FcFR4VnBsbjNVSXhweTdFYXlF?=
 =?utf-8?B?TWpXY3Z4Yk16Vy9Mdk9GTEVtL25iYVFRZ2NNUUROWHZNdGlMekZlaHF5TUtN?=
 =?utf-8?B?TEViTGdCSTluSkhTc21EQmZxZjM5Y3pEQ2ZRUXhTWXgvektFM0M2TmJKN3Iz?=
 =?utf-8?B?ekFqNkt2TGIybXltT0tQL1VsaUV0clJLYXF2Q2xTeCtTeEZJSXdwLzJzbXVV?=
 =?utf-8?B?Z0Ntck1jUkVlYXZ4cVR2MTlPTExEdThFWVNjS0dDV1VBbWVWNzMrM3d6Wndy?=
 =?utf-8?B?a0dMaXJ2dXRPV2I2aDN6UEdOSVdKS1dUR21mVnZoVk1jYTl1dXpRc29ZM1JN?=
 =?utf-8?B?USs2QlhsWXh1a0dxOHNOQUprZ2ZRdW9ad05LV3dKUFY4a0lwTEpqNjRHNlUv?=
 =?utf-8?B?WStYSXd1UFRvemN3K1EyVmpTUWgzUzNEcVFIYlVteUVEYlp3ajNpTjNQMlpw?=
 =?utf-8?B?cnowUWJkaGQ1YkpodGNMbU9ETWV5UjRGa09OdnByRFk1SXVTbDdyb0RubEVi?=
 =?utf-8?B?OGxUb1dkV1pxQ2JlYTBXU0Z4TElLUlJzVHk1ai9PRU1aMmh5bWY4eW50V3Ew?=
 =?utf-8?B?czNCcVR4RUZnbUdOaEZmNzlrakk0RlRLeXp4T3pmWisrR2JmVjlSTDZXaFIw?=
 =?utf-8?B?TXlkVWo5NTY3bGZHMHlFQzZrZDJ4WXQ0ZHJmcEw3ZVRpTko1TlRBRWlpSjNK?=
 =?utf-8?B?ZnBSQnpDVFJaZ3FxdGRvb0RIY1ZIdGFVWjQ4TjFNeFJOTlUyTjV5RGRqM2Np?=
 =?utf-8?B?YlFkMmdRVk8xRHVTVnM5UFl1cllqRWhQT1ZGTW9Gc1dIWWNldE1Gd1pYbm5t?=
 =?utf-8?B?SXlWS3NRSk1RcWdyVHBvTGtVU2NESCtxNDF4NlBmTzhvbU02QTJZNURYTCt1?=
 =?utf-8?B?SUFuOFl1dUQ5bk9RZ3ZPaDA2c21QU1dxcWtRNE5Fd0gzNTZXYnhmaCtMRVFl?=
 =?utf-8?B?aCs0U3JsQk53KzV5MEhQUzJJa3J6M2tGb1JnanQxUlcwVEdYUmdmNXpMTlQz?=
 =?utf-8?B?c2U2MDVxV0dKbEx3K09jTHJ4bXBkZ01tdmFScEtTVU5ZZ2FGVDFNa0oxY0s4?=
 =?utf-8?B?SkU5dkFRWEFuYWFldmFnbTQyc0FIVDFXaW1Lbyt4aTdnQWtOK1RtbWEwcU5H?=
 =?utf-8?B?YTYvNDZPU01iZFZsQnZVL0xpSnJOR0dNaFlST0hCY3gySFpNdmlUeFR5ZzFv?=
 =?utf-8?B?OHE0eFViK2ZsVGtGdGFjeExPUWRtdXFiNWI1dU01b2ZoMWJmOTI1TjBwalIr?=
 =?utf-8?B?RkcvYktRVlFaeGlKVE5PT1BKN2hVSHZUK2FNOUZQNU9FMzZyc2dDMVNVcks1?=
 =?utf-8?B?TVdPdkhIZk0yWmxjK1RNMWprWXBDdEFPcDZjUjZBSTQ1N3FsREgrd2dFMWN5?=
 =?utf-8?B?ZkdBTURkR21weHhXeHJoUjBKMTM2K2xEZmRzVVk1Ym9MdHBZTXBPL2k2bVgy?=
 =?utf-8?B?djNQemd6d1dlODZyNklBeHhtNWVPeC9RWUROZlJqYmM0MkNxR280L1Rod2pY?=
 =?utf-8?B?UngyUUdXcnBYV2FUZjlhV1l0SFJXZk95ajhFbnpTNEpCU3diOW5xNzFGNXBp?=
 =?utf-8?Q?B1X8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68599888-7124-4dda-5d67-08d9b8be3019
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:42:04.1660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9STe/KDgFOFcghukHGAWweBj3N9LT8CZ74we9AI0gzevv4e/3Tc133/nY9Zee6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2364
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Thorsten for CCing me on your reply.

I was somehow not CCed on the original problem report.

Am 06.12.21 um 14:19 schrieb Thorsten Leemhuis:
> [SNIP]
>
> On 04.12.21 17:40, Stefan Fritsch wrote:
>> Hi,
>>
>> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
>> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland),
>> there is a regression: There is now some annoying black flickering in
>> some applications, for example thunderbird, firefox, or mpv. It mostly
>> happens when scrolling or when playing video. Only the window of the
>> application flickers, not the whole screen. But the flickering is not
>> limited to the scrolled area: for example in firefox the url and
>> bookmark bars flicker, too, not only the web site. I have bisected the
>> issue to this commit:
>>
>> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Sun Jun 6 11:50:15 2021 +0200
>>
>>      drm/nouveau: always wait for the exclusive fence
>>
>>      Drivers also need to to sync to the exclusive fence when
>>      a shared one is present.

Mhm, that is really strange. The patch shouldn't have any functional 
effect, but just makes an already established rule more straight forward.

Let me double check the code once more.

Regards,
Christian.

