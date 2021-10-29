Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910743FD41
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122158954A;
	Fri, 29 Oct 2021 13:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568308954A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 13:15:58 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TCUDTB028594; 
 Fri, 29 Oct 2021 13:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=NgaLNk32eyGdTTNIMQDXB9Sz+CuuK/Vb8ZiSobNd23s=;
 b=BYLYCZA0Tvv35/5+CpHNK14JiY52OoEglPOiopIiEhHiLae7zuOm4t50ISZ0RJoeqwEw
 PQHRzITqzEmV7lkM3CR3Xc9aT2v8xTFAUQKDOqaY7TBNDr3ZjYaiyRqW3K32YRJYVXLg
 D/RiJ4DzZPSN+2cEy5EuC4oQnrziX4mjTXCBRISdJ3VwpesKadJ4/gRc6cx/H1HjIxy5
 ezozgWa63F3i69QvCWYDEPchYPs2D8Ccukjr6mRXQPBOrSs1OOvI207KJbX4wQnt/evX
 Zi0j20wAqFfnyLB2q++zH2+OhqzJZkonNO27eTytGIcmbhZGx62vqBssfM/VGf5zOUax ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byhqrfpww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 13:15:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19TDFg95125171;
 Fri, 29 Oct 2021 13:15:44 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by aserp3020.oracle.com with ESMTP id 3bx4gfw2mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 13:15:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5+uU7x4BOfdWc2GcCJ5P6M69i8Zq3BBO2ay3u3UW7aQTUX/WrY7FcSo8tj5kSKv2H9bWI1oSts4znilQw4s7/yVtyM8oKpHj8Vv5X4Vb4Y6dcCIMtNtHhD+ySIidtIso8qTcq8Kb1BN1YZUbTUQV7YrTHeVzA66heO9tpfqeLVZZ/7BlmU0gv7F8ttNl/CfcPkQ64ggqrN1yblHpOW0dzRu9v+GUXeY0P2OygAPK8ecHGQbgU3AZPINSnHr/XwPobG6CYn5clW124uM6mH1sF018i6dqZ4zxPT1cfkTsFQCnWmI8oKn665LMzmTn87x8Srk/+/MOac/pM6harv4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgaLNk32eyGdTTNIMQDXB9Sz+CuuK/Vb8ZiSobNd23s=;
 b=D1iYkbaSNo+APaukVxazWE9CQPfz7Qyp8BI8WtD2IH4Wiv/8Pu4cqyBQ+mZd1lx3eBs6pixUAUN6sVFy1hlfD9cKkMt9xcap1gMunrUR45P4Iq7O4WnmBuGKVrvyvoP0m4n08GzsaiZd7IKZqhdsIKq9K4+5e85NXNBM7hFDvrjcrTsiVu/UzJZrFbwG88HykPoe3HCtAcdH2u7MC8A6SyFIi5Wo1JmRm+MVi2YfortvcQDXFyBm7vbkNw4iki8tAjdrV4bLLLMXZ6ZGKn2zBZ5LDbAHhfgHK6OrC8x7rwWNv7zfB67d5g5LoMJiehEZpAfNoNaKz4ECK5KjHXjBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgaLNk32eyGdTTNIMQDXB9Sz+CuuK/Vb8ZiSobNd23s=;
 b=LCLTwGhB50HMrmcClmsxSRgXAiBi9VI+Icvnc1j3TEgYq1YwG44oHfuYhm/nm3K2pDkvESZ00WMvcMolct6P9u7XTZrrLBN4+B7f72jd2/geuQTi/vAk7t0AS+t9tPuI1Sq8+Zmvb/450w8CGb/oyR32d3iR5AkE3wtwKXQXYvM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=oracle.com; 
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN6PR10MB1857.namprd10.prod.outlook.com (2603:10b6:404:107::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 13:15:33 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 13:15:33 +0000
Message-ID: <26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com>
Date: Fri, 29 Oct 2021 09:15:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ben.davis@arm.com, brian.starkey@arm.com,
 Liviu.Dudau@arm.com, Dan Carpenter <dan.carpenter@oracle.com>
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YXqt46TPL9tUZCL1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.201.209] (138.3.201.17) by
 BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Fri, 29 Oct 2021 13:15:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f7e2243-17b9-416c-f5f6-08d99ade3055
X-MS-TrafficTypeDiagnostic: BN6PR10MB1857:
X-Microsoft-Antispam-PRVS: <BN6PR10MB185713EE195EF2732B92D380E6879@BN6PR10MB1857.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0llt4pA3bh7z0WBwHjAxfLQcy/m3MC5K1H3OJ/ZygXtAMZRh4WXMFDvOHvQ+2wUv/OhBiBmtp8X5PpPnbHXkh14BQBnEH3p2ieC3pzUSAi1vLgZXoaNuh4hI3j2I/ed882lQTtvXB5nlhhyyBoNRyAm9xuQwZhgoyAUxSy0v6KCIro2FIkVF8AhH/6mjfXEa9kpvpzjWbmdULMj7DoQj8v/KpzyRu6CKqLf67CaGOX4PbWKckV81LcUkal3OfpncCU33kbQjUnEo3B4mrSIrDgp8SNJS7Sr6wu6X/hoSGcmxu1tv9PHJ5nCbsi0IKZAmgu3ovOoQEMLIhpM1sEFhaJNj8Xuz81HgcyiGRNDIZlog6cFauKcR2zngUfZW1R2meiKBoYuCltPrC/mKnNyrjSv+GaPVLIjJE7qbKvWGGNHORl/gpnbUbRey9Da9mij+68+KgKZ9OWTSLwYbU/6aJR0MSqdBMaB/kZOTlUzmknFCPP4uDen7tQrHb6Ta5VshNperI5+pvuDZ4mhuqohUoFErJidShnQ5veIT+HPQBPkDERuf+JE7MnlILgVgOJD6iSuHHvAXAL2nIxW49CEI8kA/TlcDZWZMwrI/ouJlRFnwqxS1hQof2TDnRindpc5IlCXIeXAxiT2RR1J9Ty61yA6NiNozyqJ5JuH7J1n8I6Nn0Uh9AN8KAX9kZNfpp9qnIdcypEIKKQ99vnSJgbBz2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(86362001)(956004)(186003)(316002)(36916002)(66556008)(83380400001)(8936002)(66946007)(31696002)(38100700002)(31686004)(8676002)(2616005)(36756003)(44832011)(7416002)(26005)(508600001)(107886003)(53546011)(6486002)(4326008)(16576012)(5660300002)(2906002)(6916009)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlzS1lvaVlucGN0TjA0VzZFQWt6WHdyMVYyUUJrL2Q2K3B5TmlWekErZUow?=
 =?utf-8?B?cHhwRU9HTmcxcWlXRHduU0FqeXhRYWNlZ01MamRHRzgvbnMwaGJuSEpBenYw?=
 =?utf-8?B?bTRvQXAzWUsyQ2pvSEgwS0R3TEFtaURzZlJPRVZTMTNZbzdjaHBZQ0tEbzZ2?=
 =?utf-8?B?akhqRG84MkFxQXlieDVkNW85bjJrTmtwcnhMUllkVGVWZTUwYUVORWlDMzZl?=
 =?utf-8?B?N09WMG5paUl5L3lFR3BmS1hYS3VPVkcvbFJyME9qd0UvMEdHZWdTclFTOGx4?=
 =?utf-8?B?K0dZNzlCZnBmZE9QOWM4ZDdxOEYyUUIzOGRIbEx6WE5PS3lOZmlSeDlmTjdl?=
 =?utf-8?B?UWo1dWk5UXNkNmlCSjZ5K2oweFcyQzZmZmhxb3Z2b1FZY0E5Z2dPb3gvSnNr?=
 =?utf-8?B?aHNjUkVPQTJvSm54aWxNWS9TY3lybzUyV21vU2s4dWdIdmdHTjFGd29Hc2VQ?=
 =?utf-8?B?MU9ETjhDUVJmQjJFcHk5bjJveGxyTVhQOFFEb3lMWlZZSmxkbyt1ZjViTitL?=
 =?utf-8?B?dFZORllhd0lLWitlcXAvUXA4NTA2d2wraVIwN2IzenBXNHFzbnk0TTRFdUdQ?=
 =?utf-8?B?eXFuRE13aFExbzVrdkhyM2toeUpBbTNLZDkvODZjbnFjL0M2dzZmVFloUlAv?=
 =?utf-8?B?ZWtGV0hrREpqQXJRMnBXYzFGanA2VENBclVaVVo4SCtnNUhwSFdQbVZWeC9j?=
 =?utf-8?B?MXVKZ3F3cWVBTjh5cEhqZml2VE9yNVdmS0trSXp5dWppZG5XdWI0M29rYkND?=
 =?utf-8?B?WTVvNHZNRnRCeGZSR0ZnZ2ZqdGVLQ3VSeEE4ZkJncy9yek4vS1FPWC9hVCtt?=
 =?utf-8?B?V0tNN2d5OVdTTUVSNTA0eXpBR0IwN2lUVThobjZ3Y1RDbEVCamJxanlJdjhY?=
 =?utf-8?B?UHF2dnpqeDZvaUMzOEE3dFVRNU5PTCtmYUZGTmlXQ1UxaUU2UXp1ek1ueFVK?=
 =?utf-8?B?dnFyWDNKcmgyOGhsYjlRQjQ1c2g1M1lnak9aWjA1ZFdzc0lIVklFMlNMV3hJ?=
 =?utf-8?B?UWJtZzl1cmQrd1ZTSmFLSE1DdTdFWTFYVUczLzVlLzJSWTh1NjRwdFdNMis3?=
 =?utf-8?B?ZTU5Tmk4NVpyOG9CS28zUWtWMVA4Y3NWNEN3YUZWREp0Yi9QK0NUUmc5Sitx?=
 =?utf-8?B?b0h1YXh3VmdWaXpiWDRzRjZXQkxWODNMSmJ0RjM0OXEzR3VGdS9pTTdKK3Nk?=
 =?utf-8?B?dnNSalJUNXYxNy82WExTcWM2NUlUZU5MKzlzMTNCNHpxeGJwRTJ0eFd3VWRo?=
 =?utf-8?B?SjE2TStZM2hlRmpqQ21NL3g0OHQ3OFBXMnA3LzVFUGxtdWl5OVNWSDh0RVZv?=
 =?utf-8?B?Z3I3blNrdUFpSThMak91SWppVmJwZXladXZSZmNVMVdWVnlFUFFCTTJOV2V2?=
 =?utf-8?B?VythdU1CVVNVOFhIY2E0SjZJb2pXejJDWUdQOFpCRDJKOHdrdCtoSmR2NGtV?=
 =?utf-8?B?UTBKbUgxQ0VhdWxHejU2ODNjMG82RHcrUjZZN2RJdmRKanovcm03WG1oWUJL?=
 =?utf-8?B?N0FNTVBLOGdyc3BJbDVhWE02R1JLVzNVdFIzUGRUN3FrdTFSNmFUZDBVVXFX?=
 =?utf-8?B?aUVSOUNZZTQrcERJVkIvYUlFWnVZTklNQ0VTdWRVUDB2MGhSbzQyc1JrajF5?=
 =?utf-8?B?WVRUMW1WcGZ1SisyOUtiQ21NVUVlNzZOdjJzZmNyNzhqWkJGdVdrOVgrQnNM?=
 =?utf-8?B?eW9FdFpma001bkpIem1rUHhpd3RUbUkwK2NXWDh0SFg2NjdIUVByZzAvbE1u?=
 =?utf-8?B?VGoyYy9sVXFScENaSmthamRSVFVBVmVtcUdwZGVSd0hCaXZ4MjZWNUwwaUdR?=
 =?utf-8?B?aDJIano0SEw5alp6RllUbjFoSG90VkhmU2YvbFZPNzF2RDZxVWRPOXI3Z2l2?=
 =?utf-8?B?QUJnN0hGSFdEMERqNE9acDNZRGFNODkyQ0JCZzdkVnhXeXBWM3IvQ0pZMnZZ?=
 =?utf-8?B?ejNhekk1bHVCMjNwRUlsL0VnYkRKRTZ4S0I3ZTdOeHo2MDZrMVF1YzJVWGhi?=
 =?utf-8?B?S0x1a2drUks4eG5FSmV6YWJ1czllVWlaY0VIZjZtT2JUcDRXelVqUVE3c1VN?=
 =?utf-8?B?NWhpTFpLNUozRFdreXNqU2JOVXF4TXE0d1A3TUptTk5KZDNFVENzMWE5OXVp?=
 =?utf-8?B?QTkwdGJneWI1WVZYaEl5dHZ2R1lIazc3N1hoNTJZZGs2MndLTHRDcEZVMW9L?=
 =?utf-8?B?L2dpWnhmUXJJNUJaNnNXV3Q5cUYvMVFVVUdxMGpTMC8vWGsvZVFuNWdSOFMw?=
 =?utf-8?B?Qjd5aFBaSG1HMEdjZ1YrbDZ1QnpRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7e2243-17b9-416c-f5f6-08d99ade3055
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 13:15:33.6501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTP99qqj1J0pld2IvleNZJPyKkZxbYGVsrDYkC/WQQR8RGtD9aZUoEpNhcwSdT6QCGOISLGOqLVDU36vcvIPyklroRwUjxChrDw2FJ8ZVhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1857
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290079
X-Proofpoint-GUID: AxTiOmWfEiMkh-uAmBf3xDkcZuPuGJMl
X-Proofpoint-ORIG-GUID: AxTiOmWfEiMkh-uAmBf3xDkcZuPuGJMl
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


On 10/28/2021 10:04 AM, Ville Syrjälä wrote:
> On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
>> Do a sanity check on struct drm_format_info hsub and vsub values to
>> avoid divide by zero.
>>
>> Syzkaller reported a divide error in framebuffer_check() when the
>> DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
>> the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
>> the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
>> fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
>> vsub as a divisor. These divisors need to be sanity checked for
>> zero before use.
>>
>> divide error: 0000 [#1] SMP KASAN NOPTI
>> CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
>> Hardware name: Red Hat KVM, BIOS 1.13.0-2
>> RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
>> RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
>> drivers/gpu/drm/drm_framebuffer.c:317
>>
>> Call Trace:
>>   drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
>>   drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
>>   drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
>>   drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
>>   vfs_ioctl fs/ioctl.c:51 [inline]
>>   __do_sys_ioctl fs/ioctl.c:874 [inline]
>>   __se_sys_ioctl fs/ioctl.c:860 [inline]
>>   __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
>>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>   do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>> ---
>>   drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>> index 07f5abc..a146e4b 100644
>> --- a/drivers/gpu/drm/drm_framebuffer.c
>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>> @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
>>   	/* now let the driver pick its own format info */
>>   	info = drm_get_format_info(dev, r);
>>   
>> +	if (info->hsub == 0) {
>> +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (info->vsub == 0) {
>> +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
>> +		return -EINVAL;
>> +	}
> Looks like duct tape to me. I think we need to either fix those formats
> to have valid format info, or just revert the whole patch that added such
> broken things.

Adding the authors and reviewer of the patch in question to CC.

94b292b277343190175d39172c903c0c5fb814f1 drm: drm_fourcc: add NV15, 
Q410, Q401 YUV formats

Asking if you have any input on how to deal with hsub and vsub = zero?

The sanity checks of hsub and vsub in the proposed patch are similar to 
other error checking done in framebuffer_check() preceding the proposed 
patch.

Thank you,
George
>
>> +
>>   	for (i = 0; i < info->num_planes; i++) {
>>   		unsigned int width = fb_plane_width(r->width, info, i);
>>   		unsigned int height = fb_plane_height(r->height, info, i);
>> -- 
>> 1.8.3.1

