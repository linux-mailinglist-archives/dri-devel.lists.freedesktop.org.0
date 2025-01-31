Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CDA23FF3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FDD10E374;
	Fri, 31 Jan 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="jQuECRaq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="elixgdlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A023610E376
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF56W0028214;
 Fri, 31 Jan 2025 15:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=FeQuJktGbolO6dSkTnc8NDkHx
 lBsl0FwpxpCtpoh66o=; b=jQuECRaqmCqX6bk6Zfm1KVpqDG7O6LDbDbljOZPCs
 BC+fbuAcgVrVxF0hQQwVyUZ8W5+axeCvMD3wkaFBPr+E/xAYtRGn47erYxIwsk6t
 d0tgKgzk+7fyVNi5TrjlcBC4flwWRreJxSVgAFmmtPDGVRPoLhesOFQFa61mbk8Q
 xLomGEaSJlF3Fbn8VCXTphwCK5mu+uSmbxtWR0OhcWrgdp6nFo1riN0r/VL7Rz9H
 IN3pOVhvKsDzICTZa/UjJUwewKej5XS3burMa8RUkDUYmJlvcK0gHVidQln6mBKo
 xowlEHaUWs8NJPqXobARwC5oOaINgGnVdI3qo4i6HV/HQ==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011029.outbound.protection.outlook.com [40.93.67.29])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44ep3c302s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY4q+xg3k8Up2VzYs37Kt4Tieh3rKdYgifV+EJJD2CvPKwUKnWX6XYEFRbLcosJMmRenaYO3dYxxgDH3n8xdQZP+kJMRemD+IV1KsJaaCvcU7++JldZ2qEUqP7t/7EJ1QiKYD+3J4ugAHXbxL8TgwacmkBGlhC9bwvoQKKMDhNBiIF7E+Q/vLKS5nNYcisCixSUHaLdVzWDO8huX7WEHCD2Z6vtNl/sq2S+jw5UcPeP0RU03bDu5j6ZcPgjtXwjbZjsxHLy9EFiZZOjq4NiKxET+ZIWh6r+k9yLl2cvfmrvv2EDpcYfqnvfW9RaEV7po3ZdvWZz1IcadBYbjBsbxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeQuJktGbolO6dSkTnc8NDkHxlBsl0FwpxpCtpoh66o=;
 b=UyrEmJypSQ/vYKWTqZGrAY5X8N508AGjneBaKY9x97bAANDEK6bbn7fb2N9TuuUdiQrdgLHv06TFTySCgq+KB4ah4I+uNNtI6MbQCvl0hjaInwR0lgc966Rh+XU2nvtr6KHa6KeXGmxb3MdZuO6rLAvINLHnn66HtRF6PkcOy8jANXd9o97oTt53DK/rhVGdD/2b4Fq0B7q6wPWJEn4m4ZHrz1rO0qcnKnApHQYGIsPMKWCPjHLw4eYMJCNS/xP64Z1MmA2TFJx8uCC+kGpLvqovKw/OMR98W6JR63lNy0CAiTkLKblmlwYSOM0ec7soUqjBqbOAwFBEEWnMW3RnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeQuJktGbolO6dSkTnc8NDkHxlBsl0FwpxpCtpoh66o=;
 b=elixgdlCe0JjKOlGrkywIzDYVcqnLZ1uV7paREcfyDOuikirta453jP2XFzBdxM8enpYudLSn8Xy2YUXLjORJM04m+3+MzCMQ2T33K8n4hsk7Tnso0AtVa6QleJafpSaCcC4mMaX/hFeV+ZSfLCmoN4BpGSUaZLOkOFJxwjG6LA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:18 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:18 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jszhang@kernel.org"
 <jszhang@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 00/18] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Thread-Topic: [PATCH v4 00/18] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Thread-Index: AQHbc/ZKrCzvlwQrNEav83Jv2KY+wA==
Date: Fri, 31 Jan 2025 15:39:17 +0000
Message-ID: <ed7a463e-9654-41c3-91f6-f3f877fd9a20@imgtec.com>
References: <CGME20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: a5668a97-aed4-45f9-a119-08dd420d6c81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?MmxsUGc5c1lFaUMvSXVWMDIzZWJZakJWY21uWmU0VzF2SGUybTM1MUpWbTVH?=
 =?utf-8?B?YVRMVWM4Y09VeGN3cXNBcUx4VGFuekdNQ3h2MU9mNWIyemd1cEVGemljSE5l?=
 =?utf-8?B?Qkg3QzRVZW9kcmErUHFHT0RTRnJVY1VieEFDb0tYRGowdUxLL3hLdDdKdWhP?=
 =?utf-8?B?RUR0Q0lsWXpUNXF6a20rMkI3RUZGN3o3MFdSbkc2V0hXODh4SC9kSWdQcVlE?=
 =?utf-8?B?emM1WlpaaUEzUUdHMW9hQ1JUdjUxT045Z0pqQzZrZUJtWU54N3ZlSjc1VE5W?=
 =?utf-8?B?cEFZZFJ4Uk5kQXdMc1FBQU1rNWc0QnVRNmozSVE0WjllWWZyZDJBaEVwbmZV?=
 =?utf-8?B?eVpKVThxMkdlRTgyWTZJTFIvblhFZjkySzRrQXJnSmx3ODVVeGRkNmhDRkNq?=
 =?utf-8?B?empoR0hiak1DMWJ6dWZKYmp1K05tK1VMUU0xa2wzOUdIM0xSZ2NWVUZWaFJw?=
 =?utf-8?B?V1R4VTlvSkgycWFPTnE2czhUR3RIUiszeW9oZkhmZnJtK2NyVWRzUkpMVzRn?=
 =?utf-8?B?QWZsTjViVno4QXIrOHFaT1VUdEtpSmg1VWdlamZYS083QnZHSWsrMjRHYmY1?=
 =?utf-8?B?bnl4MTZIWlMrZDBxU0FrbDE0eXZqOSsyckpmY2lJbHFXem1YMXM0eVpFUzlm?=
 =?utf-8?B?Q1p2a2ErMDc1b2l2K1FtTWRWVDdnV2EzUVJ4V2FtbDZkTDU0UXRqQVlhUGJm?=
 =?utf-8?B?S0xQK1BobURpRTM2K2NTK25HU3BYV1hBSGUzc3I4WDRmaWlWRmtLTWl0VjZq?=
 =?utf-8?B?RVBUM2NMMHVTakorb1VqY3kvZVI0NllMYUxJMmNUS2JpNTBzcWFwaUtSZWVS?=
 =?utf-8?B?eG9Dak1iNnV1WmxzaDRzczlWMFpQc0U4RTdJRlN5Y2V6N0JOSTZESVlMQzRw?=
 =?utf-8?B?ekM3M0tCNXFzdkFlSG11VFJGWGtUY0VONkkzVlptQWcwelRkckUwM0UzMGhv?=
 =?utf-8?B?Q2dJVytSeHM1ajM5Sm9qanhmKzVZWUt5d3hTT3BsMlg4S3Vvc3V0Ync0d3Q3?=
 =?utf-8?B?akdhM2pNQTc1dlRxWmgxbTJrVERkQmZFRVEyS3I3eUZrWmRqRjRpanA3R3Bt?=
 =?utf-8?B?ODVCR3l6OHNZaUhqbkl6UWlxQlMzYU9UclZrUFZ3NWJZb2lNcUIxWFIzQm5C?=
 =?utf-8?B?YU4zUHZNTkx4cjhGS2tWbXJSTDVicTljcWdVTGw3cHNOOWFVRk5TMnFiOWNj?=
 =?utf-8?B?eFhpOVV0b3AvRFBHVTJiTTdCcy83aFp6ZDdBcmYxNXY0UVdJUmViTHFvdVY3?=
 =?utf-8?B?M2J6YmdqM1pudlRURmZKa2xFV1AvMUNRR0NNcklPNmFsWGpLSDhuRElETFRU?=
 =?utf-8?B?Z1dSNTdZNndYUUNFRXRIV1BrRllTaXZzZDhocllqSW9MTVJQYWI2dmRaVGJ0?=
 =?utf-8?B?QlZrb0JRUkhheThTNkVRWlVYb0I3aTdSK0VhUEZSZGdvMWxheFNPbzlTQ3NL?=
 =?utf-8?B?a0xadTZtTnlUUHlMRzFIamU1RGdVaUdWZGk2K1hjQXRlNWk5d20wTmFzTVY0?=
 =?utf-8?B?VUpSV1oveTZBUUloWWNnWHUxdm5VcDBDcFVSc1dZQ2NNUGNqNk1LMDJKbU90?=
 =?utf-8?B?NUlRK2xaWlBuOVMxenBPZjhYbTE5TkFBb0hDWmowSnVVTTJEZS9Ed3hnQ2JQ?=
 =?utf-8?B?dlFWTFo0NjcyV3dZU0lFaTJ5cy85dTBGR2wxekxwSVRjK05FWTM0dHJZVitE?=
 =?utf-8?B?ZE5RZXZzaWV3b3hJUEFaSDJoMDBSU0FxOW5qb09BYTlsTDBPUDBGd1RVa1BC?=
 =?utf-8?B?ZWZhNXNvNTQwdHYxTEkxdnhkVVJDWmZ5eU9mRGlSZVA0YjN0REFWYmMrbkFz?=
 =?utf-8?B?UmNydTJqZ3FObXN0RkhSd0xuYnhzcGZ6TUE3T0MvY1V2eTJpU3BpQkZzbU1v?=
 =?utf-8?B?a2U3dEY2Y1Myb0d0K2pqNXp0TWcra1RoaFd6Mlk3Z2VpOUJnd2QwaWhJdXAz?=
 =?utf-8?Q?b0BUghLm2sw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVZBZVdHSnJSS3grZnpjZlp3Vm9BODM4dXpYNHovVjA4a2s4SkNaZ1VSSHZX?=
 =?utf-8?B?Uk5kSjYwalpzSHJLMGRhMlNZamtabHpFMi9WV2h3SUNQSFdqdVY2NWNqMy9S?=
 =?utf-8?B?UWw0cFFmSlZIZzl3MzRUUEFFcTVOdlUwU1VWdWdyVkdPWmFHemJuU2F1Rlpm?=
 =?utf-8?B?VjM5NEJub3pSSzlmUWNwTll5V2FRS1lXNkJrZVB5V2Z0YTBlODliU3N2ejZC?=
 =?utf-8?B?RlR6MG1HYWs4YTVReUpNbHBqLy9PZ254VHlJMWd4emdlQXE2cytQZTlqNG5G?=
 =?utf-8?B?Mk1DQ001NHhCQjJJQnY0Rm9IdS9IVWxRU2Iva2lYU3pSVkd2WGFCZFA2blZx?=
 =?utf-8?B?MlRIMW5aMVQ5eXY5Q1MzSHN5elpUanJOYll5dnZRVHNiNHZIa2x1aFRvVWha?=
 =?utf-8?B?VTkxaWhRcjJ3bDZHc1VvNnlUTXVtelhrTUpEb0JSUkNwR2tMNDBRKzF2aGtQ?=
 =?utf-8?B?UnRaMEpsZElteFRaRnN2ZDcwYzNHMWZCOGhDWTVIUlBqMmJhcGhWSzlSbDJs?=
 =?utf-8?B?akwzQXhuTU1WZjFoV1h1L3phdnNWdnhCNzF0eEF6bmgrTmtFQVR0MnM3TUpa?=
 =?utf-8?B?VmhGMlFSdjQrZlRFRUNZYzdFLzZJdWJpNTA4UHQ0T2FNMXc0MTZZR25KYXRq?=
 =?utf-8?B?RzBad3F6YmpTTUJ6Q3U3aDRhak5oK2lUMnEvM2dIVlpRK3Bkc0haVFdCZ1RM?=
 =?utf-8?B?Rk5YU0pHaU03SlJHa2tXdVltODZmOUNzNFgwUWJKYUNkSmRsYTU4cGVEQ2d0?=
 =?utf-8?B?dTduY2Z2eUlqUFlwQVJUcG9CL2R0Vkk1RkptKzRYZUEvUmFjVEZKOUxLYW5R?=
 =?utf-8?B?b1dzUVVKTnhUUG5mc2dqWW9WZTYrYnBWRHdTNW5iSS9mRG5uM1RrVXlLUUVB?=
 =?utf-8?B?ZWhSRmYwczFmKzZ6dWI3ZEtPZUVsOW9pbWJDU1FvZXU1c1h2UEVRZGg3dE0r?=
 =?utf-8?B?bFFrcGFXR01LcVhGakZJZ1lMS2VZNGhieGRrNlZzSmxnKzZCcE02cDM2TERj?=
 =?utf-8?B?bVFaV3RvajNNSDdmM2c0K3hkSWcrc1JGSzFqeHk3TTZSL1cyZ0pEY3dkNUM0?=
 =?utf-8?B?NFhTcnhzMGFTdmVWMi9hbXVyVlFBcnBPVFZmb2J4bzRxVW1YbWJPZ3BOcldY?=
 =?utf-8?B?bTZPMk5zdzVrQWJ1bEd4RTJ2cFo3aDlJd0cxaklkRitZeDc0Rm9zY1BjNVkv?=
 =?utf-8?B?cFo3RHZ3V1p5dFBTRG9vREpXQUZuZVlWb2FVV21VelZQSVk0azlPMWFOcGt4?=
 =?utf-8?B?T3Y3emI4bW5rOTVQbkJRSnZCMjY3azVZdnZpRkVOY2NSay9jeEpCTW45Qnkz?=
 =?utf-8?B?ZWZqMm50bHFXTzZKRXFXVG5zMXYwbDZVYnBQWGFUSU5FMUM1QnRQMHlwc2JO?=
 =?utf-8?B?N2tLdWMwY2ZEZFF2a0dCZ2ZtVVVsdi8xdUdFalRVWVIvTzBqTkJLc21BWkpk?=
 =?utf-8?B?d29aNFRvQ1NYWFpVWkRid2g1OWV6SXRtUE1qNzIzUXRWK3NCUnN3aXR4WnRj?=
 =?utf-8?B?SXVTVTlPdlVISmN2ajJyOFhxUGRBaGtneEd1VkhOa0R2VEZxZnFKZEU3V3J0?=
 =?utf-8?B?ck1WYy9GUGVHVzNadG15MjFTOGVweUJGeVJydW5ZRy9uc0lEeTNBQ0hiR0hZ?=
 =?utf-8?B?Ull6RUZ6LzRUUkxXQkhONU4rRFFSY3RYOW9CeVFtNXV6aGk4ajlZU0ovNHpB?=
 =?utf-8?B?T0ZTVkx1MFBQZGRaOXIvL2crcTZROEw1T0dTL2NRR1FveSs4N1FlaVRTcWFx?=
 =?utf-8?B?Z1N0ZDdaQjhlUHVuOS9lZ2p3cUN5bGpxUTMyMjRmTlJXeVNVZDJiWEhNSjMw?=
 =?utf-8?B?empIVldwelUrVFJnRVE4aGNCL3VxRUk5a2tqWkI1R2lwQUl5MHN5V2ZYMDZY?=
 =?utf-8?B?K2RkMElOb2FpOE9WS3VoeTlwcUNZTmhlM2RXRzlic08vNzZ6Z2hNVitWZlF1?=
 =?utf-8?B?UlVCdk1jVVFBN2phenMrOGo3RzJwbkJtTHlNU3FvOWpuRzlzVllQc1RTZ2c2?=
 =?utf-8?B?UkVFZ1I1bzBxZ3ozUzNadnRCNk45dm5DMG1tS0dPOFU3L1p4QWI4V3pBanVx?=
 =?utf-8?B?VUc1RW45WURlZzhGTWo2VzRSeHBFZzl2ZWQxWWg2eS90U294cHZSN3NWNmkw?=
 =?utf-8?B?UzVaS1hRZGl5MWEzYnNTOXJtaWxEZzN4dnIxK0NINVpHYk1makJIWGpzMDhZ?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cVQCRBBaOuw34poed0u77Vud"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5668a97-aed4-45f9-a119-08dd420d6c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:17.8621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Emiu2vSSKSZ06BC04Kj8oO2O/A5SDJHcWulx3Nj+TKuSdQW1eqZGBepKwJc2xZPsti7dKP/uxojSAIuuXCInBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Proofpoint-GUID: 8J4kW2lK5B32wMp2aiqSENRUujuSGBV1
X-Authority-Analysis: v=2.4 cv=PoBpbxM3 c=1 sm=1 tr=0 ts=679ceeaa cx=c_pps
 a=mRJfeTHGti1YOx0CH8CfHg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=NEAV23lmAAAA:8
 a=Bq6zwJu1AAAA:8 a=pGLkceISAAAA:8 a=VeCtzijpZ1WmsS6HqsMA:9 a=QEXdDO2ut3YA:10
 a=P1_s_JGqDwQImzC-o0EA:9 a=FfaGCDsud1wA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-ORIG-GUID: 8J4kW2lK5B32wMp2aiqSENRUujuSGBV1
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

--------------cVQCRBBaOuw34poed0u77Vud
Content-Type: multipart/mixed; boundary="------------6fiNF2KUwoS7kQR0FbbzFCwd";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Message-ID: <ed7a463e-9654-41c3-91f6-f3f877fd9a20@imgtec.com>
Subject: Re: [PATCH v4 00/18] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
References: <CGME20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>

--------------6fiNF2KUwoS7kQR0FbbzFCwd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:47, Michal Wilczynski wrote:
> The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Ima=
gination
> Technologies BXM-4-64 GPU. Initial support for this GPU was provided th=
rough a
> downstream driver [1]. Recently, efforts have been made to upstream sup=
port for
> the Rogue family GPUs, which the BXM-4-64 is part of [2].
>=20
> While the initial upstream driver focused on the AXE-1-16 GPU, newer pa=
tches
> have introduced support for the BXS-4-64 GPU [3]. The modern upstream
> drm/imagination driver is expected to support the BXM-4-64 as well [4][=
5]. As
> this support is being developed, it's crucial to upstream the necessary=
 glue
> code including clock and power-domain drivers so they're ready for inte=
gration
> with the drm/imagination driver.
>=20
> Recent Progress:
>=20
> Firmware Improvements:
> Since August, the vendor has provided updated firmware
> [6][7] that correctly initiates the firmware for the BXM-4-64.
>=20
> Mesa Driver Testing:
> The vendor-supplied Mesa driver [8] partially works with Vulkan example=
s, such
> as rendering a triangle using Sascha Willems' Vulkan samples [9]. Altho=
ugh the
> triangle isn't rendered correctly (only the blue background appears), s=
hader
> job submissions function properly, and IOCTL calls are correctly invoke=
d.  For
> testing, we used the following resources:
>=20
> Kernel Source: Custom kernel with necessary modifications [10].
> Mesa Driver: Vendor-provided Mesa implementation [11].
>=20
> Dependencies:
> Testing required a functional Display Processing Unit (DPU) and HDMI dr=
iver,
> which are currently not upstreamed. Efforts are underway to upstream th=
e DPU
> DC8200 driver used in StarFive boards [12], which is the same DPU used =
on the
> LicheePi 4A. Once the DPU and HDMI drivers are upstreamed, GPU support =
can be
> fully upstream.
>=20
> Testing Status:
> This series has been tested by performing a probe-only operation, confi=
rming
> that the firmware begins execution. The probe function initiates firmwa=
re
> execution and waits for the firmware to flip a specific status bit.
>=20
> [   12.637880] powervr ffef400000.gpu: [drm] loaded firmware powervr/ro=
gue_36.52.104.182_v1.fw
> [   12.648979] powervr ffef400000.gpu: [drm] FW version v1.0 (build 664=
5434 OS)
> [   12.678906] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on mi=
nor 0
>=20
> Power Management:
> Full power management capabilities require implementing the T-HEAD SoC =
AON
> protocol messaging via the hardware mailbox. Support for the mailbox wa=
s merged
> in kernel 6.13 [13], and the AON protocol implementation is part of thi=
s
> series, since v2. Therefore this series support full power management
> capabilities for the GPU driver.
>=20
> Thanks everyone for taking the time to review the last revision ! Your
> guidance and the direction was very helpful.

Hi Michal,

This is awesome, thanks for contributing! I apologise for not responding
to earlier versions (things have been pretty busy here), but they have
very much been on my radar.

I see you're already aware of my other B-Series patchs[3]; would you
mind rebasing these changes on top of those? We're making some not
insignificant changes to the bindings which will conflict with any new
GPUs added in the meantime. I'll leave comments in this series where I
suspect the conflicts will appear.

Cheers,
Matt

> Since this patchset is slowly getting closer to being ready I'm droppin=
g the
> RFC prefix with the v4.
>=20
> v4:
>=20
> Device Tree Changes:
> - restructured power device tree bindings by abstracting power-domain I=
Ds from
>   firmware IDs, with the mappings now defined in a dedicated header fil=
e
> - retained existing clock-names in img,powervr-rogue.yaml to maintain A=
BI
>   compatibility, despite having only one downstream user
> - enhanced documentation for new Video Output (VO) clock inputs in devi=
ce tree
>   bindings
>=20
> Reset Driver Changes:
> - reverted reset-cells configuration to single cell as in v2
> - maintained reset definitions in device tree bindings while deferring
>   implementation of watchdog timer (WDT) reset functionality
> - addressed implementation issues in the DRM/Imagination reset driver
>=20
> Power Domain Changes:
> - added workaround to disable AUDIO power domain to prevent firmware cr=
ashes
>=20
> v3:
>=20
> Device Tree Changes:
>  - consolidated device tree representation by merging aon and power-dom=
ain nodes
>    while maintaining separate drivers internally
>  - power-domain driver is now instantiated from within the aon driver
>  - updated img,powervr-rogue.yaml to use allOf and oneOf for better sch=
ema
>    organization
>=20
> AP Clock Driver Improvements:
>  - reworked driver to support multiple clock controllers through .compa=
tible
>    and .data instead of using multiple address spaces in dt-binding. Th=
is change
>    allows to re-use the driver code for multiple clock controllers
>=20
> Code Quality and Documentation:
>  - fixed optional module dependencies in Kconfig
>  - added kernel-doc comments for all exported functions
>  - implemented th1520_aon_remove() to properly clean up mailbox channel=

>    resources
>  - removed unnecessary of.h header in multiple drivers
>  - refactored reset driver to use zero cells
>=20
> v2:
>=20
> Removed AP_SUBSYS clock refactoring commits (1-6):
>  - instead of refactoring, I opted to extend the current driver and its=

>    associated device tree node to include support for a second address =
space.
>=20
> Expanded patchset scope to fully support power management capabilities:=

>  - introduced a new firmware driver to manage power-related operations.=

>  - rewrote the power-domain driver to function alongside the firmware d=
river.
>    These nodes in the device tree lack direct address spaces, despite
>    representing HW blocks. Control is achieved via firmware protocol me=
ssages
>    transmitted through a mailbox to the E902 core.
>=20
> Implemented a reset controller for the TH1520 SoC:
>  - developed a reset controller driver for the TH1520 to manage reset
>    sequences.
>  - updated the drm/imagination driver to act as a reset controller cons=
umer.
>    While this patchset is focused on the LPI4A board, the reset control=
ler is
>    designed to be useful for other boards, such as the BPI-3F, which al=
so require
>    a reset sequence after power-up.
>=20
> Updated dt-bindings:
>  - added new dt-bindings for power, reset, and firmware nodes.
>  - updated the powervr dt-binding to include reset support and new comp=
atibles.
>  - ran dtbs_check and dt_binding_check to ensure compliance.
>=20
> Addressed code quality:
>  - resolved all checkpatch issues using --strict, except for the call t=
o
>    devm_clk_hw_register_gate_parent_data().  The current implementation=
 remains
>    preferable in this context, and clang-format aligns with this choice=
=2E
>=20
> References:
>=20
> [1] Downstream Driver Source:
>     https://gitlab.freedesktop.org/frankbinns/powervr/-/blob/cb19299320=
95649a24f051b9cfdd2cd2ceab35cb/drivers/gpu/drm/img-rogue/Kconfig
>=20
> [2] Initial Upstream Driver Series:
>     https://lore.kernel.org/all/cover.1700668843.git.donald.robson@imgt=
ec.com/
>=20
> [3] BXS-4-64 GPU Support Patches:
>     https://lore.kernel.org/all/20241105-sets-bxs-4-64-patch-v1-v1-0-4e=
d30e865892@imgtec.com/
>=20
> [4] Firmware Issue Discussion 1:
>     https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/=
1
>=20
> [5] Firmware Issue Discussion 2:
>     https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/=
2
>=20
> [6] Firmware Update Commit 1:
>     https://gitlab.freedesktop.org/imagination/linux-firmware/-/commit/=
6ac2247e9a1d1837af495fb6d0fbd6f35547c2d1
>=20
> [7] Firmware Update Commit 2:
>     https://gitlab.freedesktop.org/imagination/linux-firmware/-/commit/=
efbebc90f25adb2b2e1499e3cc24ea3f3c3e4f4c
>=20
> [8] Vendor-Provided Mesa Driver:
>     https://gitlab.freedesktop.org/imagination/mesa/-/tree/dev/devinfo
>=20
> [9] Sascha Willems' Vulkan Samples:
>     https://github.com/SaschaWillems/Vulkan
>=20
> [10] Test Kernel Source:
>     https://github.com/mwilczy/linux/tree/2_December_reference_linux_ke=
rnel_imagination
>=20
> [11] Test Mesa Driver:
>     https://github.com/mwilczy/mesa-reference
>=20
> [12] DPU DC8200 Driver Upstream Attempt:
>     https://lore.kernel.org/all/20241120061848.196754-1-keith.zhao@star=
fivetech.com/
>=20
> [13] Pull request kernel 6.13 for mailbox
>     https://lore.kernel.org/all/CABb+yY33qnivK-PzqpSMgmtbFid4nS8wcNvP7w=
ED9DXrYAyLKg@mail.gmail.com/
>=20
> Michal Wilczynski (18):
>   dt-bindings: clock: thead: Add TH1520 VO clock controller
>   clk: thead: Add clock support for VO subsystem in T-Head TH1520 SoC
>   dt-bindings: firmware: thead,th1520: Add support for firmware node
>   firmware: thead: Add AON firmware protocol driver
>   dt-bindings: power: Add TH1520 SoC power domains
>   pmdomain: thead: Add power-domain driver for TH1520
>   riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
>   dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
>   reset: thead: Add TH1520 reset controller driver
>   drm/imagination: Add reset controller support for GPU initialization
>   dt-bindings: gpu: Add 'resets' property for GPU initialization
>   dt-bindings: gpu: Add support for T-HEAD TH1520 GPU
>   drm/imagination: Add support for IMG BXM-4-64 GPU
>   drm/imagination: Enable PowerVR driver for RISC-V
>   riscv: dts: thead: Add device tree VO clock controller
>   riscv: dts: thead: Introduce power domain nodes with aon firmware
>   riscv: dts: thead: Introduce reset controller node
>   riscv: dts: thead: Add GPU node to TH1520 device tree
>=20
>  .../bindings/clock/thead,th1520-clk-ap.yaml   |  17 +-
>  .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
>  .../bindings/gpu/img,powervr-rogue.yaml       |  42 ++-
>  .../bindings/reset/thead,th1520-reset.yaml    |  44 +++
>  MAINTAINERS                                   |   8 +
>  arch/riscv/Kconfig.socs                       |   1 +
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  34 +++
>  drivers/clk/thead/clk-th1520-ap.c             | 197 +++++++++++--
>  drivers/firmware/Kconfig                      |   9 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/thead,th1520-aon.c           | 268 ++++++++++++++++++=

>  drivers/gpu/drm/imagination/Kconfig           |   2 +-
>  drivers/gpu/drm/imagination/pvr_device.c      |  21 ++
>  drivers/gpu/drm/imagination/pvr_device.h      |   9 +
>  drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
>  drivers/gpu/drm/imagination/pvr_power.c       |  12 +-
>  drivers/pmdomain/Kconfig                      |   1 +
>  drivers/pmdomain/Makefile                     |   1 +
>  drivers/pmdomain/thead/Kconfig                |  12 +
>  drivers/pmdomain/thead/Makefile               |   2 +
>  drivers/pmdomain/thead/th1520-pm-domains.c    | 193 +++++++++++++
>  drivers/reset/Kconfig                         |  10 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-th1520.c                  | 178 ++++++++++++
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   |  33 +++
>  .../dt-bindings/power/thead,th1520-power.h    |  19 ++
>  .../dt-bindings/reset/thead,th1520-reset.h    |  15 +
>  .../linux/firmware/thead/thead,th1520-aon.h   | 197 +++++++++++++
>  28 files changed, 1344 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th=
1520-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th152=
0-reset.yaml
>  create mode 100644 drivers/firmware/thead,th1520-aon.c
>  create mode 100644 drivers/pmdomain/thead/Kconfig
>  create mode 100644 drivers/pmdomain/thead/Makefile
>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
>  create mode 100644 drivers/reset/reset-th1520.c
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
>  create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h
>  create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h
>=20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------6fiNF2KUwoS7kQR0FbbzFCwd--

--------------cVQCRBBaOuw34poed0u77Vud
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zupQUDAAAAAAAKCRB5vBnz2d5qsEAr
AP41Plr+hl931JRWiDunqCgjpOl6jUZcdB5/AEUTUrv91QEA7IEn5P+M9znhoINoKqdvez5QXQ7n
U1TaSnqiTIZHyQk=
=7KYl
-----END PGP SIGNATURE-----

--------------cVQCRBBaOuw34poed0u77Vud--
