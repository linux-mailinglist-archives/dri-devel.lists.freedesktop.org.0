Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 830304AE27E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 21:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDB510E2C1;
	Tue,  8 Feb 2022 20:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1962110E125
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 20:10:48 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 53423C0A66;
 Tue,  8 Feb 2022 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644351047; bh=+x3Uol0yIHfiI40VefQmQc9RPfNzaWwwHPF8zDxcnbc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=F2hE4i2mAxe61nzquY8a1dluKuu6U3KwBV2PcVNmelraY8tLD/7rF+QTN0BGAz/dB
 QVbwwO9oSX8BumYpr5h3LqGG8QTI2uJEw1LusBSlPf6Fw9hyCa3vd40u0+ikuMR1/1
 So1F0sZuO102Uq9tZglOf+BuA879dgkzib/ZQxRPXiQkjb/k7pt6kBLM0C6dqpUMn2
 xHdoE/K8Bs9qrFT/mmm+OXE9E447U+QtraQ8zw93w0VeAaKEyNZBS+7QK3Di7wiVRd
 4Gg2wat99PUPZZZ/kKnb5F8TU3q1mJINV6U8dR0yLhSjntcM1cu9PB82jQmiNx1CXD
 aaGTH16nkZCWw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E7367A0099;
 Tue,  8 Feb 2022 20:10:40 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D28580362;
 Tue,  8 Feb 2022 20:10:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RR9VZ467";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHLw5dw3ODKGVJlQjnXbq3/+IAiq0LmlnAETxOPxAwHaIWuBg864pKR2JDYY3dCbC0prJz1rnynylXtNp2oY82ubtTkaOWG8WRO7JgLP545P+f/M0LJS/qI3VSAphUl4YWKsD5Ug1IepUr7seIl96NoHjVcuhNaln7vURBtDCDh/yd9BCFyvHECQR5UROKKD+uT6M2bhY6OOTCF9MSbynxvqENoJ9MqBbuqLCu7BXC8BAy4c+BJOgBOyQ6i8ZTGEtSpbt5706qSEnLIKatQ4UP/8qNTvDBep82BWRrNGX19Ftv4Y8Vn2cCag7bySocg/BAnOBC+ns2NLzzdKkKWe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x3Uol0yIHfiI40VefQmQc9RPfNzaWwwHPF8zDxcnbc=;
 b=GIOyPJN0bTdKi348hMdLGfxosLJAFAVaDFN6jjLKDEQeHl2sthSqehxYWTXtyd0lHZ94dHQqece+pKcsrFQJsAaYpU/bVIbImMqhKvbGpaO9ckeUeCW/lZCS/1+OsCe3SUcKse3X6aDFoppfZ0uAwvvPpobR5o+1bUhu7safCBaSl9OgkdPTwLudOXtsfwrQgEC0vuFEyJTv9ouzbYK1uNvOQpADbv4ShV3c7XdGQAhSkdyXEJfU8pON8wU6EOMiCwVI9DpnJFTe/KOZY9krLuW7vYXWasP9hlycQ8Is26EnIGkV5amnEhRXEjevgaRsYI1TBKhXJkwk+uXVFqKAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x3Uol0yIHfiI40VefQmQc9RPfNzaWwwHPF8zDxcnbc=;
 b=RR9VZ467NlCLonNxOobxMdZhzMIc63/PYvIfoDuUK3u4s3Irxk1Bm9ozd6vuXuxBV89N32MV4vhuovrya6NOz8Z74jPj749SNUOGA+YIQ8NFWeHL88v5d8enCh4LtAplW8H4IBjdzt81yPlbjwU1r6jpYvqwwj6kiGqwR+xP/Tg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 8 Feb
 2022 20:10:34 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 20:10:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIAgAALfACAB1ffgA==
Date: Tue, 8 Feb 2022 20:10:34 +0000
Message-ID: <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
In-Reply-To: <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03ecfac3-7891-423f-ae60-08d9eb3f10e5
x-ms-traffictypediagnostic: BY5PR12MB4241:EE_
x-microsoft-antispam-prvs: <BY5PR12MB4241017756CDE6427B34C361AA2D9@BY5PR12MB4241.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jqKtbdpMQ88EAgc2V/KlPRFfR6yYa5zgfq+u2iKHhlufbi8IDCsDHUu81LQ9ZkbIfCEM77Ylfbrx+UpzVNKHXt/c1VzNjeX53yVaJnd7jPkPLUEGZNllBFiE5IrGbuC1FxoYXncrzIZpl7TIGNmbJqV6A16wS9sm66cHv5YQex58NuueWYJCjbqsCgax9NDbt/5h+NLh2GEbpZ9BHoQAzWjh/lalTyQQbkfcCtfVwSdyLNS+SYzLqAmPvivdnpCYBookjaj4vpeKdJQAgoxzlh55qFouMMJnkbSNf+Mnm/WuKZbcZc3T7Yhp85N0dE+l/O71BxFGNn9m9gg0oWGE220WVGwTVrPUC5QOPK+I1/BatxF83OjT89z/4vMiBS+lY4M1LFKZKGjMvrsEgFsjY96ovpNYbSC4Bzvsl7HhJhBjUqGKcUWAIGDVtuLlamhLnsta5M4AC6YFHolrJ/DK+d0RKQMRUOec43XxutuArhyHX5c3u0XcLwVtw6Q81ot6duS5fu0dI+iuc0Xy9ulPEqY26Sd608iM/C9S3stTpfGlKFSJ0Ws+iECGyXCB9dd7RzUEU5PClrs08hpPi0Q42yu9oQbdJppBZUhbTygv3qPFnBJGlYp8Wr6Run1e62wM2WSHVlN4nMN87t32CEUDvAOrCzt5yZ9+OkRx3Tior0jf17Ro/7wtWburnjZq2WP/pc5Gl7qLmzx1hiEMhXClOt+xkpauZ/5DbXyRujD2H+LyNVzuQ29cM1iwEsNx4VcIBFIZqsXtopRMxZVNCzD/bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(316002)(53546011)(36756003)(31686004)(6506007)(6512007)(110136005)(66476007)(66446008)(5660300002)(76116006)(8936002)(66946007)(66556008)(4326008)(2906002)(38070700005)(8676002)(86362001)(38100700002)(122000001)(6486002)(186003)(26005)(2616005)(31696002)(83380400001)(64756008)(54906003)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGJ4Mm9KUE9HcUJPK1l5RERZRnl4M21HUXVUL08yeXFVakFGSFBjNnB2bGdL?=
 =?utf-8?B?NFdhV0xXek9ad1B1Mk5yd2tyTUthTlhRdGhRZFZ0VnRBRTF3QitVTjRDYjlD?=
 =?utf-8?B?Sk9oK2EvR25CWlZHQWZRY25QWFVxZExrK3k4QnlPaEZBMStwOTNTc0VoeUxC?=
 =?utf-8?B?SzVVUFhvdUFWbWs1bFM4U0EvbmI1eDk2by93QVFVSVNoVkJHNkJsKzh6U2x5?=
 =?utf-8?B?UGRWM2NocHBaTjNjVjZOaXIvclpsMi9wQ0ZZbHdEQmZaYXBnU1QyL0ZWbFF4?=
 =?utf-8?B?TGFXWDdWWUczL1UwUFFvTS93VzBLSlhuNnZLS2U2b2xIb29NcHpBbElpZUZp?=
 =?utf-8?B?em1aRjFuTk43VTYvM3I1SFZqS3NLb01YOVpXVDI4ZkpHN1dDTE51dklUNSsy?=
 =?utf-8?B?bWo0YWdYck4rV1lNMDg3NDl6SWJucHdjY0VLdGhGYXd2WGhKUzIrQmhFMUpu?=
 =?utf-8?B?bUxPRkZjUmFIRHU0UklIR00vRzNjRjVLbXlKdVBWV2tXd2VrcGsvcHNMS09y?=
 =?utf-8?B?ajMxbVZBNG9DcHhoNUV1YllDOXdUb1ZVb0haVnF4bURSc0FsbWY0c0RJeVBw?=
 =?utf-8?B?ZDdrWGJZdjVKQ0Q1aWRwSFEyTnNPZ1d1MmRhc3J6K1BXeFRxTXlERUttZXdm?=
 =?utf-8?B?TDhUbkNQbitLMnl3RnpGYW55SUsxUlVyYmphNlVwSXljTlVWUEhsbk1VOVFj?=
 =?utf-8?B?T1NGR2gzTDk1TDd1SSsvenFXcUFocS9QL01Lc0lTRnIzNFc0M1VGUkVhcG1N?=
 =?utf-8?B?OEhWeXY4Y2RzQkdYbU5MdUsyaG9TdFgvdDVJODA1UUVQVDVobytPRVZlT1dD?=
 =?utf-8?B?aGU0VW9GeVM4bU45MTJnUTBQVzB6RUVQVkU5L0drRFZrcXBzbTA4S1E2SHpr?=
 =?utf-8?B?MFBKVG5MUGF1US82MUkwRTBSR3RXTzB4ODFmaDRicVl1V05sOE5QdG1EQjZZ?=
 =?utf-8?B?aE9JUkFOQjQrRHNySlVnTHUwdHVJamhwQ2tndmxoQ2g3VmVWZjUwMVVxK3Jt?=
 =?utf-8?B?N2hRbmdUcGx5SHpEZE1YRWtVNGlTa1hUSUZDZWpZNGU4bUdsaEgwdFo4endK?=
 =?utf-8?B?N25GYTlJR0c5ak83V0htT0NkU1hwd0ZOeGd0TG83M1gyQWZJRTVhWi93UUNT?=
 =?utf-8?B?bkE0bnVLajBEY1BiWFNLc3lyOW8yRmIwZzJ0eVVKZUFNNEhhR1lRMW1vNzhF?=
 =?utf-8?B?K2Q5cVZLOEw4VHlmbzViM2R1ZDEvdmYzaWtYamJKaSt0K3I2TGxudnlEeUp3?=
 =?utf-8?B?OFpTRUdOTDlDWTBDajVEN1FXMkI5TFVFVk5SMUFSQWd3UVArUmFPUFUwRUVE?=
 =?utf-8?B?Vm96QXVNZXFGMGpNTUJGMzZEZUF1WS9ZbXFHSU1IUit0aU9EWUUyYUEwMHl6?=
 =?utf-8?B?UUZUZTI1TkxxMFNsbWZpUzdoSTRHSU9pb2xKUC9qM3AwTUJxUGh1VEY0MDNq?=
 =?utf-8?B?NVpXelZHRFIrNDE3RnVCNkZPcXN1Y2h1aytKQ3FsdGpmTjMvNUgzVXJSRE00?=
 =?utf-8?B?QmI3THVQSTZNbW9jaWZUWDFodW9PaENwZEozd3dCKzlPTnFhNVE5WjdxSHZh?=
 =?utf-8?B?cjFGS0xGcjNXWjdWZnJWa3owMldmQ2Nua2lGL0Q5MHdJMUV5T1JnYXM1VWVS?=
 =?utf-8?B?VnQ3dUlCT3FrR3N3ZWp3UTJyakdJOWIxZlQweFI3QlZyQWk1L0ROb3lEOWh5?=
 =?utf-8?B?dTV5R2tFRldRSzVrZXVwM2ptSkFSby95OE9WRWhudTMvNlo3enZOQXVYdVd0?=
 =?utf-8?B?cTh6TE9RSGdobW1jWlFra2ZVdGNiVkhFWUttSnQ1bk8xelBFR0J6anI4emY1?=
 =?utf-8?B?b3hwNDRFeERmaWllTmxnaDJsanBoY3RkOWhmSE9vZmJXSisrTWJvZGxMSHF4?=
 =?utf-8?B?MTZXRHhVTGV1SUl6dkkzUERERUhKTXY5SUhONEhVUmx0K1NHR1dtTEhCM0RJ?=
 =?utf-8?B?M2huRGtlWE9KTjlaZ1lXLzJ0MllpSmsyNCs2QlJtUFA4aTh5UXRhTDVqc2ZG?=
 =?utf-8?B?VWF5ZnlBbTJrVmM3ZmMvQ1luMTIycnBTc0NjeUxRR2FHdzJLK0UwcXF3TENO?=
 =?utf-8?B?ZDBnK0daTmVWUnhFVStkZ0pRcEthd2dwYWJpWDhST1NpTGpXdTI3ZmZxanRo?=
 =?utf-8?B?eXpSNGpMZjJDTVNmQWo0bldVRmtTdVlKY3JGOHZNdkFJcExFOWhqY1pEQkNv?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C78DCE788E9C847BCDE3906394636D0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ecfac3-7891-423f-ae60-08d9eb3f10e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 20:10:34.4997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zI0COjSS9DCOecZ0SE08yD4Lr5p0MmFF9PwknipctUJ/mKtWoM2R1fgFxJoOaW2KVL0YOFPMoscLw/HgUGHDiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241
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

UmFuZHkgRHVubGFwIHdyb3RlOg0KPiANCj4gDQo+IE9uIDIvMy8yMiAxOToyMSwgVGhpbmggTmd1
eWVuIHdyb3RlOg0KPj4gQXJuZCBCZXJnbWFubiB3cm90ZToNCj4+PiBPbiBUaHUsIEZlYiAzLCAy
MDIyIGF0IDEyOjU1IEFNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4g
d3JvdGU6DQo+Pj4+IEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4+PiBPbiBXZWQsIEZlYiAyLCAy
MDIyIGF0IDE6MTQgQU0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3
cm90ZToNCj4+Pj4+PiBGYWJpbyBFc3RldmFtIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+IENPTkZJR19G
QiBzaG91bGQgbm90IG5vcm1hbGx5IGJlIG5lZWRlZCBmb3IgYm9vdGluZywgc28gdW5sZXNzDQo+
Pj4+PiB5b3UgaGF2ZSBhIGdyYXBoaWNhbCBhcHBsaWNhdGlvbiBpbiB5b3VyIGluaXRyYW1mcyB0
aGF0IHJlcXVpcmVzIHRoZSAvZGV2L2ZiMA0KPj4+Pj4gZGV2aWNlIHRvIHdvcmssIGl0IGlzIG5v
dCBzdXBwb3NlZCB0byBtYWtlIGEgZGlmZmVyZW5jZS4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEknbSBu
b3Qgc3VyZSwgYnV0IGl0IHNlZW1zIGxpa2UgdGhlIHNldHVwIHdlIGhhdmUgaXNuJ3QgdGhlIG9u
bHkgb25lDQo+Pj4+IHRoYXQgbmVlZGVkIGl0LiBGYWJpbyBhbHNvIG5vdGVkIHRoYXQgdGhlIGlt
eF92Nl92N19kZWZjb25maWcgYWxzbyBuZWVkcw0KPj4+PiB0byBoYXZlIENPTkZJR19GQiBzZXQu
DQo+Pj4NCj4+PiBObywgdGhhdCBvbmUgaXMgZGlmZmVyZW50OiB0aGUgY2hhbmdlIGZvciBpbXhf
djZfdjdfZGVmY29uZmlnIHdhcw0KPj4+IGRvbmUgYmVjYXVzZSB0aGV5IGFjdHVhbGx5IHVzZSBh
IGZyYW1lYnVmZmVyIGNvbnNvbGUgb24gc29tZSBkZXZpY2VzLA0KPj4+IHNvIHRoZSBwYXRjaCBq
dXN0IGFkZHMgdGhlIHN5bWJvbCB0byBlbmFibGUgdGhlIGRyaXZlcnMgdGhleSBhcmUgdXNpbmcu
DQo+Pj4NCj4+PiBUaGlzIGlzIGV4cGVjdGVkIHdpdGggbXkgb3JpZ2luYWwgcGF0Y2ggdGhhdCBk
b2Vzbid0IGltcGxpY2l0bHkgZW5hYmxlDQo+Pj4gdGhlIGZyYW1lYnVmZmVyIGxheWVyIGFueSBt
b3JlLiBXaGF0IGlzIG5vdCBleHBlY3RlZCBpcyBmb3IgdGhlIGtlcm5lbA0KPj4+IHRvIGhhbmcg
ZHVyaW5nIGJvb3QgYXMgeW91IHJlcG9ydGVkIGZvciB5b3VyIHVuaWRlbnRpZmllZCBwbGF0Zm9y
bS4NCj4+Pg0KPj4+Pj4gQXJlIHRoZXJlIGFueSBvdGhlciBkaWZmZXJlbmNlcyBpbiB5b3VyIC5j
b25maWcgYmVmb3JlIGFuZCBhZnRlciB0aGUgcGF0Y2g/DQo+Pj4+PiBJdCdzIHBvc3NpYmxlIHRo
YXQgeW91IHVzZSBzb21lIG90aGVyIGRyaXZlciB0aGF0IGluIHR1cm4gZGVwZW5kcyBvbg0KPj4+
Pj4gQ09ORklHX0ZCLiBEb2VzIHlvdXIgbWFjaGluZSBoYXZlIGFueSBncmFwaGljYWwgb3V0cHV0
IGRldmljZT8NCj4+Pj4+IElmIHllcywgd2hpY2ggZHJpdmVyIGRvIHlvdSB1c2U/DQo+Pj4+DQo+
Pj4+IEkgZG9uJ3QgaGF2ZSB0aGUgYW5zd2VyIHRvIHRob3NlIHF1ZXN0aW9ucyB5ZXQuIE5lZWQg
bW9yZSBpbnZlc3RpZ2F0aW9uLg0KPj4+PiBJJ20gbmV3IHRvIHRoaXMgcGFydGljdWxhciB0ZXN0
IHNldHVwLg0KPj4+DQo+Pj4gRG8geW91IG1lYW4geW91IGRvbid0IGtub3cgaWYgdGhlcmUgaXMg
YSBzY3JlZW4gYXR0YWNoZWQgdG8gdGhlIHN5c3RlbT8NCj4+Pg0KPj4NCj4+IEl0IGRvZXMgaGF2
ZSBhIGdyYXBoaWNhbCBvdXRwdXQgZGV2aWNlLCBidXQgSSBkaWRuJ3QgY2hlY2sgd2hhdCBpdCBp
cyBvcg0KPj4gd2hhdCBkcml2ZXIgaXMgZHJpdmluZyBpdC4gSSBqdXN0IG5vdGljZSB0aGF0IGFm
dGVyIHRoZSByZXBvcnRlZCBjb21taXQsDQo+PiBzb21ldGhpbmcgc3RvcHBlZCB3b3JraW5nLg0K
Pj4NCj4+Pj4+DQo+Pj4+PiBZb3UgbWF5IGFsc28gd2FudCB0byBtYWtlIHN1cmUgdGhhdCB5b3Ug
aGF2ZSA5ZDYzNjZlNzQzZjMgKCJkcm06DQo+Pj4+PiBmYl9oZWxwZXI6IGltcHJvdmUgQ09ORklH
X0ZCIGRlcGVuZGVuY3kiKSBpbiB5b3VyIGtlcm5lbCwgd2hpY2gNCj4+Pj4+IGZpeGVzIGEgbWlu
b3IgcHJvYmxlbSB3aXRoIG15IG9yaWdpbmFsIHBhdGNoLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gVGhl
IGlzc3VlIGFsc28gb2NjdXJzIGluIG1haW5saW5lLCB3aGljaCBoYXMgeW91ciBtaW5vciBmaXgg
Y29tbWl0DQo+Pj4+IGFib3ZlLiBUaGUgcmV2ZXJ0IGlzbid0IGNsZWFuIGZvciB0aGUgbGF0ZXN0
IGtlcm5lbCB2ZXJzaW9uLiBJIGFsc28gaGF2ZQ0KPj4+PiB0byByZXZlcnQgc29tZSBvZiB0aGUg
Y2hhbmdlcyBhbG9uZyB3aXRoIENPTkZJR19GQi4gVGhlIHJldmVydCBsb29rcw0KPj4+PiBtb3Jl
IGxpa2UgdGhpcyBmb3IgdGhlIGxhdGVzdCBrZXJuZWw6DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+Pj4+
IGluZGV4IGIxZjIyZTQ1N2ZkMC4uN2NiYzczM2E4NTY5IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0K
Pj4+PiBAQCAtMTE4LDggKzExOCw5IEBAIGNvbmZpZyBEUk1fREVCVUdfTU9ERVNFVF9MT0NLDQo+
Pj4+DQo+Pj4+ICBjb25maWcgRFJNX0ZCREVWX0VNVUxBVElPTg0KPj4+PiAgICAgICAgIGJvb2wg
IkVuYWJsZSBsZWdhY3kgZmJkZXYgc3VwcG9ydCBmb3IgeW91ciBtb2Rlc2V0dGluZyBkcml2ZXIi
DQo+Pj4+IC0gICAgICAgZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBFUg0KPj4+PiAtICAgICAgIGRl
cGVuZHMgb24gRkI9eSB8fCBGQj1EUk1fS01TX0hFTFBFUg0KPj4+PiArICAgICAgIGRlcGVuZHMg
b24gRFJNDQo+Pj4+ICsgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+Pj4+ICsgICAgICAg
c2VsZWN0IEZCDQo+Pj4+ICAgICAgICAgc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPj4+PiAgICAg
ICAgIHNlbGVjdCBGQl9DRkJfQ09QWUFSRUENCj4+Pj4gICAgICAgICBzZWxlY3QgRkJfQ0ZCX0lN
QUdFQkxJVA0KPj4+Pg0KPj4+Pg0KPj4+Pg0KPj4+PiBJIGF0dGFjaGVkIHRoZSBjb25maWdzIGZv
ciBrZXJuZWwgdjUuMTctcmMxLiBUaGUgImJhZCIgY29uZmlnIGlzIHdpdGhvdXQNCj4+Pj4gYW55
IHJldmVydCwgdGhlICJnb29kIiBjb25maWcgaXMgd2l0aCB0aGUgY2hhbmdlIGFib3ZlLg0KPj4+
DQo+Pj4gTG9va2luZyBhdCB0aGUgY29uZmlnLCBJIHNlZSB0aGF0IHRoaXMgaXMgZm9yIGFuIHg4
NiBtYWNoaW5lLA0KPj4+IGFuZCB5b3UgaGF2ZSB0aGUgRkJfRUZJIGRyaXZlciBhbmQgRUZJX0VB
UkxZQ09OIGVuYWJsZWQuDQo+Pj4NCj4+PiBXaGF0IEkgc3VzcGVjIGlzIGdvaW5nIG9uIGlzIHRo
YXQgeW91IGFyZSBsb29raW5nIGF0IGEgc2NyZWVuIHJhdGhlcg0KPj4+IHRoYW4gYSBzZXJpYWwg
Y29uc29sZSwgYW5kIHRoZSBrZXJuZWwgZG9lc24ndCBhY3R1YWxseSBoYW5nIGJ1dCB5b3UNCj4+
PiBqdXN0IGRvbid0IHNlZSBhbnkgbW9yZSBtZXNzYWdlcyBhZnRlciB0aGUgRFJNIGRyaXZlciB0
YWtlcw0KPj4+IG92ZXIgZnJvbSBFRklfRUFSTFlDT04gYmVjYXVzZSB0aGVyZSBpcyBubyBjb25z
b2xlIGRyaXZlci4NCj4+Pg0KPj4+IEluIHRoaXMgY2FzZSwgd2hhdCB5b3Ugc2VlIGlzIHRoZSBp
bnRlbmRlZCBiZWhhdmlvciwgbm90IGEgYnVnLg0KPj4+IElmIHlvdSB3YW50IGEgZ3JhcGhpY2Fs
IGNvbnNvbGUgaW4geW91ciBzeXN0ZW0sIHlvdSBuZWVkIHRvDQo+Pj4gZW5hYmxlIHRoZSBzdXBw
b3J0IGZvciB0aGlzIGluIHlvdXIgY29uZmlnLg0KPj4+DQo+Pg0KPj4gSXQgc291bmRzIGxpa2Ug
dGhhdCdzIHRoZSBjYXNlLiBVbmZvcnR1bmF0ZWx5IEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlz
DQo+PiBzdWJzeXN0ZW0gdG8gc2F5IHRoYXQncyB3aGF0IGhhcHBlbmluZy4gSWYgdGhlcmUncyBu
b3RoaW5nIGFjdHVhbGx5DQo+PiBicm9rZW4gZnJvbSByZXZpZXcsIHdlIGNhbiBpZ25vcmUgdGhp
cyBlbWFpbCB0aHJlYWQuDQo+IA0KPiBIaSwNCj4gSSBkb24ndCBrbm93IG9mIGFueXRoaW5nIHRo
YXQgaXMgYnJva2VuLi4uDQo+IA0KPiBJIGFtIGN1cmlvdXMgaG93IENPTkZJR19GQl9FRkkgY2Ft
ZSB0byBiZSBzZXQgd2hlbiBnb2luZyBmcm9tIGJhZC5jb25maWcgdG8NCj4gZ29vZC5jb25maWcu
ICBDYW4geW91IGV4cGxhaW4gdGhhdD8NCj4gDQoNCkkganVzdCB1c2UgdGhlIGNoYW5nZSBhYm92
ZSBhbmQgIm1ha2UiIHdpdGggb2xkZGVmY29uZmlnIG9wdGlvbi4gSXMgaXQNCm5vdCBleHBlY3Rl
ZD8NCg0KVGhhbmtzLA0KVGhpbmgNCg0K
