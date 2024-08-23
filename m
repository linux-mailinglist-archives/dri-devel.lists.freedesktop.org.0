Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470995C688
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 09:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C610EC2A;
	Fri, 23 Aug 2024 07:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pghe42uc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jPNftDXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A112410EC2A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 07:30:50 +0000 (UTC)
X-UUID: 99508450612111ef8b96093e013ec31c-20240823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vB63UloPWxQoZGVBKXXl6nfnKmhTThzP1ldb+fC/b5Y=; 
 b=pghe42uct98eaOa99Y6gbGMMpMihVcsS1hm6WFKmZ9Y4v/N0astCFUMqovRuUH67H2FhmtMuI45W65hXaPwk+UeqE3R2x5rLhxyMBKG6p78e1TXyK1kTfCJHIXOwGuSHztH0SoH8PARVaj2pYbLDTOzgjt8nqE02j4vArj5KjPk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:fba8775f-6847-4931-9c66-14b0d009b2bd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:768bd0be-d7af-4351-93aa-42531abf0c7b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 99508450612111ef8b96093e013ec31c-20240823
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1430902929; Fri, 23 Aug 2024 15:30:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 23 Aug 2024 15:30:40 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 23 Aug 2024 15:30:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC7edAmoaSsBveRLTDMmf2dYtQHTTPoyc/xWKyCYHAYAWnj1RPCttHwo2dWEV01JE2B/aop5/Fa31soGDesAJd+PV4/fEWna6regnEduDlCO7VKQMgVqAzgrUxqYIn7wfJ1j5LAF4BFfLznaKsBAMZv9WzvQJj8lBVz8lBscESkz4zIsGHyXpFWuKkdmtZ+G/Vny3M3QXbrMhpCmGa4SFmpyWtjQqRwtie1ft0f8c6cnnagK5C8/d2UIcZlaKxNJwmRw7rULts5zDpAaLUPAxs+2Cgb4M8VWyTQ1P85HUuqN0sOywGb1Hc3dQ+F8LgmT7LefQLLrQkkn1GQtrRH0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu9iAVrV/C9qpHLoZJcYNcWLIIGAhRlYpSG5KssIpBU=;
 b=c1FQNSIqatxzK4VQVG7t6kD537WZaMtM4I4W6TpGva3yDbr8TDjutA5kLx5GpdnBEo0T7VvBExES9yDLu4ICJYhNFQucqQZ1gte98SonSXUgep4H1HrzlxKqKOE1kqylvvJC9F0h+kwaZf+OSJNJXrPQSRyW76lreysYt2gfpGT1zAFtVMaknUgUmKmBjXExO7ny23PkhRs62XSMqof96xRfm4uWzAGdgNWCf0QuibAxC7j4B4IK4JbhcyWJ0A5sEJXD+OyIAivZM6cu/QvqNDDeljlEaQHauzycaUmwrdOYJ2SGTg1qNNC5qcbdxa3P1hYjp0W1+7o32KKYmCOzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu9iAVrV/C9qpHLoZJcYNcWLIIGAhRlYpSG5KssIpBU=;
 b=jPNftDXO24PCa9wzAB4FNczamUZ4sCWs7+Wf6tQ8WGY7lqvJRG3XYZI2cI1psYyXmX/55zW+FxtB0fttUm/afm0/AeD0xyd7OxFJvmKD2p5lAgfyiuVy3N9DNB5R6rvqB8KRb1owjzd9RYFktK933GudEuO4thbaOPEwmoTdhLs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB7262.apcprd03.prod.outlook.com (2603:1096:4:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Fri, 23 Aug
 2024 07:30:37 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:30:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLI06XgA
Date: Fri, 23 Aug 2024 07:30:36 +0000
Message-ID: <088b8e5aa04c24059301a3f14a1214aa3a8865df.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB7262:EE_
x-ms-office365-filtering-correlation-id: 287669c1-8cb2-44e6-e925-08dcc3457b6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ck9uYlFYWGZDNXhIOW5wcnpZU0d6dGNPRjBrUjkzZ1YvUEpqT0hFWUVtVmlw?=
 =?utf-8?B?WmhHeFhkaXhNZ3RvbnQ3TG1iSG8zMnRJMGptU0pIUzBiU3lUL21WRmpCZ2dH?=
 =?utf-8?B?U0tZMHJVQTFsK0FEaE0xRWN6T1BBN1grYTdZZ1RPMlBsazZaQ3ZuVDQ4bUZD?=
 =?utf-8?B?dlpvUGJVQzNaOXZvTGZ2azFmbkxFM09weXBFMVBQODlIUjlzNmhxOU9nN2Ir?=
 =?utf-8?B?MFAra3VZZzkyRGJVYm56RGt1dGhKNkY3ODE4UUtvUWhlY2RuaFhXeldpRXlM?=
 =?utf-8?B?UFE5cVRmbWlPL0RCUzdMeDROUXZhVzdwamZKaEthOGhtRGJPL2h0elZoVis2?=
 =?utf-8?B?azN6bmlRNXV6aTh6eEhRMGdXSUZuODd5YTRwbk9zT2kxeEVDK3g4ai85dnRW?=
 =?utf-8?B?U3F5NFIrLzFuUTk3Tm1oWmg4S1pCTFpsdFVJdU05NTFPcmhVeEFHTm02N0JU?=
 =?utf-8?B?ZVVRMVF4SjlrQmljVE5XVkF1SGRSUTFZZG9WVVkza3pzcFYxbU4zOFpUOWN5?=
 =?utf-8?B?TFYvS1l3dHExd2JFd1cvbVMwek5CV3UzR2NDZmZyZjNPeUZvNXY4cDJROTRU?=
 =?utf-8?B?QU01Z2FqcjRCTGcxR0ZaOGN1YkxjY3hvaE1UcmhOTWdaT0grREhuVHFGNzZu?=
 =?utf-8?B?T1lLem94aHJiSmlDdTMvNEhTY3gwTjEyblladHF0NHQ4bGlTL2JNQjd0WmtX?=
 =?utf-8?B?U1BsMDRBbzdENWZOeGliM3ViTE1IcEJTMXAxTnYxU3A2b1JaUm4yd2l1U3lK?=
 =?utf-8?B?L2tVdVc5elcwNzVJcEFzcVhBTG1uZzV6NE5UZ3BURWNlaUZMOEtGVGhkSDJu?=
 =?utf-8?B?UWVhN3MwU0Q5b1hsWlhVa2xiVmxZY3czdElnV1JTRDVHblF3SmFNNW5FSGlu?=
 =?utf-8?B?NFlVa203a0pPVERmZU9TMUVzS3N2c21BY2Y2bmh3U055NHgrK0ZsVjBXLzFm?=
 =?utf-8?B?K1ltYW02ZjVCUURMQUE3em1KdEtPYlo5NHpVV0dVWFNHUGc3WUtmRi81a3hU?=
 =?utf-8?B?b01QRkVsQjl3WHcyeW9KeEpTY1lqaWlNb1VhL3IrQ09MMGtmSjR5aXkxRXFF?=
 =?utf-8?B?WVhEYjZ5MmpaSVdoZUlNNGo2bVYzYXE0c3FsVFBITjMrRnU5MzNOL3oxYnA3?=
 =?utf-8?B?S2ZoR0JlaS9yTmE2VEM1QmZXYTZLRlY4ZmNoZE1xQjBXREZoK3Z4dUZ6WXRY?=
 =?utf-8?B?dEJleDJZajlHemtvdm9zb2laRHhJeHl5bFNDbEJKZHFHckpJSXczWERjTDE4?=
 =?utf-8?B?QkR2Y3dUZHF5MExDRnI3eWwwM3Q5eHlncmZzUFZCditvaXF3cHF3cmlBRFIv?=
 =?utf-8?B?UmVUVGU4Q3R1NnhFUHlWWnVjM0s0RElYVmJZK2gyejVyU215YmhkREJUWW1K?=
 =?utf-8?B?TThwNmRMKzZaT1RDdGRabVlBWTBDaDduWWlTRjl6VElmWlZQTGxFUWZLS1lp?=
 =?utf-8?B?cU1jeENHOWxSUGJzdFdwbElpVmZ6N0hmM3JNRjEybndiY3FYemZMcVdQbitS?=
 =?utf-8?B?OHBtbEZPRk5yeXhsMW9URzVtaFVhdGs2bGlhL3kyMmRiUmN6MHFIdVdtaVlE?=
 =?utf-8?B?WW8zdTBJOGxBNlg1MDZyWTMyTzZSRmhpK0lxU2JPeDN0NGhEeGY4cFYzY2E3?=
 =?utf-8?B?VVgyeVlHMks2dzAybjJQcXBhTmRobGN2Tkx1SWYrOFBSN0p2NndVRmtBVTRm?=
 =?utf-8?B?QjBWZFhqNzNpaG1SU0wrblRpaFkvVENtYXAvSHRlU3dodlRwbUhndEtDSzd6?=
 =?utf-8?B?ak1zSXVlZzZXYjQzUUN5VGdUZVVBd2daSjZlTFJBZDhOemNZa3dMRmV5azJR?=
 =?utf-8?Q?DPGn7txwC+LA7r16ijg8Wahim7gKg56Peehfc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmRjcWsxZnBRUzBueDlRVWtQam9IeFpIc3VxbGwwUDEyTThzSTV4RVU3L3hp?=
 =?utf-8?B?ZjduZjVwN0NsRSt3a0tGdG14QytsTDFQQnRRUVRxRGpFUWhzeVJNK1RpQjlT?=
 =?utf-8?B?bkJiM29QejRuR2Mram1zME9ucVFNcVJycWZMcjRJOElKNTJIZFdtWm16V1dl?=
 =?utf-8?B?bnl1RDMyUEVIbmxPMkhQWU02SHVxVXRUU0tOZ2paZVY4dzJNRWVBYmpzVHVl?=
 =?utf-8?B?VkhoK3kxbm1KM056dnpiaVAxR3YzUTQ2YVNwRVNsODFlSUVmbmdJSnZmdkh1?=
 =?utf-8?B?aHhUS3loRjBkZ01FUkg1UkZ5K0RWTC96V1NsUnlKNkI2UVRWUmljTHJDZmNr?=
 =?utf-8?B?T1JqODU2ZTFWdGYxSVhTa3g5Tmo0R2Q2U1dnWUZHNDB4bGFSM0VJWGZFRGRu?=
 =?utf-8?B?YjB0ZEJ6dUtvb011ZkJoSnd1WTI5UnVjbWtRQVplellwMjNBV3lMYmQyNTFk?=
 =?utf-8?B?K1VFbmlqdGp0SjZNNXNvWnRXUjBnMzNwcjBsNmlqOGkxZEQ5c0w2R3hlTTF4?=
 =?utf-8?B?MDlHdW1aQVZpSi9GMGVoZFJlL2ZoUDdmVENKbEtmT1NWQjFwWDJhTUZRVUF5?=
 =?utf-8?B?YmhyQ2ZESDB0OUZtZkhpWi8yRU5jSHBWTmlxb1grYy8yVmhhUXZxNE81Y2Nh?=
 =?utf-8?B?cENFWlhTV3N6MXAxV2U0S3cxM3M2cG82YXNrQWNTbXQ1c0t5V0J6a2JldDRC?=
 =?utf-8?B?RVpvb2Q2V3BldEpPWUhQTHZxQzRCQ2hTbVJKYVZpRmNNVnRVbW9EOVJ3WGZD?=
 =?utf-8?B?MVBRMWRlUyszM3JyVXFBR08wdTN1QnlQYXBrSVc3T25zZnUxUGpDY05SUnBY?=
 =?utf-8?B?YTY4UmpWb0hibDVXOFJLNmFrUzVOTS9qaFQ4M1V3ZldjZTgxSFNUekZBYnpK?=
 =?utf-8?B?eDk5YXMwT0QyRWpTYlpvNE13dzlzemJnQ2h5RXNQaWRGRS9MUUlwWE8ySys1?=
 =?utf-8?B?SllaNlZxTlExL2xLWHZJL2lXem1iV3N3d0YwMllSME9sL0lLZS9sVkZvZVR2?=
 =?utf-8?B?SnZ5SjNGY1UzOGpMelRaYXMybWhIM01JVVNneVcxREVoSHBwTHk1RXBTYlRu?=
 =?utf-8?B?T1MyTktvMmtKMnhwM3V6VkNyWXNEaFNmZ0EzVkFvUkFPaVExS3gvV0gvMmhK?=
 =?utf-8?B?WXplTXllMGRsdFBzTElpczdDRmpCak9qOWpUeUxaUmptOVJrcnB2cjd1MXZj?=
 =?utf-8?B?bXNRVW1ER201Rm5NdWcrQ2M1L2J0amloTWdPZGFkczBIZ01lY1A4Skw0Qi9T?=
 =?utf-8?B?VTZhdFQ4cVBiRlgrdk9ZK2dPZjVYWG9RSkpYalg1U3RKeHlGUCtETGJydkNP?=
 =?utf-8?B?T3lFbHZJekI5NTlvY1lneWZ0Y3Z2MnFuc0p6dmRuYy9QbURSUzJrMVhjLy9a?=
 =?utf-8?B?aGs4VHdkaFpNTmdwdDZJQnV6VS95TTZGRnNBRitFbGJUSnJXdVdybWNoTExQ?=
 =?utf-8?B?MFdIL0EwUmVLNVNtRU9lYXk0QnpZOGpZRGRJV1ZPWk5jcVZnUDI5L200V0tD?=
 =?utf-8?B?NUdkVDcwWllBc2xIUWJoMXlRT0lHaWwzaHY5UFUwZmdCeVBEajdIbnhLUE1y?=
 =?utf-8?B?TlpjZExUZGk5K25VbDlNeVFCQlptQW1GZkFISjUwUlpmRDJOcXk3WWxEYnpR?=
 =?utf-8?B?REJSWkZWM096VlY2SEY4Rlk5VGtiUzAwQW0zTHdCS1ljMFRNWTdZRGZ5RHEz?=
 =?utf-8?B?V25qcTdSZzhMSTMxK2xhZnh1RUFiaWgycWhsZ0N4dkZ2U2x5em5UQkFRSzh4?=
 =?utf-8?B?S3pGSkVaK0ZmQXRzU0lzaXpPZ3lqWG5pbEJHQkM1UGVPOFdjbFRpYzFlVHRV?=
 =?utf-8?B?S3h3aTVyWWUvVWNaS3ZUeGRGbUROVjN2SDRjTUpJU3A1QkJkRk4yWHh1T04z?=
 =?utf-8?B?d3FpMHd5c0VXbXJZZ2F4ZUZZVS9nK2pQZmR6dmJCZW5lTENZLzNldlMzclVk?=
 =?utf-8?B?YksyNGRMVFZMUWR5SGl5bFJpcFM1dUtQcUlXOGFwOGdESXFJOXNQRlp5ekZN?=
 =?utf-8?B?K2ZXT1lWUnBxZUFhUkpjU0x3YUF3Q3J5dzQ4MEZnUmZ4VDZMZFREV3NpYTIr?=
 =?utf-8?B?TkQ5d3p0ZUhxS1lMNEN1b0tMY1Y0RGNQTDkrUlJwdGFXZUlOSnJPTXVEK1hE?=
 =?utf-8?Q?QTTdn9Ei7zaVjheJODrqLdsfL?=
Content-ID: <82F714A3BDD35E439B996F084A67B0EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287669c1-8cb2-44e6-e925-08dcc3457b6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 07:30:37.0175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5iUWYQQumFHMYKcUUAGCYYrQ1S6pMdGuGo6ofD66Gsxj1ivP36lRiw9iNmr6EnW9uoj/oocv6uoOKmRP6OMmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB7262
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_864007856.780257028"
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

--__=_Part_Boundary_009_864007856.780257028
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gK3N0YXRpYyBpbnQgZHBfdHhfaGRjcDJ4X3JlYWRfYWtlX3NlbmRfaHByaW1lKHN0cnVj
dCBtdGtfaGRjcF9pbmZvICpoZGNwX2luZm8pDQo+ICt7DQo+ICsJc3RydWN0IG10a19kcCAqbXRr
X2RwID0gY29udGFpbmVyX29mKGhkY3BfaW5mbywgc3RydWN0IG10a19kcCwgaGRjcF9pbmZvKTsN
Cj4gKwlrdGltZV90IG1zZ19lbmQ7DQo+ICsJYm9vbCBtc2dfZXhwaXJlZDsNCj4gKwl1OCByeF9z
dGF0dXMgPSAwOw0KPiArCWludCB0aW1lb3V0Ow0KPiArCXNzaXplX3QgcmV0Ow0KPiArDQo+ICsJ
ZGV2X2RiZyhtdGtfZHAtPmRldiwgIltIRENQMi5YXSBIRENQXzJfMl9BS0VfU0VORF9IUFJJTUVc
biIpOw0KPiArDQo+ICsJdGltZW91dCA9IGhkY3BfaW5mby0+aGRjcDJfaW5mby5zdG9yZWRfa20g
Pw0KPiArCQlIRENQXzJfMl9IUFJJTUVfUEFJUkVEX1RJTUVPVVRfTVMgOiBIRENQXzJfMl9IUFJJ
TUVfTk9fUEFJUkVEX1RJTUVPVVRfTVM7DQo+ICsNCj4gKwlkcF90eF9oZGNwMnhfd2FpdF9mb3Jf
Y3BfaXJxKGhkY3BfaW5mbywgdGltZW91dCk7DQo+ICsJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmNw
X2lycV9jYWNoZWQgPSBhdG9taWNfcmVhZCgmaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmNwX2lycSk7
DQoNCmNwX2lycV9jYWNoZWQgaXMgdXBkYXRlZCBhbHdheXMgYWZ0ZXIgZHBfdHhfaGRjcDJ4X3dh
aXRfZm9yX2NwX2lycSgpLA0KYW5kICBjcF9pcnFfY2FjaGVkIGlzIG9ubHkgdXNlZCBpbiBkcF90
eF9oZGNwMnhfd2FpdF9mb3JfY3BfaXJxKCksDQpzbyBtb3ZlIHRoaXMgdXBkYXRlIGludG8gZHBf
dHhfaGRjcDJ4X3dhaXRfZm9yX2NwX2lycSgpLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICsJ
cmV0ID0gZHJtX2RwX2RwY2RfcmVhZCgmbXRrX2RwLT5hdXgsIERQX0hEQ1BfMl8yX1JFR19SWFNU
QVRVU19PRkZTRVQsICZyeF9zdGF0dXMsDQo+ICsJCQkgICAgICAgSERDUF8yXzJfRFBfUlhTVEFU
VVNfTEVOKTsNCj4gKwlpZiAocmV0ICE9IEhEQ1BfMl8yX0RQX1JYU1RBVFVTX0xFTikNCj4gKwkJ
cmV0dXJuIHJldCA+PSAwID8gLUVJTyA6IHJldDsNCj4gKw0KPiArCWlmICghSERDUF8yXzJfRFBf
UlhTVEFUVVNfSF9QUklNRShyeF9zdGF0dXMpKQ0KPiArCQlyZXR1cm4gLUVBR0FJTjsNCj4gKw0K
PiArCW1zZ19lbmQgPSBrdGltZV9hZGRfbXMoa3RpbWVfZ2V0X3JhdygpLCBIRENQXzJfMl9EUF9I
UFJJTUVfUkVBRF9USU1FT1VUX01TKTsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNkX3JlYWQo
Jm10a19kcC0+YXV4LCBEUF9IRENQXzJfMl9BS0VfU0VORF9IUFJJTUVfT0ZGU0VULA0KPiArCQkJ
ICAgICAgIGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3J4LnNlbmRfaHByaW1lLmhfcHJpbWUs
DQo+ICsJCUhEQ1BfMl8yX0hfUFJJTUVfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKw0KPiArCW1zZ19leHBpcmVkID0ga3RpbWVfYWZ0ZXIoa3RpbWVfZ2V0X3Jh
dygpLCBtc2dfZW5kKTsNCj4gKwlpZiAobXNnX2V4cGlyZWQpDQo+ICsJCWRldl9kYmcobXRrX2Rw
LT5kZXYsICJbSERDUDIuWF0gVGltZW91dCB0byByZWFkIEFLRSBocHJpbWVcbiIpOw0KPiArDQo+
ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_009_864007856.780257028
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hkY3AyeF9yZWFkX2Fr
ZV9zZW5kX2hwcmltZShzdHJ1Y3QmIzMyO210a19oZGNwX2luZm8mIzMyOypoZGNwX2luZm8pDQom
Z3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRrX2RwJiMzMjs9
JiMzMjtjb250YWluZXJfb2YoaGRjcF9pbmZvLCYjMzI7c3RydWN0JiMzMjttdGtfZHAsJiMzMjto
ZGNwX2luZm8pOw0KJmd0OyYjMzI7K2t0aW1lX3QmIzMyO21zZ19lbmQ7DQomZ3Q7JiMzMjsrYm9v
bCYjMzI7bXNnX2V4cGlyZWQ7DQomZ3Q7JiMzMjsrdTgmIzMyO3J4X3N0YXR1cyYjMzI7PSYjMzI7
MDsNCiZndDsmIzMyOytpbnQmIzMyO3RpbWVvdXQ7DQomZ3Q7JiMzMjsrc3NpemVfdCYjMzI7cmV0
Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2Rldl9kYmcobXRrX2RwLSZndDtkZXYsJiMzMjsmcXVv
dDtbSERDUDIuWF0mIzMyO0hEQ1BfMl8yX0FLRV9TRU5EX0hQUklNRSYjOTI7biZxdW90Oyk7DQom
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsrdGltZW91dCYjMzI7PSYjMzI7aGRjcF9pbmZvLSZndDtoZGNw
Ml9pbmZvLnN0b3JlZF9rbSYjMzI7JiM2MzsNCiZndDsmIzMyOytIRENQXzJfMl9IUFJJTUVfUEFJ
UkVEX1RJTUVPVVRfTVMmIzMyOzomIzMyO0hEQ1BfMl8yX0hQUklNRV9OT19QQUlSRURfVElNRU9V
VF9NUzsNCiZndDsmIzMyOysNCiZndDsmIzMyOytkcF90eF9oZGNwMnhfd2FpdF9mb3JfY3BfaXJx
KGhkY3BfaW5mbywmIzMyO3RpbWVvdXQpOw0KJmd0OyYjMzI7K2hkY3BfaW5mby0mZ3Q7aGRjcDJf
aW5mby5jcF9pcnFfY2FjaGVkJiMzMjs9JiMzMjthdG9taWNfcmVhZCgmYW1wO2hkY3BfaW5mby0m
Z3Q7aGRjcDJfaW5mby5jcF9pcnEpOw0KDQpjcF9pcnFfY2FjaGVkJiMzMjtpcyYjMzI7dXBkYXRl
ZCYjMzI7YWx3YXlzJiMzMjthZnRlciYjMzI7ZHBfdHhfaGRjcDJ4X3dhaXRfZm9yX2NwX2lycSgp
LA0KYW5kJiMzMjsmIzMyO2NwX2lycV9jYWNoZWQmIzMyO2lzJiMzMjtvbmx5JiMzMjt1c2VkJiMz
MjtpbiYjMzI7ZHBfdHhfaGRjcDJ4X3dhaXRfZm9yX2NwX2lycSgpLA0Kc28mIzMyO21vdmUmIzMy
O3RoaXMmIzMyO3VwZGF0ZSYjMzI7aW50byYjMzI7ZHBfdHhfaGRjcDJ4X3dhaXRfZm9yX2NwX2ly
cSgpLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3JldCYjMzI7PSYj
MzI7ZHJtX2RwX2RwY2RfcmVhZCgmYW1wO210a19kcC0mZ3Q7YXV4LCYjMzI7RFBfSERDUF8yXzJf
UkVHX1JYU1RBVFVTX09GRlNFVCwmIzMyOyZhbXA7cnhfc3RhdHVzLA0KJmd0OyYjMzI7KyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7SERDUF8yXzJfRFBfUlhTVEFUVVNfTEVOKTsN
CiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7IT0mIzMyO0hEQ1BfMl8yX0RQX1JYU1RBVFVTX0xF
TikNCiZndDsmIzMyOytyZXR1cm4mIzMyO3JldCYjMzI7Jmd0Oz0mIzMyOzAmIzMyOyYjNjM7JiMz
MjstRUlPJiMzMjs6JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyghSERD
UF8yXzJfRFBfUlhTVEFUVVNfSF9QUklNRShyeF9zdGF0dXMpKQ0KJmd0OyYjMzI7K3JldHVybiYj
MzI7LUVBR0FJTjsNCiZndDsmIzMyOysNCiZndDsmIzMyOyttc2dfZW5kJiMzMjs9JiMzMjtrdGlt
ZV9hZGRfbXMoa3RpbWVfZ2V0X3JhdygpLCYjMzI7SERDUF8yXzJfRFBfSFBSSU1FX1JFQURfVElN
RU9VVF9NUyk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjtkcm1fZHBfZHBj
ZF9yZWFkKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9IRENQXzJfMl9BS0VfU0VORF9IUFJJ
TUVfT0ZGU0VULA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
aGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmhkY3Bfcnguc2VuZF9ocHJpbWUuaF9wcmltZSwNCiZn
dDsmIzMyOytIRENQXzJfMl9IX1BSSU1FX0xFTik7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQmIzMy
OyZsdDsmIzMyOzApDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsrbXNnX2V4cGlyZWQmIzMyOz0mIzMyO2t0aW1lX2FmdGVyKGt0aW1lX2dldF9yYXcoKSwm
IzMyO21zZ19lbmQpOw0KJmd0OyYjMzI7K2lmJiMzMjsobXNnX2V4cGlyZWQpDQomZ3Q7JiMzMjsr
ZGV2X2RiZyhtdGtfZHAtJmd0O2RldiwmIzMyOyZxdW90O1tIRENQMi5YXSYjMzI7VGltZW91dCYj
MzI7dG8mIzMyO3JlYWQmIzMyO0FLRSYjMzI7aHByaW1lJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMy
OysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQo8
L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFp
bCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2Ug
dGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91
IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_864007856.780257028--

