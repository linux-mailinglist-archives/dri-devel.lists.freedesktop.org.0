Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71850F515
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A7810E3E3;
	Tue, 26 Apr 2022 08:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2110E303;
 Tue, 26 Apr 2022 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650962343; x=1682498343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sVD5q0Cdkw8OAhSywdbpazep2J7I3LUIK+AEh0YIP50=;
 b=HSZbeAsx88VRVI05e8PcajajMb09X6fjaTP4krBrLNvPoulLQeytlz9J
 8ZM5gPmD/I1Gs9A2hL6SQ2vew0M059Fk7ahwqbpY2X47Fgci21BWY3t5w
 xbJ1WY+LcQwZu8W88nUFb8Wp/o6C9NZ5YoXzvQrsanKC9daUpLi6WNh50
 bSgiySoGWJSOATjtIppr1ZSvFZAMjpv2+gDm6omaaopv+eV6OLhRTi3v6
 J6Iq/KhxXledOi1A15GaL2/NZUV/GQq4oRBFgpDP5e2pRQUpH+9t2a9nr
 qYxYSaAJa5kPQM+ApmhGqSToLZMRtbYNKxLruJ5XV79TTTJbnXGAQmkJM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265305901"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="265305901"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 01:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="579769706"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 26 Apr 2022 01:38:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 01:38:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 01:38:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 01:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNzsyyIuw7h0hxUX4UA4sCKlajovaRyAD5XhlkOaVMHr/QMsNZqsGJiUic1lYED0NYe64m6BSG67RnULNEL5+61KAWj61TOpM/dJrSmL27Ts7mY38+0IlXi9u12ZvNOQhgdEpRTICN8fXaCyzP6LwOT/TRXCWl42Zgz9nY9x6aDqVBupiWiNPGxY8yT87YHSCKV9B8aDC/yRj6dJr9GvBBeYx9Z4YPyg8Mb67wWJekDZifuszK6eAlOZJjgCqZz+pHb8L0gc7m/peV3J+zHYfpzfmH+VnqMMV6QYgRD4euJVaXGv/iTri4LtmijKnglNxNxYxNiNjDjsp+Ma/YpT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZAGAIzDhWahTHgsayjWVNXXLUqLlG4MU9YiL7OwgBQ=;
 b=lpupnXKeCgsqqFS5C0lgqBP0FRvRW2lrz2I0ST0vCJSxB8gmommC6j2aipKIgzIKzbmqd9Bln0gJ3Fzu/A7rBQlEsREviX7f41c2Vh8Vn1AU0VmaoA88J4IexnAYOAJ8iXe819rVOfGPeFfyQqmIhsPmj3B/Q3ihQCHTSQhjijuAYoLrtzPG4R5Uazx2UZmNK/DeaF5z4HYnb0rPLyaUJC/UEkD2oehtHdBOQysrYW3pYhSFuen9JYfrKgmsZl5sqMJEifx4xY66CPm8iax2t965uVmp4c+EmiLXP15V7mUhwgVg2UH2FM+NGeqMKObP6kCFd3Gy/cCkM2T9pMsyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4462.namprd11.prod.outlook.com (2603:10b6:208:18f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 08:38:50 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:38:50 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHYWUN8Agog0QB2HUW+VGhdlmLDqK0B3zkAgAAAWgA=
Date: Tue, 26 Apr 2022 08:38:50 +0000
Message-ID: <5e021fbd-4a55-b2c6-054f-dd609db95cad@intel.com>
References: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
 <87zgk8tf3l.fsf@intel.com>
In-Reply-To: <87zgk8tf3l.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce70a7e4-db75-4c58-1a99-08da27603035
x-ms-traffictypediagnostic: MN2PR11MB4462:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB44628386508B3E2B0EFEC3CCCAFB9@MN2PR11MB4462.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ejNXMNSQDDH9SpNwx6TpK1BRVJL7ZW0dCTVwZ2gcQ7xWTHUJcYcPoK8U6T/kCxJoy5f8VEVGnf3s2uJ6XxMKofuXg4G1X0GiO2q3zXmf9v0+dlESKZXD9QgnfjtT7+tHt3x3rdCpy+4ptWA2PYhJY8KlbzhOFi2VrlKebZrh3asW0aw7Bnc/t+WaSnX5WM7RLv54v4Jm0GZpqW2fVW5fQqPqyI1ReTcRLn6OtZFH5Gi5JznaqS0u9Jzrd9fH/P8SqKE7xW8gyjwEk+fatOfG2ZoY5IZAFP7fqVAQM3EPbRyoC7oyCO08gIVF4JpoQyYEMDqsbHS/AlGjY/hqGvsaTansq42TWdV1zJRfUDOxXFxPyb0pf1aTuT4FNF7btpBlVhEzysEkzobXPIhRLKv3F/t8w1PX/ff8MRBU5iy6SnY3ULJINgSI/hNse409VrEmAMsoZYiZNdzHzrHPMRKDjWppOghNjl558Rkf6jV8OHCn1zWdIfgISaFKgX8bSpde+Ov5/MY13HWpNdXqsIbIg4jxPbFjaBxedpHVQEI6uBPb9g/xITJUKaIEYsh+LMzEiAbbRevyE892bG/WiE1XxLRx4vjWIINF5EZAZsyBFUbk22T4+lKWPVLLLy6fONUNliHIYZFlRs3iAMLl0LmV0h05IeiArk3i26xXmai5iwtd5AXayWWOVLD2aI6qSbnYnL/C7DFOEMp/6XkOl3LYm2nlq9hIRizeiPtCOHD1OR7a2N1S6HrprXdw9qBsVRupw0/azFUakr8XH0avw7GVSROSyWsV3HxAB88MqmxWcMeuWTWs57f4vToPoWaLuqTDobedE4FDJsLJxNFYJDCVXIU9A+/2DxrB2XZpiwIl/nk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(31696002)(6506007)(6512007)(7416002)(2616005)(86362001)(5660300002)(38070700005)(2906002)(122000001)(82960400001)(83380400001)(76116006)(91956017)(316002)(110136005)(26005)(186003)(54906003)(8936002)(64756008)(66556008)(66446008)(8676002)(4326008)(66946007)(66476007)(6486002)(508600001)(36756003)(31686004)(966005)(38100700002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?2RrL6uUwUjJRh3kgpSjUts3gz8DzCDlhYtSVFUfFaz2HNXYkb1pXGpsH?=
 =?Windows-1252?Q?c2YBvM8eZjDanvutEN9QngAQIhTViBJKi+JPUSTyqWGeTjnGXp/COV7h?=
 =?Windows-1252?Q?KPIslR3ygyJHs2CbiHxdhiaGCGeyjbEwPGFb5CLZmt58XaOpVCdtigio?=
 =?Windows-1252?Q?QjIztIo9NGt6782sTCTVrVQcC7/mwHOznyIXm7WECr2cBLyElDdbSBvP?=
 =?Windows-1252?Q?DrmrVDxYWfpsSrlTI5F1QfH76hUy7BFrpm0/ZA3WJt6MPF3BFwqFvKAy?=
 =?Windows-1252?Q?B1wXSXz8LoaKAc2hpvOo27/6h6g6RBCZGLBbsAPLQBUSh+Rv1cjT/M7j?=
 =?Windows-1252?Q?itjmxk7bA+ImCp/PNgHmNj2pArbIfCgczLaUHfcDkHJf1WHqDjetE3AE?=
 =?Windows-1252?Q?kOue402PA3It329I1iqJrKzFh/t0uew9mh1BZHkrVDlbf/DidMVmxMv2?=
 =?Windows-1252?Q?eYdKwLW/kK5ruh6PDPMUmjPtjL7OTnHqT3pgLCKAJdQg2k8jn7pvuJpE?=
 =?Windows-1252?Q?Z4BNOWDJT4Bd/zZFb/MuNu7ZhdfmOUT6j0VHdT6YwIm96HwY+eHpMBOu?=
 =?Windows-1252?Q?kMREIxsXoE6nh8L2Xkjptf1wz21gUL2QAnKtEqJ+tC97q8sSTQHpR8f2?=
 =?Windows-1252?Q?QeZjRsmdXyDGQ47rU5Wwg5D6KEG1FbXNj4pgA6KMhr5syiYW5TXkmDhl?=
 =?Windows-1252?Q?ZfSGxD3uGRcavj61fqp87wTbgOW//A0zNky09yWi+aNSgqSsxWxJioqP?=
 =?Windows-1252?Q?4avTlxane1eI0FOdeHDQaFcc1JlDG2isCGt7q79aZHXn+L6nxsbvvM/S?=
 =?Windows-1252?Q?a1OAvBIwQrJy3GoSVqqm86UaveDA2PdZqbMexryPM6MM+NRawEkXs29Z?=
 =?Windows-1252?Q?8hMrnBrINNBWNITlzFHq1OPHGbNkkaxA1Grg2N9xCvGNaaQobQ1wn45/?=
 =?Windows-1252?Q?kSGMR2QGTbdec9riMcLYQRh2/EFTeeASs7/dM9N9PHJYki893zFnJEAL?=
 =?Windows-1252?Q?yNnp0jXGp9csw4bwv5YnveK9SFCYYe25uMYP4b6Kzzq+Pybq4zQyA2CO?=
 =?Windows-1252?Q?P7u74Fn1fVm8q2dOSIV40j6PuqUZxINTKQdbE0+1gKWyky9s760JTSio?=
 =?Windows-1252?Q?432OIS+BlVOsNpjOj6GkwjsYOWa2V8M2D50I1nHlar77PAvfgVPXhjQz?=
 =?Windows-1252?Q?jeOCGIPHvztnTvTBHl+D9xx6jSbE+PlVWlR5rBCRTNGZjpsvUs0CoOmS?=
 =?Windows-1252?Q?a6qSG8gW2xGyCTdlx6X43WkZ0Yghqb+xRZZd/VkWOwkoaHBbheZov7bg?=
 =?Windows-1252?Q?ZSr5nRLf+N9VWJNpb46rU2b/TL0ScQU/IdM4hLMdTWVsHLKqaR6CDGhv?=
 =?Windows-1252?Q?u1a+iJVNDUxE8kwEQ/fnJPmgC3TwgXJJ8xlBPCvJgiRXzjTUMS00lE8q?=
 =?Windows-1252?Q?1zRA49Kgsh5s8CPb8ack+4HZou/xJeZ8NkYFz4SNglyn3NmLCc2t4dKu?=
 =?Windows-1252?Q?08r0trER7Zzdty2ykyFM7VBm5FRI/9qQDLbV84ZOAlxm/xiBxgE0sKyL?=
 =?Windows-1252?Q?sNA+0cHA1+Km19tRKBUPXr8QnEDqY5lMfBv54rWWwsmOzvRVjrew4xs8?=
 =?Windows-1252?Q?crFWKJer/ESMlDzfhK6RCXjhrRgX+81ONwmXQVmQmFEG6ydroiokCviH?=
 =?Windows-1252?Q?fQsoonouwHiM7Gjh7DMm7c331e5An44jblffgnpmOPJnTq3K5X47m/KG?=
 =?Windows-1252?Q?cJzdc1YfPJ93ATC9U6f6P3tnwai07bkegJ9iQzNpm+DvZy1M07n/hR/x?=
 =?Windows-1252?Q?tQvqDcOTF8ndJ5dAWM80L0p5MX8PQOuRC8DNvWYMZdb2POQzSrLkiFnT?=
 =?Windows-1252?Q?ukT9X92fMi9Yhw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <EC9A8F1F791D6F428B2AA1319B6830CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce70a7e4-db75-4c58-1a99-08da27603035
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 08:38:50.4851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIJvEYUU2CwP7ljO7MT9G0vvDVwqy08aw1CZ5Q08umyFZskurkrYKryDliN3iTCl02HRCxxlwrgjNGOIeVYbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4462
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/22 8:37 AM, Jani Nikula wrote:
> On Tue, 26 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>> Hi folks:
>>
>> Here is the pull of gvt-next which fixs the compilation error when i915 =
debug
>> is open after the GVT-g refactor patches.
>>
>> Thanks so much for the efforts.
>=20
> Pulled, thanks.
>=20
> BR,
> Jani.
>=20
>>
I just updated the branch. Can you check a little bit if you got the newest=
 one?
>> Thanks,
>> Zhi.
>>
>> The following changes since commit 2917f53113be3b7a0f374e02cebe6d6b74936=
6b5:
>>
>>   vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-26
>>
>> for you to fetch changes up to 2da299cee780ea797b3f72558687868072cf5eb5:
>>
>>   drm/i915/gvt: Add missing export of symbols. (2022-04-25 18:03:04 -040=
0)
>>
>> ----------------------------------------------------------------
>> gvt-next-2022-04-26
>>
>> - Add two missing exports of symbols when i915 debug is enabled.
>>
>> ----------------------------------------------------------------
>> Zhi Wang (1):
>>       drm/i915/gvt: Add missing export of symbols.
>>
>>  drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>=20

