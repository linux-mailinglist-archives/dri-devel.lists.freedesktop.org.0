Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A7ADC2C3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 09:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F2A10E188;
	Tue, 17 Jun 2025 07:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OQDLN/dY";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="W8Q9lImn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398810E188
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 07:02:49 +0000 (UTC)
X-UUID: 0f8a894c4b4911f0b910cdf5d4d8066a-20250617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=NQ2tuy5PYO9pesd43pTSSp19mNXOPMROY2wXQhithtA=; 
 b=OQDLN/dYrtKMCW2KMCxuPnDzmrxxYZXOvDw8B/q1fwDOa6YWvvc4ccTB2OkcWlZqnmj8UA5hq5wCkft56Tiggbhl+X/AnqTsPdx+AYTKEIovxIb4MF9uxxdqqgQ6BIFS5TF2S8MXmpQDKa4gaGFSPokgq77UdaSaa7C/dfnk5d8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3, REQID:46d43466-4986-46a3-9e9f-06818911cbfc, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:09905cf, CLOUDID:811e1077-7521-4364-b0ef-cd7d9c0ecbde,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f8a894c4b4911f0b910cdf5d4d8066a-20250617
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 340574153; Tue, 17 Jun 2025 15:02:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 17 Jun 2025 15:02:38 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 17 Jun 2025 15:02:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Esb0vCGpXm4N4IorQnkAWEJolQAwEyiOnMMWsmzAr/RSAvCRInZxFH5If9huOkUc5XtTrd41BkpOaFSUOZUOuVwWuqvNyPaQvgJ1GeOjV0ybwenvIW1dq8NcPbMTMyMr90tNvNb37hl4gIaFOH//QCZ5pyHQ75VEBJ/Omdcmn3HyBae0BNnOFfL45PNYl23+AjPww4EoTdFzneb2cFYW6THfO/uwFyWPeJ/TWXAzvNXLFW/3AKRoOkRvW3qprZBSD77m+zC55QXX970f+rMxD3C9HqS6Eqq6RVwe4t7VEN3QZXen82ZSWA8KA3mnrs1YFLh8R2KpifwPZZY87LIzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YILDPhV6eM/kVwYYtDppPqd+KcmSsA+8BHHVD10ayFk=;
 b=KgTcNh271/MRjuDP+phREy2l29XcyvyYixqL02Y1L0SkvNTWADFEgQp7r2fW1EGNWdFjWk2kOt1zdHUkr0scKmf5aJwSCb/8PvdunKhBtB1ZUyJlLQrz/uCaeDQTaHBeGnlCqFTYlXQ2byGRXYSPqrzPbcE1uVQg+PJKFJa5HvAuhGa/EVGDwEFgRtLzsB62pMUy/ZtoKXKfqdi86XrXv80AZlaXr2/kytLAZBl20Z1yRbdf4z45G3FfCkvlf3iVNUunKSEFB1dh/u0ahyoBqKpY23/FRqieCkRL/5FwdgMS4PFMMuYVyAzFDg6MrIew6JmMsDPj1bYhUr5kCxdqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YILDPhV6eM/kVwYYtDppPqd+KcmSsA+8BHHVD10ayFk=;
 b=W8Q9lImnOPIEuPkrXr1eBTdNtVXdBH267WhF7q0sT7jxlTs3CXxdolMPlp9eo3A0NAw8Ap96KRTIHljYANo7XvUYPv2zTgYTtX/M0nqF69J5YuR4dVreqY9wsi4DnstcQ7Dplv8/bQdLzNdrkiDtuxvth0aycM0AnXgn+gFSOBI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8522.apcprd03.prod.outlook.com (2603:1096:101:223::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:47:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:47:32 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v3 10/17] drm/mediatek: Export OVL formats definitions and
 format conversion API
Thread-Topic: [PATCH v3 10/17] drm/mediatek: Export OVL formats definitions
 and format conversion API
Thread-Index: AQHbxXzMAiJqZYQQiEeZNrNbEs2bZrQHCngAgAAR9AA=
Date: Tue, 17 Jun 2025 06:47:32 +0000
Message-ID: <d21ca13f336e95a993af8c9c8408f5df0d39bd74.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-11-paul-pl.chen@mediatek.com>
 <dd6a1da8c8a923ef7dae9accf1e451a6a02c26ce.camel@mediatek.com>
In-Reply-To: <dd6a1da8c8a923ef7dae9accf1e451a6a02c26ce.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8522:EE_
x-ms-office365-filtering-correlation-id: 49d80601-1a92-4877-9aed-08ddad6ad61e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Ni9vN2xIM1cyOWM1NW9WQVBMekRjcDVyZTl2Z0pKVkUwNGdrNWhOczAwWEN4?=
 =?utf-8?B?QTBEdlZGMjhOdE5iaDRqMUc5b25YN2pWS1NOd3VxdkZVSFZTZWorZFpJaDBv?=
 =?utf-8?B?MmVqZ3JVL1pzQ2lGL3poUDdwb2lwQ3k2RGJsVGU4ZEorUy9aYnV1SHJCNjBM?=
 =?utf-8?B?OGNNbElGL0k3dmxzbE9UdWpCVjNQTlVBWVZ5d3ExYmlmYUZEbllIU0lESkI2?=
 =?utf-8?B?b3lyVjlEVnZjRklreWVuRko1M2cvVVdJaFBheHpDZENPd0tITTVmeFJCY05l?=
 =?utf-8?B?MDBBQ2xkbkZCZ0loYkdobEJ0a3NsQi9lWXR6WndWSGdqOXlENU1PK1laRDFS?=
 =?utf-8?B?RThoS2s3blFNR1lZQ295OWY4c3J3KzNObmhqTHVZTWI4bFNnYkduQUlzaXBY?=
 =?utf-8?B?Z01CeVpUUjFxd1B2TDNqSXY1aml1Q1B5OFk5Z1lEcWF1cXZYYU9QZHRXYURE?=
 =?utf-8?B?eFNDTXZuWjZZTFArb1dOR2FOWklURFRsOXY2clMzeDN4OEZtS2JHWjlWdVdP?=
 =?utf-8?B?RUFOQ1Q1T2tyWFQzdVgzSnV5dS9EYUg2T3hib3VYMGh1S0FuUUZpVk1ZK1pN?=
 =?utf-8?B?Y1dUNXZSbkR2WVNmNEhlTmYzbzYyUVU5N1R6cHcxeVYrMFNXL1dvKzQzS2gv?=
 =?utf-8?B?dEhrTFphbVZCOFlvVk14WkFkQzNkeHg5Nk1vUmFVQldITkxIUE00djJqanZi?=
 =?utf-8?B?YjJrUEpxNkxqNXUwc0V6eFI1bm0vYmFXemFIZEV3SWxxalI5ZmxZaFYwRDRr?=
 =?utf-8?B?Sm40S0xKVGc0VzFhR3hQam1BS0tsUHozU3pkNEJFOXFOYTArUzlwb050cnZv?=
 =?utf-8?B?RUQ0bS82ZFpQRnRkMVBGUzF6RElzRzNoOGhvK2EzTSt5TGluUEQzTkZ0cG9q?=
 =?utf-8?B?WDYyOWt4YXgzVmNvYTdKTzRJTnIzcm5ZWjFGdXdLUjY3dWlvUHNPaVpRVklu?=
 =?utf-8?B?enArQWpiMEhvQTkyQWxaRlZjLzRBeW13U0xQZHVUdzhHS0g0VnUra0FRRHhO?=
 =?utf-8?B?RDBMNUJBM1FQMEQrLzFoQTFMOERYdHlhVlBPU3A4blMyMjNObjJqeHh2eVQ3?=
 =?utf-8?B?K0tTUFk4cFlROXJ4cWV6UVdEcmdZL0FIZlRqc3BJNCtVQWZDaC82YmwrakF5?=
 =?utf-8?B?UzVUSW1HT3R5Rnl4Umh1d3hRNGc2SU5FYmRIWThzak50a0I5elFmbm8rR0Nh?=
 =?utf-8?B?dGRNblM2R24xcTE5MmdRL0I3dElram5Cb1J2MkgvUndnYkY5QysrbHpMR0t4?=
 =?utf-8?B?TmhhbVdvcnBCYzkrcnlVMGVTekV4Um1xdHF6clByVVV1ZnpNN21aSWlIckY4?=
 =?utf-8?B?UWIvZ01BeStieEEzVkdMd0diWml3UHNyY2dBOFJIWGNtcGlac3FkdVJhUTl2?=
 =?utf-8?B?TCtSYkVUUHFTdUF2aXRDMFVTT2haT2VDS0JrQy9Oekl0S1djNFQxa1dDSVVO?=
 =?utf-8?B?ZWVhVkNZcUF3MXQxaGJ5Q1pESzZQZVM0SWJSTHVrTWZIcDhBbFNObU5vMUtG?=
 =?utf-8?B?Ulo3VkdXV3NyUEliRlptNlM5enNWRU9iVTVocTRwYk1yM3huOENmb0J5WDBx?=
 =?utf-8?B?bWVGSmpDalVtUVE1Q0tFdC9kc0N0MXhYL3hDN1pKVUVMM1BMTGk3YzBBODRH?=
 =?utf-8?B?LzlML2xTOWl4aEVTUVRpOGYwUHJMRkt3NGl3WFdLK0J0WVpuUG81WDRpMzBW?=
 =?utf-8?B?M1MrWjJXT0U0dE16ME0yTGtGMTFaVDROa2U2VTBGUFIvc01zRnpRd3FxSmhV?=
 =?utf-8?B?ODFTNENJVHN1SHkvOVh5KzBiaDhKTmdHZUJUUml6dFFNd0tSaUJ6YUJFZ2Fv?=
 =?utf-8?B?SkUyM1hBZ2EyZDZyT05KVXViZ3BDU01NazFBQlg2ZWVlYlJ1WEdRUTdGQ3Zs?=
 =?utf-8?B?Zmc2MjZHRFFpT0ttdzNjR2hwdEtsbk9mdUhxa2hJbHRQNmJzeTIrUE9nZDlo?=
 =?utf-8?B?d0t5YzliT0FQd1FCemNPbWJZUlNxSkJUUlZDSkhUdERuellZakpUVmxPWHJm?=
 =?utf-8?B?dFhMblBtbEFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXc0bFdISm5TT2c2MU5BZmUwUUpDR1pkRFFDYjU5MDYvOHBsbmoyTndHT3hv?=
 =?utf-8?B?K0tmNVJtR2VBTVRndU95KzhydzV5WjNPeDd6cE9ZUnRsdGt5dzh6QWR4Z3Rq?=
 =?utf-8?B?N1Rnd2dObTJabWs4S0FnZi8zbmp1TitvNUlXMzJ5dFlseWxnVDlsSUhLQUVI?=
 =?utf-8?B?Ny9aQm91V2FWRHMrbThMNEMvek8xUEYzZ080M2hRUGQwNWRsQWpyU1NWQSsx?=
 =?utf-8?B?WE52SmJOb0ZObWhYVmdlbW1IZ29DMStjV2ZYTHBGRkRPdEpPU3AvM3FYd3lk?=
 =?utf-8?B?TWhUTTZ0SWs0VlpJM0FqN3krMnVyMzhnaktYSk85UExJK3VDblpnNWIrNzRD?=
 =?utf-8?B?MEJGV1hyeHRnV2lJWVZiOUd0Q1BhN1h2ZFY4OWM0QWJjSGJpdnVVOHd2ajMv?=
 =?utf-8?B?TG9QU3VFMEplUkJCdEdvQ3RnRXZVRlp2WEJ2RkxVS09nWFVYS3h1SFo3RG5j?=
 =?utf-8?B?VGxjNHFLa3JwK2w3QTNtcXFiY29WWEk5OFJpSWxieVlKU0tMU3QyZlNjL1JV?=
 =?utf-8?B?a1Z3ekJtZlVPTytzMHZ3Vi9CQ1dSQitMZGNFbnVEUGF4Y2NzRjF3amJaYUlE?=
 =?utf-8?B?UkpPQ29SSm1xM3NwaC83SUxhTFhjUWFOalBscnJBTVRFUGNLZWpOT0FwMW5a?=
 =?utf-8?B?aUxQcTdscEJORzVXZGc0SldqcmVmVmtodm9mczNHd1FnZFFDMmp5M0x0OUNq?=
 =?utf-8?B?QzBzc3EzRVFaZjQvdndWRUh2bmVvM0ZuV3hZZ25ONzJnVmhuUkJ1VkU2M2pN?=
 =?utf-8?B?VVpJK1lxcEV4TkVESUwxYmZtNUNNUWgxemVFbFdZVlFQNDRHQTlCSDVjMEhE?=
 =?utf-8?B?RzBkQjRhcU1HN1ZJekwzVmQyTDRzcENQMi9IZWxDQzU2ay8wbmxWYkp6WEVr?=
 =?utf-8?B?bG5uT2I3cjRyUWprV0o5UXVlQUZaa0EzWWlDRkxxSlhXaXpHM3ZmQndpQldq?=
 =?utf-8?B?djc0ejVVWHdHR3JhbWhzWVpJcW9HeVlIK1JWaC91Zk43cXZwbXVuUXpEMmpI?=
 =?utf-8?B?LzJVZFRtQ2RlUGFPbjE3MzRTWFFiT0ZuZEdyK2RPVmRLUkdOS3BvZkF3NGVN?=
 =?utf-8?B?WTkySUF1QzlmdzBsbG95R1Vuc0Y4NHRWdWVxSC9pWVB6V2thMHpNcUoyakRw?=
 =?utf-8?B?NGRqYTE3UGJIRSs3cWhpVHdtM0lyajJYWDl1b1gzU1FyWk5qOHlyZmpTWGkx?=
 =?utf-8?B?M3UxZ0I3RjBSRjZQS0l2RzBCWlc4WmQrUDNkdjV6VjhjUHlVRDhhWG1xMHJI?=
 =?utf-8?B?NHRRODVtbE0xNzBVdmdMdUt6VWI3c2ZRTWtrUm9mN0s5K1RaMEttOENyRDBC?=
 =?utf-8?B?MHpib2dVQVRkOXd0eGE2VW9QSE1VZ085dHBNaDdybG1rVFd0clpyWlFWSU5I?=
 =?utf-8?B?dnR2dEhHQ3RXcUloMU45QnFySytSclhwMFVBMGJEWlpEeGloekVsbHBVZGls?=
 =?utf-8?B?MGJuT09salMwZi9pTGVpbnBncTdmQzRsWmJwaytZaEJRVFMyN284a2w4a0I2?=
 =?utf-8?B?ODVWSnNuaTl1a3FWY1pNVmtrMi80ajZzajllZjc5L3k2eURPVEp6Y3p4Qm9B?=
 =?utf-8?B?MDdRNWptcUpKZ2dLWVoxNElsb1dLc1hCVDE2Ri91TjJnZW1vSkFXT0xIajB1?=
 =?utf-8?B?dzQwbC9vNzUxZDhJS0dkNUVOL3NReklnYk1qMmloMEd6WWRraXJEYXNCV2Nw?=
 =?utf-8?B?Y05oc2xmaURUb1d6YVBvZlJ2ckV3WDJYcTRFTXhNN1ZyVTBaZWlFKzk0Y2s1?=
 =?utf-8?B?WW01b2pxajRKYWJTN0ZWR0pvLzg4K3ZNdjNQYlpuQnlYWHhoY0dnSCs4YlE3?=
 =?utf-8?B?UHAzMy9iZy8velpaek1NRVloaXR1bzlTUHQyVGtoL2dmK3NZczF0WXNwQnM3?=
 =?utf-8?B?d1ljUnpGMnMwbVFEUXQ2bXdEeTdxZk03WGdBYVJDMzRqNXQ4UEFtc3VXMndq?=
 =?utf-8?B?WVUyOC90QVJHekp6a2VNYkthUTRoQmwyejNDeTVZdkM4ejBBR2UvQjFESE95?=
 =?utf-8?B?YzgveTY3czZFeCtpOXJkQjRJMXdiemdCeVhOa0N3OHVobTRnLzJsNGQxVDhO?=
 =?utf-8?B?ckJjUnJPNzBIRmhtTXo4eHlCTE5GcnpRYlFZZ3BMSDRMR0Z3eWY0UGZrU2xm?=
 =?utf-8?Q?GU46CsRvDXCuvZlEs8FRhtGVN?=
Content-ID: <60D8C047B441EC49BF96267F8C40C561@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d80601-1a92-4877-9aed-08ddad6ad61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 06:47:32.6726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2MRZhBy1ju/4Uusmi6oexINDp3uTCrVL0AvXN70Pr1FctrOGUoCO30+DfAaxDgCsoMMpN4zV4UcCV4vDesxVOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8522
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1498429514.1318254202"
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

--__=_Part_Boundary_003_1498429514.1318254202
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

DQo+ID4gK2V4dGVybiBjb25zdCB1MzIgbXQ4MTk1X292bF9mb3JtYXRzW107DQo+IA0KPiBEaXR0
by4NCg0KU29ycnksIGl0IG5lZWQgdG8gZXh0ZXJuIG10ODE5NV9vdmxfZm9ybWF0cyBmb3IgZXhk
bWEgZHJpdmVyLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+
ID4gK2V4dGVybiBjb25zdCBzaXplX3QgbXQ4MTk1X292bF9mb3JtYXRzX2xlbjsNCj4gPiArDQo+
ID4gK2Jvb2wgbXRrX292bF9pc18xMGJpdF9yZ2IodW5zaWduZWQgaW50IGZtdCk7DQo+ID4gK3Vu
c2lnbmVkIGludCBtdGtfb3ZsX2dldF9ibGVuZF9tb2RlKHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUg
KnN0YXRlLCB1bnNpZ25lZCBpbnQgYmxlbmRfbW9kZXMpOw0KPiA+ICt1bnNpZ25lZCBpbnQgbXRr
X292bF9mbXRfY29udmVydCh1bnNpZ25lZCBpbnQgZm10LCB1bnNpZ25lZCBpbnQgYmxlbmRfbW9k
ZSwNCj4gPiArCQkJCSBib29sIGZtdF9yZ2I1NjVfaXNfMCwgYm9vbCBjb2xvcl9jb252ZXJ0LA0K
PiA+ICsJCQkJIHU4IGNscmZtdF9zaGlmdCwgdTMyIGNscmZtdF9tYW4sIHUzMiBieXRlX3N3YXAs
IHUzMiByZ2Jfc3dhcCk7DQo+ID4gKw0KPiA+ICsjZW5kaWYNCj4gDQoNCg==

--__=_Part_Boundary_003_1498429514.1318254202
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZXh0ZXJuJiMzMjtj
b25zdCYjMzI7dTMyJiMzMjttdDgxOTVfb3ZsX2Zvcm1hdHNbXTsNCiZndDsmIzMyOw0KJmd0OyYj
MzI7RGl0dG8uDQoNClNvcnJ5LCYjMzI7aXQmIzMyO25lZWQmIzMyO3RvJiMzMjtleHRlcm4mIzMy
O210ODE5NV9vdmxfZm9ybWF0cyYjMzI7Zm9yJiMzMjtleGRtYSYjMzI7ZHJpdmVyLg0KDQpSZWdh
cmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Q0sNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2V4dGVybiYjMzI7Y29uc3QmIzMyO3NpemVfdCYj
MzI7bXQ4MTk1X292bF9mb3JtYXRzX2xlbjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMy
OyZndDsmIzMyOytib29sJiMzMjttdGtfb3ZsX2lzXzEwYml0X3JnYih1bnNpZ25lZCYjMzI7aW50
JiMzMjtmbXQpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQmIzMyO210a19v
dmxfZ2V0X2JsZW5kX21vZGUoc3RydWN0JiMzMjttdGtfcGxhbmVfc3RhdGUmIzMyOypzdGF0ZSwm
IzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2JsZW5kX21vZGVzKTsNCiZndDsmIzMyOyZndDsmIzMy
Oyt1bnNpZ25lZCYjMzI7aW50JiMzMjttdGtfb3ZsX2ZtdF9jb252ZXJ0KHVuc2lnbmVkJiMzMjtp
bnQmIzMyO2ZtdCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2JsZW5kX21vZGUsDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrJiMzMjtib29sJiMzMjtmbXRfcmdiNTY1X2lzXzAsJiMzMjtib29sJiMzMjtj
b2xvcl9jb252ZXJ0LA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7dTgmIzMyO2NscmZtdF9zaGlm
dCwmIzMyO3UzMiYjMzI7Y2xyZm10X21hbiwmIzMyO3UzMiYjMzI7Ynl0ZV9zd2FwLCYjMzI7dTMy
JiMzMjtyZ2Jfc3dhcCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
I2VuZGlmDQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBt
YXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNl
DQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50
ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChz
KS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRh
aW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1l
bnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFu
ZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50
IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVs
eSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVz
IG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBz
eXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRv
IGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_1498429514.1318254202--

