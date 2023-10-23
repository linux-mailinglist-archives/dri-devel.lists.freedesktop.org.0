Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E467D3DC1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D16F10E19B;
	Mon, 23 Oct 2023 17:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0AC10E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698082298; x=1729618298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mV69Fjl/2AOfSe3C2tMS34mzJuaijCluSjAE85whOfE=;
 b=KcVZQObCyidKyexojPV2wkTxksZTMQkhHslHuiwUtKT5Ho5qaaqenW7r
 0eKBcH+fcRLf1Et5d029yJk5In7UByYXPIJSYFpO3L1UqkSKW+yFFykX4
 nwn8hidd98yX+KKv7eLC3BOKuBtqqVbCc8gCzfSVwtpIoAiVCW/XbdgDz
 Tmk7i77aGBanCG5f0gSII36lfXz8IHfnX8nHgWS4ccq252WldHKp80Bt7
 u8lmIxiWR1x7TjXT6tUxUPGVKjRCBaIRFmrCtfByL7wt82O9QU1+D8hRs
 XKAwA36OqBeGP7BAYFWPImtyJNYu5fgPyDEc682iyO3v3ADjI4ecGBgnM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="453356780"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="453356780"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 10:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="5885717"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 10:30:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 10:31:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 10:31:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 10:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbfJHFLUjavbM25cK6Dij4ie9EKTiu4mKvQboR6cxImITIdCCOBM+X8JiTSwj1IdCEd9MtneF7FkkU0iIsaK4PhXVxR49EYehJYdZ3nw9RX+IHCMrD1I+q6AHU45cpSdoF5VoQwE/LhNSjIDiC7re1ZYqXQ4WkJagrclH8X32XuRc+6NFOYwWAoHJzYLEnSbn4H3zf6AP4hy5Ux4YrRFUx9BFcClCDVZqokTWlvjDCxIA+phOwd+vnvv9tXNkj3x3yJcsMScpgi9UrAK2JM/Ew8uIiUUUnSYBHeNUcnCVYNw9Al4bEZ7ZjXPkNStIdiVjsRKuLr0KHIGrR0lHvk23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV69Fjl/2AOfSe3C2tMS34mzJuaijCluSjAE85whOfE=;
 b=nFAaPu76nNOVF39oxA0e+WbOhFPiYgUEGkjImqFIBwd9hfz3RrRscNzo+vZZeBhIH/R/YGa6TdPgjRuq3VZ6mycKuA6a90dEYGTZukRixtzxPYYHWKZhB/W0wPaPtf61MMa23Amc6GZPJUOwyL3wnUZR9vYqpQzBPBApSsKAuKVhCM89IXFqMKWNihHB+BhMo3pYJMZSXW6LT65lHgay+rFerxXA/XCq8Fzzo+j7q5X5cjQZW/4jif2dAlUz0lPwMUd5gssugIMtGsOvA5PBl29eyriCTRxV5JrHp98t5g2B9Pc8z3mz7rx25Vr20cviizjvP4q+fYhrXcHb0fXxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 17:31:19 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::908d:4fdf:abf6:c6f6]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::908d:4fdf:abf6:c6f6%5]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 17:31:19 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH v2 1/1] drm/virtio: new fence for every plane update
Thread-Topic: [RFC PATCH v2 1/1] drm/virtio: new fence for every plane update
Thread-Index: AQHZ9Zi0A+Y/RdCIRkiBrXvK5F+qy7BXbHsAgABTHpA=
Date: Mon, 23 Oct 2023 17:31:19 +0000
Message-ID: <PH8PR11MB687986353C7E238B2298897EFAD8A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20231003010013.15794-1-dongwon.kim@intel.com>
 <20231003010013.15794-2-dongwon.kim@intel.com>
 <675400bf-74fb-8495-b2b8-3ff717979369@collabora.com>
In-Reply-To: <675400bf-74fb-8495-b2b8-3ff717979369@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|DS0PR11MB7901:EE_
x-ms-office365-filtering-correlation-id: e2643246-ae86-4330-9e0b-08dbd3edde3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZOqHaqhMiBN2dhqOY7Fxjog7RJD/Egj099L5tgPes2A6sKMqOnJEN+dS0CUuYo4YUPPH10ycui3J198E4n8XT3vRGSGZVxCfGKFfhdl2aYLtpGU021Lga8Hp9Sgp2LLp3aNjQIqegRgiLi19Sl/YkP9/3TqZE6q+wZj/L3qKlnMGNKrEB8VQs2Gl+N3wJsJnFkQBZIrzVnWMZRnSBL9a0n9LVqcvl3CdoKnWdCPIapZn+Q30NG1vOb7M0yDLyBuxvvrM56kP/EQWKoeefImC7KXnlQCXajO4EQdMEu5DUnBef6jAmfVWohhJKnbOYvAvKxI1lqEwNsrrcH7AzE9L5LtGOfgQT3+EyAguU56ET+EU1HJkDZP++Am9oQkJJBK9A4waLdzaynutKHvDSES3pqhjn9sPTpZPh6N/Wtmn/8rPGC69OThKLTEe6u8hacRP5hlXk/8uQ01wtOE3z4HUzq0EZ3VhwJekSFHuEQNsA7RZRXM1CdE3zp74IJT0Awj2midZEWhHjc9sxLgCLW0NVQyxgyeI/41Zy1UGb7eSJsRvv2gBk59InXdt0qG1gQf61AK8ZV53zxVBszYrwTduog0LelPb6TB+QGfMKxTJYH6Iyu0VHFJVxvZSmXDTFwue
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(38070700009)(55016003)(71200400001)(15650500001)(2906002)(8936002)(4326008)(52536014)(33656002)(53546011)(82960400001)(107886003)(8676002)(122000001)(38100700002)(26005)(7696005)(6506007)(9686003)(316002)(478600001)(5660300002)(54906003)(86362001)(66946007)(41300700001)(66556008)(110136005)(66476007)(66446008)(76116006)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0tPQ01FQUk4TzBSQm5HMUFJQTBQeTducmRiSlRibUFVTG1HY0lYd2lWS0FB?=
 =?utf-8?B?QWVMcWhtZWUzN3ZjOHhmSUxGMlpxUWRzNDc2T3JKcDlna0I2N1UvTjZ4Tkln?=
 =?utf-8?B?UUIrOEw5NmJmWkFwUHJXV0xNTGpDK1krOWpnR1dvZlVxRVkzb2JOYmswUThJ?=
 =?utf-8?B?ekVFRS92OEVCSlJrbmZsQWlvUExUSnpCaHU1SSttQ0RLWUZCdjVzOTcvRnFs?=
 =?utf-8?B?R2NHNklKUEY4b09iaHJ3N2xOZFh0WVZObnRKZ3laQXpOdHF0UmFqR2JiQ25R?=
 =?utf-8?B?bFVOWHBaSUR4R3AvSnM2SS9lWTRaeDRFSUtTcVN0OGliRGVIdXFKQ05FU2NN?=
 =?utf-8?B?UkNHQTVWV1Y4ZUdnYXZRS0laM3cxbElySGw2UmdEN284Z3BPR1cvSVpkbitQ?=
 =?utf-8?B?YVQ5aWxRQ3FwODZnMzJIaWxhSkp3NE5CWHI3ZHYrWEFRdTdJR3JiWCszOGZH?=
 =?utf-8?B?VmtHWSszZ0FvSjFqQmpma1dCZUFla2NNUlZURTY2N2U1b1Vjdk15WkNUNTVP?=
 =?utf-8?B?d1YrelQ1RHRybGtSajBKWjZNTnRLTXZWdHBHS0NyM1J6d055WG9GMDdXT2Yx?=
 =?utf-8?B?TzJrQ2QzRm5UU3NnU3BTdXlmTHJMaU5nQmZzZDd2NGJIOVRlL2tLeDhEaWVj?=
 =?utf-8?B?dU92aDRtREhKanBlaXdyeGhDb2sxblhET2VGaUZCZ21BYjRpTlZGdEpESkVq?=
 =?utf-8?B?SzluQ0Zqeko2c3pGNkN4T1YrMGE3TE5PaEkyZWtydG1GTzc3aU5pcUhwRmFU?=
 =?utf-8?B?ZXh0RmZ6VFRyeHVGQjNKNys0US83TXBRRGZrb01xZG5SRnRmMGlDN2Flckdr?=
 =?utf-8?B?VlRxa1JXWmpxTG1YZ080ZzZod0h3ZllpVTJtOGR1cytOY1Y4UmV1V0JCajJY?=
 =?utf-8?B?VWR2cmt4WGx5SXRlWGxMdjh4Znd4c1E0bVRrTVFRdTFLL05nNUlLQkFPVFQ0?=
 =?utf-8?B?UWVXTUxIcUFVN1NTR3VEN29JVWh0SkM4SkFEVUJ4cjlOVm9NQnNSVnJ6TWxG?=
 =?utf-8?B?YytueHpUaytFY0lJQkRFRWVJQzRRU21EdG1uTjQzSWlXcE03ZmlPVUMrd3VP?=
 =?utf-8?B?aGxZdDVVbE1hZ0RRRUxLcG1SUTNEYTZXL3ROakJldlhWQXovZStRSjg5N1pX?=
 =?utf-8?B?NDJraENwYnh2d0E5OU9HQ0RYdGJzQ2JpNmVwY2wxeVFmYUEwbi84K0ROUGdL?=
 =?utf-8?B?N0tDZFVBZUdjdEQzTVN2VGRUT2JlcXloVDZHU1ZoV0U1SVJOWmdMeHJXUGc5?=
 =?utf-8?B?SDlrcEMxVVJPOFJvVlZOMXgzbEp4RFNYWGh6VjEwVmN6QW1tL0F2b1k2b2cv?=
 =?utf-8?B?TGRmOFdBQmtDbGVSSTAxZGdKN3A1dTFGQ2NUVUtYNElGM2RpMTA3Y0VRdElH?=
 =?utf-8?B?QkdRQkNXNmRuMUpMVlNTSHk5SHBGTWkvd2h4ckUzeTJrcTV5aHg4dTN0OGV2?=
 =?utf-8?B?ckpyVm1Yc1J0a1pJcS9BbE1sNWdjUXBtdW9ualBXdC9iVHBGL0UrT0hhbVpi?=
 =?utf-8?B?cDZYQ3kwYmhJOTQ1SHd1OXM2N1RpdWFqelVxTitRVnRHcjBVajVudHloMnJO?=
 =?utf-8?B?U1JHeFhSNFI4RVFzelhsM0E5d2VMZ1hnNnJoSDZCMVJML1ROMHFvOXZHVzRx?=
 =?utf-8?B?NVV3MHpDcmxwOWt4dDE2dDMvTkFhSm14QXhYNTVTSUt5Q1hKelB2TklCNEJT?=
 =?utf-8?B?M1lDRDJHbVhtbkwySUxsQ2lXVTFOcjArMGE5cmpCUzF6N1JnRW1yZ2FGbldt?=
 =?utf-8?B?M1FsWkJUVzFhU1o4aE8wNXM0VTc2a2xpZzlvdzNrNWtsZkd5ekdoeFFVd25x?=
 =?utf-8?B?OStpYlRDNlNFbWxsSUVSZStVeEFKWnhrc3prTDZVNWxTSjVZays0NHVDbllm?=
 =?utf-8?B?VlJpUG1BSHJZN0ZFQTQ2QUFQRXJIN3dXbjFSd1dpRndWKzRPb3laeHF3YWZr?=
 =?utf-8?B?aGFvSXBHeHNTYnpKUStpK3BxSDU4U0pERktSclZhTzdoZ1lYNlM5SVNvNzht?=
 =?utf-8?B?SVo5L3Nqa3MvcU80R00ySmZreFRCczEvdjRNdmw5SWZUK1FIWU9OMXZSdUt6?=
 =?utf-8?B?ZC9aTlFJU1BJU2FSbGJ3djltNmFZNGhkZ2R5TUZnZGhoa3RvUk5GT0gwTFRr?=
 =?utf-8?Q?WbmyOROlKtSNHk78nBKmWYv0/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2643246-ae86-4330-9e0b-08dbd3edde3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 17:31:19.2237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7985lLEuvo0pbhv8DHjg4BgUP3+vH/3Z/mPL8Z1q84MzMocOAZn28w+o4U1ABa4dUTsnMOwJfQf2kdPhDub6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7901
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgT3NpcGVua28gPGRt
aXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjMs
IDIwMjMgNToyNCBBTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25nd29uLmtpbUBpbnRlbC5jb20+
OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBrcmF4ZWxAcmVkaGF0LmNv
bTsgS2FzaXJlZGR5LCBWaXZlayA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtSRkMgUEFUQ0ggdjIgMS8xXSBkcm0vdmlydGlvOiBuZXcgZmVuY2UgZm9yIGV2ZXJ5
IHBsYW5lIHVwZGF0ZQ0KPiANCj4gT24gMTAvMy8yMyAwNDowMCwgRG9uZ3dvbiBLaW0gd3JvdGU6
DQo+ID4gSGF2aW5nIGEgZmVuY2UgbGlua2VkIHRvIGEgdmlydGlvX2dwdV9mcmFtZWJ1ZmZlciBp
biB0aGUgcGxhbmUgdXBkYXRlDQo+ID4gc2VxdWVuY2Ugd291bGQgY2F1c2UgY29uZmxpY3Qgd2hl
biBzZXZlcmFsIHBsYW5lcyByZWZlcmVuY2luZyB0aGUgc2FtZQ0KPiA+IGZyYW1lYnVmZmVyIChl
LmcuIFhvcmcgc2NyZWVuIGNvdmVyaW5nIG11bHRpLWRpc3BsYXlzIGNvbmZpZ3VyZWQgZm9yDQo+
ID4gYW4gZXh0ZW5kZWQgbW9kZSkgYW5kIHRob3NlIHBsYW5lcyBhcmUgdXBkYXRlZCBjb25jdXJy
ZW50bHkuIFNvIGl0IGlzDQo+ID4gbmVlZGVkIHRvIGFsbG9jYXRlIGEgZmVuY2UgZm9yIGV2ZXJ5
IHBsYW5lIHN0YXRlIGluc3RlYWQgb2YgdGhlIGZyYW1lYnVmZmVyLg0KPiA+DQo+ID4gVGhlIHBs
YW5lIHN0YXRlIGZvciB2aXJ0aW8tZ3B1LCAic3RydWN0IHZpcnRpb19ncHVfcGxhbmVfc3RhdGUi
IGlzDQo+ID4gYWRkZWQgZm9yIHRoaXMuIFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMgZHJtX3Bs
YW5lX3N0YXRlIGFuZCBpdA0KPiA+IGNvbnRhaW5zIHRoZSByZWZlcmVuY2UgdG8gdmlydGlvX2dw
dV9mZW5jZSwgd2hpY2ggd2FzIHByZXZpb3VzbHkgaW4gInN0cnVjdA0KPiB2aXJ0aW9fZ3B1X2Zy
YW1lYnVmZmVyIi4NCj4gPg0KPiA+ICJ2aXJ0aW9fZ3B1X3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZSIg
aXMgYWRkZWQgYXMgd2VsbCB0byBjcmVhdGUgYQ0KPiA+IHZpcnRpb19ncHVfcGxhbmVfc3RhdGUg
b24gdG9wIG9mIGR1cGxpY2F0ZWQgZHJtIHBsYW5lIHN0YXRlLg0KPiA+DQo+ID4gU2V2ZXJhbCBk
cm0gaGVscGVycyB3ZXJlIHNsaWdodGx5IG1vZGlmaWVkIGFjY29yZGluZ2x5IHRvIHVzZSB0aGUN
Cj4gPiBmZW5jZSBpbiBuZXcgcGxhbmUgc3RhdGUgc3RydWN0dXJlLiB2aXJ0aW9fZ3B1X3BsYW5l
X2NsZWFudXBfZmIgd2FzDQo+ID4gY29tcGxldGVseSByZW1vdmVkIGFzIGRtYV9mZW5jZV9wdXQg
c2hvdWxkbid0IGJlIGNhbGxlZCBoZXJlIGFzIGl0IGNhbg0KPiA+IG1lc3MgdXAgd2l0aCB0aGUg
cmVmIGNvdW50IG9mIHRoZSBmZW5jZS4gVGhlIGZlbmNlIHNob3VsZCBiZSBwdXQgYWZ0ZXINCj4g
PiB0aGUgZmVuY2UgaXMgc2lnbmFsZWQgaW4gdmlydGlvX2dwdV9yZXNvdXJjZV9mbHVzaCB0aGVu
IHJlbGVhc2VkIGluDQo+ID4gdmlydGlvX2dwdV9hcnJheV9hZGRfZmVuY2Ugd2hpbGUgdGhlIG5l
eHQgdmlydGlvIG1lc3NhZ2UgaXMgYmVpbmcgcXVldWVkLg0KPiA+DQo+ID4gQWxzbywgdGhlIGNv
bmRpdGlvbiBmb3IgYWRkaW5nIGZlbmNlLCAocGxhbmUtPnN0YXRlLT5mYiAhPQ0KPiA+IG5ld19z
dGF0ZS0+ZmIpIHdhcyByZW1vdmVkIHNpbmNlIHdlIG5vdyBhbGxvY2F0ZSBhIG5ldyBmZW5jZSBm
b3IgdGhlDQo+ID4gbmV3IHBsYW5lIHN0YXRlIGV2ZW4gaWYgYm90aCBvbGQgYW5kIG5ldyBwbGFu
ZXMgYXJlIHBvaW50aW5nIHRvIHRoZSBzYW1lDQo+IGZyYW1lYnVmZmVyLg0KPiA+DQo+ID4gdjI6
IHJlbW92ZWQgdmlydGlvX2dwdV9wbGFuZV9kdXBsaWNhdGVfc3RhdGUgYXMgdGhlIGV4aXN0aW5n
IGhlbHBlciwNCj4gPiAgICAgZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZSBk
b2VzIHRoZSBzYW1lLg0KPiA+DQo+ID4gQ2M6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBl
bmtvQGNvbGxhYm9yYS5jb20+DQo+ID4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPg0KPiA+IENjOiBWaXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uZ3dvbiBLaW0gPGRvbmd3b24ua2ltQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgfCAg
NyArKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgfCA2Ng0K
PiA+ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+IA0KPiBQbGVhc2Ugd3JpdGUgYSBndWlk
ZSBob3cgdG8gdGVzdCBpdC4gQXJlIHlvdSB1c2luZyBzcGljZSBmb3IgdGhlIG11bHRpLWRpc3Bs
YXkNCj4gdmlld2VyPw0KDQpbRFddIFllYWgsIGxldCBtZSBjb21lIHVwIHdpdGggYSBzaW1wbGUg
dGVzdCBjYXNlLiBTbyB3ZSB1c2UgdmlydGlvLWdwdSBhcyBLTVMgZGV2aWNlLiBJdCBpcyB1c2Vk
IHRvIHNoYXJlIHRoZSBndWVzdCBmcmFtZSB3aXRoIFFFTVUuDQpTUElDRSBpcyBvbmUgb2YgY2xp
ZW50IHNvbHV0aW9ucyB3ZSB1c2UgYnV0IHdlIHByaW1hcmlseSB1c2UgUUVNVSBHVEstVUkgdy8g
bXVsdGkgZGlzcGxheXMgKFFFTVUgd2l0aCB0aGlzIHBhcmFtcyAnLWRldmljZSB2aXJ0aW8tdmdh
LG1heF9vdXRwdXRzPTIsYmxvYj10cnVlJykuDQpUaGFua3MhDQoNCj4gDQo+IC0tDQo+IEJlc3Qg
cmVnYXJkcywNCj4gRG1pdHJ5DQoNCg==
