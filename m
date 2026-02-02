Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMsJIWwGgGn11gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 03:05:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB796C7D43
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 03:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74D10E21A;
	Mon,  2 Feb 2026 02:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JqFykK55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013028.outbound.protection.outlook.com
 [40.93.196.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3816C10E21A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 02:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu69ZLeS7QmwE7+QvXY49nuQ9lMlW1w3yz05RBguuGkCA3ejZj5vWm2sSmIGH3xh8eDn71pw+WW7Ub4HHBD8ReZ/Fl3z8yPCS8u0B6GFwZZfWBYVfNCTSY22zhZQHF82fTL2ftjMe5C0Z+jn3IrFS0Qv4GQh/yrDntIItPBhyMYnJ1iF0xbldf67peFnS2wdamieFvCeq/zbG1YoQaFiaTxPjeDPzAAoU5vWM2FNpnhCn5D8PoY/wDWNqqA3xe/MDfGJq3HcAP9UtmbMX1/U+IzUZ/Pq69vgaWGGwrrZgh//PRJ0HD33JvfibXc2R0iUXb0kWJnXnpS4eJCXjDFMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx3OgHeLfXcYm97yf+nz7KTGWpFDpaNwMmEgOBfPhFQ=;
 b=WfR9+cLTZ7BHFS2wSis1qqLfbkjwR5yPfH7khHMypnh30k0T5JNeb5ReFkOZUXjXPedyZ2oypZYGgAYh6VtnfPatVVCtJAjoKLThuw4zEg082rBSdOC5U3Ca933yiBrmo3g4urUGKKr5LA4B5VCqZ1a3vsADurSvDaa70In1Y6+QT0CiVZIQpUwBxKfePVfSIh7Kk+/GDHCRvSJwxjBmsLO6v3HAJ3RBw/cbMH+rs17yKE+tvhmfWCtZL0Wwy2kihUf4Ng0P/e9iTNvcwH8NKchQtqEaCn+6aJOe/oRg0AWY0F6REV7KmuHIlifOVe1ikyowrU867E8+7BlLhe4ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx3OgHeLfXcYm97yf+nz7KTGWpFDpaNwMmEgOBfPhFQ=;
 b=JqFykK55LEqPjjmpfD/X9WzBRvC0H7J2gK4+nlpa9b5SgODwFjCQzK4Q/ekBZV7DNA/OvpozMOIy56C65d6pVNyKM0WsMWH9tCYOXKgFK/5b+eznwkCOm5TqEhmg8tV5MgkTRrCTDYfylpu/mcjF4XZuTVdWkzyYHW08v62zR8/MLY/Xe5XpUAizyuDeKsJGmGg82mJlKIZuJRYgLHomJaCXVQA39Pkom21ZjKzy3x5QAo6seGGQ8pJPZmJXikMXtqYZI1TsUlTgd0Dz8iO08fVoYo1Eu8qL49sLpdOrc1YIUe3YRmTTckymyRRjT2SsvJIwI8J1iE1LXQQmD333tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 02:05:16 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 02:05:16 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v6 15/15] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Mon, 02 Feb 2026 11:04:55 +0900
Message-ID: <2819069.mvXUDI8C0e@senjougahara>
In-Reply-To: <20260130124932.351328-16-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
 <20260130124932.351328-16-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 558832af-524b-4a94-8b95-08de61ff81cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|10070799003|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTIxV3F3bVlmVjFMcU1aMFkxZmNsSVh2UzF6NGEzVXRBR2Z6dmF6R2U3YVhv?=
 =?utf-8?B?enN4T2kxZG0vNFhucHF1cyt1bHI0dG1UR0lvaCt6NVdHaDJhdE95QlJpc3Fy?=
 =?utf-8?B?MXlaR0VRY09jRXhpWkFUWmhUdlIrb3ZrWUlPVUM1ckU2dkwzZTFQMmp0UlI0?=
 =?utf-8?B?VDQ2UUFGaTlJUzVDd3Y5aWd3emYxOU5rbU9YeDNCeDBQTzU3dmZrNDRTUkd1?=
 =?utf-8?B?bkw1Ym91bzU3Z05wVmdqTmtOVTZGU3lUcURZUUZsQVp1T0RRaHkwRGFXY2NC?=
 =?utf-8?B?ZXNCUk8vWjc3QjdpODU5N0U2YVR2QnVQblhwZnprL2luQU5EYmdHSEQ5NmRl?=
 =?utf-8?B?dHErOC9mbk5HR1h6bnI1Wm1pZUdmZFF5eVppYU9kbW5GaE5ib0dWVVZneWlW?=
 =?utf-8?B?YjFTZXNkOHdjbERZRm5uNWwrNVVXWWkvTllvR2srQ0VmM0V0dFVBNmlmcDd4?=
 =?utf-8?B?ZlVsUWp2SmR6dXNMZ3ZKMkZETFh1ZWFEemdxUlZwMmpZYndNaGkrbnBld1BI?=
 =?utf-8?B?dUlOREVDd3pNMkNRSUlRakJEMlZaOXkyTXY3Q1phREJrSFBDYzlkOGRKa3Ns?=
 =?utf-8?B?MEI3QjYrR1l1bi92OHFCV0NjTVBtNkljN0RXb25RRDhZQXNlSnk0d3FqTEor?=
 =?utf-8?B?NkVaWnRuOE5Nc0ZtQWMzWFRMQ2VjbmZ6R3V6Z2RVZXhiTGtBNytjd0E1OThr?=
 =?utf-8?B?b1lPS1EwVlh5RVhnSWJNYm82ejVsZjAreEs3UFFKdlp3bFFiUy9QMk40dmw4?=
 =?utf-8?B?TkRFdHFleVBuaWhna1k1czZJandGdjhidUZ5Uy9zeDA3Tm5nTjYrd2YxWm9B?=
 =?utf-8?B?bm5LaUFpWmpBeC9IUGxiL3R1dzB2WGNaT0RNQitDT2xjQWhlZEM5NEh4UzU2?=
 =?utf-8?B?T0k5Vk85S2NRZ0ZhSS9rS203MXRIclRzNnBNMHBoV244WWRrSnRIMlozcWZw?=
 =?utf-8?B?M3lHZjR3blFMZTIzbDFUWnRqRENmVDZHVUJTNHNVVC9JdTAvNkxNNEphdklD?=
 =?utf-8?B?NHlKazk1VE1DZEIxWWM2SzhLUVpaVkM3amNQeGl2dnVUaE5NWVdUQUw2aDFV?=
 =?utf-8?B?Qmgvcm5uZk1MaEp6QzRwSERWTjJoWjJTazNsQ09JTTBhUjhzcWd3UW1FUnJr?=
 =?utf-8?B?Z3d1bmFrMVhYbllIWmdzSyswWWh5aW9ER29LbldML00zZFE0SlJaMGp2UXRm?=
 =?utf-8?B?anhVczYwZHZyc1k1d3B2eWdEU2dpMFhINzNIZDl0d2tCSGoyRlhhaWF3aHcx?=
 =?utf-8?B?bnV6YTQvbEpmVi85eENTSEY4b0hJRHFCU2RRNVBoNjdZYkhMQkYwTG00SFF6?=
 =?utf-8?B?dHlPNzh5WEJGZVJaMXl5ZFh1dW4xbDdPWWFKS0syK0JmcnpLNTllbCtoU1VT?=
 =?utf-8?B?ZXZDMWh2VS9CeWE5c2xtODFtWEZnMXEvaWVrSzZ6WDRyV3NaVXRFRXR2cHpJ?=
 =?utf-8?B?TTlIUzI2OUxWQVI3aXJ0V1NXQVcxbGlabGk4U2NwTklMMVZmZDg0aGRCdHIy?=
 =?utf-8?B?ZDdZWWdFZjR0NzNWZXZxRkZpRXZ6MGZRd3lOcEp5bTBPaE1SYm1tT1lRQmNj?=
 =?utf-8?B?N1M5Q3hRVnRSTk9NRkg4eStQelNQdWtSMFdSQmVCdzF0Nk5Hc0lMZSt5MUFn?=
 =?utf-8?B?Vm1jSTd4Q0Flc0w0RzIyak9uK1dHcGdnbGVSQ3FVQ2UvSjZjR2tNMUZVRU9W?=
 =?utf-8?B?M1Z2dU44MWJvVzZtd0FMeU4zNkdFeGUzL0gwak1IazJURVFlM1hzcnI5a3NM?=
 =?utf-8?B?MkM1K1FRaGhxN0FrUnl0RlpxWHFBM3hZQVlxWU1DTkhNcm9LaXJQMDJ3Qk9J?=
 =?utf-8?B?RGx4R1prN1ZDcVFEVytWandWSFQvdFg0Qnp6YzdNNmFiS3poUVdGYjRucWJL?=
 =?utf-8?B?T25kVVJUdWFxUHM1bWhIekNSQjZwWFlCbUYwcndJS2VPZlNOM2NBbWxVSXJt?=
 =?utf-8?B?b1ZHWVdwdmFZK2JYZGZEam5vLzhSMjBSeXZMVDBpczM0a1Via0w1aGpDdlpq?=
 =?utf-8?B?UnFPZGR6aldERWErT0pGMFhpZWlrOTVENWlqZ292eHVseUdyRmlnYytwdE40?=
 =?utf-8?B?QTVVRGVkRUZDUHh5K0RFNFBzMmNNWkNkMFhod2FjdHpDUWpSMVZ2ZXB2eDc4?=
 =?utf-8?B?QkNCWGc5aFFtZWJtQTBvWmxGZW91S2hiUVY5ZE1mcHd1QU1PdlNYTy85RjN3?=
 =?utf-8?B?b0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(10070799003)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlI4RmQ0ZVVzQ05jeG9rY01MMUJVUUVhS1BndXR0akQyY1V1YXdKRUlDV093?=
 =?utf-8?B?ajRrNlV1K3oxYXordzN4eFJwSGxpc1M1TWdSWmE4RTdaTW9leHAwSzdQZWVl?=
 =?utf-8?B?VFlLVEFHLzVkWllIcW5JVmxuQXVpRVNjS1ZRazY1clV6bVlxdWhleUlTbmIz?=
 =?utf-8?B?citoMkprTHJid0VEZktRb2pxUjdyYllJWkZTS1JOSktFOEJES1JTSHpmZVlX?=
 =?utf-8?B?QU5sV2VzZnJwdC80cWZkaXBDeXByQ1ZPbkFza1ZnSlZqOE9LMkt2VEpGbGhh?=
 =?utf-8?B?Z0N0Q3pnZ3hMSUM1bUhlNXFhSjdmQVFrZm4vTnkxbnVzZXNPc1QwWUx1NUlM?=
 =?utf-8?B?cVppZldIQVZUSTNkRmoxQ2RXczFQa0g1NWNid2FNZCsyTU1paWtzN1hyZ01V?=
 =?utf-8?B?alp6ZEorVDJac2lrdGFud2s5T3hHejJHL2xIVG5aZlFKZEY3Q05xd0hCemhy?=
 =?utf-8?B?NFpHc3crSGMwc2tTTVV3WlA0RW9uK1JiY1NlRFkrMmROeHhTTjBKUlNrakl0?=
 =?utf-8?B?cThZTE9KUTFaLzBnbSs1MjhFNkFpSW1WUG1vZk9SK2VXYUxsaUFRK29ZQmdw?=
 =?utf-8?B?ZFNCR0I2eWdMUzJ1RTZ3UDF5MjN5WFRVbE5pcmhmR2Y2Y3BsMWZXN29PR09V?=
 =?utf-8?B?UHBWNGZDNm52S1pGY2V3czlpUzhsU0h1SzlQTXVkMUcvUWxHS0hKUVJWR3F0?=
 =?utf-8?B?cTJyVHc1WHhzdEo0UG16UnRGSHRQSG5JelRmczNvTDBFOFdrYXl1UmtLN0Rr?=
 =?utf-8?B?ZnprQlgrTXdmRVNJdUxTbzEyTU9Panpwdm5lNEdBbmhXL1hrVVJGYS90enJs?=
 =?utf-8?B?UlB4NDZ3aVRCalpCTFRjdDJDV1hzZTVOSjNFNzhOa1JRSEh0OVBYUHlqaUpZ?=
 =?utf-8?B?a1JSQk5uMTJGS1FFbEtoZnJxeGIxUERhOTVhR0tjcFlHMlFiaVptZ2dNTzAz?=
 =?utf-8?B?WlBabEhtYVZHWEQ3QlhVa0g2SkZVczd1SlQ4eHJ3MHZxUHFSSkxTL3BKNnY5?=
 =?utf-8?B?STBmWU8vZnZhQzl2VVB2VWxDanpKU0FqWEUzTURBcnpLd0duVEd4OE9aTjY2?=
 =?utf-8?B?c0luY0dRODNXRTY4U2tJN2g0c1ZLRmI1MXlpeUZ6b3puY2NXRS9IcVcxdkNx?=
 =?utf-8?B?VU1FUXNPR1RyTkVoMWdoWE00SW4zc05wQ1EyNXBBYTY5VTRCd1pEWE1mbEFN?=
 =?utf-8?B?bWR2QXgrSWJzUXFlSjFHc0lIK3BDYXVYM1lBbnc3K1RJUXV4cVdkaEFwL21F?=
 =?utf-8?B?OWtXL3k5NHNNNkFPNzNEcTFScStlOG1vMGgweFVYM1ZCS0RocTI4LzZHc0FM?=
 =?utf-8?B?V3ZMRmJSY2dwNThHTmo0VzRsNEIyUnlMTWNmc2lmRkZYR21vdTJZVnVxbkV4?=
 =?utf-8?B?bW5EeUs0a3Z3dTQ2dkNWRmF0YzZ0aWVHKzhaVWplSU94cHZwQmIzcXppV1Y4?=
 =?utf-8?B?MEs5dlUzOWVyYVF6TzgxWDFhUStUREE3OFNHR1o3eExCUkkveE9RenhLbFdN?=
 =?utf-8?B?VFVUUXIzTkxXYzFiVnI5TG51UGFnbm85cEpUbmNsUmVkN3RqVzFWa1QwZy9M?=
 =?utf-8?B?SFZ3dXZzdzBqL3pTUmU3N0pUeU5KcENFM1gyVDJkcDBzellKTzZXdFU3L3Vl?=
 =?utf-8?B?UmRXbTMvaUNGVVdkVysyY2JQZXgza0FORERiM3NTU3liblJTVjdUOGFvSGhN?=
 =?utf-8?B?SEYxVEF2a1M3cFRlT1RNeDkrczFWWmRXOEVCNnNQSTBNLzA4K2tsc0t0SHUx?=
 =?utf-8?B?N010MWQ1OHVja1NmWDgyUGtoNG0rYTRjZWVOQVI0bm0rM2NVdE9kUk9iRzBn?=
 =?utf-8?B?SDY0Q01ndDZEUVdyYVg2T2xoNVF2bkYzKy85a2htR0h3NE9ZK3dIYm5pd0Nz?=
 =?utf-8?B?c0RDQ2o5NmkxTzBiSUR0ZjFRaURLWUxxYTkzcmdVd1RlUW4zSnRuTkpUK1Rp?=
 =?utf-8?B?dFYxZThEakl4VG94WDNxQVNFZkZLUFJxclNDUm1aSmEweHU4M0kva0Nwd01Z?=
 =?utf-8?B?dDhSZ3QrN01BY2dJblBCZXU5aDI1WjFlL0lGalVodW9FdE4wekhtMFBVbFov?=
 =?utf-8?B?TnBkb3k3cHRSQ1kyVU0zWVNvWDFpZXovOGQ5TzZGZDlrWG9Fd21nV3ZKcWUz?=
 =?utf-8?B?ZzBMbGQvU0prVFB0V1o4TjhtQldSdWdTZ1ZaT29FUk15dEFwN3dudlN5YTFs?=
 =?utf-8?B?WFJ4YjVaTk9tT1FtRDFkTEJCdEtwQjRVdW02Y1hGWUJhNktHTkxrK0RONjZI?=
 =?utf-8?B?UHVXazgvNlUvQzh3RUdJbWl6REI5QzBkU2VhM05icHJoSTBaTGZMRnVWQWNi?=
 =?utf-8?B?M3ZSNFhZanlPMHRZYlFUS1AvWld3YzdJMi8zdlc0WVBpYXBqVjZvQXRvb3dC?=
 =?utf-8?Q?4ibjoEi11t5uCMH6khmnuHD4Mk1IZ/fFbuQZK2dJZodZb?=
X-MS-Exchange-AntiSpam-MessageData-1: oHdCzuxTtF+qcQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558832af-524b-4a94-8b95-08de61ff81cb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 02:05:15.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKxRwlGth3GBRiSaBVJtxo8UqO5WyC/Scy1ef3cSyQjNeImSC9MAEf/FhlvWdH5eFIClXPcrONI+xJgBEZYAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.de:email,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BB796C7D43
X-Rspamd-Action: no action

On Friday, January 30, 2026 9:49=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 an=
d
> Tegra30 SoC.
>=20
> To get CSI operational, an additional syncpoint was allocated to serve as
> the CSI frame counter. Both VIP and CSI use an existing syncpoint for VI
> frame start events. That said, the frame capture function was refactored
> to reflect the addition of the CSI syncpoint, and the CSI-specific
> configuration is guarded by the presence of a passed CSI channel structur=
e
> pointer.
>=20
> The camera capture setup's configuration was reconsidered: the first two
> writes must be done before tegra_channel_set_stream for MIPI calibration
> to work properly; the third write was moved to VIP/CSI-specific functions
> since it must be source-specific; the function was placed after
> tegra_channel_set_stream so the initial sequence is preserved and expande=
d.
>=20
> CSI configuration sequences were added based on downstream 3.1 kernel
> sources and adjusted to the existing video-tegra framework. Although
> Tegra20 and Tegra30 have the same set of configurations, they differ by
> the number of clocks used by CSI.
>=20
> Dropped the software syncpoint counters in favor of reading syncpoints
> directly and passing the incremented value to the polling function. If th=
e
> syncpoint increase fails, the PP is reset. This change should prevent
> possible race conditions.
>=20
> MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> have no dedicated hardware block for these operations and use CSI. These
> calls are used for both CSI and DSI to work properly, which is why MIPI
> calibration cannot be contained within CSI. The pads passed to the
> calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) and
> DSI-B (4).
>=20
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel =
camera
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

> ---
>  drivers/staging/media/tegra-video/csi.c     |  17 +
>  drivers/staging/media/tegra-video/csi.h     |  10 +
>  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 -
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  5 files changed, 608 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 36f5b7cbcd4d..568f2d162473 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -827,6 +827,17 @@ static int tegra_csi_probe(struct platform_device *p=
dev)
> =20
>  	csi->dev =3D &pdev->dev;
>  	csi->ops =3D csi->soc->ops;
> +
> +	if (csi->soc->mipi_ops) {
> +		ret =3D devm_tegra_mipi_add_provider(&pdev->dev, pdev->dev.of_node,
> +						   csi->soc->mipi_ops);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "failed to add MIPI calibration operations\n");
> +	}
> +
> +	mutex_init(&csi->mipi_lock);
> +
>  	platform_set_drvdata(pdev, csi);
>  	pm_runtime_enable(&pdev->dev);
> =20
> @@ -859,6 +870,12 @@ static void tegra_csi_remove(struct platform_device =
*pdev)
>  }
> =20
>  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_soc },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_soc },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_soc },
>  #endif
> diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/me=
dia/tegra-video/csi.h
> index 5344088aa022..f0277cb42446 100644
> --- a/drivers/staging/media/tegra-video/csi.h
> +++ b/drivers/staging/media/tegra-video/csi.h
> @@ -115,6 +115,7 @@ struct tegra_csi_ops {
>   * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
>   *
>   * @ops: csi hardware operations
> + * @mipi_ops: MIPI calibration operations
>   * @csi_max_channels: supported max streaming channels
>   * @clk_names: csi and cil clock names
>   * @num_clks: total clocks count
> @@ -123,6 +124,7 @@ struct tegra_csi_ops {
>   */
>  struct tegra_csi_soc {
>  	const struct tegra_csi_ops *ops;
> +	const struct tegra_mipi_ops *mipi_ops;
>  	unsigned int csi_max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> @@ -130,6 +132,12 @@ struct tegra_csi_soc {
>  	unsigned int tpg_frmrate_table_size;
>  };
> =20
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +extern const struct tegra_csi_soc tegra20_csi_soc;
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +extern const struct tegra_csi_soc tegra30_csi_soc;
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  extern const struct tegra_csi_soc tegra210_csi_soc;
>  #endif
> @@ -144,6 +152,7 @@ extern const struct tegra_csi_soc tegra210_csi_soc;
>   * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
>   * @soc: pointer to SoC data structure
>   * @ops: csi operations
> + * @mipi_lock: for MIPI calibration operations
>   * @csi_chans: list head for CSI channels
>   */
>  struct tegra_csi {
> @@ -154,6 +163,7 @@ struct tegra_csi {
>  	struct regulator *vdd;
>  	const struct tegra_csi_soc *soc;
>  	const struct tegra_csi_ops *ops;
> +	struct mutex mipi_lock; /* for register access */
>  	struct list_head csi_chans;
>  };
> =20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 1b8f2a2213f2..7056cfbe988b 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -4,6 +4,9 @@
>   *
>   * Copyright (C) 2023 SKIDATA GmbH
>   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + *
> + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
>   */
> =20
>  /*
> @@ -12,10 +15,15 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
>  #include <linux/delay.h>
>  #include <linux/host1x.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/tegra-mipi-cal.h>
>  #include <linux/v4l2-mediabus.h>
> =20
>  #include "vip.h"
> @@ -42,6 +50,9 @@ enum tegra_vi_out {
>  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
>  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
> =20
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)	(0x0070 + (n) * 8)
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)	(0x0074 + (n) * 8)
> +
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
>  #define       VI_INPUT_BT656				BIT(25)
> @@ -88,6 +99,8 @@ enum tegra_vi_out {
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_=
FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPU=
T_FORMAT_SFT)
>  /* TEGRA_VI_OUT_2 supported formats */
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER	(7 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER	(8 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> =20
>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
> @@ -152,8 +165,106 @@ enum tegra_vi_out {
>  #define TEGRA_VI_VI_RAISE				0x01ac
>  #define       VI_VI_RAISE_ON_EDGE			BIT(0)
> =20
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)		(0x01d8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)		(0x01dc + (n) * 8)
> +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)			(0x01e8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)			(0x01ec + (n) * 8)
> +
> +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL		0x0000
> +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL		0x0008
> +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)		(0x0010 + (n) * 0x2c)
> +#define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
> +#define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
> +#define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
> +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
> +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
> +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> +#define       CSI_PP_DATA_TYPE(n)			((n) << 8)
> +#define       CSI_PP_CRC_CHECK_ENABLE			BIT(7)
> +#define       CSI_PP_WORD_COUNT_HEADER			BIT(6)
> +#define       CSI_PP_DATA_IDENTIFIER_ENABLE		BIT(5)
> +#define       CSI_PP_PACKET_HEADER_SENT			BIT(4)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)		(0x001c + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)		(0x0020 + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)			(0x0024 + (n) * 0x2c)
> +#define       CSI_PP_FRAME_MIN_GAP(n)			(((n) & 0xffff) << 16)
> +#define       CSI_PP_LINE_MIN_GAP(n)			(((n) & 0xffff))
> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)		(0x0028 + (n) * 0x2c)
> +#define       CSI_PP_START_MARKER_FRAME_MAX(n)		(((n) & 0xf) << 12)
> +#define       CSI_PP_START_MARKER_FRAME_MIN(n)		(((n) & 0xf) << 8)
> +#define       CSI_PP_VSYNC_START_MARKER			BIT(4)
> +#define       CSI_PP_SINGLE_SHOT			BIT(2)
> +#define       CSI_PP_NOP				0
> +#define       CSI_PP_ENABLE				1
> +#define       CSI_PP_DISABLE				2
> +#define       CSI_PP_RESET				3
> +#define TEGRA_CSI_PHY_CIL_COMMAND			0x0068
> +#define       CSI_A_PHY_CIL_NOP				0x0
> +#define       CSI_A_PHY_CIL_ENABLE			0x1
> +#define       CSI_A_PHY_CIL_DISABLE			0x2
> +#define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
> +#define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
> +#define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
> +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
> +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
> +#define TEGRA_CSI_CSI_CIL_STATUS			0x007c
> +#define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK	0x0080
> +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK		0x0084
> +#define TEGRA_CSI_CSI_READONLY_STATUS			0x0088
> +#define TEGRA_CSI_ESCAPE_MODE_COMMAND			0x008c
> +#define TEGRA_CSI_ESCAPE_MODE_DATA			0x0090
> +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)			(0x0094 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)			(0x0098 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG			0x00a4
> +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG			0x00a8
> +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG			0x00ac
> +#define       CSI_CIL_MIPI_CAL_STARTCAL			BIT(31)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_A		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_B		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)		(((n) & 0xf) << 26)
> +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)		(((n) & 0x3) << 24)
> +#define       CSI_CIL_MIPI_CAL_SEL_A			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_SEL_B			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)		(((n) & 0x1f) << 16)
> +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)		(((n) & 0x1f) << 8)
> +#define       CSI_CIL_MIPI_CAL_TERMOS(n)		(((n) & 0x1f))
> +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS			0x00b0
> +#define TEGRA_CSI_CLKEN_OVERRIDE			0x00b4
> +#define TEGRA_CSI_DEBUG_CONTROL				0x00b8
> +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED	BIT(0)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0		BIT(4)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1		BIT(5)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2		BIT(6)
> +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)	((v) << (8 + 8 * (n)))
> +#define TEGRA_CSI_DEBUG_COUNTER(n)			(0x00bc + (n) * 4)
> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)	(0x00c8 + (n) * 4)
> +#define       CSI_PP_EXP_FRAME_HEIGHT(n)		(((n) & 0x1fff) << 16)
> +#define       CSI_PP_MAX_CLOCKS(n)			(((n) & 0xfff) << 4)
> +#define       CSI_PP_LINE_TIMEOUT_ENABLE		BIT(0)
> +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG			0x00d0
> +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG			0x00d4
> +#define       CSI_PAD_DRIV_DN_REF(n)			(((n) & 0x7) << 16)
> +#define       CSI_PAD_DRIV_UP_REF(n)			(((n) & 0x7) << 8)
> +#define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
> +#define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
> +#define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
> +
>  /* ---------------------------------------------------------------------=
-----
> - * VI
> + * Read and Write helpers
>   */
> =20
>  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int=
 addr, u32 val)
> @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_channel=
 *chan, unsigned int addr, u
>  	writel(val, chan->vi->iomem + addr);
>  }
> =20
> +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *chan,=
 unsigned int addr)
> +{
> +	return readl(chan->vi->iomem + addr);
> +}
> +
> +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsign=
ed int addr, u32 val)
> +{
> +	writel(val, csi_chan->csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *csi=
_chan, unsigned int addr)
> +{
> +	return readl(csi_chan->csi->iomem + addr);
> +}
> +
> +static void tegra20_mipi_write(struct tegra_csi *csi, unsigned int addr,=
 u32 val)
> +{
> +	writel(val, csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_mipi_read(struct tegra_csi *csi, unsig=
ned int addr)
> +{
> +	return readl(csi->iomem + addr);
> +}
> +
> +/* ---------------------------------------------------------------------=
-----
> + * VI
> + */
> +
>  /*
>   * Get the main input format (YUV/RGB...) and the YUV variant as values =
to
>   * be written into registers for the current VI input mbus code.
> @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, b=
ool on)
>  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *c=
han)
>  {
>  	struct tegra_vi *vi =3D chan->vi;
> -	struct host1x_syncpt *out_sp;
> +	struct host1x_syncpt *out_sp, *fs_sp;
> =20
>  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANA=
GED);
>  	if (!out_sp)
> -		return -ENOMEM;
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpo=
int\n");
> =20
>  	chan->mw_ack_sp[0] =3D out_sp;
> =20
> +	fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAG=
ED);
> +	if (!fs_sp)
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start s=
yncpoint\n");
> +
> +	chan->frame_start_sp[0] =3D fs_sp;
> +
>  	return 0;
>  }
> =20
>  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *=
chan)
>  {
>  	host1x_syncpt_put(chan->mw_ack_sp[0]);
> +	host1x_syncpt_put(chan->frame_start_sp[0]);
>  }
> =20
>  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int =
bpp)
> @@ -424,41 +571,91 @@ static void tegra20_channel_vi_buffer_setup(struct =
tegra_vi_channel *chan,
>  }
> =20
>  static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
> -					 struct tegra_channel_buffer *buf)
> +					 struct tegra_channel_buffer *buf,
> +					 struct tegra_csi_channel *csi_chan)
>  {
> +	u32 val;
>  	int err;
> =20
> -	chan->next_out_sp_idx++;
> -
>  	tegra20_channel_vi_buffer_setup(chan, buf);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_E=
NABLE);
> +	if (csi_chan) {
> +		u32 port =3D csi_chan->csi_port_nums[0] & 1;
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> +
> +		/*
> +		 * ERESTARTSYS workaround for syncpoints is used because host1x_syncpt=
_wait
> +		 * is unconditionally interruptible. This is not an issue with single =
shots
> +		 * or low resolution capture, but -ERESTARTSYS occurs quite often with=
 high
> +		 * resolution or high framerate captures and if not addressed here wil=
l
> +		 * cause capture to fail entirely.
> +		 *
> +		 * TODO: once uninterruptible version of host1x_syncpt_wait is availab=
le,
> +		 * host1x_syncpt_wait should be swapped and ERESTARTSYS workaround can=
 be
> +		 * removed.
> +		 */
> +
> +		val =3D host1x_syncpt_read(chan->frame_start_sp[0]);
> +		do {
> +			err =3D host1x_syncpt_wait(chan->frame_start_sp[0],
> +						 val + 1, TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +		} while (err =3D=3D -ERESTARTSYS);
> +
> +		if (err) {
> +			if (err !=3D -ERESTARTSYS)
> +				dev_err_ratelimited(&chan->video.dev,
> +						    "frame start syncpt timeout: %d\n", err);
> +
> +			tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +					  CSI_PP_START_MARKER_FRAME_MAX(0xf) | CSI_PP_RESET);
> +			goto exit;
> +		}
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_DISABLE);
> +	} else {
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_=
ENABLE);
> +	}
> +
> +	val =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> +	do {
> +		err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], val + 1,
> +					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +	} while (err =3D=3D -ERESTARTSYS);
> =20
> -	/* Wait for syncpt counter to reach frame start event threshold */
> -	err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
> -				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
>  	if (err) {
> -		host1x_syncpt_incr(chan->mw_ack_sp[0]);
> -		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\=
n", err);
> -		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> -		return err;
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", =
err);
> +		goto exit;
>  	}
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> -			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> +	if (!csi_chan)
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> +				 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> =20
> +exit:
>  	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> =20
> -	return 0;
> +	return err;
>  }
> =20
>  static int tegra20_chan_capture_kthread_start(void *data)
>  {
>  	struct tegra_vi_channel *chan =3D data;
>  	struct tegra_channel_buffer *buf;
> +	struct v4l2_subdev *csi_subdev =3D NULL;
> +	struct tegra_csi_channel *csi_chan =3D NULL;
>  	unsigned int retries =3D 0;
>  	int err =3D 0;
> =20
> +	csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> +	if (csi_subdev)
> +		csi_chan =3D to_csi_chan(csi_subdev);
> +
>  	while (1) {
>  		/*
>  		 * Source is not streaming if error is non-zero.
> @@ -483,7 +680,7 @@ static int tegra20_chan_capture_kthread_start(void *d=
ata)
>  		list_del_init(&buf->queue);
>  		spin_unlock(&chan->start_lock);
> =20
> -		err =3D tegra20_channel_capture_frame(chan, buf);
> +		err =3D tegra20_channel_capture_frame(chan, buf, csi_chan);
>  		if (!err) {
>  			retries =3D 0;
>  			continue;
> @@ -510,28 +707,6 @@ static void tegra20_camera_capture_setup(struct tegr=
a_vi_channel *chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	int main_output_format;
> -	int yuv_output_format;
> -
> -	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_fo=
rmat);
> -
> -	/*
> -	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> -	 * for luminance, which is the default and means not to touch
> -	 * anything.
> -	 */
> -	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> -			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> -			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> -
> -	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> -
> -	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> -			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> -			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> -			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
> -			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
> =20
>  	/* Set up frame size */
>  	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> @@ -562,18 +737,28 @@ static int tegra20_vi_start_streaming(struct vb2_qu=
eue *vq, u32 count)
>  	struct media_pipeline *pipe =3D &chan->video.pipe;
>  	int err;
> =20
> -	chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> -
>  	err =3D video_device_pipeline_start(&chan->video, pipe);
>  	if (err)
>  		goto error_pipeline_start;
> =20
> -	tegra20_camera_capture_setup(chan);
> +	/*
> +	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> +	 * for luminance, which is the default and means not to touch
> +	 * anything.
> +	 */
> +	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> +			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> +			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> +
> +	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> +	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> =20
>  	err =3D tegra_channel_set_stream(chan, true);
>  	if (err)
>  		goto error_set_stream;
> =20
> +	tegra20_camera_capture_setup(chan);
> +
>  	chan->sequence =3D 0;
> =20
>  	chan->kthread_start_capture =3D kthread_run(tegra20_chan_capture_kthrea=
d_start,
> @@ -668,6 +853,345 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.has_h_v_flip =3D true,
>  };
> =20
> +/* ---------------------------------------------------------------------=
-----
> + * MIPI Calibration
> + */
> +static int tegra20_start_pad_calibration(struct tegra_mipi_device *mipi)
> +{
> +	struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> +	unsigned int port =3D mipi->pads;
> +	u32 value;
> +	int ret;
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D pm_runtime_resume_and_get(csi->dev);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(4) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(3) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(0));
> +	tegra20_mipi_write(csi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> +			   CSI_PAD_DRIV_DN_REF(5) |
> +			   CSI_PAD_DRIV_UP_REF(7) |
> +			   CSI_PAD_TERM_REF(0));
> +
> +	/* CSI B */
> +	value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_B)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> +
> +	/* CSI A */
> +	value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> +		CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +		CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +		CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_A)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +
> +	return 0;
> +}
> +
> +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *mipi=
)
> +{
> +	struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> +	void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL_STATUS;
> +	unsigned int port =3D mipi->pads;
> +	u32 value, pp =3D 0, cil =3D 0;
> +	int ret;
> +
> +	/* This part is only for CSI */
> +	if (port > PORT_B) {
> +		pm_runtime_put(csi->dev);
> +
> +		return 0;
> +	}
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration timeout!\n");
> +		goto exit;
> +	}
> +
> +	/* clear status */
> +	tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, value);
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration status timeout!\n");
> +		goto exit;
> +	}
> +
> +	pp =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
> +	cil =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_CIL_STATUS);
> +	if (pp | cil) {
> +		dev_warn(csi->dev, "Calibration status not been cleared!\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> +
> +	/* un-select to avoid interference with DSI */
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +			   CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	pm_runtime_put(csi->dev);
> +
> +	return ret;
> +}
> +
> +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> +	.start_calibration =3D tegra20_start_pad_calibration,
> +	.finish_calibration =3D tegra20_finish_pad_calibration,
> +};
> +
> +/* ---------------------------------------------------------------------=
-----
> + * CSI
> + */
> +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan=
)
> +{
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK, =
0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> +}
> +
> +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *cs=
i_chan,
> +					    u8 portno)
> +{
> +	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&csi_chan=
->subdev);
> +	int width  =3D vi_chan->format.width;
> +	int height =3D vi_chan->format.height;
> +	u32 data_type =3D vi_chan->fmtinfo->img_dt;
> +	u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> +	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> +
> +	unsigned int main_output_format, yuv_output_format;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> +
> +	switch (data_type) {
> +	case TEGRA_IMAGE_DT_RAW8:
> +	case TEGRA_IMAGE_DT_RAW10:
> +		output_channel =3D TEGRA_VI_OUT_2;
> +		if (port =3D=3D PORT_A)
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER;
> +		else
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER;
> +		break;
> +	}
> +
> +	tegra20_csi_capture_clean(csi_chan);
> +
> +	/* CSI port cleanup */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /*=
 CSI_PP_YUV422 */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width << 16);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height << 16)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0x1)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), wo=
rd_count);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> +			  CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks between frames */
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
,
> +			  CSI_PP_EXP_FRAME_HEIGHT(height) |
> +			  CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clks for timeout */
> +			  CSI_PP_LINE_TIMEOUT_ENABLE);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port),
> +			  CSI_PP_OUTPUT_FORMAT_PIXEL |
> +			  CSI_PP_DATA_TYPE(data_type) |
> +			  CSI_PP_CRC_CHECK_ENABLE |
> +			  CSI_PP_WORD_COUNT_HEADER |
> +			  CSI_PP_DATA_IDENTIFIER_ENABLE |
> +			  CSI_PP_PACKET_HEADER_SENT |
> +			  port);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
> +			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> +			  (csi_chan->numlanes - 1));
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> +			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> +			  0x5); /* Clock settle time */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port)=
,
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->frame_start_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_D=
ISABLE :
> +		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			 yuv_output_format | main_output_format);
> +
> +	return 0;
> +};
> +
> +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *cs=
i_chan, u8 portno)
> +{
> +	struct tegra_csi *csi =3D csi_chan->csi;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS)=
;
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, value);
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	if (csi_chan->numlanes =3D=3D 4) {
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
> +	} else {
> +		value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_NOP :
> +			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +	}
> +}
> +
> +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int ret, i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++) {
> +		ret =3D tegra20_csi_port_start_streaming(csi_chan, portnos[i]);
> +		if (ret)
> +			goto stream_start_fail;
> +	}
> +
> +	return 0;
> +
> +stream_start_fail:
> +	for (i =3D i - 1; i >=3D 0; i--)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +
> +	return ret;
> +}
> +
> +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +}
> +
> +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> +	.csi_start_streaming =3D tegra20_csi_start_streaming,
> +	.csi_stop_streaming =3D tegra20_csi_stop_streaming,
> +};
> +
> +static const char * const tegra20_csi_clks[] =3D {
> +	NULL,
> +};
> +
> +const struct tegra_csi_soc tegra20_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra20_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> +};
> +
> +static const char * const tegra30_csi_clks[] =3D {
> +	"csi",
> +	"csia-pad",
> +	"csib-pad",
> +};
> +
> +const struct tegra_csi_soc tegra30_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra30_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> +};
> +
>  /* ---------------------------------------------------------------------=
-----
>   * VIP
>   */
> @@ -687,10 +1211,11 @@ static int tegra20_vip_start_streaming(struct tegr=
a_vip_channel *vip_chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	unsigned int main_input_format;
> -	unsigned int yuv_input_format;
> +	unsigned int main_input_format, yuv_input_format;
> +	unsigned int main_output_format, yuv_output_format;
> =20
>  	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_fo=
rmat);
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> =20
> @@ -723,6 +1248,11 @@ static int tegra20_vip_start_streaming(struct tegra=
_vip_channel *vip_chan)
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_ST=
OP_CAPTURE);
> =20
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			  yuv_output_format | main_output_format);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index bfadde8858d4..46328e488aa3 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -125,7 +125,6 @@ struct tegra_vi {
>   *		frame through host1x syncpoint counters (On Tegra20 used for the
>   *              OUT_1 syncpt)
>   * @sp_incr_lock: protects cpu syncpoint increment.
> - * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 (T=
egra20)
>   *
>   * @kthread_start_capture: kthread to start capture of single frame when
>   *		vb buffer is available. This thread programs VI CSI hardware
> @@ -188,7 +187,6 @@ struct tegra_vi_channel {
>  	struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
>  	/* protects the cpu syncpoint increment */
>  	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> -	u32 next_out_sp_idx;
> =20
>  	struct task_struct *kthread_start_capture;
>  	wait_queue_head_t start_wait;
> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/=
media/tegra-video/video.c
> index 4aec2ff9a69c..1811661e9af6 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -125,6 +125,12 @@ static const struct of_device_id host1x_video_subdev=
s[] =3D {
>  	{ .compatible =3D "nvidia,tegra20-vip", },
>  	{ .compatible =3D "nvidia,tegra20-vi", },
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", },
>  	{ .compatible =3D "nvidia,tegra210-vi", },
>=20




