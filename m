Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BA7BA3440
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DF110EA14;
	Fri, 26 Sep 2025 09:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhnX/RFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C47910EA19;
 Fri, 26 Sep 2025 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758880766; x=1790416766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yKdE0cLQsr5pAH4UhrY+f9g6dMVgoxNRbVvjl2NIhZ4=;
 b=GhnX/RFKXgERDP7ZE1d53h5kd/3rCS23yPeaS0bs6CwAen3GsiAEkpPy
 Vg/LdZSPU/253VaWgRjtI4mJ+C/yoh9dz9GLpF08ofqVxCmQCh2Fjl3NB
 8DNifWuD1YJA+RUSWLFEozzs2l4L+iTRJeUfzgMHd4Umnmu6FbZpY6Vu4
 MQ4Y3v61/eX68SdQ01SpKNRGwBOrQwnTYCOJwcZsiqkqpAT/WMovI7+aY
 GaE/g+DH/jSfS+fBgwWqq1PwXekTbggz6TqzH8G4f1u3LPfSHzj7SY3gh
 Owz6N6QGaxwmmUx+g21Z/PWH2QbRjKCMCVfxShj+beYpm06TBxYw+NY9u g==;
X-CSE-ConnectionGUID: CRmz+61jTma0OD03JVgkXw==
X-CSE-MsgGUID: 5vqdnQH0TFuxlJ0ovaixhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71900408"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="71900408"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:59:25 -0700
X-CSE-ConnectionGUID: mtoBvamfTgWSvcyPfOEojw==
X-CSE-MsgGUID: PTLHGiQgRnWMavbgVt34vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182743201"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:59:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:59:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 02:59:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T305Zr3PePX+ZlgDlS4+cuy6shalRIufw+IhoR2sfnRKlU9DQdhk61rAa86nmYKZg4mb1fyXnObVLfPdFNrPKUsYfvNcaSa3IiCewdw5Vom6O/cbhApEhT+8zSeZ8rxxMMGO7mg+mYmbW57iibpRCZX1wA46xeUteB/TrAz0NTfk4ibDfsMNummcvrH8qfqzf+PDorCR4bOr3/gQSEXnQMkKEi2Y/1kWi8S2CJLKWlmiFtkQK5lxCEHX+MI88dlzKWXiEVDZkjvJZu/QynACXIwqD2MtEkwwc62piFFa4K6jFVftC8KbDpADWt4VhkaFJ5m4Tug2xm129Am6EnmDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JqOTekA2k1fkhqoLsdxKB2hVRAosocSVBz6b5tkfU8=;
 b=EMmjXsL9k9qbwVq17yvgGhpSY629oegjtN+OQtqA+V1+WMdHl/p69rAbXp4YQhau5dEQ2f1O4GpI+isHOf8wt4lM29VKBA5WL0LXjzwv0SHXHcDpnKTO2jpBm/Lhtlfiq2GfTN3VKM/TxhNAiMxCpGDtd5poqhfVNmrWt71VwbOmOhSO6NwyltN6rjTAAKjcFxJAmDLyjMh1i3/yfD7a1t2rxWGOIB+pdsmiwV8qR6715SAGGcQIgVlrF7Bm+NEAAPDjBhB8H6ZxbYzufKNLR1rF9/ipZ/odV8Zt+6YfLQWUItguWq6mK1s8o0h50yXUgcSopl+HDV1CxOAfSJ9p3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CYXPR11MB8753.namprd11.prod.outlook.com
 (2603:10b6:930:d5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 09:59:16 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9137.012; Fri, 26 Sep 2025
 09:59:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Aaron, Ma" <aaron.ma@canonical.com>
Subject: RE: [PATCH v2 1/2] drm/dp: Add drm_edp_backlight_get_level
Thread-Topic: [PATCH v2 1/2] drm/dp: Add drm_edp_backlight_get_level
Thread-Index: AQHcLsmd57tYS4Z0wEeg4S+JEYHtTbSlORkQ
Date: Fri, 26 Sep 2025 09:59:16 +0000
Message-ID: <DM3PPF208195D8D34AED211B63873F07D16E31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250926093832.2811200-1-aaron.ma@canonical.com>
In-Reply-To: <20250926093832.2811200-1-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CYXPR11MB8753:EE_
x-ms-office365-filtering-correlation-id: d51f0194-202c-4465-17c8-08ddfce35ab0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?e9BEizMLmYPokZnuAsNiw/eKlWlUwsuK8Zi511P3Ufe7a6syrRDHUsl0ZXUK?=
 =?us-ascii?Q?mokLgzKMqT7uoYffyxp+LbaDqyWfkTu9NO3BBX5m3RGooMF70NnylEBQicDq?=
 =?us-ascii?Q?dloS4N+i1YYWMRQwkrsQhi6Kb506jarmBZkOshj0xqp2GGeB1fv9q3TtRE12?=
 =?us-ascii?Q?SNuNOQWnzR4w7xkSOTdxMJDNnCdRxbinMtFmmRsz1tYLNUQQ23nqg1UTlgqE?=
 =?us-ascii?Q?Ie0WPA2Zp+XC6XDoUxB/zusRkAyNns3RcZfarbo25AgTTt0Inm8ylq1FXCon?=
 =?us-ascii?Q?dJXjhLuWg8eiGMfR8Ixo6pyqFab0EA9wh/cSQwtzUCZ0U692q2md9lDJs9JU?=
 =?us-ascii?Q?fKLV7dAIyDyvMF64k68cW8HHhsLMJUzCssK3g2gHGHrxmRQGPzFO2zl4J8jL?=
 =?us-ascii?Q?63WhAT+cmmMinJlaJupfHDySIZ3tA+u6SzMUWL4Vlzn27fKS+zCxpP3K79Oa?=
 =?us-ascii?Q?RNlzcqVLzKvgtblSd7zIbCBASXM9ftygg/zlI01OcLIJcw7VmFLKEBbcNbwW?=
 =?us-ascii?Q?SWesTtrx+ObKONnkqOBG4Gv+JrAvVMSZdBZSR/vfoVaxFIyXbN99Ypfh3u+P?=
 =?us-ascii?Q?DPVHdPckEXj1iv2pFXPGFSyuIf373R4mptGhaxVXh6tZC57dtzugIi6U5snx?=
 =?us-ascii?Q?cm7HbzFGakJBFwXH8Pl3xj0NTtc5ySanBhpFsQdWEOJ12H0YHTJWTYf//UPV?=
 =?us-ascii?Q?3QvpE4PdIbvyQDZ/YjhIPwxw4ncosQi+GPQFT7wHZHFRMXcbldOtub2X3cMh?=
 =?us-ascii?Q?I0414dtCOYNXqY2h/p9sLLcwUc8g1mb+YueRXblK3z2ZjZblEkyaCiijQJ8+?=
 =?us-ascii?Q?QLs2eTuEw0Wke8+ays/9Lu02wNnMmqOcv9dOijDpULx9H332yHs+IVPbiQe+?=
 =?us-ascii?Q?H1QuPxg5ki+dvZuXRS4omFhW9xFhaNWvSwf6py+FubvDZ4TbCp98nq5bc7z4?=
 =?us-ascii?Q?ZdRPlNCQNlDzsdcYlLIHlxKQy9tVBzWR45f5dIFIvLx2OuVFmpW0N67mu+aQ?=
 =?us-ascii?Q?xKtuhd7r/yBnC91oHLyZsWemRR5nqWMxTJA1Hw3WFzoi4iMHR7EkzbnDxylw?=
 =?us-ascii?Q?d0o4J0z97UIBikXpLSI820lFSyWqyiyv+VNehCGyZE7Crb9GK/3AEZNdOBSr?=
 =?us-ascii?Q?4tVuAsCfqB6hx1QqPGrZfoJf4Zs21tVZ+ZnL6CTwksJ8IPGmv5/cAL6kW9DF?=
 =?us-ascii?Q?92vFFq2qO6f+blk2Aes685qhYbPXFqeZUEsB7Z+o52IqlN8BdNbC17SMDwcU?=
 =?us-ascii?Q?Sw2HdStuYD7xc1GKk9kyOp+jw1ZW0BSTcMgKRdWBu5EN/s0f2nMDsQCMk1R6?=
 =?us-ascii?Q?OW+/hEdyJb7aCk9hhDMgX4LITNkVDR1GeQ7f7JWU+uW9qN6Jccu1qFIGRZLO?=
 =?us-ascii?Q?liqbnQVE/UtuzeBKS9qE+lw7hl0eFV8aT6lavPPaQE2RbnvBn4oGpTpsQVmS?=
 =?us-ascii?Q?90PuVB90IfmxtoCjfYkwi+hiShXIl0sGk/JIUuD/KbYt9CbXMK8rkeV4ObN7?=
 =?us-ascii?Q?SxiJJR9MSo5D8noUBGYSdfXi0+86hTm/dpjx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sE1AjE93tZc8AraviN6V1zXjv0WWh7DY3NqMx4h66GKm2pm4WxmmtEqkdS3h?=
 =?us-ascii?Q?9EX6/dNl6Myg0sKj5nn2ZOFlEKp9D8dmk+qr49eiSLrVHngbXy6IA0PTHMi+?=
 =?us-ascii?Q?VaDSDXEU0l6AokLjIiQbE7meAg7m+XDD/xxC2lAEg2xxUedSAgYkw0WOhlr4?=
 =?us-ascii?Q?7Jl6/4kJcdu62iKHKinqAs6sINvkeN+QEN7/1b4nLkji1RJTVxX0AAU+tB84?=
 =?us-ascii?Q?zaIF+KrokuaWKcfJHLzeJHNXUnFBbTkr+hKDUYGweCl7HDqCbpxFf4WNujUj?=
 =?us-ascii?Q?2lOQJaCPUZPoWb+Jw4Q78quAXPD2yNuBUTfkqBHQ+VR5q0hQMlajwrhH6OWN?=
 =?us-ascii?Q?1VVaZ7I+Q+UOE9qi9mWpwIGaRwHkmqrT/sc8DMxK281msGKWTHdjxgLD31ZZ?=
 =?us-ascii?Q?8qZipPAwoWprH6gfCA8WuyCiJp4wJgqfQxBx1IdxaQMvhqC3TNY7JE7KiH9u?=
 =?us-ascii?Q?6MGQakJPSs/ULO6fMpkvvnEh/BwyRJ7HXBTxd2dr6XuHq3X/0InnZFQ8TZOS?=
 =?us-ascii?Q?2wDFrAQtzIkD5eACUWvuANg+Ei7SGtUpVERfoQaB3UVh+M85QL/IzlhfVMuo?=
 =?us-ascii?Q?hx9hTaaBsiQc69ppQ5ldLGp837/xaiO5PIUiLghipai6h0ih/IywabKidUJg?=
 =?us-ascii?Q?W970150azGJHLOjMFvublvhe3da8YJA4O0dB0LKNL8KU8921T6Aje7+dCgVN?=
 =?us-ascii?Q?RsAa6alasnzarweCQCvlJJAJ+39IhvLJumyA5Rgpy0hJ9mIc8p3Jw4t0C+i8?=
 =?us-ascii?Q?o6h22e4afnmykUKipwq8yxNjV2fMqv55KdCd5YNEoSc5p2hTEYrtSGjf+abY?=
 =?us-ascii?Q?7laI0TS0RuB0tqlbcXhMZ3GU7/dB563MGmOTlYyCAJDK8I9OJUWMIVHDahlh?=
 =?us-ascii?Q?LgyLfEMfanNKserdQSA0toa0tEZCoGle6/tFO/X/xXIGeGrTMKbndewXswi6?=
 =?us-ascii?Q?/+47fdlO1on4tEasLdkQ4H4/Zne8WcsZcaBqNs4JXBDPAjEZVcOUv4V0E906?=
 =?us-ascii?Q?YXPN8PTqKJVGzOfx2Z26NPixjFs3032xUlYOeOOfS3vzi4L7dUWg2/kNORzu?=
 =?us-ascii?Q?OujTOHIoTg+WIHyQe9vp2kqQ21pMjjbzcwDudp8OXkf0MHU3XItahV/Oww5L?=
 =?us-ascii?Q?Z6Tk7LkeiUgsZO93ztOm9MxAF+3hWXVg2SCoZzEz0GNZzV0saUx6Q/RKTAsw?=
 =?us-ascii?Q?uHjUU8pD63truvAorf2f5s8CalaslX7WnKbQxYlo36eA5136NhNiym5JXC1G?=
 =?us-ascii?Q?gci0UoTmCMhD9oZRB2TMmOS+H8G9PHYrOvX8imAZyOXSFiZ3hJ2s5hRYnWOx?=
 =?us-ascii?Q?X/siEsY+O2i5jO8lOhfDOQuN5khTGsBSRyH/cA2z1+vLj3WaRN2h1moP45P4?=
 =?us-ascii?Q?8k54B6rPk6ZOu1cN76D+jdVW2ndmPaAIdQWTmcS9ZVzRq9tL+udDBsrm/Nq4?=
 =?us-ascii?Q?GlWhkVaymQAkw9VD0Em7MvXrenaFb3YDqAAb+yt8duTiirGMZWlJot9F3Z9H?=
 =?us-ascii?Q?vUtZUEYTy0qnzrh+k3grg2Ei/nIsYrsF2ufkJwhVU2dNZ4SJHpKLM6i5XMNH?=
 =?us-ascii?Q?itP890PupmlT1jAfLiwxPrg+Thcjbhy7gaZ7l0av?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51f0194-202c-4465-17c8-08ddfce35ab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 09:59:16.5200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PwfrNYqLyKwcaINgknwHA4hLgK6GoWgvGupKGN9GmCgthVGWKYRIl2TJ8CM4OZsoMTwMsyIPQL3mxPMcByTFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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

> Subject: [PATCH v2 1/2] drm/dp: Add drm_edp_backlight_get_level
>=20
> Implement drm_edp_backlight_get_level() to read the current backlight
> brightness level from eDP DPCD registers via AUX channel.

Versioning info should have been here
Like this=20
--v2
<Changes Done>

With that fixed LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
> v1 -> v2: Use drm_err.
>=20
>  drivers/gpu/drm/display/drm_dp_helper.c | 52
> +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1ecc3df7e3167..16da5df805aa5 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3945,6 +3945,58 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct
> drm_dp_aux *aux, u8 color_spc)  }
> EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
>=20
> +/**
> + * drm_edp_backlight_get_level - Get the backlight level of eDP DPCD
> +via AUX
> + * @aux: The DP aux device
> + * @bl: Backlight capability info from the panel
> + *
> + * Reads the current backlight brightness level from luminance mode
> + * (24-bit value in nits) or DPCD AUX mode(16-bit and 8-bit modes).
> + *
> + * Returns: Current backlight level.
> + */
> +u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct
> +drm_edp_backlight_info *bl) {
> +	int ret;
> +	u8 buf[3] =3D { 0 };
> +	u32 level =3D 0;
> +
> +	if (!(bl->aux_set || bl->luminance_set))
> +		return 0;
> +
> +	if (bl->luminance_set) {
> +		ret =3D drm_dp_dpcd_read(aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
> +		if (ret < 0) {
> +			drm_err(aux->drm_dev,
> +				      "%s: Failed to read luminance value:
> %d\n",
> +				      aux->name, ret);
> +			return 0;
> +		}
> +		level =3D (buf[2] << 16 | buf[1] << 8 | buf[0]) / 1000;
> +	} else if (bl->lsb_reg_used) {
> +		ret =3D drm_dp_dpcd_read(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 2);
> +		if (ret < 0) {
> +			drm_err(aux->drm_dev,
> +				      "%s: Failed to read backlight level: %d\n",
> +				      aux->name, ret);
> +			return 0;
> +		}
> +		level =3D buf[0] << 8 | buf[1];
> +	} else {
> +		ret =3D drm_dp_dpcd_read(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 1);
> +		if (ret < 0) {
> +			drm_err(aux->drm_dev,
> +				      "%s: Failed to read backlight level: %d\n",
> +				      aux->name, ret);
> +			return 0;
> +		}
> +		level =3D buf[0];
> +	}
> +
> +	return level;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_get_level);
> +
>  /**
>   * drm_edp_backlight_set_level() - Set the backlight level of an eDP pan=
el via
> AUX
>   * @aux: The DP AUX channel to use
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 87caa4f1fdb86..0b045a47ae573 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -864,6 +864,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		       u32 max_luminance,
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u32 *current_level, u8 *current_mode, bool
> need_luminance);
> +u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct
> +drm_edp_backlight_info *bl);
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
>  				u32 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> --
> 2.43.0

