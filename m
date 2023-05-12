Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C8701285
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 01:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D2B10E08C;
	Fri, 12 May 2023 23:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9799A10E08C;
 Fri, 12 May 2023 23:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683934479; x=1715470479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=s9AQ+AiTgdYUKeWn2WBRmVsrKYJ42hZXV9tUc0SbpF4=;
 b=T97Hm7KHqcteHZItYZzDx1wNQv2RLwabvo3bvpcnH6gIvha8o4MxqFKV
 E7TNws5jK6XJCZGZSBMVbhZ4N7GVkrxSxwhH+66FM1PARy0cSLdAKVapU
 iYypRLvfw4dso3RlVRJi0AVyYjS/+yO7k/u4QdqhC+y2C+2k2kOB8ijsN
 3DuDJh57cRoz9gGgtJD187hSuCRJhBKpnBK+srXyAAVZ1zCr5dWE2337t
 xQ+VDjfmR156vrwgmzwLyBPTclQ9ghGFDswciL+zKnnyDgnKrzbddCy5/
 faWyesE8zfqPcMyL9O6B/0L6O5RUCjMjP+imy5MuZ7JARwpKXaQTYGrR+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349745204"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
 d="scan'208,217";a="349745204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 16:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="789988860"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
 d="scan'208,217";a="789988860"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 12 May 2023 16:34:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 16:34:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 16:34:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 16:34:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 16:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCt2yiB/mM93EIyH0uMligZzmF2iOJLZhsLv+yG+3TWjTx33tb7//PKrlyWXSVIEzqH5HXWb7TZq7ATJFWjWa+4B6msPQ4QCvOZyID47TzhwOtQl/P7Uqocj8B2Pt2rKPpYSo0cWXMSH9K86BtZWQamWKT9zXK8Ax80B5M+vr8ErkxON+PD+PYswpfCOubf4MnkCGmwLUjWcPH2LUcoLER94Edd60ZFi5h5KLuWpKyThoLF9N8IeqCGPeU+MMawd/AZMVuw+E9Ix/0Q4wLUCeRFrOHKxr1bCvodAWYbK7dLdeenF7zmfFDZkYH3bAW4x4wReIB6lQLLQ90H3cW9cNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9AQ+AiTgdYUKeWn2WBRmVsrKYJ42hZXV9tUc0SbpF4=;
 b=SJRqDtWYJ5pSDYQNruGGxMBwX0AKPu0IqMDcNOggHem6OamUNL+sN38UpQKM/PZQfxNaGAQNanB1YZz8HT+OT2fzA9I3sJQkeFv30EFRlJ8mzISWErlG6F+ntbBywpAUTjxHTbddmvohk+IS9nGWFpUIzDLI7OR0wsfWVYW/0cMFxILKkRP5OhBK9QZMhS9C7tPPnTWn4lvleuPIT4y++f247vTdo/lWEE7NpxNIB83PFn/B2BKI8ffztCk+3myN0OfCGnOVjykeIBxoXpsD/yqMluKfsXqUShJibjy0BjpT0sQGW+kJNtX3tLBtuXSIAsWm0dAR02/Dx0LisqVBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 23:34:31 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 23:34:31 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Justen, Jordan L" <jordan.l.justen@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v7 4/4] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v7 4/4] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZgpeJ1/DlI0r6H0y/Q4/wLFhrpq9UFFUAgAL9oICAADyAzQ==
Date: Fri, 12 May 2023 23:34:30 +0000
Message-ID: <BYAPR11MB25670C9127D87446BCE366539A759@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230509165942.2155-1-fei.yang@intel.com>
 <20230509165942.2155-5-fei.yang@intel.com>
 <ZFwXOPV9eY0mCSyz@ashyti-mobl2.lan>
 <168392127300.1245490.15218496130423132985@jljusten-skl>
In-Reply-To: <168392127300.1245490.15218496130423132985@jljusten-skl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SJ0PR11MB4911:EE_
x-ms-office365-filtering-correlation-id: 4b70f74c-f190-4635-201c-08db53416f5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zkxOOYtgpw9+kkq5OA8QLJaNesv3os2ulyVaWw6tKqzrGhPhiceckRFn7y/DdZBOhe0lrxQHg7rGTb+EidvLxqze1m+0D+6ne5gTOAaRPQpjseiJpVOoxzUaDVR20RgJdhZrsXissxjRKTxILA9YmbAAS2RyU0tOsavku5XgalUpLfpSYsileHghszBjGzAoQP/ven8jiwl7jZYlcmTNUVFIt4Xw7Rv9Bk7VjWnbhFhNdaQ5AA9aOue0s3Alv5LEK4pkU7U97RzYTrrJZzK764D9hCUm/2GA3bl+BbDWoxCi5O431mWcMcyJmQd7jnGKagudIZ/Jg66emTsHO6YbjNEduXQGQqL0CqCnyyYNbamnsKFCl+tICnGeW9qCR3deUJTud9YMofxbV8Q2dKkZ3zDmxTrWJUQhHbY7DsD9NVuRKM4+XkoOOUvZAPX3s1h2i3/W+enl8A/q+uJwX8Sq4CWhr0YZuvyCWsLFC8LMD92MeTf81aG3HltWcfan1F/j9RobT/zQI6U67ezotHQWKzWHTURLSBrIar4uJ1MZ8MLe8Rl0Ok4m+b5NZDYSpYNf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(966005)(66556008)(8936002)(8676002)(52536014)(7696005)(38100700002)(33656002)(5660300002)(54906003)(316002)(64756008)(66476007)(66446008)(66946007)(82960400001)(76116006)(4326008)(478600001)(41300700001)(55016003)(122000001)(71200400001)(110136005)(2906002)(86362001)(38070700005)(186003)(19627405001)(83380400001)(6506007)(53546011)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JP1hC2GPfG0zzvpBmt37Y4aAHOUnytw8Uk+hn8Mh/XJ5TFtfP0ZJklpZPb?=
 =?iso-8859-1?Q?lcE7T8lGvqCO5mLcE41DlDfsQ6O4VKxtl7pauHJ0vIow0Y2HPxPnmVCHeU?=
 =?iso-8859-1?Q?l3raURjEn+KBI+jEGh8ufKxZ+kCNRMYA2BFCAf7eZmTGAFWouSXBWFqcbx?=
 =?iso-8859-1?Q?zQqqK8Kyt0Jn4rhEbjAxcYcw5FvG+SZvFawl2M8EMe60k0tfVFbM7hU6cS?=
 =?iso-8859-1?Q?Tat5e7guVPFrLRi3QC6e5QZRzUVWggVHwd53GCvrLT0AwHYT1w0P24WKsf?=
 =?iso-8859-1?Q?H61w2+QsXdOY1mKXJ1C8TQWGyINByxuN8oZdzhPz5nYI/LTQ5pu4vcQyzq?=
 =?iso-8859-1?Q?d8bC3SXBoxRgj7h0d0CSQVHDSeJo1eYvP2WOoyezskra2qn1UsSZcofWBD?=
 =?iso-8859-1?Q?dK+nW8QIWV1DrOTnvlKoQIQeCE4G2WXYgPmzO+QwtRsRzFnNFmdsfSyup+?=
 =?iso-8859-1?Q?ZQh9ChLkN/7J2DZNI4bf/cGifs2J5No1UBEzQEfHt9WPTt+cDItIe+NR2m?=
 =?iso-8859-1?Q?Q+6AVdA/cESpYnCx6NoEF9mcrY8+yyr6AaE65cIaJ/upea+P07y/qeuyYP?=
 =?iso-8859-1?Q?bzgXF2nMnfWLuhHFvuEd00lCBLZd5pWVSBWw3f+x2wDHjA6diFqmZ4ttjT?=
 =?iso-8859-1?Q?SSNg+t5QWPy8r9NnEgVIYqP7qGWktell380tBC7Y2/x0ywnpJ13pOaeYTI?=
 =?iso-8859-1?Q?XXk0q0ncefn4qzdi0EzwkUJYoLytC5LycJmT3Zy7sSvYOgI7ffDxQHJ50o?=
 =?iso-8859-1?Q?k1tQPVK6C5SOUfSfTJIuP+eSaGa5Xrcc0eNHQI6ec4als3nUuLkLTD4q/x?=
 =?iso-8859-1?Q?mBtd5CIymHu0sxD6mwyE7YFDgwXpFobsljmFsSX/qNz5rRtDbYfDo7Cgm5?=
 =?iso-8859-1?Q?1DMYrDXVOx/IY6OlLhx9rUjvAxUWQEV44Fv1ZSFAnEHzvS01SaAASzN5vP?=
 =?iso-8859-1?Q?3yw3nQ4a/gE4/h5x2sB+Ue0VnEnp3oz04VjFJy8KGnghwOEOgchoWBrsA4?=
 =?iso-8859-1?Q?p/BvpKUBaKl4golJQ9e1u5AHb8XYidbGc6Bb34C4WAwVN3iretFnV7Pd9a?=
 =?iso-8859-1?Q?0nS8bRdsGZ8bBHRjL5VQqWEte1QbaTXdoKzZfl62QV44x6uWe7lra5Bvc6?=
 =?iso-8859-1?Q?Ko62aXRl/d4mizjpDipESprR80pYdZG0CU6EOXEZjagY8ZWY8/Az/ySdLv?=
 =?iso-8859-1?Q?4+njPSPmMGjYr4dPUvSVlzpPEwZgG5MCaCDzdjgw6+AlWAWPQta8VleCii?=
 =?iso-8859-1?Q?hueTx2oOSfz6szS08N/anA9zwgaA4GcMf/OldmdZqGbwgiq7VKNYGwOOq/?=
 =?iso-8859-1?Q?OJ5FXS2yZo+mJkpaXPEpZOAZiYAD24EBSiWm7zh2kprNXB3R/bmfBWlAWo?=
 =?iso-8859-1?Q?UuTAVH0bHYhvTEwJwELKQIVCbIrisGkhmTL8VVM7PEZHfiSJLFWqieHAKa?=
 =?iso-8859-1?Q?ypVSXH7itZn6xBLxhHWITJgyYktGPYNJc+VJ/y1us6xvIv+KqrwMnVWs1B?=
 =?iso-8859-1?Q?dKm71z98+DXdCbJa+OBWE4ks1fAI6VtzTPGn0/RNnvSATX1PR8/oPHsmuR?=
 =?iso-8859-1?Q?Z5JhhI0m+1eIE83OiBTGncCLoKgQgYT67PU0pgiFPDwl91Q96CmSZkqmI5?=
 =?iso-8859-1?Q?9LauywgPiPxM8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25670C9127D87446BCE366539A759BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b70f74c-f190-4635-201c-08db53416f5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 23:34:30.9031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snXFY1GNwbCqd6r/s2rFYnktVW7yAfnKku32uw4hzIJNoGuueo/NNaz8Z8uFKOH8GcU48Z/j46YmS8E4dusRsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-OriginatorOrg: intel.com
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Chris
 Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25670C9127D87446BCE366539A759BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 2023-05-10 15:14:16, Andi Shyti wrote:
>> Hi,
>>
>> On Tue, May 09, 2023 at 09:59:42AM -0700, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> To comply with the design that buffer objects shall have immutable
>>> cache setting through out their life cycle, {set, get}_caching ioctl's
>>> are no longer supported from MTL onward. With that change caching
>>> policy can only be set at object creation time. The current code
>>> applies a default (platform dependent) cache setting for all objects.
>>> However this is not optimal for performance tuning. The patch extends
>>> the existing gem_create uAPI to let user set PAT index for the object
>>> at creation time.
>>> The new extension is platform independent, so UMD's can switch to using
>>> this extension for older platforms as well, while {set, get}_caching ar=
e
>>> still supported on these legacy paltforms for compatibility reason.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> just for a matter of completeness, this is new uapi is tested
>> through the "create-ext-set-pat" test case from the "gem_create"
>> igt test[1]. Can any of the igt maintainers give it a look,
>> comment and ack?
>>
>> The mesa merge request is here [2]. As there is a merge request
>> in progress, would anyone from mesa be so kind to give an ack to
>> this patch, as well?
>>
>> With the mesa ack in place this patch should be ready to go and
>> I'm looking forward to having it in.
>
> I tested my MR [2] in our CI. There was some bad news, but I don't
> think it needs to block these patches.
>
> The good news was that I found that OpenGL testing with our iris
> driver appeared to have ok results when using this interface.
>
> But, our Vulkan Anvil driver was not stable with the current patches
> in the Mesa MR. We will need to debug this further before using the
> interface on Vulkan.
>
> I don't suspect that this is an issue with the kernel interface, so
> you can add:
>
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>

v8 sent with updates.

> -Jordan

Thanks Jordan.

>>
>> Thanks,
>> Andi
>>
>> [1] https://patchwork.freedesktop.org/patch/534955/?series=3D117185&rev=
=3D1
>> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
>>


--_000_BYAPR11MB25670C9127D87446BCE366539A759BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
&gt; On 2023-05-10 15:14:16, Andi Shyti wrote:
<div class=3D"ContentPasted0">&gt;&gt; Hi,</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; On Tue, May 09, 2023 at 09:59:42AM -=
0700, fei.yang@intel.com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; From: Fei Yang &lt;fei.yang@inte=
l.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; To comply with the design that b=
uffer objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; cache setting through out their =
life cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; are no longer supported from MTL=
 onward. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; policy can only be set at object=
 creation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; applies a default (platform depe=
ndent) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; However this is not optimal for =
performance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; the existing gem_create uAPI to =
let user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; The new extension is platform in=
dependent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; this extension for older platfor=
ms as well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; still supported on these legacy =
paltforms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Chris Wilson &lt;chris.p.wil=
son@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Matt Roper &lt;matthew.d.rop=
er@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@li=
nux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Signed-off-by: Fei Yang &lt;fei.=
yang@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Reviewed-by: Andi Shyti &lt;andi=
.shyti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; just for a matter of completeness, t=
his is new uapi is tested</div>
<div class=3D"ContentPasted0">&gt;&gt; through the &quot;create-ext-set-pat=
&quot; test case from the &quot;gem_create&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt; igt test[1]. Can any of the igt main=
tainers give it a look,</div>
<div class=3D"ContentPasted0">&gt;&gt; comment and ack?</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; The mesa merge request is here [2]. =
As there is a merge request</div>
<div class=3D"ContentPasted0">&gt;&gt; in progress, would anyone from mesa =
be so kind to give an ack to</div>
<div class=3D"ContentPasted0">&gt;&gt; this patch, as well?</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; With the mesa ack in place this patc=
h should be ready to go and</div>
<div class=3D"ContentPasted0">&gt;&gt; I'm looking forward to having it in.=
</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; I tested my MR [2] in our CI. There was =
some bad news, but I don't</div>
<div class=3D"ContentPasted0">&gt; think it needs to block these patches.</=
div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; The good news was that I found that Open=
GL testing with our iris</div>
<div class=3D"ContentPasted0">&gt; driver appeared to have ok results when =
using this interface.</div>
&gt;
<div class=3D"ContentPasted1">&gt; But, our Vulkan Anvil driver was not sta=
ble with the current patches</div>
<div class=3D"ContentPasted1">&gt; in the Mesa MR. We will need to debug th=
is further before using the</div>
<div class=3D"ContentPasted1">&gt; interface on Vulkan.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; I don't suspect that this is an issue wi=
th the kernel interface, so</div>
<div class=3D"ContentPasted1">&gt; you can add:</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Tested-by: Jordan Justen &lt;jordan.l.ju=
sten@intel.com&gt;</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">v8 sent with updates.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt; -Jordan</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">Thanks Jordan.</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Thanks,</div>
<div class=3D"ContentPasted1">&gt;&gt; Andi</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; [1] https://patchwork.freedesktop.or=
g/patch/534955/?series=3D117185&amp;rev=3D1</div>
<div class=3D"ContentPasted1">&gt;&gt; [2] https://gitlab.freedesktop.org/m=
esa/mesa/-/merge_requests/22878</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB25670C9127D87446BCE366539A759BYAPR11MB2567namp_--
