Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E267D53E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE73210E0C2;
	Thu, 26 Jan 2023 19:18:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3884B10E0B4;
 Thu, 26 Jan 2023 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674760680; x=1706296680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1nS1rEYA2hwnrwgNhNaYJCVZmWsCd9OVrkPDhrq4dDk=;
 b=PcvwwUEC+Bn+bY9zJHCUMCEqOekIpJxcGhUYZ1nqbCS5K4zFOY+Tsr0F
 pbkoK0azq/It19DRR2wRC29OFGbWZB7JRJ1kGave4SBZ00Px/mC7Doohy
 JnNU7SbBruAF9XXRWDQiKWfgTmFmVYmGzVbjnn46dVmbU+ReyxR1yn3iU
 vd4bycSCqEfmK3fPR15q0XeRndjoQhcwYD97dzy5dIE2iALvwyLH8b/Yi
 tPcXHdvZssUt32ap/Pbfhb8DdVN9uHRvmmi9DQGT1ZZjFXLJT4U5YHl2k
 vgXXLxaRC+BPjQm++bzZPVgQXG248B6bsHCmWLhiGgGgM/GIhBOFDkE6c A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="326942033"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="326942033"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 11:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="664974610"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="664974610"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jan 2023 11:17:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 11:17:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 11:17:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 11:17:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 11:17:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwXA18I1SuQtyIW/BEuDvhGK4Nkg0BkYfbCFMW2WdN9Az/wqouFhJnt7vbCpL0KCLNYZqGpcAr2hY+zzjOXsNZJ2a7ChTZy3qsaQhIfBFEmWfTn2e65tx1nwfnkc9qamPzmIGmKby801/Xq/fz30L0A/kAP4ViiW3vtNaTEDA9DGjGzJwyx7ivt+BPiU5OhNPoGtS4K4msIfx9sihI7IXCIEY0Du45qsliXTacM1lRRovaUn0WN+TtqbPLt/4sznr1G3bf1fyuX6rsKJRP9tqhCl5NwU3Qb2AgJDchHg3DjHFu+SfJ9oa48fFK2h0JIK8i3WiXYN9FYGssIc+dQ18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nS1rEYA2hwnrwgNhNaYJCVZmWsCd9OVrkPDhrq4dDk=;
 b=bs8VECA35Vq1BSNUCf6EdvUt7GeDbIecItjTrEaKObaaCi3wDgnRID52Ui9Kqmu5vWmZCrziT/cqc1CdqsBR4daHUDNu+0SYKYkvbNNHcB/FsOj22HRrIFQsxBt9+2Om1C1WqDsr3IQYJjwf5Qi+tJPHyFK/jCGe2ZjJSeRJcy21ZtsIz8CwWjz3WchvnZX0T5+mVWZ30VftXUq/i8iI6E8hF6/VP39lDkaj17SPOhg6zCcGBSVxGzkTGctlCnNxVHEni3HrCCrsQ1ZZuLtzsk/JG8qxTooKlDffDcS2vOnj385t8Q9Mo04I5bqfTDIrWnjA5xyn2u4FySYSQZ5HgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 19:17:53 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%5]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 19:17:53 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [PATCH] drm/i915/guc: Fix missing ecodes
Thread-Topic: [PATCH] drm/i915/guc: Fix missing ecodes
Thread-Index: AQHZMFbyJmP3Lf6y4kWyw83taBUnZK6xFRaA
Date: Thu, 26 Jan 2023 19:17:53 +0000
Message-ID: <a8fec1b746e540aa6ac275139b26a524488d6a0a.camel@intel.com>
References: <20230125004935.1986479-1-John.C.Harrison@Intel.com>
In-Reply-To: <20230125004935.1986479-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB6242:EE_
x-ms-office365-filtering-correlation-id: b0e7197d-301b-4886-d5c7-08daffd205c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QBQGcEtx0lchaC1W42queT+AYFzA6efyTJ1kutk05V4ejgrZZcXxrc9ctRZQCMXsO2vI8fmcpyQp3ADHazBfAv7nGUkjvgoL1hY8/zfSriV4t79SqZBy1uaoZTU06iszWd3jY6YMr5DlV3PCbk8UWjSD53ebiOcjkmRD2FFniRenW+idEWcK+WE1mpW4vQ8rMiXSH7FnGbd36nxmdt/+9j496hK9/ug+wqgH2XGYLfpt+M9NcDzO90xPHJWz7JMjjLPSKWNNPPKx2n7GkKgFibNK+PR9+XU4SwhTY45B0xUyuKJBMZp4sMap4c1DzOBgCjuUZZdW2P2/ibktPY+OgBQiAk3itD9o5HPs1UA0lUk0N2JAUQluqFZcCtkvL7oV252zlWZCiqLaTDM7m5f5xc7YFZHXC6D5ZP/25OhEVkiUfC5UKROOioRzh4QxMvKJC9Xhwopa1y/hU75MwZbErYv1qpkXrqozXq+BdpSibqM+xqEoLmHuYrz7XAGUBz2ly7sXfi32Qh1blkn13+HSjC2mgHei8Rv1i0KQE4h3yCBvEY/0PVaaGQcm9pemUJRZT15nWgLlLl5J5zlP/oQ3tezvax/1sPq9TI2uq3txMw9JvJPhOkQQWtqZByYF9IZWH0kvzj32GXp8SN5H7TtxhJ74erf4Qiz1IVNVwjpAUjoTTpky+u/ssFOg+Y2TeE59KUrU2r7MMgW1uHZgM6zSxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199018)(38100700002)(122000001)(86362001)(36756003)(38070700005)(54906003)(82960400001)(110136005)(2906002)(6512007)(66476007)(41300700001)(76116006)(8936002)(66946007)(66556008)(8676002)(4326008)(91956017)(186003)(64756008)(5660300002)(66446008)(6506007)(2616005)(316002)(26005)(6486002)(83380400001)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ry9MYkxRMmpJWS9yZFVaSjZYSEdCcTNXZUczM0JDZERkeHZtMlFKYldBMlJI?=
 =?utf-8?B?RVVyWUZvRU1oRjMrMU1DUEMyN0hKWG9uWkFibElZQXhEWitTYm03UnRoeFRp?=
 =?utf-8?B?cGNvS0dQYTBXbjdmL3F2dm9yQW1HS3dDYmpJd2ZLdzdIV0Zod2tIMEVpcGdx?=
 =?utf-8?B?Y1lEbkVLSG1HOUVNRm9FL0tlK3RwandNbG1KOUU4RFo1L2g3UnNQOWZlY2hs?=
 =?utf-8?B?T28xR0s3aVJaR09NSTA1TFc4OFhwYUVOaU9aWDIrMzMxbXFJdlpSVDV2SWVt?=
 =?utf-8?B?ZENtdFkzeWxlNk5tWFl6aHBmVmJTYy84VHpqcThvNXJCTnRlaEpLWGpNVDBK?=
 =?utf-8?B?RnlxWFdNbndXYm1BbE1PQzk5N01pR20zVWtkUHdjWENnaitEa0JKQVA1WVhI?=
 =?utf-8?B?OTl2bzZiQXhINWtjK0NlczlmcHFJc0FlcWdtMGdabndhd0dya2w1cXhINTRk?=
 =?utf-8?B?NlVhdFFsYzhaVlZKNHRBVjVrbTgxWTg4NU5UL1Y1SG5paDNjc3luY1M2VW5P?=
 =?utf-8?B?K1dRWUR2RWIvaFJnNlhoTjJqYmhQVXpuSVpKVW9nVGg5R0Z6REtmK1ZNeFJH?=
 =?utf-8?B?TUpmNjZPcG43MmpoaHBKMEhqckUwTzI0L0RpUlR3bjhFdDlkSG0xQlgrSlVV?=
 =?utf-8?B?bENZZjJZWkdnTkVVbzNFSVdOTG9HZGEwSzJYN1dKelBEWjdZUG90RVlqbTVE?=
 =?utf-8?B?RS8vUDdpU0tQNXVwbUR4ajV0RjljL2h6eTVXRCtYN1FaTysyMWFUVE1qdjd3?=
 =?utf-8?B?MmxmemxNTUJPM2hqSkxVOHRncEd4Y1hxU1FpZ1hQK0hFVnhQckVNejY3ODFL?=
 =?utf-8?B?Z2czTEJDcS95WnkrTVlIYlBndnBIYjRMWkMwZ2F5b0hPZHFrcVhrS0R4SnVm?=
 =?utf-8?B?OFdZSlFUMUZnTXIyaHRNVjNXc0JmNjBjTlY5OWdIcDhqb0c2RUJDSm1kd1VK?=
 =?utf-8?B?YlhQQ2JRU0syNTNOUjZoQWpQMzNhRHNFZERnT1hOWU54Ymx5U0NFcklEeEtL?=
 =?utf-8?B?blJPNlNXRndxdWFURDAxN0hWS0lMakE5Y01jRkp3SVBkUDhHSUIyNHhBVUIz?=
 =?utf-8?B?M2drT1F2MmVUYUR4R2VHV0dFbnN5c0lMVEJWWmx5WVpTaDdQREVQSDBBcWRK?=
 =?utf-8?B?c0NXZnFNVHdSUXB3b3ByUG83NTR4aGRGWUlUNHY3MWZ3K0MreStTeS91ZndV?=
 =?utf-8?B?VTMzR2xxdk0xYzJwSE5jYWhCSk1qR1grQmdwYWIvelpKdFpoYktBUlhIMmE5?=
 =?utf-8?B?cFlGcjhDUlEyaGRQclZLZCs2ejV0ekw0KzRkMGNqSThPWVQvVzVGcndpMnVy?=
 =?utf-8?B?MDlaaitIWnNTUWhDVHdFeFloc2pVanp5QXRjRHhmN2ozQW9TQWl6TWorT21I?=
 =?utf-8?B?QjZTcmxWYU0zaU1EckxXUkJmVVNKOTRCWk1Ca0NNc05McXFZY0hUdFNjQkpC?=
 =?utf-8?B?ODN5dW9DTFMzTTB6QmV1K1F3N3gxbFE4di9TSzBrU3hHVGtRRFBjdWM3djhH?=
 =?utf-8?B?VDNYTkNxclN1K3g0MGtKQ2J1bUV2RVdFSjBRcTJKWlc2WXJHUS82S3NSeGZr?=
 =?utf-8?B?UGJYWXFDT2RvV1B4UG41MStPNkFLaFpTR0FHK05kRnFIdUNqelBaN2hqcTBp?=
 =?utf-8?B?dGRxTWVFOUUyKzJjbXpiNTVwY0d4YWwxd0QyaDdTTjRKdHJoQ0pLZlljWFRH?=
 =?utf-8?B?SGVZQVZINWx6a0FmZ2lrU0IwaCtSZUx1YmRTb1dJbW9NOE05TGVRQmtBVUdT?=
 =?utf-8?B?SkdRS1JTK2s4TFl4UTdOcC9hTmR3dkxqNWRkeFgvRnBQVkgzYWJwZWs1cnMr?=
 =?utf-8?B?MG9iUzZidXJ5S2RCT1Y4NDlUdWhtSGlHR1ZUdEpzcFYrY3NDRGJ0U1poODVt?=
 =?utf-8?B?MFFMeVIxZkt2TXB6OWp3RDQ5UloxVitIN3UweXFWU1BscS9VUEEyVFZzSnBq?=
 =?utf-8?B?M0pTZEdiK1dKcjdFWTFwL2lpSmJNTk56NTAzVzhzRFh2YUtCYVoyT0w5Y0JY?=
 =?utf-8?B?aVFmYUlXTE1VRkVza1E2MnZWRzFxdVRhdzJUbE9FRW9LZ2tOZUhRekxSVEtk?=
 =?utf-8?B?WUNCVWkxNlBQSW1MaE9qMXFna1ZHMEVGTVppRDdwK1owU2N2WEtlKzlsZGp3?=
 =?utf-8?B?WmJIQUFZbE5xZmZHV0pZMzJjbTN1TTVJVjMyZHNmbXVWcC9GU3RLaTFJUDh5?=
 =?utf-8?Q?RUle4kmo8qqj4UZAImrLoMs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9E65C977F212A4CA66CE7BD54FF4929@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e7197d-301b-4886-d5c7-08daffd205c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 19:17:53.1100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +va3S077aQTJPhL/F1LNeCjB9cZXq28pu8o/ZFJ/xfxpdHGAf/hk0A+QvTWjmGjI5qLhIhFTI/K5ATbKJkg2cjGtgznq+HMPxWcQBzV1zskw+15ZKNS8Zp/OAnS4kX3B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Cheng,
 Michael" <michael.cheng@intel.com>, "Nerlige Ramappa,
 Umesh" <umesh.nerlige.ramappa@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Chang,
 Yu bruce" <yu.bruce.chang@intel.com>, "Iddamsetty,
 Aravind" <aravind.iddamsetty@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rmlyc3RseSwgdGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIG1pc3MuDQpTaW5jZSBJIG9ubHkgaGF2
ZSBvbmUgdHJpdmlhbCBuaXQgYW5kIG9uZSBub24tYmxvY2tlciBhc2suDQphbmQgdGhlIG5vbi1i
bG9ja2VyIGFzayB3aWxsIG5vdCBpbXBhY3QgdGhlIHBhdGNoIGludGVudCBhcyBpdCBtZXJlbHkN
CnR3ZWFrcyBhbiBleGlzdGluZyBkZWJ1ZyBtZXNzYWdlLCBJIGJlbGlldmUgd2UgaGF2ZSBhbiBy
YjoNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNA
aW50ZWwuY29tPg0KDQpPbiBUdWUsIDIwMjMtMDEtMjQgYXQgMTY6NDkgLTA4MDAsIEhhcnJpc29u
LCBKb2huIEMgd3JvdGU6DQo+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20+DQo+IA0KPiBFcnJvciBjYXB0dXJlcyBhcmUgdGFnZ2VkIHdpdGggYW4gJ2Vjb2Rl
Jy4gVGhpcyBpcyBhIHBzZWR1by11bmlxdWUgbWFnaWMNCj4gbnVtYmVyIHRoYXQgaXMgbWVhbnQg
dG8gZGlzdGluZ3Vpc2ggc2ltaWxhciBzZWVtaW5nIGJ1Z3Mgd2l0aA0KPiBkaWZmZXJlbnQgdW5k
ZXJseWluZyBzaWduYXR1cmVzLiBJdCBpcyBhIGNvbWJpbmF0aW9uIG9mIHR3byByaW5nIHN0YXRl
DQo+IHJlZ2lzdGVycy4gVW5mb3J0dW5hdGVseSwgdGhlIHJlZ2lzdGVyIHN0YXRlIGJlaW5nIHVz
ZWQgaXMgb25seSB2YWxpZA0KPiBpbiBleGVjbGlzdCBtb2RlLiBJbiBHdUMgbW9kZSwgdGhlIHJl
Z2lzdGVyIHN0YXRlIGV4aXN0cyBpbiBhIHNlcGFyYXRlDQo+IGxpc3Qgb2YgYXJiaXRyYXJ5IHJl
Z2lzdGVyIGFkZHJlc3MvdmFsdWUgcGFpcnMgcmF0aGVyIHRoYW4gdGhlIG5hbWVkDQo+IGVudHJ5
IHN0cnVjdHVyZS4gU28sIHNlYXJjaCB0aHJvdWdoIHRoYXQgbGlzdCB0byBmaW5kIHRoZSB0d28g
ZXhjaXRpbmcNCj4gcmVnaXN0ZXJzIGFuZCBjb3B5IHRoZW0gb3ZlciB0byB0aGUgc3RydWN0dXJl
J3MgbmFtZWQgbWVtYmVycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpv
aG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IEZpeGVzOiBhNmYwZjljZjMzMGEgKCJkcm0vaTkx
NS9ndWM6IFBsdW1iIEd1Qy1jYXB0dXJlIGludG8gZ3B1X2NvcmVkdW1wIikNCj4gQ2M6IEFsYW4g
UHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiBDYzogVW1lc2gg
TmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiBDYzog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogSm9vbmFzIExhaHRpbmVu
IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1
bGluQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBp
bnRlbC5jb20+DQo+IENjOiBBcmF2aW5kIElkZGFtc2V0dHkgPGFyYXZpbmQuaWRkYW1zZXR0eUBp
bnRlbC5jb20+DQo+IENjOiBNaWNoYWVsIENoZW5nIDxtaWNoYWVsLmNoZW5nQGludGVsLmNvbT4N
Cj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzogQnJ1
Y2UgQ2hhbmcgPHl1LmJydWNlLmNoYW5nQGludGVsLmNvbT4NCj4gQ2M6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuY8KgwqDCoCB8IDIyICsrKysrKysrKysrKysrKysr
KysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jDQo+IGluZGV4IDFjMWI4
NTA3M2I0YmQuLjRlMGIwNmNlZWQ5NmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuYw0KPiBAQCAtMTU3MSw2ICsxNTcxLDI3IEBAIGlu
dCBpbnRlbF9ndWNfY2FwdHVyZV9wcmludF9lbmdpbmVfbm9kZShzdHJ1Y3QgZHJtX2k5MTVfZXJy
b3Jfc3RhdGVfYnVmICplYnVmLA0KPiDCoA0KPiDCoCNlbmRpZiAvL0NPTkZJR19EUk1fSTkxNV9D
QVBUVVJFX0VSUk9SDQo+IMKgDQo+ICtzdGF0aWMgdm9pZCBndWNfY2FwdHVyZV9maW5kX2Vjb2Rl
KHN0cnVjdCBpbnRlbF9lbmdpbmVfY29yZWR1bXAgKmVlKQ0KPiArew0KPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZ2NhcF9yZWdfbGlzdF9pbmZvICpyZWdpbmZvOw0KPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZ3VjX21taW9fcmVnICpyZWdzOw0KPiArwqDCoMKgwqDCoMKgwqBpOTE1X3JlZ190IHJl
Z19pcGVociA9IFJJTkdfSVBFSFIoMCk7DQo+ICvCoMKgwqDCoMKgwqDCoGk5MTVfcmVnX3QgcmVn
X2luc3Rkb25lID0gUklOR19JTlNURE9ORSgwKTsNCj4gK8KgwqDCoMKgwqDCoMKgaW50IGk7DQo+
ICsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFlZS0+Z3VjX2NhcHR1cmVfbm9kZSkNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBy
ZWdpbmZvID0gZWUtPmd1Y19jYXB0dXJlX25vZGUtPnJlZ2luZm8gKyBHVUNfQ0FQVFVSRV9MSVNU
X1RZUEVfRU5HSU5FX0lOU1RBTkNFOw0KPiArwqDCoMKgwqDCoMKgwqByZWdzID0gcmVnaW5mby0+
cmVnczsNCj4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IHJlZ2luZm8tPm51bV9yZWdz
OyBpKyspIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZWdzW2ldLm9m
ZnNldCA9PSByZWdfaXBlaHIucmVnKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVlLT5pcGVociA9IHJlZ3NbaV0udmFsdWU7DQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmVnc1tpXS5vZmZzZXQgPT0gcmVnX2luc3Rkb25lLnJl
ZykNCm5pdDogImVsc2UgaWYiPw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGVlLT5pbnN0ZG9uZS5pbnN0ZG9uZSA9IHJlZ3NbaV0udmFsdWU7DQo+ICvC
oMKgwqDCoMKgwqDCoH0NCj4gK30NCj4gKw0KPiDCoHZvaWQgaW50ZWxfZ3VjX2NhcHR1cmVfZnJl
ZV9ub2RlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY29yZWR1bXAgKmVlKQ0KPiDCoHsNCj4gwqDCoMKg
wqDCoMKgwqDCoGlmICghZWUgfHwgIWVlLT5ndWNfY2FwdHVyZV9ub2RlKQ0KPiBAQCAtMTYxMiw2
ICsxNjMzLDcgQEAgdm9pZCBpbnRlbF9ndWNfY2FwdHVyZV9nZXRfbWF0Y2hpbmdfbm9kZShzdHJ1
Y3QgaW50ZWxfZ3QgKmd0LA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBsaXN0X2RlbCgmbi0+bGluayk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVlLT5ndWNfY2FwdHVyZV9ub2RlID0gbjsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWUtPmNhcHR1cmUg
PSBndWMtPmNhcHR1cmU7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ3VjX2NhcHR1cmVfZmluZF9lY29kZShlZSk7DQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9DQo+IMKgwqDCoMKgwqDCoMKgwqB9DQoNCmFsYW46IG9ubHkgb25l
IG5vbi1ibG9ja2VyIHJlcXVlc3Q6DQp3aGlsZSB3ZSBhcmUgaGVyZSwgY291bGQgd2UgdXBkYXRl
IHRoZSBkZWJ1ZyBtZXNzYWdlIHdoZW4gd2UgY2FuJ3QgZmluZCBhIG1hdGNoaW5nIGNhcHR1cmVk
IG5vZGU/DQpDdXJyZW50IGNvZGU6DQoJZHJtX2RiZygmaTkxNS0+ZHJtLCAiR3VDIGNhcHR1cmUg
Y2FuJ3QgbWF0Y2ggZWUgdG8gbm9kZVxuIik7DQpOZXcgc3VnZ2VzdGlvbjoNCglkcm1fZGJnKCZp
OTE1LT5kcm0sICJHdUMgY2FwdHVyZSBjYW4ndCBmaW5kIG5vZGUgZm9yIGVlLWN0eDogbGNyYSA9
IDB4JTA4eCB8IGd1Y2lkID0gMHglMDh4XG4iLA0KCQljZS0+bHJjLmxyY2EsIGNlLT5ndWNfaWQu
aWQpOw0KDQoNCg0K
