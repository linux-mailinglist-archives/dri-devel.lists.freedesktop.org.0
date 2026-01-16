Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A8D2F38B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3C510E84B;
	Fri, 16 Jan 2026 10:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="pQvdRkEP";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ij/v0Sgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646BE10E84D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:04:17 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G3QaJN2652121; Fri, 16 Jan 2026 10:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=NgH9dJLrZODQiGj1+8v75/TIx
 ZAcjHAYu392LWXglzg=; b=pQvdRkEP1chmE7CpdbJZUj46aLJUO350XsvaOorLF
 PgoXv2Y/ay0sH56yE2FfkQjeEEJCHQgvYquLkEPatNjDcfh1bDhP/adC2HNwrm82
 JTibfp5CNuEaX/bV+6IQ5vAJaWnvU8Ni8q/vT7VvZvLZ4NfQUDXiNarwFxbru2ay
 p5kg8ZKtLY5J9tvZPLQcWFw+kdmbZiAFO2UAtq7PdkAkjGWaMyQc0ZG1P0GhBg/5
 XhJCnqxwvpd//9VTBGYHXSGMC0OXaRXdqzkknNT4EIW9W1km63Irw76qg8bFaIL2
 3sOQUu2mYsOvWW3rehRdeKaHy+lfBDhipVkVBucoCfNbw==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021125.outbound.protection.outlook.com [52.101.100.125])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bqdbhr663-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 16 Jan 2026 10:04:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX5YAJJFXvPVZpLNvEy7L4+s2SAuC0eBRE5Jif7iTLalGWLRODENJMw07GV3ooEV8qfbME2Mp8aRJ5sNDBs4EQoqQk7uhpP1AcevWSBSm37xikSOw+Lc0WcW7cKRb/jXjOPJKYUrHLOxufi2wpj7jInwGNzbLrpmur1t1vE6wGJLgAwrcPqLMN4Qu9pnhQl1uQZYZkFg8qu1bkBBWc2Evb339Yzq5WGmOTwzb8+Vi+RrTBXlATHFZ5y8RN4SDdDIkFIfLZCJkjKQF31Mb8fA2BO0x9+PHZ7Jqcz4s9GNfDoOGJcNxdo3hwTA02R2CiYbdDMJVUjaF5DAGx8BmSzUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgH9dJLrZODQiGj1+8v75/TIxZAcjHAYu392LWXglzg=;
 b=EBH/bpth+XyVWlBg4RKlqqilEp4yFtQSYQHOhCw21uuqTS2jFhKy/eAdtEwkm7EyG8HqdX06Oup0X3TwEVJT1U68DL3eQyi5CenNVD/qkRUu2gho/dn8690J8pMXIyPocTMgqWDEbiUTqYwfIGRwrwJJticurB1ML6nnC6VI2bwqWpOBjG/+v2pJh8TshryitSAaCuBk2Y3Hb3pA3FoGEAvpUKkLGh2p3ICETSYQiZy14mVJrkRHPMRN5p8geTpP+4CVLSty9UHnmdAh4aRJKGqZ8s3v7NiA3oI6aJ4+rbDmQDkt+gbIqqKn5miOWjuHqLAN+sxRuCY0BJZLTIvk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgH9dJLrZODQiGj1+8v75/TIxZAcjHAYu392LWXglzg=;
 b=ij/v0Sghq9DapRgTlO4JToJBvvXea8uO8blyyyC2f7PnUEukI46Frtipa87KcJF8XCuns+6hm3O/Q1qa92zpiyVZFb+6Vud4GMqZeEuiV4fv1XFbLbYfiBwqJFIO0jSbsuBYc4pm+wFJX89RJbFWdS57j+2nLMdj8Tq86B35Mk4=
Received: from LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1c9::10)
 by CWXP265MB2182.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 10:03:56 +0000
Received: from LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc84:1ac:e5be:2ea4]) by LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc84:1ac:e5be:2ea4%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 10:03:55 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Binns
 <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Wait for FW trace update command
 completion
Thread-Topic: [PATCH] drm/imagination: Wait for FW trace update command
 completion
Thread-Index: AQHcgFTRiF93qz0XEkm7YVdwXgj1kbVUni+A
Date: Fri, 16 Jan 2026 10:03:55 +0000
Message-ID: <21719805-0c85-45e4-be33-c9d3851ebf1d@imgtec.com>
References: <20260108040936.129769-1-brajesh.gupta@imgtec.com>
In-Reply-To: <20260108040936.129769-1-brajesh.gupta@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P265MB3823:EE_|CWXP265MB2182:EE_
x-ms-office365-filtering-correlation-id: 51f62c43-beb7-4b35-837c-08de54e68f63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?T0N6OXkyRnZZaUVkODJaYzhLNFRHSnlmL080NkQ4SXFZNzN3UmNYV0lmaGVW?=
 =?utf-8?B?emc2dXFEa1RXSE9FcFNuMGRaNHNsK0hrSzdaTlVVcVVXVnhVRGlwUHk5N1lC?=
 =?utf-8?B?NmYxR0R1bCs5ZngwRHd2N0RQMUhZNk1UcUErWmZpcFJEc1JmQVNPZnV5UU02?=
 =?utf-8?B?L1JKdGxSQVdlL2dVOGZua0VQTmdjSG1DTGk0ck1OUEYyMktmdHg0L0ZYNnl6?=
 =?utf-8?B?bzI0M1RqTWFISFE4ZUJVRktJZ0tYZTZRbit0SUFnc2RHSjF1cW92UmZzV2Nu?=
 =?utf-8?B?eTNqUjFHaTNncU5LaVJCbmRheG1MQ3cxRHNoZEVyYlhQRUF2M0dvMzVmUk1p?=
 =?utf-8?B?L3d0OHl6ZGQ4ZUp6TFFBa3FrekR6N1ZJRVZUT0tUK3JseFhXTDB0SlUveERK?=
 =?utf-8?B?RmJMeVRVVHVsL2Z6aXo4WTB6NkppR3plS1pSaVNiMXlKL3c3bnNMRzNWR0s3?=
 =?utf-8?B?aVNJZldHZHlYbDVKV0hIbGk4bGVRc1VCOFRmSFU0MWE1QkcyQjBRdHBzVm0w?=
 =?utf-8?B?VXQ4S3ZRTlhZZXM2OTdVK0cyaU9uL3dPSEJiVVhxMUZEVTV1RzRZdENYWE8y?=
 =?utf-8?B?MkpjcndDMFdKWi9aTnZ6cklRUHpjQXVtUXIyNG0zYStDR3Z2RklxV1FVYVVJ?=
 =?utf-8?B?NGJSWmgvSmZYak1uNllxaEZ5MUdockVZcGZ5VlpTOS9UYUw3YWdnYk43dXlQ?=
 =?utf-8?B?SDdkeVpmd3UwMlI4Q2ZUdUFENS9sTkhJbm42ZGNTUzF6aEZyRDBOTXdULzBY?=
 =?utf-8?B?RHhOaXVQT29CQ09BM0dpYnNnTldRREJzMzJ1VG9RdUF4M3RuZFNTMXhPd2g2?=
 =?utf-8?B?WFZWQUIrWHhwTXcwS25FMjlkYmtqYmtLdVRmbEdpalcvY3JiM0JDSkJCUGgv?=
 =?utf-8?B?NDJsTm4rMnRTdkcwdGJMWUIwRm1XVzJqWnNEWE9EOHBlUkZzZlpCOXpGcDFj?=
 =?utf-8?B?SHFRT2NpSWtrWWZWVkk2SjJBdDFMQ0VZV1pGZllKeUFDeVpXUGZMM2ZvZXJX?=
 =?utf-8?B?SXI4UjlQSTRLR0czd0VvbnVPYzhOeVVSTFZJcVY4eC9RUDlRQmFSMzErYTE2?=
 =?utf-8?B?NUN4OUFLSXBZTHVqR3VIQVhXeHBpM3FyVHI0dHdtdGpaRnRVbFl6UTYzKzlQ?=
 =?utf-8?B?ZE53L1FFazhyY3g2aU92b294azJkeUk3LzZXaFR6a3VTeVF6dTBrbEZaajFn?=
 =?utf-8?B?c0Z5OGZESjZqc0FPTTNybUtudWVTNXVDODA5UVd1TnNZUnNnOXg2a2xHSllz?=
 =?utf-8?B?dnVLZlUzUkFPWVVndTZNTFpKQzlXenlxVE5EZHVLSE16ZkZJclpFY1V5TlVK?=
 =?utf-8?B?OEVBUEtXcWdXZG85cjREWUZaMTRDRU5temc4cCtPcGRDZHk0N3FieEhmN0p2?=
 =?utf-8?B?aVFZcjZUUlR5b1Y3bHRHcUJSTngzZmQ2Tkk5eXlTM1VXZTM5OHdvcjBQa2NZ?=
 =?utf-8?B?RVpKWDhQNGtnaWMvakdweHoyL3o3QldGc2Vrd0RNeUMyaVpCTDNORzRvVjU0?=
 =?utf-8?B?Nm9qMFNoa3RBQXZoc1pRVmtBZm9GQ3VUSWpmMU5NVElVMjIxM3lYRkhCZkJu?=
 =?utf-8?B?alJZTklCVWZNTmQ3UTNITnBxR2swb09XME9hblFEczNoSFIvRDBBY2tMVHh3?=
 =?utf-8?B?SVl1YllGNUw4T0RCL0FLOTNlS3cvT1hIVUZZOC93ZW1nU0o2UTBNZUszVTRj?=
 =?utf-8?B?WjJxM1I4anVQSmtiMVljRkMxV21OelVwajUzcHZ1bUgxUkdJWG42RXNyakVP?=
 =?utf-8?B?dHZNL3VDRkpLeS94RDZFclIxN2NkU3ZZU2UyVG8wS0RSLzBBYkVFYWhWeXBL?=
 =?utf-8?B?RVRSRnB0UGkwdWk3ZVpvK3dLQVQxU1VkTGllQXhOQ1owOG9EckVKalRKdm5E?=
 =?utf-8?B?QWhlZFdhanlPTXlSTjRrZHZhcVA1b0hiSms5V3grNW1mbFU4N0tuVGxMdXZU?=
 =?utf-8?B?QjgvbEsxTTM1NG5MVzZjdVpxQmdvdTUrWTlDbzRsMzRHaG1RWXlsbUUyT3FB?=
 =?utf-8?B?R3Bpc2phTnNTS2NOcXgzTHpqSC8rb2hmWWVONGdmTkxQSHcyK1I5Z0gwOTFq?=
 =?utf-8?B?ZnlLQ0VGbW0yTktFSEY0Yzd4Q3FPVW83KzJTZTFTZnYvU3lQQ05ZRnVuTTBG?=
 =?utf-8?B?bHVXcTNLb2ZEbG83Q2t2U0lneFNmekdIZUtZb0J5MnlxeEhSZGdaOVBNcExF?=
 =?utf-8?Q?ueAZCWpLxEz54k9L76woJIw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUdON1RPcU1vbkNtT3o0dVJaaHYwQzZ6amU2aDNPeGE1ZFZYaGIxUE9EVVh3?=
 =?utf-8?B?WFBJckVXQW9OdVpBOHpKakt1WWpzS1dkdHk2aHplQmdrYUdSaUhzczJHRHdW?=
 =?utf-8?B?UStuTmdlYzFmTmMzR2tGc0tiQjVpYjZZeVJFSmtLSHdtaFB4UkRIaFlxS28v?=
 =?utf-8?B?QnFTSUN4NUl1T3pNbU8rZExlMno4aEJScGdLbXdBNnRTUm1iMWJmVFRKaDJG?=
 =?utf-8?B?L3VJOXN6TndKWEw4a2JDUEpZK1JhSlQrYXc0elNsMnpOblNjbUpHNVdyZXNx?=
 =?utf-8?B?YktvNHZUNkllYzVEbEJBUXRCN2VPeWNLNWdlaUlKKzEzTTNGdjVrQ2FsOXZr?=
 =?utf-8?B?eTAzVXNVVDlOSzN5eGdOaWt4ck5aKzNrcFJIeWhTTWNJM1Joc0tnZkI0N0Rp?=
 =?utf-8?B?cTVSZ0FxeUlGaGFmbU50NGxGZW4rUzZKcXdJcDFNNllKNXFlb2hrMllwcm5B?=
 =?utf-8?B?Wm93Vis1T09ORWZ3MEdJVHJrVUs1c3dHNVdVaFhvM0xlQ1JyUFhJWnFFQ2xZ?=
 =?utf-8?B?OVFIWEJUSTZ4WktvajJOWkFZLzJWLzhxRUVzYVNUd1FobURyMW0waCt2dlFp?=
 =?utf-8?B?bGl4OUpMaVorQ1Iyd0twMzl1ZitOc0ptdTBSTkY2Q21TRElZT2wzUWk3Tkpk?=
 =?utf-8?B?Sno3RiswZjd3VE52bFBSQ3lhUWRxeUwxbXBTSHFBVGpkUGpjY05iTVRTRmFL?=
 =?utf-8?B?MTBDOXhMa3JFQTdVaUgvY3JnR3NiL0c5akVSY2k3QURHUEs5emU3OERNS0sr?=
 =?utf-8?B?SXlBVm9LbHdGU29UbUQ1QWFYcm45NERwblJYUDlpd2ZlZ1JlYm5Pa1dLNVhG?=
 =?utf-8?B?MDNROW4wVWFzZEMxdFhpbFF2OGxOdlpjLzdRTi92M1FpRkh1Nmloc0wxOHFz?=
 =?utf-8?B?VSs2b1VtY0p2bFdVTUQ1VFVod0cyaFZyZzdzQVptbllpUUszOWhCbldYOTZs?=
 =?utf-8?B?Vm1LVjhhZ2RYUVlpRmdNZ0tiRks4cHdYTVVQYUdVcHhLVzVHcEcxTDJvSVh1?=
 =?utf-8?B?OU9Wa3FGd0dEUy9tN2UzazA0bGtzNnhUcmZGQ3R2a3dyQlp4dkwxWnNKcENJ?=
 =?utf-8?B?WngvN2FDdERSM3pSSGhYYkMrOXpLTWdCNzhFd2xLd2lKdGFiN3lRcW1seE9y?=
 =?utf-8?B?SW1oNzdxelRvSjMwWEpINDhyZWRUS09iQzdscE1qZFdkZmFTU3czVUxEWFEz?=
 =?utf-8?B?L3FIZ04ydEZwbDV1bFVQS044VDJsTS9INktCRHkrMC9ZTC9XeDdPSlRnTCtR?=
 =?utf-8?B?WlRNQVlpalhaMHdmZGJGMktEZm9DSnpMaFlNWkJaV3Z6aXhBbmxaa3AzQjJO?=
 =?utf-8?B?RkIwdXdlemNkdnFPMy9SUmIzaG05Ymt5SmdGMmVVbkNsUjZFTllwS1Mza0ZU?=
 =?utf-8?B?cTlndUlGL2dEVUhKR1o3RHhKT2MzaUNJRThqaU1XZ25JTTV5K0NLSXBkSDV3?=
 =?utf-8?B?ekNkRmZHN3RGTVRaT1k2QUkxVHl4eFdpZ0M4MWpZSzB3TFZsMmtBZlp6cmlT?=
 =?utf-8?B?SVk4NnJuQVh6ZnJMMjk0d0dId1o2T2E1aVdHS3dUNTUwa2VReHpVcDNNbmVT?=
 =?utf-8?B?aGdSSmNKVEExUkVsc0NjdkdMdDN4bE8rbE9TMHZveHJzVHoweG5FMXVXNytx?=
 =?utf-8?B?bW1haElmWEdrcmZMNjhyZ1NTWWw5UGtVOHJtV0dCM3NvTGcyd1B0M3A0T1h2?=
 =?utf-8?B?ajNUa0ExREpIdlo3RW5UZlZNNlAzMkI2dTJ2UEVBWjY3dURQNWxUaXRRbVBL?=
 =?utf-8?B?SWRYM1NKUkpVYnVReC9tTnNWc2daVzE3Y3EvMkVWVkpET1VyVEVSYVptL1dy?=
 =?utf-8?B?WlhvMlhNUTFtQVpZQ0tBYlAxZmZqd0dsVFlCUmhvZG56OUVCeEtING9hN2dF?=
 =?utf-8?B?K1FrUExBZHNNOHR0b2twbDE1cGhRZG4wSmExdng0S3FrMlVTUmhreWVXQ1Jp?=
 =?utf-8?B?RFBtKzJpREhjTndTQlE5T2ZNNFZYcTNJN243L1V0LzFydURXYk13TEdpd2Zz?=
 =?utf-8?B?SkJoSmpxdUhkNXVCTG9PNG5oVkFtcGtQUHhvOTlZMDFjN3RpcW1peXNlbDRn?=
 =?utf-8?B?dHMxelVuOXEveFNreUVBbWZ4Sm9uTFBrd2g1M1ppU3VjZ2pFNjRZeWtWQmcw?=
 =?utf-8?B?RkNKanE2UDdPbXo3MTBiNGZRWlRRK0RZK2xmdi81dC9BaEFDNmllZjZxRnRC?=
 =?utf-8?B?cTJtN0F3b2RJZHkyOVFybmFobHNMZ2dmdGwxbGtEQ25RaExhMFBwaXZEV293?=
 =?utf-8?B?aEhUaXplZjR6aXhhZUIydkN4VEd4bXE0L1pmcm1CSnNsYnNTSWNKNzNGQm1R?=
 =?utf-8?B?RFVpTWFQUHlXR0ZrOGV6ZnlJSFczOTZFcnlrRFU2WkdDT0w1aUpqTE9NOTB2?=
 =?utf-8?Q?DiJ1YQhBz3ksbmB4=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aiKoABXtI2yr3JPz0GuqtRJk"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f62c43-beb7-4b35-837c-08de54e68f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 10:03:55.7720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3XTVqugyMwP4kgarjR4clJeqypuoN5CO12ow8sHy9oy84TcyemlrZhedzKFX/JzIQj/BKFGfmTCetHMSNMoEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2182
X-Proofpoint-GUID: zNzTIo91DIwoX3A270n5EdQc7kP0qsCj
X-Proofpoint-ORIG-GUID: zNzTIo91DIwoX3A270n5EdQc7kP0qsCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NCBTYWx0ZWRfX0VuTYsiLHhy7
 FqIheYctOPsJ8ACUfqZNnkDedS3lvNpdoBN6FTKFC1TM+LgIKnjbyVIfag7NwpiotvEs5fv+S9u
 Nvwj6Inb3I7+fSo8pw17At7hGLsZTwYCB35UnxVNOgA3YOqlN1VtuqN8LrZ4tZ/6nuH9quBY6NL
 XiPPIg2eHzdexkpcPY0G3RFVnsr6bcYurrExEdVvMJa2YKI2cO9C8aanXHV+HeZ6OJTt4AXTF9b
 E5rtMTJuxwZpE2rQfaSpDIGcPEAv0CcY1HCHLExDN2XogrBZMTLzAdHezCLpqW2cRRp+zTPJTpi
 EsiAsHuxdPZc/zs2RtfzBgORLbtkRnlTdUbj3f/whQxR6d7HU7GCsecsZHcODKZA4S7m7pd/J98
 CH6SnSL0RhuBN7thiB9jyHdSrSzRwFlccSukaHQ8a4jD9trXxMOkoP1uASXY0H45P628patBl7U
 KLvdUUQL1DhJ2L8TxZQ==
X-Authority-Analysis: v=2.4 cv=QMNlhwLL c=1 sm=1 tr=0 ts=696a0d11 cx=c_pps
 a=qpjj3uHtJFPG8gWHyQRimQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=3oOJLAxtiLN628aBsBcA:9 a=QEXdDO2ut3YA:10 a=fR8HNpV24sxaUosmAeYA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------aiKoABXtI2yr3JPz0GuqtRJk
Content-Type: multipart/mixed; boundary="------------zR13wPCEjW1zj7cusjEvmMvj";
 protected-headers="v1"
Message-ID: <21719805-0c85-45e4-be33-c9d3851ebf1d@imgtec.com>
Date: Fri, 16 Jan 2026 10:03:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Wait for FW trace update command
 completion
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260108040936.129769-1-brajesh.gupta@imgtec.com>
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
In-Reply-To: <20260108040936.129769-1-brajesh.gupta@imgtec.com>

--------------zR13wPCEjW1zj7cusjEvmMvj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/01/2026 04:09, Brajesh Gupta wrote:
> Possibility of no FW trace available after update in the fw_trace_mask =
due
> to asynchronous mode of command consumption in the FW.
>=20
> To ensure FW trace is available after update, wait for FW trace log upd=
ate
> command completion from the FW.
>=20
> Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructur=
e and META FW support")
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll apply this to drm-misc-fixes later today if there are no
objections.

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_fw_trace.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.c
> index 8a56952f6730..99d681413eff 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -137,6 +137,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 grou=
p_mask)
>         struct rogue_fwif_kccb_cmd cmd;
>         int idx;
>         int err;
> +       int slot;
>=20
>         if (group_mask)
>                 fw_trace->tracebuf_ctrl->log_type =3D ROGUE_FWIF_LOG_TY=
PE_TRACE | group_mask;
> @@ -154,8 +155,13 @@ update_logtype(struct pvr_device *pvr_dev, u32 gro=
up_mask)
>         cmd.cmd_type =3D ROGUE_FWIF_KCCB_CMD_LOGTYPE_UPDATE;
>         cmd.kccb_flags =3D 0;
>=20
> -       err =3D pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
> +       err =3D pvr_kccb_send_cmd(pvr_dev, &cmd, &slot);
> +       if (err)
> +               goto err_drm_dev_exit;
> +
> +       err =3D pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
>=20
> +err_drm_dev_exit:
>         drm_dev_exit(idx);
>=20
>  err_up_read:
> --
> 2.43.0
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------zR13wPCEjW1zj7cusjEvmMvj--

--------------aiKoABXtI2yr3JPz0GuqtRJk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaWoNCwUDAAAAAAAKCRB5vBnz2d5qsG+9
AQCrWhma2E5NdJ/jGk36/XlHjAc8PCMHfEl4G7uD9AOMugEA3rTEqY21Sy+Ahl8q3EHpJUL8lVt7
MKi+20oDubaH6gs=
=d9D/
-----END PGP SIGNATURE-----

--------------aiKoABXtI2yr3JPz0GuqtRJk--
