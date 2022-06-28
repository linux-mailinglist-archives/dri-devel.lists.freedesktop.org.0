Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8965A55E518
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 15:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975FD11A4B1;
	Tue, 28 Jun 2022 13:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD03C11A4B1;
 Tue, 28 Jun 2022 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656424429; x=1687960429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XuflfKWMimBeQCHxCAI0e2v5TUGRmhXnqpFD0WDxokc=;
 b=BlaPPb7dP8a3xoHOFSHzZ1CbPOxrAHAAznLKL9yWHigTBKk1g7/Acn3H
 2QGkj2ZHyUpEDklEk3ZctcPRFwcGIssz1iONeT0Ux3UGP9kghPexiCkLr
 c5bFu7E5EJvC62gqcHI4fqG9XDX9EsTpNVjSzqVOd30dqAcHxwoC8STPd
 70Vmxsbml2QyWNIF/VVAqw1lv8nBy41xuQ59dnIHLo0rJFvjzqPQvyfEX
 CWjvAuQkFIGMvpDUM7P2R+Dm8yDDmSfTqKYNst6tZ4DMhrpIOLwQMoROk
 pjNbj+ieB78nwgbmxqe8jMFkI7MJfBK/EMfyqENMbxYxF85dm2hyxQOi+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="264785843"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="264785843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 06:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="590320615"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 28 Jun 2022 06:53:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 06:53:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 28 Jun 2022 06:53:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 28 Jun 2022 06:53:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEpauMyfZMg0Kt7uM0bUpFdAlTmzhBslxJoImaoiNIBpJSF1F4TugMH5R9ClEx0TIBZhlpUA27y9MfjvG3PkHHMoqd+04azk5SnTy1vLLbNcsOkEoALdoSah4WhT1SER4/bnO9/iyCUfEi316KVPxz9P/Ruv9RuDPVGg+SrjGG1oAJ/Df1anGrd/9nvadhVO7uJ4fYNnnOEnnz1H9QAlf81JeHDj2f+lz8y0RWEcj5wbol2IK98Qvr54pEF78yZjnfg+gyQvRjxAGT7thdckEHSWf2YpEEW18A8ZhCUW0d+L4tZtg323+2EjLLbecaTjQcO+EKzPO50gZ8kNmxzMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuflfKWMimBeQCHxCAI0e2v5TUGRmhXnqpFD0WDxokc=;
 b=jNqBtD2K6OkC56cjssVIkoDi+7O0YQYQx9wvvoF8zH65KCKeEdWT+cPGT4/7N178MAWRjjjj+H99ud1vKOBBFyTJkeuRxqsMvSiphzX/tA6nTeX5aeCojY2cixdpePHT8a6D7CTXeZrPwDQvSHNfa8DLHLJ0qjzq8fRx61sZ7Odc6jOK9taTl4xRPHnvIepuCVP4dv1SBC4oiyHXtgTKOqaTwUFjX66IIboVwfn96UVx77PwhlPFlA0IbA6ndZpkQ8gAorMPTre6f5ITreNdq7vduuCZT3g5vczzShridbCtA7u+qlOfJbjG/cnCFYEM3DxQb0YWTQMyfFueaA4PXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by BN6PR11MB0036.namprd11.prod.outlook.com (2603:10b6:405:68::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 13:53:08 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639%8]) with mapi id 15.20.5373.022; Tue, 28 Jun 2022
 13:53:08 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Topic: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Index: AQHYhewtASI2jWfgB0G497ALZvi+T61bEx+AgAB2AwCAAAyDgIAADUaAgAEHWwCAAAh5AIAAI9AAgACkqeCAAMK1AIAAv6qAgAP2vgCAAKdA0IAA8umAgABO4CA=
Date: Tue, 28 Jun 2022 13:53:07 +0000
Message-ID: <BN6PR11MB16334CE5B1C65424640D8DAC92B89@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
 <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
 <BN6PR11MB1633C90D1B2E40359F1F168F92B59@BN6PR11MB1633.namprd11.prod.outlook.com>
 <1d36da1a-9224-5750-d103-60e7cdfdf8df@linux.intel.com>
 <BN6PR11MB1633F819E6DF445769061CF092B49@BN6PR11MB1633.namprd11.prod.outlook.com>
 <1f2ce51e-4b45-c654-954a-a71899309fb5@linux.intel.com>
 <BN6PR11MB1633B73631737329161B289A92B99@BN6PR11MB1633.namprd11.prod.outlook.com>
 <2ce76c99-e0bc-8a96-9e1c-f9d96ece62d4@linux.intel.com>
In-Reply-To: <2ce76c99-e0bc-8a96-9e1c-f9d96ece62d4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ce7fe4d-e9ea-4478-aec1-08da590d8820
x-ms-traffictypediagnostic: BN6PR11MB0036:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i45aYFkoxcJJLnve+GBYxJdTGBCqZTGv71E7N4t8ykPgXGAXWfEKjJzLoBmwfNkfxdYJTPzcS1Ub48I4C9qaC0aI6kKi3YlZKqV98hZBz9jAVOgkH1PPOVzQmH0RZOT6sxua7T7d+1gILiyhj3Ch8pCZBJWrqQNEtZ3niclHE8KGfu33iJkKAQkioMbH5G7WIQJ73hfk/voFJKZnK8ymyzNUgR5tYfLXjBN83o2XMjMDqsVFVR8OItmQiGrQMRwzJW2XNHXlRdzV57j8Zsnh+3tznNVpyYK1E2u5dRrrzBfYZQRXOu4CJPsFRt9jgf1CfednX8Gs1BBSdQmU92uZhMuAiVWKaGl7bS/VvBHOL0ANAEu8iHxlX2fKYBOM8ebW7vXcd2JXWHbObK56uP7JIxuh4/avMiSdTfZxr6uuArbUDhTqC8crrtdoaIyWsMN8ffniEVr/w+1oBHLAEaSfEk3q+cXUxJLRlvi/V7Y71cBQ0yxcySEANxGvTL9yirGxOOsjypxTOSyiUJHdwhg1mXGFFrY0UeiJRo0WfwLFkMj0zmjOvjvWxnWzTq6qENLp69XD+V4HO9VshK2Apoq6RPWvj5TULuD22uTFWdmJ6qWBtzmmcCjH/n0KOPC0b2QCEDmTF8iodIJD3Hqfdl2S7brzwt7wMdAuhXnb9D70/5utDF7nIxRlNSM24UqsnD+rpvYohueNOXm1eJojPcOD5GDe5kTS833erHT+W3QbzqmLzI6jVuFB0C0NTVu12zuEDLkKfnhtf5xFGN9nF2jeX+tNAkcae5Gs0e5/9KR6keE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(136003)(366004)(346002)(55016003)(86362001)(478600001)(5660300002)(8936002)(41300700001)(71200400001)(52536014)(53546011)(38070700005)(33656002)(2906002)(122000001)(82960400001)(38100700002)(6506007)(110136005)(66446008)(6636002)(54906003)(26005)(9686003)(4326008)(76116006)(8676002)(7696005)(66946007)(186003)(83380400001)(66556008)(66476007)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzI0Umt1c1JyVHEwdThTbTRRZGszS3NxR0JWRmZ4YjFGTDNpMzdVSjJlUnM2?=
 =?utf-8?B?K3Q2WHo1dUFCWmZYMGZsSityL3k3bGtSaTE0VDQ5dlJqM0tIbzRiMXI5aitu?=
 =?utf-8?B?S0FadzlKNXhtSS9xOHZEaXNhSTBqUkJ4YU5aN1JUMEZFRXUzakFVSUpBd3l3?=
 =?utf-8?B?WXlhUC9hTWVOT1dtYW14Mk41SnQ5ZE9uYWJHUStzTTRQZjE2QzVoTlc0UklD?=
 =?utf-8?B?MUt5R3ZQNW8zWWRSdmNraklNazc1WExvS3lkWXBiM2F0ZGQrMkFmSnZZazVU?=
 =?utf-8?B?TGx0YzZxQTNWMW5HazlDSmE2NWFWbFJOdk5GRktFaGVxWTdTVjRra0VaMHdU?=
 =?utf-8?B?bjl1OXU4ck1VTG1aZkQ0c0dmQzRSK292K3RwTG9QWlljazhjVFR3dkdsMmND?=
 =?utf-8?B?M0x6TWxmYy9tZ1Q1R3RNRWowVUpVV1VsTU1YcFlLWGEzbWFaNERlRDF4QXdx?=
 =?utf-8?B?cmtJWlQrM3liTlczQmF0T3RURVkyejJoTFBiZjNaODlCa09WVThsYXVxN0VN?=
 =?utf-8?B?bDVVa1NpVWk4QXZPL0JLOUFDMno4MlFUTFAvTVpKcFBadUtPa2JvN2NmS2xa?=
 =?utf-8?B?ZEQ4aHNNME90OEgrekFlRkpuaHdLbmkxWHNVOWZzOENLOHcxNlp6Qm1sSjM1?=
 =?utf-8?B?bFIvVnc2ekhWdFJxMHl2enMwLzdNd1pGb3o0TXhweExXZmd0Z01acXhpbkIr?=
 =?utf-8?B?dkVIRkFFRzhtK0lzNFZ6Q1NFQUNXVHBiRTFBNGJpbGtWb3hYOHVaZGh4NEtq?=
 =?utf-8?B?MnpCU2ZJRUFtWjRnQThBdlpqMlBMa1Z1b213a2c0OEh0ZFc0NGlBTTVWTlFz?=
 =?utf-8?B?WTNiL2Fpd003Y1V1eGttd0tnZHpWK0FZSmJ0RFBuS09pMGJiQnJDUFF5L0dr?=
 =?utf-8?B?RUhvOE9YUDNLSE5EUUVuaXd2V1ZLQ2RmZ25UNVkvcUUvaXBtTGlvNCtNdDds?=
 =?utf-8?B?RXFtOEV4UzNoVzVhWGhkNURrSHIwNGpiZU4xelRUMDg3OG9zQm1pM0RzL0Nh?=
 =?utf-8?B?eHBjQ1JIWXU1amg4QWNLNlNjdEJ0ODBjNXEreE14cEUxZjZGRHc0ZE1HR0gv?=
 =?utf-8?B?YjFvSnJqaXRVaU85YjkvRFZkTkV3dnZ2U21yYVVBUkhJSVc0RzRyVjhiOHBK?=
 =?utf-8?B?WVNWazg5bXJlUEEvUEMxYkh2N05ZTGhySHhPYzJHMjlmWE9EdWVnZ0c4V0lF?=
 =?utf-8?B?TW9za2F3OU1CYjZlbEhXTEdXMnNYQlovV0M1VDU5Mi91NnRNR01HTFQzUUwx?=
 =?utf-8?B?TXd4ejltSCtheGRvaUwwWFluRTB3SkVaaExlM0sza0lqbzF3MWV5RndHWGJC?=
 =?utf-8?B?SEp3RkJxWU9kMU1CMlIyQ09jRlN1M3E5d1hWZ1ZoL2d3N2ZtTG5xY2tMYTBh?=
 =?utf-8?B?ZnVabXVEWVRHakMybVlVb0RYakxwbzUycjJGdmsxTDRhdU80SVk5UGE2emdI?=
 =?utf-8?B?MUdOU1ZUSnNNMkQxUytPTVUyaUJ1NWhQVWhhekkyYlZweDF1Z2ZhdkhsUGpw?=
 =?utf-8?B?WFR1cVlubmZxOWZXUFRPbkRoUEppUFBDWDJoSzJTRXoyZnBQSW54SWFpZ2Ez?=
 =?utf-8?B?Q3F2YWRBSVIrczJ4TzJXYXFUdzR5Z1VuUkE4MjAzNUowaGlZd080TmdQV2Mx?=
 =?utf-8?B?ZUlXNTNGcFFUWUtXOExVWEM2WnpTclFyL05oMTV0Z0ltb1JFNnQ5dzFPa2dl?=
 =?utf-8?B?UWR3YmVTSHBEdHlGT2tqWDE2TkdaUitCdjQ4c2pYdnhyRzBndElvZG9mYmlC?=
 =?utf-8?B?WndCRlpPSHlDOVc1Nmd4R1VTTDlTK0JVdURPN3lKUTg2Z0lMa3JoMkZCckZ3?=
 =?utf-8?B?Y09EZHc1M2VNdFJPZ2h0U2xKd0xTSzVxU0l5RDZXbXRqaGUrNGtyTDZ3WGpy?=
 =?utf-8?B?clZkR0FEQVNhdkFtRnNMYmxNdUdpWkNoNko0aDU5UnkzWDFwVGFxZUxWWldH?=
 =?utf-8?B?UWsrSFZLYzBjYVdPNFl2UUVxd1NoZWhBaGljaHBuVno2YkpWUFFtMWZsWS8z?=
 =?utf-8?B?THc4YUJodTVuZFlTS2lTb3pyKzFnZVkzSzZOV3E0ZHlJMlFoMjMvaitVcTlP?=
 =?utf-8?B?VFlFNC9zb0RvK3VsZ3R1b0ZBNXlpS3l4YlVJcGdVSUxJalZiTmdVWWtTSXNq?=
 =?utf-8?Q?5EGGNfhBCAJmZO9WgtjFAHpOI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce7fe4d-e9ea-4478-aec1-08da590d8820
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 13:53:07.9167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjvGVzWazwhcLJuNDuUtM+w8DTXrs4W1zecc0AzBZH5snpnT5gJahYijg5jyTtXBLnk05+gwQYR4x13CHeJK9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0036
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IEp1bmUgMjgsIDIwMjIgNDo1OCBBTQ0KPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5j
b20+OyBMYW5kd2VybGluLCBMaW9uZWwgRw0KPiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5j
b20+OyBWaXNod2FuYXRoYXB1cmEsIE5pcmFuamFuYQ0KPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhh
cHVyYUBpbnRlbC5jb20+DQo+IENjOiBaYW5vbmksIFBhdWxvIFIgPHBhdWxvLnIuemFub25pQGlu
dGVsLmNvbT47IGludGVsLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBIZWxsc3Ryb20sDQo+IFRob21hcyA8dGhvbWFzLmhlbGxz
dHJvbUBpbnRlbC5jb20+OyBXaWxzb24sIENocmlzIFANCj4gPGNocmlzLnAud2lsc29uQGludGVs
LmNvbT47IFZldHRlciwgRGFuaWVsIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT47DQo+IGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbTsgQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCB2MyAzLzNdIGRybS9kb2MvcmZj
OiBWTV9CSU5EIHVhcGkgZGVmaW5pdGlvbg0KPiANCj4gDQo+IE9uIDI3LzA2LzIwMjIgMTk6NTgs
IFplbmcsIE9hayB3cm90ZToNCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IE9haw0KPiA+DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+ID4+IFNlbnQ6IEp1bmUgMjcsIDIw
MjIgNDozMCBBTQ0KPiA+PiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+OyBMYW5k
d2VybGluLCBMaW9uZWwgRw0KPiA+PiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+OyBW
aXNod2FuYXRoYXB1cmEsIE5pcmFuamFuYQ0KPiA+PiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVy
YUBpbnRlbC5jb20+DQo+ID4+IENjOiBaYW5vbmksIFBhdWxvIFIgPHBhdWxvLnIuemFub25pQGlu
dGVsLmNvbT47IGludGVsLQ0KPiA+PiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+PiBIZWxsc3Ryb20sIFRob21hcyA8dGhvbWFz
LmhlbGxzdHJvbUBpbnRlbC5jb20+OyBXaWxzb24sIENocmlzIFANCj4gPj4gPGNocmlzLnAud2ls
c29uQGludGVsLmNvbT47IFZldHRlciwgRGFuaWVsIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT47
DQo+ID4+IGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbTsgQXVsZCwgTWF0dGhldyA8bWF0dGhldy5h
dWxkQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCB2MyAz
LzNdIGRybS9kb2MvcmZjOiBWTV9CSU5EIHVhcGkNCj4gPj4gZGVmaW5pdGlvbg0KPiA+Pg0KPiA+
Pg0KPiA+PiBPbiAyNC8wNi8yMDIyIDIxOjIzLCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4+PiBMZXQn
cyBjb21wYXJlICJ0bGIgaW52YWxpZGF0ZSBhdCB2bSB1bmJpbmQiIHZzICJ0bGIgaW52YWxpZGF0
ZSBhdA0KPiA+Pj4gYmFja2luZw0KPiA+PiBzdG9yYWdlIjoNCj4gPj4+DQo+ID4+PiBDb3JyZWN0
bmVzczoNCj4gPj4+IGNvbnNpZGVyIHRoaXMgc2VxdWVuY2Ugb2Y6DQo+ID4+PiAxLiB1bmJpbmQg
dmExIGZyb20gcGExLA0KPiA+Pj4gMi4gdGhlbiBiaW5kIHZhMSB0byBwYTIuIC8vdXNlciBzcGFj
ZSBoYXMgdGhlIGZyZWVkb20gdG8gZG8gdGhpcyBhcw0KPiA+Pj4gaXQgbWFuYWdlcyB2aXJ0dWFs
IGFkZHJlc3Mgc3BhY2UgMy4gU3VibWl0IHNoYWRlciBjb2RlIHVzaW5nIHZhMSwgNC4NCj4gPj4+
IFRoZW4gcmV0aXJlIHBhMS4NCj4gPj4+DQo+ID4+PiBJZiB5b3UgZG9uJ3QgcGVyZm9ybSB0bGIg
aW52YWxpZGF0ZSBhdCBzdGVwICMxLCBpbiBzdGVwICMzLCBzaGFkZXINCj4gPj4+IHdpbGwgdXNl
DQo+ID4+IHN0YWxlIGVudHJpZXMgaW4gdGxiIGFuZCBwYTEgd2lsbCBiZSB1c2VkIGZvciB0aGUg
c2hhZGVyLiBVc2VyIHdhbnQgdG8gdXNlDQo+IHBhMi4NCj4gPj4gU28gSSBkb24ndCB0aGluayBp
bnZhbGlkYXRlIHRsYiBhdCBzdGVwICM0IG1ha2UgY29ycmVjdG5lc3MuDQo+ID4+DQo+ID4+IERl
ZmluZSBzdGVwIDMuIElzIGl0IGEgbmV3IGV4ZWNidWY/IElmIHNvIHRoZW4gdGhlcmUgd2lsbCBi
ZSBhIFRMQiBmbHVzaA0KPiB0aGVyZS4NCj4gPj4gVW5sZXNzIHRoZSBwbGFuIGlzIHRvIHN0b3Ag
ZG9pbmcgdGhhdCB3aXRoIGViMyBidXQgSSBoYXZlbid0IHBpY2tlZA0KPiA+PiB1cCBvbiB0aGF0
IGFueXdoZXJlIHNvIGZhci4NCj4gPg0KPiA+IEluIE5pcmFuamFuYSdzIGxhdGVzdCBwYXRjaCBz
ZXJpZXMsIGhlIHJlbW92ZWQgdGhlIFRMQiBmbHVzaGluZyBmcm9tDQo+IHZtX3VuYmluZC4gSGUg
YWxzbyBzYWlkIGV4cGxpY2l0bHkgVExCIGludmFsaWRhdGlvbiB3aWxsIGJlIHBlcmZvcm1lZCBh
dCBqb2INCj4gc3VibWlzc2lvbiBhbmQgYmFja2luZyBzdG9yYWdlIHJlbGVhc2luZyB0aW1lLCB3
aGljaCBpcyB0aGUgZXhpc3RpbmcgYmVoYXZpb3INCj4gb2YgdGhlIGN1cnJlbnQgaTkxNSBkcml2
ZXIuDQo+ID4NCj4gPiBJIHRoaW5rIGlmIHdlIGludmFsaWRhdGUgVExCIG9uIGVhY2ggdm1fdW5i
aW5kLCB0aGVuIHdlIGRvbid0IG5lZWQgdG8NCj4gaW52YWxpZGF0ZSBhdCBzdWJtaXNzaW9uIGFu
ZCBiYWNraW5nIHN0b3JhZ2UgcmVsZWFzaW5nLiBJdCBkb2Vzbid0IG1ha2UgYSBsb3QNCj4gb2Yg
c2Vuc2UgdG8gbWUgdG8gcGVyZm9ybSBhIHRsYiBpbnZhbGlkYXRpb24gYXQgZXhlY2J1ZiB0aW1l
LiBNYXliZSBpdCBpcyBhDQo+IGJlaGF2aW9yIGZvciB0aGUgb2xkIGltcGxpY2l0IGJpbmRpbmcg
cHJvZ3JhbW1pbmcgbW9kZWwuIEZvciB2bV9iaW5kIGFuZA0KPiBlYjMsIHdlIHNlcGFyYXRlIHRo
ZSBiaW5kaW5nIGFuZCBqb2Igc3VibWlzc2lvbiBpbnRvIHR3byBBUElzLiBJdCBpcyBtb3JlDQo+
IG5hdHVyYWwgdGhlIFRMQiBpbnZhbGlkYXRpb24gYmUgY291cGxlZCB3aXRoIHRoZSB2bSBiaW5k
L3VuYmluZCwgbm90IGpvYg0KPiBzdWJtaXNzaW9uLiBTbyBpbiBteSBvcGluaW9uIHdlIHNob3Vs
ZCByZW1vdmUgdGxiIGludmFsaWRhdGlvbiBmcm9tDQo+IHN1Ym1pc3Npb24gYW5kIGJhY2tpbmcg
c3RvcmFnZSByZWxlYXNpbmcgYW5kIGFkZCBpdCB0byB2bSB1bmJpbmQuIFRoaXMgaXMNCj4gbWV0
aG9kIGlzIGNsZWFuZXIgdG8gbWUuDQo+IA0KPiBZb3UgY2FuIHByb3Bvc2UgdGhpcyBtb2RlbCAo
bm90IGZsdXNoaW5nIGluIGViMykgYnV0IEkgaGF2ZSBteSBkb3VidHMuDQo+IENvbnNpZGVyIHRo
ZSBwb2ludGxlc3NuZXNzIG9mIGZsdXNoaW5nIG9uIE4gdW5iaW5kcyBmb3IgOTklIG9mIGNsaWVu
dHMgd2hpY2gNCj4gYXJlIG5vdCBpbmZpbml0ZSBjb21wdXRlIGJhdGNoLiBBbmQgY29uc2lkZXIg
aG93IHlvdSBtYWtlIHRoZSBiZWhhdmlvdXINCj4gY29uc2lzdGVudCBvbiBhbGwgcGxhdGZvcm1z
IChzZWxlY3RpdmUgdnMgZ2xvYmFsIHRsYiBmbHVzaCkuDQoNCldoZW4gSSB0aG91Z2h0IGFib3V0
IGViMywgY29tcHV0ZSB3b3JrbG9hZCBhbmQgdWxscyB3ZXJlIGFsc28gaW4gdGhlIHBpY3R1cmUu
IFVuZGVyIHVsbHMsIHVzZXIgbW9kZSBrZWVwIHN1Ym1pdHRpbmcgam9iIHdpdGhvdXQgY2FsbGlu
ZyBleGVjYnVmIChpdCB1c2VzIGEgc2VtYXBob3JlIHRvIG5vdGlmeSBIVyBvZiB0aGUgbmV3IGJh
dGNoKS4gVGhlIGV4ZWNidWYgKyBiYWNraW5nIHJlbGVhc2UgZmx1c2ggaGFzIGEgY29ycmVjdG5l
c3MgaXNzdWUgYXMgSSBwb2ludGVkIG91dC4gTm93IHdlIGRlY2lkZWQgZWIzIGlzIG9ubHkgZm9y
IG1lc2EsIG5vdCBmb3IgY29tcHV0ZSwgd2UgZG9uJ3QgaGF2ZSB0aGlzIGNvcnJlY3RuZXNzIHBy
b2JsZW0gZm9yIG5vdy4gV2UgY2FuIGNsb3NlIHRoaXMgY29udmVyc2F0aW9uIGZvciBub3cgYW5k
IHJldml2ZSBpdCB3aGVuIHdlIG1vdmUgdG8gWGUgYW5kIHZtIGJpbmQgZm9yIGNvbXB1dGUuDQoN
ClJlZ2FyZHMsDQpPYWsNCg0KDQo+IA0KPiBBbHNvIG5vdGUgdGhhdCB0aGlzIGRpc2N1c3Npb24g
aXMgb3J0aG9nb25hbCB0byB1bmJpbmQgdnMgYmFja2luZyBzdG9yZSByZWxlYXNlLg0KPiANCj4g
PiBSZWdhcmRpbmcgcGVyZm9ybWFuY2UsIHdlIGRvbid0IGhhdmUgZGF0YS4gSW4gbXkgb3Bpbmlv
biwgd2Ugc2hvdWxkDQo+IG1ha2UgdGhpbmdzIHdvcmsgaW4gYSBtb3N0IHN0cmFpZ2h0IGZvcndh
cmQgd2F5IGFzIHRoZSBmaXJzdCBzdGVwLiBUaGVuDQo+IGNvbnNpZGVyIHBlcmZvcm1hbmNlIGlt
cHJvdmVtZW50IGlmIG5lY2Vzc2FyeS4gQ29uc2lkZXIgc29tZSBkZWxheWVkIHRsYg0KPiBpbnZh
bGlkYXRpb24gYXQgc3VibWlzc2lvbiBhbmQgYmFja2luZyByZWxlYXNlIHRpbWUgd2l0aG91dCBw
ZXJmb3JtYW5jZQ0KPiBkYXRhIHN1cHBvcnQgd2Fzbid0IGEgZ29vZCBkZWNpc2lvbi4NCj4gDQo+
IEl0IGlzIHF1aXRlIHN0cmFpZ2h0Zm9yd2FyZCB0aG91Z2guIDspIEl0IGFsaWducyB3aXRoIHRo
ZSBlYjIgbW9kZWwgYW5kDQo+IGFyZ3VtZW50IGNhbiBiZSBtYWRlIGJhY2tpbmcgc3RvcmUgcmVs
ZWFzZSBpcyAobXVjaCkgbGVzcyBmcmVxdWVudCB0aGFuDQo+IHVuYmluZCAoY29uc2lkZXIgc29m
dHBpbiB3aGVyZSBjbGllbnQgY291bGQgdHJpZ2dlciBhIGxvdCBvZiBwb2ludGxlc3MgZmx1c2hl
cykuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQo=
