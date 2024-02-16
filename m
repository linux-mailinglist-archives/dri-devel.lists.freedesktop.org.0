Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606985739D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 03:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6710EA7C;
	Fri, 16 Feb 2024 02:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="APWcASQH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="agXc30wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1A710EA7C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:03:16 +0000 (UTC)
X-UUID: 8747731ecc6f11ee9e680517dc993faa-20240216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ya25bBL+pPx5JwsXncXzCnPIVel7r8n+3BQRltjsZFs=; 
 b=APWcASQHdZB6XeaHhm2cIHuj7sKNx1obaXTNOUzeYS/zCRc/C4y5CRVGLntQ3LQmRlioU5s2sba2zvQ5La9DrSYw4Zs5cGqVsAlxJiltRAUB+aQFNqZwNeslziQpSCWNiQ1qar3ftr017y2N9JLfpPhTmuQ2/hUUIjXCXMZY9S0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:8a19cfbc-2e7f-4998-afdc-056c20dd33a0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:73cf7080-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8747731ecc6f11ee9e680517dc993faa-20240216
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1795918129; Fri, 16 Feb 2024 10:03:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Feb 2024 10:03:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Feb 2024 10:03:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rmdd4nexYOq1qiJyJVQFUPJoQbW+IDDHGvo75hgYs6rXJtZFWd8zgzkKuOkLQ0W8UJ7PYhZD4YIKBu0KeAogG2koeUL6bgY+XEwNHjSBaiqQ//hrwWl4L5WxZKcgL6df5fiy6/H9TtHEOAPUMSwvhHvlRxh92jsTARqezlPlsuUNSxUXMaCyGpVaE4FLUetpyZSB4DteaN8732mmpsq620EBs9+uieS+CLuKouUdizldH1bznmAik2TaKzhgyY/6vReKfxiIiBMAxhAfSfy3WraODPoNsqsWU+6iQLdD05W0lUKENXjqUG9FSYcmD2rak0fFBvtpns3FA3IRTpannA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DjoAnet4H/FSKlmriZxnp9KVgbTQd9yHdjdSZQkQMg=;
 b=m18F29mZtsiXbuMVedkEgcm9GBNM36AVHXpIyjkumOg2krnk0i8TEd6j1rnlltOOOfa0T1VTXeXI+dz/48ioAvK/q3w1gJ1r+FFvsAZluIf/rRTr7894l9Dan5CosgWrlsr06UZDxQgYeEdZ0P6hx8oWQDK4siy0od72mkelk7ioGNNqg6xPzpItKFq0TPkvLj98G7ECgd8p2ufNQx9nA2lMCy4Uc6yJQYBN7ryvBlarQ/tqAlMPnie7bWqSgiCFntZy4wj434zq0Md86Ih6hxC/G92fQXRyHdS3wktBljAyK3xQiS+AbpKsRU0rgN8Jzv6oalIIIf+Zspn3nVQ3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DjoAnet4H/FSKlmriZxnp9KVgbTQd9yHdjdSZQkQMg=;
 b=agXc30waarRHJagGxwiwCUgH9t9YdFdV9ykh60doqDbqpnZn5OprB/vA/SXOAMut3lA8z02QBccDFWCA1AKcgWDVnNVpXeICMPiK93TS1JTXzvvOjcsSanu4M4ciEI0ZP8fsXSZ+Qrtf0f5qlCEPujoiUOVkvvSwQwzTfxP62sQ=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TY0PR03MB6307.apcprd03.prod.outlook.com (2603:1096:400:147::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 02:03:04 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::a93d:863e:c0fd:109b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::a93d:863e:c0fd:109b%6]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 02:03:04 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Thread-Topic: [PATCH v5 06/13] drm/mediatek: Turn off the layers with zero
 width or height
Thread-Index: AQHaX/dYW45fOOHcWkO709TYkvlombELOF0AgAEAQIA=
Date: Fri, 16 Feb 2024 02:03:04 +0000
Message-ID: <6d1a5fe3577f8fe23f4fadd3bcdfb004c928b4b0.camel@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-7-shawn.sung@mediatek.com>
 <1fdf2c07-8240-4711-a708-b555932dabc6@collabora.com>
In-Reply-To: <1fdf2c07-8240-4711-a708-b555932dabc6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TY0PR03MB6307:EE_
x-ms-office365-filtering-correlation-id: 0d806c70-d6c5-4679-986f-08dc2e9369a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I0vOwtO4LRRHxA/4N1wAsdtFTX6eCYIeVsml2OZ2zerRM6oLsdnfT7zgw/hP5HzZP521xuaNR8J2HireFpACwZxCnyKeVu8PC0BeGfjpL4YUm5tSGZ+2N1aC6hjwWq+XnnmQuqwc2TnZ7fsl6PUgFfgWicvWaJMiwy3z1Eb4eoqHd7KB+NMQ//RsLepV0FWjzuhOq39NL+2QSrS+FKdK4wWkt7ZNqF1v1Q7fc/khZVMLL5zyAK57otLVsyKQg/vEf9dU/wQ+xyGiD+zEydpmxq2ZhgvSDWHCfjwnbGU5fUhyTw2RgPitI5cWHQvvd0LViNFjJb0U3bjLRF9chuEWSodDd/nEfavtMGFZRvdtKVgFSwNKnUiqDsLFL1mOdm0ON4cZIZxEGwzRrIMg+Opf1+lnxq4I4Vc4BwOUqvS7Hlu9845fODr3yJKQc+JM/72/LEvUGLWl+t5qgcEzcwRia8M1YqOjzYcnfijw2Ai102zcRvzLUC9tNt+RwvRKvLrtpgSdkpeO17Tviw54y0VxAJDsX4yKKeaRCOvrCtK6juJehcIUB8HVDxpQQymP1d7iOhbTnWVJ4yI8oq9uCvbwTLCGVbZORiHJ6ZekPHf/blfaFF9IVjFkfP1u/4j5Ummz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6486002)(6512007)(478600001)(71200400001)(41300700001)(8676002)(8936002)(2906002)(7416002)(4326008)(5660300002)(6506007)(66556008)(54906003)(76116006)(66946007)(66446008)(316002)(64756008)(110136005)(66476007)(2616005)(86362001)(26005)(122000001)(38100700002)(38070700009)(36756003)(85182001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWxEQXpGZzlWdndpbXI5ZXhQdEVsdXJsWmVVZU1nYnlVUHk4L0xGWjFHcVg5?=
 =?utf-8?B?V0Fpd1draC9xQzNhUUR1ZWV1VHpMNTRjWEN0ejY2WjBiM0pmZFFWbmtHVDdW?=
 =?utf-8?B?Z2w0QWEyc3hHa0hOS0luaFQzWStFbGNjVm5UcGYwdzk3Vk9LcDdqV0Fab0Zv?=
 =?utf-8?B?eFZCOEVvSHlINUZTazhZSkFDTzRsNHdSa0pNQ1A4ZEZwbEF3WFFXZ1MzWGQx?=
 =?utf-8?B?SFBwMjR1eFF0NVE2MUFReXJsR25NaXdPZXZJcUhjaWRZSlRXRGRVZzFZb2pL?=
 =?utf-8?B?dU82RVVTeE8zUVAvdlVqdFQveWpLSWErSzNENUMxY1Y4dkhXSUlWRnN1cS9q?=
 =?utf-8?B?Nm81c1R4ckdwOURTSW90bEJzRS9zZTg3NkpXcEkybkxsaDVHWkwxekRWcFJm?=
 =?utf-8?B?bTlYbExyREVrd0lzcU5aMzFuZXpSZDgxLzV5ZHlZdlJrWlBCUWZxVTFVcVR6?=
 =?utf-8?B?QkNRc0pHSGZlM1BrZ2tHUFBLakJmdUQ1ZC9VUGZHdlpyMlNWUmMyN3hPVWZm?=
 =?utf-8?B?b1JDTnY5MTRRNmdzaU1KalUzK0dQTWxVVHFpTTQ5VmdPUEJHLzYwMDZBQzhr?=
 =?utf-8?B?RWMxS2RXdDB5SFRuMGxlTEhERmV4bXNjUkVDMERxN2NxMlJTWUFWTGxkWkVw?=
 =?utf-8?B?MHUrMXJvb1FXK1BKYU1vc015bWU2ZnRHVlFpL1MwSllMNHIxeXNZV1ZsNmN5?=
 =?utf-8?B?aUtMaDFnZm94M2k2NFVWa0JWeFpQOS9kWGJ0NmFTQ1B1Q2dGYlRLYnF6aVA5?=
 =?utf-8?B?S2RFODR3U0Y0SjhJbkxwaGdxZThPNStGK25ldUZaZk5nZTVMNEI4UWVPSnNj?=
 =?utf-8?B?TGdGVVdaMEt0aXBQUFFVaVNacGw3SWlZdWJBMGtCcSt0MWpMUFk2ODhYdFJ5?=
 =?utf-8?B?QVJXeDRjOXpnM3lZZ3Y3Y2h6WEM3U0NDSUtlbUNhOEIwM25sMHVjbUcwUnJs?=
 =?utf-8?B?RFIrN1BsSWpSaHVmVWNuNGk4dW52SlhPVDhVV0N6ZUlVTHZsQ29hbzRsaGwv?=
 =?utf-8?B?VmtwRktDRTUwV1U3d2h3NTJHSzF5akRBcnRxc1VhK010YnI1eXlLWWpaYlg0?=
 =?utf-8?B?enZaa2lZSVZsd0RSVkpzZEQzd2E3dTlibVNiRGF3UCtHSWg5V2t5ck9HVnh0?=
 =?utf-8?B?QlhkdHNjeUdRRjNWYjZxMTRQMU45OXlFb1grWHgxNk02VWtzTlJ6Y1I5VmpS?=
 =?utf-8?B?aUsvUTdKVHp6SVB3UEg0MjZUSnBOa1ZrWTFoUmxzTENjaWtvcjBhWmV3YW5S?=
 =?utf-8?B?VUUyS0NRYUlKTk5NNFN6Z3JkeFNKWkY3NmdCS0lDZjFnN0V6QTk0OENubkhE?=
 =?utf-8?B?V1J0bGhjSlREdHF0SE8zblYxZmQ5K1RacXNqck5nNHpQSTZLc0IzU1RrVTZq?=
 =?utf-8?B?dkEyN3YrVXIzSTRZSVMwaFI3SGxMeXpNK3laNjNrZjAwektpR3F2aUhyUXZw?=
 =?utf-8?B?OERDVCtZcmJSNHhyV3IwdDFxT3dmMmVhMTZXZmJ5TDRjVGVVREF3Mld4cTBN?=
 =?utf-8?B?ZGtYYmhHZTZDWmJLaWdMc2xBdWtVcHB5dllwY05XYVNFSGRhcWZzcGJCYy8z?=
 =?utf-8?B?MUVHMGZqbXFQYUowODVhd1ZXS0RqYmp1NW5LTGxyQWtiWEc3VGhVc1dKdFoz?=
 =?utf-8?B?RUVOTXFtNExQRXJGVk1IUWtCWnNNL1BndnhiQllJYmtyaFhlbmhJQjNjMTNQ?=
 =?utf-8?B?TlVjazNZQnN5KzFzSjkwWm1VcFdNSkR0UVQzejQrL01XODRvQkl1OG5VT1FM?=
 =?utf-8?B?VWZMRjlGa2xNZE5VTEtVYWs5ejRQcmphVy9XRFdIdXRtb3hwTTI3bEF2S1Ex?=
 =?utf-8?B?RllKbTQ2V1o5VWxwcXBVVzdqb0R2N2tPQ0ZkUHZkYXptb2dZQUd2UHBWZjdY?=
 =?utf-8?B?cUJURXFvUGZDQlE3emlWTTRGbEU1L0d6eWJmLzNaejIyOXk0MDJ4SjFNc1ZD?=
 =?utf-8?B?WlgyZDVROWJrc01JZjBOVHo2TTBvTG9EbTBjbVRpYmVzZkVLSXc4dDk1VElC?=
 =?utf-8?B?Nm8xWkJ2bGFuSlh5N2I0TGNOZ1JHZTNTSjlXUzhsSW5IVG1YSGU4OUs0WGN2?=
 =?utf-8?B?U3dPVjFlQ3NDa1dyZ1kvaDJqaktrNW1EMlNJNHRYM3pGTHlFMFpOQkRZQXl4?=
 =?utf-8?B?SGpSUTZUaDRBTVI0RDk1dk1ZNzI1b1JJNjhMcGFRcVVKUG1FTWRobzZjajAv?=
 =?utf-8?B?WXc9PQ==?=
Content-ID: <ADD983A5627C674A9BA7533148F6C07C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d806c70-d6c5-4679-986f-08dc2e9369a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 02:03:04.7288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtSGD0QUaG9Y5daBCp7Wpu26hwIbYqNjX67zEL4ReLAOw1JnaSNuStQcsZrDczoFzCkrZsgCeBXer2NFuPoHsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6307
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1698668415.157276541"
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

--__=_Part_Boundary_008_1698668415.157276541
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjQtMDItMTUmIzMyO2F0
JiMzMjsxMTo0NSYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0lsJiMzMjsxNS8wMi8yNCYjMzI7MTE6MTEsJiMzMjtI
c2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7Jmd0
OyYjMzI7V2UmIzMyO2ZvdW5kJiMzMjt0aGF0JiMzMjtJR1QmIzMyOyhJbnRlbCYjMzI7R1BVJiMz
MjtUb29sKSYjMzI7d2lsbCYjMzI7dHJ5JiMzMjt0byYjMzI7Y29tbWl0JiMzMjtsYXllcnMmIzMy
O3dpdGgNCiZndDsmIzMyOyZndDsmIzMyO3plcm8mIzMyO3dpZHRoJiMzMjtvciYjMzI7aGVpZ2h0
JiMzMjthbmQmIzMyO2xlYWQmIzMyO3RvJiMzMjt1bmRlZmluZWQmIzMyO2JlaGF2aW9ycyYjMzI7
aW4mIzMyO2hhcmR3YXJlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7RGlzYWJsZSYjMzI7dGhlJiMzMjts
YXllcnMmIzMyO2luJiMzMjtzdWNoJiMzMjthJiMzMjtzaXR1YXRpb24uDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0ZpeGVzOiYjMzI7Nzc3YjdiYzg2YTBhMyYjMzI7KCZx
dW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7b3ZsX2FkYXB0b3ImIzMyO3N1cHBvcnQmIzMy
O2Zvcg0KJmd0OyYjMzI7Jmd0OyYjMzI7TVQ4MTk1JnF1b3Q7KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
Rml4ZXM6JiMzMjtmYTk3ZmU3MWY2ZjkzJiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRk
JiMzMjtFVEhEUiYjMzI7c3VwcG9ydCYjMzI7Zm9yJiMzMjtNVDgxOTUmcXVvdDspDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYj
MzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7VGhpcyYjMzI7Y29tbWl0JiMzMjtzaG91bGQmIzMyO2JlJiMzMjtz
ZW50JiMzMjtzZXBhcmF0ZWx5JiMzMjtmcm9tJiMzMjt0aGlzJiMzMjtzZXJpZXMsJiMzMjthcyYj
MzI7aXQmIzMyO2lzDQomZ3Q7JiMzMjtmaXhpbmcmIzMyO3RoaW5ncw0KJmd0OyYjMzI7dGhhdCYj
MzI7YXJlJiMzMjtub3QmIzMyO3JlbGF0ZWQmIzMyO2p1c3QmIzMyO3RvJiMzMjtJR1QsJiMzMjti
dXQmIzMyO2Fsc28mIzMyO3RvJiMzMjtjb3JuZXImIzMyO2Nhc2VzJiMzMjtpbiYjMzI7cmVndWxh
cg0KJmd0OyYjMzI7bm9uLXRlc3RpbmcNCiZndDsmIzMyO3VzZWNhc2VzLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtJbiYjMzI7YW55JiMzMjtjYXNlLCYjMzI7aXQmIzM5O3MmIzMyO25vdCYjMzI7bWFu
ZGF0b3J5JiMzMjthcyYjMzI7dGhhdCYjMzI7ZGVwZW5kcyYjMzI7b24mIzMyO3doYXQmIzMyO3Ro
ZQ0KJmd0OyYjMzI7bWFpbnRhaW5lciYjMzI7cHJlZmVycywNCiZndDsmIzMyO3NvJiMzMjtpdCYj
Mzk7cyYjMzI7Q0smIzM5O3MmIzMyO2NhbGwmIzMyO2FueXdheS4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7QmVzaWRlcyYjMzI7dGhhdCwNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMz
MjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjth
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQoNCkdvdCYjMzI7aXQu
JiMzMjtXaWxsJiMzMjtkaXNjdXNzJiMzMjt0aGlzJiMzMjt3aXRoJiMzMjtDSy4NCg0KVGhpcyYj
MzI7YnVnJiMzMjtpcyYjMzI7Zm91bmQmIzMyO3doZW4mIzMyO3J1bm5pbmcmIzMyO0lHVCYjMzI7
dGVzdCYjMzI7d2hpbGUmIzMyO29uZSYjMzI7b2YmIzMyO3RoZSYjMzI7dGVzdCYjMzI7aXRlbQ0K
Y29tbWl0cyYjMzI7YSYjMzI7bGF5ZXImIzMyO3dpdGgmIzMyO3plcm8mIzMyO3dpZHRoJiMzMjth
bmQmIzMyO2N1YXNlJiMzMjt0aGUmIzMyO2RldmljZSYjMzI7dG8mIzMyO2ZyZWV6ZS4NCg0KDQo8
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

--__=_Part_Boundary_008_1698668415.157276541
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI0LTAyLTE1IGF0IDExOjQ1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTUvMDIvMjQgMTE6MTEsIEhzaWFvIENoaWVuIFN1bmcgaGEgc2Ny
aXR0bzoNCj4gPiBXZSBmb3VuZCB0aGF0IElHVCAoSW50ZWwgR1BVIFRvb2wpIHdpbGwgdHJ5IHRv
IGNvbW1pdCBsYXllcnMgd2l0aA0KPiA+IHplcm8gd2lkdGggb3IgaGVpZ2h0IGFuZCBsZWFkIHRv
IHVuZGVmaW5lZCBiZWhhdmlvcnMgaW4gaGFyZHdhcmUuDQo+ID4gRGlzYWJsZSB0aGUgbGF5ZXJz
IGluIHN1Y2ggYSBzaXR1YXRpb24uDQo+ID4gDQo+ID4gRml4ZXM6IDc3N2I3YmM4NmEwYTMgKCJk
cm0vbWVkaWF0ZWs6IEFkZCBvdmxfYWRhcHRvciBzdXBwb3J0IGZvcg0KPiA+IE1UODE5NSIpDQo+
ID4gRml4ZXM6IGZhOTdmZTcxZjZmOTMgKCJkcm0vbWVkaWF0ZWs6IEFkZCBFVEhEUiBzdXBwb3J0
IGZvciBNVDgxOTUiKQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcg
PHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gVGhpcyBjb21taXQgc2hvdWxkIGJlIHNl
bnQgc2VwYXJhdGVseSBmcm9tIHRoaXMgc2VyaWVzLCBhcyBpdCBpcw0KPiBmaXhpbmcgdGhpbmdz
DQo+IHRoYXQgYXJlIG5vdCByZWxhdGVkIGp1c3QgdG8gSUdULCBidXQgYWxzbyB0byBjb3JuZXIg
Y2FzZXMgaW4gcmVndWxhcg0KPiBub24tdGVzdGluZw0KPiB1c2VjYXNlcy4NCj4gDQo+IEluIGFu
eSBjYXNlLCBpdCdzIG5vdCBtYW5kYXRvcnkgYXMgdGhhdCBkZXBlbmRzIG9uIHdoYXQgdGhlDQo+
IG1haW50YWluZXIgcHJlZmVycywNCj4gc28gaXQncyBDSydzIGNhbGwgYW55d2F5Lg0KPiANCj4g
QmVzaWRlcyB0aGF0LA0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KDQpHb3Qg
aXQuIFdpbGwgZGlzY3VzcyB0aGlzIHdpdGggQ0suDQoNClRoaXMgYnVnIGlzIGZvdW5kIHdoZW4g
cnVubmluZyBJR1QgdGVzdCB3aGlsZSBvbmUgb2YgdGhlIHRlc3QgaXRlbQ0KY29tbWl0cyBhIGxh
eWVyIHdpdGggemVybyB3aWR0aCBhbmQgY3Vhc2UgdGhlIGRldmljZSB0byBmcmVlemUuDQoNCg==

--__=_Part_Boundary_008_1698668415.157276541--

