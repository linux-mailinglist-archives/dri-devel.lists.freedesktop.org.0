Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5563387B29
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D905A6EB94;
	Tue, 18 May 2021 14:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2D06EB94;
 Tue, 18 May 2021 14:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRnJ22fdQihRuAqHoqwEf+0t+wwnQVEmOtBGNeF6HUW0kNYmcdQ8irrOCrpmZQEWecvAoUd/m0AR9vcEaFchK5ucjioQk/yuQq9jrsO2fmmqmeHMZwoNCobqet0hdOISuolKxy1Umyc6xdSA1rXiWUw1uTYIkNhUNton37EMCEbnBuKbrZlHBPJMVbYxm+K6nYG+Ki5BZOgPLNpb3Q9udkWebYdp/dMn+/6I+Kg17Tnmmwy27eef4qNS6V9e2lFR8Uha8sbdP7EBa0cvGPKjNT6VpmMU3QPbMP7h+desFKUCmRSV8ZJsrzbUP+5NIsESdn2G8epjbYQRU75FuWL7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlhj2AnwjZ/4QHbPTaOmqr5gEStmNeHnV3W17XE95BU=;
 b=nqGyh+KOWMSL4tsNVxcjTueust5QW7cB2voQXErwIg9XFwcYCG8ArngZyEAaGmADtDNLPLfKIb82VggHtnYeXK5jh0IrutOyhFr+nXhDdBqGoSJTB0ipii8WeTh9nDhnxAy09cc/BT6Tnk6KFhdc8C7+IwFKcWRV+z76hTXQohMt6jWDeA1isFgOlXOtW1cqJBNgIn5pr3Ga6l8xBbAJi7g2dkqFRY8TzXAGD27T+m/ea1Tqhnfhj8hbizJx/EOgMGebrDW4anpcQFAveaxWdfRZVkdLyzSVe02WH5z8H+32eOe15tgQaaG9yTe/vQ8I1+9ALhYFTOj1HIMwsapz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlhj2AnwjZ/4QHbPTaOmqr5gEStmNeHnV3W17XE95BU=;
 b=EybbzeczqljrogeRf/AwTk4nN03ihD1koKMwCHHyiava3JzcmFagqkhYecLBy358VARCGtipf/ITte3yWbUYZogE6txnV0S/LAn8Nk15ystaNLQuM41iO8ByDN4zidizjMSSu91DNfaFgmvhalwwoqtOXTFQeBIfBdV1hSiAChs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1358.namprd12.prod.outlook.com (2603:10b6:300:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 14:32:52 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25%4]) with mapi id 15.20.4129.033; Tue, 18 May 2021
 14:32:52 +0000
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com> <YIcBUl+94sHJsT8B@intel.com>
 <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
 <a49e967a0082727757143828770bd671@sebastianwick.net>
 <cac44e69-85cb-661b-4a5e-33fafee8ea3d@amd.com>
 <20210517113432.11f95361@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <812996ec-13f0-2440-c3d0-efb21fd877e5@amd.com>
Date: Tue, 18 May 2021 10:32:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210517113432.11f95361@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YQBPR0101CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::12) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YQBPR0101CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Tue, 18 May 2021 14:32:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f811cdd2-ff8e-4540-beb4-08d91a09d162
X-MS-TrafficTypeDiagnostic: MWHPR12MB1358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB13588CD0CCC2283CA5C8A2A18C2C9@MWHPR12MB1358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCbm2OOksO2dpKXFc8i3hgR7ykcRrBxTQlCQ6gNj3qPL0Xhllz70To3dRTpxL46p0WcrRgDAzjRqWBEYF2FoQZ8IhwXDMD+K/ING7/vqaXTUFeSt0TWNGWg6SIY+dHn6hn5fMvDWmYpmyvSLjdW6/bB7ujM8c5KzLFTFBPFFl6SRVBv0rmJYSOglhg8s3YpvpZ+ee6Q6zis4Jdyvw6BVKNtL16lgBpZ4SXUuB+jNgdIHuwh5MmyioTeLsfmphcvRStBITAVMsV/mxZ6M9vMXV5hbY4TLbcb5WHn2kl8PHALowWKFc8djouk285ghB6CKjzpAnhH1QT8pdDxH3cyt1jJv/HWgK0qOITj8EWtVeSZ4AfqZ2enJ67ZEhui2xnqtVpyV/uOrhG7Cs0+8OfCIigWUkllF65Kp6+Eyp/5Ie2OzK5M7Rbj+m9ggm+hd7udWd6VM+SFaxwitenWQHjdnyj8dqz+fEUzhOB3BePVrqYuIttVIz4iE37WDzgxMa+N+NYwfJ0BnQaYc+1N6s9dSnpvFGUV2mHW7Jj8RS4lY7OYrTXq5WdGN6nnANQrk9V88ylMYN4FUwFwefTt6jXk9RzUYvN2Q3c3mRboSXkTuNDcIlDB29cchHmSZCHEkh1PxxpIvVOJ6c6saJP6Fx/qvkLnzMlrE4lDd8McQEz6vdThwFZ90eg4BcxhJFVhieFwV76m8YNJEMTdpX+TbqKTmZLHliaXysNMwKyDCCyjpuDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(186003)(86362001)(478600001)(36756003)(6916009)(54906003)(31696002)(44832011)(38100700002)(316002)(2616005)(66556008)(956004)(2906002)(83380400001)(66476007)(66946007)(4326008)(53546011)(6486002)(16526019)(26005)(5660300002)(16576012)(966005)(8676002)(31686004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?abDwTDYxnDvDNh48KY5MFRP3gjTPJs7mgXQkhtkVzkDzTrSShHMnaZP9?=
 =?Windows-1252?Q?DGihd9dPoXHo4COmacfymJUirQ1q9/3Kg4yD74tds2yDXIsdKiJIzsvJ?=
 =?Windows-1252?Q?P+2Zbd8Ykb8o6N4gJO1TgD+Ah9YmFYQNXEhrCh7hNc+9z4wAI0/Nj5rK?=
 =?Windows-1252?Q?25UpVsHQFQM5NHIAVUwFyG3/EJUuM+yU+SlKtYslA2EPkixsdS9twd/K?=
 =?Windows-1252?Q?A+cKTdqNcopnP6J5FVpv3gNqUo9k7cx2Qp3Vit5guF2poWmp7cTaFNkl?=
 =?Windows-1252?Q?JjvTN/NQegvLYMlW+YMnB0cjIG17mEI2CElem3FhZKn4TGZLjAj/BTAB?=
 =?Windows-1252?Q?FtnURoJ3HQTMpMUsBQ7lla5XGRCUgVqoDVxi/BU0R5HPRxCz3Wc6tKZy?=
 =?Windows-1252?Q?jBXZKQpXlaxsJmTIcb6eQjolCyHh74WJTyxtPiZvBnc3Yhcrlrd/umAZ?=
 =?Windows-1252?Q?zgeia6mHY+EwP8BOK2vNnO3T7USzA6065e0YaLmhXW1el1R089C182HT?=
 =?Windows-1252?Q?iuhx7/Cm67SL1eSB7VeBrODqYWDqmm4yvFE4ZSTtRyZMtHfPksl5ws7d?=
 =?Windows-1252?Q?ubeOnZ/yhAJlsMs4RVR2qCW/9KdDMHV6/IeQZQg5cq7kJ4BDp+N1AKat?=
 =?Windows-1252?Q?HjXKxh56Gm6x52ZVZEu0KDFJQ7EuzE/4IErCtBLR+28zJxCFSsfi30Da?=
 =?Windows-1252?Q?GmgpU3nh1Dpa/o3/si6/54hD+5KuprtXMqmGPycYUDivBx/azEDIPMl2?=
 =?Windows-1252?Q?ZPV7eSg3EZp9MLgHaQntD+tshkzIQ4GTJLLm1f5mOnrcL3SrGLQ+18tc?=
 =?Windows-1252?Q?olQZr/44xWIbVFNwZI02zNBnMRgXsLkh8tFKcpZwEiVmy0nqWqyznbtX?=
 =?Windows-1252?Q?rpX67kuV7P3E7NYxx8P0ke4WhdkJluPLtWolAlU/5AQImKp1Y3xkDTl+?=
 =?Windows-1252?Q?WHPiWjy6jhwzs4NjP/bjBInMOBGhRd0duJcD21v3EwN+eKgIGlwJYef0?=
 =?Windows-1252?Q?aJYlwZAs1eg5muEHHvU5VueMO37OcjIeKPGRZnMIDdX6r6k4nZ3tz6H0?=
 =?Windows-1252?Q?Kl+m9nMGhrQ+PvX/VbWvZo8ZfGLCzuDKP7sXxOkohnDVEmwvhuaD1B4k?=
 =?Windows-1252?Q?YAhWhMKP5S4PodFKebsR0i4c+eRVXupmt2l9QKE2cEdljZOtlvAXnNaK?=
 =?Windows-1252?Q?fWrKEGTOe9C1GidiamwhtKz4sW3SI8JqzdX+fWc1y/2JWjCOtuPY5nfz?=
 =?Windows-1252?Q?kpU0ZH94xfJdXdnqj2psEcpVUYCOd/Ta39+nRi44vr8CiF+8TotwYSwN?=
 =?Windows-1252?Q?agWEUVwBUAmzRo/uD2HXuASnV6NHt4c8Cw4GlQPMho4UPLHBVKW+TAsH?=
 =?Windows-1252?Q?xRQpgQvxDVpWpnw5Y5wy7Zz89DVQa+Yk2VSfp6UFtRdl9pDTr9y7hXJV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f811cdd2-ff8e-4540-beb4-08d91a09d162
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:32:52.2888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5Ztt9xih1Baz/BeddC45n3klE20bQezOyUxFpNaGgz7QSSv8AhoB5kswAc++5roKe/GZ8gTjiOHQaUjEPxkgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1358
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Uma Shankar <uma.shankar@intel.com>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-17 4:34 a.m., Pekka Paalanen wrote:
> On Fri, 14 May 2021 17:04:51 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-04-30 8:53 p.m., Sebastian Wick wrote:
>>> On 2021-04-26 20:56, Harry Wentland wrote:  
> 
> ...
> 
>>>> Another reason I'm proposing to define the color space (and gamma) of
>>>> a plane is to make this explicit. Up until the color space and gamma
>>>> of a plane or framebuffer are not well defined, which leads to drivers
>>>> assuming the color space and gamma of a buffer (for blending and other
>>>> purposes) and might lead to sub-optimal outcomes.  
>>>
>>> Blending only is "correct" with linear light so that property of the
>>> color space is important. However, why does the kernel have to be
>>> involved here? As long as user space knows that for correct blending the
>>> data must represent linear light and knows when in the pipeline blending
>>> happens it can make sure that the data at that point in the pipeline
>>> contains linear light.
>>>   
>>
>> The only reason the kernel needs to be involved is to take full advantage
>> of the available HW without requiring KMS clients to be aware of
>> the difference in display HW.
> 
> Can you explain in more tangible examples, why you think so, please?
> 
> Is it because hardware does not fit the KMS UAPI model of the abstract
> pixel pipeline?
> 

I'd wager no HW is designed to meet KMS UAPI, rather KMS UAPI is designed
to abstract HW.

> Or is it because you have fixed-function hardware elements that you can
> only make use of when userspace uses an enum-based UAPI?
> 

One example is our degamma on our latest generation HW, where we have
fixed-function "degamma" (rather de-EOTF):

https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c#L166

> I would totally agree that the driver does not want to be analysing LUT
> entries to decipher if it could use a fixed-function element or not. It
> would introduce uncertainty in the UAPI. So fixed-function elements
> would need their own properties, but I don't know if that is feasible
> as generic UAPI or if it should be driver-specific (and so left unused
> by generic userspace).
> 


For the CRTC LUTs we actually do a linearity check to program the
HW into bypass when the LUT is linear since the KMS LUT definition
doesn't map well onto the LUT definition used by our HW and leads
to rounding errors and failing IGT kms_color tests (if I remember
this correctly).

https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c#L330

Hence the suggestion to define pre-defined TFs right at a KMS level
for usecases where we can assume the display will tonemap the 
content.

Harry

> 
> Thanks,
> pq
> 

