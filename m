Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A884A92BB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 04:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D380B10E950;
	Fri,  4 Feb 2022 03:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38510E950
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 03:21:25 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E175E404F7;
 Fri,  4 Feb 2022 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643944884; bh=s7ZP2xDGurfl/eI3qE4yDfEE4DG1N228tMAJvGc796o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SdqoWGLRoa3g3Zb8W4EeO39yT9l+tuawhBo5D94Aswm8gH/80qvd7nqIiC3aIH8U8
 H7C+E4Pnk1MDPD+d9lVwbo9Pbqm3orEefgrzHuuP4b1PxZnO17Yl8NVz5XqYOw9hF8
 qJ6uyDoWj9gFg5xWOJCVrkSMI8i70rsCj/+0SBNBOKYLcOGOr5DHiBBGTXzE+D1y2w
 8zJI8HuvpM0tyIPG7zmZQKrMHmtUKWUDNEGB+IcFCCUwCRkX/jL8x2X3cNyMqQaWmp
 fyWYBb9OU/12yYk0deu0/4mhxsBMr2EApRN0lEtO/r9cvBzo3FODqwAku1cqgUPfY6
 NqUdUY40VDGkA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 42C12A0070;
 Fri,  4 Feb 2022 03:21:18 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6FA5540077;
 Fri,  4 Feb 2022 03:21:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VYRsK3AG";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np86HeyxHDt8KkxIhfZ4q3rr9EPH+bDPLN5t3zvyjHcOR7SMdWagS+IHmuYgnrcdiU1vocWvsnNkMNXhYS07N1nlU/QYiulofovCQdgV1Qb/K5kZ2pfr6ACauXahbq51QUDYly0W1g9moukuhU2qGwIA+BG6IkRZ1cjPxiZjhPjtP8cUdiGzVR7xtkRFZAGFDBjmmD8MZPtOCHTZeD90LstaqhYY35XE1UNMN0r98+jeHa3PGSnqxqQYMBm0vOSFenEX/n7WsVYhX/hab5cm8sOuxAjXYb0Hbf8RAR5H0pzV/LPZiGk0JUomww/VhjgrUmqeAQlkBT55NZEnFjsJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7ZP2xDGurfl/eI3qE4yDfEE4DG1N228tMAJvGc796o=;
 b=O0yE+pjPzzbJgCWJYVnaueDCn0A43peU5+puhf9mfP6lEv0rN/gUVVtrfnwva/Z1FUE3xLlYK+ZiABJtYDCmXLSnQ73S3D90CHlkhV0vIRLvH5QrwRqD0M6/GTa1khQjzh8fVVccM/NqNOY+ONdQiAF5ceu9EpvvV2Bg5KiPFR5kpNNUiw0BqnDwHMjulTiOSPIVfF9T3gsSE0siirn8lVU/t9KvaAF2Tmw5tXI1qPcKV7vEEi8I3MQSaXEslBEXuucehjom8GsWSk6RCfBcj52amHWbm7cjlH7sjMQeTSlJKNhSR+MOhf7LOwxTHJ6Klondd4sBAkrgUPX3vFxGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7ZP2xDGurfl/eI3qE4yDfEE4DG1N228tMAJvGc796o=;
 b=VYRsK3AGuRlamJlcSo2CFOYedc5anw8zt6/6gZ6VMqcolytKcEcDngB/eO+mM5hgw20sgbIpkWlyR4mjLMMsLaU8rpnqaaMIcOvn39VTXiV1egk0WaZFs7qMJgD7BKRsYRo22n+QVDjgUWjVujaozIWmAcZ4TdgoA3TtcX34Yso=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR1201MB0266.namprd12.prod.outlook.com (2603:10b6:4:57::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 4 Feb
 2022 03:21:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 03:21:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIA
Date: Fri, 4 Feb 2022 03:21:09 +0000
Message-ID: <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 760acddf-240e-4efd-6071-08d9e78d6360
x-ms-traffictypediagnostic: DM5PR1201MB0266:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB026624D81946C17AA8B24469AA299@DM5PR1201MB0266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mS+TA3bYJyN1XFUzXALdkLNXGvLTGt6WDUlPMyqcaLcrdD/+b/MVdvNcacbpo6K+eOj/Cr/KkjQk3Tgf2HkQ+CwZ002sWts7mu/eJNP3t5D6MEWFEwTN9IK31Or441y7bn23qJtCr7KnWyAIVVx1eENzOJwr7OEvORDWLGBpdzAUYx4pwNFCEsiendOuKa7hExUzjKJtXIdkRpOeamIOFpRM+cYUVwey8YNt8mDOFgjDJmeLR3PlSryGSCWuVlsJ09koLL16hYmUcFvA4IrrNtgSiQvChNCyQVlCE+bTBQFMhTudx+bwNBqqpLOD8EWmmwsX9Sll9UHi2PfzGzKVG4FeEy+DzuAaYzsMO9ZkutqEOrCW8VwACigzt7YtiuE4u1nHH9/kZ49mdtTkxcuFx8to+1jVLQhG+ADFOtw1ppkNSCdiZunR2Xa1kCX2TIzyEv0cNFLdwMwC+DTSasQ25C30vhUEGPiUl3kW3RyhjePekHT2hfUabxdTuzZLB3fTk3LKg1jD0c5e3RlXU7SobcdkXCoD/eTZlj2wd1JD7QB8czMZf4ZJCLXq4IgwkZ8b7+DHrUeFzC7tDPkxjHxBkw024VOSZeFKnBJdAzbJJ7lvzhLrGzHKUrRyrF7wvVCuR0X4r4OonN7zjONwmOMBfU1ByPhlAtsNCdGFe09p+8a+k3vruPctrrq/TND93Si9VnHGmZiulMlGtj38P7uLTDCAW930L7bA44wELWQWN/cNtYauUW5rIZIbdXqdDicwUxpCv3Z/zkK7I0cxGIN7uQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(8936002)(86362001)(31696002)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(122000001)(316002)(6486002)(53546011)(5660300002)(6506007)(6512007)(26005)(186003)(2616005)(2906002)(31686004)(508600001)(38070700005)(110136005)(38100700002)(36756003)(54906003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDJEOURwZ2hOY0NvWnRPMVErc2QzcmhhQ2ZlZlIxeWVBdnlXUHZ5UXlObFNm?=
 =?utf-8?B?UnRMbGZHVFdMdnpyUWJYUE5xWHo3TFFsTGFYdXBuZTlyQ29xTG1CM2NramJQ?=
 =?utf-8?B?WkV0T2JsQXFNaEJOSkxjVEZ3TUsvaDcrRUJTaDBHTHJjVlMwYXRyQU5wMFpu?=
 =?utf-8?B?dk9Nd2FCZ0lGOSs2N3hiclVVbEw3OVFnQ1A4V243cVRGU0RzOVozWVQ4UXdQ?=
 =?utf-8?B?NzZ1ZXg5aDVRenEweEJJK0RPV2Q4SjNYU1Biaytsci9EQjQ5QnRRZDh6WVl1?=
 =?utf-8?B?SDVCdjVyeUl6U1lpNzQyS3l2MzNLajZ4TGFWbC9WOENWMG1WWXk1UnFVandi?=
 =?utf-8?B?LzNOb3pUMjNCbWZxMUJKaVh2NmluYzZ4YUQ3ZjZVRm9HWlZ0WWpyMU55MEE1?=
 =?utf-8?B?M1BNWlk1QW05VEdVRXJGdWZPMFV5UlJNTkxLOWc4Zmo0UFRwUi9sdk80U0JV?=
 =?utf-8?B?K2MvZjdQSFBXUkJpa2dYVDVMZ243VFdlcmk4c2twbGFsTmRlTE1ucStYWUZk?=
 =?utf-8?B?SE1iNEd1dnBZeHBYTHpQRlZXRm4xU20weW5jWkFiSXRORzZjWXhnQ3BwL1hD?=
 =?utf-8?B?bVlUYWhXZWRuRzFKK3RXRjVrUHJ1Z2JoQlNYVURXT1ZUOWMzWXordFU4WThy?=
 =?utf-8?B?SzJGKzRqVERVN0MrQjdKOFl6KzVQZ3k4cUM2c053dDNUQlllWHlFZkxoaWxM?=
 =?utf-8?B?VWNZODh5OUw0UHRyYzlWWUQ4V3U5ZXhOUG9aaXdYKzdqMjZQVTVYeTBuOFJh?=
 =?utf-8?B?K0RjamQrNENlbzA2R2tpMHdLSTNUZTdvUVFHNGN0Zi9HendqT214R2lCYWM4?=
 =?utf-8?B?N0ZhUTdjU1BDa3VtZXF2WWEwMFFreWpNVTE1SXV4aEkzK05uTTQvMGxvbHM3?=
 =?utf-8?B?d3ZpMVRIc2dDeENFaWY5OXMxZS9JSFNyMUE3ZENNOHg4Uis4UUJnL1NPREtW?=
 =?utf-8?B?aWZ4a0VjSGMvNzFxSk1pMWZlZnJHbjNQaGpocklPUlZQTW82Y2lMdXhBQjN4?=
 =?utf-8?B?S256bnFRTzYrT0NwMVJubEltY0JpL2oxbDZjNDlHcFR6dnY2K2hzWjBaZTV3?=
 =?utf-8?B?WWtKMDJNNFpYcEFsVFFYWU12MjgycGRwRTc3SGRaTFM5Tm1OYngzRTBNZCtU?=
 =?utf-8?B?ZlFMeEdERldObE1VOWZkYzFHbEhPTEVEeFVrWG55QkUycktUUW5Ua3BlMVV2?=
 =?utf-8?B?SGlmeEFhVjlkUStpMWt6R3ZLZFB3R2VMNUh4WUlDaEhzR0xnNUZJSDdlaUpq?=
 =?utf-8?B?NkJiK2xCVGJmUkJER05xRUdiRDdkM3l4S1RrUjkrMytzbFkvbVVkdnkzUkJM?=
 =?utf-8?B?WmJYSzFMWEIvTmw5TDZLT2poVXhwSDBaWUViM0xBb0hjc1hpbFRiQkV3NEJG?=
 =?utf-8?B?NVhwY2ZtcEJVTURhMW40STB0U3FqdUVkb09yYkFXNklheWthUWMvNnhZN0pw?=
 =?utf-8?B?T3pnV3EvR0NtQkFmRDV1M2pDVElxNUJMRyswTDZwRmN3VnI4UGRsa09XWGNT?=
 =?utf-8?B?M2diSGQ0ZkJZSURrRWpBTEEzMUkzZGRXQWRpemZqVFZ6RjIxaWxKTGlZLytj?=
 =?utf-8?B?ZU1lYjNkTlk4eXZhTmQveGxOWDBRenBaUXRYMXV1bDFIY2dhMjBwU3ppR0tO?=
 =?utf-8?B?U1lDaW1iZEpVbTVSN0Y5aHAwUHlOL2g5SEQvc09WcVlWclhlVWJmZmVXY0lN?=
 =?utf-8?B?TXhKM040aGhIei9ISzhPNkdRMVJ2Z0lyZ2FycGp6U0hadEJtdG1XSldvYlox?=
 =?utf-8?B?YVd2N3pYbmRFV0xLQzhab3hqeURUUEhVeEtiM2lVbG1pNmhSZ3htMm5UMEFR?=
 =?utf-8?B?WWhyeEJTczY5TG92eDM5R0J2UmVuSCtrb0lsbUhEdkM0MklGTUNZOTlGcmhV?=
 =?utf-8?B?TG5wZ1N0Rkt3OSs0UE5XR01NRkdPVnV6UUZ3NFhMNEl0dkl5TGpUcmpRQmJP?=
 =?utf-8?B?TTU3U2Z2SzVncElzK3ZzQUczYTdpNUgvVE41U3VMaG50cUx0ZXY1aVJUZWdq?=
 =?utf-8?B?QlQrcElnTWttSDBuNExoZ0RjQk0xU1N6TDhQVEF0U29EYzJtTmVVbDFNanZw?=
 =?utf-8?B?R2JRVzJKRThxRjh1dnNOZDg4NXAxdEhaT3Vtd04yajdPbk9IckdHTERXK1M1?=
 =?utf-8?B?RkNWY3oxbG1zWFJxSWlKN0J4Z1FDeitYSE1rbTc2MXRKZVBWNDRjUExQdnNr?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CC459F5626E1C4FA55172EDAA14C098@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760acddf-240e-4efd-6071-08d9e78d6360
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 03:21:09.1114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9LY5kEvRwpclLAKrE6DbRK3Y2HgsXkFrKF9VgRWozInrer3RT2GXkwFaHi7/G/Ajf+jstsIVcWZbE8C/LeohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0266
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
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXJuZCBCZXJnbWFubiB3cm90ZToNCj4gT24gVGh1LCBGZWIgMywgMjAyMiBhdCAxMjo1NSBBTSBU
aGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPj4gQXJuZCBC
ZXJnbWFubiB3cm90ZToNCj4+PiBPbiBXZWQsIEZlYiAyLCAyMDIyIGF0IDE6MTQgQU0gVGhpbmgg
Tmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4+Pj4gRmFiaW8gRXN0
ZXZhbSB3cm90ZToNCj4+Pg0KPj4+IENPTkZJR19GQiBzaG91bGQgbm90IG5vcm1hbGx5IGJlIG5l
ZWRlZCBmb3IgYm9vdGluZywgc28gdW5sZXNzDQo+Pj4geW91IGhhdmUgYSBncmFwaGljYWwgYXBw
bGljYXRpb24gaW4geW91ciBpbml0cmFtZnMgdGhhdCByZXF1aXJlcyB0aGUgL2Rldi9mYjANCj4+
PiBkZXZpY2UgdG8gd29yaywgaXQgaXMgbm90IHN1cHBvc2VkIHRvIG1ha2UgYSBkaWZmZXJlbmNl
Lg0KPj4+DQo+Pg0KPj4gSSdtIG5vdCBzdXJlLCBidXQgaXQgc2VlbXMgbGlrZSB0aGUgc2V0dXAg
d2UgaGF2ZSBpc24ndCB0aGUgb25seSBvbmUNCj4+IHRoYXQgbmVlZGVkIGl0LiBGYWJpbyBhbHNv
IG5vdGVkIHRoYXQgdGhlIGlteF92Nl92N19kZWZjb25maWcgYWxzbyBuZWVkcw0KPj4gdG8gaGF2
ZSBDT05GSUdfRkIgc2V0Lg0KPiANCj4gTm8sIHRoYXQgb25lIGlzIGRpZmZlcmVudDogdGhlIGNo
YW5nZSBmb3IgaW14X3Y2X3Y3X2RlZmNvbmZpZyB3YXMNCj4gZG9uZSBiZWNhdXNlIHRoZXkgYWN0
dWFsbHkgdXNlIGEgZnJhbWVidWZmZXIgY29uc29sZSBvbiBzb21lIGRldmljZXMsDQo+IHNvIHRo
ZSBwYXRjaCBqdXN0IGFkZHMgdGhlIHN5bWJvbCB0byBlbmFibGUgdGhlIGRyaXZlcnMgdGhleSBh
cmUgdXNpbmcuDQo+IA0KPiBUaGlzIGlzIGV4cGVjdGVkIHdpdGggbXkgb3JpZ2luYWwgcGF0Y2gg
dGhhdCBkb2Vzbid0IGltcGxpY2l0bHkgZW5hYmxlDQo+IHRoZSBmcmFtZWJ1ZmZlciBsYXllciBh
bnkgbW9yZS4gV2hhdCBpcyBub3QgZXhwZWN0ZWQgaXMgZm9yIHRoZSBrZXJuZWwNCj4gdG8gaGFu
ZyBkdXJpbmcgYm9vdCBhcyB5b3UgcmVwb3J0ZWQgZm9yIHlvdXIgdW5pZGVudGlmaWVkIHBsYXRm
b3JtLg0KPiANCj4+PiBBcmUgdGhlcmUgYW55IG90aGVyIGRpZmZlcmVuY2VzIGluIHlvdXIgLmNv
bmZpZyBiZWZvcmUgYW5kIGFmdGVyIHRoZSBwYXRjaD8NCj4+PiBJdCdzIHBvc3NpYmxlIHRoYXQg
eW91IHVzZSBzb21lIG90aGVyIGRyaXZlciB0aGF0IGluIHR1cm4gZGVwZW5kcyBvbg0KPj4+IENP
TkZJR19GQi4gRG9lcyB5b3VyIG1hY2hpbmUgaGF2ZSBhbnkgZ3JhcGhpY2FsIG91dHB1dCBkZXZp
Y2U/DQo+Pj4gSWYgeWVzLCB3aGljaCBkcml2ZXIgZG8geW91IHVzZT8NCj4+DQo+PiBJIGRvbid0
IGhhdmUgdGhlIGFuc3dlciB0byB0aG9zZSBxdWVzdGlvbnMgeWV0LiBOZWVkIG1vcmUgaW52ZXN0
aWdhdGlvbi4NCj4+IEknbSBuZXcgdG8gdGhpcyBwYXJ0aWN1bGFyIHRlc3Qgc2V0dXAuDQo+IA0K
PiBEbyB5b3UgbWVhbiB5b3UgZG9uJ3Qga25vdyBpZiB0aGVyZSBpcyBhIHNjcmVlbiBhdHRhY2hl
ZCB0byB0aGUgc3lzdGVtPw0KPiANCg0KSXQgZG9lcyBoYXZlIGEgZ3JhcGhpY2FsIG91dHB1dCBk
ZXZpY2UsIGJ1dCBJIGRpZG4ndCBjaGVjayB3aGF0IGl0IGlzIG9yDQp3aGF0IGRyaXZlciBpcyBk
cml2aW5nIGl0LiBJIGp1c3Qgbm90aWNlIHRoYXQgYWZ0ZXIgdGhlIHJlcG9ydGVkIGNvbW1pdCwN
CnNvbWV0aGluZyBzdG9wcGVkIHdvcmtpbmcuDQoNCj4+Pg0KPj4+IFlvdSBtYXkgYWxzbyB3YW50
IHRvIG1ha2Ugc3VyZSB0aGF0IHlvdSBoYXZlIDlkNjM2NmU3NDNmMyAoImRybToNCj4+PiBmYl9o
ZWxwZXI6IGltcHJvdmUgQ09ORklHX0ZCIGRlcGVuZGVuY3kiKSBpbiB5b3VyIGtlcm5lbCwgd2hp
Y2gNCj4+PiBmaXhlcyBhIG1pbm9yIHByb2JsZW0gd2l0aCBteSBvcmlnaW5hbCBwYXRjaC4NCj4+
Pg0KPj4NCj4+IFRoZSBpc3N1ZSBhbHNvIG9jY3VycyBpbiBtYWlubGluZSwgd2hpY2ggaGFzIHlv
dXIgbWlub3IgZml4IGNvbW1pdA0KPj4gYWJvdmUuIFRoZSByZXZlcnQgaXNuJ3QgY2xlYW4gZm9y
IHRoZSBsYXRlc3Qga2VybmVsIHZlcnNpb24uIEkgYWxzbyBoYXZlDQo+PiB0byByZXZlcnQgc29t
ZSBvZiB0aGUgY2hhbmdlcyBhbG9uZyB3aXRoIENPTkZJR19GQi4gVGhlIHJldmVydCBsb29rcw0K
Pj4gbW9yZSBsaWtlIHRoaXMgZm9yIHRoZSBsYXRlc3Qga2VybmVsOg0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+
PiBpbmRleCBiMWYyMmU0NTdmZDAuLjdjYmM3MzNhODU2OSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9LY29uZmlnDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4g
QEAgLTExOCw4ICsxMTgsOSBAQCBjb25maWcgRFJNX0RFQlVHX01PREVTRVRfTE9DSw0KPj4NCj4+
ICBjb25maWcgRFJNX0ZCREVWX0VNVUxBVElPTg0KPj4gICAgICAgICBib29sICJFbmFibGUgbGVn
YWN5IGZiZGV2IHN1cHBvcnQgZm9yIHlvdXIgbW9kZXNldHRpbmcgZHJpdmVyIg0KPj4gLSAgICAg
ICBkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+PiAtICAgICAgIGRlcGVuZHMgb24gRkI9eSB8
fCBGQj1EUk1fS01TX0hFTFBFUg0KPj4gKyAgICAgICBkZXBlbmRzIG9uIERSTQ0KPj4gKyAgICAg
ICBzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4+ICsgICAgICAgc2VsZWN0IEZCDQo+PiAgICAgICAg
IHNlbGVjdCBGQl9DRkJfRklMTFJFQ1QNCj4+ICAgICAgICAgc2VsZWN0IEZCX0NGQl9DT1BZQVJF
QQ0KPj4gICAgICAgICBzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVA0KPj4NCj4+DQo+Pg0KPj4gSSBh
dHRhY2hlZCB0aGUgY29uZmlncyBmb3Iga2VybmVsIHY1LjE3LXJjMS4gVGhlICJiYWQiIGNvbmZp
ZyBpcyB3aXRob3V0DQo+PiBhbnkgcmV2ZXJ0LCB0aGUgImdvb2QiIGNvbmZpZyBpcyB3aXRoIHRo
ZSBjaGFuZ2UgYWJvdmUuDQo+IA0KPiBMb29raW5nIGF0IHRoZSBjb25maWcsIEkgc2VlIHRoYXQg
dGhpcyBpcyBmb3IgYW4geDg2IG1hY2hpbmUsDQo+IGFuZCB5b3UgaGF2ZSB0aGUgRkJfRUZJIGRy
aXZlciBhbmQgRUZJX0VBUkxZQ09OIGVuYWJsZWQuDQo+IA0KPiBXaGF0IEkgc3VzcGVjIGlzIGdv
aW5nIG9uIGlzIHRoYXQgeW91IGFyZSBsb29raW5nIGF0IGEgc2NyZWVuIHJhdGhlcg0KPiB0aGFu
IGEgc2VyaWFsIGNvbnNvbGUsIGFuZCB0aGUga2VybmVsIGRvZXNuJ3QgYWN0dWFsbHkgaGFuZyBi
dXQgeW91DQo+IGp1c3QgZG9uJ3Qgc2VlIGFueSBtb3JlIG1lc3NhZ2VzIGFmdGVyIHRoZSBEUk0g
ZHJpdmVyIHRha2VzDQo+IG92ZXIgZnJvbSBFRklfRUFSTFlDT04gYmVjYXVzZSB0aGVyZSBpcyBu
byBjb25zb2xlIGRyaXZlci4NCj4gDQo+IEluIHRoaXMgY2FzZSwgd2hhdCB5b3Ugc2VlIGlzIHRo
ZSBpbnRlbmRlZCBiZWhhdmlvciwgbm90IGEgYnVnLg0KPiBJZiB5b3Ugd2FudCBhIGdyYXBoaWNh
bCBjb25zb2xlIGluIHlvdXIgc3lzdGVtLCB5b3UgbmVlZCB0bw0KPiBlbmFibGUgdGhlIHN1cHBv
cnQgZm9yIHRoaXMgaW4geW91ciBjb25maWcuDQo+IA0KDQpJdCBzb3VuZHMgbGlrZSB0aGF0J3Mg
dGhlIGNhc2UuIFVuZm9ydHVuYXRlbHkgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoaXMNCnN1YnN5
c3RlbSB0byBzYXkgdGhhdCdzIHdoYXQgaGFwcGVuaW5nLiBJZiB0aGVyZSdzIG5vdGhpbmcgYWN0
dWFsbHkNCmJyb2tlbiBmcm9tIHJldmlldywgd2UgY2FuIGlnbm9yZSB0aGlzIGVtYWlsIHRocmVh
ZC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
