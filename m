Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4017DC783
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C09510E41A;
	Tue, 31 Oct 2023 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B33110E41A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:44:04 +0000 (UTC)
X-UUID: 4097a5d677c111ee8051498923ad61e6-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xeAhK1NgcoSm2A+vnBdjc7zacG1krvyQr8gH/P1Nmws=; 
 b=b+JbZ3J36QNWpguhkGvUsLFBxHbS/7cB29zLN3mQ8A6EQERf40MMOc1symKB7dDRGoBbytWziHVqhCyen8ckAuBs48NSsbO0QTEkgjh4FrGroJTFSMjMtnBQ4dWE/N2rO+FN4WnKb1JD42F32a1ZscRCD0jbuMo9JkG1E8yAzQg=;
X-CID-CACHE: Type:Local,Time:202310311537+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:146529d6-fceb-470c-baa8-4d3b0f6cc248, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:764d1872-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4097a5d677c111ee8051498923ad61e6-20231031
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1332348929; Tue, 31 Oct 2023 15:43:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 15:43:57 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 15:43:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+hKYV4y2Q04RNvBmvCWLaTFnyk+yBcbwiSgee7A0Pmuf3B1PU4E2tJITeErnyOcntdTT4I2SMuTxzrU98wbOBdhpPl9M8XotU1689xiBensdnFPtxKJsTlU0EKSkpW2AAZ75XBhTTx36dEz5+pXYJ57tjQ/sf3ZT9gZG4Vcd7cL3Og/PMkJpRcyaps97aZzOi6dTsaJKdP8FCXytS+dJQRk/r6dP0jnp3f9mfwUP/Glie2G17lzSfR8EMyeOwE4febAi2yObmMC8FiZGbp48G8D5903vx798eIi6wFWfbuYLQ0u+rKNTrqTmi1Kdk0a0xYRXiSGFp77VuINq9C0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeAhK1NgcoSm2A+vnBdjc7zacG1krvyQr8gH/P1Nmws=;
 b=cjJQGmC7kcNVdVqZ08jjbIxwDqJIpaAIcAty691ffAJ5bch/+PMrQJ0VNf+1dSs+dUITlRne5Z92Ze6ugkiJP5RgL9oy8eOnxQ3UbDJmlK8DFkoTZlcu+XkrrMdOx57TgjRp/H/CGUfB/OErn5EQrPoigzkHFb7+Op5C+04pH6+Ec8drUYKfmXP94DNF1u1LL+VAXWInzPDZ7DIeLDIHsWE10p/OrlkVc3rqJETVwOt42Q4SAAh5BFIA0gK0nrofoe9HDokZrFzQtDngBqnb41gj85lvDVXUka4GeVddC+uhC9xa+hZyzRZ1Wvd8apOwNLv0tVTiVCB56GOX9/b+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeAhK1NgcoSm2A+vnBdjc7zacG1krvyQr8gH/P1Nmws=;
 b=Ib7b7Qq4aFo3OW+fOjzoHZpNhm59QlVvkznGdBFAeGOFy1LOwEog1Mncwh1LHgLFGTPJTODbG7/F+Lrna6g2yP5D6pvwlOBwRzsLWMJY8crac5A9uZ4VMXscOYKAyqWG9I3ohNrgYH7pTQGG0GzpaTn+DWiibmaLOSoj49X0M3c=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB5834.apcprd03.prod.outlook.com (2603:1096:820:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 07:43:23 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 07:43:23 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Topic: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Index: AQHaCxf9Uo9mK2d1NEuS6fN2fs5uo7Bit98AgADNyoA=
Date: Tue, 31 Oct 2023 07:43:23 +0000
Message-ID: <e321fd1aad5f695278297d79531370356d82657f.camel@mediatek.com>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-17-moudy.ho@mediatek.com>
 <169869400953.1994265.3434527810955780048.robh@kernel.org>
In-Reply-To: <169869400953.1994265.3434527810955780048.robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB5834:EE_
x-ms-office365-filtering-correlation-id: ea55793c-789e-4ced-4bdb-08dbd9e50fc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yXCL3teORpyXl5YSr/ZoLz79P3dUiNoCc7RlZ5jfxMXumTceU2BwviTs4wXvoqnHxegG6Op/cmh0tCbO+5DQMVhOqK5OgB0A8yc0zjqayqpYwBtnAa6UNASS+Xzh95hQn0C+ddfKN3FfCW/RtKFfGEmVzv3m0Ehdvb/ogyFOeQuRPFdocHcKAm6P4RNkfnqrLhJAiv4MiSPUmXiEl4TUVcYyagF8lyOJwSop2cNUwN4dsbGN73sXP2gAjVgtJZqbbS0ozra2Rhd0QBUuOTcuoLF3Nt/+M6nBuUPAYuQn+XtOjy0FZUj9eERstx5GAkASZAazUIvNkR1/20/32UVxrryLgdfQ5ILQ+yORDHFePcn15lgcWuSaOwplzYXFNbLktIYgjhSBVnnx2N6V8UO+GYurlbJzE7QawnLfFkfzStNxslhvR1CnAqvNN0FBNIh1CWaUNDpr98KSFdaUJ165RgxB+uS21T5sFlsWdb0iRc3iphkfJ+8xFKufsEXPhM0tO1ZtaWF4T757FGJy3I2DM2ZFhrWmfy7r6cKbzq4AVsTFex2sxkzLU8j7tbpfponmWcDjU6QiqPIykYdPPcEzfDsuDg5BhFVi1u7fM1J0yw/uKflX55lwyy7mIJwyEDrW62q1Ph9LuvZxX4NsPq6SWURY3yd0bMQuY9PE4B1I/gEHj/mwS3AEAI9/Ix904f7lMiuPpNKoqhvdPoHHNID9DNZusp4lqrzkrpzpNFnSFBk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799009)(451199024)(64100799003)(36756003)(85182001)(38070700009)(64756008)(54906003)(6916009)(316002)(66946007)(76116006)(66446008)(66476007)(66556008)(38100700002)(86362001)(122000001)(6486002)(83380400001)(478600001)(6506007)(2616005)(71200400001)(6512007)(26005)(4744005)(8936002)(4001150100001)(2906002)(41300700001)(7416002)(4326008)(5660300002)(8676002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDFaNGprR3ZiYUxqUUNNTGJyUGlMa08rY1RiZ3A2R1dzMEd1WFBZRHRvUTB5?=
 =?utf-8?B?N2JjYk9tclRKVkIrL0NsY3ZHRUhwdmZoVm1QemhFbEpVR2dnTGhlRVdDdEtV?=
 =?utf-8?B?bkNRNHNCNkh2cjRMZTNMWFNjVlVyak5hN09pQkN6eVYyZnY4bzlPc2UrRXBq?=
 =?utf-8?B?cW9DQ0NIMDQ2YlF4SEJPTkZyRHg0dnRURnVrTFR2S2gzQXZXakl0WlpGa3dr?=
 =?utf-8?B?VWUvK3AvdDl4b3cvL2VldGhhMjVLbmNZVlgvMkhhRnF4N2RhYmptTFU4ZU91?=
 =?utf-8?B?NEJ4WnAxZFV2a2VyM1VZY011SWZsNk5HS29idWtNbTdodCtuQlJGTUZ5TUk2?=
 =?utf-8?B?ejlicG5qbStNUmtSWEJ2LzJZYWFDeXgrOW9vQ1Zlc3BDc3p4eWQ0VDFiQW56?=
 =?utf-8?B?WVRRazVQU0pMN1BGL2lRcmxxZ2Y2bXpBbkxiVndRRklnQ0gvMzZZdE5YTkFp?=
 =?utf-8?B?ems2ZFB3QmF3WXgvV29XVC90NVRoMzdWY25NU3lVZ0E5VUtFck9aUlRkb0M2?=
 =?utf-8?B?RTkwZXp6aGwyMTFUdXRCYnlZZCtMYmxOYmZDNHkvK1p1STByNGkrd3hLUjBI?=
 =?utf-8?B?YWRtdk14MmFtQjJxTUU2aTZqYU1nVHJvUXlITVhZcnQvejhtbTBUaHllWUJI?=
 =?utf-8?B?c3RXYmc5T0owOWJ3NVVvd3FoS2tVdmhaL0hMMWFacTVacjBRV3BOVWxrRi84?=
 =?utf-8?B?TnNSajFaeVdWNU9lTzNISE52UlovMkEzZXdZQ2pxKzUxdFJTWXlTMUtwMHdG?=
 =?utf-8?B?ZkNOaE4yYjRKdS9abTdWeEJhTzc4SDJYbWJ4N0JnenpyWWdvRXJ3aEtJTlpm?=
 =?utf-8?B?V2RBZEEzRnRKeTlCVGk1eW1TakJQdG9JVER1b0hmZDdyNFJoSmVJUnBNZDla?=
 =?utf-8?B?UnJzaWc2THZkVERsMktjd2tYR2srdGVrRzU1SlpEZ1pZUTl2MUtzcUYwSXpj?=
 =?utf-8?B?NHBqaTdvRGtGU1VZNDNodElsUmN6bHpnQlpIZWVDR2paKzJkNUVJYTJzN2pP?=
 =?utf-8?B?alM4QnB1UzBEUk9xTXg1L2dvblgyZTV0OUJGNXora3lZK25oRnhTUzJ4bkxn?=
 =?utf-8?B?VGtGQXg2OFMzMkhmRlJiMHc5UTZZc1hvWE9zNFBidWFWR0tBQnNNeUU5OTJl?=
 =?utf-8?B?aUFQNk1xYUxDSDFNZVUxTVZmVm9ONHFyZWloRExhanJuQzRIVUZZaldhaHM1?=
 =?utf-8?B?UHVnbFZQY0FnQVdZSEp4d0JLblVabUE3M05PeWVWTENwNzJVdGp4eldSNGcw?=
 =?utf-8?B?WDBmM2RyOGk1K3h0ektqNkZTS1Y0OENiWUZiK0JDSDR1ZkpnUEl5U2ZzRjZ5?=
 =?utf-8?B?NnNBR3hSZ2hydU8rTTd3Wjdkelc1QzF3Mi9xK0R0Wm5NUkYwOC9Fb2s3dHBY?=
 =?utf-8?B?N2N4aStFTXZLalZ1NEFKTytDR3lkMTFmVGx4OVVYemFIMy82YjB5eFhhaWpX?=
 =?utf-8?B?MmpEK2Z1Sk9UdWZXSmFCbVl5ekZIRWdmVEsrcEkwMmJRSmVtWFkrS3UvbVVE?=
 =?utf-8?B?Nk5JZkEwMTB1RU9WdkEvNmVMTDJ5WGtYSkZzYnl3cWM5YVNvTGJqeFhhTjhW?=
 =?utf-8?B?YjVZeEpIS1lvZkVnY25xam9ndVR2ZTVDUzRIZ3RGRTM2OVk1RHFkL01VVEdR?=
 =?utf-8?B?QU1YUDRyMnAreWVNMjRzQWc0OG9uYkl3NVBVcmhZbjh3R3M3eGw1bEg0akFK?=
 =?utf-8?B?bFcyVDFFMVVYMzdrRy9oQmViRWJFY05Zd3JuVGwreTVjcnFrS2JqWW9RWUo3?=
 =?utf-8?B?dTVtVHM1dE1lY3dzRmtHYnhuVnJyY3dVTGR0WTVOTm92L1pka3BycitaV2FJ?=
 =?utf-8?B?Vno4dXZPNWJiRFpNUnRVZ2lHclJobjE0K25aK2c2NjRUSWg1UWdnYTBlM056?=
 =?utf-8?B?dHNnZzZzUktRZVFJQXlrVFUvb2F5WUJVN2Fzc3k2RTlEY3JkeVhwa3ovMkhY?=
 =?utf-8?B?S0RZOEFRaE9ubHpQb3dlKzRrWStYV3lTQlhmZWkvVHNxQ1A5UlhmeVhSaVd3?=
 =?utf-8?B?a2tPNXlMUTFvWkkrdFh5RXJOVjBJQUFXUURqVzlmbGVwNllkQVIzQWN1NElo?=
 =?utf-8?B?UVB3NVhIalFPZVd2Zi96RW92OXZNWlU0WktwdFFIWFFLK2s3c0J1cVJwdVlP?=
 =?utf-8?B?UDJzZjhnZnM0UU9jUXVGN1VURHpTWmRxRHdVdDA2N0hPdkFXNWkxZHBhNVE3?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D7EDBB935CA1540A097A6C2782CC56B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea55793c-789e-4ced-4bdb-08dbd9e50fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 07:43:23.7486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cvJCp9SkfJyz0AdxBBNzQzgPWDfLK+LHxi0uOqcU44ss/wRTkWK5rzkGRS/voetoE7h1rO3Gj0xam38u+kb9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5834
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.697700-8.000000
X-TMASE-MatchedRID: dwNgap4H9hjUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2dnC5uaS6tb9+Mk6ACsw4JlwpnAAvAwazLR6
 NeeEAYettoWjVt1YIZmEipkx5++QxEJHpQ2Y9lUQSEYfcJF0pRU6NT0XZrhTqM+iVqkzCnQijNs
 MLknd0FeLzNWBegCW2PZex/kxUIHVmIVC+RmEW7Wrz/G/ZSbVq+gtHj7OwNO0CpgETeT0ynA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.697700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EF8A0A85DF18A6FAF16A84DDDC47657991221850DE96EAAB94B0B911E20DE9332000:8
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEwLTMwIGF0IDE0OjI2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICANCj4gT24gTW9uLCAzMCBPY3QgMjAyMyAxODowMDoyMiArMDgwMCwgTW91
ZHkgSG8gd3JvdGU6DQo+ID4gQWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBQQURESU5H
IGJsb2NrIGluIE1lZGlhVGVrIE1UODE5NQ0KPiB0aGF0DQo+ID4gaXMgY29udHJvbGxlZCBieSBN
RFAzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLHBhZGRpbmcueWFtbCAgICAgICAgICAgfCA0DQo+ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiANCj4gQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IA0KDQpIaSBSb2JlLA0KDQpJIGFwb2xv
Z2l6ZSBmb3Igbm90IG5vdGljaW5nIHRoZSBjaGFuZ2VzIGluIHRoZSBkZXBlbmRlbnQgcGF0Y2gg
YW5kDQpmYWlsaW5nIHRvIHVwZGF0ZSBvbmUgY29tcGF0aWJsZSBuYW1lLiBJIHdpbGwgcmVtb3Zl
IHRoZSBBQ0sgdGFnZSBhbmQNCndvdWxkIGFwcHJlY2lhdGUgeW91ciBoZWxwIGluIHJldmlld2lu
ZyBpdCBhZ2FpbiBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpTaW5jZXJlbHksDQpNb3VkeQ0K
