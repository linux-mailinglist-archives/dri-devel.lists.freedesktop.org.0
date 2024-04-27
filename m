Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37D8B4400
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 05:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340710E7E5;
	Sat, 27 Apr 2024 03:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=analog.com header.i=@analog.com header.b="T9gwJUr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 12261 seconds by postgrey-1.36 at gabe;
 Sat, 27 Apr 2024 03:58:10 UTC
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020710E7E5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 03:58:10 +0000 (UTC)
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QN5vDv013821;
 Fri, 26 Apr 2024 20:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=DKIM;
 bh=7fE/dnfIBTGRCIEUsu1S8Ijc5ZMHBqXO1w1tPXA7YaM=; b=T9gwJUr36JeN
 m33hV+j8s+fnb/Co1WtLayM10g5lddwDtzklvfSfpiaUUm3El+i6ErXS6v8mbe3B
 DaEqfV8JD3FDRE7WGoHmIT6wB1uWtPHIFqFgiobNqsyDi70BLad7zJZU+K7gigEm
 KGqtEFrwhpwqBag3MzEv0+SRluxQKlIL4xJdiDN0qjiWMupl6eBzysNGNhHmkyao
 4cmH8FcA/KhnFF1t6MPyf2rNLPI2pHzRYwsJP96wS6Cto6e+rabKtVevq1jVJn61
 SM4kxqi0LrpyOS4WfNOgM9e3gWlmmzDUWhS7v/Ld5whewy7zzKuPCtl9zpQeOZiS
 VDS1RZf4/w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3xrnn305vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 20:33:44 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLByu2qvpdDy+oHhcLM13BBfu1AVClzOUiW55Jo23+exbzmmEX04J85yL5cEXQ2uiTHI7aoubO3u5PNjb4Rt7k2UuHnXy/EULUigY9FA3zi3rwioRCMRaEXgv0VBRRsfQm38dsb0Sj9SQlBwy3R6IYKW26YKKNrU0dxL58rfFb/CasevPMHKkLnxYH4ysxYR0YGDkvxYexEknEBMMcqxwA6UA9Ue416cOa9gRo6FoVVV9mJY6xJLwxRbeL5/Is4j9EhKLcwNUWsRtGwsdk+zXNM/e4Y2T1KvtsIcrKsVMW8Ef7z4frAP0kQPliXhYU5i9gJvMkM59bobcNxnkgmcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fE/dnfIBTGRCIEUsu1S8Ijc5ZMHBqXO1w1tPXA7YaM=;
 b=jPjOaYpEX98RPf6H15zEc9A+T3rCWXXky51ckaVhXgcOUYlFnWFAbJjakcADisl0ChXR6/CiWBcsXnlwHEL1dAaacrdd81p35pUNeTBk0r9jVeJWJD9D8guC3OslnVZ2z1cbdr6p75DHO/eS+/UW+tN0q+aqooiGXI9bLoYb+LmAEvUFmY2bQAy4s3JdHgbJ5YoHSKdcKiVwO9UCsvZjzLWfOEZtw2PkjhuyfJEEuYJgWLYKkt8gps7aHKXQLobcjCtYCC3Jw3EncXbR2uhUGPOBwomw5M5dLbLUPcca4hltyP/k/PBzEBGal2U/M3D7YHf9GX+OqbSND4H5FQlFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from CO3PR03MB6774.namprd03.prod.outlook.com (2603:10b6:303:178::18)
 by DS7PR03MB5493.namprd03.prod.outlook.com (2603:10b6:5:2cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Sat, 27 Apr
 2024 00:33:42 +0000
Received: from CO3PR03MB6774.namprd03.prod.outlook.com
 ([fe80::45e2:56ea:540e:cd60]) by CO3PR03MB6774.namprd03.prod.outlook.com
 ([fe80::45e2:56ea:540e:cd60%7]) with mapi id 15.20.7472.044; Sat, 27 Apr 2024
 00:33:42 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>
Subject: RE: [PATCH v1 1/1] fbtft: seps525: Don't use "proxy" headers
Thread-Topic: [PATCH v1 1/1] fbtft: seps525: Don't use "proxy" headers
Thread-Index: AQHalaTIKoltAYDNHU+VHVCR2PhfCrF7SVyA
Date: Sat, 27 Apr 2024 00:33:42 +0000
Message-ID: <CO3PR03MB6774B71BE189707726C8E7928E152@CO3PR03MB6774.namprd03.prod.outlook.com>
References: <20240423173623.2748621-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240423173623.2748621-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1jYjBjNTUzZS0wNDJkLTExZWYtYjhjOS1iY2Yx?=
 =?us-ascii?Q?NzFjNDc2MTlcYW1lLXRlc3RcY2IwYzU1NDAtMDQyZC0xMWVmLWI4YzktYmNm?=
 =?us-ascii?Q?MTcxYzQ3NjE5Ym9keS50eHQiIHN6PSIzMTQ2IiB0PSIxMzM1ODY1MTYyMDg3?=
 =?us-ascii?Q?NTc3MTUiIGg9IjkrOTF1QVRJdnlKb2Z5eURNU2pPL0ZKOHdpWT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?RFRxMmVOT3BqYUFhaStUdUowb0JPT3FMNU80blNnRTQ0REFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBdnNHSmtRQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO3PR03MB6774:EE_|DS7PR03MB5493:EE_
x-ms-office365-filtering-correlation-id: 5e412aa5-e1fd-4045-e694-08dc6651b0e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?8AJA1124aIjm1m1Sig1yjt5eS6laUSIjggNcgPTXEwVThKHdDdTjXoA5ZeCz?=
 =?us-ascii?Q?pffw1rQ0+ABBZplU5b7qyOtx9c5iCPUTm5GQ/48bOOi9F3vQboS3tbJKKeIo?=
 =?us-ascii?Q?m+6jfxmZNg13zPxwubFo6l0X5duiVrUUYOBW+8ZtgvRIpIZP6gX6Qq7KyrgQ?=
 =?us-ascii?Q?ga3YrW9T3viTMH2k6I2/U8YTlrY4EcEA3fQQ/Ezlj99JItat1Eo1SsHIEJIX?=
 =?us-ascii?Q?sDusB9HxuUl8Ma172zpoA3zD5kJX/WRpc3T16PudZkAn9WWBxktMFtyCtndt?=
 =?us-ascii?Q?DF/FCYBf8pgsIOsej+uPx0GDT5ahRWM0r2XBZGguH30ermMoaIxH0JUtW485?=
 =?us-ascii?Q?27KBnRN91CKuhznSG0PbMfN2lbuvkoRSph3ZS6Hp2Yr7E8d5LEMwD1FNE3mL?=
 =?us-ascii?Q?UjPQP722rgQUQ/Uz9cRpqhLcUzaFjr7/O1T/CCGxGmYKqrtaVvTks0dxbuK7?=
 =?us-ascii?Q?9khRll2U404UeP5tOWsT/Jy02lrM7RJp5Nyis8R3JNYkskV2l+Mz6dzgqOZ/?=
 =?us-ascii?Q?qARyONKGSqUFUhvMViYSCezQZu4KJfMOgC73gvE4Juf16c+ygtwlxe1vr6Xw?=
 =?us-ascii?Q?azuX/AUHlOQLrtpVbm6N/jFkpVl5yADmSR+fCRA6pyuS9wDe9m1x56Z+jbs/?=
 =?us-ascii?Q?kDRWDcuwLyQehbAj2sZFF8ObNxUw0hNbuXLQS4oBtS7M+k9tSL4mbKCvPoVm?=
 =?us-ascii?Q?ILbY09/VDvh9EsxA+pwXnAJz+SDa+auFmb3K5cvu4fcBDELQo8TfFlrzFJMl?=
 =?us-ascii?Q?gbHc4ZdRL9sO6sVbwJBUBRkZ85Gs1ZF05pYwtmnRtXudle7jdjIr5ImYocjN?=
 =?us-ascii?Q?qaOf7deCXfYCCvc00OHd/0VCr6gNvvC0HO712wDAzhPXKXvEfxTiubEQ6mAN?=
 =?us-ascii?Q?H7CcccdZrWKFpzfIrsgQibg3zQeYUZMJwYX2FOl936DwQ9C2EoXN39QCIvwA?=
 =?us-ascii?Q?oCSRp8krHoaavvNDLShXwxzGXmqBObrHMgH3u+A7pvv9u4ULYm7/BPNN+/AP?=
 =?us-ascii?Q?kkSNYPcNcRPbMH01T6+He4kTOzfCNb1fMUEz+n5tb2TTvHiuTI28e4MZO3Tq?=
 =?us-ascii?Q?7Dotn/+i/mUD7c3DGHEP2RMYt5Pijaw5oAAG6481o8F+f3aVadUsZiDJj5Ht?=
 =?us-ascii?Q?0tHjCn/LeTmG1fJTyApYz2n5vdqeodwTd5LnySYr0sZqGx9TARCL3rbeaqmI?=
 =?us-ascii?Q?YivQe0CE5EM9V8mpa2naQ3cU27nH8EPhElwT3BRv6T/KpBL4knXVD9ikyvjR?=
 =?us-ascii?Q?SSfZUV2ILOLfe2s+Hp5Mq9Z/zkD4uQu0dZ9lN2vMwO7wrcoBRrSw6DRWGAeO?=
 =?us-ascii?Q?ExEgjvEzfyD+PqResKD7X0owmtHgceQtcDJdLC4ZocY2Rw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO3PR03MB6774.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PzSolvi2lxHP5B03I44bjI4VbTjiijgz2mcTBoHU3tJUv5S2u9UdWd9PYaLh?=
 =?us-ascii?Q?P301gPnU6V/V7ZyGsZXb/ghoKb05KRFCnY0nKgtbSimqo+qnbchF6XLoubyR?=
 =?us-ascii?Q?iQPjF93Yl4UlOi6YUOnzj9+ST3MH4yg+6dAoKCIbJzbmmOBFsLoAWtr8pxyt?=
 =?us-ascii?Q?fhStiWVcAtarbmXvbdQyj1a4PDu5SvJaKq+AsdnoorqlencwHeKtDOXjD651?=
 =?us-ascii?Q?JIyTZv9z+ozTfupvgyyotDwP/JDgfzVgKAtL/BSWdDg3/ZTOd72DXTJREivG?=
 =?us-ascii?Q?EQDiz4qVkIXaFsFeo5r9ERQ2mFoOAKs4ec7KugYcmGqjOe6BPK74t10IO45a?=
 =?us-ascii?Q?QpEW5xIc5SLPxjyzktxziwrFc22FHZwKdMTVUvJhMzXpxR69jPjCBNpT3Ntl?=
 =?us-ascii?Q?Soavl7zOOWd+t4Wb6B2jPkyM9ij9X09PAHVY1Alp/7qYfWUQe/8pZHAf9pAb?=
 =?us-ascii?Q?lccpBLO59vY6QXDyi9VhuRXrTc1uhsY938HkCc6LpR9YWUvChPVYNqvOFcQb?=
 =?us-ascii?Q?XQS096WNoCfNV3ujsg+yCUoWJtW+o1YGqAiATGfFCaV6a/2ZGBpimE6AGOdG?=
 =?us-ascii?Q?iaj52pV9TlTZmKHDHkMddMmjIaxRC23oUSF6lmoEmplqsbyMkYJGSz6DyX+5?=
 =?us-ascii?Q?e2KkrCQ/0nfc6rC8PnApTyT4BpE8iF/80VEB+a2BPbLIsHzFKyrGSQqEACy0?=
 =?us-ascii?Q?f4u+8wHwX9yzYObMEm+XGsUR9ZH0NVVGhTt5GDpKTPWMNaWckPvQ524K4Or6?=
 =?us-ascii?Q?bgYDn76fUjmk1dDdvO5lNHnd7lHoVb1dwwdZxJvHdWb7/U/MCycElSByzCIG?=
 =?us-ascii?Q?NQAEPHsFr9sTKNJM0NhHy8F4LDSEdbg8t04BqGZlPgjL+VAj2Zt4V8b+F1CY?=
 =?us-ascii?Q?qFx/kZXLB5aRdYT30h9S+hQAN31kyhJS5jZA+FKhF3eWGhWZA+HPLYs0i0AE?=
 =?us-ascii?Q?SyNMka5psOV0J+eodjH4tfuVjMZb6GeRYAdsLvaXlPZEj+xKYyi9ldVUwEIY?=
 =?us-ascii?Q?QdMWl0D1rsISaNR/mxVD/i97B9O2ezvO1P+1ph0jcleC8fmjijyU5XtgKvqu?=
 =?us-ascii?Q?GaELrZALQd5jgNXC3unGkWKDgCuw6sAwQLR0q2/umfi4oK1O9jEvafmgGqZc?=
 =?us-ascii?Q?t0UGao/Gn20usRNeWAbilV298aba20eqv9+1W7eRfuqfT0QF8dZIuAzHi5bV?=
 =?us-ascii?Q?XQAvo/Kmo/XxjVy5f1umI8+RPJ8KMKQBObjQ7zie4ETtGsytkKpTYfmIjYsw?=
 =?us-ascii?Q?ongM7uBN9Jf9W8tNiEs9+UPnvH4Wh1gs6HIl4XFjgBgyJwTqE3qwEkbkYOQv?=
 =?us-ascii?Q?wOSd/ir29plbIG9S7vrDItxt/A9vDYZooDb2Zr5JrKRMzvgqgG/KjVdAtXvz?=
 =?us-ascii?Q?aE/l3xuFIiolc9xgXKwP71PdaGPu/lxx7ClGeUknROB9yYezSKyU2pb8q8Ed?=
 =?us-ascii?Q?XChahGJ8VIMUWJGfxft0bsiGDLl2eYxWP54K7rqq19m81s7L57gq88Jz1nP4?=
 =?us-ascii?Q?KUFNnYs5FmHLxBIKrSDxpjtBuzT0btFlVQNttoymtBXtDw5GtUvmzJcfCxww?=
 =?us-ascii?Q?lMjH5qDKALjoeVVq92ghnMpK9iNyeTyOQKnHs9e2W08x7+JTPEYOFM/gyYZs?=
 =?us-ascii?Q?Yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO3PR03MB6774.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e412aa5-e1fd-4045-e694-08dc6651b0e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2024 00:33:42.5319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7/dyLV9rkPyoaBGEXWXEYXJgxTOzWhMdhT4SUIEKG0APuupJlmz52weGIwId5ENEAoekoDl6Ov1GLFNS/gQ07PC0g5hW+uTdFIvbis594I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5493
X-Proofpoint-GUID: A-swz2l8OIs3PeX5y_k4r-rwDoARhs05
X-Proofpoint-ORIG-GUID: A-swz2l8OIs3PeX5y_k4r-rwDoARhs05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_20,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404270001
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
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Tuesday, April 23, 2024 1:36 PM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; linux-
> fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org; linux-
> staging@lists.linux.dev; linux-kernel@vger.kernel.org
> Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; Helge Deller <deller@gmx.de>
> Subject: [PATCH v1 1/1] fbtft: seps525: Don't use "proxy" headers
>=20
> Update header inclusions to follow IWYU (Include What You Use) principle.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/staging/fbtft/fb_seps525.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/fbtft/fb_seps525.c
> b/drivers/staging/fbtft/fb_seps525.c
> index 05882e2cde7f..46c257308b49 100644
> --- a/drivers/staging/fbtft/fb_seps525.c
> +++ b/drivers/staging/fbtft/fb_seps525.c
> @@ -16,11 +16,10 @@
>   * GNU General Public License for more details.
>   */
>=20
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/gpio.h>
> +#include <linux/bits.h>
>  #include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
>=20
>  #include "fbtft.h"
>=20
> --
> 2.43.0.rc1.1336.g36b5255a03ac

