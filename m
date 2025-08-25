Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305CB33660
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109E210E1AA;
	Mon, 25 Aug 2025 06:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM2dxHil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC60910E1AA;
 Mon, 25 Aug 2025 06:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756103215; x=1787639215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eCYlf9hf1+7PpTWDzgpHvlmrxa+KiVDuL1mEPoAJu24=;
 b=ZM2dxHilNl1+OWN0lBb9o4L7tRb4ExtYAJsTXOI8k9Z157BUgigPiJN2
 kaBteRCjASaevzF826q0xxZvLfOiuBPN/Ek8wchK1L942CWqNVYMFUVDH
 aDJVg3aBiJs/lidwvHBm2iMPpBe8PM+phY9GFnSA/3irpuCN+1wsumQXb
 yVpx9UsywSbe0jqCvqKjUcc+8CoTO38jdydt21xQX+ksp/tgrTFkpZExz
 6qSGcHeP79/CHSPqw+paeSWxOyBPXZ8Gckjggo5PCXE8sLHG374AOavWh
 Ytgdt26iDFOepuFFXOw8UdEj3HGjo2Co6J0lCF/ihxA1xyLzOq0e5CL+h Q==;
X-CSE-ConnectionGUID: s1wQQUh4RZ+HNyolxOcatA==
X-CSE-MsgGUID: iXpsXIV7Q5iOc2KJVioncQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75903105"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75903105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:26:52 -0700
X-CSE-ConnectionGUID: QnFUAX0fQJaJdCtyMKFSSA==
X-CSE-MsgGUID: /pYD6e5uTOaZGc+LeItvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173394836"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:26:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 23:26:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 24 Aug 2025 23:26:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 23:26:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ/Rm1Cm1xX9HswXV/mwpErLuz078mMhnyesKQGnj57NcqVXHRMHgykV5O0Yr8kMlugU96kBmEQ+ITu00emfazM5ovq+ltb+MRp2LND1pVr6TN7OJQVnH4JzRVUt8vY9ST/sKzIz4Iqq1lnHr4Qvi49Upr9jgfIuPvoHJ9iqdpOj/zgrGErhun8N9ALsPPX7NNa005dLktQKzh1otFF8ujZSjfrH2muL+gG/gb2zqFTZHiKQXuxSv7/tEaGilNmTcLWMq6Upd8V0SNQh9J2JrSvaZIBZZVXRau2MVlSVMdHxXodLEh3RLDCAYUBKxHY7XKtBaTPS3awPrE89JHJ+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCYlf9hf1+7PpTWDzgpHvlmrxa+KiVDuL1mEPoAJu24=;
 b=DHgeni4gfvjogt/RFGzgfdSk2wirhs2kZKS9qDTJUije2FuBJVzoXrq5Brmwosy+7esiB06HkgfftyLsqmbr35lazoKDf3jE4TznNMxZhhsn4Zm5fXgsg67hdD3kZCYCt2UQG+0WIWBwnO3eED9jpdoolpXAmG+kHR8oyLe34Dgb2n0gWzBGVW+B73Wif9LcRNSScCZq9RCbE6z6VsRFMVKTofq+tjpU+7kDU96sa994P/o2eyo8oatngOvV6qVoZJGos43RbC7+BwOdb6rOT2n8KsOFBRpiP/GNIG9BxM61zdSnz1BepFTwA4/ze87eblY3H1/2LfFFv2Y2N7qb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB5972.namprd11.prod.outlook.com
 (2603:10b6:8:5f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Mon, 25 Aug
 2025 06:26:49 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%6]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 06:26:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "mripard@kernel.org" <mripard@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: "liviu.dudau@arm.com" <liviu.dudau@arm.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "kernel-list@raspberrypi.com"
 <kernel-list@raspberrypi.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "siqueira@igalia.com" <siqueira@igalia.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcCqI6AGKw1/GB0USjdMcIW4UewrRdM8uAgAAKoACAAA7iAIAAJHeAgALrc9CAAfpgAIAB+N6AgAVqpACACUCzwA==
Date: Mon, 25 Aug 2025 06:26:48 +0000
Message-ID: <DM3PPF208195D8D87AECE8397914A67D9A1E33EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
 <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
 <wr76vyag2osox2xf7ducnkiaanzk2k5ehd2ahnoyqdm5qiywlk@penf4v5bvg5z>
In-Reply-To: <wr76vyag2osox2xf7ducnkiaanzk2k5ehd2ahnoyqdm5qiywlk@penf4v5bvg5z>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB5972:EE_
x-ms-office365-filtering-correlation-id: 6970fc9e-7003-4cf4-2add-08dde3a05f3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OOC7bWj0dbJA7we/rejlc6T+tmx8TCr6vzSsp+xA86jRjtY/JBOsrUQZYdlx?=
 =?us-ascii?Q?JG0YnDyY8RZvQcxjbLypNlxg326/vvEGXWbFchq88cnw/g+UxjMd3LyLhbIT?=
 =?us-ascii?Q?IyqLX9pTXuVnzA5FwmZcC0Anv0naKtjUMo2UnkspjtcxYqDffTATH0s7pkX+?=
 =?us-ascii?Q?q5OW2Gw5HUA19hNjogvz+AJ9ReKhkk90eMJ69pgDFjYgW/XNJPFhe7JC57Nm?=
 =?us-ascii?Q?hrhYLLeZ22Ymqugv0MoGR++7VvTzQLcxoZ3wNCpm0Egvk3ZkL30MbsZudSVK?=
 =?us-ascii?Q?BxAMEqwXzhpE1OxOLlWNpWue9/PBvlIHwGrkD8ltTn68/eV02fEhp+92PhDF?=
 =?us-ascii?Q?Qyqv3bd2KxPHCe9G9U4OK/Im7hBTvkl8FEJlxqOBEH6Z0UC8LbX+EZBD22yR?=
 =?us-ascii?Q?M+ufMNmmHyODery6DrOeXsec0Q8EI15K0IbNVxqEplIS2/blT42XxZviLiJK?=
 =?us-ascii?Q?Zw/ySqvlO+OguQzaRVqTs0TFl41SRyiv0VJAPt77XrDTOx81r52g9tl1xUVG?=
 =?us-ascii?Q?MxUUCkOn5nVpWVyN/F/YeV8FnHrhtyZyPXFV/57VMtdcNBv9IVDcVI5ijwtR?=
 =?us-ascii?Q?4un9Yd4//ASC5cBklHkOHGSxrwfkBpfEkD0iKNgUfYB+Eqzk9sc04irC46zF?=
 =?us-ascii?Q?c225FzahJ71VgORZyMTDzKv850LEfZpnwsJjM7OjwvVsOyXEVEKgPqa4bnu1?=
 =?us-ascii?Q?5uir+HEPhr2waypL0YolV/7iol/2RfsH+afoKWC+NidFDvUIL2W8LbDan/jc?=
 =?us-ascii?Q?tGuZy3cOXP+/FyITGYSKgTfltiOvCSF3fshZkLa09lJi1fQ3eqJuihINyz7/?=
 =?us-ascii?Q?im2CrdB02wW3RRD4RHeUlgHaklv/UyHv5lO+XeeIx+xR3Gh2/s+bKvUFOw8m?=
 =?us-ascii?Q?BUB6XdAxa7Sd5GgxgywlCSlnKbAUeY8jOjT1mbYrxfM2Ry7i67kfMJOEIXB0?=
 =?us-ascii?Q?Nx0Lb2g0ceu1NmOBoIuVc8eNXtFLqH3xX4oxL5u6oD8Mu6GJ0NmiCi2kFgkL?=
 =?us-ascii?Q?ajCVLtghMacICBO345lr/dh2d1cnkvCb2RiRIlYDnivm0w67/13ewoKVXxB+?=
 =?us-ascii?Q?Y3RUFXUSH+sJBgxl6iCYjUN7hux5E2ylDOjOA21S8lZ4+KHnPiZI85uOzebK?=
 =?us-ascii?Q?SCO229nMlyafkz1Mco3PujkJTlEwnGoyX72Do0twL6EkFhyh+k8Tn6t89qa/?=
 =?us-ascii?Q?/QIAIb1a1E55z1q6r0MTkVUuHcUXdx1E5O7MYRHA6bJD/NqYjOunk/Zr7sY/?=
 =?us-ascii?Q?7pQ9o1CLV+e7f7TkQ7WZImb9Ud/9qd2wDSEivIo/pen7daIxyYfaeAv68LnS?=
 =?us-ascii?Q?kYFhaX07x+5ppQRNxP9tdiahEBlAdSbV+MZBvUahExF4rmfUTg4qrfjIZSAE?=
 =?us-ascii?Q?uwr3eWtmP6uVLSQr97N1EFh5+Q8VLJwmaObRKwfKJYQsao5mJhirCrapSbg0?=
 =?us-ascii?Q?F7iJ/A3AyT/ph8YD3x1Ntgfm8uRhHGngTPx59PPrW5IKJQ9AtwakbTfakhVA?=
 =?us-ascii?Q?OUHd9LuonXO0zmc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wjvZimJ5e+bYOiGejPc6Ylni+/agUWoqeFKL9lSaRRNY70fHXKVJJ+it3zYX?=
 =?us-ascii?Q?6wg01xcTAMzNFq0UtERvoV9ijm91dPgdU2KiQ12MmqyZx7ksYb4FL4cbvk+h?=
 =?us-ascii?Q?XjX42Ar5a3IyBkv5rbYtidFbboVWy93pq6eKceLaPZuwsbQB0Q1Ksgt8LuLl?=
 =?us-ascii?Q?cd5A4R0OW8oXDJho2O1AKzCvp4PZmTB92i5iTe7ag9lbqdOIcYQNeQiXFSIb?=
 =?us-ascii?Q?/qEQhQVBrQ3JAbOWg5lklYgbTEGnqS1vhxd75l9/7/0ZZokNv1SEis3qvXzk?=
 =?us-ascii?Q?mQqW/x3EkOXCKAGd2q0z7vi7YM0TKg+9vQkmQls07YzbTd0MVdbPSQkj6QPG?=
 =?us-ascii?Q?5CpjGIS4zLj7dFRLWimAcSYtRM9Hb04mElM8Zbw3DMkKlWluGXNhZEW9SLQQ?=
 =?us-ascii?Q?UvOx91+g/YIKDV/5NLng19xZ2kedjll2vf+1oKIMfkxznz8iKJlTrQL55RBh?=
 =?us-ascii?Q?kbZqxcDevv6knOGT5YznmPvy3+37tfkmfEnOfP9A3Awlrhux+W3g6ZBTaVmU?=
 =?us-ascii?Q?l6NbW3B/EFoXzI2TH7TR3zAyPOREMuPm+pV+S5WQztDEGwQbxhoFbalHQYEa?=
 =?us-ascii?Q?N5df0MoSqE46E7Cjk5TBY9BxsJAOW6qsTc6UJaOA12Q4Wr0Wr5LN2S4gR+vs?=
 =?us-ascii?Q?vYKzC/hnEKL3mqlt6H7PDNXfp0V/lvnkH1umJFPJ0mc+AcdP8MdyKzCkhILF?=
 =?us-ascii?Q?6e9Sh3UtnTwrzgA7ec/uzmubWtF6gGPS/bQiiJ0pHvAhh5IDawm3bkxR3qMz?=
 =?us-ascii?Q?XlnUASLf1fmjCEPmlD0VyxlAqom7G+r4jyBxVPmjBaUyWWfofKF3AE0xtHiG?=
 =?us-ascii?Q?VUWOp7WjWffL/fpfppzporDEDasy/JQMuSwvxxv9Fp2y5yXZMSWlZednudp6?=
 =?us-ascii?Q?/q7ZKBPNqsXO/zRIoy8Qq7qWZEbHFtfdH6Pe9dY7FLY0vo+j5apg3dekS71J?=
 =?us-ascii?Q?J9C61fGPVBSrqAhTpRw+yr/KA8PdWqYHEMI/EDGlYo7JnG9ij4hNDJN5aIxg?=
 =?us-ascii?Q?kPGNUA9jjAsdBBWSnYS5TbaMC39ht+fBVWHw4q6PaYzogyKT789hpakU/mLq?=
 =?us-ascii?Q?IlTrs4W44S15oyabXWb5FwGV1i23w80VqDeQFLI6oogbIKKHgo7XukaUXH0y?=
 =?us-ascii?Q?0S+n0f2dc6AYkHhATOAWkS3ExDpJ6br3ofKoz993Eu0tOssqwLAw9r56YDsj?=
 =?us-ascii?Q?hM99D703kjdELu927nQI4JDdgCX3bPYEUAJJ6PoWb4IrTtihzaPFlMwXb43Y?=
 =?us-ascii?Q?kyQdQmlZKNfvpG2SS/Ur1D+JOlVpDhuAly+48tPqEp0i5GJebuRBkvfIY21W?=
 =?us-ascii?Q?mW0hqH/9YkhyWHl0MwNP45TTmF3XVWOYr0G6nvPOnLWNnEWmZwQOS3xkpy8c?=
 =?us-ascii?Q?SSTaDoC9A5m2h2TxeI5PcZlZbY+Dd93I4brT+C44qHbk+oHmYlr4QTj1kgd3?=
 =?us-ascii?Q?Qx1QzB9BdBMMr57HFdLCweUeKhcH/eahcx2Hsqd3Tn1rNChUspb9ie5Xcp2X?=
 =?us-ascii?Q?EAKi5gxlLtlMYkEEmiOUcsZCGlA1VvDWVce7chcB7gZAlI3vSiR9izMlBb4X?=
 =?us-ascii?Q?xV6sSlj3kJ7MHe8u09ZAnLMgq2NdGUcytS3EULl8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6970fc9e-7003-4cf4-2add-08dde3a05f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 06:26:48.7935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfxYUku3vnFSWgCzxnDaEkEwm339QKDZbYv7UD9wjYHZJ3jns2lyU9g9bgucu3Kk49ax3ngqSxlV86ErSOTsjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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

> Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor
> drm_writeback_connector structure
>=20
> Hi,
>=20
> On Sat, Aug 16, 2025 at 01:20:53AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 05:13:54PM +0100, liviu.dudau@arm.com wrote:
> > > Hi,
> > >
> > > On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > > > > };
> > > > > >
> > > > > > I still don't like that. This really doesn't belong here. If
> > > > > > anything, the drm_connector for writeback belongs to drm_crtc.
> > > > >
> > > > > Why? We already have generic HDMI field inside drm_connector. I
> > > > > am really hoping to be able to land DP parts next to it. In
> > > > > theory we can have a DVI- specific entry there (e.g. with the
> subconnector type).
> > > > > The idea is not to limit how the drivers subclass those structure=
s.
> > > > >
> > > > > I don't see a good case why WB should deviate from that design.
> > > > >
> > > > > > If the issue is that some drivers need a custom drm_connector
> > > > > > subclass, then I'd rather turn the connector field of
> > > > > > drm_writeback_connector into a pointer.
> > > > >
> > > > > Having a pointer requires additional ops in order to get
> > > > > drm_connector from WB code and vice versa. Having
> > > > > drm_connector_wb inside drm_connector saves us from those ops
> (which don't manifest for any other kind of structure).
> > > > > Nor will it take any more space since union will reuse space
> > > > > already taken up by HDMI part.
> > > > >
> > > > > >
> > > >
> > > > Seems like this thread has died. We need to get a conclusion on the
> design.
> > > > Laurent do you have any issue with the design given Dmitry's
> > > > explanation as to why this Design is good for drm_writeback_connect=
or.
> > >
> > > I'm with Laurent here. The idea for drm_connector (and a lot of drm
> > > structures) are to be used as base "classes" for extended
> > > structures. I don't know why HDMI connector ended up inside
> > > drm_connector as not all connectors have HDMI functionality, but that=
's a
> cleanup for another day.
> >
> > Maybe Maxime can better comment on it, but I think it was made exactly
> > for the purpose of not limiting the driver's design. For example, a
> > lot of drivers subclass drm_connector via drm_bridge_connector. If
> > struct drm_connector_hdmi was a wrapper around struct drm_connector,
> > then it would have been impossible to use HDMI helpers for bridge
> > drivers, while current design freely allows any driver to utilize
> > corresponding library code.
>=20
> That's exactly why we ended up like this. With that design, we wouldn't h=
ave
> been able to "inherit" two connector "classes": bridge_connector is one,
> intel_connector another one.
>=20
> See here for the rationale:
> https://lore.kernel.org/dri-devel/ZOTDKHxn2bOg+Xmg@phenom.ffwll.local/
>=20
> I don't think the "but we'll bloat drm_connector" makes sense either.
> There's already a *lot* of things that aren't useful to every connector (=
fwnode,
> display_info, edid in general, scaling, vrr, etc.)
>=20
> And it's not like we allocate more than a handful of them during a system=
's life.

So Are we okay with the approach mentioned here with the changes that have =
been proposed here like
Having drm_writeback_connector in union with drm_hdmi_connector
Also one more thing I would like to clarify here is how everyone would like=
 the patches
patches where each patch changes both the drm core and all related drivers =
(ensures buildability but then review is tough for each driver).
Or patches where we have initial drm core changes and then each patch does =
the all changes in a driver in its own respective patch.

Regards,
Suraj Kandpal

>=20
> Maxime
