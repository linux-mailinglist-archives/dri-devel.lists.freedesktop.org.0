Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB126A13A4C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 13:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B4510E592;
	Thu, 16 Jan 2025 12:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="pkPmHesM";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="nWKZFsaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AA110E01F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 12:59:15 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GC7GW5000996;
 Thu, 16 Jan 2025 12:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=gQna1y3GvyRmIZgoqjxwkf11X
 B9HSG7xZslaZkZY7aU=; b=pkPmHesMi3Ib4zHwqzD5PBYCqbJ2z+7zdRxCbrBg6
 oEp5OrbNx6io1kgP5LiQQgNHAKrpKCN8PWJyu+lyzjS8+6uBhkrSR8UCTWo5zBz7
 XczoY8kHNwG8nltH5ttHbFuYSMVBPd8+dKrBuiPoplv5PDmF+p6dkCiiGv5DB/VS
 yUG9BZY6VM9YhtX2ZHvmD8lnDCvt3CjcL5DJiGFBAZQJVNSpmS5mxVNYFZfVG6Bb
 6le8osckr8xKnM2avd5twKKQCq5VNb50RPdRG+IV6PUoNtiqs3Iu+u5vjaGJOXbk
 NBUcnBe3niNb4qJM0TLNQMaKzIrGdsMg1ZLna44pD08vQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010000.outbound.protection.outlook.com [40.93.68.0])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 443fsx39c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 12:58:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jk4ebF6u8SiOOvNOpV+AT/XHiUvGRPGUUQjbECtcknQn7M3aJK3Zufp64+4U1IVRGsaqBC2gQCxmxWA4gCbxzRYm6Wk6WCCU/f/NwYbcw725+kq/AbQEZt4CNQWzswe+7UTAjR8xQTUzN4ZyD11Z0keRUihOO7UTuMXbRCmJTDrEXn8IdzUqvwjAq1CtuO/kC/xNOP8NoNHc+nIvjNhRPLj2Zfvdch9pw2EUqfnPZLw5XnTR7dfZpD9HKgMpf+c+fSmoOpoXfGTR8/WUEPYu+32YW1P691J7jLvhHixv380b9HLzDyfqDQ7lS24CQScz9fF+cShphWReA5zYNFQH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQna1y3GvyRmIZgoqjxwkf11XB9HSG7xZslaZkZY7aU=;
 b=FFNzo3owuWaOkwk4suxNuGTa2SpDDXQNqvQnHz4WA0x431CkfiHbmcoeTzhJAh9VRemz/D2yi18InGxMUu6cwxHqX34xtPVrQ/kQFxLu5LPx+4AIZhjsKugF/DckfXHP+33R57O0WE2lFJcnuwBQW9yJ9Wtdm1P0OQvZDzbBQlgjqNuiEn78vUcGVr/euPr+4T1MNd5htt2c6yw9dqgD61MWPBnTCp4Oo3JE3HHMVJWMO/qpQhBHZi99j5mk7L8NAy2qmq1fpN3eG4zDcSP+u9e6WdYPMWbL3GQMIrq94gkjzNTs5RaEt68RUtT9sOFCelnyuEaU0o2RBOX6B05iQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQna1y3GvyRmIZgoqjxwkf11XB9HSG7xZslaZkZY7aU=;
 b=nWKZFsaqHxvkuSRPPjzJuT2N5uCCa2KqWVX6g8iRacSRtj2eyc8QLbrXbfsl8DlzDArnDzYjYLOriVtqqWYXBZWtNkIiLQFGO+I6/O/B6W7587EuhiGyCVcbnr+W7qhXwmqw5f1XrnPYYjKas7i9BwNsyfYIRpxRUb2dpTMqpPQ=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3118.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:162::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 12:58:52 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 12:58:52 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Philipp Stanner <pstanner@redhat.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>, Frank
 Binns <Frank.Binns@imgtec.com>
Subject: Re: [PATCH 2/2] drm/imagination: Use the drm_sched_job_has_dependency
 helper
Thread-Topic: [PATCH 2/2] drm/imagination: Use the
 drm_sched_job_has_dependency helper
Thread-Index: AQHbaBZkm9mBCk8alEWPNs/vCGXAOA==
Date: Thu, 16 Jan 2025 12:58:51 +0000
Message-ID: <435038aa-4745-44bd-9912-b422b2b513f2@imgtec.com>
References: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
 <20250113103341.43914-2-tvrtko.ursulin@igalia.com>
 <3bd987218d4248cc837c37361d0f8f29fc6933ec.camel@redhat.com>
In-Reply-To: <3bd987218d4248cc837c37361d0f8f29fc6933ec.camel@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3118:EE_
x-ms-office365-filtering-correlation-id: 55ab005e-c437-4a8c-288e-08dd362d86db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dm8rQnI2aGx4L3JKb3lZcS9HWW1ua2FibDQ5M3NlOXcydUxNVEl4MFNrRnRO?=
 =?utf-8?B?Y3p6ZzJ4TTVwdk5KODNNQTRtMmllVTFYTFQ1Q1RHRTV2czErRmNSN2lmYjJ4?=
 =?utf-8?B?ekUybnlNeENCMllOOCs3WWF3Qnh1MEdOWFovaEhVUFZ4Vy9XU1dOdHd5ZzFy?=
 =?utf-8?B?OEpGY0QvNm16WlJHMFZYNVFRSnhFUnFQM1dkaytYTlFnYzNxWi9sTjRoVnM2?=
 =?utf-8?B?ekRaMGtnYjRSeFVDcE5XVkR2cDEwZEh2QU5IbXIxQmJHQW84Q3l4eFVwenNB?=
 =?utf-8?B?VllLbWVHYWdxaXU5RmYvN0kxNGJZNEZZVnd3UEYyVmZOUCtIcXZMMmR1eENp?=
 =?utf-8?B?UEduTENGRjR6bUw5S0VPcnI4Smc5cDRkbEU4bEJvdFg3UnovSW5YcUdpSzFO?=
 =?utf-8?B?WTdzL01UZ2llekRuVmZFYi9qekE2aFBUalZrL2NwUzFmNWo3b012MTZCMEw3?=
 =?utf-8?B?UUNVaUtBR1plNDhEVTZiSGNCUU9haFNhZnlNcWhDRGZubXljdDVidHBwcFJP?=
 =?utf-8?B?OVU4bGh3UkE4YmhUbHFJVTMwRE83V1VLcXBuaUhFUDcyQmp6UENJRE8xWk1T?=
 =?utf-8?B?U2Z3VXZneUVld1VHRG5DTW90OXZFMU1ZV1NjR1hhcm5XbkV2YnlyUElzeDJ4?=
 =?utf-8?B?Qzg5NDRwL2tSbWpuNVBCeGJpUzYvcXZVKzRZQ3ZqdTVSZ1RzUFNYbzZpSTVv?=
 =?utf-8?B?cW45STZja1kzYnFmRmtlM3RNS21SWWJNZGlTaTgvZGtxc2pBK2ZzZjZiTTVV?=
 =?utf-8?B?ZmN5cVFaRlh5ckdHTzZmd3MzOS9zN0hCQWJZeE5zdFRWUTlLdmZWQVgvbGlz?=
 =?utf-8?B?NmM3cERlV0s1cXJMRThLeDM1ZldoU21OZ1U2RTFNMDNFbVhrcWRhLzRRN1R0?=
 =?utf-8?B?OVgvRkZNeE50NHoxZG1rZ05uaXRoUWtYUll3V05SRWtibXdUNm81SFIzb2FT?=
 =?utf-8?B?NjVPQUNKVXZ5UWQ0SHpGd0h0aEE5ZUtydWlnaU5CTVdXdHk0RG1GZHNGNWdt?=
 =?utf-8?B?YWZtTE1TMUpucTBmR2NYY1V1WDcrbEpDd1h5NUlMaG5aeW9vWXVwK3JZcVo0?=
 =?utf-8?B?R1RXc3RFZDNndUFJNFFmNk1CMnNta2FacFVlYVE1dzkxemk0YzMzY2U4d3I5?=
 =?utf-8?B?a1p1ZTBiQ3JFaEVOWnF5MTRJUjRtOGtab2VPNk1qb2tDdSsvNjVIUEE0TTgv?=
 =?utf-8?B?NVVhc3JGQlJlLy8wdkIrNlRtTm0wU2dtWUNTZFRXL1dLL1lZQW9FL0tBYUtJ?=
 =?utf-8?B?RytKRURkNjR0UzVOMDhGYlorakxsU1RDMjNPc3JKaWcyV2l0cUpkMnowM3dB?=
 =?utf-8?B?bGkxWWEzYjNKUnFuMHJkWFRBOEpzMlI3SDhqeUJBSVN4N2FXbmJkUzFkclJG?=
 =?utf-8?B?eDRQZjZDU3VORTVlYXRINjBkNmx2V2NialZHSmlNUE80T2lBNXdHb0E1TzBm?=
 =?utf-8?B?dWhGMG9Ub2hyUHAvRXlTUjJEOVd5SDYyOUZjZThQd01aZWFPWDdiTzBQZXlX?=
 =?utf-8?B?K25BT0xob3NBU2hCTEIyWEdyQWkzNml5a1ZlQkVkNjAzN08wbGpvbk82UUNV?=
 =?utf-8?B?MCtWczFHd2NNcFVOMktHQUtnejN5NGNhRGZzd3FEMTh6VDZlRVBkM0VqR0RQ?=
 =?utf-8?B?TW1Rd0R0U0ROU3F6NDYxK3M2WjFEQWovS241U1JTbitCb0NVZWVrODAxSzVE?=
 =?utf-8?B?RzMwZUpxTUxkRHZzdUE1VUxCb0dpOUNBTlBuZjI5ZDFZSjBUV25QZWdXQ3p3?=
 =?utf-8?B?d21Gd0llV0FWc1VzQkVWOXF4OXNIM0xGay9nNHBaeUlaNkJhQjJiRjNZR3Yz?=
 =?utf-8?B?MjZWenA3Q0s5S1FhRGNjdkxGQyt3WXhEYkVacUNLYStpOUh6MDJHZ01WR2JG?=
 =?utf-8?B?bGt0YUJsMXNLYWVMUWl2cEgwZGoxZjUvUk01bmszYldHRHU0OWdRZmJxZVpD?=
 =?utf-8?Q?XZFpzORWPiwoaOV87/jz5AT7eu//x/8Z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHNkd05GRHlBN2tGRWNUT3EwdXNoVFZ1ZWRMbTFaNFNWWmpvQ1YrYWNhNWxi?=
 =?utf-8?B?azEvRVFLQWEzN2FDdXhIZlN0eGdhWVBaTWIxZWxqRGVUVlVBZlRmTFZIdlZa?=
 =?utf-8?B?aTNIUS9mbTNyOVRncXhGOUpIYktyT1NFdzBmR0VpQ1VGYTZBSkYvQllycThZ?=
 =?utf-8?B?bXpWUzZUWmJBOEt0SkVYV2N5MXFDZ2hvNmlFRDI4UzhScFhjRzlEUUVralJ6?=
 =?utf-8?B?cXYvN0QrS3JqWkRQaFFvaGx5QWNCbXRBSEhyTGlEY3hNaXBUblhOUU9qbnM5?=
 =?utf-8?B?QzREbEFvc0MxMjh2VU9zdXRBOEhpU2VWcmxJUUlPc2FpUC9sQVJMS0FoUW1C?=
 =?utf-8?B?VHozQk8zcjRtUEVYTVEwMFRvbkUyRVNTY3p3b3RYMldJalgvWEp6d3psSU5R?=
 =?utf-8?B?MTQzWnQ4Y2lrZUxSbUNlZVhhOTFQNmhYenBZSVB6SlRtR1FleDRBQmpwbFZV?=
 =?utf-8?B?UHJ2aFNTTnl4bmxzWEdIdlN0dmJ5bmJER3JEdDk2aTdTTVB3Y1pBbFpYVmxK?=
 =?utf-8?B?cWNHMkIvcm5IVEFVRFI3cjdJM3ZZUXgvajdQMlYxaXQ1OGJWVzRRMTl1bDJS?=
 =?utf-8?B?QWJzdVI1SlRGeldkMXZ2dGJoNlJPMjcyVnRwRkJabTlVTVFkZzFMb1BSRUdh?=
 =?utf-8?B?YVZTZW1JQklZRUtodVlKUnhURGs5MGRxL01sRlVzSjdBdE1TeXNvdXBYcGc0?=
 =?utf-8?B?Mnh4QmxXYWFEa25OeWkzaHk0bXBmUDdYYktjSzRld294eUxISFZ6a2ZzV0FL?=
 =?utf-8?B?MVJYendpa2Uvb1kySGh3UDdpMGV3ck1CWXp6NmRsS1pKbWhuTzlLU2E1QmJv?=
 =?utf-8?B?MGVlTFZRR291V3BKK1hDSHZzRTlncjhZWlFBeEI0aXhnWkZENGZ4ZXVXWUpJ?=
 =?utf-8?B?MG8wakhCOHZ3c1h1eisrblRCdFdzdGRtZ1NuQldiU0tlQXZYR3dNeWVWTE8x?=
 =?utf-8?B?UzlNRElXV2tVYzNFbDlwa2hmcktWS05FRSt1ZStwSXJVZzhKNkV3d21VeUR2?=
 =?utf-8?B?UnVJVlczQUlWM05kVDZwWW1qbVRNWG1nTlF5T1BFVVl3d3Q4ZEk1VTM1NVll?=
 =?utf-8?B?cS9EU29leHp4L2laVFBpZWx4VmEybU9SeFJGSFg5VXZuNFE5SGJZbXluT3F2?=
 =?utf-8?B?QUlCNVVQcGh6S203MWFEYlpucTQwUXhmdDhjSDFsdXVrR1MwaHVBVUM3MVhP?=
 =?utf-8?B?NGNTbyt1bkFZVFNMRHZrczVSVjFJd2FnWmJ2Zko0ajJhMmdMOWF6MkM0ajFw?=
 =?utf-8?B?bEYyZmsxdnVYYWpBR3h2SGVVaGpkbHNNZlZYaVljQWdkY2JSbHhVOXlOYUgx?=
 =?utf-8?B?QmhiU3BUMDdkcU5pclRWOVA3VHNkNDhrMThSV1hiMDdCSVFNeC9vdVhsbDVT?=
 =?utf-8?B?VGNQVU52c0I4UndCb3M4STc5aTRzVGtPN0Jtd2hiMGF1Z3RKd0V4VS9rRENj?=
 =?utf-8?B?eUJ5Y2U4VXdSZm5uY3JGczRpbHhpei9lQktZTTBBNitGQUg2OHpCdXVZQ0h3?=
 =?utf-8?B?cGtIa1QrNWEwTFNUUk0xTnJUdTd2azYvOEZzdnQ1UkduZFpuVDRBdTA5OTBE?=
 =?utf-8?B?UXRMalo3Tjk1RzE3cWRZZHdnc3g2NWVmVDBDMDBrN3J4WllhZUJTNjRXMDQr?=
 =?utf-8?B?eE4zdEYxVFJYRmNFWlpGdnovTUJOTGJtZ0JPR0hkNjc4MzByL25uSTFqMjFR?=
 =?utf-8?B?TmpLamNGOVMxZWZ4cmxweXpvT1NpSzRGakxsSFRlMWx1SWZyZUdBcnpWaHdL?=
 =?utf-8?B?ZURIY01EM1o2MHpaU2hUS2lPSEZVbGptSGg4S053TlpoM1BpNlVERWYwZ0hP?=
 =?utf-8?B?QUdLRCsrT052TlRISUFDL1RlYzMzbUdST3BTQndXZyszTStqYWNiVVJXQWto?=
 =?utf-8?B?c0Fua2VoOXBkRkxQb1FRbFpHRDRUeVdvYjJaamo5cytsQkZFVlJIdldvUXFF?=
 =?utf-8?B?cnhUWUtPRDh6dnZmVTZ2VDJZMG1IRlZuSS85dnMxbmMydkJSbWMyWXgzUjJL?=
 =?utf-8?B?T0VONlJJSVdzMlk5Mk9jeXdwdEF2aW5QME1DTDVjTVNoSkVnemRJOTBxbUxW?=
 =?utf-8?B?Vlg4VmRBRC85Qkc2c2lsMmM0d1VyVk5Kb2daTkxFS1hoenBCdWJGS3YvK0Nu?=
 =?utf-8?B?WTZsQUx5Sll0YXBFSzhTSm9rdWk5OTJ6TVkwL0hFbWFKQWVZV0huWVBkZ1gw?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HFtAS27BpUTDJ0N8FpresFy1"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ab005e-c437-4a8c-288e-08dd362d86db
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 12:58:51.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyDLhZRY6je4SfsdLK2triWXItmgb/VQIE1l/cDgjLFYv7/3ZsbbK2IZE8b2g6zpcLYG4nEIoQZSoIcHpWBAEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3118
X-Authority-Analysis: v=2.4 cv=T5l2T+KQ c=1 sm=1 tr=0 ts=6789028f cx=c_pps
 a=mB5N+MKVSatK6YSWG2ccTQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=r_1tXGB3AAAA:8 a=8JEriR_TJ078FE7OTiEA:9 a=QEXdDO2ut3YA:10
 a=vY4ME41dffyN5KHUC-EA:9 a=FfaGCDsud1wA:10 a=Z31ocT7rh6aUJxSkT1EX:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 0shDAQBVdgrv28TSDIxUpg_lo8oOh6mm
X-Proofpoint-GUID: 0shDAQBVdgrv28TSDIxUpg_lo8oOh6mm
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

--------------HFtAS27BpUTDJ0N8FpresFy1
Content-Type: multipart/mixed; boundary="------------dyryq0xljWTbotMhneNtvuFs";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, Frank Binns <frank.binns@imgtec.com>
Message-ID: <435038aa-4745-44bd-9912-b422b2b513f2@imgtec.com>
Subject: Re: [PATCH 2/2] drm/imagination: Use the drm_sched_job_has_dependency
 helper
References: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
 <20250113103341.43914-2-tvrtko.ursulin@igalia.com>
 <3bd987218d4248cc837c37361d0f8f29fc6933ec.camel@redhat.com>
In-Reply-To: <3bd987218d4248cc837c37361d0f8f29fc6933ec.camel@redhat.com>

--------------dyryq0xljWTbotMhneNtvuFs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16/01/2025 10:02, Philipp Stanner wrote:
> On Mon, 2025-01-13 at 10:33 +0000, Tvrtko Ursulin wrote:
>> Instead of manually peeking into the DRM scheduler implementation
>> details
>> lets use the previously added helper.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Cc: Frank Binns <frank.binns@imgtec.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
>> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
>=20
> Matt, just to be sure, you're OK with me pulling those two into drm-
> misc-next, aren't you?

Yup, all good! Thanks for checking :)

--=20
Matt Coster
E: matt.coster@imgtec.com

>=20
> P.
>=20
>> ---
>>  drivers/gpu/drm/imagination/pvr_job.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
>> b/drivers/gpu/drm/imagination/pvr_job.c
>> index 618503a212a7..1cdb3cfd058d 100644
>> --- a/drivers/gpu/drm/imagination/pvr_job.c
>> +++ b/drivers/gpu/drm/imagination/pvr_job.c
>> @@ -597,8 +597,6 @@ update_job_resvs_for_each(struct pvr_job_data
>> *job_data, u32 job_count)
>>  static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
>>  {
>>  	struct pvr_job *geom_job =3D a, *frag_job =3D b;
>> -	struct dma_fence *fence;
>> -	unsigned long index;
>> =20
>>  	/* Geometry and fragment jobs can be combined if they are
>> queued to the
>>  	 * same context and targeting the same HWRT.
>> @@ -609,13 +607,9 @@ static bool can_combine_jobs(struct pvr_job *a,
>> struct pvr_job *b)
>>  	    a->hwrt !=3D b->hwrt)
>>  		return false;
>> =20
>> -	xa_for_each(&frag_job->base.dependencies, index, fence) {
>> -		/* We combine when we see an explicit geom -> frag
>> dep. */
>> -		if (&geom_job->base.s_fence->scheduled =3D=3D fence)
>> -			return true;
>> -	}
>> -
>> -	return false;
>> +	/* We combine when we see an explicit geom -> frag dep. */
>> +	return drm_sched_job_has_dependency(&frag_job->base,
>> +					    &geom_job->base.s_fence-
>>> scheduled);
>>  }
>> =20
>>  static struct dma_fence *
>=20

--------------dyryq0xljWTbotMhneNtvuFs--

--------------HFtAS27BpUTDJ0N8FpresFy1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ4kCiwUDAAAAAAAKCRB5vBnz2d5qsM1/
AQCsDBFDG8DVVY0Ze3iwN7z9L1F6DMrYZmVB/uax8pww9wD/a2y+E22IDWH8F4PdIeHy8nG25ii2
oAe9JZ3bscmzIgE=
=NlIF
-----END PGP SIGNATURE-----

--------------HFtAS27BpUTDJ0N8FpresFy1--
