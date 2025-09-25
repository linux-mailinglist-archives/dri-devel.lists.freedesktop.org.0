Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28773B9D5DD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 06:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57210E835;
	Thu, 25 Sep 2025 04:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3VJB1eJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9613710E834;
 Thu, 25 Sep 2025 04:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758773224; x=1790309224;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oqdpwM2lYKbxPJPbSexcS9hiboAhcwyCoPooO4sov4Q=;
 b=H3VJB1eJ2qYya7uapg/YwE2D3jdqSGPlSIcRYAicNcs0swx1SRkjz7p8
 D1DsiNNi2MTGJZvpIWndVWzvoeExw0sdyLUCjuU9nrd5zQUM6jQXAPvAf
 gy9p7/lkVigzJ0sN2l1Uhylbtx0QDTKZb83N6+oagcZ9BJyEGGDMYIR28
 I9oOH3u4jvBxENg4OFxy23uty+VNsWJLDzqroAhoTYnC8DEO5lb33F1+q
 LFac1aQRDc0bzu97Y2FHIqNWGnKHy675RcbufjK94BK06t1duo5j53G1T
 WlcKt6qwxxy12mEjG/QwlbJhQ/l2f4ozQkeVQtlcCY/26AHxIl7aE6dIl w==;
X-CSE-ConnectionGUID: at0F9LfPTlGMDrNude/ViQ==
X-CSE-MsgGUID: 6bY0rCOqSUOw61MLCQTXiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60783813"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="60783813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:07:03 -0700
X-CSE-ConnectionGUID: Sots87xMT4y1V9+QrYl7sw==
X-CSE-MsgGUID: kQrtaWiqQWucB7VkgZJMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="207969374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:07:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 21:07:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 21:07:02 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 21:07:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okS+8mL3A0soX+7K0mrqPHwqZn964WsljYiVicJKG+a17JCcywz8YgvIxNYRfCyydnMHxhZgqtdHTJaEN0t81Nw6NGptIQaGYsT9o7IPDfM2Pw9Bd2pcU5KRSN6R++tg/16YWpdKxoskL3twC1rfbKnUC7wba+i5JiBE5qhVkzCondIOeZ/dlwnYCecB2KNdXBQgQrXyzmN2Y2sv7mu6duRXQ+6DHat9b6KbT46BiiggP2Bz5WwBufFw+YOD2czUL0wWWC0om6LhraLyvW0+bs9bvJmBp4GHvcVnlXgUmSI7t1bGoOPOIW+hoj/2LkjHKDQ3N1KYgOXjshLtJHN6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6N5qClvazfZIwomx5J276ld3kRtW8f8fHqFTvH1VWWU=;
 b=NSGaq66DhdZDrG/1x/RbHOIQGYKh+5baQgHjTyT/GYNK1ruxlcs0WfrSVfLW1/kQmM3hXQos0z4cbiNc1UrVbBF6rQJRRtsWHwnAgfWRDT5410K+bwtiIloeSTtwq18fCqjTKf8zE86jgyX/NPkSEJPuShkVjTuKnrO7g5ftelx3ISGnWZCQ4fFt2vxmWU4xMdIeKZYsxU3ookuJEJ1ryJs5uqsvV5tPi31UO76WjRc5X6Bs9VfoE6wdMhLEbU1UnuCWpaE/MyZp+NqxWlJybirj6b15LM7ZFbRN0rW/bMOi+PoPXak3IWE1YBkgAgkSk/95U/g8UYiFu2+EnTej1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 04:06:55 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 04:06:55 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>, Jason Gunthorpe
 <jgg@nvidia.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 Christoph Hellwig <hch@infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcLW5LjOs8C0ipA0qGlt3Q6tg4CbSjHnow
Date: Thu, 25 Sep 2025 04:06:55 +0000
Message-ID: <IA0PR11MB71856C96E6B35525BC027AA4F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250922121253.GT1391379@nvidia.com>
 <IA0PR11MB7185067FA8CE8A95419D06F5F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNKiXTGs75fldDYS@infradead.org>
 <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNMnHJwWfFPgGYbW@lstrano-desk.jf.intel.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250922140024.GZ1391379@nvidia.com>
 <42f45fa2-6ea3-44c7-870a-dc1973894a87@amd.com>
 <20250922132720.GY1391379@nvidia.com>
 <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
 <20250922122900.GV1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250924161356.GA3273841@psionic12.psi5.com>
In-Reply-To: <20250924161356.GA3273841@psionic12.psi5.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA3PR11MB8047:EE_
x-ms-office365-filtering-correlation-id: 9d2397fd-5bcc-48d0-4fcf-08ddfbe8f73f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?NXySByCRaOGkyulDPH68dzdyPxMFerT5HJ1uC3E/f0GL/af+HpzcIErsdi?=
 =?iso-8859-1?Q?JXF90CiH02b7HQ97vqlzGQPWQ7axNvwaMhxhWgO4iZ/iFch8LyHte6jWlR?=
 =?iso-8859-1?Q?wOLhaJ0IgjZb8ne+bUBdPonUmM3U0YC0wX0RWdpqPqCsn4fVTU0wgreENA?=
 =?iso-8859-1?Q?vYMajz7uKs0ZDej5UmOjnnc4NVV7IGd8uwMvBV5FVtHQj3+aaKMys9YWWK?=
 =?iso-8859-1?Q?T8fryC4MWAZY9oPWdB0cWjJPbneMx4di2bYla6PqnDW0RjegBACZJfJ69b?=
 =?iso-8859-1?Q?8gQ3sM2Z4sZkKSOQR1TGcIK6d8CywA8dxc9UNS0NZADErHcHw1BPD2E1ua?=
 =?iso-8859-1?Q?Sq7sf38hao7346hStqmFpKlx7jdCBBDKfVaX6BSrhcDooL2GYwqIGApilq?=
 =?iso-8859-1?Q?eonftrSRLqfUhEjWpb+LArwv+kClbh/FrILSv4cuyUoXHi0mGrjFhaE1Ws?=
 =?iso-8859-1?Q?pe80rSwDE8Ypv2f88vEHgSoyyBGQvOXCkfylOTfs2lMxe/dWOgXsVxGtn0?=
 =?iso-8859-1?Q?ouj1Nqnpq5ctqTavi1CS1hnevYCET3EQK/f6AXFW9iBpQJ5Y9MjgTf8BAu?=
 =?iso-8859-1?Q?eYg7oEzEe60IPO/4kpLeUfzrGtqr5vbVBH0N1lsjgp9rrEDkg5uMREZcjg?=
 =?iso-8859-1?Q?3xqEWB/dlvzKRJ5TnOxkuxf8XyrK2jvTDWoRBahJRwqxhMNE1QHFYCjz4V?=
 =?iso-8859-1?Q?dst5b9YLNEyMGGLcV5baQBjP8wGYVn0X8xe10OojRJjo5YBjlCnHlgq900?=
 =?iso-8859-1?Q?1TMYCZZEiMvCHN7wg1JSI/yGAQwIx1vQRBcf+R0IrDU2cailrdULHd+81h?=
 =?iso-8859-1?Q?qJ2jGKkYeSbdKAPGAT3Sg1+PAnJ4gbYvk5o5SC/0TMWCBA8G85mm5dN0lW?=
 =?iso-8859-1?Q?YdhbNVagHYmmvc6DT5YzjoxQQpdmKRbG6i+X/UDGxwz1PbP9LqiSMd/49g?=
 =?iso-8859-1?Q?rwIrAicTpeMevY2D6sqkP1oNdLSLMvH5arIp44db4qYkoOwW/7GPJA4PKw?=
 =?iso-8859-1?Q?THRC+UJ7WsE1ZCqqTuV0HnzJ/TxGbHm6zg6jq+W8OGQM2bmjadJexziGsy?=
 =?iso-8859-1?Q?ayLv2F5NCpEVPVBDdkHa8Hk3fOMDquqEc9tANbo1vmVvNuCAcNrJ1uohla?=
 =?iso-8859-1?Q?9jRk5yXeRrV3ABtKzotCHP1bd08J1ge98ke/p4uyvZcsp8tm1xPjvjqoqE?=
 =?iso-8859-1?Q?Jf4mz9edfh3tq5kUdB0DgnAVmd6kKbx+2C5hHd+hnUVIyzPrXLE46uWcsW?=
 =?iso-8859-1?Q?/3KHLY//PR+4Qq02oom/beYbKm+Zk1/YA87YcQ9mEvj0+q1vy4jpuBBVqK?=
 =?iso-8859-1?Q?/GpoY8goKGOWNmxbsJ92CN33xa91o44LRJNnesQJUODO7YZTbZ1XuPgpTR?=
 =?iso-8859-1?Q?sqM6ETyRyQ02PLD/PsI/akWedy61JLtI6srzfEk81xPKWeiP4Qlhjqnobp?=
 =?iso-8859-1?Q?PLwGuIxTdxK7rXNiYpHohnaAD4lh9Kp7PTpKXnURdnJbOU/7gTy6GIw+J4?=
 =?iso-8859-1?Q?2d7VER71zvZz5axznxCRjdPvRnwCbpxElq+aju8gLTKs8KybPRY9gdQ2rK?=
 =?iso-8859-1?Q?eYq1hkE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1HCm20eHqQIXcu1QlfvkOqEo4/KYH+Q5DLaoF8xOAdwCT0MRo4neg3YmUO?=
 =?iso-8859-1?Q?3r2HuD+sS3F0kbNStPARTHttRxccCBzc3BNTxV4FbRCWjvrYRPuou5Y7df?=
 =?iso-8859-1?Q?oLfEsBGlal/80yj0eBNTDgyi73w2ZF/ZRW1+Q91EHjJnKoTbY5XUPD+HHW?=
 =?iso-8859-1?Q?GchtKfgYQAZBLBTqwrTSMwX5dk0/R3LSpAF9ll+L8zWUr42PhLXggIJNwe?=
 =?iso-8859-1?Q?bPGj07EZe+vswuedACzbgco/Dqzx0fBHJcxlWt6cr9yLoUlVou6e8s6bsV?=
 =?iso-8859-1?Q?/imRHMat5qM6DcXbo3qC0eBUvzPpILRfUsg6m4KYA9sK8FX3x6rc/dEqMo?=
 =?iso-8859-1?Q?9HXknPj1yVveq17Pb1hPItHmRBD/vPQygk1I6KxlIPry/Jquo8X/uzmaIC?=
 =?iso-8859-1?Q?Kav+eF8p4Re1gJo6OmPeK8m+f9wRtlR/sIqiPRP5M9XVyrx+yTUlr2YYef?=
 =?iso-8859-1?Q?SYzdRQRboryQBZktHjc3jl38PJwfFR8vHvTdjjfYjtoqHJgxKPQ/k+kmBL?=
 =?iso-8859-1?Q?OLrIx+8Apy2/fpw2TcbtQ7ewpiJcmAkgGfVok8QpL6KBMcTrIQZMuKoFFU?=
 =?iso-8859-1?Q?8d1LTNpU8timwQ8nU+FzLJnhgE2wuyo1030tH9Re4XJX7sBWpzqJ2zlI0r?=
 =?iso-8859-1?Q?RICEHAg/vVQJqehS+MfmAgAmCqXl7sMeNLpsximK1fPs0Qg1GZ7xgOVbXc?=
 =?iso-8859-1?Q?GfCCwxc9oUSsjgI5wmv49kbveXE5NJQjw2pNXfF9qapJzL3HRvHHFkRv7S?=
 =?iso-8859-1?Q?TvRK3Y0X4Ya3i/bk0AcIknMTExecaYfc22xwyVD/ggqVgdPsesdXYXN00m?=
 =?iso-8859-1?Q?ywf5oFW9G/PtMVusvvPjWPzhtgFnPZbtxAfewBgaeWMXg3Wd31AE/t+sOl?=
 =?iso-8859-1?Q?h/9dyPXBahX7H9B5EyQ2PpIujNDoJxCsK8QyNNC9WAqr5EcCO2TUbmnIEv?=
 =?iso-8859-1?Q?0cr+Km07IcmBTXaRmOMMUIDVqUQhpEIHd2TcnBvxsQs1WB8L6fOIJZ35RR?=
 =?iso-8859-1?Q?I78Qh/Z4qQO2PRin1YIoIOupoGeIt5gD8BT4qBk25FbqaehM1rYrR6LzDu?=
 =?iso-8859-1?Q?IxqPIzzmTWkC0Zg7ufNWTMN2NmvP/516Qu2LzEz8t6v4a/QD4cGNDpL/VN?=
 =?iso-8859-1?Q?G3gUw6LmZiJksAIbhVUhJb3O6HeojuQTY5L9KfpxbC/Sqyc2Nxi/ybvdbv?=
 =?iso-8859-1?Q?tcsHZgA7tHYMpvEN5mYFJ4TOAjF4AmbUOBZ/zZk+7YCirdU+Ci+cXOCKRs?=
 =?iso-8859-1?Q?YbHHtcwUudvX2Wg3RpnRafw2Vvv/ud2l7l7jQHyD3q/DnXyV4CQKnC/DMc?=
 =?iso-8859-1?Q?4TX8CGJdh3yTHldrQTAe3yg/PHj9fWXuhc5IiAyWmEJ2U9//hiUFomPHst?=
 =?iso-8859-1?Q?UJn56pQVq2GwQt5mS6XHymVbXtfmnqtcenQsAxkpSYTI1LgyBTAYKAFlRR?=
 =?iso-8859-1?Q?qxVsVTmKtfKAU7v2jPL3GlsyMKDusY6/VAfmkN0/Y5a3svxIn5QTK33uQ0?=
 =?iso-8859-1?Q?ZfZSPkDc0vBYHC3Eu8HQrUjGyIL4RAlfj3mCnupd2UjbqVVzCvjUpsn4Zj?=
 =?iso-8859-1?Q?wVfVg/9UStAQkVLD8g58MiwTA6ucPcWH1e4wIWS89XeUW1yD+Er9eocUs+?=
 =?iso-8859-1?Q?cZeRR3Cro+T3WBm7pc3SDRHy64WeeEl9yS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2397fd-5bcc-48d0-4fcf-08ddfbe8f73f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 04:06:55.5040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8JMZutkxmXA8z337uF+AgRikFUKFbwAtyZW2hGZ4tJXzWzWgxBZkONI/PE7twLwbYkyUPegw2yTThE7Fo7qng747sGMp76iYYY+9BGxrRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
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

Hi Simon,

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> Hi,
>=20
> since I'm late to the party I'll reply to the entire thread in one go.
>=20
> On Fri, Sep 19, 2025 at 06:22:45AM +0000, Kasireddy, Vivek wrote:
>=20
> > I think using a PCI BAR Address works just fine in this case because th=
e Xe
> > driver bound to PF on the Host can easily determine that it belongs to =
one
> > of the VFs and translate it into VRAM Address.
>=20
> There are PCIe bridges that support address translation, and might apply
> different translations for different PASIDs, so this determination would
> need to walk the device tree on both guest and host in a way that does
> not confer trust to the guest or allows it to gain access to resources
> through race conditions.
>=20
> The difficulty here is that you are building a communication mechanism
> that bypasses a trust boundary in the virtualization framework, so it
> becomes part of the virtualization framework. I believe we can avoid
> that to some extent by exchanging handles instead of raw pointers.
>=20
> I can see the point in using the dmabuf API, because it integrates well
> with existing 3D APIs in userspace, although I don't quite understand
> what the VK_KHR_external_memory_dma_buf extension actually does,
> besides
> defining a flag bit -- it seems the heavy lifting is done by the
> VK_KHR_external_memory_fd extension anyway. But yes, we probably want
> the interface to be compatible to existing sharing APIs on the host side
> at least, to allow the guest's "on-screen" images to be easily imported.
>=20
> There is some potential for a shortcut here as well, giving these
> buffers directly to the host's desktop compositor instead of having an
> application react to updates by copying the data from the area shared
> with the VF to the area shared between the application and the
> compositor -- that would also be a reason to remain close to the
> existing interface.
>=20
> It's not entirely necessary for this interface to be a dma_buf, as long
> as we have a conversion between a file descriptor and a BO.  On the
> other hand, it may be desirable to allow re-exporting it as a dma_buf if
> we want to access it from another device as well.
>=20
> I'm not sure that is a likely use case though, even the horrible
> contraption I'm building here that has a Thunderbolt device send data
> directly to VRAM does not require that, because the guest would process
> the data and then send a different buffer to the host. Still would be
> nice for completeness.
>=20
> The other thing that seems to be looming on the horizon is that dma_buf
> is too limited for VRAM buffers, because once it's imported, it is
> pinned as well, but we'd like to keep it moveable (there was another
> thread on the xe mailing list about that). That might even be more
> important if we have limited BAR space, because then we might not want
> to make the memory accessible through the BAR unless imported by
> something that needs access through the BAR, which we've established the
> main use case doesn't (because it doesn't even need any kind of access).
>=20
> I think passing objects between trust domains should take the form of an
> opaque handle that is not predictable, and refers to an internal data
> structure with the actual parameters (so we pass these internally as
> well, and avoid all the awkwardness of host and guest having different
> world views. It doesn't matter if that path is slow, it should only be
> used rather seldom (at VM start and when the VM changes screen
> resolution).
>=20
> For VM startup, we probably want to provision guest "on-screen" memory
> and semaphores really early -- maybe it makes sense to just give each VF
> a sensible shared mapping like 16 MB (rounded up from 2*1080p*32bit) by
> default, and/or present a ROM with EFI and OpenFirmware drivers -- can
> VFs do that on current hardware?
>=20
> On Tue, Sep 23, 2025 at 05:53:06AM +0000, Kasireddy, Vivek wrote:
>=20
> > IIUC, it is a common practice among GPU drivers including Xe and Amdgpu
> > to never expose VRAM Addresses and instead have BAR addresses as DMA
> > addresses when exporting dmabufs to other devices.
>=20
> Yes, because that is how the other devices access that memory.
>=20
> > The problem here is that the CPU physical (aka BAR Address) is only
> > usable by the CPU.
>=20
> The address you receive from mapping a dma_buf for a particular device
> is not a CPU physical address, even if it is identical on pretty much
> all PC hardware because it is uncommon to configure the root bridge with
> a translation there.
>=20
> On my POWER9 machine, the situation is a bit different: a range in the
> lower 4 GB is reserved for 32-bit BARs, the memory with those physical
> addresses is remapped so it appears after the end of physical RAM from
> the point of view of PCIe devices, and the 32 bit BARs appear at the
> base of the PCIe bus (after the legacy ports).
>=20
> So, as an example (reality is a bit more complex :> ) the memory map
> might look like
>=20
> 0000000000000000..0000001fffffffff    RAM
> 0060000000000000..006001ffffffffff    PCIe domain 1
> 0060020000000000..006003ffffffffff    PCIe domain 2
> ...
>=20
> and the phys_addr_t I get on the CPU refers to this mapping. However, a
> device attached to PCIe domain 1 would see
>=20
> 0000000000000000..000000000000ffff    Legacy I/O in PCIe domain 1
> 0000000000010000..00000000000fffff    Legacy VGA mappings
> 0000000000100000..000000007fffffff    32-bit BARs in PCIe domain 1
> 0000000080000000..00000000ffffffff    RAM (accessible to 32 bit devices)
> 0000000100000000..0000001fffffffff    RAM (requires 64 bit addressing)
> 0000002000000000..000000207fffffff    RAM (CPU physical address 0..2GB)
> 0060000080000000..006001ffffffffff    64-bit BARs in PCIe domain 1
> 0060020000000000..006003ffffffffff    PCIe domain 2
>=20
> This allows 32 bit devices to access other 32 bit devices on the same
> bus, and (some) physical memory, but we need to sacrifice the 1:1
> mapping for host memory. The actual mapping is a bit more complex,
> because 64 bit BARs get mapped into the "32 bit" space to keep them
> accessible for 32 bit cards in the same domain, and this would also be a
> valid reason not to extend the BAR size even if we can.
>=20
> The default 256 MB aperture ends up in the "32 bit" range, so unless the
> BAR is resized and reallocated, the CPU and DMA addresses for the
> aperture *will* differ.
>=20
> So when a DMA buffer is created that ends up in the first 2 GB of RAM,
> the dma_addr_t returned for this device will have 0x2000000000 added to
> it, because that is the address that the device will have to use, and
> DMA buffers for 32 bit devices will be taken from the 2GB..4GB range
> because neither the first 2 GB nor anything beyond 4 GB are accessible
> to this device.
>=20
> If there is a 32 bit BAR at 0x10000000 in domain 1, then the CPU will
> see it at 0x60000010000000, but mapping it from another device in the
> same domain will return a dma_addr_t of 0x10000000 -- because that is
> the address that is routeable in the PCIe fabric, this is the BAR
> address configured into the device so it will actually respond, and the
> TLP will not leave the bus because it is downstream of the root bridge,
> so it does not affect the physical RAM.
>=20
> Actual numbers will be different to handle even more corner cases and I
> don't remember exactly how many zeroes are in each range, but you get
> the idea -- and this is before we've even started creating virtual
> machines with a different view of physical addresses.
Thank you for taking the time to explain in detail how the memory map and
PCI addressing mechanism works.

>=20
> On Tue, Sep 23, 2025 at 06:01:34AM +0000, Kasireddy, Vivek wrote:
>=20
> > - The Xe Graphics driver running inside the Linux VM creates a buffer
> > (Gnome Wayland compositor's framebuffer) in the VF's portion (or share)
> > of the VRAM and this buffer is shared with Qemu. Qemu then requests
> > vfio-pci driver to create a dmabuf associated with this buffer.
>=20
> That's a bit late. What is EFI supposed to do?
If I understand your question correctly, what happens is the Guest VM's
EFI/BIOS Boot/Kernel messages are all displayed via virtio-vga (which is
included by default?) if it is added to the VM. And, the VF's VRAM does not
get used until Gnome/Mutter compositor starts. So, until this point, all
buffers are created from Guest VM's system memory only.

Thanks,
Vivek

>=20
>    Simon
