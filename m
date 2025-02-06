Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E992A2A144
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2710E445;
	Thu,  6 Feb 2025 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMjWZnSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61C10E160;
 Thu,  6 Feb 2025 06:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738824328; x=1770360328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r9FF7Qe7ea7kSFooknF4uQn5c0YGjRWI4WZnTWbAhV4=;
 b=GMjWZnSF+N1ae747GuvXVe7ImQq3yglUa572RP5OixZ97Obr/vacKabp
 hIRdjnW8yHu9SDSY/kGwWQlTxc1TZIXd7lEvtVnkZuEboYROPHczSz1uX
 Sz9yP6rqA1HkAWrTQNMCCMwlFDe60rvnXtp4gOqt8WpifLtgJxYQMSewr
 kbht0xzZfgjF3mEFuVUAklH/722d+fa/Ujt8XSXHJevCzEM5xb6hlvFCL
 VzKtJppFS2ARM/PFjkEeHyeVtbVg127pph1FlCSlsH0d3fesxW7FnKF3m
 pOhgALETrT8nH3g0vrvzS4+9ZHc3OtTmBMtaQLKPOGXOvVZrGkBSPml0v Q==;
X-CSE-ConnectionGUID: LLTQKkkMR5SM/9NOzxN6Rw==
X-CSE-MsgGUID: qYxAzIXoQ5mI6pW6SoNgAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56830512"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="56830512"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:45:27 -0800
X-CSE-ConnectionGUID: DBm0859XT6mVrL/6f2qOvg==
X-CSE-MsgGUID: dKPjc/3xRAmep2olmzjgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="111654460"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 22:45:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 22:45:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 22:45:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 22:45:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pn3e1AQFWF+XseM39nHvCoX53JJlGYQrrBhY0rEMq5Qf/FL3h19J6BKL47ik3L07l+uOT/KDwioh4oj99HHHNrSQINiaWDL3O37L+hIqIJSGTewNS3C3f7gWTQaD74Tb0h8fjcXqyqYb7KUU1MrnE+x1tPECGZBqLG4SkpVdp52aT6eFSJLPVOkijhtgSaVyZ1FKf0Qd1SjaWIUj+RFRWymMaKU+6P/YsQUINVSfajWvsWduMPA/zR0A9oBgCmEcJ8l6fMB7sATz9BI3ZzRbTKFLjdjztm/A6wO/vCUFj2QnGB+bar720aVj4AtLkgfow0RK7/O658FTBgr4GqDi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0tfVfrxrJge189O2YD7yAWcuCXUfUYmkkHQYf/hjgk=;
 b=SnA7CyzM/84NqAgGyxDy2QxWTFvAzZhJbu84E1nuB9nB9KCCT+GWsmSKC1TuToichJTeB4NxYefbGFuh6rSRJevNXEuO96BbeJA+4q6ieANGuQC5KautCSD6CtuDU/BPF9onk8dWRJwZNDeTv3tlq9ku7WNhrdDrzdHsjmO7hM0INy8/1w9Kgez+dZbkMi6aumh4AHmRLcJa2T6wtfS7a6/abXXldbIBhlJb0U+JGcOACNH2Uj3bOQqjSNLqvn/56N9h5PYt23OsAGcOoHywqF7IDsswT3h1wk1YzOkxyufjyGNjCcT5NgZ9gvHPHdnmDUtJ/Dr49h7AJXhxxr+c1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 06:45:08 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 06:45:08 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 2/8] drm/dp: Increase eDP display control capability size
Thread-Topic: [PATCH 2/8] drm/dp: Increase eDP display control capability size
Thread-Index: AQHbeGEEJP4/K+RotUOZXZ8YLDSLzLM50+AAgAAAZZA=
Date: Thu, 6 Feb 2025 06:45:08 +0000
Message-ID: <SN7PR11MB675030A5AC6E4F8BDE7679F7E3F62@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
 <20250206063253.2827017-3-suraj.kandpal@intel.com>
 <IA0PR11MB73074C21AE5D2F7F1157A88CBAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73074C21AE5D2F7F1157A88CBAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV8PR11MB8724:EE_
x-ms-office365-filtering-correlation-id: 384bd01c-b093-4823-389a-08dd4679cc38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gIB8Me11FGyHzzMr8qv0rJwZrbi//Wt4OOwZ7oqz+XlW3VZH/iXseqF+MHkT?=
 =?us-ascii?Q?fo7t3yioJBHpC2kSzMZccFRY/9s1Fzz6u2LGksyqK28I3uVgOrUKWLf4NjXJ?=
 =?us-ascii?Q?fFhrYxRCuwxk3qmIQ8OqgytTo9gMHnG3SIBzWFH31rB5vpaCIymj01TiUA2q?=
 =?us-ascii?Q?k9dhnTkXvZiRsZfvZvOxijrkXb4YKuTU0tVXboExnhmXw7CLu8HbtrOIJvRv?=
 =?us-ascii?Q?vY7llU9lzFYTUfPLT8mjeItmdHQLjSfzqmGvM17bXOik3TUoRCJAzy/SIJXT?=
 =?us-ascii?Q?pVGMyymDkSNBojwMRMkOZf6iLjvbEXJfklsgZzvytzps49/DHJ4P4PjncXwQ?=
 =?us-ascii?Q?yZoULlabNCyFIHNeqeL/NoU/YR70t+ES8fnrzBPRL3vRRqlQxva2zlwjIE+T?=
 =?us-ascii?Q?LnQP3iuuLVqXs4peFrz63SDp+uf62Zrff8WadxLpWCJrHbniojiFPOIQBYV1?=
 =?us-ascii?Q?kvnoQGSWWNmamLxfzoSDb5obVfz+rE/6D49B7vAK53wZcsBWP73lADTos4y9?=
 =?us-ascii?Q?qvCFUhaSMLoVix6C9z4xwO5Kj3/4a3XA6b2C7zjbmkWu2MZU4UVf1ZmhZ0uh?=
 =?us-ascii?Q?FPuQEFNFA1SmI2y1wDu+1NWu9EQpgmQExxGEA79Swnboomk8u5slwDORXNrj?=
 =?us-ascii?Q?L6RgWir9w6m1v4hVYjBRigpAp3TUfrKLyuQL2j0gsCS5QO+lBtXW/g9epBVa?=
 =?us-ascii?Q?Zf+foBjYJdZn/cffpTVFTa/DxYkDCId92qX2qB2rE3ckhMHeBsMKdzamK8ft?=
 =?us-ascii?Q?Q+FCll+T8wQ2Igj5h65ROo345+Ctg3WyO72TSoIbWclaBJPdioLfZ84aTojh?=
 =?us-ascii?Q?GyqWuIGqGNVB4eh3JgCx+oM60WOOpzb4NUcqG3nRxq3tNPI13mwPMfEFBAod?=
 =?us-ascii?Q?xSc5JbQeHdQtP3IHiJHfqw51M8w9BR7E88oyr+m1OzgXQ4kYefx8ncePpQcn?=
 =?us-ascii?Q?cJ6IwMjD4VTe61tABuGaTiAVG2qBe2MrFqqhRCzVvUkmHQJClaoHK+jaT9HK?=
 =?us-ascii?Q?pl3eRa4iQKkCW7CLoRYUvpIO0TxgdX+Vl+E5MZtkWCyx7Itxy1amuVsD/yHv?=
 =?us-ascii?Q?GpLrJUbaI2EXxrgotcOiPi1qFpIvBbn51KT2YEW8HVw9rwlJEAqkvDtkbZvZ?=
 =?us-ascii?Q?v3QQjFBvpbKoyX1jejFNb/4AeZdCQ8v7gsn2R2rofx1gd/dYxJ4h0NkQcTks?=
 =?us-ascii?Q?j/qrk9n4ERx+RbGUvyHeaLb8BYij2tGOTXlkudZkZBGtNuOTiIaGEmCcqo4P?=
 =?us-ascii?Q?UjMbekQlh/DZIZ0qPczL80U3qgwo3Ye9G0MWHTziLzj2b4wKUFWLy5i0flRt?=
 =?us-ascii?Q?Rj4CKFHcvjSFhSj3wmDvDgGEByylWiDsVVu6bhtUf5I+xWdrRsA+9qEQXubT?=
 =?us-ascii?Q?9QBf6CSXIuN1OyYj1GNWE2Cz7z4H3KlbuG4yTeIgB1nHbQ0Gyv3PvG88Tsgp?=
 =?us-ascii?Q?KR7dbrNjZOFya6OCLHf7BRJSfIvZgMD7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9UrYdWaOiJEFUJbttYcefeLs0c5gXYfa35cRTK/I4fHYpFWNiEOACMKXL3R/?=
 =?us-ascii?Q?mVHzRakg/qM9a92PhrVLuB5aIzYGQ42xQR/A1DwZEUapY0ZSOnSNK+4TFKCv?=
 =?us-ascii?Q?V2r4Lhqo7eIrG9/7NRd4j70jaCH0QvhqgiDcZZd9Yi7gojOJISwTIwLe3P7E?=
 =?us-ascii?Q?I+asxXMlrvieM8wCRep0W4BQuaYvF2M11qewojbgcg4ZEOAhBneWQ8iwBomi?=
 =?us-ascii?Q?7R3B2heOACEU1jMWnDnrGmMTMjwjHifFzRTWiD+eyGE1xEiXmMF39w/8Kp02?=
 =?us-ascii?Q?J1AbMdUFcHUFwSUI9sENNHbUe4Yi/waL/QSdyZVro1H/u73x5USrrLYoS6nq?=
 =?us-ascii?Q?8yrdqzeAekfb4qeXOeUUqDy0vT+tfgWjzin86CHKFXrGHL/QKUmutTZvFYsE?=
 =?us-ascii?Q?uHlP13NuiT2CJ8j4CiLM/ZjXlgKV5xvlXJnYc3mHa/zbqJUOIARNGXjvf7u1?=
 =?us-ascii?Q?1OE6J6bpDpzHA/YTg9/O+dKWTYbbg3krixhAAgJYnBzbtPweBqpwyrMyMCCz?=
 =?us-ascii?Q?TTcn36BDxouixpSRW0F4n2u90eUNGxMSvblCg5gR1D52jn++K/JCAfPAEXSB?=
 =?us-ascii?Q?f+GrDA7oqHQVBHjsgOPCru1daj5NJRPdXHwUJ7WIUkWeFC+xf5OPJczy79pt?=
 =?us-ascii?Q?I3oR9LyBnw/58UhKtJzgao6J3+YOs2dVhM8K12VFL2a3l+4uJHbVIRFLr8WK?=
 =?us-ascii?Q?snXrcY9K5sND4SdmTAwPbms97uBtWGnadulCOZQV2lTKE8lE5SrljxtUwfso?=
 =?us-ascii?Q?1CvoO8d1BJEPKCIaMEiOll/ShcmtX9ammm1WLj693MrpPpnYGF50LI4Sxz8S?=
 =?us-ascii?Q?uiXiBH7AQ+tO8jwK4XtRpNSHHfeHcCcDfLafslSdUqRUc6EEl2KH5u6hUpGp?=
 =?us-ascii?Q?K6ZtUxjtrgqbyUZCXwL+cjZRgH1ug0aTU0Oh1yAMZwIN8sTv+wDgGQrg9eao?=
 =?us-ascii?Q?pnooWPQt+BNUGAeqzGU9VozgUcpk4dN9LONCwn6V1ZMd896hanq7YUZZ1Hg7?=
 =?us-ascii?Q?4xtQd3N5/BJ5ZYjkLnzI+LcRXdWYFOUO9EZd38sv2VQ0Tj+wNJ3zcuk/bEHH?=
 =?us-ascii?Q?rYlwvUaeY9idjhPE/QSj5xcyV2Qr8Xl/WoKlsvLgYezaSyi8RNwjb+PEissV?=
 =?us-ascii?Q?1rUwLSRp5iYUEdKIEmEgMEAQ2ByFlMGxWY6Y6AKRkrdImnAyCMa9X1MXJa5S?=
 =?us-ascii?Q?xdXHIc1Cp07IQDDX7O+58gdMBBeYD0EorVjKsTDdZ63DsY42I29AsgP5ij7+?=
 =?us-ascii?Q?YF6GtM3VUeCfGaWgYUoY1hTO0e2GYWz4adndqkzt7j/83ZR6RFNPd+OC9+Jx?=
 =?us-ascii?Q?7SGxSI8OHxhUC/1o89UjipnXTE1fxQ5dv+WS3Dfa6RU0Amw0DEM5RoGVRnf1?=
 =?us-ascii?Q?foyCi5Khwhjqdm6bjbxn342KQ9eMRggyge/WuNIdQFscRpilknQ1KWb7etbc?=
 =?us-ascii?Q?4JRd3hGZVS3hVmJuD+Z1+SUO0Br7LYwGtpyJbYD+HIutf0uExuFJbgklCqMN?=
 =?us-ascii?Q?kmVpVehrIk/crxGGgDg5aObgJ0pzGtB6DtQFz2igb5VZjruLyBRHD4QGOl9C?=
 =?us-ascii?Q?8zeH9R+VI2zGoxKgybBMYHs6qSEEbHUMGhhyN2Bz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384bd01c-b093-4823-389a-08dd4679cc38
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 06:45:08.7592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hyw+wdlpIlFtfHWp82S5f9NOhoXyrllVrBl79+jz5KqnlCLZp/qexTi28015ZR7X2PJdgMVAwhPqEgu2NDMvrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Thursday, February 6, 2025 12:13 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Kao, Ben <ben.kao@intel.com>
> Subject: RE: [PATCH 2/8] drm/dp: Increase eDP display control capability =
size
>=20
> > Increase the eDP display control capability size to take into account
> > the general capability register 703 and 704 that have recently been add=
ed.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Thanks and Regards,
> Arun R Murthy

Hi Maarten,

can I get an ack to merge this from drm-intel-next

Regards,
Suraj Kandpal

> --------------------
> >  include/drm/display/drm_dp.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/drm/display/drm_dp.h
> > b/include/drm/display/drm_dp.h index 05e16f0144ff..784a32bfbad8
> 100644
> > --- a/include/drm/display/drm_dp.h
> > +++ b/include/drm/display/drm_dp.h
> > @@ -1670,7 +1670,7 @@ enum drm_dp_phy {
> >  #define DP_RECEIVER_CAP_SIZE		0xf
> >  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60
> > through 0x6F */
> >  #define EDP_PSR_RECEIVER_CAP_SIZE	2
> > -#define EDP_DISPLAY_CTL_CAP_SIZE	3
> > +#define EDP_DISPLAY_CTL_CAP_SIZE	5
> >  #define DP_LTTPR_COMMON_CAP_SIZE	8
> >  #define DP_LTTPR_PHY_CAP_SIZE		3
> >
> > --
> > 2.34.1

