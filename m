Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A4674F76
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB3C10E9FB;
	Fri, 20 Jan 2023 08:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0410E290;
 Fri, 20 Jan 2023 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674203271; x=1705739271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HooEzc/5ux3/XgEa/lU9w/BQq1ne/N0POb7mVT8Cx5g=;
 b=KKFgQBSG3Db2bQLDi1+4Bss/dOahCXEqLuSUAPOG37/lWrukrFQhlaM4
 +NxCpVf+Nu/tl0XRhp+eiY3zdTysHmB+3butwBshV+muKRszazT50pGTr
 B6YOnl/O+Nb4dImjtz3yM0R1CH0fVDe2o9mGJS+GND9/M4oROho9R9jaV
 CrAF0PNqx9GClU9jC8CLkxu3HUzMTFG8s+AabFFo15LMP+G5MQGWEaffj
 A7PkSN+WsB6piYcfOZUn7sh4eqM1s2ybEl+1uBK6eWsie1VyGN9laRxLS
 hLhYveigfEyzBh+wOAwA0mFoQfF1o1K4dEZKNVw1pDhFNswA/UR4qcpyh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325568661"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="325568661"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 00:27:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834338602"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="834338602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 00:27:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 00:27:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 00:27:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 00:27:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVAk2Ch6yZ58pLh3lT6W0BSZY0TBiMhiNKDWAYkINOxLeA8Yk3hSeloHY2Ibmdkalonf6YGRgutrrxkDDGCY6DXTlaS6UMjSUQ38JliO668A82JI4PntznfcY+FVrhf7txx5CFMA4017d1PdZjdfq5pSN7xEPiKi0g+8m/du+NiwxCMPBizZbPeUsrt5L+CETd6NH/Uidb6dG+j3TY8fADl1ot9MSlUK3t7EybU345t/HHCYruBj8GQXRKjv3s8W8UL8Ew2zI6tqB83HuQnsvtjLwQZ60/pDwbUncgImyd72NQX+cIb7r6LumkeM5MAM73J5XC1eWchCIxY8dh7zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzMbLrgqjR6G9ZyexWzN6ecyKLc8TY9drxvfdNKxNpM=;
 b=i6cEmTocn8k/6NKgdQ+QMqIkuVhmQl7BcMR6c4eGpb28+1zvOmy+gcELisaSgU7EVCV5nkmZsax6v6m2ql8gXAqlKbZNuNQNrnmw84C1DIKr+CesRBShfGmj9G4V0nx4rziR+QncxJJk4mXit0g2cNWi0kY0YKtRuWYE4rXdzVOcDEeSIHcohQo3dLFwRa0Q1I3N2tj2piY06602ZYe1wLC3AlrQgwmacYDuxwwohimP7+ZXdMLKKvhqDDiFSs9p0Bm75HVXWnXRi9GoB0FvFokF1x0D362bGx+QlpTDBZcg49+LD0FYbp8Q5bBbP0XOZn4sunHdJ4PnUMqUXecPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 08:27:46 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::1e74:3442:77ce:6ef]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::1e74:3442:77ce:6ef%8]) with mapi id 15.20.6002.013; Fri, 20 Jan 2023
 08:27:46 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR
 completion
Thread-Topic: [Intel-gfx] [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR
 completion
Thread-Index: AQHZLD9OVFkzceEkq0uYySZREZaQ566m+NMw
Date: Fri, 20 Jan 2023 08:27:46 +0000
Message-ID: <CY5PR11MB6211B8731BEFCDDD4A3F270B95C59@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA2PR11MB4779:EE_
x-ms-office365-filtering-correlation-id: 68c07309-41bc-4040-c736-08dafac035b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tR2cFLYNdFFrn0XwSAOO3tKojCN40aVz+/8JtDC57nxyhTsksaRbpKATTrxD5/fuIOgryLQ0zMBClH0IHBhxdYrCj4S3LtX4yMgtS6z+toUtiZduiXai7FQlS9Mgl2G8chkBbC9z7XCwYWoD2EAD5HTJpgb0TMnsgzYnHkkPe0N+Si74BCX4apse5H536C5bqfT1Iv2a/QF8G/XIryf1VsqnShD4EDgm1xLUnC1QgQrY5Qs5u1F+pDdF14EJceJy25Z24VcqaaAwNzN9KOhyIQErTyF5EF+Bqm9jOFCIJMppvQ4tfE2p3qRbcGoxzbrPd86TMyr6PBfzH87L3reQGmZmSuQ0grmZPkDTdE6RtA+MWEGVN1xrs+vR2OJaRLTVtPNpRHMgPOumzqZ6SILm5LKoFtPQoaqXPNvxRg2XpUAhs13D92ztMxISsCuNFs2CJ0JwQdgRJNnL+LkkzjSwb8/LgrOWyMPH5hUuY+r1cyJo2k7KT0iJR8u0VGyPb7tiL4EztgxDOAotge9MeK3vpdo+sAL94E4MEkpR+jQt2eVFyI/WT/GPFqF9SH8sv+6+edadSBChiVi9KpVDOThSONEB2In8UjHUXlwb9Q0UUZfAHPwwLLFh/lqYnnt8XIblkex2BApPxbMiBfRCOMk+CAb6Fsz0AwNlERcvTQUCTY34se107Sm/tqkNqgQmzcnALwbU+6vgd9uAXtYy0+gzzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199015)(83380400001)(52536014)(122000001)(5660300002)(8936002)(316002)(107886003)(86362001)(7696005)(33656002)(478600001)(6506007)(53546011)(55236004)(38070700005)(2906002)(26005)(9686003)(54906003)(110136005)(55016003)(38100700002)(66476007)(66556008)(66446008)(4326008)(8676002)(76116006)(71200400001)(82960400001)(64756008)(186003)(41300700001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JA0uc0UP9UqkV8CNCEDxn0yqwnO4Oa7wyxXY08lDfsq2Rg24FNK9M/UuUqpj?=
 =?us-ascii?Q?VZmEhsmvS/L1smcnv8JNykOensxIO0SJh+LrhdOcGjpwJCXecsU5SBsH/LXj?=
 =?us-ascii?Q?hbFasSYPryI7zJVsexsZto2lyJu6xS99WonnPBVd9P18LUoS65uSy0mRxR7D?=
 =?us-ascii?Q?RHYh9derQgQ57Bz5pGlKmq1+fNYiEKSuFsHeV0Uxpv1lZ21DXRpfpn5KMZch?=
 =?us-ascii?Q?GOdkkz5hGMVbybMTj1+OM0tTv5gh82XSCxzn9BT73wAdEdFS94QwL1uT3/Fb?=
 =?us-ascii?Q?KoO5rQd+Vtp9ZMIAxXek8p12PU2h1XRlYt1ISY93njQ1mi1OE2X6zuiVlzju?=
 =?us-ascii?Q?QMRKc/h3wlBczoN2xbK1vfwQEzJQfK8CkFB4wLNovaloxLSpQOsSH9Txfqq2?=
 =?us-ascii?Q?mUTZhBxd3mmz99pODL3Oqy+NxOTRj09uk9kFpMPcJ8ULR474ikNHEUwM6+gt?=
 =?us-ascii?Q?tby2j9RHByFKkL/hLEfT0W0juHwdDk5FxLKkGBgY/TUaoi+MfrnBCgGxWJQz?=
 =?us-ascii?Q?ta2mDrAgjETIMfIYG2mz/5jPak68C8pTSr5Ny5CmrBlMHW/1wcbtTImqLvee?=
 =?us-ascii?Q?19GVFPs0EgE7mF/8H/5Az1GpwiyV03NhwjiOiyKAHNG+B3gg1jadKa0TCsfn?=
 =?us-ascii?Q?fgqIIatOL8Z+dMrth3x+/0JH0zmVQm46+ELfWXevD3sRSpUCV9QZQN6R8qA0?=
 =?us-ascii?Q?SyG8R/nFgbbmPqvQvx484hCvutytLzRS00LENuZv6ARbzG6C+nnctNO7pgsV?=
 =?us-ascii?Q?sSc6blNdtotF8sIjkgCr2K3mapIlrSd86AAJh85mDmumNp3xaRo/5PIUnAPK?=
 =?us-ascii?Q?paGQ+h5H5Q8AeZl6MbXxqUqKZkZlFgCbWPmbIy4U2zonDYfBAX2SBviGSYtN?=
 =?us-ascii?Q?RPaV3UlwdkqcjlP8Ca4BJ3aKVM+JWXLUKutNjwoy8OJ+SB1FcAhkKHIkz7Kh?=
 =?us-ascii?Q?U9aYIrVHEzUPYN0E9pq8KvIPI16+CAYwU74F0IhwBfs1pCaCmQthR0a8AIhZ?=
 =?us-ascii?Q?7ZekA0nKeQ6l7RaBoIxtDuH0ymjpoqrn5zKuvU9WWLMbv3eSAbUzzD9Zh0wo?=
 =?us-ascii?Q?Mn9rCECCKWRpI4JI3GVr7KItDQgn8NXWS6BFMTcEMbXeRcpfMLiYuozWvhWy?=
 =?us-ascii?Q?RcPhMi7V7csUmlsO1VIptDWY4LzzE5O6+dhulEDXjWhLx2TkU2y95ZEhl+0G?=
 =?us-ascii?Q?6eNpC8r5SV/M3uR4Dr6k3mWEFqsDC2kTgYuFPypDJ0+9f3r558IqO1Bux1E6?=
 =?us-ascii?Q?QwwQmqs0q2yg5OITc16yaVhAxMaYxjYld22Ui4gTdwA4Krjvvr24tLcnzdvJ?=
 =?us-ascii?Q?THVNaMc4s2Sj5kA7hKN+20PEIhnK8HOYRUAQzeQxw12IlKqYwwI3HDP+X2rV?=
 =?us-ascii?Q?tZrVu8+w2L1kccJlMXBFrTHjIn+BT9Kc9xMjmCuLIrZAaHsKkIETNoZqje10?=
 =?us-ascii?Q?CPJwjwXAZVHtoxhASgoeaOFLR4Gr3abMWgd26vVQFzoNvdGV5uSPfjIbuEcI?=
 =?us-ascii?Q?5F74J1F/doPz7M38Kc0lNo8rrCGzY9xUyTBibYb4r1xYKa19P9GwlVmFsOxA?=
 =?us-ascii?Q?DturUVYN6cOvDksiylLX80neTgIaZETK4/gz+CDV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c07309-41bc-4040-c736-08dafac035b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 08:27:46.7160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUEKU7ztDnyafx0ydGrNsTGj0eSo+Zy4RXzeozxrcBhGauTax6/3n2MDQL8K4nzbMPr2WtJ5Ykv8YAOIoBbzA2tm3U5Olb8kyjqcNDPdWNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Al=
an
> Previn
> Sent: Friday, January 20, 2023 1:20 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: Vivi@freedesktop.org; dri-devel@lists.freedesktop.org; Teres Alexis,
> Alan Previn <alan.previn.teres.alexis@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [Intel-gfx] [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR complet=
ion
>=20
> The Driver-FLR flow may inadvertently exit early before the full completi=
on
> of the re-init of the internal HW state if we only poll GU_DEBUG Bit31 (p=
olling
> for it to toggle from 0 -> 1). Instead we need a two-step completion wait=
-for-
> completion flow that also involves GU_CNTL. See the patch and new code
> comments for detail.
> This is new direction from HW architecture folks.
>=20
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was
> loaded")
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c
> b/drivers/gpu/drm/i915/intel_uncore.c
> index 8dee9e62a73e..959869e2ff05 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2748,6 +2748,12 @@ static void driver_initiated_flr(struct intel_unco=
re
> *uncore)
>  	/* Trigger the actual Driver-FLR */
>  	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>=20
> +	/* Completion Step 1 - poll for 'CNTL-BIT31 =3D 0' wait for hw teardown
> to complete */
> +	ret =3D intel_wait_for_register_fw(uncore, GU_CNTL,
> +					 DRIVERFLR_STATUS, 0,
> +					 flr_timeout_ms);
We need an error here if above wait timeout then below wait is essentially =
a NOP.
And driver may return before completion of FLR.
Thanks,
Anshuman Gupta.
> +
> +	/* Completion: Step 2 - poll for 'DEBUG-BIT31 =3D 1' for hw/fw re-init
> +to complete */
>  	ret =3D intel_wait_for_register_fw(uncore, GU_DEBUG,
>  					 DRIVERFLR_STATUS,
> DRIVERFLR_STATUS,
>  					 flr_timeout_ms);
> @@ -2756,6 +2762,7 @@ static void driver_initiated_flr(struct intel_uncor=
e
> *uncore)
>  		return;
>  	}
>=20
> +	/* Write 1 to clear GU_DEBUG's sticky completion status bit */
>  	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);  }
>=20
>=20
> base-commit: 0a0ee61784df01ac098a92bd43673ee30c629f13
> --
> 2.39.0

