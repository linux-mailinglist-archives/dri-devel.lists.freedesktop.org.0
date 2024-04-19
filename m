Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC68AA947
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F2110FDCF;
	Fri, 19 Apr 2024 07:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="hhynvhar";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ROZGLE0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5401910FDCF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:36:12 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43J1JCiB013857; Fri, 19 Apr 2024 07:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=5l4jpgIOnBak56rJvFUSJcxImRouwzTUI5AVs9dhDrw=;
 b=hhynvharEN5Q68kaTgOUE/s/DSQSPqXLzej/D6atvoATjgn6obYRAbhwljnHMV1DNZ1D
 WkLL/Hqnuc3KrGV9cC6OFP5lIKbfmtAlGYSkH0EfzINj7/bUykI04ubaMjc5gGkJpSw7
 bx4OWOW4G4qq3Ltb1L/ktvOwRsOhyRFXL9PllYkD3PJFqrd40KwvMHbCUS6DcvlLgS0y
 WXsx9H9H0MM9e9luGAPDs43NSh+zbx/UQgOpuPG1bFlHvEitL2Cs3yVndfLmyqEsUZtt
 4b2XgQgrL9fGpjsZ8G0xkAc7zz5DxCe6YET/EuNIoH3fnzgd6ROE2nUPYF29jVnbQxkz bA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xfgn2v8b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 07:36:04 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43J79Ob0040137; Fri, 19 Apr 2024 07:36:02 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3xkc5fpm93-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 07:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipScQ7oZRS6KW1P3z2rkHFc3vKxacuhVUNAEkS5YR9Lc3fy9ka9PHHCoeHlIHbhqYvkDa2dyYBXrPUF1rTjysfvnXgw5kySNAKFfNJdqClAlLNyw8m0JHkClpe1NeauJaDKEqb6962i6VP+MZiZsA0kGcWc5HEdp8Q1PsY9WgpGr6AM/1agBMZYCxZ/gH96ceAxzdD9N2gA8mTUvn8u2VmLlitIkpW6SR56DbYoo0GPIQVMjmhFmiDPoE8YgTkh0jg5YGITssWXkcI0zAWUm0lNNFWGVuVdQAxVRaUsI5XK9djBfW8/S3PNJ/GDE1Uk6k2zYyatGE0Enpq9KZJcd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l4jpgIOnBak56rJvFUSJcxImRouwzTUI5AVs9dhDrw=;
 b=O5pN8vlu5U+mIxShEmKAPuOuDFtIzYg3fHPkibX+/qGExPeheFQivyUQEwqNPGoP4GEwt6SDEyLtET/2yGnwRxXPdG/N7pPSOPiW9ujLEpzUw9ZXReXKOG2TlynmBvc4D2A85bSeLlbw4SE5CLkRrZTvf+8X+3+9BuMzwGH/fUkc9ZYDj2T7QV80iuj2NKkQHkLtmFCCjWcPzkdRI/ZjsZGmS4REytfrejco7pxL0BQI9b0QlbSr1woBIFHJU4QekbdyuOskMJolgi7BcjcjVO7NFVHbs2oRMn39c4HDkJOr8K3IQnNR2sZji+Yf7TGAEpyO9L9CUW6rM54o+1aoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l4jpgIOnBak56rJvFUSJcxImRouwzTUI5AVs9dhDrw=;
 b=ROZGLE0ZEwfkCPsImo6xBLINaKFswA4O+Wv1PNBDxyG0ZIGpQkzYXX1t+hQd3DYtrJjLhdJCFWndBKWaARyAFQpAVw315a94+Wl7tdTg+M8G8sUc+z0BN2pgNIDVqe6D3Ug+ExtvrQlNIMLPAG92ItGuJnOupk4tzwtsJ/4lD2k=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by PH0PR10MB5562.namprd10.prod.outlook.com (2603:10b6:510:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 07:36:00 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%6]) with mapi id 15.20.7452.049; Fri, 19 Apr 2024
 07:36:00 +0000
Message-ID: <bcd611a0-ee8e-4a89-9783-81c3650b4942@oracle.com>
Date: Fri, 19 Apr 2024 13:05:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Nam Cao <namcao@linutronix.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240418160652.68df1a86@namcao>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|PH0PR10MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 00355dae-4fb2-410c-b7a8-08dc60435bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEUUV3SQkV9sX9WImd3iLQl/aONAYy011px7r8t34viuqP4LWdWNRM5+V4ylMvlxIwnlCyFjtO3OmudyU29xzRMHDXuqY4+o0TKWICg5NKUwtD/AfkAF8Nj9/FXSJBdVtSZkJAVKsHDmU5xM7p7JKJ1TVOLNzG7bOAWDTEzLYXYgelbmgPl7UvCAZlwqqs+hnU0JVMqvA29Ck354WFgp+I+LqUmdmllhzBdP7wZobhMrUwfO4TRkX1cu8QS0uXV0zUPxdqqdnhZq+UciXMNa7oksx4uZP3ns28KleflVIFRvMyB7Mo025YmQ8PJGptq7fkVV0zdypnBW3dsuPqqzBG43iLrSCcdhS9LcZYGTm8xSYZboXe8pp9ZGuD4UGNzVsdDz8LtF/rd0B4ViJJWAohT3oTlC7TkIJXcW9fuC4ROnbCAvFezjrEgAs3EubDBGxhXWHMfngfIpjHVX1GneDUWMg2cCU2BDWZtkd2bDZImFmLyC42GosCHGX6/5t8GZy4lXXVgqsqlM2z4oFlxdK6GXmVM3cTMmfe5pvFDBmcDLFoYTPahF1vT4CVITFNaNIciOPQWdVLQHcGR0mF4MtwwHNtIGZmth/Xb8JtnFnBs0HQ3umU5LLlTCs1KYWAtaeP8OZEhDtt6TsadOvG3N+jYeIEqxLTUn7woulEBBBoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHR2ZFRMQjBxeEZ6eElnd1I1U0h2UHBUSjBSRmMvTlJFdWxPRVg4Wmp5NFNR?=
 =?utf-8?B?L2dBbU8yaC8zeGxTM2pYeUhzRnJFb0pRQkhsSmJKRmZZMzR3ZXpWblFPVUl5?=
 =?utf-8?B?dTNvb0ZvdHpSTThpcFN4alNTK3hKcjVTbkRTUmlxMlJWNDZ6bU02blNOaTZV?=
 =?utf-8?B?V21JRVBXak1GUUJ0eU1NcGNaQnRaeUtMb3NsYTcvc2JuM3hibkd6elliYVM1?=
 =?utf-8?B?SUF4YmRxcFV6b1RGREJtN2xLcVAyZkp1eCs3VnlLR2JDZzRmQTJBbzFwT2JC?=
 =?utf-8?B?Vk5kN2NQVTloamtPUnI5ZVFXazM2WEJ3cE4wYndmcklyZG8zc2k5S1REaHVK?=
 =?utf-8?B?b2ZwUUtwbW9mN2JTOFNCb2tKZm52U29rOEpDVnpmVjU3WjJ0MWxzc0xtbVJT?=
 =?utf-8?B?Rk83TElnY3Y2QXc1b1NyU0RGU3NNVzc3blNibVlmaUhRWmRaMCtydXI0NE1x?=
 =?utf-8?B?VlhvSC84VXVsR0g3OUp5cCtGdXZjRUNlclNQRGdxWTJuckpUbXdwM2NITjFR?=
 =?utf-8?B?UkJ5Z1cwemFiTlNnQjc2N3BFRTdHRk43aFJvWGxEamM5cWNLWDJRSkxFdTdS?=
 =?utf-8?B?VG16OUs5Mms3bUcweHFCd0pkTEFBVklUQlcxRXpYWVJBMmdTZnRTVW1PUk1G?=
 =?utf-8?B?ZDMySjN1V0dGenNqdUluVUtwRWovakdlYWVmdEc5K1JCQVBTSUZUR2ErdGpn?=
 =?utf-8?B?dUtnWDFUUG1sRDYvVjVITHhoVGpncUJITHJ2N0RCNk95UWtsQnVXYld0ZGFE?=
 =?utf-8?B?VEhrOUQ2TlZ2ZjVRRjlhZnFQTFQxcU9rdnZLdTBSL29SM1IyWXd6VEQ4UXMx?=
 =?utf-8?B?UDN4UXJ3cllUdjAyV2FjVDk3REw2RFRMSmxNZGZBSmJtMmVvMWZEUG1oeXNi?=
 =?utf-8?B?WTdOTDF1am5OeWcxVXVoSGZqOFRIa0gyL1dTZE9IZ2tHNVptVWJjSDdraUR6?=
 =?utf-8?B?RWpnOXNSQmJheU9KSW9Kd2VZZ2dtOWhybFpLVmpybzZ3d1R0bDdJMDJoUEtP?=
 =?utf-8?B?MUVLUUozZGFIcTB1ZXF3NFd4Z1BtZUJFaVRxZEt5dTl5bmhGZzlCRmx1V0V1?=
 =?utf-8?B?UjlKZzRMTis4dUZFVjg4b1E0SG1sekl4VXpWT3Nmb2pRRXhLL2NFQ2pqL21z?=
 =?utf-8?B?WGpZNlczZTlyUVUxMEU5Wm0zdEg1VUZ6dHg3RzV5S2NxRWJSZ0Eybjl4emtF?=
 =?utf-8?B?TGZwenRyQzdINFNTTkxueDJ2bG5LOHVFcHJKOU9FU29samErV0tocFlsZmwr?=
 =?utf-8?B?VzR0M1NJZHhsOVlTYlYwUzh4dzhOYkRUamZLdUF3Ny9LV1o4d2pQMTYrNFZI?=
 =?utf-8?B?UTdPVXpRMnNaVVp5M01OdkI5VlBaZ3FYTDlxR2VXSlFJWjQyaTFXS0pHTXRQ?=
 =?utf-8?B?QUZXaHhqZ0dNSmNZQTlXSVhpSzlLaFJnQ2hPNjhSRGFuZGpNMXdvbFN4WGd2?=
 =?utf-8?B?ZTJsei9raWoxWHpXaUUwRVZyWE56Q3l3bU9xaGtaNzJEZUw0MkRXTXFDSk1G?=
 =?utf-8?B?aDM5eVVuS2ltM002clRWRFBpU1pMUXA4M01yb0xNM2Rma1ZmZ01TeTY5WlJh?=
 =?utf-8?B?WitXZ2NDRXlOWGFreUswdEg3bTVWTkFPZFBkL2QrV0hSYmNlU1gycSt4M3lv?=
 =?utf-8?B?WnVKNTZFYVo5cGRKUWRXRTdTcWdpSndKRUVWQzlBY1VvaktFZFZKYThYWkJY?=
 =?utf-8?B?Tzk4ZCtJa2c3UFJxcGRPQitxQUdmMjJhTERmTGgvdE9JMmd2Z1FQcjlQTVhK?=
 =?utf-8?B?Vk5GYXFrYi9QSzFiem55K1FSeHMvUVgvdmRHMkZ0YzkxNTBTYktVY0lTZWJj?=
 =?utf-8?B?V3lPYjNSZG04VnlyL3FabFJ1Q2ZGTk44VDZWZVI2ZEF2V3owVHBjNHFQS3pu?=
 =?utf-8?B?OEdrVVNuaWdYSlphbldxM1ozUFFqejI1ZjZhYW1oNytDdDJNdVVmZnJSUXlv?=
 =?utf-8?B?eUxOanlLL09HVldDcUFzVFkyUkZqWklHQ3ZraTdrTktzNjc4elBEOTVTU2Zr?=
 =?utf-8?B?d3RHc1RuTW5jZ1hPcXVaenBKc2dUekpTTFIycDZ5aHIvZTdFOHdRT2ticDdZ?=
 =?utf-8?B?SHpnNUxEU2NXdHExMFI4cDhxeUN1T25VODBZc0tBbEtSd2szMGVaeHlBZjk1?=
 =?utf-8?B?T0FRR05NK3VBMFRWTnZZVzM3T0xqRDNIK2FpOHZhRCtTUVQzSjF5YTVQNEFW?=
 =?utf-8?Q?1Dgb30Cb8ShBRi77p65QYiM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wfhv9HBiHJYBulgr/weXCIq0QgDEpuwOIfAdB5u3Aa1QkRtS7CdIxlDev94j8N4myYcnFvNCan1XSiB1OudYMYCZqay+uZwEzOEjvDZZuxALv6exgqg2HV3irY8rH6mgymI8v8/a/z079NIX5WxO7nNEXuwQlkjjHl5VsNwnZ6QPDkkod4zYqGxmn8Gd6qHAKWMwSnD/Eksl8hYLxF1v0+YYCIersfx30aCnSaNjY64bN595G+SZ+VqZPMwELIdMbyhky1OLAJj+8S/B+SgdJQt0Ij8VrY2aO803KNvPiDMNvUchwHmWAftdylhA/elpPiIFqMqVHRuPYYp35dwqQ79KRu+JkIse/jSp1OXjO6+XMXvlS6vtkBjVx2OabisfxPsuthzmLF/uSFecJZMT8m644/ZitbunoCX4zQEyUnhSVFh9qeFFIeDvCF1qYaqZMxSlNXbGy4cC8c+JzKiUmXsNT2DjatPPWeQBPbFKiF2n8Rg11wjYOu3HykYmSsWp/xWcAuR0q/B0iVZbVvNGbOfE6gQvZDp2zoLQ2aljSHFpbC+7Z3+lTYocsZGRneZcVTPoHCKqGtVei3xC1GVtJaxHopuNM4ZM3z+rXsGx8g4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00355dae-4fb2-410c-b7a8-08dc60435bed
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 07:36:00.4708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wb+NtICUBfu6bw8b15A2Vp8diRQqK1boFdGOQ5r+cywQyWx4HyRIbP3fWDd55EQYmvZRg1TZZ3Q0lBntsjzlQZIAndUYiKo2PUIW+DXVfvdEZjhVFTN/uge7BDc2Ft32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_04,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404190055
X-Proofpoint-ORIG-GUID: QMU2K5OXif2QViTvzDTtLHaO6B-aMaeY
X-Proofpoint-GUID: QMU2K5OXif2QViTvzDTtLHaO6B-aMaeY
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

On 18/04/24 19:36, Nam Cao wrote:
> On 2024-04-18 Harshit Mogalapalli wrote:
>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung
>> bug in fb_deferred_io_work()
> 
> Which framebuffer device are you using exactly? It is possible that
> the problem is with the device driver, not core framebuffer.
> 

I am not very sure about the answer, but the C reproducer uses(/dev/fb0)

int fd = open("/dev/fb0", O_RDWR, 0);

Thanks,
Harshit

> Best regards,
> Nam

