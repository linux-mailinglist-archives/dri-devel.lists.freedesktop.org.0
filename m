Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DE9663F5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 16:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1588D10EABD;
	Fri, 30 Aug 2024 14:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="MmEKBpY5";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="kDOw+G+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1080 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 14:17:32 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C33D10EA96
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 14:17:32 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U6qVm1013028;
 Fri, 30 Aug 2024 14:59:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=oELKWGA+tF1ncmEKQ4iCLyrWNs7lTUFfuhezLkKylq0=; b=MmE
 KBpY5Utsjb3DTwQ15h3W38Wicvslg/HMXz1SdYMQobzj1bY5eibLE/Xy8xPKkE/F
 1kI01v43rx2wnd9zxAiXnK4RueLLH88SCVjcsLg2AS2EPKKLyK3Wzb4ws2tj3rM3
 6aC2jahgf0eoZOFE6apu7SfccMzHPb2ey6uPY8hGunpuC2LqqmbyUts9jh2HGQZU
 oBvY+mL22XYSS0uudAxOg3qX+LD7LeDYVwlo9l4gvh8F5pDPhCCS69bxO+wMZV0B
 eVLOHJ03m7ZgOffjP7ninJDkwsV6zfPrrkK8JAEpQng7REKkkdBvipQIk7Nh3MYh
 1sQU/l+BZ3+oF/QNBjA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4175ss4p7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Aug 2024 14:59:13 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 30 Aug 2024 14:59:12 +0100
Received: from LO2P265CU024.outbound.protection.outlook.com (40.93.67.29) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Fri, 30 Aug 2024 14:59:12 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG8f+Eu2Suvx1UCxIW75WIl4TpjQxHdc8lij53Taad5498N1avhMbFlWqcNJ412/VESxr/AsAkccqemZKJe6vr5vN9iemO9Er1OaXbhIQQA5ZKZ3JGjJFtD8XHZeeyLddVhk0kBTs/GamAzSIEshRzWwWv75xIJWcP3dooEdHdX/yvmFR4rMauWXVH39ayVJ2NztzqhSkljsR4CRXs34+mDJd6orOlnm/eX6iBkilkBKoa7HCzMTY/CAr0RuoIU00+e+mAxTGpLxzUB9tDncPwTntO2QcReQkkTxlVAo7X14hTD3nTfRD+KXrCkiX2GM47nCVjK3G4UPjCP19csRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oELKWGA+tF1ncmEKQ4iCLyrWNs7lTUFfuhezLkKylq0=;
 b=aHiKuEiX1innMNmx7bMJtsUfUyRMXJb6dWaP7sLUDDiMqLROWf+htDuIPxLUytoawHEtJluctEHY7TYzSP9Kra2Nbjo+Kp1Hj/Ow0KbZhVMjOlqy0wUpI6MEp5SBL58HyxdTJ1fRriTBDHv6o0vxF4rS8U6J4V8Rc5/5xMQSc/lOHu+/DcI1ZqNlUFOP4ku0Ug9pmP2jy2DgaCvcAGPEkKp/4hDCB5dCdg7kVZgZchLXpq/CUNrdey+bN+lUpst0GJYy4YYuPrTHSsg0QYQMRWndTHX31hT8IYNGlZEIVYoR8i0yoP40BGoRk7yib8DY6+jOwS+pLuCCjyxprkUhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oELKWGA+tF1ncmEKQ4iCLyrWNs7lTUFfuhezLkKylq0=;
 b=kDOw+G+qwauCIgGssihvPNyM4bpmTHnzSKJcTSvhV4SVQNJ0AmVrgiAub7PrV5e1NsmfCTHAlAgtXvXa4EhwUFeLZKn0LPBHUh1a5ulz2kGDaHH0PYbZ75ytdmqgrneNB94GDCScfrsTlkus/umX9LIxnxWm8BD9YGDnjQ5kvF0=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB6593.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 13:59:11 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757%6]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 13:59:11 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH] drm/imagination: Use pvr_vm_context_get()
Thread-Topic: [PATCH] drm/imagination: Use pvr_vm_context_get()
Thread-Index: AQHa+Ut63vojNAp1DkeCGFbhPXW9+7I/1uKA
Date: Fri, 30 Aug 2024 13:59:11 +0000
Message-ID: <6cdb2df38ca349b5a10cc6583701876255e5f995.camel@imgtec.com>
References: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
In-Reply-To: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB6593:EE_
x-ms-office365-filtering-correlation-id: 20bf8444-96be-495d-3211-08dcc8fbec91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Vk1lbHRWQ1lEMDhQVVhDNGxCb0lMTjNRNjc3b1VJbmNZMnAvMzlhemJPeFhl?=
 =?utf-8?B?TGpFZmZkWDBZbitoQWt0WDdGWnNzMGdqRCtEd3RNMnQ2Mi91OHcyb0p1dUc3?=
 =?utf-8?B?bnRYeWZPK2VobldPc1lJWWIzSFQzSWNFSjZNaExhZmcrZTZyck9mMEJmRFVm?=
 =?utf-8?B?SHdxaVIyNi82VXpOUm4zZHNuRE1nTEpPK3FQSHY3QVJyWWMza2x1SHY0N0c2?=
 =?utf-8?B?cDVWUVFJZkhPV1R4TVNHNjRJL0NJQWlNZS9MM0p1UEN3Mndma2t4eGRFc1Fr?=
 =?utf-8?B?L3dBcGIxUTBpeVByZGNLMndRZzZOY0RhYTJ3UzM3bHpFMW5tSmFiWSt5dzh5?=
 =?utf-8?B?U1ZXc3ZOa3ZHQlEzTDBOQjF5ZnZZa3RRT0lVdTRIMVpCdFl1b2pSOUMxTEp1?=
 =?utf-8?B?Y1FNaEEzdTJrTU5Zd0l5ZUIraTQwaWZQdXlDR01oaVRGUGMzMWg2Wkl1VURD?=
 =?utf-8?B?Tk5oK3ROOENsdG5maEtoRXhrNEp5djRJZlozMDlPWXhId3BOeVJhRlBHeXZo?=
 =?utf-8?B?YnJ2bjh6d1dHc1VUdXhiTjhZMU0wTVErY1NpRmVzQVJmaCtCZU1JWENMb3lL?=
 =?utf-8?B?aTIzZkhCaTYvNWMvOXF4MVkzOGpsUk5aVUQ2bnByQm1TZ0w1RjJGcktxeDhm?=
 =?utf-8?B?Rm8zcmhUK2x6enpTcFRCT1gwUTg4N1FmakNzZW5WaHp1L3lpbWxESStCL0t0?=
 =?utf-8?B?M0o4RlQ0V01qV3dVemUrSHBaWTBGU3NZcEJjazFIMHhvWDJjVnptRmVVbVc2?=
 =?utf-8?B?M3ZxaEpqNVZRK05EaWpUanRyYkJWR2N5NWxMVE1CcG84eERuTS9NNEdHWVFm?=
 =?utf-8?B?UnE3U24wK3Q1bTNvMDkzWmd3NkdnTlBLMDFLM05XQUt0cFEzWUpkS2t1RVFT?=
 =?utf-8?B?ZERHQzZyRHQrYmIzNENuVGZ3SWcrSk5JcHRhcjBySVUzc2FxV21NK2VTSG02?=
 =?utf-8?B?U3liajgrNElRbG43T09aU0ZkYUJHL1k0NzlGbWdhcWFzL2NiQ3pnQkpGVWdI?=
 =?utf-8?B?d1UwVnV2a1pLM2VjeEh6MzlhZUt3L2VJZFlpMTN3cEJvaTI2ZG0wRDdyTWNh?=
 =?utf-8?B?VklmZWJsclQ5dlRyeUY2UTlqRno1K3o4QmRta1BUOUVLY2J3eUtweFlVVm5Y?=
 =?utf-8?B?UEEydUdEZXhlaXB0MllkODBkY09EbTZUNnJIUitBV0M4eTBibURXazFJREdB?=
 =?utf-8?B?Nk9xbHZPdkROdXlWQlJMeTZFRnZycGVHSG1QTzRIQURYVks3RmRJOGppWFFk?=
 =?utf-8?B?RXlEU2FwRGxIcmd2M3RLMTMxOHVvZEpzc0ptVTRWOVFYMk4zTnJZVUpndTBp?=
 =?utf-8?B?Vy8zeUYvVDBxaHdLeEZxSCtzYjI2VnF6dElQUEJORXRYOFJRN1lNbGxUY05p?=
 =?utf-8?B?czhvMFFkSGxCS1lqbEtEdVB0Z212SFBPQzV5dUREdTVhWTEyaWk5YXhJZ2I5?=
 =?utf-8?B?ZWhzMjBtWGlMRHhERWF3ZFJVQ3ZvTmtCR1dENFJBQi9DSWdIK0ZJVWduVDBW?=
 =?utf-8?B?R2hIcmNFTWdCVTlmbWJvR0VzaEswcUVKNkQyZzVqTENaaUl6TFZRSWI2blZK?=
 =?utf-8?B?NEtWcjBYSmJkUVBmMk9PU290VHdsKzVMWjl4RFByVlQydmZvdzF3aE9FbUlS?=
 =?utf-8?B?cEVmQktsTmJDd0RhTFpSNU9qS053elBDYVFxQ3FHVUxYaUpidXJPZ2J6MVVG?=
 =?utf-8?B?Vzg3bzhjejZ6U1dGenM2YWF5MHk3OWEyTVBUWlQxVHArdUVWRUVUNm5pUVB4?=
 =?utf-8?B?WTlaWFM3cDNGaFBFZEgvUFZ5SFZ5RVQrMjNWYlFOOERENUdBcWZkM1UyTlRM?=
 =?utf-8?B?cHhEZEVzejViM2pWV0FFNUpqQm43UXpOUmU4VFdIUnU1THliU1lGWXM1SWZX?=
 =?utf-8?B?enE3bGs2QWcvSVJGMjNaMEdvdEdNbDh1dm1qemxnQ25waEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnM4YUVTUFY0c3c4QVhEVEtKckc0bk9VLzgxbkg0ZCtJMW0xVXVDZUswMG0x?=
 =?utf-8?B?T2p5OE9XcFh5bmVPNzVuYktaOU1uTnM1VTJzdHg3YnNDODNmY1VaVzU1enJu?=
 =?utf-8?B?TGpOdlJ4SVB0ZzlKWXZIS25RbUVkMjBESi8yUW5SaHNuR25IVEVBY2NWdE5P?=
 =?utf-8?B?d0FOOWNnNkdpN0pUVW5yS3NENnh1MnhDODE5VDNYNmd4YVp1UnVzbDZYMjlt?=
 =?utf-8?B?a1U0QVRXQ3FuZk1zN1ZHZ3NrTXBOb2pLWElka0dwTEZIcHBlYkxsQnUxT1Ft?=
 =?utf-8?B?YzB1R3ZiV2xHTVM0aG9seFJ3aDZFK0lDbi9mdHVpTDY0K0F5M2RheXN6Y1pw?=
 =?utf-8?B?aFJSTS9LZU1TajN6a3E0NTIxdE82b3RMLzZxb1BzaXErWmVDQXZ6eGZzYkpZ?=
 =?utf-8?B?ejI5QXVHWVo4YVRLSFE3NnQwY1o5NFNvSDBVSTNkNjhRU3hHQkZoZkdjaE8x?=
 =?utf-8?B?Q2RhWmNRd0pEZkhwaTBPMWtjT0RacmxyOUZFNC9iMmw5Uk5KUHVvUklOZzAz?=
 =?utf-8?B?V0hCY2xjL3Fmd3BQdXpaSCtKUVVlQlU1dWVzUVhGQnRyTWtvWkxJRVNmcDVR?=
 =?utf-8?B?THI1WnVNMENIaGNjRnMxVnB6VkRwSEhRc2RWdnlFL1lKT2JvL2hyK2ZTMHhk?=
 =?utf-8?B?bmkrZzNvWDBXb2M4Yy9KZjA1endBZmMrbW90L0sxc3NYZWJHMDU4N29KUjVj?=
 =?utf-8?B?aTZHU29tVCt2QURlejNmaElIWlR2Q1VZdFZkWUZUSGFVeFdYU0dhMHc0bDhx?=
 =?utf-8?B?VVJWY1FpNlBsckg5Nm5BaCtYYmhZQUFEcVMwdVUzOC9xM2QrMzBZSmRIMFkw?=
 =?utf-8?B?SEx4MDh0RjRINkcwTHd6NGI0NEVMOXFHZThyQzV1K0RuR2dCZUxzdmFsK1lt?=
 =?utf-8?B?MXVCVThUMFMvQ09RUXB5NWVjL1Z3cEZvQkJFaGdjczhSdFF2MUZRU3M3RXhs?=
 =?utf-8?B?UTVuV3VuT0RFdVA1OXdPWHQxZDZ3YkdBYzZhOGdoeUJiSnhMZ0ZiNmxOMGRJ?=
 =?utf-8?B?Y25KTUdhNTNQMUZQNitycDdMRTNrU3Q1K3JiQ1dMZHIvdEJsc3dobUxlM3FM?=
 =?utf-8?B?WVRrRVlVYzc3aU9vdDhZZUZiT296YVZ0dmVXc2FHVEkzMVZndG9TcE01RDc1?=
 =?utf-8?B?Q2tuOElpUnVnc0VjQnMrWkgyamdoVkNoSzB4MmdPemxoeXJ5dTJVSFBBa0pF?=
 =?utf-8?B?bFNjK2J2NVZkdUdGVzQ1NnFwTU1hSGdEdWJKckVhYVBVdWZrdjR6cmZUa1Vu?=
 =?utf-8?B?a1V6Zko1Tmt3ZVJVRUdoMUhoME45eGgydEZSTndyekhKblJwQW9mTi8wb2w2?=
 =?utf-8?B?cncrSmVOTW0rQjBtcm42Njk0Y0hBSG9DUXpXbEozbFJLTHVVK3BnUE1Cc0NQ?=
 =?utf-8?B?NmZCYUx3NFl2Z0hVK1UzUmllMWdpeXhGeVgyTjFZWUovMEFNL3NmanlWRXVY?=
 =?utf-8?B?NFdVUmJ5WjROeU1FakpLMDFFMGFRVERFYWtmTDArK3pxMkNVbWlqQVFUM2d4?=
 =?utf-8?B?UWdIZ0N0SkM4aHp3UXRtRlFZUDNmTnJxNUV4SSt5WG45UGtvbWVKYVgrWXMx?=
 =?utf-8?B?ek0zcHFNMUVtcnZHV3lHSUcvK29MSWZOQzkvRERKeG5mYmtDUmJXeitRRThY?=
 =?utf-8?B?WWc3OEJ0KytMaDhxaVNpVXFXaFFFYmVNSlNoekFXODgvU0pXcUxDb205dExX?=
 =?utf-8?B?RjY0YVpqaGRuV3hFc2JyU1Y0cUZnZk1rY2VnTk1sTnQ5eHBST0ppMSs4S3Vi?=
 =?utf-8?B?NExIQlcrUU9venJTMmFkaHFoVWhhdWlUNVR0eFBzSWtIVlJCeGNudldtdk9B?=
 =?utf-8?B?TVZIOFNpRDJsQ3hxbFptOGJOa1ROeG9iVWYyeHdaQVNKMGlKQ25UQ2s2YmNW?=
 =?utf-8?B?OXlDRWFGZ04wMEx4VWxVSm90bFgrUmcyZ2prTlJuNCtpcTIrb1E0NUlxRUZL?=
 =?utf-8?B?SVBTMGFQTVZnNmFQV0I0TmdzZEdrS0tXVDd2cmg0MjE4SmtwbjVualplTlky?=
 =?utf-8?B?cThqMG5oQk9iclF1VU1ZSy9GSHd4QWxDODdYa3pURkpZZzlJZ1Z5YlBPTXh0?=
 =?utf-8?B?YzlnZElqU1RVZUMwVTd3ZFhCbVM0QXFSTVNqdjVUWXc3TEREUkl2TXFMTGJ0?=
 =?utf-8?B?Y1NkLytpQlVUKzVwZGJDbWdYM0RydHEwckliaXY0UU5MSlNHdlFYTVF1Nk13?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <379DDD984494DE4CAA6E697E510B4B03@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bf8444-96be-495d-3211-08dcc8fbec91
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 13:59:11.0670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxUe+HnniHCtvugLOn6hbIvajKK6FuxUbIbIyYaP4SmbaH+iZbFq8WckGURPD1b0gY1SOGh3VDhglG6SVMf0kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6593
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MeE+uI/f c=1 sm=1 tr=0 ts=66d1d031 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yoJbH4e0A30A:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=f8vhtq_vszUllI7rPXIA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 1dPwhtywreoP0O1W0ry-EzAW92TR-OBG
X-Proofpoint-ORIG-GUID: 1dPwhtywreoP0O1W0ry-EzAW92TR-OBG
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

T24gV2VkLCAyMDI0LTA4LTI4IGF0IDEzOjA5ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
SSBtaXNzZWQgdGhpcyBvcGVuLWNvZGVkIGtyZWZfZ2V0KCkgd2hpbGUgdHJ5aW5nIHRvIGRlYnVn
IGEgcmVmY291bnQNCj4gYnVnLCBzbyBsZXQncyB1c2UgdGhlIGhlbHBlciBmdW5jdGlvbiBoZXJl
IHRvIGF2b2lkIHRoYXQgd2FzdGUgb2YgdGltZQ0KPiBhZ2FpbiBpbiB0aGUgZnV0dXJlLg0KPiAN
Cg0KUmV2aWV3ZWQtYnk6IEZyYW5rIEJpbm5zIDxmcmFuay5iaW5uc0BpbWd0ZWMuY29tPg0KDQo+
IFNpZ25lZC1vZmYtYnk6IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPg0KPiBG
aXhlczogZmY1ZjY0M2RlMGJmICgiZHJtL2ltYWdpbmF0aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxh
dGVkIGNvZGUiKQ0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3Zt
LmMgfCA0ICstLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2
cl92bS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYw0KPiBpbmRl
eCBlNTk1MTdiYTAzOWUuLmZmZDQ2NjUwOWQwYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfdm0uYw0KPiBAQCAtNjM2LDkgKzYzNiw3IEBAIHB2cl92bV9jb250ZXh0X2xvb2t1
cChzdHJ1Y3QgcHZyX2ZpbGUgKnB2cl9maWxlLCB1MzIgDQo+IGhhbmRsZSkNCj4gICAgCXhhX2xv
Y2soJnB2cl9maWxlLT52bV9jdHhfaGFuZGxlcyk7DQo+ICAgCXZtX2N0eCA9IHhhX2xvYWQoJnB2
cl9maWxlLT52bV9jdHhfaGFuZGxlcywgaGFuZGxlKTsNCj4gLQlpZiAodm1fY3R4KQ0KPiAtCQlr
cmVmX2dldCgmdm1fY3R4LT5yZWZfY291bnQpOw0KPiAtDQo+ICsJcHZyX3ZtX2NvbnRleHRfZ2V0
KHZtX2N0eCk7DQo+ICAgCXhhX3VubG9jaygmcHZyX2ZpbGUtPnZtX2N0eF9oYW5kbGVzKTsNCj4g
ICAgCXJldHVybiB2bV9jdHg7DQo+IC0tIA0KPiAyLjQ2LjANCj4gDQo+IA0K
