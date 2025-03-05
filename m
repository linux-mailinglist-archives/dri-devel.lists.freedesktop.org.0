Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE4A4F825
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706BB10E75C;
	Wed,  5 Mar 2025 07:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkLI1aB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB91110E751;
 Wed,  5 Mar 2025 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741160559; x=1772696559;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oxXqY0Eo2+OHttJssbX8T85159QFjPCJeG273GQQ8k0=;
 b=RkLI1aB2PStVcNLU18M1q4nlXZRBBpwDlHibA174+fsRagdP1MYrhzZ+
 yviPgMlWP4Yjb688l938XXzouEWOmCQbWjDE7V2ByBzMbjO30Jhd27vq6
 V70sh0D4JnC/xYDngU+/l4Z8DGEwYr4VPHTLTyRsd4TcsovCKLhohxNIF
 z1F8dRGVyj4wYe8cEq6cUi108L5rcz0tFwdcPXkc6Uy+n4GzAS5ja2ppN
 HFipz0qW73khZG/qDT60IDTcNa5zXMm5ReZPnPFSaNqxUS2rtPV02o7tO
 e/l95hnwh2RQ5ctOu6Vj5FcuCQPuk9YBY/Czrb4jLCU6Xa0lKAjTauKli w==;
X-CSE-ConnectionGUID: dcEt2MG4QGWZ4r0C84c+xA==
X-CSE-MsgGUID: w8fIIE5iTtOkK7asHHUpkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42233908"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42233908"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 23:42:33 -0800
X-CSE-ConnectionGUID: LCk8vimPQOidHFFOZVQ5Ng==
X-CSE-MsgGUID: ttoqxVk+Qq2Ny1bO4mRCKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123713370"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 23:42:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 23:42:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 23:42:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 23:42:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRinahZOoF4aBdyCkFI0GIKG4bemGOz9gB8jGELCEEcZgvMCOEPk3e+OEF8hW5SfFQ11XXuCs2AfeyuOT+KyCkuIQzTZbZyCTPKhUZcqEly5LsxiCtvLzTmKthHQ24X3eLjt9/qzwjYN9mlbyNsrl4yqOnrNK7mGKFzy329Bm4Wrxyn8sB2EOIBqIrEdMwrkYvki68w5WQFvD3pWIhA2cb2/bSLm+wYjlxopQAMziuXW0x4lt/c4v4TU7EFDSy+Y0hEJI/ZQBK1xIkWLzzPBHMvb+f6YU96PtKd5ZN4pkixqbzV/u0BOT5WA9OP3giKX6rsMPJMGOVqklmBFxxvG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgAUNDNOb9y4us0CoJtwedudttmpmGH7VKSQ+VQ7LZM=;
 b=o+BMB/J/Ja/YfgkUHmyfQ1Jif6wXOqpeZcrNckHewd9GpWqVs7CrhD7m4rVl6U1sh+54abtpHJAwJuG35jb8IAXwpUeWpfP4t3a9+7WqnMUvfJbuXkUji26V6pMvAuWXn2y6hbua95RmcB2PLP+ORLoMCHe2PEJjPuEh59XeTCks88/OXzoIof0UAy/ktnW5mCQ5vUdYoAUxuAiHfGuCotj0xVVIveeNj0uo91Mqd2oBFeXsb2d7YtNT9aie4o9d5IGVMczVseRhNdXr+F32Y3LmCkKtTyeecdmYXT7t+pOAxhSdVX+hOBttNqmKVS7A+EAQ3HVm6V2RoLsqg8L4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 07:42:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 07:42:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v5 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbjSgrkUdgP7FPhkOUcLjMXjcnI7NkJ7rA
Date: Wed, 5 Mar 2025 07:42:28 +0000
Message-ID: <CH0PR11MB544457856F678C159B66F8F0E5CB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-7-jonathan.cavitt@intel.com>
In-Reply-To: <20250304170854.67195-7-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5021:EE_
x-ms-office365-filtering-correlation-id: 3bfe3b3e-22cd-4e9f-cafc-08dd5bb94762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sXRw5g5a2iaOTPsdSGEYrOCiFannWP+qUhyrahdJQzkHi7nkNKheEQx9Exh5?=
 =?us-ascii?Q?KWkkRv9I1spCnkRKuRZQwwcdxhw8aQC2FWXU6EhMuHZ9bUMpJGDPv/ZZb/ca?=
 =?us-ascii?Q?tWFoll4pNIt19K60P1P/yQzpdEyvdIyHe5jNwbqP+nsBn8wWbmLOy2TGF/xv?=
 =?us-ascii?Q?ZvUEOQoN17vSfcn+rrrVfR9Dba4w4vKgtqymHLNys9XP8Y7LlUSnMTscsIm5?=
 =?us-ascii?Q?EHq+Dqz2zHeUgwLzJ4navfZGalVzEdc3/EJ8OtCxDmdhTHAsk2UtvSrcsWtT?=
 =?us-ascii?Q?uhHdMqOBgUqFere29BJLG0JKJYSL9lvufqxtck6kVRdSwW5sgzymU0lacuxW?=
 =?us-ascii?Q?UIUDtcV2yO//HAupuW7PH3cfYmz0p/ZiFcd8pxKh2niktz2HCJ+cOveDEYM2?=
 =?us-ascii?Q?Xbiq9mlnX8Q7Mfx0UstwHNSSEwjA9jRYPtgqCMN9HHMMp1xEXqmRc8SW6LwI?=
 =?us-ascii?Q?IGRLbAdldXddU+P0Lz0TPSt0nunCIBn7W4z2ZvvXAUNWMs3yG08KSzMvW4Pl?=
 =?us-ascii?Q?TPaGhy1lvW9Eu3QZMhRBVY+YljiUAukB7y6O37R1TTBAwzZtDsqTHlaDJbN0?=
 =?us-ascii?Q?+dh0ijMAtTeR+ifd0cXbgIej0qqcFneFCFxeDkG3OWb5QIRe2DDKRnrF0gDu?=
 =?us-ascii?Q?m+UkmYher9JeZUMCacqs9mBH+kx1nDwyZZJC90c27IP4qdxWayzkydCrYtnS?=
 =?us-ascii?Q?rDcmCD5s3QG+1L20wwB/fz7Yf/t16uLll3sosjNCn15659sNvIWMP6CVIKWa?=
 =?us-ascii?Q?FdTUlVoXHQPoRh7tnj2+yKW5uiW3PPspoNIsJRLm+OdVCpHM/o3vAZ2Kh8jQ?=
 =?us-ascii?Q?rUynwy5OQrwWUMTmY7lMezgrkRUu2Q0fcPHNiYmJnNUBkjbsgUonf1JeoAk+?=
 =?us-ascii?Q?b4g2Xsv2Xl+2eg+alj4INRAZb+RIoPnKWXaCZsQXytnCM//ldh1ZnIVFX2Wn?=
 =?us-ascii?Q?F8Cf8O27uGoSdrg4H6z1VTBmQuKM3aoAhKvC0LHXe5/m87OlKxwujnFhSO+a?=
 =?us-ascii?Q?fOgh8u0ECkxyotlZ/vvfYMOha5ilgVuL//VJB7KcUnFgb5ONVPYiRjMgRfYQ?=
 =?us-ascii?Q?UQhm2grAX70mOt5jiRkiVrvD6mf6HqmWMaY9xaPV2NJrWrRYf4BXhabsE9cD?=
 =?us-ascii?Q?tvU/XbNAhBJOcTDoNKY+okgBBgif5xbimcSnqn7E5Gil3mS2+k4hL+IOTff7?=
 =?us-ascii?Q?6xQNDmU+rrTCOCVVeSJ0BO1MyvwieQw1fkEWyAWcCdsP5gb6bQtQXp2O/2sS?=
 =?us-ascii?Q?T0IzUN64sDfg4r43CpMSntxHMzSflJZloZd3wMW20tgmmpXkUrybECUXjhVr?=
 =?us-ascii?Q?8xzn06bYUz662nP/9VDI7c11wygIJpc4aLduTh29XeyZ2X15DTjiCsX97IcU?=
 =?us-ascii?Q?CDOFlTE9GEJohbuQ4hFJ0Mpc6B8mbqu8Ibp6FB0ptLnOB0uNuskvtTMnzpKE?=
 =?us-ascii?Q?xKhBoi8NHt2PFZthIeAaR6GQNO04k+ew?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h5jzJJ7cyny3pmID0O7d8KEOIbHrYuYzQDOiJ4RwqvUwGtRJPEaajQF7KsbU?=
 =?us-ascii?Q?4SdSah6UAd7El3uVe7O+tZH8fQGjowW7PnmoGCVpWmXfA4EMi44h1+p47X/m?=
 =?us-ascii?Q?JgrkVFUsPqyKY7naRD67vqOFr9GVa0dD5zLIoxu2GUzdkCO6P1Rl4BhzYAfl?=
 =?us-ascii?Q?YEliNpBk0TUASVFH/URIAhCMEZLntI6erkAMm6JWjJ3/DMNhGiKoPm41cfdp?=
 =?us-ascii?Q?JpwcjYMv6IeDh2s921Q6EIGd1S3WT80JBgKYHH3tkDOf9DjcpuER6UahO2i8?=
 =?us-ascii?Q?sCQSS85uEDOeMLDSEcrgx1Htw3l6WH2Ck/uajKS9YFhRNJffk2CuSP2ZmwWl?=
 =?us-ascii?Q?igADlAE/BixCGvIRvwf3LfPtPdl9yEef1zSWqk/QTCfuUc7hRUPqviLusTQU?=
 =?us-ascii?Q?xbwro5OeIkck4J/IWbuccA62uH6L7RxVdm+ymtcwJWh5tjLk2dfFCDnD6fyE?=
 =?us-ascii?Q?OhIuZx2C7U1NFMgyzX+kUNzaX3vz5DKshkUpFUIhDt6IKZvEnnQQIncI+0fw?=
 =?us-ascii?Q?nGB2GfjflxjdhC4zoN7h9f0iGknbSmByH+7SZoHup3IqQXn+2Fn3zat0HLPQ?=
 =?us-ascii?Q?cRYurtHOGKrdYFJlP8+pVIE/hT5rXemlKYk/7RHIsYXYiZUV2+5LhBjJiWWN?=
 =?us-ascii?Q?EQPt9K2gW9nJOhN+k3JBVzUl9oqz4cVuR78mXjjC3OvFVdajr0v1TwNOX+ea?=
 =?us-ascii?Q?xPFbAVmM2pn7F8Zbw6N37OSej1bLii3WQhw9GGzSj5tq2FEIxtPD1La4cnXq?=
 =?us-ascii?Q?p8OJP+5r4xOewjF+AVcPuaJuaa4DWpd6SLMlgc3Y06s9JytRj/D8AFvoGylq?=
 =?us-ascii?Q?McbUvzb5w24pP15XaPH91J2IsoWhct17bEwj0AVRiHavebPYvbhVncUQ19PF?=
 =?us-ascii?Q?+AiZr5NtpobZXjK1I0A33nY018P77Tcuk2th6F3GUev9dL9ya7meXchI8fqE?=
 =?us-ascii?Q?J1g3+tYCjkvCjLlfkxr7tyHJpSJx0sf/8wGJsmKpZqIUSjkxVJ0zyOCzZdeA?=
 =?us-ascii?Q?DU/j+cJx7+VQ3mD+DQFK2jepWu8ZgSfiRPH3CdOz5gBoIrsRyjbRc3YYjsGc?=
 =?us-ascii?Q?JusCnGtflP2+0iuEW/ulvAa52tC97B22Yr6xu0QXBGGlncq+ki24d+ESsQbV?=
 =?us-ascii?Q?dhj1aX5ald5VY+8E1TAVggiF7XphC8QLQ29pDXTutNHD13Te0tQOgBCY+ndj?=
 =?us-ascii?Q?bvd4Alszt9gK6RnN+JOPQaEibE0qDpexfPGIaWN9ocP5BOnWpzM8NmH8KdxA?=
 =?us-ascii?Q?btnP+xHdr1WWkm1pH0KRHSNAZ/+ie0xsd3jk/CIXWElyZ1Y/rLX4u9HpIK3k?=
 =?us-ascii?Q?kjOxMo88AazcAvk+o0ZjyMEp20/lBDSSUdDfpOuAENgYzc1m/2at3cL9yGGX?=
 =?us-ascii?Q?ERmBt0mUgt0U9RnvvMCXA3rjzDbgUQsTgy6Q/iAXUGGoI0x/c2M9iqYrjsNW?=
 =?us-ascii?Q?KJPw0HqbN44JTPz9IQ801XCwKmuhtqBj/YYr1i91F8RFX0NCSCJBQs7WTon8?=
 =?us-ascii?Q?noayy+GZUAqQsX5DWOm285It6rgrPRTcNH4UhNYB+XbsallvV8GBivkJ3nbF?=
 =?us-ascii?Q?nZkokrLzMXORRQLk9b2ejMv57Qa7tSM+Vc3nD5QJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfe3b3e-22cd-4e9f-cafc-08dd5bb94762
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 07:42:28.0588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OhOZJ7nAkxmIpPxUhNGlkve3ia7NrqV4nO6vQYGrXtC0ua38xphEKalzsupDIENPkXLqgcmFK8FTskH3NmrEYFUAi+2HXCNZodcqYhW4Tow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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

Hello Lucas, Rodrigo, and Thomas.  Just querying the room on something.

I need help deciding if this new xe_vm_get_property_ioctl should actually j=
ust be an extension
of the currently existing xe_query functionality.  On one hand, there's a d=
ecent chance that this
ioctl will need to be extended in the future to allow for querying addition=
al information on the
VM (E.G. engine reset counts), which has no precedent in xe_query and would=
 make this type
of query better suited for a new ioctl.  On the other hand, there's also no=
 anti-precedence for
such a type of query, and it's also debatable if the currently returned dat=
a from the
xe_vm_get_property_ioctl is even a "property" of the vm itself.

Any input welcome.  Thank you for your time.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Tuesday, March 4, 2025 9:09 AM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; joonas.lahtinen@linux.in=
tel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.=
zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists=
.freedesktop.org
Subject: [PATCH v5 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
>=20
> Add support for userspace to request a list of observed failed
> pagefaults from a specified VM.
>=20
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
>=20
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
>=20
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> CC: Jainxun Zhang <jianxun.zhang@intel.com>
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  3 ++
>  drivers/gpu/drm/xe/xe_vm.c     | 75 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |  2 +
>  3 files changed, 80 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 9454b51f7ad8..43accae152ff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -193,6 +193,9 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLO=
W),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>  };
> =20
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned l=
ong arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6211b971bbbd..1e78103fb0f6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3234,6 +3234,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void =
*data, struct drm_file *file)
>  	return err;
>  }
> =20
> +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> +{
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return MAX_PFS * sizeof(struct drm_xe_pf);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int fill_property_pfs(struct xe_vm *vm,
> +			     struct drm_xe_vm_get_property *args)
> +{
> +	struct drm_xe_pf __user *usr_ptr =3D u64_to_user_ptr(args->ptr);
> +	struct drm_xe_pf *fault_list;
> +	struct drm_xe_pf *fault;
> +	struct xe_vm_pf_entry *entry;
> +	int ret, i =3D 0;
> +
> +	fault_list =3D kzalloc(args->size, GFP_KERNEL);
> +	if (!fault_list)
> +		return -ENOMEM;
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_for_each_entry(entry, &vm->pfs.list, list) {
> +		struct xe_pagefault *pf =3D entry->pf;
> +
> +		fault =3D &fault_list[i++];
> +		fault->address =3D pf->page_addr;
> +		fault->address_type =3D pf->address_type;
> +		fault->address_precision =3D 1;
> +	}
> +	args->value =3D vm->pfs.len;
> +	spin_unlock(&vm->pfs.lock);
> +
> +	ret =3D copy_to_user(usr_ptr, &fault_list, args->size);
> +	kfree(fault_list);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_vm_get_property *args =3D data;
> +	struct xe_vm *vm;
> +	int size;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm =3D xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	size =3D xe_vm_get_property_size(vm, args->property);
> +	if (size < 0) {
> +		return size;
> +	} else if (args->size !=3D size) {
> +		if (args->size)
> +			return -EINVAL;
> +		args->size =3D size;
> +		return 0;
> +	}
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return fill_property_pfs(vm, args);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 4d94ab5c8ea4..bf6604465aa3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -184,6 +184,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void =
*data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
> =20
>  void xe_vm_close_and_put(struct xe_vm *vm);
> =20
> --=20
> 2.43.0
>=20
>=20
