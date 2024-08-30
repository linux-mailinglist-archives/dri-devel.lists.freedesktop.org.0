Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016096641C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 16:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9C910EAA5;
	Fri, 30 Aug 2024 14:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="q4z3wlW0";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="fKrNJqdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10110EAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 14:23:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U5Z18X030709;
 Fri, 30 Aug 2024 15:23:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=6QrSz8770DRP0YNyf/NqDm5gj
 cMp13iJkBgTfJuJyT0=; b=q4z3wlW0qn93+A4TIGuUUdRs9kjPEv16WLx4MzPJA
 XSA/5Yr3uWQM1cMmWb3HLiNLTTAGWfiKXBZ/8S1dtZUfXGAkrU64EtEa7c9krMeE
 rXNKsoVwh/TC5AqWjm1FyR3PHDDMmm8gHkdJI+wfh63/gdCe6vJKqdGFU+gVk/rf
 bM2a2M9V3mAJ+MXUTMswiqDEDx9OSlojYsYvhjMRZeja5xozLs480JhJG8jfUgW1
 +J9iT+tawfuXpJtlpoaHslV2Gee1RFfX4GePqex26Y+Xbcdet/Zq9R5XSLNz6pYQ
 aPSP0CIz332ibi3gJjnPior7HGG0EJtwBNe7XBcYHYpHw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4177kvn9sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Aug 2024 15:23:35 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 30 Aug 2024 15:23:34 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.106)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Fri, 30 Aug 2024 15:23:34 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXTRU9T4ktcd+UhOh4WWh1/EVa9a16daplHq4+UOTRoRB7ZqqIjPwonc+7j2t+n0OInicaNMqoqJDASfsHikGxotVeQ2UHWSJXuAfgEM4t4tCEJrGfqcCyBl0C/jphgkjFV39iPXya65ADWn9OUSzQLID+zNxK/pAOBHt7/hWpI/884zVqk5V9MtGjgi1AkICVp3RsWkaOrvWoggqWyMJmCgCkL28gSy1ylkFLefC0oXbGeiAIy+9rPgSQ3Pc+87Nu+9JCIHqo3obkPjkUMdihMJrFi33LRJTzNWU8Co120DiXCUEFi5mheb6y2rc4RTAj+7gWXBlG1PlSGPnbrVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QrSz8770DRP0YNyf/NqDm5gjcMp13iJkBgTfJuJyT0=;
 b=jhj+CgVQ7fsv+mXg/NpaJuRNzPQ8h9cAKqK/rlYnGCRFRgmo3HxnlWtSrEOQhj7bMvgxd8mlH2cgdzCKDzJFDyhjQwaSzCLihzUATsiJXxCv/uj/ieRUIle/DcMj9javvGT+nABKubeq1O9r0OdyTk8voma5+Wo0fkXcZaG4Tei5uWwfyMhLo7oO/HajkL8INOnKj7KlvI904vwNS705TuD705bof27e4gpotEulRqVwuCMkxRifMDFTuD/mhPZAqhdvuNnINx4WsIjVyXV2Je/Z67EAPXTCZWAaROd897mEjhXvY326jsgug0p1R98/BafGIir/eNvYVCVSfe9aYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QrSz8770DRP0YNyf/NqDm5gjcMp13iJkBgTfJuJyT0=;
 b=fKrNJqdjhHew4sHGk2HtFn6N/c1+cZDXHraVc5/BTHpTHEkTYM9FHB/M01h6LubfMsPbrwC0xlRk4NOjNc+qaLk1aiPz67V6Z0kyq7Yl8cdrm5NetC+mKv/BGzDKBcMIMApl2Co/WXIWJuYdnTdshgWQnPurqHXbfUTl1bQXVLU=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB3146.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Fri, 30 Aug 2024 14:23:32 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 14:23:32 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Chen Yufan <chenyufan@vivo.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Donald Robson <donald.robson@imgtec.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>, "opensource.kernel@vivo.com"
 <opensource.kernel@vivo.com>
Subject: Re: [PATCH v3] drm/imagination: Convert to use time_before macro
Thread-Topic: [PATCH v3] drm/imagination: Convert to use time_before macro
Thread-Index: AQHa+ugxeBpu1XV42kSoMrJceO/hGw==
Date: Fri, 30 Aug 2024 14:23:32 +0000
Message-ID: <93ffa843-2867-408b-9c87-c0820fc11e77@imgtec.com>
References: <20240823093925.9599-1-chenyufan@vivo.com>
In-Reply-To: <20240823093925.9599-1-chenyufan@vivo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB3146:EE_
x-ms-office365-filtering-correlation-id: 3f15ecf9-fc4d-461f-2b36-08dcc8ff53a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y0RONzJFR0tXcWNLN2QrV282K1B5MVRiMDVMUWx3VzBJM0haZjU4b3UzKzBD?=
 =?utf-8?B?WnpQU2V4RzNhVXJUb1kzWE13Q0N0ZDNuRmk3UVYxY1BLczNuUzFQQVM4Uml5?=
 =?utf-8?B?Z1NBL25QVmJXZEVIVjdkWHdrOXcrZ1pwTG9FNitTS1JlMVNXVzVRd1VQMkt0?=
 =?utf-8?B?MGVzYTJRVWx3RExmcGsxK2Mza1QzQnJHZiszbXh6QnBKY3B1V2x6M1RtSmc2?=
 =?utf-8?B?QWZUU0QrSWlJeWhVN3FVcFpjMUxTWXZzZmlBT1ptUVRlV3lhQXcwQ1Z5RWww?=
 =?utf-8?B?M2VDUnhsL1dmMEludGpCREtsd29lZ2tSanBTc0Jrdi9QWDRsNEdZKzJsZk9R?=
 =?utf-8?B?ejdYSFUrREtFLyt1NkJVWE1wbERLY2JLS0o3Q2RZU3BlY3VRTTMxVnNlckN3?=
 =?utf-8?B?MzYrTHhYTHVRTDB4bDkxK20yWlFRd3JPV0E3MUhUNTByR0VFNHZHcUwxdUJq?=
 =?utf-8?B?L0YrVEg5eklWTGtkT0cyNlVXajZtREpXZTZMeG5kVWsrbmRJcnowLythWWxr?=
 =?utf-8?B?TEROMnYyV05Cb3N0WEx2Q0RCaHNROU9xREVuMXRwc3l3SmNNRm5IZFQvM0hE?=
 =?utf-8?B?TFpRdTRIMlJDL2tzV0lJN1NKRjFuNVNiVkFTdUVFOXFjTVIzNWF6bU1QUHFM?=
 =?utf-8?B?ZFpaQ1oyTk9CdENkTnlFY3JnTnRzNmhuQ2Y2MTlmNXo2b3NoYk5ZV3dGNHZ4?=
 =?utf-8?B?citOMFRLOGYvcFJyeTVLS2xaZDYzaENqVGloRHNEZThnT0ZOYk9WOUcwaTM1?=
 =?utf-8?B?SWtPUmlzT1ZFQnBEcHFmUGZHZjZETDBRUUNHUjVBY2ZQSUREVy9Qdm92U3U5?=
 =?utf-8?B?NVBHU0swR3pXUjhOQWRBd0d1UHBHSmg2YW81UWRtZStya0ZxWnZCNFhmNEh2?=
 =?utf-8?B?Q08xWWM1ZmpoOEZiQjRTblBkSGN3cjgzK1pJT0JWWE0rcFAwbjk2RUVubHdv?=
 =?utf-8?B?bHJySHh1dTFpNlBIcDFjYUd2ZFVOd083M0ptRVI1T0I1K3lFYldDSmRSV081?=
 =?utf-8?B?R3RUek03TWh1WmVSYjdOZHFoQktpaGJxS0pFcWdOb21iWDJFTFd0b2I2NVQw?=
 =?utf-8?B?Ym9waFpwMnJUQjRSUjQ1d0J6eHdmbWtKQWpvZnVyL1lmM1dUaHpLZnlVVmZt?=
 =?utf-8?B?OGhKUlVWSXBOT3orazB1QU1sazBja1RRamcrelNrTXg2b3JpWERQanpZa3Ja?=
 =?utf-8?B?ME4ycTZob0d3Z25TYXJ3aW0xRitHdyt0OThrMjZ1TjV4TlpyZzJDNlluN0RR?=
 =?utf-8?B?RmNrVEd0QUIxSFpFbG9JNzhQeWlSM1ZzbXFucjZMQzNlVFJPR25LeHFjOUtI?=
 =?utf-8?B?KzNtR3BCRHJIbzhLa2c1VWovUzRzM21FUUw2cWVRQ0xiOVpYUGg0UDhyZ2hW?=
 =?utf-8?B?andtajd2UmV1bGVmdm9GT3pCNVo1VHVvTjF6emR3Y1lMVitlRHJDdTh5STRB?=
 =?utf-8?B?b3V4RVlsYnA3dmF5YWZxekYxOS9raGk3SjU2MnRVYm02eklCdm92NzdxWnBu?=
 =?utf-8?B?K3VXeXluSjMyUmtHYUlTK0dIVFlMblBlYWg0cXFkRHFWaE5qNm5XMXdLM1FB?=
 =?utf-8?B?czFvOWtMV2tndzg4bjJVUDNQUnZzV0xwM0k1bzlPdzVmdFJITXBKallnVFF4?=
 =?utf-8?B?MGRCUm8yVGVQQnZZUE14V29uL0pudVAvdzJmMWFHbWY0Y2tndXNhWEFJb2Y0?=
 =?utf-8?B?dlNSbWNIYnByUnVjYU5kWVFTNGdUbGlTQ0s2TWdFQXlXQkN4TDVEbVpCUnls?=
 =?utf-8?B?ZmtxdmlXOVp0MUs2Q0Y3RVB2VTYyZm1sVndBMzN3S0I0eGNNMVlsaWxhTXFV?=
 =?utf-8?B?UWtlbHV1MHJzeHhJaG82ck95MlBFdC8vbnNqaFpNZ2xPMzZrWnpPN1o4dk5C?=
 =?utf-8?B?aHBQUmFRT1c1V2FzNG9MOUlzME84TDNHVXBQTndRR2hVb1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzk4bmdzMGJjTmgyR2JjU2xrdnFQbDJCd1ZETmdPaWF2K1Nkalg3ZDRJYkJa?=
 =?utf-8?B?VDNJakpOVXdWTFlHVDZMMVJuejJpTTlYYTJ2YzhuR29ZYlFyTGt1MlVsb2FD?=
 =?utf-8?B?ZXpZR3MxQmNEcHI0dXFtMklxYkZJS3dhakdyQVhFdkN0YXBST0tIaURCcG05?=
 =?utf-8?B?N085eThJS2tkT3dIcHMzVkg3Rjd5Vk1xdUFkYnM2RHFUcmJkYXpJeUNxOVRm?=
 =?utf-8?B?VnUvY3VIQ2s0Q0t5cWtabExtWVpRMXBUL0pUY3haUmNlQmduL1NJa2RqWDhu?=
 =?utf-8?B?WHpjNW0wdG5VZFgvcGNRbWtJMHRjc1NmWUVnMUxQbFFsY0tyZWlBTUF1Ry9W?=
 =?utf-8?B?aHFpaWVDRkx6MnNCSW44K093dXZUZGdqYjdiRlg1eVdhWHJwbE1xQnlIeSth?=
 =?utf-8?B?TE56NzF4ZVRiK2dsWm1xMU1LQ1VYN2pzUXdFQm9YUGdJOVJ5ZG1tdklyeXRo?=
 =?utf-8?B?MWdRaWhjYUR5eFkxRmYxSUpIci9MN3JwWjdCb05oV2VrMTRxRkx4eVhCMFAr?=
 =?utf-8?B?eFIrWXVPdjVXRXBrc0Rla08weGJMMmtMWnFtcDdLODBmUXFaSFoxQXBWVWwv?=
 =?utf-8?B?NnBlM2NBUE01R0JKdTBMc1E5R2VsUU8weEhzdmtqMVNRMDFiY2k1cXZMUEZw?=
 =?utf-8?B?WEFXT1o0OUxyM0pZL1QrQStVWEpVQVdWTHFXMWNsdjBzYkVGUSsvUUNSbUNh?=
 =?utf-8?B?c3luZTNScWpYdUNWb0QzMWh1bFFMOTBvbXgrTTRXSGl5TGdmNHpXS2lPOFUv?=
 =?utf-8?B?WUkvNTcrWXpuaVd6ejlrVnlVc0RzdmMwbXhrYlVERndSWHFqMTlHWmVmK3Jj?=
 =?utf-8?B?Z2xvWDQ3cHJPWDArWEkvRTF3eWw1Y0l4UnJCc2w3QUZFdkIvTHVRbnJBcCtz?=
 =?utf-8?B?M1lkd0lRekxJdHNQNUYxRXNDWnhncU04Rys2eWI0QTFUMFV6RUxwWlN6QzJ2?=
 =?utf-8?B?SERrR1VhL0l0SGNLRTJuN1hXT0Y2SHFINUhuMHlzdHJnSVRSaDArQzZiSFlR?=
 =?utf-8?B?Qm04T2FLZXZMS3R5RXlTM3RXMDlOeEdkMkplS1hNQXJtd3F1dWlHcU8xUmYz?=
 =?utf-8?B?bE5xZGZReExVMGVYV0QyTGVxbmx2QTZtbUFTbGlqVHNLazZ5N1ZoWXBtaENG?=
 =?utf-8?B?S0hNbERLV1M0aFRVY0pqRVh5aXVkTlk4NlcvaVQ2U2ZLVHk2VFhMOGs2S3ly?=
 =?utf-8?B?WkFzVUh0bWE3Z0ZMc2pDRmN5NjFhZERRM1pPMFQ3M0U4TXJIMHlNVWd4dnJR?=
 =?utf-8?B?OXVxQzdBV3p2NGVQZllqRnlWRVlnYWoybDhSUEh3TEhDZkJiaWF0ZG1LRGdq?=
 =?utf-8?B?MUtJVlp4djVBdC9nVFRBUmQ2dFQ2UitrTU9kRUJCRFRpRHlTTWFOUzBHSVo0?=
 =?utf-8?B?bGpXSDBHQjIvOU1jbUxDM24zTlhrOG1LSlZLTTd4ZCtycUZiL29oMWU0dXBp?=
 =?utf-8?B?RlZrb3ZMNzJIZkVXaS9VOGt0Sm9tNGdCeTYzQWZLNXpOakt5QnVKOVNwbnJv?=
 =?utf-8?B?U1JQVVA4ckloanMvQnZDN1lHakRLS3VuS1hDRlg2a2E4QThSd2RvRkRpeklJ?=
 =?utf-8?B?c3VLNVQvSTVFZXdnTnBrY01PbEs3R2luZGNIam5SYmxWMFFGbzhqM1g3bmIx?=
 =?utf-8?B?Y3Q2OEtkWkNIV0hPTHVtUVp6ajlhampONHM1bVRodllVYVkydUxwQ3h1UWJX?=
 =?utf-8?B?djNWWUxZTHdMaytoWVdwSXVaeVE0VWJzWHpGbzRGWFh6eXV1YjRvNXNJZ1FJ?=
 =?utf-8?B?by9keE9RaUhITERnVWpSN1dqcUdPOEtDUE5tcWVwOEcxK2Jyd0pXQVlzZXQ2?=
 =?utf-8?B?UWFVTU02REk1dGg2S2xZZnJ6UmxqakExbW9CTkg3NlhqTkZJM1REaEJUVmNL?=
 =?utf-8?B?b3lVRzZoSEhBa3dqVnJYemZWRkxVM3Z4eEFWdjNYb1licFFlcTFOQ1Z5WklM?=
 =?utf-8?B?Y0VoTzBkeWJmdzVBWWFpQ2luYWN5NlBqYjRpWXNBb3dEaVZ5dEtLa2dUd2tu?=
 =?utf-8?B?L1poRHdTNzI3OGczQWlLM1A3bHdLckR5MkNCbU01aEVTeHZCTnJPQnN4UVB0?=
 =?utf-8?B?dlV0UHpXRjd2T3NydG9zWUs2dUhEelR5OWpvd0k3SUtZeDN5aTZURll0N1BK?=
 =?utf-8?B?cS9HZjFacE91M0lsbzhNZTYya0JobVdwU1hlcmVZWEtrVkNMVHp5TTM0TWg3?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aohDoARl9mDpq2elQLu7DIA4"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f15ecf9-fc4d-461f-2b36-08dcc8ff53a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 14:23:32.4996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ps8aQkQAcNQJvxmJEEjxDjwAXCSk1J9fC3LqK4drVar6H0CCbUcXj0vYc034xOTGvViQ9p0kA7XS3AZ77tQFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3146
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 2hMqhIlW_gaDRzgFfh9xya-NF4ge780c
X-Authority-Analysis: v=2.4 cv=bcM5U/PB c=1 sm=1 tr=0 ts=66d1d5e8 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=1WtWmnkvAAAA:8 a=3oOJLAxtiLN628aBsBcA:9 a=QEXdDO2ut3YA:10
 a=paBcVA5DLPEChk8mV1EA:9 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: 2hMqhIlW_gaDRzgFfh9xya-NF4ge780c
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

--------------aohDoARl9mDpq2elQLu7DIA4
Content-Type: multipart/mixed; boundary="------------swgXD19ESYO3J15uTg1U0JN4";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Chen Yufan <chenyufan@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Donald Robson <donald.robson@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>, opensource.kernel@vivo.com
Message-ID: <93ffa843-2867-408b-9c87-c0820fc11e77@imgtec.com>
Subject: Re: [PATCH v3] drm/imagination: Convert to use time_before macro
References: <20240823093925.9599-1-chenyufan@vivo.com>
In-Reply-To: <20240823093925.9599-1-chenyufan@vivo.com>

--------------swgXD19ESYO3J15uTg1U0JN4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMvMDgvMjAyNCAxMDozOSwgQ2hlbiBZdWZhbiB3cm90ZToNCj4gVXNlIHRpbWVfKigp
IG1hY3JvcyBpbnN0ZWFkIG9mIHVzaW5nDQo+IGppZmZpZXMgZGlyZWN0bHkgdG8gaGFuZGxl
IG92ZXJmbG93IGlzc3Vlcy4NCj4gDQo+IEZpeGVzOiBjYzFhZWVkYjk4YWQgKCJkcm0vaW1h
Z2luYXRpb246IEltcGxlbWVudCBmaXJtd2FyZSBpbmZyYXN0cnVjdHVyZSBhbmQgTUVUQSBG
VyBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBZdWZhbiA8Y2hlbnl1ZmFuQHZp
dm8uY29tPg0KDQpIaSBDaGVuLA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBzbG93IHJlcGx5IOKA
kyBpdCdzIGJlZW4gYSBidXN5IHdlZWsgZm9yIG1lLg0KDQpJJ3ZlIGFkZGVkIG15IFItYiBh
bmQgYXBwbGllZCB5b3VyIHBhdGNoIHRvIGRybS1taXNjLW5leHQgYXM6DQoNCiAgIDdhNTEx
NWJhMWQ2OSAoImRybS9pbWFnaW5hdGlvbjogQ29udmVydCB0byB1c2UgdGltZV9iZWZvcmUg
bWFjcm8iKQ0KDQpUaGFua3MgYWdhaW4hDQoNCk1hdHQNCg0KPiAtLS0NCj4gVGhlIG1vZGlm
aWNhdGlvbnMgbWFkZSBjb21wYXJlZCB0byB0aGUgcHJldmlvdXMgdmVyc2lvbiBhcmUgYXMg
Zm9sbG93czoNCj4gMS4gQ2hhbmdlIHRoZSBwcmVmaXggb2Ygc3ViamVjdC4NCj4gMi4gQ29y
cmVjdCBmaXhlcy4NCj4gMy4gRHJvcCB0aGUgY2FzdCBvZiBSRVNFUlZFX1NMT1RfVElNRU9V
VC4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jY2IuYyB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZy
X2NjYi5jIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jY2IuYw0KPiBpbmRl
eCA0ZGVlYWM3ZWQ0MGEuLmI3ZDVmOWNhM2NhNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9jY2IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aW1hZ2luYXRpb24vcHZyX2NjYi5jDQo+IEBAIC0zMjEsNyArMzIxLDcgQEAgc3RhdGljIGlu
dCBwdnJfa2NjYl9yZXNlcnZlX3Nsb3Rfc3luYyhzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2Rl
dikNCj4gICAJYm9vbCByZXNlcnZlZCA9IGZhbHNlOw0KPiAgIAl1MzIgcmV0cmllcyA9IDA7
DQo+ICAgDQo+IC0Jd2hpbGUgKChqaWZmaWVzIC0gc3RhcnRfdGltZXN0YW1wKSA8ICh1MzIp
UkVTRVJWRV9TTE9UX1RJTUVPVVQgfHwNCj4gKwl3aGlsZSAodGltZV9iZWZvcmUoamlmZmll
cywgc3RhcnRfdGltZXN0YW1wICsgUkVTRVJWRV9TTE9UX1RJTUVPVVQpIHx8DQo+ICAgCSAg
ICAgICByZXRyaWVzIDwgUkVTRVJWRV9TTE9UX01JTl9SRVRSSUVTKSB7DQo+ICAgCQlyZXNl
cnZlZCA9IHB2cl9rY2NiX3RyeV9yZXNlcnZlX3Nsb3QocHZyX2Rldik7DQo+ICAgCQlpZiAo
cmVzZXJ2ZWQpDQo=

--------------swgXD19ESYO3J15uTg1U0JN4--

--------------aohDoARl9mDpq2elQLu7DIA4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtHV4wUDAAAAAAAKCRB5vBnz2d5qsGl8
AP90/bdIgvF4uYrf1FWMDOSUV+CwCC+hMfCddjAykqgMgAD9FMNc6/7MZQApluera4oSdk2/wAhX
4Jn/5L2sMzt9xgM=
=Akjc
-----END PGP SIGNATURE-----

--------------aohDoARl9mDpq2elQLu7DIA4--
