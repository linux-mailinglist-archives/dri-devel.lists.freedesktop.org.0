Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84A4A4C00B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4326F10E3E9;
	Mon,  3 Mar 2025 12:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="eNVoragK";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="gQdQOyWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755F510E3E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:15:37 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52366LPN030025;
 Mon, 3 Mar 2025 12:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=w5A4ulRYOslr8TGpB7kCC9fdQ
 upGXkAQns6rkE2TRMo=; b=eNVoragKRoGh4HYVgSbucz/IkObKBrBUio+zzWp2F
 4Ynv0YzYXpH8JIvPI7ISMx5An4D9wh9jLLZRnI13rdiIr7JzQjA403UhGOWnURH3
 SsYMKkD1QAzjzU3Nb4yWuKue4fPte85qJNiPww7bt6MVLBr754KalV/vcyTRLfSd
 UVMdtqlPYBnafkpb4by5NMHX82oPVHezMaHczKVCq3KMlGyTXA+joF/7+pmd2WR0
 CPXQzzVE0CsIHlnh9nYARdTEcfudVH1B7kD5/EeM3B5Cqrr6xrGh1mduf/TjYvL5
 3dm7oY4SfQaA+lUNK30pM+Veu4B/Nz6pNCdVn3ugyQXUA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011031.outbound.protection.outlook.com [40.93.67.31])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 453u711ff7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Mar 2025 12:15:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p541Yq5+maQs4P7OrOE4tbLVwExOYpsaFiqif3H5ozzTMd559mDkx82oDTnq+mIll0YmDlb/TaZdoGlo/r2gbbt+udKCqwblonePWFzkwvFzugcdbJR+aJ2RfU5htimf3db6sa0UKxLVG2rZUU/GO13WYPmT1kH1saP/r6GnSMFlkk8AejfXL6mDVl0wulvPkzTDFAbnpucAokp/MqbsfeOYREZFa67x5Mvq3nv6FlcD5BRyeSbKwcbROTBXuGPL/NfI15W5HwYbuYVB9NLs0Y7bwVq+Jq1pm+R4UjLx2bCjiUNfDFjLgcTnpH6Dio/N0/tAGHNwDNR+e4vDF156nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5A4ulRYOslr8TGpB7kCC9fdQupGXkAQns6rkE2TRMo=;
 b=j22/pnoc68WifyiHJE30YTX14Je9E8nH44B5U0Qqsjm3OGC54Ok0sZDSEUCSDyuQXsFXKZJvwNmSCWpbOngxbKM9TvE2RxpO/2uynGIWY/3suB4Hro8DFcXHSBpzOuzH2V3iFvXezAP6qWV0lUsVWRs02n+L0qNYHhcjRo2FGsNzlt21TGNMAJb1XEHLZm4g/5f8b8gDtMKuz5FK/+eU2+f+SWAPJrbamsYERtsmGUDL3PLTNKA4hdKh3A8nqlIOVcCBGlLljsbtKhHqOCC55TUGmpaDuAZbRpetrOMKb8iIK179O3XDN/vbaCCvQ294Cxe084VlX9QjlcK++Vuh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5A4ulRYOslr8TGpB7kCC9fdQupGXkAQns6rkE2TRMo=;
 b=gQdQOyWaMb9pjBtGaIrk+Pj9kAO+U8IOuHtN5tCBfTxj44lueKMz9muhceq5FtnmbzxRaTd90YXy1Xhtbyia2DcRwIwAAsbrde/gRvfSg2N6tXkud4/XztFobufKpbSzK9j5WUixWvfRLzr0NGjc/aG6gfyagsQnJtllgGG9KOc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB5545.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15; Mon, 3 Mar 2025 12:15:22 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8511.014; Mon, 3 Mar 2025
 12:15:21 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Fix timestamps in firmware traces
Thread-Topic: [PATCH] drm/imagination: Fix timestamps in firmware traces
Thread-Index: AQHbhE5UcF+DxSJIQki0ekZvrkHCCLNhY0GA
Date: Mon, 3 Mar 2025 12:15:21 +0000
Message-ID: <41383f9a-ff72-4911-aa2d-00702a8d62eb@imgtec.com>
References: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>
In-Reply-To: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB5545:EE_
x-ms-office365-filtering-correlation-id: 2d78a02f-cbdf-4762-e965-08dd5a4d120e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ckxCdWhMalUxODRLcUZIdEpTVDE2WCtSdVNYRVgvblN5cHNLZThHMUdzVEF0?=
 =?utf-8?B?eS9CVkRkUGpJT3VhVzRHM1A4QUFzcWtidDdtSkt1cEcyblFWZk95d1dsWndi?=
 =?utf-8?B?dXR6aW1PRStiZHBUMXZlNDJNdDVVV01JaDZNYyt4RG9SNE5XWFZ0U2ppN29r?=
 =?utf-8?B?WUlkS1psc0N2eWQ1RzgzVGxGNFByL052TEdUUVVzU054dlduOGRjNzJMa1c1?=
 =?utf-8?B?TkszN1Y4cXZmc25RLzZ0QytKV1hMZytkbU1mUENpY0lzUnlXNTl4bjFqNFlo?=
 =?utf-8?B?YnVYeTRNaFEzZ2lINjVTN1daTWNaem5pdGhNN3ZsTmpMVk5qU1NKOU9kU3o4?=
 =?utf-8?B?WitxSHQ0T1o3VCsvdkRSai9XREYzalhPVEpZc21OVnJDQ2dpR2hOS3lLbTZi?=
 =?utf-8?B?ei8rSFgrZHUxdVcxTGpZeDVtWXFSdGR2Q09qVStzem4rMmtsZ3U1cUl2VE5N?=
 =?utf-8?B?TXEva1pFL0ZIS21BS3Fvc2lhcG4zWmpjLytpUExBUEtsbExFcmRXdkhNVzBG?=
 =?utf-8?B?VEh4RGpmVVhNNVpKL0NOazN0L2EzZHpTYnV0YTZjaHBYV1pGY2lmcTg1bmMv?=
 =?utf-8?B?eE9zVzBKQ3NPUGlpWHRBZlBqcjZoQldmYWM4bS9qdHdCOHRWMDZWeXpTYWFD?=
 =?utf-8?B?V1U2ZzVUc0Y3NlhGVjdVTVpkQ1RVSGg4aElMQlFrYUlUVnAxaVk2WWQ0WDM2?=
 =?utf-8?B?OUlQb1U2WDRYdUlKSU1xcHB5Vlo3Tjk0dGY3ZU02azcxNXN4QXBCSU1ieXVX?=
 =?utf-8?B?cFVTRWlnMHpwVVd4WGRFQXlGWSt2bHpOczROcXZDR1lDd0VJc0RZMFNIUVRw?=
 =?utf-8?B?b3IvTkkyM2JxSURTSFVYQ1ZUbEt6STQ4WE4vWG1LV2tlYWpIRHN3dHZSeStn?=
 =?utf-8?B?c2J3enNDZkRUOVM5ME81bE9zNlAzTGk0UlgvLzFWL2FrWVZYUFBvbGFIcGRv?=
 =?utf-8?B?M1VRUnAxNWx2UFo0bHJvb0dTck9ISnRvYlJKdUhwTGxRa0RJTHFWb0hQOVdu?=
 =?utf-8?B?MERwbE1sK0JBWTlWUm1ueHB0L21DZHhHaDZIVFhxOWFueTBmdG1ZcjNGMHU2?=
 =?utf-8?B?ZEVUZU5zSGtLMndPYmVHQTU1N1FydUNCZVZXZm1jU0IvZ2QxZ2VqNXowWWpE?=
 =?utf-8?B?a1FCUkVlcldiYWNxa2lzNG5tZG5TY1dScUZ2em9JVnNDVTBJRDd3Q2RnZlJv?=
 =?utf-8?B?WXFUWkhiYitqRVFrcy8yOEgwVG9UdW9OczRVZkNveXdsci9iOVdEdUNaRE02?=
 =?utf-8?B?WkF0bllLZkRleGRHWTdWbElGUzMyN29kOU5KTFFRdk9zQjZ3Q0RYYUJWL3Bq?=
 =?utf-8?B?QTAxRERNSEtmTGtjTDBhdmliMlVLTzRnV1N1aWQ5cHk1WDUxQ3dCWkFvN1cw?=
 =?utf-8?B?d3dNRFZVRkJIb0dPeEFiMERjY0V6dit0R0Q0ZTdPRzh3ZXpUSHpOdjVwR1pF?=
 =?utf-8?B?TzE2dmsvaHBQcFdBL1RPRE44TjFXaS9VSG9Hd2pHVDZCektBdkZsR3dwU0xF?=
 =?utf-8?B?UHNGSWszL1lWK0ZhaUZYUWdKWTZCUmgyRDk3QXZkNUlvN01DTWd0eWdpUFkw?=
 =?utf-8?B?cG1xWVdPWnFEK25xekQ5anZhR2lzTVZYY3BOOEVyTU90bEY2cFBoQjAxSjEv?=
 =?utf-8?B?Q3pTbGp3Z2JEMERrUFNtWnhVdFA1VTJNQUFCQnl5ZHI4MnhjQU9BZW1rNXEx?=
 =?utf-8?B?SFJHMjNDVVJ4azJZb090TnhzUWo3c3Q3MmM5Wjk1TU1USktIYVArMWQ4Nlgz?=
 =?utf-8?B?dERaV0NhUzd1eFk2NzZRYW4vT3FJcUdyc1FYVGMrZFNQMWhkd1hCUTRING9p?=
 =?utf-8?B?NlBZaS8yL2ZhZklLMytnT2dFUkYxN3psSjQzODJtTnlXTU1wY2tvdmpGbUc3?=
 =?utf-8?B?RFZndHNyZEprSGxFNzlVT1Jaa0VuK0VOSCtPK1FPSTRpZjJGbWYxRzkzalho?=
 =?utf-8?Q?yjmeoOyml7q6Nat2mcpHHEB9bpBhzMtd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXh2b01WRHFucEN6clBrdGhtL0NaYWY3ajZwbUFBQWRzdE82WEN3bU5hY3lR?=
 =?utf-8?B?V0xMUDI4VWNtYTNoSTdUVjV0NWUzd3phYnF6Rk11Z3RyNytEUklEM1ZPQ0dn?=
 =?utf-8?B?dXowQlBXNDY2ZUpVM3kveEFObEV5cHBqTWN4ZmRLdHlvV3VMaFh1eHgxYUZo?=
 =?utf-8?B?UXlRdi9uUFJnSFJMcGZXU2JlWkFseXhTWEwzL0YxOXZ0bmVMZWtmcjlRQmhX?=
 =?utf-8?B?eGxkdmVQMHl5cTBENHh4RUFpbFRqRkZVbnJtOXF3Umg5b3JUaXdpN20wMVRh?=
 =?utf-8?B?aWhIMEljYk50YlkzMmxzZTBBYS9xakpiTFhYeXRhSVFvcnVhdkUwSTJ5dGtN?=
 =?utf-8?B?U2EzRE8remcwc0dpSDg3K0NOeFhjRzFTUllDcEtFNmVRblZjUjRpbE52SFFC?=
 =?utf-8?B?Z1hDUWJHeHBQbEtUU2VpOGFTUDdncmpSVEhPWVR4ZXZFbFo2Tm9uMHVYY0Vl?=
 =?utf-8?B?L3YrMklNaG5mWE9NZmlabEJHbEdiVmNMSG1rNXBhYmoxOFE3c0p1ekszY0dL?=
 =?utf-8?B?TG1EV2w2SGZPa2VVRm02MVBDRzdLa0tZVmZoNEsvUHMzR1VrWU5PVll0R2Ns?=
 =?utf-8?B?dzc3TVJmOFIzdHBNUkE4aWgwV252M01UVGZDZ0t1RlFDVUREZFhWK2h1V29R?=
 =?utf-8?B?WndxdjhjSDRsWWx1dWRJQWZLa2QxL0t1TGY2YVYwR3FmdWtidTlJdy9IampV?=
 =?utf-8?B?cE03a0szc1pFOVJwYXRISWY2UG9nN3piTmNvak1hclpFUW1halMza3NBMk5m?=
 =?utf-8?B?S2V5ZCtEdnFXUVdzOVRkODJvYmNzMVExNnpYb3libnY4aDF6Zmh3TGoyc2N5?=
 =?utf-8?B?T0VXc2lpc05WTlc0NGxCYldoTC9ML1MyYmVFa2EwQUpwL3RkVEdaMGk5YlNM?=
 =?utf-8?B?eDF3eHZybkZNRFpvdnNHdkZuOEJYZjZadVNpb2k2RUJGa1ZMKy83cW03Q3ZC?=
 =?utf-8?B?ZzlZSDJFWlk3ZTdWTjVpbzRDNEFJZmRhVWFqUFVLNERueWxpMzhqeEwxRm9E?=
 =?utf-8?B?aHFXUXZXd00rdGI4Q1czY3NQd2ZXNGpueHAxbkJvTmx1M2xvcVJFZXRSMlM5?=
 =?utf-8?B?elpwOXppOU1acjQyQ0UvYTVIa2ZzOTROUzI0Ri9kdVgxNjA2U1ErSDlETDg3?=
 =?utf-8?B?NDloT0ZnV0oxM2FPbUZiRXJoQ0dHU0hMaEdQbVZiaTducWdiSjNIdFBuNGcv?=
 =?utf-8?B?WnEvRVFyaUVUNituZUd3SFI0YkRFWDlGb1RIaDI2clQwRDViVnc0ck40SVBa?=
 =?utf-8?B?ZU1CN3c1WDJ5ZkpDOUpMd0NzbjRzcjE3Y2p5L1FoM2Z1dmhxVHlFdERCT2VZ?=
 =?utf-8?B?S25UTDdDdTlDMkdXdTJJUmpzNVpUODMrZnZLc3dhMnQ3VG9RSk00cEdCVFlV?=
 =?utf-8?B?SzlmdEwrWUloNlBiTnh5TWd0NGlWaENOVjhWbmtsWlZ0NWJVM1FxSGs3QitC?=
 =?utf-8?B?Z0MzTFF6bTVHYUlMbU5Kb0pUOXlPVTFUcjVmdEs5MlRYZGdvTXgrWjFoMVpz?=
 =?utf-8?B?M1p2THRjTm1ocVdQaHNpdGJublVCanBnUUZQem1nc0U4MnVZSTNKd3pwdkd3?=
 =?utf-8?B?aU1HLzRUZ0FZc1VOU1VBdS9UenFWQzljRityTWVORXBkVXpheWRKWW1hcXFQ?=
 =?utf-8?B?Zk5TcmZPSFRwTEZXNWZoTzVCYlpLT1BXL2NTSTZ0YXIvTkMxQmRMNDArS1hM?=
 =?utf-8?B?NWdGZVYrTXdKbzZXWWR5M1NTSGxaMVpPbkpNZGZoeTRuTGIwL2dUeVZhMDN2?=
 =?utf-8?B?NFlENGpXUDhnMFZGMTJBUC84a01NdStyRmlPK1JDNk5jWWxmM2dwWlFKeFNJ?=
 =?utf-8?B?TXIvT3FyTm04RitkOVdwRUlCZnNHZ0VZMDFSemw3NXpQT3FpZnUrLy9rWEdr?=
 =?utf-8?B?dGtIcjIwVU5IaDVXY042L2p3Qm5wRWE4WGFKUERrVFpwQ2YvM05KUCtadDdZ?=
 =?utf-8?B?L2Y4QnVyeGJES01pYSsvck9aS0Z5RUh6QW8vTm5Udm9Cbi9xd09pNW5KaFJY?=
 =?utf-8?B?cTI1K014bUN6TXdoOHNRVmlrSS9KZW5UcmVqSGJLK0NPaTdOakhScGVnNkxP?=
 =?utf-8?B?WWVMYnNycmRSMEh2RTNFdndWd2dibSsrSmxmNUFZVEhXQ2JHUWdGS2ZZV3pq?=
 =?utf-8?B?OUpFbHdWNkRpdWxDT0F6dkJHQ1Z3NnEwTDBDQWFxVndCeGVmNDVuYldLa2Jq?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0vemu6xsu9YSoNKEZutSks1n"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d78a02f-cbdf-4762-e965-08dd5a4d120e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 12:15:21.7981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/vPMRsWvI8qR4rfQ0QeTm4qrAXb2uhY679FEgAzYtw1Xkc4wI0gLWFgh5ClhgMxveVGU/ffhxvBj321Up+ZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5545
X-Proofpoint-GUID: S6zc-KxCnLPVvyjcn8NWWR37QYiL8Fyg
X-Authority-Analysis: v=2.4 cv=LrJoymdc c=1 sm=1 tr=0 ts=67c59d5f cx=c_pps
 a=8AFXndYnQsE2+LUeOUhaNQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=2x-M_CQUNvYS4lfhux0A:9 a=QEXdDO2ut3YA:10
 a=H4iVpIH6G83k7J_TZmkA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: S6zc-KxCnLPVvyjcn8NWWR37QYiL8Fyg
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

--------------0vemu6xsu9YSoNKEZutSks1n
Content-Type: multipart/mixed; boundary="------------Z71xSNsWKWxLbp4ORfFPkbTJ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <41383f9a-ff72-4911-aa2d-00702a8d62eb@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix timestamps in firmware traces
References: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>
In-Reply-To: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>

--------------Z71xSNsWKWxLbp4ORfFPkbTJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21/02/2025 10:49, Alessio Belle wrote:
> When firmware traces are enabled, the firmware dumps 48-bit timestamps
> for each trace as two 32-bit values, highest 32 bits (of which only 16
> useful) first.
>=20
> The driver was reassembling them the other way round i.e. interpreting
> the first value in memory as the lowest 32 bits, and the second value
> as the highest 32 bits (then truncated to 16 bits).
>=20
> Due to this, firmware trace dumps showed very large timestamps even for=

> traces recorded shortly after GPU boot. The timestamps in these dumps
> would also sometimes jump backwards because of the truncation.
>=20
> Example trace dumped after loading the powervr module and enabling
> firmware traces, where each line is commented with the timestamp value
> in hexadecimal to better show both issues:
>=20
> [93540092739584] : Host Sync Partition marker: 1    // 0x551300000000
> [28419798597632] : GPU units deinit                 // 0x19d900000000
> [28548647616512] : GPU deinit                       // 0x19f700000000
>=20
> Update logic to reassemble the timestamps halves in the correct order.
>=20
> Fixes: cb56cd610866 ("drm/imagination: Add firmware trace to debugfs")
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_fw_trace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.c
> index 73707daa4e52d13fd1388cb2e9feff0aea109620..5dbb636d7d4ffeea2253ea5=
8e817710979f90cf0 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -333,8 +333,8 @@ static int fw_trace_seq_show(struct seq_file *s, vo=
id *v)
>         if (sf_id =3D=3D ROGUE_FW_SF_LAST)
>                 return -EINVAL;
>=20
> -       timestamp =3D read_fw_trace(trace_seq_data, 1) |
> -               ((u64)read_fw_trace(trace_seq_data, 2) << 32);
> +       timestamp =3D ((u64)read_fw_trace(trace_seq_data, 1) << 32) |
> +               read_fw_trace(trace_seq_data, 2);
>         timestamp =3D (timestamp & ~ROGUE_FWT_TIMESTAMP_TIME_CLRMSK) >>=

>                 ROGUE_FWT_TIMESTAMP_TIME_SHIFT;
>=20
>=20
> ---
> base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
> change-id: 20250220-fix-fw-trace-timestamps-15d70bb2d93d
>=20
> Best regards,
> --
> Alessio Belle <alessio.belle@imgtec.com>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------Z71xSNsWKWxLbp4ORfFPkbTJ--

--------------0vemu6xsu9YSoNKEZutSks1n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ8WdWQUDAAAAAAAKCRB5vBnz2d5qsPzA
AQD0NEAVr0pb/AMg960vrqgjTRItnaQqzrkEgLMet/wSHwEA8KUO5t0Zsn14m6izG7g3Lbtqrqpn
PIVGVUqBsjWjugM=
=c5Te
-----END PGP SIGNATURE-----

--------------0vemu6xsu9YSoNKEZutSks1n--
