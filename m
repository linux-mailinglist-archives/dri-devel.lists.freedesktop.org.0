Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421B62FCDF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 19:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E199310E23D;
	Fri, 18 Nov 2022 18:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CACB10E23D;
 Fri, 18 Nov 2022 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668796661; x=1700332661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0e3V2i+ikKFVZR8KRWxgCD7Ue+DMCEfnwRsA0ytX58A=;
 b=nLN1CGZAwOsjBAWf/+BeRD/rkw3wrNIHml+dix9MTRa7c0OU0kbU82NF
 qbtiQij6MFlri05Zn9UO1DIOWZp0fIYRwr+/GxZOyCK8T4oHIWkvM38gt
 C+yo8z1FHNeLpUOIcITDihoZp+mjldfu5nI/XeAVERS08gtMAlrRCFfBw
 0ciOUW2uibLEMbMsFIslfQi40aFnh9q55i7A9fA+xbWfKBbEfg43RAh73
 CjDCvDmOsNWcV6B4P3pCQQKqwDR3HwPi/MTnj5x3w09xiRh8NZlofhYVq
 LziIW/L/933qi9l2RyTQ/Xql/3gvG2Cwr2BUu2X90XQbAclc6o0q9lwDF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="293593183"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="293593183"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 10:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="634519233"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="634519233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 18 Nov 2022 10:37:40 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 10:37:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 10:37:39 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 10:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVpTZoJcyfT1u1kyav8frpV8a8YfIvIPJ25736Q+ZcI3GknPJwSPnC4yzM+2fNMLON8lS2kGH/UME4NmqI44aIosIS+wu89XzT25OwDdeFDSP3KkYzJVPcbyRwQWkd1JB1HlJl7B5oF7mK6BMCPdGYRoukl0XpZGqRhMF3CaAe52k65ocMZ239a4UKlUvIRS7+h2/zBqonoDIruEzaW+zikpsjnK6yS/AuVBKfPLmTICvc2WthSfPZM7iimy4iNyChVxGeL/WKKkhPyAGqnOfaEQ8qyeuF7lNQvEV9+J2A3X+WnKdCTbhsoGE/pDDdwpUOUG5bYSEajG49qH3XrGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e3V2i+ikKFVZR8KRWxgCD7Ue+DMCEfnwRsA0ytX58A=;
 b=OcXIqbZI8AvemPiLVYIWH+aXnWyy+KDttNT0uFWxdlWLbDgiy719pjFYxh/OwCqAOePQpk20tVarBDRyGi5j0jiWskfPvE6CbNwnwASSUFewz+oGrg9qPCLsy8eQD2QuCmnU4cMUunZrw+nm5y5xL02lcJsMYMKhdZup4t+OK5Bfzsdhb4rrS/Qac87jji10A6fkv8i6o8abOcMKD6bYt7UKY+1A6zWDvfzF3w52WoewSsFxBotJWhDt9DL+ccErrNptNAZss53CBC0Wl2sOD0ZB3Z/2aoVQGMiEfxtcGYxKLgKyLGr1VIPJTBtFEDtdMviEixfdmHfIOZshvISSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 18:37:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 18:37:37 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Thread-Topic: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Thread-Index: AQHY+3vOvSF5Aby0v0KE1ozhqswYWq5FArAA
Date: Fri, 18 Nov 2022 18:37:37 +0000
Message-ID: <be06273fc45d5cc758a57c2244a1ba43e26458d3.camel@intel.com>
References: <20221118183354.1047829-1-badal.nilawar@intel.com>
In-Reply-To: <20221118183354.1047829-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
x-ms-office365-filtering-correlation-id: 81b40028-1455-4762-160b-08dac993f79d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /WNtyqdMyrSuRVG5z5Dz9wyNORe91Cyle4QBjrgbPAsAb7IzM+R4jiK5gqOiqkwI6nAGB9WATeSk9DWxeug77EdyVrj22Ks2VSXNYbRTSQMbMG24rnVbU2gTc7stXX44J8NZFGBbW/Gn1hzDZu1rjNYMFCLVynSgyH24yjCg3o986mxcBbZIpI2TheUf3GeeDdjUxng52kw1UdN90sFMsRK7G/0oMBEG4BtbwF+r4CdusyTQkOXmzyZ0QSI2ez8TAtaSc14quKLy4pXgqRTPZGpvgd+w/wItsbpsIgNJ9HHrCz/kw80YTFJEbWW8ulldmo+IncXZ0B3HMt54TbumHivN5sgj/XxjsyftX0yjxLlaYNCGUWt9KYD8qooZiQ05kH6ABu0iRP3nc/pzguQQhNz1WpJeQWf0bJYdyG6/Cf/MR+bOtYcAFlU4JVYNzxPNnIC9Sca8e7Yxet449HbKqd/m374AhqfFR4PIzszxRHdA9L9essBd1UMasOCi1QXo8uVPGWbO6Yufv7PtVMVOYxjO7gqLY/I6inWN/bBQ0JO+2mlXZgpzS9g73hsHHmCbPfknxLTRQf8cvflIldHKQ3VsWPP6xOMOcJsxOoLEQsMVc+weUwz7wFTptRIve7K+iivnFqaLnwkbwNI8BAnzKCry1ZS1/xrrBb6+oP/enwyMwd+QwE1xhywCO4otPmNBESVxyoSTjG/1DOL8X9oG8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(86362001)(66476007)(64756008)(8676002)(76116006)(66946007)(66446008)(91956017)(66556008)(2616005)(41300700001)(38100700002)(71200400001)(107886003)(4326008)(450100002)(110136005)(316002)(8936002)(26005)(6486002)(5660300002)(6512007)(478600001)(83380400001)(6506007)(186003)(38070700005)(36756003)(54906003)(82960400001)(122000001)(2906002)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OS9OV2NyTkkxOWU3RjZoQXRFb3hXSTgzRzl2WXdDVXp3clE0cC9KdHlUb1F4?=
 =?utf-8?B?aGFldVJWbzRwWVZhdEc5Z2NCUFFkd3BmR2pmK2Z0RTM1cE90SzJoeXlXS2hT?=
 =?utf-8?B?c2l2M25wbzNWRHRGWTZWZ3hMVUF5L2ZMUUQ2MXhuTmo2VHFNVmsxQXlPK3JE?=
 =?utf-8?B?K3QzUDJVWml2eHc1T3pDOXV6cVVQbUpqNHpXZFlUN29raDRQU2hGc2IwRFhP?=
 =?utf-8?B?VzhhZmZBWG9zMUMvNGxrb0JBRHlkNDNMSjMxNTA5UUlqYWVGK0szYlhZRHhr?=
 =?utf-8?B?aEdYNlY4a1g4MXFRM041MTZwVjA1NldEVk5Vbi92KzhwY0tWME5vNkZFUVZB?=
 =?utf-8?B?OWFUSFhEQzFRQlBFckpiR0kyRytxYjhOTWJYeUt1dEFYeksyOWZOaytpMExJ?=
 =?utf-8?B?cG14YVNCaEx1RTluRlZ4eWI5dG9aVU5wNlViRjdhd25QRHlONEM2UE82amM1?=
 =?utf-8?B?VnI1c0tINnI5c0hBVkZkRThCelJuYjdIc1JJTUUrc0VhOEFuU1NMSjNlTVZL?=
 =?utf-8?B?WTZMNmp4TnhoeHlWSzVySndOZ1lEaFdJRjg5RFkweVJldlE4VlpkbGFETTR5?=
 =?utf-8?B?N1ZNa2RqbEtHb2tlMnVZRjI4Mno5Q0VvQ0UvRjcyYTBUQk4yZmo4OCszdEh2?=
 =?utf-8?B?eWN0ZmNBRlhTQzU4L1RSeWRaeVN0OFlOQ2dqZ04yVWMzMExzMkZicUdpbDNO?=
 =?utf-8?B?RXlQWnNwb2l6UFkzeTlFVkxPSFc2blAzUGJCVjRVK291bjN2dGd0VUxRYy9G?=
 =?utf-8?B?dmxBWGhnYVBjTmMyNFd6WUN2cXlhL3ZPQXgzN3JrQ0NaQ013aWh4cTQ0eGJM?=
 =?utf-8?B?QXA5cTZ5WXpnRmYzSEZyVWtabG0xMUNmSjg5blprb2RabTBWSUZiUXFEMVZz?=
 =?utf-8?B?UlV3RWh6clRZZ1pNS0diMGJTK0RrbkR4M25OS1h2QVFlSlBra3hqaC9WdzhR?=
 =?utf-8?B?dXY2Z3k4UVkwNldSamdReFZUS1dacUNzNko2dXBQMWZIMUg4NTIreXE2TFJ2?=
 =?utf-8?B?TnVFSEh1WHFiY3JvUFZ0WnpoNDdwVGJkRXJZY1dENm5QSjlqYjVmc0dhbEl3?=
 =?utf-8?B?Qm1lWDNXZXU4OEpnbGhUcHNQb0tGV0h4MkJONmpGRmI3eGlrWnBndW4vRmR4?=
 =?utf-8?B?UDFMNUt3RWltSlFHNSt5d2FHQlNUVlk3ZkxwdURWQ0xieEJDWEVpQXlBbTJE?=
 =?utf-8?B?SXl1YldrUmJiZnhUSEQ2YXY5S1l3RUkwKzNXZUJhcXZxTzFSV0lwbW52NTZN?=
 =?utf-8?B?NVJPV3pKYVlhV1ZMWTRBdUpXRHVyL0t1U2JwOWhPUHF4d3B4V0QwR2J0d2tV?=
 =?utf-8?B?V2t0Y1oySU1BangybU5aK1M5TTczSi9hWXAwNGFEWXRsUnUwT3V4bDM0LzRZ?=
 =?utf-8?B?MElBTlRBTi9UMFBRRHdMSWhOVnNqdG5xUlRsZDJGaFpwYi9vaHFNeG1tSzlC?=
 =?utf-8?B?MFJoK2tubDRzbDlLdWNFZVNGV1VnRll5VUVhZEtRSVNyUlh4RXQxTG5HaFBM?=
 =?utf-8?B?a3dLdHV4Q0cwNVRDVURNOWRIMVk1aXpXT1ViTkg4TUxsUzlrUHhEYURhVHVK?=
 =?utf-8?B?MkxiZW9lOHBmdmJka0lWeXhkZmRuK0hOcHFEc0c2WkFrTitUazVZN0hSaDhE?=
 =?utf-8?B?R3BjY2EzVlByRTk1RWdpd3dua3VYYkhhOWxPM0dsU0p3RWJObFEwZEN6dTB3?=
 =?utf-8?B?S1NIN1V1S0M1Yms2eFZ5bXdlQnNCMlB6d0NXWW85aTd6ZFhGWVRtelBqZ1Yx?=
 =?utf-8?B?R2pST1BlNjZGTzhDYmdRRTY0TTlYTU9PWkRRbUl0N3d0ZFdRdU1XTHFxajJJ?=
 =?utf-8?B?cDBvenBSWUVIMXdoTEVUNGdkaXVoNDBGVHBkRWpwQ2VnaUQxeVU1bEl5clVa?=
 =?utf-8?B?WG1nWTYxTFBJUThBZlpWWkxQQTBuUHB1ZnU3bEhZTVBqRk1LQURvZkpCZlJC?=
 =?utf-8?B?UXhRSXI1OExCMCtiUEFQY21CSFJVK1ZDV2MzcmR2eldMbjFPdmNnY1dmTStF?=
 =?utf-8?B?ckhyTG5MblRZbjZra09rbHlFeDdlSWdMRmJYaHVKdnhEK29MaVNYdUlKYjNR?=
 =?utf-8?B?VndKSlZrT0dMdE8yMTBWV2laYUVad2FvR3BuRmw2amNEWDd6L1FXWlgyRzY5?=
 =?utf-8?B?aXJuRXBabkZ1d2JHVlZSMXpwMTJJZTNVMDJlY05kaFIzRWs5R3Q3YncyYk9x?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67C63521273E93498C532DDA98DB90A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b40028-1455-4762-160b-08dac993f79d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 18:37:37.7520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAe4YxoqMATqc5DIGPJ2vOUcZPCY+Nm8MWC5dW+jUEJ6CsFRIid1SF88d6GbMwHq4o05zzMjqaAKzIBHghZA2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIyLTExLTE5IGF0IDAwOjAzICswNTMwLCBCYWRhbCBOaWxhd2FyIHdyb3RlOgo+
IEZyb206IFZpbmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPgo+IAo+
IEJ5IGRlZmF1dCBpZGxlIG1lc3NhZ2luZyBpcyBkaXNhYmxlZCBmb3IgR1NDIENTIHNvIHRvIHVu
YmxvY2sgUkM2Cj4gZW50cnkgb24gbWVkaWEgdGlsZSBpZGxlIG1lc3NhZ2luZyBuZWVkIHRvIGJl
IGVuYWJsZWQuCj4gCj4gdjI6Cj4gwqAtIEZpeCByZXZpZXcgY29tbWVudHMgKFZpbmF5KQo+IMKg
LSBTZXQgR1NDIGlkbGUgaHlzdGVyZXNpcyBhcyBwZXIgc3BlYyAoQmFkYWwpCj4gdjM6Cj4gwqAt
IEZpeCByZXZpZXcgY29tbWVudHMgKFJvZHJpZ28pCj4gCj4gQnNwZWM6IDcxNDk2Cj4gCj4gQ2M6
IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBpbnRl
bC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFZpbmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdhdW1rYXJA
aW50ZWwuY29tPgoKSGUgaXMgdGhlIGF1dGhvciBvZiB0aGUgcGF0Y2gsIG5vPyEKb3IgeW91IGNh
biByZW1vdmUgdGhpcyBvciBjaGFuZ2UgdGhlIGF1dGhvciB0byBiZSB5b3UgYW5kIGtlZXAgaGlz
CnJldmlld2VkLWJ5Li4uCgpvciBJIGNhbiBqdXN0IHJlbW92ZSBoaXMgcnYtYiB3aGlsZSBtZXJn
aW5nLi4ganVzdCBsZXQgbWUga25vdy4uCgo+IFJldmlld2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9lbmdpbmVfcG0uYyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+IMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfcmVncy5owqDCoCB8wqAgNCArKysrCj4gwqAyIGZpbGVzIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2VuZ2luZV9wbS5jCj4gaW5kZXggYjBhNGEyZGJlM2VlLi5lOTcxYjE1M2ZkYTkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfcG0uYwo+IEBAIC0xNSw2ICsx
NSwyMiBAQAo+IMKgI2luY2x1ZGUgImludGVsX3JjNi5oIgo+IMKgI2luY2x1ZGUgImludGVsX3Jp
bmcuaCIKPiDCoCNpbmNsdWRlICJzaG1lbV91dGlscy5oIgo+ICsjaW5jbHVkZSAiaW50ZWxfZ3Rf
cmVncy5oIgo+ICsKPiArc3RhdGljIHZvaWQgaW50ZWxfZ3NjX2lkbGVfbXNnX2VuYWJsZShzdHJ1
Y3QgaW50ZWxfZW5naW5lX2NzCj4gKmVuZ2luZSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gZW5naW5lLT5pOTE1Owo+ICsKPiArwqDCoMKgwqDC
oMKgwqBpZiAoSVNfTUVURU9STEFLRShpOTE1KSAmJiBlbmdpbmUtPmlkID09IEdTQzApIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfdW5jb3JlX3dyaXRlKGVuZ2luZS0+
Z3QtPnVuY29yZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJDX1BTTUlfQ1RSTF9HU0NDUywKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Cj4gX01BU0tFRF9CSVRfRElTQUJMRShJRExFX01TR19ESVNBQkxFKSk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC8qIGh5c3RlcmVzaXMgMHhBPTV1cyBhcyByZWNvbW1lbmRlZCBp
biBzcGVjKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfdW5jb3JlX3dy
aXRlKGVuZ2luZS0+Z3QtPnVuY29yZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBXUkNUWF9NQVhDTlRfR1NDQ1Ms
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAweEEpOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArfQo+IMKgCj4gwqBzdGF0
aWMgdm9pZCBkYmdfcG9pc29uX2NlKHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSkKPiDCoHsKPiBA
QCAtMjc1LDYgKzI5MSw4IEBAIHZvaWQgaW50ZWxfZW5naW5lX2luaXRfX3BtKHN0cnVjdCBpbnRl
bF9lbmdpbmVfY3MKPiAqZW5naW5lKQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3dha2Vy
ZWZfaW5pdCgmZW5naW5lLT53YWtlcmVmLCBycG0sICZ3Zl9vcHMpOwo+IMKgwqDCoMKgwqDCoMKg
wqBpbnRlbF9lbmdpbmVfaW5pdF9oZWFydGJlYXQoZW5naW5lKTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgaW50ZWxfZ3NjX2lkbGVfbXNnX2VuYWJsZShlbmdpbmUpOwo+IMKgfQo+IMKgCj4gwqAvKioK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfcmVncy5oCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgKPiBpbmRleCBjM2NkOTI2
OTE3OTUuLjgwYTk3OWU2ZjZiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9pbnRlbF9ndF9yZWdzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9n
dF9yZWdzLmgKPiBAQCAtOTE3LDYgKzkxNywxMCBAQAo+IMKgI2RlZmluZcKgIE1TR19JRExFX0ZX
X01BU0vCoMKgwqDCoMKgwqBSRUdfR0VOTUFTSygxMywgOSkKPiDCoCNkZWZpbmXCoCBNU0dfSURM
RV9GV19TSElGVMKgwqDCoMKgwqA5Cj4gwqAKPiArI2RlZmluZcKgwqDCoMKgwqDCoMKgwqBSQ19Q
U01JX0NUUkxfR1NDQ1PCoMKgwqDCoMKgwqBfTU1JTygweDExYTA1MCkKPiArI2RlZmluZcKgwqDC
oMKgwqDCoMKgwqDCoCBJRExFX01TR19ESVNBQkxFwqDCoMKgwqDCoMKgUkVHX0JJVCgwKQo+ICsj
ZGVmaW5lwqDCoMKgwqDCoMKgwqDCoFBXUkNUWF9NQVhDTlRfR1NDQ1PCoMKgwqDCoMKgX01NSU8o
MHgxMWEwNTQpCj4gKwo+IMKgI2RlZmluZSBGT1JDRVdBS0VfTUVESUFfR0VOOcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX01NSU8oMHhhMjcwKQo+IMKgI2RlZmluZSBGT1JD
RVdBS0VfUkVOREVSX0dFTjnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfTU1J
TygweGEyNzgpCj4gwqAKCg==
