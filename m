Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EA7CB9AF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 06:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4610E06F;
	Tue, 17 Oct 2023 04:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E4F10E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 04:19:57 +0000 (UTC)
X-UUID: 69fd4e6c6ca411eea33bb35ae8d461a2-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ohPlJO1Yrns3giwjnj3GfMV9pZKSqOWO/Yr7uNxgJlU=; 
 b=a9jLg2J4VJCW390j5V/lXG3JPrge6vgeA0oDWb38X+PJlJ6yKXi0QlQ19PcqvCAAgb4p66BaJuOpjOxzXleyjqRb0BJQebgCUDfPBBR358RAENaaUp0d8K+EluQUsU4tqbQGExKN0j/mBxx/2Xf9+qRitrcuUNvfdZGQhTNZ2Zw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:36f67563-f28e-44b7-bb4a-f2efb59fd4af, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:f93204c0-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 69fd4e6c6ca411eea33bb35ae8d461a2-20231017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1133053694; Tue, 17 Oct 2023 12:19:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 12:19:49 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 12:19:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm2VpsD2vDmWh5bQHWAoV4Lm6OFKQh3lrT8lwJIZgDjfwYoKqyIYTFRJtUuqv+LV4dKa7L/eyX7YYkiUly7nUz4auxUiUyAgEHYM0RbEe1agHj4JnDsyp5yO8/INc4QH5ERLJDqG7UeXeU3iuahui5ro8HY1iGiumi57BionM1wePPbms3Zy7FSx+EjM17HXEK6oHd5pDp9MOo/d98wxp1N6GodR5LPbHNd7lxdI5651uu4GbP0iL5r1804EmjuXZ8AQfBDzF4LfiuIuzdcrZCQvlW1iGqIfbaM4X51mQ4uWsVVwogi0DBorc0G0BaM+c/HaK7fW8vmXe8P5lVv1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22fb0KMuuQ2+qlqSmPkS4P4iIdq0A/NwGPUSbkG1KQU=;
 b=lNF3oLKrETfVsPRN43nN9TieP+GXqN/819Ut+Uj+p+nQ30wT+twOdKOjUH9qDz4P3GrBDg7Rr1Y4bcv4kstDUjLJ8ZO9X0Q0BDV9jmcArRP5TpUkwu2RHsSHx2y2R6IhKTqfHKtXm5D/FD3cBMUxsVeg9RHJ/4nN4UH/c0q2VBFikAKRvUd5WphFhchxoPhPSN6Wo/Yx/boDV0J3XN/LnX9inTVuSXygVreGe3DuWlhZF7GQfe8i5FIP/jHt4wKo64MPGrb0u5/FfzzZdvvKg0oIJHhdyrr5Wy04k9pMfC/UiMq0P8SpZ9mG/AVNyndDW+ijkO7azrsCm3hM3v5xdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22fb0KMuuQ2+qlqSmPkS4P4iIdq0A/NwGPUSbkG1KQU=;
 b=qcb53XuWeb61moMImCgIdzILncqTkp/hfT2uXppC1ixQPNHehLMl7RFNSbXrD7fV2z7OgOTIbcZBiFc5fuXXIpL98H7SIWklz6QQKjwla/jnIy/2/v1KnMHmJtSIqS2D30EinPnzqQ+XHwRFV0n6eeeFLqwE12KdNCjkwkTu/Fg=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYUPR03MB7230.apcprd03.prod.outlook.com (2603:1096:400:356::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 04:19:47 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 04:19:46 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "daniel@fooishbar.org" <daniel@fooishbar.org>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Thread-Topic: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Thread-Index: AQHZ+Cgp187jkr0vBEqA6ERKZhPrzbBH886AgAPs+YCAAGsdgIABJh0A
Date: Tue, 17 Oct 2023 04:19:46 +0000
Message-ID: <cadc280e7be3c14687bd4ef4f4fe6b459120396c.camel@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-5-shawn.sung@mediatek.com>
 <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
 <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
 <CAPj87rMc=3tX8Fbk4LjXmqgPfp=YX3GS64V4Sb5y84xwf3wDBw@mail.gmail.com>
In-Reply-To: <CAPj87rMc=3tX8Fbk4LjXmqgPfp=YX3GS64V4Sb5y84xwf3wDBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYUPR03MB7230:EE_
x-ms-office365-filtering-correlation-id: f5cbe278-9ea9-4b5c-a38a-08dbcec84c1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YteZ2CTJAVx9quzpSKZ2U75uaiZVR3PN7czB1eyU2Ev9mVUZFgLpx+615sS2wUZ2vW2Avbg4XzX2jnnbvVFdVm7RZMylnPxQIXFO4KORLeBVuf1WfbcnXM4TVFLwkynyxCFQDreOVK5+YYvOlwCeLGama5U2XYI+FT8o45VMViolKUjhamJCAe6ViaK7dgU3yOtBIHTN48yzK9ix+LR+EmFdbQRKtXiYGEZITu1f1Ev4TxD3wjUrCqDa45nzDIJEa8Tym/6vlt7rphqwLC0WYq78QcLZrqzIBd9JARwCngxF+M9U9mv4WXilW8KPUVKt122/kIeE1nBhRwIFqD3el20kLVHTDrfdIZWW0d38dq6CKff/0uaDPa8bC9XMF+NbKUjA0vNZRA5Pyp6qlU137PdFd9hkRKWvqsflKBshRmLLfhI2nVizRAvQvaVdT+cPC3FrxJN0oVuIDyrIrwM9teAgSP4qCZIoJUZUdW9lW0D0rXi49VNK6sSp9bD5aXR7ZqUgjoHIFdRWnQk1lkd9D5qhYy+5UOJJRwQa3qnG5A9ZGSPqxsHiJ9Ybf+FCHGHalN/3+8Kr6YJLTLe3CqNWp4ha7msaBzFAdsjtnScdBEllwamm26OcYT0KjXrYXGCewjry8ZorDuRnHQJFUer2c5BJ+4egRgBkiB7pWUJvqp4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2616005)(6506007)(66556008)(66446008)(6486002)(64756008)(66946007)(76116006)(478600001)(71200400001)(6916009)(66476007)(54906003)(26005)(316002)(86362001)(6512007)(36756003)(4326008)(8676002)(4001150100001)(2906002)(7416002)(8936002)(5660300002)(122000001)(85182001)(41300700001)(38070700005)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWhtYkdYeUdISU1Vd2ZscmNFU0JZeE1uRG9BNUNSajUzREhaMWYycHFob3M1?=
 =?utf-8?B?R0NxcVFSb3BLRmN2aExOWFY1a0tOd0ZITlRsUkl4dE9sMTV4QTlhMFZkcjRZ?=
 =?utf-8?B?ckp4d3FiQmsyR3RUWUdDREUwMXQvY2JIMG5uekxlWCt2d2xqQW5nN3pueU4z?=
 =?utf-8?B?cHNmZnNFcXB5YTA1ZXh0SG82Z245bDJpTytjMThob3Y1YUl3UWFTZ3Vkem44?=
 =?utf-8?B?SEhqcWg0ekk0clEycGpQUjVCNTVNMEZYcVdWbVdVVFBkWmhUM2UrS2FpVVd4?=
 =?utf-8?B?VzZMSkljM0hlRFFDanhldzF3a25QWjdUZEdBRGJLWlVuUUF5emVORmw4aEtV?=
 =?utf-8?B?VHBkZDJScFRrZ2w5Zkpubnk4V0RDTUhlMkxiL3pBQ2JGZ2Z6TDVXUmFkZkNh?=
 =?utf-8?B?NWo3WEVSTjFiMmh2R3ZSQ09KaU1ZeFl5OXYyNXZYZU1YTnh1Z0NjNGw2eWdq?=
 =?utf-8?B?bWF2VTQ4Q3dlK3dyc2xTZHpPbzdua05xenBRbCtzRXlaVDZ6WkNhcjRQM1A2?=
 =?utf-8?B?dUNQSGhTWDRtNy9qYWdTTUN1ZGk4dm50T1VQVTh0cm50VWo5SVBSL3RZWE94?=
 =?utf-8?B?VXA1RWk1LzZwRjd5R2NNelBwMStKbTNxclR4Y2VzZW4vVG9wTmo2UzFveStV?=
 =?utf-8?B?YTBucDRHbkVwRVZPMURpYkpIZXBKVzIxdk5Nekw4SWxodGc0aWFjNHhObVpa?=
 =?utf-8?B?VkgwZlgybmNHT1NOOFNMVzVZYlFhZ20wU1g3cTRYNnFpSmJWMHFPUnFqMVlY?=
 =?utf-8?B?czRra3dqM2hlZU9wajd0Um53cW5Ra0JJeTRVcTBqVVJpdFRmb2hoQVl5RUpj?=
 =?utf-8?B?SlFJb3VhaGpTYTd4TXZ0TW9tanM0L2hsUzJMbWxQY29YY0RQSnlSeVdUWHNQ?=
 =?utf-8?B?SWtqT081OWMxR1o0dExqTkd6WEwyRGFHc2xxMUEzMTVnNm9XUzZvVS96TXpQ?=
 =?utf-8?B?cVI5akk2STd0VFgwQTM4aEF0R212OFJGVkFsU2hBcUxuRnU2NXkveVRHRm9o?=
 =?utf-8?B?ejNjT3djK0FKWC9IWGw2ZTJPQTRRNWRmcHFyd2RUQm5yQnRlaTJjNUZPbkN4?=
 =?utf-8?B?SmJOZVlBN3p4TWsyRmh6OU1Yd3B4K1pvTlZvdXlWQno2KzdRY29MYlVKOUhu?=
 =?utf-8?B?Vk5GajRKbnNwYzZhenlTQVE2ZTdHWUpMUkY2MDl5T1FkeTZ4bGczWGRWeVJQ?=
 =?utf-8?B?U3EwWGtCTytGSDFPcGtqTm5DVDhENTBDMitGZ3VGTGhKdWtTRHhIWWUzb2Y0?=
 =?utf-8?B?VEQxQlVRNEZwbHFwRTk4d2x6VkdveTA5VTYzWWJ0dTdiVG9yU2IrZzBjMEJw?=
 =?utf-8?B?Tm85NEZtTDJpZTloakVoSFkrNnROOTRzMGJqaHBJWTNUS0xUc1ZKTzZkczZL?=
 =?utf-8?B?Y05xQkc1V0JDL1A4SSs0SlNNSDUrWGhGNi9Cd2ZKdDRPL2FBYWpsL0dramUv?=
 =?utf-8?B?aVRKOWpVaFY0aXEzUS8vcmxJN1RyUStIVTJMeVZlNTFPeWprOTdvU1Y4MDF1?=
 =?utf-8?B?OXh2NXppRlI5SUREV3lwMkRvbzFBM0hHNnRETnpBTFlKU3hZOUhLT1NFdXln?=
 =?utf-8?B?aUxtL2xJTkNWdmtxcW5NMG5QSWprak1CZTE0RmZvN1liU3VmaHY3ZlVMRTI4?=
 =?utf-8?B?aWVjeVB1ODZSWmpVVkxWWW5PWGtWSmYyV1BFOEh5MkdoUlRZVlpJdlJTT001?=
 =?utf-8?B?c1ZkR2dMSXc1YkR4WmFNRkV6NGlTUGRVcVpyL1VSZisvMFhmZ1RSRDE0SVVx?=
 =?utf-8?B?K04ybFN2MSt5Y05LODdFRVhRdThPeWtxVm9kckxPWEI5M09qUHE3WHlpcHF4?=
 =?utf-8?B?dS9UVXJiM0U3N25haFVXYUlXMGdrUHNvRGFmYi9FRWdNTDlxbnNLd2V5NkJD?=
 =?utf-8?B?aC9reFlJVXp4NWVPV3grSVkyMERMSVQzV0I4Rnpqc2J1M0pMVzZnRXZYcUtL?=
 =?utf-8?B?TG5kdWVzUWh0V0U2SGhQRXVQWVJKNkxscmloNzQ4VjRxL1NGeHZFSnh6ZnhF?=
 =?utf-8?B?eHBMVUMxMHZGYllOUVB3bmpWK0UyM08zMFZaTGJnNFBST2hVRDJwUTJWWVlx?=
 =?utf-8?B?ZmRuL3BEdURrWjR0SHFVWW05cy9nbmNqQS9DL0JsaUs1aWd3TUNmSDJNYXNF?=
 =?utf-8?B?V3dDNzNEYWpweDBJVk1FUUttLzJ3RjI3U2szVVV4V2F6Qm1hMTFMS2E2eEtJ?=
 =?utf-8?B?MkE9PQ==?=
Content-ID: <8B4ABB97F2B93344B68231CC6103DA69@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cbe278-9ea9-4b5c-a38a-08dbcec84c1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 04:19:46.8774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdRwGpi1KIPerNbXYXHB195fjGa0/emlAmZbWb/dnPDNrCGntF9q92Jqp8qcfXMNsuMwlSAg3Z4+/LrXVzzKdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7230
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--29.532400-8.000000
X-TMASE-MatchedRID: UWn79NfEZzbUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2dnC5uaS6tb9+Mk6ACsw4JpMxNpDOG+h6Wc2
 47K5p+pqXp4mjSj5SJIueL58aNkcQtgOLaDgvRCWng4xNY7BizTlgt2EJ9a2EQmp51f2+39ncIr
 +Sexz1N1wJlo+DKzyHkgCx+93kt0V6kCBFqPiuW8u00lnG8+PWoUIbLcCfRuCo+b+yOP0oGAqEO
 aaKoFK3sZZYtUp0qr5Pi1YYtiBcUxM9Fd6tjRLjjc2CQSoA3RGbKpAlY2y6SYKwF4K/wIz9L1XM
 sf0v31qW1rCYd0kRogFIUrK6b5YLSSOWVJeuO1DSBVVc2BozSnJnzNw42kCxxEHRux+uk8jpP8t
 MOyYmaA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--29.532400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 60F6019C5A7D31375A901EA14174A657830732439CFF1E9AC2AE07AEAB8685362000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1378127963.1679542308"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1378127963.1679542308
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtEYW5pZWwsDQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTEwLTE2JiMzMjth
dCYjMzI7MTI6NDcmIzMyOyswMjAwLCYjMzI7RGFuaWVsJiMzMjtTdG9uZSYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMy
O1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3Bl
biYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zl
cmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZn
dDsmIzMyOyYjMzI7SGkmIzMyO1NoYXduLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7TW9u
LCYjMzI7MTYmIzMyO09jdCYjMzI7MjAyMyYjMzI7YXQmIzMyOzA2OjIzLCYjMzI7U2hhd24mIzMy
O1N1bmcmIzMyOygmIzIzNDM1OyYjMjMzODk7JiMzNTYwOTspJiMzMjsmbHQ7DQomZ3Q7JiMzMjtT
aGF3bi5TdW5nQG1lZGlhdGVrLmNvbSZndDsmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7
T24mIzMyO0ZyaSwmIzMyOzIwMjMtMTAtMTMmIzMyO2F0JiMzMjsxNzoyNiYjMzI7KzAxMDAsJiMz
MjtEYW5pZWwmIzMyO1N0b25lJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
O0lmJiMzMjtJJiMzMjt1bmRlcnN0YW5kJiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7Y29ycmVjdGx5
LCYjMzI7cGFkZGluZyYjMzI7aXMmIzMyO2F1dG9tYXRpY2FsbHkNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyO2FwcGxpZWQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3RvJiMzMjtjb21w
ZW5zYXRlJiMzMjtmb3ImIzMyO3VuYWxpZ25lZCYjMzI7ZGltZW5zaW9ucy4mIzMyO1RoZSYjMzI7
Zmlyc3QvbGFzdA0KJmd0OyYjMzI7cm93cy9jb2x1bW5zDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjtvZg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7dGhlJiMzMjtvdmVybGF5JiMzMjth
cmVhJiMzMjt3aWxsJiMzMjtiZSYjMzI7ZmlsbGVkJiMzMjt3aXRoJiMzMjthJiMzMjtzcGVjaWZp
ZWQmIzMyO2NvbG91ciYjMzI7KGJsYWNrJiM2MzspDQomZ3Q7JiMzMjt0bw0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7cHJlc2VydmUmIzMyO3RoZSYjMzI7YXJlYS4mIzMyO1RoaXMmIzMyO2lz
JiMzMjt1bmZvcnR1bmF0ZWx5JiMzMjtub3QmIzMyO09LJiMzMjt0byYjMzI7ZG8NCiZndDsmIzMy
O3RyYW5zcGFyZW50bHkuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtVc2Vyc3BhY2UmIzMy
O211c3QmIzMyO2JlJiMzMjthd2FyZSYjMzI7b2YmIzMyO3RoaXMmIzMyO3BvbGljeSYjMzI7ZGVj
aXNpb24mIzMyO2FuZCYjMzI7c3BlY2lmaWNhbGx5DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjtyZXF1ZXN0JiMzMjtpdC4mIzMyO0lmJiMzMjtub3QsJiMzMjt0aGUmIzMyO2F0b21pYyYjMzI7
cmVxdWVzdCYjMzI7Y2hlY2smIzMyO3Nob3VsZCYjMzI7ZmFpbCYjMzI7YW5kJiMzMjt0ZWxsDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt1c2Vyc3BhY2UmIzMyO3RoYXQmIzMyO3RoZSYjMzI7
cmVxdWVzdGVkJiMzMjtjb25maWd1cmF0aW9uJiMzMjtpcyYjMzI7bm90JiMzMjtwb3NzaWJsZSYj
MzI7dG8NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2FjaGlldmUuDQomZ3Q7JiMzMjsmZ3Q7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtZZXMsJiMzMjtQYWRkaW5nJiMzMjt3b3JrcyYjMzI7YXMmIzMy
O3lvdSYjMzI7ZGVzY3JpYmVkLCYjMzI7dXNlcnMmIzMyO2NhbiYjMzI7YXNzaWduJiMzMjtiYWNr
Z3JvdW5kDQomZ3Q7JiMzMjtjb2xvcnMNCiZndDsmIzMyOyZndDsmIzMyO2ZvciYjMzI7dGhlJiMz
MjtmaWxsZWQmIzMyO2FyZWEmIzMyO2luJiMzMjsxMGJpdCYjMzI7UkdCJiMzMjtmb3JtYXQsJiMz
Mjtob3dldmVyLCYjMzI7dGhlJiMzMjtyb3dzJiMzMjthbmQNCiZndDsmIzMyO2NvbHVtbnMNCiZn
dDsmIzMyOyZndDsmIzMyO3RoYXQmIzMyO2FyZSYjMzI7ZmlsbGVkJiMzMjtieSYjMzI7UGFkZGlu
ZyYjMzI7d2lsbCYjMzI7YmUmIzMyO2Nyb3BwZWQmIzMyO2J5JiMzMjt0aGUmIzMyO2hhcmR3YXJl
DQomZ3Q7JiMzMjtjb21wb25lbnRzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjthZnRlciYjMzI7aXQmIzMy
O3RvJiMzMjthdm9pZCYjMzI7c2l0dWF0aW9ucyYjMzI7YXMmIzMyO3lvdSYjMzI7bWVudGlvbmVk
LCYjMzI7c28mIzMyO3VzZXJzJiMzMjtzaG91bGQmIzMyO25vdA0KJmd0OyYjMzI7Jmd0OyYjMzI7
bm90aWNlJiMzMjthbnkmIzMyO2RpZmZlcmVuY2UuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYW5r
cyYjMzI7Zm9yJiMzMjt0aGUmIzMyO2V4cGxhbmF0aW9uLCYjMzI7SSYjMzI7aGFkbiYjMzk7dCYj
MzI7cmVhbGlzZWQmIzMyO3RoYXQmIzMyO3RoZSYjMzI7YWRkZWQmIzMyO3BhZGRpbmcNCiZndDsm
IzMyO2xhdGVyJiMzMjtnZXRzJiMzMjtjcm9wcGVkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtDaGVl
cnMsDQomZ3Q7JiMzMjtEYW5pZWwNCg0KU2luY2UmIzMyO1BhZGRpbmcmIzMyO2lzJiMzMjtieXBh
c3NlZCYjMzI7aW4mIzMyO3RoZSYjMzI7Y3VycmVudCYjMzI7dmVyc2lvbiwmIzMyO3dlJiMzMjtk
aWRuJiMzOTt0JiMzMjttZW50aW9uJiMzMjt0b28NCm1hbnkmIzMyO2RldGFpbHMmIzMyO2Fib3V0
JiMzMjtpdC4mIzMyO1RoYW5rJiMzMjt5b3UmIzMyO2ZvciYjMzI7Y2hlY2tpbmcuDQoNCkZvciYj
MzI7bW9yZSYjMzI7aW5mb3JtYXRpb24sJiMzMjs0LXBpeGVsJiMzMjthbGlnbm1lbnQmIzMyO2lu
JiMzMjt3aWR0aCYjMzI7aXMmIzMyO29ubHkmIzMyO3JlcXVpcmVkJiMzMjt3aGVuDQpIRFImIzMy
O2lzJiMzMjtpbiYjMzI7RG9sYnkmIzMyO1Zpc2lvbiYjMzI7Zm9ybWF0LCYjMzI7YW5kJiMzMjt0
aGUmIzMyO3BhZGRpbmdzJiMzMjt3aWxsJiMzMjtiZSYjMzI7Y3JvcHBlZCYjMzI7YnkNCnZpZGVv
JiMzMjtmcm9udC1lbmQmIzMyO2luJiMzMjt0aGUmIzMyO0hEUiYjMzI7bW9kdWxlLg0KDQpDaGVl
cnMsDQpTaGF3bg0KDQoNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_1378127963.1679542308
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRGFuaWVsLA0KDQpPbiBNb24sIDIwMjMtMTAtMTYgYXQgMTI6NDcgKzAyMDAsIERhbmllbCBT
dG9uZSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBIaSBTaGF3biwNCj4gDQo+IE9uIE1vbiwgMTYg
T2N0IDIwMjMgYXQgMDY6MjMsIFNoYXduIFN1bmcgKOWui+WtneismSkgPA0KPiBTaGF3bi5TdW5n
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIzLTEwLTEzIGF0IDE3OjI2ICsw
MTAwLCBEYW5pZWwgU3RvbmUgd3JvdGU6DQo+ID4gPiBJZiBJIHVuZGVyc3RhbmQgdGhlIGRyaXZl
ciBjb3JyZWN0bHksIHBhZGRpbmcgaXMgYXV0b21hdGljYWxseQ0KPiA+ID4gYXBwbGllZA0KPiA+
ID4gdG8gY29tcGVuc2F0ZSBmb3IgdW5hbGlnbmVkIGRpbWVuc2lvbnMuIFRoZSBmaXJzdC9sYXN0
DQo+IHJvd3MvY29sdW1ucw0KPiA+ID4gb2YNCj4gPiA+IHRoZSBvdmVybGF5IGFyZWEgd2lsbCBi
ZSBmaWxsZWQgd2l0aCBhIHNwZWNpZmllZCBjb2xvdXIgKGJsYWNrPykNCj4gdG8NCj4gPiA+IHBy
ZXNlcnZlIHRoZSBhcmVhLiBUaGlzIGlzIHVuZm9ydHVuYXRlbHkgbm90IE9LIHRvIGRvDQo+IHRy
YW5zcGFyZW50bHkuDQo+ID4gPiBVc2Vyc3BhY2UgbXVzdCBiZSBhd2FyZSBvZiB0aGlzIHBvbGlj
eSBkZWNpc2lvbiBhbmQgc3BlY2lmaWNhbGx5DQo+ID4gPiByZXF1ZXN0IGl0LiBJZiBub3QsIHRo
ZSBhdG9taWMgcmVxdWVzdCBjaGVjayBzaG91bGQgZmFpbCBhbmQgdGVsbA0KPiA+ID4gdXNlcnNw
YWNlIHRoYXQgdGhlIHJlcXVlc3RlZCBjb25maWd1cmF0aW9uIGlzIG5vdCBwb3NzaWJsZSB0bw0K
PiA+ID4gYWNoaWV2ZS4NCj4gPg0KPiA+IFllcywgUGFkZGluZyB3b3JrcyBhcyB5b3UgZGVzY3Jp
YmVkLCB1c2VycyBjYW4gYXNzaWduIGJhY2tncm91bmQNCj4gY29sb3JzDQo+ID4gZm9yIHRoZSBm
aWxsZWQgYXJlYSBpbiAxMGJpdCBSR0IgZm9ybWF0LCBob3dldmVyLCB0aGUgcm93cyBhbmQNCj4g
Y29sdW1ucw0KPiA+IHRoYXQgYXJlIGZpbGxlZCBieSBQYWRkaW5nIHdpbGwgYmUgY3JvcHBlZCBi
eSB0aGUgaGFyZHdhcmUNCj4gY29tcG9uZW50cw0KPiA+IGFmdGVyIGl0IHRvIGF2b2lkIHNpdHVh
dGlvbnMgYXMgeW91IG1lbnRpb25lZCwgc28gdXNlcnMgc2hvdWxkIG5vdA0KPiA+IG5vdGljZSBh
bnkgZGlmZmVyZW5jZS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLCBJIGhhZG4n
dCByZWFsaXNlZCB0aGF0IHRoZSBhZGRlZCBwYWRkaW5nDQo+IGxhdGVyIGdldHMgY3JvcHBlZC4N
Cj4gDQo+IENoZWVycywNCj4gRGFuaWVsDQoNClNpbmNlIFBhZGRpbmcgaXMgYnlwYXNzZWQgaW4g
dGhlIGN1cnJlbnQgdmVyc2lvbiwgd2UgZGlkbid0IG1lbnRpb24gdG9vDQptYW55IGRldGFpbHMg
YWJvdXQgaXQuIFRoYW5rIHlvdSBmb3IgY2hlY2tpbmcuDQoNCkZvciBtb3JlIGluZm9ybWF0aW9u
LCA0LXBpeGVsIGFsaWdubWVudCBpbiB3aWR0aCBpcyBvbmx5IHJlcXVpcmVkIHdoZW4NCkhEUiBp
cyBpbiBEb2xieSBWaXNpb24gZm9ybWF0LCBhbmQgdGhlIHBhZGRpbmdzIHdpbGwgYmUgY3JvcHBl
ZCBieQ0KdmlkZW8gZnJvbnQtZW5kIGluIHRoZSBIRFIgbW9kdWxlLg0KDQpDaGVlcnMsDQpTaGF3
bg0KDQoNCg==

--__=_Part_Boundary_001_1378127963.1679542308--

