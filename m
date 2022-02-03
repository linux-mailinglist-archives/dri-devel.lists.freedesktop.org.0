Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933A4A803F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8910EE9D;
	Thu,  3 Feb 2022 08:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 499 seconds by postgrey-1.36 at gabe;
 Thu, 03 Feb 2022 04:32:08 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A351910E53D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 04:32:08 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D4ADFC011E;
 Thu,  3 Feb 2022 04:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643862228; bh=3KJkz5QUTL2c8+cm0FDMW6UxlfuqxCOg0bjiXfPYXHo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eAZvZ/G4+YSIef0VuyKtsdUJpwBGoIAeHcxkzMaZMzNSxTYdW0r2BWT42ijMDbUeX
 PBBQqcHorfYz/ACGBIovmg7pfWb1IDqA1UgSk2Cb5XpDHxE37N+R9YW0D1E4CLpJAp
 tvEb6HJOXTEfDPbq+lw5mjDN2+0IySReCKRR6433jzun8/QjgHFFZvbtaW2q0nBcD2
 MVv1xa9irEacChp8Nr6IN3tdPb0uAzyJbU6++Abna55+XJAJtt9ylYIu4exTrQkqxk
 wuOC2svQsrdFdkmtYdtjnEcFQJNASyrkLxSCK+9mg+3cp2S0F5gZRnD5kgIB/jiqcY
 7XtFFSgSEf4JA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6F00FA0071;
 Thu,  3 Feb 2022 04:23:42 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9E60A40015;
 Thu,  3 Feb 2022 04:23:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RG0I7zbt";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0j4c4bvwWopKNXpKw0eDF8RmtJvvloUIRFkNXgNjDSDciq5PnEV0I4vs+4w+cIVhAj1gZHQ4Y5tvNk9Q+CZqPeM6f7HH2ZMjiStS+Tpu7/1eRqMSnUnxal6deVkjGE4CpSRhtRr2538rLgxBLpLwmhzQu6y+oiTy14TIP4+1wACYDveEzW5rpH90cRdxS7N15HX9r5RBOx0TNXjcZzx7zGJS7fUxqapQSWe5CZrqQuhAYQy9x5M/yJnxAKpVa9z6hde6jvFjhzbMR9kWiTXNORpTxXqdau/5voeweB+EYOQ1CQawn4d/qsgepiDxLc39xrzSLynUbkmtblKQixnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KJkz5QUTL2c8+cm0FDMW6UxlfuqxCOg0bjiXfPYXHo=;
 b=mu6m8QfRG5dQNrgDOSKohGdzn9D9vIIjYojysAawR+mr1yGqIAdj+lrpTPmjQCmwxLyoGocEfhoVW3BN+S5bAwIEVf31Wr3UnQgXWKw0NIHn95nZSzDnR65yJNMlUm82HXjlPpOvGM31ildxskKZZUWH3Q5MdL9avfelatPg9jIfNNxM4otqFTO7irvZplWwdabb8eLKAqc73fGsaWu+RVz+uFKLSUVHiRGFTlBRXzzrhFCF3BsvBccDn1W55hgJgEQCXUdG82sQV1twXJpf+rAxiNUpppuFiE87C0AjeVhY7Xw/ck4XsKLXqCJRun2/247AZpUhpfaVUgFDb0t1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KJkz5QUTL2c8+cm0FDMW6UxlfuqxCOg0bjiXfPYXHo=;
 b=RG0I7zbt7WynGi8pvBauaEmJ5BB8/1EEV5un22gdQ0C5qTw6xwwtdV/bVmjXRMsahjEfte42sZjLwDh3SSfqFjEvIlY3qLAq0+X87yw1FrVBL06DuI8IghIao/KNKqNnMViNcVh63zV7puTkIX/AFW/GGzMEIOxfMfdV1s8rNhY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB3052.namprd12.prod.outlook.com (2603:10b6:5:11e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 04:23:29 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4930.022; Thu, 3 Feb 2022
 04:23:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAADfIAIAAEvYA
Date: Thu, 3 Feb 2022 04:23:28 +0000
Message-ID: <895101b3-ef7f-5e9d-72b3-2b1a1309e033@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <582f032f-e04c-aade-4d18-514fb7e2d848@infradead.org>
In-Reply-To: <582f032f-e04c-aade-4d18-514fb7e2d848@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3e6fc05-c869-495a-d7f3-08d9e6ccee3c
x-ms-traffictypediagnostic: DM6PR12MB3052:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3052C65AD63EB30127A08799AA289@DM6PR12MB3052.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQnpUDf28iYHWmoV+HVRRXcM6Fdy/5k8L7THSL3TqkozahhLmTsBGGPO4hIosGiGEdTSuMPfX22S1pWoMYtusJffaEF1+Q6al8MNshzy1qPf0b9+p3agGGIxTzh9d34MMFN59gXyH5cN4iQ2rnhvMmPtFXC6wJ5mBYANi3En0J+ycqBoiAYRC4w0dm/015QQFWjm6AgMiuZUzH7/33Xcz5tnNHHMiG912Gctit//4k7Z8vzFxUVHO3cI2oQ6UwjMOFCIYh2o1lbBPRFqvgy8V0TxowSjTkFylquIB9p8SDGaEyVWQgdxKZZuNqkQftWXhYL1CYxnyw5MdKEW1/QCz/ATLXE634U0Ql7/sWkqyZhtXTxKVnwUg6auQHfqDlaxnzCbFjjysBBgvePCBli0609OJKFFDl4mzMJyvTkEtj0sIyQq717y1AOYvVVjE+8AVPAXG/jY+J3xOb9PnyLkpnSCUOpnaZOr1+xAJK/5rMrtzEX+FSZSgzft2Hs+n2h+QTF4KT6xX26SD23qDNV1iA+8seUvw2tvcj2OdkY1t+Z1J73KDkFlGvKxFmt8EqhUkBiBXUKlTv79OnyCtSBh3KHiukhXvd3CX0GyrD5O5sNxPrMVwbaqZ67s7rYVfsD4AeHSBfpOz/qU4f1Df/Th2dg920NBAkuOknz3mIOZJsXPLq9r8qSlRBB667Z4Tm8KSAZyl/NDMnYeaxJhoR1Tz3B3Spp4x5mtjCXbdd+drZqzTqy0jJ/A7FtU1Ye1Wi8D46AUm0dEdUPFwoPg1gaK+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(36756003)(2616005)(122000001)(110136005)(2906002)(38100700002)(54906003)(31686004)(6486002)(86362001)(38070700005)(83380400001)(66946007)(8936002)(66446008)(186003)(5660300002)(66556008)(53546011)(8676002)(64756008)(4326008)(6512007)(6506007)(66476007)(316002)(31696002)(508600001)(76116006)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0E0U0w0dlNLdUxlRCtWZTdCT1BiVmJUciswSE5hQnRlUWRHWjhHZVdrNFJs?=
 =?utf-8?B?cURESzhwUjJDZUVMQTVIWS9iVU51QUVnUEJxam85MnZRNkdoOXFBMk1XN2Q3?=
 =?utf-8?B?L3ByODZBalk3dm5PcS9yZzZHbkx4Qk95WlZiZFEyVmdsOFVhQkg1cllSNkV3?=
 =?utf-8?B?VTFVLzRlRWJjUzRBRFhsNzdaeHBQQUc0djNIVE1aY214R2tpaE4wT0g4cGdJ?=
 =?utf-8?B?Zzg2em5BR1U1SnJaU1hDWUNKWCttOEd1bVVLMkwxcjdHMTI2Z2FwN1lYNDZZ?=
 =?utf-8?B?Tm90NllORU9JcVpIN2REWHpSRlNJOGtBSmpVcStHZk9OTGpOTHYvbzVMbmRO?=
 =?utf-8?B?eVZDbzZwM3NSWWpIV2pXVVpta1p6dEdFdkR5WnZQTjJEZkNwekpNWkNiTFow?=
 =?utf-8?B?T3o2SWViWW5qMDZMQlJaRFhGQ3Y0NTlTOVdGL29IMFpTZjBUMUhzYThNVE9j?=
 =?utf-8?B?TExRRzdRU1J6RTlvNURzOUpVM0hya09YSGc4WVZWbklvL2ZPQzdjNXdidEwv?=
 =?utf-8?B?QzRNWUFKSWVqTHUxRHZtQ3FYNks3VVlwVktwZElJaDVqTnNTVE5qKzFuVGxh?=
 =?utf-8?B?b3c3UWI2RU1remxoMjBzL3FLcE94OHFwcEZsQjVFcG5aY1c0dEZNZ3MxTVZX?=
 =?utf-8?B?VGlOdm1NMkNuS2pCR29yTEFsQk5SQTVrYzE2WUoydDhJaTR3ZGd1YlJyQXkx?=
 =?utf-8?B?dURWdGJXZk5vbWZucXpKVXNCQXd6L2pWNFUzMEFONVViWnVuZVpwb3JrUXMz?=
 =?utf-8?B?SGpwVGtvR3FZTEEvandRYU53NlJnUEEzL01yZlRCWnh0VzBBWDBPQk5wa2V4?=
 =?utf-8?B?TGErZlN3Q1FRenFaSzZ3NGovd25VRG12R0FBMU9OZkJ6cEFzbGFzNjlwYWJL?=
 =?utf-8?B?c1pxSTdXUW1zMmV6Y0JuMnl3UEVHMHQ5RzBoN3pPc1h1dng2K0VQaDBGaVM5?=
 =?utf-8?B?SE5EdnpYTlJGK0hCUjZ6am9BZ2xVdExBZXUxTEY5aStDNU5PTXFsb2hOWTYy?=
 =?utf-8?B?TDhtOTNQWjN6QUhBTXBPalhacjlhTGtqUDNRQzFjaTdPY1hENy8rMlgydlNT?=
 =?utf-8?B?MDl6ZmFiZU1ya25ua3Z2Y0NoQWd3SWtlVFpQSDU5eHZpQXhXcmVxM2Y1cTFK?=
 =?utf-8?B?a3lNMXA4TTQ4eEpBUGx4VDloL25CQWx4L0N5THMrSmdGSTNGZERHQVFxSWxu?=
 =?utf-8?B?SUt5S3VrSVdRRUtnVk1yUGZYTis2Y21sQWxEUGJsZE01cjNZejhEQ0xTcVdj?=
 =?utf-8?B?UXptK0dWK0tlZUU2YnpGRFBEQ0Y1WENEeTRsMmprR1lvdk9SM2JsSTArcXJy?=
 =?utf-8?B?SFlnbW1OVmdGTitPTVRhTTdpZFJmcWZ1OCttcEpTV0U4d3luS0NjcGU1WVIr?=
 =?utf-8?B?OUh5dkU3UDZxR21odCt3aFllNzhPZVJVWHZrZzRmUEJZbGVzdHRNbEYzRTZN?=
 =?utf-8?B?b0t6dXJhNVprS3EwSnVJRy80OE9zeVB0MTBZNGhWVXcwK3IwS3Q2ZFIzaUUv?=
 =?utf-8?B?bFRIcW5xSUpjb2hIQXJMOVVOeHFYaGFXSTN6VDhmeTIwTlFJUGgvVDFVVHdS?=
 =?utf-8?B?cUFsOW11bFpENWhRVDY2T25QdlBFbEVPL2UxTlJuQjY2SlVxdjdDa3dWUkJT?=
 =?utf-8?B?TUF4c2NXUXFqcFNwTk1kZDZwOEJLLzMwMUxrMXl5TWVMdGFma3N5Sk5acE9h?=
 =?utf-8?B?Znh1elFoV0VPNVJ5RmVnVVhUVG5mUHY0bHFZdHlCY3NKNCtFN1VNYjNCR2to?=
 =?utf-8?B?b2FabWlTbmVEZGs4a1VIaTdaWVp0RWN5aHF1QWdheEV5ZEdLQXdNaTRpMVNX?=
 =?utf-8?B?cjhZbk84MXplRGM4eHF0T3RTMEVNcFJWcnRLQUVaNUp0NklaOTFHanFscWJU?=
 =?utf-8?B?ejBBVnUweHpNakhMY0tqOHBDT1d1VU80UnFsbkc3MEx1SitiR2QyblBPQUtl?=
 =?utf-8?B?bGxCNkxSM2IrYksvQ2NuUy90SzIwSWVyOW5BMEFXL3kvVEtiR1hJOStVQ1Rn?=
 =?utf-8?B?WWV0dzF5aEY0V0NiUVhhUUpCbG94VGdiRGx3Y0M0RVlTcjNmb2VVY2N6TEFE?=
 =?utf-8?B?Vmt6NzJ6YStXRkNwUTg1amdOTHk1aHR1Yit1Sk5URnAwRVZzRVlvRFNScTh3?=
 =?utf-8?B?c3d3eHZ6NHV6b1ZHYVlaQU1DVXdTOUx3Z0c3S29WdktHRTZ0M3MwcnZ4ei9K?=
 =?utf-8?Q?7x4Mz2LsD4K7htUoX78X5Gw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7661C297FDD9E64791ADC9FDF18F8202@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e6fc05-c869-495a-d7f3-08d9e6ccee3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 04:23:29.0099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbNH5lRMFMdI6xn4I6Mv/XUabavnClNqvIVeNZK8rD3TR5uQCM6hvRi/nrhprAv5QqE1Cw3xbA+xF3y38HmbeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3052
X-Mailman-Approved-At: Thu, 03 Feb 2022 08:21:28 +0000
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
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmFuZHkgRHVubGFwIHdyb3RlOg0KPiBIaS0tDQo+IA0KPiBPbiAyLzIvMjIgMTU6NTUsIFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+IEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4gT24gV2VkLCBGZWIg
MiwgMjAyMiBhdCAxOjE0IEFNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNv
bT4gd3JvdGU6DQo+Pj4+IEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+Pj4+PiBPbiBUdWUsIEZlYiAx
LCAyMDIyIGF0IDg6MDYgUE0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdy
b3RlOg0KPj4+Pj4+DQo+Pj4+Pj4gT24gMi8xLzIyIDE1OjAxLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+Pj4+Pj4+IEhpLA0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbmUgb2Ygb3VyIHRlc3Qgc2V0dXBzIGlz
IHVuYWJsZSB0byBib290IChzdHVjayBhdCBpbml0cmFtZnMpLiBHaXQNCj4+Pj4+Pj4gYmlzZWN0
aW9uIHBvaW50cyB0byB0aGUgY29tbWl0IGJlbG93Og0KPj4+Pj4+Pg0KPj4+Pj4+PiBmNjExYjFl
NzYyNGMgKCJkcm06IEF2b2lkIGNpcmN1bGFyIGRlcGVuZGVuY2llcyBmb3IgQ09ORklHX0ZCIikN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gUmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggcmVzb2x2ZXMgdGhlIGlzc3Vl
LiBUaGlzIGlzc3VlIHBlcnNpc3RzIGluIG1haW5saW5lDQo+Pj4+Pj4+IGFsc28uIFVuZm9ydHVu
YXRlbHkgdGhlcmUgaXNuJ3QgYW55IG1lYW5pbmdmdWwgbG9nLiBIb3BlZnVsbHkgc29tZW9uZQ0K
Pj4+Pj4+PiBjYW4gZ2l2ZSBzb21lIGluc2lnaHQgYXMgdG8gd2hhdCBjb3VsZCBiZSB0aGUgaXNz
dWUgYW5kIHJldmVydC9maXggdGhpcw0KPj4+Pj4+PiBpc3N1ZS4NCj4+Pj4+Pg0KPj4+Pj4+IEhp
LA0KPj4+Pj4+IERpZCB5b3UgZW5hYmxlIERSTV9GQkRFVl9FTVVMQVRJT04/DQo+Pj4+DQo+Pj4+
IEkgZGlkIG5vdCBlbmFibGUgaXQuDQo+Pj4+DQo+Pj4+Pj4gUGxlYXNlIHByb3ZpZGUgdGhlIGZh
aWxpbmcgLmNvbmZpZyBmaWxlLg0KPj4+Pj4NCj4+Pj4+IERvZXMgc2VsZWN0aW5nIENPTkZJR19G
Qj15IGhlbHA/DQo+Pj4+Pg0KPj4+Pg0KPj4+PiBPbiB0aGUgY29uZmlnIHRoYXQgaGFzIHRoZSBp
c3N1ZSwgdGhpcyBpc24ndCBzZXQuIEFmdGVyIHJldmVydGluZyB0aGUNCj4+Pj4gY29tbWl0IGFi
b3ZlLCB0aGlzIHdhcyBzZXQuIE1heWJlIHRoaXMgaXMgd2hhdCdzIG5lZWRlZD8gSSBuZWVkIHRv
IHRlc3QgaXQuDQo+Pj4NCj4+PiBDT05GSUdfRkIgc2hvdWxkIG5vdCBub3JtYWxseSBiZSBuZWVk
ZWQgZm9yIGJvb3RpbmcsIHNvIHVubGVzcw0KPj4+IHlvdSBoYXZlIGEgZ3JhcGhpY2FsIGFwcGxp
Y2F0aW9uIGluIHlvdXIgaW5pdHJhbWZzIHRoYXQgcmVxdWlyZXMgdGhlIC9kZXYvZmIwDQo+Pj4g
ZGV2aWNlIHRvIHdvcmssIGl0IGlzIG5vdCBzdXBwb3NlZCB0byBtYWtlIGEgZGlmZmVyZW5jZS4N
Cj4+Pg0KPj4NCj4+IEknbSBub3Qgc3VyZSwgYnV0IGl0IHNlZW1zIGxpa2UgdGhlIHNldHVwIHdl
IGhhdmUgaXNuJ3QgdGhlIG9ubHkgb25lDQo+PiB0aGF0IG5lZWRlZCBpdC4gRmFiaW8gYWxzbyBu
b3RlZCB0aGF0IHRoZSBpbXhfdjZfdjdfZGVmY29uZmlnIGFsc28gbmVlZHMNCj4+IHRvIGhhdmUg
Q09ORklHX0ZCIHNldC4NCj4+DQo+Pj4gQXJlIHRoZXJlIGFueSBvdGhlciBkaWZmZXJlbmNlcyBp
biB5b3VyIC5jb25maWcgYmVmb3JlIGFuZCBhZnRlciB0aGUgcGF0Y2g/DQo+Pj4gSXQncyBwb3Nz
aWJsZSB0aGF0IHlvdSB1c2Ugc29tZSBvdGhlciBkcml2ZXIgdGhhdCBpbiB0dXJuIGRlcGVuZHMg
b24NCj4+PiBDT05GSUdfRkIuIERvZXMgeW91ciBtYWNoaW5lIGhhdmUgYW55IGdyYXBoaWNhbCBv
dXRwdXQgZGV2aWNlPw0KPj4+IElmIHllcywgd2hpY2ggZHJpdmVyIGRvIHlvdSB1c2U/DQo+Pg0K
Pj4gSSBkb24ndCBoYXZlIHRoZSBhbnN3ZXIgdG8gdGhvc2UgcXVlc3Rpb25zIHlldC4gTmVlZCBt
b3JlIGludmVzdGlnYXRpb24uDQo+PiBJJ20gbmV3IHRvIHRoaXMgcGFydGljdWxhciB0ZXN0IHNl
dHVwLg0KPj4NCj4+Pg0KPj4+IFlvdSBtYXkgYWxzbyB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHlv
dSBoYXZlIDlkNjM2NmU3NDNmMyAoImRybToNCj4+PiBmYl9oZWxwZXI6IGltcHJvdmUgQ09ORklH
X0ZCIGRlcGVuZGVuY3kiKSBpbiB5b3VyIGtlcm5lbCwgd2hpY2gNCj4+PiBmaXhlcyBhIG1pbm9y
IHByb2JsZW0gd2l0aCBteSBvcmlnaW5hbCBwYXRjaC4NCj4+Pg0KPj4+ICAgICAgICAgIEFybmQN
Cj4+DQo+PiBUaGUgaXNzdWUgYWxzbyBvY2N1cnMgaW4gbWFpbmxpbmUsIHdoaWNoIGhhcyB5b3Vy
IG1pbm9yIGZpeCBjb21taXQNCj4+IGFib3ZlLiBUaGUgcmV2ZXJ0IGlzbid0IGNsZWFuIGZvciB0
aGUgbGF0ZXN0IGtlcm5lbCB2ZXJzaW9uLiBJIGFsc28gaGF2ZQ0KPj4gdG8gcmV2ZXJ0IHNvbWUg
b2YgdGhlIGNoYW5nZXMgYWxvbmcgd2l0aCBDT05GSUdfRkIuIFRoZSByZXZlcnQgbG9va3MNCj4+
IG1vcmUgbGlrZSB0aGlzIGZvciB0aGUgbGF0ZXN0IGtlcm5lbDoNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4g
aW5kZXggYjFmMjJlNDU3ZmQwLi43Y2JjNzMzYTg1NjkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+IEBA
IC0xMTgsOCArMTE4LDkgQEAgY29uZmlnIERSTV9ERUJVR19NT0RFU0VUX0xPQ0sNCj4+DQo+PiAg
Y29uZmlnIERSTV9GQkRFVl9FTVVMQVRJT04NCj4+ICAgICAgICAgYm9vbCAiRW5hYmxlIGxlZ2Fj
eSBmYmRldiBzdXBwb3J0IGZvciB5b3VyIG1vZGVzZXR0aW5nIGRyaXZlciINCj4+IC0gICAgICAg
ZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBFUg0KPj4gLSAgICAgICBkZXBlbmRzIG9uIEZCPXkgfHwg
RkI9RFJNX0tNU19IRUxQRVINCj4+ICsgICAgICAgZGVwZW5kcyBvbiBEUk0NCj4+ICsgICAgICAg
c2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+PiArICAgICAgIHNlbGVjdCBGQg0KPj4gICAgICAgICBz
ZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+PiAgICAgICAgIHNlbGVjdCBGQl9DRkJfQ09QWUFSRUEN
Cj4+ICAgICAgICAgc2VsZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4+DQo+Pg0KPj4NCj4+IEkgYXR0
YWNoZWQgdGhlIGNvbmZpZ3MgZm9yIGtlcm5lbCB2NS4xNy1yYzEuIFRoZSAiYmFkIiBjb25maWcg
aXMgd2l0aG91dA0KPj4gYW55IHJldmVydCwgdGhlICJnb29kIiBjb25maWcgaXMgd2l0aCB0aGUg
Y2hhbmdlIGFib3ZlLg0KPiANCj4gSSB0b29rIGJhZC5jb25maWcgd2l0aCBrZXJuZWwgNS4xNy1y
YzEgYW5kIHRoZW4gbWFudWFsbHkgc2V0L2VuYWJsZWQ6DQo+IA0KPiBDT05GSUdfRkINCj4gQ09O
RklHX0ZCX0VGSQ0KPiBDT05GSUdfRkJfTU9ERV9IRUxQRVJTDQo+IENPTkZJR19GQl9USUxFQkxJ
VFRJTkcNCj4gQ09ORklHX0xPR08NCj4gDQo+IGFuZCBJIGdvdCB2ZXJ5IGNsb3NlIHRvIHlvdXIg
Z29vZC5jb25maWcgZmlsZS4NCj4gQ2FuIHlvdSBkbyB0aGUgc2FtZSBhbmQgc2VlIGlmIGl0IHdv
cmtzIGZvciB5b3U/DQo+IElmIHNvLCB0aGVuIHdlIGNhbiBkZWNpZGUgd2hhdCB0byBkbyBhYm91
dCBpdC4NCj4gDQo+IA0KPiB0aGFua3MuDQoNClllcy4gSXQgd29ya3MgYXMgZXhwZWN0ZWQuDQoN
ClRoYW5rcywNClRoaW5oDQo=
