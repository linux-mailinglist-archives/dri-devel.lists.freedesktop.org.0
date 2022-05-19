Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6F52D3C1
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 15:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E8811A4CA;
	Thu, 19 May 2022 13:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A4511A5D3;
 Thu, 19 May 2022 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652966391; x=1684502391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0aBxn4v+o9VPgJM3P9qKkuYN2fphtNKXfwjsidNO/jY=;
 b=I96lAOAQfJd48lm6O0T2r9nkyIGNoZNa0071s0g4dGruDE0+foDJ143r
 iFRfAVs+m6ZRokaQTVqxV9vp1p4Q61WQ1pjrEQgn2KLfVLgpyLbuSpT6g
 r3pJGtxcCuhLVLU0sgOJ/FyrOcV0ph8HFGapUDVL8JckuT7sXl/Fs0QbC
 533JcX3XBxPiUiUnm0bXkwK4Wkx+NMSThjv4nYJ8UGqPW8zU3VzR56S2L
 if//tgwzIh6Jq54sq7k3vnxTXybQ//HY6zM9x+NaWgIJT2TYAZtOpRTvz
 DCjt6KrxUnJk+cFn9ghy1nbsjON3IK2aYPDBDUHzrMW72VzE5V9fbPb3C A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="254252383"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="254252383"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 06:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="570208518"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 19 May 2022 06:19:50 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 06:19:49 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 06:19:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 06:19:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 06:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctHKV0aYKqNzvQTMsuxpkuJeHbLpObO+cpCICJGv/Ynpr4Tst0fQCKVRLV7RuGVKf4oTrzXQ5AARP8XKp3DlWqLnEeb8iCHEjFNuzAjfyZ+EXnDWi0FPmx3AJ2vYWC6NhgMtgFo1rWSVW3xu9aXZEfKm/oC1fESRnFJTYShDCpjFGEAkHyBbCQRgMt7wSHa5IJCkuEIe3vgCZwomUfvqahhf+w3W7aVWP+AkQBQ4jcpmFX+sf3O2fPLQuk/c9vH4uHnBlfrzS0219yNvBiPXchVABW1oFk0hlxojgLvXM28AKn1Yn7uOzcylZZYyMujCUnhw4wg7mFcORhqoN9ddsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aBxn4v+o9VPgJM3P9qKkuYN2fphtNKXfwjsidNO/jY=;
 b=RJEw8RHPe190eQku9kc4pNN/Q0vGnzhmBAzlbtLXoeVRgoGlMTy7GjHgbgS//3MYRot+z/6PcgGTHi0RogX3p3S2DqKAfeps9b+hFPMmX38pJlAKIL2dTOm0xOCDKHO/DAeIOb2hnC0OAJ6V/4txj5aqM9oCLpffTum8rpIJMW68HKwQMFgoGTwmvRy6P57it23Ab850EYl7A/DO5e0FMnxsr0l8LibSu8VSMR/HLLvbJZpOuaUux/oDzL3SK30YPPOPBxO9RuH0r5DxOnQv1YEv7lKP3YjrJvUDc3fXtaYJ+Syj5qvQAwgM7+zaisPQlkyc2qVKeKdQ8/vqBc8VTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BN7PR11MB2691.namprd11.prod.outlook.com (2603:10b6:406:b3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 13:19:46 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20%5]) with mapi id 15.20.5250.020; Thu, 19 May 2022
 13:19:46 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
Thread-Topic: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
Thread-Index: AQHYa2aVqSO0ePN1+EyRUYzEGvyXQq0l9jOAgAA4w3A=
Date: Thu, 19 May 2022 13:19:46 +0000
Message-ID: <DM5PR11MB132436B29B27E633F54C3454C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-3-christian.koenig@amd.com>
In-Reply-To: <20220519095508.115203-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5242eb53-ebaf-4932-3043-08da399a3ec4
x-ms-traffictypediagnostic: BN7PR11MB2691:EE_
x-microsoft-antispam-prvs: <BN7PR11MB269180ACC7304828964238D2C1D09@BN7PR11MB2691.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pMg3yFDfSchUGg3FmZ2C1pW3bacQlANbI0RWH6afItSsDvv9TQoZRbL1129nXUP1SDujOIE5t/eFgZsk+R45Bw6CLUhjNwvnIQClYJtTVeatM4M8Q5fZIU1zGT3+a+KkwlDl8jxTfS/63VEojg2I1F5DfePOtC4a3n9qDCKBMst5+9z3fK+jOChJVVQgoRvRXdM/QZBXhc6BzzTXZ76i6X6JeQv03CqsD3eyG4RFD7TEJsuNlq6aOnqgFLyxZOYN0RP/k1qabv00IJij+RF7PL4pm6uIas0ND0YXy5WfahFU1zPXXvykOLwnhfgHs79Jz7aWgDELZswYjutBDfmaJ3Tnp75etg9cT1o8ZjBzvJ8dDG+nF20shYBkNUyc2YaVSRsbmXwJZ9m7A3ghauH9Kt/eRK5+eq6L0ZJoJWhIrwdWR8rC6RPB6ytLURhy0jvyEihzOp7i6QbnrOnjfsi5CFcpJHLjxDqlOoFts02B51p6YDOx/Lv+DKoyphrm3fkkVoq2AjX4z3y/NawgerHRgURtozIPO5IQX8wRD9NP5OAzFEgbS30RLeIVMYXm4QhJwCbEQPJafdjn5h1bUGPpAB2lUdeI0e1bDVdJsVTaa1sf69Bhja1JeJa5liu0FYq+Lz+xuNgyjqTxl4BEAi/uIf2c1ckgpM2ySDpU4Ya2BsW46uyOYIFeGTseAyG7fhDbcKzmCL4Iri90GwWpccfqgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(54906003)(316002)(9686003)(110136005)(33656002)(71200400001)(82960400001)(38100700002)(6506007)(66946007)(122000001)(76116006)(4326008)(52536014)(8936002)(5660300002)(186003)(2906002)(26005)(7696005)(66556008)(66446008)(8676002)(55016003)(38070700005)(66476007)(64756008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjlBbFRvbVlVbHAvWnZpT3JzUWFJM2t6L3VDckFlQnpPZE9HZVpkd2VDOWpt?=
 =?utf-8?B?Q2R5ampuOUxvVjlZSDR1ZVlSVUxHYnd5MzNEdURVYzh0Y01lTDVSeVR4c0lQ?=
 =?utf-8?B?QTBlMHdBSjkzZlA4NXdSZVg1NGhvdGZIem5PRU5UK2NpQXltaE5sd21xbUph?=
 =?utf-8?B?aWwzV003dnA5VzdNS3VINDRKbThLUzdJTUJMSi9LcTh6OTlYc3h2dHNIdnkv?=
 =?utf-8?B?blFQK2Jnb3Y3WTVabC9POWExQUFvakZvSUxFbHh3WVMySm93RmJyc1pmWFJs?=
 =?utf-8?B?QVEyWFA4blB0RnRSSHYrejNibm5QM0g3WGRwT1FJMC9tUEJxbW1lRTZUWndr?=
 =?utf-8?B?bHRxRWY0M2NZaVdBb3pRZlpnQ0lvbTNpSDE4MmZjNHlkbGZoU2FIMG5lb0ZE?=
 =?utf-8?B?VS9BNitRS05hcUR3V0JjRUJDWVkvOXdGZ1VyT0tFN1dtMXhBMWVEYkhjKzJN?=
 =?utf-8?B?M0ZOQXZWM3ZMTHQxYjhZOFBFWC9xTDJIaDdMM1NZWUtLalVCTTFJeDBNU2Nq?=
 =?utf-8?B?M1ZrU3Y4ckxlT1BlNENrajQ5dnZnOGhxWlNzUEVmbTNyZVc0ZjJpRDh6VVRp?=
 =?utf-8?B?L2hhR0tHSTlienJXUnZ6RCtuVk1OKzUvNU1Felg2ZmNZTGdidHg1UXFvT1p6?=
 =?utf-8?B?R0I3bng0eFVPR2RzV1NZVVRGazB2Zktucmg4dmxOcGMzMWVEVC9nZERlV0ky?=
 =?utf-8?B?aTY0eWt3TlQvWDkyd0JleGxkWVlScU4wRGxtdzZFcHFMVlNBOU5TdzByNkRL?=
 =?utf-8?B?RWQyeE5QalFTN241TjJORXRzVGJHK2tqS1BKSVhPd21lUjJQYWtDeDJSV2pE?=
 =?utf-8?B?UFkxL25mRGpnS0doK1pkVEtWa0gxTEROWXhGU0tUTWlsanhNeWVwVXVURk9y?=
 =?utf-8?B?cHZTZk5kQmhzQmc4OVJzYnYvbHc4NDRVd1RXRVZ5Nzlkb05GVlRjOXNpMU04?=
 =?utf-8?B?L2hSRGg3eVN5eldxUEFDRkpKY3U1L24rOWRJQU9NUU9oZlFSVUZZK2h4L1Rm?=
 =?utf-8?B?VUZjWVBzbXBoeGNKUTlNOWdmTU4xZHhDL1J3LytON0oxd1dkV0Z0MlRQOU1E?=
 =?utf-8?B?U2MxYlBaWGhhNXRSdEhkK2UyVi9haHFKWUR2UWE1TzhjaEpsYmNFUHlrendM?=
 =?utf-8?B?ZUxkOFJpaXhJVitDVElMOHZJc0ovMzA0bWttUkpETW1QZ2pDLzR3RFo3OGxh?=
 =?utf-8?B?eFZ6SjRkd1dVVUV3ZlNDT3FKOFBXRFoyeGhQdzM0YkFuYytlTVVyYUtIMUFT?=
 =?utf-8?B?OGc2L1hvSTRleU1QWkhQLzFwbGNOK1kyazJabC9sYkI0UlN2Z3M5YWZWUk5G?=
 =?utf-8?B?SUROUXYrM2N2cEVWS3lSaDA3cW9OMk1Bd1lIcFVTV0FBRDhKWTd6MUVWMk0r?=
 =?utf-8?B?T2VzaGhmcHVYWU5nUCtnMHFyZEoreU0yZ3RkelRybFZZRE9sMzJmZzlCQVNM?=
 =?utf-8?B?RmJrcUdCNFpVSU8vdEgxNzB6N1dNYlJZMGFSbGRMZ2hicjBIWFVtcTVGYWZ6?=
 =?utf-8?B?bExnZzNUL3FscEtJcEdwSlhUL1hudlZwdHdDU3p1Z1NjRC9TNitscG1DaUFT?=
 =?utf-8?B?b2dNZmxMbzNLdVFLdFdPMGNTdUZ4MTFYUERMZFZwTjBJQVZ0Z0VZYkoyNHlC?=
 =?utf-8?B?WlBKY3hxMjVPWUVOTDNpeXc5aFFmZUtpR2hlV09lVW5HZ3daTkJ3T2xwakF0?=
 =?utf-8?B?YXRSREZwa3dQRXBVaEJNSlJpQmxHQ3RpQXZHMWttZEpGVVdlUFZBUG9PMVFB?=
 =?utf-8?B?V1Y0TnFqVDl5TWV3QWh3YmZkc3hDR054aENzNE9WZ0V1cWhuUE51UFBlckIr?=
 =?utf-8?B?SnBUeWxyTytmS2t1TC9OZFZWMGc1UndZNVVEU0RPYU8rSHVWTFpXVUdJcHUz?=
 =?utf-8?B?ZWs2SnlER1J3OUszUzNJcnZ6blVXRWNrREhMRVdlWHRGeDl2RnlEeDBNeE80?=
 =?utf-8?B?b3liUmNKYlFXbzVGNHlNRzFtY0c2NmU3dG1ocHlUWVBDNElpWjJrUWxGeVlX?=
 =?utf-8?B?M0UxSFVPT3lCN0FKWVRFK2pvUFlNZXczUWxWZkZKd2R1Yk1yVmJyTmwrYStl?=
 =?utf-8?B?Ulc5Z0M3TEE1elpJcWZOSEowY0hpQlhhN3B5M3BCa1o5UVdBNEZvVHBqQ3Fx?=
 =?utf-8?B?ZXBoNCtCNHZLUzdNa0xyYk5kSUdLTXI4dk90SmgvMGVFUktuZFlhWUdoSGp4?=
 =?utf-8?B?c1lPbDdIRTJzZUgwVTc1bXA5K3pKb0hZZmoxUGNkRU80TTBEMnZTbHlObWUr?=
 =?utf-8?B?OTBqVFJHVEpxOXRmSTFhTlNjZkJISStMNVd4MnNDeVQ4RmIySkpPbmk3ZTFr?=
 =?utf-8?B?eVhVNGJvc0liQjMyWDF3VUFyUjJ3NFI0K2dkUTFWK2RLdDBPaGZIaHF2TGFW?=
 =?utf-8?Q?TFUg8irHekWs/SOo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5242eb53-ebaf-4932-3043-08da399a3ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 13:19:46.6669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKVFI8OI4Ta/NgBd7VEHH2z09mcopdeEGoOkp8+UnbU7oQXc6z6KonL7Du2StrJZaXazhOlyoq9g6xW14It1CBUUiJU8yd4NdW38IhGA9fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2691
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDU6NTUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBtYXR0aGV3LndpbGxpYW0uYXVsZEBnbWFp
bC5jb207IENocmlzdGlhbiBLw7ZuaWcNCj48Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCAwMi8xMV0gZHJt
L25vdXZlYXU6IHN3aXRjaCBvdmVyIHRvIHR0bV9ib19pbml0X3Jlc2VydmVkDQo+DQo+VXNlIHRo
ZSBuZXcgaW50ZXJmYWNlIGluc3RlYWQuDQo+DQo+U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAxMCArKysrKysrLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYw0KPmIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5jDQo+aW5kZXggMDUwNzZlNTMwZTdkLi44NThiOTM4MjAzNmMgMTAwNjQ0DQo+
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jDQo+KysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jDQo+QEAgLTMwMiwxOSArMzAyLDIzIEBAIG5v
dXZlYXVfYm9faW5pdChzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibywgdTY0DQo+c2l6ZSwgaW50IGFs
aWduLCB1MzIgZG9tYWluLA0KPiAJCXN0cnVjdCBzZ190YWJsZSAqc2csIHN0cnVjdCBkbWFfcmVz
diAqcm9iaikNCj4gew0KPiAJaW50IHR5cGUgPSBzZyA/IHR0bV9ib190eXBlX3NnIDogdHRtX2Jv
X3R5cGVfZGV2aWNlOw0KPisJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgZmFsc2Us
IGZhbHNlIH07DQo+IAlpbnQgcmV0Ow0KPg0KPiAJbm91dmVhdV9ib19wbGFjZW1lbnRfc2V0KG52
Ym8sIGRvbWFpbiwgMCk7DQo+IAlJTklUX0xJU1RfSEVBRCgmbnZiby0+aW9fcmVzZXJ2ZV9scnUp
Ow0KPg0KPi0JcmV0ID0gdHRtX2JvX2luaXQobnZiby0+Ym8uYmRldiwgJm52Ym8tPmJvLCBzaXpl
LCB0eXBlLA0KPi0JCQkgICZudmJvLT5wbGFjZW1lbnQsIGFsaWduID4+IFBBR0VfU0hJRlQsIGZh
bHNlLCBzZywNCj4tCQkJICByb2JqLCBub3V2ZWF1X2JvX2RlbF90dG0pOw0KPisJcmV0ID0gdHRt
X2JvX2luaXRfcmVzZXJ2ZWQobnZiby0+Ym8uYmRldiwgJm52Ym8tPmJvLCBzaXplLCB0eXBlLA0K
PisJCQkJICAgJm52Ym8tPnBsYWNlbWVudCwgYWxpZ24gPj4gUEFHRV9TSElGVCwNCj4mY3R4LA0K
PisJCQkJICAgc2csIHJvYmosIG5vdXZlYXVfYm9fZGVsX3R0bSk7DQo+IAlpZiAocmV0KSB7DQo+
IAkJLyogdHRtIHdpbGwgY2FsbCBub3V2ZWF1X2JvX2RlbF90dG0gaWYgaXQgZmFpbHMuLiAqLw0K
PiAJCXJldHVybiByZXQ7DQo+IAl9DQo+DQo+KwlpZiAoIXJvYmopDQo+KwkJdHRtX2JvX3VucmVz
ZXJ2ZSgmbnZiby0+Ym8pOw0KPisNCg0KT2ssIHRoaXMgaW1wbGllcyB0aGF0IHBhdGNoIDEgZG9l
cyBoYXZlIGFuIGlzc3VlLg0KDQpJIHNlZSB0aGlzIHVzYWdlIGluIHBhdGNoIDEsIDIsIGFuZCAz
LiAgV291bGQgaXQgbWFrZSBzZW5zZSB0byBtb3ZlIHRoaXMNCl91bnJlc2VydmUgdG8gdHRtX2Jv
X2luaXRfcmVzZXJ2ZWQ/DQoNCk1pa2UNCg0KPiAJcmV0dXJuIDA7DQo+IH0NCj4NCj4tLQ0KPjIu
MjUuMQ0KDQo=
