Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C627E482DB3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 05:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0AD89D61;
	Mon,  3 Jan 2022 04:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5105589D61;
 Mon,  3 Jan 2022 04:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641182760; x=1672718760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6HuSSAg5XejYcNrQl9yG6oj7NV9MDaL+zlhnSfh+cw8=;
 b=WbvOLvUJUIDnPRlmmPK59DKEOppg8QTPtd3Xw9S1Hkc0awNu5MTO6LQD
 1hF/haVyrDez32LRhzAG/xfxG8RzZY0OJthbJdfHbrlgmYlbz1nVq2l2r
 ek5IgcXDD2xpSazhC1vAU5nhuoItq345Hox1QZUxMEGIBBKoM9nnFmLoF
 DEoMTRyWtt6SH8IVX/6GQcZ8SKDXcXQR5JCUTR2hHGmySlKSMJ1RaLxVB
 4OqOM1TdO1RxUEqiTG06ZbYLtzaUldd/fAsHaxMzBxcyNJFSiVEBSbndI
 L2krFP0k4lbPQyrajx6s35r1DXqGb7DEVveyBsZ6pbe3RpSJZasLAZGpt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="228833505"
X-IronPort-AV: E=Sophos;i="5.88,256,1635231600"; d="scan'208";a="228833505"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2022 20:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,256,1635231600"; d="scan'208";a="525392767"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 02 Jan 2022 20:05:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 2 Jan 2022 20:05:59 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 2 Jan 2022 20:05:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 2 Jan 2022 20:05:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 2 Jan 2022 20:05:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFuhKbOFQ8JlcEM2KL7LCXW5e3qpbEhiRVViNAFytMCB5rWNIvwDG2JC2eXd/DzlQHeK3YF5PbMEBryGfnDa8gBPA8wbGmHrA77weUsYnZ7RX6b+iBx6qubKjyv4Jy1F6Y3+nrk78DQrfEU2bCtHSwLoGoGAPSYldJqR6cu4cnVd6v50SqRL2Y9U92kmj1ClSlpoTy3u7HGDIZa2TW0nNa9mvLKpJjY4JWxdv0N7vI5wWAQ7yC7jqwEDb5IL4UGuTVMJ0DbBU5Xqf9hbLHjCC39awRcvtrYTM87mrebUrFqVh/4vdTS6DMkV4+6C1fiLJZyh+hkv0bunwv1i9fsFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HuSSAg5XejYcNrQl9yG6oj7NV9MDaL+zlhnSfh+cw8=;
 b=lZy6AAFZQBzh/WCJVS+uI5aBb7lvie821NG5RjC+GH6jKYc3oE6+wyY5r2wyB7oQIS/vSd5eJuWuBK3u7BWmHAeCOv++pi/CIeQ4MZP5eDDufe2cDziKLAfqe8iwvd3a0N7Flqn1JLVdMyl4efkEHARGgJlV4dfboShUhKBLDJtA7rp/TV7VyHB6iKSfn9SLI8++h3rfLxB05Hf0TzjIIfwVZPaP+Qob1/SEqhYffn3oiIRaD54EK9tn+OTMqRxE+iPRodkPRcVEw42Iyn4BCR2ln0azeXkq+qhmCF8aVbUFVw7ECkDuw37lyt8VrrY6xV5RqsUuB3VNQobYJcXHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM6PR11MB3948.namprd11.prod.outlook.com (2603:10b6:5:191::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Mon, 3 Jan 2022 04:05:55 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4c47:45d4:7870:1c79]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4c47:45d4:7870:1c79%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 04:05:54 +0000
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [i-g-t 07/14] tests/kms_color: New negative tests for plane level
 color mgmt
Thread-Topic: [i-g-t 07/14] tests/kms_color: New negative tests for plane
 level color mgmt
Thread-Index: AQHX2gZF+XC+eIbQOEOkr8/PWPI64KwJBsiAgEIvZmA=
Date: Mon, 3 Jan 2022 04:05:54 +0000
Message-ID: <DM8PR11MB5719D50DE971D8221134264C8D499@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-8-bhanuprakash.modem@intel.com>
 <20211118111941.764737fb@eldfell>
In-Reply-To: <20211118111941.764737fb@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfe9acf7-55aa-486a-14fa-08d9ce6e56e1
x-ms-traffictypediagnostic: DM6PR11MB3948:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3948B016020595583EFEBDC58D499@DM6PR11MB3948.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4m/Yezcusg0xN3QgJdI6r0a+wBpSjdOg8OS8WmPSh66fONfFTZI3a97ZaO9IItkgLQHk8JjMhkBxOAVmb71gRvvDhDw6EOd97H7om60MgKN7uZKbvVeahwTpABgYkPx5amMLXsICv3D40PMrYsx/XZ3LEs0+ofDaSjOKjYPF4yciDnjk6XxtFyxaeOiY+1wRor1z/VPc6rujRhBIJkB3uIhRqcYRc+7+tbCfeKRkytvvs8zWEMVv0VIrAypY9uOd6KyJW9RAOt3IaGgDMxJEk0ttsB2qFn8SWvyqxcAEQpajxvldm62BPZo0DMsnFIGj21VaQijSc2lFoxPlWB+BKi96E+kzXMbTgVIPSsgfdXG7afl8PY3st/zbPX+T6ePwfWstAF5JpZEXLIWPIz+35WH929321jmwhRQsZjMbPNHZQxAPBBE/ZDgpUa1blC0X8Z3naX7E0/3VWti/qA0eL3x0Boo7KL2xxA9ZuoMPsLsmk+7rzuPtbeQDWmTCvDsjeixOvbEamvXLpPM6tP/lYRwLms8Tl5bpqcfQIBRe4BfZPNwHtT0xS0qGBOvxSQEGClY1+kfF32MG9zTJlfjCu/InsSAu2SPFD9b85UwSoNcoc5K9efcopwnp9YOJUPL76u4xcmiZW6PNa6IEZtbutzWAtNnZd2f97gvj68xVA5WTil0v8dt6jz4gBagwe9tu5N5f+y8nD2kv6FFypjn9Fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(316002)(66476007)(26005)(66556008)(8676002)(76116006)(82960400001)(66946007)(508600001)(6916009)(186003)(66446008)(5660300002)(64756008)(52536014)(122000001)(53546011)(38100700002)(6506007)(54906003)(71200400001)(2906002)(7696005)(33656002)(86362001)(66574015)(9686003)(83380400001)(38070700005)(4326008)(107886003)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ai9lcGdHZ3grM3BxV3E4UFpOZWZQQWd1aGw2dWlkYkx0Uk1pMG1nbkJyalJt?=
 =?utf-8?B?WHJFSFZkZ014OGVjaTd4emRSVHY2Z1RzdWlkdHZyTkNid3g2bGc5RzJBU0h4?=
 =?utf-8?B?QTNNNEd4dTdlWGdGSUc3QWNkY0ZtU0hmOGVTQWVwQVp5NUNqR2RuTFpHY3h0?=
 =?utf-8?B?VTFTdmhKRDJ3WW44YitkbU4xaFBvUnVmS05ZdFl0dHJXU0hvb251bzk1NHZS?=
 =?utf-8?B?cWdUNUE3eTBwdEFLWHVyNGxrT250eXFWai9QSUI4VkJlOU1IdmNlcnB6OVlX?=
 =?utf-8?B?T1FHRnMrNVY2RVlRQ2ZubzcyekdxN3FSeEJ0UjRmT0poZFZJZE9kRW5leVR3?=
 =?utf-8?B?WUZHSFVVN2l2eEl6elZmbTkydmh4SFVDU2lnbUVqdk5IZ0ZxMEtqdzFzOEow?=
 =?utf-8?B?bXYwYlNuSkVNNnpvSDhINDd0TjhwUGdJZlM2aVZxbElyRVF3ZXEyMy9xWGpT?=
 =?utf-8?B?SG9qVm1FSUkzOER3Ri9CVHU1N0ZQdXRBcTZTOGpZd0F1VDV4VGMydVJXVG02?=
 =?utf-8?B?ZG0rMjZhcnpRcVd2OUV3NFUxbndSVDBXVWxwMVdvcWYrK2tkSjNHTGJodTA4?=
 =?utf-8?B?Qll1YkkwU1lQRTkwQTJoV2NhYTF6YXdQWFJ0SzZIdE9YMVBTTnZUVjBuN3Uy?=
 =?utf-8?B?Nzh3WG9BTm5RVHJHMEVPSURadDg0Q2pJaXZoVm9mcXRHdGNDQnkxVFpUUDY1?=
 =?utf-8?B?ZklUcTlTa1k5eEVaandlTmlUZ2lnUVR6ZzByR2Q5bkNHblNRdDJTbE9jNUxr?=
 =?utf-8?B?TVhsWUM1OWU3Z0FIOFpLQUp5bDIxSHNLdVlhZ2QwempLVHdYc0E0QVpDckdK?=
 =?utf-8?B?MU9URWVlaVQwMDQyV3ZrT2RodzZ0N1lHKzV2UTNiY1ZyNS9KNEVZTys4ZWZJ?=
 =?utf-8?B?UVJyY0ZuZ3lTVkZ5U2tHVFd3TG5FTGptWkl4azJPUktHWWJtWExnMlBoL3kr?=
 =?utf-8?B?QUFtZHhucC95VkkrcVhEeDZkMk5ibEF6RUZtMDFBQ0RDY0xTd0VaSlVjby9z?=
 =?utf-8?B?ZDYwamQvR1BaVDBJY1RzMjB5cWhzMTcrWTRZRy80Sm12SVV6MmJjT1phSjRu?=
 =?utf-8?B?ZHNRcndxRGQrSER3WGVpY05hWkF0eGExNnFyS2k3dDNIejhMS0pTeUhlNVpX?=
 =?utf-8?B?Njhva3hyQVhMM1FhN2ZWM21TdTlEOGZtWjlHbFlrWlpkcE5ReVZKTGhqd1Nw?=
 =?utf-8?B?RER0dUNEWXVIUDMyT2pza0U2T3VtY2VCNEhFR09wV2JpUWZHd0IwOFhhL3Fp?=
 =?utf-8?B?YkNXTXBvTU9MM1J2REFaeTRqblpDY2xCZEFvbnFiRFVpek14UmN3MXA2V0Y4?=
 =?utf-8?B?dnQ5S3FCZFdDYmQrdngwWndzUnRlVmZsSTVmbmVHeXQvU1ptQUpRR0RBWWlN?=
 =?utf-8?B?ZWxMWkZBUTNpSUY0dzJTb1k0SXMyWHNSSEJLSC9IVXlmaWFUQUpaMUpvNU56?=
 =?utf-8?B?U0NGMnpNL3VnUkpyajIrR1p1Ymw5ZXdDOUJ6TlpZcld0bFZUYXZzZlcrUXJ5?=
 =?utf-8?B?Q3FOWHlTSGFNVWtjcmp2S0pucEtFQ3pQSWxDTzlMQitXVGpNMkhqZkN0Qm4v?=
 =?utf-8?B?eUxtMGsvQTFRTFFSb0RBZkVmNU81dnJWdlJIajFUY3ZyV21oYVBqY3hGdzVZ?=
 =?utf-8?B?RHcrVkdOa01ZOXQ3bk95WjUwaFk4YUFKb1pqOWNqaER5emYydlVjc1NsYnVX?=
 =?utf-8?B?a0s3YkNXSTVTc0JQaUJmWFhBWVUwWFRMOTJnRVBHOG0vNXZJTWRiTUxTM1dO?=
 =?utf-8?B?Q0Yvb2dTMlZRQmMyd3FBYitrd3lpYzdqS2xOZTNob0JUcFcwSDFCRktOREJE?=
 =?utf-8?B?UlFNNE01dU43Z3hjOXZSZlJlV2NFRmFScldUc0VnRG5DTmRTR1p2cEk3NGhx?=
 =?utf-8?B?TGJpRkFyL2JJaEhUcGFpNFZwQmptNkw4Z3hjSnBWYXE5MExaM2RaSlhhdUtq?=
 =?utf-8?B?NTIrbldSY1lpUnAyeVRlQ2JjYk9ndWNKVEVwZGV2bEhKUHBnaW5vcmk0NCtw?=
 =?utf-8?B?Yk9nNkxmeEFEUFNBVVVoaTVwaVhHM0hveXJaWnlJVlo5a0NPS3VzaFhhODVx?=
 =?utf-8?B?dXFRK0ZHcmRBWWJjSmVja3NjWUJxd0p3c1hhRnh3UFV5RDQ3MWtzV1VwYkR4?=
 =?utf-8?B?MWpDbk96dXo4WXkrdVpPQ05zcTNqelk0QVVhWDJRR1E4OXZlV0gxdnBmazFs?=
 =?utf-8?B?d0Z1dkhVUW9qVS8zSUhpeElTdXJ2aHdRRGlkeU5Qc1o3RXFrd1JjcDdPdmxs?=
 =?utf-8?B?M25Nc2YrZm14elJpT3owUG1FWHFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe9acf7-55aa-486a-14fa-08d9ce6e56e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2022 04:05:54.8020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eIP6tlx+/nVFe22RcpUEUNwIc5wYj+8nGeSBLkXNbkY5av4HQPAJCG9J2OqzniLd5M0Fi3rKUyXKhfx5ohxd8vHsR7xJfmw+eNOCR8iJMj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3948
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVuQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE5vdmVtYmVyIDE4LCAyMDIxIDI6NTAgUE0NCj4gVG86IE1vZGVtLCBCaGFudXByYWth
c2ggPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSnVoYS1QZWtr
YQ0KPiBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT47IFNoYW5rYXIsIFVt
YSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW2ktZy10IDA3LzE0XSB0
ZXN0cy9rbXNfY29sb3I6IE5ldyBuZWdhdGl2ZSB0ZXN0cyBmb3IgcGxhbmUgbGV2ZWwNCj4gY29s
b3IgbWdtdA0KPiANCj4gT24gTW9uLCAxNSBOb3YgMjAyMSAxNToxNzo1MiArMDUzMA0KPiBCaGFu
dXByYWthc2ggTW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+IHdyb3RlOg0KPiAN
Cj4gPiBOZWdhdGl2ZSBjaGVjayBmb3I6DQo+ID4gICogcGxhbmUgZ2FtbWEgbHV0IHNpemVzDQo+
ID4gICogcGxhbmUgZGVnYW1tYSBsdXQgc2l6ZXMNCj4gPiAgKiBwbGFuZSBjdG0gbWF0cml4IHNp
emVzDQo+ID4NCj4gPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+
DQo+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
DQo+ID4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5j
b20+DQo+ID4gQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9rbXNfY29sb3IuYyB8IDEyNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MjcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb2xvci5j
IGIvdGVzdHMva21zX2NvbG9yLmMNCj4gPiBpbmRleCBlMTRiMzdjYjZmLi5kOWZlNDE3YmE5IDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19jb2xvci5jDQo+ID4gKysrIGIvdGVzdHMva21zX2Nv
bG9yLmMNCj4gPiBAQCAtNzM2LDYgKzczNiwxMTggQEAgc3RhdGljIHZvaWQgdGVzdF9waXBlX2xp
bWl0ZWRfcmFuZ2VfY3RtKGRhdGFfdCAqZGF0YSwNCj4gPiAgfQ0KPiA+ICAjZW5kaWYNCj4gPg0K
PiA+ICtzdGF0aWMgYm9vbCBpbnZhbGlkX3BsYW5lX2dhbW1hX3Rlc3QoZGF0YV90ICpkYXRhLCBp
Z3RfcGxhbmVfdCAqcGxhbmUpDQo+ID4gK3sNCj4gPiArCWlndF9kaXNwbGF5X3QgKmRpc3BsYXkg
PSAmZGF0YS0+ZGlzcGxheTsNCj4gPiArCWRybU1vZGVQcm9wZXJ0eVB0ciBnYW1tYV9tb2RlID0g
TlVMTDsNCj4gPiArCXVpbnQzMl90IGk7DQo+ID4gKw0KPiA+ICsJaWd0X2luZm8oIlBsYW5lIGlu
dmFsaWQgZ2FtbWEgdGVzdCBpcyBydW5uaW5nIG9uIHBpcGUtJXMgcGxhbmUtDQo+ICVzKCVzKVxu
IiwNCj4gPiArCQkJa21zdGVzdF9waXBlX25hbWUocGxhbmUtPnBpcGUtPnBpcGUpLA0KPiA+ICsJ
CQlrbXN0ZXN0X3BsYW5lX3R5cGVfbmFtZShwbGFuZS0+dHlwZSksDQo+ID4gKwkJCWlzX2hkcl9w
bGFuZShwbGFuZSkgPyAiaGRyIjoic2RyIik7DQo+ID4gKw0KPiA+ICsJaWd0X3JlcXVpcmUoaWd0
X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfR0FNTUFfTU9ERSkpOw0KPiA+ICsJaWd0
X3JlcXVpcmUoaWd0X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfR0FNTUFfTFVUKSk7
DQo+ID4gKw0KPiA+ICsJZ2FtbWFfbW9kZSA9IGdldF9wbGFuZV9nYW1tYV9kZWdhbW1hX21vZGUo
cGxhbmUsIElHVF9QTEFORV9HQU1NQV9NT0RFKTsNCj4gPiArDQo+ID4gKwkvKiBJdGVyYXRlIGFs
bCBzdXBwb3J0ZWQgZ2FtbWEgbW9kZXMuICovDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgZ2FtbWFf
bW9kZS0+Y291bnRfZW51bXM7IGkrKykgew0KPiA+ICsJCXNlZ21lbnRfZGF0YV90ICpzZWdtZW50
X2luZm8gPSBOVUxMOw0KPiA+ICsJCXNpemVfdCBsdXRfc2l6ZSA9IDA7DQo+ID4gKw0KPiA+ICsJ
CS8qIElnbm9yZSAnbm8gZ2FtbWEnIGZyb20gZW51bSBsaXN0LiAqLw0KPiA+ICsJCWlmICghc3Ry
Y21wKGdhbW1hX21vZGUtPmVudW1zW2ldLm5hbWUsICJubyBnYW1tYSIpKQ0KPiA+ICsJCQljb250
aW51ZTsNCj4gPiArDQo+ID4gKwkJaWd0X2luZm8oIlRyeWluZyB0byB1c2UgZ2FtbWEgbW9kZTog
XCclc1wnXG4iLCBnYW1tYV9tb2RlLQ0KPiA+ZW51bXNbaV0ubmFtZSk7DQo+ID4gKw0KPiA+ICsJ
CXNlZ21lbnRfaW5mbyA9IGdldF9zZWdtZW50X2RhdGEoZGF0YSwgZ2FtbWFfbW9kZS0+ZW51bXNb
aV0udmFsdWUsDQo+ID4gKwkJCQlnYW1tYV9tb2RlLT5lbnVtc1tpXS5uYW1lKTsNCj4gPiArCQls
dXRfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2x1dF9leHQpICogc2VnbWVudF9pbmZv
LQ0KPiA+ZW50cmllc19jb3VudDsNCj4gPiArDQo+ID4gKwkJaWd0X3BsYW5lX3NldF9wcm9wX2Vu
dW0ocGxhbmUsIElHVF9QTEFORV9HQU1NQV9NT0RFLCBnYW1tYV9tb2RlLQ0KPiA+ZW51bXNbaV0u
bmFtZSk7DQo+ID4gKwkJaW52YWxpZF9wbGFuZV9sdXRfc2l6ZXMoZGlzcGxheSwgcGxhbmUsDQo+
ID4gKwkJCQkJSUdUX1BMQU5FX0dBTU1BX0xVVCwNCj4gPiArCQkJCQlsdXRfc2l6ZSk7DQo+ID4g
Kw0KPiA+ICsJCWNsZWFyX3NlZ21lbnRfZGF0YShzZWdtZW50X2luZm8pOw0KPiA+ICsNCj4gPiAr
CQkvKiBPbmUgZW51bSBpcyBlbm91Z2guICovDQo+ID4gKwkJYnJlYWs7DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJZHJtTW9kZUZyZWVQcm9wZXJ0eShnYW1tYV9tb2RlKTsNCj4gPiArDQo+ID4gKwly
ZXR1cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgaW52YWxpZF9wbGFu
ZV9kZWdhbW1hX3Rlc3QoZGF0YV90ICpkYXRhLCBpZ3RfcGxhbmVfdCAqcGxhbmUpDQo+ID4gK3sN
Cj4gPiArCWlndF9kaXNwbGF5X3QgKmRpc3BsYXkgPSAmZGF0YS0+ZGlzcGxheTsNCj4gPiArCWRy
bU1vZGVQcm9wZXJ0eVB0ciBkZWdhbW1hX21vZGUgPSBOVUxMOw0KPiA+ICsJdWludDMyX3QgaTsN
Cj4gPiArDQo+ID4gKwlpZ3RfaW5mbygiUGxhbmUgaW52YWxpZCBkZWdhbW1hIHRlc3QgaXMgcnVu
bmluZyBvbiBwaXBlLSVzIHBsYW5lLQ0KPiAlcyglcylcbiIsDQo+ID4gKwkJCWttc3Rlc3RfcGlw
ZV9uYW1lKHBsYW5lLT5waXBlLT5waXBlKSwNCj4gPiArCQkJa21zdGVzdF9wbGFuZV90eXBlX25h
bWUocGxhbmUtPnR5cGUpLA0KPiA+ICsJCQlpc19oZHJfcGxhbmUocGxhbmUpID8gImhkciI6InNk
ciIpOw0KPiA+ICsNCj4gPiArCWlndF9yZXF1aXJlKGlndF9wbGFuZV9oYXNfcHJvcChwbGFuZSwg
SUdUX1BMQU5FX0RFR0FNTUFfTU9ERSkpOw0KPiA+ICsJaWd0X3JlcXVpcmUoaWd0X3BsYW5lX2hh
c19wcm9wKHBsYW5lLCBJR1RfUExBTkVfREVHQU1NQV9MVVQpKTsNCj4gPiArDQo+ID4gKwlkZWdh
bW1hX21vZGUgPSBnZXRfcGxhbmVfZ2FtbWFfZGVnYW1tYV9tb2RlKHBsYW5lLA0KPiBJR1RfUExB
TkVfREVHQU1NQV9NT0RFKTsNCj4gPiArDQo+ID4gKwkvKiBJdGVyYXRlIGFsbCBzdXBwb3J0ZWQg
ZGVnYW1tYSBtb2Rlcy4gKi8NCj4gPiArCWZvciAoaSA9IDA7IGkgPCBkZWdhbW1hX21vZGUtPmNv
dW50X2VudW1zOyBpKyspIHsNCj4gPiArCQlzZWdtZW50X2RhdGFfdCAqc2VnbWVudF9pbmZvID0g
TlVMTDsNCj4gPiArCQlzaXplX3QgbHV0X3NpemUgPSAwOw0KPiA+ICsNCj4gPiArCQkvKiBJZ25v
cmUgJ25vIGRlZ2FtbWEnIGZyb20gZW51bSBsaXN0LiAqLw0KPiA+ICsJCWlmICghc3RyY21wKGRl
Z2FtbWFfbW9kZS0+ZW51bXNbaV0ubmFtZSwgIm5vIGRlZ2FtbWEiKSkNCj4gPiArCQkJY29udGlu
dWU7DQo+ID4gKw0KPiA+ICsJCWlndF9pbmZvKCJUcnlpbmcgdG8gdXNlIGRlZ2FtbWEgbW9kZTog
XCclc1wnXG4iLCBkZWdhbW1hX21vZGUtDQo+ID5lbnVtc1tpXS5uYW1lKTsNCj4gPiArDQo+ID4g
KwkJc2VnbWVudF9pbmZvID0gZ2V0X3NlZ21lbnRfZGF0YShkYXRhLA0KPiA+ICsJCQkJCQlkZWdh
bW1hX21vZGUtPmVudW1zW2ldLnZhbHVlLA0KPiA+ICsJCQkJCQlkZWdhbW1hX21vZGUtPmVudW1z
W2ldLm5hbWUpOw0KPiA+ICsJCWx1dF9zaXplID0gc2l6ZW9mKHN0cnVjdCBkcm1fY29sb3JfbHV0
X2V4dCkgKiBzZWdtZW50X2luZm8tDQo+ID5lbnRyaWVzX2NvdW50ICogMjsNCj4gPiArDQo+ID4g
KwkJaWd0X3BsYW5lX3NldF9wcm9wX2VudW0ocGxhbmUsDQo+ID4gKwkJCQkJSUdUX1BMQU5FX0RF
R0FNTUFfTU9ERSwNCj4gPiArCQkJCQlkZWdhbW1hX21vZGUtPmVudW1zW2ldLm5hbWUpOw0KPiA+
ICsJCWludmFsaWRfcGxhbmVfbHV0X3NpemVzKGRpc3BsYXksIHBsYW5lLA0KPiA+ICsJCQkJCUlH
VF9QTEFORV9ERUdBTU1BX0xVVCwNCj4gPiArCQkJCQlsdXRfc2l6ZSk7DQo+ID4gKw0KPiA+ICsJ
CWNsZWFyX3NlZ21lbnRfZGF0YShzZWdtZW50X2luZm8pOw0KPiA+ICsNCj4gPiArCQkvKiBPbmUg
ZW51bSBpcyBlbm91Z2guICovDQo+ID4gKwkJYnJlYWs7DQo+IA0KPiBXaHkgaXMgb25lIGVudW0g
ZW5vdWdoPw0KPiANCj4gVGhlIHNhbWUgcXVlc3Rpb24gZm9yIHRoZSBvdGhlciBjYXNlIGluIHRo
aXMgcGF0Y2guDQoNClRoaXMgaXMganVzdCBmb3IgQ0kgdGltZSBvcHRpbWl6YXRpb24sIHNlZW1z
IHdlIGRvbid0IHNhdmUgbXVjaCBDSSB0aW1lDQpJJ2xsIHJlbW92ZSB0aGlzICYgZmxvYXQgYSBu
ZXcgcmV2Lg0KDQo+IA0KPiANCj4gPiArCX0NCj4gPiArDQo+ID4gKwlkcm1Nb2RlRnJlZVByb3Bl
cnR5KGRlZ2FtbWFfbW9kZSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHRydWU7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyBib29sIGludmFsaWRfcGxhbmVfY3RtX3Rlc3QoZGF0YV90ICpkYXRh
LCBpZ3RfcGxhbmVfdCAqcGxhbmUpDQo+ID4gK3sNCj4gPiArCWlndF9pbmZvKCJQbGFuZSBpbnZh
bGlkIENUTSB0ZXN0IGlzIHJ1bm5pbmcgb24gcGlwZS0lcyBwbGFuZS0lcyglcylcbiIsDQo+ID4g
KwkJCWttc3Rlc3RfcGlwZV9uYW1lKHBsYW5lLT5waXBlLT5waXBlKSwNCj4gPiArCQkJa21zdGVz
dF9wbGFuZV90eXBlX25hbWUocGxhbmUtPnR5cGUpLA0KPiA+ICsJCQlpc19oZHJfcGxhbmUocGxh
bmUpID8gImhkciI6InNkciIpOw0KPiA+ICsNCj4gPiArCWlndF9yZXF1aXJlKGlndF9wbGFuZV9o
YXNfcHJvcChwbGFuZSwgSUdUX1BMQU5FX0NUTSkpOw0KPiA+ICsJaW52YWxpZF9wbGFuZV9sdXRf
c2l6ZXMoJmRhdGEtPmRpc3BsYXksIHBsYW5lLA0KPiA+ICsJCQkJSUdUX1BMQU5FX0NUTSwNCj4g
PiArCQkJCXNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2N0bSkpOw0KPiANCj4gVGhlIGNvZGUgc2F5
cyB5b3UncmUgdHJ5aW5nIHNob3ZlIGEgTFVUIGludG8gYSBDVE0gYmxvYi4gSSB1bmRlcnN0YW5k
DQo+IHRoYXQgbWVjaGFuaWNhbGx5IHRoaXMgaXMgdGVzdCB5b3Ugd2FudCB0byBkbywgZmVlZCBh
IHdyb25nIHNpemVkIGJsb2IsDQo+IGFuZCBpbiB0aGlzIGNhc2UgdGhlIGNvbnRlbnRzIGRvIG5v
dCBtYXR0ZXIgKHVubGlrZSB3aXRoIGFjdHVhbCBMVVRzKSwNCj4gYnV0IHJlYWRpbmcgdGhpcyBj
b2RlIGlzIGNvbXBsZXRlbHkgbWlzbGVhZGluZyBhbmQgZG9lcyBub3QgbWFrZSBzZW5zZS4NCj4g
SXQgdGFrZXMgYSB3aGlsZSB0byB0aGluayBhYm91dCB3aGF0IHlvdSBhY3R1YWxseSB3YW50IHRv
IHRlc3QgaGVyZSwNCj4gYW5kIHRoZW4gcmV2ZXJzZS1lbmdpbmVlciB0aGUgY29kZSB0byB1bmRl
cnN0YW5kIHRoYXQgdGhhdCBpcyB3aGF0DQo+IGFjdHVhbGx5IGhhcHBlbnMsIHRvby4gVGhhdCBp
cyB0b28gbXVjaCBtZW50YWwgYnVyZGVuIGZvciB0aGUgcmVhZGVyIHRvDQo+IHJlYWxpemUgdGhh
dCB0aGlzIHBpZWNlIG9mIGNvZGUgYWN0dWFsbHkgd29ya3MuDQo+IA0KDQpTb3JyeSBmb3IgdGhl
IHBvb3IgZG9jdW1lbnRhdGlvbiwgSSdsbCB0cnkgdG8gYWRkIHNvbWUgY29tbWVudHMuDQoNCi0g
QmhhbnUNCg0KPiANCj4gVGhhbmtzLA0KPiBwcQ0KPiANCj4gPiArDQo+ID4gKwlyZXR1cm4gdHJ1
ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGJvb2wgcGxhbmVfZ2FtbWFfdGVzdChkYXRh
X3QgKmRhdGEsIGlndF9wbGFuZV90ICpwbGFuZSkNCj4gPiAgew0KPiA+ICAJaWd0X291dHB1dF90
ICpvdXRwdXQ7DQo+ID4gQEAgLTE0MTEsNiArMTUyMywyMSBAQCBzdGF0aWMgdm9pZCBydW5fdGVz
dHNfZm9yX3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bQ0KPiBwaXBlIHBpcGUpDQo+ID4gIAkJCQkJ
Y3RtX3Rlc3RzW2ldLml0ZXIpOw0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiArDQo+ID4gKwlpZ3Rf
ZGVzY3JpYmUoIk5lZ2F0aXZlIGNoZWNrIGZvciBpbnZhbGlkIHBsYW5lIGdhbW1hIGx1dCBzaXpl
cyIpOw0KPiA+ICsJaWd0X3N1YnRlc3RfZigicGlwZS0lcy1pbnZhbGlkLXBsYW5lLWdhbW1hLWx1
dC1zaXplcyIsDQo+ID4gKwkJCWttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpKQ0KPiA+ICsJCXJ1bl9w
bGFuZV9jb2xvcl90ZXN0KGRhdGEsIHBpcGUsIGludmFsaWRfcGxhbmVfZ2FtbWFfdGVzdCk7DQo+
ID4gKw0KPiA+ICsJaWd0X2Rlc2NyaWJlKCJOZWdhdGl2ZSBjaGVjayBmb3IgaW52YWxpZCBwbGFu
ZSBkZWdhbW1hIGx1dCBzaXplcyIpOw0KPiA+ICsJaWd0X3N1YnRlc3RfZigicGlwZS0lcy1pbnZh
bGlkLXBsYW5lLWRlZ2FtbWEtbHV0LXNpemVzIiwNCj4gPiArCQkJa21zdGVzdF9waXBlX25hbWUo
cGlwZSkpDQo+ID4gKwkJcnVuX3BsYW5lX2NvbG9yX3Rlc3QoZGF0YSwgcGlwZSwgaW52YWxpZF9w
bGFuZV9kZWdhbW1hX3Rlc3QpOw0KPiA+ICsNCj4gPiArCWlndF9kZXNjcmliZSgiTmVnYXRpdmUg
Y2hlY2sgZm9yIGludmFsaWQgcGxhbmUgY3RtIG1hdHJpeCBzaXplcyIpOw0KPiA+ICsJaWd0X3N1
YnRlc3RfZigicGlwZS0lcy1pbnZhbGlkLXBsYW5lLWN0bS1tYXRyaXgtc2l6ZXMiLA0KPiA+ICsJ
CQlrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSkNCj4gPiArCQlydW5fcGxhbmVfY29sb3JfdGVzdChk
YXRhLCBwaXBlLCBpbnZhbGlkX3BsYW5lX2N0bV90ZXN0KTsNCj4gPiAgfQ0KPiA+DQo+ID4gIGln
dF9tYWluDQoNCg==
