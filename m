Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4B7F7856
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 16:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8110E806;
	Fri, 24 Nov 2023 15:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2EC10E806
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaakHOV5G8Bn7TVYDSDuHyxvI8lF3wsbxHtDFZqen2YyqyDVN3bJ1Ne8bukUYEG/VX6M2wOlROP7qiZvyqlBCuMBLZaxz6xLlC4xY2n9x+4+Zub90fPqe1YYR9A+fI/6tZEtQULd8mecHFPmnYXv5XODcppeeLso6+3OPkkOqM5x6tegj3POGV6UpxRTNvz6fykuWfvrM7hLsjtZ6+Pf8KnMaj1pknd5KbWT09wyNpH21e4FtIyJC9zZjTy+eF9hejA9dO/Tuhr/kt2rMTMA3RNk/Io6Fjfgagw9SL/jcBcnK/o8kmo57IPwkKQep7EaCJRS2/L5CRkynCVFzTZqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJrz4I7ckjLzFxmcNBxTqE9m1ARWYPBtvZK9Xsld2L0=;
 b=iM1i+5nNO7gSbyNWs+woVJTwDluEXeKZ7GFlINdyRv+9RnEG5oeW6qNAlIlpzbJwM7b7vd6MbKiBuTl7CpMrFjkfPhLR/Rut4c/kc/X7k3yOXx7L741mi6kpBIDLVGsLRfcX2Of9aks2s2/UpQI5G+HYPTKTNvjrmTODebQps1KduaId23Sq7cdOGkOoFIxCHkiwF+eYXqUABYxyZ/CSP8SxbEqB8v7X+c3REXg2swiS12q9cDejhU+Xg/2XTRyHk3LEAJBL9R3Y5Ugf4vLiOgtSYvfVgV3vxE0+fDfbzL8pW++H0oJhnK7IdQc6xFyeAU95hawFbCN3c3tEa0vhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJrz4I7ckjLzFxmcNBxTqE9m1ARWYPBtvZK9Xsld2L0=;
 b=t/Ucafr19wByKlew6/O81QQcSAFpJoobXz+iNQbd97/hBlOafzvvgeyqOXvuOXn2kXuFQxBisAWu6MzKBlqCVgZaFyDSXJA68m0Un7XUubnH00pNO4AITbCw+mL06ioKYGHgoAlCohh5Nbt1xll6/Q2vUXVnCngRhj/V3KGw8UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7540.namprd12.prod.outlook.com (2603:10b6:930:97::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 15:53:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 15:53:30 +0000
Message-ID: <78a97668-a97d-4637-969c-e724a7423909@amd.com>
Date: Fri, 24 Nov 2023 16:53:25 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Bug in the error handling in TTMs pool implementation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a7caca-9399-4693-5a69-08dbed058118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58ssKSGFaHlSZa6V51fN3aDMaTctoX4m4pML540EXcJlIiKfiCe2HQsoAfmSqILj0hbG8TpFCGkvHYf/SKaODrQr8Mxk0tdIjWCkXdRnPq5vufC3r5FCfQkjwuIOp3nSXti6smgphfWDApqLgJEJAqbvHjlPvGJMxd/D+0coX6+aCtXRoTvhxYaYe65AmgiiZ98K/qpcqcyWhiq7lKUzLCk3rMFo9SpVdjpyKyf3cXRQvV7J0OhlNI98E5wN4ygxyZg6t4MoMccKBDEixodX8gF2OdPHTPC7hQlt+Qv2kt8Wloo7j9WXoJsowxIoAMs4glB7eiVKVPrE9lNeerf25QEw9RAWjaTPYXvrjXPlQe8t3i5YteOnn7d1sMZAKQ4G/NN1ocdz6DdgyLgf8UonqesGydS4PxgzB2DIFaKBK4ntKe8QZHLpQDVxMvdbT6yhQCKwErCKmpy6nJ1v0Dtw3P0gqMjH+WhfdGLfu9M/uE40txN2BCi1UX6eZ32T6vvmzIxT/qHs07RWxa9GNRKXMtlbdoOqfGOfc7MtU5gA5BbSv8abkmDRSKLTId1+4RE9F1thEbJqtigDLIUCwslAai9KNwpDxVdn53Av/NJmkOMnuq1RFJs2WO8BVmC79LE5iTt/thQAcSPUMVoMlSkWjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6666004)(26005)(6506007)(6512007)(110136005)(316002)(66476007)(66556008)(66946007)(54906003)(4326008)(8676002)(31686004)(6486002)(2616005)(83380400001)(478600001)(38100700002)(8936002)(86362001)(31696002)(4744005)(2906002)(5660300002)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M245SlBXaWVyN2puMjJuWTBva3JQOGdzeHhINlBxSDYrSnJjcFBMTXZ1T3BP?=
 =?utf-8?B?d2pIeXJlb0V2ZURKbDVSZ3pNWC82S1VzQ2hPTTB2dko2MkRER0gwL3kwTE9W?=
 =?utf-8?B?Smw3QW1POWNqdzRwR25CT21kWE42elpOcDdkTkR4WEU0REVvVGJOVHNVRjVp?=
 =?utf-8?B?MWkza0plUGF6b3BoTWhTeHp2ZWtmNVRaQkRBbXYzTzNaL29ZSWE3Y0Rsb3lE?=
 =?utf-8?B?YUNqNmtLdTVUc2IwR0xzNEVsZGpOMDhEV2hlZTgwZ3VEZ0phUGtGZkFBbjNa?=
 =?utf-8?B?TGtZRzVQbHNKSUhxOGxUSFR6VVlHLzdycFZPRDBzaU5iMGh6Y3lWVUJTWndT?=
 =?utf-8?B?Tk9lV0R6K0taV2V1UnhpMldPZi9kUHZEVzFWSFFJS1ZBeERkblRVYVg0WVJw?=
 =?utf-8?B?dVZqblBqbWNSL0NuNk9pVXQvZ2tHZG9JSW1EQmxiMm9VMTRMbE11a0RaTjA2?=
 =?utf-8?B?MGJzbmhKNldrandEQitKVWIybmp4TUptcDdpWXptWUI4VmRWNm5sL01CYXBG?=
 =?utf-8?B?d2RVS1NHN2E5ZGhUN2ZWWFJjeEZwN3ZNL1FrTGxMcm1LVUpUNzlXZnY4OGJm?=
 =?utf-8?B?ZE1pNmxIQ3ZlWktjUjMybzVaMlhkMTduV3R0ZGdIUE80ODhyeENiek02R3dk?=
 =?utf-8?B?WTRtVWN6Qm83cG1NczhSWFpyRnFuRVY5T21iTzlJT2paQlphZXgrN0M0eDlI?=
 =?utf-8?B?RG42dHpqeWVIUjBYQjFVWFFUKzRpQUg4VnJNRXJhU05NNE01TmJWaHBWbVFK?=
 =?utf-8?B?dmYvZGlETVltMjNPWUwvYTJSVTNDVDRXZXJlWTBDL3RzcHhmQTRmTVBTMXFW?=
 =?utf-8?B?SUg4bW1kQjdvOEpHdmZYRHpxK25tMHlBdnBtMjJLN3puSU5TdGJ5ZDlocnh6?=
 =?utf-8?B?YUdxRDRVNk5TYUVpSjZVVU40WFQ3ZlFoYkx2b2ZCV0tHSGlscDErRDNVZU00?=
 =?utf-8?B?bE96MnRqWk9BWUVCaFYyRWJZQitEaERhWElhWDlFbC82UzB4alhhaU5wZ05M?=
 =?utf-8?B?SnFDdUduVEVUZkRhRTE3U093SHAyQXc1VktrYiszNDZBdC9OZFJXdEtmL2Rv?=
 =?utf-8?B?KzcyMUlkWHAvUkdzVkhlWmtBZlpZU3Ivd1Fwbko0QmExOXNRQ2ZSNDUwY1hl?=
 =?utf-8?B?dWV0ME85SjFVUmxUV05mWGZBaUZqckprTWsvS0U0SWlJd1d2UnJvTmJDaFV1?=
 =?utf-8?B?RWdmYVVUbUZkVjNBaEowZCtiRVRCYWxFVlNEN0I3akNPbk5jc050bDZ5c0I4?=
 =?utf-8?B?RktrY1EwN0F3dnltUVVZVSt0NFV1U1U1M3NnRFJydGpxU1N3ZnNMWkZ3Z0sw?=
 =?utf-8?B?T1FVWXkvV0MrQ2x5S2F6VHdueldHOWxmWExqaHgzWDVsdHJ0NFpuUDIwTGJs?=
 =?utf-8?B?YmRGUnRwOWFlS1E2V0kxN2wvQmpYdnFrRGZQNnZNeUx2eGpWMzBwdUthNWt0?=
 =?utf-8?B?TnM1Q216elpreGxZVUJaaG01emF5cHhHVGdXSVRkZlYyZ2IzTGpYa25JcVdT?=
 =?utf-8?B?VXhDckVJTEV5dVhUemdJVlk1SmFoMTRvRWZQNmJ3UmZjbFo2M00rbHkrVlZX?=
 =?utf-8?B?RGFDYjZGZHVMU25GbURtVnRpb0JZM0t1aFhLWFNOYXlaS1pkMW5pWkFtY3h2?=
 =?utf-8?B?Ulh2QnI4OGV1cHQ1N2xGM2gyOElKSDRNOThRYUs1cEVUd0dKUmNDaEZFVkc0?=
 =?utf-8?B?KzYwN3loaSszM01jS0lTUE5aODBWTmJ4d1ViM2NBY0N4b1R3MmxRc0FIZWZW?=
 =?utf-8?B?UFh0Z25ZTkZlTUhLSlpSSW1Eb0VFU1lMd3dGbzV2Ny9tNEdJSE9wV3oydlFH?=
 =?utf-8?B?WDA3b3E5VndDZTc5aGhPakgzNXI3TVRJM2syZXpuRWROOTFkbmNoRmNkY1A2?=
 =?utf-8?B?M3RBRkVscWY5NnJzbWs2eFpvcTZTdk9xRU1TTExuei9Td0tJc3FPQ29PN3dL?=
 =?utf-8?B?N3RRekJDUVdEYVdDRmlzUFNBdDBlelFMUkZ4WFVmTE5JRG1nR1VMR3VMR0pI?=
 =?utf-8?B?dXQrY0kvRjhUUUtMM1lSYWJOVGwvSVhsYVlhbzArSkRsN0pyVG90OEppaWtQ?=
 =?utf-8?B?eW5KMFIxUHV4WGhFL3RNV3hsRUhFU2NvUFlrRFpZYytTdU9MZEJDME5iZ2tx?=
 =?utf-8?Q?o78acUGqi+OdOIIYao4KiSjD8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a7caca-9399-4693-5a69-08dbed058118
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 15:53:30.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcH3nWiAxGqGN/Va+0rbcwM9FuyCEaRgH6FjQvmWXVp3Ygt/4knFeNlxFlTqHRij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7540
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
Cc: Karol Herbst <kherbst@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

some users ran into an OOM situation and discovered another problem in 
the error handling in TTMs page pool implementation.

@Karolina do you of hand know a way how we could exercise this in a TTM 
unit test? Basically we would need to redirect the alloc_pages_node() 
symbol to an unit test internal function and let it return an error (or 
something like that).

@Thomas you recently discovered and fixed bugs in that. I've just gone 
over the code once more, but can't find anything. Any idea what might be 
wrong?

Regards,
Christian.
