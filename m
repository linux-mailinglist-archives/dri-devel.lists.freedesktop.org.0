Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801A4AEB13
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1217510E1D2;
	Wed,  9 Feb 2022 07:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CB410E1D2;
 Wed,  9 Feb 2022 07:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO5bIX+hBXh7lJH9QKHQ9AKu4igRTp1XNXaUjzlmuiN0UNqPFKlYwuckMadT/PwPkkCy8+1EQXXCAvYKt4rMLZPhCYfc83FaJz2LxjacNM1pKxIsz68hjPzKKD6N4hamjv1PdpQU1Zhx0Df8EsEreg31LDrdRFAUpcNK86skHZlIepClAIzi7PE10lq8J1HELF0fxbTciqgqJRWAtg8DQAahrWB5Sy9LrtNaS5RonIbyR/LpSxV9DuUqzLeq7XF1ijs0u8OS8YPvKyMBSKuquRtBFe+HcvYQ2IBp+wB1S4QbfSKknSZXNcMkrpiderVsIAV+siiBjvLaMHea+WYDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR0x8fEJEUICtqXrMnD92jrdkpdeWGNSzIA428L29Mc=;
 b=eA65ZzLHR3FtP2iRHlrGKiU9CQWOnFP2DY3ipXMTWd0VzEFZg/JbLbJxIskHdPwVG315XUPgKWe+E3ITZ7+gf+mGeVSFy5r4W/HeaeSfMr/j2xfHFT+5typn4KzHNYZ9bsDoQXTxhCOekTqs4+Lv3Q+GGsqywFjP+fAVA7aZ27eSG85FZ8296231R0Bw0r3TCAsMIMjNPDmdLfuItzUielEbcrB3CYlM/iRxnBY02C/xFGS0YuFbU5X+1Ueb7LM3igAurB3PZJeotXzDH2oHiAcO4le4rOYy/CCYtHh4An/z7y7o3wE4FepLYRMF4+xs/2kh9iqXE8SM42gGiOscXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR0x8fEJEUICtqXrMnD92jrdkpdeWGNSzIA428L29Mc=;
 b=fhvcvekQfND1JIJCAN0LFooYH1p2kpeZJYHBhj8pBoIAStD90bF9aULXj2Ui8KL+BMArgSIrskRe+cmRH4JQFtHhD2mRGJBY2erbJfCa6svTyo8JNEkzuFtzBu3d4TSgcgZqgANoq6ci4Yso4Dvcc2RUk8RwPgArakMypmS+zJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB2759.namprd12.prod.outlook.com (2603:10b6:a03:61::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 07:32:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 07:32:48 +0000
Message-ID: <4dfd15b6-e402-f15d-f793-6d31e591fb20@amd.com>
Date: Wed, 9 Feb 2022 08:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: pull in drm_buddy.c
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220208151228.344997-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220208151228.344997-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb4bba9-6cd0-4ccc-47bf-08d9eb9e5f18
X-MS-TrafficTypeDiagnostic: BYAPR12MB2759:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB275939E31CC5AB9B30AE0272832E9@BYAPR12MB2759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/8Is/xUh0wcoLafzCUTEGYrFuFegnJ3z4Nj9T4ldO6XUMrFro0ENvUukvkmbnqfep4mvA+n0Bbdbqk1RCyfp2sK+HoAOAZTKOzpYwBacU7XCHy/Jpt9/QZzwzOi4nTDe8gL1sNVDkkS1349YRbkZ4eos/kHhM5aXGox+q+FXN3Lk9+v4pie05/ShwjTZdEE7NmlknwDxKNpDi2DoZrSa3hldl8RnsE0cNH8vhI7iEkuGcYKfAdMVyJNucEJ7b70UmxmJ/2dHbW/s8B0wXWtt85xd+rUXfiSYcINx0VuvS1k0WU44v+Exopk1HvtBd/PdqPibsXB1gGvdPySlMF7dgD2FD7aQjEoPvik4Y6H49zl4XvLI/d+FcxGI06pZGfhxIH+OFgOTvxFSbecrgEsGSzzTcx7kGszOCHGdkDvJ0o6nSjg6QHnGTpy7DU9q9oH30u8vu3CbXTvCkN6tc+nUBoaoZ84HjRe6FWE9St2ezCnjW+sylnfC8dSIjR/ydNQUW4r1o1OolUqu0gKMLC1pO3Cjt6EmSV7kIIbk5lhoFEpFVr7nFXF3lRP9zOsSognFFuiOeBgqX09Og+WPG6RQ+/jDGwA65MI37CsK8ycnSS7auBPZ30Dqx3gciHue/7GRTxP0Iy0KIjpi8oIQ6yTbPWgPskt3xNQt+76U/85prEDGQTtIBpY0bNaT/GGBcmPdPuJJL8Qp++TZKKD0Qe3jHV7vUEXUUthDfVMP1iL708=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(2906002)(508600001)(31686004)(6486002)(36756003)(54906003)(66556008)(5660300002)(31696002)(186003)(38100700002)(66476007)(8936002)(8676002)(4326008)(86362001)(6666004)(66946007)(6512007)(316002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pIQ0dHVWFXSWxZZTdNb3VqVTFnanhoWDlNQjFCYi9zcXZENGdYOUdIaCtn?=
 =?utf-8?B?UGQ5dnhxZTVsVWFVeDgzZjk2NFR4M0VrT0FESUJ6Z01wZms1WHBwbkZsU3Zm?=
 =?utf-8?B?aVZ6K0VpdnBWQ3EwbU82ZGhhSEpCeURaV2JjUlVyck5ZMjR1bFlXK1NYOWYr?=
 =?utf-8?B?bEVSWUpSOTFUSUw0YjlLZnFhTmhxU1RXWjRwckVxamZBWmN3ZDNXSGZzajdx?=
 =?utf-8?B?SkhKRmVka0tYWm43bXk3bjdIbkV3NXdwS3VYRHRFQlBrTTBZOVp4ekhycU44?=
 =?utf-8?B?dUJ0QnpraHhGOWRHQWxuQzhNWlcxb1VNbFFSZzlpQ0Y5UTA0QnRiUC9QbnB3?=
 =?utf-8?B?WkQwWEF2RVJVdTVZVVVmcGRZdW9LMUVrVnZ0b3ZNUnVjSXgwUVNvU2JvZkMr?=
 =?utf-8?B?MHBvTzFwcXFTbExFR0NFblNHVWU3VktsK0U1V2NOd3ZMK0dxOUtHVVJjRHcy?=
 =?utf-8?B?dWVscmpWWWU4OEtBN0hQQU9Kd1F2dFQwYkRyRzBCWUdnRUxOTHgwM09Mekpo?=
 =?utf-8?B?ZHhMR3c3czB6SGN0L2dmSnN5NjlodklmdHpudWdBVk15TCtabVVQWEp6ellq?=
 =?utf-8?B?QWtpa2xvVWxJK0pIVlFmQlJxb2M2T0lwRC93L1JWRTQrS3dHRU90Q0crcUEy?=
 =?utf-8?B?YWUvK3dPQzZYb3daalBicG15UEV6TDI4SlhQY0w5RWYvZFRpazdOUHZlVSt1?=
 =?utf-8?B?YnkxNFdqYzR4UHdNZFJKMDk1T0JUYTcwNDVvS082Q3B4Z1haUyt0SzhmeFov?=
 =?utf-8?B?dytFamt5dTBXQjNoZXFhcTRsRzZTZUtnZHB6M3AyOFNYVVpNWnZLMG02UUZC?=
 =?utf-8?B?VDlBcmM1cm1zcEZjQWplcm9ORkN6ZXFoSTFsR3YvV1dnZ2diUm5GaHBNZkhQ?=
 =?utf-8?B?YnlNS1NuTXl2ZERkVmI3Qml2RXpMZ0VPNTE1MXpycisxNGxnaU9QSzFrR0NM?=
 =?utf-8?B?eVRiaHZISm9jcEVEMFVpYlhGNjNjRDBzYXUrRkNaZk5SS3J5dEVoQ2dJaE9U?=
 =?utf-8?B?RzRQMXM2UHBsaHcvMDdZS2MzKzBic0tGNnlRTm8wcU1uTlVLWlVEN2hNeVZD?=
 =?utf-8?B?Nlc5T0h3VTNaZys0WUFuRDV0MzhKK0VlS0tSNUxUa2szSU5vc2VjbXQ1R0s5?=
 =?utf-8?B?OVoxTDBheVk4TnhlR3pZS3VTbWltdUwwSnR4ZE1VQTArenVpc0xXSXVuL2Ri?=
 =?utf-8?B?dFJJcDd6aVJFMjNzbFhRNXo5bVEzdUVPazFnQ093SUtITXBpdXhLNUd0UUhr?=
 =?utf-8?B?bFdyRFFNRVZFSmkzaW9Za2RSUFJTTlRlTkxmeUdOSmwzaVI0dDN6blFYbmhH?=
 =?utf-8?B?UTZyZHBab1lhQWdZY3NZUTIwUEM0THFXd2MvblczYXlwNy9JTFpEZFlmMmJl?=
 =?utf-8?B?K01iOVhaa3FEaHBYdVdWWGlHUkk5RDdEb2lHMGVXbm1IL2VnUnZieVp2Z09F?=
 =?utf-8?B?TnplS3ZTejAwRTBiSUtDdFZSNnJ4M3IvcUJnZWFzbTNlbEhCRStMSTRBaWlw?=
 =?utf-8?B?UVIxcGduek9zUGdLcnBoQ1FrUWZDUHorVnc5R0hobW5Ub3c1NXNtS0NtQzZK?=
 =?utf-8?B?RUNtM0JvTFVDaThJbFI1SFBnUVFNaWFLTmFYMk44bTlJc2FOa2pYREVzMi9D?=
 =?utf-8?B?amNyODErSEZQdWtOaTdMTFdyRzR1a3RZc2ZSNWE3V1hSQnJWZVZSY3Mya2ZD?=
 =?utf-8?B?MkFxUjRXMHpyaXZyYStFamQ3bXE2NUFZcjJldEw2RkJxajkwOFBQYWJsenp0?=
 =?utf-8?B?ZWlYL1Qwb1RaV2NaRm9EUTJzV2Q3OHJtZ2tRQlpVVUdYNkkxU1VWdS9iZVhx?=
 =?utf-8?B?b0RUdWNrdHBlbER5QXNlblh3UGl3MFpPSFdaQmZzaU5hKzRuazA0WFAzNTBy?=
 =?utf-8?B?NlpVaGJHSHV1cWI5TlFVb1FhVUVkNTdiVEV5Vk9JQi9VQ3ZuejNQQzhwclVj?=
 =?utf-8?B?WUpveXZwMyttcGdHaUtzSkdxWFJHMGdvQk5NWDJ4MzNNV2RKWTAzN2ExcndC?=
 =?utf-8?B?TjlOajVPem8rYkRkOXBxdWZDWFhQUlBuNDJVUSt2MWVCaFFYZkVDb1p3bThm?=
 =?utf-8?B?RlVhMmxVUWZ0S0JlT2dmTTR6bnZLSmNTeDZYbkRMZWpYNG1JbkxMY3RXeklK?=
 =?utf-8?B?YzRhVUNBVGlreU5oYS8wT3d2T1BuQjZ6OURFdTR2YlQ0S2ovRTVOVS84RklU?=
 =?utf-8?Q?hcQqzDDAAkKN90KSsjQP0rQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb4bba9-6cd0-4ccc-47bf-08d9eb9e5f18
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 07:32:48.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lFkQqkMvleDT6gmiLJfjK8Y3XCZmFtelElKkIMDTZ6H74P/aGn02H/+JZ4FYtGM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2759
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.02.22 um 16:12 schrieb Matthew Auld:
> Make sure we pull in the kernel-doc for this.
>
> Reported-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   Documentation/gpu/drm-mm.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 198bcc1affa1..f32ccce5722d 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,6 +466,15 @@ DRM MM Range Allocator Function References
>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>      :export:
>   
> +DRM Buddy Allocator
> +===================
> +
> +DRM Buddy Function References
> +-----------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
> +   :export:
> +
>   DRM Cache Handling and Fast WC memcpy()
>   =======================================
>   

