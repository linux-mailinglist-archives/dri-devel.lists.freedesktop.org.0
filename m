Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22912BFF53D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CBC10E885;
	Thu, 23 Oct 2025 06:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DitjQP4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AE310E885
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761200574; x=1792736574;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o+VhhvS9kunLL+UwRJfd9AFss7jpubxOaU6gppyQwag=;
 b=DitjQP4k4zcEEG1HbtIjcRN68J1plip3sbzCBW+BZ5iN0Uz8wEtUBhzA
 wJgtI7AcCRD+6Bz8RxqsMk+CUe2rk8Ku3lP8ZlSRcsmev4PxB+okzoEx5
 fyyNk1Es414WygnNHtvRp9N4OIjXfVVohy2xv0GjLPJhnyHHTmrJm6HUw
 llcIbBvob6HqlTzVHcGgmAVvfa/lPairvTQGApO/o7vj0YvfTdXYhDr7G
 lQbHFWiffO8k0W1CvItqQDpzvVfycKuqxbQ/+6ldLefE7tjwMGi5rBBEt
 XU0nbJFsShli4cIpF7K46au4lmYv21pnJH3aeEVto5ytmlGps8I5dmMSf g==;
X-CSE-ConnectionGUID: Fad2qivsRGyszOFPMLmw3Q==
X-CSE-MsgGUID: jOlhjp6dRNaoiXB8jagEvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50938774"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="50938774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:22:54 -0700
X-CSE-ConnectionGUID: MLYA7TG5ToCeJkPU6FWnWA==
X-CSE-MsgGUID: LBzemTksT5OOmM851My6pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="215000804"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:22:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:22:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:22:53 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meqM2fR2GAZpthJrF/2f7kUoqIjNpss4P85NWJ9QjAl9MUyJiSTJozthFJMCDVypx+mH9Hajo+D1WmKayygNff4UIlg50Oo4mEaDmB1h/ZaskXxumovcSH5pt8ouOKy5uRs4x2Lu1dW70KrZ55sd+mE8InmTk5zM2lZ/MIw1sJyS417oeBjP3nR0GjYpzpC0rdELB8eEHbAMarcM0U5PyJOe9TGRoB8wDopU7R4hb29sjeEZdhx3p26zeXCHuvcj/HBuo9CFGWap4pepBLLrZdttOF5WHtamXRtqu0DC23ktbwKz9eoi2dbroltUUeyh59t/DebE8/uB4HUwWqzmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0gBXXiVaghHu/XIQXqhwgKA6eeGHnJ3rhThlTs18Ss=;
 b=gVNqrfybjvQ5ICqquIYgk87AutHk+ncO0wbcep/cjwr0NoZ4ZXrUtlQCst1NCnUNBcaf7/aMwMs8CrPsRePoEEvRqAbMB4kxRAZDV6YLSt7TdkCDNNrrein0ODaSCUE5Q1VRclWDmR8DU0h7Fa/Xgi7dxUXUm2epmiv6/wiGSI77O95bQKDh0Iq7IwkgwngkKVTE2ogKqWkMHkGHxYwb22lhBwh/X5IVfok5OTAA2CBegMmeQK4MdOgk/uE3me0o5CfEybP6ixUyWxwzLek8GLc/ru6arXB5rqBsrkvlpllXfby+qGkQl1+T1PlTRtM5bHG1VSLy2Nx0KmPxUmSj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 06:22:52 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:22:52 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
Thread-Topic: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
 host resource
Thread-Index: AQHcPqyOICgcQp9euUCaQTY4FsET/rTFt30wgAA9H4CAAGplgIADWiaAgAJ0egCAAPDVkIAAkCcAgAAxDQCAAOLGsA==
Date: Thu, 23 Oct 2025 06:22:51 +0000
Message-ID: <IA0PR11MB7185DCAF9132F2CD92E42620F8F0A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
 <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
 <84de3c82-638a-412c-8e25-9ff507d59400@suse.de>
In-Reply-To: <84de3c82-638a-412c-8e25-9ff507d59400@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BN9PR11MB5323:EE_
x-ms-office365-filtering-correlation-id: eead7f5d-0f71-4bbf-ba66-08de11fc986b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?AqjjdYDOGVzMhVINTU9twpIwaNiH/FfMTd9TsUhKg45j27n6w20xNfAymR?=
 =?iso-8859-1?Q?ovh9DUFhLQO6a1mZVFgqL9+/EPjOp7dwmliSJUikB8SV7KFl8xI2jCieDQ?=
 =?iso-8859-1?Q?GXZ595J0ZSIFnhDk+uKYQ3WGM7CfddYXid58hXaAKiUcu9wzKxL9H69qZd?=
 =?iso-8859-1?Q?Ke/i8qtD1hw1bQk2csRvfV37k41ePOelYPH4VLsHKGKO+FwBGkGCLvU/C1?=
 =?iso-8859-1?Q?kte5HaNP8r80sgqHdzgaNtaRun2gSAD+2ZLwW5aqRRuHe681XGTZghyObU?=
 =?iso-8859-1?Q?3J87mo/+QJE7+5wCzChgZX+DshaNs+9PzYNd4FeHi6K90qPbzvSYGFaj96?=
 =?iso-8859-1?Q?yhaa93qSbqX7YkmRs5V3/CMVP4IGlfEmEBzKrLSIXKZQumljXkY7pblhYD?=
 =?iso-8859-1?Q?d3xjVOgUwyPR3xazPH0c4JBK+bNwSUO8jhWKE0xgYonaiCdO4JzxDUhcOs?=
 =?iso-8859-1?Q?hIvJhQ0n5BM1dksij4WDyfzp3zSd1asstMqpxXoTXH+4cJw5wpgk3r41Ef?=
 =?iso-8859-1?Q?kiUm5l8EJweyH6uSLTd6QBuJBPWZqTuGW4SEaJpOx+59ve7yNjTqcyImAA?=
 =?iso-8859-1?Q?1qo8HZhG/ND/gmtD+FQWJ52ZysVmsbfiPDqEPw7gCJynOAJGom6Wfdsj6y?=
 =?iso-8859-1?Q?hPWQjOISTjVzeVgMWYPuGrsYUwBtAwCX4kkEFQ//if+H+mu6bD/53QDkih?=
 =?iso-8859-1?Q?lGvsRG2XrWEuk54QdeqQEeDl6Mh+RjmUMvn2tXqZmDhCWKXwPlcQa2nz0L?=
 =?iso-8859-1?Q?IxFYCU1CBmuDuBORDI7hfOoSVuVpprVi0cZ1JQXVrLn2DRXGAO3Pdo1KrU?=
 =?iso-8859-1?Q?mbVmk2axdk9s6uaB/s5ckLRfc5/uNI4/zAO7/xEfJZ2MWL4eEXGp5QMtNd?=
 =?iso-8859-1?Q?/zJOVtchWsO3jOCxzRJu4LcfqZUFEAYdQSO7oGuPY80qWQ7Jo4K0yp3FR+?=
 =?iso-8859-1?Q?ct8kV+qYXofoEN2oDaBrKzRYbRsx9R58m1V0HfP89AxHiZYrSQONDL+YcX?=
 =?iso-8859-1?Q?pp7pQrL0WNoZTGih14PdHiQWHaEMUPDFBCCGnlaQmmMr9zR8AHw8Hnb93o?=
 =?iso-8859-1?Q?FLjX1HHJBpdb1NJfFZHTpbM/ofFuGBPj8mG8PlfHZklYGaP1AzHhOXTAH+?=
 =?iso-8859-1?Q?Um6cT2fG6S0So7Gkv6Rf3bJxnAPxeGX21YHo9RZ34lhjxIc4oH2w4dCdkq?=
 =?iso-8859-1?Q?0WFdPN/GDKejoYBRz2XkD5limEEI5q+JWf1Wxwv2/nAGKwlo0ioEaeuKj5?=
 =?iso-8859-1?Q?meSWIgba/85Qq8m6MZDQxvt257eqM6kmLlztJW2DvjOfyibyf1HMa/TZ0S?=
 =?iso-8859-1?Q?1sgcu3d4kzIvH7iZprzXu6cG8F6s3UfiAGC8TaPWHfOPv1sEsV+qLYqHTS?=
 =?iso-8859-1?Q?nv5Duw8ZYaA4Fd3LkxlpdjnCJ20yh0MGvrSkA71KSL1dKvwVha5HdGIFEt?=
 =?iso-8859-1?Q?mhEMLQI72G0nVUw8nYbwjSTJvnTjGWxkRBjBPC9JKTxnBjfunDVCIlKMoS?=
 =?iso-8859-1?Q?U+XXBTofB0fXnqpS1eV6tiu7MkA+8oCYZANHmd8sQWxjEW7EzMjbIj/qbf?=
 =?iso-8859-1?Q?VDjpfRCtG/W1FLozkywJVmerVVt4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1Dqo/qystqCj3D/VaAmB/Q6qJ9ulogEeSK51kVF3aq4a1aAg7KBvXb+Bo7?=
 =?iso-8859-1?Q?7hIHpKVPkqv9c2rAvG9cmAIjrEtMlwQsB1QVfQ/rPmt3jU2c/8550hnLrh?=
 =?iso-8859-1?Q?X9riQkIzOlB4o1fX5n3LEbnz8G3SDs5iM7PfINNUf4UmRygrH4K4DFHWm3?=
 =?iso-8859-1?Q?dXbaRxJowrFm7Ng9/ZjjWdwE6rF+vr5eHy+FVX+ortQzyfG9F2+5LdDTbI?=
 =?iso-8859-1?Q?6ETfFX+Iamvbte+NvrDF25LgInWL8qLN7SgBgVc3lnfEyy251TXZtXvMGq?=
 =?iso-8859-1?Q?tuVjO86xcxv3Wnxb3LuV9gnEAr6klJiGMP88wTBkA3VydG1fg6w2q+CyVO?=
 =?iso-8859-1?Q?al8zpzqtixMNo+0egI6p56ZSTmKmFVh9cEpedqGv04+7oFo4Ur7JfHG0Nw?=
 =?iso-8859-1?Q?ONpsm+WVdc3acPlsCXMzaHEgsGiAvpUXjia74baSMr+8tIIdX9blizPSt9?=
 =?iso-8859-1?Q?EcbKzP0CDWPJJW6I3wR6556rE9ffbTvwGeqIdX7cONDjePmPSZ4EvdcJmu?=
 =?iso-8859-1?Q?TgV1cd269F7BFZEawdl90GaCbhdpB6KoT2GzndHQdYzvpdbvaJF400U5p6?=
 =?iso-8859-1?Q?Wg8RHuXqbYjbhWAENuUzAWZwRUaoxDBIbOAANnNtgkAH4KOy2u4u2Yuuas?=
 =?iso-8859-1?Q?BW+A1UTpPK08xw3h9/wQBJalLTm8FxVTjvNlJHKrkgRACNOEVAjH7b2Eyf?=
 =?iso-8859-1?Q?ePTXi2u+mfa5GNB+k/DtJHiwTHfJ0ypgs2UpMjsi2gt1YuH7HtTSJvEb1O?=
 =?iso-8859-1?Q?gTUIjPoSdvmmsBymfA6Hrgi7K20d8Ur8/xoTwpkkXFIHQuET+Wkcf/WGox?=
 =?iso-8859-1?Q?42Wupzt9x3EwTQjk3yHdC3icITFtxEBQa5gjGPgIdSrpZQw+gmW/4Ioche?=
 =?iso-8859-1?Q?TPdLFfnM2wCQUXUuM2l3ipPcdvw/j1LCrc1Em3vBRd6Ztk5B6oilqtwpc3?=
 =?iso-8859-1?Q?4VtYPgGStxKLVYtUtZXTJtsXsYRtisxMiud2VBVWBZCMnGtZrob8jycFO5?=
 =?iso-8859-1?Q?om483NqZ0LdrdB8oIWeBD4zIokUyQy1eZKWwY3bSj9Z1tI7vfr5jUkJCOE?=
 =?iso-8859-1?Q?IyX+K/CyIqC8vxOFJIT1toDLWAOoeQPw3dAeqyF+TnCdv8x8DFE0/3lRZQ?=
 =?iso-8859-1?Q?a5LIZLLDI0LaSwYvwVDviGSy+45VJZeGEB7oSAVBPqVZViVsP6ALjVb5hf?=
 =?iso-8859-1?Q?jnNCPLkQKS/qVyhxdjWg26NaBqMiJSyR1UtQN0Gvmhk3FgKW2MV6Pu7Nfq?=
 =?iso-8859-1?Q?bmFTPtK1abKleWQEusnrjjfyLoGphV67l6PobV8dDSB8d7PxYb1jZKHyi/?=
 =?iso-8859-1?Q?9H8Wtp+p1h3TQgaWC+PehSQdw3tDN0NlG+fDIDnNTfN+9oWvOHdXyPpBeY?=
 =?iso-8859-1?Q?YZpIoIhhxnrLwIeuqUqnVNnEfRoBx9gID7iqZQ3o7iXGE6fOoKHghr+Ddt?=
 =?iso-8859-1?Q?eibBhWJOceqRLDj25tdITuBOwKOqvMvngmJnmnn/17ooAp+ftDBUDW6GaB?=
 =?iso-8859-1?Q?9zNGcLF5926rlblLE8Atbl6Cj7k+BOEzGo09a42sHNUpJ9tU2LqpCuvE9P?=
 =?iso-8859-1?Q?TGYTOHiApFK8QXrb3vk/AYPaIEJUHnGDrIoPVu6M9OyeMVWWIvKCMa1UA/?=
 =?iso-8859-1?Q?1xzDwGYdAciCN+mlDUQCe2fRydcNR1eV1K?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eead7f5d-0f71-4bbf-ba66-08de11fc986b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:22:51.9653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vPJJrDZ6fe6mJ3NQy1ympYNT5O9v+eMqvNNv/MDjUfxsoIjw8toDdHGR2ExJG0t6OkxZE4cY7GQmf8yNy4yC0pP4UWXOAdxM8E5pnX6uto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas, Dmitry,

> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
> host resource
>=20
> Hi
>=20
> Am 22.10.25 um 07:37 schrieb Dmitry Osipenko:
> > On 10/22/25 08:02, Kasireddy, Vivek wrote:
> >> Hi Thomas,
> >>
> >>> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on
> >>> the host resource
> >>>
> >>>>> On 10/17/25 10:38, Thomas Zimmermann wrote:
> >>>>> ...
> >>>>>> There's little difference between the current event handling and t=
he
> >>> one
> >>>>>> where no vblanks have been set up. I suspect that the vblank timer
> >>>>>> callback interferes with the locking in atomic_flush. That would a=
lso
> >>>>>> explain why the fps drop at no clear pattern.
> >>>>>>
> >>>>>> Could you please test the attached patch? It enables/disables the
> >>> vblank
> >>>>>> timer depending on the buffer resources; as you suggested
> >>> before.=A0 Does
> >>>>>> this make a difference?
> >>>>> The attached patch doesn't work, please see the trace below.
> >>>>>
> >>>>> @Vivek Please clarify whether you only see frames drop with your
> >>>>> multi-gpu guest-blob setup or with a usual virgl too. I haven't not=
iced
> >>>>> problem with frames pacing for virgl and nctx modes yesterday, will
> >>>>> check again.
> >>>> On a second look, I now see that this RFC (not the attached) patch
> >>>> doesn't work properly with host blobs.
> >>>>
> >>>> I'm getting 100-150fps with this patch applied instead of expected
> >>>> 60fps. Without this RFC patch I'm getting constant 60fps with native
> >>>> context displaying host blobs.
> >>>>
> >>>> Not sure why guest blob would behave differently from the host blob.
> >>>> Suspect something if off with the prime sharing that Vivek uses in t=
he
> >>>> vfio testing setup. I'd suggest to disable vblank timer only for gue=
st
> >>>> blobs if no quick solution will be found.
> >>> After reading your reply and Vivek's new results, I'm confused now. D=
oes
> >>> it work or is there another patch needed?
> >> Considering my use-case and Dmitry's virgl/venus/native context use-ca=
ses
> >> and the benefits offered by vblank timer in these different scenarios,=
 I think
> >> the following patch should be sufficient for now:
> >>
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
> b/drivers/gpu/drm/virtio/virtgpu_display.c
> >> index e972d9b015a9..c1a8f88f0a20 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> >> @@ -102,7 +102,11 @@ static void virtio_gpu_crtc_mode_set_nofb(struct
> drm_crtc *crtc)
> >>   static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
> >>                                            struct drm_atomic_state *st=
ate)
> >>   {
> >> -       drm_crtc_vblank_on(crtc);
> >> +       struct drm_device *dev =3D crtc->dev;
> >> +       struct virtio_gpu_device *vgdev =3D dev->dev_private;
> >> +
> >> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> >> +               drm_crtc_vblank_on(crtc);
> >>   }
> >>
> >>   static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
> >> @@ -112,7 +116,8 @@ static void virtio_gpu_crtc_atomic_disable(struct
> drm_crtc *crtc,
> >>          struct virtio_gpu_device *vgdev =3D dev->dev_private;
> >>          struct virtio_gpu_output *output =3D
> drm_crtc_to_virtio_gpu_output(crtc);
> >>
> >> -       drm_crtc_vblank_off(crtc);
> >> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> >> +               drm_crtc_vblank_off(crtc);
> > I'm fine with this change. Will need a clarifying comment in the code.
> >
> > On the other hand, I tried with "-device virtio-vga,blob=3Dtrue" and st=
ill
> > don't see problem with the incorrect frame rate.
> >
> > Vivek, could you please clarify whether you only seeing problem when
> > using prime sharing? I.e. whether you can reproduce the wrong fps by
> > running qemu casually without using vfio.
I'll check again but looks like this problem of inconsistent FPS seems to b=
e
only affecting prime sharing use-case.

> >
> > Might test the vfio setup myself sometime later. It's a bit cumbersome
> > to set it up, will need to re-plug GPUs and etc, currently busy with
> > other stuff.
>=20
> Here's another variant of the patch for you to test. This should resolve
> the warning.
This new patch does not work (meaning FPS is low/inconsistent) while testin=
g
my use-case. However, it does work if I invert the visibility check:
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virti=
o/virtgpu_plane.c
index 31f6548ef0fe..1ee8924b12c8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -129,7 +129,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_pla=
ne *plane,
                                                  is_cursor, true);
        if (ret)
                return ret;
-       else if (new_plane_state->visible)
+       if (!new_plane_state->visible)
                return 0

Also, I think you might want to limit the plane sync to host mechanism to j=
ust guest
blobs only because based on what Dmitry said the vblank timer helps in virg=
l/venus/
native context use-cases. That is,
@@ -138,7 +140,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_pla=
ne *plane,
        for (i =3D 0; i < new_plane_state->fb->format->num_planes; ++i) {
                struct virtio_gpu_object *bo =3D gem_to_virtio_gpu_obj(new_=
plane_state->fb->obj[i]);

-               if (bo->host3d_blob || bo->guest_blob) {
+               if (bo->guest_blob && !vgdev->has_virgl_3d) {
                        vgcrtc_state->plane_synced_to_host |=3D drm_plane_m=
ask(plane);
                        break; /* only need to find one */
                }

Thanks,
Vivek

>=20
> Best regards
> Thomas
>=20
>=20
> >
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

