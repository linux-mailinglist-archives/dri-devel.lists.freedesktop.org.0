Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351C7BBC04
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA7A10E52F;
	Fri,  6 Oct 2023 15:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C15310E52F;
 Fri,  6 Oct 2023 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696607101; x=1728143101;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FcfBrVSLtx6Pc+Or6jcUoCkR5J7XxmbDG+CQO/qoCvM=;
 b=WVRkmsYobpcpS65UbVWUlKK+P5wECteIbWqb3KnhTDo5ORd9GBFFOOIW
 u1Ea47cpWr3ORfg4j2c2B6UHR5FqOxs2l0yc7vvp9iUjpKe5t3xvM4gw+
 iqxioV/BA461dS5s3wOmZEtHZ4+uf3Fbh9vr3VkQ4266GqgG5G6aOQSzT
 Swyv2u8UvrKmT4OcqyaQsmijLeAMBtZwQvrLIZBTflKVRNCgZ3Byl2coB
 4/Y2Vk/6Q70PdyL92jm9OVo7F3iZETC59lSgKk5Sj3c6zJK94GQx41pIT
 vgfGvkALZRc0YMHZT6bRZLuo6Tmc4hdrsMJJgNhXRK8evrdvlzIz5/HvU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450263828"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450263828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 08:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="752229973"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="752229973"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 08:45:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 08:45:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 08:45:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 08:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwkLsizHvHyNoYBsCh/UtCuFSadBRF5JmkOv87lnhM0GcqazJ7vdTDdn5HJk6rucefXOsaXaGVUmioFsHJgySDeI/fy0b2Tk4zhq5h2OoP7rezCqfYFR/lnueS1wjJ6JkXII7nlxOAFXSn5vk4VQ0ODVCswn17GZQ3dbKcdZuEoYYFY773LBFHwS7NgXbp3J4fjmmROyAFVeBuzuLM/jOcoHvJSjixELJk0PyCUjOwHu1X30vErwCBYxk/144hfJxFHpGJ6Qrki91dLjx9wDx7mBAW6jONW1jx0382zdpAERxZs/rowydSxkAxya25u0JC1JajzFqoF0clmKOSSH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcfBrVSLtx6Pc+Or6jcUoCkR5J7XxmbDG+CQO/qoCvM=;
 b=ZfMGLubKbTleVXhRkdRwcDzzkUyOH3PEBCbR6AbRQrqxvoeliI5gY5J305OHt5YCFXD1HDyQdIYM/1Dz3xzBkjD1Vg6qt+n1wi0XfFQNwr6DWJH36TEdQRgWTPwmzCDOh1kZEpVPw7rnE3BjY0ErwTKWErFTeJ3lDxS/m5s5Fh3H0/IPSfkr2Ha8YFrE9sAsSfTtyF8hMcwemg2g+ZIIatiMvkiEC8vspzSGQXXjb14Hp+goa0QmAKZhyQwR8ATzd+SHYatT2fIR1g/0+QuCUeC/kcKMXlBowDRXR1o88pfy4T6P4jPZk35dsI/Yqf+5R9LlkRIz770h2wIslA+q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 15:44:57 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f665:b942:9842:c322]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f665:b942:9842:c322%7]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 15:44:57 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/i915: Remove early/pre-production Haswell code
Thread-Topic: [PATCH 1/3] drm/i915: Remove early/pre-production Haswell code
Thread-Index: AQHZ+C+EKOD3xrjKRkWotSZZq2kE3LA8570A
Date: Fri, 6 Oct 2023 15:44:57 +0000
Message-ID: <e792b13e3a1d45df7007d8524d906af675f09916.camel@intel.com>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|CY5PR11MB6318:EE_
x-ms-office365-filtering-correlation-id: a72b5c2f-6810-41bd-29fd-08dbc6833190
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cgiQzAh/FMj5Qp+ngjCn0W1NLXblXr9qO5k84Z7pkT+h3xPBXJI3r9tpH48wrOoeX3UoSJuq692MNAf+OfHSWQsUUkM80o3EYXKZu6/iBV8Gj3+LAoOI235IJxNGlJS9o6/NJ3CYakCFzuo+moxMVkBYLDb0lJLGOyDiXB6S1tylc7wQguAfXqDWGksJkDPkFxlrjri8Rw+Dui4VZul6E4s2/XZq8nbfKXIktzEVLLQKd/4H0/+R2sMCNtmwk/AyHN2JyxOiWeLZzZnS+Kf3NE/0tyCMBRg52PzXajqamWxkSBwSxR6/AOdZ2aGFEEes+ONC+R1Us0dR3gvMSD1xsdeH0AHzNQNhRBLOeqZgNMRGp//xYA1jbgw3bBu97G4U3d5mD4ywE8i0xCamG/PBIuIjtxxx6+u+M1iYxCb2Qm3s4PGPKhkTCLQkx8J6kt3q9m2rwarPTR+biYf6uo5UR4TDxq9iJdRMbH0ctj2EWgs/sAKtsPHFProqbdwRcuj46OnqXGK+SP4A7smSncms4rUqovgy4Qg8Y/JFYZBHHcOgnEs98GmiRzm/Om4txXXZHpfoNugwRk+VtoT2wNL+vkxbmk2BkYvFxY57SNyiMA4S48fLa3LrEOV5N8UJmvDv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(110136005)(6486002)(2616005)(66946007)(6506007)(6512007)(66446008)(41300700001)(64756008)(66556008)(76116006)(54906003)(66476007)(8676002)(4326008)(8936002)(5660300002)(478600001)(71200400001)(316002)(83380400001)(2906002)(36756003)(82960400001)(38070700005)(86362001)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk85MVZLZW93bGtQYUV4MGNYUktHc1grRytCTTR3bWpSZS82cytJejF0RVB0?=
 =?utf-8?B?SzMvUDdsc294Z2syamhxQUJ6dkZ6elhQYjViTVFUL0FCdEQ1MmhjeTArWFEv?=
 =?utf-8?B?bUU1NytRam9Ma3ExWWRMbzRZU3lQU3FQOUE1Q2gwZkxkNXU4VzVLc0lEcmUy?=
 =?utf-8?B?QnBUOWRoUXlEWVFrTWhTWDlFWlA5T2JHaVFFL1JSRy9hZW83VStna2VkSlM5?=
 =?utf-8?B?YkxFQ0JOMXNvWnlhWUlHS21WNmhVSmpUOVlzRlArcSt4NitIRnNLV3lXYldh?=
 =?utf-8?B?RkRiREk2THFDeXBwMVBiVGVhSjNlZUdlMVVKTW9Mbm4zUzNaTUpsdVdEQmd1?=
 =?utf-8?B?VHdUay9vTU1xaUtlblpCRzJtWWlIQ3phYXJ4SXJiUmwrM0JRMkFvcTM2V1VD?=
 =?utf-8?B?d3o4NVRta3k4OEZDS1phQ2orcXBQS2lVWlc3WTV1MG5GSzRyYVhuSUhSU1Yz?=
 =?utf-8?B?c3dKOGtiYVdDQ2g5c21vVnFLZ1NBbi93ZmU3bEtvZ2ZiNzNQSmxGTnJqSXIx?=
 =?utf-8?B?RkVDVEg3cFlSRzQ3R0l6bytxcVY5eVJ5azRlL01FS2srWXhwSHp1ZWpaUVp4?=
 =?utf-8?B?TW1aOVFUMDV6MXA4K1lJTDRHejBrbkVNcURkZWdKcFdsQSs3L3Eyb2NHR1Fl?=
 =?utf-8?B?Qyt1YlJra28wSWxkZWtwYmdrbVYyWVhTcXFLTGY5UWc2Y2VTTjg5Rk1RRVI5?=
 =?utf-8?B?U2xRRUhvcEdlWUtHQ2x6NEprWlRxNWt5czYyUFB1L3BsYXdmQm9DajdZUFl5?=
 =?utf-8?B?c09ESTRFVk0xUVdvRFdCNk1aUTIzTGNFbC8zQnRtVHNPSnhEN291S2VoMVI0?=
 =?utf-8?B?cDlZc2tLZGRSbG9YclpEQW51VHBwb0RoMWx0UkJkZit0bmFWWWU1bTAxMUhj?=
 =?utf-8?B?NXdkUStSVm5kc0FtWmx5NDRleWt0RFh0WlVTMEhnV2RZY01QUGNOckk5cWVi?=
 =?utf-8?B?RGpQSmJPb1FaMHRZWU9Ha2ovRkt6SHFiZ1VxaTZ2UWh1UTZFUkVheFBIMWtT?=
 =?utf-8?B?a1I1VWpOUnc5SHY0bEZhRkZpRGJGMzk3WWowSHBTQmZvZnJoek1HWXZ2QjBy?=
 =?utf-8?B?Qmd5ZG9vNlc2WnlVaytCM0VoczlDNG02N2E1TThOL2tSUnNYSy9aNERPelRC?=
 =?utf-8?B?dzNGWE54cVJzZzhsME1yQzVWZlliVUl2U01Db0hVcjh3cytoaGhURmEzZ0Np?=
 =?utf-8?B?aHVvdVpDQ1hBTndFZ2plN0xFV1FTWGo3SWpNUDlKWkN2K05rSVlnc09JSHNt?=
 =?utf-8?B?N1RudStWSzlMS0JOTUoxNSs0TTJHcnljMXY0SGVXMU9ERnFPM1lQYkxTS2VR?=
 =?utf-8?B?WlpuNEJUY3hEK2RMWG5STVBRUCtBVm5ScGZTV25ycUVIZ09MeEJVRWF5cFRZ?=
 =?utf-8?B?OGNNbTJ1M3FIK1FKQ2NiT3phS3JNalBQWnhsV1pwZENrOEQ2RHRYV3VuMHo0?=
 =?utf-8?B?ODc5WFFReHA4OEJva0ZUWW9pa3dVUHltZ29LNnVxdkpBSk1xZ3NDdWFBc1Ur?=
 =?utf-8?B?Smx0eFZCMmd2ZkxDWmdSblVDTXJoT2pNR0xxYXhsRGtsUU5neGw4Vzg1M0Ux?=
 =?utf-8?B?T2xHNW52aUVBYkJHZDNTTGt1TVBGSXZ6WGJnL3l5V21MVGVpMU1oZEY2cE14?=
 =?utf-8?B?TC9kR3A2OWlhbElUaE1VV2k3d09NNS8yYnl2cGpmQmZ0UHVvcjAvMHkzdU9s?=
 =?utf-8?B?ZEVacHNpNlozWXBhc2ZWU3RaS3EvL2FpOGlUR0hiVDlyb2NqN1hPaUh1Y0Zq?=
 =?utf-8?B?ZU9WUmpyRzc5eWg1OUV5anlIM1NjN29VRGtaV0Eybk56TWhpSExMVUNXK2Yy?=
 =?utf-8?B?RFZuWmFSRmsxcVBoL1lCKzJZc0o1dXNaVTRVVERnTzN3cGZ1V1A4cXkvMkxE?=
 =?utf-8?B?VU5FODNNQVgzZm9ia1VnL0l3ZTd3WjZrR09sOHV2NGRsOEt4T2hXVlI0TURP?=
 =?utf-8?B?WjRNMmR5cGVqWSs1Z04rSGxRWDE1WTRlVHR4dEs3MjdtczVZYlN3OWh0VTc3?=
 =?utf-8?B?Q0tzUndmOHd1Nlp5Zk1td0hpbjVjTFFuckN6WCtkSWFCTi8rM2lFb0lqa25C?=
 =?utf-8?B?UGFBSEFndUVjWGdudTc0T2lUS01DZnpSK0Y5SDM0SGFYaE96WG5lWnVpY1FS?=
 =?utf-8?B?TGwyUGZwSHA2aUExVlRLelZPeER4R1d5TnhHSFVVZ2RBR0NBRXhBVmtEYTly?=
 =?utf-8?B?TU9IY0NpeDYzOXYyMmEyWGU1WVdESFZ4MEE0MUpXUit1aUNMUFZZcDF1TlpZ?=
 =?utf-8?B?MmM4WFFEc2NKYUtVekl2NDdBbUtRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A6C840C5F726C449485705D52AE1AEA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72b5c2f-6810-41bd-29fd-08dbc6833190
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 15:44:57.7303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gGYmhR+fSxAnDEHqCPryPTmQIiEy5ldZKDUTRIC1u/Fmw3QQkhGP1KZE8gL5NHO7t1gg0ByPK+rnjO0+PIzCZwG9TLGecs++2uxpPEXwIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTEwLTA2IGF0IDA5OjMxICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gDQo+
IEl0IGlzIG5vdCBvdXIgcG9saWN5IHRvIGtlZXAgcHJlLXByb2R1Y3Rpb24gaGFyZHdhcmUgc3Vw
cG9ydCBmb3IgdGhpcyBsb25nDQo+IHNvIEkgZ3Vlc3MgdGhpcyBvbmUgd2FzIGp1c3QgZm9yZ290
dGVuLg0KDQpXb3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGFsc28gcmVtb3ZlIHRoZSBQQ0kgSURz
IGlmIHRoZXkgbmV2ZXIgbWFkZSBpdA0KdG8gdGhlIHJlYWwgcHJvZHVjdGlvbiB3b3JsZCo/IENv
dWxkbid0IHRoZXNlIElEcyBlbmQgdXAgZ2V0dGluZyByZXVzZWQNCmZvciBzb21ldGhpbmcgZWxz
ZSAobWF5YmUgbm90IGV2ZW4gZ3JhcGhpY3MpIGF0IHNvbWUgcG9pbnQgaW4gdGhlDQpmdXR1cmU/
DQoNCio6IEkgY2FuJ3QgY29uZmlybSB0aGlzIGlzIHRoZSBjYXNlLg0KDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMgfCAxIC0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgfCAyIC0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9kcml2ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMNCj4gaW5kZXgg
Y2NiYjI4MzRjZGUwLi43OGE0MmM4YTg1MDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZHJpdmVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
cml2ZXIuYw0KPiBAQCAtMTc1LDcgKzE3NSw2IEBAIHN0YXRpYyB2b2lkIGludGVsX2RldGVjdF9w
cmVwcm9kdWN0aW9uX2h3KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikNCj4gIHsN
Cj4gIAlib29sIHByZSA9IGZhbHNlOw0KPiAgDQo+IC0JcHJlIHw9IElTX0hBU1dFTExfRUFSTFlf
U0RWKGRldl9wcml2KTsNCj4gIAlwcmUgfD0gSVNfU0tZTEFLRShkZXZfcHJpdikgJiYgSU5URUxf
UkVWSUQoZGV2X3ByaXYpIDwgMHg2Ow0KPiAgCXByZSB8PSBJU19CUk9YVE9OKGRldl9wcml2KSAm
JiBJTlRFTF9SRVZJRChkZXZfcHJpdikgPCAweEE7DQo+ICAJcHJlIHw9IElTX0tBQllMQUtFKGRl
dl9wcml2KSAmJiBJTlRFTF9SRVZJRChkZXZfcHJpdikgPCAweDE7DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9kcnYuaA0KPiBpbmRleCBjYjYwZmM5Y2Y4NzMuLjlkNDkzZmYxNjg1YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2Rydi5oDQo+IEBAIC01OTAsOCArNTkwLDYgQEAgSVNfU1VCUExBVEZPUk0o
Y29uc3Qgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsDQo+ICAJSVNfU1VCUExBVEZPUk0o
aTkxNSwgSU5URUxfQUxERVJMQUtFX1AsIElOVEVMX1NVQlBMQVRGT1JNX1JQTCkNCj4gICNkZWZp
bmUgSVNfUkFQVE9STEFLRV9VKGk5MTUpIFwNCj4gIAlJU19TVUJQTEFURk9STShpOTE1LCBJTlRF
TF9BTERFUkxBS0VfUCwgSU5URUxfU1VCUExBVEZPUk1fUlBMVSkNCj4gLSNkZWZpbmUgSVNfSEFT
V0VMTF9FQVJMWV9TRFYoaTkxNSkgKElTX0hBU1dFTEwoaTkxNSkgJiYgXA0KPiAtCQkJCSAgICAo
SU5URUxfREVWSUQoaTkxNSkgJiAweEZGMDApID09IDB4MEMwMCkNCj4gICNkZWZpbmUgSVNfQlJP
QURXRUxMX1VMVChpOTE1KSBcDQo+ICAJSVNfU1VCUExBVEZPUk0oaTkxNSwgSU5URUxfQlJPQURX
RUxMLCBJTlRFTF9TVUJQTEFURk9STV9VTFQpDQo+ICAjZGVmaW5lIElTX0JST0FEV0VMTF9VTFgo
aTkxNSkgXA0KDQo=
