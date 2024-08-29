Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F984963F74
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56610E365;
	Thu, 29 Aug 2024 09:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW1Ib94q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A843C10E365;
 Thu, 29 Aug 2024 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724922358; x=1756458358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qHgpuYkQtf9P1R5rsetqIAQz1fHsIlQchDJaenk/UJU=;
 b=AW1Ib94qytreW2lEpPbDJ3jJaO3b2Zn6KtjcwFNqqnM20CgJPRHP1Zu6
 LW4Y7lZHRdUcxpTwzmllCWAJ1NhXOg7p4mWG4eSKGg2gE7SVdPVwxzwDq
 WMD3d4fYcRIypiZP7lxBUHt16DUph0o4xtYZkqA1OvZTVW2O5TR7TR/7s
 uTURuPd0LaGWRizjfrneC542NjyObBmDRBRhXecB4KqhRQfa9lLDAAPg9
 dFEXVn+nshiFIxjWQm6rZRko0gPUqKbBnl8tUfD6A99JfA0AMqMeekTZ1
 xwin1AcFiXr91HnuHE7NQSILuw2MXsWV4Riyam1ZCOPbgOtgku1X/xlUD Q==;
X-CSE-ConnectionGUID: UnP9NeWkQF+U8MHKX08HVw==
X-CSE-MsgGUID: o6XOpvDATvm88NkC9EKFFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23077747"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23077747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:04:25 -0700
X-CSE-ConnectionGUID: l9G0SaW5QfKry4pfbpNbAQ==
X-CSE-MsgGUID: O+2NioMATH+e9BVoRFlSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="68419584"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 02:04:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 02:04:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 02:04:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 02:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4vWJC1qyUlmPWvNqY7IT8YHWGg7iuXALsczbGXOsWegnrKmQGfAx1TH0DMCqvj5+gSuOTEixwnhtT2BhD3Fx+YkgfBIIH24hd1+NrK5V7/CxKP+DXRk7CpXIL2CPkD7cuqGu7LBNAB2Z5Aq1x7Vur2PwI1ywYRX22l5ipSYCGknK/ZlgyAjfzGBdGeJEcmymgs156NrsUcB4TV9v6atGpQzbO7SD8W/uBweLSizLnBk/4JtxZMoyOiVQKCtFbEsbOQetHAn/L1Efl/87lWswWRzM/i60nVWLsfmXuYWfgFXbmaEX7PUt0S5pwrv+iXPSoStEA+Vd8brUJS3owSNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZQ3JFazXD93CmqIpVxw3U/oNanEaYrv7Q77SjSHtLU=;
 b=Ufd9I1vqbYHf9sjk4LY4WOXEu4ZV1aCblt6dZDubNgb+lsF5KZlDnNjEscBNbx47NGGre6WJtAxOhmhIyk8mZSe8fDxjrYyarOZKdR1eQv0/+W7eyfhMtXW7ahPw++GaugYdjfA3mKw9IIIVvEAwW/pYqpoBDjEjU5ZSYnq+dsOoOdUMPKP2rlsvbwb4jIXgGm5Bj0D1Y7/kOle9wMRwW3NdD440bVq2quCqMiKc/32XFdmSRB6ifZ27B5E4ZN3qSRsiuSVl0QG7xCfkag+PGsHNHJ21fAg/FSK4oCCz8XGylFVJytEKX28qTcK6nfppHAnPEEYXbfSG88cp2DLR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 09:04:16 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 09:04:14 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [v4 2/5] drm/i915/display: Compute the scaler filter coefficients
Thread-Topic: [v4 2/5] drm/i915/display: Compute the scaler filter coefficients
Thread-Index: AQHa0Q5GFJTuGLdciE68+ynLkGvDHrI+BDsQ
Date: Thu, 29 Aug 2024 09:04:14 +0000
Message-ID: <IA0PR11MB7307353A666BE6179B28A2CFBA962@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-3-nemesa.garg@intel.com>
In-Reply-To: <20240708080917.257857-3-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH7PR11MB7027:EE_
x-ms-office365-filtering-correlation-id: a976ad0f-b58d-4eda-4a87-08dcc8098e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?rN2eWCYO9xIGw6Sg0Zppx8MS03KmdxVNtDrDikO4jS1Aj1CVr3egvNOrGr?=
 =?iso-8859-1?Q?o7YE52uNZ9Zotr+Kk+LcCNsIra/y7SmmaO6751UWewNRjj60Voo8RyTvrx?=
 =?iso-8859-1?Q?VsQ4XSQAFTdSDxa8wzI/VqfpPzp9xx+HSwQBBjWpFxsOkH6LD63eID/hZV?=
 =?iso-8859-1?Q?Y28vUhuaq7fMMN796Ri7FUszl4paAYNEjDL2WAw6oJMjB0jrgoSvj5F8Ts?=
 =?iso-8859-1?Q?vEuVlvo4RTNvcVCgBkiQ29sLYvmPogmWJzqmXHdllsVVAaNfGY9cB6Y/xw?=
 =?iso-8859-1?Q?SqGg854SlFzPstNa/+DO0Fdgwwxb9RlkQl/KAZ9zgBlEVszmc7t0ZhsS7o?=
 =?iso-8859-1?Q?pJ9HtYysGSJwzn1AWAMwdHC0jmtHJPds7vkVc96s7H5puxkbOwTk+g09bN?=
 =?iso-8859-1?Q?zcjcAXIX1scPks1Hx7Fqa7TDSrhLRkMh8pZmGkWngtWQFXNrD0HsJR2UcN?=
 =?iso-8859-1?Q?PtB3h1QelDXk2zpMhLYdt3J98UENR+dUD5CXSxsx4H20DcKT0ihCzhbYct?=
 =?iso-8859-1?Q?V3skfI3RbP5eSpsH7ZVuvvRuq7FmRJl+KForQm/eIVqkbRxUhofc8g1/mt?=
 =?iso-8859-1?Q?1UetiudS8yG/2mBNqMtROJyF8rkPftjmInwnWOCcP4di+8Hc+Eelh9OyCR?=
 =?iso-8859-1?Q?3GE5x0MESi5ruJQnsjJpmU0cOCQ/4eTb/Ek6SVG/feU42hQ5jRonSl4Prb?=
 =?iso-8859-1?Q?6AU8CumO8aEkkuSIBNhTn/osUctUmlSEZ9AIkWMl/cgsJie2gYS8ssrjkq?=
 =?iso-8859-1?Q?DjmLS1d5NGHaB6FInEYOvEIPOEfMGLaFigsCn+vDJtDfe2cbQSFXlXpiVd?=
 =?iso-8859-1?Q?IfpNsbKBArXQC2BHgyqWFOUQKGj8XGNdQ7VpXBYEJcWYp1lXvd1Vr4MimK?=
 =?iso-8859-1?Q?48ADBRaXNKBB91Qv/EP37vhAEjdMK7pThoY1hPPbtA1/J4HVnSo2E8FxJf?=
 =?iso-8859-1?Q?JMpKkjh+/UsmKdXxLLt+WXZQAXAROGFw3bBL6G7YZFVx/PCtHHTkOuOkHe?=
 =?iso-8859-1?Q?QvxNlLukc2V2K5/l2Q87uRNM5H58X9dzy5G+GljOJ+qVOeUnF0GZ3fJwb7?=
 =?iso-8859-1?Q?vv40AVo1ril4MCVUCXKVVKd/dqqfq97yBs1cBtFawUOCfOlu4sKWQ7PAnx?=
 =?iso-8859-1?Q?DkvN+iVE7gVeI1tA6qBTl76LauiL4NkJdcHVTrJhYVH40heohVfqy6LVm6?=
 =?iso-8859-1?Q?5VjwqhaaQ1P4kO2d5/HfzeR/m7h+o0NkRWV+0WkrClUtbPcbSVMNS14QJA?=
 =?iso-8859-1?Q?ngqK17OHQXwaqp28aHhVrm3aPUpw35oJf+04l5WZ05G4SOnBBGtBGaL1nA?=
 =?iso-8859-1?Q?MDhiEpTENzhXdplHVML9D8ubTL1HFMi9K6AWQxITYKLf1Oqo9qHW2KKQ4u?=
 =?iso-8859-1?Q?mSEe9YLPukrUShp5pVAlgn8a41MYea2jlvE7qKJtchk6eNPlaZdoQf3rTR?=
 =?iso-8859-1?Q?eLQH6ADACUtjxcJV1f8lPn0eVzakKrSD1FdOCw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v/hChLznAvEy/lSQYu9iBqtiLshmIE/RoQiCGHuMAu//42W8xsH/SQjtfb?=
 =?iso-8859-1?Q?T/IkOj+hM5Z927yw+RHTG3kg3Sjmt5WLCPR4IneOHsrGt8FWTYjk7QcUeU?=
 =?iso-8859-1?Q?2KrKw/d5mbKEU9sTEHMLr58bmYS5xWDVGhAnXL9a+lLWMfu0iM2i6jIepn?=
 =?iso-8859-1?Q?OGFmV9Z4s3u3yxDKoU3nLLJws8W8MCcfkDz91gnMRdDR9AevhomiJPWMPz?=
 =?iso-8859-1?Q?XSg8h8fbYvJR/z2bZDPMfN3RoaxrqocXOAn10DVW3CTWxGEMJd5juIwZig?=
 =?iso-8859-1?Q?Dio/UFu9l1CgFuZkOvPACVELR3BiVGiQIS99mmDXMZMzeOK9D7c3EhaBJ6?=
 =?iso-8859-1?Q?SVFtobKG3KitMuYOIZBXz9V1nAT2Z2dmmasafvjLX3I+9t/Fqm6C2rxfEK?=
 =?iso-8859-1?Q?63+SQ0D8yqQRvCoNbHgnDBfNKitqK1UwMpP4V7m4aPcyyNoa7m9ZpKcTUI?=
 =?iso-8859-1?Q?yr100v9UVbJMFDhHqeOCEU5mpiYeQcjRGvLSWds5MR9UFhh/e5XMwz+kLw?=
 =?iso-8859-1?Q?stsvDaHlP0mi/u8BD35WAltpDidwW1E8TJN+NLdtWdmIaLRbKgJRxOYSd0?=
 =?iso-8859-1?Q?5xHkHqFvaL39lEO9PUdBV3cdYvEe/YE55E0olPMiXJPTTDcqE0v5MSN11P?=
 =?iso-8859-1?Q?aKkUBYvjHr7HgMbgc+Z3GdjiphuBXv5cFmS4kdjtY2InhGZK8YHvThNaEb?=
 =?iso-8859-1?Q?6Jl5+LeeIMtXeei0y5lvTJc9avtFjG2yFPEaBUzK4bpffbJGDqCFVWaTez?=
 =?iso-8859-1?Q?dniKkN4wfPauhMI3IK21gYqgbehv880o/fpT/3bIW5nlfp/idcoAbDHB3I?=
 =?iso-8859-1?Q?0nSENkpwfaPpW/myLlPVsn3I6DJj3T5+NLkuNoXZeajlkEvhSY/VD+BULp?=
 =?iso-8859-1?Q?vsRB35BmWWRqxYt7NBavmX/NFrxzPUka98ZMtCPkGrXqhQh0lF/HfuN6p8?=
 =?iso-8859-1?Q?pqwUZixPeLc99YiT3sRtEc2dYywSEgOmkXGMg3Cu6NQR4PAddgRes4r//B?=
 =?iso-8859-1?Q?t9HpxFzfZzl+nWh+T5iN4Bf5WwCSDsYEMLdoKaXud/inOU/HQUa9BODi2O?=
 =?iso-8859-1?Q?5HXTyeSx1EKN+Tl0n38l6pZKWHE/IM84ke09rwi3Uh89ElCy4/u/TfHNAk?=
 =?iso-8859-1?Q?n9hQTbwsyNM2YQMAo53LoCIVJPRI+WJEoA0Aqj0Fc1ztvocFJRbIulV7Ft?=
 =?iso-8859-1?Q?g8NO1xC054C3c58p2ZCdW61PK4Yt4mk8/sVU7G9diU4fv6bbCNYOoUhR/e?=
 =?iso-8859-1?Q?xpYl7ZXoiN9uiHK7+F//gh1aTFkg3rDUf/CozJ5sVguWld+oaptN+rDcdp?=
 =?iso-8859-1?Q?vxzpK+I7ocZKK/eBpSLNlsxrAJDxRnpWEZUcnGm6jle1q1Tm/uFDCJUe/N?=
 =?iso-8859-1?Q?DS/Xgd9Gp5vvZB+rpacbww/NDUe1a9rOhXdI+RsXUz44snCJ/Mcx/SmgyC?=
 =?iso-8859-1?Q?zqIh+5hLBBVdmkUwXgI1S77r37YCUkxQnNV9aNLzug36HIt0U4za1omSZW?=
 =?iso-8859-1?Q?Sahq3gTxsZmyBZ3pabpDqxavqgePOLi/p8BzcsMdm+v5pkI59VIdQlFHMB?=
 =?iso-8859-1?Q?wxLrj3FjXOQ9+eeEKNV5rE1f7RHiyw6Q8d0vSsIud21rsZoVbjlbCwsvMO?=
 =?iso-8859-1?Q?jvp4Mafc1sqNGLF9LfAepdDSh3ZdygxlSAuO8iJjl7Hx0tvukBlpnvbT5i?=
 =?iso-8859-1?Q?LG6bwT1XH8/0/j3dGc2GA/F7tPfPU9zeMFIeUNHv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a976ad0f-b58d-4eda-4a87-08dcc8098e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 09:04:14.3626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulJroCgdf3tr2Zbo5zUO8vCbe6CQhOvuchgSsa3DNQq+fXo6if2iNmH5yx1Aik1gUEmyZRQxgxFllfPeyYD+Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ne=
mesa
> Garg
> Sent: Monday, July 8, 2024 1:39 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [v4 2/5] drm/i915/display: Compute the scaler filter coefficient=
s
>=20
> The sharpness property requires the use of one of the scaler so need to s=
et the
> sharpness scaler coefficient values.
> These values are based on experiments and vary for different tap value/wi=
n
> size. These values are normalized by taking the sum of all values and the=
n
> dividing each value with a sum.
>=20
> --v4: fix ifndef header naming issue reported by kernel test robot
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_display.c  |   2 +
>  .../drm/i915/display/intel_display_types.h    |   9 ++
>  .../drm/i915/display/intel_sharpen_filter.c   | 121 ++++++++++++++++++
>  .../drm/i915/display/intel_sharpen_filter.h   |  27 ++++
>  drivers/gpu/drm/i915/i915_reg.h               |   2 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  7 files changed, 163 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h

Can a unified name be used across the patches. -> intel_sharpness_filter.c

>=20
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index c63fa2133ccb..0021f0a372ab 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -280,6 +280,7 @@ i915-y +=3D \
>  	display/intel_pmdemand.o \
>  	display/intel_psr.o \
>  	display/intel_quirks.o \
> +	display/intel_sharpen_filter.o \
>  	display/intel_sprite.o \
>  	display/intel_sprite_uapi.o \
>  	display/intel_tc.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index c2c388212e2e..a62560a0c1a9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5906,6 +5906,8 @@ static int intel_atomic_check_planes(struct
> intel_atomic_state *state)
>  		if (ret)
>  			return ret;
>=20
> +		intel_sharpness_scaler_compute_config(new_crtc_state);
> +
>  		/*
>  		 * On some platforms the number of active planes affects
>  		 * the planes' minimum cdclk calculation. Add such planes diff -
> -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8713835e2307..1c3e031ab369 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -55,6 +55,7 @@
>  #include "intel_display_limits.h"
>  #include "intel_display_power.h"
>  #include "intel_dpll_mgr.h"
> +#include "intel_sharpen_filter.h"
>  #include "intel_wm_types.h"
>=20
>  struct drm_printer;
> @@ -828,6 +829,13 @@ struct intel_scaler {
>  	u32 mode;
>  };
>=20
> +struct intel_sharpness_filter {
> +	struct scaler_filter_coeff coeff[7];
> +	u32 scaler_coefficient[119];
What is this magic number 119 and 7?

> +	bool strength_changed;
> +	u8 win_size;
> +};
Better to have this struct in intel_sharpness_filter.c as this is not used =
elsewhere.

> +
>  struct intel_crtc_scaler_state {
>  #define SKL_NUM_SCALERS 2
>  	struct intel_scaler scalers[SKL_NUM_SCALERS]; @@ -1072,6 +1080,7
> @@ struct intel_crtc_state {
>  		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>  		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>  		enum drm_scaling_filter scaling_filter;
> +		struct intel_sharpness_filter casf_params;
>  	} hw;
>=20
>  	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> new file mode 100644
> index 000000000000..b3ebd72b4116
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + *
> + */
> +
> +#include "i915_reg.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +#include "skl_scaler.h"
> +
> +#define MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER 7 #define
> +SCALER_FILTER_NUM_TAPS 7 #define SCALER_FILTER_NUM_PHASES 17
> #define
> +FILTER_COEFF_0_125 125 #define FILTER_COEFF_0_25 250 #define
> +FILTER_COEFF_0_5 500 #define FILTER_COEFF_1_0 1000 #define
> +FILTER_COEFF_0_0 0
> +
> +void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
Can i915 be used instead of dev_priv?

> +	int id =3D crtc_state->scaler_state.scaler_id;
> +
> +	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> 0),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> 1),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	for (int index =3D 0; index < 60; index++) {
> +		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc-
> >pipe, id, 0),
> +				  crtc_state-
> >hw.casf_params.scaler_coefficient[index]);
> +		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc-
> >pipe, id, 1),
> +				  crtc_state->hw.casf_params.
> scaler_coefficient[index]);
This is an array of 119 elements any reason of using only 60 over here.

> +	}
> +}
> +
> +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *co=
eff,
> +					  u16 coefficient)
> +{
> +	if (coefficient < 25) {
> +		coeff->mantissa =3D (coefficient * 2048) / 100;
> +		coeff->exp =3D 3;
> +	}

If () {
} else {
} if () {
}

> +
> +	else if (coefficient < 50) {
> +		coeff->mantissa =3D (coefficient * 1024) / 100;
> +		coeff->exp =3D 2;
> +	}
> +
> +	else if (coefficient < 100) {
> +		coeff->mantissa =3D (coefficient * 512) / 100;
> +		coeff->exp =3D 1;
> +	} else {
> +		coeff->mantissa =3D (coefficient * 256) / 100;
> +		coeff->exp =3D 0;
> +	}
> +}
> +
> +static void intel_sharpness_filter_coeff(struct intel_crtc_state
> +*crtc_state) {
> +	u16 filtercoeff[MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER];
> +	u16 sumcoeff =3D 0;
> +	u8 i;
> +
> +	if (crtc_state->hw.casf_params.win_size =3D=3D 0) {
> +		filtercoeff[0] =3D FILTER_COEFF_0_0;
> +		filtercoeff[1] =3D FILTER_COEFF_0_0;
> +		filtercoeff[2] =3D FILTER_COEFF_0_5;
> +		filtercoeff[3] =3D FILTER_COEFF_1_0;
> +		filtercoeff[4] =3D FILTER_COEFF_0_5;
> +		filtercoeff[5] =3D FILTER_COEFF_0_0;
> +		filtercoeff[6] =3D FILTER_COEFF_0_0;
> +	}
> +
> +	else if (crtc_state->hw.casf_params.win_size =3D=3D 1) {
> +		filtercoeff[0] =3D FILTER_COEFF_0_0;
> +		filtercoeff[1] =3D FILTER_COEFF_0_25;
> +		filtercoeff[2] =3D FILTER_COEFF_0_5;
> +		filtercoeff[3] =3D FILTER_COEFF_1_0;
> +		filtercoeff[4] =3D FILTER_COEFF_0_5;
> +		filtercoeff[5] =3D FILTER_COEFF_0_25;
> +		filtercoeff[6] =3D FILTER_COEFF_0_0;
> +	} else {
> +		filtercoeff[0] =3D FILTER_COEFF_0_125;
> +		filtercoeff[1] =3D FILTER_COEFF_0_25;
> +		filtercoeff[2] =3D FILTER_COEFF_0_5;
> +		filtercoeff[3] =3D FILTER_COEFF_1_0;
> +		filtercoeff[4] =3D FILTER_COEFF_0_5;
> +		filtercoeff[5] =3D FILTER_COEFF_0_25;
> +		filtercoeff[6] =3D FILTER_COEFF_0_125;
> +	}
If this is always a constant, then can this be in a lookup table?
> +
> +	for (i =3D 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
> +		sumcoeff +=3D filtercoeff[i];
> +
> +	for (i =3D 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
> {
> +		filtercoeff[i] =3D (filtercoeff[i] * 100 / sumcoeff);
> +		convert_sharpness_coef_binary(&crtc_state-
> >hw.casf_params.coeff[i],
> +					      filtercoeff[i]);
> +	}
> +}
> +
> +void intel_sharpness_scaler_compute_config(struct intel_crtc_state
> +*crtc_state) {
> +	u16 phase, tapindex, phaseoffset;
> +	u16 *coeff =3D (u16 *)crtc_state->hw.casf_params.scaler_coefficient;
> +
> +	intel_sharpness_filter_coeff(crtc_state);
> +
> +	for (phase =3D 0; phase < SCALER_FILTER_NUM_PHASES; phase++) {
> +		phaseoffset =3D SCALER_FILTER_NUM_TAPS * phase;
> +		for (tapindex =3D 0; tapindex < SCALER_FILTER_NUM_TAPS;
> tapindex++) {
> +			coeff[phaseoffset + tapindex] =3D
> +				SHARP_COEFF_TO_REG_FORMAT(crtc_state-
> >hw.casf_params.coeff[tapindex]);
> +		}
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> new file mode 100644
> index 000000000000..6ab70a635e2f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_SHARPEN_FILTER_H__
> +#define __INTEL_SHARPEN_FILTER_H__
> +
> +#include <linux/types.h>
> +
> +#define SHARP_COEFF_TO_REG_FORMAT(coefficient) ((u16)(coefficient.sign <=
<
> 15 | \
> +			coefficient.exp << 12 | coefficient.mantissa << 3))
> +
> +struct intel_crtc;
> +struct intel_crtc_state;
> +struct intel_atomic_state;
> +
> +struct scaler_filter_coeff {
> +	u16 sign;
> +	u16 exp;
> +	u16 mantissa;
> +};
> +
> +void intel_sharpness_filter_enable(struct intel_crtc_state
> +*crtc_state); void intel_sharpness_scaler_compute_config(struct
> +intel_crtc_state *crtc_state);
> +
> +#endif /* __INTEL_SHARPEN_FILTER_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h index 0e3d79227e3c..9492fda15627
> 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2257,6 +2257,8 @@
>  #define   PS_VERT_INT_INVERT_FIELD		REG_BIT(20)
>  #define   PS_PROG_SCALE_FACTOR			REG_BIT(19) /* tgl+ */
>  #define   PS_PWRUP_PROGRESS			REG_BIT(17)
> +#define   PS_BYPASS_ARMING			REG_BIT(10)
> +#define   PS_DB_STALL				REG_BIT(9)
>  #define   PS_V_FILTER_BYPASS			REG_BIT(8)
>  #define   PS_VADAPT_EN				REG_BIT(7) /* skl/bxt
> */
>  #define   PS_VADAPT_MODE_MASK			REG_GENMASK(6, 5)
> /* skl/bxt */
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile in=
dex
> 0eb0acc4f198..8681ca89af27 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -278,6 +278,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	i915-display/intel_psr.o \
>  	i915-display/intel_qp_tables.o \
>  	i915-display/intel_quirks.o \
> +	i915-display/intel_sharpen_filter.o \
>  	i915-display/intel_snps_phy.o \
>  	i915-display/intel_tc.o \
>  	i915-display/intel_vblank.o \
> --
> 2.25.1
Thanks and Regards,
Arun R Murthy
--------------------

