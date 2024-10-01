Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383DF98BC1F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 14:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A729C10E60A;
	Tue,  1 Oct 2024 12:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19C310E328;
 Tue,  1 Oct 2024 12:32:39 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4918IRES011574;
 Tue, 1 Oct 2024 05:32:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xhakk2a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2024 05:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEuAu+Wt41boYiGCkMmPt5iimOYSjy3qW6K3HjCLLmfZbhea6RKTeqPxjRJyk25Rr95kAOgAmC5uwwJbRh6DLIiI3XetB8zZe53IBr+Mc0tnCmBLEiZQ8/7VFCkgoeVN6hSLSaBPSHIkzl8O8DNINiM3SJQNtZRo/2klmiul5unhHEC4lPsoIXiD/UPuiRhNxMztqvjUbTc/VXci0CF9Q3yfCzfRI/wNuA0qlMPhHDZR1yz5mUQ953f69U6dZhnRqxCNbOjjdalHYaEQaCoW1gSidnmiPsNDHvhociKsJIOolvoJ/OGXAl+0mODs4575pwTiJ0mCNTXRKGNDzYkRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkZ/4EdeQZcmFH1nIyix7c/0GIkFxRku0Pt5k6gFu8A=;
 b=VebGPa6h7SDr9bFVKC0nalAESDiV2aDWMbq6EYqKkqeO5Ln1DHVG9B2nTuQy95+nbbUDIlyafHOmb2iMwyGOF5zPYIkoBymxaZZSyYlno1LStczFtUHHr9brTOn0j9p8Pnbbc2lQMttlPn82pn3xL9g+KIjMr5zZ3574R6Qg9wbvihLq6S5V1++WIVrzTKMljC1mo0mXZnUncVD3Ace02arX+UWjOvq9oi3fRrDQewJrl06jwiQ5lBRZCQPsK429k7dUBJxfll3VWaTt3yqNG5eKJN89yJ5aKpUG2h7vpSCcmp6mXnCjHA3QiLCNQkX6AGby7obLy83iOY8igLrNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 12:32:17 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 12:32:16 +0000
Content-Type: multipart/alternative;
 boundary="------------PdhGCWh6MKZNHQCM93YVRH1u"
Message-ID: <49288307-a98d-460d-88d5-e92f23a31a46@windriver.com>
Date: Tue, 1 Oct 2024 20:32:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
To: Lucas Stach <l.stach@pengutronix.de>, sui.jingfeng@linux.dev,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
 <7a6ffbb773784dee0ea3ee87e563ac4e4f7c9c90.camel@pengutronix.de>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <7a6ffbb773784dee0ea3ee87e563ac4e4f7c9c90.camel@pengutronix.de>
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 843d4cb7-31a8-4940-4d9c-08dce2151559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sjk2R3dHMW9WbWJwSzVKeGRvdHBUUzBoM0c1TU5XYzRCTFAwUDYwODRWRTlQ?=
 =?utf-8?B?QnZHanp4dXdmRGZOL3lMU1hjeW9BNStJSEJSc09Lenh0ZG5uWEdmcEJaVnFN?=
 =?utf-8?B?aXlYWDdQckpoR0c0WEdBUjdhUEgzZkMwTVJZdzBSRmFHTGU4OHdCUHpqMDU0?=
 =?utf-8?B?RG9pUUFYd2tSRG5UTXBwdlp2S1Z0ZTVNODhVMVBMdUxQZk5tWkNDR0xJS2Fa?=
 =?utf-8?B?MEtMWVFWNEpnQm5YMkxwVEFKY0RDdFhJaGFLY0tTZHU0V09iTG9GK3kyTmVG?=
 =?utf-8?B?c2pTd1U0U0VwZXZNZm9ZVVBya041VDV1akdCais4K1NiUS95d1BQNmZSbHNX?=
 =?utf-8?B?VVNINVZnR1YrdXNVTkZGamNBdTZrWVgwWndOVldFaEtLNnJtU2JIU1JiSGpw?=
 =?utf-8?B?OFdqT3lQWmNyKzduYkl6NG9YR2lNNnBwNGNZaDNpTWgvdXdMb2F3YU9Qc0Qy?=
 =?utf-8?B?dnRvVFhjaWRuUjdQMDRHMTJkenlucTI4blZzMnNhODEzUDNGUzFJejdlbSt0?=
 =?utf-8?B?TlJrSnhiamkxZ2pKckliY2tFdEdUNmk1N01ZVUQ3S0t6bk52UWhnRU1oNlRr?=
 =?utf-8?B?WGJ0c3puVDhDK0FZR2wrU3pSYWxzK2c0SExxdk9FY09pVFRDdEZwSHMxaWRh?=
 =?utf-8?B?N1JHTG9hWU1nOXNkT1FCQ3haQTd2NnYxZDRaRk5zS3lEQ3o5STBiSXRySStz?=
 =?utf-8?B?UlMzaVU5VC83K2RoalRBTVoySWwwdXM2eDl1ZnczYnBjN01HNDJjbmR0Rlhr?=
 =?utf-8?B?dEFlYnAyNjlXRVdOWHBlS051ckpITDRKRGU1N0VrRzQ2dDhLNzVGNmp6Zlc0?=
 =?utf-8?B?L3NjOHFYc2RZSWc4M0NORU5GUkJjZUNlUGhILytPVjNNWlpTNFhINWhCamRR?=
 =?utf-8?B?VmJTUWNzREg5bHBiMVZRS3Z2ZXF2cUdSZUVIK3dNeFJvOWM4bDIxM3lxSUp5?=
 =?utf-8?B?M0xiZVdUZmFUS2xEbEp6WGJlM25VR0Z4QlJ6QWZvZytkbzFPOTBNbmthcitL?=
 =?utf-8?B?MXp2N1VzUnc2VEJQelo3RmkxOFhhSUprMjZJc2ZmbDV2KzV0VW9leWdSTmow?=
 =?utf-8?B?RlpOUXRTL2paNVhPVktFTDJPdUFWbGFGbnpRRG1jY1IzOWRNdURJQ3Yxb1Y1?=
 =?utf-8?B?US9aRUFBR0JDSGJmZEdxRGdKL1Z0Q3l2WmovZUd5ZFdKaWZIZVJJTjRhZWxB?=
 =?utf-8?B?N3FWVU1XdDlGTEwvYkNXVDJpcmRXMmo2V2JtUXI0NWhRaGhOb2tCSVVFZG5z?=
 =?utf-8?B?NFlMcXR2STJBMmg1TGEzVDRKc2xRS0t1N3RlaDVHRUI5UTZCSHE1ZjdRa0pI?=
 =?utf-8?B?ak80WHg0dGpCc1ZTM1Bqa2dKRHphV04waDRZRnZZSnlqZnIzOFhjQ3h5SEJN?=
 =?utf-8?B?UmZRM09EWGFrWEpra2gvaUZqTDBsOGluSUUzMlZPeGZaRkExRXdiZ3hXYnQ5?=
 =?utf-8?B?Wk1hWGxqREFFNEZaV0E1UGFuaWNtTlBuQlJnSUZ0Z2NId2Rtejc5bUNPdGxl?=
 =?utf-8?B?V1V0d2tPM20xZnVmTmtWMlZMdlN3dmJMejFHOERiNmNtL3BsWHdFYjh5czZP?=
 =?utf-8?B?eHVITDhVL2JSWVZ0VXNQOFYxSitxL1VUWmdyamZhcDhJd3pqR0ZFYzlEZFZu?=
 =?utf-8?B?bEY1L2xzNUU1RzlhVE93M0E4b3hCTmM3WlZTNHJ6WlRuNThMZ1pHaUxYYTQ1?=
 =?utf-8?B?THFmclp5TlRFMmEzMjhlZTgrdnZ3WUR6eld2dTRDMUpQaXhHTUFkeTl6T3NP?=
 =?utf-8?B?VnF6Wkhia2EzN3JUQW92M0hWQ29vUEZtOFMyY3ppdlo4eHNFV0E1QlNQYmdy?=
 =?utf-8?Q?R9Zmz98tqJy7Q3Jqgwkz6GoVR6P0JanTBrZ4c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2pWelhTZExzOGphZ1pQblFNbmtyWmtJWXV4WGNNV2JHQjBEMDFrM1RIRW9j?=
 =?utf-8?B?VTJSMVFWVWFndC9kYlBYN2p4MU1sKzAwYzFLMU5uYUVUREd5RVM0eUZpUFQ2?=
 =?utf-8?B?QitYMUhiSHVDaThEUk9zWUQwOEVEOSs3NmN3N3p2dXVOTDZTTS9rUFYrdXJ6?=
 =?utf-8?B?OVp1QWxiZTcyekk3VGtpUGM1RHlWOXRnNE5HUlhOaHpOZ0x3S1VhelMrN3Vu?=
 =?utf-8?B?NWpDSmdEZ2VBOUdLTGR3T3ZYUmg2ZmpoM3NUdDNqTy9OVFcrMUdaZ0hjZ1Fz?=
 =?utf-8?B?cjh4cExVT2IxREd5WVp5V1ZtcXN2U0o0T0JWMFNUWkpieTJwK0FOZEZwTlVN?=
 =?utf-8?B?Q2ZoaFFtN0FBZUpHRmwyZ2tvaEhOUnByQXVkVHdLM0JQVlhSY2FvenJEc3FM?=
 =?utf-8?B?cDNsR1ViZjRnYkgzYXE0aFE0dmdkaXFnVkF5Y0JTcnhPcURDNzVnek81Z3JR?=
 =?utf-8?B?TU84OU82d20wVG5GS0wwNWhaclpqRkZ4MmE0d2N6b0Q4N2l0MFI1M1cyejda?=
 =?utf-8?B?aS83dHUydjI5NkhlTHdYS2l5WkVzMzVpb2J4R1VabXBuWU5ndEdrRk0zOUV2?=
 =?utf-8?B?cWNncC9nVmcvV2UyVEJES2VUM3RVZ2djTkNMaTBZaDR1RERjMU0xUWlOWkJT?=
 =?utf-8?B?NjBNcXFleGpTRXQ5S1NQMENHeklQWE5nTTBDNHBqN0o0em9lL0x4SGpaVGJ1?=
 =?utf-8?B?Vi94R1A3WnQxOWxmSmlzOWNXaXFUa3hxQ3ptVjZGOUozUnBreURnM3owd29N?=
 =?utf-8?B?a2IzclFsN1ZqVy9TdTBObnJTT0dxVEVVMUJsWXQyRERXRER1L2cwZlFyd3dN?=
 =?utf-8?B?bnpzUERMbFkrVEJMZnVlUkc3SllmOWI3WGozRno3b2NPVk9rRWpxMk5OZEJa?=
 =?utf-8?B?UjlwdWluRmdmbnFaSGV0RzR0dW4vUUl0ZWc4Vm9TbERNcEx5OFMwZHB3QnRD?=
 =?utf-8?B?VUM3aDd6V0ptYWowMTlwa2J4bG82aXZYdFVFWFBROVVFUW9FcnFjUStIQXR0?=
 =?utf-8?B?eU1lS1pNRXdVZ25ZMVN5SGRRaDdtTy83NW04WEdYa0xxeUgxTnBHNGc0MUVS?=
 =?utf-8?B?MEZKR1R3TlEyVFVoanZBbHg4Z2hyUkdMTXFNcXUzZS9KMkZERHVjTGlRUXJu?=
 =?utf-8?B?VUV0N3RLUmJxU211dk5CanA4TlVLZXFuME5TL0JaTENQdGxiM09pOVJ3UThF?=
 =?utf-8?B?ZWJjMEJKWGFwTElrcmFHbm5SVU50WTB2RE9DTGZ5YjdIQVZneXpFRURqVm4y?=
 =?utf-8?B?dENxdGttZTZtNklKcUdwQ0taUVRoNDE4NkNZUlB0cTJ3eVBCZHhKYklhVTYx?=
 =?utf-8?B?eTN3QWxWaGlScUlrc1NnZ2JmQ3hZNjhlUzgwdlFIZGUybEpXbnh3M3hCMllS?=
 =?utf-8?B?M2w4dEE5YTF6ajVKWVNPWXQ4VnlITlovREZVUEpob1VoVXJHaklQUUg2bzIv?=
 =?utf-8?B?U2N6bG5LNVY4dWhzYUJaRmxueEx2Q1F0ZWtYM0VicGp1MnlxQ0g0UVRUalNi?=
 =?utf-8?B?c0JsTm8rakl4eFdnTmpjamFzU1JNT0s5dXEvVVdBNkNqdCt4ZlRxRkJxNzdx?=
 =?utf-8?B?Q3VLL1lkTTloSjhsajhDVE5TcWlaN1BTdVFEZ1Exb0Z1UmdUSlo1UGQ2ZnpD?=
 =?utf-8?B?Y1VrNERORzNuNGNVR0k1dkJMaXVyVmgrT0ZxVnpCcy9maElvM0NVd1N4OGxr?=
 =?utf-8?B?Z3EyMmMyb0htQUFodmNjeXBJTEVaSlkraVV1R1Ria1NRR3o5M2FKM2tRSTlS?=
 =?utf-8?B?dS9HYjgybWZSeTgzdG1OamdQTG1zUDEvck00SmI0Qk1pVWcyanpqTDlLNm5W?=
 =?utf-8?B?VGJtRWxQOHRZb2NBdklrVXcwcmc0RzJoZzY3SnBXaG9zRHpUVGkwcDdoTWNB?=
 =?utf-8?B?YkpROXZHWnlrR0UzOFhtdTE5dVRMMlBPajExT1RuR2RBZExrKzF2MTJwNFBV?=
 =?utf-8?B?MmNhL0tWdFpjdlQySHg1OU1aNVBnK2hFOVRGMVVUdHVHbWlqdUVyaGZFUWFV?=
 =?utf-8?B?eXYrVUpqZnY5R3JEZXJvaU9YVXlqenU4cWdRMUNxNjRDSDNMKzQ0Q0JibC9E?=
 =?utf-8?B?SWUvVUxHUy9SUDc1aXBUaHIwcTJTakJweEhBK25FWjQ2QmNsbEJjanNaeE94?=
 =?utf-8?B?VE83a2l1Y2dDbnhOdGRLS2pmd2lWbjRnME00bURZd2dQVW5wQWhabWVkL2FV?=
 =?utf-8?B?ZTRvRGNvSkZGelNWTWZhWVoxcnhZUUREc3A2eVYyMlZETklSa2VEUCtRQThV?=
 =?utf-8?B?c014OHdjY0FqRjk0a0F5cUcrRXJ3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843d4cb7-31a8-4940-4d9c-08dce2151559
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 12:32:16.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj8htEaD+sDbyFIBNyw7FU4wIsSiCbvTCgnkqp22c+txrhCWEfYPJP3J9nWfBIi2iU62t283beyEozQ3lD1rFJC0Hz5q2j6TUm1UcUswY94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
X-Authority-Analysis: v=2.4 cv=YOLNygGx c=1 sm=1 tr=0 ts=66fbebd4 cx=c_pps
 a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=IQra9Bw8izQGhziNmecA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=LVVdaqqDU9W9cF4QaU8A:9
 a=d8cnWXKa1SzA2JLG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NN3yzoFImxL8syDjgejB9olAAoSAIFcu
X-Proofpoint-ORIG-GUID: NN3yzoFImxL8syDjgejB9olAAoSAIFcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_09,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2410010081
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

--------------PdhGCWh6MKZNHQCM93YVRH1u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/1/24 20:17, Lucas Stach wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> Am Dienstag, dem 03.09.2024 um 10:08 +0800 schrieb Xiaolei Wang:
>> Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
>> and since all vivante GPUs in the system will share the same
>> DMA constraints, move the check of whether to get a page from
>> DMA32 to etnaviv_bind().
>>
>> Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
>> Suggested-by: Sui Jingfeng<sui.jingfeng@linux.dev>
>> Signed-off-by: Xiaolei Wang<xiaolei.wang@windriver.com>
>> ---
>>
>> change log
>>
>> v1:
>>    https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/
>>
>> v2:
>>    Modify the issue of not retaining GFP_USER in v1 and update the commit log.
>>
>> v3:
>>    Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
>> instead of
>>    "priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
> I don't understand this part of the changes in the new version. Why
> should we drop the HIGHMEM bit always and not only in the case where
> dma addressing is limited? This seems overly restrictive.

Makes sense, thanks for your reminder, I will drop the HIGHMEM bit when 
the next version has address limit

     if (dma_addressing_limited(gpu->dev)) {
         priv->shm_gfp_mask |= GFP_DMA32;
         priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
     }

thanks

xiaolei

>
> Regards,
> Lucas
>
>> and move the check of whether to get a page from DMA32 to etnaviv_bind().
>>
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
>>   2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 6500f3999c5f..8cb2c3ec8e5d 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
>>        mutex_init(&priv->gem_lock);
>>        INIT_LIST_HEAD(&priv->gem_list);
>>        priv->num_gpus = 0;
>> -     priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
>> +     priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
>> +
>> +     /*
>> +      * If the GPU is part of a system with DMA addressing limitations,
>> +      * request pages for our SHM backend buffers from the DMA32 zone to
>> +      * hopefully avoid performance killing SWIOTLB bounce buffering.
>> +      */
>> +     if (dma_addressing_limited(dev))
>> +             priv->shm_gfp_mask |= GFP_DMA32;
>>
>>        priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
>>        if (IS_ERR(priv->cmdbuf_suballoc)) {
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index 7c7f97793ddd..5e753dd42f72 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>>        if (ret)
>>                goto fail;
>>
>> -     /*
>> -      * If the GPU is part of a system with DMA addressing limitations,
>> -      * request pages for our SHM backend buffers from the DMA32 zone to
>> -      * hopefully avoid performance killing SWIOTLB bounce buffering.
>> -      */
>> -     if (dma_addressing_limited(gpu->dev))
>> -             priv->shm_gfp_mask |= GFP_DMA32;
>> -
>>        /* Create buffer: */
>>        ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
>>                                  PAGE_SIZE);
--------------PdhGCWh6MKZNHQCM93YVRH1u
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/1/24 20:17, Lucas Stach wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:7a6ffbb773784dee0ea3ee87e563ac4e4f7c9c90.camel@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Hi Xiaolei,

Am Dienstag, dem 03.09.2024 um 10:08 +0800 schrieb Xiaolei Wang:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
and since all vivante GPUs in the system will share the same
DMA constraints, move the check of whether to get a page from
DMA32 to etnaviv_bind().

Fixes: b72af445cd38 (&quot;drm/etnaviv: request pages from DMA32 zone when needed&quot;)
Suggested-by: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:sui.jingfeng@linux.dev">&lt;sui.jingfeng@linux.dev&gt;</a>
Signed-off-by: Xiaolei Wang <a class="moz-txt-link-rfc2396E" href="mailto:xiaolei.wang@windriver.com">&lt;xiaolei.wang@windriver.com&gt;</a>
---

change log

v1:
  <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/">https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/</a>

v2:
  Modify the issue of not retaining GFP_USER in v1 and update the commit log.

v3:
  Use &quot;priv-&gt;shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;&quot;
instead of
  &quot;priv-&gt;shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't understand this part of the changes in the new version. Why
should we drop the HIGHMEM bit always and not only in the case where
dma addressing is limited? This seems overly restrictive.<span style="white-space: normal"></span></pre>
    </blockquote>
    <p>Makes sense, thanks for your reminder, I will drop the HIGHMEM
      bit when the next version has address limit</p>
    <p>&nbsp;&nbsp;&nbsp; if (dma_addressing_limited(gpu-&gt;dev)) {<br>
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; priv-&gt;shm_gfp_mask |= GFP_DMA32;<br>
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; priv-&gt;shm_gfp_mask &amp;= ~__GFP_HIGHMEM;<br>
      &nbsp;&nbsp;&nbsp; }</p>
    <p>thanks</p>
    <p>xiaolei<br>
    </p>
    <blockquote type="cite" cite="mid:7a6ffbb773784dee0ea3ee87e563ac4e4f7c9c90.camel@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">

Regards,
Lucas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">and move the check of whether to get a page from DMA32 to etnaviv_bind().

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..8cb2c3ec8e5d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
      mutex_init(&amp;priv-&gt;gem_lock);
      INIT_LIST_HEAD(&amp;priv-&gt;gem_list);
      priv-&gt;num_gpus = 0;
-     priv-&gt;shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+     priv-&gt;shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+
+     /*
+      * If the GPU is part of a system with DMA addressing limitations,
+      * request pages for our SHM backend buffers from the DMA32 zone to
+      * hopefully avoid performance killing SWIOTLB bounce buffering.
+      */
+     if (dma_addressing_limited(dev))
+             priv-&gt;shm_gfp_mask |= GFP_DMA32;

      priv-&gt;cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm-&gt;dev);
      if (IS_ERR(priv-&gt;cmdbuf_suballoc)) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..5e753dd42f72 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
      if (ret)
              goto fail;

-     /*
-      * If the GPU is part of a system with DMA addressing limitations,
-      * request pages for our SHM backend buffers from the DMA32 zone to
-      * hopefully avoid performance killing SWIOTLB bounce buffering.
-      */
-     if (dma_addressing_limited(gpu-&gt;dev))
-             priv-&gt;shm_gfp_mask |= GFP_DMA32;
-
      /* Create buffer: */
      ret = etnaviv_cmdbuf_init(priv-&gt;cmdbuf_suballoc, &amp;gpu-&gt;buffer,
                                PAGE_SIZE);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------PdhGCWh6MKZNHQCM93YVRH1u--
