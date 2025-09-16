Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF20B58C3A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 05:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91C10E626;
	Tue, 16 Sep 2025 03:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Y7yIRGoU";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PUklnuQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A01D10E624
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:11:23 +0000 (UTC)
X-UUID: d0011aa892aa11f0b33aeb1e7f16c2b6-20250916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PJNepvsOVnAEygRFSuQ7dUUGmGxaLy0TMaryytcG3KQ=; 
 b=Y7yIRGoU21yzIqblHQRKBTehxl9MTU3AywSU+zMc09Xvzu5aXyfY/4wN6RqS5HuYiMl6+B52+jqCRWPT6cr6zoz3Lfj2j7B0GogsSmD6xwzxRxnl+1UnsWP0uAquBUiMy6GqCrj5C+PjumYgF2dmkI9rbV0JW+chPz3mP/rSWtA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4, REQID:d625bbb9-309e-44a8-986a-d6bfafb68021, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:1ca6b93, CLOUDID:3c8656f8-ebfe-43c9-88c9-80cb93f22ca4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d0011aa892aa11f0b33aeb1e7f16c2b6-20250916
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 613014988; Tue, 16 Sep 2025 11:11:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 16 Sep 2025 11:11:16 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 16 Sep 2025 11:11:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAejNl8EeUcbNUxSJM332Bv7AVSLS6jgY3hNVZ8iFmjCXbNp875P+A2CNqg0WtIt1NABRFajKqc324QBF3nMnqLOMWGok1xWVSAMukUOhyEngZs5VmkbN88RRze/PgfcYLm6nD+yMyBgfnG5WiPIMSzpxm31YV7uZaHu9pkVTs9Qgnzy0S62BHvEEXZf7j/vrToj5CbE3Yjzab19QA8syVZwhdeVy4dWGd9yOF42sTIPUFxQT7sxeEyg8BcOLpnLQL34SynKTIOuF/KQj7FfxSqo2LMTz5Qs1NeSmRDnq7twwzDvGWSQH/o5YrOzqbhQwhGnKtcrkPwdVWFSxiFG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsYy66mh+6U7Y3c3+ZckJv9R0dwj9kyqMupSZ3Bz+Ew=;
 b=TP8nYt1JkpPATpYI3XO5mHaQ9nmLZbEZ4m9UNfjB8GI64gTiz+jID+rdG3/MAdlDCMlvtqQQm5SApVQ+TvTyncw02z9CzAoSCCiNqL6ahYT/jslNBdbvJi2eOjCGctMrQlXczzDfj60jOmxIgIF/A2sPFl2Xax/0txogkrwMT41FVaZ73IxE5nYR4e5p2c4v/yYYu6Qafima5UW+kZrdpWvFJDilTJRpYN2PSWEML4dfo9VI62pP6Ic2yWflrwpk3AyAu+BI0Ch4z5gwV/Hw3bAFP4UOk1G4ubfE5FcpH0YOKeJzvRxXj+El0+XWoypPVFWcAghQSVIHN+DsRoEeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsYy66mh+6U7Y3c3+ZckJv9R0dwj9kyqMupSZ3Bz+Ew=;
 b=PUklnuQ3DJ6AKXG5iKU02RGGpcIKsF+p7bwP+jYVTcXnBpK9zr/XL91auqX9moD5z/jDlD8ifYo2tMCjAYUIuz3zjql+HOPeofXuwunrsexbZhUSR29CglXikd3w+zw0veSNPkLlCpnX+ehQcxmHu/bRMv4YutBXUbLNg/9LZNw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7501.apcprd03.prod.outlook.com (2603:1096:820:99::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 03:11:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 03:11:13 +0000
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
Subject: Re: [PATCH v4 18/19] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Thread-Topic: [PATCH v4 18/19] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Thread-Index: AQHcF/M/LqHFqwSySku3UEIBMLc5L7SVPzUA
Date: Tue, 16 Sep 2025 03:11:13 +0000
Message-ID: <af8474014ed0e357b833df8e6c3e308373cb97a0.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-19-paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-19-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7501:EE_
x-ms-office365-filtering-correlation-id: 920cc90b-00dd-487e-c99c-08ddf4ceb185
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|42112799006|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SzVNRW9DYmJkNEJTNFRxWk5KRFhsT29rM2Yxd2RhMlYrcXlPV0hIN0dBUm8z?=
 =?utf-8?B?dFo4K2VPSVBWNkZFK1poR1VXMFhTY3Uza2pETmk1Z0FBVGh6ODBiallURy9V?=
 =?utf-8?B?VWJlb25hc0MwMkVZY1lUai8wSjJtSjNlYm15UlZBVXNjd0xOLzJlU2t2VW5v?=
 =?utf-8?B?dXl1ZnhXeUx5cmowQTBLWFRnSWREcU81M2cvd09qejdzd1Q2aE9tRVhRdkNl?=
 =?utf-8?B?SlpGdHBkNkJmWnFtOU0zOHVEazd5b3ZiZll4QXlQampjeWVUV0dQV0gwSUw3?=
 =?utf-8?B?T1hwS1hySjdka0N1VmVTZWdEeU16ckxGUWNRblgrN3BxZk9EWFAxTlJhTDVo?=
 =?utf-8?B?ajljVDc5UHhJZUVMbGE5Sk96b2dLTGdmYlRGODZpdDltaFNEcXQ4RjBqMzdi?=
 =?utf-8?B?R21FZklONTFhQ2VuTHEwQ2MvaU9WaWFyWG5POTJQTHp1ZEJjVlNPbC9pNEcy?=
 =?utf-8?B?bHNPQ0E3UkgvQXBsYXQyMXhXZzZpcGxYeWpzMk52bGlxc0xSMi9HQ1FZdi92?=
 =?utf-8?B?eHlsa2hMSTVRQTZEa0lHaTVCcVFTTDdIQytqRjJBb1RBUGxTcXRHaC84ZGdo?=
 =?utf-8?B?akwrYks3U2VTQ2dHK25aaFF1ZEtVWUkwMUh5Vmx0b2RHOHhSR01BTzJQRUxs?=
 =?utf-8?B?aWxvSXRsWHQxeWxNTmVFSGhLVHk5T3lYaVBST3U5MXlkOVpBUFQ5Um9VMklo?=
 =?utf-8?B?YldXdy84VWt4VGhLbUZ2MjJIRE9ZREpYWEs4YjlJaG5vbkl2bXZtTHR3RS9Q?=
 =?utf-8?B?TFNxYUVpZUZpa3JpZm5UYlVFaUVZUnFyOGlhT2JXdXpvanEwczYzNGlPK1c3?=
 =?utf-8?B?ZnJVTWJaMGdDb09CZ0ViS2NoZG5tV25lWVNhM2VpNlJJMWREcmZPUFlWanZU?=
 =?utf-8?B?L1hZcjJkUEdSaG1VWDhyU1hmYkN3Qm50QUlNSWxCMTNqRjNpdlpWNlU4OHor?=
 =?utf-8?B?OEJoTUZISVBHMkJOeCs0ajVsd1pKN2RxYjNYUlVSaHFhKzBVbGRDdFlEUWVW?=
 =?utf-8?B?NS9MUUx5ZTFSdDQyTm12ZkxaTFc3RGNVd3V2ZUZBZ1YzOGZCV1IyN2g0cWlL?=
 =?utf-8?B?eWlHSUpWVS9ORUFRZE5zc05jWXNYMGpHQmR4V3JEWTZGa2gvaDRUQ0czUGRP?=
 =?utf-8?B?YkZUOU41NklTYndpTzMxNGYyYjk1MERxV01laTBEMVZEUjB1aHNWTUI3RzFH?=
 =?utf-8?B?QmxTTkhEa2h6Wk12WnJCaWVKT0ZHdTFzalRMd2lQQmUxa3BtMlI4WXZpN0FI?=
 =?utf-8?B?NmtHcytWOUJsM1ZXakdpc0JuTmFBK3daUE1JWnZtL1FiT1d5czkxbmtZaHhR?=
 =?utf-8?B?Z2t5YUJCYjNJWm5Jb1ZHNVExNE1YQmRsZ1lUK3gwN2hCVEs2Rk1KZXBXYndK?=
 =?utf-8?B?NHpWWFNmK05FWDJnSVBXVHJoY1JoN1RqZVM4MStJcnZ0NTRLdmV0bGEyWmI1?=
 =?utf-8?B?T1ZWT045bGdHWmJrMlpLWkxEQTBDTU11MHU1eitTVnhUeENQTElqMHJXRFNu?=
 =?utf-8?B?Vmp3SXBUM1Y3VURIYXFsYk82eUw0aVQ0UGNzNW5YREMyRWFNQjdxR2lESStW?=
 =?utf-8?B?akN0REc1Q1BlQ3Q3U2pETVVIYUdpSjM3WDNhQ3Jndjd2SUhKek5ucEtGVG9O?=
 =?utf-8?B?eWttaGlURkJmUzM3cmJNQ0NBZWNUUW5mejRKK1BGN0x2Y0VzQmJDSVJycWxk?=
 =?utf-8?B?RGNoRzM5VVo0RXRydTBLdERrMzBURmZCZ2dMd0haUDhRbFJpQ0dLdldEZndt?=
 =?utf-8?B?SGxCQTFsM1l2dk1BQldvb3kzZmpuL3JKUzNUeXhjOVE0Tmg0NFF3MGJZQ0Za?=
 =?utf-8?B?S1NzR3V6enJFb25KUkt4VEg0QWovOWlnc2piS1ZrcyswNWdxZ0RzSUlpYytW?=
 =?utf-8?B?UTBkZWVUYnJKZkxTQlpybXlMNUZJclJQRjlDT3JLblVsbGIvQ1pRYkVoR1A3?=
 =?utf-8?B?U3MvQkllUkRCTlZHTmNGNjlLSU1lZU1aMUNNYlIvTm5jeVhsVDFka0JFUDNN?=
 =?utf-8?Q?Ic+QlF7FZpKSL69mlck0OvgGD3OI6Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(42112799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUkyRGpwUkNUMGRlaDk4NkUyemVQV3pYWjkrVnlMcG04SVVaRFJXTmZxNlRh?=
 =?utf-8?B?d3p3d2l6a0NZRlBHOVdCNWg4WXEwNGVvN0pFSndmZWRxS1MzRjNvNXYzTjVO?=
 =?utf-8?B?UEExRm9yYUNZZHFCaVIrQXQ2N3VsYk1PVVlCWmYxMDFFemNBWmIwNUlFczV5?=
 =?utf-8?B?YitBc0gvK280ZS9XOTdpVVR3OVZmendsNGZpSzUyQW1nYmd4Q3Y1bk9xbjF4?=
 =?utf-8?B?OHNPVVR0RCs2djhRQVdPdkFxSE14NGk4eG0wNFNNaDJ4WnE1ZS9pUEtvQllJ?=
 =?utf-8?B?NUtXSzU0T3E2M21VbDk2ZlJaNlQ4aTNiQzk4dDZDamFReHhYeVN4R0JhejE4?=
 =?utf-8?B?bzQ4WGpWbVR6WUJMcmJnWlNoWWl1OEpibW5nYng0LzE2ZENHcElwWGorT3B0?=
 =?utf-8?B?Q1hadFpFWW5zQnU4T0NYdGNTbXBFbnFNOW0wYldQNmdhZlZMelVyRmJBbmhk?=
 =?utf-8?B?THNLazNxUFNrazUrM0g0SjJQdU1vZ0p6SGlKSFo1a0FWME1ZaHNvSVVtSWxE?=
 =?utf-8?B?c0NNYk5tTUoySEFDM0VkUDNTV0ZEcng5a1ZscTFaSGVidTQ1enc2YnZFdTl2?=
 =?utf-8?B?eWZheTlKbFpvWVFhUzFTZGdNS3JhdmhxcXErcEpsUnluMWgwcmJ0WXovaHVM?=
 =?utf-8?B?OFA0NEdwM0ZFZXVLNW1ZMUl0ekdkc3J6SHUvV0lGZHdnTFZOOTAyQ01CcElS?=
 =?utf-8?B?d256dGpTTmprVlh0TU1NcWFnL2dlSjBSQVNrOEdxRnUvei9MNEVRSjhPNWpr?=
 =?utf-8?B?MW1oZDUvY2FnRVlGVDZqZ1BONjREYU9yekVWU2RxZjhGRXg3WlZPUnVpbTJM?=
 =?utf-8?B?MU1NVDFMZVBNYXArLzErbmI1KzF2ZGRBWVIvbk5vVE56c3MzeG9wVk1vWXln?=
 =?utf-8?B?QUtmbXNXdG5BMEFVbmxMbkppcGppTXBiL3p5WEdPWkR1N3dqRWtCWWpSQ3Rz?=
 =?utf-8?B?aWVwemc1UERINVc0ZkVjbkc1SnY3WU5yM3VaVE96amdhem1kQ3hIK3ZxbjBN?=
 =?utf-8?B?M2NtUzFLb25DT1N5MVJOcVh2WU9pK2tNQmNabGtjVmo4OFp5L1g3ZlE4dDZM?=
 =?utf-8?B?azMwM0dWYVN0MkFxVmFGaVlrcTZ3VTBoeHJrR2Z5dHV4VkNzNTQ0TUYrWnZH?=
 =?utf-8?B?ODJpM0M0bTRULzdFTlNkWWRzdERNM3Z0VnJoKzdzR3lZNDJpWmFxRm5wSjFT?=
 =?utf-8?B?NUVObld1VUpuRnVMenQrTXhUZWJxdXJyL2plbWxTMzBZM1ZwSmwwVWViaHJ5?=
 =?utf-8?B?S2tROWdzdDI4NG9DbFlXR28rWlJTNW5IVTg3MVlxcGFteWZoTnYxMnFSUm1U?=
 =?utf-8?B?dlpzMmtZTE4welg5QUpSamwxWEQ0dE1pN3dIRWM3b0lxMlA1bVh5Q1g2bzRE?=
 =?utf-8?B?VmdhNG5LQmZ6LzJGOTFVbklLa3VnQkRmQ1BxLzVDUEF2cEFwdHIzQ3pJSS90?=
 =?utf-8?B?cFRIajA2ODBOM3BlNzJ1UWMxcW1hRDhiaDBBZVp6bjNJY1Brbmp1N3BHdFEv?=
 =?utf-8?B?bXdSd0tyd1JNcEx1M0xtUEZQaDI3WDRMR21RTmJ0cG5JZVp6cXhxVEgzSWJs?=
 =?utf-8?B?NG1OZGIxL0xTZTRKTzcyUVZyeitNV1MwdjdSMFJFMWUzcENVbnI4VUtiS0Nn?=
 =?utf-8?B?Mlk3M0pRNXZFb285eWJSaFJHdEk2UTdwUUUzM05rdVV0UDZLKzYwb3EwZm1w?=
 =?utf-8?B?UU0vTGhzSHdtOVVtYTd4UWpJMVI3VHRSRzdacEc5ZjMwcGlpeGxQWFVrbnJ0?=
 =?utf-8?B?UTd3dFhLK1RraTVBd3ZsaDRwdHhNZGdialErU3JDNE1aTFptQ2cwb0Y4cjFk?=
 =?utf-8?B?aWxBeE9BLzdTUGxxdHJmaVFZNFR6NTRvVXcrZ1kvZHZFRWpnV1lpUzV1dmRk?=
 =?utf-8?B?VEVJRDdrUWRHUXdtUityRlN3eWY0MnZUYUNnU09Jb25pUEE1Z0IwZ1J3TUZr?=
 =?utf-8?B?REZRck9Ra042K25EVTRlVHpKbjd5M2U5Qm9haVVJbmFCQ2dJZDZ1TmpUbSto?=
 =?utf-8?B?enBYalJQTFkvanVsSjY3cnJWYTRKU0xOMysyYzhKT2wxT0pDZllQS2tDcjQy?=
 =?utf-8?B?U1BSSzVDSUpSYVpFMTdJOVF6T2JzY3E1QWpmNkhObG5OWjBEMVlUQm8rVi9M?=
 =?utf-8?Q?q0G/UWj3h+G6kBRmrewUZD6MJ?=
Content-ID: <50EF97E442EED74592B8DDE53E295317@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920cc90b-00dd-487e-c99c-08ddf4ceb185
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 03:11:13.4975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkJVDglfMTqWFPM8ryzbyiQ+J9rNfBpdQLoklwI2ggmSNu15mWfJd+W0TXDE++z74b+lmkfZDEkZ2brNuoqCLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7501
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_413909211.2079634966"
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

--__=_Part_Boundary_004_413909211.2079634966
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6DQo+IEZy
b206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IFRvIHN1cHBvcnQg
bXVsdGlwbGUgbW1zeXMgaW5zdGFuY2VzIGluIHRoZSBvbmUgbWVkaWF0ZWstZHJtIGluc3RhbmNl
LA0KPiBwcm92aWRpbmcgaW1wcm92ZWQgZmxleGliaWxpdHkgYW5kIHNjYWxhYmlsaXR5IGJ5IHRo
ZSBmb2xsb3dpbmcgY2hhbmdlczoNCj4gDQo+IDEuIEFkZCBERFBfQ09NUE9ORU5UX0RSTV9PVkxT
WVNfQURBUFRPUiogdG8gcHJvYmUgdGhlDQo+ICAgb3Zsc3lzX2FkYXB0b3IgZHJpdmVycyBhbmQg
c3VwcG9ydCBkaWZmZXJlbnQgbW1zeXMgY29tcG9zaXRpb24uDQo+IDIuIEFkZGVkIG5ldyBjb21w
b25lbnQgdHlwZXMgTVRLX0RJU1BfVklSVFVBTCB0byBzdXBwb3J0IHRoZQ0KPiAgIHJvdXRpbmcg
dG8gdmlydHVhbCBkaXNwbGF5IGNvbXBvbmVudHMuDQo+IDMuIEFkZGVkIGFuZCBhZGp1c3RlZCB0
aGUgZXhpc3RlZCBzdHJ1Y3R1cmUgb3IgaW50ZXJmYWNlIHRvIGV4dGVuZA0KPiAgIHRoZSBzdXBw
b3J0IG9mIG11bHRpcGxlIG1tc3lzIGluc3RhbmNlcy4NCj4gNC4gTW9kaWZpZWQgdGhlIGNvbXBv
bmVudCBtYXRjaGluZyBhbmQgYmluZGluZyBsb2dpYyB0byBzdXBwb3J0DQo+ICAgbXVsdGlwbGUg
bW1zeXMgaW5zdGFuY2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5s
aW5AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsLXBsIENoZW4gPHBhdWwtcGwu
Y2hlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiAgCXJldCA9IG10a19kZHBf
Y29tcF9maW5kX2luX3JvdXRlKGRldiwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGRwX2NvbXAuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRw
X2NvbXAuaA0KPiBpbmRleCBjYmE5OTZmOTlkZDcuLjM3ZTNmNGU3YjI4YyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuaA0KPiBAQCAtNDAsNiArNDAsNyBAQCBl
bnVtIG10a19kZHBfY29tcF90eXBlIHsNCj4gIAlNVEtfRElTUF9QV00sDQo+ICAJTVRLX0RJU1Bf
UkRNQSwNCj4gIAlNVEtfRElTUF9VRk9FLA0KPiArCU1US19ESVNQX1ZJUlRVQUwsDQo+ICAJTVRL
X0RJU1BfV0RNQSwNCj4gIAlNVEtfRFBJLA0KPiAgCU1US19EUF9JTlRGLA0KPiBAQCAtNDcsNiAr
NDgsNyBAQCBlbnVtIG10a19kZHBfY29tcF90eXBlIHsNCj4gIAlNVEtfT1ZMX0JMRU5ERVIsDQo+
ICAJTVRLX09WTF9FWERNQSwNCj4gIAlNVEtfT1ZMX09VVFBST0MsDQo+ICsJTVRLX1ZESVNQX0FP
LA0KDQpObyBjb21wb25lbnQgdHlwZSBpcyBNVEtfVkRJU1BfQU8sIHNvIGRyb3AgdGhpcy4NCg0K
UmVnYXJkcywNCkNLDQoNCj4gIAlNVEtfRERQX0NPTVBfVFlQRV9NQVgsDQo+ICB9Ow0KPiAgDQoN
Cg==

--__=_Part_Boundary_004_413909211.2079634966
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDgtMjgmIzMyO2F0
JiMzMjsxNjowNyYjMzI7KzA4MDAsJiMzMjtQYXVsJiMzMjtDaGVuJiMzMjt3cm90ZToNCiZndDsm
IzMyO0Zyb206JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGluQG1lZGlhdGVrLmNv
bSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7VG8mIzMyO3N1cHBvcnQmIzMyO211bHRpcGxlJiMz
MjttbXN5cyYjMzI7aW5zdGFuY2VzJiMzMjtpbiYjMzI7dGhlJiMzMjtvbmUmIzMyO21lZGlhdGVr
LWRybSYjMzI7aW5zdGFuY2UsDQomZ3Q7JiMzMjtwcm92aWRpbmcmIzMyO2ltcHJvdmVkJiMzMjtm
bGV4aWJpbGl0eSYjMzI7YW5kJiMzMjtzY2FsYWJpbGl0eSYjMzI7YnkmIzMyO3RoZSYjMzI7Zm9s
bG93aW5nJiMzMjtjaGFuZ2VzOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsxLiYjMzI7QWRkJiMzMjtE
RFBfQ09NUE9ORU5UX0RSTV9PVkxTWVNfQURBUFRPUiomIzMyO3RvJiMzMjtwcm9iZSYjMzI7dGhl
DQomZ3Q7JiMzMjsmIzMyOyYjMzI7b3Zsc3lzX2FkYXB0b3ImIzMyO2RyaXZlcnMmIzMyO2FuZCYj
MzI7c3VwcG9ydCYjMzI7ZGlmZmVyZW50JiMzMjttbXN5cyYjMzI7Y29tcG9zaXRpb24uDQomZ3Q7
JiMzMjsyLiYjMzI7QWRkZWQmIzMyO25ldyYjMzI7Y29tcG9uZW50JiMzMjt0eXBlcyYjMzI7TVRL
X0RJU1BfVklSVFVBTCYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO3RoZQ0KJmd0OyYjMzI7JiMzMjsm
IzMyO3JvdXRpbmcmIzMyO3RvJiMzMjt2aXJ0dWFsJiMzMjtkaXNwbGF5JiMzMjtjb21wb25lbnRz
Lg0KJmd0OyYjMzI7My4mIzMyO0FkZGVkJiMzMjthbmQmIzMyO2FkanVzdGVkJiMzMjt0aGUmIzMy
O2V4aXN0ZWQmIzMyO3N0cnVjdHVyZSYjMzI7b3ImIzMyO2ludGVyZmFjZSYjMzI7dG8mIzMyO2V4
dGVuZA0KJmd0OyYjMzI7JiMzMjsmIzMyO3RoZSYjMzI7c3VwcG9ydCYjMzI7b2YmIzMyO211bHRp
cGxlJiMzMjttbXN5cyYjMzI7aW5zdGFuY2VzLg0KJmd0OyYjMzI7NC4mIzMyO01vZGlmaWVkJiMz
Mjt0aGUmIzMyO2NvbXBvbmVudCYjMzI7bWF0Y2hpbmcmIzMyO2FuZCYjMzI7YmluZGluZyYjMzI7
bG9naWMmIzMyO3RvJiMzMjtzdXBwb3J0DQomZ3Q7JiMzMjsmIzMyOyYjMzI7bXVsdGlwbGUmIzMy
O21tc3lzJiMzMjtpbnN0YW5jZXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGluQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtQYXVsLXBsJiMzMjtDaGVuJiMzMjsmbHQ7cGF1bC1w
bC5jaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYj
MzI7JiMzMjtyZXQmIzMyOz0mIzMyO210a19kZHBfY29tcF9maW5kX2luX3JvdXRlKGRldiwNCiZn
dDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGRwX2NvbXAuaCYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmgN
CiZndDsmIzMyO2luZGV4JiMzMjtjYmE5OTZmOTlkZDcuLjM3ZTNmNGU3YjI4YyYjMzI7MTAwNjQ0
DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29t
cC5oDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBf
Y29tcC5oDQomZ3Q7JiMzMjtAQCYjMzI7LTQwLDYmIzMyOys0MCw3JiMzMjtAQCYjMzI7ZW51bSYj
MzI7bXRrX2RkcF9jb21wX3R5cGUmIzMyO3sNCiZndDsmIzMyOyYjMzI7TVRLX0RJU1BfUFdNLA0K
Jmd0OyYjMzI7JiMzMjtNVEtfRElTUF9SRE1BLA0KJmd0OyYjMzI7JiMzMjtNVEtfRElTUF9VRk9F
LA0KJmd0OyYjMzI7K01US19ESVNQX1ZJUlRVQUwsDQomZ3Q7JiMzMjsmIzMyO01US19ESVNQX1dE
TUEsDQomZ3Q7JiMzMjsmIzMyO01US19EUEksDQomZ3Q7JiMzMjsmIzMyO01US19EUF9JTlRGLA0K
Jmd0OyYjMzI7QEAmIzMyOy00Nyw2JiMzMjsrNDgsNyYjMzI7QEAmIzMyO2VudW0mIzMyO210a19k
ZHBfY29tcF90eXBlJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO01US19PVkxfQkxFTkRFUiwNCiZndDsm
IzMyOyYjMzI7TVRLX09WTF9FWERNQSwNCiZndDsmIzMyOyYjMzI7TVRLX09WTF9PVVRQUk9DLA0K
Jmd0OyYjMzI7K01US19WRElTUF9BTywNCg0KTm8mIzMyO2NvbXBvbmVudCYjMzI7dHlwZSYjMzI7
aXMmIzMyO01US19WRElTUF9BTywmIzMyO3NvJiMzMjtkcm9wJiMzMjt0aGlzLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KJmd0OyYjMzI7JiMzMjtNVEtfRERQX0NPTVBfVFlQRV9NQVgsDQomZ3Q7JiMzMjsm
IzMyO307DQomZ3Q7JiMzMjsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVk
aWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBj
b3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5
b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1h
aWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_413909211.2079634966--

