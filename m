Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD96F1D95
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 19:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0DE10E167;
	Fri, 28 Apr 2023 17:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3CD10E167;
 Fri, 28 Apr 2023 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682703842; x=1714239842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=xbGxK5Jjl/aWROXvZtVMawppxpifwTOh4Hs2aoY7YXg=;
 b=H4vGw3Lwh4C2yLuqELsJYQuWhVqEej6S/1PrXLvdTZSVTTR2VusBe0WM
 Jar1vsSqaxSBYICd3NqvMeHeZu6lOgY5WcBLqUMIgrakMCKwjeBDQ5VGs
 /2R/lDhJvWCUAufXdgZarHiB81suZNwcDgxrJVNQveLsQjy2n1piZrj8J
 6lFOaBTVa4SingZwTARm3uqneBsDRdgnKuhCQLSpMx/PMOwktxu49de1E
 Epo5dzaszTu+/WO3/K6yGtLOBLW51ZXjL/2c5VkivNnH2eEMbQ1Kr+UH6
 BxOAz/WtD57PM4nnqPYlgM8a+Z3G6s8ZyL1G98AsZd/C6x+AAUNlwZ6Oq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="336885299"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
 d="scan'208,217";a="336885299"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 10:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941168173"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
 d="scan'208,217";a="941168173"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2023 10:44:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 10:44:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 10:44:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 10:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QruwuyJEibtC12dyM/mypVuIOsiE55UW9XcDuhcokfQx6rKUlxpcOCmVgr/YIMcOKf8RgSbxixR+QiiRTPdHv5F+AVJ/Au5JqxeFLj+h+q8A6nSXq97zsF+oEvLLuPUp4x/3Ph9fO8ryfcFr7n3G7XP3uDj0gZuGvSX5ctjAuKr5JVNmtw2Y01GSYSgoC9YwdZ47YML8q7SbcnV0/i/cYArMj6+juW6n8DWxls4rwzTOnKKob0BFNJsd7gX5GiV556RCq8BETbZ4nDehkUD9enZz4VKdGUlksiecixzijRqGUsxipOJau49qDWaRODD0IWE5H+a76eMoeEZhUG+RJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8EPxtJvjqpycTym9gcebDZ4BG4QLA752qCU/eAZKFk=;
 b=eIzxVzk+wiORWWXpyqOviTB/bPJt3/M3GNbOZodkBokb0RleIWulvU0O7O8U6tJOYUkFo7B1NsMO/DYEYUWDS7nPDVx3LwbB//Hep1uE2jKPcmR1fyqljqF7dOeTIXWJ8rhbCgWuUZPg/wrcsDcn51efgGHuODmHbiMZOzhqgxvSmu0A5C7Z4Rd+p2b19Eg+2hzLXOJOQa8WfWSGP4qDtpWaGIn4uT21AsfURCJyJ8CZEZUBgeWoQtBq2inRnF66keiec+irkti4FYgnrkp245ro5X9QUaO2X7l5TNkMAHW1PtDd/Zg7O5rsMa8yQ2Wg20h6kkMN5M1BTvTCJ8is1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 17:43:58 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c%3]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 17:43:58 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZeZTO2gUkMdpWW0SrzgKyn7l+gq9AXZ+AgABuxEeAABWRgIAAGHcK
Date: Fri, 28 Apr 2023 17:43:58 +0000
Message-ID: <BYAPR11MB256741725865292D644140079A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230428054737.1765778-1-fei.yang@intel.com>
 <e1c73441-df6f-799c-eda0-8639067a0fea@shipmail.org>
 <BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
 <73356be7-f57e-154a-e587-2785d62e61cd@shipmail.org>
In-Reply-To: <73356be7-f57e-154a-e587-2785d62e61cd@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|MW6PR11MB8310:EE_
x-ms-office365-filtering-correlation-id: d738f70b-de23-4499-2171-08db48102579
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yWuUe3WTE4bm5mdLGc941xhfYb+ux00yaIzO5w0Lao1UIrhm9wjh8NL9grF//AZaA513pe//J7531BBAIpHdZgeOEcrfrZZtJcFrhzHF3LZy6qwqA10rt9RkiB10Axxu3IkzGHCmnxGLnCiA/S9VfQOIOxUWwS7rF3i4DL3SQOztuSFpQUEd0UvvBPxXs+uOnHVrMtyLBUYkzL3J0n8eKwBwv2ltvsGqEyZqAmvQS54h5iAm25UHaY8ZsNEIJt6wzSTQqI9D2nUBagE9G14N1HIvGqUEHm+6yQArJdx+b0dddiCYLAutFUgUZK21mT27kZML4/ojXKPU097P+uATssmIvyeGVixyJ3OSvtaDyyD2RQE18zW+Csn0+PSHTx7xaLBJx4te8mcfUNGY6KxsSHZkwFwv83Iulw5iRv2fz6ac5kuKp14Ct+k2/Ed/ppfzvtk5Ht36FCT15BnwuNcq/tCVbPMZIHQqw9kD35KvzdrsvOia/o8hW7WWzEQHqnw2YXPARhqdulbwmLTmOKjeqw/tiqkD4w4mGWDuv0s6OM8V/A5YEcaT8lveUbi+cCQh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(19627405001)(86362001)(33656002)(2906002)(38070700005)(55016003)(71200400001)(83380400001)(53546011)(6506007)(186003)(9686003)(966005)(26005)(478600001)(76116006)(66476007)(66556008)(122000001)(110136005)(66946007)(64756008)(38100700002)(5660300002)(7696005)(52536014)(41300700001)(8936002)(66446008)(4326008)(8676002)(82960400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/1pKazgSu7mW6uRVgrJlPYL8QDJPBlhHGy5wXYDHG1S8Yzg1diI1riVEc9?=
 =?iso-8859-1?Q?ISkCMhMbgHBsBKiDwpYeZCvEG/WZfdKlODDl6WSkaRnt37PGkqYWQzYoAa?=
 =?iso-8859-1?Q?XPYX3ir18+uIN2qBgsgjF9iWMTj5SqEuX8/pC7iZCcAFt902ObIlwursxk?=
 =?iso-8859-1?Q?D8q5gAjp1FBGuZDKTlxMeVgQSIxe9ww/vZBswgvX3tUvIxDd/slmbk1crP?=
 =?iso-8859-1?Q?/S89+VuBnCnTL/o2pKhEoAKQN7/8I2tw9YH5THrlulOXG9K35xEaVogIu5?=
 =?iso-8859-1?Q?cZYork/dZ98d2aof8rYtzXhrhIRX31/t89R5Ujkx2HowrVGMV/TQC5rj8u?=
 =?iso-8859-1?Q?6YTdviMlqeCbuOJUdVyM3zeOuTTQtmi4/6sNPmI1L+yXYSmbsO/MEIMWbb?=
 =?iso-8859-1?Q?nnbskkd/ktfCWvD7BIRMa96vfYaxb+7WNsmWb5QJvrw9tG02bK0xB9bVoi?=
 =?iso-8859-1?Q?Pfx+TheIpKvyJvSqwrNZYU0iiVDqV2e0+MIduYQpTenxSQLQRy7mGHQxWE?=
 =?iso-8859-1?Q?ztiYFi1Sclo5dyFqXqJD76P9C16Ly8sdhoXN4U5mBy7YhvwMM2tEYRIdG/?=
 =?iso-8859-1?Q?OTz0mgOe0rbfnQFFXf2VJNpKGPf8HRdm13KYlpN/iBmpZo5ZC+N2LouiUM?=
 =?iso-8859-1?Q?T1A9x8Kyy9JCTgGi1lgjR3Uv7+J/rS1SVAsscFbBF0Ml0vW21ck2ulk5CI?=
 =?iso-8859-1?Q?WTcLEZtfUwUXwZGP+s3Q2VdN8VzkBnBhF7t4uWLI1Kwq3iPunq5mzs4WiV?=
 =?iso-8859-1?Q?Ng2kq3lbUqvtM5wNDZ1H9GYJEkkDVmPO+Y8d/6YgTPJnYSRSQlqTosbJ8L?=
 =?iso-8859-1?Q?gA4oQD0j7uWE09t79wMrYcNqVOjchs8Mpp+o2xJBJmTWQtn13lRAD+QSKB?=
 =?iso-8859-1?Q?uNi1kVag4+7XasXXiE4PMLBJWyV4rY56aEUmmLFhTRxXrD1TDyetNsf1hX?=
 =?iso-8859-1?Q?OgCe2n0qd/KlNkDC9DoD7EdpRrKJC6tSX4YJeqZgs9SX/N9PB9cB9JkQr5?=
 =?iso-8859-1?Q?0epbhKfh6jHIiqaGSObKrPtmsWCyhZ1ZsVIK/kurN8sbbFtBsGqlfG+mqY?=
 =?iso-8859-1?Q?U9HoPSeJ8avYYpowY/8GhzMfWEtNEV2y3DaHFav8srFK2DtzPox18s9YE9?=
 =?iso-8859-1?Q?IW3+G8L089Ao9z3eDsmA46q8s4XHs2PPQ/vD7ZI3z63KPoPges+jXEKvMO?=
 =?iso-8859-1?Q?/DBVMr1f7pMpzFbTjYPhN5ySKi7skpmyrLUGd7eWgwMO5YZQIbVG45dwF4?=
 =?iso-8859-1?Q?K8zHvGxS70kkHg1I+prnLikjqVQ83tWxzCAFG2P8ujL/qlJooU83N2B+xc?=
 =?iso-8859-1?Q?/MbAsfZP5+WqD9312TJBfuQ8gjnHbko4SiyUWjDqJrFYiO2uRyeBLK2nPe?=
 =?iso-8859-1?Q?r/crGrhMFktCftP0o07Kc8ejzHEUUp6s01x3gGY8c7SJhl8njO+0FG1UgE?=
 =?iso-8859-1?Q?1FpGWrYysjnFhmbTSFoDeK2t6zwTlf/HyKotd4oDcvPAJnfW6NQ0ZBtmbM?=
 =?iso-8859-1?Q?bYTeB58B67uFRnTIbcbZjteb4KsoLUCmddpfhARDiylxZ7fVd5EFHwis1i?=
 =?iso-8859-1?Q?sJdzQ2ySyKeK86VnKzg+BhVXhcau1ObRQzCS4perfzdweqf2nxqqMJdS8H?=
 =?iso-8859-1?Q?MOlsHYPPhOHz0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB256741725865292D644140079A6B9BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d738f70b-de23-4499-2171-08db48102579
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 17:43:58.8393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8JCLZKe4sqyqVawvc12YWzj0E8JEfbrBoyKk8IkESeeJ0Vxhx9w4C/AcOd8aePqzNJqLtGcU9IRGj2MslMUoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB256741725865292D644140079A6B9BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>> On 4/28/23 17:19, Yang, Fei wrote:
>>> On 4/28/23 07:47, fei.yang@intel.com wrote:
>>>> From: Fei Yang <fei.yang@intel.com>
>>>>
>>>> The first three patches in this series are taken from
>>>> https://patchwork.freedesktop.org/series/116868/
>>>> These patches are included here because the last patch
>>>> has dependency on the pat_index refactor.
>>>>
>>>> This series is focusing on uAPI changes,
>>>> 1. end support for set caching ioctl [PATCH 4/5]
>>>> 2. add set_pat extension for gem_create [PATCH 5/5]
>>>>
>>>> v2: drop one patch that was merged separately
>>>>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
>>>> v3: rebase on https://patchwork.freedesktop.org/series/117082/
>>>
>>> Hi, Fei.
>>>
>>> Does this uAPI update also affect any discrete GPUs supported by i915,
>>
>> It does.
>>
>>> And in that case, does it allow setting non-snooping PAT indices on
>>> those devices?
>>
>> It allows setting PAT indices specified in
>> KMD does a sanity check so that it won't go over the max recommended
>> by bspec.
>>
>>> If so, since the uAPI for discrete GPU devices doesn't allow incoherenc=
y
>>> between GPU and CPU (apart from write-combining buffering), the correct
>>> CPU caching mode matching the PAT index needs to be selected for the
>>> buffer object in i915_ttm_select_tt_caching().
>>
>> The patch doesn't affect the CPU caching mode setting logic though.
>> And the caching settings for objects created by kernel should remain
>> the same for both CPU and GPU, objects created by userspace are
>> managed completely by userspace.
>>
>> One question though, what do you mean by non-snooping PAT indices?
>
> Yes, that was actually the bottom question: What do these PAT settings
> allow you to do WRT the snooping on supported discrete devices (DG2) on
> i915?
> If they indeed don't allow disabling snooping, then that's not a problem.

When dGPU's access SysMem, the PCIe default is for that access to snoop the
host's caches. All of our current dGPU's do that -- independent of PAT sett=
ing.

> If they do, the ttm code there needs some modification.

I'm not familiar with ttm, but if your concern is that certain PAT index
could disable snooping, that is not possible for current dGPU's.
I think it is possible for Xe2/3 though, because there will be COH_MODE
defined in the PAT registers going forward.

-Fei


--_000_BYAPR11MB256741725865292D644140079A6B9BYAPR11MB2567namp_
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
&gt;&gt; On 4/28/23 17:19, Yang, Fei wrote:
<div>&gt;&gt;&gt; On 4/28/23 07:47, fei.yang@intel.com wrote:</div>
<div>&gt;&gt;&gt;&gt; From: Fei Yang &lt;fei.yang@intel.com&gt;</div>
<div>&gt;&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt;&gt; The first three patches in this series are taken from=
</div>
<div>&gt;&gt;&gt;&gt; https://patchwork.freedesktop.org/series/116868/</div=
>
<div>&gt;&gt;&gt;&gt; These patches are included here because the last patc=
h</div>
<div>&gt;&gt;&gt;&gt; has dependency on the pat_index refactor.</div>
<div>&gt;&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt;&gt; This series is focusing on uAPI changes,</div>
<div>&gt;&gt;&gt;&gt; 1. end support for set caching ioctl [PATCH 4/5]</div=
>
<div>&gt;&gt;&gt;&gt; 2. add set_pat extension for gem_create [PATCH 5/5]</=
div>
<div>&gt;&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt;&gt; v2: drop one patch that was merged separately</div>
<div>&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp;341ad0e8e254 drm/i915/mtl: Add PT=
E encode function</div>
<div>&gt;&gt;&gt;&gt; v3: rebase on https://patchwork.freedesktop.org/serie=
s/117082/</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; Hi, Fei.</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; Does this uAPI update also affect any discrete GPUs suppo=
rted by i915,</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; It does.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;&gt; And in that case, does it allow setting non-snooping PAT =
indices on</div>
<div>&gt;&gt;&gt; those devices?</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; It allows setting PAT indices specified in</div>
<div>&gt;&gt; KMD does a sanity check so that it won't go over the max reco=
mmended</div>
<div>&gt;&gt; by bspec.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;&gt; If so, since the uAPI for discrete GPU devices doesn't al=
low incoherency</div>
<div>&gt;&gt;&gt; between GPU and CPU (apart from write-combining buffering=
), the correct</div>
<div>&gt;&gt;&gt; CPU caching mode matching the PAT index needs to be selec=
ted for the</div>
<div>&gt;&gt;&gt; buffer object in i915_ttm_select_tt_caching().</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; The patch doesn't affect the CPU caching mode setting logic t=
hough.</div>
<div>&gt;&gt; And the caching settings for objects created by kernel should=
 remain</div>
<div>&gt;&gt; the same for both CPU and GPU, objects created by userspace a=
re</div>
<div>&gt;&gt; managed completely by userspace.</div>
<div>&gt;&gt;</div>
<div class=3D"elementToProof">&gt;&gt; One question though, what do you mea=
n by non-snooping PAT indices?</div>
<div class=3D"elementToProof ContentPasted0">&gt;
<div class=3D"ContentPasted0">&gt; Yes, that was actually the bottom questi=
on: What do these PAT settings</div>
<div class=3D"ContentPasted0">&gt; allow you to do WRT the snooping on supp=
orted discrete devices (DG2) on</div>
<div class=3D"ContentPasted0">&gt; i915?</div>
<div class=3D"ContentPasted0">&gt; If they indeed don't allow disabling sno=
oping, then that's not a problem.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">When dGPU's access SysMem, the PCIe default i=
s for that access to snoop the</div>
<div class=3D"ContentPasted0">host's caches. All of our current dGPU's do t=
hat -- independent of PAT setting.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; If they do, the ttm code there needs som=
e modification.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I'm not familiar with ttm, but if your concer=
n is that certain PAT index</div>
<div class=3D"ContentPasted0">could disable snooping, that is not possible =
for current dGPU's.</div>
<div class=3D"ContentPasted0">I think it is possible for Xe2/3 though, beca=
use there will be COH_MODE</div>
<div class=3D"ContentPasted0">defined in the PAT registers going forward.</=
div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">-Fei</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB256741725865292D644140079A6B9BYAPR11MB2567namp_--
