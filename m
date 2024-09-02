Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF8896812C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899F10E231;
	Mon,  2 Sep 2024 08:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="feityzZ0";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="kXG2sFDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF90D10E238
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:00:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4827Wneh003596;
 Mon, 2 Sep 2024 08:59:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=BPCERjNyJ6oyJNQPUe16Av21NG82y2T/WqLKcv1tfhU=; b=fei
 tyzZ0yxq1kfWbW0uMRl85pLUQA5cy/KsgTmWivxKLQF1wtWwlAZHSOJOE5NcLQ3Q
 X1cv4Qe1N/mHiSlCMVU77sCOCAlOU1jJM9OqAn+lGGGkqPNXNpi1JcgBLf0uH/1N
 J2qEmwmY3mRQafc3bf1mFru/uZsdBYKoUZV6dtIg9Tv651kfHWoPE3+woDPaO667
 /+1zpLpzMzgOfweP+pmZmg53knI2vTh/tVKfkVrHPDSFDnJER7YPIDvYMyjYbtbp
 71wIflzf2LhPHa7bGQULmGqesf5FHbd6o9a77hG6u8RRdfMgKpPwLVmFOZEnsWTH
 hghUIP1rE9HTGpJcXUQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 41bses9b4f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Sep 2024 08:59:56 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 2 Sep 2024 08:59:55 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.113)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Mon, 2 Sep 2024 08:59:55 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbZW3PpmiJAWIih1qrwQ83NnuIpnFhqHez4XzkqFfv7nQPosTAV6S5BYJ79vJ2yPPFNeLC7WowaSbritasEIufUjSBDcIJMfyimrLAGR6tbi2f19BasZiWyM4vaPIBsIdSkoGi5yuQMs/t8qbpvideyD3lAJwzH0AgPTzNv1+pps0UVD8vbzZQdNuqWYKscTA8GmqEV2/Q/Ub+FzpADjtcrX2t/3/Ir4IQgYN3PpvOHMkdh7oJrCgV6FZSQA1UXfeqmBJvr6THdTEy3N9oA3hkFji8S7ifIBsm7UbkzZBYcsszux3DLHN2RvAeIxaYBtgCLnvI9F/OOo+Un3+rwtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPCERjNyJ6oyJNQPUe16Av21NG82y2T/WqLKcv1tfhU=;
 b=NxZBi4Y2OT3R0sFwdylfmzw4Br2+lVgW3RcWghnGH9MZAtC/iHlO+UhQSnHPdg96LUzGih2NJXFUlsW6Z0jkxPjjwzfnBl4T++xbTUCSBiN6c+53V7oYF31pVzW4o7bAg175nBT/0nkr7AddDaigcjDMDyBbdWwLdtgbez+hEW85EMDevJAT1DhUaFRIbDD9bjzEZ+Ank0qA3IfqhvDWyWCFf8kDGW6HafSYuHrb/euHuVkOAYpS2AthAxnDPLDObY6201vx5G4SKbKlnrEwJL3VL60Ydh93b3uQ58Pfb0hZr6losA90l+Mw+ZhmYokUn74IgUFL7As/XYW0LcVNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPCERjNyJ6oyJNQPUe16Av21NG82y2T/WqLKcv1tfhU=;
 b=kXG2sFDP/EBT3qt8PQYjqcF6SkAmpYWILXp6cB3CLRamHXMaszsj4FUrTR3agtIZu3h3KRhZaWkqtL2pLoy0C/gl+oYZv1JI/1WCZeoFQui3LJFXTmU//GkNsLvQ0U65S9GAT+x+IbOYhzIzmx473M1AUYJvx4loXU21dESKO+w=
Received: from LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29b::5)
 by CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 07:59:53 +0000
Received: from LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
 ([fe80::53a5:42df:8e94:653]) by LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
 ([fe80::53a5:42df:8e94:653%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 07:59:53 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Thread-Topic: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Thread-Index: AQHa/Q4XKJkD+sDRvkWjAW3F64yJdg==
Date: Mon, 2 Sep 2024 07:59:53 +0000
Message-ID: <2937c8c073bab2694b8f55bec62898b02ef7a07e.camel@imgtec.com>
References: <20240902023300.1214753-1-ruanjinjie@huawei.com>
In-Reply-To: <20240902023300.1214753-1-ruanjinjie@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P265MB6026:EE_|CWLP265MB5209:EE_
x-ms-office365-filtering-correlation-id: e31f0eae-1383-4330-367e-08dccb253a59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UFkvMEpkdDlpeEdXSnhwclErcmlKcmhNTEEvdVRYSmlwYzBDcDNKdEppcXNs?=
 =?utf-8?B?VlMvdjdycjkrOS9qRzlma1BucnR3bERjb04xWXQ4eVJteG5pb2V4U0MwV1NV?=
 =?utf-8?B?cHg4MUpkN3RZT253QjI0SytlMlNJeUpVRkF4Y0RFUzNvY0ZhZ2Z0RmJ2MEpY?=
 =?utf-8?B?dHhMNllhQ09XdmQ0c1ZxNFN1eGtPRDY1bnNoSEUvQmdRSXAxT0lHbDdPZTk3?=
 =?utf-8?B?Tk42U3VraStCUjZib1ZQWWF5bjBXclViNE1kaWh1WVZwM250MFFhLzgxTUFV?=
 =?utf-8?B?elJaaVN1aVBMb1dqZFJnTTYwampVUDZLL2FaV1dLbzgvMlp4d3ZmQTRhRDBj?=
 =?utf-8?B?NnBhUnZieE8zemVsN3N0amF4WDJETnpDN282RmRjKzFhbGpxbURxM1VUSk11?=
 =?utf-8?B?Q1p3eC9BM0pDTXNrS1FXMjV1aDdXVEhWTEFRTGpYU0p4ZWtrZmI0VTZjSklI?=
 =?utf-8?B?NjAvcGV6SXJiOE1mSW5Sc1gvRGJmZi9vemI4bHdWUWdSYTdFYTRkZFlveTRh?=
 =?utf-8?B?R2Rqa1RTSm9jeTdSM2dvZTg1WUgraHFvYUx2QkpFRjBkRWpoYzdyS0dYUmxn?=
 =?utf-8?B?Mkc1Vjhkak95V1BDd245UEpjOVd5a0dPNktldlBxTnRMUk81WFBvbXZmMm5J?=
 =?utf-8?B?R3NQYUxYRGFPK3FWRFBEVlNYVmlUMGVmYU1nT1NXRGhtVW5NVnl4cGlDSDIz?=
 =?utf-8?B?NHBadS9RUkF3bWd3M01yUTdQelMrVHVHdnRMZEZuejlwWjMwQXUxWnBoTGFK?=
 =?utf-8?B?M2JqZHZHdHVrUlhSN1dITjV6bVI4Q0N2SUs3bTdaUXVlOHp5bnEwekluMkx4?=
 =?utf-8?B?KzhlQ25XNjlJNkFTVUZ6Wlh4Mmt4aFE1N3QxcXoyR2s1V2lVb2lzYW9uV1ds?=
 =?utf-8?B?dVFxT1NEdmJ3SWxoc2pzTVdvR1c0ZGVaQms0c3hmWXMybEtTRFRqUUFxeWsz?=
 =?utf-8?B?SzFqK1I3anpGTjVsd3lTR0JLaTRHV1JWZkNsKzdiMHFoMVpCUjc1THJuU1l1?=
 =?utf-8?B?UEJKc1g1bUlPZzZyWXA4SFRCZnVTNWVlMXRWYm83ZVhNQjMyZmd6ZW9xeWky?=
 =?utf-8?B?Mk5vUnh1U2dDdzIwbmMxNms3Q3B2b1FBN1ZvMTRjYUYreEkycDM3UkxWcFA1?=
 =?utf-8?B?VG8xdG1qMGUwUEgzb25zdk9nY002Z2U0NFhUL0JKdGNROVNqcFBuOUpNUE8y?=
 =?utf-8?B?R1NJdVpvaUFJZU14UkNLb2tCa2ZiTkQ2UlVpOGQ5V3llK2cxaWIzUGtzVktt?=
 =?utf-8?B?VnVQUXkzNkVtL3JhdDhCT05KaTlrdzdlMnp5YUE3Mjl1QjdpdkVManliazhy?=
 =?utf-8?B?ejVvc0t2YXJMR0xvbFAzZGZMYlV3blRUOVJyYTQzcWJjc0xLZ1d3Y2pIZ3Q4?=
 =?utf-8?B?b015M3JYN29USktYVjUvT21qNUFxaHI3eHFRNHpJRkZ3U3ZrQUF0eHczdGlS?=
 =?utf-8?B?Rkp1Y3A4QXpxYWVuSC9PTHhuZ2dKUzJrbHQ5NmZYL0NZRTMyUmhNWDhJSHBK?=
 =?utf-8?B?RE9RdGJSYWRHdkYwNjQwOU9EcEduUGZoTmM1bmFZRkZYbzZqbGhSTU56Rldm?=
 =?utf-8?B?ZFluem5LeFprYzVXM2dBeGVMa3BQb2dNaEVFNVVpYzg4RGdaNGtHaDF6SUNO?=
 =?utf-8?B?dGsrbEl4K1g4VHEzaWNDclBNd2pIVWs2dDFpdXM1c2dQbVRRamNLUHo3YitS?=
 =?utf-8?B?bjg4aEFVN1VQYlJ6aHBYc01pT0lWVTJGcnZiVTR6bzFOUC9EenZqOVYrTERx?=
 =?utf-8?B?bS9DMUo3cmZTck1vcEpvTUVXUmxucmZKazZiMjAvMHE5dUlybGhJcUgxQStK?=
 =?utf-8?B?YTVveE9XVXlVNkdYaVpmUFFXTlMyYmN4ZEh4TElIWXNxOUpUMkNObG9FV0hh?=
 =?utf-8?B?TEY0TGNFVlZ3QWRMdlVsRG5wVXVWbDVSS05waXBST2xab1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE9kYjc2TU9qaXpjeXNIV2R5NGx3WUc5UndRbU9YcmJlN3NLVjJNYlNRNVR5?=
 =?utf-8?B?Z2JOVmlxNDlDdVI3a2ZLc0FvanhaY0lvSVVvY09ablhWMExrbmRRS1Eya2ZN?=
 =?utf-8?B?SXliQ2g4Y0FyK1U2K1RTVEVjenFMRlo0MmNBU3p3QXR5K1dxWm1XL2xHcTRq?=
 =?utf-8?B?ZjBzeW9pTHhOWVhJZG5vbDhEWko0d2d4cGt4cTJUNVBDSXJzeHFoUjVtTXhi?=
 =?utf-8?B?ZTdja05iOHpRdjhkYitlU2tBSWk3dmNIWThSamlST2NVMjR6cmFhU3o3eHRp?=
 =?utf-8?B?TUFoVVJqMFo2QjNpQ2hzd211djlnWXU1Nkl0TXAwRTRIejY5WllaaE9YQVEw?=
 =?utf-8?B?N0d4L1NoZzVocUxKTEo1VmxKUVhMSzNUUFhXelZXVnplWWdXOGJUOHlFYjFW?=
 =?utf-8?B?d0RwQngyQWk5Ymh4M0RkbDVWNmNPUnVwUlY1U04yN0orTUlHazdpSVNIL1Ri?=
 =?utf-8?B?U29yL0hJTnFucTJvOER0K1grRVJuMk11SlZaa01LcDNZSGpiZjVSN1hUbTdT?=
 =?utf-8?B?dVBnbVVOTFFsdWp2ZlhKQlVUYWRmTlkxZW5IWUdIOXJlbjlqVWtJbUZ1alNJ?=
 =?utf-8?B?cUkyZ1dNWUFDdHlHNDVqRDNTZ2JpSUowWkt6SmU0UFJZQWpIQlU3Q2h5Um9K?=
 =?utf-8?B?bGROMWNRaFlTOHpRZzhZWHBhRloraklzNlBLQ2ZhaTRHb3dhNDRmQk1wQk5O?=
 =?utf-8?B?UFZJWjBPTVdvRWpyVXVwNkcxTDZMU3k0aXdJVTVTR045RGw3elZNMFNISnQ3?=
 =?utf-8?B?YzZaSjJWWFp3TFB2TDJuQytCS1VjR09JWmlOVWYrT3FTdE8vb0dvSXpuRHVj?=
 =?utf-8?B?Q1NiR0I4M3dPZ0RUS25PQjVwZXg1dG1QeXpCRTRUVkExWURKejZ2NmlsUG40?=
 =?utf-8?B?a1pKcUlCc2hpbFQ4RnFxeVRCN3pINnRBMU9JSUZSVXNrNWYyLysvcmNBNUZ0?=
 =?utf-8?B?U2xIRXZnNWZZajBKbENpaXhHdXBpSXNSRHBKdkkyc0lnSkJ3VmdWWnVod0JN?=
 =?utf-8?B?UUVVWGwyeGVzMnFPME1zdDBFa2RlaGdxeUdYeHd4NWVHUDdabXdUUGY5REVB?=
 =?utf-8?B?TmNPL0pSZCt6eFNHSkZoSHJaTTRoK0JWcTlvL0p4VERFbjFROGtwZFFUVEZN?=
 =?utf-8?B?UmN2M1dpNVdYcUV5ZlVXTUZyYk9uSEE3eEl4YlpxOTZadlBEenQyQnE4VTBz?=
 =?utf-8?B?cUx0NHZYYjJIc2JxWjhVdXE0WjR6RVZPZTIxRFdoNUNJdkJyd2ZQUmMzRk1s?=
 =?utf-8?B?Q2U4aU41TkdKa1F4V25pMnVibVgvSlVwOXd1Mk9tN3N4NUJVdk1BNWpzRU9X?=
 =?utf-8?B?dHhBKzB6WjI0aHNIVVVULzRZQmlBUC8xVmpSU3BFRWcwZ3BJMXBaUUc5VVhl?=
 =?utf-8?B?bEZzUE9YZGpYVTJmcEdLbmNGMTN0a01SRkhDb2lSa3ROOTFaYkdKd2pJTjhO?=
 =?utf-8?B?d2NUek5URXVLNkZFVXpqdGJYTC9SUTdTZ1d5MEIxaGEwWWhPa2lDSFhERHYv?=
 =?utf-8?B?NHpKK044b3c2d0lodjQwZFRuR2xUL0lIU3JvcnBOb2R1VWxkUGlncTc2WE5z?=
 =?utf-8?B?MGR6Y1VXR3lIZjJLU2dpVjZNMFFLbk9hSUJuSCtJWThXRE5mbkxzdjJMY1VI?=
 =?utf-8?B?V0llSWRuNFo0anVYaVFQOWpOOXZsM09YNjhERkl4UkJnbWdGdjkvQ0FSQld1?=
 =?utf-8?B?RlhLbHVnNXhWYW1tVGRXRUdCU1dJTytJeVptcHJCcTI1REF3MTNrT2JFWlN2?=
 =?utf-8?B?ZFVtMEdOdUNuUy9ySTdBWFJzeHRYbml3d09DbzRVSDdHV3EzdkVlQ0tWczFW?=
 =?utf-8?B?Y21adTU0dTNXRzc1bDhyKzlYWjJuTSthQ01OdU0vdks2VzlSdGMxTnpuVm9G?=
 =?utf-8?B?K3g1ekd3RUdwYkVoMVZCQkhRV2dkQldVdlRaY05ickczeWIxVHBXRjlEQzNE?=
 =?utf-8?B?ZDFiQlhuUVdZMmlJb0hOZXJPS1hjcEh2RlR5bzRPaWhCbTB0Q1U1dTdTZmZt?=
 =?utf-8?B?WlJYWUhzUU9UQ1hpcUlLak1rdklZUC9zeW9RT0hYN3NST3djR09IRW9aU1A5?=
 =?utf-8?B?REZTamR4YkgxRFcrY0tWamZmcjQ1a3R3UjAxY0tUMXVBL2RiWlIvellMdlZP?=
 =?utf-8?B?ck1VbGxIR0xaTEVlZGFIVnhyUXpEMDc2V21iRmRTbzAyV01ScERzdEt5eUtl?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3AE9CE65E002F4D9C3214720BC03242@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB6026.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e31f0eae-1383-4330-367e-08dccb253a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 07:59:53.2573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMyDGr2jdQGsVgI08EBC0dGWFfu+59k/b9JXSrQ7nN+09ZzXzSYcosdf5LPBLCBLNDIJaOP7WjLt5t4DohKteg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5209
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=aKOiqq9m c=1 sm=1 tr=0 ts=66d5707d cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=EaEq8P2WXUwA:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=i0EeH86SAAAA:8 a=ZpQeaflKfUfjsQx9vuIA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: TZG4bYa9pS59PNHhWqRJOCju7UfltWKS
X-Proofpoint-ORIG-GUID: TZG4bYa9pS59PNHhWqRJOCju7UfltWKS
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

T24gTW9uLCAyMDI0LTA5LTAyIGF0IDEwOjMzICswODAwLCBKaW5qaWUgUnVhbiB3cm90ZToNCj4g
U3dpdGNoaW5nIHRvIG1lbWR1cF91c2VyKCksIHdoaWNoIGNvbWJpbmVzIGttYWxsb2MoKSBhbmQg
Y29weV9mcm9tX3VzZXIoKSwNCj4gYW5kIGl0IGNhbiBzaW1wbGZ5IGNvZGUuDQo+IA0KDQpSZXZp
ZXdlZC1ieTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gU2lnbmVk
LW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4NCj4gU3VnZ2VzdGVk
LWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPg0K
PiAtLS0NCj4gdjI6DQo+IC0gQWRkIHN1Z2dlc3RlZC1ieS4NCj4gLSBTaW1wbGlmeSB0aGUgY29k
ZS4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2NvbnRleHQuYyB8
IDE4ICsrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl9jb250ZXh0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZy
X2NvbnRleHQuYw0KPiBpbmRleCBlZGVkNWU5NTVjYzAuLjk4MzI3ZjliYmQ5YyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jb250ZXh0LmMNCj4gQEAgLTY5LDI0ICs2
OSwxMiBAQCBwcm9jZXNzX3N0YXRpY19jb250ZXh0X3N0YXRlKHN0cnVjdCBwdnJfZGV2aWNlICpw
dnJfZGV2LCBjb25zdCBzdHJ1Y3QgcHZyX3N0cmVhbQ0KPiAgCXZvaWQgKnN0cmVhbTsNCj4gIAlp
bnQgZXJyOw0KPiAgDQo+IC0Jc3RyZWFtID0ga3phbGxvYyhzdHJlYW1fc2l6ZSwgR0ZQX0tFUk5F
TCk7DQo+IC0JaWYgKCFzdHJlYW0pDQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiAtDQo+IC0JaWYg
KGNvcHlfZnJvbV91c2VyKHN0cmVhbSwgdTY0X3RvX3VzZXJfcHRyKHN0cmVhbV91c2VyX3B0ciks
IHN0cmVhbV9zaXplKSkgew0KPiAtCQllcnIgPSAtRUZBVUxUOw0KPiAtCQlnb3RvIGVycl9mcmVl
Ow0KPiAtCX0NCj4gKwlzdHJlYW0gPSBtZW1kdXBfdXNlcih1NjRfdG9fdXNlcl9wdHIoc3RyZWFt
X3VzZXJfcHRyKSwgc3RyZWFtX3NpemUpOw0KPiArCWlmIChJU19FUlIoc3RyZWFtKSkNCj4gKwkJ
cmV0dXJuIFBUUl9FUlIoc3RyZWFtKTsNCj4gIA0KPiAgCWVyciA9IHB2cl9zdHJlYW1fcHJvY2Vz
cyhwdnJfZGV2LCBjbWRfZGVmcywgc3RyZWFtLCBzdHJlYW1fc2l6ZSwgZGVzdCk7DQo+IC0JaWYg
KGVycikNCj4gLQkJZ290byBlcnJfZnJlZTsNCj4gLQ0KPiAtCWtmcmVlKHN0cmVhbSk7DQo+IC0N
Cj4gLQlyZXR1cm4gMDsNCj4gIA0KPiAtZXJyX2ZyZWU6DQo+ICAJa2ZyZWUoc3RyZWFtKTsNCj4g
IA0KPiAgCXJldHVybiBlcnI7DQo=
