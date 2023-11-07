Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F617E4676
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A7B10E090;
	Tue,  7 Nov 2023 16:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0484210E046;
 Tue,  7 Nov 2023 16:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrPfHAP6SZb6IWDG1SFt69RVf784A32VflRihxb/a6KE2PkL9cwYnzb4Kuim64N/m1ALGlw0PuqGkXRJzgN4ZaZH5vhaUliKk667J7nuinAJglpMiTE36E8BPBj7ruZjDCpbsCebHQ72iauZ3z7rTDXRoskgHim/zHxlFyCeuIXIwDU98SGXYuhU7JT729ACVsoEPi3gwssd7NYZgDTUxT+liMokwXgoUtqCITWCgxkGPxwpH8zekCV3O09f1+UsRfHB2LmR9F5LvwFmsKQ1IVgwoue+FBX4WzmNRMGOsPBOPlPLyqvCALw8h0cCFhi353UxiuGstai2Poh9UDDAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jIo8qxU9f+ZFRRO7egTTJT1dnBG3i6xh7oWpTcGe60=;
 b=cYaqRYp2YEefRzVjXfnijVZUrpqnNAqGtrVfAZOpHK8XLO49gpAqwN33KMDFf2NRGHVQFOHbbpiJWBVawxiVTVYO7YyFwQSY1sxP4CX3i3YapBcEAP0AVHsWJ/BiOhuYdLPyel1R84pZH7ncxUq452TpWmVMAQCfPBQPIqxthtNuFa7hSUSApqpXBlI9wolIo2psrO+Qz7wBbWiu5mr1eR8VMF3WgpWuwUGqgahTGCfdBaUh4gJbmif2dteHSYEjm2O29fNXlLh0Inydm1Bg22u77qOPXhauOCWnApB/G4dkNLNBDUaZUgWh76l4r4/TU3yHiUO9izX9dt0+PFTmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jIo8qxU9f+ZFRRO7egTTJT1dnBG3i6xh7oWpTcGe60=;
 b=BdyoxQvWmYIRLc3aEF5Eis/F9y2lhNGBx/pJm/eZTem8buTr6dQtxu6kHiIOhPhS0ZxggQ9i2sfQVKmslwmRwat1b5hZZEqaj7kZ9DXV4J1LiqPAkBqAj1WLxSxnzSDuhzk9v5+F9llHEW+8GKenfl/6CDXtzQOkrvkND0idJgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:58:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 16:58:30 +0000
Message-ID: <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
Date: Tue, 7 Nov 2023 11:58:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231107115543.7fa6e5f2@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::35) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8206fe-32ef-4c5f-3889-08dbdfb2c4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgNcP++Be5MWToTGoa8v++1yVXeZpdIQt621Dn13T+uCTRyDCnxjMB96S7vqEtuNnJW6kPheGFozFIPknPyFLG3r3xUYeVzRkzUlqUzi49Ir9lB6mv1OeooHxZ6cXAfPZ8cvOJDshZBEQXGyFMC9IkFFaa/5C797yCgkU1r1IWzMppdxlv85fPF0wGxOA+Bu8WmhD9P047Y/IVZSPI7AKxlq6sZaOVfFlppVLR9NcaEnVleWHy9c8rAHT2yUOWmN+QYsX6Q9Fm3+6LTgRoLi9rJ+liVRvWXK9h2IoGbOlr6Y+rvdPyG8wsCATzOlhwOglo/Igh3qvzBgZQyg7GsIJ+Gu3tJjj0Uu9AOolhFxJvZIhhfkARNHTVw7TxjJH+D9tDbMPNhYyVYAFIkWtxWEQM8Wb4etkYcOeBVFnwgta82ZcNMrhzlRwps0Z4XVc+rO03j2hQLyuCipp5JaD7R+vlGbodzzOwFkFjRoS152ZQdbWvhK14AqMEWr0btoFUOzIMtB4y9w9Ofy1q7JSmQ0qJa38hLmPAp+hcLTt+A+BCgS3AwXq1RyvSG9y+qQBa1v9gPKNGn57u/EmnJXAmISsz6MfGq8ty7EzKF3k2d1eRiCifDrgpHhpUSKqN75sYnC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(26005)(53546011)(2616005)(41300700001)(6506007)(6666004)(83380400001)(478600001)(8676002)(8936002)(7416002)(966005)(2906002)(4326008)(6486002)(5660300002)(44832011)(66476007)(6916009)(316002)(66946007)(66556008)(54906003)(36756003)(38100700002)(86362001)(31696002)(4001150100001)(66899024)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5sVXpzUjROOGVXUE83ekh6dExpcDB4cCs5Y2VjbmprcDM1Wi8xbXRzZXQy?=
 =?utf-8?B?UktnSE9WbDJpYWhpbXlCQno3Zkt0MDUyQVQzWkllc2Vma2JpVWl0ZElUV3My?=
 =?utf-8?B?QXdDdWQzbHNhekFnOXFYcHdnUTFhNmpSTUQ4UmMwdk5QWUZjN2NULzg2b1NY?=
 =?utf-8?B?TXdockZiVy9NWnpaWjJKK3doYi9rRlVYdDNTNUZ5QzNZcHFicnRXdjFrNnJa?=
 =?utf-8?B?aTc3aGtLcVI5eXFIbTdrdUhtQUY2R1MzOWsxanpkcHlpNE9wREtoaWcwaXBP?=
 =?utf-8?B?VzJrWkpCcXhpeUU5R0RYczl6U3E3RjVKeG02UVN2bzJHcnRlQWV4NEprSmdH?=
 =?utf-8?B?VDlDS2JBeUZkSTBGeklwRGdIQnduaThudFdYOUJVZDNSUGU3ODhOSU11ODVx?=
 =?utf-8?B?NVYwY1RpVmErcW5YSGREUjdwcms1SG9JYy9FbkhsNVM0bjFXdlUrNEZwVWlS?=
 =?utf-8?B?NndYZ1p1dE5KNG13OUUrNXQwN0V6c1JvVFVEQ1JrSHlsbUpBZ0sveDBNYnRo?=
 =?utf-8?B?SnNSaUdKTU1RMUF4NTFUMlJLM09nSHRSSDdMc1BqR2NBUjk3YjZ6WXowVi9G?=
 =?utf-8?B?NHFXR0pncHdKdkU3V1lSWSt4MDZZYXZ1eDdkNXR5VFNVMTZOMWJ2UWQ3QkZk?=
 =?utf-8?B?RWxveVJKMVBxZ2ppeXdxK200V213WmlVM3lDVVVweHovbm9oR3ZUK2ZHK3pO?=
 =?utf-8?B?bTdqSVp3WkxsUC9WamNLeVh1Q1o3Y2VvT29CaGp4MUk2MFZpaW85S293L0RS?=
 =?utf-8?B?QWkyVnNkTmM3NXRKcGloNUFUVk5XTEN2TmVacjZadFR4UnFwN3NaUm1tbWZk?=
 =?utf-8?B?K243ZXkzNk9FbjZSUWF2YkdZYStQd0Y4MXhHd21tVUpoOEY0aFc1U1dFaHlX?=
 =?utf-8?B?WDRlM2VFNkJ6WE95L01kTjNqZ2duc0FodEUvd04yR2pKQTVVQ1dvVSsxQ2gv?=
 =?utf-8?B?S1pJSExVdkR4ZURZeis1MEVTZ3VUc2RqVXRGeGpXNGhIaDcxOUI5dXk4QVhs?=
 =?utf-8?B?cHl1T2F6Sk1qSlFOSm1iQ0RSZWZkM25mOVFhWGVWLzlvdXhtSDVCc0RubThs?=
 =?utf-8?B?RzNyUWVmbzlDcHd0ZjYxWlFuZy85bFRiZUY5b2ZGZHVocmRaNXlnZEU3RUQz?=
 =?utf-8?B?UXhObVQxekZTaTNZTkhmK3RHQ2FuUVB6ajFJeVFZVHoxSk5reGRzcGRKS1dt?=
 =?utf-8?B?WHZGVWtjK2ZKb3dXcks0dVJ5OXhlSVNacit5ZEVhYkZsZklhVmlqbFEyL1Rz?=
 =?utf-8?B?eTFxd1ZJTC9zWnZ1akE1dDZkRFFjMTRvMmU0emRqK3YrYVB0QUp2TldLTE9w?=
 =?utf-8?B?ZzJuZUg1VytzQ0ZxKzdVNnJ2WS9CNVFKb3l3QWtmWlowQ1pIOWYzN05rZlN4?=
 =?utf-8?B?b3lhd1BNdzZPekxBbjcxMlB1Qk94cnl2OUc5Q1BIZm4vTE16MmJpb3o2NXhW?=
 =?utf-8?B?c2FsSFVGVTZRbkJuL3RVU0hSUFNSaGV4T2lQR0IrNlJtcmtqRVhhWVczVDNV?=
 =?utf-8?B?Qk5ENUdFc3BvRHdDem92Z1diZmZycHVoV1IvWnBVK2pNcTdIUnpDRUNpM3RL?=
 =?utf-8?B?eVhtUjR0bzJVQnZHN0VzaG1vd3Z3QXhyMGp4alVtUXJKZjdRVyt5SmVSUVRS?=
 =?utf-8?B?TTE2aVd1aWN4Y3ZEMTd6MXJEVXBkQmhvVVA3TkFSRXhQT3I4RXR0SjJ5eDRy?=
 =?utf-8?B?TUZjcDFMOEZYbGsvbGZIZDNQd1hQTkNCZGtkTDlhWWNRcUdVU1FITjBKbzFq?=
 =?utf-8?B?RmdvY0MybmVuMVdITWtCZGt0TFdXSXFBZXZsUGtkb3FqaVZPTTRnV1hjcG1O?=
 =?utf-8?B?VmVmamtGRFBzSjBQVFVwZFIveDdRRXdIS0I4TitsQmo4L0NqWldpa3VhSm9z?=
 =?utf-8?B?NFlNbDh0bEZVa2F4Uy9Kc2o1S203cWViTmtyR3JQOVJoc1E1a3pENXRkRHBh?=
 =?utf-8?B?eU1ZNjhZV1czQTdoaDdYNWV1NTBYNjVFalZUcG91ano3bjdTcjJDcHFBaTdC?=
 =?utf-8?B?M1BkM0JRc25taVlxeWF5eW92SUJzZUtaazFiUHQraEZhNkdvRDFMODNRRTlY?=
 =?utf-8?B?Q1FXVXY3Q3dZVDVSdm42d2ZoZG9ZZXZHdDR3ZEYvRnFMRjFiSWhJUzRleHB2?=
 =?utf-8?Q?IAKgnBQETQtSXm9sUYAYxFfhn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8206fe-32ef-4c5f-3889-08dbdfb2c4df
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:58:30.4771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvtZmy/PTpo0OW5ADLBRT8aYjaQ4WIB8LwQXwoTtipumrO3bKifzllA07EkozNPPMAWulXIzS79G182sBwlUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194
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
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-07 04:55, Pekka Paalanen wrote:
> On Mon, 6 Nov 2023 11:19:27 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-10-20 06:36, Pekka Paalanen wrote:
>>> On Thu, 19 Oct 2023 10:56:40 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> On 2023-10-10 12:13, Melissa Wen wrote:  
>>>>> O 09/08, Harry Wentland wrote:    
>>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>  
>>>
>>> ...
>>>   
>>>>> Also, with this new plane API in place, I understand that we will
>>>>> already need think on how to deal with the mixing between old drm color
>>>>> properties (color encoding and color range) and these new way of setting
>>>>> plane color properties. IIUC, Pekka asked a related question about it
>>>>> when talking about CRTC automatic RGB->YUV (?) 
>>>>>     
>>>>
>>>> We'll still need to confirm whether we'll want to deprecate these
>>>> existing properties. If we do that we'd want a client prop. Things
>>>> should still work without deprecating them, if drivers just pick up
>>>> after the initial encoding and range CSC.
>>>>
>>>> But realistically it might be better to deprecate them and turn them
>>>> into explicit colorops.  
>>>
>>> The existing properties would need to be explicitly reflected in the
>>> new pipelines anyway, otherwise there would always be doubt at which
>>> point of a pipeline the old properties apply, and they might even
>>> need to change positions between pipelines.
>>>
>>> I think it is simply easier to just hide all old color related
>>> properties when userspace sets the client-cap to enable pipelines. The
>>> problem is to make sure to hide all old properties on all drivers that
>>> support the client-cap.
>>>
>>> As a pipeline must be complete (describe everything that happens to
>>> pixel values), it's going to be a flag day per driver.
>>>
>>> Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeline
>>> as well. Maybe it's purely informative and non-configurable, keyed by
>>> FB pixel format, but still.
>>>
>>> We also need a colorop to represent sample filtering, e.g. bilinear,
>>> like I think Sebastian may have mentioned in the past. Everything
>>> before the sample filter happens "per tap" as Joshua Ashton put it, and
>>> everything after it happens on the sample that was computed as a
>>> weighted average of the filter tap inputs (texels).
>>>
>>> There could be colorops other than sample filtering that operate on
>>> more than one sample at a time, like blur or sharpness. There could
>>> even be colorops that change the image size like adding padding that
>>> the following colorop hardware requires, and then yet another colorop
>>> that clips that padding away. For an example, see
>>> https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.html
>>>
>>> If that padding and its color can affect the pipeline results of the
>>> pixels near the padding (e.g. some convolution is applied with them,
>>> which may be the reason why padding is necessary to begin with), then
>>> it would be best to model it.
>>>   
>>
>> I hear you but I'm also somewhat shying away from defining this at this point.
> 
> Would you define them before the new UAPI is released though?
> 
> I agree there is no need to have them in this patch series, but I think
> we'd hit the below problems if the UAPI is released without them.
> 
>> There are already too many things that need to happen and I will focus on the
>> actual color blocks (LUTs, matrices) first. We'll always be able to add a new
>> (read-only) colorop type to define scaling and tap behavior at any point and
>> a client is free to ignore a color pipeline if it doesn't find any tap/scale
>> info in it.
> 
> How would userspace know to look for tap/scale info, if there is no
> upstream definition even on paper?
> 

So far OSes did not care about this. Whether that's good or bad is
something everyone can answer for themselves.

If you write a compositor and really need this you can just ignore
color pipelines that don't have this, i.e., you'll probably want
to wait with implementing color pipeline support until you have what
you need from DRM/KMS.

This is not to say I don't want to have support for Weston. But I'm
wondering if we place too much importance on getting every little
thing figured out whereas we could be making forward progress and
address more aspects of a color pipeline in the future. There is a
reason gamescope has made a huge difference in driving the color
management work forward.

> And the opposite case, if someone writes userspace without tap/scale
> colorops, and then drivers add those, and there is no pipeline without
> them, because they always exist. Would that userspace disregard all
> those pipelines because it does not understand tap/scale colorops,
> leaving no usable pipelines? Would that not be kernel regressing
> userspace?
> 

The simple solution is to leave previously advertised pipelines
untouched and add a new version that does include scaling information.

> If the kernel keeps on exposing pipelines without the colorops, it
> fails the basic promise of the whole design: that all pixel value
> affecting operations are at least listed if not controllable.
> 
> How will we avoid painting ourselves in a corner?
> 
> Maybe we need a colorop for "here be dragons" documented as having
> unknown and unreliable effects, until driver authors are sure that
> everything has been modelled in the pipeline and there are no unknowns?
> Or a flag on the pipelines, if we can have that. Then we can at least
> tell when the pipeline does not fulfil the basic promise.
> 

The will always be dragons at some level.

Harry

> 
> Thanks,
> pq

