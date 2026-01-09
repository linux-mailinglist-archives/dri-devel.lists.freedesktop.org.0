Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9CDD0A11A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 13:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25CB10E8B2;
	Fri,  9 Jan 2026 12:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ud1y6aee";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="FhwvfSix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1677410E8B2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 12:56:03 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60978Pck1490689; Fri, 9 Jan 2026 12:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=BM+QRXZjI6QYcstBLGNPwIHfY
 XM42M3OWukPRaLTdLM=; b=ud1y6aeeE6bXTrSJf2njOUBc8sOfIT9GnG6gZ6Vo/
 E9N2060QOOy3Rt64+Gc8Sxglwler6rCNCe59FhiWIEVuSu242Ev8can+AGM+DrXi
 SHJC1Pg66uep5S5HgpoTxt+tjY0+c17Z9ozLZF9F/bodBoeLmzWiFrdTK9sfUpnj
 3Nbi5MKB2/718pK8K8vC5wfZ9rc9HIGopfOpVJfnbq1JzqBDHKLO1WY6TBwLL7BU
 HMSmUvmVFkD71hA9QKIgKZ8L/KyzkIuYkoNtzcaMz2HX9s023ohyw9lgAElq6HMU
 xLZGCHQ7rWdIHAyMC+4L0O+duKBYaTbUw8rV8BGOl/MGg==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021107.outbound.protection.outlook.com [52.101.95.107])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bjnfh0e6f-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 09 Jan 2026 12:55:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKU04562ug8PBVL/Oqed3UwQdeJBKIK+rGuQ3m1Px5xbBGphgt+DzYdUi9Tklc5K1WUdu3jk08xRRsx4f+Ayy3zuZb8pC2djPXT4pwWEQHcus0dKHb6GRDlxIznvfpynfoU6UJoIo78oVRgoFTw9sIK+xm5WaOARSagU5GNNklLxoTzHLvfpWVMESZwj+w/l2GiEhNGH6IZ/kOnCCyIC/ZFV7PjOy1KXo7YpVUDFYdV+zXWMJhR6bOGwiTiVZj/J9szWLgKC8QO3q2XkD64JCIk2bdIFjm3JLeXJeNApNikhQl+U8p7R5lCWm+luhxOKHzNFztk1melGdhKqTUrpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM+QRXZjI6QYcstBLGNPwIHfYXM42M3OWukPRaLTdLM=;
 b=pG2NgSZvLLYk8MM9Q/09OFevEODEWVrwlCBY2hzL8Ogq5/axcQzn+n4UU2aojGol8SfC6uhlCn0YNCMbNf1m9YgnqaN8Uw3Id8hpNGMrBRxh2gcohp/1hjy8LhCxJs/ePZz8DllaDgilYjjzmYjNIee5ydkVAwdw6OA7GAaF8ebEy8Cdwi7obiuWixYxuxabSXzzK5KLXFqOh5zugRegQU4s8WLglQehVVYk3nmvZ5wKLvhzOS24dlek49zdq58m3hfTZl1W5/LtcaCX/bwaoboZTU1BSjQNXZPqDHiX+o3eQWI2iuagBjzrCUHkmXgqYMlUv9Vq1qOX0s4sXMQk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BM+QRXZjI6QYcstBLGNPwIHfYXM42M3OWukPRaLTdLM=;
 b=FhwvfSix4Nyp5jGFs2Sb5fZAkYz8ZS0mfba47f4uKXtYc/OF6XXzzI7X6VIHw8i4uxDarm8QIJc3ZyImeX1s6eEewDKtWg+JMuhTn+gmGJTDRCUJAylQaKfb9K4w8WWf1938QdYAWUpFcrIfRhtN93AFK5+RYSIEylgUmlm2ev8=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2437.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Fri, 9 Jan 2026 12:55:40 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:55:40 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Michael Walle <mwalle@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Andrew Davis <afd@ti.com>, Santosh Shilimkar
 <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Randolph Sapp
 <rs@ti.com>, Conor Dooley <conor.dooley@microchip.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Thread-Topic: [PATCH v2 1/4] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Thread-Index: AQHcgWdB5/l6dajzs0y038JTXFFPJg==
Date: Fri, 9 Jan 2026 12:55:40 +0000
Message-ID: <714b5072-03ae-40d1-ae64-8d4ccc064e5d@imgtec.com>
References: <20251223124729.2482877-1-mwalle@kernel.org>
 <20251223124729.2482877-2-mwalle@kernel.org>
 <20260109121048.5usyjvczyjh2gs3q@craftsman>
In-Reply-To: <20260109121048.5usyjvczyjh2gs3q@craftsman>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2437:EE_
x-ms-office365-filtering-correlation-id: d2fd4bd0-45f5-4aa1-adac-08de4f7e647c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YmJhYWxSNDdlalo1bnovRzJWVGxKQkkzNmtSVlJqR29odkZMR3FoOTRIcW80?=
 =?utf-8?B?ZUE0L2JjNWduWmNMMFdNS3lXOWI5MGdnY3piQnZQcHBtVVZuVXJ0Q0FUQmlx?=
 =?utf-8?B?alM5UEYxdStXTVRPR05wa1ViaWRKNHNKQ2M2UDg5SmdIeEZvZFRDUHIyNnNK?=
 =?utf-8?B?VGJFWGtqZWhRdEdTb0hCV2o5M05oYVc0blNEMzZHV1dmVkJEZm8rYW9rU3RW?=
 =?utf-8?B?VUZaZGNRbEt6M2ltVWpYbzZNdy9UZ0pHU0tSYWZjSHdUcHZkTTczTmY0Qm1K?=
 =?utf-8?B?TVVlN2FZdUlzay9WMWtIN1ZpbTZaVHNZR0srLzhJTWpUNVFqTEIvbEtvUzhS?=
 =?utf-8?B?UFBnb1NlckdFT0JtdXdpWFdtTm83dkxjeXY3aWRhOStQZlJrZ3g0QkFES1l3?=
 =?utf-8?B?dFBNSzVTend6b1R4TUYrbkRmSmY2VDVuTXU3eGJNYktyemo4S3d0RjBabHp0?=
 =?utf-8?B?VG9HYSs3cFduSjh4djB0Q2FGdDVNMkIzU3ZKSk84MmpKSmdxaFE5bG1hcHlD?=
 =?utf-8?B?cXA3Y2RGcitZbjAzWFdaZ1dIUjVpVHVITUhlb1FRSVRWZVZvVkNzNm1NT0Nk?=
 =?utf-8?B?T01hUXMrcXNCb2o5SXdOczBRM2syTzBuaXNMR3BRTTc5NnF0KzRVcWF5TmR5?=
 =?utf-8?B?OU8zci8xc1lhTktCcTljOFBBbHN5ZXRGdElDRERuZDBKRHQ1WmJXeXllM3dW?=
 =?utf-8?B?ZjhmcllpVEZ4WERMdHJqaFVrUzd6N21qUW02TWY4VjRHZjRMVDVXSUNtUVNm?=
 =?utf-8?B?VnlKa1hEem5PNHJLOTBjWG5Nb3VLQ0JrMXRxTFl4NEhNOElXZjVCUXVaeEZM?=
 =?utf-8?B?VXR2NWZuejNiWXg0ZjdvMm1NRzVOQkpuZFBpb0JYbFJ0MlBBNnprcTRGR1Ev?=
 =?utf-8?B?dEhmMXF5TlpIUFp3Vll3TkpxQmdsajZvNktqRWdWQUx2RGtVK3V4L0EwcWhO?=
 =?utf-8?B?cGY1YmdLTzJYVGlYNTV4b2JuUnBWZ0tveTMrSC92TG5EUWZQM3FYanl6cVZw?=
 =?utf-8?B?ZUhSdzFmT1hpS3hqTmdSNS9YcmtweGxOVldydms5Y2tMaHBKM1o2Lzk5eDk4?=
 =?utf-8?B?V2lFVjd0OEUzOXlDcnZSY29ZazRQUFlQcURpT1lSMGdadmIvR0NlbGVKc1Jr?=
 =?utf-8?B?Z2kySVFSUDJJWCtCemNTZmcwSmtTemRVRGk5Ymgvb1ozK3BPb3VQblRkdlJk?=
 =?utf-8?B?bDZRSWVzRHBYRUVQREMxc3hUWkVJbU1IVXRqRERPQkxLMkJtYWc0NEJiTHlO?=
 =?utf-8?B?TzZFeEkzUkJEekFmVjRvc0E2MHNoWVZIV3Mxem5TZ2o2YWx4dFk3SUN1cVJ4?=
 =?utf-8?B?Z1ZGZDdXUEJpU3ppdEVNME1vaUJKQXFEYWNSOUpMLzdXZzRDQUNRZTh2TUZi?=
 =?utf-8?B?ZEVSV3V4MmJjOEtybWxmRXYyZ0loeml4b2IwWklxU0d3VmE4WUg2YXB1Z2xu?=
 =?utf-8?B?eHlYYytJa25WczFzK3cvcEx6UVpsbFE0Uk9JQzFLNWpEamFYYU1HV0dwZGQ4?=
 =?utf-8?B?YmJML21vRnVQS0FLcUpKWHIzOTF4Nkx4N01icUtJbk1lc0xNRmJ3WkdWdkNG?=
 =?utf-8?B?UkYzMVYyYWNvL1doMVkvLzl1amJLd2NPZS9yREFBa1RMbldJemFEdkw2QWpJ?=
 =?utf-8?B?Zk9aZFU4bnZ0N2FVS3F3M3k3ci9heTNmdWNIcEtGS211UnBsb3F0TlJxMFFZ?=
 =?utf-8?B?RTBpR2NnVGprZm5CdWxaZ0xGTk04QnlzY3puUExZVTZtZWdDblNrUHRpTkFu?=
 =?utf-8?B?T1had085VXUyc2ExSkJYcnZqVklPVUYzNENNNklkZTlITUIwOEYwcEFTQjRW?=
 =?utf-8?B?c3FVN2RuV0pWTW5WR01vN3pjSVpJRFZiRFlVdjhDbDY5YVVLYjZ3eVRDeHZj?=
 =?utf-8?B?eHlNc1pOOXUydFJZR3lweXArSVpaRGs4U1BmR2JUVVN0dzlqRFhuK0FEcFNk?=
 =?utf-8?B?MEh6dnl6YWVDMkljb2FRUVRESjUxT092TGtyT25wdyt5d09MQnRUM01mVjNL?=
 =?utf-8?B?RXEyaUFjd251MTU2MlhMSWh3QytIek1hQWMyaExtUU5Ya3VTL1U5N0hDWmFV?=
 =?utf-8?Q?JQqv4/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDRDR041RkpmUFJWaWtUR0NxNWxDVkY5TGF0U0pud2NZVkQvSGwvSW9JVDFH?=
 =?utf-8?B?ZHFKWjNZaWZwN3VRak5yeEZkTm1Jd1Q3TysrU3dJRjdhVk1tZHZMREh6RFJh?=
 =?utf-8?B?MkV0aUZDUGFidktNayt4WEg1VXdoTHR4U0FjUUJ2Y0gyMGRuQmRTVnNkWnpT?=
 =?utf-8?B?WklQbjUwcGtHMDRkOVkzVm90eEh0MmFxNzgwbnRZbzJWYUNQNVVxQURpVC91?=
 =?utf-8?B?cFB3QndObUlZam9LeGhkbjJ1ajZDK1FZcWpYV0d5cS9WT01IOFNMYWl0b0dC?=
 =?utf-8?B?UmNQWTErWjM2OWJoT01WaVl6SXNyRUFLalU3UkE4Q1hwVXlFOG1lWGsvTWNx?=
 =?utf-8?B?ZmFxYnlKWVZCZVJaUXpMWVRNOFNkdXJROVVCd1Q3QTA3V0tQaXRuakhtaXhP?=
 =?utf-8?B?L0pDZTdPekpIK25yYmd3cFJERXA2SUNtWmJLT1hveFlaQlAvcHJsdjRiS1M5?=
 =?utf-8?B?cm1UWWpJaGp6bk16eS9QT2Z5Zmt1UWRmWWZ0T0g2MUNZcUNwczc4VjMvMGti?=
 =?utf-8?B?WEEySEV5bWlsdlg4MDdCdFNnbUg2TEhpVytiUitjMG1ZUm5qMjJ3RVNVRW5p?=
 =?utf-8?B?TEIzWnBvN01oWkhmYUtSckVWTHdFeWNFVEpXTEtQc0xVRWNpQVlsRDlTdHg1?=
 =?utf-8?B?UGhYaE56c1RNcjQ3TjNyRDJ1czVBZ2gwMnE3YkVNR1M3Q0ZVNlVaZHR6QTAz?=
 =?utf-8?B?UnRjdjlROXl1bWRoQjdQVm9jV0FwV1V4aFZrNDQxSGQwbHcwcjM2WVRVVWFy?=
 =?utf-8?B?TnZGRW5PMFIwQnc1bU12SVQ0S0Z4eFRmTDRUUnBZeEx6dDRYTzV5WVV5N05p?=
 =?utf-8?B?SzZOaWkxcTk2Wk0wOTZxKzZHOERYUWxQR1lpdE55VC82cXc4eU1JaStBaEJr?=
 =?utf-8?B?VGZKck52dVg3LzBQQVYvaWNwMmc3NUVIWWtiejl1OTFnWWErYkRmaWZVcXlX?=
 =?utf-8?B?TmVHTU04QUhiZStpR05EZkhFQmpOS1NkdGQ4c2VBUW84ZnBJMys3YVRmSkFq?=
 =?utf-8?B?dDFVUmxycmVKK0ROOENyTVlhVytxT2V2TUhmU1J3NzlHaFZ1SFVtTDZDb0xL?=
 =?utf-8?B?LzMyUHNtTW9yQ2IvaEJ2akFVQmNtdkxHWEFmUmNtRkJiN1lhcWtZNEk2UE96?=
 =?utf-8?B?Rzl2YytLdW1EWEcvakNjNTZjalR5VUh4QVZhb0Z1a3ZtOWw4aUQreGp5c1lj?=
 =?utf-8?B?SUpOUk1GbWYreFNJdlg3VVRoZ0htSnMwYnBzR1BMR1lLTXpBRU1vZHBGR3ly?=
 =?utf-8?B?cnkrbDZZU0JnRUJ2NTJib2E0UmxkQU9Xdk12RURtdGIyNHhpU250aDd5Tnhl?=
 =?utf-8?B?Uk9DU25ralBlUE9tbVVBUTZGcEdOZ0lxaFZQaWlFVFFuRHVZVUN6SXFoMUVk?=
 =?utf-8?B?ZmNlSmx5aDJnc25LQk1qUWZFV1lwZHBtRlkxRGd3ajBZYzg3T05oMEY2VGlP?=
 =?utf-8?B?Z1VhOWlMOHU4Ny9mRHN0bTA3dGozS2pNR2x5TUcreU5PbGk4K2xIeFg0bmZy?=
 =?utf-8?B?cVhIcVBHUVUrNlBDZndHVzFDZGxkNnZiTGlpNnVjQkVqY0pjZUEwOWk3WWlI?=
 =?utf-8?B?Q1g5VC9KcERNcTQyYWp6Ri9LUHlzTzEwVGIyZnlDRElKRjIxWHRwd0c1ZC9F?=
 =?utf-8?B?ZkFERmg0bkh0clhQajRpZnJGME43bS9xZFFkaHgyVFFVTVNNbWx5NDJ5cms3?=
 =?utf-8?B?bWJjMzl6T0JpYTF6ZWhva25SeERvL0pzVFBwNDJEdGtQWXNhR1B5ZVpmazF0?=
 =?utf-8?B?Z2FVY3RCNjBWQjJIbVQzM2ZkVjlaUk5aaWRFMytLdldMTkM1ZTdqbVVPb0Zu?=
 =?utf-8?B?bzZ0bjA2bThGTkZUOGpHb24yS3FkSmRGZDJMd1JpYzY3cTVoTDJXbk5YL0tX?=
 =?utf-8?B?MXlCQ1lYd0VlOVBXaW45K1M0QjM2eXFHcjNUcjZSRXFIWVhNaE5JemtEKzBq?=
 =?utf-8?B?MW5RYWgvUytLOVp6cnFhdVZSc096dmN0eGUreDJsUGpMRmIzUkR5bjFURXhN?=
 =?utf-8?B?M3BOVUU2czRGUGl1d0JFbCtHM2ZpdmxEWHQweGJOazlnQXh0R0hldkdNWHRP?=
 =?utf-8?B?M1Z4U2ppL0VXZy9ZQVZab2huV2tzSFl0SnFKc2lCc0pXUHVhQUlUSEtaQmVU?=
 =?utf-8?B?cjBDWTVEeXhBeCtrb2lHWXNPUEc0YXpnQ21saHAxbGhjK3QzMk9EWlVqV1FT?=
 =?utf-8?B?anA3RlI5R0cwNVNKTHNKb2ZhcHFiMmhxNk5tMDYyL083b1VlcHpNTnllV0dx?=
 =?utf-8?B?L0FpT2tTa0R1ZzZtTmZ4VG5LWUVmQ3p4SkQwYVlFUmNJakZraTZuRE1yaDNS?=
 =?utf-8?B?WGdWRUN6WDVkM2N1UFkwUHRFWWJOVXJqS3RHME5wdU5ua09Gc09aMk1vSFE3?=
 =?utf-8?Q?1v63P/fxvWtIo6M4=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2alApmZcnI1dHgt9h8HbaMLC"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fd4bd0-45f5-4aa1-adac-08de4f7e647c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 12:55:40.2579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+7fYCueiak3sjvWvGboxAWNzT2g9wg0u5QJlVhAWvunTjsLvqaEl5fvwuhV+UyfYwBDRTFWO55DoddNiHY8Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2437
X-Authority-Analysis: v=2.4 cv=QJBlhwLL c=1 sm=1 tr=0 ts=6960facf cx=c_pps
 a=+6Hn4b7hOW+yA3/pNCoyyw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=XYAwZIGsAAAA:8
 a=r_1tXGB3AAAA:8 a=whcHl1cWwFfTmot2cVUA:9 a=QEXdDO2ut3YA:10
 a=MwSU9HaaNfUxi3nnPywA:9 a=FfaGCDsud1wA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: f8KKXv66FSmtIxJld0T5TyfnKex_zw7b
X-Proofpoint-ORIG-GUID: f8KKXv66FSmtIxJld0T5TyfnKex_zw7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NSBTYWx0ZWRfX8nA2U42w83MW
 XjeKd5VnfH0UNw0ZQS5jQwHPrq/RtPNOaYwnhKAD5PLdvzhTXqYOsjnFigdd9qhcJmWHFznVZyp
 0+pK6gAmB558XJqA+xu7BFTdLynqoV1NgZdAFx8v72B4fGFQC24IpD7NpCCANSFFO29BZ/YvNdP
 5Qvey+ELwQJbjm6TznGsyjhfkodYfy3DqoMFlH/igcJumfY2PKVCqs9FQgjNsxK5Hl5WYDdOiBR
 f5KahJ0akVaPft11+oZgk8f7GNnCf+2dcvN74Jp/Wnsbae45wGMPTCZGuWSvGS4aD7s4fgmSdGZ
 K42jV3kAlwEFJYKCz2cGVzvUVE2IPt9FdvhTlk38qohM6eR1wLGRbYE8GgwflCjO5/ZvkFwzEWL
 QfB6ibLZ85UoaMyavhtCZCO5Ig9Atu/Ac7UgLbb/lqO2GQ0IQFc3s5fwFonB84B429c7qeGQflX
 fbmsM+YNVMbgyEe82/g==
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

--------------2alApmZcnI1dHgt9h8HbaMLC
Content-Type: multipart/mixed; boundary="------------TsA1mJ4AYHUJqQbS20dppkZr";
 protected-headers="v1"
Message-ID: <714b5072-03ae-40d1-ae64-8d4ccc064e5d@imgtec.com>
Date: Fri, 9 Jan 2026 12:55:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
To: Nishanth Menon <nm@ti.com>, Michael Walle <mwalle@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Randolph Sapp <rs@ti.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251223124729.2482877-1-mwalle@kernel.org>
 <20251223124729.2482877-2-mwalle@kernel.org>
 <20260109121048.5usyjvczyjh2gs3q@craftsman>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <20260109121048.5usyjvczyjh2gs3q@craftsman>

--------------TsA1mJ4AYHUJqQbS20dppkZr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/01/2026 12:10, Nishanth Menon wrote:
> On 13:47-20251223, Michael Walle wrote:
>> The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add=
 a
>> new SoC specific compatible.
>>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 86ef68985317..a1f54dbae3f3 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -40,6 +40,7 @@ properties:
>>            - const: img,img-rogue
>>        - items:
>>            - enum:
>> +              - ti,am62p-gpu
>>                - ti,j721s2-gpu
>>            - const: img,img-bxs-4-64
>>            - const: img,img-rogue
>> @@ -100,6 +101,7 @@ allOf:
>>            contains:
>>              enum:
>>                - ti,am62-gpu
>> +              - ti,am62p-gpu
>>                - ti,j721s2-gpu
>>      then:
>>        properties:
>> --=20
>> 2.47.3
>>
>>
> Matt/ DRM maintainers, could you pick this patch please?
>=20

Sure, I'll add this to drm-misc-next. Just for completness:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------TsA1mJ4AYHUJqQbS20dppkZr--

--------------2alApmZcnI1dHgt9h8HbaMLC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaWD6ywUDAAAAAAAKCRB5vBnz2d5qsBAU
APoDbZB29+W0n07pDuoBnwlS6wxeWemwQv7mCg1Kof3+RAD+P3vhKgmusP14L+nXTvZq4ajxtqkc
IJTViK7sR3PAWwA=
=CRe7
-----END PGP SIGNATURE-----

--------------2alApmZcnI1dHgt9h8HbaMLC--
