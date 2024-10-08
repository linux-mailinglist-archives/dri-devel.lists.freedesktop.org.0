Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C84995958
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B38D10E5E8;
	Tue,  8 Oct 2024 21:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlvpgS7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C44310E5D3;
 Tue,  8 Oct 2024 21:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728423514; x=1759959514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F6wVBMFLmGvB7HfR6mXPqmUDW39xL2KDm3cEfh8o0gs=;
 b=ZlvpgS7td2FAjiFdmLF7EkoizTtm8v6JbMqzbr+N1EKXyNn2dckthYk9
 HKNsf4Yx1R5OOa2+KDR+xdJ/KtCKgOtRS5h90Zbfdaae/7w43yghBSSWv
 i756i5UoAzlv1bevR1K8cggFJeHLC3+of5+w5ud8xSiJCGZ+8jRFpVT7g
 sMJb5LIzuyNK4+4nT5D0oj6eKCbLDPdgudVlovxNXPlhHaWNygYRButfh
 xkud+K5cdKeTmoD30oAmgWh0ZKiPRkhfplNnr0PaQlaWA0+dCerY12dJd
 LXuSY9b7yumfdn9YnI1eyJXD4R9d0z760YJ7sSvyVXK60dpbxw+IojQSd A==;
X-CSE-ConnectionGUID: BTGU47MnQOO//ibhNFPA3Q==
X-CSE-MsgGUID: WBLW+DUSSHaHoEciIy/Vuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39028840"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="39028840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:38:30 -0700
X-CSE-ConnectionGUID: 9XyG9JBJQiSmWeQ/qPOilw==
X-CSE-MsgGUID: KLW7nxU0QT+8qQPu3HRPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75583729"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:38:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:38:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:38:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krH/WgiZH69iAs8UxCGx78sor8D8BGPLy5JA3/AQjw6Tu/UkayRMRv/XpTaKH0y4gcNem3X1f4w3YUfyQp08LwI53ro87XdsdRO5IrwyMSC64wd2a1gZUPxUfW9lEGPOaYtyDsCbuc1o/G6Gmd8YQ+Ck1AWPF63wsZBs+eviY33nl1lrkqmTRGaNUyOd2GtMu2prWDI+cFDcTEZOKE+FmciyHydHw+KIXdVhddwUaPT/3Fd8TnWXddfPVUrfbkpjJKSBIDDNRuEdH6CmJKjeen1rgDMlfh58BYiPtQ8od5B169HAm9FMkRel2TashmoxAVWzk1lt6Sc9993REMJYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eK4fDIlSDylBlXI0UrOEFwhtLRVCFLbWoz/VGDL+wbE=;
 b=h5qzdYBoF7gPOLGCgMb5vtSHRrxSPOJEkChVY6IIGG/Irw//0CKIQ1p+AYudZov5hHEBXzmQVDHUj5rEcspjR4rgQ36e0PjfCvMrF4c7djiRa2FKkaIYnSX7h6aC860MYuKeAIyyfnyy95V8V3HkR8WHzS/fA7qgOJKShkZC+mdRYoHh69uLSRQdbHaibY3PxMBjoFA1dnC8X+BOncXYW73Mr6HhBCRBFGFr+hBnzTwYy0q670Hzavpu3EVwx7bgjOdMTgCtFvmizmf7GQTT3yrZ+YtUpHQkBX9bs8IXhou8uvk9kLGaRutZc17dkZS8Qcq2VNMltctPluul+gQIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 21:38:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:38:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Karol
 Herbst" <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 09/12] drm/nouveau: Suspend and resume clients with
 client helpers
Thread-Topic: [PATCH v3 09/12] drm/nouveau: Suspend and resume clients with
 client helpers
Thread-Index: AQHbGXqjp/jEfJDyFUeDVUtRuZ6kb7J9RfOg
Date: Tue, 8 Oct 2024 21:38:18 +0000
Message-ID: <CH0PR11MB54441AC403EEB7C0CA6F8C87E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-10-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-10-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8108:EE_
x-ms-office365-filtering-correlation-id: 035c63eb-43c8-4344-eb6f-08dce7e1862b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6D8QqbVraDgDMO/uBoXt0nXA0GTLRt+RfZnmjbpkuUnoYsGVh/bvfVuqNKBE?=
 =?us-ascii?Q?xr3RsuiXjTO0EdjCbth85oXUaFyxR1WycNc3Y12Ysqm5BNcH126giIkPYiCl?=
 =?us-ascii?Q?iKcKOR7gV2FY1fTC8XqwzuAHjClAci+A8yJTj4FThkNgT573vKzebpqnHXFi?=
 =?us-ascii?Q?fwWSFyO0LwLoQyzoRzWyBiX8TUjkmVRnUP2czbYlejDId/63I4bFPVOU01Ea?=
 =?us-ascii?Q?h56LvSw8a0Pd+vwBJdi8TsAoi5zj218YukLUZbbm9I3MJKj1l2aD+CLQra2v?=
 =?us-ascii?Q?D5BMeOyObHRDNFEdV/delK2iEG2TZS86NpZghEVPDiNBYXJYOGWF1d5qGyf4?=
 =?us-ascii?Q?B00bUYQY/9KCxzEqU5BPPLVKEzZ8e3CoBy4tcCHXJLgb7uAIgLJ6ClFvNnoE?=
 =?us-ascii?Q?/EUlEU1vO7sOcKtq6ZVjUATrue2+z745Pqz9zNX5qWna/NsWOtFu7J4TMoEw?=
 =?us-ascii?Q?GUzsPo18lo6uV9/mM9R5pJ7k1dr7aQjUBXvjDX67+n2tzVdgmSca5K36sQY0?=
 =?us-ascii?Q?9hTJDAc/HkiveA4Nj1dMOXcWBKcB5z0xqZZ/HhhCwFYHJ2hfuJ/Cy/MqyYSe?=
 =?us-ascii?Q?hYFsWyP99K2alNKjd1zkowhi4veipdMmhhsNh2S1ejCpy9397anX3V37C+Ry?=
 =?us-ascii?Q?60J4+pTRHxDtQDO36u4vPiq7wcXYEJhurZwjFaALJtO7+yhUYkR6ltEWYjXz?=
 =?us-ascii?Q?7d9l6UvrCCkVoAaTWPviYvnoxBfwDnz+LejYOe4BGp0P7sz9ZHajgysknuDS?=
 =?us-ascii?Q?OCjI2sZMERAnkryOr2zmw57u+yod+V0Wsxjup9guEL6NvmwnO9xFE1KD5WAe?=
 =?us-ascii?Q?imZEtD6I0v3h6nVlmBgaqmpwQoVmQUXV8balBy99qTrWz3xr6ebrtD11niz4?=
 =?us-ascii?Q?1FFauNUT2R0u89AouzA/jTWqsWU/tjDQ0iNCPg8A37neZPT+a5Vx9lDAxNk9?=
 =?us-ascii?Q?JKVkVGh91/EHcCtTpIaMrjt6UsQKHxp3kIUhq8liXJMI59Sglbr3v3B/wLRW?=
 =?us-ascii?Q?IDkJzLe2iUiFQGU4csJLFj6wH+DTYoU83Ig/2AcVBQPJqdOtNry/vZpm9bV8?=
 =?us-ascii?Q?ZmYlWi5tCzz1tadfgO64D/Si4FqB//5svKlJdj8ilC6nbSaASgkvbGo3PZ6c?=
 =?us-ascii?Q?lotTLZXz9orrp5RM2A1YvGgIWapmlpzywKOfyB7zqHUTsuTeJI99EHgACLoQ?=
 =?us-ascii?Q?XEBPza7P6BK+Nsc0laUW+ZAqZB7tiin/PaqDNRYBgiFPiGc620LCL5mqXupc?=
 =?us-ascii?Q?k5m8XQY6zpPPGPgO5ORXBDmuNC1js4db7Ky08W+6NwqEhONXA8s+4uN8X/2c?=
 =?us-ascii?Q?BjLu42SQfI2y4X8PfRCostu0xlORmezt0qZ7xCHE8ilFyQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E/AWoAUvcVgfMfyzxrE7JF6KMBGgDbzECJ7lHPVipgZpC7Egnaij3EGLqjIl?=
 =?us-ascii?Q?613ON07JiTy/xfOciahC0HqnybSkg2YBtTL888F2zLBV69d5BqNdLN2UwinN?=
 =?us-ascii?Q?Upefwo5/a68KTD/b7czKD/nraGXXpRs0iboMryMdWv/q2mk63iTpqSCFrNE9?=
 =?us-ascii?Q?eBhds/rR78ceHqa2w7hOurRusb2PwZEERWEq1mtVzzUZJ9yrQXUo5yl9ey0N?=
 =?us-ascii?Q?HQl3q0SwMkUdsm520ET33ayXV+U6WoISeIcwDmk/512RxC2ZXyMPXw3gh40b?=
 =?us-ascii?Q?U65oKHvuAPrv8K9AzArvIWHYrRCe5OwKCx4iAWP9Ejdm50B+M+lutNSbVFJ9?=
 =?us-ascii?Q?UnulDltK4uRT7BGL3wuOZ7xuF16uilj+YALc0T6IcjeG/9W4Bw4IJK5EutXJ?=
 =?us-ascii?Q?i0HU4+BRAePfpJyhzg5svHC3vx4/upFCQdnUJVpL2DLmdshxwTkWjDxqI5ke?=
 =?us-ascii?Q?b1lcxd9CEqxf7N55Xw1BgZHH2GVVdIY0kbE9EokxjODl2utqU8MTrpw1AKs8?=
 =?us-ascii?Q?oidndVUxc7g68Z6U6njPj+Yq0/IFd1DBsH/7uU5IIPw/Od4logY4x/tZS6+q?=
 =?us-ascii?Q?WabB25NpZs1O78vZEG4TCHiR/1BJeY8ikZbeCDRdMy0286mvIZo6u8TF7RbY?=
 =?us-ascii?Q?j+3qbhG8mSKsUt23wdVwA5ZZ6xFFb/7ZxbzGv6HEoYjBQwz3Y31HpM1If1iq?=
 =?us-ascii?Q?CDxFNuFdX5rZaw8sqdYbvjyfZ9FtC4L0nNTsWAELN3gQNKFEcmOX3s3DNQNB?=
 =?us-ascii?Q?icHNNx0Nxo4yiifEAbufk2M1Fqu0+9gOiCKi2suLbO++iU5Z2JGE9qgMbtYD?=
 =?us-ascii?Q?isLPRIfVqfZcvN2UDBy5cMZjGNw4xSxTpA2nMb9ZWzHunQo1zj7/O+gFAyy7?=
 =?us-ascii?Q?td9gyIeDlhLHiGK285i2mW4/+UO5oX50XgoenuPuoHZaLj6oq6fGtGdNhUK4?=
 =?us-ascii?Q?8WXdvfBExWorHXUqidXbQ8jEs3Fl8z2H00l/Ur11lETvnYSqTRJNjDJNXTVz?=
 =?us-ascii?Q?08DhdlEI/BGGGhcPFselr0n0CSOEBeWzHC1qCWfx1yP/tnlbzvdLSG95KEz5?=
 =?us-ascii?Q?o5bm8VZRPD4rcKgLKBMpR74ahQD9HHQ5iCbo3sp7WvBV0AsdhK6hKLj08KyV?=
 =?us-ascii?Q?HJ4PdUsO1lVuXR1igzfKpQYgyR3wZTj1HOps3Rtwk2bEClcTEZIPw0E235EO?=
 =?us-ascii?Q?0PTL8koHkbvzWT0X4fSuCpAIOt6qa6Tvb2F9NJrTMKgp3zDQbwmt37IfdhVp?=
 =?us-ascii?Q?ROVFewRvap2lAPKp9TUN9qIsBaf7tNI3UqHRoPzgqiGW7kFBKy2jA0i9TtHf?=
 =?us-ascii?Q?iN43cQMEykAs/CDU1oPEkQCRSXReBwppmvBL0McqxDquLVRNsEJe5awgTybj?=
 =?us-ascii?Q?5N7CoEsxIRfUJ7u33FrpYdYdxGDy+47db6IRLsIH89N0M1rJjDgl8XDGEVXX?=
 =?us-ascii?Q?N7C/02N7j52mIApDyvvT8xqGadx4xc2XoJfMPXhAviQ2jWzxl86ZOqgzM+qd?=
 =?us-ascii?Q?keeB7fQnxJlwr/Lx7lffXvhg5GOkGuFJdSLMMEiNQsXhftP+ATg9jaavZWT7?=
 =?us-ascii?Q?mH1HAKO09U3J4DHtg9iHdVh38a6nrYk7XwdOkj4mIGpQv3snOL1qfRQCnCbz?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035c63eb-43c8-4344-eb6f-08dce7e1862b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:38:18.3854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2NRAxlafMVpwVuY1gnpVQe004G2G+XlNXaN0pcDOFCAFcGAhTlr8G4x6h/l+ksxSZB9DP8uTbkJL4YjUpBGZu33JPYEh30Q41Do3YVlul0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; Karol Herbst <kherbst@redhat.com>; Lyude Paul <lyud=
e@redhat.com>; Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v3 09/12] drm/nouveau: Suspend and resume clients with clie=
nt helpers
>=20
> Replace calls to drm_fb_helper_set_suspend_unlocked() with calls
> to the client functions drm_client_dev_suspend() and
> drm_client_dev_resume(). Any registered in-kernel client will now
> receive suspend and resume events.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>

LGTM, though perhaps it's not my place to say this is okay.

I'd wait for an expert on nouveau to respond first before
jumping to push.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index e2fd561cd23f..619a3efbe8c8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -28,8 +28,8 @@
> =20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_crtc_helper.h>
> -#include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -804,8 +804,7 @@ nouveau_display_suspend(struct drm_device *dev, bool =
runtime)
>  {
>  	struct nouveau_display *disp =3D nouveau_display(dev);
> =20
> -	/* Disable console. */
> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, true);
> +	drm_client_dev_suspend(dev, false);
> =20
>  	if (drm_drv_uses_atomic_modeset(dev)) {
>  		if (!runtime) {
> @@ -836,8 +835,7 @@ nouveau_display_resume(struct drm_device *dev, bool r=
untime)
>  		}
>  	}
> =20
> -	/* Enable console. */
> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, false);
> +	drm_client_dev_resume(dev, false);
>  }
> =20
>  int
> --=20
> 2.46.0
>=20
>=20
