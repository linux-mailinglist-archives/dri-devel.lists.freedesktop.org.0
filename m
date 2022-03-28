Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B14EA3E7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 01:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3760110EE32;
	Mon, 28 Mar 2022 23:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7AB10EE32
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 23:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648511940; x=1680047940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kOpz971qK4RHXgCOmw9n9Fzd3A4pjjKvU6Hw0SvgWwY=;
 b=DIUqvYmOg9tEAyi7qGax+D2iZXYt+QOsCcYJNOcs67XtosPqXUuqJJxq
 sanT19gjppRCcB29mwBazeTjUoHHZ0OK3yJMrV65GbQrp3bZXBmvb0SFU
 4/9ukJuQh5hRdzIiQw4PCZeCv/Sec++hMrZuhc2/Qx51per9L3PQ8uqyw
 564s91pO3VAq6jhPyzVlt0xDOgORU9f1fqAFQd5/Bm13ArePEhafhkOmE
 PVMl3tZreskENIWI6JNakxN4LNHC61y7Cg9lotjwclVtv53nyPOfVBYWa
 /OfgDr8VV41m4RGXkxQdTWrxNYaI9BI9lK4QTjdUKdL40erRnRmnL8PMi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246615369"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="246615369"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 16:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="694531929"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2022 16:58:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 16:58:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 16:58:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 16:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7rtiTEmciMA6+T3nAiBBkdNDrHhlbWSG48hIs4qKrTnouw3ppdCU6KgCsjh2/tY7swmZ+00jZ0DomWfJVGdfChG65zSv4eUkOxjy9TKfn+Qar3fQV7KdhpWPHywLtSBhlurFMbTUnpUg9QXfrYshr3qKQ2/GOHtQsCcZGnNxMOxrCLv6QkFnzjA0KXcq/6AK5DG/y+41v6WthRhS10mOmTpxz+FF41ylmxSKkII1EkE/WJt637EaDhMBLKxkjZzsoJBq0EQugkQpNe49ccrRdvBSF1T++GzToj9TzY7fAl9OF47OHrm+4X57evzNPdiECN8KvfHIKecu7RHHlToAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOpz971qK4RHXgCOmw9n9Fzd3A4pjjKvU6Hw0SvgWwY=;
 b=DMPAme4B1rXtjkfoDHxhVKhaQvM0UzB9BKo8mFpdLQEAYyYId5WUOiT9gzLELYReuDvyktKfe/7BuKWl8L4uHChT+/sZ9QnsvTiiXHaA9gHDd+Tnv5VRZnXj1YxzIGCOg7T3QjHo68e6vNDRsDuLGFPhlJX1a/k9cGjt7ZvRUFAxZuGeGysFWzgfFxCBsfFBl3oUFxyIOBD2w9iNVan0DjVXYQvWtLLh9KByMrAXYCVp08fXkXPKjsDAaniwcJQlTECzeDV91skC8sNRrmtFTSTcPQTHhG1CkMz/ODThaxWPc+05GhWcsYChPY0k7r0DOuffCOB0Rn2cTZucoVi+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SN6PR11MB2927.namprd11.prod.outlook.com (2603:10b6:805:cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 23:58:56 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::55fe:1d31:4f97:9f92]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::55fe:1d31:4f97:9f92%6]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 23:58:56 +0000
From: "Liu, Chuansheng" <chuansheng.liu@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH] fbdev: defio: fix the pagelist corruption
Thread-Topic: [PATCH] fbdev: defio: fix the pagelist corruption
Thread-Index: AQHYOcSRnc9LTAQJmE6ZG+PF4wN6xazRXpEAgAKlKOCAAF8dAIABKG+w
Date: Mon, 28 Mar 2022 23:58:55 +0000
Message-ID: <BL1PR11MB544534F78BE2AB3502981AE5971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
 <c058f18b-3dae-9ceb-57b4-ed62fedef50a@molgen.mpg.de>
 <BL1PR11MB54455684D2A1B4F0A666F861971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
 <502adc88-740f-fd68-d870-4f5577e1254d@molgen.mpg.de>
In-Reply-To: <502adc88-740f-fd68-d870-4f5577e1254d@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7def2c2b-f303-4c12-a347-08da1116eb44
x-ms-traffictypediagnostic: SN6PR11MB2927:EE_
x-microsoft-antispam-prvs: <SN6PR11MB29276E1C4BE1E8857A13D0AE971D9@SN6PR11MB2927.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IwH+G2HYL8C4vXe2Ac2TzOJARwczcmWiXZDLtgzNLm6iE1UmLrvTrfAQgWX00klNUwiNE+Vcojt5phmjxM6p5Ro7UW9tX6Xkz9h4u7df1QJHDX8M+cj+JvYrlci16Eqm2W+OSeYQxZlXQgpNHk+fHN+OwGVWTLsvhXWWLuXDbUnVKAPqqF4YP8LOWhB9MWdMKqtMEuo5kphok+kRtN5vSC+MCWe6LMRTTPNjVahE+TRevcdT8IoIlkpbP9dlaghZz6iOJjZ71/Pe8Sn3wCymFa8nKZ/xhk4qIrUr8h6v0DKIoQYFY3mQQ8FglFSUi0XIb21H/7F07rsoVqMsh5yHhA4ymQWmTLBSV4ncIyuCq4Vrv2kSWtduRwWJMa2vDnRHzOqTs/Ub7yRSAwu3SZus2dHBDcIHMsKKXdzUkLsIPBUTzCumd+TOEdEcsdvdJP4kuIsPfKrfUhFgmULQvOPiV98h4xmrXIy9zOKP7fY0FsIEY34703OXGiorNzdO0b5tcoqKDDv52UzUjIbdy8NwtuwakBbG6cF1t5ssfYPetuuGtjoVLk/Rq0bJjtVxwsiF2Jpe0y4JS7Hk3tlnfwZQl/DpUga7K8dLeaWe++DMIQ7D/DRJXcIKhUTdmew6UyGEzy+D3khlj9x2SC1ESz4OVmkflLv2XzMo403VgJehRdG5RSQaQOipdSKq6I9X8NUWSTcS3vFxHREKLgJjDL8Vug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(4326008)(66946007)(71200400001)(66556008)(76116006)(66476007)(64756008)(53546011)(86362001)(82960400001)(26005)(186003)(2906002)(66446008)(7696005)(83380400001)(33656002)(54906003)(6506007)(6916009)(9686003)(508600001)(316002)(52536014)(8936002)(38100700002)(5660300002)(38070700005)(55016003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkwvYVc0WmZ6NmRHWTlVdHBhR2wrTDAzRER4Sk5LMUhNdHpHV2xpWmIyWS81?=
 =?utf-8?B?c2JseXVYY1BNL09UdEEvMGRYc0d2MTAzQzhDYW9BMnJZM3Y4T0ozaW5peHZT?=
 =?utf-8?B?a2hnb0h5OFkwMmRjS3crZktpUEF2dEMrNW5pUEkyN0x6TmduRW9vRmx2M1lS?=
 =?utf-8?B?SENaUzdUR2ZZT1N2WVJlRzlDSXhMMFNjMW1WWkwxUlA1SlF3WVJFdlBYSytO?=
 =?utf-8?B?WmthWTkwV1k5QlNzWG02bEJkVXBxRUViSDdyZC9YODdJOUdwelRlRWNNdUNW?=
 =?utf-8?B?RVRkcnZoejVSSS83SjZDd1psZXNicVRCVlpVRUJ4VXJvL2ZLMDdXV2dGZWRW?=
 =?utf-8?B?ZVdUcWdYRE16Y1I1S1VmMFJjUmhURmlrZlI3ZmYwUjVzdGFHRGVmTW02NUN0?=
 =?utf-8?B?MEQ5VFFCTW5oWW5Bd2oxR3lFdFlxRFRQbmg4OVV4R0IyUFFkU3V3VUExNjlY?=
 =?utf-8?B?OC9EYmRGVU02WGtEM0pxSHRSRWR3cmxzZXJRdjNPR2IvanRFK2xqTmVyVEhP?=
 =?utf-8?B?MkF2SlRuSWV5NzVNWnpEcUxGR09YWnpRTndqRVpESzUvV0VDcG5YNGdObFJC?=
 =?utf-8?B?QXBueFl3bHVWTE5UQ0t0c0pET2FQM3R4WjZlVWpLZmpSRUs1bGhkMUovZlpI?=
 =?utf-8?B?ckJzeUZ0RER0cVdIOHVCYklhSXpOUzliemhIeWd6Um81Q3JRZ0t6NEpDWDBO?=
 =?utf-8?B?bTF3MjJmbFZBQXRiYnJRR2pad3ZuWnNBVGtzYXFLNHBhVDRoMldpRGc1WlU2?=
 =?utf-8?B?SWdrK0NKZTZadFN4SkFBOTJaWHQvNElVQ0R6MTltYjZDNTNteXR6RU9XWTlY?=
 =?utf-8?B?UWQvTmxndlkyQUV6OG1UdWJySFpWSjB0RjV1R0cxb0RaNmFUb21NVXZlSUxM?=
 =?utf-8?B?dTZ5ZjkrcWFYdi9rck1nZWdOa0xyU2liWmZqRmlBdlFTRmZhM2VRa213RGdN?=
 =?utf-8?B?VDRFQ3ZEMlpQalNLT0ZpWnN6TDBrUWtlS2toMjVreHFaNWJ3WTh3QUZ0UW5O?=
 =?utf-8?B?Z21mSlpSTW1QcEhOSkhnQ20wMDREd0I1NEhRdTcrcDIySWNxdWZNREdwcWZF?=
 =?utf-8?B?M05saGUwamRpQk90NmgrUkUybXJtMFFDN054M1FEZXc3RE52TVcvdEdlcnZj?=
 =?utf-8?B?Zll2V1kyNHd1YkcwNlFqNzMzWjFUWVdReElBQWJmM292ZGdXZEdGLzZIQ3Jh?=
 =?utf-8?B?Rlp6WUxnaXVubTF2QWRQdnhNb0UvUm03YUttRVZheVhHaW94QTk0bk1oUmxT?=
 =?utf-8?B?ZzM0VTJ1QTNJQzl2ZnRYYW9PYnVyMmJzSm1kVENjRmtiVmFhWDU0dnRtWmg3?=
 =?utf-8?B?NGs1MmlobEJwNXY3K3QwNDlqRGJlcGZ6MlFuS1ZrZG0xME9TNXo2ZW4waWNm?=
 =?utf-8?B?UXJjQ3I1akVIK1RYTzVEZEw0ckozT1dmWHBOUWVWTWF1eXVCQmlkYytRMTll?=
 =?utf-8?B?YmY4N2dGWkZqQm9jMU1NZzJpdVJuRUwrTkRkVjYvZzVmZkJ3bW9ibFZuUHUy?=
 =?utf-8?B?d1plOUhGOTNTY04weS9BSnZ5Wm1tQzRrRkdsL05QekdlajZIMDhGSkVVVWFK?=
 =?utf-8?B?cWFnSXc3ck1YNWtTaE9iSkZwb08vbWJFMUhJN3pOOTlDQVFONldYVnZqZDc1?=
 =?utf-8?B?YUxscGp4U2lUUzY2QWZycjNuR3JhdVVHWnFsM3Z1b3BEc0FLc1MyNXNLZXp0?=
 =?utf-8?B?T0lxQndITmpVdFI1UDRtaWk5VlVPdGNqYUh3U1JISVhsZVEwQUpmNnZ1bmxv?=
 =?utf-8?B?M0NSUTRHd0RrRXVFUEh2NzZUQjNCM1lpazg2K2JQUS9HSEp4bDg1QjF3elh5?=
 =?utf-8?B?blRZYlNpZkxVeVVSVmVJWlQ0SnBORnZ6WDVzY2d0SVVBV1hsbVJrTmJoUDla?=
 =?utf-8?B?S3p5b1lCazJURFo0a1hIdXJGL3hxRkNLcFAvQThUdUU0RUl3REl2QjVNVjBY?=
 =?utf-8?B?bFZwNURNNDU2VFZKSXVZd2NPeEEwZTM2ZFpBb21qc1grb1kzS1ZHNkVSVUFX?=
 =?utf-8?B?cGxvY0tGUmFVZzI2YS9KYUpXTW0yVjlYa0FWOWRqQkN6bm9OdGRtek91dWtT?=
 =?utf-8?B?dXk4Z2ROR2s5Z2tMb0MzbFJiYi9MaHdYZkNPVG93SEhhRlJtOStIZVNybTBs?=
 =?utf-8?B?eGZGeHg5Qlk5V1BrNkYwb2ZLOEpDSWZkQjVyclNHNGRhUTZJYjFCSTFmeWlP?=
 =?utf-8?B?Mk85dC9WWERVOEs0VDJLUFdlS053VUFYUVBRVW8xQk9ENHFSNm9IWUhnUTJm?=
 =?utf-8?B?QjVCZi9sTkRJSGlQWlpMSUZjNTdoZ2ordEFVTzUzZGpUcFNRNksyN1BGWS9k?=
 =?utf-8?B?UE9uL2pSbEZkWGNMWUNJK2xRS3FQbUd6MkFOUWEyZ3c5RFh2cHJacmxDTnlZ?=
 =?utf-8?Q?g5ycduFpbG4LAeB8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7def2c2b-f303-4c12-a347-08da1116eb44
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 23:58:55.9349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2M5Y7Na8oKuCib0Uu8xEHypNu9Fb9RyOQ82lPl9peM2VnQGs60NETwUDTD9h8gbcM1km6EAkhT1i6oXfF5FCJ+/EHbTDcWWizUkPzI7ZeNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2927
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
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jayalk@intworks.biz" <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IFBhdWwNCj4gTWVuemVsDQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjgsIDIwMjIgMjoxNSBQTQ0K
PiBUbzogTGl1LCBDaHVhbnNoZW5nIDxjaHVhbnNoZW5nLmxpdUBpbnRlbC5jb20+DQo+IENjOiB0
emltbWVybWFubkBzdXNlLmRlOyBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmc7IGRlbGxlckBn
bXguZGU7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBqYXlhbGtAaW50d29y
a3MuYml6DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGZiZGV2OiBkZWZpbzogZml4IHRoZSBwYWdl
bGlzdCBjb3JydXB0aW9uDQo+IA0KPiBEZWFyIENodWFuc2hlbmcsDQo+IA0KPiANCj4gQW0gMjgu
MDMuMjIgdW0gMDI6NTggc2NocmllYiBMaXUsIENodWFuc2hlbmc6DQo+IA0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiANCj4gPj4gU2VudDogU2F0dXJkYXksIE1hcmNoIDI2LCAy
MDIyIDQ6MTEgUE0NCj4gDQo+ID4+IEFtIDE3LjAzLjIyIHVtIDA2OjQ2IHNjaHJpZWIgQ2h1YW5z
aGVuZyBMaXU6DQo+ID4+PiBFYXNpbHkgaGl0IHRoZSBiZWxvdyBsaXN0IGNvcnJ1cHRpb246DQo+
ID4+PiA9PQ0KPiA+Pj4gbGlzdF9hZGQgY29ycnVwdGlvbi4gcHJldi0+bmV4dCBzaG91bGQgYmUg
bmV4dCAoZmZmZmZmZmZjMGNlYjA5MCksIGJ1dA0KPiA+Pj4gd2FzIGZmZmZlYzYwNDUwN2VkYzgu
IChwcmV2PWZmZmZlYzYwNDUwN2VkYzgpLg0KPiA+Pj4gV0FSTklORzogQ1BVOiA2NSBQSUQ6IDM5
NTkgYXQgbGliL2xpc3RfZGVidWcuYzoyNg0KPiA+Pj4gX19saXN0X2FkZF92YWxpZCsweDUzLzB4
ODANCj4gPj4+IENQVTogNjUgUElEOiAzOTU5IENvbW06IGZiZGV2IFRhaW50ZWQ6IEcgICAgIFUN
Cj4gPj4+IFJJUDogMDAxMDpfX2xpc3RfYWRkX3ZhbGlkKzB4NTMvMHg4MA0KPiA+Pj4gQ2FsbCBU
cmFjZToNCj4gPj4+ICAgIDxUQVNLPg0KPiA+Pj4gICAgZmJfZGVmZXJyZWRfaW9fbWt3cml0ZSsw
eGVhLzB4MTUwDQo+ID4+PiAgICBkb19wYWdlX21rd3JpdGUrMHg1Ny8weGMwDQo+ID4+PiAgICBk
b193cF9wYWdlKzB4Mjc4LzB4MmYwDQo+ID4+PiAgICBfX2hhbmRsZV9tbV9mYXVsdCsweGRjMi8w
eDE1OTANCj4gPj4+ICAgIGhhbmRsZV9tbV9mYXVsdCsweGRkLzB4MmMwDQo+ID4+PiAgICBkb191
c2VyX2FkZHJfZmF1bHQrMHgxZDMvMHg2NTANCj4gPj4+ICAgIGV4Y19wYWdlX2ZhdWx0KzB4Nzcv
MHgxODANCj4gPj4+ICAgID8gYXNtX2V4Y19wYWdlX2ZhdWx0KzB4OC8weDMwDQo+ID4+PiAgICBh
c21fZXhjX3BhZ2VfZmF1bHQrMHgxZS8weDMwDQo+ID4+PiBSSVA6IDAwMzM6MHg3ZmQ5OGZjOGZh
ZDENCj4gPj4+ID09DQo+ID4+Pg0KPiA+Pj4gRmlndXJlIG91dCB0aGUgcmFjZSBoYXBwZW5zIHdo
ZW4gb25lIHByb2Nlc3MgaXMgYWRkaW5nICZwYWdlLT5scnUgaW50bw0KPiA+Pj4gdGhlIHBhZ2Vs
aXN0IHRhaWwgaW4gZmJfZGVmZXJyZWRfaW9fbWt3cml0ZSgpLCBhbm90aGVyIHByb2Nlc3MgaXMN
Cj4gPj4+IHJlLWluaXRpYWxpemluZyB0aGUgc2FtZSAmcGFnZS0+bHJ1IGluIGZiX2RlZmVycmVk
X2lvX2ZhdWx0KCksIHdoaWNoIGlzDQo+ID4+PiBub3QgcHJvdGVjdGVkIGJ5IHRoZSBsb2NrLg0K
PiA+Pj4NCj4gPj4+IFRoaXMgZml4IGlzIHRvIGluaXQgYWxsIHRoZSBwYWdlIGxpc3RzIG9uZSB0
aW1lIGR1cmluZyBpbml0aWFsaXphdGlvbiwNCj4gPj4+IGl0IG5vdCBvbmx5IGZpeGVzIHRoZSBs
aXN0IGNvcnJ1cHRpb24sIGJ1dCBhbHNvIGF2b2lkcyBJTklUX0xJU1RfSEVBRCgpDQo+ID4+PiBy
ZWR1bmRhbnRseS4NCj4gPj4+DQo+ID4+PiBGaXhlczogMTA1YTk0MDQxNmZjICgiZmJkZXYvZGVm
aW86IEVhcmx5LW91dCBpZiBwYWdlIGlzIGFscmVhZHkgZW5saXN0ZWQiKQ0KPiA+Pj4gQ2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogQ2h1YW5zaGVuZyBMaXUgPGNodWFuc2hlbmcubGl1QGludGVsLmNvbT4NCj4gPj4+IC0tLQ0K
PiA+Pj4gICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMgfCA5ICsrKysrKysr
LQ0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJf
ZGVmaW8uYw0KPiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+ID4+PiBp
bmRleCA5OGIwZjIzYmY1ZTIuLmVhZmI2NmNhNGYyOCAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+ID4+PiArKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiA+Pj4gQEAgLTU5LDcgKzU5LDYgQEAgc3RhdGljIHZt
X2ZhdWx0X3QgZmJfZGVmZXJyZWRfaW9fZmF1bHQoc3RydWN0IHZtX2ZhdWx0DQo+ICp2bWYpDQo+
ID4+PiAgICAJCXByaW50ayhLRVJOX0VSUiAibm8gbWFwcGluZyBhdmFpbGFibGVcbiIpOw0KPiA+
Pj4NCj4gPj4+ICAgIAlCVUdfT04oIXBhZ2UtPm1hcHBpbmcpOw0KPiA+Pj4gLQlJTklUX0xJU1Rf
SEVBRCgmcGFnZS0+bHJ1KTsNCj4gPj4+ICAgIAlwYWdlLT5pbmRleCA9IHZtZi0+cGdvZmY7DQo+
ID4+Pg0KPiA+Pj4gICAgCXZtZi0+cGFnZSA9IHBhZ2U7DQo+ID4+PiBAQCAtMjIwLDYgKzIxOSw4
IEBAIHN0YXRpYyB2b2lkIGZiX2RlZmVycmVkX2lvX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0DQo+
ICp3b3JrKQ0KPiA+Pj4gICAgdm9pZCBmYl9kZWZlcnJlZF9pb19pbml0KHN0cnVjdCBmYl9pbmZv
ICppbmZvKQ0KPiA+Pj4gICAgew0KPiA+Pj4gICAgCXN0cnVjdCBmYl9kZWZlcnJlZF9pbyAqZmJk
ZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+ID4+PiArCXN0cnVjdCBwYWdlICpwYWdlOw0KPiA+Pj4g
KwlpbnQgaTsNCj4gPj4+DQo+ID4+PiAgICAJQlVHX09OKCFmYmRlZmlvKTsNCj4gPj4+ICAgIAlt
dXRleF9pbml0KCZmYmRlZmlvLT5sb2NrKTsNCj4gPj4+IEBAIC0yMjcsNiArMjI4LDEyIEBAIHZv
aWQgZmJfZGVmZXJyZWRfaW9faW5pdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gPj4+ICAgIAlJ
TklUX0xJU1RfSEVBRCgmZmJkZWZpby0+cGFnZWxpc3QpOw0KPiA+Pj4gICAgCWlmIChmYmRlZmlv
LT5kZWxheSA9PSAwKSAvKiBzZXQgYSBkZWZhdWx0IG9mIDEgcyAqLw0KPiA+Pj4gICAgCQlmYmRl
ZmlvLT5kZWxheSA9IEhaOw0KPiA+Pj4gKw0KPiA+Pj4gKwkvKiBpbml0aWFsaXplIGFsbCB0aGUg
cGFnZSBsaXN0cyBvbmUgdGltZSAqLw0KPiA+Pj4gKwlmb3IgKGkgPSAwOyBpIDwgaW5mby0+Zml4
LnNtZW1fbGVuOyBpICs9IFBBR0VfU0laRSkgew0KPiA+Pj4gKwkJcGFnZSA9IGZiX2RlZmVycmVk
X2lvX3BhZ2UoaW5mbywgaSk7DQo+ID4+PiArCQlJTklUX0xJU1RfSEVBRCgmcGFnZS0+bHJ1KTsN
Cj4gPj4+ICsJfQ0KPiA+Pj4gICAgfQ0KPiA+Pj4gICAgRVhQT1JUX1NZTUJPTF9HUEwoZmJfZGVm
ZXJyZWRfaW9faW5pdCk7DQo+ID4+Pg0KPiA+PiBBcHBseWluZyB5b3VyIHBhdGNoIG9uIHRvcCBv
ZiBjdXJyZW50IExpbnVz4oCZIG1hc3RlciBicmFuY2gsIHR0eTAgaXMNCj4gPj4gdW51c2FibGUg
YW5kIGxvb2tzIGZyb3plbi4gU29tZXRpbWVzIG5ldHdvcmsgY2FyZCBzdGlsbCB3b3Jrcywgc29t
ZXRpbWVzDQo+ID4+IG5vdC4NCj4gPg0KPiA+IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgcGF0Y2ggd291
bGQgY2F1c2UgYmVsb3cgQlVHIGNhbGwgc3RhY2ssIG5lZWQgc29tZSB0aW1lDQo+IHRvDQo+ID4g
ZGVidWcuIEp1c3QgZmV3IGNvbW1lbnRzOg0KPiA+IDEuIFdpbGwgdGhlIHN5c3RlbSB3b3JrIHdl
bGwgd2l0aG91dCB0aGlzIHBhdGNoPw0KPiANCj4gWWVzLCB0aGUgZnJhbWVidWZmZXIgd29ya3Mg
d2VsbCB3aXRob3V0IHRoZSBwYXRjaC4NCj4gDQo+ID4gMi4gV2hlbiB5b3UgYXJlIHN1cmUgdGhl
IHBhdGNoIGNhdXNlcyB0aGUgcmVncmVzc2lvbiB5b3Ugc2F3LCBwbGVhc2UgZ2V0IGZyZWUNCj4g
dG8gc3VibWl0DQo+ID4gb25lIHJldmVydGVkIHBhdGNoLCB0aGFua3MgOiApDQo+IA0KPiBJIHRo
aW5rIHlvdSBmb3IgcGF0Y2ggd2FzbuKAmXQgc3VibWl0dGVkIHlldCDigJMgYXQgbGVhc3Qgbm90
IHB1bGxlZCBieSBMaW51cy4NClRoZSBwYXRjaCBoYXMgYmVlbiBpbiBkcm0tdGlwLCBjb3VsZCB5
b3UgaGF2ZSBhIHRyeSB3aXRoIHRoZSBsYXRlc3QgZHJtLXRpcCB0byBzZWUgaWYgdGhlDQpGcmFt
ZWJ1ZmZlciB3b3JrcyB3ZWxsLCBpbiB0aGF0IGNhc2UsIHdlIGNvdWxkIHJldmVydCBpdCBpbiBk
cm0tdGlwIHRoZW4uDQoNCkJlc3QgUmVnYXJkcw0KQ2h1YW5zaGVuZw0KDQo=
