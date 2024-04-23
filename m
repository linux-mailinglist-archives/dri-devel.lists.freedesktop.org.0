Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DEF8ADFBD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 10:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B431131E8;
	Tue, 23 Apr 2024 08:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="p+o2Jyxs";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="n9zLast4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0061131E8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 08:29:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N7Vm3N028369;
 Tue, 23 Apr 2024 09:29:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=MJBxiuKicrCp55KDqmgEr
 BvjJMveLthWlWMWbgFzqkE=; b=p+o2JyxsbjoNbgu8sM5Rr6Q6BMo3jLCaLVdcO
 y1AMpCAFJO1XS0C1ww1IB3R751VrBy77MNPYaqyS85tDF5hCw+qnW/sqPNl0jFNM
 Qruq6A1dS2Gw24pr76mpXUkLDAvJHuZ8MK0gIR6svGVIByV+0lCYZu9KFrMEJOK2
 ntjTpldkf6bI+4QRY82JE9sw9b9dcZWLLAV7hg8ZeP9/fje+25JlB+fBM2q9fKoI
 mkpt3V4/QrWm8qkEPhZ+T4Jeg0SQEz7lkVDeAdN7OW/EW32npcj/RI2+e24oFt19
 pGUoF8lqdcctI2evi53HnCDVpsUHiKwAdpSaAF73KbM3o2WzA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3xm3ynkbvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Apr 2024 09:29:31 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 23 Apr 2024 09:29:30 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.5) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Tue, 23 Apr 2024 09:29:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSz6NzyD0E87VJ7QbTQ+Npg7uXM2FGumj19yYln10oowGuTXlE4bpL4jD/Ws5S1lBjR+L5+iqRBz4YwsA88wTtUhmLS9+Ph8otmtKwv0tpp6qm12294wK7M1ehZawNzdMsOGKuDWGQ97U2f/4vmyZN4Owp/O4Cih5v2xE3AQGOE06t0aVVAZ+Ma8skLRd/dbCxaDMSW52qPRfI+Ny0ZjZcPoIATIA/D0h0YCAkOdzeENQ+yxYu4ApChR8DTjYjm3HVDnwFp1qzEOZ70pJLv77KwtRm/0gWhTJzGaPH156DeKgf3FKgIWxQ9FK4QdxN5t1k4wV9+4P75kfcEkojjIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJBxiuKicrCp55KDqmgErBvjJMveLthWlWMWbgFzqkE=;
 b=jg44gX7ANpidXilvTewvheSsUz0t0bcqZDphATuH8bP9/xUPTidTWNV9wF4uaZxQX4EVJKrHEUiwng8+mZSDMyJI6cMYHE5xeTIxoDbnkCINCVePIWqi02BQGQw4q4u3j30wN00fqU+Rj4piYGnN6wv7EgMQdYrpJ/xHEmFkc54ema5kQtM3VgIgk6iyifP53rh/sB2KpZNXsO0Z1m2dH8aMEFQ6Qj8QoSRRB9SZm87KoV8ssm7SAXuzbaiTBrMKsdz8+zW3byuIfT4/emK+aAA5IE60BoTs13EifYx+LY0awOOiz9biGyhJmC0T4GKSASY6gQE66bHezjq2fM9YEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJBxiuKicrCp55KDqmgErBvjJMveLthWlWMWbgFzqkE=;
 b=n9zLast4VL9avGUpFuJEpHZ4bpagMuYW7wiwKT2sFTj/d9K2jV0IPLyeynycPdU8QB4iubnCC91HJ8KUJQ3OLJFXMUw63gDUB4IuvEf387yajsgekC8EJ0yIdMr0tWO+EaGbHJAJqAg1Sy8YXxt26pIpGaBDK1E/JOhzbKNrK7s=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB3597.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Tue, 23 Apr 2024 08:29:29 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 08:29:29 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Frank
 Binns" <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/imagination: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 1/4] drm/imagination: Convert to platform remove callback
 returning void
Thread-Index: AQHalVhbnLqJEunsCESBk+pBINrtNA==
Date: Tue, 23 Apr 2024 08:29:29 +0000
Message-ID: <bd37ff0d-9f99-4993-b198-af82a98fa1e4@imgtec.com>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <4cf10e420863f40a268f26b9bdb0c4b53dbf3406.1712681770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <4cf10e420863f40a268f26b9bdb0c4b53dbf3406.1712681770.git.u.kleine-koenig@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB3597:EE_
x-ms-office365-filtering-correlation-id: 98b2a2f1-52a4-4b4f-bdf4-08dc636f7e76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?ZURXMGE0d1QrUDNwRXpsT2ZTcXhmRmtOVEpkcTlQKzlKZVg4RkU5U0V5cFpR?=
 =?utf-8?B?d3hOa3ZkMTJ1bmNuTS9BMmhabm1yUE1YUDRVSUxYZ0JVdkpOV0tBYkhOYXYz?=
 =?utf-8?B?VllRdldjOEtBTDVoaU9qZ2d0bUlLdUJBQzFTK1ZjTk81cCtKbTlGVDFndkJm?=
 =?utf-8?B?dkUvazdwbkZKVnZVeEtVVVBNdEozb1BnRFJUUHJIWmpqanB0K2hpR0lpL2Rn?=
 =?utf-8?B?Z2FOM1lGK2k1clNTanVKVG12anZ0RFRjQzJOa1VrVXBENVZ2WFA5cVI0Tkhn?=
 =?utf-8?B?RnNDUjVQMGVLQVhqcHQveFQ3SVpJTGZOMC9TeHB6VVFMU1l4ekhOVzRwUVFo?=
 =?utf-8?B?UDM3NllGVjZ2VU5BZ1k0dnJFSkpLUExkRWZiZUhpY1hpSWhKYmQvMlhnRmtV?=
 =?utf-8?B?ekNSTW9WWHF4RS9ya0Y2d1JZRW5ELzc2NE1FQys1Lzl2VU11cmRrR3FVRWhO?=
 =?utf-8?B?TkVPc1pwL3JzRTNBaEo4QklxOG11UXhUeStpN0VYb1pWaUU3VElPWWFld05m?=
 =?utf-8?B?MlNnMkhCdk9XNHlPSVI1OFNtemdoeGJVWjM5RGhYM0hObWVRQmRRc3FzTmti?=
 =?utf-8?B?N1ZGWjRmR0JwSDAraTcyMDA4MzlobjAyZTZ3VnBVZml1VEZ3OHRTZlFWeC84?=
 =?utf-8?B?bHFncDVtZ0U0YUJMdVBRYlUrdHE3aUpmVTdvditIYkltam9XYkFQYStaQVBh?=
 =?utf-8?B?RDVaRVB6ZVhwNHplUWxsRlVYMjZDOGxoZ0h3MW1WdTdlK0p3aXlNSXdDSXBq?=
 =?utf-8?B?MFc3cUZMN1BuTmgyRTlEbUR2aEpFUE1PUTczcE9yYVoxU3plci91cXhUTllo?=
 =?utf-8?B?VnNpRFozZ1BPbUZmTlg3bHpkTG96RHBvVlVlYnRyUlh5TFdWeEVucjBzc21w?=
 =?utf-8?B?SHVHS2VVMnd6dHo2Qk5CS0lxNE1TaUpOc3oyaDR0Y01sZWhKVEp1SVdJczVx?=
 =?utf-8?B?VHVnbFFtV0l1bmtrWnVRVDBxaHEza3E2OVplRnFac0ExbGlvTHpqMlVMNDht?=
 =?utf-8?B?QmdVY1g5dkxQSGZsUDhXRENBZHlaR09EM0NBNTU4Vnd6NHhsVVhNbEdaTU9Z?=
 =?utf-8?B?K2lDQlBZUE1YZDdETjRBWEJRblpoSkxLdk8ra3RLdk5vVlZrQkIzZWdSVkgy?=
 =?utf-8?B?amRyZFptUEpHVnZ5bDB3Rkp3bzdpemRQdEEweWlRYVhEdzEwQ0ZyNTVtcGor?=
 =?utf-8?B?bWtrMERKY25EZFpiL0ZYbjdiMzlCM044YmxDZU9KbFNQUXBYOE94aE0xdUgw?=
 =?utf-8?B?NVhhS0ZZY3lWYmN6em5lZTJNOFFxUGxNZ3dSZjRGVVZtbnd1YVhDU0hBdm9L?=
 =?utf-8?B?RlZBMjBPdWhTZldDdmx6TGNNTUdMb0JSdWxzUDZrMzI1aGFhc0hEWnRPdzBl?=
 =?utf-8?B?Z1lhclJacDgwT3Q3Q1NFc0FCTm5HOWllbUttUFRLTVB1M2gzaWpCMFFJcW0x?=
 =?utf-8?B?QndYNlVkeCtmQjlYTGlqSVgzc0UvRzE3OUE4aUlNY3VZZVBVVnk4MU1YKzM0?=
 =?utf-8?B?ZXJ6VEZ0TFJuSmNEa0luVUViaTZSSlltK2pvNWMrRUhYT2g4QW50d25MLzVj?=
 =?utf-8?B?elQyTGlvUHk0RWZWUk1QSlpkT09BNlVPL2Q1bzI5aDhrU1RDOG1oQjdhTEt3?=
 =?utf-8?B?VVlnSVcxNjZPTEd4WFhDRnVuRlJtUm9mQUR3ODM3MllNemYwTlZIYjFqZm1N?=
 =?utf-8?B?OStJRXBpZGdpMmpLZlFxN0FlT1JWdEJXSFdWQkRWTjhsRDVHZnk5UDZvb1c2?=
 =?utf-8?B?Rzc1RlNBSW13T1BMUjZmdUFWVlZxS1M2ZElFRmxTOGVrNEF3cjkxeU1GeEw5?=
 =?utf-8?B?NnZZV3BuUWtmNHAxa295UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWgyK0hkNlIvbW1UQ1BzR3RteFFuSTBybGcya1E2alJaVUtYQXZCb2FPL2M4?=
 =?utf-8?B?WnBmOTRWREFPSjlOZ3dqeW51THVaMW5BVHVsbEdBbzZsdTZRVkNDck5mWnRX?=
 =?utf-8?B?ZVlGWGN2dEFnL1V4WFBYQkd2QTlCNy8zUEF1SkxEL0VEN2xISG5vYjl6KzB0?=
 =?utf-8?B?bldYL1NoejluLzUvb3Bua2xmZ3hLSmlhMDQvRlh3aENvNzh6UnJSQkFsalUv?=
 =?utf-8?B?SFVPM0tackg0eHRUMXRwdXN1RlNUZ1J0NnFCWWV6bDRsNG4wcSthb0ZINnFs?=
 =?utf-8?B?azgyUUFTMmJwYTdhVk1aK0xqRVJ5MnlXMFptMDRESUlpSDlHN3dBd3FJdURR?=
 =?utf-8?B?d2tsK0JHK0R0RHpraUJNWm1rNWtjeWNEU1owNmZKOFdwNk5uRW5VL0srR2li?=
 =?utf-8?B?ZldPR3g4bUlYSDNLSVdLLzdUWU9HQVJXV1YxZWU3c3lMbUtqNVhTczRndG5i?=
 =?utf-8?B?SFp4MWR2b2dydHJLNngwdmt2SzcxalJZa2VweTM3OHFNMUZMUHBHWlpqSllt?=
 =?utf-8?B?YnVLQXBFNlpYWC9DalphcnY5anVnMExlTVFKYkFTN1UxYTNCOEdkNldJQUFN?=
 =?utf-8?B?ODF6R0JVOXZ6R2xReXc3RWZOeG9oUTV4V2xqR29vSjBTd3VqclhmZVVpUXpz?=
 =?utf-8?B?Zk9HV2FEUnM2bEg0L24wVWp5bUQwVXhRV0phNjlVbGJMUkdYTDRLdWZMWlNi?=
 =?utf-8?B?ckVPUkJiajhxRkkzTkhVc052UmZpdnMxemZwZm5sbys4clp5WnF3bnNoYUxo?=
 =?utf-8?B?TjR0YzNQRWZKekVQZDFzbnNCeXMxQ0FTcEtZRzZlMk10RFVDSENjUkx5RnZz?=
 =?utf-8?B?UnJVM3dCZnZHWXRDK2hOWmtUK2tpWE5FVFQzRWNNWXZGdGpxNXZvSjc1emxk?=
 =?utf-8?B?b05RVDRwSkJqZ2tyY3oxbUtWazcyU2VEZjJqajR0Qk5vcFhubXBBYVB3Q2Fv?=
 =?utf-8?B?QTA3YmVDQWpsS1JiUWdvNU8zWlpCV1JkUGN5TDhtOWtoeFlKdURNYWJFenFj?=
 =?utf-8?B?L25nS2g3SjVpckw5LzlLUFVlTXp6YUYydThNMzVxZXpoVUtBaFVpajJNTC90?=
 =?utf-8?B?UjR3dnB1bUk4QTFvRjgxZGFuVVBzdlp1bjV4YmZMR3JQUUpkblV0WXdBZUhG?=
 =?utf-8?B?Uk11dzBiaVBhWmxzdU5RZ2gxMWo2ek9qTkJxV3dvK0l2eVhkTkJjdGZEalhL?=
 =?utf-8?B?dHF3R1ovSGlBZHhOd05XcUYyTDlsd2hJKytMb0Qzd2hWY3NPcUt6VzR6Q0do?=
 =?utf-8?B?NjczemNIY2trcTg0aDdCcXhISlFRa2tJamFta3lCemNWZDQ1VHR4azZUejJh?=
 =?utf-8?B?cmQ1RkNOR25DTTVmZ0pUL1pNdU1kUHI1MHJieUZNeGZISzlhTlhLaW9SejZX?=
 =?utf-8?B?dkhreXRqNnBUNFBPMksrbXVaM2M3N0pPWkp1MzZ3b0pRRXE0ODJKaXAyb2oz?=
 =?utf-8?B?NnFNampRUjRwUTF5RlQzeGtQT3VWMEhLaUh3K01ESWEwN0gyUEVHUlVDYytB?=
 =?utf-8?B?MTBNNStURWdqSFUyQmU3NFZxdVhwdksvLzR6RUNXanVDakJSK2FZeGNyK2pL?=
 =?utf-8?B?dWF6bS85ZXFOTVd4a3hoVjBmcXVuaVBXbVNBcnJkRGlKQWlYQmptaU9NSmtv?=
 =?utf-8?B?ZnRFNU9BRTZ4Y2FoTjI0WTV2OW02VXg1cnZ0ZXpzSjYyVTNNL0xncTNEYjBm?=
 =?utf-8?B?Q1IvNjUzTGpwUGdXMzNKbnltL1VEYUZSZnlyUEp3QnF0UnNZWklnUjRtLytB?=
 =?utf-8?B?M3A0TkdscXJwTWRhZVBWSk1vWG5JdTlJQnJhOCtNUGJTTVc0WGhUa08vKzBu?=
 =?utf-8?B?RTllZmIrcjJSNjNQSlJaT2dRamZ6M2E3dTFIQjdaMFIyOVpZeE8wUC9SSXpX?=
 =?utf-8?B?QjI3L2Y1L0V2UDZHVjVLbHo2L3cwTjJ6cFc2djBWM2VNQjU4SHlTeEx0SWJ1?=
 =?utf-8?B?M1RFb0g3ajlaRVM5cHJsQ1ZNK2pVUjEvMVp3Wld1NlFFc2hYSjBkeXVLaTFM?=
 =?utf-8?B?bU94UUVJTU9YRDYrZXJyY1owUWxCMklPazliaVF4bDVZS1RoLzFXaTk1bFpN?=
 =?utf-8?B?TmtoTHhPL1VCcUx4QlFVVzQ2NW9NWmFMQ08xN0VlZjBoN0xkeEhRUmh1dDZ0?=
 =?utf-8?B?ZjNJR2pSekdka0MraW9ESjZ6ejlxb2NBMjBuRnlEV0o0MlN1TmtCNkt4VkYy?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DS4iVkYFtfUI0Sj48a6xkNeN"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b2a2f1-52a4-4b4f-bdf4-08dc636f7e76
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 08:29:29.3675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBWfrPs0dWbxsEJMtAYCKhUIsfrgINtiqhXTkCNQ3ziXvh8EXCxn1dSz2XlVPaVLwaR3dFlD6zvHpbJsx2prIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3597
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: c_IABj6VH72-eLBJHzz-5jIhgspn2H30
X-Proofpoint-GUID: c_IABj6VH72-eLBJHzz-5jIhgspn2H30
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

--------------DS4iVkYFtfUI0Sj48a6xkNeN
Content-Type: multipart/mixed; boundary="------------WUI3MDEjRC00don0BNe4RcBx";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <bd37ff0d-9f99-4993-b198-af82a98fa1e4@imgtec.com>
Subject: Re: [PATCH 1/4] drm/imagination: Convert to platform remove callback
 returning void
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <4cf10e420863f40a268f26b9bdb0c4b53dbf3406.1712681770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <4cf10e420863f40a268f26b9bdb0c4b53dbf3406.1712681770.git.u.kleine-koenig@pengutronix.de>

--------------WUI3MDEjRC00don0BNe4RcBx
Content-Type: multipart/mixed; boundary="------------WomSbAqL9h6g3Sr61OvBQzcE"

--------------WomSbAqL9h6g3Sr61OvBQzcE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/04/2024 18:02, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes=

> many driver authors wrongly assume it's possible to do error handling b=
y
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers=

> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Matt Coster <matt.coster@imgtec.com>

> ---
>  drivers/gpu/drm/imagination/pvr_drv.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index 5c3b2d58d766..1a0cb7aa9cea 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1451,8 +1451,7 @@ pvr_probe(struct platform_device *plat_dev)
>  	return err;
>  }
> =20
> -static int
> -pvr_remove(struct platform_device *plat_dev)
> +static void pvr_remove(struct platform_device *plat_dev)
>  {
>  	struct drm_device *drm_dev =3D platform_get_drvdata(plat_dev);
>  	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
> @@ -1469,8 +1468,6 @@ pvr_remove(struct platform_device *plat_dev)
>  	pvr_watchdog_fini(pvr_dev);
>  	pvr_queue_device_fini(pvr_dev);
>  	pvr_context_device_fini(pvr_dev);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id dt_match[] =3D {
> @@ -1485,7 +1482,7 @@ static const struct dev_pm_ops pvr_pm_ops =3D {
> =20
>  static struct platform_driver pvr_driver =3D {
>  	.probe =3D pvr_probe,
> -	.remove =3D pvr_remove,
> +	.remove_new =3D pvr_remove,
>  	.driver =3D {
>  		.name =3D PVR_DRIVER_NAME,
>  		.pm =3D &pvr_pm_ops,
--------------WomSbAqL9h6g3Sr61OvBQzcE
Content-Type: application/pgp-keys; name="OpenPGP_0x747F0A9036F90DFA.asc"
Content-Disposition: attachment; filename="OpenPGP_0x747F0A9036F90DFA.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLb
kxJDF5DNJE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMW
CAA+AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8K
kDb5DfoFAmRHxyEFCQWsiK8ACgkQdH8KkDb5Dfr3+QEApzVEKHrbpxJqs79GRaXU
/NAQBxzjwBd4wKxqr5gkUxYBAOuK7Ag2dAZzFUp73tKxIN9uyMdCLRXWvAYqYL7l
uRIIwpYEExYIAD4WIQQFpAz85yadYdlxAKF0fwqQNvkN+gUCYl2lcgIbAwUJAeEz
gAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRB0fwqQNvkN+uO8AQDM69Bb0Wqj
7kyzEejIZa9/93vdzHcDmuiQxxvXEUqQ3QEA9qBYj3PBnWD1Ijhj9bm/Z6S93d1x
w97TbUrxgwJYtgrOOARiXaVyEgorBgEEAZdVAQUBAQdAJpULxfns06/aM1t5eqM/
16RjuvPLtq6IRnk/FoNZRBUDAQgHwn4EGBYIACYCGwwWIQQFpAz85yadYdlxAKF0
fwqQNvkN+gUCZEfHJwUJBayItQAKCRB0fwqQNvkN+oUpAQCzr1PYZLdOHo0mC9kK
cCXza1Vj3VRNPMegCSi/y9+LogEA+lwceHgTNihH2EfhRGIEMRyJCSyze3qnj0bM
2vS1pgHCfgQYFggAJhYhBAWkDPznJp1h2XEAoXR/CpA2+Q36BQJiXaVyAhsMBQkB
4TOAAAoJEHR/CpA2+Q36hQMBAJQdksAMGUeGOri0s1I5uIdMJmhhegBeTk1GZpbx
5oKxAQDyJegbW7BJHeFd1+GFSluU49tsGvF8mlUzdLb9LiJWA84zBGJdpfQWCSsG
AQQB2kcPAQEHQEYOlTQaog5wQoLiS6u6OTaKjyi2mXKU9WbtwC/v39vdwsA1BBgW
CAAmAhsCFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmRHxycFCQWsiDMAgXYgBBkW
CAAdFiEEuKg5qCb8JioY2PpzebwZ89nearAFAmJdpfQACgkQebwZ89nearAP2AD/
ToBHghxjebEQsJ5lINO0PlpCTSXXry3IXdmFTvkEUHkA/jjaGla5ImGH/q1xYjt0
RbBybflzR7ibrXcoMFqkAqIGCRB0fwqQNvkN+iVNAP0SzMEkBYft0Mch8owZAl0G
ePG2w4C2jSdSvvZC7owfnQEAzrnZuanxmAohlm6JFxel+uU3qzdIgBq2bJsDwXnK
Cw/CwDUEGBYIACYWIQQFpAz85yadYdlxAKF0fwqQNvkN+gUCYl2l9AIbAgUJAeEz
gACBCRB0fwqQNvkN+nYgBBkWCAAdFiEEuKg5qCb8JioY2PpzebwZ89nearAFAmJd
pfQACgkQebwZ89nearAP2AD/ToBHghxjebEQsJ5lINO0PlpCTSXXry3IXdmFTvkE
UHkA/jjaGla5ImGH/q1xYjt0RbBybflzR7ibrXcoMFqkAqIGocoA/j+eZa4A8PV9
SfjDjTevuuodrN5Ajq3t8vhoDDR0NmmuAP95JQyBAYiVTVCEVs3gzMXnL7HkjeWc
GOZEeJL7u0cxAw=3D=3D
=3DLApB
-----END PGP PUBLIC KEY BLOCK-----

--------------WomSbAqL9h6g3Sr61OvBQzcE--

--------------WUI3MDEjRC00don0BNe4RcBx--

--------------DS4iVkYFtfUI0Sj48a6xkNeN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZidxaQUDAAAAAAAKCRB5vBnz2d5qsGwS
AQCxRWCkalxDQ+RBGj5+uDy5o1dqvD0eCPP9vSPXjqv1BAD+KcwBtjhefjWXiLK1w2B7gJwT4FjH
TlarF7TuqAHNsgE=
=OVF9
-----END PGP SIGNATURE-----

--------------DS4iVkYFtfUI0Sj48a6xkNeN--
