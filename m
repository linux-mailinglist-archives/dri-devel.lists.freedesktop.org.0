Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5D96ED44
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E89D10E99A;
	Fri,  6 Sep 2024 08:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0W7Id50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9016F10E99A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725610332; x=1757146332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=biwPp2wq7oj0I6Q1Y8JlC8sjtS1yI90doonFgo/ei2I=;
 b=c0W7Id50uPLw+NJ1jSN0N+gowO0QDGIraQX/x/CJ7QtQRUu579XAEGD+
 qPtwHPQX34gWWG//HKablve1boghLmkcYvBjx831Zu6ppZ09W59tnjJRq
 +0PniH89lXoOYsDDKC2Gp7Qg7shOmNXq7RvAb3j/pjIYqW8X5qvD+3P2U
 iRsap7ZsgvPCkBpp0ev8jMjYCXy7dP+WeNRLXR1Aqxw77ZOnUn5CaxSVo
 xe8iVJ/4Eiv5OXOi8/n+mijJCfeix71vzGsJYhJimO7yDt69LinPK0647
 xNRVZrzjC3/2Lr/0zHglMGM8VJ0d7TjzaETjqaz9Q/S0FlyW3dw7ypVPf A==;
X-CSE-ConnectionGUID: rkAhI7PpQA2YE7MWgipz4Q==
X-CSE-MsgGUID: GQrvjS7rSla0VH92wjcCQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24227861"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24227861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 01:12:12 -0700
X-CSE-ConnectionGUID: 9fXB9I/zRr2SH7H8CdtV6w==
X-CSE-MsgGUID: lAVjLbHNTZ25NnK64UQNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="96667670"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 01:12:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:12:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 01:12:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 01:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFpgvjHJp3geFv8fIFkGX86qRXX6qKE5UGRKkn9fNTIEABuc1GMAxaDqFBn1xXtHNsnnhQSieiFXsc2sKYItqgiIZvHKymdrKeU2PIxhnwYIAeKHZizV/Uuvqsp3viGmenbi8Gr0SbEPb/Qal6tM+rrkPrJbud93KXAXiq42FFPfqz5xtxAPELSr6qNwm21YHRz08pR6Ea6QfEPPAyEMK5ic+l1Od705NSInWEq3maS754GbKUpeJrbsOPXTA/6vHJW76QFh2k+6sOfH41x6/aTTllm9dD7v6skZzeoIqqMS4agdf+DeEdQHbcqpyXDhiDXWUJayY+UolwsjFCleVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIyjD/Q+H6UjXhXGZdhxJkGgZ2TB+2KyKjdCPg9cUSU=;
 b=NHU9T1IDr3zglYVjjXD1+dqFo65uX6JkqMTG86BYNB96xi1M5TCRnTsMWJrJPXcPRQFn5z1jSZHhVOIFTRjlFvWqVu/j+Y4yDA3SF3z3fRvTyEExdCTF4rgP7ynql5Q2x0+kUIrkG/y4ZLv/ysnFgC61U/Jbs7XqIj511I02OiVnMCPugx0UjoLXxRzJv0hgqVQVmTMFOmDn5i1yB6K+mewYvqLNj3Rz+t0rA79EOYtVv6DOj0vHW8aqqH1V1qaHqPy91avKn85xqUM8esJ9XUjNeuxa7UhiIqljY+2KPDM1hRoeJn5nB2Hh+nbrNDP9OHjhiK9RzyUypKqevRsQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 08:12:08 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:12:08 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v5 1/7] udmabuf: pre-fault when first page fault
Thread-Topic: [PATCH v5 1/7] udmabuf: pre-fault when first page fault
Thread-Index: AQHa/d0hJApWuHYX6EK8L4b+rGjwK7JJc+/g
Date: Fri, 6 Sep 2024 08:12:08 +0000
Message-ID: <IA0PR11MB718502273712359BC456893CF89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-2-link@vivo.com>
In-Reply-To: <20240903083818.3071759-2-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB8564:EE_
x-ms-office365-filtering-correlation-id: c2b9dd92-12c5-46d5-88ee-08dcce4b9a10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jgeKwyN5PH8wAU+yz0fNH84gjLBBR8xn9Q6DFGO9+5nGBW25z2An747GZZ?=
 =?iso-8859-1?Q?g521a0UfH94xSvJxdjD6tG40oi2nxo+xoyomDFyrkccJDyE4Qo1bo9cpdh?=
 =?iso-8859-1?Q?x3r0XAQZJUnlCgSVvm9maUVCtvhlNtfFPhYV3eXDW1/BeYBL3D76H81qzl?=
 =?iso-8859-1?Q?D+LgygFI1Jb9IazdI09dGXbXCVWvlK5pospXP5sWtXR900M1j+3Wiboavp?=
 =?iso-8859-1?Q?Kh3iMZ+sxGgu/fW+KheEVp4/17/FB5S9KuKuI8EAOR0Km99KIJzpOTnRRR?=
 =?iso-8859-1?Q?4ahSQRrnr0GBqCQT3veTnE+Wd9I3NhQv5Ssf/T2Za5I+/LHCzclQENTeSF?=
 =?iso-8859-1?Q?6a2qr73Z4lYsI3+B4tshsP8RYEZKAGWhB3UC2w1GqFMP9glZNOTpxmFK4W?=
 =?iso-8859-1?Q?K69egdRurec1uCLAj5LizkOSsJplEWe5nEiopgd7DPr1sdnhwu8+YoMPAf?=
 =?iso-8859-1?Q?Rp2gKc/0kVuFNqQcA5VqQPEOERNr0JX25vftpwz6Iz1Borcuu3vda4GtgZ?=
 =?iso-8859-1?Q?TiAoNzs6FWflLErXZZWW/HF1gpNPFTM4C8+xz20fhhJcfKWQqRRFYrnsMA?=
 =?iso-8859-1?Q?qXIqM3vDCoew0AVmwz5mIcQuNkFmU0Pdbd74OPTrWs0xE5UG5FG4b2T8bJ?=
 =?iso-8859-1?Q?E1CQCtag52PLznzWb/3pcWSQLVuEmmRJbJXcpjmOCXSEM3bLXtDlkK/wcy?=
 =?iso-8859-1?Q?FGU1tdWG1wWEpDaDynyND62JkZ91kRK9+YD7cJrGjyqF2+p/mn0jQEORwD?=
 =?iso-8859-1?Q?Bd75FADXVxjbWWv9XOfR1HSCff4se+qhv2zPuHFCu2dBIHqHgfI54eapfF?=
 =?iso-8859-1?Q?76Ruk5r1EJbHj3Vx8B2XMxzOm/ddyCzRDoLUKizNR4+ric4TUN2Cq9ibwZ?=
 =?iso-8859-1?Q?98OV/Ra9ZsPMf6SE1Aul2d7hw6/T2RZL6ll/yhg4I9WdosK0CLMFYFaoV5?=
 =?iso-8859-1?Q?R08SqwfnRPwqeoBBHDOp383y5UnC2ziC/3OTB/lqTr4yF/sVRixmyxHYKD?=
 =?iso-8859-1?Q?K1aFdf/Jy83bwVHOgwTk6P8+/gvUR1gBjcSwz50+D6qdPltFfDmQRUCWwh?=
 =?iso-8859-1?Q?F7bNlEX3LX5IMzVHyE/2bVzfJVDBbbn/GZ2SPXzvqfQ29lDIU6Ho+Iqjs7?=
 =?iso-8859-1?Q?VumAuuvzrUXH7fEj7nFkRyLJl4Dwq63M4lFFa388Eg5HrRqBtqkE3jcK9r?=
 =?iso-8859-1?Q?2LaFNsTRY53xnFtmN+Dkf+927MCrNHGqGmfZ7umjPwtK3agC2/aijkxy8F?=
 =?iso-8859-1?Q?XZ5D4STRvk3b+AeGjSnb5qEFa37iSGVgoH09C5CadLuLuiKVcUyQw8Zizg?=
 =?iso-8859-1?Q?zwKO18hc9n6FUZqNNF+t9ueHEh+uB3PhnBZ+G1XpFo9FiGiTgmAv4uh4Io?=
 =?iso-8859-1?Q?ZvUVPucU+tJiihvVfGMmNvGLlZYJ7KO9rtYpwvJ1wFeYMelltsNPEZWdB4?=
 =?iso-8859-1?Q?3GeAGx9rV3SetXYfrra9UYlALqc8RwjG4f19nA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mXdVScWrs3wpScE1BSLxeMEtZ+PHivDhKvYgXHb0NhP0m7od+id2RwYuKX?=
 =?iso-8859-1?Q?WXzMmO+4RQ5Ct+3TQG4MilUGA+u+4bWWYoT3FW85vFwsVtHMEBfHMvOoAB?=
 =?iso-8859-1?Q?zLID8G/RkE3pvy3K/WEr08I85i9xTfgI3JmyeQCU0keu/77MJQC7vCATB9?=
 =?iso-8859-1?Q?yfBkM4qjSqfmiw7/9fr0XflDMVTEWm+5IYpiQZUj8j5e3RNQKzW8QQxLjH?=
 =?iso-8859-1?Q?cbpTQcm+4guzBnMNSVT6Fc5hL+ESi9YhIE2c3tlRHadCFs0uaYcHDadV+w?=
 =?iso-8859-1?Q?0MHaa+BEc+mMl5cv1wr78FB185HUflC0378Ridewz7dQWidXBM5h0nTg6M?=
 =?iso-8859-1?Q?zRQ6tZUczSIDKUSAOaL5VKOD5+EVGyoN2yHdi/sxFcbcnBQRvweVuWRwL3?=
 =?iso-8859-1?Q?9AJDhB+EMl5bt0xZDnwtq+3nEL4nPbmUxneb+F+LIof1sxh57wuoKZ2fDT?=
 =?iso-8859-1?Q?qKT3dT4mJrSPMCOLBh+sINcE6oFhqoLIircdakuP22QQkK0pZz7XPJJrIz?=
 =?iso-8859-1?Q?dPZS4Q9bg1S+PSRHPBYBnRlolge9scz3nIYvpvbDjITqU7F8SUgI5VhOlC?=
 =?iso-8859-1?Q?2kA2rA9s9N2TSkdyxbtqiXkIxVGrOqzw51O+LYOJAxsHTBUn5KbfNBdINm?=
 =?iso-8859-1?Q?YUXMp1aqiw+6Vbz6V9f/rPOUY/DHP9aVBsvOGnTuLZQ9efsseDMbzUgWNo?=
 =?iso-8859-1?Q?BdOT/iUQ77x5z43Q2bRa3ugaj5Ckz3RD2IMPbk5BEq6uDvdNo6GPJRox4v?=
 =?iso-8859-1?Q?DcJEpRAoJyRGwOIGv6IrSusiL8xTfgZsWOc+KBS39Sf45SKWSHCs7HMlC4?=
 =?iso-8859-1?Q?g3J4XDiuyiIXZLI9D/Bwc78pgEaHpL2ChngAQLgAGE38i/vbO+3eXymLY8?=
 =?iso-8859-1?Q?AMh/p7r9rjq261yoR4OPaJjpPVQAoueKltkhEf1rBCVgfbPXPCmrb7aprY?=
 =?iso-8859-1?Q?ayllIM7XAtBVo2xN4uMSGks33TR6k2KL282PaWc7lk3mZ118A8w0hLFcq1?=
 =?iso-8859-1?Q?mE6wVSeXnj5oXiNPWl/PShV9Xgi2t7pGW+mvRFFkYREk7PYkHXi6Z8OQwG?=
 =?iso-8859-1?Q?UUL4Rb24am0jMDN9sri+zRKQ+R0i8RPXOQisfs7Ktm/iwkIdKT/fBshiVj?=
 =?iso-8859-1?Q?ZTAQnj55tCSoxNQVOGgzvHgLxQNAc+W2D2HRjgpxOP5pcHUvm62HQAnE95?=
 =?iso-8859-1?Q?9Ec5jfuciWlskAIQRCfROZkT2UQX0mQfw21K8Ab/y+iI2NUmzFWMXSybM+?=
 =?iso-8859-1?Q?EhzbD6MVfBglbEdggWfznx36ptev5W0iDouosVypAQuXv+7El5ZG6U8eef?=
 =?iso-8859-1?Q?W8kv99GPDVrKIa6tjN9y1LvyTCLNbr9I9wybCUBmbqAsraRemFkIjEiyrx?=
 =?iso-8859-1?Q?DvSjY6syA1OHUkbZr1J00I60wSIbWOml0AoGmjSjmlqFVuRxtTk/Y8DqWV?=
 =?iso-8859-1?Q?quadhNdUkKUHfwLYImIWbid6NAw90nllO9TAXbItPwA5VKsMJHJ+KY34mR?=
 =?iso-8859-1?Q?yZbZc0i7MdW/tS7PRz1gBOdbDREd+1wRzxtMKpaJ7hIRhpvYT3Ze6vYWgY?=
 =?iso-8859-1?Q?kDG+0FDelzz0hJ2Xfw+K71A5Ke+wXYZQIk4QRzp5OYbrvLmfAN9rYzQ+wx?=
 =?iso-8859-1?Q?CMrESskkCzz58uuK2Xqt57XIJUugwFHZOG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b9dd92-12c5-46d5-88ee-08dcce4b9a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 08:12:08.2033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3/tthafMtXwD9a4COB2d4auucBYzVjlYXWvwzMvAWPBNswCSUZWTPt2SgYhbR9JyrHF44NXw/H2w/DjW8cURLTlKpnYNoWavpeRcwaZPWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
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

Hi Huan,

> Subject: [PATCH v5 1/7] udmabuf: pre-fault when first page fault
>=20
> The current udmabuf mmap uses a page fault to populate the vma.
>=20
> However, the current udmabuf has already obtained and pinned the folio
> upon completion of the creation.This means that the physical memory has
> already been acquired, rather than being accessed dynamically.
>=20
> As a result, the page fault has lost its purpose as a demanding
> page. Due to the fact that page fault requires trapping into kernel mode
> and filling in when accessing the corresponding virtual address in mmap,
> when creating a large size udmabuf, this represents a considerable
> overhead.
>=20
> This patch first the pfn into page table, and then pre-fault each pfn
> into vma, when first access. Should know, if anything wrong when
> pre-fault, will not report it's error, else, report when task access it
> at the first time.
>=20
> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..0a8c231a36e1 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -43,7 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
>  	struct vm_area_struct *vma =3D vmf->vma;
>  	struct udmabuf *ubuf =3D vma->vm_private_data;
>  	pgoff_t pgoff =3D vmf->pgoff;
> -	unsigned long pfn;
> +	unsigned long addr, end, pfn;
> +	vm_fault_t ret;
>=20
>  	if (pgoff >=3D ubuf->pagecount)
>  		return VM_FAULT_SIGBUS;
> @@ -51,7 +52,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
>  	pfn =3D folio_pfn(ubuf->folios[pgoff]);
>  	pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
>=20
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> +	ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
> +	if (ret & VM_FAULT_ERROR)
> +		return ret;
> +
> +	/* pre fault */
> +	pgoff =3D vma->vm_pgoff;
> +	end =3D vma->vm_end;
Nit: use vma->vm_end directly in the loop below, as end is used only once.

> +	addr =3D vma->vm_start;
> +
> +	for (; addr < end; pgoff++, addr +=3D PAGE_SIZE) {
> +		if (addr =3D=3D vmf->address)
> +			continue;
> +
> +		if (WARN_ON(pgoff >=3D ubuf->pagecount))
> +			break;
> +
> +		pfn =3D folio_pfn(ubuf->folios[pgoff]);
> +
Nit: no need for a blank line here.

> +		pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +
> +		/**
> +		 * If something wrong, due to this vm fault success,
> +		 * do not report in here, report only when true access
> +		 * this addr.
> +		 * So, don't update ret here, just break.
Please rewrite the above comments as:
* If the below vmf_insert_pfn() fails, we do not return an error here
* during this pre-fault step. However, an error will be returned if the
* failure occurs when the addr is truly accessed.

With that,
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

> +		 */
> +		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	return ret;
>  }
>=20
>  static const struct vm_operations_struct udmabuf_vm_ops =3D {
> --
> 2.45.2

