Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F6668A12
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 04:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E37A10E97D;
	Fri, 13 Jan 2023 03:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C51510E97D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 03:25:55 +0000 (UTC)
X-UUID: fa7cdee092f111ed945fc101203acc17-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=EWTNpKf/4l0n7Sxf9MjzPoz81nlVgOEqIpM6cKUm7fE=; 
 b=UrO0gJafb8TiHuGpAussZPelC8qdMgH9Qm7pBIO/df8Fq5Ja9sanfpdtO3jtfKBzVNzafH7VCzISsaZeDG+LrHb3TyzKHbTAXKO8hoVLelH1hosyXmSWdM97ZOam9BIgjZKZRhrJq1RvoAaOH5sdfnrijQ5mB8OIipnpVPAvFzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:93026d7c-d371-48c9-ad7f-4839a6825e21, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.17, REQID:93026d7c-d371-48c9-ad7f-4839a6825e21, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:543e81c, CLOUDID:8dfd8654-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:230113045842QO8S9TJ8,BulkQuantity:8,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:1,Malicious:0
X-CID-BVR: 0
X-UUID: fa7cdee092f111ed945fc101203acc17-20230113
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 38407342; Fri, 13 Jan 2023 11:25:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 11:25:49 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 11:25:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPOx2yWxxfV+3QbDk0ADQsC+vXWEMCdOEJ7gr23fNs3RzMcZQbRI3+KxsGhj9M7hLGYrVGBwoWGb2Jx/Uz0+DkoynYlhduUNU4gBZkQu55jfVHe4+LKBWqd8V353yLnNm9FdRbpBdtG21npKkqYS4/uYMmsnFNgptRJuNeTZ8NzJ1MebNZbO3M0HcK/0nnvUURjLPka9vmLwaDa1bJp/0mB4X/6S/XoiXfV3rKZMD3iSd5/pNBCt/D8fs0nIbnVXXvSn3JT6VWrsRXUWYOGWpORspXsXKFr4t4UL7Ew1X1iRlvHqpYix2BcReGS01aeMr0/MfBd3At9twxq65X6K7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWTNpKf/4l0n7Sxf9MjzPoz81nlVgOEqIpM6cKUm7fE=;
 b=ObJ46ujHk4m+tZzmh4gVh4HpylKc0iDuht3SZKFxGTVcWNxQBQYZ/dY55da5m4WmTY21SZQSgEQeraBqhFl6orvTaBaAC0kBPNqWODYv2KBTZeNke4am+iY/xtx4o8Th5gi8l42sCggYeD1SgPtiaXopIIkvmkjrWkd/HbkyPgjMymvOxrGCTAzDq51vD6hLdzk6kb330BAx5N2eTwL52+JrCVjkb1v4GojiSi9d9+N37hiCVQx3hyZN2d8MnE4riM9YR4dwkoYKo0joopN2lVSXv2ijUSRjGLNi8meFCb1gJ+btrNEMSmoaMbxfovd/ZPhFKektiQ+Z/6LioAbKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWTNpKf/4l0n7Sxf9MjzPoz81nlVgOEqIpM6cKUm7fE=;
 b=Ye6CLj4ANizQvP5PVkRweI1IT10zilMw/pREOe+3Wh1TH1Rc4lpE/dZkyktQgX+g7Z7AT4/t4fgE0Z1+WWjdLLkfthJQ5g4E08PlJzuaD3K4y+ESfaNJ9ZtggiutOL3T4E6/EKCBgK5Qbl6ji9pLMPvO0L3xXq1fwoMJfHqIX78=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by TY0PR03MB6243.apcprd03.prod.outlook.com (2603:1096:400:137::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 03:25:47 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::5a1c:8321:d329:db44]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::5a1c:8321:d329:db44%7]) with mapi id 15.20.5986.019; Fri, 13 Jan 2023
 03:25:46 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
Subject: Re: [PATCH v7, 5/7] media: mediatek: vcodec: Different codec using
 different capture format
Thread-Topic: [PATCH v7, 5/7] media: mediatek: vcodec: Different codec using
 different capture format
Thread-Index: AQHZJsjI+hSB3bHK9U63snHRDOMPD66br+CA
Date: Fri, 13 Jan 2023 03:25:46 +0000
Message-ID: <2fe7132f2fcc3fb4724a34c3c4a918b821c845a3.camel@mediatek.com>
References: <20220518123004.18286-1-yunfei.dong@mediatek.com>
 <20220518123004.18286-6-yunfei.dong@mediatek.com>
 <20230112205825.wb5qcqhh5kwvyi3y@notapiano>
In-Reply-To: <20230112205825.wb5qcqhh5kwvyi3y@notapiano>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|TY0PR03MB6243:EE_
x-ms-office365-filtering-correlation-id: 2a365be3-b969-4c24-fe89-08daf515dc78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M93oblC4QOFNLaYPgwy8lHsTc77tnQAz5au0rH1vin4A4gOD9TTUl+AmVabqfojgcsvudbGNdQJvNUfba8Gwmg7xuYYGryFwZKqxt4s/Soet268f/sNjYnirUop2N11vnzidX/eqXS7RELQ0tH5Yi0pnVZfeHoW4THlt1diFa8hG1G3LDAgyTOy8uTcT/skglA4DYsB6uYTVzG9eMnJv4mroHGCeq4EAx1qPgKZTYnMMZaWeXBp5eaXIkFhJdKu27xKWCABeW0Ez/RvV/9pc9Bq1+aIv0UTsVAPI+Y5K/+mdBZzI8TBj3YGbnYHOnzNznv/VLhaK9V2zbJ9Yu7gH2BE/+h/eWM+/R4HmTdT/OAlYIgeDVrk/ca3ka0c0UBl/8ykKXrE1u6e3isBHGHYJlS9bfyGIr1FXR2tP7/Y89bPmzhpDRGwHmyTnKO1fOc6/WUgLunNaQ0h7Zn8rpfysQZw0ZRf7Eo1w6wY/49HXb569Lijb+U2iUB8dz33d4y4bPK3N+NEV305bJr7gmr++gRk/ydFTGsSNPVCsSH9/2g3+IbxnOWEaUTngiQVOV//YXLo2nPbQ4FVuf4FnG4cDr2NtU0kdvIMfb6ShB1++XfwlCO51+BfxbkeV2esT+Aiqg3XBKgtng9Am+ZTlVqrMZ61albkTvKatzL6sp7nBLd4FKgJzP0Jg7rTyaJu3GfuHWohY1z8YYsaELxKU7qST9YFrdeN0rZ+s6aVjbe/kSYENgdp62K40iVP8XZVACR6PLR7E2aQ05ZRMwLCD99G71fAWsVtKjYMMstMn/Iwlq9RZXMLxqhCBciaqvOjjRSvX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR03MB4153.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(41300700001)(7416002)(6506007)(8936002)(2906002)(5660300002)(83380400001)(66556008)(91956017)(71200400001)(4326008)(76116006)(6916009)(38100700002)(122000001)(8676002)(38070700005)(316002)(85182001)(66476007)(64756008)(478600001)(54906003)(36756003)(66946007)(66446008)(6486002)(2616005)(186003)(966005)(86362001)(6512007)(26005)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnJZUTVhejlsdmMzaXNZUWxZNjdjWmZaOGxacVllN0NOWDZDbWNFMDlkMHVy?=
 =?utf-8?B?OW5MdEdSNXdFSWxZOGhubFlmRE5KS1RHRlgwQUNRYTk0ODdGNDZpeWNnRllL?=
 =?utf-8?B?dDliU29wSnd3a2J1WHBrRjg0VnplYWg3MFBMa01lUnhGVERiaUpHdjVwazNy?=
 =?utf-8?B?MW1pK3pjMVZqVVptVVArUkcyV09UbVU0aVdBb2F1VUZueUtoREZOTlpzRjk4?=
 =?utf-8?B?Vmx6RndsTzBkTEJOZ0ZiN0x0M0ExSFZ1VVRhTG1TbnRzQWFXOGx6YThqSVRl?=
 =?utf-8?B?V21wUTR0SWhqUU90VFJ0dEtYbjBTb01WL1dCOVIwV0NhUDdLQ1h4QkZvTTkr?=
 =?utf-8?B?RGVwVlAwVlhIdUtJdEV4dkUyYXdEbWxPdUtqUnpCTlIydkd1dEJCb2Q3RXFp?=
 =?utf-8?B?blBMd2t6dTE4RHFFUWxKc3dTNTEydmY4S3RMejdrdnh6T29tc2QyVUxhc3ZT?=
 =?utf-8?B?cTh4TUlkRWs4MlNJUTM4UHhvM0ZPQ29vSnhlVFRTSDJveHBaQmVTNWx1Nnhn?=
 =?utf-8?B?MmJhMXlFMWNuSXlLRlVVZDRiVEg3WEZyenBZQWlqajZnZ3h5VDlIbWZ2SDZG?=
 =?utf-8?B?WkxXSDd5bzk3VGxxbUhVNlpWNTFJK09lbTVISXZJcUJDRTdyTnFxcFd6K1A5?=
 =?utf-8?B?TnMrNXBWbGpPVmJQRlRBSFJMK2JHN1ZoNTdidStaSHNTSmRVN0NKalpEYi9T?=
 =?utf-8?B?c2JnS0dxZVZCZTlBL0E1amJIT1ZQUlgybmgrNlhBcVNKS05sK2hoT3ppZ2Ny?=
 =?utf-8?B?d25iRHFlNzZoUER0Tlg5Z1BGSmxmcHJPcFVBd21yc2tzcFlUQ1ZCaW5zU0VQ?=
 =?utf-8?B?U0V3ODNHNWFubUw0OXFNbjU2K1pRc1kyRWRFNWZ6S1phQURwR3ZsSDR6YWFN?=
 =?utf-8?B?NENTKzFxOWtTMkE5cy9VR3dkb3pVcVhhaEpJalpKc0tjTXVTeVhCWEZ1a1RB?=
 =?utf-8?B?cXYxVVU2bUk4czRwTCt1Y09OZzdFYnBGbVVsQnIzR0lIRXdnbXp1bVhmeGtz?=
 =?utf-8?B?eTB5a3hsbnQ5YktEZXU4QWZWb2xISm5pLzI1c1h1VnJTbGRNem92V1hUUXpQ?=
 =?utf-8?B?RGVnaEZ5MWd6bi95SGdSY1hGNUtzVVQrc2N0NCt6dWN6SjJhNmZlRnlmZmhE?=
 =?utf-8?B?RnVVamJqSHo1KzNRTDcwSWVYZlA2bHB5NUVDSEdYN3pPVEJRdXhVL3lpM1dy?=
 =?utf-8?B?NGJpREZoUFZqWHlqTG5URUlPeGpja2tRZjhwUzdIQWdCNEUwT0M4NGNGQVI5?=
 =?utf-8?B?dVExYUlSNDZDZjV5MHZ2WDFhUVphMVdrdHdRZU1adHVoQjRWLzVPaDhCUnlw?=
 =?utf-8?B?UXd6dDB6U0k2VDhwQjF4RjI5R0wwZEdxaVo0aVFWbktDRFhkTkVJejZBMEwx?=
 =?utf-8?B?R1lGVHk4UzRVYTJ0dy8waERoTitkZnVEaGExSkNpM2xPdVlDU1JIcUxaUHVt?=
 =?utf-8?B?VmFLR29BNGtVcnFqZEZJVzZQVmhjSzJxQngzMnpydERiN09weHoxdGpreFRR?=
 =?utf-8?B?cS9tZnlnQ3JFYlY1d015OU5QVHFrOWpMNlFJT2h0Nm1UTXNjejdzUDV4WGl1?=
 =?utf-8?B?VWhhd1c3S1cyUS9LRExzNmpOa2IvQkVJMDNmQkFmK2ZyOE4vcFVKUUFJR2wr?=
 =?utf-8?B?Rmo0K2ZRYVUzenUzUno2S2tvYjZNZ2xFR3lSZTRNS1lQUXBiMUpTekxyUUhG?=
 =?utf-8?B?WWRxemc3ZjVKWmg2dlhzMVQrbDU1R2NkdDlHMFU3NTVHS1drWXdxZXJUMS9t?=
 =?utf-8?B?Q3lsdkN1d2tJYzREQUZPQ2hDQmRDR213UU5qY0ZGUjFneStuWXpGUjkraGx5?=
 =?utf-8?B?NWF0ZFRwZHI0cGZRTU1nMmJ5MmFMMHUvQWk2ay8ycC80SzVqNmdLM2lVRy81?=
 =?utf-8?B?NzNXTittWStDTUFoZzlkZ2RkbU0zVUdlK0hFMkZOT1lYYVZwbTM2WlVMOURj?=
 =?utf-8?B?RDlTb0hyemZpeDVCUFRLTzdMWmNBR3dWQ2hjZDZKVEdLdnA2bkxRSUZqcno1?=
 =?utf-8?B?MW1SQWlHeUxoNGV0QldFVkxXenhrQi85SW9JRmEyTjNMUnhHUlg3MHdzOWtR?=
 =?utf-8?B?VE1PTTVvd2d1M1V4UGdiZkxlTENDbUVlbDBRdUZFZ2cyeHhGRmNXVGlJc0oy?=
 =?utf-8?B?U3RaV1RZQmlsZVpSaWRwbGFsNDN0SWgvVGpxN0prVHZCZHc2UCtpNGd2UEhl?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B82D4D5525B1734984BF31341F9F141A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a365be3-b969-4c24-fe89-08daf515dc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 03:25:46.8069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEY3DYkLXz5zOaP/VK6ektTlCaFRYyyJpDUDvcP3Wp3df9liDUgvbOs7m0L0U7W5pQZr1c/Jm4JwRb/CmMw0fjWHS5iS51Cd1MLa/BZZI2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6243
X-MTK: N
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
Cc: =?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>, "stevecho@chromium.org" <stevecho@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?WGlhb3lvbmcgTHUgKOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>,
 =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 =?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "tfiga@google.com" <tfiga@google.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "acourbot@chromium.org" <acourbot@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIGluZm9ybWF0aW9uLg0KT24gVGh1LCAyMDIz
LTAxLTEyIGF0IDE1OjU4IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToNCj4g
T24gV2VkLCBNYXkgMTgsIDIwMjIgYXQgMDg6MzA6MDJQTSArMDgwMCwgWXVuZmVpIERvbmcgd3Jv
dGU6DQo+ID4gVnA4IG5lZWQgdG8gdXNlIE1NMjEsIGJ1dCB2cDkgYW5kIGgyNjQgbmVlZCB0byB1
c2UgSHlGYmMgbW9kZQ0KPiA+IGZvciBtdDgxOTUuIFZwOC92cDkvaDI2NCB1c2UgdGhlIHNhbWUg
TU0yMSBmb3JtYXQgZm9yIG10ODE5Mi4NCj4gDQo+IEhpIFl1bmZlaSwNCj4gDQo+IHdoeSBkbyBW
UDkgYW5kIEgyNjQgbmVlZCB0byB1c2UgSHlGYmMgKGlzIHRoaXMgdGhlIHNhbWUgYXMgTVQyMUM/
KQ0KPiBtb2RlIG9uDQo+IE1UODE5NT8gVGhlIFNDUCBmaXJtd2FyZSBvbiBsaW51eC1maXJtd2Fy
ZSBmb3IgTVQ4MTk1IFsxXSBvbmx5IGhhcw0KPiBNTTIxDQo+IGF2YWlsYWJsZSBhbmQgYmFzZWQg
b24gbXkgdGVzdGluZyBpdCB3b3JrcyBqdXN0IGZpbmUuIEFuZCBjb250cmFyeSB0bw0KPiB3aGF0
IHRoZQ0KPiBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhpcyBsb2dpYyBpcyBhbHNvIGJlaW5nIGFw
cGxpZWQgdG8gTVQ4MTkyLA0KPiBwcmV2ZW50aW5nIGl0DQo+IHRvIHVzZSBNTTIxIHdoZW4gdGhl
cmUgYXJlIG1vcmUgdGhhbiBvbmUgZm9ybWF0IGF2YWlsYWJsZS4NCj4gDQpUaGUga2VybmVsIGRy
aXZlciBub3Qgc3VwcG9ydCBkeW5hbWljIHN3aXRjaCBtdDIxYyBhbmQgbW0yMS4gVGhlIGRyaXZl
cg0KZmxvdyBhcyBiZWxvdzoNCjE6IElmIHRoZXJlIGFyZSBtdDIxYyBhbmQgbW0yMTogaDI2NC92
cDkvYXYxIHdpbGwgdXNlIG10MjFjKHZwOCB1c2UNCm1tMjEgYWx3YXlzKTsNCjI6IElmIHRoZXJl
IGFyZSBvbmx5IG10MjFjIG9yIG1tMjEgd2lsbCB1c2UgdGhpcyBmb3JtYXQgb25seS4NCg0KQnV0
IHRoZSBzY3AuaW1nIGlzIGNoYW5nZWQgdG8gc3VwcG9ydCBtdDIxYyBhbmQgbW0yMSwgdGhlIGtl
cm5lbCBkcml2ZXINCndpbGwgdXNlIG10MjFjLiBPciBmb3JjZSB0aGUga2VybmVsIGRyaXZlciBv
bmx5IHN1cHBvcnQgbW0yMShzbWFsbA0KZWZmb3J0KS4NCg0KQnV0IHRoZSBiZXN0IHNvbHV0aW9u
IGlzIGNoYW5nZWQgdGhlIGRyaXZlciB0byBkeW5hbWljIHN3aXRjaCBtdDIxYyBhbmQNCm1tMjEs
IG5lZWQgdG8gZGlzY3VzcyB0aGUgZW51bSBhbmQgc2V0IGZvcm1hdCBmbG93KG1pZGRsZSBlZmZv
cnQpLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KPiBUaGFua3MsDQo+IE7DrWNvbGFz
DQo+IA0KPiBbMV0gDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9saW51eC1maXJtd2Fy
ZS5naXQvdHJlZS9tZWRpYXRlay9tdDgxOTUvc2NwLmltZz9pZD0zNzVkNDUwMGQzMTVmZjIwYzU5
OTExZDEyZDg2YjQ3N2Q0OTc5YjFkX187ISFDVFJOS0E5d01nMEFSYnchZ3dNeEZ1c2Znb2c0UmQw
Wmc5bnJON3phZTNBd2VpbWt3Mm1sMktfWnhXUGNOVGVuazlpazdURDdzeEpYa1p2MklhaFNhWnp0
VENFbGc5ODJFZWcyem1GaCTCoA0KPiAgDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1
bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9w
bGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWMuYyB8IDQxDQo+ID4gKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4gPiBpbmRleCA1MmU1ZDM2YWE5MTIuLjI1
NDY0OTI0MGIzNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2RlYy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWMuYw0KPiA+IEBAIC0zNSw2ICszNSw0
NCBAQCBtdGtfdmRlY19maW5kX2Zvcm1hdChzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQo+ID4gIAly
ZXR1cm4gTlVMTDsNCj4gPiAgfQ0KPiA+ICANCj4gPiArc3RhdGljIGJvb2wgbXRrX3ZkZWNfZ2V0
X2NhcF9mbXQoc3RydWN0IG10a192Y29kZWNfY3R4ICpjdHgsIGludA0KPiA+IGZvcm1hdF9pbmRl
eCkNCj4gPiArew0KPiA+ICsJY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhICpkZWNf
cGRhdGEgPSBjdHgtPmRldi0NCj4gPiA+dmRlY19wZGF0YTsNCj4gPiArCWNvbnN0IHN0cnVjdCBt
dGtfdmlkZW9fZm10ICpmbXQ7DQo+ID4gKwlzdHJ1Y3QgbXRrX3FfZGF0YSAqcV9kYXRhOw0KPiA+
ICsJaW50IG51bV9mcmFtZV9jb3VudCA9IDAsIGk7DQo+ID4gKwlib29sIHJldCA9IHRydWU7DQo+
ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8ICpkZWNfcGRhdGEtPm51bV9mb3JtYXRzOyBpKysp
IHsNCj4gPiArCQlpZiAoZGVjX3BkYXRhLT52ZGVjX2Zvcm1hdHNbaV0udHlwZSAhPSBNVEtfRk1U
X0ZSQU1FKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArDQo+ID4gKwkJbnVtX2ZyYW1lX2NvdW50
Kys7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKG51bV9mcmFtZV9jb3VudCA9PSAxKQ0KPiA+
ICsJCXJldHVybiB0cnVlOw0KPiA+ICsNCj4gPiArCWZtdCA9ICZkZWNfcGRhdGEtPnZkZWNfZm9y
bWF0c1tmb3JtYXRfaW5kZXhdOw0KPiA+ICsJcV9kYXRhID0gJmN0eC0+cV9kYXRhW01US19RX0RB
VEFfU1JDXTsNCj4gPiArCXN3aXRjaCAocV9kYXRhLT5mbXQtPmZvdXJjYykgew0KPiA+ICsJY2Fz
ZSBWNEwyX1BJWF9GTVRfVlA4X0ZSQU1FOg0KPiA+ICsJCWlmIChmbXQtPmZvdXJjYyA9PSBWNEwy
X1BJWF9GTVRfTU0yMSkNCj4gPiArCQkJcmV0ID0gdHJ1ZTsNCj4gPiArCQlicmVhazsNCj4gPiAr
CWNhc2UgVjRMMl9QSVhfRk1UX0gyNjRfU0xJQ0U6DQo+ID4gKwljYXNlIFY0TDJfUElYX0ZNVF9W
UDlfRlJBTUU6DQo+ID4gKwkJaWYgKGZtdC0+Zm91cmNjID09IFY0TDJfUElYX0ZNVF9NTTIxKQ0K
PiA+ICsJCQlyZXQgPSBmYWxzZTsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1bHQ6DQo+ID4g
KwkJcmV0ID0gdHJ1ZTsNCj4gPiArCQlicmVhazsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJcmV0
dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHN0cnVjdCBtdGtfcV9kYXRhICpt
dGtfdmRlY19nZXRfcV9kYXRhKHN0cnVjdA0KPiA+IG10a192Y29kZWNfY3R4ICpjdHgsDQo+ID4g
IAkJCQkJICAgICAgZW51bSB2NGwyX2J1Zl90eXBlIHR5cGUpDQo+ID4gIHsNCj4gPiBAQCAtNTY2
LDYgKzYwNCw5IEBAIHN0YXRpYyBpbnQgdmlkaW9jX2VudW1fZm10KHN0cnVjdCB2NGwyX2ZtdGRl
c2MNCj4gPiAqZiwgdm9pZCAqcHJpdiwNCj4gPiAgCQkgICAgZGVjX3BkYXRhLT52ZGVjX2Zvcm1h
dHNbaV0udHlwZSAhPSBNVEtfRk1UX0ZSQU1FKQ0KPiA+ICAJCQljb250aW51ZTsNCj4gPiAgDQo+
ID4gKwkJaWYgKCFvdXRwdXRfcXVldWUgJiYgIW10a192ZGVjX2dldF9jYXBfZm10KGN0eCwgaSkp
DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsNCj4gPiAgCQlpZiAoaiA9PSBmLT5pbmRleCkNCj4g
PiAgCQkJYnJlYWs7DQo+ID4gIAkJKytqOw0KPiA+IC0tIA0KPiA+IDIuMTguMA0KPiA+IA0KPiA+
IA0KPiANCj4gDQo=
