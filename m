Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203DE7C6483
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 07:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABA510E40B;
	Thu, 12 Oct 2023 05:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B10910E40B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 05:17:31 +0000 (UTC)
X-UUID: a25cb2be68be11eea33bb35ae8d461a2-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=j+rBYebrLsMfI64ah5cXBbvg362J7iwNqIqdMOEdPIs=; 
 b=ev9KelgWgOp02yNyW7BliFa8mwrE/S4H1wDjZPPY2vB1o/y2njzHSNF7fox9eMIb5AEdXdbRSqiDc/wHZklkwgv4uuo7NZxDjhvt0AP40CHHT+/DQlfcz/YKpnotUxH0HrQB9CH6r4+PEyfx1JDVEcFTlUbTjIiGR2p0Wpf7R+s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:74f6402b-3f3c-4e2c-92ab-5f7a3bd7f12a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:1066d6bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a25cb2be68be11eea33bb35ae8d461a2-20231012
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 456256653; Thu, 12 Oct 2023 13:17:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 13:17:25 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 13:17:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLTRd5eBo0cX3wc5htkRlECaKtNm5YEeXhP1xT/EgK1pcY+X86miuoXe6c8my/h2y6sFpjKn/AdsBhp6+jr8Gqqd9gBaDHvXF/JhWe3kNv6z18xOZgOjjp9ReQyn+V1DMS9MtzCXCtwZz7YbK8lMXQ6ox1eT28p3tX4U/KbF+5FS0s+6C99wqV7SGMh4vBQ1+arMl73XwvKp/dSn33JgIa1H6i8i27MLIio59nipPiLMvKfL6BOX//zopCNEMOsAodZyMEyuY8ZEYqwzD5Fw53Zw700vm+JSBkZxyLkGkDRqrk/nU5xsxmQ8VhzKQeJl5n1iU4O8XThZebashDoQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jerYkehZBIvpYo4s0IlAlBnbMEXk/rrEW2o8ZCISml4=;
 b=T2Ibq2kGIDPAgVE6kCD996ks5AfA4vAKd4ayHksoUBoMWVywdzXVRZ/SLHsMvU7NdY+PGLy2DbTnwkhd/yEJbQXMixsdZhjn843PZ3KxnI6nh2wDGkxgdY6N5NBcF37NUAxDu4q5zITVCRXOgCzX7wxGGlSu/j4RWI9y23GfUMBt5gj59HrzQl2yIgDAwHPeUaZqZtuIus+JjgsqNy+JgdO/oFGIWxHoNJXYo1EwxivDHFKWdUx/KbLpuxPdQNL1gi1VH9/WP2TvcGyEUKkEOe81AljAh1Xs0zYWeKnTW2JqSUJKcCzXxZf/pCDTvIwg8s99U/lTZ3Vib7o/9xLQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jerYkehZBIvpYo4s0IlAlBnbMEXk/rrEW2o8ZCISml4=;
 b=DAJWvXZ9SVMTEzhvIqz1dwKVreo8WxdSjG7W1jd43In7S1uMOgN75JpWe7KNbYEcZeWzNkaNkyWQp51XzjwGiipShsLCZcXqsY0oRZNbCh6DhcGJdDTMgvcFE6ifh0GVjyenMVIrqKi+XyZG81GydN5dcu3sHb/F01w4v47g9Nw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB5230.apcprd03.prod.outlook.com (2603:1096:400:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 05:17:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6863.041; Thu, 12 Oct 2023
 05:17:21 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v10 05/16] drm/mediatek: gamma: Enable the Gamma LUT table
 only after programming
Thread-Topic: [PATCH v10 05/16] drm/mediatek: gamma: Enable the Gamma LUT
 table only after programming
Thread-Index: AQHZxqVqGAVQQ2xYIU6UDXHUn+Lnj7BGCXWA
Date: Thu, 12 Oct 2023 05:17:21 +0000
Message-ID: <33d3c9879a8d7728276deec4e5bf27c4e624f14e.camel@mediatek.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-6-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB5230:EE_
x-ms-office365-filtering-correlation-id: 5866ca66-c998-4d59-dc36-08dbcae2835a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6c+tgdb2sfSL9pVhwzYU4PWjuRwk2MvxHz6msNiEpG5NvQSoQAaxo9/Ao6/0OYbf1d24aIFhm74ph1T8++DQv4+1hFX+3qhG9/4iZeu6WrCVoyDTgmMsmPwYa72Zd1CNwiTM7p7hbtYr0V9fUxcTFvVccfLq4GfLiC/wp7QF/fKjbmh8chtbpaxq8NmT3rtkrJv7C+B2snSlQ4JQsDxxeC+RgZZWUKOjMVSUZ35d9F1ZMogH/viDmyb76oqZG1jStdor0Srhw/lmxD3NIf9LgxrU6t7bUrGblCio3fOAY4jVm92CohuPuhQf9y88hcxTN7mmdDj1yj3md59PVsxdKjRd+VoefVLlrs3V2kJbv82Ui/vrBNVHtnWJ7pnCJ2mLnoBfIHe0vbO2Qw0Js2Y5W0EXE3SFJeE9hN5DOKU+D7b33KIKmbcY1w3fCeNMHy0Wr8rwOOa/XALAviAjoPaAwY5bq10TKSgJ95dRUAoXS+uJYM2rv6DBzNrlPBaWRjkgfcLZB/nsOWINNsKxoZpnLpoWWgEKYAvSw7wi/OoTuz8eVJjmIw3xxhz1XIzOh6aDWlS1ExE9Qg4n49Lz8kmMjiNng7ZLUwJS7K3ruQKPUm2Hil1bePXiagVd/uPujXw7TLcr8817VK96hG471JNGct018mtczAOmnMcVjZbiJLU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(110136005)(6486002)(83380400001)(316002)(41300700001)(66556008)(66476007)(54906003)(66446008)(64756008)(66946007)(5660300002)(71200400001)(8936002)(76116006)(8676002)(4326008)(7416002)(6506007)(2906002)(2616005)(36756003)(26005)(85182001)(6512007)(86362001)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUxibkRLRGg0bkM1QytvWWRCRGRZQUJxSFNCV1ROK3o3amtaK2VUOUFlaU9Y?=
 =?utf-8?B?Y2VQQ2NzR0grY1JvNW5vNkxkVjgxRTRWS3IzNFFLdEtEQUpjaU8wUUt6WW9Y?=
 =?utf-8?B?WUlJWWF3MXVnbmVEdjhLK2ZvUHlvUStXUWlYblFJd0JQWVlheUp3Z1NOQ1hp?=
 =?utf-8?B?MW1mRWVsVzkzZitLbWZpRUFKZVliaUZtZ0NjaVVBSlhxcTZUM2Y1Qk1OZ1ZV?=
 =?utf-8?B?Ny9CMVMxVXFuUnRGQTIwdHQzZjhYNmo1QTNRZ1JvZVFLVnA1Q0ZCWVkzaXNh?=
 =?utf-8?B?UmtuZHBoYnpIT1cweTF4Y3ExQU1kUjRKV2xEb0M1eCttenNoUzdhZWVXM21H?=
 =?utf-8?B?cUNvemtEK2M1Uy9ZN3FWL1d0VG1QNFpsMTd6Q2FWMnlVMUR6aW83Mmx5cnFs?=
 =?utf-8?B?USs4a0RDWFRSdHFqMmVacEN6OHNUSndRK1R6QmFDSkdObVNjWUpVTW5UNXo5?=
 =?utf-8?B?UlNJYUlQWEZSanpnRzV3WUQvV0tGQkw3Mk5TTGUrUE1QR05tdFlCSDU1Y0lR?=
 =?utf-8?B?V1R6MTJaZDFFOHdHT0NEWWhUWXp1dWVMRlNDdWYrQXdROU9qQTBDSDZMZzBk?=
 =?utf-8?B?R2pYclM3T0ZIVFVEUjdkQWZ3LzVBRmU3Y0ZEeDl4OU1VWWc0T2EzdktrQndS?=
 =?utf-8?B?RkZEN08wNDZFQTgwVFlmVEV2eW1ZeEhwYklpSEtzbmV1dkEyS3FHZzJmYnZx?=
 =?utf-8?B?RkVndTdiVStvdDg2MVFYUndKRFNTUlhONFpnUnRnZ0lPYWFoOTNUWmdEZUFB?=
 =?utf-8?B?TEpOTElYYWJ5Y3BOajM3aGJSU1lEMVhmVWIwd2hOeE1aSTVFMHRoMkticVBF?=
 =?utf-8?B?SjdqbzBqKytldlpZZWhiYmZkSEp0VkViR0Q1dUVYUG01dDVpaEJLcmQxdlhB?=
 =?utf-8?B?NzBWTExUT0FDZ2F6Q1JEWnFzOGxRL3d1Q2JYeWZIMmM5MGN3Q3VPWTdNY1BS?=
 =?utf-8?B?NXZGdWJPOURaRUN2aTdaN1laWWZpRDRTRDFyZ0tMaXRlTlBqVFI1aG1seU56?=
 =?utf-8?B?SWordXMxTHE4S24wNjQxWk5YNXVyTTVxdkxjMEx3THlOUUs1V2dvYmxBYkhk?=
 =?utf-8?B?Rkc5bEJTQTQvQlBOR1BPYkRlRWlWZG1OSUR4ZENDdHFsTmNxcXpjZ1JhNEVZ?=
 =?utf-8?B?VzlZNWNJbWFKRXp2Z0pDQXd5cjliUTJiMnkveFloUit3dFdmajBoRXdqSEdV?=
 =?utf-8?B?a0x3ZG5oOWdLS0lPMzMvdVlHejJYR1FUSE9zYlpTN3pXa2xscU1JNkY0NktH?=
 =?utf-8?B?bUxOU29rajN5N2xDcDNpbkJ6YU40cUJ4allBb2srcjMvbk5CeXB5QlBQQkxQ?=
 =?utf-8?B?ZEl3bFY1OW9RVlZpeE5Rd3pXNklwRXRmR1poaEh4RDdCQ0pBR3hIdEN6NE1G?=
 =?utf-8?B?a0l4c3FuOEFJNUV3NXVYM25RclpKVUJMNThLamFNcGFJS2FQR0dNYWJ4ZU50?=
 =?utf-8?B?MTBFc3RkcGVmQ1M2eXArcE1BeVlUQzZHRVpZYVNjTENzenBPaDByY1JldEFR?=
 =?utf-8?B?dWdYeTZZOWwrVy9sVlF5UmJjY0E2MWNrQytTSHFxY0UybHF6TU10WDQrN3or?=
 =?utf-8?B?dlRsWFhWZ2JraXVHSWNwTThBaFZ2YTZabkNsYVlNYkJ2a1pXMkFJeUpWTDJ4?=
 =?utf-8?B?SkRHbkNZV1Y4bW0yZS9RZ1BDdy9LclUzSEhSWTZWU1JSR05MYnUyRTZFbURV?=
 =?utf-8?B?K1ZZN2EwdUxFUll6aHRmbTZ5VUV6bUsyay9Mai8yZkRNSUEwUEVQS1VBMVNY?=
 =?utf-8?B?RUp0blNTNGFZU0RzTkVMektkMVBrakx2WGxSOUNpYUJtVFFXZFpldjVTeDdy?=
 =?utf-8?B?UUJudDFjVnNXUGtQNHFNcDJTRzQyUWo1ZUU0YWlHMUlMVnRyUlVaZGpKSXd0?=
 =?utf-8?B?eVA5djVFTmU0WnZSRFlOVnA5TC83emVuQUdMbTg3QTdyNVdETS9ENk9TWDEx?=
 =?utf-8?B?L0hyVVpQQ295SVM0b2pYYlFPTEJSOVppVmd4MzdTRU5YREhYSG43emZjYytH?=
 =?utf-8?B?MklOOWM3amV4OW5yVFQ4a2dPQkNLSVB5dkJ4QkxEbVE1aStuVGcweEFqcUJi?=
 =?utf-8?B?cDgyTnIrSU5pMGhpQzhUbWFUdjY5elRHdU1XY3picGx1TzFRMEpKdFBoRTFU?=
 =?utf-8?Q?gg/IoEFzvr9OJl4wQFM5qKHQO?=
Content-ID: <B251BA6059E1DE43BC71661130AEE853@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5866ca66-c998-4d59-dc36-08dbcae2835a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 05:17:21.8074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGRVKGTQ1rtSTj9w/P29QfPk7DmNBP5krZbzyVcr7++pVStsE6CswWOjMD5biFJN6d3YfdaLiPeixccibut4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5230
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.677600-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfsNtKv7cnNXnSa1MaKuob8PC/ExpXrHizxFDR0AKGX+XKXN
 sYCQGOi67ovhnb4VsQvbOVg8lnbtE4gomWTi+6GdHFAJdqqxfclQCOsAlaxN78TeCtA1yktYci7
 sFt/hNe2jmrD+IUq29hYchAzpNtsTEXiXWg39uY66kMgL3jbYOjuvYa1v2IFhWltirZ/iPP6zNk
 EULbvfREWG0od6ar2iszvQK8Ju7xBIlhd33jH/gHV7tdtvoibafS0Ip2eEHnylPA9G9KhcvbLn+
 0Vm71Lcq7rFUcuGp/EgBwKKRHe+rwWxaCL8GLCB932jIBy59R0JT6/M9hizPmSNYLMQox8BtUNd
 iGqGEb0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.677600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1E2C0928F63809F3C855133BBBAE430AABFE6A88B1C9D83797D971B4304E48E32000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1902825390.1532995463"
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
Cc: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_1902825390.1532995463
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0wOC0wNCYjMzI7
YXQmIzMyOzA5OjI4JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7TW92ZSYjMzI7dGhlJiMzMjt3cml0ZSYjMzI7dG8m
IzMyO0RJU1BfR0FNTUFfQ0ZHJiMzMjt0byYjMzI7ZW5hYmxlJiMzMjt0aGUmIzMyO0dhbW1hJiMz
MjtMVVQmIzMyO3RvJiMzMjthZnRlcg0KJmd0OyYjMzI7cHJvZ3JhbW1pbmcmIzMyO3RoZSYjMzI7
YWN0dWFsJiMzMjt0YWJsZSYjMzI7dG8mIzMyO2F2b2lkJiMzMjtwb3RlbnRpYWwmIzMyO3Zpc3Vh
bCYjMzI7Z2xpdGNoZXMNCiZndDsmIzMyO2R1cmluZw0KJmd0OyYjMzI7dGFibGUmIzMyO21vZGlm
aWNhdGlvbi4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Tm90ZToNCiZndDsmIzMyO0dBTU1BJiMzMjtz
aG91bGQmIzMyO2dldCYjMzI7ZW5hYmxlZCYjMzI7aW4mIzMyO2JldHdlZW4mIzMyO3ZibGFua3Ms
JiMzMjtidXQmIzMyO3RoaXMmIzMyO3JlcXVpcmVzJiMzMjttYW55DQomZ3Q7JiMzMjtlZmZvcnRz
JiMzMjtpbiYjMzI7b3JkZXImIzMyO3RvJiMzMjttYWtlJiMzMjt0aGlzJiMzMjtoYXBwZW4sJiMz
MjthcyYjMzI7dGhhdCYjMzI7cmVxdWlyZXMmIzMyO21pZ3JhdGluZyYjMzI7YWxsDQomZ3Q7JiMz
MjtvZiYjMzI7dGhlJiMzMjt3cml0ZXMmIzMyO3RvJiMzMjttYWtlJiMzMjt1c2UmIzMyO29mJiMz
MjtDTURRJiMzMjtpbnN0ZWFkJiMzMjtvZiYjMzI7Y3B1JiMzMjt3cml0ZXMmIzMyO2FuZCYjMzI7
dGhhdCYjMzk7cw0KJmd0OyYjMzI7bm90JiMzMjt0cml2aWFsLiYjMzI7Rm9yJiMzMjt0aGlzJiMz
MjtyZWFzb24sJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7b25seSYjMzI7bW92ZXMmIzMyO3RoZSYj
MzI7TFVUJiMzMjtlbmFibGUuDQomZ3Q7JiMzMjtUaGUmIzMyO0NNRFEmIzMyO3Jld29yayYjMzI7
d2lsbCYjMzI7Y29tZSYjMzI7YXQmIzMyO2EmIzMyO2xhdGVyJiMzMjt0aW1lLg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMz
MjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xs
YWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMy
OyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6
JiMzMjtBbGV4YW5kcmUmIzMyO01lcmduYXQmIzMyOyZsdDthbWVyZ25hdEBiYXlsaWJyZS5jb20m
Z3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX2dhbW1hLmMmIzMyO3wmIzMyOzEzJiMzMjsrKysrKysrKy0tLS0tDQomZ3Q7JiMz
MjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs4JiMzMjtpbnNlcnRpb25zKCspLCYj
MzI7NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jDQomZ3Q7JiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jDQomZ3Q7JiMzMjtp
bmRleCYjMzI7ZmQ2YTc1YTY0YTlmLi4xOGIxMDJiZWYzNzAmIzMyOzEwMDY0NA0KJmd0OyYjMzI7
LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jDQomZ3Q7
JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMN
CiZndDsmIzMyO0BAJiMzMjstNjgsMTImIzMyOys2OCwxMiYjMzI7QEAmIzMyO3Vuc2lnbmVkJiMz
MjtpbnQmIzMyO210a19nYW1tYV9nZXRfbHV0X3NpemUoc3RydWN0JiMzMjtkZXZpY2UNCiZndDsm
IzMyOypkZXYpDQomZ3Q7JiMzMjsmIzMyO3ZvaWQmIzMyO210a19nYW1tYV9zZXRfY29tbW9uKHN0
cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dm9pZCYjMzI7X19pb21lbSYjMzI7KnJlZ3Ms
DQomZ3Q7JiMzMjtzdHJ1Y3QmIzMyO2RybV9jcnRjX3N0YXRlJiMzMjsqc3RhdGUpDQomZ3Q7JiMz
MjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfZGlzcF9nYW1tYSYjMzI7Kmdh
bW1hOw0KJmd0OyYjMzI7LXVuc2lnbmVkJiMzMjtpbnQmIzMyO2ksJiMzMjtyZWc7DQomZ3Q7JiMz
MjsrdW5zaWduZWQmIzMyO2ludCYjMzI7aTsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtkcm1f
Y29sb3JfbHV0JiMzMjsqbHV0Ow0KJmd0OyYjMzI7JiMzMjt2b2lkJiMzMjtfX2lvbWVtJiMzMjsq
bHV0X2Jhc2U7DQomZ3Q7JiMzMjsmIzMyO2Jvb2wmIzMyO2x1dF9kaWZmOw0KJmd0OyYjMzI7JiMz
Mjt1MTYmIzMyO2x1dF9zaXplOw0KJmd0OyYjMzI7LXUzMiYjMzI7d29yZDsNCiZndDsmIzMyOyt1
MzImIzMyO2NmZ192YWwsJiMzMjt3b3JkOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7
LyomIzMyO0lmJiMzMjt0aGVyZSYjMzk7cyYjMzI7bm8mIzMyO2dhbW1hJiMzMjtsdXQmIzMyO3Ro
ZXJlJiMzOTtzJiMzMjtub3RoaW5nJiMzMjt0byYjMzI7ZG8mIzMyO2hlcmUuJiMzMjsqLw0KJmd0
OyYjMzI7JiMzMjtpZiYjMzI7KCFzdGF0ZS0mZ3Q7Z2FtbWFfbHV0KQ0KJmd0OyYjMzI7QEAmIzMy
Oy05MCw5JiMzMjsrOTAsNyYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19nYW1tYV9zZXRfY29tbW9u
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dm9pZA0KJmd0OyYjMzI7X19pb21lbSYj
MzI7KnJlZ3MsJiMzMjtzdHJ1Y3QmIzMyO2RybV9jcnQNCiZndDsmIzMyOyYjMzI7bHV0X3NpemUm
IzMyOz0mIzMyO0xVVF9TSVpFX0RFRkFVTFQ7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYj
MzI7DQomZ3Q7JiMzMjstcmVnJiMzMjs9JiMzMjtyZWFkbChyZWdzJiMzMjsrJiMzMjtESVNQX0dB
TU1BX0NGRyk7DQomZ3Q7JiMzMjstcmVnJiMzMjs9JiMzMjtyZWcmIzMyO3wmIzMyO0dBTU1BX0xV
VF9FTjsNCiZndDsmIzMyOy13cml0ZWwocmVnLCYjMzI7cmVncyYjMzI7KyYjMzI7RElTUF9HQU1N
QV9DRkcpOw0KJmd0OyYjMzI7K2NmZ192YWwmIzMyOz0mIzMyO3JlYWRsKHJlZ3MmIzMyOysmIzMy
O0RJU1BfR0FNTUFfQ0ZHKTsNCg0KTW92ZSYjMzI7dGhpcyYjMzI7dG8mIzMyO2JvdHRvbSYjMzI7
b2YmIzMyO3RoaXMmIzMyO2Z1bmN0aW9uLiYjMzI7TW92ZSYjMzI7aGVyZSYjMzI7aW4mIzMyO3Ro
ZSYjMzI7cGF0Y2gmIzMyO3doaWNoDQpuZWVkLg0KDQpBZnRlciYjMzI7dGhpcyYjMzI7bW9kaWZp
Y2F0aW9uLA0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlh
dGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7JiMzMjtsdXRfYmFzZSYjMzI7PSYjMzI7cmVncyYjMzI7
KyYjMzI7RElTUF9HQU1NQV9MVVQ7DQomZ3Q7JiMzMjsmIzMyO2x1dCYjMzI7PSYjMzI7KHN0cnVj
dCYjMzI7ZHJtX2NvbG9yX2x1dCYjMzI7KilzdGF0ZS0mZ3Q7Z2FtbWFfbHV0LSZndDtkYXRhOw0K
Jmd0OyYjMzI7JiMzMjtmb3ImIzMyOyhpJiMzMjs9JiMzMjswOyYjMzI7aSYjMzI7Jmx0OyYjMzI7
bHV0X3NpemU7JiMzMjtpKyspJiMzMjt7DQomZ3Q7JiMzMjtAQCYjMzI7LTEyMiw2JiMzMjsrMTIw
LDExJiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX2dhbW1hX3NldF9jb21tb24oc3RydWN0JiMzMjtk
ZXZpY2UmIzMyOypkZXYsDQomZ3Q7JiMzMjt2b2lkJiMzMjtfX2lvbWVtJiMzMjsqcmVncywmIzMy
O3N0cnVjdCYjMzI7ZHJtX2NydA0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyO3dyaXRl
bCh3b3JkLCYjMzI7KGx1dF9iYXNlJiMzMjsrJiMzMjtpJiMzMjsqJiMzMjs0KSk7DQomZ3Q7JiMz
MjsmIzMyO30NCiZndDsmIzMyOysNCiZndDsmIzMyOysvKiYjMzI7RW5hYmxlJiMzMjt0aGUmIzMy
O2dhbW1hJiMzMjt0YWJsZSYjMzI7Ki8NCiZndDsmIzMyOytjZmdfdmFsJiMzMjs9JiMzMjtjZmdf
dmFsJiMzMjt8JiMzMjtHQU1NQV9MVVRfRU47DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrd3JpdGVs
KGNmZ192YWwsJiMzMjtyZWdzJiMzMjsrJiMzMjtESVNQX0dBTU1BX0NGRyk7DQomZ3Q7JiMzMjsm
IzMyO30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3ZvaWQmIzMyO210a19nYW1tYV9z
ZXQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjtzdHJ1Y3QmIzMyO2RybV9jcnRjX3N0
YXRlJiMzMjsqc3RhdGUpDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBl
LW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Ns
b3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5r
IHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_1902825390.1532995463
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gRnJpLCAyMDIzLTA4LTA0IGF0IDA5OjI4ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gTW92ZSB0aGUgd3JpdGUgdG8gRElTUF9HQU1N
QV9DRkcgdG8gZW5hYmxlIHRoZSBHYW1tYSBMVVQgdG8gYWZ0ZXINCj4gcHJvZ3JhbW1pbmcgdGhl
IGFjdHVhbCB0YWJsZSB0byBhdm9pZCBwb3RlbnRpYWwgdmlzdWFsIGdsaXRjaGVzDQo+IGR1cmlu
Zw0KPiB0YWJsZSBtb2RpZmljYXRpb24uDQo+IA0KPiBOb3RlOg0KPiBHQU1NQSBzaG91bGQgZ2V0
IGVuYWJsZWQgaW4gYmV0d2VlbiB2YmxhbmtzLCBidXQgdGhpcyByZXF1aXJlcyBtYW55DQo+IGVm
Zm9ydHMgaW4gb3JkZXIgdG8gbWFrZSB0aGlzIGhhcHBlbiwgYXMgdGhhdCByZXF1aXJlcyBtaWdy
YXRpbmcgYWxsDQo+IG9mIHRoZSB3cml0ZXMgdG8gbWFrZSB1c2Ugb2YgQ01EUSBpbnN0ZWFkIG9m
IGNwdSB3cml0ZXMgYW5kIHRoYXQncw0KPiBub3QgdHJpdmlhbC4gRm9yIHRoaXMgcmVhc29uLCB0
aGlzIHBhdGNoIG9ubHkgbW92ZXMgdGhlIExVVCBlbmFibGUuDQo+IFRoZSBDTURRIHJld29yayB3
aWxsIGNvbWUgYXQgYSBsYXRlciB0aW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+DQo+IFJldmlld2VkLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20+DQo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgTWVyZ25hdCA8YW1lcmduYXRAYmF5bGli
cmUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1t
YS5jIHwgMTMgKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9nYW1tYS5jDQo+IGluZGV4IGZkNmE3NWE2NGE5Zi4uMThiMTAyYmVmMzcwIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KPiBAQCAtNjgsMTIg
KzY4LDEyIEBAIHVuc2lnbmVkIGludCBtdGtfZ2FtbWFfZ2V0X2x1dF9zaXplKHN0cnVjdCBkZXZp
Y2UNCj4gKmRldikNCj4gIHZvaWQgbXRrX2dhbW1hX3NldF9jb21tb24oc3RydWN0IGRldmljZSAq
ZGV2LCB2b2lkIF9faW9tZW0gKnJlZ3MsDQo+IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUp
DQo+ICB7DQo+ICAJc3RydWN0IG10a19kaXNwX2dhbW1hICpnYW1tYTsNCj4gLQl1bnNpZ25lZCBp
bnQgaSwgcmVnOw0KPiArCXVuc2lnbmVkIGludCBpOw0KPiAgCXN0cnVjdCBkcm1fY29sb3JfbHV0
ICpsdXQ7DQo+ICAJdm9pZCBfX2lvbWVtICpsdXRfYmFzZTsNCj4gIAlib29sIGx1dF9kaWZmOw0K
PiAgCXUxNiBsdXRfc2l6ZTsNCj4gLQl1MzIgd29yZDsNCj4gKwl1MzIgY2ZnX3ZhbCwgd29yZDsN
Cj4gIA0KPiAgCS8qIElmIHRoZXJlJ3Mgbm8gZ2FtbWEgbHV0IHRoZXJlJ3Mgbm90aGluZyB0byBk
byBoZXJlLiAqLw0KPiAgCWlmICghc3RhdGUtPmdhbW1hX2x1dCkNCj4gQEAgLTkwLDkgKzkwLDcg
QEAgdm9pZCBtdGtfZ2FtbWFfc2V0X2NvbW1vbihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQNCj4g
X19pb21lbSAqcmVncywgc3RydWN0IGRybV9jcnQNCj4gIAkJbHV0X3NpemUgPSBMVVRfU0laRV9E
RUZBVUxUOw0KPiAgCX0NCj4gIA0KPiAtCXJlZyA9IHJlYWRsKHJlZ3MgKyBESVNQX0dBTU1BX0NG
Ryk7DQo+IC0JcmVnID0gcmVnIHwgR0FNTUFfTFVUX0VOOw0KPiAtCXdyaXRlbChyZWcsIHJlZ3Mg
KyBESVNQX0dBTU1BX0NGRyk7DQo+ICsJY2ZnX3ZhbCA9IHJlYWRsKHJlZ3MgKyBESVNQX0dBTU1B
X0NGRyk7DQoNCk1vdmUgdGhpcyB0byBib3R0b20gb2YgdGhpcyBmdW5jdGlvbi4gTW92ZSBoZXJl
IGluIHRoZSBwYXRjaCB3aGljaA0KbmVlZC4NCg0KQWZ0ZXIgdGhpcyBtb2RpZmljYXRpb24sDQoN
ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+ICAJbHV0X2Jhc2Ug
PSByZWdzICsgRElTUF9HQU1NQV9MVVQ7DQo+ICAJbHV0ID0gKHN0cnVjdCBkcm1fY29sb3JfbHV0
ICopc3RhdGUtPmdhbW1hX2x1dC0+ZGF0YTsNCj4gIAlmb3IgKGkgPSAwOyBpIDwgbHV0X3NpemU7
IGkrKykgew0KPiBAQCAtMTIyLDYgKzEyMCwxMSBAQCB2b2lkIG10a19nYW1tYV9zZXRfY29tbW9u
KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gdm9pZCBfX2lvbWVtICpyZWdzLCBzdHJ1Y3QgZHJtX2Ny
dA0KPiAgCQl9DQo+ICAJCXdyaXRlbCh3b3JkLCAobHV0X2Jhc2UgKyBpICogNCkpOw0KPiAgCX0N
Cj4gKw0KPiArCS8qIEVuYWJsZSB0aGUgZ2FtbWEgdGFibGUgKi8NCj4gKwljZmdfdmFsID0gY2Zn
X3ZhbCB8IEdBTU1BX0xVVF9FTjsNCj4gKw0KPiArCXdyaXRlbChjZmdfdmFsLCByZWdzICsgRElT
UF9HQU1NQV9DRkcpOw0KPiAgfQ0KPiAgDQo+ICB2b2lkIG10a19nYW1tYV9zZXQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKQ0K

--__=_Part_Boundary_008_1902825390.1532995463--

