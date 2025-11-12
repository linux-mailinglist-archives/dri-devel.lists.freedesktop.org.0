Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5AC50A43
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 06:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD2210E69D;
	Wed, 12 Nov 2025 05:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoEVZP0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DE310E06A;
 Wed, 12 Nov 2025 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762926761; x=1794462761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mzRG8rWm8I0kwFqNYmB8GN+N0cOAK9D0nPo9qeGJmBw=;
 b=BoEVZP0vMaKKslR357TutZQ4JZT3gC+7BbR5QISBLzvJg39dPOgRslVK
 OqJeg9Ygzswj1B1kL1vMM2RazPmtIjhR0uliTVh0btV0V2I2nudUn/at1
 Y3B/ofj+Ut/UIt4obve16jYzK8JrKpqrucQBnAUjakjSk1uJ+Sj6OeA4l
 iOWPdvwXgN5RjGGfYb2xlmMJwoKAvnLjlEoZ0MQn5U6d1UBrMVMliFsO3
 04zVR57xczZzeu+b0uK85i9hQWGxIxL6Oyucd5jAhr8PkaGENbYWmOd7D
 8QiohQso4xm9DOzDnthI7YGga64CF0rHkvczOznHWf1ZT3/8w+aU1rf1g A==;
X-CSE-ConnectionGUID: QIpTtnmLT5+VU/rYXWarvg==
X-CSE-MsgGUID: ztXzGChIQI63+kOwKxrkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64865954"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="64865954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:52:41 -0800
X-CSE-ConnectionGUID: dqQlQeLzTE2yGpYr53YTZg==
X-CSE-MsgGUID: 2/iVUxp3Tk23ANdE7fyKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="219854749"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:52:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:52:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 21:52:39 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:52:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdxSxyFbcMkxWw8ovkCmJTKM2Y/afqF7FPIvjFQ/pQ5KlJOGx61F1rJ9HHqVuBHi71zypMoeV+zo67WiIwEEMgs4HkKc3FNQ5QHhPQdhPoV+Qr3sx8Qh9jbjBcxNONTXn9AbwduxoL3IXlrlTGO4TBOBDB7Mr2QarB8n85pAN2xudbzdvS0mcykqeS0quKf4ggnNBnszsEFw99llmdG3anv9gGXZox+xlQyIm2akRmyYuoOiJFrqGc5j8QDgs4M2kSpk6R8LC0ysAzte6uatb99F2LlrOVN0X/BmwGPLQqC4kegDJnJenFwahmN7Oh3ggDS1KQOSS0V0mGyE8fZUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzRG8rWm8I0kwFqNYmB8GN+N0cOAK9D0nPo9qeGJmBw=;
 b=EhJq/e+fIH5pMHqTy+durifv/Od8Vrv3jL5AVJYMVRNi2UkcDBTE5M5wI5XZorFjwprOSZOJdhKPAQ5Tdfj9XjqW5+Xs6iSB7ry6kOWBaYoqXwb9VosoxgozhUAuv1Imt3nTJT7tk0t5LlMtPsQ1CJ5RdVtv+ujtiwwok7EY4ZrlXng2t4+ztCHvLkVrwo84XUH07+om0fhvJFE046hs2MZTab0hMRqTLqoSGiW+Sk86tqZ36lQy2kRAgnDJcD9NN1oSGVnwCLNgMI6/EYgLS5GBulStecOSblGmVsZMAEYPN/wFJKxv8olirvSLITX8i7gu/BqF57tHPCYPH1SOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5088.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 05:52:38 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:52:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 05/10] drm/i915/alpm: Auxless wake time calculation for
 Xe3p
Thread-Topic: [PATCH v3 05/10] drm/i915/alpm: Auxless wake time calculation
 for Xe3p
Thread-Index: AQHcUwylHhVEb9B0AEWy+GowH8gsw7TuisLQ
Date: Wed, 12 Nov 2025 05:52:37 +0000
Message-ID: <DM3PPF208195D8D6A30F5E8D8D545F6B678E3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-6-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-6-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: f668874a-d24c-4ab9-0e2a-08de21afaf6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MFlCS2FxQWVkb3VjYkIyNk9CVm1MbEh2ZnFSQVNZLzU1MjEvMkhBQzlzTmtr?=
 =?utf-8?B?eTQ4NjgxVkMxRDRIdlpKWm4wN1ovZmVyb3RiR0J0SWRndms2cG0rUDBJbm9E?=
 =?utf-8?B?RnBZREdqOVp5WWRWYnlnNUxDYkROYXVnejR4ZmFNLzVac0dGVmhYV0xMZ0Zt?=
 =?utf-8?B?REpydnFnOHBpYmliMGxFeVpGc0RRVUI4eUZ3TjNsVmxGSkxBYzRVcHY2b3Fk?=
 =?utf-8?B?dVlnK09oYXJ5bU5BNmV4Y0lqdTVEVUsrNTI5clJiS2t6Q3BaRTQrSnEvUVdQ?=
 =?utf-8?B?SnRMUmxET21zdHYwSUtNVFQ3bldUQnJ3YURuRjUvYnd4VlZDYXhMZ3RxcEsz?=
 =?utf-8?B?WUZNVS9BTWNVVkJJWWhkSzUyMlBhVzF3VFFZc3hGdUpyakc5N2pzZkk4MHAy?=
 =?utf-8?B?YVVkQkZmSFljb0FlQVBSS2lCdi9scTF1TWd0Ukc0di9TVSt6dWc4dStOTmxn?=
 =?utf-8?B?Q1VSWDhhYjZEdVo2YW1ObGczNkRQaE9XQkhYY0VxcVB3M2t3enlPN2t6bmNt?=
 =?utf-8?B?ZS9ReVJ5SHlqK1pWZWV1eFZDQW1ZeEV2dC93dlQxZ2cwdGhOTkJEdmlzcUkx?=
 =?utf-8?B?YWdZWWY5ZlFId2U0WDFhRjA3SXBYY0FvZVl6VUNBUGgzMDJPdytCT1NNalJo?=
 =?utf-8?B?YXV6WFp5SENmRDhjRTYyajNRRXRrUStLbm5RdFJvMTc0OFZRT0VtOUlCYUN4?=
 =?utf-8?B?Mm5ZZ05VNG5wU3dFSWtOeW1zNlpOVEZKNVl3cE1OVkEzZ09La3ZLcXJFNWtG?=
 =?utf-8?B?STZXRGRuQU1WUnB4RE5YS0JvbEp1OUxoNEdXMitYMU9STTRQS1ZDVUQ4Z1dt?=
 =?utf-8?B?VXh3dXpHT3Zmc25IRWpldkYvK0ZDajI4V3lsZmtuenpNYzBzTWdxbmoyb3Vl?=
 =?utf-8?B?MGFHdkQ5bWhhOXhWeS9TMUhFR3hRUVlNUS95RjBpcnFqMldTY2xkWEFldXZM?=
 =?utf-8?B?cks4TG1GVEkxRmVtWmVFQXFQd1VLcWVsZTEzbnRaMXhYMXFQUGhublJnZVhp?=
 =?utf-8?B?VTYrWi9kL2t6ZHlzdFhQNjhMcHlEUE5zOW9jY0dZeXdNcjBXZ2Z2aDBOSFho?=
 =?utf-8?B?MXZrZEFuN2dlQ2NscVU4eHRPQldFT0cyUDBjVnpPaXd4V0xsQlFXWG1NMUwr?=
 =?utf-8?B?dVBEbklhK2xrZ1d5aTkwZWRWVk40eDFhK1dFTDNzalZUQkJTK0g1Tk1iU0Fj?=
 =?utf-8?B?eFpQN0J6WjNXL2xJc2pIWWE5R2h1VytzVkhpRXFhVHBGRzhtYkg3KytaU3pG?=
 =?utf-8?B?ZWUxdUYwRGJDL3ZLRlQ3NTFrYnBURXdUV2ttdE03NDVlSUtVSk5sQmtuUnhj?=
 =?utf-8?B?aWVrL2wrK3RzWXEvV2tqdGI4NnoxYlE5aHZyRjRSU0paMnZSV2ZQcXkzQmI2?=
 =?utf-8?B?dC8xblU2QW1yTjB4Q2ZqMjdBcGgrbEtrYmNrT3FJSkhYNWg1WjJEY0hmRG9Y?=
 =?utf-8?B?eUJHcEdLWE9QMHF0VXpxclQ0YnlrVzNkVDNaNWw5eTg3QjFRZEJoYjZ4Z0xj?=
 =?utf-8?B?SlZvc004N2ZPQzRMbk9seXI2RVJxM2oyYzNaM25GZGpUOGF5VjNGQnVIcXlY?=
 =?utf-8?B?bnRPT0IzQnNVNHRPTzdaaWVaYUtzRW8zVU9WWk1lRjlBcnFZbEhjVW9EbS9K?=
 =?utf-8?B?MEJQVmJ6OEFFaHdKMEFMVDF2cktLNElUUXE2MkwxajJ2MDJ4OTE5MHN5dXNC?=
 =?utf-8?B?VnEwaUdHRDBxd09teENDN1FzenBCRjhaQjNZUS80dnVnNWkrZ2d4QW1ZU0Z5?=
 =?utf-8?B?OG1lcmdJZE5PSGtBczQra2VzamxPTEJ0ajJPNnhGeURsNlJrNVpCNlB3UnlT?=
 =?utf-8?B?dUpjcXZIOWUzcmdPdkZ5ZFZpWm12N1ZZdEYvbHRzQTViWkEzWGZMR254NG9v?=
 =?utf-8?B?cVBvRzE1L2pTbUFpZHdpcHJ3eXJHd3lJeTFzT2NURWRXQ1B3dmRlbmtWR2Vh?=
 =?utf-8?B?eWFuN3BSeDVtVGhIVnU5NWhWekRGRjk3VWMwK2s1QkV5U1dXRWl6K2tMc0Vs?=
 =?utf-8?B?RTRjY2VzcXVEemEvc1V4bWF0a0psQkpod0R1TlozNHlFckJtVEM0RU9pQko1?=
 =?utf-8?Q?aLsN+7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2NIMHo3aHh4Mk5pNWxucnFXUEtQM1d1N2VaMWZHbFBVZjk0SkFJUFpRQ3Zu?=
 =?utf-8?B?K3pvTUFQaThPM2E3VXo2bk82UDNEd3h4MGRnNW5rT0RhdHI5NGFYZm5MeEhn?=
 =?utf-8?B?N2RtVWFvVzMrUURaeHJBTVVYOUN0RDFnUk5zK3hWdEVBclZyV0ovMVNsOENw?=
 =?utf-8?B?MDhYaTVzZ3ljSXlJYy95SW5kQWlVbzZuMGZkdGZkaGpjS0dsQVhwRUN2TEQx?=
 =?utf-8?B?WEpFcmRxbXcyaGVNU0JFcEh4S3Y3clZHSnJtSy9JZU9oenl2TGxkYnRGd2Ur?=
 =?utf-8?B?MC9NRCtkUW41RklzYXNHSWR1SWNOaGluSkZ0Y0VsRlZnazlDbHlLQ2hjam1U?=
 =?utf-8?B?RkV5WkR5QWF3bEZCYWVNL2ZFaGJidVJNK2s5T1MwRUt1bmV4RitiN1lqNDZD?=
 =?utf-8?B?RlpkQ3NzOFlJUGJScllUa09xS2wxbGFOcjczUStaUTl4NGYxSllxeitzdUll?=
 =?utf-8?B?VUVhcURycDd2R3ovSzRLL05sK044WElMRmNGQWY2VEZIdWx2eDdrNEtlVXZL?=
 =?utf-8?B?Wm8vYXNUaHFlNVZVSk1aYkJYbFZTZVJYbkUwOC9ueWs5ZXlUajhSdWhOK1k2?=
 =?utf-8?B?MTNBRXB4T3JSVUE3SFFRN0lqaGE3dXZlL3FraG1KaWFWS1dOOWpZUEpmS2s4?=
 =?utf-8?B?Vm4wNHJIdVk5Q3NlMEhDSnNPc3B0YW5VZ1BaS1ZoQ0FJNEhxSlBHT0RqNjVw?=
 =?utf-8?B?b1F3N0VmRTBSNGsxeE5PREFWOU1OWFVoQnhlVkd5U2tVRDZMaVY3UHRyMVJ1?=
 =?utf-8?B?UzhhcmpLQU9aV1RIS2lPTFJZaGxSWFlxOTE3ai9kUGhpSFFaRkdYck45V3Q1?=
 =?utf-8?B?b1dodi9rdXEwWVlzNXh2UWxTNjVGcWVTaGtKdHREZ1JxWlBGendLUDNkdXFx?=
 =?utf-8?B?QWxwcGZQWlFJc2piMUZGa29HTEdoRWRwWS9LRnZqa1RTa2dhb3AvbXpaUGZY?=
 =?utf-8?B?QzJOYTdZNWh4QXFRM2Q5alM4VG1YMWd2TTV5TGR0YzRlanArSkNISHdIU0Vw?=
 =?utf-8?B?VGdFdFR5dURJTWZTdXpidmdQaGx5Q2dSTUlFU3gvUnVMYUxhYVpmeWI4N2Jx?=
 =?utf-8?B?S05Fd1NsWUhUYUMzNGkzQ2RiNGRBNHNtQ1BUenRObi90Y2ltbDFodkRGVEFB?=
 =?utf-8?B?UFdJWENKdmFyNDljVDRPUTVFWUdyQ3ZjU1RsaHBLWStsMWF6QnRpZi9OeFZW?=
 =?utf-8?B?Wi85ZkkzRElBTG9iQ3ZQNllJKzNwMkUyZkJmK0MvNUFWSjNqeHc2eFpDWmQ4?=
 =?utf-8?B?QTlxNnFudWZKbmY4SFRGZkpQRmRSdkxqNFdKdWIwcE9BT3psYVdzQ1E2YWM5?=
 =?utf-8?B?bHdJV0ZJd2MyQTdiUDVIS3M2SjVXVjFuL2NjakJSczdQZEJtejZCYUp1bVo3?=
 =?utf-8?B?T3c4c0I4OE5BWW9RZnFOQ3FZOEZHbjVJc2VPVVJ1V1JneFFRUUtPVkZWNDVR?=
 =?utf-8?B?bWoveUxCS0VpSTUyU3RHNnUyQzl1LzN0UjRwNlpKWUdncEtRcDJKNlh0RmVM?=
 =?utf-8?B?S1ZneHc2Nm55aDRFVGlNZmIyU0R0MERZQ0FhaVU0dVMzNjVhYkJzRXZSVllr?=
 =?utf-8?B?RW1Ra1U0K0VDMkNvNGhrazFKMGdTTnJwRHNvYmhwVUN2OGxMdElyY2VPT3E0?=
 =?utf-8?B?SmVxOWRLekFwdERvVHFhSFg1OWRnZWZ4OVlCWTVDb0FET0RDR2ZoYXFTNTlK?=
 =?utf-8?B?OWJVb00xTDEySnBaakpzckp0c1ZjTGlhckMrZlJydVR3dnpKWjU0by9lcmlO?=
 =?utf-8?B?M2ZDZVV6QS9RZmgxNU5ocWcrOVVjaldROForY0FSSm5uNWRqMW1yWFY4WXps?=
 =?utf-8?B?eFA2a2tvZG9sbVVFVUk5UGNVZmRzeGYvZnJxcEpnR21kWTBMbDRWaFdDbEU3?=
 =?utf-8?B?T2poK3g4YTFhZUMwd0duSDRsRE94NTZNVTBuTHhLMXR4QnN1WHNaQWtSUWtl?=
 =?utf-8?B?dDVRRjFGWTEwNTZvMXVlc245T2lYdjNWWTJkek9ydDdiaUNmSjdodnk4YmZl?=
 =?utf-8?B?d2JzM2gyTWFqd3hBc01yRGsvLy9NNGNySXJlTXMzQVFMVi9hcmxDWmQwcFRX?=
 =?utf-8?B?ZC9oT1FxeW5OZWNkcnlMTjdZQ1B2OG9lcTVJR1pWdWNOdEsyU1N5RGtOZGJu?=
 =?utf-8?Q?8ZCJZS6SUOtnYpliNveQa8HwT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f668874a-d24c-4ab9-0e2a-08de21afaf6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 05:52:37.9066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ld8Ugcy8tIeTWgrCKB8FZu552Ghc8pt978+REpyqY9L6ykUfQqwLSK+4P9qXTGh05411Py4rLkIg0UCiHsqlsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDUvMTBdIGRybS9pOTE1L2FscG06IEF1eGxlc3Mgd2FrZSB0
aW1lIGNhbGN1bGF0aW9uIGZvcg0KPiBYZTNwDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3IgYXV4bGVz
cyB3YWtldGltZSBjYWxjdWxhdGlvbiBmb3IgRFAyLjEgQUxQTSBhcyBkZXBlbmRlbnQNCj4gcGFy
YW1ldGVyIGdvdCBjaGFuZ2VkLg0KPiANCj4gdjE6IEluaXRpYWwgdmVyc2lvbi4NCj4gdjI6IFVz
ZSBpbnRlbF9kcF9pc191aGJyKCkuIFtKYW5pXQ0KPiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5h
IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDYzICsrKysrKysrKysrKysrKysrKystLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCBiNGI4
NzRkZDM3MjUuLjgxNDcyMjU0YWI3MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTEwMCwyMyArMTAwLDY0IEBAIHN0YXRpYyBpbnQgZ2V0
X2xmcHNfaGFsZl9jeWNsZV9jbG9ja3MoY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUpDQo+IA0KPiAgc3RhdGljIGludCBnZXRfdHBoeTJfcDJfdG9fcDAoY29uc3Qg
c3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpICB7DQo+IC0JcmV0dXJuIDEyICog
MTAwMDsNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3Bs
YXkoY3J0Y19zdGF0ZSk7DQo+ICsNCj4gKwlyZXR1cm4gRElTUExBWV9WRVIoZGlzcGxheSkgPj0g
MzUgPyAoNDAgKiAxMDAwKSA6ICgxMiAqIDEwMDApOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQg
Z2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpj
cnRjX3N0YXRlKQ0KPiArc3RhdGljIGludCBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2Qoc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCwNCj4gKwkJCQkgICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNf
c3RhdGUgKmNydGNfc3RhdGUpDQo+ICB7DQo+ICAJaW50IHQxID0gNTAgKiAxMDAwOw0KPiAtCWlu
dCB0cHM0ID0gMjUyOw0KPiArCWludCB0cHM0ID0gaW50ZWxfZHBfaXNfdWhicihjcnRjX3N0YXRl
KSA/ICgzOTYgKiAzMikgOiAoMjUyICogMTApOw0KPiAgCS8qIHBvcnRfY2xvY2sgaXMgbGluayBy
YXRlIGluIDEwa2JpdC9zIHVuaXRzICovDQo+IC0JaW50IHRtbF9waHlfbG9jayA9IDEwMDAgKiAx
MDAwICogdHBzNCAvIGNydGNfc3RhdGUtPnBvcnRfY2xvY2s7DQo+ICsJaW50IHRtbF9waHlfbG9j
ayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIGNydGNfc3RhdGUtPnBvcnRfY2xvY2sgLyAxMDsNCj4g
KwlpbnQgbHR0cHJfY291bnQgPSAwOw0KPiAgCWludCB0Y2RzLCBlc3RhYmxpc2htZW50X3Blcmlv
ZDsNCj4gDQo+IC0JdGNkcyA9ICg3ICsgRElWX1JPVU5EX1VQKDY1MDAsIHRtbF9waHlfbG9jaykg
KyAxKSAqIHRtbF9waHlfbG9jazsNCj4gLQllc3RhYmxpc2htZW50X3BlcmlvZCA9IChTSUxFTkNF
X1BFUklPRF9USU1FICsgdDEgKyB0Y2RzKTsNCj4gKwlpZiAoaW50ZWxfY3J0Y19oYXNfdHlwZShj
cnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfRURQKSkgew0KPiArCQl0Y2RzID0gKDcgKyBESVZfUk9V
TkRfVVAoNjUwMCwgdG1sX3BoeV9sb2NrKSArIDEpICoNCj4gdG1sX3BoeV9sb2NrOw0KPiArCX0g
ZWxzZSB7DQo+ICsJCXRjZHMgPSA3ICogdG1sX3BoeV9sb2NrOw0KPiArCQlsdHRwcl9jb3VudCA9
IGRybV9kcF9sdHRwcl9jb3VudChpbnRlbF9kcC0NCj4gPmx0dHByX2NvbW1vbl9jYXBzKTsNCj4g
Kwl9DQo+ICsNCj4gKwlpZiAobHR0cHJfY291bnQpIHsNCj4gKwkJaW50IHRsdyA9IDEzMDAwOw0K
PiArCQlpbnQgdGNzID0gMTAwMDA7DQo+ICsJCWludCB0bGZwc19wZXJpb2QgPSBnZXRfbGZwc19j
eWNsZV90aW1lKGNydGNfc3RhdGUpOw0KPiArCQlpbnQgdGRjcyA9IChTSUxFTkNFX1BFUklPRF9U
SU1FICsgdDEgKyB0Y3MgKw0KPiArCQkJICAgIChsdHRwcl9jb3VudCAtIDEpICogKHRsdyArIHRs
ZnBzX3BlcmlvZCkpOw0KPiArCQlpbnQgdGFjZHMgPSA3MDAwMDsNCj4gKwkJaW50IHRkcyA9IChs
dHRwcl9jb3VudCAtIDEpICogNyAqIHRtbF9waHlfbG9jazsNCj4gKw0KPiArCQkvKiB0ZHJsIGlz
IHNhbWUgYXMgdGNkcyovDQo+ICsJCWVzdGFibGlzaG1lbnRfcGVyaW9kID0gdGx3ICsgdGxmcHNf
cGVyaW9kICsgdGRjcyArIHRhY2RzICsNCj4gdGRzICsgdGNkczsNCj4gKwl9IGVsc2Ugew0KPiAr
CQkvKiBUT0RPOiBBZGQgYSBjaGVjayBmb3IgZGF0YSByZWFsaWduIGJ5IERQQ0QgMHgxMTZbM10g
Ki8NCj4gKw0KPiArCQllc3RhYmxpc2htZW50X3BlcmlvZCA9IChTSUxFTkNFX1BFUklPRF9USU1F
ICsgdDEgKyB0Y2RzKTsNCj4gKwl9DQo+IA0KPiAgCXJldHVybiBlc3RhYmxpc2htZW50X3Blcmlv
ZDsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IGdldF9zd2l0Y2hfdG9fYWN0aXZlKGNvbnN0IHN0
cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICsqY3J0Y19zdGF0ZSkgew0KPiArCWludCBwb3J0X2Ns
b2NrID0gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jazsNCj4gKwlpbnQgc3dpdGNoX3RvX2FjdGl2ZTsN
Cj4gKw0KPiArCWlmIChpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpKSB7DQo+ICsJCWludCBz
eW1ib2xfY2xvY2sgPSBwb3J0X2Nsb2NrIC8NCj4gK2ludGVsX2RwX2xpbmtfc3ltYm9sX3NpemUo
cG9ydF9jbG9jayk7DQo+ICsNCj4gKwkJc3dpdGNoX3RvX2FjdGl2ZSA9IDMyICogRElWX1JPVU5E
X1VQKCgzOTYgKyAzICsgNjQpLA0KPiBzeW1ib2xfY2xvY2spOw0KPiArCX0gZWxzZSB7DQo+ICsJ
CXN3aXRjaF90b19hY3RpdmUgPSAwOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiBzd2l0Y2hfdG9f
YWN0aXZlOw0KPiArfQ0KPiArDQo+ICAvKg0KPiAgICogQVVYLUxlc3MgV2FrZSBUaW1lID0gQ0VJ
TElORyggKChQSFkgUDIgdG8gUDApICsgdExGUFNfUGVyaW9kLCBNYXgrDQo+ICAgKiB0U2lsZW5j
ZSwgTWF4KyB0UEhZIEVzdGFibGlzaG1lbnQgKyB0Q0RTKSAvIHRsaW5lKSBAQCAtMTM2LDEzICsx
NzcsMTUNCj4gQEAgc3RhdGljIGludCBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2QoY29uc3Qgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+ICAgKiB0TUxfUEhZX0xPQ0sg
PSBUUFM0IExlbmd0aCAqICggMTAgLyAoTGluayBSYXRlIGluIE1IeikgKQ0KPiAgICogVFBTNCBM
ZW5ndGggPSAyNTIgU3ltYm9scw0KPiAgICovDQo+IC1zdGF0aWMgaW50IF9sbmxfY29tcHV0ZV9h
dXhfbGVzc193YWtlX3RpbWUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNf
c3RhdGUpDQo+ICtzdGF0aWMgaW50IF9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUoc3Ry
dWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gKwkJCQkJICAgY29uc3Qgc3RydWN0IGludGVsX2Ny
dGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+ICB7DQo+ICAJaW50IHRwaHkyX3AyX3RvX3AwID0g
Z2V0X3RwaHkyX3AyX3RvX3AwKGNydGNfc3RhdGUpOw0KPiAtCWludCBlc3RhYmxpc2htZW50X3Bl
cmlvZCA9IGdldF9lc3RhYmxpc2htZW50X3BlcmlvZChjcnRjX3N0YXRlKTsNCj4gKwlpbnQgZXN0
YWJsaXNobWVudF9wZXJpb2QgPSBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2QoaW50ZWxfZHAsDQo+
IGNydGNfc3RhdGUpOw0KPiArCWludCBzd2l0Y2hfdG9fYWN0aXZlID0gZ2V0X3N3aXRjaF90b19h
Y3RpdmUoY3J0Y19zdGF0ZSk7DQo+IA0KPiAgCXJldHVybiBESVZfUk9VTkRfVVAodHBoeTJfcDJf
dG9fcDAgKw0KPiBnZXRfbGZwc19jeWNsZV90aW1lKGNydGNfc3RhdGUpICsNCj4gLQkJCSAgICBl
c3RhYmxpc2htZW50X3BlcmlvZCwgMTAwMCk7DQo+ICsJCQkgICAgZXN0YWJsaXNobWVudF9wZXJp
b2QgKyBzd2l0Y2hfdG9fYWN0aXZlLCAxMDAwKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50DQo+
IEBAIC0xNTQsNyArMTk3LDcgQEAgX2xubF9jb21wdXRlX2F1eF9sZXNzX2FscG1fcGFyYW1zKHN0
cnVjdA0KPiBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICAJCWxmcHNfaGFsZl9jeWNsZTsNCj4gDQo+
ICAJYXV4X2xlc3Nfd2FrZV90aW1lID0NCj4gLQkJX2xubF9jb21wdXRlX2F1eF9sZXNzX3dha2Vf
dGltZShjcnRjX3N0YXRlKTsNCj4gKwkJX2xubF9jb21wdXRlX2F1eF9sZXNzX3dha2VfdGltZShp
bnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQoNCk5vIHJlYWwgbmVlZCB0byBwYXNzIHRoZSB3aG9sZSBp
bnRlbF9kcCBoZXJlIGFsbCB5b3UgbmVlZCBpcyBsdHRwcl9jb21tb25fY2FwcyBwYXNzIGp1c3Qg
dGhhdA0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICAJYXV4X2xlc3Nfd2FrZV9saW5l
cyA9IGludGVsX3VzZWNzX3RvX3NjYW5saW5lcygmY3J0Y19zdGF0ZS0NCj4gPmh3LmFkanVzdGVk
X21vZGUsDQo+ICAJCQkJCQkgICAgICAgYXV4X2xlc3Nfd2FrZV90aW1lKTsNCj4gIAlzaWxlbmNl
X3BlcmlvZCA9IGdldF9zaWxlbmNlX3BlcmlvZF9zeW1ib2xzKGNydGNfc3RhdGUpOw0KPiAtLQ0K
PiAyLjI5LjANCg0K
