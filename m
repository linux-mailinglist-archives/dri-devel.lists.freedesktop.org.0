Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2F8951BE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C3C10FC83;
	Tue,  2 Apr 2024 11:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="V/0GGysc";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SNIdDyCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41010FC83
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 11:24:17 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4327ibk5005854; Tue, 2 Apr 2024 11:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=RobBsQwgamdvtjqikdbxkKFcJc9hwjq6mRt5HtwphBg=;
 b=V/0GGyscRvZ5AyHxDA7cd8kzGtiu5JGU5aRjrRfKnTrfmxO8LTBwvcJ+eH7KhHt0T34c
 TIm02y0QDUf+mObRtXLwvWNurKE8LMZw3ykcPHG+jrkawynzCJ4EeKzEWq7wpANFsGxH
 3iYf0vt1apTUktTq4HHf2m9C9/b0ZDQrJihGy8JECk1459FN/bQeEqHbENeJRuXQ38zV
 Xh3jxRtVFVPw3cr7GSGKb2G9DTDMMcPwV8WbUovFaRtZHpO7f7+gFnIFYa91YAfO63C/
 XWr6cGBU5wpf+Bl3PVCb8Vt0vsuwyE7JdrJtwhaaUnCD92yCJyJV6rLAroKYKtZqVKHk fw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x69ncmfbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 11:24:06 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 432B23oR008507; Tue, 2 Apr 2024 11:24:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3x696d6ed7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 11:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PASyL6duXrU43XyT+u68R5RjYW+cTtR/RwX7TFqSrT+pK3xQlwzowYCKP/xpP/XZol+BtplpSX43ItOWWJhKybk2WGAwBk4Z93Iyoexqtt+YjGN3qbDSP4LDXUcaIRc+khCU9Z/HjvPeEz4atGpt+9gUdTOXfXH5H8JjvczmYcnOGCHa7hriuS68PQwleFQuO3aprY1T9eOZZx69mTjDuBZ0+IMIDkCDdcjCTt6aAtVGQ3MUdRtE+ZmQCd9oVqKkIc4nwEZ4JHoGbrPPNJgqYGVtr77AcdgtMh1s2JMpo142pakZ6WXvfT4KolGojB/LTl3ebSUBGCj4LTdgYHnSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RobBsQwgamdvtjqikdbxkKFcJc9hwjq6mRt5HtwphBg=;
 b=LEKAnF4dOKdBmbWlGdgJlycuiXg0UMnfHb5Uh9LrxoISOnQ6J0CcffnZ13ax/FjYgnSYqk78GyUDcQ5PoeVYxJ5Dz8HXs0l+d9gJnlg/pxPoxkKTDtekVD07KbZmx4DcvtbpzZ+HiTm0SkxAb+27tPx6oFiMIRPss4d1iBD4zHyQ51FRhEbMUTLaCH7/zfai7bFW/7F9Ad4vKTpj01bAMQSIOcV8Tpz6h9W+OAmkFmdExUO4j1ND+PI+0qMlFpFrtMQrjqQ09v5/cVUY06SNevscO7FMfQJg9xC0uGU2RJRziXzcVM1fVnhopcHxuq66EanAjLpGflE2OQW5g0vcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RobBsQwgamdvtjqikdbxkKFcJc9hwjq6mRt5HtwphBg=;
 b=SNIdDyCriU8NMaaxH3Ui4AMCzsbcUDgPI/czgw1580ElnxJLiQkkROve/ERdS+t3jPmQcRNjBCHdbMIq7fL/efhR1Pbyrz864177AwI898XQUHlGhDSAYiQkj5axxyrBxcRwQexOx0CqkdjtgtYWyGdiyxKWVjiBsXucW3abzMw=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by PH7PR10MB6311.namprd10.prod.outlook.com (2603:10b6:510:1b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 11:24:02 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 11:24:02 +0000
Message-ID: <6a6ebf5a-da64-4c5b-b819-cbcbb097fb55@oracle.com>
Date: Tue, 2 Apr 2024 16:53:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix IS_ERR() vs NULL bug in
 group_process_tiler_oom()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20240402111740.1700310-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240402111740.1700310-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:404:a::14) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|PH7PR10MB6311:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g583jLQVuenr2Dj0b7cIydy15X9f/yF9oM5ZpU+XM8YbBXvhGGjZvORV3kgM1miGaD0dviiIYfz4kjIhkItt2w9WmfhxkMQiPoT84Kjm0gXfxy7hPyrLe2oypxe++Dk8lXVj4ITOUqv4n4WCSX3Tevbz4f83pCADE06dYgMWWPvR+BIcLhMtlqOOrnyNYPAEGRR39vCBuUA9WX6XkHyVr2P5W3EYN84KXSaZ463qrtAn0leGbSb3fOnIRYBJ4SvGitg2gg4k+mADaVAFgC+ED+86lZKtb2PraL2DkFRyBpeUcQGVXGqPfQsbMJVxTT7r8gE/ubki9slSOtmP4rjkQW16Or9dX5qUPz3oVZLKMOpvsxv+VyTtTaqNZ9ECv/a9ibTWCRPh5tCNQub+74M4ST1CY+PlzWVkRjVjo4J7VWBWcrSZk0s9hGfR/TlpwYzracLaKbZndI8KcAYok5+aIhg/RvPeNg7E6gANxwzgRWfp474OT0yUH6tDulQmpZv2kgMJlGU8vxgv7idYIs95oB/b8Hwv18brEpiDh6nXLnA4sEko8z8Niidrbtu+xEGqFA948fHinbQT7zAr5zSU9+Y9039XHSrTlRkbk7Du6XHtvCMHOnOlq4VPhzuTIKLzCEccy0Q/+T8xw9iNlJBf0ZXM/TbWvOsMGbCrzU67bjDnRhDuaAX7txBqNIfUxeglCF3qwbpFkv9w1ccpk4AcDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm51MlNBSHRKSDcyTzlEem9ic0xBcjI0OWFGTERZMGRXeVpnL1ZlVk1EMnR6?=
 =?utf-8?B?VEJtZTRVSUNuTDJDT0RLcEp5TjBKdFZKSFhqNWZGOVNUdXBhc0xlSzhlTmpt?=
 =?utf-8?B?c0F4aFFkWjJGUXhoYUpGNktMZDFOQWREWFROWDl5SXoyYm9OMnI4SDRCMlk1?=
 =?utf-8?B?Si8xdmFPZE1KemhYd2VVOHZIUExSNDBCUHYrTnhZOVI4TGxHaHA2Nm1jd1M5?=
 =?utf-8?B?dnVsbXZqa2ptWkQzMVpXSEU1azVOYks1YzBxUVpDQmVIZU5EMDJKMytCNHps?=
 =?utf-8?B?dGhmejhnSWtSOTJFZzBQNWxZaXlEd2lkMmlnZVBoYlp2UkpsdXpINGJWSWZM?=
 =?utf-8?B?UkN0UGkwUUxwbk1KaXRVTlJqU2RUN2dPZmJ3dDUyVWM3QStPb2lFZURnTGs3?=
 =?utf-8?B?TktQRWJSTGpNejJ2M3lka1RQYVV6YkdkZDdLWmk2UXp3KzFWSXdTZ0JHT29N?=
 =?utf-8?B?dm92Ulg0cmFoNXQzMU5VNlZuTWdPaG9jczZDTFUxaS85dGI5OUh6OGpkLytk?=
 =?utf-8?B?ci9VSEdFZXQxWnVzM0QvTmkwTmx1d2ZhZFN2NCs3WVVFY29yUGF6VDV3bGls?=
 =?utf-8?B?MWJ5YUF2bENsSU11aVFyc2t2S3ljakJqNFFOQW9aMFZkOFV5UmRHZ0tuK1JM?=
 =?utf-8?B?Zll6aDR3b0hhU3p2cFhPUkdnQVBVbEVIdGp6OTRGdXhRdzBCcFpONVZRODB0?=
 =?utf-8?B?TXY5a0tnQzNpbkczbmZiOGRCOGkybnJSVU9VMVlpdkY1R05QWXN5WXRPeHpR?=
 =?utf-8?B?S0pFeXZFQTZhbUVQM2FsVXlyQ3NNbVV3aUwwUFdDMm5oZEtVTHhnd1RhWklC?=
 =?utf-8?B?QWV0WmpMSnBSY3NzWE5HWUxKZXVxU215VVJWbERaclFpZHJEZm5QQW1nU1ly?=
 =?utf-8?B?OHJnWDhNeklWMjAzRllLUWxHV2xnb2Y2RHhLU3FZbnJQQzNUY1o1Zi9sQytP?=
 =?utf-8?B?MnU4cThXYTJFcmM1bllwWXZVcm84WjlOYnJHek1BMXlyM1IycGVFMURyd2g2?=
 =?utf-8?B?NVV5U285bFcrM2lqdzNQN0k5d2ZRZXB5T0xlS2tHVFY3OFBkOEpuS1FXeWs2?=
 =?utf-8?B?bTdvVXBDcEplU1d2UDlqV2ZzWTRxV2JNclVrd3FtbVJEUVh3b3RqNGZrZUI3?=
 =?utf-8?B?NGdMUUh2QXRYSWt4bkthaDhWMTY0OFRubCt2MjZFZ2dUWkdzRS9oMWJnUDRB?=
 =?utf-8?B?QUlMamZKeExmR2pLMUJPVDYrTkV4ZTBhVHJBa1U3djdUcytsd29qRklJN05N?=
 =?utf-8?B?RWZRUGY1NnVyNUZsTnowVHFqR1d2OFNJbFFzbitlc25pRUlnaWtkWlFWUEVk?=
 =?utf-8?B?WGJYeUowem9EQVMvL3NLK3g1em41cmZuRXJCY3dXRUJsQmxpNnNmUHcrb0lm?=
 =?utf-8?B?QldKeSt5R1Nabkx1M0Jna1BJNnNBM2Z1K2kvbCszVVhvWit5VHVnaXNya2Ew?=
 =?utf-8?B?SFd0VDRtZm9wZ2d2d0tERWR4Skw5WHZ1aWdOR1REcVV4Y3U5M0ZoQzdWdnhD?=
 =?utf-8?B?QWNjSE1DeGplRkcvd1BiT3BoTGRXTHJ0dGZCWjVKcUcyeldONEg2aTBkTWR3?=
 =?utf-8?B?WmVKZFVDT0VnVlNXSVdpVmpaRTZsTE5HRE5IcTEwMHg4dzFUK2ZkSTVhT0dt?=
 =?utf-8?B?RnBzZ3F5Z0wzdkE1c0xXOTZub2U1ejlKYVhSRGJwWThIeUdCbzgveHcxWW45?=
 =?utf-8?B?a09FVVFRdDBlNjlTYmUxc1hyVlJZYzYvbUJOVmxwUUJERGVhN0xzWWFGNU95?=
 =?utf-8?B?alhIbi9iYmFBWkd2d2o3TmVxM3phcitJM1orc0lXWFZNcytwQXcvdHhBVE8x?=
 =?utf-8?B?am43Zm1FanRtQXZIMDVaNE8ycjA2aVV0YU9BSXhBOFh4dmN5L0JFbkh0NzRt?=
 =?utf-8?B?U2xna1dvMjlBdjkxK29WTGtINnZRVm4wcGxvZGhnWC9PdHJ4K3d6TlZmaEJo?=
 =?utf-8?B?L2x4QXdqRmpZUXhtN3pXb3pmVHFsVFQvTVByMC9UNS9Ld2RTeGtHUTBGSk1B?=
 =?utf-8?B?aVlJU252cksrSGVvSVBCNExVSWptQzNxbnNZcml2RERCckxZYmN0SjlKaG1E?=
 =?utf-8?B?QmZ6di85ZGxSQjRTMXBnaFpNTVc4UjZsVnhuOUFuN2JpVWFpYmtFemF5Sm1K?=
 =?utf-8?B?K1ZuS2hPcit0M1F0a0FSMnFjR0hpQmJlMHliUkhkZnhVemtVVjNQN054TnVj?=
 =?utf-8?Q?TMkz+2Uv7IdZ0xGX8WtxJmk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RVx51Tu+H5wiQzO9fs7tp92ghCOX5++wHikOBFlefZM2jVZ/2Deln0L1zA07NkCyNIRLyqhH0C0yuGEz9CxTlX4XfPjLJ/wtAJ+QHdgGiyWykFKotsm+UU6/Z3j2hfMyzGoa22LhBSAMms7aR4Kzi2PA6gRaAIt+oYAwuFWI6glIRjp1Dcbaoat3R/LXS9n0pY0ybLTrW40JtiJ65sjo4NTpYSOsDRu5mW5a+MpM/61vHSHTusgcIyVLpCcwB5sQRbXRY541u6gzTeD7RyvXw9mNlFI5/nnhAp9j0NZv9c+92tQsZFB2SeUvSaWaM6yEYOSw/ZkiWCXh4VKzG/7jb27PVmJACGunA06nl5C+Xx0sRSxC4mwzLdtHF9h7d0/X+xuOvuW745ylrfgpkQLRI4EPiDyFPlm+BUd6qdpcpuCaVcpMypmmKwXS+ytw4MPeLcmq4coflMWgZ/oORp7vrbs6bdBolaQstgal0W6hYpOK1bTMyQM/zZxEqg5YaLIIQw40txsgf3sq5HQnIPTCjMbTk2WBiPseAJwBciVtCU9ZFSjLCg+xlLHgAS0AWEuKqsvmngfVHOXP9kGorETbPhUcxzQBMI6Ud7UD8RlyOWQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2358fe-0bc6-40b1-b055-08dc53076613
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 11:24:02.4259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AkiFPeQ84NzL3OvCoYlj3snUZ64NvPqY1483hcVnefMbRfrkqjJCGU9GaLbvLfU5Z/yDpakNZSQriiZ6Bb7VxUb/CExWazf+cQA6JV9evMVoNtHUsWue+9SjcYwwNvf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_05,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020083
X-Proofpoint-GUID: 8tj3uaY8VTqC0HVYnzhsaiJQRkLFRmd2
X-Proofpoint-ORIG-GUID: 8tj3uaY8VTqC0HVYnzhsaiJQRkLFRmd2
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

Hi,

On 02/04/24 16:47, Harshit Mogalapalli wrote:
> panthor_vm_get_heap_pool() returns ERR_PTR on failure, update the check
> accordingly.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with smatch, only compile tested.
> ---
>   drivers/gpu/drm/panthor/panthor_sched.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5f7803b6fc48..d34f213795a3 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1343,7 +1343,10 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
>   	if (unlikely(csg_id < 0))
>   		return 0;
>   
> -	if (!heaps || frag_end > vt_end || vt_end >= vt_start) {
> +	if (IS_ERR(heaps))
> +		return PTR_ERR(heaps);
> +

Please ignore this patch, doesn't look correct on looking at more closely.

I should have just done this:

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c 
b/drivers/gpu/drm/panthor/panthor_sched.c
index 5f7803b6fc48..617df2b980d0 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1343,7 +1343,7 @@ static int group_process_tiler_oom(struct 
panthor_group *group, u32 cs_id)
         if (unlikely(csg_id < 0))
                 return 0;

-       if (!heaps || frag_end > vt_end || vt_end >= vt_start) {
+       if (IS_ERR(heaps) || frag_end > vt_end || vt_end >= vt_start) {
                 ret = -EINVAL;
         } else {
                 /* We do the allocation without holding the scheduler 
lock to avoid


Thanks,
Harshit


> +	if (frag_end > vt_end || vt_end >= vt_start) {
>   		ret = -EINVAL;
>   	} else {
>   		/* We do the allocation without holding the scheduler lock to avoid

