Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45E6EE80A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 21:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC14C10E462;
	Tue, 25 Apr 2023 19:09:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212F10E19C;
 Tue, 25 Apr 2023 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682449783; x=1713985783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kdpCo7Xikk+qj21M8VmvFYUwwRIjGa07+ixlUVIlbnU=;
 b=ngSAERwEIkth7V+9xNjLMjEOi2iRyZZxFWZnyiZk8nMzF+zKF0YJqk7b
 +uINYYRxFl4PgW6t9kFbANlsbNg9N0IOxmrUBSB7zhzwFT6vdiI1QkVc5
 fk01R3hgmv5cAzEGG2benUBKPyfeX9CyzSal2hIzERO3+9Cam8/2nGGFX
 rDzJR/5ythv6fkOjW8iau7cByFDEw1qqnNULKLR7quQM8Su3TlEulj9aX
 IK+M2CypbWlt+wtrYRNB71Zm0i1byHXJ3w33VdPzhWDNNV8CjVutSKzfJ
 Kr0wPz16sm+WCOY/Fs3iKSXrUkNN2WlhxKttIGUvIhsvd3Rs6VX5LlSp+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="346896432"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="346896432"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="762993052"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="762993052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 25 Apr 2023 12:05:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 12:05:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 12:05:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 12:05:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 12:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6HSQEnB9Ye/dRdTkj0fhN8l3U9O+IENln08T24E44o/DnYkccpqhA0hx6wpgpQJ28CzJUUlgmeG9g7HClhUK6HzcuRVUYe+AWgzjUZnrSEcKt8ktuR6hP/LEK+uIX0Sz+3jUYN4dxsFXikgynrVjYb9QpEj21Itt+/2G78Anfmi8y3oheUQEpvnetX4SUs+uP1WJBM6K7CBsoA7DTH4/wMaD9oCA0qjTVSvhx0FwTo6XUboU3lVwdDe7mn1TcJRoW78jQea8i3jY+QhaoVTJEEFkgY/NTqtduyMt5MAYjsZz9y+/mt8L7vDmPqtcdb/3VhlKsu8tko+HOGASMwX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdpCo7Xikk+qj21M8VmvFYUwwRIjGa07+ixlUVIlbnU=;
 b=mpZ7vOh0axsOEbKJ+6UewUbARwh+DWKVSERo+7cWEPPGd0+wbjMoa4pyldzEzwyruGjvbUjZL8iLPIttiIjfqZS0w86c4bva8bWocdPtCJ4rtwgV2puoTyVNh9+6pv3ha4YnnKDAhsOLprr0v+sSEiVFsHG+USDy/pR5oZ/Oe57tXicV0A5YkS4Lmj/jEy/UoYoRf2ob79pHs5yexIudzPmSTJuY3dnGJxo8iN8wqEwf9/rIe1iBRYIBxIvq70+mbSKi6JG8FbdVLVXPG9LQN6kpROYADUGNwKKPs8N3Eyn23a59sCvcggcJVMcMR8txuaq2CL/88k6x2X9mmfwjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 19:05:32 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 19:05:32 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/guc: Capture list clean up - 3
Thread-Topic: [Intel-gfx] [PATCH 4/5] drm/i915/guc: Capture list clean up - 3
Thread-Index: AQHZaNbtapE3IFTr/Ea0KZhwdntot688gCAA
Date: Tue, 25 Apr 2023 19:05:32 +0000
Message-ID: <9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-5-John.C.Harrison@Intel.com>
In-Reply-To: <20230406222617.790484-5-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB7095:EE_
x-ms-office365-filtering-correlation-id: 6405594a-f524-4fa9-0f0e-08db45c00ad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dF/SaoZBV7PUFnRz3BMoSXlJBLgJkZ3KI3DNWH+yZkOBBEiUjL554gH6d7HteeRY2LYAR4YgGJXkRNu1LUHvHqJwuMdg/VGXdFKn+JPYUgV0Uq/SEHhEi55M4llUCcuEONdUFe+HSDmqlq4CfP9Lt1BoNy9aoxkrX1l3QYqsr6Jyg3hiqJpqjjHQtPnSfHRbl7diI0+gZ7o6jUqxbH6Bqb0jm2c0K1iP74/XPVGrpOLWw/1xZSJbjAqTvt/cBrWGLBtZMvY6HWLKpYkQcuJmM9e5YDtt+f+VluJGcO41nToLFaNO8ORw/7VkaSSsSc8Betid6L2hdzcPkJGF9IKshjnu5hrxgmkgX+f5+rA+zsHqEPALRt09iuXOUFi7cximbrR7E8wYPA4vj6Cl0ZX2RsvSLzGGapfmvgOSgLp5a3M9kKLHFK+c8EXN6UrbSoxySZ9mx41d8xei4aH/BvIULak/vrc2KnfcqvQEgkbfkuFvUhaweQA/O/GMFy5su7NcM+f371zjEJvbPO9qA0ocbKdDC2UQsJmUNL7dqJd/GVXDZ9wOxNg2wPif1RRXIoLXtuDF1jWnWSrNL51RhJVEDkUti3lTQxQvzEa/XJCpg6nNCbETtkBPUZuMZv5Nkajx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(122000001)(2906002)(38070700005)(41300700001)(5660300002)(38100700002)(8676002)(8936002)(36756003)(6486002)(86362001)(71200400001)(6506007)(26005)(6512007)(478600001)(2616005)(186003)(450100002)(82960400001)(4326008)(316002)(66476007)(66946007)(64756008)(66446008)(76116006)(66556008)(91956017)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlFySGRid0pSVnpHbUsyNHVmZFJHNWpnK1VZaVRKT1RkOVBsa3FiZjFEZ25n?=
 =?utf-8?B?VXorSitTTndya1lpWjJ2ck4vTmtOYU1hWW1odEhtOXc3dG5yeGUvZVNmak9M?=
 =?utf-8?B?U1VSaVJKRVBCbWRGU3NTclFCTEtXM2lXTHNaM2NCYm02L3E3c1c4SlV2L0Uz?=
 =?utf-8?B?cjlTU0NQRldkdVIxVzFTTEJwcWNneFlzZEpTNTFoWU0xMnRLeElWT1J0S3ZC?=
 =?utf-8?B?OFhzckdnbjc5dGNIa24xZkg3V3drQWhyUE14a1pOTm5odFh1Ym1kSkR2cUZx?=
 =?utf-8?B?SVNkNlVoV1ozNHlYY1ptTktiVnU3RTlFZ3FXb3pZckZkT1plSEJIdU53V2Jk?=
 =?utf-8?B?UWhCSi9UKzVjb2ZYSVo2akFhOG1CL3huNHowL3k5czZha1hEbEpsZzh1cjhu?=
 =?utf-8?B?d1hSdjYrcGVYYnpjdmJKWEJjR1BraVo0U3ZOcmk5SHZWNUdkWGF6Rm5rQW9r?=
 =?utf-8?B?RUdOalVsaTVhazV3akhyNzdSc0dEL08rR2NtRVhDV2RJNHVzdzYwODh5UE5V?=
 =?utf-8?B?M3JoR2dPdXZsZzNHV1dvTDRCSEREQnZDMkwybGxTOEppTE80UHA0WnBoVlJq?=
 =?utf-8?B?amVEZzJrRVVZYzJsTmhSR3R5WDRCZlJBWVkyQWQ3b0tXUG1lVjFNMnZZSnBv?=
 =?utf-8?B?ejRRbjVhMnNwaVpGd1FsdEFWTDRkWXRrZmttVXhTZ201UkR0WDVrenAzM2Jh?=
 =?utf-8?B?TkxheVowRVRMTE1pUEFyenBqazh2UnRJbGFmSkt2TkxjSWJPdFhzd0pOVDFw?=
 =?utf-8?B?ZXRnaWQ5K3lub0ppNjd5cXVBV3NSYjhVMkFacHVuMkZWMmE2Vlk3WmVZUXpV?=
 =?utf-8?B?ZnJhZFR6ZW1VM2tNWEx3MFFlWUs2ekRrT2NDR3dtNEt4Vm9WamhwZUtyMVR2?=
 =?utf-8?B?MnJRUGlZZjlaZkNaYnNraHRCaForL2JCRFdVc25oMk9zQjgxUFFZK2xCQ2sv?=
 =?utf-8?B?SGRQRXpOMTlxL0VEaC9qL1VCdWlmdFY1cmVjNnhlMWtBNWs0OXRpR21kOFpt?=
 =?utf-8?B?K0dycEpFc2J6RmNBa0F5UW4rRTYzdGYwRXp3R2Y5NDJSR01FRGZKalhacUsy?=
 =?utf-8?B?YlBUYzRGV0t2Z0FNSGZmZ1EzNVNTVHpYeE1uenBIaGdmdFhQbjlwTE4wRloz?=
 =?utf-8?B?MHVRK2pOMFgzQ29xZCtmaUUxZnAxb2I0WVBtMFBXSW9sU2hsL01Ba1Q3anpx?=
 =?utf-8?B?dWlNQXpnbXdZdkordzdra0gwYS9SRWhNS2d3TThFUXJkUm1meEhPU01QaFpB?=
 =?utf-8?B?SFo1by9wOG1LRFFsZEZUaFF5alEvRWR0NmJlTWovNSswb3h2OXlaOTFCQkh2?=
 =?utf-8?B?dDB6RVBzYSttOFBqUWdDL2o3UFJrZ2dNUkxhZHMveFlhQnB0ODJ2cVJ1RjF2?=
 =?utf-8?B?TGlONTM0MEZISTM3Mk0yNXg0SWl5YzFESGJNR3J0MXF5UXBBUVIxSWpwTCtj?=
 =?utf-8?B?dUZ1eDQrOFdQMDBJaWN0VEttWlJmamlwVHR4TE9mZ2tNYUcwOXphQ2s4YnRo?=
 =?utf-8?B?Vng1M2s5Skk3OU9aQVZJUnNVNXZYaFJMUHNhL0RxbFNnU1lwMHBPQXlHb1Vo?=
 =?utf-8?B?UE1OWmxMazRjd2QvSWZVT3QyT1o1bVUxRTVGZEJnUnJTRWdlWUV1dnZobzJz?=
 =?utf-8?B?aEMxOWtXT3JVR1FkUkdaeWJGeE9CSFlERFV6QytGbHBiNWZKQ1g4N0RBQ2FJ?=
 =?utf-8?B?czFTK0w2M0tlT050ajhyMTVLKzd1MGladVNwZTF4TkNjTzJKcFNEL0pQa05Q?=
 =?utf-8?B?elRFUHJGWTA1Z0lmWVNwYW9yU0xyU1RGVzFCMzdaZ3JuN05WY083UWd0bWhY?=
 =?utf-8?B?VHRyaS82NGplSGxENS80WUJVbkppeEhzU0JwS1Uwc3psWGxvOThHYkFYcnNn?=
 =?utf-8?B?R3BpZzZrbnRYVkdaUmFuM2lWS25hbEhUQlJnWXNEUVpMRE9lMFVQWXBOMGYv?=
 =?utf-8?B?N2pMZFFOZGdqRWdHMWRkMkZlNnFpQWZpeVNKR1RVQzhhQ3lYR3lOenVDaWFI?=
 =?utf-8?B?VW5DQk9rbkhsRE5JcFZROWVTU1gvY0VpVXlhMWNPbDhvWnJZTWw5cEtZVG9H?=
 =?utf-8?B?QmVvNzFyejNzZENZWG81ZElJWjBGZjdRYTF4WTZab1dsSzFLcGw2SmdNTGRn?=
 =?utf-8?B?VFk5anZBQW1jOWUxbmZKY1k5NXNOY24rWGlMNWtjWlJjZ2NwS3NTU2JVNzhw?=
 =?utf-8?Q?a6McUfV7ofR3iYepgQ5f4c8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC7BEAF87306CB44B618A4EFB3832139@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6405594a-f524-4fa9-0f0e-08db45c00ad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 19:05:32.0779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eExOAcxfe6YrJLlxupufhyLhnDG4n5Vm9j7EIvzYBeiXmwWXMORXZFC5PoMUCXNMGHn5Wh543JeVOdQ9HDkZLtPYcXlJQ4CllQ9UjvCCwCDRHx22p3f6mCLwSg5TQhRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
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

T24gVGh1LCAyMDIzLTA0LTA2IGF0IDE1OjI2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gRml4IFhlX0xQIG5hbWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhh
cnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KYWxhbjpzbmlwDQoNCg0KPiAtLyog
R0VOOS9YRV9MUEQgLSBSZW5kZXIgLyBDb21wdXRlIFBlci1FbmdpbmUtSW5zdGFuY2UgKi8NCj4g
Ky8qIEdFTjgrIFJlbmRlciAvIENvbXB1dGUgUGVyLUVuZ2luZS1JbnN0YW5jZSAqLw0KYWxhbjog
dHdvIGNvbW1lbnRzIG9uIHRoaXM6DQoxLiBzaG91bGRudCB0aGlzIGdvIHdpdGggdGhlIGVhcmxp
ZXIgcGF0Y2g/DQoyLiBpIGFncmVlIHdpdGggcmVuYW1pbmcgdGhlIG5hbWVzIG9mIHRoZSByZWdp
c3RlciB0byByZWZsZWN0IHRoZSB3aGVuDQogICBhbGwgb2YgdGhvc2UgcmVnaXN0ZXJzIGdvdCBm
aXJzdCBpbnRyb2R1Y2VkLi4uIGhvd2V2ZXIsIGNvbnNpZGVyaW5nDQogICB3ZSBvbmx5IHN1cHBv
cnQgR3VDIG9uIEdlbjEyIGFuZCBiZXlvbmQgKHdlIGRvIGhhdmUgc2VsZWN0IENJLXRlc3RzDQog
ICB0aGF0IGVuYWJsZSBHdUMgb24gR2VuOSBidXQgbm90IG9uIEdlbjggYW5kIGJlZm9yZSksIHNo
b3VsZCB3ZSBhbHNvDQogICBjaGFuZ2UgdGhlIGNvbW1lbnRzPyBJIHRoaW5rIHRoZSBjb21tZW50
IHNob3VsZCByZWZsZWN0IHRoZSB1c2FnZQ0KICAgbm90IGp1c3QgZm9sbG93IHRoZSBzYW1lIG5h
bWUgb2YgdGhlIHJlZ2lzdGUgI2RlZmluZSAtIGVsc2Ugd2h5IGV2ZW4NCiAgIGFkZCB0aGUgY29t
bWVudHMuIChwbGVhc2UgYXBwbHkgdGhpcyBzYW1lIGNvbW1lbnQgZm9yIGdlbjhfdmRfaW5zdF9y
ZWdzLA0KICAgZ2VuOF92ZWNfaW5zdF9yZWdzIGFuZCBnZW44X2JsdF9pbnN0X3JlZ3MpLg0KYWx0
ZXJuYXRpdmVseSwgd2UgY291bGQga2VlcCB0aG9zZSBHRU44KyBjb21tZW50cyBhYm92ZSB0aGUg
bGlzdCBidXQgbWF5YmUNCmFkZCBqdXN0IG9uZSBjb21tZW50IGluIHRoZSBkZWZhdWx0IGxpc3Qg
LSBzZWUgYmVsb3cuDQoNCmFsYW46IHNuaXANCg0KPiBAQCAtMzY2LDcgKzM2NCw3IEBAIGd1Y19j
YXB0dXJlX2dldF9kZXZpY2VfcmVnbGlzdChzdHJ1Y3QgaW50ZWxfZ3VjICpndWMpDQo+ICAJY29u
c3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyX2dyb3VwICpsaXN0czsNCj4gIA0KPiAgCWlm
IChHUkFQSElDU19WRVIoaTkxNSkgPj0gMTIpDQo+IC0JCWxpc3RzID0geGVfbHBkX2xpc3RzOw0K
PiArCQlsaXN0cyA9IHhlX2xwX2xpc3RzOw0KPiAgCWVsc2UNCj4gIAkJbGlzdHMgPSBkZWZhdWx0
X2xpc3RzOw0KYWxhbjogcGVyaGFwcyBhZGQgYSBjb21tZW50IHRoYXQgd2UgcmVhbGx5IGRvbid0
IHN1cHBvcnQgYW55IG9mIHRoaXMNCm9uIGFueXRoaW5nIGJlbG93IEdlbjk/DQoNCj4gIA0KDQo=
