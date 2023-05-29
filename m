Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0471439F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 07:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C89010E20C;
	Mon, 29 May 2023 05:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6591410E205;
 Mon, 29 May 2023 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685337210; x=1716873210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/75P8vCuuLW0Y5O9ZPDaUSmlOy211r6LlJd3L1tUuoA=;
 b=m5kpGVPxKEy3SG2K/5gjkyQkDXHvoX5wAbeU2/rOK9emI5lEZE409y94
 6ypIOJwe2liKcWkBUL7BVMzzJAXqd9tDVg894F8dKe1u3Ksw+swdyT7bs
 KGRv+ESsDLHqwGNrg8ulB7tS4Wc7JeH7ps8BkoINNvyM3DTOTi9VYkd+7
 BuA0hzLCU0QNrUYq12ZLFUmlYRnLGFkP/Co+F/+RYTVZkWaRFJ6OgB8Cl
 6PecW5yx3uWHI7hUed/pk9pbPi0B/iP/iGqy5G5KqrCSK6jIkyfo1wsI+
 VKHgYVIZ/L3iEMEdtF+QmW8wt9udK6uQ+rF6AYcppqFlUCozaFdsMXuBO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354633465"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="354633465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 22:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="880237713"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="880237713"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2023 22:13:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 28 May 2023 22:13:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 28 May 2023 22:13:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 28 May 2023 22:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLyJhIyxEgY52gYr/CUgQ54WGgHIFc2aAU2C6EQHoQ1E0EbUKthdj8DB11tkdkv2c6kf3cyVUzIuyaUcBpujFUnGUGXWLj3yBGwD2F52+9jRpMZXeAdlWKxPmtFrEFL3Y0Tg9gme3g3H6EjYgCh0MpGeJ8vxJ/Et0A3niDUJe8DIQdi5g61/OaNBQf5C0Eo7aZs2uXYWJc2sXEIlEgagkFW7iAuAVlJVVbrZIjhcHiAlwQprIXP8xvbVAQx6g5CBx3277qXF3hl5uo57fMcss7PRN7Jww2MD4bFqyZkg5wc1wLk/Q9NvCDnU6MrecXO0s5qLASOVQ9uKS/AN24b5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/75P8vCuuLW0Y5O9ZPDaUSmlOy211r6LlJd3L1tUuoA=;
 b=PZ0lRLFKoFzkaMmW8opGrQlHTFsVKNhP5K8CO5ljx1g9fdq4FhqLngGRZ7BRasgOR1hQwPa2QnsHGTxLE4naui1sTWHvnHYCI4QHWpKFjP41BlkOxvMOHvDgvwjYAAs8zdTp3AisGlcI/EAfYtb06r1eIUM1eGzvFxXKKebxpVyntNa8H2HerbvBID6kuBITT501QSraqjxaYFI/jzIXjyogxOy1G1SdYz0OuVanVcee9q3esDVBJGy8XvarDN03Y+B0Y7WiFbmwDUTlLH7V7cY6uSF6Yx7M5FMzgK/PBzQGKjOLwz5htObe7depqxTK9TbGFaG4PiICfxMwgU96QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Mon, 29 May 2023 05:13:26 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%5]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 05:13:26 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign handling
Thread-Topic: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign
 handling
Thread-Index: AQHZbigA/XBPFxmulEafTrD8A9+bvq9ruOnQgAEcN4CABCbQoA==
Date: Mon, 29 May 2023 05:13:26 +0000
Message-ID: <DM4PR11MB636064D3FA51130C48C9D8A8F44A9@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-4-ville.syrjala@linux.intel.com>
 <DM4PR11MB636031F61EE8864E316FB1C3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
 <ZHC4nyUkQpCxTxHj@intel.com>
In-Reply-To: <ZHC4nyUkQpCxTxHj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6233:EE_
x-ms-office365-filtering-correlation-id: ba6cb577-2130-4e54-f68e-08db60036ec5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8UUxktjD4LJ+HAphqH0hdqHE0x1wYRSciNg2TWzDfEmttYeKvtqaQrPCWiwl+Hg94MJqoqVTAMgfyaqDwynxDh2ZR9glhomJCjZPiWqw37wFvYXLBFt2k+uiTcEMfLkUwz6t25slFLcGwfLWKn4KSsDcFXnvptsmJA1Y9UHhjut6Qu2XYOYY0kgE3jCWTBddSqGlV2Gk5XBYkh03Q9/JEsk57An43I2L0J4CVrUIOSCuWNCWfmNYADBhg4I/ZVeb3v8xhAqiAqOFx6TjJ39Q0Icy6dQVnrlIybMcCNuSqwleDBRySSazpuhsKvSzifujs8dHWvqcPtd4KF+naBMccGLLKxPpsIqoncDDm8ya/avPoi2sYvHCpL/c07rAvqWG+5Zbs4TR/5jsSEMElZrIi18WywzVs8SnY9q0pB0S2hNfjusGAGMWZIOeFbUCOBQIzHMfdhdkT+OS9rOM+ioKjXu8hKDl5kdW8akHKJduoPaE5Ai3UkVVImXYZFuIZeY0PLZVsSRhEs3Ep3PfslLfwmuq7jf2obEcqNHqANCGtPtrDALOgUey0QInFmD90RvC+rOZyV5MbFVZG4ILxG9/r4wbG7OJcvFvrrm9D4DKbbW4l84m68FtI/A/ax3gCaD5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(346002)(396003)(366004)(84040400005)(451199021)(83380400001)(66574015)(33656002)(71200400001)(5660300002)(316002)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(52536014)(4326008)(6916009)(82960400001)(122000001)(8676002)(8936002)(41300700001)(38100700002)(7696005)(86362001)(55016003)(54906003)(53546011)(2906002)(6506007)(38070700005)(9686003)(186003)(478600001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjFNNTd0VHV4L3BLUTZNb2dhVTZPaWxMSXpjWlRaY1BWbHcxclB0OGZxaDdi?=
 =?utf-8?B?aC8rcU9BUisvZWd5MlNtL2VMUzQ4a2dRb2J1TU0rRWVwRUh2ancvbklDV0l2?=
 =?utf-8?B?Z1ozV1hmdnE4aEZ2bVpSMDRRVERUZmhsbG5PK08wMkVDWHQwU3JGaUE2Vm9T?=
 =?utf-8?B?OFU3Sm1Ma0lxTlVzbjJoR25tSnNrb2lUOWx2dWUvNjZTcmdtM1M3dnlLQTZZ?=
 =?utf-8?B?TldKbFFXQVZlZTFxV1FlNHlYVGZBZ0xxQTRqUG12WUhORXFlU0NYbmFVR1BG?=
 =?utf-8?B?b2V3K1FHMmh1K2pFTGFGcUhtSFZnUkZXMTlNWkhMTjNZREhSM3dkQ0I4aWFi?=
 =?utf-8?B?UVZFaUUrcWxlVkMrbDJnMGhWWi9JUk9zMCttVnNzRHBGb3FKN20rcW9VVVFZ?=
 =?utf-8?B?REhiNFZ0TkFJSGQySHNrc0NYcG9IU0pPUmJyWkYzU05QSTZ3eEdMT0dSME5R?=
 =?utf-8?B?S0lyenZYYjJ2UUZnaWRjT1QzQ2pxQXRya1BBdUxZODU2SnpDdXowZTU5dk5j?=
 =?utf-8?B?a1RkUEN3NzFkN29BUDU4RE9WYTNVTXF2SFV1OWFHZkUzalBsdFVXQ1ZvS2VK?=
 =?utf-8?B?cllIYUtuRWJwTVlrYzlLZThucmFSWXY2cE9RZlhxd3k1R2VaTWJIODVHczho?=
 =?utf-8?B?Q1FQYmkva2JuMWs2Y01POEE4VWZmNjNhekREc3BGR2NKZW9xY2czNC91Mzk1?=
 =?utf-8?B?dmRNcWVZRllSMExhRjZrV3ZuUFVZQjJmZGpGakZSRkZkaWVMbE1LZ2VFdnhP?=
 =?utf-8?B?YkwwUlN2dHZVb3B5VE9vRU82Vis4TWdPdUxQcEpGYy90NWVVcVBvZVVmb0hn?=
 =?utf-8?B?OEN2aWxJdXVHVnpHeEFuK0RrOFFObkJQS0lDRUZubk1GRTgvanJ3bDA4Tmg5?=
 =?utf-8?B?VzdHQTdrVndhTEhReFF2Y1ArTEtXakVGT3JGd2t4TXJhd0xteHZFaGxVc3Bp?=
 =?utf-8?B?cmhUWEpDYlVFelp3S1FsQlE0dHg0ZGRVREYzZFgrNnlaS2w0cU5CNXBHNUdl?=
 =?utf-8?B?T2NuL1pxaGVBOGkrVktWUlphRkptMmIxLytLMDhSSTRkZ3ZkSUlXYnlKMHZZ?=
 =?utf-8?B?Rktxb0NLMjB0VzFNUDVwY215Vmx0MGxwSW5CbWZyNXlvUUxEbVpWeUxlakxZ?=
 =?utf-8?B?K3l0UHRjaWczWHpOb1JnMVFhNHV5ZjRwTmtidFh2YzhOc041VTl3d3BROGty?=
 =?utf-8?B?cWJmM1QrN1dNSnlPMG1HTCtTWC9OTUZPS1g5cUkyM1RaRWZwUU8vUUwxeVhv?=
 =?utf-8?B?dE82cTRsT2ZMT0laS2RxWVIzcS9PWHFXSWFnMVhDU2dOeVYrUElTdkd0Q2pz?=
 =?utf-8?B?QnNIMlBMZmVxaTR5eHdUUXNMcDRvRkpTeHovT1J0blJEcVhnc21jMnRRVUZ5?=
 =?utf-8?B?UWlkZnFwdlQyV1B1eUd2Mi9oU29nMXpYeDlMWTgxM0NlVlNDYVVoUG5iZG1s?=
 =?utf-8?B?d3UwS3ZySWRQSzBodUVZRFRtbW9Pd2prelFDZUEyRmhLTk5xbVAyNjc2ZmU1?=
 =?utf-8?B?K2d1KzlYbHV1VFVrY0U1VW9hTTVQWkZ5a1UzT3A3RlVmSXBpNlZtV3ZKRGZw?=
 =?utf-8?B?eURqcWhLODNCWmExeGFZYmVLdlYwTVdhOTJzYUdRQTdDcHliRW1TR2M2YnNP?=
 =?utf-8?B?R3IvZmtETVdkSEM0UmU0TXVIS3BVMkNRZXZhSTl5cjJmRlozK28zazZEemFF?=
 =?utf-8?B?UEY5bEx3RU9nNVlZV2hKQXpDZ1AzdEo1K2dYL2UwalRwbVhFaTRhOUxqdVlz?=
 =?utf-8?B?eUl6cUZzQmU1ekdkdWpUNnBPL1VvN2pVREYwU0kyU09HZzA5UVpBN3ZxMXJk?=
 =?utf-8?B?czRwWFZHZXQvSFBkMXV3cjdVOXVha1RGT1hjMFZvcEhaY0Q2eVI3Nk5hSElm?=
 =?utf-8?B?WDVieGVxQkx5UDZrc2FWYU9zSlp4TVg4TmN6azRVS2xCcldqaVhJMHRIMWZE?=
 =?utf-8?B?N0MyR3dSSUVMeGdWb1l1SkIzb3N5cE1ycEllc1ljNmNhQ2gvRVpHMFBVQTcv?=
 =?utf-8?B?YkJEY3J6NFJ4VHpzeEZuekg3Vm1SV1VlSC9kdmRPeC9wT0RIZFJZZFpCeGNm?=
 =?utf-8?B?bzdWL2F5L0Z6djJlb0cwZmF4aWVKVXU1ZW9uYVF6MTJ4ZWJzV0FaL01Ed0Fa?=
 =?utf-8?Q?1Kcz/moBGy3gohhOKic/VgEtF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6cb577-2130-4e54-f68e-08db60036ec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 05:13:26.2265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bn74SmLQ8DXmmhxdQGxux5FO+rb/expPMFJPqf4RaROcqCUjwd2yevWa6AIcjIjAxrEyk6OLVTTwttdlb+hJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjYs
IDIwMjMgNzoxOCBQTQ0KPiBUbzogU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+
DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy83XSBkcm0vaTkxNTog
Rml4IENIViBDR00gQ1NDIGNvZWZmaWNpZW50IHNpZ24gaGFuZGxpbmcNCj4gDQo+IE9uIFRodSwg
TWF5IDI1LCAyMDIzIGF0IDA4OjU1OjA4UE0gKzAwMDAsIFNoYW5rYXIsIFVtYSB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogZHJp
LWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
Zg0KPiA+ID4gT2YgVmlsbGUgU3lyamFsYQ0KPiA+ID4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEz
LCAyMDIzIDEwOjE5IFBNDQo+ID4gPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IFN1Ympl
Y3Q6IFtQQVRDSCB2MiAzLzddIGRybS9pOTE1OiBGaXggQ0hWIENHTSBDU0MgY29lZmZpY2llbnQg
c2lnbg0KPiA+ID4gaGFuZGxpbmcNCj4gPiA+DQo+ID4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+ID4NCj4gPiA+IFRoZSBDSFYgQ0dN
IENTQyBjb2VmZmljaWVudHMgYXJlIGluIHM0LjEyIHR3bydzIGNvbXBsZW1lbnQgZm9ybWF0Lg0K
PiA+ID4gRml4IHRoZSBDVE0tDQo+ID4gPiA+Q0dNIGNvbnZlcnNpb24gdG8gaGFuZGxlIHRoYXQg
Y29ycmVjdGx5IGluc3RlYWQgb2YgcHJldGVuZGluZyB0aGF0DQo+ID4gPiA+dGhlIGh3DQo+ID4g
PiBjb2VmZmljaWVudHMgYXJlIGFsc28gaW4gc29tZSBzaWduLW1hZ25pdHVkZSBmb3JtYXQuDQo+
ID4NCj4gPiBTcGVjIGlzIHNsaWdodGx5IGNvbmZ1c2luZyB3aGVuIGl0IHNheXM6DQo+ID4gIkNH
TSBDU0MgOiAgSW5wdXQgcGl4ZWxzIHRvIHRoZSBDR00gQ1NDIGFyZSAxNCBiaXRzLiAodS4xNCBm
b3JtYXQpLiBDb2VmZmljaWVudHMgYXJlDQo+IDE2IGJpdHMgKHMzLjEyKS4iDQo+ID4gQWxzbyBo
ZXJlOg0KPiA+ICJQcm9ncmFtbWFibGUgcGFyYW1ldGVycyA6DQo+ID4gYzBbMTUgOjBdLCBjMVsx
NSA6MF0sIGMyWzE1IDowXSwgYzNbMTUgOjBdLCBjNFsxNSA6MF0sIGM1WzE1IDowXSwgYzZbMTUg
OjBdLCBjN1sxNSA6MF0sDQo+IGM4WzE1IDowXSA7IC8vIHNpZ25lZCBtYXRyaXggY29lZmZpY2ll
bnRzICAoczMuMTIpIg0KPiANCj4gWWVhaCwgdGhlIHNwZWMganVzdCB1c2VzIGEgd2VpcmQgbm90
YXRpb24gd2hlcmUgaXQgZG9lc24ndCBjb3VudCB0aGUgbXNiIGluIHRoZSBiaXRzLg0KPiANCj4g
Pg0KPiA+IEJ1dCB0aGUgY29lZmZpY2llbnRzIGFyZSAxNmJpdHMsIGNhbiB5b3UgaGVscCB1bmRl
cnN0YW5kIGhvdyB3ZXJlIHlvdQ0KPiA+IGFibGUgdG8gY3JhY2sgdGhpcyDwn5iKDQo+IA0KPiBU
aGUgMTZiaXQgY29lZmZpY2llbnQgYWxyZWFkeSBtYWRlIG1lIHN1c3BlY3QgdGhleSBzY3Jld2Vk
IHVwIHRoZSBub3RhdGlvbi4NCj4gVGVzdGluZyBzcGVjaWZpYyB2YWx1ZXMgb24gcmVhbCBoYXJk
d2FyZSBjb25maXJtZWQgdGhhdC4NCg0KR290IGl0LCB0aGFua3MgVmlsbGUgZm9yIHRoZSBjbGFy
aWZpY2F0aW9uLg0KIA0KPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jIHwgNDYNCj4gPiA+ICsrKysrKysr
KysrKysrLS0tLS0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gPiA+IGluZGV4IDRmYzE2Y2FjMDUyZC4uNjMxNDFm
NGVkMzcyIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jb2xvci5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2NvbG9yLmMNCj4gPiA+IEBAIC01NjgsMjkgKzU2OCw0MSBAQCBzdGF0aWMgdm9pZCBpY2xf
bG9hZF9jc2NfbWF0cml4KGNvbnN0IHN0cnVjdA0KPiA+ID4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0
Y19zdGF0ZSkNCj4gPiA+ICAJCWljbF91cGRhdGVfb3V0cHV0X2NzYyhjcnRjLCAmY3J0Y19zdGF0
ZS0+b3V0cHV0X2NzYyk7ICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyB1MTYgY3RtX3RvX3R3b3Nf
Y29tcGxlbWVudCh1NjQgY29lZmYsIGludCBpbnRfYml0cywgaW50DQo+ID4gPiArZnJhY19iaXRz
KSB7DQo+ID4gPiArCXM2NCBjID0gQ1RNX0NPRUZGX0FCUyhjb2VmZik7DQo+ID4gPiArDQo+ID4g
PiArCS8qIGxlYXZlIGFuIGV4dHJhIGJpdCBmb3Igcm91bmRpbmcgKi8NCj4gPiA+ICsJYyA+Pj0g
MzIgLSBmcmFjX2JpdHMgLSAxOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiByb3VuZCBhbmQgZHJvcCB0
aGUgZXh0cmEgYml0ICovDQo+ID4gPiArCWMgPSAoYyArIDEpID4+IDE7DQo+ID4gPiArDQo+ID4g
PiArCWlmIChDVE1fQ09FRkZfTkVHQVRJVkUoY29lZmYpKQ0KPiA+ID4gKwkJYyA9IC1jOw0KPiA+
ID4gKw0KPiA+ID4gKwljID0gY2xhbXAoYywgLShzNjQpQklUKGludF9iaXRzICsgZnJhY19iaXRz
IC0gMSksDQo+ID4gPiArCQkgIChzNjQpKEJJVChpbnRfYml0cyArIGZyYWNfYml0cyAtIDEpIC0g
MSkpOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gYyAmIChCSVQoaW50X2JpdHMgKyBmcmFjX2Jp
dHMpIC0gMSk7IH0NCj4gPiA+ICsNCj4gPiA+ICsvKg0KPiA+ID4gKyAqIENIViBDb2xvciBHYW11
dCBNYXBwaW5nIChDR00pIENTQw0KPiA+ID4gKyAqIHxyfCAgIHwgYzAgYzEgYzIgfCAgIHxyfA0K
PiA+ID4gKyAqIHxnfCA9IHwgYzMgYzQgYzUgfCB4IHxnfA0KPiA+ID4gKyAqIHxifCAgIHwgYzYg
YzcgYzggfCAgIHxifA0KPiA+ID4gKyAqDQo+ID4gPiArICogQ29lZmZpY2llbnRzIGFyZSB0d28n
cyBjb21wbGVtZW50IHM0LjEyLg0KPiA+ID4gKyAqLw0KPiA+ID4gIHN0YXRpYyB2b2lkIGNodl9j
Z21fY3NjX2NvbnZlcnRfY3RtKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0
YXRlLA0KPiA+ID4gIAkJCQkgICAgc3RydWN0IGludGVsX2NzY19tYXRyaXggKmNzYykgIHsNCj4g
PiA+ICAJY29uc3Qgc3RydWN0IGRybV9jb2xvcl9jdG0gKmN0bSA9IGNydGNfc3RhdGUtPmh3LmN0
bS0+ZGF0YTsNCj4gPiA+ICAJaW50IGk7DQo+ID4gPg0KPiA+ID4gLQlmb3IgKGkgPSAwOyBpIDwg
OTsgaSsrKSB7DQo+ID4gPiAtCQl1NjQgYWJzX2NvZWZmID0gKCgxVUxMIDw8IDYzKSAtIDEpICYg
Y3RtLT5tYXRyaXhbaV07DQo+ID4gPiAtDQo+ID4gPiAtCQkvKiBSb3VuZCBjb2VmZmljaWVudC4g
Ki8NCj4gPiA+IC0JCWFic19jb2VmZiArPSAxIDw8ICgzMiAtIDEzKTsNCj4gPiA+IC0JCS8qIENs
YW1wIHRvIGhhcmR3YXJlIGxpbWl0cy4gKi8NCj4gPiA+IC0JCWFic19jb2VmZiA9IGNsYW1wX3Zh
bChhYnNfY29lZmYsIDAsIENUTV9DT0VGRl84XzAgLSAxKTsNCj4gPiA+IC0NCj4gPiA+IC0JCWNz
Yy0+Y29lZmZbaV0gPSAwOw0KPiA+ID4gLQ0KPiA+ID4gLQkJLyogV3JpdGUgY29lZmZpY2llbnRz
IGluIFMzLjEyIGZvcm1hdC4gKi8NCj4gPiA+IC0JCWlmIChjdG0tPm1hdHJpeFtpXSAmICgxVUxM
IDw8IDYzKSkNCj4gPiA+IC0JCQljc2MtPmNvZWZmW2ldIHw9IDEgPDwgMTU7DQo+ID4gPiAtDQo+
ID4gPiAtCQljc2MtPmNvZWZmW2ldIHw9ICgoYWJzX2NvZWZmID4+IDMyKSAmIDcpIDw8IDEyOw0K
PiA+ID4gLQkJY3NjLT5jb2VmZltpXSB8PSAoYWJzX2NvZWZmID4+IDIwKSAmIDB4ZmZmOw0KPiA+
ID4gLQl9DQo+ID4gPiArCWZvciAoaSA9IDA7IGkgPCA5OyBpKyspDQo+ID4gPiArCQljc2MtPmNv
ZWZmW2ldID0gY3RtX3RvX3R3b3NfY29tcGxlbWVudChjdG0tPm1hdHJpeFtpXSwgNCwgMTIpOw0K
PiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIHZvaWQgY2h2X2xvYWRfY2dtX2NzYyhzdHJ1
Y3QgaW50ZWxfY3J0YyAqY3J0YywNCj4gPiA+IC0tDQo+ID4gPiAyLjM5LjINCj4gPg0KPiANCj4g
LS0NCj4gVmlsbGUgU3lyasOkbMOkDQo+IEludGVsDQo=
