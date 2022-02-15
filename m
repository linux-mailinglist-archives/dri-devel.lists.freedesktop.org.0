Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370B4B613B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 03:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152C910E11C;
	Tue, 15 Feb 2022 02:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7910E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 02:53:01 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5B1F1C08BD;
 Tue, 15 Feb 2022 02:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644893580; bh=SDaRNvfFC0/XYxCZ1lahEpiY3Lqf/b5FMDzaGYJWt98=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=GYrI7gSK3uSkG61+Mc1eCQYz8k0J/mgfRDCaLgKX1456FaI40+dbM4BcZkJnQGO3f
 9y9H20cfIXVaEpOxsS98xv+5uXGLeKbqNRUDOdkQnV5MhFmYs2Pc/XDruPpZn9TWgb
 ps4rgbNvLtOsB/03ZrpT2spPhct8I3HeRR8X/ERpmrlLwaZIP3h8d1iemQHYZga0SK
 nO0IW3fMa3BjP8skR3ACMc5L7OF+5AgcGHOA+mrf5znsGUrItoBGO1gCO1y/XCkQaq
 Ne/qTl/J+VjNYtbfXjjJhGtpJvC/Zi9D+M7/miuJAx6M1SdUEbTFGcrX6SZ5JFv2F6
 j+Xh8ku7qQRLw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id CEC8EA0096;
 Tue, 15 Feb 2022 02:52:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CD09F40097;
 Tue, 15 Feb 2022 02:52:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="FAEh/6sk";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuzRI4WpPBYxiZEuTTSccWmcVW8P2w9Q1yoxwYaQKRqKzY6hET/EpnFy5HnKdpxjlScRHrgAMzUQyzZnYt9tKJ6tIYvFisMkE5hX7qNTXZ0uAib8MJmq28R8l88De8JS0ceFoqF/pJvXA6IgLljqC8Ndx0MH+Bc+gaplTyX4EGG98SefhtNS0BnWlJVPbRyWYupiye7ABWvYftyCdRE+GN/c5YxNtNUTeuHJPqtBDoiAIkCXjNh4Pc9bKLdHTXD2jRlHRDu4isi7miv7lUMi8aVbc2p9QO7D9yFqFdHeO2LVUJWd+fupKU/q++U199/ABN97jlEMYnLHbxdYBjxIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDaRNvfFC0/XYxCZ1lahEpiY3Lqf/b5FMDzaGYJWt98=;
 b=JaogmmXU68doeUYyxSwC3KkmlstsYsg56mDsl2EdxGEEtAfxavHacDISV7JrFiKFwT+UFAzwJ/N/UwtARo5TwoP6uv0tQm0qevf0OoRSElBJq7ndr+cAXvdmybc93q6eTnit+VvBEhcxW29iWAU3ifMP4ulIGEzeaDMNrfZ73QewqLeGKGTiQ51PbZFbThnUMiS1xW6ybXVUJmozyQwbisx+sjZups4vheCbOQZDBSifzobiLwAcXFjllQ+/Yq+RGSXGrVW+nyERnwGRdo4+6OXIKyv9hlQH58Q1GDln6W4L1KSDL6o29fbGChDdJ6fixeJUOKCeVaYeaUQI8AzKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDaRNvfFC0/XYxCZ1lahEpiY3Lqf/b5FMDzaGYJWt98=;
 b=FAEh/6skQYFvJivBlyUS4pi1PeUaifjYLNrkiK4him+t8C+Aa/Q1DUKIHelfTj2GY+N6TPMuVVfEbegiKTReoIwDOSU1HkWWWLr/TQfWQsI1RsLdwZamleYm2ef2/lzqxWxtfxslnPIqjdDGCr7qmuzs2asVFZVmFQDvGS6xtmg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN7PR12MB2659.namprd12.prod.outlook.com (2603:10b6:408:27::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 02:52:49 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4975.017; Tue, 15 Feb 2022
 02:52:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAAHuWgIABUBIAgAALfACAB1ffgIAACc0AgAAgrgCAAIzUAIAJJxEA
Date: Tue, 15 Feb 2022 02:52:48 +0000
Message-ID: <aaadb6af-0ce7-548c-84a1-f880d1999cbb@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
 <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
 <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
 <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
 <CAK8P3a3bJcMKW5QJqoUT8jDe+cbK0A-zSbNZhveX0WwC=ZEUqw@mail.gmail.com>
In-Reply-To: <CAK8P3a3bJcMKW5QJqoUT8jDe+cbK0A-zSbNZhveX0WwC=ZEUqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d5dc75d-888b-4431-4afe-08d9f02e407f
x-ms-traffictypediagnostic: BN7PR12MB2659:EE_
x-microsoft-antispam-prvs: <BN7PR12MB265992E23F96F1EE9E7DB3ECAA349@BN7PR12MB2659.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NixWRczuzvdRiriMwnl7meMeyyicQFIhi5S1jzaX5pymC6nQtFHxR3lTdePETkZWEMqntqYa4b7ii4tvx07k7F4vqj2pEhGhdbc5nJf1fk8nGYLhCIPB8bApe1Kb+dEp9GYornsbkfOZlzpkn0MYwJRd6ei2AXJAXJexocWnZz5wUYc2PcOGd7fbAqGBxTZiv/Y6/OjPN9Tv25bwM/k8zPqYc/AFtx+wjc91o70KXmjx8OyIw9vw6qpXuxhTDUxu2wc+orKY6OlRjMZ8+32eylwAaM9ZXyVcSY90jq0kHXeIACACDKcxgCgoIXrmdYInAUahr009llJn2uf12DMmM/hk1TE3gi1VMnwwAbRLvt51kQryqKFqWmX50zchcNN9sgPeYbp6HcAy7lFAV3c4Sxg7M9OQuH+bKf+tb1xnhWWHhkNqYPJtaS3N6gCdwVo2bZQ+vIALpAFEKsi3q6twKgoqKaH+3QhUeJuAwVGKJXLLKU2NK9SoqOQwPriUwlnP1TiZFbmsxj/x2957vEHRD+VaTkz/o3c7PlQyIjYcpQHN33SXzlaVSy8LfHR6XTvvSHifBzOSOci1M9eZ0LSQ4M0L9J3Qs46PJQ40b0deWtTnXRzaByUWj2wquaeKw1+TSnyhBE5mGqBNkFuci7A+sODEPkBAAvCH0E9nV7s313PG5seuqiXZWWChJj+RaozWmRypCU4wf/ly5SHgxXv/Ms/lIqUfG1TZesNn8uUdLhY4sxMrOUtNARQ4CGg/vfwSIm3rpU2qCnIgJdJU9UxAxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(5660300002)(53546011)(6506007)(4744005)(122000001)(186003)(6512007)(31696002)(36756003)(38100700002)(86362001)(4326008)(8676002)(38070700005)(2906002)(8936002)(31686004)(508600001)(66476007)(71200400001)(2616005)(316002)(76116006)(66556008)(64756008)(66446008)(66946007)(110136005)(6486002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVVibGtYdGxvSzZNdExXcSt5MERuM0VWazQ5a05yUnh0RFBhM1J0WFZTOXkw?=
 =?utf-8?B?VE12aUF4SHBZSUZMSk0yVDdQbitnaGl4d0ZXVk5DT3J0OGFpdGFVTXUxbnRt?=
 =?utf-8?B?OHMyYytjN0cyWTFFWWIyTXhGOVA5cCtvQmp4b3RSSXBZRU81dDEyUHY1UUty?=
 =?utf-8?B?TC9qNjF0TU5SNm9kY1p6QWs4MTJ5RUxWRDdIZVpJcUIvYnEyYlJqcUdOcXZX?=
 =?utf-8?B?d1JmSGpGQVZEbTNhWnFveGxoSWZGV3JzSUdhN3hZbWtQRmZXTWFLRlpBYzRO?=
 =?utf-8?B?NnlhbENFWkRHVG9yNlVTTHdJcTNkT1ZVdFFJNXhNc2xhNlAycTl1bUFkaDFw?=
 =?utf-8?B?OVQwVERsaTRFTDlMWFBMSTI1M1dYNXVUN1J5QzljMC9aZzNsWEJyb0dlakVJ?=
 =?utf-8?B?QXhkbFVkQy81VFQrQ1F5bHpkeGlDTlFqdSs3ZVZFTWhRcFI4R1VlT2JaTjRp?=
 =?utf-8?B?eGNzTUdONjZKRml6ci9rRlBwd2FhN2FZS2hYencyY2Flbk9YYU40UU5HTEd1?=
 =?utf-8?B?em5lcC80YmwvOVVlcFVhZnJrNlFMOGl6R1FqaGxsZTk3d1Q1OTlxaytETGsy?=
 =?utf-8?B?WVc3eG0xVmtVSHpubEF3WEVCa1A4SllVamNsTFJlUTd5cU56YlFRU0xrbEJ6?=
 =?utf-8?B?VC9yWkZaMWpaM1BzQ3NtRHgvblp3UmZ0S2FPZllXMXRNcmhiaE1NNDhsbGtS?=
 =?utf-8?B?bGdrTWVJOEtrMjROVG1lRG1SQ1I5MzdCKzZRQzExRHAydStZUHY1VzNBUTE4?=
 =?utf-8?B?emxPZHpza1piR2ZEalk0SXE2K1VqMzYycDYwSmIyc21qR0xCbnk4OVZYL1pk?=
 =?utf-8?B?VW5MZmwzOEJzY0VDZzNlNjZIVkRyS0xmbFRGLzNCQWlYeFMrUUs1RTgzVlJm?=
 =?utf-8?B?SElGVkNNblUvV2ZybVVkYXdLSURIT3R2VXk1cUhtcEtKQkhwdHlxdE5UMk9H?=
 =?utf-8?B?Y2F4SmtpSlRuYWNDRDhrTGg1ZXRHRW0xODNtRW8rdzNlOVNrVXo1UXJEa2NL?=
 =?utf-8?B?WVFHMFY3TTNHL2wvVWlQRXFZM21KaDdxNGVacDFtNGhqbmNCMWJRcFNBRTgr?=
 =?utf-8?B?WUowZVZMZmxHTmZvZUJCd1lvcGgzMGRDSUhYMkQzWlFJWS81OFpObU1nandU?=
 =?utf-8?B?d1AwM3ZGY0NvVzBHSU5TT2hxUjdGRjE4SHI3d2crY0ZPSEVqeGxIZjZqMnhh?=
 =?utf-8?B?eGJoY1g4c3JzeDd1OEFlcEZNZXZmZDgrSC9nUlZIaGNVY0tBaHJnc2xKSWJj?=
 =?utf-8?B?R25tbnVibm8xZ2xuaG9RSldTam84SVBuQ3RIT1hJZW4rek56NDlyRGt2OXc3?=
 =?utf-8?B?Z3FMdGdBZVJiTlpLc0J3akM4UWY3RTBOQnpWUmNrdHAxL09lbklrRUJGMW1M?=
 =?utf-8?B?WTNhS25qL0tsMVJhcElmNEtUMWt5MkJqSngrcHJZa01vT2RwYkdzV0xmZEpV?=
 =?utf-8?B?bER0Z2NLSWVCekZVbi9odFhUUTRNSEZuMlB4ckUrR1pwVG1Wa3VqSC9nNVVt?=
 =?utf-8?B?Z05sdlIvdDdGWk8rb0t6bFROQUppbE9LNjFXdnlaelJPVnNYaFZiUkhhVzBs?=
 =?utf-8?B?dktiUXZhLzVrUmVTbXlVbXNPQmtxLzdSYnh6czNPa3VIdjdURnhNLzNCYXVE?=
 =?utf-8?B?RXRRbFJEUzBORkNleTVqVVhVK1RyQUlLM2djQ1dzcExZTm5jVzU4SGV5ZXpz?=
 =?utf-8?B?dy9FNWp3SW56MUpubVYxTVJ6QWJWMG9aamlwT2VIZlpjWmNWUG5wMnFPOFR0?=
 =?utf-8?B?UWVkbmZ6MnE2blh0bStMTGJMY29hTzE0MGpqU2IvOFJmMHdSZVBmRjJFN3Ji?=
 =?utf-8?B?UjUyUUxraUl0Z1VEOXI4Si93R0MvTGlZTDNLamhHTVpaUmtZQmk1MFFKSTBl?=
 =?utf-8?B?WVhLTGNUR0p4eGNvRVVVR1I1M0dQWkp4ZmllOEVkalpiSWNob2lkT2M3em9u?=
 =?utf-8?B?TFRrRGYxYlRrbnNQcjJNb25yVUcyOW5NaklwQlQ0Y0xWMDNBTndqYkIrYlUv?=
 =?utf-8?B?VUg0K2g2K3o5VUZXdWl2NHRzS01TbDlYeDFEZjluTWt6WGY2ZVVtaDBtVG0v?=
 =?utf-8?B?Qjk5aTVtNXVtYTZTWitkTWc2WjIwWmVaUFhHamhjSXRpMkptZFVnTDBSY2N6?=
 =?utf-8?B?bkpZZnY2dFBjZXNCZzV1MWs5bURnOEtraXd1MEQ3amYrcFBJTm5kQjZFUDk5?=
 =?utf-8?Q?7EN/lPZyRxL2NkrtjbtP9ck=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38AE758DB75F864682BED8C05F53450C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5dc75d-888b-4431-4afe-08d9f02e407f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 02:52:48.7913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c40tJG6ScQd7epgDYXKs/OloIxCvep4yRsEWMkmMhrMq/mNgZ6BVwY1jd32lWT8S00x5WH8b7tn+7nDz7vNXmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2659
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

QXJuZCBCZXJnbWFubiB3cm90ZToNCj4gT24gVHVlLCBGZWIgOCwgMjAyMiBhdCAxMTo0MiBQTSBU
aGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPj4gUmFuZHkg
RHVubGFwIHdyb3RlOg0KPj4+IE9uIDIvOC8yMiAxMjoxMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
Pj4+PiBSYW5keSBEdW5sYXAgd3JvdGU6DQo+Pj4+PiBPbiAyLzMvMjIgMTk6MjEsIFRoaW5oIE5n
dXllbiB3cm90ZToNCj4gDQo+PiBBaC4uIEl0J3MgYmVjYXVzZSBJIGRvbid0IHVzZSBvbGQuY29u
ZmlnIGFzIHRoZSBiYXNlIGNvbmZpZy4gSSB1c2UNCj4+IHg4Nl82NF9kZWZjb25maWcgYXMgdGhl
IGJhc2UgcGx1cyBzb21lIGFkZGl0aW9uYWwgY29uZmlncyBJIG5lZWQsIGFuZCBpdA0KPj4gaGFz
IENPTkZJR19GQl9FRkkgc2V0IGJ5IGRlZmF1bHQuDQo+IA0KPiBEb2VzIGl0IGhhbmcgaWYgeW91
IGp1c3QgZGlzYWJsZSBDT05GSUdfRkJfRUZJIG9uIGFuIG90aGVyd2lzZSB3b3JraW5nDQo+IGtl
cm5lbD8gVGhpcyBpcyBzdXBwb3NlZCB0byBvbmx5IGRpc2FibGUgdGhlIGZyYW1lYnVmZmVyLCBi
dXQgaXQgY291bGQgYmUNCj4gdGhlIGFjdHVhbCBjYXVzZSBpZiBzb21ldGhpbmcgZWxzZSBkZXBl
bmRzIG9uIGl0cyBwcmVzZW5jZS4NCj4gDQoNCkxvb2tzIGxpa2UgZGlzYWJsaW5nIGl0IHdvcmtz
LiBOb3Qgc3VyZSB3aHkgY29uZmlnIHg4Nl82NF9kZWZjb25maWcNCm5lZWRzIGl0Lg0KDQpUaGFu
a3MsDQpUaGluaA0K
