Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89C8BDF4B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 12:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E287C10E3BE;
	Tue,  7 May 2024 10:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ntJY7gCE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ka/urYkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411CC1124CB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 10:02:27 +0000 (UTC)
X-UUID: e55b50320c5811efb92737409a0e9459-20240507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gV1C0cCLrbRJD4KbJCMiS/CNShvjTnVA7NDrsyRvazo=; 
 b=ntJY7gCEKzS0heLyWuXU+F5iEg2qrgwclm4By2uon3y81Qjb72nb7wB3WK8aCXhk9UzahNdBppMofgQqux8FLudPLoEkDI6aKL0Tv0ek8GIJrvuixad/tpequaD3HbJj2CFE44YHi5zljorbN0UkmxhUYtLrA91zH5e1OmDHOrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:08092a2c-92f7-4ea0-9461-179d704baf4c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:8e910d87-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e55b50320c5811efb92737409a0e9459-20240507
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 686942448; Tue, 07 May 2024 18:02:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 May 2024 18:02:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 May 2024 18:02:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOw06pj5QsuE7+U4fF+4Kx1h/VogbmT+gujUwbDm7/aSb2i3uvQwwvkw/SNr5ygyne9in1JOwJQK1vBQsAerJtpuGuCkgNVE8ARXsfchQXY60PXPMISnFGuC0dKl7nSE6NsaVn29jojgaM3Wi+bhexdp4sCaScb7gBl/Lbhp8G2kzCfScTvZYgvmtSall1aao1d7xJoUE+4BJxG/WNxR8iqqK0V2I49yDDN1ipNXWJO8FAInhB/fVlv5W3R7riRcG4aCWP81NCVbSDE1Geu62nzyjSIyBZein3EM3q5yOGMq8UgZYfZolSGiE8Yvo0VFlMAMlUdYE/EwM0vf7vqJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adgzq+4DrAHDTQ6XS02PDBeY6flifsjHvuq7x28sOmY=;
 b=Z+QjmJyubp3aL4OiRl16XQfr9RWX3J5qILNNWgjY4yd8BRoInI5I4Xqtk07QXs1NlYNLHznU27VamcoqG1W6GTHtU+lbaZx4wBLJaTcaQ2PieZJw1mo1FiYgUsLWKOpCvkdP+tRwrW8lyAhz04PvsQa4kjWw9tLk5nzbBWSJBU8O/w/NZUs8txQ2ng7zwCP0EqSuKibZDfFNbZ6xSxvCl8zUORJc0kiIFdyOQ4Wre8Qw/59HDs/YrpDCQ9BwWnjE5H6i7bL2dMjLHCIHVuDkjUatdiYBiCh0q+dcao6YJHS9iRQaD8PMdtbS9CpC/T7+oErDTD/IFNirFm7AK+eoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adgzq+4DrAHDTQ6XS02PDBeY6flifsjHvuq7x28sOmY=;
 b=ka/urYkS+SkzpG+kkLKlICKUKXTxVgDvkyFFDKgX1NLFQJeB+fIVtejGA7Tr3urdZLXkO/ugOVqWIRoYlvDGZ2eYGDfkS9vH7bcOQU9c7mOII6W5nU7plkV8sO++/H3oTCu/5n+Qx1lmIhUxu6qbTrOz/sTnQoP4wttPhx6N780=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB8884.apcprd03.prod.outlook.com (2603:1096:405:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 10:02:15 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::8212:6c81:8e8d:1f7a%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 10:02:14 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 01/18] soc: mediatek: Disable 9-bit alpha in ETHDR
Thread-Topic: [PATCH v7 01/18] soc: mediatek: Disable 9-bit alpha in ETHDR
Thread-Index: AQHanH0N/02eGfVSz022RgbTdY962rGLTiSAgABEJgA=
Date: Tue, 7 May 2024 10:02:14 +0000
Message-ID: <370b7bc33697a8c0578980e3604d1dbf6c047b4d.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-2-shawn.sung@mediatek.com>
 <47908b0befd1e61c4024d6f871b97c9c11e4c0be.camel@mediatek.com>
In-Reply-To: <47908b0befd1e61c4024d6f871b97c9c11e4c0be.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB8884:EE_
x-ms-office365-filtering-correlation-id: aa2bfcdb-eeaf-45a9-54c5-08dc6e7cc58b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|366007|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?ZmlGNkhBbG5ZUVlRdjRsV2U1RURzUFYvMVdzRnBTK3YyeEJHSW1FV3pnR2ZZ?=
 =?utf-8?B?MlFXSWxxTEhJQzZ3MkZIWDFYeW0rTUZJREMwc2ErY0VGZzRzSHh2R2Z6ZWlt?=
 =?utf-8?B?QmlET2c0TVJ4NGlvaTZXWitXa21XanR1MXYzYzRTRE9mMVh6dzArd0JCT2kz?=
 =?utf-8?B?TUVDeGEwZk0rMmpMMTJYb01SKzViLzJWc1krV3paakI0Y3U3RXVHd2xNY3Jz?=
 =?utf-8?B?Z3VZY3h2Rmg5RlNFYWpYYWx2M2w5UGorK1draG5aREI4RDltb2d5VkNxODJ4?=
 =?utf-8?B?Y1VJdkYzSW5NYlNWV2FpOVkvcytIN2NDZG1oR0tlQ1BSYVA0YlgwOGpDZGNw?=
 =?utf-8?B?d3JRZm54QlFwNVNrZTNFUWtyZUxmZWhrSXdLVHBGYmM5WWduZEN3UGxCZlhj?=
 =?utf-8?B?OVIwU2NUWkgwYlFScERKV0svNGxKMU9kbEJpNkhuK2tKaVRTYWVvNXBHYVBn?=
 =?utf-8?B?UjhmVE1qNzRTM0N6b2pkS2haT1FuUG5WWFJNMm9mWWRaOGkzZUJXaDI1VVhp?=
 =?utf-8?B?bm8rVml2VERqTERrY05FK2txU2M2Z3kzRjBvWkxOYk9xSlJrNmdnZkZmM2FH?=
 =?utf-8?B?MDU4aTNSZ1gvWVBJcis2TnhIbHFacUFTdUZldTh5dEJNRjRidm5WZzJVbXRt?=
 =?utf-8?B?UXN2ejY4RFdyd0h4eENONGR3c05helY0dThyZjAxazluT0p1RWhCSnQ3U2kx?=
 =?utf-8?B?Yk5UOFpNeXBSL0pDUmNpcFh2aytXamJJU0NaYVB3YlJkVUh6MExaY1VjWGFL?=
 =?utf-8?B?RGJkdVBQRzYxK1czbEh1YW95SzdmVXZXREt4a2pUQk9FS0JWaStmalJXdENx?=
 =?utf-8?B?MDI1SlllTUtVbWxFUXk4bE80ZkdpYXppUGpraG95S1ZRMk12OGNhS0pNY3B6?=
 =?utf-8?B?MVcxY3FDQVhxUHU4QzM1NmduN2tuUm1nTlZpcm40R1VwNE9aMDl0RUE3dE1G?=
 =?utf-8?B?QlRuQmVBRUxlaTFCU3FjSDdxYkUza0JKNXpMYTcwNVJyRWF1SmczeGViemE4?=
 =?utf-8?B?VXhOdituWlVhZFB1Yk0wOHAxR055NnBraFNFVFZ2N3dOMEZ4UndwSUVqdkpq?=
 =?utf-8?B?c3JLaGFYRmVHcUFSeStIZVlGZHRKQmZPdzhOeWhRTlhGdkxEb3hNeWhCRzhn?=
 =?utf-8?B?N0M1NE1IcFRRUEZhYWlXMXlLMEhTbmNiVGxyMkxRa1kyUmFsRUN6MVR0a2p4?=
 =?utf-8?B?emdMRkFYc0tNSlNzaWFkaDlzeTR2R3dnblM4dUw2UDgzSGQxZFhBL3hCMjJN?=
 =?utf-8?B?VXpnQnlrRm5oWll4UU1yVjdpTnYxaXZHbTQ3VTRtOHNoZ1YxMnhnbzJKYmt3?=
 =?utf-8?B?UFJCM2QvREhqN1VlODZha0RPMkhjcDVlZTE2anR2NkxFTy8rQ0pURmpLODF6?=
 =?utf-8?B?RVNrZW5KSlRzWklDYzNQc0t6WlBmYkRNTkZsckkzbGdUUGZ1dy9jNnpSWFdN?=
 =?utf-8?B?clIyTlJJZFBqNUpjeFFTTUJOb0EzeHVlWFUxOEVNbHpZTGlIbFkxVmkwbDF3?=
 =?utf-8?B?Vjk4TlN6RnRGUDA1YUs0R1h0T2JIbUU3ek9PcGtMUXZvb1pSMnZkN3V4SXp0?=
 =?utf-8?B?c3VZbGlZNFNINnVpanFhOXNaRkJNcEdQdGdTQ09PaVdyVkttL1RwTVlCMEd1?=
 =?utf-8?B?V0NiUUFzTXFGZHNlcVpvYXRLM2N3bzVxUk1XZTJKNXlUd2UvQzB3Mng4dmlV?=
 =?utf-8?B?QlhCcUJNTERrbkJTRVlzTXFHU3prMjhyOXh5TnA2SHNzTG1TSGZsbEtXL3RR?=
 =?utf-8?B?ekZjWVVzOEIrVlpPdk9sdzN3blNyYldBL1cybVQyYy9DNGtBSG1VajFEbzg2?=
 =?utf-8?B?OU1ldmw2VVE3SkpyeXRBZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWhVclFpalFTaWlRcHZkdUl5U0djMGZqT2FvUEtyeFJpVkxYRnNkNHp4QmRv?=
 =?utf-8?B?N2VOSm9DVUtKYVMrQkZnMXRFM01HSS80SkZxNHo0YnI3RWJ1OXFEdDY4S2dZ?=
 =?utf-8?B?ank0ck5uZGFnRkxkdUxLSDU5YVNza2VMSWNpTlg5QmpHb3ptazJsdGRvWm1l?=
 =?utf-8?B?dzdXTDVqVVIxMkJDTG4zUTdPY1FXdWpLY04reWJQbGJmZ2VqWDl1RHJxME5T?=
 =?utf-8?B?MmRWV1NDT0c1emtLeXM3aVcydS9VOG1tbDM2L2RMZkhuZ2twb1ZXUzJ3aGFS?=
 =?utf-8?B?eStvbWlUSG1SRGxEb3cwSlFYQW92czJTdEI0TllMZG5aRHNPamdaZENadHNP?=
 =?utf-8?B?OFdwaStSdkQ0MUQrRld6WC9KbStuWjE0UmZOS20vUFhTOUhOZ3RyeU1aRUpU?=
 =?utf-8?B?d0NnKzB1aVRqSVUvNTFKekdjV21xcjY4ZXpQMGkyWksrSHhNYlVHbjh5aGxs?=
 =?utf-8?B?d2VaMzYwVGZFNzY3Mm5DdkhFd0JwTEs1eVlPM0NTQXgybUhCclpCSnhYdVBD?=
 =?utf-8?B?bWJMMDdLZXZYN3pMdGhYWHpUMEFpNFlIWHkvT2ZrQVNLeE9VbXpRd1h4OVdD?=
 =?utf-8?B?bWU5cHJCZVNyQ3NjZDBOUm1yUzZBdmNzTkEvT0NuWlB0cTN6OFMrZXFVeHRD?=
 =?utf-8?B?M1NHNWh5amZSZFVnZEMwY2t4bWdsZXZ3TWN0cll0Q216aWUwR3AzRWNyZWhD?=
 =?utf-8?B?bG51QkVFb0R1UjVPMXB0dHpLb0RxWjJnTlNLSTNwRkNja0w2dWxWU05jOE1X?=
 =?utf-8?B?M3BvOGFHcVZXb3BqUHovUkNOc0M0WlQ3MnVEUFlNcGlKK2I1WmlWMUM2eWtJ?=
 =?utf-8?B?TW52aFE1aWozOFgrSW5XSW5DYzhlSmVVaENURmZVd0hKM2YvdEp6UjBmWnZ0?=
 =?utf-8?B?bm5hOEhHRzdVSDBKRDdUNEZzdWRjT1ZmNzNnSFIxZlJ5QndWQWhyTklPNkJD?=
 =?utf-8?B?TmRiUzc1ZE42RGdja0phb0h2MEIzOEU4cWZCeHR2d1N1elBvRDdGRUt1SWdO?=
 =?utf-8?B?NDRSalZBTnFyWFdGcjRnN242UE9wa2k4RjhEVDI2REFHV3FZYy9NSWsyRG53?=
 =?utf-8?B?ZEpDa1Rad1ZiZDcrK1pYMGNxUzhJaGlYVlhFL2Zjbm52OG5WejYvcktpZWR1?=
 =?utf-8?B?Z1BuU2JZWWNtNUloYUtKayttd0NoN1IxV09hQ1NpY211MXJYcHBHU2RrdWxG?=
 =?utf-8?B?YjdqYmo3UTlHTzk1RkVjcUZUc0o5ZS9aTXpqMEtwYjlhbitYZ0ZHYlBGNEtH?=
 =?utf-8?B?VlZ4QkFSSm9LdGs2QnRwU092cnlEWmh1Skk4NUl0SEViVWNFeEN5QUt6Rlh0?=
 =?utf-8?B?YmVjWTg4Zi9RMmp3ajc2MHNFV2hXTzFMWlJFNWxrK0swZEg3cTlGeUhHOHJu?=
 =?utf-8?B?d3dmMWJsanBmeENGQUU4eTJPaDFTVElueUtMeWEvUmU2VEhtaHJkS0hiT0t4?=
 =?utf-8?B?RnlPc2lHV0JRbHlSR2Jwb0hudmpqc1Vod01ZdlRKV3p3Y3RjRk5JMnZ5MkN1?=
 =?utf-8?B?MStBZlRWUFFuTVZtSzkvdVpqcGt1ZDhGbVArUVM1c0JZa1NqMGNMQmhlV0w3?=
 =?utf-8?B?MmxBZTMzN0l5MS9qaHF5WEtSeCsweUZXb3RSQU9HL0tBaDdmYlh5cUFucHlF?=
 =?utf-8?B?cnl1dmVMdVVpRFdaeFM5NzZhMFA4ZGFsWkRsN0g1SnJHYVk3YXBUZFdmRjNI?=
 =?utf-8?B?ZFN4dkJUVHI2WWw5bnRsS3lnNlZ6TS9FRGFBQkFOa2JFcXQvUnBuczJ4a0l4?=
 =?utf-8?B?eHkyaHdxS1FvejM1RDlmbzk5OHY2MVpSYWxoZ3FmVEdLZy9IQWQ5a3dtNmhI?=
 =?utf-8?B?QS8wUEpxRHFiQXFSYnR6WHZPVXAvSFB4K2RIN0pOWS9Fd2tpWHdSMnRlaHZq?=
 =?utf-8?B?M0pCanNaa0RvTk1qbmt4TFFMNW1Ja2N1Z25jbk5qR3dGVjNyck1oNHpoanl1?=
 =?utf-8?B?RS80bnVlazFKdXpIaDVKamtDamNrbVNvOStud0J5bkVMWFBQaFlBd2syeWVH?=
 =?utf-8?B?TWhyNEZXNDFPRm5LV01vY2I0QjNMQmd3dk51NGVmT3hraGtMYm5hZ2tkM1dl?=
 =?utf-8?B?ZTU3cjhYTGZ4TUhqaUZDWjExU3c0QSt6MzBXdmxROWdvcHU2b3VWUGVmUVBw?=
 =?utf-8?B?bjl5OXcvWHNUelNseDdLU3ZueXVJU0VCU0JOSHZjelpaZVZJZ3JhUUZ4M1Vu?=
 =?utf-8?B?d0E9PQ==?=
Content-ID: <D914BB04D08E8944A14B08DA7CC6B744@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2bfcdb-eeaf-45a9-54c5-08dc6e7cc58b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 10:02:14.8741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhPGICX6VtG0BojBAhLp2hs4OQuGqHJvvpYu99nPyuwQDoWvXYz5bo7S4XImgUdsVXUjgI+ZbEIzLIQo3nbAKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8884
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.921700-8.000000
X-TMASE-MatchedRID: dwNgap4H9hjUL3YCMmnG4ia1MaKuob8Pt3aeg7g/usArcxGBW8nYGaf4
 O0AyJYLd0GX5/s9SSJMFnxUsgqpImzVLnLsoGnYOW7gz/Gbgpl46En2bnefhoG00AzyoQy/vfO8
 o5FVJ0y11q3E60KR9HsmnYPhq6ajsYLZ5BMT2gKwzw5Ejs3g1lkvE+2pLwGbnFhFGRl4vuUMDkd
 7WQNL44uLzNWBegCW2PZex/kxUIHVmIVC+RmEW7Wrz/G/ZSbVq+gtHj7OwNO0CpgETeT0ynA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.921700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8854B5381CBC19BDA4618E5DA523CC649DADF5A0B6DF6A05FF64E482D1D771992000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_763305580.646842482"
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

--__=_Part_Boundary_005_763305580.646842482
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFR1ZSwgMjAyNC0wNS0wNyBhdCAwNTo1OCArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBTaGF3bjoNCj4gDQo+IE9uIFRodSwgMjAyNC0wNS0wMiBhdCAx
ODozOCArMDgwMCwgU2hhd24gU3VuZyB3cm90ZToNCj4gPiBGcm9tOiBIc2lhbyBDaGllbiBTdW5n
IDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBFVEhEUiA5LWJpdCBhbHBoYSBz
aG91bGQgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdCwNCj4gPiBvdGhlcndpc2UgYWxwaGEgYmxlbmRp
bmcgd2lsbCBub3Qgd29yay4NCj4gDQo+IFBsZWFzZSBleHBsYWluIHdoYXQgaXMgOS1iaXQgYWxw
aGEuIElzIEFSR0I4ODg4IDgtYml0IGFscGhhPyBJIGRvbid0DQo+IGtub3cgdGhlcmUgYXJlIDkt
Yml0IGFscGhhLiBJIHdvdWxkIGxpa2UgdG8ga25vdyB3aGljaCBmdW5jdGlvbiB3b3VsZA0KPiBi
ZSBkaXNhYmxlZCB3aGVuIHlvdSBkaXNhYmxlIDktYml0IGFscGhhLg0KPiANCg0KV2hlbiA5LWJp
dCBhbHBoYSBpcyBlbmFibGVkLCB0aGUgb3JpZ2luYWwgYWxwaGEgcmFuZ2UgMC0yNTUgd2lsbCBi
ZQ0KcmVtYXBwZWQgdG8gMC0yNTYgKDI1NSA9IE4vQSkgZm9yIHNvbWUgc3BlY2lhbCBjYXNlIGNh
bGN1bGF0aW9uLg0KQ2hlY2tlZCB3aXRoIHRoZSBkZXNpZ25lciwgdGhpcyBzZXR0aW5nIHNob3Vs
ZCBiZSBhbHdheXMgZGlzYWJsZWQgYW5kDQp0aGVyZSB3aWxsIGJlIG5vIHNpZGUgZWZmZWN0cy4N
Cg0KVGhhbmtzLA0KU2hhd24NCg==

--__=_Part_Boundary_005_763305580.646842482
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7VHVlLCYjMzI7MjAy
NC0wNS0wNyYjMzI7YXQmIzMyOzA1OjU4JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtTaGF3
bjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1RodSwmIzMyOzIwMjQtMDUtMDImIzMyO2F0
JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3VuZyYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO0VUSERSJiMzMjs5LWJpdCYjMzI7YWxwaGEmIzMyO3Nob3VsZCYjMzI7YmUmIzMy
O2Rpc2FibGVkJiMzMjtieSYjMzI7ZGVmYXVsdCwNCiZndDsmIzMyOyZndDsmIzMyO290aGVyd2lz
ZSYjMzI7YWxwaGEmIzMyO2JsZW5kaW5nJiMzMjt3aWxsJiMzMjtub3QmIzMyO3dvcmsuDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1BsZWFzZSYjMzI7ZXhwbGFpbiYjMzI7d2hhdCYjMzI7aXMmIzMyOzkt
Yml0JiMzMjthbHBoYS4mIzMyO0lzJiMzMjtBUkdCODg4OCYjMzI7OC1iaXQmIzMyO2FscGhhJiM2
MzsmIzMyO0kmIzMyO2RvbiYjMzk7dA0KJmd0OyYjMzI7a25vdyYjMzI7dGhlcmUmIzMyO2FyZSYj
MzI7OS1iaXQmIzMyO2FscGhhLiYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3RvJiMzMjtr
bm93JiMzMjt3aGljaCYjMzI7ZnVuY3Rpb24mIzMyO3dvdWxkDQomZ3Q7JiMzMjtiZSYjMzI7ZGlz
YWJsZWQmIzMyO3doZW4mIzMyO3lvdSYjMzI7ZGlzYWJsZSYjMzI7OS1iaXQmIzMyO2FscGhhLg0K
Jmd0OyYjMzI7DQoNCldoZW4mIzMyOzktYml0JiMzMjthbHBoYSYjMzI7aXMmIzMyO2VuYWJsZWQs
JiMzMjt0aGUmIzMyO29yaWdpbmFsJiMzMjthbHBoYSYjMzI7cmFuZ2UmIzMyOzAtMjU1JiMzMjt3
aWxsJiMzMjtiZQ0KcmVtYXBwZWQmIzMyO3RvJiMzMjswLTI1NiYjMzI7KDI1NSYjMzI7PSYjMzI7
Ti9BKSYjMzI7Zm9yJiMzMjtzb21lJiMzMjtzcGVjaWFsJiMzMjtjYXNlJiMzMjtjYWxjdWxhdGlv
bi4NCkNoZWNrZWQmIzMyO3dpdGgmIzMyO3RoZSYjMzI7ZGVzaWduZXIsJiMzMjt0aGlzJiMzMjtz
ZXR0aW5nJiMzMjtzaG91bGQmIzMyO2JlJiMzMjthbHdheXMmIzMyO2Rpc2FibGVkJiMzMjthbmQN
CnRoZXJlJiMzMjt3aWxsJiMzMjtiZSYjMzI7bm8mIzMyO3NpZGUmIzMyO2VmZmVjdHMuDQoNClRo
YW5rcywNClNoYXduDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29u
ZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3Ig
Y29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1
bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpi
ZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
ZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_763305580.646842482--

