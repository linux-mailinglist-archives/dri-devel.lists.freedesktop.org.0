Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8C67CFD66
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA6D10E506;
	Thu, 19 Oct 2023 14:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4210E0D9;
 Thu, 19 Oct 2023 14:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE0ZOGucNlroVIjIgv9ztHjJ9UlqZrCyjX2+3lIE3CDkCXnVvA4y7Oqr95BM+ErctRyv8SuCs9O5wpGy6rRjrQv1ZxbdFKvMigv4N62F3Sv74/F/U2BomWZcRv8ceQOzAY+qofJkwN3L75lbxSKc/VwHQ5OU6khrtvSaLkV8447giAaRq0svaZJ2/TEEjYZMX2+PZElT/KaSI6LnmtIZtXCGijuVHX0LNoduw/i5wq2IF85KmHKTZUCkRZFfaWc3fXyCVC3RijhYFq+TWnr4r2bknRIKsAkAdFr+e3U20rNARPLwoOTvn9t2joTYiyd4F2cul+0nOlH+fdt/CAPl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8Ue1cZBSuQnsL1D51iCfkJYnSsja2imgtFAWSTzKmY=;
 b=PfEHeDbD0Cl8j0net1QkShsAArXH6IVtZ8c94ZvNm/Ez94V23Ki8FWXFJWsd66LB1drIg5ul5CvA/6h2KiwSjPSpE30nObE5n5kliEIKvt1wdge1jFB2GHS2hHGOTch0XdY1pvAKwwQTTdO7PNFGflqW4IN15rbs7UKgNuXS4q8W49ZTR4rffcT+PMypJE3qSz9bl0MyG1tzHRiWOv8uMVg4x/xOtn8mu07CehgwsDRmoyZCqAJABhsvWEzslscUk3KN26MN6JR9LGug+7zMh0FDuzUPer+ErAONiUbZKywHvtTYnnVFPKkpWRNYBzNNbGf6FUKJxkAr2VDhNeWQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8Ue1cZBSuQnsL1D51iCfkJYnSsja2imgtFAWSTzKmY=;
 b=43Xw6/TRbqw8s5q46r8tCaqP8KulO2LQkSH79xF5thx/Ef8q69VcZ7fe1lLJUMmN9tn+lK5secw3962oRltbGsLx2L1WSr82kLGOAg+ihO6YOi+KbRSN4F4XAQn8msZ6SZErBsoHO0G3fL2wl3WJr+G9UjYDzExM1IiooMkrl7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 14:56:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 14:56:42 +0000
Message-ID: <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
Date: Thu, 19 Oct 2023 10:56:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: cde2dd91-ec04-4e4c-cef9-08dbd0b39ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/CtoN6IDCUi2Bk1hg56CnAEk+vQdQjt1NvLKO78cQe5EN9AEjkihhg+rSBS/fG2wZ+DhWS6XQfuVYfo0Zkg2qs1gTGCkVWvRlvmgEyxSqzgFIwwxaVVX2CAYyBlOPzxskW90skdDHwdbOQmmFH+UOFxDUlRiUWJrWjIJ8QiMAHuzWGB9sQFT/Xc6RSHFZ+xuuLEQYR8gsZfTUkqUgZwKLh1FgxnZlPbV6DXLN8KSOEYYbUo3hHkfywfdinfez9GgiFBptc6OwZioQd37YnVf+n4A1REQkXCYV8yLmpqpF8lvN8+XwQYbt0v1yI9PLpXZKb9Dnh7B/k3Rbjy529wi4U2QARrUEbFXbYhwV/H4hCWyqLWUWUDfDG5uclM7/i0qJ0oR+REQ0k873CqzN6b18cws3ASG/PgRvPtn7iNS0NOvvZxbsyHj0R1K7yB3LvoU+d3Qo1fGD49fpX06XV6VQENzeb3Vbfjxc7fLXuwdsoxqwZw3SLN5zFGeEecHHComk3Oe1r+3tgPI/XWAfRjUAgPsFnIXWkM5YYP5B6cYJMC9lU8yQB+fItJAUK/VEpo1MC7xG8sH9QY7ckaRAdgGp83TaHOk/snD6OlrWfeFWMECKwa4SNqu7uf9TwUzEDAdvgW94EKPZCXQvoY27hIQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(54906003)(38100700002)(30864003)(66899024)(31696002)(2616005)(41300700001)(6512007)(36756003)(316002)(2906002)(86362001)(4001150100001)(6916009)(66556008)(44832011)(66476007)(7416002)(66946007)(5660300002)(8936002)(4326008)(8676002)(478600001)(6506007)(6486002)(966005)(53546011)(66574015)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmpNMkw3ajY3Yy9Qak1TL2FEMTVteFpxeGoxZnBEbDloem5OTXFxMDBma3Jx?=
 =?utf-8?B?ME52YW9sMEd4NVU2V2NvUTZRMlRnZVlXRUV1OW5MVXBPdGdWUTVVUXh0bzVJ?=
 =?utf-8?B?VXpjelYwNGwvNk0waFkybDZUMUgvRlJsWVVrNEh5KzdSQ0tPRUtJc2d0bFdQ?=
 =?utf-8?B?S1lYNk9jVllKQkgzRU9UZWwwaVFCUWtBbUxXZTRCSWc0Z2EyVUErTit4WWlu?=
 =?utf-8?B?WXhEdXBzM1poa055cExIUFhpRy9wYTFGZmRwb1dON2F0dkM2dTNGd3ErWnhF?=
 =?utf-8?B?SjFoNlBFU1BUcDZkYWpCdnFXeFhXZkRnMG5GSy94VUdCZmZzSE1MR0pDTUM4?=
 =?utf-8?B?WFRLNnBvMGN2SUJqVzVzUXc3SXg4U0VpcGdITmxFcmFmcm1BMFIyWFRTcGFl?=
 =?utf-8?B?eFBJcEZOWDJZaklzNllPbmZpMWtLK2dVNWRrTDhGOFZMS0pNUGNoTTBQbzdi?=
 =?utf-8?B?Y29YOU9wRnJoL2hkMWNMNkNianVZWXVkcE9mbm1Rb0txNnpaSkE3MEVObzRN?=
 =?utf-8?B?RjNkK0NSYkxDZVNlT3E0MmN4MHVKN2JXRWRwSGt3SE5XUnlYMjJOTURUeW1q?=
 =?utf-8?B?QXZwRTZ5VUQ1UGdIdVRadlk5M2xrLzRscWRncUpCSldBV1UyV0NRZHJEOXRX?=
 =?utf-8?B?ZVBtRW1qM3c5V01OT253S2NlRldJSFExcVhuV2hHWUNpbFl3S2U0SzhURzBL?=
 =?utf-8?B?bXFaNEJMeGg5OXo3SldVUHRBeGFsQm10SzRzR2ZRRXhZNDlONTIzcTRzUmQ4?=
 =?utf-8?B?RCsrbS9pdjRrUXVvZ3JxUENheWRpVXNYZDZqZFM2aUZlampSbDVpaGVaWUc0?=
 =?utf-8?B?Y0hFNVd2TnJFVHRhVmt6RERVSTNsNlB2L0ptMGFwaXJ0S2FCandxTkhFcjM1?=
 =?utf-8?B?RHU0MkxNN0VMUW9sdk9zazc1bTBSVmtWNXVkTndaOW8rNjVMYXo4b28vS1ZZ?=
 =?utf-8?B?NTBmd2tJNE1TYTdUWXpTbmNwTG1jdzZhaHpiV2FhQVVUWS9nR1d5T0pOTkNW?=
 =?utf-8?B?bW1vMDZCUW9zZmgrdkVoS01wbjBaNHI3MFJBRVNLckdWcFUrU3p6ZnF1VHpS?=
 =?utf-8?B?M0tKcGVHL1dNbHRxZXdyZHdhdW9SRHovRkg1bWUrYjVsTis2V0tuemNCY01Z?=
 =?utf-8?B?RVZBcC9BTzRFa1RLM3dqNDNxZ1hVWnZwRlF4aTNLbTVaUUJmZUZIaDBMQmdX?=
 =?utf-8?B?cndWTk96czlHMmFDZDhhaFFCQW5RQVlxTDBWK0VNZVoweWFzZTVVOWFtMk1B?=
 =?utf-8?B?dENzSlB0ZXlIRWk1MSsrR3lvUVFZNE5DWlM0ajFLSnpnQm4yalpNSERPeGp3?=
 =?utf-8?B?eTQ1dGRVeTdXbDNJRTlKQWc1S1dkL01zOTIvTnVJcFp3MzlUUzA1TGtiRmpq?=
 =?utf-8?B?eUxkOWVidDFvOEFKRDk1U0FuVHFvNmlsNjZ5ZWRKYzM3eDMwRTFEMXVuUU5Y?=
 =?utf-8?B?a3FRRklZemVQdFNOTDRVeWg1ZWo1c1V1RmxJUWxRV3ByNWxNSXloMzQyQ0Q5?=
 =?utf-8?B?NkhlZjJPeFZVRnJDM25Dd3g3QmFOdktINGxTZ3RxdjgwVUdtaWNIZFFPWHky?=
 =?utf-8?B?aTJ4bTVHUEY3Y2JTMHRSRHllL2FramJMdFQxeGx3dDlVc0ZJYlpIS3hHNHRW?=
 =?utf-8?B?RzM5Qm9jbm4yUXBsSGs5NDFMaVJHKzFGUjFvNlNlV0piaDBXS29jQ0FlbFRV?=
 =?utf-8?B?SVFZbjRuT0tKYldNYjlFZDRRWmdHbUg4UWFvNzMvR2twVHE0c3d1TXllYVBh?=
 =?utf-8?B?TzlESVQwL0xsaEx0amFqNE9UUU5vcytzdGtXYWlaUE5SNWNjTERib2c2dm9Y?=
 =?utf-8?B?WFJ1N2VWVWN2ZWtPMEQ5bFFiRFNWRkpEZ3Z0cWhhZkN0S3NrclVEc1J0Zkdv?=
 =?utf-8?B?WHJuRVoycjErdEdENlNYcmsvd002ekh0WHpyWnRxdlV4S3ZBZXNCOG5vVzRq?=
 =?utf-8?B?WmRGdkwwTkZJYTZRRElReTNDNmxOQ1lwWkJGdE1jY0FmdTc1RnFBNUpiQ1M4?=
 =?utf-8?B?YXVnNFNKMUlHQnIra1F1dWhxLzQxejhmbzhPZjJnbjJoRDBsbE5TN3NKVGJV?=
 =?utf-8?B?cmlnZ1E4M2hRWlZZM2dqLzhpUDN4b2R6NDFBN0l6M0xZU21EYzdzZ0oxRSsx?=
 =?utf-8?Q?y/rNLC1gZxytzv1+lWmPzLrs7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde2dd91-ec04-4e4c-cef9-08dbd0b39ad7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 14:56:42.0368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08Uke7o/649rKAEi1LkZaEbsnGVGSlN8ZI0zUicphslNygSaCfA0itZxNKcVK+qEateguY4kSq2AOsxJuqf0IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-10 12:13, Melissa Wen wrote:
> O 09/08, Harry Wentland wrote:
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
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> ---
>>  Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
>>  1 file changed, 278 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>
>> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
>> new file mode 100644
>> index 000000000000..bfa4a8f12087
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/color_pipeline.rst
>> @@ -0,0 +1,278 @@
>> +========================
>> +Linux Color Pipeline API
>> +========================
>> +
>> +What problem are we solving?
>> +============================
>> +
>> +We would like to support pre-, and post-blending complex color transformations
>> +in order to allow for HW-supported HDR use-cases, as well as to provide support
>> +to color-managed applications, such as video or image editors.
>> +
>> +While it is possible to support an HDR output on HW supporting the Colorspace
>> +and HDR Metadata drm_connector properties that requires the compositor or
>> +application to render and compose the content into one final buffer intended for
>> +display. Doing so is costly.
>> +
>> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and other
>> +operations to support color transformations. These operations are often
>> +implemented in fixed-function HW and therefore much more power efficient than
>> +performing similar operations via shaders or CPU.
>> +
>> +We would like to make use of this HW functionality to support complex color
>> +transformations with no, or minimal CPU or shader load.
>> +
>> +
>> +How are other OSes solving this problem?
>> +========================================
>> +
>> +The most widely supported use-cases regard HDR content, whether video or
>> +gaming.
>> +
>> +Most OSes will specify the source content format (color gamut, encoding transfer
>> +function, and other metadata, such as max and average light levels) to a driver.
>> +Drivers will then program their fixed-function HW accordingly to map from a
>> +source content buffer's space to a display's space.
>> +
>> +When fixed-function HW is not available the compositor will assemble a shader to
>> +ask the GPU to perform the transformation from the source content format to the
>> +display's format.
>> +
>> +A compositor's mapping function and a driver's mapping function are usually
>> +entirely separate concepts. On OSes where a HW vendor has no insight into
>> +closed-source compositor code such a vendor will tune their color management
>> +code to visually match the compositor's. On other OSes, where both mapping
>> +functions are open to an implementer they will ensure both mappings match.
>> +
>> +
>> +Why is Linux different?
>> +=======================
>> +
>> +Unlike other OSes, where there is one compositor for one or more drivers, on
>> +Linux we have a many-to-many relationship. Many compositors; many drivers.
>> +In addition each compositor vendor or community has their own view of how
>> +color management should be done. This is what makes Linux so beautiful.
>> +
>> +This means that a HW vendor can now no longer tune their driver to one
>> +compositor, as tuning it to one will almost inevitably make it look very
>> +different from another compositor's color mapping.
>> +
>> +We need a better solution.
>> +
>> +
>> +Descriptive API
>> +===============
>> +
>> +An API that describes the source and destination colorspaces is a descriptive
>> +API. It describes the input and output color spaces but does not describe
>> +how precisely they should be mapped. Such a mapping includes many minute
>> +design decision that can greatly affect the look of the final result.
>> +
>> +It is not feasible to describe such mapping with enough detail to ensure the
>> +same result from each implementation. In fact, these mappings are a very active
>> +research area.
>> +
>> +
>> +Prescriptive API
>> +================
>> +
>> +A prescriptive API describes not the source and destination colorspaces. It
>> +instead prescribes a recipe for how to manipulate pixel values to arrive at the
>> +desired outcome.
>> +
>> +This recipe is generally an order straight-forward operations, with clear
>> +mathematical definitions, such as 1D LUTs, 3D LUTs, matrices, or other
>> +operations that can be described in a precise manner.
>> +
>> +
>> +The Color Pipeline API
>> +======================
>> +
>> +HW color management pipelines can significantly differ between HW
>> +vendors in terms of availability, ordering, and capabilities of HW
>> +blocks. This makes a common definition of color management blocks and
>> +their ordering nigh impossible. Instead we are defining an API that
>> +allows user space to discover the HW capabilities.
>> +
>> +
>> +drm_colorop Object & IOCTLs
>> +===========================
>> +
>> +To support the definition of color pipelines we introduce a new DRM core
>> +object, a drm_colorop. Individual drm_colorop objects will be chained
>> +via the NEXT property of a drm_colorop to constitute a color pipeline.
>> +Each drm_colorop object is unique, i.e., even if multiple color
>> +pipelines have the same operation they won't share the same drm_colorop
>> +object to describe that operation.
>> +
>> +Just like other DRM objects the drm_colorop objects are discovered via
>> +IOCTLs:
>> +
>> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
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
>> +setting the BYPASS property to true should never fail. This allows DRM
>> +clients to fallback to other methods of color management if an atomic
>> +check for KMS color operations fails.
>> +
>> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
>> +drm_colorop is the last in the chain.
>> +
>> +An example of a drm_colorop object might look like one of these::
>> +
>> +    Color operation 42
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
>> +    ├─ "lut_size": immutable range = 4096
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 43
>> +
>> +    Color operation 42
>> +    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>> +    ├─ "lut_size": immutable range = 33
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 43
>> +
>> +    Color operation 42
>> +    ├─ "type": enum {Bypass, Matrix} = Matrix
>> +    ├─ "matrix_data": blob
>> +    └─ "next": immutable color operation ID = 43
>> +
>> +
>> +COLOR_PIPELINE Plane Property
>> +=============================
>> +
>> +Because we don't have existing KMS color properties in the pre-blending
>> +portion of display pipelines (i.e. on drm_planes) we are introducing
>> +color pipelines here first. Eventually we'll want to use the same
>> +concept for the post-blending portion, i.e. drm_crtcs.
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
>> +set both the custom color properties, as well as the COLOR_PIPELINE
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
>> +2. Get the COLOR_PIPELINE property of the plane
>> +3. iterate all COLOR_PIPELINE enum values
>> +4. for each enum value walk the color pipeline (via the NEXT pointers)
>> +   and see if the available color operations are suitable for the
>> +   desired color management operations
>> +
>> +An example of chained properties to define an AMD pre-blending color
>> +pipeline might look like this::
> 
> Hi Harry,
> 
> Thanks for sharing this proposal. Overall I think it's very aligned with
> Simon's description of the generic KMS color API. I think it's a good
> start point and we can refine over iterations. My general questions have
> already been pointed out by Sebastian and Pekka (mainly regarding the
> BYPASS property).
> 
> I still have some doubts on how to fit these set of colorops with some
> AMD corners cases as below:
> 

These aren't the final ones. This is intentionally presented as how
an AMD pre-blending color pipeline "might look like". An actual one
will look different and problem align a bit more to your AMD driver-
specific properties.

>> +
>> +    Plane 10
>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    └─ "color_pipeline": enum {0, 42} = 0
>> +    Color operation 42 (input CSC)
>> +    ├─ "type": enum {Bypass, Matrix} = Matrix
>> +    ├─ "matrix_data": blob
>> +    └─ "next": immutable color operation ID = 43
> 
> IIUC, for input CSC, there are currently two possiblities, or we use
> `drm_plane_color_encoding` and `drm_plane_color range` to get
> pre-defined coefficients or we set a custom matrix here, right? If so, I
> think we need some kind of pre-defined matrix option?
> 

Agreed.

> Also, with this new plane API in place, I understand that we will
> already need think on how to deal with the mixing between old drm color
> properties (color encoding and color range) and these new way of setting
> plane color properties. IIUC, Pekka asked a related question about it
> when talking about CRTC automatic RGB->YUV (?) 
> 

We'll still need to confirm whether we'll want to deprecate these
existing properties. If we do that we'd want a client prop. Things
should still work without deprecating them, if drivers just pick up
after the initial encoding and range CSC.

But realistically it might be better to deprecate them and turn them
into explicit colorops.

>> +    Color operation 43
>> +    ├─ "type": enum {Scaling} = Scaling
>> +    └─ "next": immutable color operation ID = 44
>> +    Color operation 44 (DeGamma)
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
>> +    └─ "next": immutable color operation ID = 45
>> +    Color operation 45 (gamut remap)
>> +    ├─ "type": enum {Bypass, Matrix} = Matrix
>> +    ├─ "matrix_data": blob
>> +    └─ "next": immutable color operation ID = 46
>> +    Color operation 46 (shaper LUT RAM)
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {LUT} = LUT
>> +    ├─ "lut_size": immutable range = 4096
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 47
> 
> For shaper and blend LUT RAM, that the driver supports pre-defined
> curves and custom LUT at the same time but the resulted LUT is a
> combination of those, how to make this behavior clear? Could this
> behavior be described by two colorop in a row: for example, one for
> shaper TF and,just after, another for shaper LUT or would it not be the
> right representation?
> 

Yes. Again, this is only a (simplified) example in order to show how
things could look like on real HW.

>> +    Color operation 47 (3D LUT RAM)
>> +    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>> +    ├─ "lut_size": immutable range = 17
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 48
>> +    Color operation 48 (blend gamma)
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
>> +    ├─ "lut_size": immutable range = 4096
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 0
>> +
>> +
>> +Color Pipeline Programming
>> +==========================
>> +
>> +Once a DRM client has found a suitable pipeline it will:
>> +
>> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
>> +   drm_colorop object of the desired pipeline
>> +2. Set the properties for all drm_colorop objects in the pipeline to the
>> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
>> +   and false for enabled drm_colorop blocks
>> +3. Perform atomic_check/commit as desired
>> +
>> +To configure the pipeline for an HDR10 PQ plane and blending in linear
>> +space, a compositor might perform an atomic commit with the following
>> +property values::
>> +
>> +    Plane 10
>> +    └─ "color_pipeline" = 42
>> +    Color operation 42 (input CSC)
>> +    └─ "bypass" = true
>> +    Color operation 44 (DeGamma)
>> +    └─ "bypass" = true
>> +    Color operation 45 (gamut remap)
>> +    └─ "bypasse" = true
>> +    Color operation 46 (shaper LUT RAM)
>> +    └─ "bypass" = true
>> +    Color operation 47 (3D LUT RAM)
>> +    └─ "lut_data" = Gamut mapping + tone mapping + night mode
>> +    Color operation 48 (blend gamma)
>> +    └─ "1d_curve_type" = PQ inverse EOTF
> 
> Isn't it a PQ EOTF for blend gamma?
> 

Of course.

Harry

> Best Regards,
> 
> Melissa
> 
>> +
>> +
>> +References
>> +==========
>> +
>> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
>> \ No newline at end of file
>> -- 
>> 2.42.0
>>

