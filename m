Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28DE50A0D0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1664010E808;
	Thu, 21 Apr 2022 13:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F017910E808;
 Thu, 21 Apr 2022 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650547682; x=1682083682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YNJTWfcW7XIFxqb38PNBQ3bpYGrKR1iLxfEZJXma2aM=;
 b=QglYep7tjTwUqTBTS6wBpPg2AEw2/UNsupcfcUzvqYFxAN8/qfqKcCuc
 uk6xMqK4DM9JUROK0Jwe6TfFS08BfQLQVZleGzfL6C9lFlGl3P3WenEIz
 +2tNA0TRQptBudxcvmhvOloISp8KaPKIXy7KV71q0VhS1RCrHgcCkEmgc
 9W68ZzMklXwE5gazbQloWJ7csYEU3eWlGjJu8qRPtUoKLcLlcbksaYTOT
 etcYLUyAl9O4G5uJXAhnagHieuBMmsnH1VdcSDcoS/eQtuGJ1xiuNWdId
 3LuCLM7TSFrC98h69xmzKoDCq270KT2ShaDpnbH9NeCgikub/DoLbUHnA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261949682"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="261949682"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 06:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="511066141"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 21 Apr 2022 06:28:02 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 06:28:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 06:28:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 06:28:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 06:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBkRPAXf+rHL5WiMdApmDKIZvdHJrJtLq+yC6HUKdsog9uU9KvlZcLb6qeOEyd4DibfM6blionQ1lokyG6g7EodWKMDigwwVDrcIWWT6zBa+kWYsVc5Vh5E8erCYLMT1AlZDAklqSN/8Fjb00IOM2xSRLYhVHeOpCWrxl2ci6CRIhu0sX7ccahu5nPNe5tiaGKCMTWabspcl9v7mRcbmshtLMKRJVQVrBnd3WvZ5aFSAL0PPHTfrX7jxZeAGbjJ/ZtJKAUVe/VK8NoZiXZyFYVHSFZqj8Z+yvLZaWomFjeU8QPko/wiTiyIX+4YXfU/vGqsxtbGy8rXQH6CZ8qJzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNJTWfcW7XIFxqb38PNBQ3bpYGrKR1iLxfEZJXma2aM=;
 b=CsSrJgME39QzFYC6vuqKceIPemCNH41sckqh2LVAyJV9G4kTqpNwImBKv8gL8heQ5SkLJBbD/30sQ72tB8KCZ+zxkzfjucb0rzhmYDF2wg0+2cfEUQg0vpDEnQArFHQSIOkCF7nZ1K9vJWf3FG6uH3HAg504W75lAmH8j+5vPiDlMwu0CABK75nT7UrkvdvOD5+8+qF5/klXI60aOPmB5wbnuUjtPGMNp9djuNS/NvhMnNb+AksgVRGpv3O2PhPq6770usQaM7mr/L6w1kjpwpk61QbEIiPxGEPEAh06Cwt+pEZ8UnGsUF9elNa3dnsi10t8tlocPmON5oGjIn31Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:27:59 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::588c:b026:fe27:2553]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::588c:b026:fe27:2553%7]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 13:27:59 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/i915/gt: GEM_BUG_ON unexpected NULL at
 scatterlist walking
Thread-Topic: [PATCH 1/4] drm/i915/gt: GEM_BUG_ON unexpected NULL at
 scatterlist walking
Thread-Index: AQHYVXQxa6OmG/3W30ycgj78GK2rR6z6XFGA
Date: Thu, 21 Apr 2022 13:27:59 +0000
Message-ID: <173edd6c6f5de5d6e596d9df109bfd019ce6ca14.camel@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
 <20220421113813.30796-2-ramalingam.c@intel.com>
In-Reply-To: <20220421113813.30796-2-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-3.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41e614ce-9c2a-4b33-ae83-08da239ac0fb
x-ms-traffictypediagnostic: BL1PR11MB5237:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL1PR11MB5237019EEBDCDC85E5BAC73197F49@BL1PR11MB5237.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T3y4q401eVfZdHztQkVdpC5fHYD1V6hRMGF3elNbJL0VcucfIXo0aWvcmTHfVzeP+1KHC/u+rPMLKzO9BlI+CKX3hDRI1Kj9clweG5NfXgMVJv43nCx/83ijXH1K5XaT//7Un9bzk6F+WsldPi8+1siRXUsG91MF44NVShOIsfU0p6xqRciyXC7r7gJuphTvVFwr/y12t4ubmU+sbtHqXVlszIEo0O1/Dp72yXPzykAcm1kVRNKrHCSazTBodl+a15pT7JzHO6hmY2r/xi+wELWCu2UyLsMC1qTf++siJVWw66cgGIxkyp+7z9YoobNtXzK2eTFM7d2fNz3eG4UD5XfDj6BTnWE39nOzZTU8Ad524K4DmJTb3wNpp9BC/hffO8iqB2Q/Wd6WGG2b4C2SYeELqhzcTqtn1r7u50vjk/V++51JEzi7ktivpVBMOljm/mxdA+7UXnJ7XvVUVmSYIcwVI6tOyMwhV0vC5oMxXe+PsaJ5jCXoXhwLgYONw0mBql4JnYfmbfNaSsqXL8gphAeqvGlEmVZk10rlX07OvRcKy4cMxP7RxLA7Y8O1hJgvD2mOAMVldj6mIAHPWwELgaKroAJzZnZURV8yk7ILN1smbg+lgF982OG1WW3tH06XYHzkBAG2gqCL+xeH49vQyIH5TbmVX8GpvLFEUCIA/S6jkAP1iOvWW0MEms5rRmzcydUTrxDyeOixofl/snGdJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(450100002)(71200400001)(76116006)(107886003)(6512007)(6506007)(26005)(6486002)(91956017)(316002)(86362001)(2616005)(110136005)(82960400001)(186003)(38070700005)(38100700002)(508600001)(66946007)(5660300002)(8936002)(4326008)(8676002)(64756008)(66556008)(66476007)(66446008)(122000001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekI1WkRMcmJxcElvbWQxSTNBdkJ5TjZVUDhmbCt5TW9YRHNVWmxDVk1wQmlH?=
 =?utf-8?B?aW9xM3JYY0lmbEtsdVZOMkNHbkNrSFhuYk1hUnlpVjB3aU1UQk41VlFvb2xE?=
 =?utf-8?B?dFJpTGZwZWJqNC9tZlB4QUVRT1ArWlZkdHRGbmRJVllpMlZSeTduU3dpM2lO?=
 =?utf-8?B?bTFWODBOU2lNd21VTVUzUkdoSmZFQWlFNjdwMWhQM3htQUc1a2hBNzgzcUNy?=
 =?utf-8?B?ZUtpMUJnSlh5U1lBdGJEem45cEdnL2ttVjNTc2dldm1nS09QZ3Vqd3hTbkxV?=
 =?utf-8?B?SlJDRitMWDkrOUhpQ1Z4dzFHUWZ6ZXUrYkExUFNKUktjNFNRRms0N0FEd29L?=
 =?utf-8?B?Szl3Q3dFa2x6ZHVkditlVWFYdjFIRFF5QzMwUXhobHp6UExDL3hmM2RoWVVY?=
 =?utf-8?B?MkJLWmFqU1ArUWJPVHZ6bCtUOGppUzVnTUl1RCtaKzNiQ2pxYW5kTW5SVXNl?=
 =?utf-8?B?cy8wYVBsQUVQZmN3andzUDAvdTNJVG9oemd6Njk3a1I0aFdIeVhqQmw0NWRQ?=
 =?utf-8?B?dllvV2VaWE0yZzlQVUE4N2FGaktxT25LRTdLOUE5c1kyZk5qV2JYUExkMWVq?=
 =?utf-8?B?LzY0NjZLc1VheVV6Um9PQlZZamRjeGx1cVczUHpXS1NLUWh4cHl4L3JZS2Vu?=
 =?utf-8?B?ZmJ3ZVp1bGJsN05qTDhaMFF2QitwZFRETlJBTGF4TjMzcUo5YUVoTXdUTjVB?=
 =?utf-8?B?S1h1RmZ0Q0pxcjh6di9VNmxaMkhVSzlERm9pam9MNkxKb0hjTU1IVzR5RDhu?=
 =?utf-8?B?VGNMdCt1Y3prdldNOGVORVBoa29iUDBRT2t4U1VNSGd5cm51VncxNDExaTVo?=
 =?utf-8?B?ckZCekQ4V1BTeHQ3S2J1VkdBckhaWHFVdkkvWUpTWG1VUUlpalpBWVN6WDY0?=
 =?utf-8?B?OU14NUZQK3pVQWw3aXFlbzBUUjVZaExCcUtxSFhKZm5KTUxTWjNPQ1dkblBt?=
 =?utf-8?B?ZFZSRDNJVnBmdWsrYjRKd0xnNUFibUg0M3kzaVVXRS9jZ0orc21uNUlDNUFs?=
 =?utf-8?B?blZobDRZS1VoeWR0SjRweXB2d3RGN1UzOFQycFdSZ0xsZzhPcUJGMnJ6ZXkw?=
 =?utf-8?B?aFc1dmMxWGx3a1VSL2pVbmVBdHN3bkhlQnFPUngrdGI2Mk1jR01iR0hvdEhM?=
 =?utf-8?B?NlIyR0R2MVEveWx2WWJkVHYrVkZFMTZtbzBkVEdVVXRjZmVUQlNaS1NuOE1C?=
 =?utf-8?B?YW5sUE9rZGpYWjhRWW5oKzhWQ2NON1c3T1VPMGdnMGhKS3NqMWcyUkRKQm9V?=
 =?utf-8?B?QnQvV01Jc0NmNnBIVWM1LzE0U3NBRU9JYkd4V0R4WUdoUkJSdU9INVJBM0dK?=
 =?utf-8?B?eTk0cjJTTXdwemJacGVsV2xITHdvcFNMbjlHZFZGTkhxaVBvODlTRncwTFZS?=
 =?utf-8?B?cFc0K3UxeGY3Q0hWTnE1NHc1a0RVMnY5YVBob0xTaHJnVnl4VDNQakp6MVMw?=
 =?utf-8?B?Sk9vZ2ZSWkJjbG16Q002QTcrdjV3YVNOZVdpK0YwbE9CdGlSWS9YSStSaFlB?=
 =?utf-8?B?QWkrZkNlSWk2SFhPbmtSVTlUZHNiRmpZeHIrYzZxNzRvbnN4MCthYzdOSjZC?=
 =?utf-8?B?TmIzK0pUNmpzNTNJRFU1cHNTZkhFRmVMdXV0SDVpajFMM0xEaUxjNUhiM0pT?=
 =?utf-8?B?ZTcrTzRmS1ExR0ZCaVRGem4rV2JEZVNtS0JOaGx0ME1LYVZ2bTI4Z1BFOFRm?=
 =?utf-8?B?anphQ0dQTkMzUXh2UUVpR093T0dUcWY2MFhvRVNCYm5qcHh5SnJYWGthWGJp?=
 =?utf-8?B?S2lVVnNLcEoyUWFWRXY0OHhiL0V0UC9sYXp2dmdlTVNjS2dMblpRd00yMHdt?=
 =?utf-8?B?enNCRlUzMmtOam9jZ0M4ODc4TnlkYzBFQnFmaEZWZ3JBYVV4bUhDdHZkaExJ?=
 =?utf-8?B?Z3RaRmlkS0Z2cmMxOVZKS3hZbFlJVS92Q1U2dTQxYXlabk1NNU02RWhpSVk0?=
 =?utf-8?B?NGNNOW1mZFNuMlA5Q1dCa0hMc3hnc05KNXBYbUkyNlNnT3RBL21Jd0FIRjF1?=
 =?utf-8?B?WW9GTXhYblpHbzRWWVd3a2FtdWxseGUwd0pvWVNaMVNiejkyblgvRlRkbktJ?=
 =?utf-8?B?dW9IVnRnTW1iajI4eXc3WnM1U2FUOURsV0pqVnR4VHJ4NE1Kb0pTaDUwRmZ4?=
 =?utf-8?B?MFhTemN0MW1tZ0lCUEZ3bVN4anhmUVpHc1F5MVhFNHhETHhLS0llc2J3MWZL?=
 =?utf-8?B?WDZ5YnZlVmNhVjhNRFRVSWlzK2lmb1dnUG0zT081a2dMZXdPTVpSZ1JaOW5Z?=
 =?utf-8?B?VDdxbnRoOUtwVzNaV2wvZlFPdnY5SFU4a0RWU21OZjZFbnNYd0VXUmMxWGxZ?=
 =?utf-8?B?ZkUzNEtoVFBCZEZuOWFUYlh0UkhEamdhQU9XT0VHNHZzSk9GMS9BSU8ralY0?=
 =?utf-8?Q?Vprj+KD5RcDrnt1U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3EB4925440EF04884347651E0569503@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e614ce-9c2a-4b33-ae83-08da239ac0fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:27:59.4752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9X+QAPLIfTzlIA3ounp934D2mO7zd3k8V1H9OPbUeR7gRwBecQyD4ONbKkCbeqnsb9AzLxyBqSOWgDL/aKhSQxQaeQqYReBVqIH00ElTY4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA0LTIxIGF0IDE3OjA4ICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4g
V2hpbGUgbG9jYXRpbmcgdGhlIHN0YXJ0IG9mIGNjcyBzY2F0dGVybGlzdCBpbiBzbWVtIHNjYXR0
ZXJsaXN0LCB0aGF0Cj4gaGFzCj4gdG8gYmUgdGhlIHNpemUgb2YgbG1lbSBvYmogc2l6ZSArIGNv
cnJlc3BvbmRpbmcgY2NzIGRhdGEgc2l6ZS4gUmVwb3J0Cj4gYnVnCj4gaWYgc2NhdHRlcmxpc3Qg
dGVybWluYXRlIGJlZm9yZSB0aGF0IGxlbmd0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGlu
Z2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9taWdyYXRlLmMgfCA2ICsrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9taWdyYXRlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUu
Ywo+IGluZGV4IDlkNTUyZjMwYjYyNy4uMjlkNzYxZGEwMmM0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYwo+IEBAIC02ODcsNiArNjg3LDEyIEBAIHN0YXRpYyB2
b2lkIGdldF9jY3Nfc2dfc2d0KHN0cnVjdCBzZ3RfZG1hICppdCwKPiB1MzIgYnl0ZXNfdG9fY3B5
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnl0ZXNfdG9fY3B5IC09IGxlbjsK
PiDCoAoKCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpdC0+c2cgPSBfX3NnX25l
eHQoaXQtPnNnKTsKCklmIGJ5dGVzX3RvX2NweSA9PSAwIGhlcmUsIGNvdWxkbid0IGl0LT5zZyBi
ZSBOVUxMIHRoZW4/Cgo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc2NhdHRlcmxpc3Qgc3VwcG9zZWQgdG8g
YmUgdGhlIHNpemUgb2YKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYnl0ZXNf
dG9fY3B5ICsgR0VUX0NDU19CWVRFUyhieXRlc190b19jb3B5KS4KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdFTV9C
VUdfT04oIWl0LT5zZyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpdC0+ZG1h
ID0gc2dfZG1hX2FkZHJlc3MoaXQtPnNnKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGl0LT5tYXggPSBpdC0+ZG1hICsgc2dfZG1hX2xlbihpdC0+c2cpOwo+IMKgwqDCoMKgwqDC
oMKgwqB9IHdoaWxlIChieXRlc190b19jcHkpOwoKL1Rob21hcwoK
