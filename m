Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0078AB2D0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 18:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA8510F560;
	Fri, 19 Apr 2024 16:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Q1wrqOXD";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u5YjAEDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CFD10F566
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 16:05:52 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43JFVITA025919; Fri, 19 Apr 2024 16:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=ozFQUprTwkZEBvLZy+/WPTsgwciFc/2FW+tyWU3WvQo=;
 b=Q1wrqOXDKGAwPSptais8H/gf2+grGhaqMUtrjdUQuRzRblnfZnoGb0A0zbPIyYz7j8+W
 rvcucrIkeMqSH6SaCo5+NiVJ5hrn59C9ixbtvV7KavhXNKI1F4QVOzP5xaskzU9KuFZT
 vFPhkCd+Kdaw0wgoQFQKnm7yWQx5tGgfHrm9WAukzp4TEqrINYL2HdblCxhqcamQR1JE
 EIHAHAPUex2x2F8WQXfy9O2k5as7e891ldJX0exYAIkeP3Pemeq+HLGn6JO26RVb1dim
 WK3bqS9j92RtDodK4yJrTyaOshsWRzkFbPbPYevD0OED+S2uTNjN2zpT1hZcM8IGt7PG mw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xfgujwc27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 16:05:42 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43JFDPG6005492; Fri, 19 Apr 2024 16:05:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3xkc7x8s2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 16:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4HPhhJsLW+QPJKcH0ymjNPAhCPaeLi+w02OCCRRGgV37yfKWwV7TFgm6cjkEGdnG4PsksnNbTMGlqxKF+au8VoGjYNM9YnTWzHcvuSX9qIkIfMu+qvuGap2DA0EUiG69V2uaUz6wJ7C9aSb0uaItZoht9UNhSfqT2doPsnRkAx+D6G794TORERCdDvYrRLW4PPVwDDKlBeKpznqWXDtOIRRypQEDtlBb3V34kDgSAsBpyvGxsXHoA7r/5W/TKZyvvXVvzBtvLYSQ+hy3qkokMNSR3LfY+HfB41gRQUbAulTPdtTDTCb7L1ChP2NvmAvzwU1utfadJPR+VPpFUszAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozFQUprTwkZEBvLZy+/WPTsgwciFc/2FW+tyWU3WvQo=;
 b=kpKiGeHmW+X68ypP5e6FHGifsFrvxAyctpusmwAICca97D0oxWEWZme8LfDXiez5rT/84ua/sOlrl+b8j00SsVvC3X6NKEEiT1cX0XTl96IvmxTYmLC/gZ9paAmVo2yU/Zh+eQaZ1LD/cnrCMqWk9Sz4fResa7IycWOLwnt70ra5ceg/qlGDRMOO8Fle/edE0WAnEbJsNJ+GgaJvfh5mBD4xuWXGN+tHKLt/xaEp6g09n+wV/yoR2Ejk5jBrLd2EOUVq4Z5L/C/uvZmjU3fSCXNqETgTLNTqVtvFrifxM2Iv/BP/PUNnSjW6unuyCgyUcjdis2NeQO27PdKR7htWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozFQUprTwkZEBvLZy+/WPTsgwciFc/2FW+tyWU3WvQo=;
 b=u5YjAEDfaR/IkZdTHuWkJ8RUIbox+XG/yARURWUlQzaTnnfOKacsbJJXAMBHptMyZOQSiKtULjQtGLfrm+5NrQAzTjssGybs9NCDp4eey925MHUFEObz8onydoYAcpfSLdF802qZPHNsAbkmLuRYrNiRvSNvRDvGno4UBY6QY6w=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by DS7PR10MB4910.namprd10.prod.outlook.com (2603:10b6:5:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 19 Apr
 2024 16:05:39 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%7]) with mapi id 15.20.7472.044; Fri, 19 Apr 2024
 16:05:39 +0000
Message-ID: <796eecdb-f574-4eca-8cb7-ff426505435c@oracle.com>
Date: Fri, 19 Apr 2024 21:35:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Nam Cao <namcao@linutronix.de>
Cc: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240419165915.228c76e9@namcao>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240419165915.228c76e9@namcao>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::31) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|DS7PR10MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: 7209aaa5-c195-4ac6-c3fa-08dc608a8e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZmHN+G1AIHiDSdcU+LS29SZ9FXPmG48N8ihbVcRRvBycOuU2MRP/RdPet8b4KFwcuTd0T4faYHg9L0E1T7CPObd0L/1nRRqulX3FZmSfWWO5My7nX4JDOaziVLSiRH7KWYB/LJEu14NnE1qRPObvdCjObcwPzGbkJB4vWbkywgw2YXYVTNhqLGVqjWWUZFWS99nroyQ8nS6St3h9p1m4KmWzC03zDUOkTTcr+X+rEoOmmYYAVtFiEvVd7yFjuQCYOn1n+BD4F3rYVqOTU9ZUPCFOt86M19vR5FCNu1KDMgbOK/YgTbFygKldjc4PQCnPA31PvV3GcXO12IuL0S1wh5rpuwLOEQaWUSxTYjIlI+FJL2THxi/utuTTmxbTgi/qfNXOoe10E0gWYpBE5dEac7ct2ZKBp/o7ezw3+zeNPHRgK6DmxNUNAIlETeauVuheD/OnkPi9BCkYs5K8SOMp5qUGqrlEeJJOHeOWRfglBeQU7tM7HbcFyVgO7hNAK/7kIIGOe188uMfuwLQcUsJ8d3UrH7rwSv5FQqfAMSqWBGu28BuUr5s9vc6KCVL9jObi6Y8qhKGr7+bO23gcRgCVNo4hzT2NF+EY/AY7xx/gtTbh6oWOBUAutCAgZgj8DHURm0GCB5mvR9gDHb+BN7s47Bj56iEPSEjtOJZWStBUxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGpHSHdlZWxCZFByK0YxRU40Tmc5MkpXaDFESjF3a3plTlVrUTdiV1R1cTFZ?=
 =?utf-8?B?aFBmNnpBVVRjdGsxcTV5RXF5VVBPSC9jdDk3NGt6ZHIrZkNDR0tYK1pGVWlz?=
 =?utf-8?B?YnlQaVFXVmd2ckxFTktZb0xEMUVxdCswMjBxSGhlNjJzOUJPbzZSdC9aTkdW?=
 =?utf-8?B?bHdVRTFuSkxLRXcxSFp0N0FEZUZHcFVyVTdjWnJIZXBFdUhGbStmT0xJR245?=
 =?utf-8?B?aG1ncTJYVjZjd05FNE9NeDBWODJ5c0VnWkw4R1VPQlNIOVgyNVNWY3NGVkNM?=
 =?utf-8?B?K2RMYm80d1NSZG9mM210WVNkTk12SmJ0UzBoRGhlODRtY2Q0U3dVUG16VHVn?=
 =?utf-8?B?QzZuS3FhK003bFFHUGUvdTR6NG0zMWJmS0U5M01YOFNwS0tYdWFhZ3Z1S1Z4?=
 =?utf-8?B?Z0d1bWxLbkJDQVJvR1hvUzV1cnJkMVdFWWl4cUE5TVBTdEZmMzhPcktPeVVn?=
 =?utf-8?B?ZStBdEFEdjQ0TU9vZjVLL1k3Tmc3bkpwd2dXNVE5TTUrMDNvRkNsOG5oOVRY?=
 =?utf-8?B?OUFsNktNVGcwc3IzZUhENkc5RzVrS2ExMEs4SldJbnhaQ0ZPa2VBQm1GTEtD?=
 =?utf-8?B?eTlubnUzcy9tRkh1dW5YMnB4c1ZwZUhGZWI0R2VpRTdvV2JuYjQ4ZWplRW1k?=
 =?utf-8?B?V1VOQ2RlNlYvY1NhUVh0VENDZUxmN0Jsbnp3MTdhdmljOHJ4WlFUNXQ1SE82?=
 =?utf-8?B?V2NNR01RekNrcWdMRnd6VlhnOTlZVThyOU1xdzliaFBaZ1doK1M4R2hHaWxm?=
 =?utf-8?B?Rk1vNkE0Vkw4dUpOL0NyS3Q4WXlWcTFBdGJKQnJkZitUbTU4b1k5NjBockww?=
 =?utf-8?B?M1J1bXpjTEM4V1dtOEU1bS9YL1h4VEcwaUNVVTl4VnAvd0w0Umk4SDVOSks1?=
 =?utf-8?B?Z2E3UCt3QjVFSG1ZOEJJamg0Njd3SW9PaTI2Y0IyTXdLV2dCOFIrTW1sRmI0?=
 =?utf-8?B?c0tiUTZGWitJVmF1WVRMbGJKMnlsRHNvTGtZZU9lV0ZiK1NkLzlqOUExWjVY?=
 =?utf-8?B?dWx0aGlYbS8wSE9YTzUrMTZPWTBremV6aE56R21GQzU0V0lheVd1UEJjdXBi?=
 =?utf-8?B?U0U0NlgrOG5JNE1CbmxEMmc0cEJhS2tKN0FsN0tWeHRlR0NnaXMxSHM5cHY2?=
 =?utf-8?B?Yzl6K0pCWWJ6bDk5M2NMaElGck4zRXFOUWl5cWRIbzRMT3V6STlBTm1TL2R0?=
 =?utf-8?B?ak1nREM1RU5vMmNhNXQ5MWxsdnRTVUpzUzdSS25pQmFtTmQvc3g2WDVUaVBL?=
 =?utf-8?B?aHpsL1VSSVRBanhreXVwWDZrRitrZUx4eGRCajdPRG1rOXNsd2lwUVZudE1Q?=
 =?utf-8?B?NGMwWlN6OXlJZnlyVFhtNDFLMmZlQmphbW1Lc1RKb3hQY3JneGN5SDFOMVhL?=
 =?utf-8?B?VTJ0R010eGVSSG1sK1NZWHJ2RDlFRjNrbE4xV2VqbUw1YytSa2hLdGNmZ29P?=
 =?utf-8?B?MUtGYWRlaEZuSlgwZlRSNmlNc3NHYkFYdnVPMkQ5U1p5L1hSSHB5ajRuYitF?=
 =?utf-8?B?VDQ2c2xDcnNCNlFGNXcwaS9WMndIRUEra0VnWEprUnNFTDFjMEdqSlFPVWl5?=
 =?utf-8?B?djEvMGhqcng3TDdhdmhFUlJwbVNuTGxQaHRaRkhpVHRVZzNoQW15TW1maDBF?=
 =?utf-8?B?L1lZMC9vbk9sRkkyRExiaXVSU0ZWQ2haZExyOCt3bFNuL21nRGVIRnpCZ3ds?=
 =?utf-8?B?bUQ0WGY4MFBVSURPVmcwaTNwcXBQTUpnbCtEYWYwNWJCaTZ5aU5ZRTBSUHUx?=
 =?utf-8?B?eFhRZThGdGdTb2ZTOGVSS1ZYRmRBa2dNNGJlWUhSOEI4K0gxQmt3bnpRanN4?=
 =?utf-8?B?ZWRndXJjUW1BclZKVmFSbXJTSWl3Z2VIbktWb0pRNHBsNXNnV1Z3YWt6azJZ?=
 =?utf-8?B?aTd2di85V0VqZ1RsekFCK2tha2l3bld5UGV2SUwyM3VoQzBoN3pieXgzOHVI?=
 =?utf-8?B?VUlVOEdOVUZVNkVtVk1TZ0o4eVlwdURsekNxbHliQlRHcWFNSGZZcnpCOG5X?=
 =?utf-8?B?QlZLek1NZW1hN2dLV2h4WEJ4MDJxcTJ2TUFwTTJmYkdmYjR6dCtMZHB3RXVT?=
 =?utf-8?B?MVZvWFRVRTNQY2pGd0tibTMyRU1iZk53RGM1TTh5dmtUWDRTRGdBaTZhNVkz?=
 =?utf-8?B?UDhWeVJqRGFsdEZDSEZXdjRnRi9CSTkwa2hQaDFuNEh1OU8ydFFibFc4SHpX?=
 =?utf-8?Q?mnTP0DuXMId2iRuP8N2zNBE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dsbjT/hRXqpW/Pk1JUlVRuAUAujNfXLhIzWmHBDfMErx6jnQ146tUiuvaGQX2sL2D1MZQgv9V11yYSHQBRWHz0ga8zMIYgzql/OPGxgZ4kYzjwP69FnLbVQAzpva5pjcyEKEvlVC0fgpHlWypN9YidXLh6WYVE48Iu2oXoG/vYhpimcBIQJKcqxbEGLcX0KwN5b8JwMJf91wqkPvMqcz1HDh24RZJEU+pPq1a74L+h7cFty0xGBEycyUJ58sjLhX1VcfLRmaEXauEIyXNxQBdLDIxGYpMLBUMFdGetV91H6Ir/VVMuqmGzyYnCrMwiIvKHGqx26eK1eUipxln3TiAZsZvQCsWbncIO50pCWw2FbntBKVdHvtZ715UKY3MwtQ74qcMBe6QjtnJQyVZ8Q636gtnMAuWHu9Y+5W4xpk8APNRE1KlvD27NXkr60N9nuq8LSdIhIBrm9kuPchvZk0gA4eFcNEsZlqRVPKPlgYB1+vOp5VF8B+SBTNi7iisNEl2lPLVqi0k+P5js/YrirrCpbT8L9Q4Yq7gUJvkoj9TZjUCC8VHaG+qQ4+Bj+nV3DKv7ssOT1SI1eFwRqAV9umnSK3O0lz6zo0zkMj8sqdVVk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7209aaa5-c195-4ac6-c3fa-08dc608a8e52
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:05:39.0426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc+dWlYik7vTarvioLNyGYd2LWfq0G9p/3VA2UNmGddMqy0N5kap6nwFoKH4fOHWBA1x1AkOqJTy7C1tuVowARRE8H0klnWTurCSLDqA5pKtQifh6nPH/zPXBzQTpOf+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4910
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_11,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404190122
X-Proofpoint-ORIG-GUID: vLq26I7hNOwJIzseDKvjhHYIGwhg50OO
X-Proofpoint-GUID: vLq26I7hNOwJIzseDKvjhHYIGwhg50OO
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

Hi Nam,


+CC stable( heads up as this is a regression affecting 5.15.y and 
probably others, Greg: this was reproducible upstream so reported 
everything w.r.t upstream code but initially found on 5.15.y)

On 19/04/24 20:29, Nam Cao wrote:
> On 2024-04-18 Harshit Mogalapalli wrote:
>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung
>> bug in fb_deferred_io_work()
> 
> I think the problem is because of improper offset address calculation.
> The kernel calculate address offset with:
> 	offset = vmf->address - vmf->vma->vm_start
> 
> Now the problem is that your C program mmap the framebuffer at 2
> different offsets:
> 	mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
> 	mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);
> 
> but the kernel doesn't take these different offsets into account.
> So, 2 different pages are mistakenly recognized as the same page.
> 
> Can you try the following patch?

This patch works well against the reproducer, this simplified repro and 
the longer repro which syzkaller generated couldn't trigger any hang 
with the below patch applied.

Thanks,
Harshit
> 
> Best regards,
> Nam
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index dae96c9f61cf..d5d6cd9e8b29 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -196,7 +196,8 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
>    */
>   static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
>   {
> -	unsigned long offset = vmf->address - vmf->vma->vm_start;
> +	unsigned long offset = vmf->address - vmf->vma->vm_start
> +			+ (vmf->vma->vm_pgoff << PAGE_SHIFT);
>   	struct page *page = vmf->page;
>   
>   	file_update_time(vmf->vma->vm_file);
> 
> 

