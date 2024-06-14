Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EEB908335
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 07:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9098910EC2F;
	Fri, 14 Jun 2024 05:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Bdocwwh1";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="l9PoUgXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B3E10EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 05:14:05 +0000 (UTC)
X-UUID: e7579c842a0c11efa22eafcdcd04c131-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Z5RizajSjKH2uXZv2OPBl/+U3+vE/WEihNDnOiK+LTY=; 
 b=Bdocwwh1Plxvsr/Rnply+DRlbreN2t1cqdLpGH7ntza9PN1bSCbnp0oJDxONiNhR2qjUJwIVGmYCugubEbr7z6Qst+8qcGVWjxiJTLDJ8nFMENbIp5DKwmfTgQKd8JhL9jFPdkCCZ3JOm587Gcc98pXcZuaqLz5k3aK7Yyc+egQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:7c693f60-d355-476d-b875-9c1847170777, IP:0,
 U
 RL:0,TC:0,Content:8,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:8
X-CID-META: VersionHash:393d96e, CLOUDID:29789388-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e7579c842a0c11efa22eafcdcd04c131-20240614
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 745842290; Fri, 14 Jun 2024 13:13:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 13:13:57 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 13:13:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfxkIXCkT6T7ciuVaYBb5kg22OGUSmW5djx/hMJ6SigPY9QmWTQ5Le1hmiQpbj9n9xT3CrMhIggpC1HwN2Tdknlx8iZ4S+IOvDaaRrDEWbZlCjcusvRE/sNkt31FmwHPb14uEhzTuxkTWF0a8FmqWV20gF4/e/DhBR6H13wawRHOtreP+Dj8Qj5xOlBaX+DP96GCkBj3i6JqvQ7RaRFJDnu66R+LLAmVt6Py4CxZXXGyOV54tsRObaaCyNS15ag0F//VH0SHdS05RvIetjSPkXeSb/t89+vV6JOch3PwgbZAOK4CZPUWmW7yYnv/3QSv2rXeQZwvPmX+K+0Ap3fpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM1Oj3VZoBC2yoZg+7uXguf25hikdky+VFDFJBS959g=;
 b=fdqf0NrciObfbUoayKWs2MBxaZGbQCrM6LAPLqUwdAb5hq/EVpv3vUm76ttSY7ZW+uL+ePE7Id5mSPIi+56hmIhkKUqbRutTR+iJx/e9oARw7xutZyZ1EaOosTlryJ9blLa32cLDAGuzPzf7BNigZKXwdiCd+8N0cC3p/lZH+f8GFBz9r3x8GCaMtwNmo/uNVY59pcodAvYQu9kk+uJjB1cKkNQmwvTNCH0jFvB+B+OMGJcXBGC9ryX+IiELRX+oalMbc9LxvMTzXZtumBkLMEPergl04lU9lpx+yCc14l519EL+5f43JyIXhp4VZZ8ZlQvQtecJNHe7iEeusHnU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM1Oj3VZoBC2yoZg+7uXguf25hikdky+VFDFJBS959g=;
 b=l9PoUgXnr07JUQwotsAQAvwrXt8THzs91UfL2Gf8avD7ao6+C91FCdWqkifpPAnxHfmJAlbRvv2kO4sb/+kysJROFlWfXAdTXgHHxpnrY010f2TjDJkLNrmrqr4znhLRolBVlM1nsEiOnFlNFq2wUpCpHvBTha65oP+sqrhTH78=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8324.apcprd03.prod.outlook.com (2603:1096:101:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:13:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:13:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 15/21] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH v9 15/21] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHavgU13CywtfrIeEuF+lAWzMf8XrHGt0IA
Date: Fri, 14 Jun 2024 05:13:55 +0000
Message-ID: <d9dcb87b431aabe580db54624aa0754a479f7254.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
 <20240614024620.19011-16-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-16-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8324:EE_
x-ms-office365-filtering-correlation-id: 1f50c4cb-52cb-4535-df66-08dc8c30c9e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230035|376009|7416009|366011|1800799019|38070700013; 
x-microsoft-antispam-message-info: =?utf-8?B?cmJUNlA3Qk1xcWpHK05SVWFFTE1HWVhYSlYvTU80bW85czhYdUhhOEpKSWFP?=
 =?utf-8?B?TE1CY1UvdXdrVkxqdnRBV0QzN2s0bjEzQ3k2bENyRnFXM24yZ0hrZ1B6VEpR?=
 =?utf-8?B?dEE3S2xPRjNudHBnVnVWZU5pYWIrZU9jQVRnWmlaSXR3cEZrZjNaWXpQd0Ns?=
 =?utf-8?B?dERvN05TM0x5ZmpmWitWZEN6Uzduc2U0QnZDaVRrcUNsQks3R0ozRUdvYlB4?=
 =?utf-8?B?ckNlc1dZeEFMNldzUHVhWDRhNEhQeVpPYVh2WVhlYk84UWdnZ2lmZWVyNEls?=
 =?utf-8?B?NDFmMURVZ0ROeVVUS0FTV1hRVWhnNzBiWHMrUmxoNk04YkxSWk9ER2p2aXR2?=
 =?utf-8?B?ZFVEQkUrbVd0LzRuZ3gyWnpkRndOa3pvU2xEVENpYThBWFhjdUhuRTU3Y09N?=
 =?utf-8?B?ZWl6NjRlNUszMmFwOXowMEFicnJ3cEVwTHNYclVrYmNlWEwvNDhycS8vU1dI?=
 =?utf-8?B?K1piR0Z6SEpLdGpoWmthbTBSWmFmbXA1aWpXcXAwV1EveHFhb3RjSzd6ZW1l?=
 =?utf-8?B?Rzh5ZTYzUW9EQk5tQVlocHlBVHlncUVvTFhTanE5L0MwMnhvVTZkZ0JWZHd5?=
 =?utf-8?B?TTNpbTBHT3FjUjI5OVRyOFhYWEdwZFpjYk91S3BSUHVaZkYxV2dBK1kvS3pl?=
 =?utf-8?B?ZkxXRW1GVzk5eU5id21jdXlJbUwzMkwzVGZ0LzdsVFZkZFdKWTNpQm1CWlRQ?=
 =?utf-8?B?VWhVbWRMUEZWMnQxSmFZdi9TYkRnK2t0WFUzTXFhQ3VSdjQwcVFIRm5NN3FX?=
 =?utf-8?B?clNEUzJleVM0Uk82RXRTaWZUWHlGeDJvcjdBd1M3MnhtWGhaOFFPSjJiS3Bi?=
 =?utf-8?B?ZW9JeWxjRnNKak1YK2dTemQzNDQ3M1pldDJwbGVTL3hkd1ZnV1pFMVJScXkr?=
 =?utf-8?B?OEVpTDJuMW8vTTBoMW5DajlpVU5KVng1R1BRL2x3UmlXNjhhR2lWMjR0SWhW?=
 =?utf-8?B?UDBPaEI0b0lrVyt1S3BBTGdmbDV6Tm5CK2JoZWo3RWpDYVF5MjZpMmVJbTV5?=
 =?utf-8?B?dnFiMnFqWDd2VUdaMENndXg5OS9RbUNKZFhtWUl0czZwS3dieWdDck9vUFIw?=
 =?utf-8?B?TTRFRUN0RDBSNVk1dmJlbVlDcjNIYnRYWDAwTkd6cFNrZnJtSGNNaVFZbERI?=
 =?utf-8?B?WTgzSlVOZ3ptc0tzYjVuanJoZTB1N3hsQ012UE5pQjVFVUpodDIxRXJLS3ZM?=
 =?utf-8?B?dExCUDRyREJ6ZHRxZEtXaXFETUdMMEtLb284NDhma0hydXIwZG5pKzFnYW02?=
 =?utf-8?B?UmpsYU4rRnhWbm05TDE0bVZwTXl2d3AvYnVBbDVZZEtXcmdScS80enVpVHdu?=
 =?utf-8?B?dUVkYlFYak0yd0V1Nk5HcWFheXVrRCtMSTgzOTU5UGVia2EzSk53elJmbDBt?=
 =?utf-8?B?OGVyalZlOGY2dW5HRTBoSkVVVUtTSXdzc1RETExBdSs1YnZzRU8rN2dZdk1X?=
 =?utf-8?B?MVh2OHdhaUNUbHZJL0dudHZLNkdHeGtrSEsycytGbW9iMWVtSXQyc2Z2SHZW?=
 =?utf-8?B?cFpzZmI3ZGpYZmVZTUd6VmRtMHdtT1ZqemdkNkMvMDZUSVBDZVJXMllFYzZ2?=
 =?utf-8?B?RDVSMnl6aTdvM3d1aG1CY0pTRkhXdUxSUisrTzRIQ21URVRZblNJTVdKaWpS?=
 =?utf-8?B?dlJpd1o5SHB2S2NqWGFhbFVKVit4cFZYVTVXK25UZlNHVXhlU2swdHFuR01Y?=
 =?utf-8?B?ZEZPbXhkRkpIcEszUFcwQkNRUWNuaFM5TkFzU0wybHhLekFWRlBLOHNodytO?=
 =?utf-8?B?NUpzMXI4QkFFTEc1WUFuNnhYUVBRb3FmM2t1b0FPbmFRdWVFckFld3JSOGg1?=
 =?utf-8?Q?CsU8fozcurjrtkXQxURzJ0Htrz+1WLIlWRjHA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(7416009)(366011)(1800799019)(38070700013); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2tVSHJjdnhMQlZiUE1WRE1QY1dCdnN3UkFxMFYyVisyRXExV1FCbVJaeWJ5?=
 =?utf-8?B?RlFQWlJ2eWs4Y2svWGRsMzQ0UEorcFNmd3czU2xsK0tPdmZWZGV0Q3NEQXRP?=
 =?utf-8?B?OURuNnVGekFnbW9FRnBRMnVVVDNKc2tQR2xTODZlemRNR0s1WS9ZTzNwbXRz?=
 =?utf-8?B?ams0clZKakV0MHBFeC9YdGkwby96VWlVUjFWN1hGaVNsZ21TUGdEKytwYXA2?=
 =?utf-8?B?SWM3STcreDc2bXZCSzhpV0tHVW00MFBCN3dCSUNvUlVPeXgycHVoTGwxZmNH?=
 =?utf-8?B?TUg1MXBkWVo0UkNtTGZUdE9laTc0Q2NFTVpBZWNvWDI5UGRTOFRiMEhLWW9S?=
 =?utf-8?B?WXhlaklzM2t1Y0ZoQjV6RmFRVWlwcklvb2pwd0dPK0xMUWo4cytFTnZiaTUz?=
 =?utf-8?B?THlvMmI1MnIrYWZlUmI4cm1DQTdoWGc4bGc2dzlhSzZ5dXBXejdKdkh3UlpG?=
 =?utf-8?B?TWRkR3kxSzRvNnhhenRoSDlBQTloNXRJWU5CdndRVmFJZzJOVjhKc3RCS1NT?=
 =?utf-8?B?Ky9MT2RqSkt2K29Wb1hsT29KZndJT0ZZaVVrK2JQOHZwakI4QkpPYzVSR3ln?=
 =?utf-8?B?YmllYW15MUtvT1QyWkJrZjdwemhRbzBQaFVDQ05QVEsvSU40c2dRUHFZNzdj?=
 =?utf-8?B?YzRScnhOZnNTUUx2ejZjbC90VDA4TmFFQW5tbmJ5TGExNkZTSllnejlGR0Q0?=
 =?utf-8?B?bXlOV1hsNFRUSUwxQWN6RkE4cDdvSWhKZks1V0RhUHJFd2ZBQ0p5NmtGNyth?=
 =?utf-8?B?d2J0Y0VjbVdMRVdQNE5mNmkrQWs2RXY5cWJsRWhYemlOS3dVNW8vbnFrMFgw?=
 =?utf-8?B?ZVVQa1hkRU1FVXpJZ3haOG95QVpmNzZIL3dsMkJGd2txYTUyTjJybnNDQStH?=
 =?utf-8?B?NTM0MjcvN1FKeGZldFdMa0RTNXMybHFHTEU4dzRKVnNObGNEL3h6c0Y0TEJi?=
 =?utf-8?B?dTlvR2JpUXdCWllDUC8xc0xmU1dlN244cEJCZzZ3QUN3SkRiNllVTWVMZC9a?=
 =?utf-8?B?d0tKaU5vMUNlS1R6YllreTRZVkRPaVFidFBMZysrOEVhRi9xWDdFa3pxaUo3?=
 =?utf-8?B?cVdva2IzQWRZMmR5dGRHdlJJdEthTTVEK3U1NWxHeDgvWkhpVTlSQnNKN1I3?=
 =?utf-8?B?R2FocDFJRTNBVnhtQ0xLaHVsdDVUSmVLVDBKVUE4dFgvNThac3pSUjg3a0lp?=
 =?utf-8?B?cU5FQVJOL24ySnNjSmFVVmkxbjdnZUM1RGtNRVBVeHRVQml6VFQ3Zm41Rkxp?=
 =?utf-8?B?MkRRK3lwejN3d2JRSjlIcHZmWU5mUXVyQ3ZyZ2tuUnZ3eE9kc21SbzV2clh2?=
 =?utf-8?B?WnNML0VaaDV1VGVkS1FFWFhWY1NVWGcybmVkT2dyc3BQdHdobzFmVVM3emxF?=
 =?utf-8?B?ZlVlNFF4UkZKS2NFOTJ5ZStDTzdRNTZpdmpsZUZ4dUF0T1ozYzRyMEdhMzQ1?=
 =?utf-8?B?VUpiVWQvR0dpeDZlUGp2ZEwzZ1RDZHV0VzV0S0VYT3F6cmM5UE5vR0NOOWFl?=
 =?utf-8?B?YkcraTBBcVRyQnJZd2ZXRDgrNmMyRGFBVEc0NCtDYU55cTRCWTNvbXVySmNU?=
 =?utf-8?B?L2Z3TlU3TEVoZHRZZVluWjN2YXFUcllYdDFxTUxHWEkxcDBPL0hUUlViMXNT?=
 =?utf-8?B?YXRGT3ZsclZtekRaSEs1azdVVTFKcCsrSWdpS1RUTFhoWGYvcENITVpQWnBM?=
 =?utf-8?B?cWMyeVBRQ1BMb2kwVVd6NmprV01UbHRXUGVQNWcyVlFkOUVDWmZra2JERkdT?=
 =?utf-8?B?RVl1QUQ1WjM1Um5BR0t4QW1tcmNVYmRwczNIbXlmb2k0eVVFUVo3NkJYbkdO?=
 =?utf-8?B?QTRqK1BVNHpzdnNiN0N0a1crc0hCbVFLS2RMWE1jWmFrY051RWM3TThra0RM?=
 =?utf-8?B?SXJ3c3pOUjdHOGR3eXllbFdxVnA0M1VKY1kxU29IQ1U5UWVUbXVueEZOc09K?=
 =?utf-8?B?MFlJSFJZMDhENHJvNFZCSWhHSHpoY3gwZTh4bldFTFRqUThydjdicXFjelZO?=
 =?utf-8?B?NzkrL0Z6cDVhajNlWXN6bHY1Nm9nY3NKSzhlRm5LMzVJR1lja1l1eEdRVGVn?=
 =?utf-8?B?Z2NiZ1V0ejU3VzFWdXBpWHZBZGpjbW55SXhpdGNoVEdNUytZWmFEa21aSW1Z?=
 =?utf-8?Q?gpo39FOELd/arF4mgsaPYh+BD?=
Content-ID: <5EA707BADADF2C4EBC0FC269CF3E131F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f50c4cb-52cb-4535-df66-08dc8c30c9e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:13:55.3429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jarzAoXjmSat0VzwuxE84Ov8kUEMOv1O1wNDq5k6DE9xojnYT3Cnilasv8tCBPo4avoBGBh6hJUM6SxCJf6h+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8324
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1479065232.534234646"
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

--__=_Part_Boundary_009_1479065232.534234646
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIgYWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRl
aydzIGNoaXBzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwg
NCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGluZGV4IDdlYWFmZDQ0
ZjMyMC4uOTA3YzBlZDM0YzY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2V0aGRyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhk
ci5jDQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICogQ29weXJpZ2h0IChjKSAyMDIxIE1lZGlhVGVr
IEluYy4NCj4gICAqLw0KPiAgDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9ibGVuZC5oPg0KPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZl
ci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiBAQCAtMTc1LDcgKzE3Niw4IEBAIHZv
aWQgbXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGlu
dCBpZHgsDQo+ICAJCWFscGhhX2NvbiB8PSBzdGF0ZS0+YmFzZS5hbHBoYSAmIE1JWEVSX0FMUEhB
Ow0KPiAgCX0NCj4gIA0KPiAtCWlmIChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUtPmJhc2UuZmIt
PmZvcm1hdC0+aGFzX2FscGhhKSB7DQo+ICsJaWYgKChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUt
PmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKSB8fA0KPiArCSAgICBzdGF0ZS0+YmFzZS5waXhl
bF9ibGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpIHsNCj4gIAkJLyoNCj4g
IAkJICogTWl4ZXIgZG9lc24ndCBzdXBwb3J0IENPTlNUX0JMRCBtb2RlLA0KPiAgCQkgKiB1c2Ug
YSB0cmljayB0byBtYWtlIHRoZSBvdXRwdXQgZXF1aXZhbGVudA0K

--__=_Part_Boundary_009_1479065232.534234646
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMDo0NiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyOyZxdW90O05vbmUmcXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7
bW9kZSYjMzI7b24mIzMyO01lZGlhVGVrJiMzOTtzJiMzMjtjaGlwcy4NCg0KUmV2aWV3ZWQtYnk6
JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYj
MzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMz
MjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7fCYjMzI7NCYj
MzI7KysrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7
aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIu
YyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO2lu
ZGV4JiMzMjs3ZWFhZmQ0NGYzMjAuLjkwN2MwZWQzNGM2NCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjst
LS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjtA
QCYjMzI7LTMsNiYjMzI7KzMsNyYjMzI7QEANCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtDb3B5
cmlnaHQmIzMyOyhjKSYjMzI7MjAyMSYjMzI7TWVkaWFUZWsmIzMyO0luYy4NCiZndDsmIzMyOyYj
MzI7JiMzMjsqLw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOysjaW5jbHVkZSYjMzI7Jmx0O2Ry
bS9kcm1fYmxlbmQuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtkcm0vZHJt
X2ZvdXJjYy5oJmd0Ow0KJmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fZnJh
bWVidWZmZXIuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtsaW51eC9jbGsu
aCZndDsNCiZndDsmIzMyO0BAJiMzMjstMTc1LDcmIzMyOysxNzYsOCYjMzI7QEAmIzMyO3ZvaWQm
IzMyO210a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMz
Mjt1bnNpZ25lZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO2FscGhhX2NvbiYjMzI7
fD0mIzMyO3N0YXRlLSZndDtiYXNlLmFscGhhJiMzMjsmYW1wOyYjMzI7TUlYRVJfQUxQSEE7DQom
Z3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0m
Z3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3Jt
YXQtJmd0O2hhc19hbHBoYSkmIzMyO3sNCiZndDsmIzMyOytpZiYjMzI7KChzdGF0ZS0mZ3Q7YmFz
ZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3JtYXQtJmd0
O2hhc19hbHBoYSkmIzMyO3x8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtzdGF0ZS0m
Z3Q7YmFzZS5waXhlbF9ibGVuZF9tb2RlJiMzMjs9PSYjMzI7RFJNX01PREVfQkxFTkRfUElYRUxf
Tk9ORSkmIzMyO3sNCiZndDsmIzMyOyYjMzI7LyoNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtN
aXhlciYjMzI7ZG9lc24mIzM5O3QmIzMyO3N1cHBvcnQmIzMyO0NPTlNUX0JMRCYjMzI7bW9kZSwN
CiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjt1c2UmIzMyO2EmIzMyO3RyaWNrJiMzMjt0byYjMzI7
bWFrZSYjMzI7dGhlJiMzMjtvdXRwdXQmIzMyO2VxdWl2YWxlbnQNCg0KPC9wcmU+DQo8L3A+PC9i
b2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVE
SUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55
IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxl
Z2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJs
ZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2ln
bmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlv
biwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9m
IHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19
LS0+

--__=_Part_Boundary_009_1479065232.534234646--

