Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34E6B14B0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DB310E72F;
	Wed,  8 Mar 2023 22:02:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B901B10E727;
 Wed,  8 Mar 2023 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678312951; x=1709848951;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qwe7/95EeViuFHuTqNPUefj8Tst0DyCU3yxf6WhzUpo=;
 b=NWstOs7+yYC1HTM/T1tFM5sIfaSICrRsJT9JK6NpzCBOFGmjGsYcJqRz
 bQ9AH2gXCmFlAFnwnhFbBDzCdFiVfysvd+Q4P57uHl1gRz7tTVt30kO0e
 jUnmAKFAQ3uDFOxI5VsMURwgVjExYtLwXCMcf07fVXeZC1UcuRk4M16f3
 h0CNiFbfLxmC1KLfsG66c8BG5Jqb1qZjZOKaSAWmYDypmqqLpbT3/9Grp
 SLWPj/QN2dHhDiD/X5sJ3iuTeF00cCWf7lzNlq+ZEmP5OuCy1/RwE5+8f
 a1QzMbugKgH8yO0n1DhQHx2BAaBf07XOZLMLrn9xU2mz9wWMpkkBJ/Xsn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398866799"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="398866799"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766160347"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="766160347"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 14:02:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:02:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:02:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:02:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:02:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnGfEMEpxUnV6lntQhQQ03C8BRWTb6BL0xCuZj94zBFayp+hf+bnOKl5PT7rzwU1L/85qAsqCdpPCPi2EQpY56CRZ3dI+kSbcRbnQ50BVlb3a/KK+ojoSL3B33eSdAfs2rEEIY99h3/l/qz2eHnNJb/SCKx9MSsPi9eFKD4VoBXEI9qytWRiBlQ19hIfCb7BB54fKLyMP330qo74r6Hnoo0R9lUNkAazkWHHmzxbQVCZ4/fVSA0B4yPoTuepgMbB3wTOICFpqbL+6QnaWp4WoQehyTVhlLvbzs986UrBY3h3aDOf9+RaYgO4/AGfSscOf9gVXdIujH1m5RkunIG4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwe7/95EeViuFHuTqNPUefj8Tst0DyCU3yxf6WhzUpo=;
 b=QJd4l2ZeXawQfEZQlAkLDmj9qkfLouUNLUeM4rX03QwjM4+KH6Rqi0PWj29a5iB+3ub3m85Vz8enttynzrjokChUg8MUzeQT635A63J/jCkzuYBmcYqMSF/8sQ/fXRV82GjK4v03MlBza9Cb6gA4owRzGAbg9jFEaHZCOmOgiSZdzFepqdBh6HhfV6qdInH4ASheeHr2iEBaqmGcpctSHPspVxG+YQ4g4iqbQLggt3hxFhkq2ujSA1PyclTJtY1d6rXAaVu0UOeH8jX3RcZ7oFsKZ/IA35toEtiYtgXpPDn8txool9L2xzwgPG1McaCwcMtLxKVWagjWg4GGs/Nm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 22:02:10 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 22:02:10 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915: Include timeline seqno in
 error capture
Thread-Topic: [Intel-gfx] [PATCH v2 3/3] drm/i915: Include timeline seqno in
 error capture
Thread-Index: AQHZQncoyh4enMl0U0WHnLLiPwChYq7xjlIA
Date: Wed, 8 Mar 2023 22:02:10 +0000
Message-ID: <17fafaaa53a716a001d4b9de5e2de827a354b0f9.camel@intel.com>
References: <20230217022420.2664116-1-John.C.Harrison@Intel.com>
 <20230217022420.2664116-4-John.C.Harrison@Intel.com>
In-Reply-To: <20230217022420.2664116-4-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5067:EE_
x-ms-office365-filtering-correlation-id: 2c8c3c3e-cfd1-4a21-2ad4-08db2020c43d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9fzSuG3dXjeJgzA158DUTVFQgQmalqb185GrVcuXGF3U3AL72uG6pPq3tGjkEiWZHRWJ7ct6wa4z9e3pExfBHMsu/SoxrqjLxU7f9wSCzodU/cDic1EJxj9zTYAphJOsIJqEsnTQgF7POD8freqWqNvjOxCyktuU+W8h7il7hrH6O1/FmIGofjHjK1W7iZxOKkI6MHJi9bf0dW2TxJ/m57y9FvSrcliJO7smwbYkf/Qk6PNRROLTc/n4mUI/ilwZvgyR+E7S4SOYyxPQPWKhT2JpA6W0KpBEpkoRzg+dyXRXku4v2bFE/QTTt9tiV17b3PaXuH3tE2eHeEV9hNi2aNGNjsLT4IF176ObgHkFqBoDqkQXmeioFWV5PGQPuulUi+NmozxA+OAVIpdb58wNbxTBiGX+sy0oIA6lZjEwSMOjKXB8vbWgVpWs/TRxMJ+jTZTG1tw+o+GGb9DCZgj+j9k8kow22BIsnd0lTOokjCsHn3R4Y1sCbs48nJNVvVrLIapwZOz48wmEt+m4z2mH7sZI29h/T5nPdpDczoce5vJ7UVJ2rnL6hDqmEFFCKl4Z2QiuAiqr5SaVG75c34kl30z3S+yFW0xiy61elIbc+1nxQ45cqLaCjYq/8Q6AQQ1g2Ru++DOjVoBqM3AB2pzk1gF39NuM97Ky5FXGLBxQ6Np3oy8vdLSv7dqia18yENjYbuME17imzb/RKDchEoLO1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199018)(38070700005)(2616005)(36756003)(316002)(450100002)(478600001)(110136005)(41300700001)(66946007)(76116006)(64756008)(8676002)(4326008)(91956017)(66476007)(66556008)(66446008)(26005)(6486002)(86362001)(6506007)(6512007)(71200400001)(82960400001)(38100700002)(122000001)(4744005)(8936002)(5660300002)(186003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzhlUlloV0kyOXZRWVIwSDdFZ2FqbkZlNm5vMFFrZU56S2RldE9qdmxBblhh?=
 =?utf-8?B?SEdvVnJlc3gvd1NkNllEUmRoV01LTVJoQzdLU2dPc1BsYUtFOFl4ejJ3SklQ?=
 =?utf-8?B?OXdVRUtELzZqb29nSXJTTWhDUzBOTFZOc1RuTzFMUkRXN1FFU1FkeExlU0h1?=
 =?utf-8?B?OEM0MEcvZjExVHBMSnBwQWUxbTdXS0dUTXlwNWtzVUZ1ZHFPTXptM3BPdXZl?=
 =?utf-8?B?djhVdldSQ2lXa2IwZDM5WlY0czVQZUZLU0h6citsUHA2cC9hK0FuTFhLQlNu?=
 =?utf-8?B?b0RuNkEwUEw3b2ZuOHpvRklVdGtFSXRkbDltTXJWU0tGSmRHQ2JINlNhNEpY?=
 =?utf-8?B?NUtQbDc0SGFJWno5eUd5cVJPWXNrTHI2aS9Xd0FZRkpCazBHRUhlMThXc21V?=
 =?utf-8?B?UzE5TysrNFlINnJpUDV1a3FhdFFpZVgyNnIzdGlnWFlYaHN4S3pDYVoxTno4?=
 =?utf-8?B?MW1SdzJxTjcrWS8wMy9rdmdvcjI4ODhJblRFYmw4QVJVTzJaOE1lUzdwS1hn?=
 =?utf-8?B?Ky9YclQxc3FwMlBQd3lRN2lORXdvMnJQUm5pTzNuRGUyazUxeEtHSjdmWlI4?=
 =?utf-8?B?NmdrWStmbXZXTGJyNGlINXA4SnlxNmtwRWpuc0hYQ21lZEZsQUtKSE93K1Ar?=
 =?utf-8?B?aE9DLzVpM0ZDR3YvLzRCOFFrc2JnZjhYQ3poNTIyVHQwQS9Bcis2NFZzaWFN?=
 =?utf-8?B?RjJiekgvbjFYcktRUGprMHV3V3ZtSHV4VWY2dXJBV3N4VnMrM0dkeWgzdmVY?=
 =?utf-8?B?ckxSUThydk9ESmkyb0x6TSt5N0ZBeHRJdzQ0VjlUdGErVVgrRko0K1pxRTBX?=
 =?utf-8?B?azF6ZzFCbWIyNWpmbXdTRzVLVHZtZ3pYOHZEUStCRDhPRTVLNWdZYXdvMk5l?=
 =?utf-8?B?MHlZT2dsRzMwTk9abTZ2NnQ2ZFhSWkwyNGFsNTBqMXcvOEpaR1lJSGdMM3Iz?=
 =?utf-8?B?dlFWQmR6MSs2ZEp4MmFKcUVDcytOK3JQZ25YeWo1SDRscTNSdVZ3WlRNeTQ3?=
 =?utf-8?B?ZURPMlJOTnA5R2liVmFJelQyM0JuRTYxTU9KN3VRWU1rYTFnSGtiVDZLMHdD?=
 =?utf-8?B?cDlIdDg0aE9QSDVjbGlUNSt5YkhONEc3aFR4RlYxYmhqKy9PVERTc05ZUW5U?=
 =?utf-8?B?S3Vqa0pMZXNWRC9pbndiSGRuSXYyMWtNeFFuZlNWY3pNbDdhQ0laVEEwNVFX?=
 =?utf-8?B?MjZYcVVSTmI2SmprZnVuQXRoMWdTWUJycllqRSs1bWFnY0g2cDYyc2xhZzVB?=
 =?utf-8?B?WUtxUC9NWU9taWdSdXFwYUpNS3VDc3loMXNJYnBJSzlYeWljSWZJNURxNC9R?=
 =?utf-8?B?aFlnaUZKT2NYMVBhNnl3NEM5KzhNek56YXo4OW9tODlnMTlPMUw2VE00bTkw?=
 =?utf-8?B?NlRQcFRoYlFQUW9md2tRbGVYSlBTUjVKQkw2THFob1dnMjBBaGk1OHgxbUt1?=
 =?utf-8?B?UWhXN1RlanJoT1E4NDdHbmpvK0tXbHFlNWQ4VXluU0d1cVV3VUduUGxnbGFP?=
 =?utf-8?B?VGVlU0xHZU9kZXJ0bGNRWjdpNWpBQUtiWnBsR3ZydmlIU2JSb0FodnFWRVI1?=
 =?utf-8?B?Yjc0bmlKVmtjelpONjNleldGbXZXQ2xOeFdsR3ZYd0ZFQlc4aWZvSDh5WWRk?=
 =?utf-8?B?ZzNZdVdaenovUXNWdDFJQWhYTEhteUs0L1ZyY0xqdDJrNVpZM0x1b2xVenFD?=
 =?utf-8?B?NTJiWDd1MGNtV01NWm1iZ1MvSnpRSWoxcUpucGJOajFyODU2UnpWOHJqRTU1?=
 =?utf-8?B?NDIwZWFGcWl0dms0WCtNTWdRMzNLMVhoTWxHdkMvZ2FjYWFSV0xsMXlsNlRX?=
 =?utf-8?B?aGdXVzNqRm9CRytObjdtRkRqZ0xNSWFrL3AxcjZxQkk3SWxHVnNSQ3NiMmV4?=
 =?utf-8?B?MC8zVnFqUk9jdVdIUGRUOGx0Z2RldTlmVUtzMjhFT3ZKYWtpOHZvOENxQUs2?=
 =?utf-8?B?RFhHRVVNMmZUdzQ3YlVNdm9NWjJhOFM0NUFMelR3RFQ1NGpWVm5kVEF3YzZl?=
 =?utf-8?B?c0o0Z3lTcm54US9hWG5YdWNveDN3Y0pJMzU4bDhwcjFrVmZQd25ZTHQvUlJq?=
 =?utf-8?B?N3RkSldCN2g5UzRJN3BrU0JQS0FsbElOYkpjR1ZES0lZUHBQeGJyOUMrTkt0?=
 =?utf-8?B?amcvVjhKRUw0Y0M4amRhTklVUnFTMHBOQ25WTVc5Mzc2bkZYWjN5TkNuWDJ0?=
 =?utf-8?Q?gdpyeS0G3jiymXuPdoPE06k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFC1BF2E8E627D4BB6E28A2F364DE7C3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8c3c3e-cfd1-4a21-2ad4-08db2020c43d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 22:02:10.5817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8TAq0rU5vbubh4zrKw74ey598RyiZou9dq13ARSCVlEHOp6JOeal1omjJyvs9tYOT7o9VVc6EZ6DWU0pEude1Kt7sqMKxrmx/+Goq4wZF718CYJtA9EdMWr4UBE3FT0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
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

T24gVGh1LCAyMDIzLTAyLTE2IGF0IDE4OjI0IC0wODAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlIHNlcW5vIHZhbHVlIGFjdHVhbGx5IHdyaXR0ZW4gb3V0IHRvIG1lbW9y
eSBpcyBubyBsb25nZXIgaW4gdGhlDQo+IHJlZ3VsYXIgSFdTUC4gSW5zdGVhZCwgaXQgaXMgbm93
IGluIGl0cyBvd24gcHJpdmF0ZSB0aW1lbGluZSBidWZmZXIuDQo+IFRodXMsIGl0IGlzIG5vIGxv
bmdlciB2aXNpYmxlIGluIGFuIGVycm9yIGNhcHR1cmUuIFNvLCBleHBsaWNpdGx5IHJlYWQNCj4g
dGhlIHZhbHVlIGFuZCBpbmNsdWRlIHRoYXQgaW4gdGhlIGNhcHR1cmUuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KYWxhbjog
c25pcC4NCg0Kc2ltcGxlIG9uZSAuLi4gTEdUTQ0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxh
bGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
