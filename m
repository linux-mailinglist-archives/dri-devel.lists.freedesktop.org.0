Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438836A1244
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 22:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5612B10E31E;
	Thu, 23 Feb 2023 21:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B2310E2ED;
 Thu, 23 Feb 2023 21:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677188889; x=1708724889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jJFEIGRpJqqQudOSwtyTjgzfJ1OF8p+Z5bDKXE7i52c=;
 b=C2coeeSbhSdLx/v7c0j4kKo2UpixpWzAI0vsZlEGM40ePd6QqdcY8zUY
 gp+My1H4mYIiveNIoPPEnkU0SMc3U+90m65DyA01BPjw9cZgMgvR/8MxA
 G2fcO/YiLmoopwz3hezzKHI8jMGyQRqLV76g6hbCy79E725ikRNiJ5Rrd
 N89z4d3uA/z2v3FxWuFJj/NXduT5sDJs1c87B+P0as/da0Odtk5XlrwRw
 xSvVfDe2I3EY6BmAvtAWFLoztQB37xryw/On7VKw49o9jm2+cgt7ugRrL
 Ti+Wy6B+0y+d8tPO1ESlT2Qx7v/agop44kVD1a4cY2u0t9LW/4b4MGDAw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333339302"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="333339302"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 13:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="702951528"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="702951528"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 23 Feb 2023 13:48:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 13:48:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 13:48:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 13:48:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 13:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGgBeuarSeImdK8Tdo7s/G9DALKH9CTMxDYtGw3LLR3QBAQohQtVDz0y1HtRUQGGs/DOZUsqhwNSS5jA4VsTIGl0HlFzcz5z8kiAibl44fMwWROhBZbcaD3pQ8Lz564/wm2i0skLWq+4++6PHPEOHdv2E58VltjaVeVS7IPgNLdN79sDLozTZVHhWw32t0NPOj2g7z/FVFc2E2DBBCQMUOd/lZmvrZfn0wFBvZmc57LnEcKAcLc6/X7zFnacAj5rKugr6/WQfaqHIcb83i3kN2Qm0E3cxpz41NbQSzFpds3c4lIA/S910T6XF7XG+ioD1sJLZkv09GXIUiSB+2CbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJFEIGRpJqqQudOSwtyTjgzfJ1OF8p+Z5bDKXE7i52c=;
 b=Qqj5uVAmutmp2+XqI2SjlougyBn2GG5rDjFeJsfCZPnZj6p3YAPAVlGYOjf5yp5ftKDSiLhXjXfo4NgA4fNWCWc4XwepVKGGrpPGsty1jtE7kScbH8G1etll50pUgOGJZaLqJszAcfptfaIq3cptFLp+rL9c1iLjJjvIGPrM8q0J0H54AFx3goK6AFIBNZURd/79uF7Iq18BI9Vt8eWZzzfphYJ3mRK8qX7OxLviyOk4CWlpouA/ECuVxCoYx/TBPcGo/87JlwBgUkIJeQ9HJs9+oYXCfhzKiKg4j5R9WYonnjg1Vq3Mhd3dehKjpjRZtSTPM54+EJLdn76Fztfxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 21:48:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 21:48:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Topic: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Thread-Index: AQHZRwDbw0/xN5oKUE+UWvIDbhBX167dEvoA
Date: Thu, 23 Feb 2023 21:48:00 +0000
Message-ID: <d3cc0c080892df52d0a99471335e3135645a4aa7.camel@intel.com>
References: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB8015:EE_
x-ms-office365-filtering-correlation-id: c00e45d7-b3e2-47d7-e8af-08db15e7a22c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JAcU9aH7sqAciNu6dcwb+UhuvJuRK6YQEVXIlE0ZqqkXdc6cbDsSguHFRYXBcfMUdYAUiMK+JExBc9cSgDw5EFHmLJN5Vn5llTr+gJJ6SWZwTFPoRBg6IPLTcEfqSBx5Yf7v4Ba7Zwu80ypTdPLVssc0SEozDwXetM9WspM+SqxX1e67IbGN9EkJwRd2KDSuwXqk+8zFWS7uUrkkG5stvi4D1UNe8WF6aYE4MuTBwrdrJIlElK1CBJ11Ht4eGDrhmAhZgyYYOljzmTzvSLrVPs8to5s5AaUiQyvkYXn37PzqLLvWr+XX+liCB6to5RerFVl4lF2aLQLTDpdXit8DhxrftAjvxDr74YQrcEz8FIaw/uL8h9UNpRZ8cdhtcsbxLkAseZrQIjjIVR+noY0K5fId1C2Vge8ZgswSglt78JMcd9/QBmhqcNp7DvMcpuHcljVIlK/Tr8cFTDJL1T1w6CfGVhNVDzpE38HBtGHtve1TrUyJf1Vja66VrzS4lqrq0cf2zJHZfMPiLiyAoBfGTv1c4X4s/fa+ymvl3oD70w7n1uFQum9qDtsAzmLClpNVIGyCQaLHjs4t6u9BJZwXkvl6fbuzY+7aQvOq1wcuryj8hm8zseXHmJ8u4tC3zQBVccQ+pKPtup+xyF1mTdp5VY9yvRCiCEz+FspNxXxoRBnKvII9gE2aSa7v5ZmxV9GBWupBD5wgsI+xQoVCa9lE0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(8936002)(83380400001)(5660300002)(478600001)(38100700002)(6486002)(82960400001)(76116006)(86362001)(122000001)(54906003)(66946007)(8676002)(41300700001)(316002)(64756008)(91956017)(66556008)(66446008)(66476007)(4326008)(186003)(71200400001)(2616005)(26005)(36756003)(6506007)(38070700005)(6512007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGxtallhMHJXRWI0bUJXLytNc3R1Y0ZjY1EzdzFmenU3UmMzSy85VmhpOUoz?=
 =?utf-8?B?aXR2RXl3ZmExK0ZibzBRd1ZwZEt0WWdvM1ozeVNiYjdCVzdHOWYxSGF6VzRZ?=
 =?utf-8?B?b0k1YnhPMy9GTEtNRzd2b0RrQWpqRjZGRUxwMGZSam9SNXZHUmJDRm9ObHA4?=
 =?utf-8?B?UnZ6LzR6RklaNFhYR2hZOVhxdzZEdzJsK3I1RmdoWnlWNkx3cDFCUXJvYWRC?=
 =?utf-8?B?QlBWemg1LzJ0M2JQbUFRd28wamFFUkdWajVxSkVUWE84UzB4cXVxWlh4dUZh?=
 =?utf-8?B?S3RPbzFTWGVjL2U1akxuV0dnQUFDK3dLNXYxbFE5Vkw5YXY2ZklpamhoVE0x?=
 =?utf-8?B?OXV0dWtGdGZmMmEwSml6MWhZMG82RTJud2NNVXFUSkZvV0xDSGRleUp6bzZh?=
 =?utf-8?B?cHdsY054SGE3TUtlU05ITVFKM2tobXBzSmdEeWlaaWo2eXlMZ3JLcm83enNu?=
 =?utf-8?B?bTNqTmUvdjJSak84Y3VuRXlwcmdpemNaK0J0eVMyTms1a2plb1BOVkVOWlk1?=
 =?utf-8?B?K1FnV1dkQmhDU3VRRER6clpSV3ZxTzVEeFJobzA0M1FmclpzdWYyQzl6SlFI?=
 =?utf-8?B?S1NkSk9lb3kvcHpNM2VvTHFuNGdkYnpMb1Y5R1dqT2g2ZU41aU8xWGhwM3RS?=
 =?utf-8?B?SFAvVVRXcXh5VFZFSDg2aTZwZzBDQXNndUhRUXNqbFUwdFZzMGpvUUJrd25B?=
 =?utf-8?B?d1NuaWxGeHFwMTJFL2dTVFNKVXoyU3F1NldjWW5wMDlNQW9QSkpnVkxIK3Nj?=
 =?utf-8?B?ZzlpMFNENnRTSE95ZDFzWWgranowUGtyYklzUWlnUU03KzVzWEJBbXVvaytU?=
 =?utf-8?B?Q21HN1RsNHRydjR3RWdReVNXdUpjRnhSbm1LNkk3V3p0L2p4eWlDY25LVW9V?=
 =?utf-8?B?S1ZlajZnNmpYTlZmeExMZFVwRS9CbDhCZlEvZllUeUZRZGJTWmp4VndRVDNs?=
 =?utf-8?B?RHZBeVdqYVdIa2xpYlUxVEdFb3dCMGFHbVpCeko1YjJybXg1SGhaVVhXdzJF?=
 =?utf-8?B?bWUwL3hNWkZJeDlFdE51VHp4ZXNTa1FrU2dVV1Rjb2djNUdQNmFjeGV0ZnJj?=
 =?utf-8?B?U1REZXVQMjAvcC9wb0I4aEl0MFBmZmlpalZEZ0kwSE1Ra0VZM1g2NnZPOHd5?=
 =?utf-8?B?d1pNYmpnOWJBb29TZlcyVDRNZmJKa05Jc21xTmNVRmdmWERrblhwYk1jYmpx?=
 =?utf-8?B?dlJEUGFRSmk5bTdvRU9uSkx4ZnkxdFZtQTFNY2RmVzZaVE0zZHM3b3gvUHUr?=
 =?utf-8?B?VWtQNStNMlhBWUdKQ0hVVExib2hmaTlCbkNDaWw0RmpqVW40M2MxSDRsQ2xk?=
 =?utf-8?B?Q1Z3ZVI2RWJqTys0NTFBbi9JN3FvUXlOVXNkWHVHSWEwMFhZZC8vNzl1Vldp?=
 =?utf-8?B?ZlJtQWtiS3pkdkZzdEw3VC9FR0YveHZQcVMyWWJqUnJ6NlYrU1lLblZLVEJH?=
 =?utf-8?B?cUFkMERaemRvcUNhQjFtdmpnYmoybDBOOEczeU1vM1RaSHh2MCttbTlUMjFK?=
 =?utf-8?B?ZGtQMGs1cHJEV1RHMlBWN09hQVNxbkhFNUlKaWpQdGZkQkRMbDQ1Zm5uWmNn?=
 =?utf-8?B?MEhZc2p5M3d4VUZNOFpENUw2U0NWZVFpZ3lUQ29IeFhGMjErekkxQnhWekdy?=
 =?utf-8?B?WWp6Q3ZLSGVWQXh4dXJNYjJwcGMwcCtUSGdBbU4wR2pXN0IrNHYwL0JaS2dv?=
 =?utf-8?B?dkFlWFNoY0tLQUtrU0tTcVFQdnRPR1lNcjBHVWhFNVd1bldidjBFSUVuWGs0?=
 =?utf-8?B?MEU0QWJrYlhxbjc2Ujltb2J5MmtieHd5b05jcUlvWkpmdXExQy8rTDBBNklo?=
 =?utf-8?B?WXIxMDNuWmJGd0hGUEoyU05OM3pxR1lHWDJxRnNjWWZPbTNHdVJKaS9IVHd2?=
 =?utf-8?B?TEUvVG82YmNnUzE2eGFkdzQzM1dZSWpyWHVxdUllamtUYzc3am1rMUZac0Fk?=
 =?utf-8?B?M0haTm85UDhySCtPSE1iNHBwbjlvQjJHNWhHZjRhajBnWUVVMzN1OEtiemVY?=
 =?utf-8?B?R1YycHRPcWZ3bEl1L2JWUEh4WisrbHoxZkhORkpvTks2ZklSOENWb3BNbStO?=
 =?utf-8?B?eVFzaGVSVitBQzVuQ292U1IrcG9hTDZIUS9QV0pheE9jTUc2cXVmeHNuUmt3?=
 =?utf-8?B?RzIwUm9NTjBpZzNGaXR3YnR6WWRkbGwvajN0eG9lR1h1VW5rdHlvOEtkT2cy?=
 =?utf-8?Q?rn3JTrM3ThmDmtCEZ4Wv+glG01jtTJ3M+8rFcsmeU8m6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5E5FC22382FEC45914B8DAF6DEDD673@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00e45d7-b3e2-47d7-e8af-08db15e7a22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 21:48:00.5224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uaQCt79Z8bFKtA3GHr8QPylRwc8OJcJnSLZR7bOY6oxTTYvYOXnSnnZ0XnC+zVeEzPZCRNBuu78yXrAQg1igBQ27t9GVslOOERmVE5W8v+wzr5BXCWSyCtq6j3JkD3Bu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAyLTIyIGF0IDEzOjAxIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBUaGUgRHJpdmVyLUZMUiBmbG93IG1heSBpbmFkdmVydGVudGx5IGV4aXQg
ZWFybHkgYmVmb3JlIHRoZSBmdWxsDQo+IGNvbXBsZXRpb24gb2YgdGhlIHJlLWluaXQgb2YgdGhl
IGludGVybmFsIEhXIHN0YXRlIGlmIHdlIG9ubHkgcG9sbA0KPiBHVV9ERUJVRyBCaXQzMSAocG9s
bGluZyBmb3IgaXQgdG8gdG9nZ2xlIGZyb20gMCAtPiAxKS4gSW5zdGVhZA0KPiB3ZSBuZWVkIGEg
dHdvLXN0ZXAgY29tcGxldGlvbiB3YWl0LWZvci1jb21wbGV0aW9uIGZsb3cgdGhhdCBhbHNvDQo+
IGludm9sdmVzIEdVX0NOVEwuIFNlZSB0aGUgcGF0Y2ggYW5kIG5ldyBjb2RlIGNvbW1lbnRzIGZv
ciBkZXRhaWwuDQo+IFRoaXMgaXMgbmV3IGRpcmVjdGlvbiBmcm9tIEhXIGFyY2hpdGVjdHVyZSBm
b2xrcy4NCj4gDQo+ICAgIHYyOiAtIEFkZCBlcnJvciBtZXNzYWdlIGZvciB0aGUgdGVhcmRvd24g
dGltZW91dCAoQW5zaHVtYW4pDQo+ICAgICAgICAtIERvbid0IGR1cGxpY2F0ZSBjb2RlIGluIGNv
bW1lbnRzIChKYW5pKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJl
dmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IEZpeGVzOiA1YTQ0ZmNkNzM0OTggKCJkcm0v
aTkxNS9nc2M6IERvIGEgZHJpdmVyLUZMUiBvbiB1bmxvYWQgaWYgR1NDIHdhcyBsb2FkZWQiKQ0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jIHwgMTMgKysrKysr
KysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jDQo+IGluZGV4IGYwMThkYTdl
YmFhYy4uZjNjNDYzNTJkYjg5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF91bmNvcmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUu
Yw0KPiBAQCAtMjc0OSwxNCArMjc0OSwyNSBAQCBzdGF0aWMgdm9pZCBkcml2ZXJfaW5pdGlhdGVk
X2ZscihzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUpDQo+ICAJLyogVHJpZ2dlciB0aGUgYWN0
dWFsIERyaXZlci1GTFIgKi8NCg0KU28gaSBnb3Qgb2ZmbGluZSBmZWVkYmFjayBmcm9tIERhbmll
bGUgZHVyaW5nIGludGVybmFsIHJldmlld3MgYmVmb3JlIHRoaXMgd2VudCB1cHN0cmVhbSB0aGF0
IGEgcnVudGltZS1wbQ0Kb3VnaHQgdG8gYmUgdGFrZW4sIGFsdGhvdWdoIG5vdCByZXF1aXJlZCBm
dW5jdGlvbmFsbHkgc3BlYWtpbmcgZHVyaW5nIHVubG9hZCwgc2hvdWxkIGJlIHRoZXJlDQpzbyB3
ZSBkb24ndCBnZXQgY29tcGxhaW5zIGZyb20gdW5jb3JlIHdoZW4gaGl0dGluZyB1cCB0aG9zZSBy
ZWdpc3RlcnMuIEknbGwgcmVjaGVjayB3aXRoIERhbmllbGUuDQoNCmFsYW46c25pcA0K
