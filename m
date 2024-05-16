Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6DD8C7070
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FF810E39F;
	Thu, 16 May 2024 02:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Vl+ZixvF";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XIJvW5O1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C456D10E39F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:54:46 +0000 (UTC)
X-UUID: a56c6492132f11efb92737409a0e9459-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ynXLgthfcqCoa7YTqXKWIjOQJguJdQMj1+viSZ4hoEA=; 
 b=Vl+ZixvFVb7ekH1GYboeirw2glkZDgQFbEWkjtBacAyaxjV+apVyRelHKYyFb9Ni7oZNWVcBYE9OvhkbcQu98VHhw86ftkUopUJFyPBoh0borHrkvOrmqniVX1MI0ATMmSGPzH29HHlnW3eiJ5NuCf/D48cupW7HpyvqK9OMqUQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:64f03ca1-b038-4d4e-832d-8463ac6196ca, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:eaafe983-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a56c6492132f11efb92737409a0e9459-20240516
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1918467836; Thu, 16 May 2024 10:54:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 10:54:42 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 10:54:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkKgo80bIY4DlqSgJax5JNKS85WXYX2K7CLW7rWLsm1uUsAJ5G9+K8xGphW7bb3n7vh0OEd4+ZTnyKsC7dyaMqU6fKq1FQDjQt7tEIBvF9ObngzNjyvzAB6bc6FRYjYesYjo5qzzVIt9hIjkcYK7d/uQ/Poi5hHB/5E1zk5Y+qOEQCblA8mMIotSQhabRm9wBAmF0MXX79J9G27oJvCxU2iZ/isFbdQEtOwgmW4WsLXAz/IXU3fFKwgjZHmWvDKd9QuKPx+ZYDrD73mMiBsb1z8gsz62MuTdkU4IHHwlsI3/eWOjojQuFZ/LsqUqtMxu2suPjZ+0ND3g0WEaoFfGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qdobLjXu+4Ei5ob76EaDoWKk9WjI7oVdOlKCosxDpU=;
 b=jGPUnf1wkGN16gH6yo1kXLgSguCg9DO60tTYYyjQBNfNQ1nvfExCv1lineYr+sF6IqY5KZ8Fz+FYb3Npxk09M5KyEQGRbMy7FfvH74td3u1OFj1Cf51uus22jh/Q377jqnypHjUCp1E+dv3cE1pb/0j8PdA7++4MaH/c5UwUbsuFyOEFVPregYa+bhdzClWkPHr/ZSMI3rHuozYaGS11QGcXyYrOPEBGXMsNwa51jDM/NT2tED3pdPV6cDQ2de/iX6MWxVrGj5zkiw64PoANFbU00zpyOpL0vjrGmfdRa7L3uhUlekz38le1rv+ta/JzIngkUoRWkX9qDxbhldlLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qdobLjXu+4Ei5ob76EaDoWKk9WjI7oVdOlKCosxDpU=;
 b=XIJvW5O1dYzaLo+7efiBCJ+K0ODqPGjNCE1ccyILpNdXwmHxoZpeYiD4nd2Aw0eYrCNy1cgq6RmIwUluQ3x0tntVu/9fQcPkPFWy6LRSgMaqVbsyfVGZZFkokWQI5e0XKSXlIvjknAYKsX5fWEVHtvPuhDH7L/7w/zdJmPlXAfE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6500.apcprd03.prod.outlook.com (2603:1096:400:1bb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.10; Thu, 16 May
 2024 02:54:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 02:54:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>, "u.kleine-koenig@pengutronix.de"
 <u.kleine-koenig@pengutronix.de>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/4] drm/mediatek: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 2/4] drm/mediatek: Convert to platform remove callback
 returning void
Thread-Index: AQHaip/YoCQDccOkREag4vYtOc+sJbGZY4oA
Date: Thu, 16 May 2024 02:54:40 +0000
Message-ID: <a11b85d6b92a9c7269fe33200711f507735fc07a.camel@mediatek.com>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <4a64dfbfbcfdf9b7cd46bc8026223e69a4b453b4.1712681770.git.u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6500:EE_
x-ms-office365-filtering-correlation-id: cd8d1b64-b798-4e54-8d97-08dc75538843
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|7416005|366007|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?Z3lrbUVYTVNXNEpSY2JYS25iZ2VBcGpyWkhKaUVEZ2NpanhoWFBOT1JPbHpv?=
 =?utf-8?B?Vm5xb2pEMGNmaUJINEo1ZkR6VDRZcUNIaU45L3QvcDN2WEgvYnd6L2JFcWNX?=
 =?utf-8?B?U1hTY21TZVdta2wwYkZTUmZ0MW1MNkNHejExM05Hd25XWndoU1lHUVJVNTl2?=
 =?utf-8?B?Tnc4VkIybmkvYmd2R2FjNnJuM0hta2ZJRU84ZHBWaHZYZHB4WDdyVHBJUDdu?=
 =?utf-8?B?YTBoVGRwK1hKRWl0UThlV0twSTN1cHhYaHJnWFR0aEQyTXBCa1pmR2FIb0hk?=
 =?utf-8?B?Ukh2b0xtRWxFa2VENEI0NHZ3QW1FeDlwVmFRWjZCWmdYcG5Pa0ZZM1JUU0F4?=
 =?utf-8?B?enJCOUxUaHRmS2laZFBBTXFQTERkdXV0b1dXRFRiTFpvUUhPZVBQZlZORmFr?=
 =?utf-8?B?eU5naENjREcyeEpYdGFQNjg0UEd1Y3ZEZTBtaXFNZndTOWVtSDVKZFNtMW9E?=
 =?utf-8?B?RVB5UTNmNTlKVmU1NHpaUThiSjU3V2NWK0F4VzJ3NmFkc1k3OXMrQUluZVVQ?=
 =?utf-8?B?L0JPeFBINDdGdmFGOWVPdFZpYjBBeGc1am5IdldBSE9WSHppY0xzZ0c4bjdO?=
 =?utf-8?B?QVo2T1FsMCtTTkF5aDBmZHJkRzJ6TWJoVzM2dEtFL2U2SXk1dUZURHRhRWVx?=
 =?utf-8?B?V1d4dG5QeVRsVEpSdWxPbW1wT0dPMExIQm9EVE5ZU1hSRzNac3UrS0pNR2Nq?=
 =?utf-8?B?ZXRzWTlRQnZsaDNCTXQ2c3BMSlZ0UTJYZ0hEM21nQk1jb2h1MlJtTkhtRlVG?=
 =?utf-8?B?STR5SGFYWjY1UzNJbTFMbnVmYld0N2dvd1VhT2dMRjI3Z0NIOWR2T01xNGJ3?=
 =?utf-8?B?dVgvcEZPbnZFdjFnc3RWc0p6a09sNy9NclFybnY2ZzRWWm5tRG5LMWJMMGNt?=
 =?utf-8?B?cDJmclJGMGZQelp2aVlWRzJlUnNraTh3VTg2VGoxY0l2WTRzSWMvVHVBZXlk?=
 =?utf-8?B?a1JHc0JVaEhNS0VtaVRaTmJiL2JuRkgveGNVZ0ZxN2lxNGdhc3hLOFRjWktR?=
 =?utf-8?B?UTJvK2VMcHhXSDFNSU1pcUdOL3pyZDh2WXlidEtBZEtjQ1FzSTE4Y0NHV1Nz?=
 =?utf-8?B?dURqTEZOTHpIaklMY253Q2s1QVNjOEF4TUY5UStEcXBvZThCcUhVQU0wT0pD?=
 =?utf-8?B?OWhGNHpNQXMvdTNnSUNxbkRUem9RcEh4ODJSdzBsRWFSNFVRTXUwbzUxQmJL?=
 =?utf-8?B?dXBVYUh6ZVFWL3BsTGl4cWE4UU4rZk94aFRUaDZjU2NjV1pVTUd5aDJCRlNL?=
 =?utf-8?B?WTVzRTZpWE1ZMEFRTTMvTldyVzYrTUd5Ullwenp2b3BKbUJxMDlhc0dhd2o4?=
 =?utf-8?B?N3dEUXJGNmRtZlIzUkNVd3Y1QjlUaGNlR1hxTS9OVlBNOE1VR2tuYnY1UlE0?=
 =?utf-8?B?S1VhUTVHWWZwWGFQOUhoU3hHS01XUXlQcFpXaWdUTFNkaUVjNFNqb1FFcjdP?=
 =?utf-8?B?Y21nNkdtTTdYT1ZyODgvMXh1L2F6cklRM3EvWnJ3WTU3SUIyM2Y1TXdSYmZm?=
 =?utf-8?B?R1FDamhvZUVqeXRNK2FoS3ZTdk4yWVJRNUV1OEhrdzF6dU1xZEFZekdqNld5?=
 =?utf-8?B?V0ZhL2dKZCt6MEVjc3hvZ0VGeWRhaXowN0NGOFZ3YitXb0U5T0xuNnVYdnpy?=
 =?utf-8?B?ZUxoUC9JN1NJRFRaTXhNS3hRVDF2RFcvN1pYRnppNmF6RzBlTjQzNDI4aStU?=
 =?utf-8?B?bUV6TTRMNTY1NTN0YUdkMW95RmNCNFk3dE41REY5Q0ZseGIwUURjVWtqREY4?=
 =?utf-8?B?amZEUnJTZit5T2ZnZkZuL0RXdGZZZG9pcDlqWTVXektDSnJpekNtVkJKWFo1?=
 =?utf-8?B?WjdSMEtrNVRETmZNVUJUUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjRMT2VjY0I4ZGxKWkt1V3VKdHF6Z1RuNSszZFVxUmgvWWMwVFM1ZGFRZWla?=
 =?utf-8?B?Tk5RKy96YXZiQStEdjFiMGF3djhYNk1lcS92dlBCTXlxYmdjcnlTdHBpR0t6?=
 =?utf-8?B?WU14MkNzRys2cFlWY2tVdjJWckRScTJlamVKdVcydm1Wdkx0UldJTmd5Rnh2?=
 =?utf-8?B?eHNMYUQ2d0FMeUgrZGxGeDY0Q0NzZ25lS1YvMlpFUWl1b2FIQVA4WHNhSFlH?=
 =?utf-8?B?bGhNWUlCOGR5QUJvVUlSRVFha2N4ajZRZmhFd00ySUFseGxnNUxVOWJSTmwv?=
 =?utf-8?B?VGpkQWJyaVp1V1BMSEtWS2pTQXE0cXRaTk03cll4RGwvR0l0bGdCTjQ3b1Vn?=
 =?utf-8?B?L3RyWlFaSGtVbVdHUnVwTGcxYUQwVnBLamhiVHJYRjVoMWNvQmNlU3BzL0ZC?=
 =?utf-8?B?ZUVvQkNEVUxzaGpQVTdnTWJLemRoaFFibll2QVowWWVzNlBQcUtSZEtZU0c3?=
 =?utf-8?B?WUFSbWxacHRIcjlpdm1xeHZPYzJoWTBRdDdtQnRvRDFFckdlSkpwWXpXeGJ0?=
 =?utf-8?B?eW1GYXBKaWlORzVDUDVTNGJLZFNOM1hIUEpZN3huSUVFV1dueHZBS2RsdXpp?=
 =?utf-8?B?YklnUDBTbTAyK0ZiVDJTNTEza3JrcFJ5L0FYTVhPUlJLN2ZYdjZMbFQvVzBJ?=
 =?utf-8?B?Q2kzaVVuQTY0bUo3Vm9EbzErUG1SeUFhTG93T09BWFpoMTZURXJxUWw3R0ZK?=
 =?utf-8?B?Z0dab2tuQ05Mekx1V1dOdFh6cUVmNEk1QUZKNXVjbnBkUFhpUC9ZMi9DRERs?=
 =?utf-8?B?L1pOaXlWY0RyL1BSSzV3cDVDOWZkSVdhRXlsSC8rbmdqRGlqQnJYZGlFM3dV?=
 =?utf-8?B?VlQ3V0ZhdUZYVGgvbHV5dGd2ZDRQUGw4MXg4WDQ5YU9WL3MySlIzZlYxMUJs?=
 =?utf-8?B?ZUpFRmJtUWNlcHNGTkJrZUcxUmRnUFVkV2VDU0VINlVZeHFTWHk1RUV0dXpY?=
 =?utf-8?B?ekV6Y2JNLzkwS28wdkt6TGQwUVJtNU5lYXVub1R3c0FTcnUrTFBhL1Nlb0cw?=
 =?utf-8?B?eGlWUkdsNnZvamVXMFJrcWIwZzlvQktsNmYyZWFYbDBjSTB4aFFoakxMNkll?=
 =?utf-8?B?cXVxZVpWUENUMWtoL0pxOHhrMURGQnVYTVYyaTJNcS96MDdET3J0RnZZZ2tN?=
 =?utf-8?B?UkUrZEFETU1FMVQvUEtjOUk3b09jbkZ5ZzdDTUczV05WeXhzVFQyTnRDbXNa?=
 =?utf-8?B?QUxQcEQveE85aHdQT3I3ZElvNVFSOEU1UUVacjNMdVhrdWhZK1lsSDdvblNB?=
 =?utf-8?B?dEZwenRUY1l4Um14ZVJqa1J2dWRMcWovejA1c3ZWaERwNlFJRXU5OGN6eEFO?=
 =?utf-8?B?NmFXNTlJQndZK0E3NzRxcVB1Wno0ZXBvSC9zeHd5R0RtQ3FIdTBTM1pUQ1Ax?=
 =?utf-8?B?Y1hOK0c3MytabFkzbGhKQUo1REdzVDdoTms0SWNhVXlKVEJZUFpEeVZwL0la?=
 =?utf-8?B?T1U2VlhwTkk1d3RMaEhZQ0N3VzRBbEtuS1E5b2FaR3lYT1daVDdUNTROSjVP?=
 =?utf-8?B?UmRLS2sxNnh4NDhheFJpQUNsUzhWaXpkT2xnODJrNjh2eVR5TnM4R2dnQXJl?=
 =?utf-8?B?cHBGVVZncFNOVGZCSWlremorR3l1ZWFGTGJuOGFTN3JXbDZXQXBEQ0psSWVL?=
 =?utf-8?B?cGJCVHRKODZLMHNNMDlhM2RnQ29ibXk5R1JxcmZISXRKUVd1Q3RQaDNxa25l?=
 =?utf-8?B?WGdLRkdmUFBsQXhCbXBnTWJJbHczUlh1QjQzcVo0RFhDMlpCYVIyTkNUR0x2?=
 =?utf-8?B?NDZ4TDZQZW9QeldpMjMzNzM3cjUwc202ODRXZEI1dFliTk5KNFFmMDlZY2Fa?=
 =?utf-8?B?Kzg2LzhxdEFiblJMK0FtdlBISHdvT1BOUUYrS2pzK3BFYmJWaTczaWdUVkZB?=
 =?utf-8?B?eTZZcTF3dmVTOWtOY2VKN3pFNGVwQ1hDWHZwREEvbG1XeEt6UVNOVHAwSis1?=
 =?utf-8?B?N3BMQ2dZK0Q5TXlzUjB1M1AvS1ZMUjdFZHVaUUZDTE5abEw5Q0tpY2xkY05x?=
 =?utf-8?B?TDdrVVdySnJ0WkRTS3Q2cnJMc3VNN2hIM1FQR2wwZVJZOXRWL2dGMHRkUENr?=
 =?utf-8?B?Ukt6MnpFc3plTUpnZW02T0xNRUpESjJTakFiT0xwZXNjQnI1eEkvRmdhM1Yy?=
 =?utf-8?Q?AiQpCuqTq0bBolELc9eEnBnBD?=
Content-ID: <4B9F9600F8DDF345B6118D84049B2734@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8d1b64-b798-4e54-8d97-08dc75538843
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 02:54:40.8283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qECbxCkrCoGdL2ShKgkxhShVFsAy3pBiI4DCgvsDdr/Ek/WKqiHbPuoLEZGz83zM++HKHyszDNp6m0Sb9j5bMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6500
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_632570476.1697548517"
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

--__=_Part_Boundary_003_632570476.1697548517
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFV3ZToNCg0KT24gVHVlLCAyMDI0LTA0LTA5IGF0IDE5OjAyICswMjAwLCBVd2UgS2xlaW5l
LUvDtm5pZyB3cm90ZToNCj4gIAkgDQo+IA0KPiAgVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3Ig
YSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBkcml2
ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRs
aW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSByZXR1
cm5lZCBpcyBpZ25vcmVkIChhcGFydA0KPiBmcm9tIGVtaXR0aW5nIGEgd2FybmluZykgYW5kIHRo
aXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuDQo+IA0KPiBUbyBpbXByb3Zl
IGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
DQo+IHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRyaXZlcnMgYXJl
IGNvbnZlcnRlZCB0bw0KPiAucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVybnMgdm9p
ZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycw0KPiBhcmUgY29udmVydGVkLCAucmVtb3Zl
X25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuDQo+IA0KPiBUcml2aWFsbHkgY29u
dmVydCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3Zl
DQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lg0KDQpSZXZpZXdlZC1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYyB8IDUgKystLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5nLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYw0KPiBpbmRleCAwZDY0NTFjMTQ5YjYuLjlm
OTJiNzIwYWFhZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19w
YWRkaW5nLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5nLmMN
Cj4gQEAgLTEzNywxMCArMTM3LDkgQEAgc3RhdGljIGludCBtdGtfcGFkZGluZ19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gLXN0
YXRpYyBpbnQgbXRrX3BhZGRpbmdfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICtzdGF0aWMgdm9pZCBtdGtfcGFkZGluZ19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIHsNCj4gIGNvbXBvbmVudF9kZWwoJnBkZXYtPmRldiwgJm10a19wYWRkaW5n
X2NvbXBvbmVudF9vcHMpOw0KPiAtcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19wYWRkaW5nX2RyaXZlcl9kdF9tYXRjaFtdID0gew0K
PiBAQCAtMTUxLDcgKzE1MCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19wYWRkaW5n
X2RyaXZlcl9kdF9tYXRjaCk7DQo+ICANCj4gIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX3Bh
ZGRpbmdfZHJpdmVyID0gew0KPiAgLnByb2JlPSBtdGtfcGFkZGluZ19wcm9iZSwNCj4gLS5yZW1v
dmU9IG10a19wYWRkaW5nX3JlbW92ZSwNCj4gKy5yZW1vdmVfbmV3PSBtdGtfcGFkZGluZ19yZW1v
dmUsDQo+ICAuZHJpdmVyPSB7DQo+ICAubmFtZT0gIm1lZGlhdGVrLWRpc3AtcGFkZGluZyIsDQo+
ICAub3duZXI9IFRISVNfTU9EVUxFLA0KPiAtLSANCj4gMi40My4wDQo+IA0K

--__=_Part_Boundary_003_632570476.1697548517
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtVd2U6DQoNCk9uJiMzMjtUdWUsJiMzMjsy
MDI0LTA0LTA5JiMzMjthdCYjMzI7MTk6MDImIzMyOyswMjAwLCYjMzI7VXdlJiMzMjtLbGVpbmUt
SyYjMjQ2O25pZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOyYjMzI7VGhlJiMzMjsucmVtb3ZlKCkmIzMyO2NhbGxiYWNrJiMzMjtmb3ImIzMyO2Em
IzMyO3BsYXRmb3JtJiMzMjtkcml2ZXImIzMyO3JldHVybnMmIzMyO2FuJiMzMjtpbnQmIzMyO3do
aWNoJiMzMjttYWtlcw0KJmd0OyYjMzI7bWFueSYjMzI7ZHJpdmVyJiMzMjthdXRob3JzJiMzMjt3
cm9uZ2x5JiMzMjthc3N1bWUmIzMyO2l0JiMzOTtzJiMzMjtwb3NzaWJsZSYjMzI7dG8mIzMyO2Rv
JiMzMjtlcnJvciYjMzI7aGFuZGxpbmcmIzMyO2J5DQomZ3Q7JiMzMjtyZXR1cm5pbmcmIzMyO2Fu
JiMzMjtlcnJvciYjMzI7Y29kZS4mIzMyO0hvd2V2ZXImIzMyO3RoZSYjMzI7dmFsdWUmIzMyO3Jl
dHVybmVkJiMzMjtpcyYjMzI7aWdub3JlZCYjMzI7KGFwYXJ0DQomZ3Q7JiMzMjtmcm9tJiMzMjtl
bWl0dGluZyYjMzI7YSYjMzI7d2FybmluZykmIzMyO2FuZCYjMzI7dGhpcyYjMzI7dHlwaWNhbGx5
JiMzMjtyZXN1bHRzJiMzMjtpbiYjMzI7cmVzb3VyY2UmIzMyO2xlYWtzLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtUbyYjMzI7aW1wcm92ZSYjMzI7aGVyZSYjMzI7dGhlcmUmIzMyO2lzJiMzMjthJiMz
MjtxdWVzdCYjMzI7dG8mIzMyO21ha2UmIzMyO3RoZSYjMzI7cmVtb3ZlJiMzMjtjYWxsYmFjayYj
MzI7cmV0dXJuDQomZ3Q7JiMzMjt2b2lkLiYjMzI7SW4mIzMyO3RoZSYjMzI7Zmlyc3QmIzMyO3N0
ZXAmIzMyO29mJiMzMjt0aGlzJiMzMjtxdWVzdCYjMzI7YWxsJiMzMjtkcml2ZXJzJiMzMjthcmUm
IzMyO2NvbnZlcnRlZCYjMzI7dG8NCiZndDsmIzMyOy5yZW1vdmVfbmV3KCksJiMzMjt3aGljaCYj
MzI7YWxyZWFkeSYjMzI7cmV0dXJucyYjMzI7dm9pZC4mIzMyO0V2ZW50dWFsbHkmIzMyO2FmdGVy
JiMzMjthbGwmIzMyO2RyaXZlcnMNCiZndDsmIzMyO2FyZSYjMzI7Y29udmVydGVkLCYjMzI7LnJl
bW92ZV9uZXcoKSYjMzI7d2lsbCYjMzI7YmUmIzMyO3JlbmFtZWQmIzMyO3RvJiMzMjsucmVtb3Zl
KCkuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RyaXZpYWxseSYjMzI7Y29udmVydCYjMzI7dGhpcyYj
MzI7ZHJpdmVyJiMzMjtmcm9tJiMzMjthbHdheXMmIzMyO3JldHVybmluZyYjMzI7emVybyYjMzI7
aW4mIzMyO3RoZSYjMzI7cmVtb3ZlDQomZ3Q7JiMzMjtjYWxsYmFjayYjMzI7dG8mIzMyO3RoZSYj
MzI7dm9pZCYjMzI7cmV0dXJuaW5nJiMzMjt2YXJpYW50Lg0KDQpSZXZpZXdlZC1ieTomIzMyO0NL
JiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7VXdlJiMzMjtLbGVpbmUtSyYjMjQ2O25pZyYjMzI7Jmx0
O3Uua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYj
MzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYyYjMzI7fCYjMzI7
NSYjMzI7KystLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzIm
IzMyO2luc2VydGlvbnMoKyksJiMzMjszJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0
OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19w
YWRkaW5nLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5nLmMNCiZn
dDsmIzMyO2luZGV4JiMzMjswZDY0NTFjMTQ5YjYuLjlmOTJiNzIwYWFhZSYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5nLmMN
CiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcu
Yw0KJmd0OyYjMzI7QEAmIzMyOy0xMzcsMTAmIzMyOysxMzcsOSYjMzI7QEAmIzMyO3N0YXRpYyYj
MzI7aW50JiMzMjttdGtfcGFkZGluZ19wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYj
MzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7fQ0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1zdGF0aWMmIzMyO2ludCYjMzI7bXRrX3BhZGRpbmdf
cmVtb3ZlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOytz
dGF0aWMmIzMyO3ZvaWQmIzMyO210a19wYWRkaW5nX3JlbW92ZShzdHJ1Y3QmIzMyO3BsYXRmb3Jt
X2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7Y29tcG9u
ZW50X2RlbCgmYW1wO3BkZXYtJmd0O2RldiwmIzMyOyZhbXA7bXRrX3BhZGRpbmdfY29tcG9uZW50
X29wcyk7DQomZ3Q7JiMzMjstcmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO29m
X2RldmljZV9pZCYjMzI7bXRrX3BhZGRpbmdfZHJpdmVyX2R0X21hdGNoW10mIzMyOz0mIzMyO3sN
CiZndDsmIzMyO0BAJiMzMjstMTUxLDcmIzMyOysxNTAsNyYjMzI7QEAmIzMyO01PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsJiMzMjttdGtfcGFkZGluZ19kcml2ZXJfZHRfbWF0Y2gpOw0KJmd0OyYjMzI7
JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtwbGF0Zm9ybV9kcml2ZXImIzMyO210a19w
YWRkaW5nX2RyaXZlciYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsucHJvYmU9JiMzMjttdGtf
cGFkZGluZ19wcm9iZSwNCiZndDsmIzMyOy0ucmVtb3ZlPSYjMzI7bXRrX3BhZGRpbmdfcmVtb3Zl
LA0KJmd0OyYjMzI7Ky5yZW1vdmVfbmV3PSYjMzI7bXRrX3BhZGRpbmdfcmVtb3ZlLA0KJmd0OyYj
MzI7JiMzMjsuZHJpdmVyPSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsubmFtZT0mIzMyOyZxdW90O21l
ZGlhdGVrLWRpc3AtcGFkZGluZyZxdW90OywNCiZndDsmIzMyOyYjMzI7Lm93bmVyPSYjMzI7VEhJ
U19NT0RVTEUsDQomZ3Q7JiMzMjstLSYjMzI7DQomZ3Q7JiMzMjsyLjQzLjANCiZndDsmIzMyOw0K
DQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUt
bWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xv
c2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsg
eW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_632570476.1697548517--

