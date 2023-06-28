Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434B740A64
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 10:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435D310E367;
	Wed, 28 Jun 2023 08:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB3C10E388
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687939460; x=1719475460;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qYZQy4LVPn7s4nVnjx7bHIkM8rkrxuM1mdwvRg7vQwM=;
 b=X/sodNldDB626iw5vkE6f3NVvMShOnhHlnkntDxkSYIW8mbuRorDdDM4
 JsQhuHh+NRYFxUxkJLihVazp3nl6W/h/TuehkYc+M+YGGCRLZMoSJZ9SJ
 Pi1EI/+aycgReoHjfCOdqW0sbGxdDCI0RCt16cVLevl+40z5LRAucZHwQ
 mI67McY76vqEuPfs+L56FCoyiUSJ29Capn/iUQTa2R/s9vFUX7Lrhpld1
 sfqVD/LywyIAUvF6A/zactlVFKehbsoBPihKF0fSflj9sUM0L0B7sua7C
 yaiN9jXy6XwLJBqhnLr3Oc1UINbt3m68dz01hORyunhdSltDASnz9rN4G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425451525"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="425451525"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 01:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840977630"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="840977630"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 28 Jun 2023 01:04:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 01:04:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 01:04:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 01:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLj9cMkFG26rD6w8996kaOl94k0QHIIPuEUlLqiqm0xGNlKEaHZUbjRrzqNfUoUVF8KgslF8FfKctNRPHSKN6ETsMO0NwFijk6XXsOBwqgOrHC3EmeLXtGPdrsuAl+F4Jx11Kjg5JR1TVf2mTY56EQOJ5GvyHXjH22AA/h9pshIJdhGULDTqGJ2eC3Z6/XKfjqjZ0+EV6tqODjwuDD+WPXOFf4MdPDKjaldbirJf1U3sEJejOLLtb7V8SsSIiaQ2hH8gpJZ2cWMM0uRRJdwH4cnRuTzdwmFAXN1xfinDjORk7jH2SuhQiQ0jHqEuMrbsttGKneW+q1GH508+mvjCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYZQy4LVPn7s4nVnjx7bHIkM8rkrxuM1mdwvRg7vQwM=;
 b=RbzKcZ8nGgsL4F+tSE1NfiI5yrBBuYHPKLmC0qZ4toASXKjObIGGpac5FA5K0DFi8SAUS2n2wderf6K0deqefcoFxlYi35xRsYJIwsym/z7rEdZMYflao0bGjYmZIX9r1mkFt99kkXIevP+ovci+MsithLGYx3M6k3qEjUJJZrMTzBdTuvL86GeL6rIMbjIlDjyeFEJ4U5924dXQQKu7IV7WXGYFLAAOIJ6xOhmF5n8kKBj1tfmZbRoOxGLempigWH0SiJ/q4Boa+rNDAwMdQ4H0lclyktBJftVexd4f/i0TqxwV01bdEhP4AmeC8VfyUW4pXi1Ey+9PAOh8wLhu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 08:04:12 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 08:04:11 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Thread-Topic: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb
 pages
Thread-Index: AQHZpN59yPT6xb778USyK3pSaYthDa+WfGmAgAD+79CAARxvgIACdYfQgAJW7QCAAAYegIAAk7BggABFJQCAAQFxMA==
Date: Wed, 28 Jun 2023 08:04:10 +0000
Message-ID: <IA0PR11MB7185F61FFD9A0A05459DF759F824A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n> <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
 <IA0PR11MB71854B6D9454DCDCEB83F2E2F827A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4a98a381-f184-1857-a134-efd606a3b807@redhat.com>
In-Reply-To: <4a98a381-f184-1857-a134-efd606a3b807@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BL3PR11MB6412:EE_
x-ms-office365-filtering-correlation-id: 46a98489-3079-4cec-02e1-08db77ae417b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jcs6kB5sgfxjm78jDXE1gc/8RQMikSQwRBKGIg8b0iuMBvJqNai8QrKitBR9Ovd/1tEa8YRxlcG8p15VzAhTs2xDImyDg9RvnYSYusaDY8GBVlqzpr7tt/klT55IneL1QBrb2whcKvRKYqnt5/4vLz6MaRoQC69svWaImBZ00+4VOThh8+abwKzBorbyCqsO3e3n2ZeLcXyhF3eIGKzwPzt1+umlEe8FeCLcAPXuhSEestHU5WJsqMeG1R1/dGmAJcGx1fmpDfWSTAiSv7ghh+aTmuhSYN3eWONj5Sa0lRo2bKsLX7EiR98msOj580HWFSjCFQf7x5toWl7l7/6zo1B/QKQn8AQ+S/7SlxjHqWWNOTCSK5YDXAlPmhvjHqdYdor2uu2681AdItiNv0hldrzInW6qZrGH2rZcW6/o2W8SddExyRqDMQDS3ld6Oia9i6f0Cv5a8H+WIvgmKNO9HTAWcHYTiwq4j+SAHcqwOv3+heyywzIUd/Qu1uHiTua74MFgNBWee4m6diXazuhQ/GaEZ8ysrAzydyNW9eKmvCb1favA8S58ddgn2ke99cF52unbZ4xSWqWOlcEsHv4hJ/I2nE/PCK35wSbrIOU1x0Z2q3FD+7u/f2aXN8VT9Xf3Dn07wxOQouy3ofdZGb79CQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(186003)(7696005)(71200400001)(122000001)(9686003)(38100700002)(82960400001)(6506007)(53546011)(26005)(86362001)(966005)(55016003)(110136005)(41300700001)(38070700005)(54906003)(478600001)(316002)(4326008)(66946007)(76116006)(33656002)(66556008)(64756008)(66446008)(66476007)(7416002)(52536014)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OW0yTDU1M1lEM0xPQVlIbnNFM0YxbFdEMzNNWTVWTVc5c3gzRDJERU5yQ1hT?=
 =?utf-8?B?SnU1aUNvN25oZ0dJbkdrU2dJeEdRZVFHSVBnSUsrWGRSNWtCbTFqK2hrckI0?=
 =?utf-8?B?WDNvNGE1bVp3c1c3aVlUOStmcDgvU1g3SU82UWhGQmI0NEVSVGY4U2cxeXF1?=
 =?utf-8?B?UEFFKzNoZkx0MGpEcU1TR3FjRFlWWnNLWXJEa3hheGRleldnd0ZZb0xETFBI?=
 =?utf-8?B?bklhTEVocWNWRDhEdm1PaENmMnlYcDBId0FpdHZ3djdzeXJZSEo1OEdKU25w?=
 =?utf-8?B?TkNvdld1eWxsQWFseEk0NTlvVkNkSEttMGpNdFNramxnVTF5ZEFSaVd0TEdC?=
 =?utf-8?B?czYyUHJCbU1hME4yZDUvNVpjK01hNXlHb0s2Q1dKYnZFbXhkOGkrc1djaW5u?=
 =?utf-8?B?THpab2NiVlpIWThxa2dQU0lEeGVESk45bTNZSElURGtRdm5CNkxXcXdUR0o2?=
 =?utf-8?B?MUt5cTl4ZXJtMktjYjNzSTRHSXA4NmthOEE5UGRxTEhYU0tHVU5rRU9QSllo?=
 =?utf-8?B?WmVmWGdHczVxdmRYTkhEYW1Jd1dlU1F6Mklaa3E1Vy9HMWx0QmRlUjZIcjFt?=
 =?utf-8?B?c09BU1hWS0ZiRWp5U1FvaVlCRWdSa2lta2xRTXAyVjNDUXBYZHR6TTVMTkVY?=
 =?utf-8?B?RUxQcnFVY01kT2gzMFo0Q0RGdVp5anVsU2h4RmRWblRhOFRYekljRHRqd3Zw?=
 =?utf-8?B?a2N0ODk3U25hZXpWSTU2Uy9aNW1OY24vclJuNk1adDV1Z3JzU2MraXNMd2RE?=
 =?utf-8?B?ZkVmc2I5cnR0eEVHZnJJS09SRGkzZEJCaG53cURaeWFDVHIwVmZvWGYzclQw?=
 =?utf-8?B?MS9qTUlNcnhYZnJwelQzRjFLL0Q3WjE4aXZnb0RRVGM3VjUwTXhFd05YdUlN?=
 =?utf-8?B?bmJXZUZXOGlMeU8vNkNib3hyQVFRZnBEbTMxbENNenRuWDhndGxVUlpmMnNR?=
 =?utf-8?B?OW1ZeDEvbnJYVTRPMmhuR2YxVDFNSkpFOW40TWlTWmhmRDNTMGh0YlBybXZp?=
 =?utf-8?B?bmNuODNZMEJ3aWlVWHN3QW5QZ2Z4eHpjcVVlQi84MDRXYUtBOHo0ZjRWMXRZ?=
 =?utf-8?B?TzZvR1I4V3ZrSGlWSGw0VXYvUk5BZlhFN0dZSDd5bFh1UHhFODc2M2M5VUl5?=
 =?utf-8?B?L2hMdG92cHk2VytZL1RuaWdNTUI1YUc0RHRSbFMyZTZBRnh6alhFcHhnM2l3?=
 =?utf-8?B?bE1PbXBrKzJCTFJKTExXZHpuSnZEVlMwbXlYb3pGdzd6Y0VGWU1vcEx5djU2?=
 =?utf-8?B?U3NCUWZzN3JkOWhUVVpQMGZHV3l1Tm5iTHlVaEg1TmF2cFNaL29Lak9nZGtG?=
 =?utf-8?B?b0hYSVdLT1RSK0c4MzFDTTMwYmRGNGkybms1bVg3eU1YODg0Nlk5Z0Z4S0ly?=
 =?utf-8?B?RGxiUXFkZUlTRWNOVzk5Nlo1akJPby9XbFJGa0R3VUExcTRhb21mT2I5cVRI?=
 =?utf-8?B?ZE9TVTJqSEtNSHdoNUxiZW1hcFRReFRGSnZmVTFla0NYWVRGeGpsQU5jRmxO?=
 =?utf-8?B?d0krUEh1TzhMdC9iQzN5ajE4MUozYWwyTmJES2Z6VUQwVVlFNThOVlg5MUFj?=
 =?utf-8?B?WjJxc3Z6Q0xES1J6YkR5OFA0MXEwcTRIVzFTV2FvNlRaQzZEV2JkS1Zacmdh?=
 =?utf-8?B?aVVlTWdQRCtFV3lLYlh6S05wWkF4c0dVK1Ixa1NwU1g1WVVSek5wdFhqazdX?=
 =?utf-8?B?d0tmYXo5aXA3NFVYNjE5NXBabHYxVWg5Zys3Nm51UHdDRUVUYUFad1BXM3ZY?=
 =?utf-8?B?VDkramZNWDVseDROQXhYVzFXMnJHNjFyQ0pETGp6U0RzenAzbDhhUzZXQ09w?=
 =?utf-8?B?a29ycUpFVWJTalRaaUQ3U2NpUEVOdDdZb2QwS3NVODFrcTJJb2ZFZWpDUERj?=
 =?utf-8?B?ZjVoWnJycElFcFJhdkhGejdUVWJtdU1RN3ZBQXVBRmFLd0p5bUJpMmpvNnk0?=
 =?utf-8?B?STZZdzN0NjRLaW9oTjNWU2NPYnl0UmFFUUYzR2hHZkNZZForOTVnTUNxQUZS?=
 =?utf-8?B?eFhrSGMzUklQZTlBZVNUaHdxL1piYndEQ3VHbmk1SXBXRGRYNEdzYUFSR2xa?=
 =?utf-8?B?Q3BKZW1Relp1ci8wb3o1Tmw0bjJZN1Z0ZlBLRmt6RzdUeDAvSDVHUm4wNStB?=
 =?utf-8?Q?9hvffty7zfgMoZeJx7g4nzkSL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a98489-3079-4cec-02e1-08db77ae417b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 08:04:10.9376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cORgmf6e0pbUnXLQkUW9cVoPITkfQ488iBlZlUt7NTGxxO5LDMXTajurFDhxxzIN/mMDHjMu5XsOJimd94TZk/6i4zmMJcXhy71ussGuqlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
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
Cc: James
 Houghton <jthoughton@google.com>, Jerome Marchand <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gDQo+IE9uIDI3LjA2LjIzIDA4OjM3LCBLYXNpcmVkZHksIFZpdmVrIHdy
b3RlOg0KPiA+IEhpIERhdmlkLA0KPiA+DQo+IA0KPiBIaSENCj4gDQo+IHNvcnJ5IGZvciB0YWtp
bmcgYSBiaXQgbG9uZ2VyIHRvIHJlcGx5IGxhdGVseS4NCk5vIHByb2JsZW0uDQoNCj4gDQo+IFsu
Li5dDQo+IA0KPiA+Pj4gU291bmRzIHJpZ2h0LCBtYXliZSBpdCBuZWVkcyB0byBnbyBiYWNrIHRv
IHRoZSBvbGQgR1VQIHNvbHV0aW9uLCB0aG91Z2gsDQo+IGFzDQo+ID4+PiBtbXUgbm90aWZpZXJz
IGFyZSBhbHNvIG1tLWJhc2VkIG5vdCBmZC1iYXNlZC4gT3IgdG8gYmUgZXhwbGljaXQsIEkgdGhp
bmsNCj4gPj4+IGl0J2xsIGJlIHBpbl91c2VyX3BhZ2VzKEZPTExfTE9OR1RFUk0pIHdpdGggdGhl
IG5ldyBBUEkuICBJdCdsbCBhbHNvDQo+IHNvbHZlDQo+ID4+PiB0aGUgbW92YWJsZSBwYWdlcyBp
c3N1ZSBvbiBwaW5uaW5nLg0KPiA+Pg0KPiA+PiBJdCBiZXR0ZXIgc2hvdWxkIGJlIHBpbl91c2Vy
X3BhZ2VzKEZPTExfTE9OR1RFUk0pLiBCdXQgSSdtIGFmcmFpZCB3ZQ0KPiA+PiBjYW5ub3QgYWNo
aWV2ZSB0aGF0IHdpdGhvdXQgYnJlYWtpbmcgdGhlIGV4aXN0aW5nIGtlcm5lbCBpbnRlcmZhY2Ug
Li4uDQo+ID4gWWVhaCwgYXMgeW91IHN1Z2dlc3QsIHdlIHVuZm9ydHVuYXRlbHkgY2Fubm90IGdv
IGJhY2sgdG8gdXNpbmcgR1VQDQo+ID4gd2l0aG91dCBicmVha2luZyB1ZG1hYnVmX2NyZWF0ZSBV
QVBJIHRoYXQgZXhwZWN0cyBtZW1mZHMgYW5kIGZpbGUNCj4gPiBvZmZzZXRzLg0KPiA+DQo+ID4+
DQo+ID4+IFNvIHdlIG1pZ2h0IGhhdmUgdG8gaW1wbGVtZW50IHRoZSBzYW1lIHBhZ2UgbWlncmF0
aW9uIGFzIGd1cCBkb2VzIG9uDQo+ID4+IEZPTExfTE9OR1RFUk0gaGVyZSAuLi4gbWF5YmUgdGhl
cmUgYXJlIG1vcmUgc3VjaCBjYXNlcy9kcml2ZXJzIHRoYXQNCj4gPj4gYWN0dWFsbHkgcmVxdWly
ZSB0aGF0IGhhbmRsaW5nIHdoZW4gc2ltcGx5IHRha2luZyBwYWdlcyBvdXQgb2YgdGhlDQo+ID4+
IG1lbWZkLCBiZWxpZXZpbmcgdGhleSBjYW4gaG9sZCBvbiB0byB0aGVtIGZvcmV2ZXIuDQo+ID4g
SUlVQywgSSBkb24ndCB0aGluayBqdXN0IGhhbmRsaW5nIHRoZSBwYWdlIG1pZ3JhdGlvbiBpbiB1
ZG1hYnVmIGlzIGdvaW5nIHRvDQo+ID4gY3V0IGl0LiBJdCBtaWdodCByZXF1aXJlIGFjdGl2ZSBj
b29wZXJhdGlvbiBvZiB0aGUgR3Vlc3QgR1BVIGRyaXZlciBhcyB3ZWxsDQo+ID4gaWYgdGhpcyBp
cyBldmVuIGZlYXNpYmxlLg0KPiANCj4gVGhlIGlkZWEgaXMsIHRoYXQgb25jZSB5b3UgZXh0cmFj
dCB0aGUgcGFnZSBmcm9tIHRoZSBtZW1mZCBhbmQgaXQNCj4gcmVzaWRlcyBzb21ld2hlcmUgYmFk
IChNSUdSQVRFX0NNQSwgWk9ORV9NT1ZBQkxFKSwgeW91IHRyaWdnZXIgcGFnZQ0KPiBtaWdyYXRp
b24uIEVzc2VudGlhbGx5IHdoYXQgbWlncmF0ZV9sb25ndGVybV91bnBpbm5hYmxlX3BhZ2VzKCkg
ZG9lczoNClNvLCBJSVVDLCBpdCBsb29rcyBsaWtlIGNhbGxpbmcgY2hlY2tfYW5kX21pZ3JhdGVf
bW92YWJsZV9wYWdlcygpIGF0IHRoZSB0aW1lDQpvZiBjcmVhdGlvbiAodWRtYWJ1Zl9jcmVhdGUp
IGFuZCB3aGVuIHdlIGdldCBub3RpZmllZCBhYm91dCBzb21ldGhpbmcgbGlrZQ0KRkFMTE9DX0ZM
X1BVTkNIX0hPTEUgd2lsbCBiZSBhbGwgdGhhdCBuZWVkcyB0byBiZSBkb25lIGluIHVkbWFidWY/
DQoNCj4gDQo+IFdoeSB3b3VsZCB0aGUgZ3Vlc3QgZHJpdmVyIGhhdmUgdG8gYmUgaW52b2x2ZWQ/
IEl0IHNob3VsZG4ndCBjYXJlIGFib3V0DQo+IHBhZ2UgbWlncmF0aW9uIGluIHRoZSBoeXBlcnZp
c29yLg0KWWVhaCwgaXQgYXBwZWFycyB0aGF0IHRoZSBwYWdlIG1pZ3JhdGlvbiB3b3VsZCBiZSB0
cmFuc3BhcmVudCB0byB0aGUgR3Vlc3QNCmRyaXZlci4NCg0KPiANCj4gWy4uLl0NCj4gDQo+ID4+
IGJhbGxvb24sIGFuZCB0aGVuIHVzaW5nIHRoYXQgbWVtb3J5IGZvciBjb21tdW5pY2F0aW5nIHdp
dGggdGhlIGRldmljZV0NCj4gPj4NCj4gPj4gTWF5YmUgaXQncyBhbGwgZmluZSB3aXRoIHVkbWFi
dWYgYmVjYXVzZSBvZiB0aGUgd2F5IGl0IGlzIHNldHVwL3Rvcm4NCj4gPj4gZG93biBieSB0aGUg
Z3Vlc3QgZHJpdmVyLiBVbmZvcnR1bmF0ZWx5IEkgY2FuJ3QgdGVsbC4NCj4gPiBIZXJlIGFyZSB0
aGUgZnVuY3Rpb25zIHVzZWQgYnkgdmlydGlvLWdwdSAoR3Vlc3QgR1BVIGRyaXZlcikgdG8gYWxs
b2NhdGUNCj4gPiBwYWdlcyBmb3IgaXRzIHJlc291cmNlczoNCj4gPiBfX2RybV9nZW1fc2htZW1f
Y3JlYXRlOg0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNl
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NoDQo+IG1lbV9oZWxwZXIuYyNMOTcNCj4gPiBJbnRl
cmVzdGluZ2x5LCB0aGUgY29tbWVudCBpbiB0aGUgYWJvdmUgZnVuY3Rpb24gc2F5cyB0aGF0IHRo
ZSBwYWdlcw0KPiA+IHNob3VsZCBub3QgYmUgYWxsb2NhdGVkIGZyb20gdGhlIE1PVkFCTEUgem9u
ZS4NCj4gDQo+IEl0IGRvZXNuJ3QgYWRkIEdGUF9NT1ZBQkxFLCBzbyBwYWdlcyBkb24ndCBlbmQg
dXAgaW4NCj4gWk9ORV9NT1ZBQkxFL01JR1JBVEVfQ01BICppbiB0aGUgZ3Vlc3QqLiBCdXQgd2Ug
Y2FyZSBhYm91dCB0aGUNCj4gWk9ORV9NT1ZBQkxFIC9NSUdSQVRFX0NNQSAqaW4gdGhlIGhvc3Qq
LiAod2hhdCB0aGUgZ3Vlc3QgZG9lcyBpcw0KPiByaWdodCwNCj4gdGhvdWdoKQ0KPiANCj4gSU9X
LCB3aGF0IHVkbWFidWYgZG9lcyB3aXRoIGd1ZXN0IG1lbW9yeSBvbiB0aGUgaHlwZXJ2aXNvciBz
aWRlLCBub3QgdGhlDQo+IGd1ZXN0IGRyaXZlciBvbiB0aGUgZ3Vlc3Qgc2lkZS4NCk9rLCBnb3Qg
aXQuDQoNCj4gDQo+ID4gVGhlIHBhZ2VzIGFsb25nIHdpdGggdGhlaXIgZG1hIGFkZHJlc3NlcyBh
cmUgdGhlbiBleHRyYWN0ZWQgYW5kIHNoYXJlZA0KPiA+IHdpdGggUWVtdSB1c2luZyB0aGVzZSB0
d28gZnVuY3Rpb25zOg0KPiA+IGRybV9nZW1fZ2V0X3BhZ2VzOg0KPiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMj
DQo+IEw1MzQNCj4gPiB2aXJ0aW9fZ3B1X29iamVjdF9zaG1lbV9pbml0Og0KPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdQ0KPiBfb2JqZWN0LmMjTDEzNQ0KPiANCj4gXiBzbyB0aGVzZSB0d28gdGFyZ2V0
IHRoZSBndWVzdCBkcml2ZXIgYXMgd2VsbCwgcmlnaHQ/IElPVywgdGhlcmUgaXMgYQ0KPiBtZW1m
ZCAoc2htZW0pIGluIHRoZSBndWVzdCB0aGF0IHRoZSBndWVzdCBkcml2ZXIgdXNlcyB0byBhbGxv
Y2F0ZSBwYWdlcw0KPiBmcm9tIGFuZCB0aGVyZSBpcyB0aGUgbWVtZmQgaW4gdGhlIGh5cGVydmlz
b3IgdG8gYmFjayBndWVzdCBSQU0uDQo+IA0KPiBUaGUgbGF0dGVyIGdldHMgcmVnaXN0ZXJlZCB3
aXRoIHVkbWFidWYuDQpZZXMsIHRoYXQncyBleGFjdGx5IHdoYXQgaGFwcGVucy4NCg0KPiANCj4g
PiBRZW11IHRoZW4gdHJhbnNsYXRlcyB0aGUgZG1hIGFkZHJlc3NlcyBpbnRvIGZpbGUgb2Zmc2V0
cyBhbmQgY3JlYXRlcw0KPiA+IHVkbWFidWZzIC0tIGFzIGFuIG9wdGltaXphdGlvbiB0byBhdm9p
ZCBkYXRhIGNvcGllcyBvbmx5IGlmIGJsb2IgaXMgc2V0DQo+ID4gdG8gdHJ1ZS4NCj4gDQo+IElm
IHRoZSBndWVzdCBPUyBkb2Vzbid0IGVuZCB1cCBmcmVlaW5nL3JlYWxsb2NhdGluZyB0aGF0IG1l
bW9yeSB3aGlsZQ0KPiBpdCdzIHJlZ2lzdGVyZWQgd2l0aCB1ZG1hYnVmIGluIHRoZSBoeXBlcnZp
c29yLCB0aGVuIHdlIHNob3VsZCBiZSBmaW5lLg0KSUlVQywgdWRtYWJ1ZiBkb2VzIGdldCBub3Rp
ZmllZCB3aGVuIHNvbWV0aGluZyBsaWtlIHRoYXQgaGFwcGVucy4NCg0KVGhhbmtzLA0KVml2ZWsN
Cg0KPiANCj4gQmVjYXVzZSB0aGF0IHdheSwgdGhlIGd1ZXN0IHdvbid0IGVuZCB1cCB0cmlnZ2Vy
IE1BRFZfRE9OVE5FRUQgYnkNCj4gImFjY2lkZW50Ii4NCj4gDQo+IC0tDQo+IENoZWVycywNCj4g
DQo+IERhdmlkIC8gZGhpbGRlbmINCg0K
