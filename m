Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687D838C920
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 16:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230376F889;
	Fri, 21 May 2021 14:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FD56F886;
 Fri, 21 May 2021 14:22:37 +0000 (UTC)
IronPort-SDR: +fJ7+2T5yCLBnsU1Z70VH327RFBwN4ifKaGBqCJccwBHAknCJkzXpIaKbxIkFbsjEMBP7PcTlz
 GOPLWdzHaX+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="181784395"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="181784395"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 07:22:36 -0700
IronPort-SDR: dq67KVyoAqNTwcf1SndKB4Nx44m8iPzaIL6l0fkt/ZpMWen+/sXkzL9buUO6Hdb2/nbmMhuFYP
 7DlZSguCKJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="406656868"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 21 May 2021 07:22:35 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 21 May 2021 07:22:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Fri, 21 May 2021 07:22:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Fri, 21 May 2021 07:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpx2Fxx1jhhONnCpIYQXSd27ciOWFnq816INDMaOT16CSdieDYQSHK3aSNbp2tLvIk0Sm/t0Jiv6hcvH8E6H9cHYM8c9AUAOUUCkNNypnefhO9fb42BFYEuIBXxVaqgD/rJe6xfDU1/NNuLQh/SQshIiy1P46LQjyivmKXKWM4uaCIBeL8B3VJsDK6n5WzYflZbHW/5jIq4BF4dpXQcbCybxqp0fKGqI67DJC0naQvs5oGgDeO0gQ9QBKwWmDLCg6Tu9i8E2jHZgGcnV8lNMmIuod5sWPdCS49aKPtPR4BW/iBfc42shCsiCu+nfPo/3MwNOat3eOwpDbHH95LMCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K2u6/UH8ZWwlu1aMgP9xHmQZTYvn463K9r+SM8TB+o=;
 b=F261w0Gd8BOaJ/CFwAZw/jk9/4k5/0kf9lvYWdUYBgupX3g6sMeZV+gmp0R64JVCInRd4V0yx3Vk9Qr/fKKD4zRV9XgolRh696ZZqyKYUXoj5rPPW5Z+I+lV0XGlNMXXlpdIWgHfv5p0x2GJJuQIcIpDh5cwKLLIyVFLQ1sXduwK2I/8wfLJbkdoD7XYgymd6bBYJ2KywSzxFlP4fhPSVm2pWv1aANJtUHHDaxBwVLGUjyZwxzhXycnqr/bkE9fU84sWS8DCYjWSiD8MygewFofq3mimDOPxG9w9T2Tw0VVUHWtA4m4Iw3Hh2Zc9fTeAjR3AVtzIPnUJFNlC9JBuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K2u6/UH8ZWwlu1aMgP9xHmQZTYvn463K9r+SM8TB+o=;
 b=POfuir/CEB4qbTiyFhtW9lBpT5gKHKu9YjvhViPmavEpNACv6HABTylRGlOKZFJJRm3RMYT9qRppHj50Fh1HvRcbsCqqe89cL2JwF33TPduItD4cJyQPMXhMRgvcdbbTMrUZpbxjuxDC90myzCvWNkpxfTZ60XXU8GWcZw/xUYQ=
Received: from BY5PR11MB4372.namprd11.prod.outlook.com (2603:10b6:a03:1bb::25)
 by BYAPR11MB3685.namprd11.prod.outlook.com (2603:10b6:a03:fa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 14:22:33 +0000
Received: from BY5PR11MB4372.namprd11.prod.outlook.com
 ([fe80::f1e6:d3d4:9f66:1626]) by BY5PR11MB4372.namprd11.prod.outlook.com
 ([fe80::f1e6:d3d4:9f66:1626%3]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 14:22:33 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Wait for vblank before
 collecting CRC
Thread-Topic: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Wait for vblank before
 collecting CRC
Thread-Index: AQHXTfhCls8Pt103VkKC8lBXFOqEJqrtzU8AgAAv6yA=
Date: Fri, 21 May 2021 14:22:33 +0000
Message-ID: <BY5PR11MB4372274545478F2FE1C1451A89299@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1621570131-23943-1-git-send-email-vidya.srinivas@intel.com>
 <f0926681-ea44-b2d2-fe8d-a443728d01c2@gmail.com>
In-Reply-To: <f0926681-ea44-b2d2-fe8d-a443728d01c2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [45.127.46.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6650c33-78b8-4b64-e72f-08d91c63e029
x-ms-traffictypediagnostic: BYAPR11MB3685:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36850A9A31904BDE3F655B4A89299@BYAPR11MB3685.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 19kJfCKs/Ci+gEnTfpKo/6ke7FvSrFwuuKQ7/n6pIuadYXVVNrFteJI9+ZwMMK0e5Cu1p26y2gHUz4qe+/odXoR68IstOQ9wJM/zlxkVb+YQECuttwBpMs2+EYHGXTSv/dF7jmW8vqO0pH/EfbmGUVuRHlXYW4RJ1xY/lzeIwayr6fKYdNNy0LBzK/ATjc8+/Ls3XQh53KgJDKTz/R2Oo4vXfpjokM1QMjlYDbsbKMheCb/OPes9DVuDSiWwcWBRr2LoynH7j/F+ssnFRkreAHJ+4nTotAF31BiC9bfU+Tp/ZLCcWN4JkKjuC3JCAlTsXyK5htcVsaC5qnTKqVFDj8zqUE6N6HLBaAQtvTjrMk7vs2npZ6rsJtl+4dVdBjMPV0PdZpa7yzBj+kTlpa7nFbnRABqX6jyL1cS64ANwSf03LP+KCRRm/7XRmL6eXFrtXbJOCMsHTDGtVOxLXgrjWFA+bkAHxCJSfXteVHTmm9dN5TrEmz2cNIDPb4Qucr0bQoM/dd703LKkK+S7n7+/lguuhKKMQ9Zc9d/XRP23ZmCD5Lj2JCEW13+lgfOcfalcDHdjK7xyfsV+0Ov63Wl5TUhfAO8qKDfuv2vnHB5aFsk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(39860400002)(136003)(346002)(8676002)(7696005)(76116006)(66446008)(2906002)(64756008)(66556008)(66946007)(66476007)(478600001)(71200400001)(26005)(52536014)(5660300002)(186003)(8936002)(86362001)(122000001)(53546011)(38100700002)(9686003)(55016002)(33656002)(316002)(4326008)(6506007)(83380400001)(110136005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dnRWQjRselhmU2xVdnJka3JNY2plekNYQ2VDWkRSdmhWLzNjbEpGK3NGR0tn?=
 =?utf-8?B?ajRGQjJleHhXTkwvUDZEU3l3OWljTm90eVo0dkxOOUlGdGZpTmZ5QzBRcTcv?=
 =?utf-8?B?YUxDWDM0WDhBdlFESW5wUlh6VXF0WXU0dWlFRFlPOTNXTHBvcXVhdG5GVEJZ?=
 =?utf-8?B?b3F6RzIvUUIrVmVBMTFoZ0N5ZlhJcnhQUjFpc2JOY20rdmhZZjY1cjRpQzhm?=
 =?utf-8?B?cnVSK0J0bXB6UTJESWM4bDNuWHAxTGhsT0RIUjNqNm5OcUlMQUtLSGFxV0NF?=
 =?utf-8?B?Y3JuT0dtMm9TZENIM000eWI2MTRTUll3WGlTWkVmVjA3Tm82K3h6N3U1QUlL?=
 =?utf-8?B?eGM3RTZvWTRqMnZpQXR2WW5XODg2WEM1eGVXS1VkTmtRQktuNHIvWFJ0dCtZ?=
 =?utf-8?B?MTV4WHVDQmxtSTVJWVF2dldmYnVucU1nMzBPUmFxN0JEZ3phamx3emZMSE1k?=
 =?utf-8?B?Qno2bnk3ZFVtS0paQU85S1l3Z3drbEY1L1FxdmUyalJNS2JLTXl4R0R0Nzho?=
 =?utf-8?B?ck1Gb1Z0ZGR5TUtpcGgwaWpFeTE4TXY1ZStKNXd5S0tKbEh0Y3R6MjVoZHFB?=
 =?utf-8?B?OUhmdTNJdjBWOEhyWUJmcWJ3dGdGK3o3dFgvY2RpdXNQMXowalJXei90ZG9T?=
 =?utf-8?B?dGZ1aHFIUnFtb1NQanlERmo1ZWxBeHl1VlRkbXlIcjBCUWhmalV4QWtNT3FU?=
 =?utf-8?B?dmU4K0V2L01DNVpuajBFS2hpeGtRZUFRaDlHQ0NzenBXcTRIQ0Q2aXNaZGUr?=
 =?utf-8?B?SENkQmpmanorSDJxNmRlNnAvMGY3NFBCd1ZLazZUT1kvZ1J6Rm5HSVhScC9o?=
 =?utf-8?B?aXdLbzNkWWdPVm5uSWVOSkpKT1RtaFo3YW1KU2szUGR0OVhQMDJIeS83QVFH?=
 =?utf-8?B?TTc4Qm1SZUdacS9ZN2pOQWZSMjRhSXc3SzlZN3BNMVpPdk8zK1hiU3V5SVRi?=
 =?utf-8?B?QXdzSmhuUTRSTEJ1Y1MxU0ZuMHlzcTMrVWVDQWJJV052MUowMzcvdm1NMnZk?=
 =?utf-8?B?QVltVFpqN3hjY2lsVnhOb3pxdUlKSGxGc1BoN244bW1oTllaMndiYU0raDlt?=
 =?utf-8?B?cjF1alY4cllrS0NXTG55S1NrUndrRk1XUzJFZ1lESk5oVXBDWlQ5U1FUK1pG?=
 =?utf-8?B?WW1oMFIrbzZ6SndGOGdxOXhmZWpaK2ZkQkVOK3N4T3Z5RUgycDI4UlNmemp1?=
 =?utf-8?B?RTQ3aHVEVTdWcFp2a3JZWm1LZFJJbTVSTGFQN1BUYVVjOUVzNkx2b0N4TUJK?=
 =?utf-8?B?M2NmZXhIeG1VTzZtS2NFblFZZ1Z5T05lWUdhOVJKTkFwamNUT2plRncwL0hF?=
 =?utf-8?B?eU1zc3dPVGJVT2k5WkIzSVBPblBrM1hUbmlCSlJtQUFucy9zaXhodExPVFdQ?=
 =?utf-8?B?cFRsczVZUVUzc2ovZEtVdThuVzJJbVhQY1ZMOWhwVkFDZDYwVUpLTXNhbE5t?=
 =?utf-8?B?ZGZDbEZicWo1ek1TVXZKeS9iRWhPSWhiZ2VER0xVRU1wd0xOcFlvOHRMRTg4?=
 =?utf-8?B?SjNKKy9TMWZ4cEF4UXpTSjNoTXBDTHF5MkZxTW5SUEJya0o0SjNiT2JmU1BH?=
 =?utf-8?B?UitkUmZieFE0Rlgyek4relpjd0MvOXhOK2ZTK2psYUFVa0JCcmdkUXZZQ240?=
 =?utf-8?B?VUVzOExqQTU4KzIwVExGU0VBQi90ak00dnRnRnZTdHduSWRGbzBwd3NObGsy?=
 =?utf-8?B?a2RYWW5jTHpwY0ZCZXRQdUdEbVRPMnVZRnpveG50aW9aZXpIZ2YweisrQm5y?=
 =?utf-8?Q?3wvnRJI5gGknpDpxpnVnE/6vrYyXeB3qG9WM1kF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6650c33-78b8-4b64-e72f-08d91c63e029
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 14:22:33.6559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p3RqM0YT8Im7uzcQ9tInzsPkD9B+9y1yxnmFnD+9QrInVHFHgg+5nPittWz3SoaFSktR8mcdyF35TZsOoTSBHpmX6x7uPR3/DBN4p5lyt+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3685
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
Cc: "Lin, Charlton" <charlton.lin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gSnVoYS1QZWtrYQ0KDQpXZSBhcmUgc2VlaW5nIHRoZSBDUkMgZmFpbHVyZXMgb24gSmFz
cGVybGFrZSBzeXN0ZW1zLiBTb21ldGltZXMgdGhlIHRlc3QgcGFzc2VzIGFuZCBzb21ldGltZXMg
aXQgZmFpbHMgdGhyb3dpbmcgQ1JDIGVycm9yLg0KDQpSZWdhcmRzDQpWaWR5YQ0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2th
LmhlaWtraWxhQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIE1heSAyMSwgMjAyMSA1OjAwIFBN
DQpUbzogU3Jpbml2YXMsIFZpZHlhIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+OyBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IExpbiwgQ2hhcmx0b24gPGNoYXJs
dG9uLmxpbkBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW2lndC1kZXZdIFtQQVRDSCBpLWctdF0g
dGVzdHMva21zX2JpZ19mYjogV2FpdCBmb3IgdmJsYW5rIGJlZm9yZSBjb2xsZWN0aW5nIENSQw0K
DQpIaSBWaWR5YSwNCg0Kb24gd2hpY2ggbWFjaGluZXMgdGhpcyB3b3VsZCBoZWxwPyBJIHNlZSB0
aGVyZSdzIG1hbnkgdmJsYW5rcyBhbHJlYWR5IGJlaW5nIHdhaXRlZC4gVGhlcmUncyBpZ3RfZGlz
cGxheV9jb21taXQyIHdoaWNoIHByb2JhYmx5IHdpbGwgYmxvY2sgYW5kIGV2ZW4gaWYgaXQgZGlk
bid0IHRoZXJlJ3MgaWd0X3BpcGVfY3JjX2NvbGxlY3RfY3JjKC4uKSB3aGVyZSBjcmMgY2FsY3Vs
YXRpb24gaXMgc3RhcnRlZCBhZnRlciBmbGlwIGFuZCB0aGVuIGdldCBvbmUgY3JjIGJlZm9yZSBk
aXNhYmxpbmcgY3JjIGNvdW50aW5nIGFnYWluLg0KDQovSnVoYS1QZWtrYQ0KDQpPbiAyMS41LjIw
MjEgNy4wOCwgVmlkeWEgU3Jpbml2YXMgd3JvdGU6DQo+IFdpdGhvdXQgd2FpdCBmb3IgdmJsYW5r
LCBDUkMgbWlzbWF0Y2ggaXMgc2VlbiBiZXR3ZWVuIGJpZyBhbmQgc21hbGwgDQo+IENSQyBvbiBm
ZXcgc3lzdGVtcw0KPiANCj4gQ2hhbmdlLUlkOiBJM2JlYzkzMWFhOTAxMTMwOTk3ZTY5M2FjMWNh
Y2YzODllMmE4MTAwZg0KPiBTaWduZWQtb2ZmLWJ5OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jp
bml2YXNAaW50ZWwuY29tPg0KPiAtLS0NCj4gICB0ZXN0cy9rbXNfYmlnX2ZiLmMgfCA2ICsrKyst
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2JpZ19mYi5jIGIvdGVzdHMva21zX2JpZ19mYi5j
IGluZGV4IA0KPiBiMjAyN2I2YjlkMWIuLjdkNzhmZjgyOWQ0MSAxMDA2NDQNCj4gLS0tIGEvdGVz
dHMva21zX2JpZ19mYi5jDQo+ICsrKyBiL3Rlc3RzL2ttc19iaWdfZmIuYw0KPiBAQCAtMjU0LDYg
KzI1NCw3IEBAIHN0YXRpYyB2b2lkIHVuc2V0X2x1dChkYXRhX3QgKmRhdGEpDQo+ICAgc3RhdGlj
IGJvb2wgdGVzdF9wbGFuZShkYXRhX3QgKmRhdGEpDQo+ICAgew0KPiAgIAlpZ3RfcGxhbmVfdCAq
cGxhbmUgPSBkYXRhLT5wbGFuZTsNCj4gKwlpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEt
PmRpc3BsYXk7DQo+ICAgCXN0cnVjdCBpZ3RfZmIgKnNtYWxsX2ZiID0gJmRhdGEtPnNtYWxsX2Zi
Ow0KPiAgIAlzdHJ1Y3QgaWd0X2ZiICpiaWdfZmIgPSAmZGF0YS0+YmlnX2ZiOw0KPiAgIAlpbnQg
dyA9IGRhdGEtPmJpZ19mYl93aWR0aCAtIHNtYWxsX2ZiLT53aWR0aDsgQEAgLTMzNywxNiArMzM4
LDE3IEBAIA0KPiBzdGF0aWMgYm9vbCB0ZXN0X3BsYW5lKGRhdGFfdCAqZGF0YSkNCj4gICAJCWln
dF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3BsYXkuaXNfYXRvbWlj
ID8NCj4gICAJCQkJICAgIENPTU1JVF9BVE9NSUMgOiBDT01NSVRfVU5JVkVSU0FMKTsNCj4gICAN
Cj4gLQ0KPiArCQlpZ3Rfd2FpdF9mb3JfdmJsYW5rKGRhdGEtPmRybV9mZCwgDQo+ICtkaXNwbGF5
LT5waXBlc1tkYXRhLT5waXBlXS5jcnRjX29mZnNldCk7DQo+ICAgCQlpZ3RfcGlwZV9jcmNfY29s
bGVjdF9jcmMoZGF0YS0+cGlwZV9jcmMsICZzbWFsbF9jcmMpOw0KPiAgIA0KPiAgIAkJaWd0X3Bs
YW5lX3NldF9mYihwbGFuZSwgYmlnX2ZiKTsNCj4gICAJCWlndF9mYl9zZXRfcG9zaXRpb24oYmln
X2ZiLCBwbGFuZSwgeCwgeSk7DQo+ICAgCQlpZ3RfZmJfc2V0X3NpemUoYmlnX2ZiLCBwbGFuZSwg
c21hbGxfZmItPndpZHRoLCBzbWFsbF9mYi0+aGVpZ2h0KTsNCj4gKw0KPiAgIAkJaWd0X3BsYW5l
X3NldF9zaXplKHBsYW5lLCBkYXRhLT53aWR0aCwgZGF0YS0+aGVpZ2h0KTsNCj4gICAJCWlndF9k
aXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3BsYXkuaXNfYXRvbWljID8N
Cj4gICAJCQkJICAgIENPTU1JVF9BVE9NSUMgOiBDT01NSVRfVU5JVkVSU0FMKTsNCj4gLQ0KPiAr
CQlpZ3Rfd2FpdF9mb3JfdmJsYW5rKGRhdGEtPmRybV9mZCwgDQo+ICtkaXNwbGF5LT5waXBlc1tk
YXRhLT5waXBlXS5jcnRjX29mZnNldCk7DQo+ICAgCQlpZ3RfcGlwZV9jcmNfY29sbGVjdF9jcmMo
ZGF0YS0+cGlwZV9jcmMsICZiaWdfY3JjKTsNCj4gICANCj4gICAJCWlndF9wbGFuZV9zZXRfZmIo
cGxhbmUsIE5VTEwpOw0KPiANCg0K
