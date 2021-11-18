Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565784563D6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 21:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997E66E185;
	Thu, 18 Nov 2021 20:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A886E185
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 20:00:38 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIJZwhB009988; 
 Thu, 18 Nov 2021 20:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=43kPLq2WsO6rrbFasLQRCSQrxMAVUehjhnsIM/W4Bms=;
 b=onbqnC5JAhJRW76kfEXmNvuQ7wJIThl9TFdvsnP5MtqcOxMIHR+vLS4Rjp/HTKSjcvHP
 g+Wrk46CYSWaLWd5y063vzd5jCZ1uSbq/CJTtZbXcTnjFf0i4UFFRGqjgWJeYtwvt056
 npP8YdvJMA9VEZ87IWo7hvfr3NMP6XnGPNW3FEQ73VFBMWPa/31VpJ6jgcntl/aAq4vg
 3bgepMj6wNItcIrVS3Xhj3+xNuNtyrAchsO64NvQV0nQP2GEugd4buerAlh5F/396bYn
 nu0FPO5pA3mtQpwlq9UdV8CHnSGzbDNwBy4eiCfHErhJDMFLQswfkfIfbyOlC7ThPbhC PA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd382js40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 20:00:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIJukv6083179;
 Thu, 18 Nov 2021 20:00:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3020.oracle.com with ESMTP id 3ca56950nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 20:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPRQXvStAW/yvHiUT0P/ZbfUWXlKKlQ6Fi7ZvT2qIfFbNuuzOo7h3uqJP5ccekBu6fYh0zhmPi3td0fZTvZ4m6MCYb13AbXPXt+tGBrWuI8DSixXiBRTCqpc401ppwbAH5Wr01mi8QHgiOZJMDyaKDewUP5IqJ8/qeMYB6dx9I46FNLRmsAGfKV5jAJ2ktFMnXzMX39clJitR2Br83TG8hT/2jcVjm+4pTQokJru6WPlfzWF+KXVSVBZMIGEk06PUoAM/WvdjIqD+17rQzYfSoA9A/HCYod09LhyhufzBdSnBNXR+JJ/wxk3FciVh2lLIOvoIu778CTVNWhluiwQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43kPLq2WsO6rrbFasLQRCSQrxMAVUehjhnsIM/W4Bms=;
 b=dZg3Ea+/gK5v77hRPQK+jDQsavjP+xFIeFcYr5msSbfdkvXdkLfMn+c7VeJ1VqybkqhgwAkJTkruy+3RSdm7rMzpnvp+EckUSRFZBNWHr1EZ9VybgzPH3IyIzXFNVI39L5Ra0HBR6YKVmvk01D6HU+5qkRg23OIvuNGDoJ/1F4KoeqFnuh7X4NIsem8KO8g5gFP/6nsej3zujWsD8L30Kb4sEpaUKn0yySExnSaFe5Hk7jPF5MmK4ofs077CVjjyBW7q53JN5a+v9H0gXRO9eia9kJ3bUZK+nHM9zHiMXrHd/hZr2KjlWwOPKahEgh75Z+TNowk4129e4xU25f2/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43kPLq2WsO6rrbFasLQRCSQrxMAVUehjhnsIM/W4Bms=;
 b=F9HjBmt3MFXBpectHvMoluzN7Uv1pImffhbcv3xrebNcNZT+bVXYT10EswEGO3kKxx4g6AOPwtbD75eIygS3pm4ap877DbV0jSqLhf9gNTaPpEhQRFT/x4j9ZwoNmu3Ml2raAOuAMc4dIskaFBSBorUcWWF4ZtFH/d0iPaJoXfs=
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN8PR10MB3730.namprd10.prod.outlook.com (2603:10b6:408:b6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 18 Nov
 2021 20:00:20 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%4]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 20:00:20 +0000
Message-ID: <4cfb985e-72da-173c-4818-c9c4af7d83a6@oracle.com>
Date: Thu, 18 Nov 2021 15:00:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Content-Language: en-CA
To: Brian Starkey <brian.starkey@arm.com>
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com>
 <26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com>
 <20211029141400.vcswmabtk5i3cvv7@000377403353>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20211029141400.vcswmabtk5i3cvv7@000377403353>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:806:27::19) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.202.166] (138.3.201.38) by
 SA9PR13CA0134.namprd13.prod.outlook.com (2603:10b6:806:27::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.18 via Frontend Transport; Thu, 18 Nov 2021 20:00:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfde0da6-7156-413d-e4f9-08d9aace0c2d
X-MS-TrafficTypeDiagnostic: BN8PR10MB3730:
X-Microsoft-Antispam-PRVS: <BN8PR10MB3730A5F1CFB0B9D0B31E54EDE69B9@BN8PR10MB3730.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kOtAWVVYB4pOkf2Jc78yYn9NGFDNxPiZIWN+DD/CLJEGbIde78ppAIcIEXXyIhxQ3Vi/FNaGr1VoYllL8tkPWmT1lOXW62XZp5sOrFpNajdv66xWruu/Z0Z3suX3pW6X3uMBYPkKylPfAoKF0Sh4yOGC0jgo1eqAJJCpbzapk0FLbJPa85BW9Udz8wjmodzBPQ/3EGmKnqASI4hW15+H0E84qQcPgKnbjMd1UaE1CVdcwKKzU18akcUxLMEpKgvAqJL4mOQhC942LRmQ8Xv/uccAfagw8tAkI08u61RMi6lUw2X4Frt1ZMg1aZcHRf+UhrIZVRQkg5nMhl1ySLhvbeYImXDAUu1POI2mX0GqHNP38jylIEMFJ8fBDAZtsh0KEshQc7cgJi12QCvd4gRtFzROnDdjhX4PZd3XxxWGNXcL0NtOC0BySE/J7BzaV+EXDYD+JRQ0SYVlzTpcmUJ11aXfsIZ2A/P6QmTilelR1bZ2yzkOmwkiIllGJG/dg+t5TLzn5GMXtj6j1YDBRb2JKdTTBgTXHniiTlTjRm2JiGiyM+Ts3Aafv+r0cK6dfDm1HAFyEL65DxIiuhXuGIv0j1gnvKZN4ied+B8BE9S24XoOzmRW/yfTe1OQ7RgZkFKmvgjPDtQc9zOLE2HUokOIhalXgP3z4/dp74xIvgEVu/6VT69VP7CuTbyI12UmnpnsQuBF495EZo4fhbOE+RjvjnCM8hH+4hLNwMBac4vNcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4744005)(31696002)(6916009)(83380400001)(508600001)(38100700002)(7416002)(5660300002)(53546011)(36916002)(26005)(8936002)(36756003)(86362001)(31686004)(6486002)(6666004)(2906002)(8676002)(44832011)(66556008)(4326008)(186003)(16576012)(66476007)(956004)(2616005)(316002)(54906003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURyVmp3V3ZVd0JYWU00WjVRNWhKQ1AyZmc5UW9nc1NxeFlFbHliV0RoeE1z?=
 =?utf-8?B?eHhhemkyMGNGaXlPU1MzUGZNT0JwQXppemhaQ1ptYnVsRGU0OURYWUpuNWMz?=
 =?utf-8?B?M3ROVjBiakVwOVRSVFNaTU03K1lwRnViOFJlWkVTeHpJWjEyZmRSZ1ROZmlC?=
 =?utf-8?B?Q1d6MVp5czNJZGhzWm5Jc0UwbFp1ZmxNNzZYVW54ZXQ2V0FZR2FSS3ZGM2k4?=
 =?utf-8?B?a2IxZlIwQXZxQXV5ekw0Z2JPaThUUGpJTlFGc2hGblMrSDBmd0NYWURjS1Jy?=
 =?utf-8?B?RkM5S3o2YzJxSStFaURyeWNuZzNnMFMvRUJBWVk5dzJDMzkrMWt1OCt5RXV0?=
 =?utf-8?B?OXlOZFB0cEVjTDB3dFVZRzZBTVlXMEljUURTSGh3OXdCenh4WWkxUGpoMzdY?=
 =?utf-8?B?MjdLVGM0Zkd3dFVVNlZFdHN2bC9JeEZ4S1dBb0dvVmUrL1d6U3hZd3IraG14?=
 =?utf-8?B?VnNMNFhnWk1wM0F6MlBSY2I0Sm9ocHJhVmZTQ3RTbkVxd3dQTno5ZENDT1Bk?=
 =?utf-8?B?LzlZZ21lclZ6SmQrUG5ydWY3NDhvT0tZZVZaU0wvc3FZK1N0WmFnYTRjS0lP?=
 =?utf-8?B?MitLZEkvWFoxRDFma2pVUW8zY1krNXZSbGNWVUZaZlQzaWF1OENtQ05wU1M2?=
 =?utf-8?B?Z0NsbnY5cmJGMURodlN4UEVkMlhEVUt1TnkrT1RlTExxWWEveVRCYUFUZU9R?=
 =?utf-8?B?UjA1cTEyaFg4WVlTbi9XV3czV3NVMHR0MGJhQ3EzeVp2ZEU5UWhtNzNyL1hV?=
 =?utf-8?B?Z0syMkVXamJ5bjErQ3hCSGVFREgzbDdCeUZrRWZEajAwdm56aHd3UzVKTXow?=
 =?utf-8?B?SkZpWHRIcUFJUWJtS2YxMW0wSldQVisyTk5jOGd1cnpxT2tGbmh3WGRlZzE5?=
 =?utf-8?B?eWZ4TEtDM1lYdVpTdk9hKzVHcjRNU0lXbkVuZyswVStUTHA4cmJsdnBEZEpu?=
 =?utf-8?B?a3pZOVh2LzdMbzdQelRiMnBYTmNiU2hiaUYvVHorV2ZjdkN6MHphTGhPQ2FI?=
 =?utf-8?B?SG10MnY0YVhWT280UGZlNTJCL1NlaVloZnIzNFJGTEdFaDFVbUZUcmpodUV2?=
 =?utf-8?B?QzR0WWhPRVRJZ1dybzR3NE1lQ0lrVDBJbzdpZ0taZUVuSEF2TERONksySUxO?=
 =?utf-8?B?OFdTaWxoRDNUb1JoRHJyUlF6T1FoS1kwOHN6SHVZSjlhMWlYK1dhK1prc2R2?=
 =?utf-8?B?ZmJBRU44cGRoQUxJY0tiamNmSVhzeHYxQndVYktkZ2xmTTgzRGlPQTNoNjBj?=
 =?utf-8?B?aFJaQ1pSTkhhZFBtQ0QvS0FnTkN2ZE95cWhzeTNEM0dRQTBZSytTOUM5RWNw?=
 =?utf-8?B?ek5nMUlsV05DMDhhL3RKemVhT3JsNEhmTEx0U00va0xyOFkyM0IrVXhrZ2FR?=
 =?utf-8?B?OUhwUzNLZTJDMWZMY3lOZDhxZUU5Z2l0NjhnSEtTWnk4TDhCWGZ3aDUwWFo5?=
 =?utf-8?B?NW90QVM0THorSkkxd3dETHlVSVU1LzAraHhvZFJWUkJ6L3YzN1czUnR3NldI?=
 =?utf-8?B?MHYzUU04M3NLWTJzV1g3ZjlmZ1JMMUFuRVhCTDBGZWRCbDNNYTZlWU8xWVc4?=
 =?utf-8?B?MDdCN1dGMW9ZNnZaQ3RnNUFXTkpmbTB2a0ZKY0RhNzlXUEZHVGsyT2NiZTQ3?=
 =?utf-8?B?Tk11cjVKalY2T1ZaTWFXbERDa3c2eXdzZy9uK05OdnFuZ3Q3L1BuRVdlTlQ5?=
 =?utf-8?B?OWRBSzgrVllKMWFrZTdXa2xNcGwzTVdTTE5QVDNLYWZXemlNWGVzQlFmZ3dH?=
 =?utf-8?B?YTFRU1h0NFBGZlFBc3pCR1g5ZHFoSEhDbVdtalYvK0hmb0pQbU4wSU1WdU8x?=
 =?utf-8?B?NGthN0FXR2NhbzBJTjNscVFzdDkyUmpycExJajMyekhyeEt4ZmRzNFpGU3FL?=
 =?utf-8?B?RU9seXlWbnB2QmlJWnNQdFpSbExvNTU0WHN1QjZpVnQyT2xoYmVJNlk5QW9s?=
 =?utf-8?B?NnlaUGRnSXlLMURUVFJxeDhWMCt6ZlA5NmFDZHY3NVVFVU9VR2JPcFNtMHNa?=
 =?utf-8?B?aHFrSnFMNkN4NVgvWVJWWVZlbDAwcEtKTUFFY2JwTVhqYzBLaHE4bkxqNVFy?=
 =?utf-8?B?V2pFbDZ3dkpDL3BSQVhnVjgxSFVUaFM0dGt2bi9yUjRqdFlGNGVWdmhGZEd4?=
 =?utf-8?B?VGc1VVpQVGtCMThFazJUQXNxUE91cU0za1Y2UDNVOFloOXF2RWc4RU9yTi9N?=
 =?utf-8?B?UEpJbDRpdkJqY2VVeW5hODRXSm5NVnVkdENrZ3E1WFdmVWVkNldyaEJvWW9Y?=
 =?utf-8?B?OU43eVBwalhOU0orNDZlZlBlZ0ZRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde0da6-7156-413d-e4f9-08d9aace0c2d
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 20:00:20.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4bZAbZCNCVPP84qku4/rCppeikFwKZguJgK/8ve/yie188va/F8m+efDgPvoeJG9BIJK34kppsJ/DDjpy9PdxR+NY+v1Ua2P16redDYqnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3730
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10172
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180105
X-Proofpoint-ORIG-GUID: NRIPdmyBnD0I2m7saiq6C9npqKXGfkhx
X-Proofpoint-GUID: NRIPdmyBnD0I2m7saiq6C9npqKXGfkhx
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
Cc: nd@arm.com, ben.davis@arm.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Liviu.Dudau@arm.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2021 10:14 AM, Brian Starkey wrote:
> Hi,
>
> On Fri, Oct 29, 2021 at 09:15:28AM -0400, George Kennedy wrote:
>> Asking if you have any input on how to deal with hsub and vsub = zero?
> That's just a straight mistake on those formats - they should
> be 1. My bad for not spotting it in review.
>
> On the one hand, having formats in this table is a nice
> machine-readable way to describe them. On the other, as drm_fourcc is
> being used as the canonical repository for formats, including ones
> not used in DRM, we can end up with situations like this.
> (R10/R12 being another example of formats not used in DRM:
> 20211027233140.12268-1-laurent.pinchart@ideasonboard.com)

Wondering if there is an alternate fix to the one proposed?

Thank you,
George
>
> Thanks,
> -Brian

