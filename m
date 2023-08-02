Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D171976DBD8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 01:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1006D10E155;
	Wed,  2 Aug 2023 23:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2CE10E155;
 Wed,  2 Aug 2023 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691020340; x=1722556340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jtltX1bwJtr+jl9hkr/TvBkAaoyKmUFi2XeowQgHOZo=;
 b=UlFjc1iVWHXYF0bZ3sjLkA6tMSH/G0d4mohBtBDjo+oXHNwW+5VDW/Bh
 NF1etO2rHv0UFHAMyJimYlTDN81/1+f8QQVO23qoe6pYkSzM/h6p8Yl9F
 ph/8+x0CdrSUTXV8gMD4eNbPh3ibJZwgMI3yxSfKfkCH0+FEiM3lbKwRE
 0hgC3jvoDZyCKKVvQjrLqu6mILp2h9TlZTnrwLqR/JfwPemCwaahPx+vb
 y+LnT6BPblpR2TAFNMbPB1q7kJutC0onx+Q0XUySuB283iouZvVAAicBU
 x5o25hjRlAlni9oKaYJ4kqiuR+ALWYcQkJE3mXiZADfNEW1HzNpGCe1lz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436043817"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="436043817"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:52:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794785805"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="794785805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 16:52:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 16:52:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 16:52:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 16:52:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 16:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbhpJPzZ5pBE+GraLcHx/1u69WbZErCjFD5fTjvhbnQhtvziVLXWyNcXggg25In3PPB6ZxlhArJEP/ColUsKU2vvHmKUK3DQlM3jgyNk2GWE5VcXXbPcZB+y9Q9cEQbAlGBoGUMpMwzauDM+2UXY33dXW9Dk2v0tOeJe2Aqe0/WIC+PCPVVqDcphBnEejZjXwMjyTCfy5B8H3G6Pwasduy8fj/u6MQM82IgEiZILyGMFJjE0SGOFI8yZCTs9d/5tio/jajsfCgh3AaqwgXHfkYfyYeYdeEEpskJckcSkr7TUYlwSqgoob+VCoLb1CMU4kL37q4NoV6TdprFSIQQB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtltX1bwJtr+jl9hkr/TvBkAaoyKmUFi2XeowQgHOZo=;
 b=UifJvWqdQWFC59YdVqWdJgayZ7l9Ixl4pzq9B44gt1HvVy8qhXJlV3eL6Ns8RpJnAncs6dTjZpOFLguSzc1Zjq4hBQ4E2sY+ScV/CUBLcOG/iMnl9t77fPkQdY+KYXxXA+0xU0TrWVcG+mJRwSLgXUuIjMF+hizdwB/W8Yf61wG1TtOJS2AbxxDPZGkku0KshId6qi6i1OJ1/Mtqr+fYalcEJe46RBQssjEP5PnTio45XDiWeu7dMSKE8QKDLIPOR3n2YFxJ4GCvsQecfahg815dQuc8HAy+AoVqA6iJR/hOXb84ULycldHKH0UhlAFNvWTcn1b1KkmLURC5xh1r9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47; Wed, 2 Aug 2023 23:52:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6631.046; Wed, 2 Aug 2023
 23:52:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Thread-Topic: [PATCH v1 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Thread-Index: AQHZxZn6+o1z+rNsp0G6IV6sx7gxgK/XrYaA
Date: Wed, 2 Aug 2023 23:52:16 +0000
Message-ID: <b100ecc491f5f4ec3eb928b976e966c074c60cbe.camel@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7171:EE_
x-ms-office365-filtering-correlation-id: 938ccc01-5db9-4656-6c84-08db93b380a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s8PPPhFJXqqlBPlf4OdiGBE/b5gNpix/yTo8lEFxKIrYHVe6WXrsXZn0XUGPbtpIdgrhNZ0wPchW1rrI1w3oiKTnV5XQ+OC6W8vl40G9/wghkeAFLRDED/fMND0ELyNnaCOBmQM/gKb2NiMrV1/zpnr97uhxNnWMlo90K5tJ3GcZa7SCpIjmHM0RGUAi7TDurkAPznNOFTkgsk78lV/dvSaJwuaSKqydKTjT7WDf96pSDsaZWef8qpK+9JRXrTy66/wveSs9FzxIWC2xUzlouWv59dnSP+UJjPDkHh/03m48n/ACAPKkxDGw17HGTKGV2Cs8Kwd43t1E0d9Dmto7pcbqYodqJQeKVILtz2bFuB115ZXK6r885YQ22Qv5GWIvDLlL6bdrsb2Ae99WE04JDkmgbm1MuP5yMnlX3o8leFaWXe+1+7qQ8izEaNre+wEKdd7CpUFWxpcnEay9EuVPDWcLeEl3M4KmgpFcXgOgldI5rBK10RavL+7bZQdPixZLzlDf2hVzYQDyPsQq0f5R3cOC5utB/osNP6lE8xZ2yCpBMFf8eobFDglewd4R4olFd/N9Y5k9N1ILMljthkeLH1oBj6hkoaBanRqmx4z9xasraa81YSOlbnuvPDOrzU6y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(2616005)(107886003)(6506007)(83380400001)(26005)(186003)(316002)(76116006)(2906002)(91956017)(66946007)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(5660300002)(41300700001)(15650500001)(8676002)(8936002)(450100002)(6486002)(71200400001)(6512007)(478600001)(54906003)(38100700002)(82960400001)(122000001)(36756003)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWtvcm9ubTQ0MFFDTld1bml0VE5qN2M3WVkrcG54MXlsZXRSd2paSG5Zd0VG?=
 =?utf-8?B?SWJ1QlBuZHg1V3hXc09rR0drM0piM281UjlSS0tOTTRLNzFDTlBxMnRRVG1o?=
 =?utf-8?B?ZndmQTdDWUhnK1ZpK2d1eUNtRkhsd2QwWGRPWi9tbDhiODA5N1piR3g3L0hk?=
 =?utf-8?B?QkNrZXIvNE1mQmRjSll6YnNLVTIvejgzekhMalhqNnlVdWdnd0JYN0xibXdQ?=
 =?utf-8?B?RkM3YTFNY20zVDJ3OE9ua3FTNFBKZnAxOUdXb21ST0c4aCt0MUdVTVlmbzVD?=
 =?utf-8?B?TXI2Sm5yZGYrS3NZdUR3dmNFaTVjTXIwcEZjTG1jZFRHSlB2UGlEWHUwbWpo?=
 =?utf-8?B?VjNoeTR6blQwZy9TbHNkV0NDejllSytGU2RNRkhuNXFzbUFjNTY2Qm1rckVO?=
 =?utf-8?B?ZUlYc0xJVStnRW5UaGJTcmR1Y2szYlUvZVVrbTBRaitpcG9WT2t0RTZ1VUpk?=
 =?utf-8?B?UUVXQXl4U1daQXE4WVVUbjhEbkh1empmdkNycWN3emdBK3NKYjhnWDhpTjdt?=
 =?utf-8?B?Ni8xSmdQSUJwZ2JJL3Z4d0R0WUVnczc5RDk1elhoQXpxMGxBUUJ2di9nOGtZ?=
 =?utf-8?B?NTk0eldMaUF3YVp3NXJVV1BmMWVXWUlIMUFpQjhoWmFpS29SeTFjY0dtaUM3?=
 =?utf-8?B?NW5ESnYvR1d6ZUxCNmdMK1BGcDl6SGVPU1FLMWFQWWsxc0k2TlpzREo5cElX?=
 =?utf-8?B?MFJ0MVhJWWM1QzluM2FaVklkSkhTWS9OVXUwaEVtREVka2E2eGFDVkJmaWdm?=
 =?utf-8?B?bi8wL29sZUdPTGkrWUdSRUN1WDZRMHJYMWNoR3F2WmZLc2N3Zy9FOEt4b0RD?=
 =?utf-8?B?QmkwWW1SVC9RSElSMXkxa0xkU3V3NkVXTlpPZkxyNUVHNFN2YXdtdnJOdXpy?=
 =?utf-8?B?OXlnend3UDZ6RGFHME5jV05qc1RGclhRQklHeC9nNFl1eTFsK1hieVJoOEtv?=
 =?utf-8?B?VzdnRTZhdml4VTVlMi9oOVVMRkRjWk1ZN1RzVEpmVGdaWndFYkREM0tScWZ2?=
 =?utf-8?B?WTVQcjJUUS9tZUxObTNxdW05WXFaUE03Wk80RDJRTkIyZmFoU0FDeDQxQTJr?=
 =?utf-8?B?SlZTOUxjeFBJaW1xOHpxYTg1U0dHaFVRNmdHdUY1MGNHdk9uTDhUSlpCNU0y?=
 =?utf-8?B?NmwrVGJFampVVWYrZGphZmREYUVmL1dOamtpT3VVSE4zd1ErNURGZnJSVUJ0?=
 =?utf-8?B?K3owNW1HejkvRUthc0tQaDdoSkwzYXU4OU1UcitFMUF4RlBSM0dUVkNZcE5z?=
 =?utf-8?B?aE4yN2RnZTNYNWVKU1lIamVxVllUOGVYbktDdVhDQVFZaUJJbS9PRjJKaDd2?=
 =?utf-8?B?c3FydmdFdWhDaHFHU0M0emcyMCs0a2hFK3hBN0dDOXpnUllaSDhKcStQd2Er?=
 =?utf-8?B?TzBnb0JoN21QYktYQWdhSEJqcW1xQUlNZkhDRy9FVVY3NUhBeFM1UWZWalFq?=
 =?utf-8?B?RWorRGF5OEU1QUpiV0YxVFdJSGdoWWVaSitBTjRCb0lmVUlxWXJKcXUzRENn?=
 =?utf-8?B?SytOR2VYQmh1WFF2K0l2aE5ma2dyNEZ6Zk5IRjFwTE5ib2xqZEVlNWxLMDlS?=
 =?utf-8?B?UXhYbEhrY0JCT2IzZURwNm1zenpFOEs1N3lzZks1QTZxeXZuODFyOUIvN3Ns?=
 =?utf-8?B?QzNOWDRUQjNGditYZUpkTEV3czh1Q1dKUnFiOTVZbEhlVVBEQmFWUFdQMG1z?=
 =?utf-8?B?L2tKODdINUZ1UStKSVJZcFFvTHQ3UFlITys5WmhSQzl5Yzd2WVFGVTNIdFcr?=
 =?utf-8?B?RGZ2MWVQZVZGWDFWcGhMcTArUWh0Y0dKNDdTVE9MU2ZNeFhqQWZISzVMTWxV?=
 =?utf-8?B?d1V3T0lvMDAyMVI1bEU0eW5ISy9PUWNDTnFxcHF3UkJyL0tLNkhkQVVYVVNq?=
 =?utf-8?B?b05YRlNtOFVPZkpSMXhmb25GSzJvWjdPTGZ5NzNOUnMyeGFqb0lqVmM1Q2ZI?=
 =?utf-8?B?cUJNMWt5dHpnSWJmRlpaTlAvUVhucyt6KzA2ZGNLQnlDUmQwdmkvY0JrL3Fi?=
 =?utf-8?B?ZlNlSm9haUdqdUNvNWNzWG83d2VFWUdzUzJUT05IaTRTMmxNVWhqdmVDS3lP?=
 =?utf-8?B?S044bTJkY3g1T2JvTmlqRmhLRUt1MkYxOENYZUtYc0JCMFpNQm5HRjNBQlRC?=
 =?utf-8?B?NElKN0xwQU52T2dnMjl0S3VxSFpNWjlEcnV2Slc2dDNrQ3hWQ1NHamJudVF6?=
 =?utf-8?Q?LN5rxIftTMhgNqEj3DzGZLU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3C371881FC51640A41F2702538F8C30@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938ccc01-5db9-4656-6c84-08db93b380a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 23:52:16.9353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jiK47otgBIPOvy/qyycPrRckEdDrorkTKxJwQpZsqUX41XJMNIL/betSedraHwncuad3YxdtVyRtdbhQha/99oyfkKzjJdiwjKhZg7mUK6hcnqC6pS0pL6hdqRa7rxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDE2OjM0IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBUaGlzIHNlcmllcyBpcyB0aGUgcmVzdWx0IG9mIGRlYnVnZ2luZyBpc3N1
ZXMgcm9vdCBjYXVzZWQgdG8NCj4gcmFjZXMgYmV0d2VlbiB0aGUgR3VDJ3MgZGVzdHJveWVkX3dv
cmtlcl9mdW5jIGJlaW5nIHRyaWdnZXJlZCB2cw0KPiByZXBlYXRpbmcgc3VzcGVuZC1yZXN1bWUg
Y3ljbGVzIHdpdGggY29uY3VycmVudCBkZWxheWVkDQo+IGZlbmNlIHNpZ25hbHMgZm9yIGVuZ2lu
ZS1mcmVlaW5nLg0KPiANCj4gVGhlIHJlcHJvZHVjdGlvbiBzdGVwcyByZXF1aXJlIHRoYXQgYW4g
YXBwIGlzIGNyZWF0ZWQgcmlnaHQgYmVmb3JlDQo+IHRoZSBzdGFydCBvZiB0aGUgc3VzcGVuZCBj
eWNsZSB3aGVyZSBpdCBjcmVhdGVzIGEgbmV3IGdlbQ0KPiBjb250ZXh0IGFuZCBzdWJtaXRzIGEg
dGlueSB3b3JrbG9hZCB0aGF0IHdvdWxkIGNvbXBsZXRlIGluIHRoZQ0KPiBtaWRkbGUgb2YgdGhl
IHN1c3BlbmQgY3ljbGUuIEhvd2V2ZXIgdGhpcyBhcHAgdXNlcyBkbWEtYnVmZmVyDQo+IHNoYXJp
bmcgb3IgZG1hLWZlbmNlIHdpdGggbm9uLUdQVSBvYmplY3RzIG9yIHNpZ25hbHMgdGhhdA0KPiBl
dmVudHVhbGx5IHRyaWdnZXJzIGEgRkVOQ0VfRlJFRSB2aWFfX2k5MTVfc3dfZmVuY2Vfbm90aWZ5
IHRoYXQNCj4gY29ubmVjdHMgdG8gZW5naW5lc19ub3RpZnkgLT4gZnJlZV9lbmdpbmVzX3JjdSAt
Pg0KPiBpbnRlbF9jb250ZXh0X3B1dCAtPiBrcmVmX3B1dCgmY2UtPnJlZi4uKSB0aGF0IHF1ZXVl
cyB0aGUNCj4gd29ya2VyIGFmdGVyIHRoZSBHdUNzIENUQiBoYXMgYmVlbiBkaXNhYmxlZCAoaS5l
LiBhZnRlcg0KPiBpOTE1LWdlbSdzIHN1c3BlbmQtbGF0ZSBmbG93cykuDQo+IA0KQXMgYW4gRllJ
IC0gaW4gb2ZmbGluZSBjb252ZXJzYXRpb25zIHdpdGggSm9obiBhbmQgRGFuaWVsZSwgd2UgaGF2
ZSBhZ3JlZWQNCnRoYXQgYXQgbGVhc3QgdGhlIGZpcnN0IHR3byBvZiB0aGUgcGF0Y2hlcyBpbiB0
aGlzIGFyZSBuZWNlc3NhcnkgaW1wcm92ZW1lbnRzDQpidXQgdGhlIGxhc3QgcGF0Y2ggbWF5IHJl
bWFpbiBvcGVuIGFzIGZ1cnRoZXIgb2ZmbGluZSBkZWJ1ZyBpcyBjb250aW51aW5nDQp0byBwaW4g
ZG93biB0aGUgc3JjIG9mIHRoZSBhYm92ZSBmZW5jZS1zaWduYWwtZmxvdy4gRm9yIG5vdyB3ZSBh
cmUgaG9waW5nDQp0byBwcm9jZWVkIHdpdGggcmV2aWV3aW5nIHRoZSBmaXJzdCB0d28gcGF0Y2hl
cyBhbmQgb25seSBsb29rIGludG8gdGhlIDNyZA0KcGF0Y2ggaWYgdGhlcmUgYXJlIHN5c3RlbSBs
ZXZlbCBmZW5jZSBzaWduYWxsaW5nIHRoYXQgdHJ1bHkgY2FuIHRyaWdnZXINCnRoaXMgYW5vbWFs
eSBvciBpZiBpdHMganVzdCBhIHN0cmFkZGxpbmcgcmVxdWVzdCBzb21ld2hlcmUgd2l0aGluIGk5
MTUNCnRoYXQgaGFzIGFwcGVhcmVkIG9yIGh1bmcgYXQgdGhlIHdyb25nIHRpbWUgd2hpY2ggbmVl
ZHMgdG8gYmUgZml4ZWQuDQoNCmFsYW46c25pcA0K
