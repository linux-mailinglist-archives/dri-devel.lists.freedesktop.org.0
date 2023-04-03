Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B26D5172
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0639F10E10C;
	Mon,  3 Apr 2023 19:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C93510E07B;
 Mon,  3 Apr 2023 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680550781; x=1712086781;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9igI0hshVJtcHdQwv8eL3yy3Dsu1fvCPgqrX9suUOUk=;
 b=g/J6BH+wO1dz8B7F8SsBNS3OWipcFxdP34kzVRThL572R6bx6hQgGu7z
 rNeXWEskCPPd4iGf6A99ociFVyPIXS5Gu8zC/+yGOMgrtbe8rlupHiTfH
 +sq+Ajmj/3A5fYC22cHcDHC/xa5BsgLpuXTIb1c4EblYQS8Hp0QDy33ST
 QoWradIRjAEXZn4b0LjL0rF+LQ/Q1o7jmHBFKhZ4h+LeAoAmdHi1otg1W
 kAtHaECwDGWEMN0fua47TyrDtfyyJLFHJ6/tmQJ4iPJyQeRsE0mNkvEIB
 vfyawexqDjISWAyjVkqDw/q/47rD0d3ByngqfjARsjGCPbN1kqSs0jxZ6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340729792"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="340729792"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 12:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932165127"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="932165127"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 12:39:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 12:39:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 12:39:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 12:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KySVQF/GeVj6TLSXk5xHlLV/+haRZc78nJcMEyys5IEAE7BojqLBasLJ3bia+Cq36DRA7p8SA/B4xmpCDH0FKZhCbWRfGdn1fTXNzOucMgzooDAS0kuifzvZA2nz3UA5LQ40morhMqXQVeISRCj2PUwRAIN24jbxlperDSV08pYNtYEMwCaHD3gLMWH4tca1ExcCEw2A1pjlq+DCqKzsiuoEhx6uF7gBiEey7D/HTNEfrOp86x+KswP+CG1fOg+HMGDg8D7nYIA1EX8UKePC78kWtd0UqDtFFWHb8hoMze2lu6FTjhlfDwCjiCF5ym+aGCyeumyUIZfk4Vp0wIeLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9igI0hshVJtcHdQwv8eL3yy3Dsu1fvCPgqrX9suUOUk=;
 b=UcFaWRoDk/LxWKEZL2oIFKvt9vdSgn5XRf8JpPq5hQPdOUp4eG8sG4wbGI2NV6tCgFTfNHwFlUSR/KxRULo7kAT9PZCHMYmdV1xURWaH7MldfH8TF7bGaHpfbAVHV/7Bf/HiuabNXtzki6b00v3n87078XAd8+LX4BqYo6kQKvpx/3N9kki4B4SRY/QFm1dW+bxhfNLxzUqZgzAS/aa2er93dzH4VRgmLQ8s3EVJ+h2bElP2iiBB3xHpMLSMzsQ6RMOzyjTHasXwQPu+8s9Ah8DH8Du5F1gLBQIXK4TRyo6jszuRTs9dVKfB4DuCvtMHuRL/LlI49Btol7zrZsc4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 19:39:37 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 19:39:37 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
Thread-Topic: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
Thread-Index: AQHZZGRhzCzjM8mcJUyzrl8CnRb2/a8ZrnkAgAAix+CAAAWDAIAAJWug
Date: Mon, 3 Apr 2023 19:39:37 +0000
Message-ID: <BYAPR11MB2567738B001C8830D130C8279A929@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-6-fei.yang@intel.com> <ZCrntC9f1E0MZlXa@intel.com>
 <BYAPR11MB25675C7C3491973BB79379E29A929@BYAPR11MB2567.namprd11.prod.outlook.com>
 <ZCsJgNB1XY1yuq7Y@intel.com>
In-Reply-To: <ZCsJgNB1XY1yuq7Y@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH7PR11MB6521:EE_
x-ms-office365-filtering-correlation-id: 095c54de-62fe-47f7-6914-08db347b28f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hrg465UfcfMxJWMUcWsj4+8wS6bdfjTn8cZUTwefuK+TaBTf6xdwpi6LRFG+qyXnLLf+YGZSrL2sV8JmWAAfrLxxWprOXBBqz4NJg7BT5Sle3I95iiLjuJ+JfSIo9yYx0mgDLxagqrOBsRaYbuiWdnf7uqGYawkby0iW1ZpCScjkFJ6duYYI2nYp8to7lSZsEweZHFbO4Dza2HyyOUNJkScuyFMkrif001X7c9fXwC6yJMA79GoSWYu2NWEyiqp7OB4YZXtKaJnDshWNT+JGFPtURBDmQsYW3q9AuQGCsssdJzdpTzfxce+Oqt1lHK+XnsrRBwy4g6sCkPCvrTQNYPIYVeUWTNoO/mNNHDRMmc+/l+HqY8LrRxtO1tRxppbMPj3ttXTSfEoev6O5jfQXKdLpeezRYtVrnT3A4TVXG2dsP8ClpxFX2faE2TYGUXRw4jg10+CQjqX/YpCNNUnALoE5h4eCvsg9Ev/pbnJr6SXWUIGuC+vywtq52iapYAy16v7hC34gMS9Ig0A2mqzCumRK7S2KkiizXMeXBZwhQbAEabaWxtEesFSFR30go9xYd4r0Prh7hdbTPcVSXGIMha4gRouofjmLsB+dxQfHAkkTUcuIY0OAOnRTHxx9RKWI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(6916009)(4326008)(33656002)(8676002)(66946007)(54906003)(66446008)(316002)(76116006)(66476007)(64756008)(66556008)(71200400001)(478600001)(7696005)(41300700001)(8936002)(2906002)(55016003)(82960400001)(52536014)(5660300002)(86362001)(38070700005)(122000001)(38100700002)(6506007)(186003)(83380400001)(66574015)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i4AppBWRGtzp40RPmKEGCorTkkaOpHoHf7y44pkzJXGuxYShZFRalOCZPo?=
 =?iso-8859-1?Q?32JlnlFmjFBfDr2ZBhCDeaCml8N2Jq0OHIxfE5O+qx1NRW9KxZVP9L8TrB?=
 =?iso-8859-1?Q?M5Q9UmACLrHfzBDM6UTInrgpJZNBBv/FyOIaHohrwa4F873n9NY2rayKiQ?=
 =?iso-8859-1?Q?+vjMEBGrHzTlwQhp7Zpf68gx0vhCFUiNjDGfHtX3HY8J92yb1f+qud0Mqv?=
 =?iso-8859-1?Q?jgZVFLqMwKE3fMINeBbOPWriYwsl9X/LXOYtMLZ1hOe3sUcUcSAfUo3MaE?=
 =?iso-8859-1?Q?ZneH97DmUbM0Fa7tN6YI3YN1TRIqu4qM6jxK9ULwSQGHs7SSvJXpzv8bGU?=
 =?iso-8859-1?Q?6HdGaSE2MrdpeUvWIuL/I05T3+tl9mAjPE8p3K+gfwAb2rOR2itYbMPeUR?=
 =?iso-8859-1?Q?zTyBhH/LGO6C2gaxKtU6gJB+vrY7S0GDLkwaqH/+xBTGZJ6GVubqYKmTUY?=
 =?iso-8859-1?Q?qxo9Bx0KeobCG5KRJEPNsFUpc01n5RI9jrBDo6p9g91p3W87TktCgz6Ku5?=
 =?iso-8859-1?Q?qb2Lkk5nEFjJXIAtqymd8lb0I3hSGUSmX/iLyUQvjzucq+Ss9YNbGIras4?=
 =?iso-8859-1?Q?SxtE+G/deVB5Yz02ltisqU5QNqWkAJosG0IGg0WPxlFzEZhqdaMGM5AyTA?=
 =?iso-8859-1?Q?d+7ZE+I5KROIr4/DV1+sYhP35Q64lKME3TJiQ2ojUsVBk/NFkX6f8Aalxa?=
 =?iso-8859-1?Q?FZNYvmrUwXNLAiZtbc9Z53GKU8atxJ0BmjGtMKGNsFDb35arYjVb3Kyzxe?=
 =?iso-8859-1?Q?LT02HIVOqVYcfsFqh8fJVCwzvxtN3xAm2ESC1Ys/7GflRGwp7ncuPM9+HS?=
 =?iso-8859-1?Q?ZjPIQe9RUXqXZgP4+R8KWCBxOHlowum4AeU1BWATvQZ7Er7hLPsDJ+qCff?=
 =?iso-8859-1?Q?ns+8kRPZbjgNfH4zNY5ermZVPOq5zX1ZYD/zycqOHIdMvGrEP3E8toiWHM?=
 =?iso-8859-1?Q?rusitih9TbryBWB2uFG0sFr/d9J0oXDzRaAJ319Ctn4veYFouyaprOZqTB?=
 =?iso-8859-1?Q?ciMSz2jom1orHOTw6cPAKYimg/G+OJb5nYGyVQwte5lIRe0JC4wIS/iwen?=
 =?iso-8859-1?Q?7tnVwfjTSm/+YFg3K1b87dp+2g5A95qBzwsdRhUk/J4sQkzsSR7xBG468L?=
 =?iso-8859-1?Q?JtgZ0cHZpOWGjL8Yu2gLuz722spd4h+fNxq6fUZ2R0cyuu+5iPEd5y68sJ?=
 =?iso-8859-1?Q?UiEdcHzwzzVM1vbfCUOMgNj8qEWBryrXvgogqRi5iljgGTYMsaYvy2cux3?=
 =?iso-8859-1?Q?qTwyPn5F77kyXA0oTIvL/H8wZ7Hlf8ZJZb4lLFn+W8XY7m9uKvvCYXHWsN?=
 =?iso-8859-1?Q?OZ4RdHrxdndUTqC2Yxus4/mqMGsk3Ip2uomNZVDyxGGdz89a4MXavuH8uN?=
 =?iso-8859-1?Q?ICxJFmgp+PS2iZcyjq/0Y2vgcO+DqIF8e7A4W0gL0g9y4zp/3eQiNNulBj?=
 =?iso-8859-1?Q?Cuxsf2HWQZZh409YkJCkxOB7cI/7JCUIpCxoKV+Z5PYrkQMo5mQ/mqDep3?=
 =?iso-8859-1?Q?yKCmfSDO1uAzGVttVEUmafKx1mBvhbxocBIh67PS3Q2pDBy7/vRUxFScrJ?=
 =?iso-8859-1?Q?jCnHEcC7TP+uqU17KSSREUeHHHIboDTuCeTYOqsuchQPyEV5/IxafotnPB?=
 =?iso-8859-1?Q?pFoC4l60XsHCU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095c54de-62fe-47f7-6914-08db347b28f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 19:39:37.5493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oj6FB3MBdDj0PsTw22KK3MU21+0sUacqZlnnJ7po02cXfLM8JEQ1x8oCh0LtCqIDWSG2wtJHhNmPeE6HmbGUSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Subject: Re: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
>
>On Mon, Apr 03, 2023 at 04:57:21PM +0000, Yang, Fei wrote:
>>> Subject: Re: [PATCH 5/7] drm/i915: use pat_index instead of
>>> cache_level
>>>
>>> On Fri, Mar 31, 2023 at 11:38:28PM -0700, fei.yang@intel.com wrote:
>>>> From: Fei Yang <fei.yang@intel.com>
>>>>
>>>> Currently the KMD is using enum i915_cache_level to set caching
>>>> policy for buffer objects. This is flaky because the PAT index
>>>> which really controls the caching behavior in PTE has far more
>>>> levels than what's defined in the enum.
>>>
>>> Then just add more enum values.
>>
>> That would be really messy because PAT index is platform dependent,
>> you would have to maintain many tables for the the translation.
>>
>>> 'pat_index' is absolutely meaningless to the reader, it's just an
>>> arbitrary number. Whereas 'cache_level' conveys how the thing is
>>> actually going to get used and thus how the caches should behave.
>>
>> By design UMD's understand PAT index. Both UMD and KMD should stand on
>> the same ground, the Bspec, to avoid any potential ambiguity.
>>
>>>> In addition, the PAT index is platform dependent, having to
>>>> translate between i915_cache_level and PAT index is not reliable,
>>>
>>> If it's not realiable then the code is clearly broken.
>>
>> Perhaps the word "reliable" is a bit confusing here. What I really
>> meant to say is 'difficult to maintain', or 'error-prone'.
>>
>>>> and makes the code more complicated.
>>>
>>> You have to translate somewhere anyway. Looks like you're now adding
>>> translations the other way (pat_index->cache_level). How is that better=
?
>>
>> No, there is no pat_index->cache_level translation.
>
> i915_gem_object_has_cache_level() is exactly that. And that one does look
> actually fragile since it assumes only one PAT index maps to each cache
> level. So if the user picks any other pat_index anything using
> i915_gem_object_has_cache_level() is likely to do the wrong thing.

That is still one way transaltion, from cache_level to pat_index.
The cache_level is only a KMD concept now. And inside the KMD, we have one
table to translate between cache_level to pat_index. Only KMD would be able
to trigger a comparison on pat_index for a KMD allocated BO.
User is not allowed to set pat_index dynamically any more. By design the ca=
hce
setting for user space BO's should be immutable. That's why even the set ca=
ching
ioctl has been killed (from MTL onward).

> If we do switch to pat_index then I think cache_level should be made a
> purely uapi concept,

UMD's directly use pat_index because they are supposed to follow the b-spec=
.
The abstracted cache_level is no longer exposed to user space.

-Fei

> and all the internal code should instead be made to
> query various aspects of the caching behaviour of the current pat_index
> (eg. is LLC caching enabled, and thus do I need to clflush?).
>
> --
> Ville Syrj=E4l=E4
> Intel
