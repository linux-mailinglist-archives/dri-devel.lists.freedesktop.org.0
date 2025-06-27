Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDFAEB180
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF04910E32A;
	Fri, 27 Jun 2025 08:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="q7PPF2rc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="s2e4lX2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AEF10E32A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 08:41:40 +0000 (UTC)
X-UUID: 88879c0e533211f0b33aeb1e7f16c2b6-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=nfNbmhvRhu5GVT98BV15x7mnLtCYR9pZjL/goIjJ0ck=; 
 b=q7PPF2rc8jvkBL/2uodrRGzaMGtWgV1OSo9eU+JzuURKW075ScPkXVJoZjhFmX7WfbeTApxlOh4WzUuRPPXF4eOAq4Ch824Po1qtcYsOmDQnWlyVa0Kzwso/WLGI2h4xtADsajEJ44DlAv+/uy/sUBiUfYqlJVMKUakrXdGKQTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:6bda3d9e-d000-47fd-9874-5e98ff974175, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:81374482-cc21-4267-87cf-e75829fa6365,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 88879c0e533211f0b33aeb1e7f16c2b6-20250627
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1590076663; Fri, 27 Jun 2025 16:41:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 16:41:32 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 16:41:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BS+MImRGNDaH+gRjuPYF2SYj4ffLiKBnfGVjUbjOSFUhoH+/HaNXVG46NqVAfHcuy8AxDeAg/7iqHO/i2qg55IzuIUo6WnsszwV117fj/TldHUMQhqbZS20p+tXobVCl6/Uzh3Io7ph7olXyCGtBZrGAqjPk1tKdLUP9v9KiybUPH5UID5cUjepSg22yX2vhMcDN2k25on2th6Nt0mwHMFYIMCEe2Hir/+g20zcmjtitMmXbyOTd6qQjm/1VyzbaZfLK/HPrdFPc8IcDoeGeFtehRbKpn5AJotK6uMpJK7mWhwqoRotxujSWnu7JEwkvxTNLomrCt5bv69C36C21Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RIlrxM5WRa2iDoQKOJJNPs5gcGgd/dqxQovTkq9JkA=;
 b=moYXDfbKW++XRxcOtlktUAZ4pPcmN5tUoOznOmYUlG3KL4a6ubW81KKgEzX4MOWVLAe5o5+dwrVfAsCTHrGnWyxX1doiVlZfDaUJn7z9Q+ZHvQTBB4JkV2mesCOZshBadBHCATw9cgZrMZvQBmJE6uN3fXUcb4vJeS3SEImv+cJ0n0+UaxDE/bypXk8RRWiMlrxOoDBjhhFpnqJ9VUBTbai1jTzkr+CajVFdJRBcZTLwkLUxZt70KivnW5OfoOAtU27D/Q8+pGwjwfKpwRBH7QiLaHcXz3WKQKmhgRAnojgE87GKB1iF9J9DBAmSN3O6UVU2t2IK582SZ7yJNySowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RIlrxM5WRa2iDoQKOJJNPs5gcGgd/dqxQovTkq9JkA=;
 b=s2e4lX2OWwc75q01qWBJvJQKOtM+c09UKJcx5OyXZfG9iOxtwYgppUfos2V+59KQcwDXlbGnTmh9DOudhCSVYpvllxb/tDlVkkp7TCPwB9Bz9D58lkiDjc+DsyOwtlgMJ13lkzNq0UB7tGJ8PbiZVFbjRzrWZT1mhCPqltiHq/k=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SE2PPFF3776CC00.apcprd03.prod.outlook.com (2603:1096:108:1::4b1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Fri, 27 Jun
 2025 08:41:30 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 08:41:30 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
 <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Topic: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Index: AQHb0xuUP67g52RskEeq4qvL4HldtbQW2FWA
Date: Fri, 27 Jun 2025 08:41:30 +0000
Message-ID: <f12d0d954bea2b89d6f316db6b9bbfeea6b4db8e.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
 <20250601173355.1731140-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20250601173355.1731140-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SE2PPFF3776CC00:EE_
x-ms-office365-filtering-correlation-id: 0d7946dc-a3a1-47f0-18f3-08ddb55669ca
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VGhnOHh1MnNjRnhCOUwrRkhBc3RmWnJwQy9qWVRlRE1sVktPSzc4bEk2R3Qv?=
 =?utf-8?B?YmJRODE1eUordFFpdDVVY3RMNFc5VEx2TTQ3T082UWZNTVVMK1NIcXJlM1cv?=
 =?utf-8?B?NGdxeEJMNG5GNE14SWU0NWR3RzdFaExSQXVWWUp2b011RWtFZnluTDVPM0N3?=
 =?utf-8?B?dGVmaFRIM21wVnVXb3h6Y3ZXTHIvbGZHL1JIV1RCWFhlcWtRc2t1UXMzQlNS?=
 =?utf-8?B?L2c3emFMMEVpTmJtYVE2LzZsY0o4QVk3aWdMUDZERElaSXFIdFE2ekoxYnpU?=
 =?utf-8?B?a1JjaHJNQWVhZ3crRnNLcklXSDZpZ00yL00xeVRyM2lPd3A1YW42TklTZjE0?=
 =?utf-8?B?b1NYWm9ESVV5bXZkTkZjT1V5aGxaRjVUV0dzZkM2WUxxQVZQYlNSeWRRWkdY?=
 =?utf-8?B?SFdrTHFqOEErZVJ2VEdPa2tPM2pGV3luZERKRm9MdHhkS2M0UW1VVUQ3UHlw?=
 =?utf-8?B?bXF5aGR0REhhdU5xWE84QXRRWktvT2k0MmJoMEs2anVsN0pDbzhTS0svZ29G?=
 =?utf-8?B?YmtsTDVnUnpPdTJld00vYnQxYlU4YncyWXVtYkRsajdZV1BrR1JuSjE1UkVZ?=
 =?utf-8?B?UXp0a3pRUStreGdJZlpVeWRGTmxkL2dIaURoQmlhSkc3LzB3L1Rwa3NIUXF3?=
 =?utf-8?B?NEVMWGxJWW5WNVNNR0tkZU5kaDRsbHJhb1dnSGlzbDQyN2NvNkd3cEc0WVdk?=
 =?utf-8?B?YUhCZmV4clVVd1hudStmeGdRQTc2bkxRdlRMUlUwemIvMmxYYXpvK21sVDBw?=
 =?utf-8?B?SzlRREpHSTNmUDl0L1dNTllXNWdwNzZMWFVNMENhaXhYUloxVW5rZ2wxdFQ0?=
 =?utf-8?B?a24zenlCb2hFVUx3Z2traHJtTjlxL3lEY0EvTnZhdzU1Z3poSmNDSW5lZFVL?=
 =?utf-8?B?RlQxM3BnVndtTEQwQkJaQUg5RTJLMmpRUi9BWDBnSVo4MXdyNndOZDlCejBL?=
 =?utf-8?B?MDBpQm5iSkZwcnFMUG9vdGJqOHEyb25Ycms4bUM0ZFdmZElxNFFMUndHajBt?=
 =?utf-8?B?d0VyU2ZvRDhnTGE1NnZPMUc2eGxtZUVPckRmSlQ1a2l0QXlyU3lHclBCOEgx?=
 =?utf-8?B?TkpsUnU0NDEwVHh1TkdHYzd3N2ozazc0dHoyUXVXNkRjZitXdUtqT2UxRGdL?=
 =?utf-8?B?cEdCeFBqQytFYkNRY012djdKKzFweDJOSHQ2UFp1MkhjUVZmTGNkQVRQQUVu?=
 =?utf-8?B?bjJBczhEQlc2UUVNMitBZ0lLeXBsS2ZKSzFuTEFtNm9PQWlMTVkrTWpnSU9I?=
 =?utf-8?B?cWprcnE5RnFNZUd1dnFqM0c4ZlBNVTZ5djBBV0oxWXBZNEQyUXB3T0ZFSld5?=
 =?utf-8?B?R1d1WTltaHhVNVVqVUYrZWkwT1d6NFZ4Z2RxT29McmRqUFRhUHI5UlpDVWNs?=
 =?utf-8?B?VXhoMVBzYk9ucU5MOE80QkhTK0ZOK2hCVjdaR3NRRnUrU1lLd2IxaklpV2F1?=
 =?utf-8?B?VjFINjhHSUxxZHJuZDFTUjlPZHMwQWtjZHhNY2FSM294a1F3dDAvTmVuNkI4?=
 =?utf-8?B?RitCdVRPVisxY2Y2NUtzVkZxRFpLZ0k1bytPTk9pcmFPbXQzM3VIT2I4MC80?=
 =?utf-8?B?OWZQcVk1YVhyNzVFdm1OZml2MUlzZDVBeGE3aXRxT0JsNjBPbXIyQ2taaW5U?=
 =?utf-8?B?aGMwKzA5ZEhXYTFRK0x2QU9qdjZKVWdaNkVTc1YwQ1F2WUlNNk1LNS93VDVj?=
 =?utf-8?B?YnVUYXV5M1UvZUp0NitVRmtwdTJzM0oyREFzVXpHN3cvSVJ5MWRZVnBkSGsx?=
 =?utf-8?B?S1hJd0hMMCt6anRTS0hZeWpZVGdJTEZxaWcwNC9IZE9SSmlVU3JQMTJsVERR?=
 =?utf-8?B?N3ppZlV5TFBjVkwycnUxMTJTcFgzYXB1blRCZDNHM28zYlFqR08wK2c4NjEy?=
 =?utf-8?B?WGdnb1VEVmlCRmU0K2xUYkhuR0Q2NjZLUVNjcXZBZ0dyS1hGZTFTS2FLamt6?=
 =?utf-8?B?dFV5YmErNWR1RXE0ZVl2Mk5JQ0FZN3N2NW5pOUFmYkxEVlpFR1plbFhaZGpy?=
 =?utf-8?B?dTJZWXpiTlBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3h5YzJjK0tJeHdZWmdoS01IdTlPMWtoMi8zYkRTMElNNW5TVFV3aUVsY3ZM?=
 =?utf-8?B?UzlYZnhVNXp2a0NsUnV0RTh0YzF0VXhuTk1jck40bklQMmZ2OEg5Qm9EZTRU?=
 =?utf-8?B?V2NCSXJRYTlzakJ5OUNLK1RIS3pka01IMzFXclJveDlxbnFkaHczTHBFTlNQ?=
 =?utf-8?B?TGpyc0FUd1E2SGpKWW9nMWIxNjBNRi9FTmpRa1MwUEVQbUVMV1czeWZHS0xX?=
 =?utf-8?B?RW92QnNqWmVmUjJiUVF3d2JPTkM3ZGtwc3ZMa3EzckV2REhCcHpreEpPNzdV?=
 =?utf-8?B?RVhURWtkRFlzWmFjTmRQRldWd3YyWlJUQUZVdHJMUVNKeFE5R2xNMVZwZXFq?=
 =?utf-8?B?MWJaTXg2S3REVFNaTnBwY1dVWmVkeWgwaFJFa1NyV1ZSemJmQmExbzlKZDFQ?=
 =?utf-8?B?UWxPNWhqTTFOc0NRNmE3djgrMndwM1lNS2p1RmxDUEQzM1VvS3VDcWlZSEZM?=
 =?utf-8?B?QWYvWU5ESE1zZmdOTVFXbllweE5sY1lkZm82ZTh1TkZweXVsbUZUbVF2WGJw?=
 =?utf-8?B?QkdEaXdHaHdrbzVwUU1WUU1iY1QxbDIvVjdRcktjRjBUaUZjMFp2d3dpVjJC?=
 =?utf-8?B?a1hUSzZhbS9Sai9LWWlRRlpzdlJmR1hyZFp2cFZ3Q2dFcGFpVUtqeFhJdWZD?=
 =?utf-8?B?ZkFIYlBBaFFPclo1RVRaUFl6Q2Q2T05OOXZTWmF4RjhXd0x1V1BGakZ0VCtB?=
 =?utf-8?B?R3hmKzhhSXFBUUNoclFPVWNzNi9venRqSEFqZ1QvaDM5Vml6VEJkeTRkVEh3?=
 =?utf-8?B?aGp1MURkUUU3dXFhV0ErcGp0UHVpM21Xd3JRbExPNkU2SEV2NkpweXZMY05j?=
 =?utf-8?B?RjhXWENVWXVoK1JQeGFnVkZHUUxLRisycWVCSEw0bHZPWlFIbm91UEZ4dGYw?=
 =?utf-8?B?WW1aRlNRQy92NnNFUHNReXZUR0R4L3ZhYWFZcVllMnk2ZjlEdlZVdzQvc2RK?=
 =?utf-8?B?TXVpNW0ydGNKM2ZzQ1pEdUZXa3VmaElSK053QytYOTVLQ0hQaFdRUjZWLy96?=
 =?utf-8?B?Wk5weU4xSFUybFdTK2RsRVRTKzU3T2pCV2plYk1NT3dDdndnVVZaQWtvZWJJ?=
 =?utf-8?B?UnZiQWxjYjlUc0FZbUd6TlliMVJSc01rSENGVEhEYnJPRlpKQS83bE4zRjda?=
 =?utf-8?B?ZjNwK2tTOHNGeUN5QnhRZlJSZlF0TjkxVUVpaUpHendnQ0VXMDhIUjZlTlp5?=
 =?utf-8?B?WGFsQWFqU1JWa0xSZUlvU1FTTWlxN3RhMUJUOU56Ly9Zc2d0VHIwOTVxN1hN?=
 =?utf-8?B?a3Axa2E3UVJIUVV2VG50ZjRKL3pFem5yTXl2dHVzSzJNeTR5NCtNSUVVQ2dn?=
 =?utf-8?B?dS9MaVk4a0xNVnZUOUM5aTVUN1N4dG4zcjR5WDgrcUJkL1YyZkx0KzRHZHlj?=
 =?utf-8?B?VTlVWC9Wc1IvRGhYcVNvdUZKcVB5L1QwdG1DSjEvTFVnalA5L0tudFdIQnRt?=
 =?utf-8?B?anhheUIrT1BSajNyZ2RDUGxJM2lhdFlUcW5yNEVlRTB1QXpQN254cGw3Ym9T?=
 =?utf-8?B?a3Zla2RLOHFHOGlVYzV1WUoxcEYrUDlDRFJsT0UwM0xaWVF6OE9WMEs1TWFs?=
 =?utf-8?B?MXpkUml0TVFQOHJPOUhjQy8vdUF2SzJ6QVcyNEROY2NRYVBCaU8yZE5mOXpS?=
 =?utf-8?B?NEZIK1hZdnFsa21HZS9aMlZjZ0dXTVpIU294UHVNNFR2OHErL2tNR2k5WFdI?=
 =?utf-8?B?MXlxaGo2SHEzNnhMYkVIWGJGM2RGMTBJbVVLdVdpTFN6QXZjOUJES0pJQlBq?=
 =?utf-8?B?elo5TE8vQVAzT2UvZ0owNzFoRWpsa1E3bnQwNEZPTDZaUlRWRUlpMTRPcktD?=
 =?utf-8?B?b0NpUVE3SGZ3bURtVEI1cHp0Z2s1M2dIOFJNZkhuVnY4bEZFVm9BVlk5M0lz?=
 =?utf-8?B?S0R6QW04UXQyaXE1bG1Mek5oWG1hUzl2M0RFdEV6cWpBYXNKNTRiL2VrcDEz?=
 =?utf-8?B?Tm5jUWVvWGZzN0kxNnBPR1ZRdVhYazRrR1BEOG5jUWtZYjQ4WlBGYThzcnVE?=
 =?utf-8?B?ekg3L0pEMWEzODRNdjBubjlEQlErNm5BMERLdmtCV2gwVUFEODFFdWNzNHBI?=
 =?utf-8?B?RS9adE5MMU05Zm00cVRNc2tiTmxoRlI0b2ZrdFNEc1JIN2ZXL0VPRkdMT0pv?=
 =?utf-8?Q?H+OtHCbKsibf602FhReBtMSC9?=
Content-ID: <E64A5F7727AC544087CE5D882F360FDE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7946dc-a3a1-47f0-18f3-08ddb55669ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:41:30.2739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijx1x7YsEkySnMVnUFag6KvRcFcxoFf3HfDkI+/NalMJ2ooE0L+qVT2f5sO3x+Bv5YTN0XtnziTO4Z2C4gO8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFF3776CC00
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1524081955.423266046"
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

--__=_Part_Boundary_008_1524081955.423266046
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFRoZSBHQ0UgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24gY29uZmlndXJhdGlvbiBzdXBwb3J0cyB0
aGUgaXNvbGF0aW9uIG9mDQo+IEdDRSBoYXJkd2FyZSByZXNvdXJjZXMgYWNyb3NzIGRpZmZlcmVu
dCBPUyBlbnZpcm9ubWVudHMuIEVhY2ggT1MgaXMNCj4gdHJlYXRlZCBhcyBhIHZpcnR1YWwgbWFj
aGluZSAoVk0pIGZvciBHQ0UgcHVycG9zZXMuDQo+IFRoZXJlIGFyZSA2IFZNcyBhbmQgMSBob3N0
IFZNLiBUaGUgaG9zdCBWTSBoYXMgbWFpbiBjb250cm9sIG92ZXIgdGhlDQo+IEdDRSB2aXJ0dWFs
aXphdGlvbiBzZXR0aW5ncyBmb3IgYWxsIFZNcy4NCj4gDQo+IFRvIHByb3Blcmx5IGFjY2VzcyB0
aGUgR0NFIHRocmVhZCByZWdpc3RlcnMsIGl0IGlzIG5lY2Vzc2FyeSB0bw0KPiBjb25maWd1cmUg
YWNjZXNzIHBlcm1pc3Npb25zIGZvciBzcGVjaWZpYyBHQ0UgdGhyZWFkcyBhc3NpZ25lZCB0bw0K
PiBkaWZmZXJlbnQgVk1zLg0KPiBDdXJyZW50bHksIHNpbmNlIG9ubHkgdGhlIGhvc3QgVk0gaXMg
YmVpbmcgdXNlZCwgaXQgaXMgcmVxdWlyZWQgdG8NCj4gZW5hYmxlIGFjY2VzcyBwZXJtaXNzaW9u
cyBmb3IgYWxsIEdDRSB0aHJlYWRzIGZvciB0aGUgaG9zdCBWTS4NCj4gDQo+IFRoZXJlIGFyZSAy
IFZNIGNvbmZpZ3VyYXRpb25zOg0KPiAxLiBWTV9JRF9NQVANCj4gVGhlcmUgYXJlIDQgcmVnaXN0
ZXJzIHRvIGFsbG9jYXRlIDMyIEdDRSB0aHJlYWRzIGFjcm9zcyBkaWZmZXJlbnQgVk1zOg0KPiBW
TV9JRF9NQVAwIGZvciB0aHJlYWRzIDAtOSwgVk1fSURfTUFQMSBmb3IgdGhyZWFkcyAxMC0xOSwN
Cj4gVk1fSURfTUFQMiBmb3IgdGhyZWFkcyAyMC0yOSwgYW5kIFZNX0lEX01BUDMgZm9yIHRocmVh
ZHMgMzAtMzEuDQo+IEVhY2ggdGhyZWFkIGhhcyBhIDMtYml0IGNvbmZpZ3VyYXRpb24sIHdoZXJl
IHNldHRpbmcgYWxsIGJpdHMgdG8gMQ0KPiBjb25maWd1cmVzIHRoZSB0aHJlYWQgZm9yIHRoZSBo
b3N0IFZNLg0KPiANCj4gMi4gVk1fQ1BSX0dTSVpFDQo+IEl0IGlzIHVzZWQgdG8gYWxsb2NhdGUg
dGhlIENQUiBTUkFNIHNpemUgdG8gZWFjaCBWTS4gRWFjaCBWTSBoYXMgNC1iaXQNCj4gY29uZmln
dXJhdGlvbiwgd2hlcmUgc2V0dGluZyBiaXQgMC0zIHRvIGNvbmZpZ3VyZXMgdGhlIHNpemUgb2Yg
aG9zdCBWTS4NCj4gVGhpcyBzZXR0aW5nIG11c3QgYmUgY29uZmlndXJlZCBiZWZvcmUgdGhlIFZN
IGNvbmZpZ3VyYXRpb24gdG8gcHJldmVudA0KPiByZXNvdXJjZSBsZWFrYWdlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gKw0KPiAgc3RhdGljIHZvaWQgY21kcV9nY3RsX3ZhbHVlX3RvZ2ds
ZShzdHJ1Y3QgY21kcSAqY21kcSwgYm9vbCBkZHJfZW5hYmxlKQ0KPiAgew0KPiAgCXUzMiB2YWwg
PSBjbWRxLT5wZGF0YS0+Y29udHJvbF9ieV9zdyA/IEdDRV9DVFJMX0JZX1NXIDogMDsNCj4gQEAg
LTE2Miw2ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBjbWRxX2luaXQoc3RydWN0IGNtZHEgKmNtZHEp
DQo+ICANCj4gIAlXQVJOX09OKGNsa19idWxrX2VuYWJsZShjbWRxLT5wZGF0YS0+Z2NlX251bSwg
Y21kcS0+Y2xvY2tzKSk7DQo+ICANCj4gKwljbWRxX3ZtX3RvZ2dsZShjbWRxLCB0cnVlKTsNCj4g
IAljbWRxX2djdGxfdmFsdWVfdG9nZ2xlKGNtZHEsIHRydWUpOw0KPiAgDQo+ICAJd3JpdGVsKENN
RFFfVEhSX0FDVElWRV9TTE9UX0NZQ0xFUywgY21kcS0+YmFzZSArIENNRFFfVEhSX1NMT1RfQ1lD
TEVTKTsNCj4gQEAgLTMzNSw2ICszODUsNyBAQCBzdGF0aWMgaW50IGNtZHFfcnVudGltZV9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+
ICANCj4gKwljbWRxX3ZtX3RvZ2dsZShjbWRxLCB0cnVlKTsNCj4gIAljbWRxX2djdGxfdmFsdWVf
dG9nZ2xlKGNtZHEsIHRydWUpOw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMzQ0LDYgKzM5
NSw3IEBAIHN0YXRpYyBpbnQgY21kcV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiAgCXN0cnVjdCBjbWRxICpjbWRxID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICANCj4g
IAljbWRxX2djdGxfdmFsdWVfdG9nZ2xlKGNtZHEsIGZhbHNlKTsNCj4gKwljbWRxX3ZtX3RvZ2ds
ZShjbWRxLCBmYWxzZSk7DQoNCldoeSB0dXJuIG9mZiBwZXJtaXNzaW9uIHdoZW4gc3VzcGVuZD8N
CldoeSBub3QgYWx3YXlzIHR1cm4gb24gcGVybWlzc2lvbj8NCg0KUmVnYXJkcywNCkNLDQoNCj4g
IAljbGtfYnVsa19kaXNhYmxlKGNtZHEtPnBkYXRhLT5nY2VfbnVtLCBjbWRxLT5jbG9ja3MpOw0K
PiAgCXJldHVybiAwOw0KPiAgfQ0KDQo=

--__=_Part_Boundary_008_1524081955.423266046
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDYtMDImIzMyO2F0
JiMzMjswMTozMSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO1RoZSYjMzI7R0NFJiMzMjtoYXJkd2FyZSYjMzI7dmlydHVhbGl6YXRpb24mIzMyO2Nv
bmZpZ3VyYXRpb24mIzMyO3N1cHBvcnRzJiMzMjt0aGUmIzMyO2lzb2xhdGlvbiYjMzI7b2YNCiZn
dDsmIzMyO0dDRSYjMzI7aGFyZHdhcmUmIzMyO3Jlc291cmNlcyYjMzI7YWNyb3NzJiMzMjtkaWZm
ZXJlbnQmIzMyO09TJiMzMjtlbnZpcm9ubWVudHMuJiMzMjtFYWNoJiMzMjtPUyYjMzI7aXMNCiZn
dDsmIzMyO3RyZWF0ZWQmIzMyO2FzJiMzMjthJiMzMjt2aXJ0dWFsJiMzMjttYWNoaW5lJiMzMjso
Vk0pJiMzMjtmb3ImIzMyO0dDRSYjMzI7cHVycG9zZXMuDQomZ3Q7JiMzMjtUaGVyZSYjMzI7YXJl
JiMzMjs2JiMzMjtWTXMmIzMyO2FuZCYjMzI7MSYjMzI7aG9zdCYjMzI7Vk0uJiMzMjtUaGUmIzMy
O2hvc3QmIzMyO1ZNJiMzMjtoYXMmIzMyO21haW4mIzMyO2NvbnRyb2wmIzMyO292ZXImIzMyO3Ro
ZQ0KJmd0OyYjMzI7R0NFJiMzMjt2aXJ0dWFsaXphdGlvbiYjMzI7c2V0dGluZ3MmIzMyO2ZvciYj
MzI7YWxsJiMzMjtWTXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RvJiMzMjtwcm9wZXJseSYjMzI7
YWNjZXNzJiMzMjt0aGUmIzMyO0dDRSYjMzI7dGhyZWFkJiMzMjtyZWdpc3RlcnMsJiMzMjtpdCYj
MzI7aXMmIzMyO25lY2Vzc2FyeSYjMzI7dG8NCiZndDsmIzMyO2NvbmZpZ3VyZSYjMzI7YWNjZXNz
JiMzMjtwZXJtaXNzaW9ucyYjMzI7Zm9yJiMzMjtzcGVjaWZpYyYjMzI7R0NFJiMzMjt0aHJlYWRz
JiMzMjthc3NpZ25lZCYjMzI7dG8NCiZndDsmIzMyO2RpZmZlcmVudCYjMzI7Vk1zLg0KJmd0OyYj
MzI7Q3VycmVudGx5LCYjMzI7c2luY2UmIzMyO29ubHkmIzMyO3RoZSYjMzI7aG9zdCYjMzI7Vk0m
IzMyO2lzJiMzMjtiZWluZyYjMzI7dXNlZCwmIzMyO2l0JiMzMjtpcyYjMzI7cmVxdWlyZWQmIzMy
O3RvDQomZ3Q7JiMzMjtlbmFibGUmIzMyO2FjY2VzcyYjMzI7cGVybWlzc2lvbnMmIzMyO2ZvciYj
MzI7YWxsJiMzMjtHQ0UmIzMyO3RocmVhZHMmIzMyO2ZvciYjMzI7dGhlJiMzMjtob3N0JiMzMjtW
TS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlcmUmIzMyO2FyZSYjMzI7MiYjMzI7Vk0mIzMyO2Nv
bmZpZ3VyYXRpb25zOg0KJmd0OyYjMzI7MS4mIzMyO1ZNX0lEX01BUA0KJmd0OyYjMzI7VGhlcmUm
IzMyO2FyZSYjMzI7NCYjMzI7cmVnaXN0ZXJzJiMzMjt0byYjMzI7YWxsb2NhdGUmIzMyOzMyJiMz
MjtHQ0UmIzMyO3RocmVhZHMmIzMyO2Fjcm9zcyYjMzI7ZGlmZmVyZW50JiMzMjtWTXM6DQomZ3Q7
JiMzMjtWTV9JRF9NQVAwJiMzMjtmb3ImIzMyO3RocmVhZHMmIzMyOzAtOSwmIzMyO1ZNX0lEX01B
UDEmIzMyO2ZvciYjMzI7dGhyZWFkcyYjMzI7MTAtMTksDQomZ3Q7JiMzMjtWTV9JRF9NQVAyJiMz
Mjtmb3ImIzMyO3RocmVhZHMmIzMyOzIwLTI5LCYjMzI7YW5kJiMzMjtWTV9JRF9NQVAzJiMzMjtm
b3ImIzMyO3RocmVhZHMmIzMyOzMwLTMxLg0KJmd0OyYjMzI7RWFjaCYjMzI7dGhyZWFkJiMzMjto
YXMmIzMyO2EmIzMyOzMtYml0JiMzMjtjb25maWd1cmF0aW9uLCYjMzI7d2hlcmUmIzMyO3NldHRp
bmcmIzMyO2FsbCYjMzI7Yml0cyYjMzI7dG8mIzMyOzENCiZndDsmIzMyO2NvbmZpZ3VyZXMmIzMy
O3RoZSYjMzI7dGhyZWFkJiMzMjtmb3ImIzMyO3RoZSYjMzI7aG9zdCYjMzI7Vk0uDQomZ3Q7JiMz
MjsNCiZndDsmIzMyOzIuJiMzMjtWTV9DUFJfR1NJWkUNCiZndDsmIzMyO0l0JiMzMjtpcyYjMzI7
dXNlZCYjMzI7dG8mIzMyO2FsbG9jYXRlJiMzMjt0aGUmIzMyO0NQUiYjMzI7U1JBTSYjMzI7c2l6
ZSYjMzI7dG8mIzMyO2VhY2gmIzMyO1ZNLiYjMzI7RWFjaCYjMzI7Vk0mIzMyO2hhcyYjMzI7NC1i
aXQNCiZndDsmIzMyO2NvbmZpZ3VyYXRpb24sJiMzMjt3aGVyZSYjMzI7c2V0dGluZyYjMzI7Yml0
JiMzMjswLTMmIzMyO3RvJiMzMjtjb25maWd1cmVzJiMzMjt0aGUmIzMyO3NpemUmIzMyO29mJiMz
Mjtob3N0JiMzMjtWTS4NCiZndDsmIzMyO1RoaXMmIzMyO3NldHRpbmcmIzMyO211c3QmIzMyO2Jl
JiMzMjtjb25maWd1cmVkJiMzMjtiZWZvcmUmIzMyO3RoZSYjMzI7Vk0mIzMyO2NvbmZpZ3VyYXRp
b24mIzMyO3RvJiMzMjtwcmV2ZW50DQomZ3Q7JiMzMjtyZXNvdXJjZSYjMzI7bGVha2FnZS4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpIJiMzMjtMaW4mIzMy
OyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlw
XQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7Y21kcV9n
Y3RsX3ZhbHVlX3RvZ2dsZShzdHJ1Y3QmIzMyO2NtZHEmIzMyOypjbWRxLCYjMzI7Ym9vbCYjMzI7
ZGRyX2VuYWJsZSkNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjt1MzImIzMyO3ZhbCYj
MzI7PSYjMzI7Y21kcS0mZ3Q7cGRhdGEtJmd0O2NvbnRyb2xfYnlfc3cmIzMyOyYjNjM7JiMzMjtH
Q0VfQ1RSTF9CWV9TVyYjMzI7OiYjMzI7MDsNCiZndDsmIzMyO0BAJiMzMjstMTYyLDYmIzMyOysy
MTEsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7Y21kcV9pbml0KHN0cnVjdCYjMzI7
Y21kcSYjMzI7KmNtZHEpDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtXQVJOX09OKGNs
a19idWxrX2VuYWJsZShjbWRxLSZndDtwZGF0YS0mZ3Q7Z2NlX251bSwmIzMyO2NtZHEtJmd0O2Ns
b2NrcykpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytjbWRxX3ZtX3RvZ2dsZShjbWRxLCYj
MzI7dHJ1ZSk7DQomZ3Q7JiMzMjsmIzMyO2NtZHFfZ2N0bF92YWx1ZV90b2dnbGUoY21kcSwmIzMy
O3RydWUpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7d3JpdGVsKENNRFFfVEhSX0FD
VElWRV9TTE9UX0NZQ0xFUywmIzMyO2NtZHEtJmd0O2Jhc2UmIzMyOysmIzMyO0NNRFFfVEhSX1NM
T1RfQ1lDTEVTKTsNCiZndDsmIzMyO0BAJiMzMjstMzM1LDYmIzMyOyszODUsNyYjMzI7QEAmIzMy
O3N0YXRpYyYjMzI7aW50JiMzMjtjbWRxX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCYjMzI7ZGV2aWNl
JiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHJldCkNCiZndDsmIzMyOyYjMzI7cmV0
dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K2NtZHFfdm1fdG9nZ2xlKGNt
ZHEsJiMzMjt0cnVlKTsNCiZndDsmIzMyOyYjMzI7Y21kcV9nY3RsX3ZhbHVlX3RvZ2dsZShjbWRx
LCYjMzI7dHJ1ZSk7DQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7
fQ0KJmd0OyYjMzI7QEAmIzMyOy0zNDQsNiYjMzI7KzM5NSw3JiMzMjtAQCYjMzI7c3RhdGljJiMz
MjtpbnQmIzMyO2NtZHFfcnVudGltZV9zdXNwZW5kKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2
KQ0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2NtZHEmIzMyOypjbWRxJiMzMjs9JiMzMjtkZXZf
Z2V0X2RydmRhdGEoZGV2KTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2NtZHFfZ2N0
bF92YWx1ZV90b2dnbGUoY21kcSwmIzMyO2ZhbHNlKTsNCiZndDsmIzMyOytjbWRxX3ZtX3RvZ2ds
ZShjbWRxLCYjMzI7ZmFsc2UpOw0KDQpXaHkmIzMyO3R1cm4mIzMyO29mZiYjMzI7cGVybWlzc2lv
biYjMzI7d2hlbiYjMzI7c3VzcGVuZCYjNjM7DQpXaHkmIzMyO25vdCYjMzI7YWx3YXlzJiMzMjt0
dXJuJiMzMjtvbiYjMzI7cGVybWlzc2lvbiYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMz
MjsmIzMyO2Nsa19idWxrX2Rpc2FibGUoY21kcS0mZ3Q7cGRhdGEtJmd0O2djZV9udW0sJiMzMjtj
bWRxLSZndDtjbG9ja3MpOw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsm
IzMyO30NCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0t
ey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQog
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBk
byBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBw
ZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_1524081955.423266046--

