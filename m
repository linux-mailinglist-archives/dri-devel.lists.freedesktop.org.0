Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029F7E5934
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5E10E75A;
	Wed,  8 Nov 2023 14:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F9110E75A;
 Wed,  8 Nov 2023 14:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6CXdreCULGK24stHa0wL9QRPvYGH0gww0vb2f2g90HsHdIxKM1TOyZB7bPJe5F2eVPYC0QPp/EZFewuzIW0G1eDayJY8OcdDcLa4NFEKSCMEYWFLdjjB3CHv31FiEeoD+8/j6z5lzSXC9h4OpJT+JyT0UQR6PVS+WoFuUfh4ezPycoQA2wcvRQ/WkFeDyQc05tWY0RVCO46iDadfQSn37DvI0KOZeje6G7NBUZz5wrHeDE8Gw7AxgygN/TWFfrX11H5Vb/TvKbxip0Wj4VmsFAHyGOEC9TX94iMOQLLEKS1kXwcfWXGz0Y/CSPXKH6iw+VLka2s9qMEnLnLxtAP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdgzDoCDd7ZpOmhPECBLoLnJTnrVEGHb/+Ahp/fBA5A=;
 b=Cqp+ZFyDuXn55Y2MMSge7+foH14kNJtqcwcHKXxGDGCdE5cEUgGcjUIddOW1FvHusH96LMJVWX9ryNitKn/PGOX0L2mdDowVo5JAzSwkHAhMVYQd+vqwO1ssGlLZ/eqdazSEP2cuvYVHMMSougTT6V6V/nRZncymrBxW+86fH/FuovsD5IysEZCLfPZWjiHFm4G5FlRZajolEJHSvu+LkiZ3lyCNFr4KDF3Ad//Rpp1AYBlDdKL+EovwGGwJJ0Ba2mrfeC0ONWv5iYzpUgMQDmC9Uac3qxHHTYhykh+G/YIRkJ7TH1/G8NUfb/MdsOpnU+PAd9Uz75rfYJs9Fmdl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdgzDoCDd7ZpOmhPECBLoLnJTnrVEGHb/+Ahp/fBA5A=;
 b=DSlQIOy9jLVrmmTFW+CY8kZk9pRsBhrUZyuqIInIDF1VEHFrVf9mbvOYmdSOc4zJt6D727KLYXqDLwKVAVm2f6D/1pNuDb87L7xB1cyi1l0JQlKpe8Xoc2YRueo0g95rVgWOwyDdF6jdM3VLIrqUdB8JIvWYgteQwI1QFq1BRKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB8646.namprd12.prod.outlook.com (2603:10b6:208:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 14:37:35 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:37:35 +0000
Message-ID: <df60f43b-c01c-4a18-a500-e1dbc0b2469f@amd.com>
Date: Wed, 8 Nov 2023 09:37:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <CY5PR11MB6344A6C878FBAF5E66EFCE1CF4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CY5PR11MB6344A6C878FBAF5E66EFCE1CF4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0203.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cd52c9-c8e2-428f-aee0-08dbe0683fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPl6vB3bOsh3sQKyXl9Vf9lMoBNG16e967VzxPngnWVKVZciF22r13Ua5wwx5z3ZANEwUNbdxGTZ7HILZ8QggO5P537mexzYIJ/SrPzmhX6sUgT9rTRN3tqPjXsrqAdhdQ+rwWjAp4PGNNL7upLa496V+dqXchr8Up70Q63xCRxF6IMVGxEMJ0QRgDrmPZxPsvhw6vZBwnVBBRIr4y7Wt6IPiCjV33mzcfPX9wJhtadrnAADN48R349Xt7c/r5pLE6B++DhPM9OYN/Fa2WY8/0EmGbkdLecnMEj1h/lNXvvVaHlnhMvscGYc1rva8h32YlPsf6a6zxg+0j2bogloYMW5IHrNzgcJM121ES6mKam/fXqOTXbHCU564vPmDlcP8Kz5yVqmnnpxali3+aA9j4ZAGsF0zrHXdrzAeMiR/C5OnpTcQbQb2KHhTp+tPktoyyKf8FCnBCA0wUo2sLxeUE4zRLlCz2XOaRVJL4sB2Cah7VgkUoCfBL7tEmZ+OSCvxA4onRteowd6+Ej+XCH+oHmXfdRJlpYWmlGuGuaT+xA2URRV/oB2SDn4izmxagHyEN6jv37Hp5LJLakbFDXjbX8jzBjaK+f/tFurK6QCXHISVh0Z3g0pCwaZFxCZwqayBd5h5Q1xivQdhOgaAsbvH2vxHTnx995RR8JcsiLPcfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(54906003)(2616005)(110136005)(26005)(66946007)(83380400001)(66574015)(6506007)(478600001)(6666004)(966005)(66556008)(6486002)(53546011)(6512007)(2906002)(41300700001)(8936002)(36756003)(8676002)(4326008)(5660300002)(38100700002)(31696002)(30864003)(66899024)(86362001)(44832011)(7416002)(316002)(31686004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUVHZU5WakFZOVdRNjhMYytneFZ5ZXFZVkdqQk9ubk1hUlpyWEsxSmoxVkIr?=
 =?utf-8?B?NVNCSDhFNEE3emdIUGRBVzJzait6Slg5aEM1Vkk0RVIwenhmcWEzLzZMRGtY?=
 =?utf-8?B?eDBoUm1RV2JGVThFZ1oxWUh4clFqUi9UeFUzV1VpRlpDMnFxaWN0YjNxcXdq?=
 =?utf-8?B?OS95ZFpKQk1TUFlHcnAvWUtaUlQ1V2p6ZFVpMWRhMGV4NEJrS2lKWDVETlYx?=
 =?utf-8?B?Q01seTBQdUQwOGpQaUFCMHR2RFdSUkpQY0NaeFMwc1UvTUNrbTJ4QWtEVS9N?=
 =?utf-8?B?TEs1SUZLc3VQb1owVWVITHdpbDU2QVVkQzdmRldWYlVPS2doMlA0VzNmQkVC?=
 =?utf-8?B?SDc5cGlQTTRMMWU2bVVnWmlIMDJtSWYrdlI2TVNDVlB6bUdjV2JHckQrZFhj?=
 =?utf-8?B?MUtvZkloTUxKYTR0cHdVSU9mT0FsS2VBZS9OaUM2b2oveXNodDVyM1Y4WlE3?=
 =?utf-8?B?WDNZbGFQdGhCS1FPcHB4WlhVYU5jZ2xCb1ppSktuSjZWYnZxZHZudEFwemRh?=
 =?utf-8?B?bzR2VU0wSmNwVFJrMmtFV2x5K3VtVHNUc1Z5cm1SV3lXWVhOYzZxTWlhc2FZ?=
 =?utf-8?B?UnZHSWRTblhzWStjNnM0OHE0dXphSEY2TmVGRTZNNXhQY25YQXB2UFBvVEhw?=
 =?utf-8?B?MEYvbzZITVNrRGdFN3I3TW4vcU04S296dHJUUVRXa0YrU3pucFZSYjJPSnVn?=
 =?utf-8?B?Q3QvaDFlNjJEaVFlckhwdU9OdkFpRDdyMVhwRzg4alo3YjltZU9uc2hXZnVq?=
 =?utf-8?B?TGhpU0JjS0txQjdSdVJMQTBWRTNZcm1ONjFGNlJEOXBxdGRVclJuNzRldi9D?=
 =?utf-8?B?Y2w3dFNHNEl3VTN4N1dhSnR1aXAyS2g3WWlWN05yQm93YlFjTTRFTTZWeEpY?=
 =?utf-8?B?RkV1UjJEMk9teWJScjZSbEVrNEY1SlBkR1lzVnBHMG96c2F3STB3c2h4NDhR?=
 =?utf-8?B?RFo4ZUgvVCtialU2Um05UEVlK01GRGdpUTRTU3c3VVEzUy9saWluVWVOalhl?=
 =?utf-8?B?dFpWZjRsTTNCZVp2R3VyajFHSEcrUVlGTVk3MGNTb1ZpUzM4Yit5eUJlYkt2?=
 =?utf-8?B?d1lWKzBtVnZiNlQ3T05iekQ0WmJzWlkxT0lVVlBZNkJmV1g1KzdTRm01SW9q?=
 =?utf-8?B?TTVTMURiYUF2NEUyWHpUK2JjQmxmTlZ1dU5xdjRjL0JQdFNHcEtPSUR6aGFE?=
 =?utf-8?B?NzZRNGpISVJDNklLMjN0V0pZbUE0NHlPcWdrNGpiaWQvbGNJbE5SekxLWnMw?=
 =?utf-8?B?U1ZZcVlRSGtuM3hrVmRjemkvMXR1d0VIRk1TRTRjcFlrVXJ2S0J0R2VkVW5n?=
 =?utf-8?B?d2h5WVZ6bTIyVkI4LzdmRDU4OXpQYm5LaENvOGFzMzF0eXhKazZJbzlFTHp5?=
 =?utf-8?B?a3ZIV3BJQ3BoUnlVdU1ncmdaR3FTUjRhT1JpSzhMSEZLS2VHa3psbzJBaGh1?=
 =?utf-8?B?dXFZVlRJb00xWnB2ZEJQWEpINUxkNTljY2UzQWNQRmpjL1MvUkF2ZWlRcnJJ?=
 =?utf-8?B?Q2NDdkw5amZjaUhiSWtRMFcycWZKWGhmZ0txTUZDeXNqQmw5L3F5aHVCeTVO?=
 =?utf-8?B?QUtDRUFiSTRQeVpJQ216TVdPbDV1OWNaZmJZMkE3S1RjYVlnZ0RDNis1d1R1?=
 =?utf-8?B?eTFXb1hUM3RmbWhmd1FNY3J0aG0zWTMvb1pXb01nVVVab0hKQThuL3kyLytt?=
 =?utf-8?B?eG9NN2k3SWFTMHpnc0VWUmJINXd6WVlVVDhiMjRqYW5HVGJNNXFnbVZBaHpM?=
 =?utf-8?B?TllMS3Q1YXVxSVNOQm15bkFUK0dXcytKUUp0ak0zVXpSa0szMXZJR295STdq?=
 =?utf-8?B?VVB1aUtYS1BmbzVtZGk2MTU2ME5IQlRhNXhFek5oQWEwTVd3M3crMERpU0tX?=
 =?utf-8?B?Mzh4eTNBRDBTeXR0dTBlWFppZTFTWnczUHM4TjVFcjBsM3Q4UWRUYzU4RDVY?=
 =?utf-8?B?d3ZuWFh4RVFoNWw3Tkh0TGNMYnFjTkFIWVV5elM5QWUzY3kvNXFiNE5XbGg4?=
 =?utf-8?B?cUdOaVRlNk1BQVM3OFQvbS9DMFJnTE85RTlZdFNXU0lDUDRKMC9XVTVZeXhX?=
 =?utf-8?B?TWhJOFhxY2p6UHlXTmRVZjlzR0M5TVRKWkZuNjltdDg0YmFVRnNwK2I4WVZv?=
 =?utf-8?Q?ytCnjwYNqpoQvbiVHhLTM2CgF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cd52c9-c8e2-428f-aee0-08dbe0683fea
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 14:37:35.7639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcFlEdeJkVxAzpN3KiNPXnqoAs2R5/ndmBZqonIes9zeYkRtyb4y0L17U1SZIZ2ziT4XPdarhVJ7oaWveZ34tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8646
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher Braga <quic_cbraga@quicinc.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-08 07:18, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Friday, October 20, 2023 2:51 AM
>> To: dri-devel@lists.freedesktop.org
>> Cc: wayland-devel@lists.freedesktop.org; Harry Wentland
>> <harry.wentland@amd.com>; Ville Syrjala <ville.syrjala@linux.intel.com>; Pekka
>> Paalanen <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr>;
>> Melissa Wen <mwen@igalia.com>; Jonas Ådahl <jadahl@redhat.com>; Sebastian
>> Wick <sebastian.wick@redhat.com>; Shashank Sharma
>> <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>; Joshua
>> Ashton <joshua@froggi.es>; Michel Dänzer <mdaenzer@redhat.com>; Aleix Pol
>> <aleixpol@kde.org>; Xaver Hugl <xaver.hugl@gmail.com>; Victoria Brekenfeld
>> <victoria@system76.com>; Sima <daniel@ffwll.ch>; Shankar, Uma
>> <uma.shankar@intel.com>; Naseer Ahmed <quic_naseer@quicinc.com>;
>> Christopher Braga <quic_cbraga@quicinc.com>; Abhinav Kumar
>> <quic_abhinavk@quicinc.com>; Arthur Grillo <arthurgrillo@riseup.net>; Hector
>> Martin <marcan@marcan.st>; Liviu Dudau <Liviu.Dudau@arm.com>; Sasha
>> McIntosh <sashamcintosh@google.com>
>> Subject: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
>> pipeline is needed
>>
>> v2:
>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>  - Updated wording (Pekka)
>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>    section (Pekka)
>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>>  - Add "Driver Implementer's Guide" section (Pekka)
>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> ---
>>  Documentation/gpu/rfc/color_pipeline.rst | 347 +++++++++++++++++++++++
>>  1 file changed, 347 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>
>> diff --git a/Documentation/gpu/rfc/color_pipeline.rst
>> b/Documentation/gpu/rfc/color_pipeline.rst
>> new file mode 100644
>> index 000000000000..af5f2ea29116
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/color_pipeline.rst
>> @@ -0,0 +1,347 @@
>> +========================
>> +Linux Color Pipeline API
>> +========================
>> +
>> +What problem are we solving?
>> +============================
>> +
>> +We would like to support pre-, and post-blending complex color
>> +transformations in display controller hardware in order to allow for
>> +HW-supported HDR use-cases, as well as to provide support to
>> +color-managed applications, such as video or image editors.
>> +
>> +It is possible to support an HDR output on HW supporting the Colorspace
>> +and HDR Metadata drm_connector properties, but that requires the
>> +compositor or application to render and compose the content into one
>> +final buffer intended for display. Doing so is costly.
>> +
>> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and
>> +other operations to support color transformations. These operations are
>> +often implemented in fixed-function HW and therefore much more power
>> +efficient than performing similar operations via shaders or CPU.
>> +
>> +We would like to make use of this HW functionality to support complex
>> +color transformations with no, or minimal CPU or shader load.
>> +
>> +
>> +How are other OSes solving this problem?
>> +========================================
>> +
>> +The most widely supported use-cases regard HDR content, whether video
>> +or gaming.
>> +
>> +Most OSes will specify the source content format (color gamut, encoding
>> +transfer function, and other metadata, such as max and average light levels) to a
>> driver.
>> +Drivers will then program their fixed-function HW accordingly to map
>> +from a source content buffer's space to a display's space.
>> +
>> +When fixed-function HW is not available the compositor will assemble a
>> +shader to ask the GPU to perform the transformation from the source
>> +content format to the display's format.
>> +
>> +A compositor's mapping function and a driver's mapping function are
>> +usually entirely separate concepts. On OSes where a HW vendor has no
>> +insight into closed-source compositor code such a vendor will tune
>> +their color management code to visually match the compositor's. On
>> +other OSes, where both mapping functions are open to an implementer they will
>> ensure both mappings match.
>> +
>> +This results in mapping algorithm lock-in, meaning that no-one alone
>> +can experiment with or introduce new mapping algorithms and achieve
>> +consistent results regardless of which implementation path is taken.
>> +
>> +Why is Linux different?
>> +=======================
>> +
>> +Unlike other OSes, where there is one compositor for one or more
>> +drivers, on Linux we have a many-to-many relationship. Many compositors;
>> many drivers.
>> +In addition each compositor vendor or community has their own view of
>> +how color management should be done. This is what makes Linux so beautiful.
>> +
>> +This means that a HW vendor can now no longer tune their driver to one
>> +compositor, as tuning it to one could make it look fairly different
>> +from another compositor's color mapping.
>> +
>> +We need a better solution.
>> +
>> +
>> +Descriptive API
>> +===============
>> +
>> +An API that describes the source and destination colorspaces is a
>> +descriptive API. It describes the input and output color spaces but
>> +does not describe how precisely they should be mapped. Such a mapping
>> +includes many minute design decision that can greatly affect the look of the final
>> result.
>> +
>> +It is not feasible to describe such mapping with enough detail to
>> +ensure the same result from each implementation. In fact, these
>> +mappings are a very active research area.
>> +
>> +
>> +Prescriptive API
>> +================
>> +
>> +A prescriptive API describes not the source and destination
>> +colorspaces. It instead prescribes a recipe for how to manipulate pixel
>> +values to arrive at the desired outcome.
>> +
>> +This recipe is generally an ordered list of straight-forward
>> +operations, with clear mathematical definitions, such as 1D LUTs, 3D
>> +LUTs, matrices, or other operations that can be described in a precise manner.
>> +
>> +
>> +The Color Pipeline API
>> +======================
>> +
>> +HW color management pipelines can significantly differ between HW
>> +vendors in terms of availability, ordering, and capabilities of HW
>> +blocks. This makes a common definition of color management blocks and
>> +their ordering nigh impossible. Instead we are defining an API that
>> +allows user space to discover the HW capabilities in a generic manner,
>> +agnostic of specific drivers and hardware.
>> +
>> +
>> +drm_colorop Object & IOCTLs
>> +===========================
>> +
>> +To support the definition of color pipelines we define the DRM core
>> +object type drm_colorop. Individual drm_colorop objects will be chained
>> +via the NEXT property of a drm_colorop to constitute a color pipeline.
>> +Each drm_colorop object is unique, i.e., even if multiple color
>> +pipelines have the same operation they won't share the same drm_colorop
>> +object to describe that operation.
>> +
>> +Note that drivers are not expected to map drm_colorop objects
>> +statically to specific HW blocks. The mapping of drm_colorop objects is
>> +entirely a driver-internal detail and can be as dynamic or static as a
>> +driver needs it to be. See more in the Driver Implementation Guide section
>> below.
>> +
>> +Just like other DRM objects the drm_colorop objects are discovered via
>> +IOCTLs:
>> +
>> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve
>> the
>> +number of all drm_colorop objects.
>> +
>> +DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
>> +It includes the ID for the colorop object, as well as the plane_id of
>> +the associated plane. All other values should be registered as
>> +properties.
>> +
>> +Each drm_colorop has three core properties:
>> +
>> +TYPE: The type of transformation, such as
>> +* enumerated curve
>> +* custom (uniform) 1D LUT
>> +* 3x3 matrix
>> +* 3x4 matrix
>> +* 3D LUT
>> +* etc.
>> +
>> +Depending on the type of transformation other properties will describe
>> +more details.
>> +
>> +BYPASS: A boolean property that can be used to easily put a block into
>> +bypass mode. While setting other properties might fail atomic check,
>> +setting the BYPASS property to true should never fail. The BYPASS
>> +property is not mandatory for a colorop, as long as the entire pipeline
>> +can get bypassed by setting the COLOR_PIPELINE on a plane to '0'.
>> +
>> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
>> +drm_colorop is the last in the chain.
>> +
>> +An example of a drm_colorop object might look like one of these::
>> +
>> +    /* 1D enumerated curve */
>> +    Color operation 42
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4
>> matrix, 3D LUT, etc.} = 1D enumerated curve
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ
>> inverse EOTF, …}
> 
> Having the fixed function enum for some targeted input/output may not be scalable
> for all usecases. There are multiple colorspaces and transfer functions possible,
> so it will not be possible to cover all these by any enum definitions. Also, this will
> depend on the capabilities of respective hardware from various vendors.
> 

Agreed, and this is only an example of one TYPE of colorop, the "1D enumerated
curve". There is a place for a "1D LUT", that's a traditional 1D LUT, or even
a "PWL" type, if someone wants to define that.

The beauty with the DRM object and properties approach is that this is extensible
without breaking existing implementations in the kernel or userspace.

>> +    └─ "NEXT": immutable color operation ID = 43	
>> +
>> +    /* custom 4k entry 1D LUT */
>> +    Color operation 52
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4
>> matrix, 3D LUT, etc.} = 1D LUT
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> 
> For the size and capability of individual LUT block, it would be good to add this
> as a blob as defined in the blob approach we were planning earlier. So just taking
> that part of the series to have this capability detection generic. Refer below:
> https://patchwork.freedesktop.org/patch/554855/?series=123023&rev=1
> 
> Basically, use this structure for lut capability and arrangement:
> struct drm_color_lut_range {
> 	/* DRM_MODE_LUT_* */
> 	__u32 flags;
> 	/* number of points on the curve */
> 	__u16 count;
> 	/* input/output bits per component */
> 	__u8 input_bpc, output_bpc;
> 	/* input start/end values */
> 	__s32 start, end;
> 	/* output min/max values */
> 	__s32 min, max;
> };
> 
> If the intention is to have just 1 segment with 4096, it can be easily described there.
> Additionally, this can also cater to any kind of lut arrangement, PWL, segmented or logarithmic.
> 

Thanks for sharing this again. We've had some discussion about this and it looks
like we definitely want something to describe the range of the domain of the LUT
as well as it's output values, maybe also things like clamping. Your struct seems
to cover all of that.

>> +    ├─ "LUT_1D": blob
>> +    └─ "NEXT": immutable color operation ID = 0
>> +
>> +    /* 17^3 3D LUT */
>> +    Color operation 72
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4
>> matrix, 3D LUT, etc.} = 3D LUT
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "LUT_3D_SIZE": immutable range = 17
>> +    ├─ "LUT_3D": blob
>> +    └─ "NEXT": immutable color operation ID = 73
>> +
>> +
>> +COLOR_PIPELINE Plane Property
>> +=============================
>> +
>> +Color Pipelines are created by a driver and advertised via a new
>> +COLOR_PIPELINE enum property on each plane. Values of the property
>> +always include '0', which is the default and means all color processing
>> +is disabled. Additional values will be the object IDs of the first
>> +drm_colorop in a pipeline. A driver can create and advertise none, one,
>> +or more possible color pipelines. A DRM client will select a color
>> +pipeline by setting the COLOR PIPELINE to the respective value.
>> +
>> +In the case where drivers have custom support for pre-blending color
>> +processing those drivers shall reject atomic commits that are trying to
>> +use both the custom color properties, as well as the COLOR_PIPELINE
>> +property.
>> +
>> +An example of a COLOR_PIPELINE property on a plane might look like this::
>> +
>> +    Plane 10
>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    ├─ …
>> +    └─ "color_pipeline": enum {0, 42, 52} = 0
>> +
>> +
>> +Color Pipeline Discovery
>> +========================
>> +
>> +A DRM client wanting color management on a drm_plane will:
>> +
>> +1. Read all drm_colorop objects
>> +2. Get the COLOR_PIPELINE property of the plane 3. iterate all
>> +COLOR_PIPELINE enum values 4. for each enum value walk the color
>> +pipeline (via the NEXT pointers)
>> +   and see if the available color operations are suitable for the
>> +   desired color management operations
>> +
>> +An example of chained properties to define an AMD pre-blending color
>> +pipeline might look like this::
>> +
>> +    Plane 10
>> +    ├─ "TYPE" (immutable) = Primary
>> +    └─ "COLOR_PIPELINE": enum {0, 44} = 0
>> +
>> +    Color operation 44
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
>> +    └─ "NEXT" (immutable) = 45
>> +
>> +    Color operation 45
>> +    ├─ "TYPE" (immutable) = 3x4 Matrix
>> +    ├─ "BYPASS": bool
>> +    ├─ "MATRIX_3_4": blob
>> +    └─ "NEXT" (immutable) = 46
>> +
>> +    Color operation 46
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = sRGB
>> EOTF
>> +    └─ "NEXT" (immutable) = 47
>> +
>> +    Color operation 47
>> +    ├─ "TYPE" (immutable) = 1D LUT
>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
>> +    ├─ "LUT_1D_DATA": blob
>> +    └─ "NEXT" (immutable) = 48
>> +
>> +    Color operation 48
>> +    ├─ "TYPE" (immutable) = 3D LUT
>> +    ├─ "LUT_3D_SIZE" (immutable) = 17
>> +    ├─ "LUT_3D_DATA": blob
>> +    └─ "NEXT" (immutable) = 49
>> +
>> +    Color operation 49
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
>> +    └─ "NEXT" (immutable) = 0
>> +
>> +
>> +Color Pipeline Programming
>> +==========================
>> +
>> +Once a DRM client has found a suitable pipeline it will:
>> +
>> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
>> +   drm_colorop object of the desired pipeline 2. Set the properties for
>> +all drm_colorop objects in the pipeline to the
>> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
>> +   and false for enabled drm_colorop blocks 3. Perform
>> +atomic_check/commit as desired
>> +
>> +To configure the pipeline for an HDR10 PQ plane and blending in linear
>> +space, a compositor might perform an atomic commit with the following
>> +property values::
>> +
>> +    Plane 10
>> +    └─ "COLOR_PIPELINE" = 42
>> +
>> +    Color operation 42 (input CSC)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 44 (DeGamma)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 45 (gamut remap)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 46 (shaper LUT RAM)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 47 (3D LUT RAM)
>> +    └─ "LUT_3D_DATA" = Gamut mapping + tone mapping + night mode
>> +
>> +    Color operation 48 (blend gamma)
>> +    └─ "CURVE_1D_TYPE" = PQ EOTF
>> +
>> +
>> +Driver Implementer's Guide
>> +==========================
>> +
>> +What does this all mean for driver implementations? As noted above the
>> +colorops can map to HW directly but don't need to do so. Here are some
>> +suggestions on how to think about creating your color pipelines:
>> +
>> +- Try to expose pipelines that use already defined colorops, even if
>> +  your hardware pipeline is split differently. This allows existing
>> +  userspace to immediately take advantage of the hardware.
>> +
>> +- Additionally, try to expose your actual hardware blocks as colorops.
>> +  Define new colorop types where you believe it can offer significant
>> +  benefits if userspace learns to program them.
>> +
>> +- Avoid defining new colorops for compound operations with very narrow
>> +  scope. If you have a hardware block for a special operation that
>> +  cannot be split further, you can expose that as a new colorop type.
>> +  However, try to not define colorops for "use cases", especially if
>> +  they require you to combine multiple hardware blocks.
>> +
>> +- Design new colorops as prescriptive, not descriptive; by the
>> +  mathematical formula, not by the assumed input and output.
>> +
>> +A defined colorop type must be deterministic. Its operation can depend
>> +only on its properties and input and nothing else, allowed error
>> +tolerance notwithstanding.
>> +
>> +
>> +Driver Forward/Backward Compatibility
>> +=====================================
>> +
>> +As this is uAPI drivers can't regress color pipelines that have been
>> +introduced for a given HW generation. New HW generations are free to
>> +abandon color pipelines advertised for previous generations.
>> +Nevertheless, it can be beneficial to carry support for existing color
>> +pipelines forward as those will likely already have support in DRM
>> +clients.
>> +
>> +Introducing new colorops to a pipeline is fine, as long as they can be
>> +disabled or are purely informational. DRM clients implementing support
>> +for the pipeline can always skip unknown properties as long as they can
>> +be confident that doing so will not cause unexpected results.
>> +
>> +If a new colorop doesn't fall into one of the above categories
>> +(bypassable or informational) the modified pipeline would be unusable
>> +for user space. In this case a new pipeline should be defined.
> 
> Thanks again for this nice documentation and capturing all the details clearly.
> 

Thanks for your feedback.

Harry

> Regards,
> Uma Shankar
> 
>> +
>> +References
>> +==========
>> +
>> +1.
>> +https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5n
>> +AccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1
>> QWn488=
>> +@emersion.fr/
>> \ No newline at end of file
>> --
>> 2.42.0
> 

