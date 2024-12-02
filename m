Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F29DF90C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043B710E186;
	Mon,  2 Dec 2024 02:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YaIQFgX1";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="V5reEOCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2754310E186
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:52:17 +0000 (UTC)
X-UUID: 6ee9189ab05811efbd192953cf12861f-20241202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rJIaABWjqwCpd03/aqtRfpBw/axzowJUfQ+fbKNLvRE=; 
 b=YaIQFgX1gam3EXMPltWn5QCuuDwMN8Ydgk43nVVUSWPxnz6GX3su4lEB356Vu+uQ4uduWAKrOQiOCylg1gFxdQpSF5V/arDVV80f/Ts1zkZsxGcx7hDpBnJSokB2W1Js71lbBvh3XtD/ok+yjztXBSqDzwDkn1z/Rf3i/h05aQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:6e8ac29e-29aa-4fa6-aee3-d1f90cfec1aa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:2447cd23-634f-4016-85ba-2d63e55c9400,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6ee9189ab05811efbd192953cf12861f-20241202
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1289758375; Mon, 02 Dec 2024 10:52:13 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Dec 2024 10:52:12 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Dec 2024 10:52:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNIeIPE2vPPDn5vrZa0ZLYpKzXFjNjxHKHu7LhFm/xK6b2v3Hvor+i3Eq9acH/3My4cUVPVMuD1S0x8WhZyTCqIPa0Jyt7hlSy5FPeKlBVcLwtMz4NqgtqgcdO08MhhT/ViZhGBpI50DW19l/p/Jd1rMTEoi/XZyQ9ZS2gB1BzlP6Zcq7DwaTpWpXKaR6CQbL2m8tfi5OaswGUDoXMj3sYOI3m0qdJ6z7Zy0gxEG1aSB6/FDmBuKc4rcgikHMnt37iBlnd2N3dRrqHi+KAHHtCWIFAAA8+mLNImil2r1m4xTQoortNAR3ceVu6rTlreGVZEY5s4eRt2stPWLGiX2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2slswlxIW/rYG3oDZAqTzCp+Ck2e0uFzBsHmmcBOTfo=;
 b=NYovJ4T/YNMtmT2z7dyG6x4ezCCuPrrXoqkblvjhg7g4JkBzJ7dOg2Vg7wkCIWF81fqumCXxTCMymDSkd8YAvFeOAOInKGHQqZBDrHen40qRI5Aor5plMA7AFegRLKjjlBCSSmJL9p/Fru4WbtT/9UBVO4p26/wKT7m4AxAAf3R+tysgg+J4uJV4ocnAMcKTKXHNli8cDGU5ybh2u5uDDosVkuagF1WwBVW5C7/ViPbBtK3nTnWcRkDJ8XbQHUMv2pYLZ4lItIOc+L/ebRnv09gZszJHU8SRxzJ0U5sN8KOYN1L0Sdes1NxXfQBBsHh4fzPs5fM1KSRdlipArj5EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2slswlxIW/rYG3oDZAqTzCp+Ck2e0uFzBsHmmcBOTfo=;
 b=V5reEOCImxjWylN7ixWIqHPrTZBx69paGGlBUyNPHW6CUFiGl8YlipSJlhpVg9q5+AED6lx6+pgD9uclnefZ3bJJq9/ZBVk2eK98y7JdY/w9No85UDXBfZopoH/NtFDz26U+1xDemUR6cd1WYEKE9AfqoSQN+uZwsgSYEMFLRxA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8636.apcprd03.prod.outlook.com (2603:1096:101:232::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:52:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 02:52:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbO0pOdhPnCCfvPUeRqumGFBNh8LLSU8UA
Date: Mon, 2 Dec 2024 02:52:09 +0000
Message-ID: <0fe707761a3a5a432a191f5afb07df7831e03c22.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8636:EE_
x-ms-office365-filtering-correlation-id: fc10c645-af1a-44d7-fcad-08dd127c5081
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y2xob3BFUjhwSVEwYWl0ek5kSitibWJBem9FcFBRdGNoVHM3WWRlK2QyTndv?=
 =?utf-8?B?WXBteWhzUjBwVSs0VGlvcmZZUUYzYzdzT1lIN2VTREROWXBsWEtoLzZDaCsz?=
 =?utf-8?B?V2JlQ3BHYnkxYVh0eTdrQlRoWnJaN24zTVJsYnExeVNqeEtWdGFPNFU5MW9p?=
 =?utf-8?B?Z0lqbTVqT3RUL2ZzUVNnN1k2bTdyZThYdi9TcnFHSmNPaFlLZTFpTkxHZlFy?=
 =?utf-8?B?WWlSRjBESkdONFc3dDlhTVZQYlFkZjcvTG5Sd09OLzdya1Jrdkp6N2VZUzRV?=
 =?utf-8?B?cCt6T3VpUjVTQVNKaEhxbU1nNFRYRU82Tit0TjV1RHZmZzJXQ3FoWnl0Zzl1?=
 =?utf-8?B?c2pOM1IvV2ZqbHBqZzBIejUzdlR5ZGphNElKWGJnQ1ZwWldWRUpKdE9UdHor?=
 =?utf-8?B?MytjQjBHRG1obittT0ozV0V3Wi9Sc3dKajBvM2VXeDJCdFZNTmI3RWZCakNk?=
 =?utf-8?B?WEJCcXhBVVZOMWRraDZmOEFvcGxaTHlncm03TjlMeEZKenpIVEQ1WUNBTEVv?=
 =?utf-8?B?VXZmRlFWYjY2MkMreWhyYUtUdGZKWDBOOGZlb0p5V3ZBdlJ2c0FtTTZ2OFJm?=
 =?utf-8?B?Q1lZYUJ1VTBIT1VoWUlFYlpQNUg3SXhzMi93dy93TnpmMmVQR1FnZzlOZDlo?=
 =?utf-8?B?UnVjd1JCcnl0NDNVN2ZmUEROZ25ITk1MMDdqcEhnclJueWFIcnMvZWUzYkZO?=
 =?utf-8?B?SlhEZmRaSGZESW02UUcrVi9LYlp0cnhGdnk5SndMOUlRLzhZQm5iSGhVT0lZ?=
 =?utf-8?B?ZjJOdDFHM3lZdlJoaXc4TUVpd0g0NGZ4R0Nhd3p5cDhDSzVhVGFOQjRESGd5?=
 =?utf-8?B?NjZzQnFRUG9JYlN5RWR0bDlmTWZ1UzlrRWwvSUEyNFJrZDBlOEtPUHhGSmpN?=
 =?utf-8?B?YmpCY00yNEFabERwVzJmd09WN1NoczhTV1YwSk1ENjJjNE1pMU5vWkZXTmxo?=
 =?utf-8?B?bUgrb3dRU2xtRm1nMGgrVHdDcFdGUUh0eXBNcFRsZXVvb24vQnBTemxkMTlD?=
 =?utf-8?B?SEExMm9sYUlQUWVrNU9tZWUxNyt3eGxGL0VRa2RUaUZMS2N1N1V0SFkrUlVZ?=
 =?utf-8?B?Mnc2OUtvZ3F5dWE5cFlQdUFoQU9SS2VFWWY0Q294MWx2Z0pkdjhUUUsxLzR0?=
 =?utf-8?B?b0hXc0tZN1MzTXBLL0YxSkdTdkxQUFVuajRBakd6UlpsRzd4cWV0bmpJVHhN?=
 =?utf-8?B?aWppdGdOaXpaL2FkcHlkWmkvK05iWm9NR2F4MExmZWo1aGFXaUVKa09zeVlV?=
 =?utf-8?B?WnBIbzlmQnJjdFo5ZElxRys0dUw4eWl2VWwwSSs4RlF5QzdIOURqaVZxVXds?=
 =?utf-8?B?V1RFazkxamN3ZTlGaUVQT1NiNEw1WGRUaVJQeDZtUmdNK2ExNWRBWlVvMzZ0?=
 =?utf-8?B?cURseWRtUDl5Wkt3NWRFSXBEOThxRE5iUHB3RU9hTmNTR25zeFlWbG5wWllS?=
 =?utf-8?B?WTE0NlNpSm1Ja1NvbVE5dEk4c3NHYXI0OWx6VDRaU0pMY2QwT2tVWWNLMHJp?=
 =?utf-8?B?UFMyTkpQejRYYWNrR1ZvWTRrNkRZMy9VaDJqbTFBRk9Nck1CUWR5dmh5K1o3?=
 =?utf-8?B?ZUZIZnM0S0RkOVFubkNDR05TN1dCOWxZRGR0OHQ3SnFhOWlKMzF4ZGdKZXQ2?=
 =?utf-8?B?aDZZWHprOFBBU1lBam1aY1RDekxHdE5TTDBQVzVjL1JLWW5LSUt1Rnk3OWZP?=
 =?utf-8?B?aWxkZlRrNWoyTDNFTlJQblluY29SU2NkMS9VRG5LUGxYMlNMZmZ5SXRnYmh4?=
 =?utf-8?B?b1NIdjBOK29VRXdwRUpiMXc3OWY0M0FCamRwNk5pSlBIb29vVkY1aHR5VVBw?=
 =?utf-8?B?N2c3ZlhrYUNFVWU4bDhpd2h4QjE1RXhpUUtkbDhqZWhYZGlBQ0JZeHhycFFp?=
 =?utf-8?B?TmtKcmRrcWFFWXhPa0xZQ1RPK05JS0VEeDIwZFR6eHF3Ymc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEppWmFkTXJ2Z1k3amI0WDMwalZ4Ry9YUk8yV0R4V2laTUFsbnNaNDdHQUx3?=
 =?utf-8?B?ci82L21HUTcwa283K3pRVloyeTVldVY5M1Y2cFhOeTB6RHlFczZJU3M4Vkto?=
 =?utf-8?B?dG4yY2Q5Wjh2MXdteHdMMXdvVW8xVm5TakV2QmUyV0tCejZmOS9BWWhiL1Fx?=
 =?utf-8?B?aHJpZTRlYkEvb3RTTjQxT0dTNlpIMFdLWXdmYzZCSXQ2RFNCa1VaRTJnZEhV?=
 =?utf-8?B?VzlGb1h5WDhPYUpEYVJYNVJmWmg2ZUZvT0FoeXpHZDUzTDc3YVpETERucW9m?=
 =?utf-8?B?dklqRjNWbmlOTzNMZkpIME1WT1BGU2paZjhLMWh5d3dxS0ZJcmczMGdkYkpW?=
 =?utf-8?B?Z1BjelluZTRjcGhsMVg0VTd4bEI0OG42UWQrYk5qSWVQV3pIVEZYQXlvcncz?=
 =?utf-8?B?Vm9pZUpWTzFmd2ZtekFOd3FWTXYyd1hqbDhaUVU4VjhKL0RMaVppK05yQ3Fo?=
 =?utf-8?B?bmdabkh2WkttT3pWallXQVlFdHA3RUl3amlNZXV3ODZFM1JDemdMRmxraTNP?=
 =?utf-8?B?czIwV0NoWUxwZ0ZEZjArQzlTeFBWQ3QrcUhtVHBqdUI1V08rWUpIbG5kRjN4?=
 =?utf-8?B?UXhpek9Wek1PYUpzdlloUWQ5Q2hUcjlxbjExNUlkUVBhVElzWjF0a1pGaGxI?=
 =?utf-8?B?SjQzdGlaSzJOTVFrbXloT25kMHQwREFmcXdoVlVQazNqUFFtc2NwVEVuOERt?=
 =?utf-8?B?L1Zhb0txR0N6TjQrYzFFZTUvNTBHaUVwNTlUaFIxcjYwRTJKVkR0dFNrSTRY?=
 =?utf-8?B?OWY2S2p4dTAydFNpYk1RVlRLWTIveUs0MFZVbDFwVEpJL1NnZkJDRFNPMUw0?=
 =?utf-8?B?blh4N3h2bk81SWd0VDdIamJEWllRZk5UcnFxVGhOOU1zZHBLT1ZBRTdXU0lw?=
 =?utf-8?B?ekpJVHdWMDhRTi9JSkIwdU03ZlRvcHI4SWJBcWZBV0hVTWpwV1hDWWRuTVBX?=
 =?utf-8?B?anBjbERpU1dMWFI2cXFyb1lTbkQrYzFrOHorTXpld3h2ZVZDWUt6RW1tYjVM?=
 =?utf-8?B?N01vUERudk5yQklCeWpnME83TzduMFIxVllDWVVqQXZsYVh2dkVUR3ErNzJB?=
 =?utf-8?B?VStzeWlFdmwydkpubXh0aExkcXBFQW5OZjROYUliZThoNWl6TXNDTktoOXFR?=
 =?utf-8?B?UUFRU1RSTE4vODcwOGkxeHdCTVNSVndIaTdUWFF6T0VTalljdEZodSs1Qmli?=
 =?utf-8?B?aTlrUExtbkRiN2RoSTlRRE9ONm5aM2ZnOWFzU2gyL2FiVUhnaXoyMlVBTFFX?=
 =?utf-8?B?WE1QTThiYk9RSk5BdC9kOG9nN3hub3ZwdGxkUzZneStYcDNIRE5keVlocy8w?=
 =?utf-8?B?cTl6cWlsdDVQSEgvWmpUOG5iRGgxNTlMd3ZVa2NUU1dkQ3d2a2VRbEZwcDlY?=
 =?utf-8?B?ZGQ0SlRNZ2FQeDdlVEQzY2JCRHhEOUlST2tlKytWRkdXbU5QbnFBcmNVVTVJ?=
 =?utf-8?B?Mlpua3R0MWlFMjdVTDVMV3BXV0JEejVibUloVUlqNTUrTzlFTEplSHpTeS9a?=
 =?utf-8?B?R29GcGtFMWxZU3l2dnhOOXVKaVorc1ZrWlJSeHpGTk5keVJwQlV3THZHTkJ4?=
 =?utf-8?B?SzIrYVV4ekxXNlBqNFJhQTkvNGxCZUlFMzhKaG1lb2I0Rzd5WU53eElkN2Zk?=
 =?utf-8?B?SFpGVkVwM09rZnVua1dYMHc5eW5MSnlidnVZS04yTE0wZkllbjR1QXdjT2E3?=
 =?utf-8?B?RjZxMnBXbHRmOTY3cUZwQXU1UzVQV0lYaXZnaW1CZ3JpYXY0QkFORitpUWc2?=
 =?utf-8?B?d3JvQUk3MlpZYS8rYUJkY3pyR0t1TFgwcjNvSkxkQ05RTGhKOW5OcURoQ3M4?=
 =?utf-8?B?SkxpK3lEYzdES3k3RXBrRVp2ZWovTnFMUitPWGs4UGlrbHoxNzJnRVE4bmNK?=
 =?utf-8?B?L21mZmhZMGNrdkYwVmhHSWRpb04yVzc4VDQ3bXJnaWExOEFSbmY4NExwYTlw?=
 =?utf-8?B?K0JSNDA4QVVIQ2Rpb1RCalM5Szc3Q05sY3lLUHZUbXBQbkQ3K1YwS3ZjMWRR?=
 =?utf-8?B?Tkx5L2tDVU12UlJyck5WK21KeGFRTWJQdVhiNjhqb0lTZXR0c2o1TmpQWmVa?=
 =?utf-8?B?UlJUT09tZ1paSkZMNkxqcEhLdFRlWk4xZ3h4d1BQQzRzMlZQbWJ4OHJxQ2dB?=
 =?utf-8?Q?TkbNMylmJx9w1b6l+37EhhGZP?=
Content-ID: <130738BF16CBD54393B549420D53DCE8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc10c645-af1a-44d7-fcad-08dd127c5081
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 02:52:09.2011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmvafqkysOg29OU0M8+YDMZbm7AN7p0ttWgLJDw7zKfn5pXYOFmiU95y+xtCzCtX3F5u8CeNyVuDxcfGG9yE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8636
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1031712172.628580553"
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

--__=_Part_Boundary_002_1031712172.628580553
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICtpbnQgbXRrX2hkbWlfY29tbW9uX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsIHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gK3sNCj4gKyAgICAgICBjb25zdCBzdHJ1
Y3QgbXRrX2hkbWlfdmVyX2NvbmYgKnZlcl9jb25mOw0KPiArICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7DQo+ICsgICAgICAgaW50IHJldDsNCj4gKw0KPiArICAgICAgIGhk
bWktPmRldiA9IGRldjsNCj4gKyAgICAgICBoZG1pLT5jb25mID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7DQo+ICsgICAgICAgdmVyX2NvbmYgPSBoZG1pLT5jb25mLT52ZXJfY29uZjsN
Cj4gKw0KPiArICAgICAgIGhkbWktPmNsayA9IGRldm1fa2NhbGxvYyhkZXYsIHZlcl9jb25mLT5u
dW1fY2xvY2tzLCBzaXplb2YoKmhkbWktPmNsayksIEdGUF9LRVJORUwpOw0KPiArICAgICAgIGlm
ICghaGRtaS0+Y2xrKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4g
KyAgICAgICBoZG1pLT5waHkgPSBkZXZtX3BoeV9nZXQoZGV2LCAiaGRtaSIpOw0KPiArICAgICAg
IGlmIChJU19FUlIoaGRtaS0+cGh5KSkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgUFRSX0VSUihoZG1pLT5waHkpLCAiRmFpbGVkIHRvIGdldCBIRE1JIFBIWVxu
Iik7DQo+ICsNCj4gKyAgICAgICByZXQgPSBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShoZG1pLCBw
ZGV2LCB2ZXJfY29uZi0+bXRrX2hkbWlfY2xvY2tfbmFtZXMsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmVyX2NvbmYtPm51bV9jbG9ja3MpOw0KPiArICAgICAgIGlm
IChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiArDQo+ICsgICAgICAgcGxh
dGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7DQo+ICsNCj4gKyAgICAgICByZXQgPSBtdGtf
aGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2KTsNCj4gKyAgICAgICBpZiAocmV0KQ0KPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJDYW5ub3QgcmVn
aXN0ZXIgSERNSSBBdWRpbyBkcml2ZXJcbiIpOw0KDQpZb3UgY2hhbmdlIHRoZSBlcnJvciBtZXNz
YWdlIGhlcmUuIElmIHRoaXMgaXMgbmVjZXNzYXJ5LCBzZXBhcmF0ZSB0aGlzIHRvIGEgcmVmaW5l
bWVudCBwYXRjaC4NCg0KPiArDQo+ICsgICAgICAgaGRtaS0+YnJpZGdlLmZ1bmNzID0gdmVyX2Nv
bmYtPmJyaWRnZV9mdW5jczsNCj4gKyAgICAgICBoZG1pLT5icmlkZ2Uub3BzID0gRFJNX0JSSURH
RV9PUF9ERVRFQ1QgfCBEUk1fQlJJREdFX09QX0VESUQgfCBEUk1fQlJJREdFX09QX0hQRDsNCj4g
KyAgICAgICBoZG1pLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQTsNCj4g
KyAgICAgICBoZG1pLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPiArICAg
ICAgIGhkbWktPmJyaWRnZS5kZGMgPSBoZG1pLT5kZGNfYWRwdDsNCj4gKw0KPiArICAgICAgIHJl
dCA9IGRldm1fZHJtX2JyaWRnZV9hZGQoZGV2LCAmaGRtaS0+YnJpZGdlKTsNCg0KWW91IGNoYW5n
ZSBkcm1fYnJpZGdlX2FkZCgpIHRvIGRldm1fZHJtX2JyaWRnZV9hZGQoKS4gSWYgdGhpcyBpcyBu
ZWNlc3NhcnksIHNlcGFyYXRlIHRoaXMgdG8gYSByZWZpbmVtZW50IHBhdGNoLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiArICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgYnJpZGdlXG4iKTsNCj4gKw0KPiAr
ICAgICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo=

--__=_Part_Boundary_002_1031712172.628580553
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjthJiMzMjtuZXcmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0
aGUmIzMyO0hETUkmIzMyO1RYJiMzMjt2MiYjMzI7SVAsDQomZ3Q7JiMzMjtzcGxpdCYjMzI7b3V0
JiMzMjt0aGUmIzMyO2Z1bmN0aW9ucyYjMzI7dGhhdCYjMzI7d2lsbCYjMzI7YmUmIzMyO2NvbW1v
biYjMzI7YmV0d2VlbiYjMzI7dGhlJiMzMjthbHJlYWR5DQomZ3Q7JiMzMjtwcmVzZW50JiMzMjtt
dGtfaGRtaSYjMzI7KHYxKSYjMzI7ZHJpdmVyJiMzMjthbmQmIzMyO3RoZSYjMzI7bmV3JiMzMjtv
bmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO3Byb2JlJiMzMjtmbG93
JiMzMjtmb3ImIzMyO2JvdGgmIzMyO2RyaXZlcnMmIzMyO2lzJiMzMjs5MCUmIzMyO3NpbWlsYXIs
JiMzMjthZGQmIzMyO2EmIzMyO2NvbW1vbg0KJmd0OyYjMzI7cHJvYmUmIzMyO2Z1bmN0aW9uJiMz
Mjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y2FsbGVkJiMzMjtmcm9tJiMzMjtlYWNoJiMzMjtk
cml2ZXImIzM5O3MmIzMyOy5wcm9iZSgpDQomZ3Q7JiMzMjtjYWxsYmFjaywmIzMyO2F2b2lkaW5n
JiMzMjtsb3RzJiMzMjtvZiYjMzI7Y29kZSYjMzI7ZHVwbGljYXRpb24uDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsraW50JiMzMjttdGtfaGRtaV9jb21t
b25fcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2LCYjMzI7c3RydWN0
JiMzMjttdGtfaGRtaSYjMzI7KmhkbWkpDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX2hkbWlf
dmVyX2NvbmYmIzMyOyp2ZXJfY29uZjsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2JiMzMjs9JiMzMjsmYW1wO3Bk
ZXYtJmd0O2RldjsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O2ludCYjMzI7cmV0Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7ZGV2JiMzMjs9JiMzMjtkZXY7DQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDtjb25mJiMzMjs9JiMzMjtv
Zl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO3Zlcl9jb25mJiMzMjs9JiMzMjtoZG1pLSZndDtjb25mLSZndDt2
ZXJfY29uZjsNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO2hkbWktJmd0O2NsayYjMzI7PSYjMzI7ZGV2bV9rY2FsbG9jKGRldiwmIzMyO3Zl
cl9jb25mLSZndDtudW1fY2xvY2tzLCYjMzI7c2l6ZW9mKCpoZG1pLSZndDtjbGspLCYjMzI7R0ZQ
X0tFUk5FTCk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtp
ZiYjMzI7KCFoZG1pLSZndDtjbGspDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJu
JiMzMjstRU5PTUVNOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7cGh5JiMzMjs9JiMzMjtkZXZtX3BoeV9nZXQoZGV2LCYj
MzI7JnF1b3Q7aGRtaSZxdW90Oyk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtpZiYjMzI7KElTX0VSUihoZG1pLSZndDtwaHkpKQ0KJmd0OyYjMzI7KyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO3JldHVybiYjMzI7ZGV2X2Vycl9wcm9iZShkZXYsJiMzMjtQVFJfRVJSKGhk
bWktJmd0O3BoeSksJiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtnZXQmIzMyO0hETUkmIzMy
O1BIWSYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO210a19oZG1pX2R0X3BhcnNlX3BkYXRh
KGhkbWksJiMzMjtwZGV2LCYjMzI7dmVyX2NvbmYtJmd0O210a19oZG1pX2Nsb2NrX25hbWVzLA0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dmVyX2NvbmYtJmd0O251bV9jbG9ja3MpOw0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCYjMzI7aGRtaSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO210a19oZG1pX3JlZ2lzdGVyX2F1
ZGlvX2RyaXZlcihkZXYpOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMz
MjtkZXZfZXJyX3Byb2JlKGRldiwmIzMyO3JldCwmIzMyOyZxdW90O0Nhbm5vdCYjMzI7cmVnaXN0
ZXImIzMyO0hETUkmIzMyO0F1ZGlvJiMzMjtkcml2ZXImIzkyO24mcXVvdDspOw0KDQpZb3UmIzMy
O2NoYW5nZSYjMzI7dGhlJiMzMjtlcnJvciYjMzI7bWVzc2FnZSYjMzI7aGVyZS4mIzMyO0lmJiMz
Mjt0aGlzJiMzMjtpcyYjMzI7bmVjZXNzYXJ5LCYjMzI7c2VwYXJhdGUmIzMyO3RoaXMmIzMyO3Rv
JiMzMjthJiMzMjtyZWZpbmVtZW50JiMzMjtwYXRjaC4NCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLmZ1bmNz
JiMzMjs9JiMzMjt2ZXJfY29uZi0mZ3Q7YnJpZGdlX2Z1bmNzOw0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLm9wcyYjMzI7PSYjMzI7
RFJNX0JSSURHRV9PUF9ERVRFQ1QmIzMyO3wmIzMyO0RSTV9CUklER0VfT1BfRURJRCYjMzI7fCYj
MzI7RFJNX0JSSURHRV9PUF9IUEQ7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2UudHlwZSYjMzI7PSYjMzI7RFJNX01PREVfQ09OTkVD
VE9SX0hETUlBOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
aGRtaS0mZ3Q7YnJpZGdlLm9mX25vZGUmIzMyOz0mIzMyO3BkZXYtJmd0O2Rldi5vZl9ub2RlOw0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJp
ZGdlLmRkYyYjMzI7PSYjMzI7aGRtaS0mZ3Q7ZGRjX2FkcHQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Rldm1f
ZHJtX2JyaWRnZV9hZGQoZGV2LCYjMzI7JmFtcDtoZG1pLSZndDticmlkZ2UpOw0KDQpZb3UmIzMy
O2NoYW5nZSYjMzI7ZHJtX2JyaWRnZV9hZGQoKSYjMzI7dG8mIzMyO2Rldm1fZHJtX2JyaWRnZV9h
ZGQoKS4mIzMyO0lmJiMzMjt0aGlzJiMzMjtpcyYjMzI7bmVjZXNzYXJ5LCYjMzI7c2VwYXJhdGUm
IzMyO3RoaXMmIzMyO3RvJiMzMjthJiMzMjtyZWZpbmVtZW50JiMzMjtwYXRjaC4NCg0KUmVnYXJk
cywNCkNLDQoNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lm
JiMzMjsocmV0KQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7ZGV2X2Vy
cl9wcm9iZShkZXYsJiMzMjtyZXQsJiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjthZGQmIzMy
O2JyaWRnZSYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYj
MzI7Kw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_1031712172.628580553--

