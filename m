Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497DE6D3DF1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 09:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6E10E147;
	Mon,  3 Apr 2023 07:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0110E147;
 Mon,  3 Apr 2023 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680506148; x=1712042148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R9QW5JqZYcWypDTpYsh9gthi/OadiPUO72RNuyV2DQk=;
 b=hk+OU0qet26JIa32A2yHZtsszk1jHc9JoleJ3YGyvOE3vg1zXYEx2wl1
 jVvOFI2HkcdBMS597TPra/DXeO5f1A0+McsLk3RfZInDOh6NpTPkXYWPb
 z967QZqi6GKlidB8pDTAy28p0jpfH2hDsBbrIbB4v39L3kr3nrM1f07YU
 sc+R3cFGvHhYyEPsJJQ9wto0b8DPQL3QvnhnpMdB7CP3dRl/blUXKSLDg
 FYU8buJeolBhOxl+dLfGtfrej49wMM3UKg2pdXWhIoXlTXs50utBGdO/q
 JTg0rMZL8d2bd//OIrm9k3nfygBYrbQJbjuVmbDv52qL8jv/FlIZsYprR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="404582069"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="404582069"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 00:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="809749087"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="809749087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 03 Apr 2023 00:15:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 00:15:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 00:15:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 00:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHL6lTE8BnskEamGNRB+Wm8BegsNxHXMbvqYyYaVlMX3fMlLt4OX+oDuzlByA7Gm8CJwK30+b0/z8a0JsXcHOrFY55CPaZw94iZc1QDPLcN3UrH/jfO5K9/pEa64sBXDbHMO+isnUEH8On0KU1VASky9KCe3H1y5SfaVVgSx7DvfZPvP0OFuGzFJThY8rWvka5RH8cnDycg+UcKAx3Fk2ivRTx9aZoY+cD8Hv/f3uPH5VR8Xup0+HFGPVMtmbzvuzcjclghsfiE3dz84T+Xw+SOLLnaaHG6Em017XA0Lr4lVxQ+o/qJS0MBFxtL4eTSRc3lfjJU2uVnF9jycb1Zeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9QW5JqZYcWypDTpYsh9gthi/OadiPUO72RNuyV2DQk=;
 b=V2GyXONcSHAMaNhrOXO+nJcvVvYOg4jOGGfbNhSn0YYbWQ+GHRtcBPzCxVhYbtcoQSjvwihPKJ9hyOsjrEm9cpMyLnkbUzJfUx/3JWCipjQ/Ii0SgaUwnxos9wzRfMKlGEd0b6HPdK1sfPO55yHiDR5NZ7AMf1VhtnBA3DqWnHUbW1KB7j3sIjlP2QG8OVS07l8r82oafTkMU1jkbg352JeexlSLTQJgJiicr0z1BJiAp2sqy+o3IbQIEHlUoKjdso5iyN/tDqLJs5Jtiw8GpA3dbO5p46pa2FLn5ubE3SG48GJyGGMQ2ez7s5y21TqSubM8FAjiB3BdHqlYxUVc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.29; Mon, 3 Apr 2023 07:15:43 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::a77e:fdd7:ee30:aea0]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::a77e:fdd7:ee30:aea0%6]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 07:15:43 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Topic: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Index: AQHZRn8nNJGDvjClF0qHNTTwmHKuQK7w1cUAgB+NaoCAAAIDgIAI8y2wgAASjIA=
Date: Mon, 3 Apr 2023 07:15:42 +0000
Message-ID: <DM4PR11MB63602CD0D5004C21E7FDDD76F4929@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
 <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
 <CAA8EJprrTPU6E59XjSa9SrMcg9q89ZPB33gayVMqCToR_nQ6CA@mail.gmail.com>
 <DM4PR11MB636021CC9BDA06AA87569160F4929@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB636021CC9BDA06AA87569160F4929@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH0PR11MB5128:EE_
x-ms-office365-filtering-correlation-id: a04bbc8f-e07b-4237-cd14-08db34133c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +aEs1lvCQHIIE8txg6mkNoo4pgeIW/8RsKsjS7ub2nhFivlHCKRSkhlxKRWTBxORUnFx15pG4FpE2d4dSNJcWMBeH6rQhyq8DJXJ2RQZvgYAYGCHnhWWbNoxtKaOwjrbUIFMeIc3Ma5FQbAm8xPuAvGUpbHitiNWljM2MQcySdVRpMuI6lpgkoUwI99zMkKv3Hqy3gCrr2lR6FDzt0SMhnDD0Bv29sBmCIGBGC5IeyDcr2yRNW28WpM40mzNBl93E7GLkeC17Tw1qMwNq9qKhvQRQCr22DRwhpk4xgqXY75xZD5U9VMZ+MabTfpQJYOT40LnYB06ojtXNmElqCyeXvjMNuPp7XrFLnryZ3Mnyd6UCP3m42nrbqu0ycR4+VO9crNATrtdKnXxkNbB9TXsBlAr3ZsmwkrqFNKEoe/wN/gdXbXA/MjcPUKLvVAAKkDS0tC5mqtQ7eo4sAiWnFqHT67PhBxUq0Eki6Y1XdscpVvrnqNqRYRPYpru6tO6/hgQL+RzzgrznORJh2YaGPocBsMCNGg9yotx283CtMtqLm/dtuGdlpjcWp6BBq8Q39K0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(8936002)(7696005)(2906002)(83380400001)(38100700002)(33656002)(9686003)(86362001)(52536014)(122000001)(82960400001)(5660300002)(966005)(41300700001)(76116006)(71200400001)(110136005)(2940100002)(66476007)(64756008)(8676002)(478600001)(66946007)(4326008)(54906003)(66556008)(186003)(66446008)(26005)(55016003)(53546011)(38070700005)(6636002)(6506007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3poRnlNODNYM3hMNkRSeEJuLzhVOUtKRlFNRTJqRWFrdjFnVG9QU0xzcFM5?=
 =?utf-8?B?RURIdWZRUS9VVEFmTGtVZW5jdUt4L0o3bDN5NGx2a1VXYUJaREUzajN0R1ZJ?=
 =?utf-8?B?NUpLTDFZRitqUHdwTTFSNlFOeE5TQWFITDJEak5ramowNnNXbmhITmczbDZP?=
 =?utf-8?B?dFA1azBnWk1uNE1xYWl0VzljWGxHZUtKT1p1dmdmRjltdnFrZUZ4WVA1TzJR?=
 =?utf-8?B?TVhxcE1vd215RW45YWhKMmVZbHIzbTZ5TmZGRmdmTCtIUnBpVEVOemdRd2dn?=
 =?utf-8?B?TGF5UFhSbzBHekVlaXIvZ01nRXRYRnlVTU1sVldMYkFnN0dzLzN2S2xsMHY5?=
 =?utf-8?B?NGRSSGthZ0c5QnRBaEs4TWZGNUs0RkhRN1J2eHM1NnR5dllQQTJKZGxvb2NP?=
 =?utf-8?B?aW02b3dOMmFoTDFiK2FQSGJyaVk2dmNQTERtQXIyOGlHaW0vTVNIMVlVTHhx?=
 =?utf-8?B?QzArOGhmbXJwU0JSbzlCS2ZWOGEyTlJFb2xwT2haY3RaRFJIekRXWHFpTUxO?=
 =?utf-8?B?YnRmelEwNGZXaUpReUJhakxKVnBseW9hMG9yWTlmc2RMSmpRQzVDY3YrelNn?=
 =?utf-8?B?bmN0NTBkQU93UGxCYXA3cmh0R0NkZkwveVdsdjhxY0cxUUFjTXp1VEY0Kzcy?=
 =?utf-8?B?TmM3SzlxS3JvTHdRMTc0eUE5Tkd6MG1acGJ5VXZ3RnhvTUZ5Y0ZZK2V3Zlh2?=
 =?utf-8?B?UmZMTk55NGlMeVl6eVJsbkptYTNxL2dxbHhjOGJ1eDdhSkZVMGQ5RUEwMlds?=
 =?utf-8?B?K0xSMHNLVmxxa3QvMUdiVXhlN0JZZW92ei85bW5kbGltWWNjVFZOVWE3azV2?=
 =?utf-8?B?TDFRM2VLc2FRZ0dUbUJRbmdNWG5idlVYa3A4Ukh6OGFNdkZXdkJQOEgxM2Nl?=
 =?utf-8?B?bUpxVUhXK1NxeVgvREhyNjB5cDVGUkV1V002bjZxTGtxNnR6T3VyMHBzWmxY?=
 =?utf-8?B?ZUs3YkpzTk16eVl3dXVjQ1U2b3hhSVFkY2xVbnlJVmVHcFpKVnFRQmhjcjYy?=
 =?utf-8?B?WU1uT2dQdTNzalFyUFE2cWc1d1dEenM0ZEZ6TTZSdThjeUVyc01JQ3N1TnZI?=
 =?utf-8?B?cGVRdVBVRjlGRGk0SGhJS0pUVkorY2Jjc1JaRm45T0hKK3lPZlJ6RGNWOW1C?=
 =?utf-8?B?em9Oc0NpOTc3OHNra1ZSSHlpSG5qTjhXMkVHaHl1S0doK0ZhQWFFeGx4ajlJ?=
 =?utf-8?B?MSszUEltdGtERHF0cmprMUR1d0hjRWZyaW5TcVJGQUlGM2t1ZzAyZXMyWG50?=
 =?utf-8?B?UmpuRXh5b0hVK1JuRUFEN3MxYU1wNDM3UnhzS1NTMHMzYjNSQ2tkZ3hKQUFJ?=
 =?utf-8?B?QnNHUlFzaWplUDlJZitDd1pzbVh6OGw5RjVFR2JQRy9odWxZRVBBcUNGeXow?=
 =?utf-8?B?RWJKSWwvL3doeFpoZmk0T0g4SHFYSG9DTms4SkNEVHhZbkVQOW9tZWlqZzU3?=
 =?utf-8?B?TWVTSmIxbFZZRkVhbTdwNlY1NFQzSm9talo5WE9OWjlUTXBHUlV5L1V1WE5X?=
 =?utf-8?B?eFBBWitiTjZoUWYxQlhVcDYvOXF1QittVXBBMGxQWFAvNllXZXQxT3d4V2Vn?=
 =?utf-8?B?RU5HdEw2LzVlelJKNW9KOVNxSWZwNGJiQk1UUTZhd0lhSHlaYU8yTjQxT1Jy?=
 =?utf-8?B?UExQN093ODd3SFUzeHNhYWRSQUFYOVEyNWlvek9jMGlDdGtvVmxqLy8yeGFX?=
 =?utf-8?B?QnpQYVgvSG94VGhoc0I5b2k4ZGV1L2ozaDcvakQzeEF5RWRlSyt3ZHgrd2lH?=
 =?utf-8?B?UTVoQzNCRlFYMkxLZGpSRFlHSThLOUl5R0dDeHY1ZlNhWFFZbXJDc1RnZG5q?=
 =?utf-8?B?RHhmTkpsN3c1WHRjSEtpRy9VeEoxVGhmSmVGOC9OQkprR0Q1a01WZ1BDUDIy?=
 =?utf-8?B?SjhGRzM2NG94SngwaWRUMHhsSitiUW1VY3l0NmlyU2pvTHptSEtKWmJnZFBQ?=
 =?utf-8?B?Tmp0NEk0R0J0eGszKzZkR3V3ckYwTmFqaXFPWEpIUVgxUExtVHhta2NNeVIx?=
 =?utf-8?B?bXMwT3Q3WmwxQXJac2JQaDJQY0hMeXY0c25PL1NrMVVpeHhMMEYvVjRFQnNv?=
 =?utf-8?B?WVRVVmJTQVpnMXkvMTlUOHBQbzBsTmtXUWhKNm0zVG1oenlnOTBVcFRxamFP?=
 =?utf-8?Q?vilIU0nFZ70ECJWynJ2tWNy66?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04bbc8f-e07b-4237-cd14-08db34133c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 07:15:42.7028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0vzpurzqAv8hNZwHZ0DgXMPPL8fNw1HlgsFbowQKPHzXY7sJ5YlMWcQYl4mJK8mVzksOeKVACfpyg29d4WAlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBEbWl0cnkgQmFyeXNo
a292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+ID4gU2VudDogVHVlc2RheSwgTWFy
Y2ggMjgsIDIwMjMgNjo1OCBQTQ0KPiA+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBh
bEBpbnRlbC5jb20+DQo+ID4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRl
bC5jb20+Ow0KPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gTmF1dGl5YWwsIEFua2l0IEsgPGFua2l0LmsubmF1
dGl5YWxAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hDQo+ID4gPHVtYS5zaGFua2FyQGludGVsLmNv
bT47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+ID4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvN10gRW5hYmxlIFlDYkNyNDIwIGZvcm1h
dCBmb3IgVkRTQw0KPiA+DQo+ID4gT24gVHVlLCAyOCBNYXIgMjAyMyBhdCAxNjoyMCwgS2FuZHBh
bCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uDQo+ID4gPiA+IEJlaGFsZiBPZiBKYW5p
IE5pa3VsYQ0KPiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDgsIDIwMjMgNTowMCBQTQ0K
PiA+ID4gPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPjsgZHJp
LQ0KPiA+ID4gPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gQ2M6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5
c2hrb3ZAbGluYXJvLm9yZz47IE5hdXRpeWFsLA0KPiA+ID4gPiBBbmtpdCBLIDxhbmtpdC5rLm5h
dXRpeWFsQGludGVsLmNvbT47IFNoYW5rYXIsIFVtYQ0KPiA+ID4gPiA8dW1hLnNoYW5rYXJAaW50
ZWwuY29tPjsgS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiA+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIDAvN10gRW5hYmxlIFlDYkNyNDIwIGZvcm1hdCBmb3IgVkRT
Qw0KPiA+ID4gPg0KPiA+ID4gPiBPbiBXZWQsIDIyIEZlYiAyMDIzLCBTdXJhaiBLYW5kcGFsIDxz
dXJhai5rYW5kcGFsQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gVGhpcyBwYXRjaCBzZXJp
ZXMgYWltcyB0byBlbmFibGUgdGhlIFlDYkNyNDIwIGZvcm1hdCBmb3IgRFNDLg0KPiA+ID4gPiA+
IENoYW5nZXMgYXJlIG1vc3RseSBjb21wdXRlIHBhcmFtcyByZWxhdGVkIGZvciBoZG1pLGRwIGFu
ZCBkc2kNCj4gPiA+ID4gPiBhbG9uZyB3aXRoIHRoZSBhZGRpdGlvbiBvZiBuZXcgcmNfdGFibGVz
IGZvciBuYXRpdmVfNDIwIGFuZA0KPiA+ID4gPiA+IGNvcnJlc3BvbmRpbmcgY2hhbmdlcyB0byBt
YWNyb3MgdXNlZCB0byBmZXRjaCB0aGVtLg0KPiA+ID4gPiA+IFRoZXJlIGhhdmUgYmVlbiBkaXNj
dXNzaW9ucyBwcmlvciB0byB0aGlzIHNlcmllcyBpbiB3aGljaCBzb21lDQo+ID4gPiA+ID4gcGF0
Y2hlcyBoYXZlIGdvdHRlbiByYiBhbmQgY2FuIGJlIGZvdW5kIGluIHRoZSBiZWxvdyBsaW5rDQo+
ID4gPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTM3MjkN
Cj4gPiA+ID4NCj4gPiA+ID4gSSB0aGluayBpdCB3b3VsZCBiZSB1c2VmdWwgdG8gZ2V0IFsxXSBm
cm9tIERtaXRyeSBtZXJnZWQgdG8NCj4gPiA+ID4gZHJtLW1pc2MtbmV4dCBmaXJzdCwgaGF2ZSB0
aGF0IGluIGRybS1uZXh0LCBhbmQgYWdhaW4gYmFja21lcmdlZA0KPiA+ID4gPiB0byBkcm0taW50
ZWwtbmV4dCBiZWZvcmUgdGhpcy4gQXQgbGVhc3QgcGF0Y2hlcyAxLTUuDQo+ID4gPiA+DQo+ID4g
PiA+IFRoZXJlJ3Mgbm90IG11Y2ggcG9pbnQgaW4gYWxsIGRyaXZlcnMgZHVwbGljYXRpbmcgdGhl
IHBhcmFtZXRlcnMsDQo+ID4gPiA+IGFuZCB3ZSBuZWVkIHRvIG1vdmUgdG93YXJkcyBjb21tb24g
Y29kZS4gRG1pdHJ5IGhhcyBiZWVuIGhlbHBmdWwNCj4gPiA+ID4gaW4gY29udHJpYnV0aW5nIHRo
aXMgdG8gdXMuDQo+ID4gPiA+DQo+ID4gPiA+IEJSLA0KPiA+ID4gPiBKYW5pLg0KPiA+ID4gPg0K
PiA+ID4gPg0KPiA+ID4NCj4gPiA+IEhpIEphbmksDQo+ID4gPiBNYWFydGVuIGhhcyBhY2tlZCB0
aGUgcGF0Y2ggc2VyaWVzIHRvIGJlIG1lcmdlZCB0aHJvdWdoIGRybS1pbnRlbA0KPiA+ID4gYW5k
IGluIHRoZSBtZWFudGltZSBJIHdpbGwgd29yayB3aXRoIERtaXRyeSB0byBwdWxsIHRoZSBjb21t
b24gY29kZQ0KPiA+ID4gdG8gYXZvaWQgZHVwbGljYXRpb24NCj4gPg0KPiA+IFRoYW5rIHlvdSEg
SWYgbmVjZXNzYXJ5IGZlZWwgZnJlZSB0byBwaW5nIG1lIG9uIElSQyAoJ2x1bWFnJykuDQo+IA0K
PiBUaGFua3MgZ3V5cywgd2lsbCBoZWxwIG1lcmdlIHRoZSBjaGFuZ2UuDQoNClB1c2hlZCB0aGUg
Y2hhbmdlcyB0byBkcm0taW50ZWwtbmV4dC4gVGhhbmtzIGZvciB0aGUgcGF0Y2hlcyBhbmQgcmV2
aWV3cy4NCg0KUmVnYXJkcywNClVtYSBTaGFua2FyDQo+IA0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMs
DQo+ID4gPiBTdXJhaiBLYW5kcGFsDQo+ID4gPg0KPiA+ID4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTQ0NzMvDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBBbmtpdCBOYXV0aXlhbCAoMik6DQo+ID4gPiA+ID4gICBkcm0vZHBfaGVscGVyOiBB
ZGQgaGVscGVyIHRvIGNoZWNrIERTQyBzdXBwb3J0IHdpdGggZ2l2ZW4gby9wIGZvcm1hdA0KPiA+
ID4gPiA+ICAgZHJtL2k5MTUvZHA6IENoZWNrIGlmIERTQyBzdXBwb3J0cyB0aGUgZ2l2ZW4gb3V0
cHV0X2Zvcm1hdA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU3VyYWogS2FuZHBhbCAoNCk6DQo+ID4g
PiA+ID4gICBkcm0vaTkxNTogQWRkaW5nIHRoZSBuZXcgcmVnaXN0ZXJzIGZvciBEU0MNCj4gPiA+
ID4gPiAgIGRybS9pOTE1OiBFbmFibGUgWUNiQ3I0MjAgZm9yIFZEU0MNCj4gPiA+ID4gPiAgIGRy
bS9pOTE1L2Rpc3BsYXk6IEZpbGwgaW4gbmF0aXZlXzQyMCBmaWVsZA0KPiA+ID4gPiA+ICAgZHJt
L2k5MTUvdmRzYzogQ2hlY2sgc2xpY2UgZGVzaWduIHJlcXVpcmVtZW50DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBTd2F0aSBTaGFybWEgKDEpOg0KPiA+ID4gPiA+ICAgZHJtL2k5MTUvZHNjOiBBZGQg
ZGVidWdmcyBlbnRyeSB0byB2YWxpZGF0ZSBEU0Mgb3V0cHV0IGZvcm1hdHMNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ljbF9kc2kuYyAgICAgICAg
fCAgIDIgLQ0KPiA+ID4gPiA+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jcnRjX3N0YXRl
X2R1bXAuYyAgfCAgIDQgKy0NCj4gPiA+ID4gPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Y3J0Y19zdGF0ZV9kdW1wLmggIHwgICAyICsNCj4gPiA+ID4gPiAgLi4uL2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMgIHwgIDc4ICsrKysrKysrDQo+ID4gPiA+ID4gIC4u
Li9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgMSArDQo+ID4g
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICB8ICAz
OSArKystDQo+ID4gPiA+ID4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9xcF90YWJs
ZXMuYyAgICB8IDE4NyArKysrKysrKysrKysrKysrLS0NCj4gPiA+ID4gPiAgLi4uL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3FwX3RhYmxlcy5oICAgIHwgICA0ICstDQo+ID4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmRzYy5jICAgICB8IDEwOCArKysrKysr
KystDQo+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAg
ICAgICB8ICAyOCArKysNCj4gPiA+ID4gPiAgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVs
cGVyLmggICAgICAgICAgIHwgIDEzICsrDQo+ID4gPiA+ID4gIDExIGZpbGVzIGNoYW5nZWQsIDQ0
MiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gLS0NCj4g
PiA+ID4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcg0KPiA+
DQo+ID4NCj4gPg0KPiA+IC0tDQo+ID4gV2l0aCBiZXN0IHdpc2hlcw0KPiA+IERtaXRyeQ0K
