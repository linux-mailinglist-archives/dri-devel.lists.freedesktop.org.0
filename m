Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2ED294F47
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 16:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B736EDBB;
	Wed, 21 Oct 2020 14:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452B36EDBA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 14:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abgaB4oM7WtNwGxl2rRzRMaIza1ZAAjUneObqhRwQeX73Oum6CpUshQhdTOaOyjSboDKzfQoh5WJdbay3Rxq8LaexJhAMsrAS86vbMl0kEWReGXB293KM7OOKSquRFDBPDJ2YL3ZybETtllcuT2XI7/fT0888Rg/g+oNx4334ssc7eNeSxbf+NZOkV+cNL09oN+RkYtvfwqFBz3cyi9zNJSlmUO6v1mwH9RZUajt/gz3xTgZpJpAaoHYAvGpZHuRmmRRA64+6gXng6zriWyboZzjERcys+2JpmrOsEfavFekq4pR+WZ6tsfYt+I8DGH4A0rHi/B8NkznQpwNOTM79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2GHZSHleOhbVnaDpkwtA32C8G8qOk+Z5PagUl/J5BA=;
 b=aB3ng9SPxhEhdhlqcFs0JqeNlPz3W6+eUg2uNXvuXv9m4zvRzR7EFVaGYJHKLjsUD2lrrN9yhvwj+xQ9kjigQg8PJOhLbJsziNM2ckMsk65aiRlJT1gAkng7Ri40zYyP7WPZk57LpUKoT/HA8r8E+fwwiFMfXJf2lxIXwgwmi5POWk6B94DH9qt4eUXKFXvXpWIrux4NDY+pdhtWOif/v4Gzcdrcx3k84XELkmqeRXofab/R+HR4dF/SIF+k9p6BhKuk06Jx+tuRQoghlKIlhIlF7e+EM4boUKqhWEsodK3ecpvxtFQXExFX5Qh8i7Kyq/nj7mEobo/9l4/NIrG4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2GHZSHleOhbVnaDpkwtA32C8G8qOk+Z5PagUl/J5BA=;
 b=unGFzsuNYHTqvKAWmQNX5rfX1Rekn8O090kqrzIV2CmMCoVk4tW+0aUSskzH7eMNTbaFacmcxuESyyh+5dTT/kSl2EWEBQJ6fyXiK/lbJLtuR/xpC+3uPPJ1JMzBTTizh2oI7tE0Wwzc1+RkLlTnGC6VAVigGBSF73f0IZ3lHJM=
Authentication-Results: sebastianwick.net; dkim=none (message not signed)
 header.d=none;sebastianwick.net; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MWHPR12MB1695.namprd12.prod.outlook.com (2603:10b6:301:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 14:56:55 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::c489:ed80:4e2d:cf24]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::c489:ed80:4e2d:cf24%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 14:56:55 +0000
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com> <20201012101101.12c6bbb8@eldfell>
 <20201016135016.GO6112@intel.com> <20201019104948.5ae842c0@eldfell>
 <4f443474-6884-c480-6e72-60ed47ccc0de@amd.com>
 <20201020150443.GZ6112@intel.com>
 <bb6a9bfe-e85e-8db5-fa85-37436940ead6@amd.com>
 <20201021143500.GG6112@intel.com>
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <34dde4a6-a320-60a5-5856-80937ec6e87f@amd.com>
Date: Wed, 21 Oct 2020 10:56:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201021143500.GG6112@intel.com>
Content-Language: en-US
X-Originating-IP: [38.64.189.249]
X-ClientProxiedBy: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To MW2PR12MB2474.namprd12.prod.outlook.com
 (2603:10b6:907:9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.0.12] (38.64.189.249) by
 YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 14:56:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6d4a99a-d48a-4bbf-156d-08d875d18d13
X-MS-TrafficTypeDiagnostic: MWHPR12MB1695:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1695C78C8B958E25B6D3704C811C0@MWHPR12MB1695.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fMSrIM3nNKYA1g5RCWCO0BlXoNOchgxg1KofqoXNTtwJZnSwCyq98qa/IaHJ212enCzCmez9JFP76m2ooiXYGXKlZfpmz05j7Gj9lMwCvrnEbUluRjrmYMEMl5o5ujvhCWrtN1HE5RXzd0jpH/TSeqiYgA4DVFobB2a3ZrpIrJy/TvK56q6ywYFjHwsqTrw6KsTySkn8qiyjz5skCfuC+qafXIiVUHZUsbhqQSh2jB0vNPmz76b9VudelGnBwTrw61Iuf7qjppix8cUuAkE8TbPV3L0RNq4nnb7/DUotGJTmy79tqpeSlh6OXo2LVwcmEJPhN+Bs0Hq5j/sjm3Ps3e8JqjVXLXRa5yeTzgWpQ5E3G/O2y/nGgshC2BQ37iRT94+bGKT0DigjV1Iq+hWq0Tgf339gDPYnZyuUUH5zIww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(4001150100001)(478600001)(8676002)(86362001)(2906002)(44832011)(31686004)(6916009)(8936002)(31696002)(36756003)(2616005)(16526019)(33964004)(186003)(54906003)(53546011)(52116002)(66476007)(4326008)(6486002)(45080400002)(16576012)(83380400001)(26005)(166002)(66946007)(30864003)(66556008)(5660300002)(316002)(956004)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +bVvnMLhvcoP49KtXWd/lyy2atKsqkZseaB9hbRAed6P4OaPa9hWQ7adovTlSw+CJFmEMnY3qaI+elNJAgMS64t2JC31LaSZRLu3/BuNVb5GIe3yhOG15TiLwrdpjtT+Is5K323idHDBTUTi2R8JP7uuHhMkhrG6EVjFmg+ZFkAxy9of9ws3RfNhxc9x7PL5aKtkI1WT7FeXmkclIdcpyshEwaxR6CNx9DS7I/TmXS7hNR1exRuHKQE8DD5gNE0/2+aqDdzkrD2Mr2ghCelrTeECIB1dhtq8Gihkff59DQrl900+aKRRiqwoJgK+dugSIQ1iN3DpYhulQL6fn1M9c+Vd2zB6k2o5q2XFN4gLLEhyjJcvhYspDg0G1hAhlh6L1kJGZ4xYJd9FduuaNcCi6ICqv/seJxX+OHW1lmqsYvzTNeD26uCBkpfw5zW7f49SOvDgW0KV8cFkLrEXuFGHqJB3eqcXrpe4eDh8y3h9bjc63KJ3WtAhJ7vVJ/FSBlvV2faJI3Bkx0r1dbGRvL8HyDy1F8b9cJQTmfM6VJQrjY6SPVOeMOqWWedgEbPpsVSoYZ66ZMpy2fVKA5P8EGdM9UJS4hwaY9t3BcQGruDWx8VVZC7C8ShvB3ew4RzcX/XT+Brzl966hEMfAD8GLCk/+w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d4a99a-d48a-4bbf-156d-08d875d18d13
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 14:56:55.0326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAyagBb8WWCb8KPh64zZrX3pdiQYBNfdvxG8F0OZPW/Ka9+/y103Nq2ejfLcDdft9JnL2GMDDUAjUpx8AvjGcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1695
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
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1869579144=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1869579144==
Content-Type: multipart/alternative;
 boundary="------------B2DF926AC620BB8316876F75"
Content-Language: en-US

--------------B2DF926AC620BB8316876F75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2020-10-21 10:35 a.m., Ville Syrjälä wrote:
> On Tue, Oct 20, 2020 at 09:46:30PM -0400, Vitaly Prosyak wrote:
>> On 2020-10-20 11:04 a.m., Ville Syrjälä wrote:
>>> On Mon, Oct 19, 2020 at 11:08:27PM -0400, Vitaly Prosyak wrote:
>>>> On 2020-10-19 3:49 a.m., Pekka Paalanen wrote:
>>>>> On Fri, 16 Oct 2020 16:50:16 +0300
>>>>> Ville Syrjälä<ville.syrjala@linux.intel.com>   wrote:
>>>>>
>>>>>> On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
>>>>>>> On Fri, 9 Oct 2020 17:20:18 +0300
>>>>>>> Ville Syrjälä<ville.syrjala@linux.intel.com>   wrote:
>>> <snip>
>>>>>> There is a slight snag on some Intel platforms that the gamma LUT
>>>>>> is sitting after the CSC unit, and currently we use the CSC for
>>>>>> the range compression.
>>>> Thanks a lot for letting us to know about this!
>>>> AMD display pipe has always at the end CSC matrix where we apply appropriate range conversion if necessary.
>>>>
>>>>>> On glk in particular I*think*  we currently just do the wrong
>>>>>> thing do the range compression before gamma. The same probably
>>>>>> applies to hsw+ when both gamma and degamma are used at the same
>>>>>> time. But that is clearly buggy, and we should fix it to either:
>>>>>> a) return an error, which isn't super awesome since then you
>>>>>>       can't do gamma+limited range at the same time on glk, nor
>>>>>>       gamma+degamma+limited range on hsw+.
>>>>>> b) for the glk case we could use the hw degamma LUT for the
>>>>>>       gamma, which isn't great becasue the hw gamma and degamma
>>>>>>       LUTs are quite different beasts, and so the hw degamma LUT
>>>>>>       might not be able to do exactly what we need.
>>>> Do you mean that hw de-gamma LUT build on ROM ( it is not programmable, just select the proper bit)?
>>> No. The hw degamma LUT is a 1x33 linearly interpolated
>>> non-decreasing curve. So can't do directcolor type stuff,
>>> and each RGB channel must have the same gamma.
>>>
>>> The hw gamma LUT on the other hand can operate in multiple
>>> different modes, from which we currently choose the
>>> 3x1024 non-interpoated mode. Which can do all those
>>> things the degamma LUT can't do.
>>>
>>>>>> On hsw+ we do
>>>>>>       use this trick already to get the gamma+limited range right,
>>>>>>       but on these platforms the hw gamma and degamma LUTs have
>>>>>>       identical capabilities.
>>>>>> c) do the range compression with the hw gamma LUT instead, which
>>>>>>       of course means we have to combine the user gamma and range
>>>>>>       compression into the same gamma LUT.
>>>> Nice w/a and in amdgpu we are using also curve concatenations into re gamma LUT.
>>>>
>>>> The number of concatenations could be as many as need it and we may take advantage of this in user mode. Does this sounds preliminarily  good?
>>>>
>>>> Wouldn't the following sentence be interesting for you if the user mode generates 1D LUT points using X axis exponential distribution to avoid
>>>> unnecessary interpolation in kernel?  It may be especially important if curve concatenation is expected?
>>> Yeah, I think we want a new uapi for gamma stuff that will allow
>>> userspace to properly calculate things up front for different kinds
>>> of hw implementations, without the kernel having to interpolate/decimate.
>>> We've had some discussions/proposals on the list.
>>>
>>>>>> So I think c) is what it should be. Would just need to find the time
>>>>>> to implement it, and figure out how to not totally mess up our
>>>>>> driver's hw state checker. Hmm, except this won't help at all
>>>>>> with YCbCr output since we need to apply gamma before the
>>>>>> RGB->YCbCr conversion (which uses the same CSC again). Argh.
>>>>>> So YCbCr output would still need option b).
>>>>>>
>>>>>> Thankfully icl+ fixed all this by adding a dedicated output CSC
>>>>>> unit which sits after the gamma LUT in the pipeline. And pre-hsw
>>>>>> is almost fine as well since the hw has a dedicated fixed function
>>>>>> thing for the range compression. So the only snag on pre-hsw
>>>>>> is the YCbCr+degamma+gamma case.
>>>> Where is the display engine scaler is located on Intel platforms?
>>>> AMD old ASIC's have a display scaler after display color pipeline ,so the whole color processing can be a bit mess up unless integer scaling is in use.
>>>>
>>>> The new ASIC's ( ~5 years already)  have scaler before color pipeline.
>>> We have a somewhat similar situation.
>>>
>>> On older hw the scaler tap point is at the end of the pipe, so
>>> between the gamma LUT and dithering.
>>>
>>> On icl+ I think we have two tap points; one between degamma
>>> LUT and the first pipe CSC, and a second one between the output
>>> CSC and dithering. The spec calls these non-linear and linear tap
>>> points. The scaler also gained another linear vs. non-linear
>>> control knob which affects the precision at which it can operate
>>> in some form. There's also some other interaction between this and
>>> another knob ("HDR" mode) which controls the precision of blending
>>> in the pipe. I haven't yet thought how we should configure all this
>>> to the best effect. For the moment we leave these scaler settings
>>> to their defaults, which means using the non-linear tap point and
>>> non-linear precision setting. The blending precision we adjust
>>> dynamically depending on which planes are enabled. Only a subset
>>> of the planes (so called HDR planes) can be enabled when using the
>>> high precision blending mode.
>>>
>>> On icl+ plane scaling also has the two different tap points, but
>>> this time I think it just depdends on the type of plane used;
>>> HDR planes have a linear tap point just before blending, SDR
>>> planes have a non-linear tap point right after the pixels enter
>>> the plane's pipeline. Older hw again just had the non-linear
>>> tap point.
>> Thanks for the clarification Ville!
>>
>> I am not sure if i understood correctly tap points.
>>
>> Are you referring that you have full 2 scalers and each-one can do horizontal and vertical scaling?
>>
>> The first scaler does scaling in linear space and and the second in non linear. Is it correct?
> There are two scalers per pipe, each will do the full horz+vert scaling,
> and each one can be assigned to either:
> - any HDR plane linear tap point to scale the plane
> - any SDR plane non-linear tap point to scale the plane
> - pipe linear pipe tap point to scale the whole crtc output
> - pipe non-linear tap point to scale the whole crtc output
>
> I don't think you're supposed to assign scalers to both of
> the pipe tap points simultaneously. The registers might allow
> it though, so could be an interesting experiment :P
>   
>> I just found thread from Pekka :https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fwayland-devel%2F2020-October%2F041637.html&amp;data=04%7C01%7Cvitaly.prosyak%40amd.com%7C3f9bc0029f3f4302eedd08d875ce8004%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637388877054321803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=yfBke%2BWwsh8P0i37qAkGNRjyUUKFC4mD%2BXJ5gqyFEM0%3D&amp;reserved=0
>>
>> regarding integer scaling and other related stuff.
>>
>> AMD display engine has always 1 scaler, we do concatenation of two or more scaling transforms into one if it is necessary.
>>
>> Old ASIC's do scaling in nonlinear space, new ASIC's in linear space since scaler precision is half float.
>>
>> All these questions are become important for hardware composition and if the differences are too big( not sure about this) and it can't be abstracted.
>>
>> As one approach , can we think about shared object in user mode for each vendor ( this approach was in android for hardware composition) and this small component can do
>>
>> LUT's , scaler coefficients content and other not compatible stuff ) ?
> The idea has come up before. Getting any kind of acceptance for such a
> thing across the various userspace components would probably require
> a full time lobbyist.

That's for sure.

>
> I think various forms of gamma and CSC should be possible to abstract
> in a somewhat reasonable way. For scaling we're now moving ahead with
> the enum prop to specify the filter. If there was a real need we could
> even try to abstract some kind of filter coefficients uapi as well.
> I suspect most things would have some kind of polyphase FIR filter.

Yes, AMD display pipe has a polyphase scaler.
Thanks for sharing ideas .

> -- Ville Syrjälä Intel

vitaly


--------------B2DF926AC620BB8316876F75
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPHA+PGJyPgog
ICAgPC9wPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyMDIwLTEwLTIxIDEw
OjM1IGEubS4sIFZpbGxlIFN5cmrDpGzDpAogICAgICB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDoyMDIwMTAyMTE0MzUwMC5HRzYxMTJA
aW50ZWwuY29tIj4KICAgICAgPGRpdiBjbGFzcz0ibW96LXRleHQtcGxhaW4iIHdyYXA9InRydWUi
IGdyYXBoaWNhbC1xdW90ZT0idHJ1ZSIgc3R5bGU9ImZvbnQtZmFtaWx5OiAtbW96LWZpeGVkOyBm
b250LXNpemU6IDEycHg7IiBsYW5nPSJ4LXdlc3Rlcm4iPgogICAgICAgIDxwcmUgY2xhc3M9Im1v
ei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gVHVlLCBPY3QgMjAsIDIwMjAgYXQgMDk6NDY6MzBQTSAt
MDQwMCwgVml0YWx5IFByb3N5YWsgd3JvdGU6CjwvcHJlPgogICAgICAgIDxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPgogICAgICAgICAgPHByZSBjbGFzcz0i
bW96LXF1b3RlLXByZSIgd3JhcD0iIj5PbiAyMDIwLTEwLTIwIDExOjA0IGEubS4sIFZpbGxlIFN5
cmrDpGzDpCB3cm90ZToKPC9wcmU+CiAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBz
dHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4KICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj5PbiBNb24sIE9jdCAxOSwgMjAyMCBhdCAxMTowODoyN1BNIC0wNDAwLCBW
aXRhbHkgUHJvc3lhayB3cm90ZToKPC9wcmU+CiAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPgogICAgICAgICAgICAgIDxwcmUgY2xhc3M9
Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gMjAyMC0xMC0xOSAzOjQ5IGEubS4sIFBla2thIFBh
YWxhbmVuIHdyb3RlOgo8L3ByZT4KICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4KICAgICAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1v
ei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gRnJpLCAxNiBPY3QgMjAyMCAxNjo1MDoxNiArMDMwMApW
aWxsZSBTeXJqw6Rsw6Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20iIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+
Jmx0O3ZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tJmd0OzwvYT4gIHdyb3RlOgoKPC9wcmU+
CiAgICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6ICMw
MDAwMDA7Ij4KICAgICAgICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3Jh
cD0iIj5PbiBNb24sIE9jdCAxMiwgMjAyMCBhdCAxMDoxMTowMUFNICswMzAwLCBQZWtrYSBQYWFs
YW5lbiB3cm90ZToKPC9wcmU+CiAgICAgICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPgogICAgICAgICAgICAgICAgICAgIDxwcmUgY2xh
c3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gRnJpLCA5IE9jdCAyMDIwIDE3OjIwOjE4ICsw
MzAwClZpbGxlIFN5cmrDpGzDpDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzp2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbSIgbW96LWRvLW5vdC1zZW5kPSJ0
cnVlIj4mbHQ7dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20mZ3Q7PC9hPiAgd3JvdGU6Cjwv
cHJlPgogICAgICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgICA8L2Js
b2NrcXVvdGU+CiAgICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgICA8L2Jsb2Nr
cXVvdGU+CiAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+Jmx0
O3NuaXAmZ3Q7CjwvcHJlPgogICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHls
ZT0iY29sb3I6ICMwMDAwMDA7Ij4KICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4KICAgICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPgogICAgICAgICAgICAgICAgICA8cHJl
IGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlRoZXJlIGlzIGEgc2xpZ2h0IHNuYWcgb24g
c29tZSBJbnRlbCBwbGF0Zm9ybXMgdGhhdCB0aGUgZ2FtbWEgTFVUCmlzIHNpdHRpbmcgYWZ0ZXIg
dGhlIENTQyB1bml0LCBhbmQgY3VycmVudGx5IHdlIHVzZSB0aGUgQ1NDIGZvcgp0aGUgcmFuZ2Ug
Y29tcHJlc3Npb24uCjwvcHJlPgogICAgICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAg
ICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUt
cHJlIiB3cmFwPSIiPlRoYW5rcyBhIGxvdCBmb3IgbGV0dGluZyB1cyB0byBrbm93IGFib3V0IHRo
aXMhCkFNRCBkaXNwbGF5IHBpcGUgaGFzIGFsd2F5cyBhdCB0aGUgZW5kIENTQyBtYXRyaXggd2hl
cmUgd2UgYXBwbHkgYXBwcm9wcmlhdGUgcmFuZ2UgY29udmVyc2lvbiBpZiBuZWNlc3NhcnkuCgo8
L3ByZT4KICAgICAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6
ICMwMDAwMDA7Ij4KICAgICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxl
PSJjb2xvcjogIzAwMDAwMDsiPgogICAgICAgICAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPk9uIGdsayBpbiBwYXJ0aWN1bGFyIEkqdGhpbmsqICB3ZSBjdXJyZW50
bHkganVzdCBkbyB0aGUgd3JvbmcKdGhpbmcgZG8gdGhlIHJhbmdlIGNvbXByZXNzaW9uIGJlZm9y
ZSBnYW1tYS4gVGhlIHNhbWUgcHJvYmFibHkKYXBwbGllcyB0byBoc3crIHdoZW4gYm90aCBnYW1t
YSBhbmQgZGVnYW1tYSBhcmUgdXNlZCBhdCB0aGUgc2FtZQp0aW1lLiBCdXQgdGhhdCBpcyBjbGVh
cmx5IGJ1Z2d5LCBhbmQgd2Ugc2hvdWxkIGZpeCBpdCB0byBlaXRoZXI6CmEpIHJldHVybiBhbiBl
cnJvciwgd2hpY2ggaXNuJ3Qgc3VwZXIgYXdlc29tZSBzaW5jZSB0aGVuIHlvdQogICAgIGNhbid0
IGRvIGdhbW1hK2xpbWl0ZWQgcmFuZ2UgYXQgdGhlIHNhbWUgdGltZSBvbiBnbGssIG5vcgogICAg
IGdhbW1hK2RlZ2FtbWErbGltaXRlZCByYW5nZSBvbiBoc3crLgpiKSBmb3IgdGhlIGdsayBjYXNl
IHdlIGNvdWxkIHVzZSB0aGUgaHcgZGVnYW1tYSBMVVQgZm9yIHRoZQogICAgIGdhbW1hLCB3aGlj
aCBpc24ndCBncmVhdCBiZWNhc3VlIHRoZSBodyBnYW1tYSBhbmQgZGVnYW1tYQogICAgIExVVHMg
YXJlIHF1aXRlIGRpZmZlcmVudCBiZWFzdHMsIGFuZCBzbyB0aGUgaHcgZGVnYW1tYSBMVVQKICAg
ICBtaWdodCBub3QgYmUgYWJsZSB0byBkbyBleGFjdGx5IHdoYXQgd2UgbmVlZC4KPC9wcmU+CiAg
ICAgICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgog
ICAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+RG8geW91IG1l
YW4gdGhhdCBodyBkZS1nYW1tYSBMVVQgYnVpbGQgb24gUk9NICggaXQgaXMgbm90IHByb2dyYW1t
YWJsZSwganVzdCBzZWxlY3QgdGhlIHByb3BlciBiaXQpPwo8L3ByZT4KICAgICAgICAgICAgPC9i
bG9ja3F1b3RlPgogICAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
Pk5vLiBUaGUgaHcgZGVnYW1tYSBMVVQgaXMgYSAxeDMzIGxpbmVhcmx5IGludGVycG9sYXRlZApu
b24tZGVjcmVhc2luZyBjdXJ2ZS4gU28gY2FuJ3QgZG8gZGlyZWN0Y29sb3IgdHlwZSBzdHVmZiwK
YW5kIGVhY2ggUkdCIGNoYW5uZWwgbXVzdCBoYXZlIHRoZSBzYW1lIGdhbW1hLgoKVGhlIGh3IGdh
bW1hIExVVCBvbiB0aGUgb3RoZXIgaGFuZCBjYW4gb3BlcmF0ZSBpbiBtdWx0aXBsZQpkaWZmZXJl
bnQgbW9kZXMsIGZyb20gd2hpY2ggd2UgY3VycmVudGx5IGNob29zZSB0aGUKM3gxMDI0IG5vbi1p
bnRlcnBvYXRlZCBtb2RlLiBXaGljaCBjYW4gZG8gYWxsIHRob3NlCnRoaW5ncyB0aGUgZGVnYW1t
YSBMVVQgY2FuJ3QgZG8uCgo8L3ByZT4KICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSIgc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+CiAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSIgc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+CiAgICAgICAgICAgICAgICA8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4KICAgICAgICAgICAgICAg
ICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5PbiBoc3crIHdlIGRvCiAgICAg
dXNlIHRoaXMgdHJpY2sgYWxyZWFkeSB0byBnZXQgdGhlIGdhbW1hK2xpbWl0ZWQgcmFuZ2Ugcmln
aHQsCiAgICAgYnV0IG9uIHRoZXNlIHBsYXRmb3JtcyB0aGUgaHcgZ2FtbWEgYW5kIGRlZ2FtbWEg
TFVUcyBoYXZlCiAgICAgaWRlbnRpY2FsIGNhcGFiaWxpdGllcy4KYykgZG8gdGhlIHJhbmdlIGNv
bXByZXNzaW9uIHdpdGggdGhlIGh3IGdhbW1hIExVVCBpbnN0ZWFkLCB3aGljaAogICAgIG9mIGNv
dXJzZSBtZWFucyB3ZSBoYXZlIHRvIGNvbWJpbmUgdGhlIHVzZXIgZ2FtbWEgYW5kIHJhbmdlCiAg
ICAgY29tcHJlc3Npb24gaW50byB0aGUgc2FtZSBnYW1tYSBMVVQuCjwvcHJlPgogICAgICAgICAg
ICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAg
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk5pY2Ugdy9hIGFuZCBpbiBh
bWRncHUgd2UgYXJlIHVzaW5nIGFsc28gY3VydmUgY29uY2F0ZW5hdGlvbnMgaW50byByZSBnYW1t
YSBMVVQuCgpUaGUgbnVtYmVyIG9mIGNvbmNhdGVuYXRpb25zIGNvdWxkIGJlIGFzIG1hbnkgYXMg
bmVlZCBpdCBhbmQgd2UgbWF5IHRha2UgYWR2YW50YWdlIG9mIHRoaXMgaW4gdXNlciBtb2RlLiBE
b2VzIHRoaXMgc291bmRzIHByZWxpbWluYXJpbHkgIGdvb2Q/CgpXb3VsZG4ndCB0aGUgZm9sbG93
aW5nIHNlbnRlbmNlIGJlIGludGVyZXN0aW5nIGZvciB5b3UgaWYgdGhlIHVzZXIgbW9kZSBnZW5l
cmF0ZXMgMUQgTFVUIHBvaW50cyB1c2luZyBYIGF4aXMgZXhwb25lbnRpYWwgZGlzdHJpYnV0aW9u
IHRvIGF2b2lkCnVubmVjZXNzYXJ5IGludGVycG9sYXRpb24gaW4ga2VybmVsPyAgSXQgbWF5IGJl
IGVzcGVjaWFsbHkgaW1wb3J0YW50IGlmIGN1cnZlIGNvbmNhdGVuYXRpb24gaXMgZXhwZWN0ZWQ/
CjwvcHJlPgogICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgIDxwcmUgY2xhc3M9
Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+WWVhaCwgSSB0aGluayB3ZSB3YW50IGEgbmV3IHVhcGkg
Zm9yIGdhbW1hIHN0dWZmIHRoYXQgd2lsbCBhbGxvdwp1c2Vyc3BhY2UgdG8gcHJvcGVybHkgY2Fs
Y3VsYXRlIHRoaW5ncyB1cCBmcm9udCBmb3IgZGlmZmVyZW50IGtpbmRzCm9mIGh3IGltcGxlbWVu
dGF0aW9ucywgd2l0aG91dCB0aGUga2VybmVsIGhhdmluZyB0byBpbnRlcnBvbGF0ZS9kZWNpbWF0
ZS4KV2UndmUgaGFkIHNvbWUgZGlzY3Vzc2lvbnMvcHJvcG9zYWxzIG9uIHRoZSBsaXN0LgoKPC9w
cmU+CiAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJjb2xvcjogIzAw
MDAwMDsiPgogICAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJjb2xv
cjogIzAwMDAwMDsiPgogICAgICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5
bGU9ImNvbG9yOiAjMDAwMDAwOyI+CiAgICAgICAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+U28gSSB0aGluayBjKSBpcyB3aGF0IGl0IHNob3VsZCBiZS4gV291
bGQganVzdCBuZWVkIHRvIGZpbmQgdGhlIHRpbWUKdG8gaW1wbGVtZW50IGl0LCBhbmQgZmlndXJl
IG91dCBob3cgdG8gbm90IHRvdGFsbHkgbWVzcyB1cCBvdXIKZHJpdmVyJ3MgaHcgc3RhdGUgY2hl
Y2tlci4gSG1tLCBleGNlcHQgdGhpcyB3b24ndCBoZWxwIGF0IGFsbAp3aXRoIFlDYkNyIG91dHB1
dCBzaW5jZSB3ZSBuZWVkIHRvIGFwcGx5IGdhbW1hIGJlZm9yZSB0aGUKUkdCLSZndDtZQ2JDciBj
b252ZXJzaW9uICh3aGljaCB1c2VzIHRoZSBzYW1lIENTQyBhZ2FpbikuIEFyZ2guClNvIFlDYkNy
IG91dHB1dCB3b3VsZCBzdGlsbCBuZWVkIG9wdGlvbiBiKS4KClRoYW5rZnVsbHkgaWNsKyBmaXhl
ZCBhbGwgdGhpcyBieSBhZGRpbmcgYSBkZWRpY2F0ZWQgb3V0cHV0IENTQwp1bml0IHdoaWNoIHNp
dHMgYWZ0ZXIgdGhlIGdhbW1hIExVVCBpbiB0aGUgcGlwZWxpbmUuIEFuZCBwcmUtaHN3CmlzIGFs
bW9zdCBmaW5lIGFzIHdlbGwgc2luY2UgdGhlIGh3IGhhcyBhIGRlZGljYXRlZCBmaXhlZCBmdW5j
dGlvbgp0aGluZyBmb3IgdGhlIHJhbmdlIGNvbXByZXNzaW9uLiBTbyB0aGUgb25seSBzbmFnIG9u
IHByZS1oc3cKaXMgdGhlIFlDYkNyK2RlZ2FtbWErZ2FtbWEgY2FzZS4KPC9wcmU+CiAgICAgICAg
ICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAg
ICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+V2hlcmUgaXMgdGhlIGRp
c3BsYXkgZW5naW5lIHNjYWxlciBpcyBsb2NhdGVkIG9uIEludGVsIHBsYXRmb3Jtcz8KQU1EIG9s
ZCBBU0lDJ3MgaGF2ZSBhIGRpc3BsYXkgc2NhbGVyIGFmdGVyIGRpc3BsYXkgY29sb3IgcGlwZWxp
bmUgLHNvIHRoZSB3aG9sZSBjb2xvciBwcm9jZXNzaW5nIGNhbiBiZSBhIGJpdCBtZXNzIHVwIHVu
bGVzcyBpbnRlZ2VyIHNjYWxpbmcgaXMgaW4gdXNlLgoKVGhlIG5ldyBBU0lDJ3MgKCB+NSB5ZWFy
cyBhbHJlYWR5KSZuYnNwOyBoYXZlIHNjYWxlciBiZWZvcmUgY29sb3IgcGlwZWxpbmUuCjwvcHJl
PgogICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+V2UgaGF2ZSBhIHNvbWV3aGF0IHNpbWlsYXIgc2l0dWF0aW9uLgoK
T24gb2xkZXIgaHcgdGhlIHNjYWxlciB0YXAgcG9pbnQgaXMgYXQgdGhlIGVuZCBvZiB0aGUgcGlw
ZSwgc28KYmV0d2VlbiB0aGUgZ2FtbWEgTFVUIGFuZCBkaXRoZXJpbmcuCgpPbiBpY2wrIEkgdGhp
bmsgd2UgaGF2ZSB0d28gdGFwIHBvaW50czsgb25lIGJldHdlZW4gZGVnYW1tYQpMVVQgYW5kIHRo
ZSBmaXJzdCBwaXBlIENTQywgYW5kIGEgc2Vjb25kIG9uZSBiZXR3ZWVuIHRoZSBvdXRwdXQKQ1ND
IGFuZCBkaXRoZXJpbmcuIFRoZSBzcGVjIGNhbGxzIHRoZXNlIG5vbi1saW5lYXIgYW5kIGxpbmVh
ciB0YXAKcG9pbnRzLiBUaGUgc2NhbGVyIGFsc28gZ2FpbmVkIGFub3RoZXIgbGluZWFyIHZzLiBu
b24tbGluZWFyCmNvbnRyb2wga25vYiB3aGljaCBhZmZlY3RzIHRoZSBwcmVjaXNpb24gYXQgd2hp
Y2ggaXQgY2FuIG9wZXJhdGUKaW4gc29tZSBmb3JtLiBUaGVyZSdzIGFsc28gc29tZSBvdGhlciBp
bnRlcmFjdGlvbiBiZXR3ZWVuIHRoaXMgYW5kCmFub3RoZXIga25vYiAoJnF1b3Q7SERSJnF1b3Q7
IG1vZGUpIHdoaWNoIGNvbnRyb2xzIHRoZSBwcmVjaXNpb24gb2YgYmxlbmRpbmcKaW4gdGhlIHBp
cGUuIEkgaGF2ZW4ndCB5ZXQgdGhvdWdodCBob3cgd2Ugc2hvdWxkIGNvbmZpZ3VyZSBhbGwgdGhp
cwp0byB0aGUgYmVzdCBlZmZlY3QuIEZvciB0aGUgbW9tZW50IHdlIGxlYXZlIHRoZXNlIHNjYWxl
ciBzZXR0aW5ncwp0byB0aGVpciBkZWZhdWx0cywgd2hpY2ggbWVhbnMgdXNpbmcgdGhlIG5vbi1s
aW5lYXIgdGFwIHBvaW50IGFuZApub24tbGluZWFyIHByZWNpc2lvbiBzZXR0aW5nLiBUaGUgYmxl
bmRpbmcgcHJlY2lzaW9uIHdlIGFkanVzdApkeW5hbWljYWxseSBkZXBlbmRpbmcgb24gd2hpY2gg
cGxhbmVzIGFyZSBlbmFibGVkLiBPbmx5IGEgc3Vic2V0Cm9mIHRoZSBwbGFuZXMgKHNvIGNhbGxl
ZCBIRFIgcGxhbmVzKSBjYW4gYmUgZW5hYmxlZCB3aGVuIHVzaW5nIHRoZQpoaWdoIHByZWNpc2lv
biBibGVuZGluZyBtb2RlLgoKT24gaWNsKyBwbGFuZSBzY2FsaW5nIGFsc28gaGFzIHRoZSB0d28g
ZGlmZmVyZW50IHRhcCBwb2ludHMsIGJ1dAp0aGlzIHRpbWUgSSB0aGluayBpdCBqdXN0IGRlcGRl
bmRzIG9uIHRoZSB0eXBlIG9mIHBsYW5lIHVzZWQ7CkhEUiBwbGFuZXMgaGF2ZSBhIGxpbmVhciB0
YXAgcG9pbnQganVzdCBiZWZvcmUgYmxlbmRpbmcsIFNEUgpwbGFuZXMgaGF2ZSBhIG5vbi1saW5l
YXIgdGFwIHBvaW50IHJpZ2h0IGFmdGVyIHRoZSBwaXhlbHMgZW50ZXIKdGhlIHBsYW5lJ3MgcGlw
ZWxpbmUuIE9sZGVyIGh3IGFnYWluIGp1c3QgaGFkIHRoZSBub24tbGluZWFyCnRhcCBwb2ludC4K
PC9wcmU+CiAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3ot
cXVvdGUtcHJlIiB3cmFwPSIiPlRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24gVmlsbGUhCgpJ
IGFtIG5vdCBzdXJlIGlmIGkgdW5kZXJzdG9vZCBjb3JyZWN0bHkgdGFwIHBvaW50cy4KCkFyZSB5
b3UgcmVmZXJyaW5nIHRoYXQgeW91IGhhdmUgZnVsbCAyIHNjYWxlcnMgYW5kIGVhY2gtb25lIGNh
biBkbyBob3Jpem9udGFsIGFuZCB2ZXJ0aWNhbCBzY2FsaW5nPwoKVGhlIGZpcnN0IHNjYWxlciBk
b2VzIHNjYWxpbmcgaW4gbGluZWFyIHNwYWNlIGFuZCBhbmQgdGhlIHNlY29uZCBpbiBub24gbGlu
ZWFyLiBJcyBpdCBjb3JyZWN0Pwo8L3ByZT4KICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAg
PHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5UaGVyZSBhcmUgdHdvIHNjYWxlcnMg
cGVyIHBpcGUsIGVhY2ggd2lsbCBkbyB0aGUgZnVsbCBob3J6K3ZlcnQgc2NhbGluZywKYW5kIGVh
Y2ggb25lIGNhbiBiZSBhc3NpZ25lZCB0byBlaXRoZXI6Ci0gYW55IEhEUiBwbGFuZSBsaW5lYXIg
dGFwIHBvaW50IHRvIHNjYWxlIHRoZSBwbGFuZQotIGFueSBTRFIgcGxhbmUgbm9uLWxpbmVhciB0
YXAgcG9pbnQgdG8gc2NhbGUgdGhlIHBsYW5lCi0gcGlwZSBsaW5lYXIgcGlwZSB0YXAgcG9pbnQg
dG8gc2NhbGUgdGhlIHdob2xlIGNydGMgb3V0cHV0Ci0gcGlwZSBub24tbGluZWFyIHRhcCBwb2lu
dCB0byBzY2FsZSB0aGUgd2hvbGUgY3J0YyBvdXRwdXQKCkkgZG9uJ3QgdGhpbmsgeW91J3JlIHN1
cHBvc2VkIHRvIGFzc2lnbiBzY2FsZXJzIHRvIGJvdGggb2YKdGhlIHBpcGUgdGFwIHBvaW50cyBz
aW11bHRhbmVvdXNseS4gVGhlIHJlZ2lzdGVycyBtaWdodCBhbGxvdwppdCB0aG91Z2gsIHNvIGNv
dWxkIGJlIGFuIGludGVyZXN0aW5nIGV4cGVyaW1lbnQgOlAKIAo8L3ByZT4KICAgICAgICA8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4KICAgICAgICAgIDxw
cmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+SSBqdXN0IGZvdW5kIHRocmVhZCBmcm9t
IFBla2thIDo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL25h
bTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZs
aXN0cy5mcmVlZGVza3RvcC5vcmclMkZhcmNoaXZlcyUyRndheWxhbmQtZGV2ZWwlMkYyMDIwLU9j
dG9iZXIlMkYwNDE2MzcuaHRtbCZhbXA7YW1wO2RhdGE9MDQlN0MwMSU3Q3ZpdGFseS5wcm9zeWFr
JTQwYW1kLmNvbSU3QzNmOWJjMDAyOWYzZjQzMDJlZWRkMDhkODc1Y2U4MDA0JTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM4ODg3NzA1NDMyMTgwMyU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDthbXA7c2RhdGE9eWZCa2Ul
MkJXd3NoOFAwaTM3cUFrR05SanlVVUtGQzRtRCUyQlhKNWdxeUZFTTAlM0QmYW1wO2FtcDtyZXNl
cnZlZD0wIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyUyRmFyY2hpdmVzJTJGd2F5bGFuZC1kZXZlbCUyRjIwMjAtT2N0b2JlciUyRjA0MTYzNy5o
dG1sJmFtcDthbXA7ZGF0YT0wNCU3QzAxJTdDdml0YWx5LnByb3N5YWslNDBhbWQuY29tJTdDM2Y5
YmMwMDI5ZjNmNDMwMmVlZGQwOGQ4NzVjZTgwMDQlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3Mzg4ODc3MDU0MzIxODAzJTdDVW5rbm93biU3Q1RXRnBiR1pz
YjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO2FtcDtzZGF0YT15ZkJrZSUyQld3c2g4UDBpMzdxQWtH
TlJqeVVVS0ZDNG1EJTJCWEo1Z3F5RkVNMCUzRCZhbXA7YW1wO3Jlc2VydmVkPTA8L2E+CgpyZWdh
cmRpbmcgaW50ZWdlciBzY2FsaW5nIGFuZCBvdGhlciByZWxhdGVkIHN0dWZmLgoKQU1EIGRpc3Bs
YXkgZW5naW5lIGhhcyBhbHdheXMgMSBzY2FsZXIsIHdlIGRvIGNvbmNhdGVuYXRpb24gb2YgdHdv
IG9yIG1vcmUgc2NhbGluZyB0cmFuc2Zvcm1zIGludG8gb25lIGlmIGl0IGlzIG5lY2Vzc2FyeS4K
Ck9sZCBBU0lDJ3MgZG8gc2NhbGluZyBpbiBub25saW5lYXIgc3BhY2UsIG5ldyBBU0lDJ3MgaW4g
bGluZWFyIHNwYWNlIHNpbmNlIHNjYWxlciBwcmVjaXNpb24gaXMgaGFsZiBmbG9hdC4KCkFsbCB0
aGVzZSBxdWVzdGlvbnMgYXJlIGJlY29tZSBpbXBvcnRhbnQgZm9yIGhhcmR3YXJlIGNvbXBvc2l0
aW9uIGFuZCBpZiB0aGUgZGlmZmVyZW5jZXMgYXJlIHRvbyBiaWcoIG5vdCBzdXJlIGFib3V0IHRo
aXMpIGFuZCBpdCBjYW4ndCBiZSBhYnN0cmFjdGVkLgoKQXMgb25lIGFwcHJvYWNoICwgY2FuIHdl
IHRoaW5rIGFib3V0IHNoYXJlZCBvYmplY3QgaW4gdXNlciBtb2RlIGZvciBlYWNoIHZlbmRvciAo
IHRoaXMgYXBwcm9hY2ggd2FzIGluIGFuZHJvaWQgZm9yIGhhcmR3YXJlIGNvbXBvc2l0aW9uKSBh
bmQgdGhpcyBzbWFsbCBjb21wb25lbnQgY2FuIGRvCgpMVVQncyAsIHNjYWxlciBjb2VmZmljaWVu
dHMgY29udGVudCBhbmQgb3RoZXIgbm90IGNvbXBhdGlibGUgc3R1ZmYgKSA/CjwvcHJlPgogICAg
ICAgIDwvYmxvY2txdW90ZT4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFw
PSIiPlRoZSBpZGVhIGhhcyBjb21lIHVwIGJlZm9yZS4gR2V0dGluZyBhbnkga2luZCBvZiBhY2Nl
cHRhbmNlIGZvciBzdWNoIGEKdGhpbmcgYWNyb3NzIHRoZSB2YXJpb3VzIHVzZXJzcGFjZSBjb21w
b25lbnRzIHdvdWxkIHByb2JhYmx5IHJlcXVpcmUKYSBmdWxsIHRpbWUgbG9iYnlpc3QuPC9wcmU+
CiAgICAgIDwvZGl2PgogICAgPC9ibG9ja3F1b3RlPgogICAgPHByZT5UaGF0J3MgZm9yIHN1cmUu
Cgo8L3ByZT4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDoyMDIwMTAyMTE0
MzUwMC5HRzYxMTJAaW50ZWwuY29tIj4KICAgICAgPGRpdiBjbGFzcz0ibW96LXRleHQtcGxhaW4i
IHdyYXA9InRydWUiIGdyYXBoaWNhbC1xdW90ZT0idHJ1ZSIgc3R5bGU9ImZvbnQtZmFtaWx5OiAt
bW96LWZpeGVkOyBmb250LXNpemU6IDEycHg7IiBsYW5nPSJ4LXdlc3Rlcm4iPgogICAgICAgIDxw
cmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CgpJIHRoaW5rIHZhcmlvdXMgZm9ybXMg
b2YgZ2FtbWEgYW5kIENTQyBzaG91bGQgYmUgcG9zc2libGUgdG8gYWJzdHJhY3QKaW4gYSBzb21l
d2hhdCByZWFzb25hYmxlIHdheS4gRm9yIHNjYWxpbmcgd2UncmUgbm93IG1vdmluZyBhaGVhZCB3
aXRoCnRoZSBlbnVtIHByb3AgdG8gc3BlY2lmeSB0aGUgZmlsdGVyLiBJZiB0aGVyZSB3YXMgYSBy
ZWFsIG5lZWQgd2UgY291bGQKZXZlbiB0cnkgdG8gYWJzdHJhY3Qgc29tZSBraW5kIG9mIGZpbHRl
ciBjb2VmZmljaWVudHMgdWFwaSBhcyB3ZWxsLgpJIHN1c3BlY3QgbW9zdCB0aGluZ3Mgd291bGQg
aGF2ZSBzb21lIGtpbmQgb2YgcG9seXBoYXNlIEZJUiBmaWx0ZXIuCjwvcHJlPgogICAgICA8L2Rp
dj4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwcmU+WWVzLCBBTUQgZGlzcGxheSBwaXBlIGhhcyBh
IHBvbHlwaGFzZSBzY2FsZXIuClRoYW5rcyBmb3Igc2hhcmluZyBpZGVhcyAuCjwvcHJlPgogICAg
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOjIwMjAxMDIxMTQzNTAwLkdHNjExMkBp
bnRlbC5jb20iPgogICAgICA8ZGl2IGNsYXNzPSJtb3otdGV4dC1wbGFpbiIgd3JhcD0idHJ1ZSIg
Z3JhcGhpY2FsLXF1b3RlPSJ0cnVlIiBzdHlsZT0iZm9udC1mYW1pbHk6IC1tb3otZml4ZWQ7IGZv
bnQtc2l6ZTogMTJweDsiIGxhbmc9Ingtd2VzdGVybiI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96
LXF1b3RlLXByZSIgd3JhcD0iIj4KPGRpdiBjbGFzcz0ibW96LXR4dC1zaWciPi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKPC9kaXY+PC9wcmU+CiAgICAgIDwvZGl2PgogICAgPC9ibG9ja3F1b3Rl
PgogICAgPHByZT52aXRhbHk8L3ByZT4KICA8L2JvZHk+CjwvaHRtbD4K

--------------B2DF926AC620BB8316876F75--

--===============1869579144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1869579144==--
