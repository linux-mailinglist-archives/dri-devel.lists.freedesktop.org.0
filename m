Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22E84F72A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CA810F4A7;
	Fri,  9 Feb 2024 14:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="hBj2bqii";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="5LX6zr03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797E010F4A7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707488468; x=1739024468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PrBDjwMDHe1rN6xTM3rH/SH6NPiPWqHI5KTCLUu/z7E=;
 b=hBj2bqiiphai5l31nkn8KIIsFTiNi0RjEkaWLPET48R0hR8RGULg/eLI
 sO7cNUr72rl8XpAOJp0QjJyWCs22H8imGuiheiicBFafOIpVHkeFGV/RX
 aN3HayCQ+qLIkpBDOiwVqQRNIdnBCf7+3x8jA5CZkzVpLMhSjFrjgagV4
 NjiJD4GWy7hpyhYpnWaiuLTwrKXXqy3GWY1oRZZtyeeupxaPeqAuRcYdF
 whvXiSqdUG1m5Z6Bf94j4ev+AFwZ1VqMhAG0KKQlT3ySXAdY4IhhlMyHu
 9C0HXeTDA/MLAIfe0I/Po+VIyqxglXSBVUk/gGSumPofzqXeQCJE7pT3O w==;
X-CSE-ConnectionGUID: BOFYqD3jRYSD+g1sJq0Eig==
X-CSE-MsgGUID: 6psu+N1KRsS1pdT1oqD6qg==
X-IronPort-AV: E=Sophos;i="6.05,257,1701154800"; d="scan'208";a="16023057"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2024 07:21:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 07:20:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 07:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3CJMJivhzCil2h9t91pB8eBVK/tGiHza98ANHL5s1lld25zwc+PQMSHo5lQGfi3CGsIOjA4xtE7lG3SDOE0EUW4oa2E4RnSY9N8wyx73iCkiw0kH07MVm3L62k4Q7XEP6nQ82BGsZRcLJp4lk5yY83zyktjV3FWgt91rikNk/wF4LXZy9LFr54HxjcoyuntWMVPMT1hPjrPtuSVzw/uVdHrAXvHaOIAVEIN6liblYAAfxA75DZRhiLuiEcwxR8Ua32iNLJ4ZEh3L4ucIMdeTSx0wPVxDzFIvt+zOAiqGYpi9rD6IpU3kINk4norWr7jCl3sP/sKnU82nrfTx1bpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrBDjwMDHe1rN6xTM3rH/SH6NPiPWqHI5KTCLUu/z7E=;
 b=ZC4mYGLceuZHHRkmczGcno5IWbiV99Sdyw1fW/KIxcTtqyjBNXh5EPQoLrukCfxSNN9Dw2iQtVmEEpeBjHqiJ62r6J8GvEJvcqi5TXG9pbhQhWKS+XRIOlljY/q0r7IzkmNTXXHzA4cVbPYk1wXL0NGfgPsi1cKvO8t+3lSV5CGC3J5cKJF43+tpBnLwuBeAlxLGwAeHeeInBxq/f6Hj4KjTL82lb4h/IunbtMSsgkog0i2+KSNqDOiJylwxLd/taxZDt4gSFgrlq3yzOMTD0PjDyj7NBW0S1FKbGdP/cgk96mWShG4Kq04mXoYfBpOAjF03tYvRFmZyZdWMtnA4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrBDjwMDHe1rN6xTM3rH/SH6NPiPWqHI5KTCLUu/z7E=;
 b=5LX6zr03i+llHYr/ThFA1TCLsfsNcVjRBcsv0nbZQ67s1xM0deyoxbqZfI6UAsLe7h4mmVJkvE1SqXM4whJVXDVA/JqvWy3erQErMCEZFIUhkKjZ79S3dV3Oy+QrcGxxJKasJGU+xDXDAtl/uCRGxMVKNTrQl7a1pW0CSSHjY9kt0+4KBTSv2s9bki/NGmhh2eVNMGzJKZUNk2t39/lrYuCvi6BISwvhWVYIUIB+tHWqanVcBScQI4RlvIj4RqTjdXMhUF5bjeibhxS5N7yJhCWZs7NvEBEKTM0Svw++Rke4lOLw58PoZm2hyQq5F0NqJNEMfx3/F3NzzPt78B3o1w==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Fri, 9 Feb
 2024 14:20:29 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.025; Fri, 9 Feb 2024
 14:20:29 +0000
From: <Dharma.B@microchip.com>
To: <krzk@kernel.org>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, 
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Manikandan.M@microchip.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux@armlinux.org.uk>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <geert+renesas@glider.be>, <arnd@arndb.de>, <palmer@rivosinc.com>,
 <akpm@linux-foundation.org>, <gerg@linux-m68k.org>, <rdunlap@infradead.org>,
 <vbabka@suse.cz>, <linux-arm-kernel@lists.infradead.org>
CC: <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Thread-Index: AQHaWbBvihkf+H6rV0avboHB5Zg4D7EAJ24AgAHrcwA=
Date: Fri, 9 Feb 2024 14:20:29 +0000
Message-ID: <b314e446-e79c-4fa0-9b86-c58fa96133bc@microchip.com>
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-2-dharma.b@microchip.com>
 <2219df60-7235-4c37-b79c-25e7225cb7a9@kernel.org>
In-Reply-To: <2219df60-7235-4c37-b79c-25e7225cb7a9@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|MW4PR11MB6861:EE_
x-ms-office365-filtering-correlation-id: e2d859f5-ce48-436d-8603-08dc297a4472
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IltIIh1WL36fIK99N6BgBUNgMF6A4t+si/P/LYtPq30vm14+P1mv00zUWK3OhCbPGefgpFIUK343u+ScX090VqQFQU6Z0/Ym4RqCtuLnrg2ZKYMvU1S+s3srrHThdL255YFmzdyBCKwowfmCaY35hjPVCPkHCEDmC3IHA+5aAgu7VDlS98OL8oFameHTipH7jzhdUnxKhPHwdrTWa7b01Yz9V1niJgi2plBGUosmySplNVUsRfEj8hY/TZxhl9cgLIZv99H9DxaHe7XWfw4eNXDAyu70HW2GTV+R2/GUxJtoE+vK8UOK+feroKuQ1AE+pwKLCeTiSlMHG0Fj2vD3Z4ck2jAIv7bCFNvu1c/Y6YdCwXh6QqI9v0uzDK1SWqMG5OwCiDufRhIp7P9cIjyEGMMOX/SqSd8qWGjnrthvE+rAM/RBbwJEYCHpwq1TOsxYRi6UX6y5d/QIZU810+e+mi3XXzWYZCMdHzUq74E85UdCSVaocTZ4cbOZbhBpzNoSVmqWz5rEtYVkykn7jS2Se9F98Mx2ziwdZRG68cTWdK5gL0zcR9Ya5MGcwNaV1ysy4ZeQBHVkAvsMVBj5/N+JakdaLT20czjWjvyuN0CgoYKKRstC+iUxEQHQBqD2jN53IoU6OH8doF/CKkBegdNQwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230273577357003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(2906002)(31696002)(8936002)(4326008)(26005)(38070700009)(7416002)(5660300002)(36756003)(6512007)(6506007)(71200400001)(8676002)(6486002)(478600001)(53546011)(2616005)(91956017)(76116006)(110136005)(66556008)(66476007)(66446008)(64756008)(66946007)(316002)(921011)(86362001)(122000001)(31686004)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW1RWFRUcG53Q0xPR3AvV1NtOFl5Ukdva0wzT1QwRDJzN0h4aTFJMWNPMjZp?=
 =?utf-8?B?Y1B4VW5wMm1zMmNMZkYzYjJ0RGJ0NnRxKzhyeWdneXF1SXd6dFJ2b3duek0v?=
 =?utf-8?B?cWlOcmx4TDZPTEJ0MTNTcDQzMjJZUUREeDJoSWxiOG1VWDd1NnlNWktOcVBt?=
 =?utf-8?B?Nmd6NjFFS1lYNThzamozWVJnSnZQazZRQk1LajJPdFRPNk84Nk5oL2ZNeVp4?=
 =?utf-8?B?WE9FNTlEendvS0w5eUFSQWlJeWxrczNwejR5MzNOTnYwamZKWnVOd0tnaVpw?=
 =?utf-8?B?dHhiL0x4RC9rUHFFT1Vudnp6V1RBQy9ubktmOVUyWW1seStjNUZONEQySzJ0?=
 =?utf-8?B?amFkbDcyN3BoMkQrU3BBWTdCV1owS2dEdjIrVTkzYjNKUDFlR1RqS0hPNGlR?=
 =?utf-8?B?bXdvKzNjT21tbHRPazV0cUFuQ0Q4a1Jwd0dpWXduLzJKY2pEdUg3SzU5bHpR?=
 =?utf-8?B?aWpOS1htUnJHODZSYlJENTZXUXMyWHNvYzI1dTlJMXFiK3VST1NSbUFtU2hD?=
 =?utf-8?B?WUVQci9IQTdUcHp6ZHU2eWN5VDFKMkE0VUdhcGJaZ3BDazNMQkNBWS8rUERl?=
 =?utf-8?B?TjQ1dFhwQ3VxKzJNbSt4eXZmNUlBVXI1Nk1FcjRjckg2c1B3Ujc1LzZvZDBB?=
 =?utf-8?B?VXBLMnM0NUNTTmg3UFNFT0orN2NzWHZ5WG5DeDc5NEh1RU53MWhNWUEvcmJu?=
 =?utf-8?B?OUY3RE53MmZ0OWJhaWVua3AzanhYMG1KKzZva01DbS9UaStqV2NLbjFmYXRI?=
 =?utf-8?B?a3FQdkE3VVRaMW9HSnRaR3MrcElmTjRBOHVuV21zc2RsTFFTYmNGSW1zWDMy?=
 =?utf-8?B?ak04K0lQUks4ZjZsTkR6UEZMWmd0bnBMeTJYY2FKQ3NIZ3BOM1NsZS9ZeWdW?=
 =?utf-8?B?NG5BbnVQZksxRzRWMStHWU1mWXc3VmtZNTJQclFIL2ZBSzJQTDVnQnluOE9p?=
 =?utf-8?B?OVhwOWwvRWZuY2ZEaDlYcGd5bXQvRkkzclVnRjVmN1ZUbEhPQ1o5TlRNaC9V?=
 =?utf-8?B?UENXYXpEb1RBa2JBVjdtRkY5QVdtd0FZWDZ5MWdpd2sxMEw0SFljaTV1Q01i?=
 =?utf-8?B?QUxIZ05WQ0JIbTBZb1lZeFRGRk9Qakc1T0JTRzhJOG5odG1IY2ZMRU9oVVMr?=
 =?utf-8?B?WnpESGNHbGFkdTFkM3RMREk0Tkc4RTdvcWszZ2EzVDVKbnlVTXY5dmJ1OFg3?=
 =?utf-8?B?ZXgyaGVQaXkvdDlKR3FTOTF4cHk3N1B0aGVFbUZXbW9sL05aU1E2cUVKU2Yr?=
 =?utf-8?B?VVcxOTVSbUFvRlpZTjcrYSsrYUxZVUszTVhHYWNvYWZWVlQ5cnR3MGI0QnJT?=
 =?utf-8?B?cytyalU3Ym9mQkE2NzdiaVQwdHIrNE1HUlJ0OEo2QjFBaWVZQVgweGdmK09z?=
 =?utf-8?B?aHVXeWRMSjM4S2RTYnBBWURaVHVCaGRqTHFVbWp3aW10S0VnZm1QaTNHbi9x?=
 =?utf-8?B?VWcwNDhQaWpmd0RRdytMaDVtZ2p5dUJzN0pjOTM4cjZnbkFFaUJXeEMva1No?=
 =?utf-8?B?UnFDVlI2MnBnNGpGeENkeUdZU2RwTjU5cUd6cnpKWitLaWpUVElqc0ZqMWQ3?=
 =?utf-8?B?OVB5TXE0b1lCVmZsdEltdEI4R3NEaXFBNXdSeFEvU0t4RzVFelJlOHByR1da?=
 =?utf-8?B?Tmc5dzM0Y2hpMk40SmgzZnd5YmVOZHl1RWxnT1BqT2Zna1M2OVd0TmFBRHlP?=
 =?utf-8?B?NVEvTWJFTEU2WlIxL1FFb3lkNkkySVhidEw4V0NseDNWTHpNdXQ4N29aZ0s3?=
 =?utf-8?B?NjlIYzNxTnNzaDE0UHh5WGJOdnVTT21FSkRaZVZIbGhQa3MzVk5ZRGNlQXl6?=
 =?utf-8?B?MTFjK2dvOW1iNkthREthVWNBRXp2QW1RaS9qTG01OVdtSkEzandaY1RHeDls?=
 =?utf-8?B?NXI4OXVzMFpwSE1nSHJ1djhQcWlzR3VIQVBiWHJ2eDBVb2laWjZzTmtJYjU3?=
 =?utf-8?B?WUs1KzRjQ2NrcGhtRFhTbFB0cm1QQVZkbVpORnNYUWhoYmt5L1JzOC90d1Ur?=
 =?utf-8?B?SEY5alBOSGw4RzJsYWFNUm1iWTNlcHBtQXJscjhaTFF3N3I0M0RLMVNVbW1C?=
 =?utf-8?B?Q1ZtTGVuRTYwVjNOUmZwT2s5cVRucFYzUGlTYmkxcVlaNmdOa0Q0dHFTbUtK?=
 =?utf-8?Q?jXiOoV92CZfrbuNsegb72D1ZS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31E75E4BA5C0BE44B524466399453E8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d859f5-ce48-436d-8603-08dc297a4472
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 14:20:29.0737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77+7rWe0Xs4tRpabmKr4zNhLsXEQMTXIZIGkXonhJCukFqr9VDhxSVIVmwK3xTr/+pM1Lh+x1DtkeYcleQHSyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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

T24gMDgvMDIvMjQgMjozMSBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwNy8wMi8yMDI0IDExOjI3LCBE
aGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+PiBBZGQgdGhlICdzYW05eDc1LWx2ZHMnIGNv
bXBhdGlibGUgYmluZGluZywgd2hpY2ggZGVzY3JpYmVzIHRoZSBMb3cgVm9sdGFnZQ0KPj4gRGlm
ZmVyZW50aWFsIFNpZ25hbGluZyAoTFZEUykgQ29udHJvbGxlciBmb3VuZCBvbiBzb21lIE1pY3Jv
Y2hpcCdzIHNhbTl4Nw0KPj4gc2VyaWVzIFN5c3RlbS1vbi1DaGlwIChTb0MpIGRldmljZXMuIFRo
aXMgYmluZGluZyB3aWxsIGJlIHVzZWQgdG8gZGVmaW5lDQo+PiB0aGUgcHJvcGVydGllcyBhbmQg
Y29uZmlndXJhdGlvbiBmb3IgdGhlIExWRFMgQ29udHJvbGxlciBpbiBEVC4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+
DQo+IA0KPiBOb3QgdGVzdGVkLi4uDQo+IA0KPiBQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50
YWluZXJzLnBsIHRvIGdldCBhIGxpc3Qgb2YgbmVjZXNzYXJ5IHBlb3BsZQ0KPiBhbmQgbGlzdHMg
dG8gQ0MuIEl0IG1pZ2h0IGhhcHBlbiwgdGhhdCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVy
DQo+IGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkIGVudHJpZXMuIFRoZXJlZm9yZSBwbGVhc2Ug
YmUgc3VyZSB5b3UgYmFzZQ0KPiB5b3VyIHBhdGNoZXMgb24gcmVjZW50IExpbnV4IGtlcm5lbC4N
Cj4gDQo+IFRvb2xzIGxpa2UgYjQgb3Igc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBwcm92aWRl
IHlvdSBwcm9wZXIgbGlzdCBvZg0KPiBwZW9wbGUsIHNvIGZpeCB5b3VyIHdvcmtmbG93LiBUb29s
cyBtaWdodCBhbHNvIGZhaWwgaWYgeW91IHdvcmsgb24gc29tZQ0KPiBhbmNpZW50IHRyZWUgKGRv
bid0LCBpbnN0ZWFkIHVzZSBtYWlubGluZSksIHdvcmsgb24gZm9yayBvZiBrZXJuZWwNCj4gKGRv
bid0LCBpbnN0ZWFkIHVzZSBtYWlubGluZSkgb3IgeW91IGlnbm9yZSBzb21lIG1haW50YWluZXJz
IChyZWFsbHkNCj4gZG9uJ3QpLiBKdXN0IHVzZSBiNCBhbmQgZXZlcnl0aGluZyBzaG91bGQgYmUg
ZmluZSwgYWx0aG91Z2ggcmVtZW1iZXINCj4gYWJvdXQgYGI0IHByZXAgLS1hdXRvLXRvLWNjYCBp
ZiB5b3UgYWRkZWQgbmV3IHBhdGNoZXMgdG8gdGhlIHBhdGNoc2V0Lg0KPiANCj4gWW91IG1pc3Nl
ZCBhdCBsZWFzdCBkZXZpY2V0cmVlIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJl
DQo+IHRlc3RlZCBieSBhdXRvbWF0ZWQgdG9vbGluZy4gUGVyZm9ybWluZyByZXZpZXcgb24gdW50
ZXN0ZWQgY29kZSBtaWdodCBiZQ0KPiBhIHdhc3RlIG9mIHRpbWUuDQoNCkFwb2xvZ2llcyBmb3Ig
dGhlIG92ZXJzaWdodCwgc29tZWhvdyBpdCBnb3QgbWlzc2VkLg0KPiANCj4gUGxlYXNlIGtpbmRs
eSByZXNlbmQgYW5kIGluY2x1ZGUgYWxsIG5lY2Vzc2FyeSBUby9DYyBlbnRyaWVzLg0KDQpJIHdp
bGwgcmVzZW5kIHRoZSBzZXJpZXMgaW5jbHVkaW5nIGFsbCBuZWNlc3NhcnkgVG8vQ2MgZW50cmll
cy4NCg0KVGhhbmtzLg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K
DQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
