Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4EF3F6A2C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 22:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B846E0D2;
	Tue, 24 Aug 2021 20:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89C66E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 20:00:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278406431"
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="278406431"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 13:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="685551352"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2021 13:00:34 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 13:00:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 13:00:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 13:00:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyUCBvx9bZep7RER1n+EMcbqUxwmRE0Md6z9dtbOJLvT/HHghb8BmyJpVZOgmQPzblrMCO+lmAOHJgyi855xVW+k1SefOQEtFTPYyQ+WU/ox0sqC1kIf09zRa2LFHK++GY1qEP7P6YLlUL23YlBUGp/ZT2+u2xolj24NoTdV92/CrgyNaPC46YXFwV5bW8Y8sXolBc+JSUGlogVGb2Lg69cOTcb4JOhid9XuYiECSQwWpfGqaojch5YnNr1t8QeS22ndMPmQG4SvRwVUsWj9yEtqec+Kfh5BNISFSndCdIBuqv5J0ib+Osg4bDKFL9SL7+jJu3U27MjO6da7huyROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8AAEEuyYHxVkawsGbVHYhH+9W4TGlxtA4U6SYzpJq0=;
 b=DaldUBs5GXJSO4zQ9cpWYhoitQFKr0guLHL1HuzUpAS4VCpgFtFwDQt3xA5GaDRDCzejHfk3mrmfbRYhwSinA4R9mD9xXbAsND36F2Upmab10zjBMsBlYgXwGqMeXs2QI6wpx40vlNaVHS310UnKL+fpfU1NbvMsJ18W5VdFWlEIz9JxyC4Vwb3dl6/VNDOic5NlTYTzW/UKqLQP7NEYUmmPi4GHlSlutDvPxrJLCL2yumH+PRbfqN6Y9ctIYvQfem+Uak9spcoVdrFVp8agqv1CbUycRY0dGcxEOB3r60oOvs6hh78XTB7+jaZzF4m9ORyjEIr8d95v3i/H+g6lVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8AAEEuyYHxVkawsGbVHYhH+9W4TGlxtA4U6SYzpJq0=;
 b=ehe4noQQXRJ1gzSA2X0bXjpro9Z/DXHfgMjDW8UC8Wj6rkP44HakcMZlyzAadB5ZAfX6t7EM7IZ1NPiGjgb9jCrT7HOHM4I0UzOeEgxZoEhI45P9HoyoPZqDimYBszuR/BIwnVeN12UKx+7Ay+7YaIO0pBmBz9wODdN1WP7hnNc=
Received: from DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13)
 by DM5PR1101MB2250.namprd11.prod.outlook.com (2603:10b6:4:4d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 20:00:27 +0000
Received: from DM6PR11MB4548.namprd11.prod.outlook.com
 ([fe80::dd4b:c328:ed09:20c2]) by DM6PR11MB4548.namprd11.prod.outlook.com
 ([fe80::dd4b:c328:ed09:20c2%9]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 20:00:27 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@gmail.com>
CC: John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Gal Pressman
 <galpress@amazon.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>, "open list:DMA
 BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 "Gabbay, Oded (Habana)" <ogabbay@habana.ai>, "Tayar, Tomer (Habana)"
 <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>, "Alexander
 Matushevsky" <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>
Subject: RE: [RFC] Make use of non-dynamic dmabuf in RDMA
Thread-Topic: [RFC] Make use of non-dynamic dmabuf in RDMA
Thread-Index: AQHXlAUMBreFFsCBLU6q2Jf9yFBVGqt5AIuAgAJ0+gCAAIuMAIAAVf4AgAAHEICAABpVAIABOdsAgAM8+wCAAXcvAIAAB1AAgACExoCAAAFrAIAAAPmAgAAb6wCAAAfMAIAAAwgw
Date: Tue, 24 Aug 2021 20:00:27 +0000
Message-ID: <DM6PR11MB45482FF79156A2509E4DDDEBE5C59@DM6PR11MB4548.namprd11.prod.outlook.com>
References: <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <1d1bd2d0-f467-4808-632b-1cca1174cfd9@nvidia.com>
 <CAPM=9txd71fisvZ1Es5Fv2mwR2vWfHJarya7oeKOm2aq6tH0HQ@mail.gmail.com>
 <CADnq5_OBt2bQoWzadZ6kR46XU5QMVtzv9aB10CtE49PAotHHPg@mail.gmail.com>
In-Reply-To: <CADnq5_OBt2bQoWzadZ6kR46XU5QMVtzv9aB10CtE49PAotHHPg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0717f73c-c818-4401-1bab-08d96739d15a
x-ms-traffictypediagnostic: DM5PR1101MB2250:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR1101MB2250A1C74BDC8D83650179B9E5C59@DM5PR1101MB2250.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0k9FVg7W+lt3v2/EUy0SdUT2qIuNWu2N0mMPQxl7+KP+8Mgewqo0sGo/iXwsv/MkWdmOAmnjgd0l+kmaDQIdJGzUUpuZ6T4jkbY4cKW3xDw7k0W3xwVbB/zrrRAoIaYkxrmonMM0nbrKPdqAZLShN6L7bb29ZOeawDXw7atlUuNT9geD4b7dGdCnKI4QEWQOgzAcvGvfa+DMmjMdpEM+KmqTd+PULLAYjmjNrKOgPd1Dqr12AX4+6Zo1A55oS/1igzPh/fAbA6zxQfEyQsriiffgl4R709roecKzBjcaD25FvicXZicuzK7eRzprTiB+mAxhSlD6THDPRLJ46Jf/TT/HMpEOSRlw+Xm1geuwdSg/HPU/qBI+hiAu3KjlUQImAMk4rKYvaGawhGqf5KtcQG2z4WVaahB+ejHGUOYj4hHlyQ3WI0dXb7HxOpwrKpMfg6ccLXTa6ELzysQMW8F+p99KCW1PSwSDy0SW1iZZ0uos7zA9aBPdKuQkU+Uh+jKZrTb2vEJ1oPSxpEIAF0eQhsqFTDB5FhY9CpQAuf61GFVF75VC9af27nc8ydO38HyqBqQWZS9f3OSExMMQhMJba7YRHjbmBKqdZ8+HJ/0kX/3g8LCwhIJquUqGPGZBZyq0homj/4JRpIJHg/993TCaVQGOxOjocyj28lpNc2wxl+txncyEmLfeJVOQQkkge7yHAS9i2XLQMuRP6vZtGzfWZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4548.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(55016002)(66476007)(71200400001)(66574015)(83380400001)(76116006)(66946007)(38070700005)(316002)(2906002)(38100700002)(33656002)(64756008)(66556008)(478600001)(9686003)(7696005)(66446008)(52536014)(26005)(122000001)(186003)(8936002)(53546011)(4326008)(5660300002)(8676002)(6506007)(86362001)(54906003)(110136005)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDlpU2tnTjJ5MTh1L0VCdzhNdnUwQ25nUVlnQlQ4U3l4Wm1wZ0VuNnUxK3p6?=
 =?utf-8?B?c1cvK3EvYTlTRG1VbkpIMFozMDBPaGFYdFI2VXkzSWtvRzFTUWVRZlhWNmpi?=
 =?utf-8?B?dXhJT3d0QzhwSFNnZXQ1SzRtWERZZ1N6NVFLaE1reHJ5c0QwUDZacE51bXRG?=
 =?utf-8?B?b3hjWWhKT055KzJURE5RM2tsOFB0RG1PMXNSd1RjbmdXQjlVMHVoWTZYOTRz?=
 =?utf-8?B?Qi9uZXNWenFHb1RidW44b2VZT3IvWWNzQkZUS3dTZWFwWjFQVk9wOVlWY2tu?=
 =?utf-8?B?TVZPM2hFWlpLYkM0cjhRcDkrM2xBU2tGZVJUcnM2S0VudmxoZG5ST0tDd2pB?=
 =?utf-8?B?bmZrWHFPSEJpTmFxWmsrS05hRCtqNXFVQTAySEllZDgyZ0lIUm4ySzNLdDU3?=
 =?utf-8?B?YjdSME1wbTlQVGFQaEZEeXpxZDlZYnJGd0c1OGpOMW84R3J3NHQ0Qlo0WFB5?=
 =?utf-8?B?aU9NLzJGT2ZDcXpuMXNFV2JXYnUwMkpxQVU2cFAwOEFDbEwyWm05SVhUcWJv?=
 =?utf-8?B?TDl5WHl1eVIzNVBwazE4aXg0dXMreFBVaC91VmttRGZybW45OE5uUEhwdGEv?=
 =?utf-8?B?WnBtSC9FK0cwdVorL3FtTllaekRNOGd0aFJHaERibVlrRWdLRzFFdmFzN0Q0?=
 =?utf-8?B?dVdqZjRRaUhpU1NzM3NrMzVzazdhZU5uR0w0V0hsYXR5VTlqbkpBMk9sMWhw?=
 =?utf-8?B?b2plNHEzOGFlUzZDSUs5MHJXZmRFbCtqR05QQVM1Y2NhWC9YSUh5T0VaVW5V?=
 =?utf-8?B?bTJ2KzNnM2tYNDdENzg5QjMwclp4Q1VydC91MVNjb2c1eXVhRFRxeTF4a3Zy?=
 =?utf-8?B?c01UUkJsVVRSdkFEa1ZLSVVHSHhHeFhVZXA4R1h0N0dpL29FYTMrTHRxNVpW?=
 =?utf-8?B?ZFlDV3p6YWFVdGNkMXBMZmRSSE1iOExVcms5S2oxV1p3ZWV4MCtST21CYldF?=
 =?utf-8?B?YkpiWVJOL1Zub2svUGxJc0prYmwvS2ZUSnFVRmxDeWtTcXhhaXdTdUhzSFlH?=
 =?utf-8?B?aUx4VUc4OG9NRDZZLzBkVldQd2UxOTVQaDBSYWtIOWpCd0hGaGUrMzhtWHN6?=
 =?utf-8?B?VjZLcmVhS0RId01tcW1NZ1l0dFFtRW0rek9YamdaTUdzSEFzMG5PdXh3MHFB?=
 =?utf-8?B?azRTYjg0UUlFaG5wQW1xaGtuOXVWQ0pjalIvY2JibExmTFdYY2tTN3E3SnFj?=
 =?utf-8?B?Y1lUTVpiUXBLK3Y1ZFdDZnFGc0c2MlVCK2NoSHcrTVhhTFBWbmVQNjh1NTlQ?=
 =?utf-8?B?cmlSMnpIMzc5S0RudlM5dUxsOFJlRFc2dWNHUEhndzUrNjdGYTVXeHFPSVNY?=
 =?utf-8?B?MmN3cEFrWUJiMHc3RW1hNHJJTzQwSEtyM3VxWnRXYnQreE42WFFCU2s0WnA2?=
 =?utf-8?B?dUJyUm5LckZQQ3FmNHArRldrZlVLWlhkMStWSGplSHZoSTBaVFBUWmF4ZFcr?=
 =?utf-8?B?YjFSUVk3VXJIUlZrMklWWTd4N3l5bnU2L0xvUmFwWUZnQkdUdFMwS3RBTTd0?=
 =?utf-8?B?WU1xd2pmZDlLV3k1YTJYUnpmRUpweVlLQ2ttQkUvV2ZCanFOc3loU01kcXVU?=
 =?utf-8?B?UG15ZkljUkVWZXVBeGVmSTR5eHp6QUo3WmR3SFo4dlpTRTRHa0FHS3NqVTdy?=
 =?utf-8?B?ZlRHQ2dsWmY0Uy9wSXZRQnFNK3l6eGhyb0lVNkE5aDlQZlpQUXl6bWV3Tisw?=
 =?utf-8?B?anhTT3JQN25scjFmZXNGTW9SU1BBellVS3lSaUtzbnRBRE9FNkt0bU1ZZnVl?=
 =?utf-8?Q?pHFAsn8kfXQVXfAo8Q=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0717f73c-c818-4401-1bab-08d96739d15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 20:00:27.2009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UA7irB0e353mNJrY4T4Z9dFvwwAIzhwKvgr4uDFoaMLjsKGqmrghJVzl0zj+U4Q0vGQsiX4+vr3sljM7KTvkCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2250
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI0LCAyMDIxIDEyOjQ0
IFBNDQo+IFRvOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+IENjOiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+OyBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5j
YT47IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IEdhbCBQcmVz
c21hbg0KPiA8Z2FscHJlc3NAYW1hem9uLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD47IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBEb3VnIExlZGZv
cmQNCj4gPGRsZWRmb3JkQHJlZGhhdC5jb20+OyBvcGVuIGxpc3Q6RE1BIEJVRkZFUiBTSEFSSU5H
IEZSQU1FV09SSyA8bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnPjsgZHJpLWRldmVsIDxkcmkt
DQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExp
c3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1yZG1hIDxsaW51eC1yZG1h
QHZnZXIua2VybmVsLm9yZz47IEdhYmJheSwNCj4gT2RlZCAoSGFiYW5hKSA8b2dhYmJheUBoYWJh
bmEuYWk+OyBUYXlhciwgVG9tZXIgKEhhYmFuYSkgPHR0YXlhckBoYWJhbmEuYWk+OyBZb3NzaSBM
ZXlib3ZpY2ggPHNsZXlib0BhbWF6b24uY29tPjsgQWxleGFuZGVyDQo+IE1hdHVzaGV2c2t5IDxt
YXR1YUBhbWF6b24uY29tPjsgTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNvbT47IFhp
b25nLCBKaWFueGluIDxqaWFueGluLnhpb25nQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtS
RkNdIE1ha2UgdXNlIG9mIG5vbi1keW5hbWljIGRtYWJ1ZiBpbiBSRE1BDQo+IA0KPiBPbiBUdWUs
IEF1ZyAyNCwgMjAyMSBhdCAzOjE2IFBNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBPbiBXZWQsIDI1IEF1ZyAyMDIxIGF0IDAzOjM2LCBKb2huIEh1YmJh
cmQgPGpodWJiYXJkQG52aWRpYS5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9uIDgvMjQvMjEg
MTA6MzIgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gPiA+IC4uLg0KPiA+ID4gPj4+IEFu
ZCB5ZXMgYXQgbGVhc3QgZm9yIHRoZSBhbWRncHUgZHJpdmVyIHdlIG1pZ3JhdGUgdGhlIG1lbW9y
eSB0bw0KPiA+ID4gPj4+IGhvc3QgbWVtb3J5IGFzIHNvb24gYXMgaXQgaXMgcGlubmVkIGFuZCBJ
IHdvdWxkIGV4cGVjdCB0aGF0DQo+ID4gPiA+Pj4gb3RoZXIgR1BVIGRyaXZlcnMgZG8gc29tZXRo
aW5nIHNpbWlsYXIuDQo+ID4gPiA+Pg0KPiA+ID4gPj4gV2VsbC4uLmZvciBtYW55IHRvcG9sb2dp
ZXMsIG1pZ3JhdGluZyB0byBob3N0IG1lbW9yeSB3aWxsIHJlc3VsdA0KPiA+ID4gPj4gaW4gYSBk
cmFtYXRpY2FsbHkgc2xvd2VyIHAycCBzZXR1cC4gRm9yIHRoYXQgcmVhc29uLCBzb21lIEdQVQ0K
PiA+ID4gPj4gZHJpdmVycyBtYXkgd2FudCB0byBhbGxvdyBwaW5uaW5nIG9mIHZpZGVvIG1lbW9y
eSBpbiBzb21lIHNpdHVhdGlvbnMuDQo+ID4gPiA+Pg0KPiA+ID4gPj4gSWRlYWxseSwgeW91J3Zl
IGdvdCBtb2Rlcm4gT0RQIGRldmljZXMgYW5kIHlvdSBkb24ndCBldmVuIG5lZWQgdG8gcGluLg0K
PiA+ID4gPj4gQnV0IGlmIG5vdCwgYW5kIHlvdSBzdGlsbCBob3BlIHRvIGRvIGhpZ2ggcGVyZm9y
bWFuY2UgcDJwIGJldHdlZW4NCj4gPiA+ID4+IGEgR1BVIGFuZCBhIG5vbi1PRFAgSW5maW5pYmFu
ZCBkZXZpY2UsIHRoZW4geW91IHdvdWxkIG5lZWQgdG8NCj4gPiA+ID4+IGxlYXZlIHRoZSBwaW5u
ZWQgbWVtb3J5IGluIHZpZG1lbS4NCj4gPiA+ID4+DQo+ID4gPiA+PiBTbyBJIHRoaW5rIHdlIGRv
bid0IHdhbnQgdG8gcnVsZSBvdXQgdGhhdCBiZWhhdmlvciwgcmlnaHQ/IE9yIGlzDQo+ID4gPiA+
PiB0aGUgdGhpbmtpbmcgbW9yZSBsaWtlLCAieW91J3JlIGx1Y2t5IHRoYXQgdGhpcyBvbGQgbm9u
LU9EUCBzZXR1cA0KPiA+ID4gPj4gd29ya3MgYXQgYWxsLCBhbmQgd2UnbGwgbWFrZSBpdCB3b3Jr
IGJ5IHJvdXRpbmcgdGhyb3VnaCBob3N0L2NwdQ0KPiA+ID4gPj4gbWVtb3J5LCBidXQgaXQgd2ls
bCBiZSBzbG93Ij8NCj4gPiA+ID4NCj4gPiA+ID4gSSB0aGluayBpdCBkZXBlbmRzIG9uIHRoZSB1
c2VyLCBpZiB0aGUgdXNlciBjcmVhdGVzIG1lbW9yeSB3aGljaA0KPiA+ID4gPiBpcyBwZXJtYW5l
bnRseSBsb2NhdGVkIG9uIHRoZSBHUFUgdGhlbiBpdCBzaG91bGQgYmUgcGlubmFibGUgaW4NCj4g
PiA+ID4gdGhpcyB3YXkgd2l0aG91dCBmb3JjZSBtaWdyYXRpb24uIEJ1dCBpZiB0aGUgbWVtb3J5
IGlzIGluaGVyZW50bHkNCj4gPiA+ID4gbWlncmF0YWJsZSB0aGVuIGl0IGp1c3QgY2Fubm90IGJl
IHBpbm5lZCBpbiB0aGUgR1BVIGF0IGFsbCBhcyB3ZQ0KPiA+ID4gPiBjYW4ndCBpbmRlZmluYXRl
bHkgYmxvY2sgbWlncmF0aW9uIGZyb20gaGFwcGVuaW5nIGVnIGlmIHRoZSBDUFUNCj4gPiA+ID4g
dG91Y2hlcyBpdCBsYXRlciBvciBzb21ldGhpbmcuDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gT0su
IEkganVzdCB3YW50IHRvIGF2b2lkIGNyZWF0aW5nIGFueSBBUEktbGV2ZWwgYXNzdW1wdGlvbnMg
dGhhdA0KPiA+ID4gZG1hX2J1Zl9waW4oKSBuZWNlc3NhcmlseSBpbXBsaWVzIG9yIHJlcXVpcmVz
IG1pZ3JhdGluZyB0byBob3N0IG1lbW9yeS4NCj4gPg0KPiA+IEknbSBub3Qgc3VyZSB3ZSBzaG91
bGQgYmUgYWxsb3dpbmcgZG1hX2J1Zl9waW4gYXQgYWxsIG9uDQo+ID4gbm9uLW1pZ3JhdGFibGUg
bWVtb3J5LCB3aGF0J3MgdG8gc3RvcCBzb21lb25lIGp1c3QgcGlubmluZyBhbGwgdGhlDQo+ID4g
VlJBTSBhbmQgbWFraW5nIHRoZSBHUFUgdW51c2VhYmxlPw0KPiANCj4gSW4gYSBsb3Qgb2YgY2Fz
ZXMgd2UgaGF2ZSBHUFVzIHdpdGggbW9yZSBWUkFNIHRoYW4gc3lzdGVtIG1lbW9yeSwgYnV0IHdl
IGFsbG93IHBpbm5pbmcgaW4gc3lzdGVtIG1lbW9yeS4NCj4gDQo+IEFsZXgNCj4gDQoNCkluIGFk
ZGl0aW9uLCB0aGUgZG1hLWJ1ZiBleHBvcnRlciBjYW4gYmUgYSBub24tR1BVIGRldmljZS4NCg0K
Smlhbnhpbg0KDQo+ID4NCj4gPiBJIHVuZGVyc3RhbmQgbm90IGNvbnNpZGVyaW5nIG1vcmUgdGhh
biBhIHNpbmdsZSB1c2VyIGluIHRoZXNlDQo+ID4gc2l0dWF0aW9ucyBpcyBlbnRlcnByaXNlIHRo
aW5raW5nLCBidXQgSSBkbyB3b3JyeSBhYm91dCBwaW5uaW5nIGlzDQo+ID4gYWx3YXlzIGZpbmUg
dHlwZSBvZiB0aGlua2luZyB3aGVuIHRoaW5ncyBhcmUgc2hhcmVkIG9yIG11bHRpLXVzZXIuDQo+
ID4NCj4gPiBNeSBpbXByZXNzaW9uIGZyb20gdGhpcyBpcyB3ZSd2ZSBkZXNpZ25lZCBoYXJkd2Fy
ZSB0aGF0IGRpZG4ndA0KPiA+IGNvbnNpZGVyIHRoZSBwcm9ibGVtLCBhbmQgbm93IHRvIGxldCB1
cyB1c2UgdGhhdCBoYXJkd2FyZSBpbiBob3JyaWJsZQ0KPiA+IHdheXMgd2Ugc2hvdWxkIGp1c3Qg
YWxsb3cgaXQgdG8gcGluIGFsbCB0aGUgdGhpbmdzLg0KPiA+DQo+ID4gRGF2ZS4NCg==
