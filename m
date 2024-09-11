Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC3975765
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 17:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C0710E19E;
	Wed, 11 Sep 2024 15:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="aV3CDMDl";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="LHAkusia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FD410E19E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 15:43:15 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BE97iF025570;
 Wed, 11 Sep 2024 16:42:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=JMcVxzyx60Q2pBUVTJQoB9HgY
 FD7XVyQC21fhc6uRCY=; b=aV3CDMDlIggYC5qQyRdWZEqLOA7OgkiUhfmzgXT6Z
 6jxbnqs2K9gcpxR8kBeICL/c9QTVCgCgxGGysFntPM/d9hRx3JMgddsa1Bq1nLjs
 ghxoFmPR4iQh3SMDUzCoRaD9GVRe2Gi8SN/dIVE/R4RoIfkru9ncsi1mfw+vpsv5
 1k2ErzCLDKtQTo3Vna5d2vQbUYFP7jtPqZI0avFzjjibkgPaiO++xfRRJs/mYJ4N
 ELpBVD1hvxFw4FEl3YVoAs1oSNyVZo8vxjqLwU2oTO6nLejuITviPx1/2/Qnpc4e
 emG8KFOtOTaOh0vGwZZKDh8R/qMXfkofaGK+CfNpkrd7g==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 41gd3rayps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Sep 2024 16:42:54 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 11 Sep 2024 16:42:53 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.3) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Wed, 11 Sep 2024 16:42:53 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XS/n2/+E7C6E45K5LeGI8g2Cn/KLtyQT1EvN8CiysVZYdxMsspY2hKlLDD31vUWEvHFEk5ym/baF+9d2hLYXiSBDxk9KanwnnPeACaRA+wGoHDq0DAWuODuevxLfGWQ7m4DholhWcDpymeZnJfuKXBlsfCUO9uSkvETLkqEOOXZGpjApiN7Zr6kJreOyhgZ+pm6dQBStbuM1+KTsXF6Qj2Xjswa6Miov54cJYkGVgnozWO7oo+4HMI0006gOzm7b0dwJrJTMqCa7ZMpE4elHSikh3HLNq0UuTT71nt2iOzaUkMBDNSndGEnuiydTeUegCTNY5QIc30YoxE6NVhDs0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMcVxzyx60Q2pBUVTJQoB9HgYFD7XVyQC21fhc6uRCY=;
 b=Lu7O7yWtI8QzTZdGD/AKrWmu1jve2DG8w8XD+OfSOSjbxBO2khM+e9twEtJaPXr6HBWklIUjcIwQotoPRb8KhOFf81mu+ZgZ029iEbRu+kHimthgEoh9fOBqFgRKHDIGSvOZwsNOsuH4YaTOe/8WAqZuHfyv0Qi3G0E95RtIpcgjmfP1pXYSH9mDP/bHcel8hh4DUI1OSMOTJngx8vlZS2BbjiabIZZkzErKj6Jr25wKvN2zqctTr4wsEyssM7Dmb6juGNlKBjTZFwMxOvhmuqIvUUE+QjNT1dqiGeWv/JN5PNxKqAK5BAXgMQY21NZmsKIuG4MzGU7fXm4hWfAvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMcVxzyx60Q2pBUVTJQoB9HgYFD7XVyQC21fhc6uRCY=;
 b=LHAkusiaVQAW3Gds28Y6mcdx8nIh/m9WmUhAbObedsO/9WbccmMAFBCbtYoiVtctlKi5Lo1xyEWnWo3yW/DJcc5JnR+FLIQG47NrmvHSP7L0QUFkC/aSvwQO4BJCItg1vQnQGL7u7AomFPKI0Ru3s4tkhzYncwqJVA93gOXz6aU=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB6740.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ee::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Wed, 11 Sep 2024 15:42:50 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 15:42:48 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] drm/imagination: Add a per-file PVR context list
Thread-Topic: [PATCH 1/2] drm/imagination: Add a per-file PVR context list
Thread-Index: AQHbBGFAoIxYip2DjkenFFxtsnCiZQ==
Date: Wed, 11 Sep 2024 15:42:48 +0000
Message-ID: <c6846114-7dae-417d-82d3-7471eb98ed19@imgtec.com>
References: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
In-Reply-To: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB6740:EE_
x-ms-office365-filtering-correlation-id: 69641342-4363-4da0-0932-08dcd2786363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MVJQTzkyMUpsRVU0VG9RVFRsQ3BtU0ZHbkkxb0U0dERTcnJWWGZIM2dVZFBJ?=
 =?utf-8?B?dEppNmoxWEgvd2Z2dWQ1VXI5OS9ZQ2p4S0tZZ0RLT0VYSlZjRyszbEhXTmoz?=
 =?utf-8?B?SDN0N2lVNjBnYkUxUG4wMm9Id2h6eEVtUkRkMjhVZC9jT0g4RGZ5aE51aWta?=
 =?utf-8?B?TWh0dTBBWUxhSHY3NDJlYVZXRTFENUxWZ20wa2dxSTFReEloaTZEa0lQckUw?=
 =?utf-8?B?L2l4ZnpwVUZqWWZ3ODZ2Q3Z5STdWUlZWRmNuRDlOODVlTUZ1UTM3T0M5T05p?=
 =?utf-8?B?a2VBTzBlVlMzVjJtMmdNUEFUWkhCQXZscGROYnVvQ1lVSTEyM1NrTEN3cDZl?=
 =?utf-8?B?U1lFL2xHY09yWlZKSmthcytTOVdEZzkvTFo1dERGdnRiUnpiNlZmaWk0eGYw?=
 =?utf-8?B?THN6NW15U2QwdlNCUkdZWTZsZldSZEVxclYwcmNtZXJZWmw4dHZFYVA2WFFK?=
 =?utf-8?B?bUhueUl5aVVqY2lZYlFPUE1xQ3NSTDhEWnBPbGVELzJvYUFIY0hZODgwQzVS?=
 =?utf-8?B?NFZtMWxHRkJCTS81c3FtNXFTM0hGZHRjcFMxRy9LV3l3Mnc5TzVFb280R0Nq?=
 =?utf-8?B?NE1ENm1OL3BEOWpmN1VobmVzZ3JFZ2g4U3JMS01ZV1l1VVhsb08zbllwWDRG?=
 =?utf-8?B?ZUZ2SmF0alZoK2hTQXM5ZldKb2FlZ2p3NTZjNU1iWGFETHJLeDBDRlg0elYz?=
 =?utf-8?B?WExuWFBqQXJCZFlHTHJ6ZExPSG5PZ1dzckI4NkpOcGdNRUZmZHYyUWNDSWFL?=
 =?utf-8?B?NFRtTTVYOFhndnlNcm5qUW1QaVRCYUE3RnBWamd0akJoWFBiMndiMGF4Qmdx?=
 =?utf-8?B?dk5GTFJ2Z3VxZ0dsTHB4cDZtenM5aG1ZWFBkK2hCWXhCQVJNa1U3dk0wQ25y?=
 =?utf-8?B?alBlN0VWK3BIQ3FCUEEycStReVF4QWxuMWhwUzROMU9ZeFlweE5ocjdjVEQx?=
 =?utf-8?B?T2xMWVU1TXNLYzZQQUNlYmQyUTRFSVFhVnpmZ1JiQ1c3eC9zaU50Z0Jrb3B2?=
 =?utf-8?B?UGpnZEVqY0NpV2d1VHVYNnlIMEVIeDl4UVkydGFpL0s5cURheUltMzZtRDdr?=
 =?utf-8?B?Z25hK25IdTF3WXRic2V0a0dqNjRWTGtrQS82QTV1OUxrcnNnUHlKSzNZNEkx?=
 =?utf-8?B?WmJIRk0yWXRncDZ5d2VPOHUzeHR1RkVWNXFBakRBVjVkWFF3TGw0ZXhPRklG?=
 =?utf-8?B?cTd5bzBSeDVvYmxKTGtreDdHUjc3aUkvVzlyTFI1NFNZNGNDbittdWFnZ2pu?=
 =?utf-8?B?bmhFaDlDNDc5Z1puQXVQVm1KWGJBUUtPV2JlL3Byd2FPd1RsdU9qbEREVVZN?=
 =?utf-8?B?QUlSQVVBTWQ0QlZpaDhnV0VMWlFyTVhtQ3o3S09URFJRSG9pN29zQXp1L2xW?=
 =?utf-8?B?dEZGREZrUEoyMGRZV1BnTWRSaEZrNUd3RHc4WnFWRTdZN2ZCNVQ2Q0lMY1Ju?=
 =?utf-8?B?UkRDTjc0QkJOREx3cUJUVktkcmg1bGlUTnV6eVBWQ1B0bzh6Wm1zZk9FT2w3?=
 =?utf-8?B?WG5ERFYzSkRSMnVDWWRDKy8xM05wNEVRTlZOaEJTRC9PNG1keWFZSXhCVTNY?=
 =?utf-8?B?eDRDMURTclhPL0dtMCs4VTlkQWVnNlVhNXh1Y3RPZldNeTNBZE1KbStVbGF2?=
 =?utf-8?B?RzBUTkwyZG5wQkszQmZUZFdzZ0w3ZG1OS3lUWkpxVW9BYVFmYzhaa0lwUXBq?=
 =?utf-8?B?d3RFMzVyYnpJMHRzVG5aR2wvMHVCai8xNXYzRnNOQTdFdGZUbjJsTTgyWUxr?=
 =?utf-8?B?bS9xa1pPeVJqR2czZnRRVCtSeE9hV1pVTE5kSHgzYnp1U0tXNnkzVVpSMHQw?=
 =?utf-8?B?VWdyTHRrRWM0ZmYvQ3czQVFFK25JSHhOczlKZ3Z3d3Z4eTVLTXRubXlnUk14?=
 =?utf-8?B?RnNOR1diSFFuWENXYXZaN1REWUQ1VkZvOFc1dTVrbEZHTEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0xDSCttZTAyVkY4N25CcWFWNXRyeTRpbDFSUmlQYlpNNWFwcE9ad3hUZ3NJ?=
 =?utf-8?B?clNhcW9HekVuVjFSUmZxSlVOaC93alhuVVZhR1VHaHQ0L3lxRFVlZlEwcjd2?=
 =?utf-8?B?WHQ0disxOGdVNE02K2ROTHlzV2ZUUkY3SkhJVW5aK28xTUxpS0FJNE9iVmJK?=
 =?utf-8?B?Z3NiZkV4SDh5MjJDclROeGllNE5JM0Vqb3JIU2lZT1RzVHFtQmpiQ0R4T1R1?=
 =?utf-8?B?eTJ4M1VVMFc1WDhhMk5COUo4VlcvbiswQXZUdUZPeGVxeGJDZTQvTzZBV2U1?=
 =?utf-8?B?blRLMEZsTFZOaUV2blhZbit4SndTZXkzTVdVWjFaK3MxMllUckx3eDdRUmNa?=
 =?utf-8?B?OTl0eHFBV1hqZjlQTEQ2Q3I3L200dWxLT3lyaklIa2N3RG1EME10MDhSaERN?=
 =?utf-8?B?Zm9mQmRWcWtNNnlBcnJkc1dlZkxYUUU4UFA4KzBBSjFaa2FWR2VTOGUwdnpM?=
 =?utf-8?B?YlBTTGdWbFhWNVBKZkVjWVdhM0xYcTh2RkFTcUo1YnQ5QVBhNFZQNGQ2MmxS?=
 =?utf-8?B?VGV6M01vaVkyaGFUeUp4M0dleGFFNEVDOUgyNVFCcFFkSE1lbHNLeFFHS1ls?=
 =?utf-8?B?QVFHaVVlK21OeGlxTGp6ZEQydTBSWkdmK1FCa1UrelpPakpmT0d4WTd5NHpH?=
 =?utf-8?B?Wm15Q0NVcFlwOTRnWDlnZGZCcU1uUC8rZXVrbHF5TUNjNUd0R3JxaXZUL3Y4?=
 =?utf-8?B?dlZYdGRtTHdEN0ZRUlNUbWN2UDc2T0Rwd05FOTNEbk56TS84cjAyL25vdTh0?=
 =?utf-8?B?S2Ruc2pxK0hIK1ZyUW02UnZrVC95S1Rka2dYd2NpYTJHSDdHM1JmT1AydDhK?=
 =?utf-8?B?MzVCTTRaRjl6Ym96QStzKytoMU9zQjF2UWNrQzBoSU1sK0ZyZ3dTRGtXSXp1?=
 =?utf-8?B?MnUzNVhLbHEvNjJxUUNraysvWkdrRzIzSFZ6dWJaaXlYWGFSODB6TzlzU2Zx?=
 =?utf-8?B?MDFoZktiYnVOTDdRUGxXVTM2YlNzajN2cEtYTTZLejFNNW5uMGIyTXkxN3RW?=
 =?utf-8?B?dTFxcDlGYTFNajROdGwyOU1Kd1hKRnAxRlAyWFNNWTlJOXRtckJKR25jRklR?=
 =?utf-8?B?RlE4TjZsUmlhYTFGSm56R2x0Zm5jcFQ5WWIzSWUxUzRjRnROOTlma2dpMnVa?=
 =?utf-8?B?NTFnMjM4OGh5QTVsNTJ0M2ZKalQ2TUViaEZLS2Q1TXRSRTJUa1ZkU3JwUEdo?=
 =?utf-8?B?T0M4UDB6cjZpSmpmbHltdFhaTWJyb2J5cFdrUnpyQlBBeHdjdnJhMlU5RzdQ?=
 =?utf-8?B?N3Z2OHQ4bW1oQkFIclh4TXI2SjEzbXNEbFN0bUJnSTdSd0xrenBpQlAyTEI0?=
 =?utf-8?B?MHc4TFN5S3NYZ1ZGU3dmeDUvZXFmL3o5a2lSU0IvdlphS3dlelVEdVp5UUdF?=
 =?utf-8?B?SFNlRkExOVR0dGpnVU5hdnhFZ2Yyd2dHODNJZHFzQmZEVlZuUnptTzNoYjND?=
 =?utf-8?B?OVRPOWRsb0FmcnM4a29ZQWx3Vk53aGtNUmJuVHhjK1BzQkY5dk1VTmtIUDlL?=
 =?utf-8?B?bEoza002emt6T3hOQXhpdUtGaDVwa1cvMlRmdU9xeWxpUFoxRnJMdmR2N2tL?=
 =?utf-8?B?cmRSWGJPcTNKTFZ1L29wUzlkUjZPNEdXVno5YVNrUEhwaHRkVnhYbEpaQ0tz?=
 =?utf-8?B?MHRhWlkxRjEweHdSNlBQeE9XYlJyMVJ6MkJsWERBVE9DZWhDSENGUktEQkF0?=
 =?utf-8?B?S3JFSFBLc3RVbDhsYU1nR3pIWEN2Q2ZWVW9iK0NBMFViK3U3NVVvY0JJQ0Fm?=
 =?utf-8?B?SFBVV3NHbHNHditockdMNkFRTGlZcmZvMTBTUnFkbXFmUTFGbGVReklONmlI?=
 =?utf-8?B?Z0ZsYTZxaW9LOG9FdUhaV1JUSitvOUNvWnluNTNDSGxrRTBKUUdnSDdCNE5v?=
 =?utf-8?B?QzM4aWV1cDhrc1VpaGk2VUo4VnpVSzM1cncwVUhYWWI5L0F1cXVxWVEyNFdy?=
 =?utf-8?B?V3NMM0hPMmt3UlJwT0k0ZDVac0pMaG5XaHozdDN3RzZVdUQ5dWh3U0prNlFF?=
 =?utf-8?B?eFhUN2cwZ1JKSWV4ck9WdlMzemJhVkgxS2VCV2ZQdjhwWUNHRjJabjVySHdn?=
 =?utf-8?B?dnFzVTNKdHo2Z05qeHFEWE9peXFMVEJDc09zL0pwRUJUQ2hsQ2ZPTmlyVDh6?=
 =?utf-8?B?NW9xcmExZkM4ejBzalk0MXJuRFh4Y3RtYXFCZkYzQVV4V2JxYkdoTU00M3Ir?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OYfUPh0jWmIj0JRoaqGrm6ap"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69641342-4363-4da0-0932-08dcd2786363
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 15:42:48.5088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gjMES48MerUYJpcYj/g47PnXLwIxR0EiTsuHpzl79sZiU3yhOd7ejvurwrHffCacdJm1IqHmu5WLZSrr4daTXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6740
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: fCGDCMMu6LB7_1lAOPeeVmOzUx_y-37s
X-Proofpoint-ORIG-GUID: fCGDCMMu6LB7_1lAOPeeVmOzUx_y-37s
X-Authority-Analysis: v=2.4 cv=GIVaEfNK c=1 sm=1 tr=0 ts=66e1ba7f cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=zfBPz-HDHTuPlw-aen4A:9 a=QEXdDO2ut3YA:10
 a=L3WQYlS-Qr307JIZeJIA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------OYfUPh0jWmIj0JRoaqGrm6ap
Content-Type: multipart/mixed; boundary="------------faqRx6rbP7b8Fqr07ZIsM0Jb";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <c6846114-7dae-417d-82d3-7471eb98ed19@imgtec.com>
Subject: [PATCH 1/2] drm/imagination: Add a per-file PVR context list
References: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
In-Reply-To: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>

--------------faqRx6rbP7b8Fqr07ZIsM0Jb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Brendan King <brendan.king@imgtec.com>

This is in preparation for the next commit, which makes use of the list.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/imagination/pvr_context.c | 14 ++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h |  3 +++
 drivers/gpu/drm/imagination/pvr_device.h  | 10 ++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c     |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/=
imagination/pvr_context.c
index eded5e955cc0..255c93582734 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -17,10 +17,14 @@
=20
 #include <drm/drm_auth.h>
 #include <drm/drm_managed.h>
+
+#include <linux/bug.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
@@ -354,6 +358,10 @@ int pvr_context_create(struct pvr_file *pvr_file, st=
ruct drm_pvr_ioctl_create_co
 		return err;
 	}
=20
+	spin_lock(&pvr_dev->ctx_list_lock);
+	list_add_tail(&ctx->file_link, &pvr_file->contexts);
+	spin_unlock(&pvr_dev->ctx_list_lock);
+
 	return 0;
=20
 err_destroy_fw_obj:
@@ -380,6 +388,11 @@ pvr_context_release(struct kref *ref_count)
 		container_of(ref_count, struct pvr_context, ref_count);
 	struct pvr_device *pvr_dev =3D ctx->pvr_dev;
=20
+	WARN_ON(in_interrupt());
+	spin_lock(&pvr_dev->ctx_list_lock);
+	list_del(&ctx->file_link);
+	spin_unlock(&pvr_dev->ctx_list_lock);
+
 	xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
 	pvr_context_destroy_queues(ctx);
 	pvr_fw_object_destroy(ctx->fw_obj);
@@ -451,6 +464,7 @@ void pvr_destroy_contexts_for_file(struct pvr_file *p=
vr_file)
 void pvr_context_device_init(struct pvr_device *pvr_dev)
 {
 	xa_init_flags(&pvr_dev->ctx_ids, XA_FLAGS_ALLOC1);
+	spin_lock_init(&pvr_dev->ctx_list_lock);
 }
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/=
imagination/pvr_context.h
index 0c7b97dfa6ba..a5b0a82a54a1 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -85,6 +85,9 @@ struct pvr_context {
 		/** @compute: Transfer queue. */
 		struct pvr_queue *transfer;
 	} queues;
+
+	/** @file_link: pvr_file PVR context list link. */
+	struct list_head file_link;
 };
=20
 static __always_inline struct pvr_queue *
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
index ecdd5767d8ef..b1fbf9ccf19f 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
+#include <linux/spinlock_types.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -293,6 +294,12 @@ struct pvr_device {
=20
 	/** @sched_wq: Workqueue for schedulers. */
 	struct workqueue_struct *sched_wq;
+
+	/**
+	 * @ctx_list_lock: Lock to be held when accessing the context list in
+	 *  struct pvr_file.
+	 */
+	spinlock_t ctx_list_lock;
 };
=20
 /**
@@ -344,6 +351,9 @@ struct pvr_file {
 	 * This array is used to allocate handles returned to userspace.
 	 */
 	struct xarray vm_ctx_handles;
+
+	/** @contexts: PVR context list. */
+	struct list_head contexts;
 };
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
index 1a0cb7aa9cea..fb17196e05f4 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -28,6 +28,7 @@
 #include <linux/export.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -1326,6 +1327,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, str=
uct drm_file *file)
 	 */
 	pvr_file->pvr_dev =3D pvr_dev;
=20
+	INIT_LIST_HEAD(&pvr_file->contexts);
+
 	xa_init_flags(&pvr_file->ctx_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->free_list_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->hwrt_handles, XA_FLAGS_ALLOC1);
--=20
2.46.0




--------------faqRx6rbP7b8Fqr07ZIsM0Jb--

--------------OYfUPh0jWmIj0JRoaqGrm6ap
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZuG6eAUDAAAAAAAKCRB5vBnz2d5qsO7f
AQCZmBPLctv2cbAxdwWZi1Mfw4FrBmSyJ9Fm7zZPgfDWxQEAx5Are9VceVf+ONv7gLNNbRniAihE
KuE8Kh8cDHU2HA4=
=j6xC
-----END PGP SIGNATURE-----

--------------OYfUPh0jWmIj0JRoaqGrm6ap--
