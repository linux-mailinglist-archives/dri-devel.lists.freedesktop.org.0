Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D677B72063D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 17:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37A910E5C0;
	Fri,  2 Jun 2023 15:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B4B10E18D;
 Fri,  2 Jun 2023 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685719981; x=1717255981;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d8+A4k8Wp3lq5ChBnVzpIRy26JWjQ3LMRDSPPfMsWQM=;
 b=h1ED61vVmU0WAPGo1qx7s+JHYYpeNAYY9a87iiPPOWrrEZF/2FgsQweZ
 +YVvB4TKI1aV2zFZEAISZ1InMDeafBeab1MJ97UfWZBK8OkfVes9OcNb8
 DKrVISpSpAI1qQd9tBQNN92LsvHUuTKVh/8Iv7i1QXsGIBPz3sTFyUWYv
 BCyy96XAM7el8sn2BriQvGA7CXygkclBM5CtoNgBlXqOy1Y8ZrvxiXrKV
 e4qa+9ugYiSatO6NymGBiflk6nfJeCNdkdM6AuY5U0Bu2M2Fogh6whOOE
 V4OfUb/yh24VUDCwRA3Hw7i/Sm0MeXDMqCwlg2OUkveX3yXyWWbkzN+Gd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="345474130"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="345474130"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685346445"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="685346445"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 02 Jun 2023 08:33:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 08:33:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 08:33:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 2 Jun 2023 08:33:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 2 Jun 2023 08:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGM9cBf9Qo4qojxuMmk1DbB+9mhgdKarVoyjAMDQDSFG0d/FHbMJ8eY+ZYOrGaA85aeFGvgfgdv7rmPPlQTJpNLsm48NjWeJJesFskqKnpXG+eLtWfElDk+Oy0eYHqikEDkLCkkDeIKuXDqSJFy6oKFeMfMKL7iBEouG67ZHTWEyNXQkaqiLOwUqIEGS7X3aVhJa3yZEfdboh8eqFEel0eD52EhcqB5J6rQQlyE8+gJjOzvFZP0L4/if8BOgt7XI71szc0aCu2JF362rTY2xqbtfxiTgqzxMbGbokV5FlgzLCjWvf7SkGnXbRFfyq19u6Ucf5BaGKz3ioCFg+tHrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8+A4k8Wp3lq5ChBnVzpIRy26JWjQ3LMRDSPPfMsWQM=;
 b=Fl7raguqKb6Pv1TpDtY9oPc3kzwBH39epVxEZqt2xAXagG98bM3gdmCFosczI+ZIYanUzKzWGR6JWn7HIpc7jkSGSd7Ks+by/t3rleFJZxECrvqDI/JmOD6AVeHzlEzXuZPf8bqWAEvYrsFHezCBt3gvcgUv3lwoP/bxm9J15jajWE3DO7A/8eYh6q6iqALVMIRqRoJiBAA/q2QxmGFwGgorzYL62DkDcpb4pqINykd+qN8uZfMB2Bn8Bc7ykHlIitFHv4mFRZ0IFSSXtfDbaDsRb5aT6fKPlraKLjhZwPxXNJdBaDS4bSXI6jZxCv7BrmQsrxcws2vvI6MJC/v+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Fri, 2 Jun 2023 15:32:52 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851%4]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 15:32:51 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Thread-Index: AQHZlLD0p2IK67TQZEK5cgGsrQKNUq93e74AgAAp2YA=
Date: Fri, 2 Jun 2023 15:32:50 +0000
Message-ID: <ce544e21da67306a406920f5cd72504619ffbe3f.camel@intel.com>
References: <20230601174553.2410741-1-alan.previn.teres.alexis@intel.com>
 <87y1l2dnjt.fsf@intel.com>
In-Reply-To: <87y1l2dnjt.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL3PR11MB6362:EE_
x-ms-office365-filtering-correlation-id: b78b6fbc-c4c5-4eed-f1b4-08db637ea052
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WZyGV2cS6ptZJpEjQ8/qetk0HEdYiywXH9lU0t8zfUNvdaDzs/0ikfakJ8ku1KiNtza/fTmfTgsA71/LO1INREEBqBqWcg+VvwB0TPAahiEjhAE3J/6mX78eoFZgqulbwcYy4xOjxYagQ0CzEFMGFqpOQjM0sAMe0Z0qaFaqG67Udp4Mc1zSl8JHDYtX7u2fCLqU8bjboQwFNvmPeu/6OX6M4sjkHgSdmX5SYH3Jpn2Pf7qhYw/4j6A76EepWWclqrGcwOQr/9DIHJ+83lntYq+MYJG7wA3HRM/rTFSo6+0Y9kwQnpJ12TLxp7S8BmaA1vYoiY9AZv0inUK0ZOhv4IzsgEs+j9cjZqUb7k1DWHlO7ChufSOE9zdzsnFqMXTetAOOvYSDgyo/xKdP2O8VZwSVRXdwoOMmG1Qs+hJNoKRX5aWhrBbPenHMYIlIZUCQWcnFkz3T0JOBInm6VoL6RRj5O9h57S6us5Hr7HRY4116b25okcBN8gujwLeWmgiDZ47Rpo80S9qRwcgfF+HlMKxjG/btJDR8ghFlew/glXCwGl5E/qkmSun1gYq9wsqpKOyGEu0BlBtmVoyDMfiF3fxNhzyathbqvL3Fr1ahtFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(6486002)(41300700001)(6512007)(83380400001)(8936002)(8676002)(186003)(36756003)(2616005)(2906002)(6506007)(26005)(5660300002)(86362001)(38070700005)(966005)(91956017)(66476007)(64756008)(66556008)(66446008)(82960400001)(66946007)(76116006)(4326008)(110136005)(478600001)(122000001)(316002)(71200400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHY4WTEya2RBUVAyYXExZ3UveGdFZGlyRThrTGN0WW5IRVYwUzFldG01OVRw?=
 =?utf-8?B?ZGVZdjhlTlJPNzJsRTg4L09DVzZGejNSNWVqV3Z3T2c5RmdqMGFMNUZlUDJC?=
 =?utf-8?B?V25tODZ3NEhWVFV5OEt4QzFoMnk5RWtzU1VPaGRlWWh3LzNibnVFKy9jKy80?=
 =?utf-8?B?S1h2N2xJd2hkR2Q0cXRBV3UvVXIzUDlRMmFvMExOTEI5MEZNeDNZYkVjNmtY?=
 =?utf-8?B?OGFnem1ZaVhSTm94cTBMQmdIQ2tjQmR1LzhSQUl4Y21oTXAzaERxZkpCWjJ6?=
 =?utf-8?B?VG1RTDF6TnkzeWZxelcrU2RFTzZjMVpXbjZWVHFSZmFDei9PTFB5ZGxJNDh2?=
 =?utf-8?B?S3p0L3oyQ2tHN0EzUG5PYzJRSUsreEFRcHh1eEhQa29QOWRvUVBoMERlaEhn?=
 =?utf-8?B?R2czY01WdVhBYS9kUFJqdWRRQjQxelJBbXVGek43a01yZ280TGN1dndrM2M0?=
 =?utf-8?B?QTgvc0kyZXdCOVdrMW1xVDVWQlFCdDE0NC9ldmlFS3pMV3g2NHpDWEdVb0NV?=
 =?utf-8?B?SUN0K3hOZ3NPbzhyL1JJbVZpVUE1aW0rVTBIeVZGTkh3Qm5rcVR6SVRLakg3?=
 =?utf-8?B?S0MzcFFPeHJHN3hkbEdYSTZycFFSMjJmY1dhWVJDMWo4U2prQWp1ZkluUUtj?=
 =?utf-8?B?bTZ6czBrNzhEZDdOV2J1cXFOd1hBYzFJQndheWZCR3ltVjc4Q0llaDhGQ0hT?=
 =?utf-8?B?cWV2cHFkVFJ2T08rUWM3dEdPQzZkb0RsQU1nV0cwcjMwVE94bUxXMDdnaUJY?=
 =?utf-8?B?N3VkeTduVzR0QzFHOGd6YTlQMC9YWDE1MmVtaFh2K0Zieis5aXNVaTdON3R5?=
 =?utf-8?B?TkR1MlRWcm9RTm9TUlh0TlNhZXhhaERmZm54SkhaZytQUjBLMG55TzdpMG9h?=
 =?utf-8?B?WnNRcWtFTnUxUlViV3h3SFNqZFRuU1Zsa3JwNXIzVDBFcG92SWc2UmdiSHR2?=
 =?utf-8?B?cm1YQmdwcDA0NGg4Sk4rTWFOV3Faa2thRzVUTmF4Q2d0MEF0MjVuT0xaVkR6?=
 =?utf-8?B?UU05V0g3S1lOaXlDSlByZDdPTHZNZVBkZ3hyajFWU1FlaGJZNWM5cWIxekRi?=
 =?utf-8?B?WCtkOUt1Ync3MExoN3JjT2lrTmh3eWQ0ZEJBNFo1c3VtZnBZS1NUTWlBKzJ4?=
 =?utf-8?B?czBMdmh2UmY5cGEzcHRoa1VQZ3l4SW5sWCtVOFYzNVpjWGdidHdxRUQzNVg3?=
 =?utf-8?B?VmwrZGNDQjZxcWQ5S0hCd3h0OXI2cTJpS1lnV0lDcVFWL2xiWEFab0FzNVl3?=
 =?utf-8?B?R3VOeFhXS3BNQXpqaFZJNGtzWGFtYXBlMysxeUMxQ2xUc3VVQ3cyYmExZmJW?=
 =?utf-8?B?QnpCay92cEtUajBXUTkySnYrb3dTeWthVlVrejFsZCtEZk1hQzdOcUZKbU0r?=
 =?utf-8?B?d1k2TjNQV1Izd3J0eDJHa3cvK0tTaUg0aHRjS3hJMVNreGdFMFhoN3YyNkoz?=
 =?utf-8?B?bkQxQWdRd2N0bVRIOUdoZ0w2RGdGL1NrV2lBb3NxZjVnQ1hIWXJvbTJ6ZTVQ?=
 =?utf-8?B?NTJKbkx0eU1xQmJ2QlRSNnZXMUJYN0hFNDlWRjVrN0hGaEUwRmRlZmVHUzZp?=
 =?utf-8?B?WjBNWXdoamo3QzFVdE9hSm1FMHRnblVpRWN6ZU42MDJDcGdnT1hBdFRrUmZr?=
 =?utf-8?B?bWJTQ1hnWFRjU3JNdDZ2Y1FuMDk3dm1kWjlaNUJMSVdyLzV2MVZqcTczWDUv?=
 =?utf-8?B?bFZ4ekpsbzNXb1gvWTNNNzdPT3Vud0pUNUh5ZWpJdmNyRlVyOS9hMkh5UXQ3?=
 =?utf-8?B?UEhBZWtMQ09ka1VWYmVGMXpUVU1LWWtGci9xOVFaeGw0OU1JOUxZU2RTb21S?=
 =?utf-8?B?Z01IVS9taTZlT1FTdmc1NlROaFZsUFZqNVl4eHRzY1p0WXg4Uk1Dem9SWmFQ?=
 =?utf-8?B?NUQ5V3J2U21kK3dvTDlGMm9oMGZkUkRCRURlMVdyVHF0eDdKQVZUT2lMK25Q?=
 =?utf-8?B?aU5xRVdWTURveUc3dWFZQy80bHByZ0M0QUNCSlFySVBTamExVEx0Q081bUdU?=
 =?utf-8?B?SzA1VnB0NDhsM29KSmQ4Z3BXVVlSYnVxU2NwSEZLQ28wVk42WlY3SVNPQXZu?=
 =?utf-8?B?Yjg4OERHQ2NlRHRCNjJKTDBwditlNC9vZVg5WGF2NVpKSU5GYWZIdktOS3Yz?=
 =?utf-8?B?VFkxK01mOS9ndEVZTkswOHBpNmp0dXpoNmNPenNJMk5FOFBhOCtRU3A4STJM?=
 =?utf-8?Q?517u8Qe0p3rpqRUiMsk+/zo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5B8235838DDCA499A8A4EAFE5401318@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78b6fbc-c4c5-4eed-f1b4-08db637ea052
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 15:32:50.9523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nn2HHfxRUWes5Vw4gWH2Y3p6LCV4He0zJQyOXHKgcRMuRkCPON+3GUPy45P97jPE37ljQThQTc0Vf+csabR+8c9SXQ8gk3Nqe5aqjbNKRLt4Ti85ua/qIX6xqQ1BgTaq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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

VGhhbmtzIEphbmkgLSB3aWxsIHJldiB0aGlzIHVwIGFuZCBmaXggdGhlc2UuDQoNCk9uIEZyaSwg
MjAyMy0wNi0wMiBhdCAxNjowMyArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIFRodSwg
MDEgSnVuIDIwMjMsIEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPiB3cm90ZToNCj4gPiBBZnRlciByZWNlbnQgZGlzY3Vzc2lvbnMgd2l0aCBNZXNhIGZvbGtz
LCBpdCB3YXMgcmVxdWVzdGVkDQo+ID4gdGhhdCB3ZSBvcHRpbWl6ZSBpOTE1J3MgR0VUX1BBUkFN
IGZvciB0aGUgUFhQX1NUQVRVUyB3aXRob3V0DQo+ID4gY2hhbmdpbmcgdGhlIFVBUEkgc3BlYy4N
Cj4gPiANCj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhpcyBhZGRpdGlvbmFsIG9wdGltaXphdGlvbnM6
DQo+IA0KPiBOaXRwaWNrLCBwbGVhc2UgYXZvaWQgIlRoaXMgcGF0Y2giLiBJdCdzIHJlZHVuZGFu
dCwgYW5kIGFmdGVyIHRoZSBwYXRjaA0KPiBnZXRzIGFwcGxpZWQgaXQgYmVjb21lcyBhIGNvbW1p
dCwgbm90IGEgcGF0Y2guDQo+IA0KPiBJbnN0ZWFkLCB1c2UgdGhlIGltcGVyYXRpdmUgbW9vZCwg
ZS5nLiAiQWRkIHRoZXNlIGFkZGl0aW9uYWwNCj4gb3B0aW1pemF0aW9ucyIuDQo+IA0KPiBTZWUg
aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNk
ZXNjcmliZS15b3VyLWNoYW5nZXMNCmFsYW46c25pcA0KDQo+IA0KPiA+IC1pbnQgaW50ZWxfcHhw
X2dldF9yZWFkaW5lc3Nfc3RhdHVzKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gPiAraW50IGlu
dGVsX3B4cF9nZXRfcmVhZGluZXNzX3N0YXR1cyhzdHJ1Y3QgaW50ZWxfcHhwICpweHAsIGludCB0
aW1lb3V0KQ0KPiANCj4gSXQgd291bGQgaGVscCB0aGUgcmVhZGVyIGlmIHlvdSBuYW1lZCB0aGUg
cGFyYW1ldGVyIHRpbWVvdXRfbXMuIEFzc3VtaW5nDQo+IHRoZSB1bml0IGlzIG1zLg0KYWxhbjpz
bmlwDQoNCj4gPiAtaXNfZndfZXJyX3BsYXRmb3JtX2NvbmZpZyh1MzIgdHlwZSkNCj4gPiAraXNf
ZndfZXJyX3BsYXRmb3JtX2NvbmZpZyh1MzIgdHlwZSwgc3RydWN0IGludGVsX3B4cCAqcHhwKQ0K
PiANCj4gSXQncyBjdXN0b21hcnkgdG8gaGF2ZSB0aGUgcGFyYW1ldGVycyBvcmRlcmVkIGZyb20g
aGlnaGVyIGNvbnRleHQgdG8NCj4gbG93ZXIuDQo+IA0KDQphbGFuOnNuaXANCg0K
