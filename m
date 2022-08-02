Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26675881DA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 20:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8551C93A39;
	Tue,  2 Aug 2022 18:27:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FBD94179;
 Tue,  2 Aug 2022 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659464841; x=1691000841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lp1kOJWk6ugZRhDgxyrNMG4h8yB5e/pv4uPfJnNH7/8=;
 b=mQ6Q7fBu6lDHibQpIeGZtrOKY8ZNZfIusplpRQ05/TcLWlQKHosz9afb
 IWW4IG+DfsR9xQBA+b1w/h+05LbWmXVDB87WB0bSalroBosdjzx4hFUsf
 9hGEtHq2KS/erfAGW2gQEloCx2b62TMAuOX7unytWFxSTwhbej59FcKrE
 WLlRdk7XW++wPZ3MtfG7XwabUQmwyXvws2/jliXqYIkWjGyEvzSN2ZUlY
 j3JVKKUyuG8Pi5rGDL6FRPpeNLJuFzEU8P8iSSsGlaIUOpH6pY2pFlZMy
 zPbW1wBb1ElO/1739DIO6wWekIE5Zmzi9KaMo3/c61hpRALcAo5oUp+Db w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269868232"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="269868232"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 11:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="691952830"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2022 11:27:20 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 11:27:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 11:27:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 11:27:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 11:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGFzlNV22h9qJMiMgAtjZWo3WGMUauefeqfNRCXPq/d/v4fGXW+XwhrhA3HPmtWwY2FaIJza9g0QDuAYPI3/U64fUFe3wpOoZo1sxYvbd3Ds8C6pFF7h2j2blg6LFnnM80BdDtWgq8ADrDPP1q4yOblvtEEjRMOYqkJPmtiN8CGKEnJyeEK4XrIZGg9wrHrh2aUDIV3huCSuZVkw/+BeS2P54OH2QXWF33P4Dd6hGexbHKSa99I9B6I62hBiRdpSsiKoF3RXRBht+yafibVZ4HJ2gQm7P2EUWks8K6IbEbo0wNu+GZ7npmKfZ9oSBdlE00JT1s0zMkabYwn58Pua8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp1kOJWk6ugZRhDgxyrNMG4h8yB5e/pv4uPfJnNH7/8=;
 b=lxvSylJnu7I90jO+9Ja5xTlYc/6AwysMarTCtSKTZl8s4TGV7MkMCVqia0YmqdoC0QfwpuHsGy5ee6kcPhB4y+4P3wgiMV9qc3RTf78KbHvRjmrLhNvFYz5DlGGRd81WfZG5g31uLTIwfUbopUGulmeTr+D78y0Ao8xaOpGCO+/S+P23y+VK6/lp9C4rVL3Xa2UMaGTI/56qrNEtuqJ8L8KXwCpUKkcxfBTL+FAd5AnQgoPO2DdwTI4+0Bc4LXl6krcAd/8XOvMj0DraRPKT9L2jLrDoCxEiiKJR23z1wD1N/S38UEGNdgD0xyK0ElbixVGpIa1AIzTFNnmrV2fxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB5795.namprd11.prod.outlook.com (2603:10b6:510:132::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Tue, 2 Aug 2022 18:27:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 18:27:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/guc: Record CTB info in error
 logs
Thread-Topic: [Intel-gfx] [PATCH 4/7] drm/i915/guc: Record CTB info in error
 logs
Thread-Index: AQHYoiji1pLscHTOlkuXn61bfYcToq2b9vmA
Date: Tue, 2 Aug 2022 18:27:17 +0000
Message-ID: <d9f6c68a1795ffd207bcaec3c7482241c1dce1ce.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-5-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-5-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f054288-5283-4ba6-9e8e-08da74b4a16c
x-ms-traffictypediagnostic: PH7PR11MB5795:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mqgqE3Cc3vrRPM35RDzWi+lGfdIdDCR4U1MEg9rnmZalhWy6wfci5sDmDz7xCTm3LB08koc8vvcL9fCn/8+vCi6y23wNk1sMo/xkpT6X91d1FR4eaH3eUU+XAZv0JgS7tN+RD6jbS8PGmnqV/TabJu9yLIDJ2c59ko5zPBAGqTEGEP2CzvicX/HWO6uw6C/x3YK9a9u7gqG89CYTFMsfKWzjO1Uo9gMlNttF2AzXOdzIa8lLtkGIVCPkVOCd9+rLPvvfvyIYLxO/0fXmEvrOiJZEfWvXDCKEnloNfEuBDO+I8KbqY0sfhCC5Qw6z9BDI78jCWfhavH9I4w+pwAMrBLk5LCL6+DNDz1tS0ryNOSS6+45lw9zKaJDz0nGp7s7xX6tNvsGql3/KR/uEaPjwd+9cW/9C+p+spOCuzjYfrK9jBP3BPOp6hMYvzA2krlQfMBPVTQa6QaERq1Mi/gr/CEUTn6f2bnDj2ZiulK1R7ijtOsMBYMjLtDWfd1TUH138nRMuseZVd6CuyDwJPnwXa9w0HFSnTx4NPjYgYbNEvZSZ710a+JzKDEQnhVA1S6xihtXI/s4lgOr3d+G1OaT3IqimezYmBYyUXCngwgypGyDrCTTw3qi92qr1CqEVsOp5Hs1rQVuSMuz4Wqu/IiIt1E1KpSA8V5esWcEoHAwGbwT0ssS7HXI/MS8ic0CUmBpr83bAtpqxbUAfPxEcjRGjZ4iAC+hck1wbuEOv2csTVaByCniuZStKL5KqWmHVkLbmGa++LxAoEFLtvQ12/0uKRpBY7QeLVr0LiW1K+90bE/0kELu8FGtAZHSmWDnExSAW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(396003)(366004)(136003)(82960400001)(110136005)(6506007)(2906002)(38100700002)(41300700001)(122000001)(86362001)(316002)(36756003)(2616005)(26005)(76116006)(450100002)(91956017)(478600001)(38070700005)(186003)(6512007)(71200400001)(83380400001)(8936002)(6486002)(5660300002)(4326008)(66476007)(66446008)(64756008)(66556008)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0l1cHA5cDh0Q2poNVNXKzlYd3Z0ZGpPZmR0bFJjNURsdUkyM08zRzVCOERO?=
 =?utf-8?B?cUdGOG9jaStlUjE1RFRzcTU3WFB6V1c5b2ZxU3hkT3hJdFN6eHJIdGVZbkti?=
 =?utf-8?B?R0tFY3BxLzhFTG5VdWE5REZWWnVMTWRDVlJVQlRFWXFUQmh1aEFpby9FVlY3?=
 =?utf-8?B?MG5LR1F5allTRkQrTTBzUzRQYWtIL2Y5ODVwK2x4bSt0RklUcHlCVDVtWFg3?=
 =?utf-8?B?TzBhdm9ZR0RUdFBVZ00vRkloMTViZGw0VHFzOU5HQWJkZXVjcFZQUW5jaThn?=
 =?utf-8?B?cDZDTVN1bzh0U2RORWJsTXlvS3dPUmp0MlkrcC9hSVU0bitQT085VTRyNzdR?=
 =?utf-8?B?Wmt4b1pTOHFVQ3RZS3c5azAxV2Z1ekttclpCVjVVWENsZzdWSTkrMHBNN3cy?=
 =?utf-8?B?V3JpeUFoNGt5N0FyaVdlaVMyODZoaXVvMkp5VG9HNFNpanI0YXB3RWQ1eVdN?=
 =?utf-8?B?OUV6YitadzN5eVNWeE1YenQ3QXRDN2k5YzdFbFV4TVQ3NW9McTBoamU1WFlC?=
 =?utf-8?B?L3Fia1hlellQL1ViTWxBZDRHa3VzTkVBYTFHbnBWWHUxcU9RVVNsMmIxTUgx?=
 =?utf-8?B?UGdHTWFrV3FLNFVaRGtuRWozSWlSbXhiaC96UFN3aFpaWjFMbk5qQmI3ZndG?=
 =?utf-8?B?UzJKS1hRSzlzeGR5dGoxQm5POU55Lzkrb1NFbDVoV0RJVEZwVkxEYjNBR09J?=
 =?utf-8?B?TWUvMmd0aXcrQmJZZGRJKzFYeGNxdDRSdHFndytaai82OWRUd0dMNG5HdXRK?=
 =?utf-8?B?aG12WWhaeXpBc2txYWdWZUY4MUhOQzY2azl3WXA1NGx5dGZzeGdsOXV3bW4z?=
 =?utf-8?B?d0FyVmRVZVAwQnNSbG1iOGdIM0psS2RESFNvK0JrWnVSVVNqd2RabTlXQnBq?=
 =?utf-8?B?b3Q0RTVJY1JXSVNPQTdrUGxaVUNaaWhyRit6eFdRYzBvcm5TY1lkaVRKSU1o?=
 =?utf-8?B?b0xuR1hnMGFZSGEvZ3pSck0rZTFxUjY5ZkR6KzBYUFg1M2prRlN2WmY4RTAr?=
 =?utf-8?B?NVFibDhMTmZTZ2RmejlFWXJkZ0YrcVFQcEhYaGZ5MEYxekExNGQ4NW90cmh0?=
 =?utf-8?B?OTVrUDd2am5XZ2Z4MDhJaDNvc2NEZUVab29lWFRZV2loQ1hmVGNCT25Jc2Uz?=
 =?utf-8?B?SGVGNVdOSzA0SFQrNVBIU1NtdWo2WElKNERqbEQ4WWUxbVh0RFJEMVYyVlNW?=
 =?utf-8?B?SGdXSGJtL3BQSFpMZ2ljdjNrWExhT3FvUUkybnNXN3JIUEZqTkIvQmw1QTlJ?=
 =?utf-8?B?NjNkU2tpdUtQSzIxcHN2R0JXWlMvZEhBRy9EQlVXcS8vYW1zNS9PamxCa1c0?=
 =?utf-8?B?cDlLeDk2eHJ6NVVtZkZ4anU3em9Sc2RkakhWNU54SnZmYzNIK09UcGdDcHM1?=
 =?utf-8?B?V0hBMHBVM0thZDJNSUZUSHdmajRpeitldjJ0VC9iRkNMbk5scnJkanl6WVhW?=
 =?utf-8?B?dVdZYmt1TUJjdUJiOURsVmp1RnlFZjJZL2tVbVlFUDMyaDlyZkIwc285d0Np?=
 =?utf-8?B?M2x0TG1JOHlTMXBoMy8vWW1BZUhiM1ZtWFFwK0dkNXFBUDY5bjRPZXNQTFhK?=
 =?utf-8?B?WndEWXpuNytYbW9Memw0cXpGM2hua3NibjVPMFhwQzVldzFiVFNFSDJORk56?=
 =?utf-8?B?U09tTExnOUVPK2hsRHVwTU54aHlQWGcybk5KTVFHaEhncFl0MW5GOWhxYUYy?=
 =?utf-8?B?ZmpueWdFN2dQbEhha1orZ0RqdXUyVEFVbnZMR3BCTFFtdXhMbWZoN2NpKzM0?=
 =?utf-8?B?cE0zcnpNTVZrb3hZQTVlTFdNZk5NVmpZSlJFdnNIM1l5d3gvL0QzamFzRkIz?=
 =?utf-8?B?NVZydyt2ZVFWN3o1aGxGaEcyN1VWOGpxSlFvQ01oeVR4RzNXNHdLUFdORlV2?=
 =?utf-8?B?YzFiZDR5S21XdFN0ak5mMm12akZhUFFZcXdYd3FIWUkyczFzN1FZc2RtUTBD?=
 =?utf-8?B?cUdEWW1NRFEwOTlEZmltMGZYcWZpK1FRZEorMGozRTZDUFJQVk9Gc3pZWlJo?=
 =?utf-8?B?a2FuTXJsSFF3allkeWx3bi9pQ3JxN2cwRVR1SWJ1VHQyWFoxd04rem9mem5s?=
 =?utf-8?B?MjlQMEhyZXlVUWVYOUlLUWFHZEFYTEFHMWdTTzBkNnNuWmFTZTc2YTk0VXFI?=
 =?utf-8?B?L1I5VW5tSXVLdkRQeDZpcnRkVUkzRWpqSmhrWWJTYzFHTkV5YnU3Y292K1E4?=
 =?utf-8?Q?NYVALmRwPMGUxatQrlFJVIs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3122A5EA75C0C149A765EC08C01A54EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f054288-5283-4ba6-9e8e-08da74b4a16c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 18:27:17.6907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dvQa2OzxIa8lyOpDx2fEG5/MK5PIq3NUctwaeLCPOu3RLin9kdzR9EYM+7KUA15f7RTeav7ui3ZcN0VSwjTfaEEQhUvhsUtZUHAgyhZGOO4V1RvSbxjXcB4jtMBOj7k8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5795
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIG1pbm9yIE5JVCAodGhvdWdoIGkgaG9wZSBpdCBjb3VsZCBiZSBmaXhlZCBvdHcgaW4gYXMg
aXQgYWRkcyBhIGJpdCBvZiBlYXNlLW9mLWxvZy1yZWFkaWJpbGl0eSkuDQpUaGF0IHNhaWQsIGV2
ZXJ5dGhpbmcgZWxzZSBsb29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFs
YW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQogDQpPbiBXZWQsIDIwMjItMDctMjcg
YXQgMTk6MjAgLTA3MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20gd3JvdGU6DQo+IEZyb206
IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IA0KPiBXaGVuIGRl
YnVnZ2luZyBHdUMgY29tbXVuaWNhdGlvbiBpc3N1ZXMsIGl0IGlzIHVzZWZ1bCB0byBoYXZlIHRo
ZSBDVEINCj4gaW5mbyBhdmFpbGFibGUuIFNvIGFkZCB0aGUgc3RhdGUgYW5kIGJ1ZmZlciBjb250
ZW50cyB0byB0aGUgZXJyb3INCj4gY2FwdHVyZSBsb2cuDQo+IA0KPiBBbHNvLCBhZGQgYSBzdWIt
c3RydWN0dXJlIGZvciB0aGUgR3VDIHNwZWNpZmljIGVycm9yIGNhcHR1cmUgaW5mbyBhcw0KPiBp
dCBpcyBub3cgYmVjb21pbmcgbnVtZXJvdXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhh
cnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmggfCAyMCArKysrKysr
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9ncHVfZXJyb3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMNCj4gaW5kZXggYWRkYmE3
NTI1MjM0My4uNTQzYmE2M2Y5NThlYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9ncHVfZXJyb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dw
dV9lcnJvci5jDQo+IEBAIC02NzEsNiArNjcxLDE4IEBAIHN0YXRpYyB2b2lkIGVycl9wcmludF9w
Y2lpZChzdHJ1Y3QgZHJtX2k5MTVfZXJyb3Jfc3RhdGVfYnVmICptLA0KPiAgCQkgICBwZGV2LT5z
dWJzeXN0ZW1fZGV2aWNlKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZXJyX3ByaW50X2d1
Y19jdGIoc3RydWN0IGRybV9pOTE1X2Vycm9yX3N0YXRlX2J1ZiAqbSwNCj4gKwkJCSAgICAgIGNv
bnN0IGNoYXIgKm5hbWUsDQo+ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3RiX2NvcmVk
dW1wICpjdGIpDQo+ICt7DQo+ICsJaWYgKCFjdGItPnNpemUpDQo+ICsJCXJldHVybjsNCj4gKw0K
PiArCWVycl9wcmludGYobSwgIkd1QyAlcyBDVEI6IHJhdzogMHglMDhYLCAweCUwOFgvJTA4WCwg
Y2FjaGVkOiAweCUwOFgvJTA4WCwgZGVzYyA9IDB4JTA4WCwgYnVmID0gMHglMDhYIHggMHglMDhY
XG4iLA0KPiArCQkgICBuYW1lLCBjdGItPnJhd19zdGF0dXMsIGN0Yi0+cmF3X2hlYWQsIGN0Yi0+
cmF3X3RhaWwsDQo+ICsJCSAgIGN0Yi0+aGVhZCwgY3RiLT50YWlsLCBjdGItPmRlc2Nfb2Zmc2V0
LCBjdGItPmNtZHNfb2Zmc2V0LCBjdGItPnNpemUpOw0KPiANCk5JVDogdG8gbWFrZSBpdCBtb3Jl
IHJlYWRpYmxlIG9uIGZpcnN0IGdsYW5jZSwgd291bGQgYmUgbmljZSB0byBhZGQgbW9yZSBkZXNj
cmlwdGl2ZSB0ZXh0IGxpa2UgInJhdzogU3RzOjB4JTA4WCwNCkhkOjB4JTA4WCxUbDoweEAwOFgu
Li4iIGFsc28sIHRoZSBub3Qgc3VyZSB3aHkgY21kc19vZmZzZXQgaXMgcHJlc2VudGVkIHdpdGgg
YSAieCBzaXplIiBhcyBvcHBvc2VkIHRvIGp1c3QgImRlc2Mtb2ZmID0NCmZvbzEsIGNtZC1vZmYg
PSBmb28yLCBzaXplID0gZm9vMyI/DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGVycl9wcmlu
dF91YyhzdHJ1Y3QgZHJtX2k5MTVfZXJyb3Jfc3RhdGVfYnVmICptLA0KPiAgCQkJIGNvbnN0IHN0
cnVjdCBpbnRlbF91Y19jb3JlZHVtcCAqZXJyb3JfdWMpDQo+ICB7DQo+IEBAIC02NzgsOCArNjkw
LDEyIEBAIHN0YXRpYyB2b2lkIGVycl9wcmludF91YyhzdHJ1Y3QgZHJtX2k5MTVfZXJyb3Jfc3Rh
dGVfYnVmICptLA0KPiAgDQo+ICAJaW50ZWxfdWNfZndfZHVtcCgmZXJyb3JfdWMtPmd1Y19mdywg
JnApOw0KPiAgCWludGVsX3VjX2Z3X2R1bXAoJmVycm9yX3VjLT5odWNfZncsICZwKTsNCj4gLQll
cnJfcHJpbnRmKG0sICJHdUMgdGltZXN0YW1wOiAweCUwOHhcbiIsIGVycm9yX3VjLT50aW1lc3Rh
bXApOw0KPiAtCWludGVsX2dwdV9lcnJvcl9wcmludF92bWEobSwgTlVMTCwgZXJyb3JfdWMtPmd1
Y19sb2cpOw0KPiArCWVycl9wcmludGYobSwgIkd1QyB0aW1lc3RhbXA6IDB4JTA4eFxuIiwgZXJy
b3JfdWMtPmd1Yy50aW1lc3RhbXApOw0KPiArCWludGVsX2dwdV9lcnJvcl9wcmludF92bWEobSwg
TlVMTCwgZXJyb3JfdWMtPmd1Yy52bWFfbG9nKTsNCj4gKwllcnJfcHJpbnRmKG0sICJHdUMgQ1RC
IGZlbmNlOiAlZFxuIiwgZXJyb3JfdWMtPmd1Yy5sYXN0X2ZlbmNlKTsNCj4gKwllcnJfcHJpbnRf
Z3VjX2N0YihtLCAiU2VuZCIsIGVycm9yX3VjLT5ndWMuY3RiICsgMCk7DQo+ICsJZXJyX3ByaW50
X2d1Y19jdGIobSwgIlJlY3YiLCBlcnJvcl91Yy0+Z3VjLmN0YiArIDEpOw0KPiArCWludGVsX2dw
dV9lcnJvcl9wcmludF92bWEobSwgTlVMTCwgZXJyb3JfdWMtPmd1Yy52bWFfY3RiKTsNCj4gIH0N
Cj4gIA0KPiAgc3RhdGljIHZvaWQgZXJyX2ZyZWVfc2dsKHN0cnVjdCBzY2F0dGVybGlzdCAqc2ds
KQ0KPiBAQCAtODU0LDcgKzg3MCw3IEBAIHN0YXRpYyB2b2lkIF9fZXJyX3ByaW50X3RvX3NnbChz
dHJ1Y3QgZHJtX2k5MTVfZXJyb3Jfc3RhdGVfYnVmICptLA0KPiAgCWlmIChlcnJvci0+Z3QpIHsN
Cj4gIAkJYm9vbCBwcmludF9ndWNfY2FwdHVyZSA9IGZhbHNlOw0KPiAgDQo+IC0JCWlmIChlcnJv
ci0+Z3QtPnVjICYmIGVycm9yLT5ndC0+dWMtPmlzX2d1Y19jYXB0dXJlKQ0KPiArCQlpZiAoZXJy
b3ItPmd0LT51YyAmJiBlcnJvci0+Z3QtPnVjLT5ndWMuaXNfZ3VjX2NhcHR1cmUpDQo+ICAJCQlw
cmludF9ndWNfY2FwdHVyZSA9IHRydWU7DQo+ICANCj4gIAkJZXJyX3ByaW50X2d0X2Rpc3BsYXko
bSwgZXJyb3ItPmd0KTsNCj4gQEAgLTEwMDksNyArMTAyNSw4IEBAIHN0YXRpYyB2b2lkIGNsZWFu
dXBfdWMoc3RydWN0IGludGVsX3VjX2NvcmVkdW1wICp1YykNCj4gIHsNCj4gIAlrZnJlZSh1Yy0+
Z3VjX2Z3LnBhdGgpOw0KPiAgCWtmcmVlKHVjLT5odWNfZncucGF0aCk7DQo+IC0JaTkxNV92bWFf
Y29yZWR1bXBfZnJlZSh1Yy0+Z3VjX2xvZyk7DQo+ICsJaTkxNV92bWFfY29yZWR1bXBfZnJlZSh1
Yy0+Z3VjLnZtYV9sb2cpOw0KPiArCWk5MTVfdm1hX2NvcmVkdW1wX2ZyZWUodWMtPmd1Yy52bWFf
Y3RiKTsNCj4gIA0KPiAgCWtmcmVlKHVjKTsNCj4gIH0NCj4gQEAgLTE2NTgsNiArMTY3NSwyMyBA
QCBndF9yZWNvcmRfZW5naW5lcyhzdHJ1Y3QgaW50ZWxfZ3RfY29yZWR1bXAgKmd0LA0KPiAgCX0N
Cj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZ3RfcmVjb3JkX2d1Y19jdGIoc3RydWN0IGludGVs
X2N0Yl9jb3JlZHVtcCAqc2F2ZWQsDQo+ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfZ3Vj
X2N0X2J1ZmZlciAqY3RiLA0KPiArCQkJICAgICAgY29uc3Qgdm9pZCAqYmxvYl9wdHIsIHN0cnVj
dCBpbnRlbF9ndWMgKmd1YykNCj4gK3sNCj4gKwlpZiAoIWN0YiB8fCAhY3RiLT5kZXNjKQ0KPiAr
CQlyZXR1cm47DQo+ICsNCj4gKwlzYXZlZC0+cmF3X3N0YXR1cyA9IGN0Yi0+ZGVzYy0+c3RhdHVz
Ow0KPiArCXNhdmVkLT5yYXdfaGVhZCA9IGN0Yi0+ZGVzYy0+aGVhZDsNCj4gKwlzYXZlZC0+cmF3
X3RhaWwgPSBjdGItPmRlc2MtPnRhaWw7DQo+ICsJc2F2ZWQtPmhlYWQgPSBjdGItPmhlYWQ7DQo+
ICsJc2F2ZWQtPnRhaWwgPSBjdGItPnRhaWw7DQo+ICsJc2F2ZWQtPnNpemUgPSBjdGItPnNpemU7
DQo+ICsJc2F2ZWQtPmRlc2Nfb2Zmc2V0ID0gKCh2b2lkICopY3RiLT5kZXNjKSAtIGJsb2JfcHRy
Ow0KPiArCXNhdmVkLT5jbWRzX29mZnNldCA9ICgodm9pZCAqKWN0Yi0+Y21kcykgLSBibG9iX3B0
cjsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHN0cnVjdCBpbnRlbF91Y19jb3JlZHVtcCAqDQo+ICBn
dF9yZWNvcmRfdWMoc3RydWN0IGludGVsX2d0X2NvcmVkdW1wICpndCwNCj4gIAkgICAgIHN0cnVj
dCBpOTE1X3ZtYV9jb21wcmVzcyAqY29tcHJlc3MpDQo+IEBAIC0xNjg0LDkgKzE3MTgsMTYgQEAg
Z3RfcmVjb3JkX3VjKHN0cnVjdCBpbnRlbF9ndF9jb3JlZHVtcCAqZ3QsDQo+ICAJICogbG9nIHRp
bWVzIHRvIHN5c3RlbSB0aW1lcyAoaW4gY29uanVuY3Rpb24gd2l0aCB0aGUgZXJyb3ItPmJvb3R0
aW1lIGFuZA0KPiAgCSAqIGd0LT5jbG9ja19mcmVxdWVuY3kgZmllbGRzIHNhdmVkIGVsc2V3aGVy
ZSkuDQo+ICAJICovDQo+IC0JZXJyb3JfdWMtPnRpbWVzdGFtcCA9IGludGVsX3VuY29yZV9yZWFk
KGd0LT5fZ3QtPnVuY29yZSwgR1VDUE1USU1FU1RBTVApOw0KPiAtCWVycm9yX3VjLT5ndWNfbG9n
ID0gY3JlYXRlX3ZtYV9jb3JlZHVtcChndC0+X2d0LCB1Yy0+Z3VjLmxvZy52bWEsDQo+IC0JCQkJ
CQkiR3VDIGxvZyBidWZmZXIiLCBjb21wcmVzcyk7DQo+ICsJZXJyb3JfdWMtPmd1Yy50aW1lc3Rh
bXAgPSBpbnRlbF91bmNvcmVfcmVhZChndC0+X2d0LT51bmNvcmUsIEdVQ1BNVElNRVNUQU1QKTsN
Cj4gKwllcnJvcl91Yy0+Z3VjLnZtYV9sb2cgPSBjcmVhdGVfdm1hX2NvcmVkdW1wKGd0LT5fZ3Qs
IHVjLT5ndWMubG9nLnZtYSwNCj4gKwkJCQkJCSAgICAiR3VDIGxvZyBidWZmZXIiLCBjb21wcmVz
cyk7DQo+ICsJZXJyb3JfdWMtPmd1Yy52bWFfY3RiID0gY3JlYXRlX3ZtYV9jb3JlZHVtcChndC0+
X2d0LCB1Yy0+Z3VjLmN0LnZtYSwNCj4gKwkJCQkJCSAgICAiR3VDIENUIGJ1ZmZlciIsIGNvbXBy
ZXNzKTsNCj4gKwllcnJvcl91Yy0+Z3VjLmxhc3RfZmVuY2UgPSB1Yy0+Z3VjLmN0LnJlcXVlc3Rz
Lmxhc3RfZmVuY2U7DQo+ICsJZ3RfcmVjb3JkX2d1Y19jdGIoZXJyb3JfdWMtPmd1Yy5jdGIgKyAw
LCAmdWMtPmd1Yy5jdC5jdGJzLnNlbmQsDQo+ICsJCQkgIHVjLT5ndWMuY3QuY3Ricy5zZW5kLmRl
c2MsIChzdHJ1Y3QgaW50ZWxfZ3VjICopJnVjLT5ndWMpOw0KPiArCWd0X3JlY29yZF9ndWNfY3Ri
KGVycm9yX3VjLT5ndWMuY3RiICsgMSwgJnVjLT5ndWMuY3QuY3Ricy5yZWN2LA0KPiArCQkJICB1
Yy0+Z3VjLmN0LmN0YnMuc2VuZC5kZXNjLCAoc3RydWN0IGludGVsX2d1YyAqKSZ1Yy0+Z3VjKTsN
Cj4gIA0KPiAgCXJldHVybiBlcnJvcl91YzsNCj4gIH0NCj4gQEAgLTIwMzksOSArMjA4MCw5IEBA
IF9faTkxNV9ncHVfY29yZWR1bXAoc3RydWN0IGludGVsX2d0ICpndCwgaW50ZWxfZW5naW5lX21h
c2tfdCBlbmdpbmVfbWFzaywgdTMyIGR1DQo+ICAJCQllcnJvci0+Z3QtPnVjID0gZ3RfcmVjb3Jk
X3VjKGVycm9yLT5ndCwgY29tcHJlc3MpOw0KPiAgCQkJaWYgKGVycm9yLT5ndC0+dWMpIHsNCj4g
IAkJCQlpZiAoZHVtcF9mbGFncyAmIENPUkVfRFVNUF9GTEFHX0lTX0dVQ19DQVBUVVJFKQ0KPiAt
CQkJCQllcnJvci0+Z3QtPnVjLT5pc19ndWNfY2FwdHVyZSA9IHRydWU7DQo+ICsJCQkJCWVycm9y
LT5ndC0+dWMtPmd1Yy5pc19ndWNfY2FwdHVyZSA9IHRydWU7DQo+ICAJCQkJZWxzZQ0KPiAtCQkJ
CQlHRU1fQlVHX09OKGVycm9yLT5ndC0+dWMtPmlzX2d1Y19jYXB0dXJlKTsNCj4gKwkJCQkJR0VN
X0JVR19PTihlcnJvci0+Z3QtPnVjLT5ndWMuaXNfZ3VjX2NhcHR1cmUpOw0KPiAgCQkJfQ0KPiAg
CQl9DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vy
cm9yLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5oDQo+IGluZGV4IGQ4
YThiM2Q1MjllMDkuLmVmYzc1Y2MyZmZkYjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9ncHVfZXJyb3IuaA0KPiBAQCAtMTI1LDYgKzEyNSwxNSBAQCBzdHJ1Y3QgaW50ZWxfZW5naW5l
X2NvcmVkdW1wIHsNCj4gIAlzdHJ1Y3QgaW50ZWxfZW5naW5lX2NvcmVkdW1wICpuZXh0Ow0KPiAg
fTsNCj4gIA0KPiArc3RydWN0IGludGVsX2N0Yl9jb3JlZHVtcCB7DQo+ICsJdTMyIHJhd19oZWFk
LCBoZWFkOw0KPiArCXUzMiByYXdfdGFpbCwgdGFpbDsNCj4gKwl1MzIgcmF3X3N0YXR1czsNCj4g
Kwl1MzIgZGVzY19vZmZzZXQ7DQo+ICsJdTMyIGNtZHNfb2Zmc2V0Ow0KPiArCXUzMiBzaXplOw0K
PiArfTsNCj4gKw0KPiAgc3RydWN0IGludGVsX2d0X2NvcmVkdW1wIHsNCj4gIAljb25zdCBzdHJ1
Y3QgaW50ZWxfZ3QgKl9ndDsNCj4gIAlib29sIGF3YWtlOw0KPiBAQCAtMTY1LDkgKzE3NCwxNCBA
QCBzdHJ1Y3QgaW50ZWxfZ3RfY29yZWR1bXAgew0KPiAgCXN0cnVjdCBpbnRlbF91Y19jb3JlZHVt
cCB7DQo+ICAJCXN0cnVjdCBpbnRlbF91Y19mdyBndWNfZnc7DQo+ICAJCXN0cnVjdCBpbnRlbF91
Y19mdyBodWNfZnc7DQo+IC0JCXN0cnVjdCBpOTE1X3ZtYV9jb3JlZHVtcCAqZ3VjX2xvZzsNCj4g
LQkJdTMyIHRpbWVzdGFtcDsNCj4gLQkJYm9vbCBpc19ndWNfY2FwdHVyZTsNCj4gKwkJc3RydWN0
IGd1Y19pbmZvIHsNCj4gKwkJCXN0cnVjdCBpbnRlbF9jdGJfY29yZWR1bXAgY3RiWzJdOw0KPiAr
CQkJc3RydWN0IGk5MTVfdm1hX2NvcmVkdW1wICp2bWFfY3RiOw0KPiArCQkJc3RydWN0IGk5MTVf
dm1hX2NvcmVkdW1wICp2bWFfbG9nOw0KPiArCQkJdTMyIHRpbWVzdGFtcDsNCj4gKwkJCXUxNiBs
YXN0X2ZlbmNlOw0KPiArCQkJYm9vbCBpc19ndWNfY2FwdHVyZTsNCj4gKwkJfSBndWM7DQo+ICAJ
fSAqdWM7DQo+ICANCj4gIAlzdHJ1Y3QgaW50ZWxfZ3RfY29yZWR1bXAgKm5leHQ7DQo+IC0tIA0K
PiAyLjM3LjENCj4gDQoNCg==
