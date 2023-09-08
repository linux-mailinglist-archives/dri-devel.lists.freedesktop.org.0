Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF4799117
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26F610E94B;
	Fri,  8 Sep 2023 20:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876B110E94A;
 Fri,  8 Sep 2023 20:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgVzxgp/stj6ePrL7ZOFCPx/DqUl/GodvKrZR4+sqlVTSuEZFXiZUpvWbYBhdDVtucpjpFLTi/e0aMjCKKn4htm6ov19Ll4U/wHfZd2QGup/9138cx6pRYog+QY1v9su+2G3FFfPgsSlFzxjzo9ioCaVWXCmpsKJKDbzNLtpiORszGK8ZCQbFU8x4/cpOwq54zUDXaRrMSeOGG8YcMWWAfw94tlieMVaYxfD1S3BTGxD89UqtQVaVRBxVObqvdTL2Ws4gxAkI2jXQwPrFg1LCSha6Y3FFunqRseP+Vp8jeeqSy4w5iov4ou7hlAqLPJUjpuLmArltm3NqXGXVFa9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4eSUW4d1Y67nCPWNFnO2CQE1wYzyrIwSSIbPHyxyjw=;
 b=LyeHwEnfslSTy/cXoFlPyp9y13Vicd/hWDnJK4pVWBgqmpI/UFNtzUvfJERwubRvOFSE/q36KYGuFMjbXbPqycAldkGicuEz0kSrlNKlvQb0rpAJ8JI+VhQD5ZscXywUW2dMO0C3Enf1uEDKRdj9pNMzHXC2Po8DDo0ibZD/AvMG6A70w/SlrbelUzdJz0U5eRSfe/EfPSCKAV1UbTb6Or7IIXoIx4vzdM+Lmve3wM9t/CiLfANBa45axgmzI3D35bFvnqc2C9Ysnv/l1ZOGKF0ILf8AMVp1kQKM7qNCLwO1AouxU0QYuF5qvcdx1JE9N3tlACyS7jd1Dd5+ct9rSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4eSUW4d1Y67nCPWNFnO2CQE1wYzyrIwSSIbPHyxyjw=;
 b=3f45oInt8IAJw9KIQohaZYFqH4sCT3/Lpfz5DsIAXjElq0eofy7NJ/+8i6uIb/lecghXwTv1PD4lgcQC4w+7osvxfZ9yLCOXEJCiyhOBDxp2/ZiVu6PMvMk0P/DlwE/OgdBF4ootsXCxhCGeGU6Wj3NxH1b8nviLwcE+sv/WC7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4895.namprd12.prod.outlook.com (2603:10b6:5:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:38:49 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 20:38:49 +0000
Message-ID: <f2b59759-a027-41c0-8ccc-3edc1d450c8a@amd.com>
Date: Fri, 8 Sep 2023 16:38:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230908193040.GA978120@toolbox>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230908193040.GA978120@toolbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0242.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8d95af-fcca-428f-6d99-08dbb0ab9b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XsABFLBFpDvJLimZ4kNcDKkwHN7doKnmZm3u4r7uLKvvb/1ldcjIN/5GS10EexUH0WcWTUrkMdQ1cnSrL1hY2VTLRU6cNjnqYUNO8FJXgXQgfo7LuSCPnzuAzITPotNE817DiMnfz4Iv8vTPBgONzmfhiIojXZen6t5E2KFvZmqjRQkmpIVvKvDLGPRKz/KJe+J+CpNnKorw51pYEEnlRntlowypH9GWLWNQQa0OYknrUjpKzG1i9Rb3OFrIBmssNGmJGKGCVxTeumGVVD6O93zqLrD6YNdzZK0fLpWZ3/1ZCOwrLhrVEED2W38HnzVVTARHVOAv6lMP7LNRKhGOGeeFdfyc7uUHw3H4HLijJiq+CJlsEwkqDTU4oS9UzEKTAHJ13ALJ20jDNGGBkt/QTYSokwNa2ZL90rUCL6EWMR/zRe0MofnvfRsO4d40K5yBhnyogso3f+SZCFOIllvG8wy09pyI0ODh5uWA8QQLQSMUjz9N2sCt8XH3BfCz5W3PP48Xduwcw88F1dC7o/9ZJxxvwSMUW/5sbGBOdcnp/YCbQbEXCleIERGJTwh9y6CJlbL563gEvXU6pSEHWjuzQOxKpcl9Ukm4Q0o14Q306vZdmk5i/oLlk6bQF9FVqJocJ7TQEgD2gc1JpBOUpHlvuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(66899024)(31686004)(6666004)(53546011)(6486002)(6506007)(6512007)(36756003)(31696002)(38100700002)(86362001)(30864003)(2616005)(26005)(966005)(66574015)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(7416002)(66946007)(316002)(54906003)(6916009)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnhQemdSaFJQVUpnRzl4U0pXdkp5Mld1cXpFbzR1LzlHYWROTDRNekhEc3Uw?=
 =?utf-8?B?WjQ0QlZPUUp2eTVnZXJ0YVIrMFF5cG1CUjc1YzhvZzNkdzZTT2F2R3pIZmdG?=
 =?utf-8?B?c09iQ3pmbGxyUGF2UFVYOWJTbithYnRlMjhEOHpWY0FqRFEyZmxDQmlUVjdt?=
 =?utf-8?B?Y2RuanNIWjg5bEJvNDV1Q2ZuWlhSS0Nsc0J1MTQ4NmxrKy8rSndFZmJ5NXVW?=
 =?utf-8?B?Ry9obnl0aFk1U2tLTHMxd0ZaUXFhWXZ3d0Z0Ujgwb3ZpWHpFclBHR1BoYmo3?=
 =?utf-8?B?WWN1SWNlQWMrTldvTzZRaUpkSk5LR01CLzRxRlRMQmVWaHlSb1g3ZDdCck5N?=
 =?utf-8?B?R3VEQ1B4ejJRUW5QSDV2dFUzK0RjZ3ZmSkhmb3Y0U2VYam5EeGVJczI0eERv?=
 =?utf-8?B?dnJ0STc0Y0FXM0JCdmZldWJIb1NvZ3Q2c3l4T25KVm10VU5wWlZ1Mzc5ZUpU?=
 =?utf-8?B?N0llYUNZL0lIM1l5Wm1nazBNRUptSnFQeXlzYlZYcW5DVnJRVWFjc2ErTVov?=
 =?utf-8?B?VFhicDk3cmZuRUZLV3ZPZlA0WG12aDRhZi8rY0dzUXlLbUdGU1VqZ21FTUU4?=
 =?utf-8?B?OUQ5dkFFNzVCaloweDZZUW5FNThHV3Qxc0lLanEyNyt0VVk4L1pDRS9tenp4?=
 =?utf-8?B?OStUSER3Tmx4TXZONzVTWHdKS0kxMmV6eGRIKzZqbko0a2V2N29aVDh1MW5k?=
 =?utf-8?B?WkdNTUVGM0Vqc0pPNDA2RUVjU3ZXcTlCSUNwUlJQZURpcWQ4aTVaY3N6ZEtE?=
 =?utf-8?B?NkIxRXhQaHF5UytZK1hRTFpCTWJzZTJkNWh0L0FCeXpCTXNCV0gvSHp2VXQ4?=
 =?utf-8?B?NStObFhkY3VjZ25iQUw4ZG5DUTFiWllhczNQQ0VVZ2d3Q1VtZkxzdzdlYnJj?=
 =?utf-8?B?dHVXaE5ia1I3UmdDN1VxbkI1VEVFNEZsN1FNME5BZkdmRXE0R0kxVldlWDNB?=
 =?utf-8?B?V0JGdUdVR1AzWUxtR2lORzlHSDBwZllqd0NBM2laNFg1OXVlTmZZRVZjRnpn?=
 =?utf-8?B?WjVYS2hvZG1SazBSNUkxVEJhWVl5VXZ1djhscEVqVmdBSHhubmZRYXlSaWgy?=
 =?utf-8?B?SEhyOHZUVXYyQXVaTnNZTDRhcDBqZGZsT1FmMUkxem9EMUxSbFBRTnZyOVBp?=
 =?utf-8?B?UjRPK3VjUjQ2RlZYcmhKd29JbGw0STBsZ2tPSmtldUdoZmY2Z1Ezb3lTKzFv?=
 =?utf-8?B?ZlJlOUxXRytvSFZYbm9LZWJ0Y2Z0Mk4rdysveFBtVXZKcUJNTWt0OFJVOHhL?=
 =?utf-8?B?dzZZQjE1aWZCejg2TDY0MFQ0K2c5L25pS1VTRWQrVXZUTmNTbDBQN0NPa2Rr?=
 =?utf-8?B?ekhyV01hV2l0WTNCM09RdkhZSWhIUjdIMFRwZUozQWxUVWcxVzA2Sm9LVmo0?=
 =?utf-8?B?aFhXeG04MTNkYmRYWHlTUlVjRXo2VFBRRGNjRmZsekI3bWc5TVdHdTNUcko3?=
 =?utf-8?B?R1VXbC9ycmh2ZzljMnlKMnZDMWdnTVdBQ2NncE52ZXZnNHZ6WWFxYlh6TkZJ?=
 =?utf-8?B?b3MxRlN6RGR2YUk5Lzl5eFhDMmVFZ0J1WDNMdnpKWVphUklrTm1yZmxlU3FE?=
 =?utf-8?B?dkFvR09KMTFuVWlzNG82Z0lMWUtRZkdOTXNCd0VISEp1WDlHVnp3SHkrcGJU?=
 =?utf-8?B?RUxWSm1MUkQzSjZQejk3L2hia1VqTVMxQ2tEUWV2ZDUxTCs5SnRTMzNUc1hT?=
 =?utf-8?B?SWh6RTllRENLd1FUUGF1SkJQZitia3dRdEpVeDljTUFFY1BOU0JUUjV6YmV3?=
 =?utf-8?B?OUlDcFVZdHRCQUpTdDhJbHZqSjIvemQrOVdTOXFta3RqRXVwUitLUEhKblZh?=
 =?utf-8?B?UTU2RldJRGJMRURmVDB6TnlWS1ZZWUpTak9DUHBLKzRLT1lwTFZhemM2VUQr?=
 =?utf-8?B?cEVPU1h0RFFyNElzWWRQVjFKYUxCdmNHQVJTRGkybGMxQ09xaldLZmFGVDZv?=
 =?utf-8?B?MUtSTi8rZzM4QnJWSjJFZUNvNE54b0tEaEJ6SWhtOUgzVGNKSWgzVEFRdTg4?=
 =?utf-8?B?REo0eFJ4c1hGYTRKdlQxbjJqN0d3anJ3VFZjK2ZmSXZiOXFVUW5WeVhFRm1L?=
 =?utf-8?B?M2wrYnc1SHlRVmZ6eDIrZnVldkdlY2d6dUJOVmc1YzZ2UzRKTTZWb0wvTTFm?=
 =?utf-8?Q?N9XBPzg0hKN44jwoje1wFPsxo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8d95af-fcca-428f-6d99-08dbb0ab9b46
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:38:49.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uz/Kbm+B2R9XGwbA+ESp7tTblyszKiw7a7HXhA7I59A89jLDn5i2w31n7T0l/onAI9+57Lg1tijsHrtl89p7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4895
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-08 15:30, Sebastian Wick wrote:
> Hey Harry,
> 
> Thank you and Simon for this great document. Really happy about it, but
> obviously I've got a few notes and questions inline.
> 
> On Fri, Sep 08, 2023 at 11:02:26AM -0400, Harry Wentland wrote:
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
>>   Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
>>   1 file changed, 278 insertions(+)
>>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
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
> 
> We talked a bit about how forwards compatibility will look like. When a
> driver introduces a new property that user space doesn't understand yet,
> for user space to make use of the pipeline, the property either has to
> have a bypass property, or some other kind of standard/core property
> that promises that this property is purely informational and the
> existance doesn't change the result of the color pipeline. Something
> like "INFORMATIONAL" or "INFO" (better suggestions welcome!).
> 
> If a property doesn't fall into the two categories, the new pipeline
> would be unusable for user space. So, if this new property is added on
> an existing piece of hardware, it should be done on an entirely new
> pipeline to avoid user space regressions.
> 
> I believe these compatibility considerations are very important to
> document.
> 

Should a property have a "bypass" or would it be enough if a colorop
has a "bypass"?

I might need to digest what you said a bit more... Not sure I fully
understand yet, in particular how one would bypass a particular
property.

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
> 
> This says BYPASS is a prop but in the example below the type property is
> a mutable enum with Bypass being an enum variant.
> 
> Any reason why you chose to make the type property mutable instead of a
> separate BYPASS property? Personally I like the simplicity of immutable
> properties and would favor a BYPASS property.
> 

My bad, I copy-pasted from Simon's draft but my actual implementation
already looks different. Type is immutable. BYPASS is a separate mutable 
property.

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
> 
> Regarding the requirement to never fail atomic checks which set a
> colorop to bypass: I think for user space it would be sufficient if
> setting the entire pipeline to bypass would not fail the atomic check.
> 
> I'm also wondering if there is/will be hardware out there which always
> does some kind of transformation which cannot be turned off. How would
> they implement the '0' pipeline?
> 

Interesting thought. Not sure if that exists. Maybe in that case
COLOR_PIPELINE doesn't ever expose 0 and we use an (immutable) 
drm_colorop to describe the operation.

>> +drm_colorop in a pipeline. A driver can create and advertise none, one,
>> +or more possible color pipelines. A DRM client will select a color
>> +pipeline by setting the COLOR PIPELINE to the respective value.
>> +
>> +In the case where drivers have custom support for pre-blending color
>> +processing those drivers shall reject atomic commits that are trying to
>> +set both the custom color properties, as well as the COLOR_PIPELINE
>> +property.
> 
> By 'not setting the COLOR_PIPELINE property' you mean any value other
> than '0' I guess? Should be fine to a proper user space.
> 

Correct, I should tighten up my language here.

Harry

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
>> +
>> +    Plane 10
>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    └─ "color_pipeline": enum {0, 42} = 0
>> +    Color operation 42 (input CSC)
>> +    ├─ "type": enum {Bypass, Matrix} = Matrix
>> +    ├─ "matrix_data": blob
>> +    └─ "next": immutable color operation ID = 43
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
> 
