Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1971727D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37510E458;
	Wed, 31 May 2023 00:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7A10E458;
 Wed, 31 May 2023 00:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685493241; x=1717029241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k9jkXIKg4Rc+T2pIc09U+TtiI8PjZd1rpe7j7656kC8=;
 b=U/f5qoy9M0YAx1UJCVM8fNn096UOCCt1yg/7TZYwyxgRBToL/HwWUK69
 gxHQWF5mO8tE6QY5+se8y3Wx8+hQAjf5pZNRQa5riMHOC//uhptepNuxs
 VMP0LZq9Ce1WYdEUjP8nORDUZ6HvuHCgfp3nk/cuJ3moQdjfk8wysC8XW
 oAnlnjqyQPUU3uK2R1bGzH9ZuOkGqeyz3DRfuyBnyNnDvmlon1TzfKbHO
 VtYdWG3UUmsniZe29TPKr882x7+iiY9Hp+oJ/cDVwxAnnIjFiCx+QgpDP
 12YsG0ybzQWZTRRC7IPuOW/dcbcdjQfx1do+JTui80plrTHvnTQUQ+MPj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357473933"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357473933"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739712020"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="739712020"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 30 May 2023 17:33:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:33:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:33:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fys7eKTQsFrLkAefSoU2D/ktgtA/jn6l40c87vDgeI9/60jOXFQiixIztvHB70A9jWC1xmWnxiTHrVrDwobQY8zFoFPQs0/3JvBrcwaGkFPJ0n8ScKaCtgOtQ7XpERKUlVTRI2WQZv06PRohjQQPcknVydYCUzo7hI0EIUnUMleqgJ95HFSemGCGAzXcKRBSAl0bw2CoNCjqyBov4ucrFOhk5ZfeBCycoR0oL0AgeybzNkwA9a4MD3Y1DssSz31UOG2eYMXA6oS1iw9jPlXP/QaHIKp5UWVwg7TUT9Yu8B9vRxxQ0yG2feY0W0eArDGpAyJXf3uEV4rbK8ALDF1rxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9jkXIKg4Rc+T2pIc09U+TtiI8PjZd1rpe7j7656kC8=;
 b=atRTOXxCNPCiFEt48Iy865PRE8HuEFS5mn/DZeTOwiqZeyJCVJZlj119VngMaUg+Ptdm1pqytfqW0GEAsCtIoJvz2kYXkVjggtWhNJOyCC4S1RUHvM0ziOtNR/vkHTRVGdqYJ0lZNE53wNG7MDz2uoL5Cz5is/jCkSpxPRt1HJYm1jI0898l11YNuUgG/KyccnG/A4XtU9Crmdza/HHPwACI2BS7jlKyv3S8yCFatZNRJ/BaClFcvQUHa7Qoy3PffBUD3MqIy1lGxIy7qR6y/zGFCoOISlyDcLX7vzqVTKZDGv4JGbk4EORTROIqvbiBpoSv1ZClA9auCGCnFF53Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Wed, 31 May 2023 00:33:56 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d1ab:847f:78e4:a306]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d1ab:847f:78e4:a306%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:33:56 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/7] drm/i915/mtl/huc: auth HuC via GSC
Thread-Topic: [PATCH v3 5/7] drm/i915/mtl/huc: auth HuC via GSC
Thread-Index: AQHZkDWZ7vROw6W+k0CMktarCoAWF69zjruA
Date: Wed, 31 May 2023 00:33:55 +0000
Message-ID: <22ff64c588c62d2161b4bb794364e1e8e207d2a7.camel@intel.com>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230527005242.1346093-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN9PR11MB5354:EE_
x-ms-office365-filtering-correlation-id: c4eb041e-fb1c-4902-447a-08db616eb7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KoNwb9zpwswbKXLCIpyaiVk6iAmVxrQjkwPVVzHXnaG3hDDI0V3JvgvM9K9ZYNEPtV3ik5AbauafI+q4o/UUIyoPIJcZjC2hm9HHRQno9hiKfNn929s9iqwu9XRi4vE7dTVxPX9e3K6wpZTCjRmgpizJ9XrT64ON5crbXvRJaT/3uAXX4ApgGORU8+jb+k18IcV25lv59wRB0WM9GJQWumnPknXyG9NRcvuopgUETogQIDaRhJtfBPB81pd+SR+pUJaG7YL/+Bu+67Nm8h/J1tn9BwZxUWPhN8a1FkxdDh1OK51ZUyDu8xGiH2F3//V8qdOqkI2hYcV2hoUGXyl9n3eIysJKSYJZVUsU1jIph0SF6DCBmbMZeiomBCfuCPmQfBqS0wHM55W61qt11VGNZrlcRzQlOEtWmd/lyWGJG/zWm27ynGi7c6+jZ+PNvO2cj+Y5k7zqvfX1lV6dIteXAc2/kwZGeGGrUaVgVsvVUV7QAA9ztgE0iIXr272l3xcQpaLndY+L0vqqwRXwDACAW7ltzZtpzyUKCR9hFLw11BiJVqs4mLipFUYp25/VXuRMIcbQbBMq96u7hv2Ywsh1PYrAPcLrG7dnRjr6kDplGhLV0VQ9qe150L0pyBztPdac
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(83380400001)(86362001)(36756003)(71200400001)(91956017)(66946007)(76116006)(64756008)(5660300002)(316002)(66556008)(450100002)(4326008)(66446008)(38070700005)(66476007)(82960400001)(8936002)(38100700002)(8676002)(6486002)(122000001)(41300700001)(110136005)(2906002)(2616005)(6512007)(6506007)(186003)(478600001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K21JSGx6QzBCK3pCWERqWVdZUkZ3NVNlaCt1cFZWNzF0UnNGUVlla3MrOVJ6?=
 =?utf-8?B?ZEFJT3dQNk5mNHY1OUJrYmszQ0UxOWJvaE5CQzFNTXRPSXQrc2F1SE56R1p4?=
 =?utf-8?B?RnBtbzFmZnl0b0lpNHBxMENOQ2YwRXN6cEtEajR4Mnh1U0tKN3R4M3hwQm56?=
 =?utf-8?B?Rlo2U0FmdWRXQWpBSThHZHIzMTRZZVloTS9iMlVYRmc3MWZYbStBMlpXeGo2?=
 =?utf-8?B?b3QzeVlvd1g4cHU0b1lzekRUZ2paMytWaVhmd2N0bG5kaG5wTXdYSUZpbHhm?=
 =?utf-8?B?Q0h3d3BKN1J3VHJmWmZEMTNtZ3FSZW9CK2xmVHZZMHQ2cHZPUU4wNzFSbU1R?=
 =?utf-8?B?djB0UnJSRHpyTzFUTUJ1dUZ1WW5WTW1GVGJxTUJzVFY2dDcxUGJ2Qk5yY2JQ?=
 =?utf-8?B?ZWVjRTFpSzc2d3ppUVMrZFY4Y0VnYjFzSTNCbHhVdGdERUNPWjB3S3B6ZG0r?=
 =?utf-8?B?NkY2VThxT2lRVis4cnlaZVhXT0NrWFdEMktkRHpsUnpwd05XczRNYUdEbEto?=
 =?utf-8?B?M25tK1JZK2FWMUhCWXRCVjU0M0M2TTFxSy9iZGY4MTBPSXpQVWp1d3RPckxK?=
 =?utf-8?B?NlBhUitCL3RPRHQ2bnZDRU9ZMTVvN29nWmtWQmF3a3BSSUs1UG43T0ZTL1Fx?=
 =?utf-8?B?YnVGeTd2LzRyZTVIUHk4VHQveXpCWjFxVnBYb3JLV21GOW5ldGRQVTRxMnBk?=
 =?utf-8?B?dC9OOUFWeHIyTXV5L0RRb2s3QXJuNlJDMFF0Y1pPbytqS0RLUWZVV3FZbjRY?=
 =?utf-8?B?SGRXMWJ2emphaHM0T3hnV2FaQzZkaHE0dzNFZ0pWRkU1VlhCZ0UyTUZMamhT?=
 =?utf-8?B?dlJHVWtYOUdBeFhPMzZXYUVDK1NCbkVmQ0xDdWlGYWJ5VmlKNjJDKzFMMHRC?=
 =?utf-8?B?cDVXMkI3Y2FyQVpXZ3FaMFV1eWJBWHdTTmxVNWtmWWgvK0hpY3BvMHYybFds?=
 =?utf-8?B?eXB4blBWUGtqYzVCRXRKNVJINVRDYVppUXlZWGNyRU1jeWxNeUJCUW5DYkZW?=
 =?utf-8?B?OERyRmd1eDllVEJlbGxKT1JDbStoUFFVTFkvYW84Smxhd0I2ZmVCK1RXVFdL?=
 =?utf-8?B?clNpb3p5YjQ2ZisxeHdBSU82ajRrL3dHeklBZ2M0N05vSUs3cDNEYkhNdUY5?=
 =?utf-8?B?VkI1UENBZ0tTODBCMlpsemVZVTlNSnR2K2VuQzdlRE9ZVnhxZ20yZEZ6bDhl?=
 =?utf-8?B?cjR4RWo1ZWpSaDROZVg1REc0V0ZlL3A2WkdUVjhLVTZZTys1RXBvTXk0M0R1?=
 =?utf-8?B?ZVdXZzBmYmhwTXh4WGYweFBSbG5kMHlmaktmS0gyTmZ6RC9WL0hLRHBuV3Jz?=
 =?utf-8?B?SUIvQXJxMVdJNVNJQ3JnMHRlVXk2d0dSaHFNYXN5c2h0TjlCODVmMmtuaTRz?=
 =?utf-8?B?alc4c1JoMUpJbXcxK3NZeU5zSlR6dDgyb0xPbU1kSlhwZit5VVQzVzRBTERq?=
 =?utf-8?B?WE5HZ2owMmZMSVFGdVppb3pkcGlUY0V5akd3dTNiSWZCQ0p2VGZxNkErRkpn?=
 =?utf-8?B?UGlrWEp4UVpOZzFSRlFvVmNSMWQzYzNzZUJla0Y2QTVUSHp3bStGc0Y1MEpT?=
 =?utf-8?B?Y1RyNk80akd4U081RjE3U290VXRYTG5vVGJhTmxDOUltRyt0a1haU25meGl1?=
 =?utf-8?B?RmRUUkxmRDkzbnVoVFpyaXM2TjFKS1FIQnRuZWFoQWVEZ3Z6amJhZkkvai9h?=
 =?utf-8?B?cElvNXowbU1GekE3dUgvSm13UElTYTBxejZKMWdKWUVkUG1NNTdZUVphZ0t4?=
 =?utf-8?B?N2JKTTkwbi9QdEVOM2F3cDlON0RWSUVWM1gwMHByeEE4eERINGVET3VGSG9T?=
 =?utf-8?B?VURQUmdtL0ZSOUhidDJaTG41MmhBcG81cks3M0kxTFNXd3QyeWJPdEs5TE9Y?=
 =?utf-8?B?akdIYU1KTlJ5T2w4OXJLYWN1WEN3RGZOajlRbThQSm9ITDNmNDZkWEFaSXhx?=
 =?utf-8?B?c1FsZHhwc2FxRmk4OVJ3bjhMMWU3SjBYdFI0czNNSy93VzVMLzloWFlHSFFr?=
 =?utf-8?B?WUlRNjVsMXI0QS8rdTZkbVhVaU02M05RWUdXSk5Cd1pia1hWVUJHSUxwUXlp?=
 =?utf-8?B?NjVBeU90QU42MldmYS8ybG9lYkI2T3lqODhqMzExOCtjbC92T1MyQ2FRS2tO?=
 =?utf-8?B?YnJCSEpVaWQ1alJPNFJIYUdzaEUvMGp6c3VjcXFIamgrZ2E5VG9TSlVsc0Rm?=
 =?utf-8?Q?E+0rQ622OHMTyczqk9jjHzU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABF9A087EF3E764B9FF7FB7AEE88CBD1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4eb041e-fb1c-4902-447a-08db616eb7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 00:33:55.9502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPooD7HuAQqgNohCjGDUwB2tw/qaVTWwIPXhx1k7MvB1b+j05Eb7rz+3QQAd8z+zXT/KhKznPR+00VCNTjMuVeJi2SUhoZx2TA/caIDFNVRuIZC7gBdJvksYOrmxV6py
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5354
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

T24gRnJpLCAyMDIzLTA1LTI2IGF0IDE3OjUyIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIGZ1bGwgYXV0aGVudGljYXRpb24gdmlhIHRoZSBHU0MgcmVxdWlyZXMg
YW4gaGVjaSBwYWNrZXQgc3VibWlzc2lvbg0KPiB0byB0aGUgR1NDIEZXIHZpYSB0aGUgR1NDIENT
LiBUaGUgR1NDIGhhcyBuZXcgUFhQIGNvbW1hbmQgZm9yIHRoaXMNCj4gKGxpdGVyYWxseSBjYWxs
ZWQgTkVXX0hVQ19BVVRIKS4NCj4gVGhlIGludGVsX2h1Y19hdXRoIGZ1Y3Rpb24gaXMgYWxzbyB1
cGRhdGVkIHRvIGhhbmRsZSBib3RoIGF1dGhlbnRpY2F0aW9uDQo+IHR5cGVzLg0KPiANCg0KDQph
bGFuOnNuaXANCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50
ZWxfZ3NjX3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuYw0K
PiBpbmRleCBiMjZmNDkzZjg2ZmEuLmM2NTljYzAxZjMyZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmMNCj4gQEAgLTI5LDEzICsyOSwzMiBAQCBzdGF0
aWMgdm9pZCBnc2Nfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICANCj4gIAlpZiAo
YWN0aW9ucyAmIEdTQ19BQ1RJT05fRldfTE9BRCkgew0KPiAgCQlyZXQgPSBpbnRlbF9nc2NfdWNf
ZndfdXBsb2FkKGdzYyk7DQo+IC0JCWlmIChyZXQgPT0gLUVFWElTVCkgLyogc2tpcCBwcm94eSBp
ZiBub3QgYSBuZXcgbG9hZCAqLw0KPiAtCQkJYWN0aW9ucyAmPSB+R1NDX0FDVElPTl9GV19MT0FE
Ow0KPiAtCQllbHNlIGlmIChyZXQpDQo+ICsJCWlmICghcmV0KQ0KPiArCQkJLyogc2V0dXAgcHJv
eHkgb24gYSBuZXcgbG9hZCAqLw0KPiArCQkJYWN0aW9ucyB8PSBHU0NfQUNUSU9OX1NXX1BST1hZ
Ow0KPiArCQllbHNlIGlmIChyZXQgIT0gLUVFWElTVCkNCj4gIAkJCWdvdG8gb3V0X3B1dDsNCmFs
YW46IEkgcmVhbGl6ZSB0aGF0IHRoaXMgd29ya2VyIGRvZXNudCBwcmludCBlcnJvciB2YWx1ZXMg
dGhhdA0KY29tZSBiYWNrIGZyb20gaW50ZWxfZ3NjX3VjX2Z3X3VwbG9hZCAtIHdvbmRlciBpZiB3
ZSBzaG91bGQgcHJpbnQNCml0IGJlZm9yZSBnb3RvIG91dF9wdXQuDQoNCj4gKw0KPiArCQkvKg0K
PiArCQkgKiBUaGUgSHVDIGF1dGggY2FuIGJlIGRvbmUgYm90aCBiZWZvcmUgb3IgYWZ0ZXIgdGhl
IHByb3h5IGluaXQ7DQo+ICsJCSAqIGlmIGRvbmUgYWZ0ZXIsIGEgcHJveHkgcmVxdWVzdCB3aWxs
IGJlIGlzc3VlZCBhbmQgbXVzdCBiZQ0KPiArCQkgKiBzZXJ2aWNlZCBiZWZvcmUgdGhlIGF1dGhl
bnRpY2F0aW9uIGNhbiBjb21wbGV0ZS4NCj4gKwkJICogU2luY2UgdGhpcyB3b3JrZXIgYWxzbyBo
YW5kbGVzIHByb3h5IHJlcXVlc3RzLCB3ZSBjYW4ndA0KPiArCQkgKiBwZXJmb3JtIGFuIGFjdGlv
biB0aGF0IHJlcXVpcmVzIHRoZSBwcm94eSBmcm9tIHdpdGhpbiBpdCBhbmQNCj4gKwkJICogdGhl
biBzdGFsbCB3YWl0aW5nIGZvciBpdCwgYmVjYXVzZSB3ZSdkIGJlIGJsb2NraW5nIHRoZQ0KPiAr
CQkgKiBzZXJ2aWNlIHBhdGguIFRoZXJlZm9yZSwgaXQgaXMgZWFzaWVyIGZvciB1cyB0byBsb2Fk
IEh1Qw0KPiArCQkgKiBmaXJzdCBhbmQgZG8gcHJveHkgbGF0ZXIuIFRoZSBHU0Mgd2lsbCBhY2sg
dGhlIEh1QyBhdXRoIGFuZA0KPiArCQkgKiB0aGVuIHNlbmQgdGhlIEh1QyBwcm94eSByZXF1ZXN0
IGFzIHBhcnQgb2YgdGhlIHByb3h5IGluaXQNCj4gKwkJICogZmxvdy4NCj4gKwkJICogTm90ZSB0
aGF0IHdlIGNhbiBvbmx5IGRvIHRoZSBHU0MgYXV0aCBpZiB0aGUgR3VDIGF1dGggd2FzDQo+ICsJ
CSAqIHN1Y2Nlc3NmdWwuDQo+ICsJCSAqLw0KPiArCQlpZiAoaW50ZWxfdWNfdXNlc19odWMoJmd0
LT51YykgJiYNCj4gKwkJICAgIGludGVsX2h1Y19pc19hdXRoZW50aWNhdGVkKCZndC0+dWMuaHVj
LCBJTlRFTF9IVUNfQVVUSF9CWV9HVUMpKQ0KPiArCQkJaW50ZWxfaHVjX2F1dGgoJmd0LT51Yy5o
dWMsIElOVEVMX0hVQ19BVVRIX0JZX0dTQyk7DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKGFjdGlvbnMg
JiAoR1NDX0FDVElPTl9GV19MT0FEIHwgR1NDX0FDVElPTl9TV19QUk9YWSkpIHsNCj4gKwlpZiAo
YWN0aW9ucyAmIEdTQ19BQ1RJT05fU1dfUFJPWFkpIHsNCj4gIAkJaWYgKCFpbnRlbF9nc2NfdWNf
ZndfaW5pdF9kb25lKGdzYykpIHsNCj4gIAkJCWd0X2VycihndCwgIlByb3h5IHJlcXVlc3QgcmVj
ZWl2ZWQgd2l0aCBHU0Mgbm90IGxvYWRlZCFcbiIpOw0KPiAgCQkJZ290byBvdXRfcHV0Ow0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2hlY2lf
Y21kX3N1Ym1pdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2hl
Y2lfY21kX3N1Ym1pdC5jDQo+IGluZGV4IDU3OWMwZjVhMTQzOC4uMGFkMDkwMzA0Y2EwIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWNfaGVjaV9j
bWRfc3VibWl0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3Nj
X3VjX2hlY2lfY21kX3N1Ym1pdC5jDQo+IA0KYWxhbjpzbmlwDQoNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfaHVjLmMNCj4gaW5kZXggYWI1MjQ2YWUzOTc5Li41YTQwNThkMzk1NTAg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jDQo+IA0KDQphbGFu
OnNuaXANCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxf
aHVjX2Z3LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWNfZncuYw0KPiBp
bmRleCBkMmI0MTc2YzgxZDYuLjhlNTM4ZDYzOWIwNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjX2Z3LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvdWMvaW50ZWxfaHVjX2Z3LmMNCj4gDQphbGFuOnNuaXANCg0KDQo+ICtpbnQgaW50
ZWxfaHVjX2Z3X2F1dGhfdmlhX2dzY2NzKHN0cnVjdCBpbnRlbF9odWMgKmh1YykNCj4gK3sNCj4g
KwlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqOw0KPiArCXZvaWQgKnBrdF92YWRkcjsN
Cj4gKwl1NjQgcGt0X29mZnNldDsNCj4gKwlpbnQgcmV0cnkgPSA1Ow0KPiArCWludCBlcnIgPSAw
Ow0KPiArDQo+ICsJaWYgKCFodWMtPmhlY2lfcGt0KQ0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4g
Kw0KPiArCW9iaiA9IGh1Yy0+aGVjaV9wa3QtPm9iajsNCj4gKwlwa3Rfb2Zmc2V0ID0gaTkxNV9n
Z3R0X29mZnNldChodWMtPmhlY2lfcGt0KTsNCj4gKw0KPiArCXBrdF92YWRkciA9IGk5MTVfZ2Vt
X29iamVjdF9waW5fbWFwX3VubG9ja2VkKG9iaiwNCj4gKwkJCQkJCSAgICAgaTkxNV9jb2hlcmVu
dF9tYXBfdHlwZShpOTE1LCBvYmosIHRydWUpKTsNCj4gKwlpZiAoSVNfRVJSKHBrdF92YWRkcikp
DQo+ICsJCXJldHVybiBQVFJfRVJSKHBrdF92YWRkcik7DQo+ICsNCj4gKwltc2dfaW4gPSBwa3Rf
dmFkZHI7DQo+ICsJbXNnX291dCA9IHBrdF92YWRkciArIFNaXzRLOw0KdGhpcyA0SyoyICg0ayBm
b3IgaW5wdXQgYW5kIDRLIGZvciBvdXRwdXQpIHNlZW1zIHRvIGJlIGhhcmRjb2RlZCBpbiB0d28g
ZGlmZmVyZW50IGxvY2F0aW9ucy4NCk9uZSBpcyBoZXJlIGluIGludGVsX2h1Y19md19hdXRoX3Zp
YV9nc2NjcyBhbmQgdGhlIG90aGVyIGxvY2F0aW9uIGluIGludGVsX2h1Y19pbml0IHdoaWNoIHdh
cw0KZXZlbiBpbiBhIGRpZmZlcmVudCBmaWxlLiBQZXJoYXBzIGl0cyBiZXR0ZXIgdG8gdXNlIGEg
I2RlZmluZSBhZnRlciB0byB0aGUgZGVmaW5pdGlvbiBvZg0KUFhQNDNfQ01ESURfTkVXX0hVQ19B
VVRILi4uIG1heWJlIHNvbWV0aGluZyBsaWtlIGEgIiNkZWZpbmUgUFhQNDNfTkVXX0hVQ19BVVRI
X0lOT1VUX1BLVF9TSVpFIChTWl80SykiDQo+ICsNCj4gKwlpbnRlbF9nc2NfdWNfaGVjaV9jbWRf
ZW1pdF9tdGxfaGVhZGVyKCZtc2dfaW4tPmhlYWRlciwNCj4gKwkJCQkJICAgICAgSEVDSV9NRUFE
RFJFU1NfUFhQLA0KPiArCQkJCQkgICAgICBzaXplb2YoKm1zZ19pbiksIDApOw0KPiArDQo+ICsJ
bXNnX2luLT5odWNfaW4uaGVhZGVyLmFwaV92ZXJzaW9uID0gUFhQX0FQSVZFUig0LCAzKTsNCj4g
Kwltc2dfaW4tPmh1Y19pbi5oZWFkZXIuY29tbWFuZF9pZCA9IFBYUDQzX0NNRElEX05FV19IVUNf
QVVUSDsNCj4gKwltc2dfaW4tPmh1Y19pbi5oZWFkZXIuc3RhdHVzID0gMDsNCj4gKwltc2dfaW4t
Pmh1Y19pbi5oZWFkZXIuYnVmZmVyX2xlbiA9IHNpemVvZihtc2dfaW4tPmh1Y19pbikgLQ0KPiAr
CQkJCQkgICBzaXplb2YobXNnX2luLT5odWNfaW4uaGVhZGVyKTsNCj4gKwltc2dfaW4tPmh1Y19p
bi5odWNfYmFzZV9hZGRyZXNzID0gaHVjLT5mdy52bWFfcmVzLnN0YXJ0Ow0KPiArCW1zZ19pbi0+
aHVjX2luLmh1Y19zaXplID0gaHVjLT5mdy5vYmotPmJhc2Uuc2l6ZTsNCg0KYWxhbjogaXMgdGhp
cyByaWdodD86IGZ3Lm9iai5iYXNlLnNpemUgaXMgdGhlIHJvdW5kZWQgdXAgZmlybXdhcmUgc2l6
ZSB0aGF0IHdhcw0KYWxsb2NhdGVkIGZyb20gaW50ZWxfdWNfZndfZmV0Y2ggd2hlbiBpdCBjYWxs
cyBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3NobWVtX2Zyb21fZGF0YQ0KVGhhdCBsYXR0ZXIgZnVu
Y2F0aW9uIHBvcHVsYXRlcyBvYmogd2l0aCB0aGUgInJvdW5kZWQgdXAgdG8gNEsiIHNpemUuDQpT
byBpcyBpdCBva2F5IHVzZSB0aGUgNGsgcm91bmRlZCB1cCBudW1iZXIgZm9yIHRoZSBzaXplIG9m
IHRoZSBmaXJtd2FyZSBtaWNyb2NvZGUgdGhhdCBuZWVkcyB0byBiZSBhdXRoZW50aWNhdGVkPw0K
KG9yLCBzaW5jZSB0aGlzIGlzIGEgR1NDIEZXIGNvbW1hbmQsIGRvZXMgR1NDIEZXIHBhcnNlIHRo
ZSBtZWkgaGVhZGVycyBhbmQgZXh0cmFjdCB0aGUgZXhhY3Qgc2l6ZSB0byBhdXRoZW50aWNhdGU/
KQ0KDQoNCmFsYW46c25pcA0KDQo+ICsNCj4gK291dF91bnBpbjoNCj4gKwlpOTE1X2dlbV9vYmpl
Y3RfdW5waW5fbWFwKG9iaik7DQo+ICsJcmV0dXJuIGVycjsNCj4gK30NCj4gIA0KYWxhbjpzbmlw
DQo=
