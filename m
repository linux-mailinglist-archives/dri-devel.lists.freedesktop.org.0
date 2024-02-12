Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73132850D06
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 04:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5BE10E3EB;
	Mon, 12 Feb 2024 03:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="VoqDWNB4";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="S0CTF5/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (unknown [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BD610E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 03:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707707955; x=1739243955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZKD74Rseej3ORagc7yN3z4djJzppXT2Bsf2/7D5lPlI=;
 b=VoqDWNB4wvGJfE4TVzilV2LxxyKKs2IZtBQ7FZ1C82QTKb1h/BRKskpO
 TRFN8YrXwxvygGWBMm8/oWUnjdMTXgcg1mG1/G/89UoIcpFA0Nnpu38vS
 Km+zfs/MScnltxw7xmUHbSNdgBrqE3NiLtvLN4ETgjH+3vWhqDio5ucPS
 wx29rWiSzo09j5KsX6ISzNDcf33hrtqCfuhwq0wGmfY/hxrJRninixA4u
 4/jR3RXkUzDd24eOOrwWhVHyTula4hl0H410Y/OMQ0eXoifrV11kalN7+
 nfgFfNKZ91kX5ixftpH3ZWGvtMGlA4XSUFRAhs4tW4a5OeCM1UTyr2JpA g==;
X-CSE-ConnectionGUID: qD9eXQVRQg+4Fc5/dR1tgQ==
X-CSE-MsgGUID: rm7uGgEiSAikidjzegrWtQ==
X-IronPort-AV: E=Sophos;i="6.05,262,1701154800"; d="scan'208";a="16092755"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Feb 2024 20:18:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 11 Feb 2024 20:18:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 11 Feb 2024 20:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ufv+/HkAY9KrjqWPxirOeqND9kAjQulaXubUf6TCiginIbuu1bZMOCN8M5cme/3mJOePAzDYDAh/Ie7yY+ESiI3Q161Hu5qFE49asADcP7k+/sVx8SQasOZEounwqzzeRZqOMBCQyKh+GN3gmf/vDjxfjw3B/xHQ3HnwNp+opQ/ZZ7ayYGR/BrDRCY2UwNgd0FY6gn/6EJexRG3X5ib3iKL3VY20FSa5dfzfUw62iZPW/UuDm9suDDM2zLzlsTrUtlwKZFTUS+/SMPGUgrGU4u2mVs+Umb6AsbnoDfvkPQ7Su4zy39p7AuUIiK2J/tF/RqSf1RzB5VwXtOIVa8YTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKD74Rseej3ORagc7yN3z4djJzppXT2Bsf2/7D5lPlI=;
 b=Rn0/9o5DY2Esuk6vRSUGBRryJwEGdiG01ojXXDjxpF2+LWfb/j/gHbuA+6vNi68rIUbNprplZMFTUIbFkIOVdEgjiuELobLlaQYGDSpo3CgNNA+T+D0M0jTGXe/+j37PdLjaKx64l7fQrQq5AHDxkKHauEyGzCmunG7khI2KzMPCsmMy9foF/NA3FEsZSMeBOnNK1C/dtusHw//+YyOAPC04O30xNwDyqPTt2th7bH2G575xm5nRjmfQ9jP2HMkYwTkmfIQw2g2UzjzoyFI7e6pkoCtIORMuS3K0X3oMw0H3mUX5j2WyzhgFQ3/R4OlaSsOakwBlpVZhI8dYKl042g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKD74Rseej3ORagc7yN3z4djJzppXT2Bsf2/7D5lPlI=;
 b=S0CTF5/BUw/fps41hbWHgSTvzF9rODbTUbbYZ4Mv/GUzqPfAcvaUiyQpTrUvpgwDvW3K43ilzaCLuZeYwUKrZGYIjDG42e7RWNvtLKLXeG9ECDcQ90GHGaT7IlT+Gg5KegzXYZ4hNwz4TYeRPFYz+auFzsofmeGLjRFuy5u70IQ+ZugKSLJluZURF1J8l3mqZ3nr5tJq/HBOblQjIetYzskgSmifmtywzYa631NFFoMF+Lf8TZ2Ll7CVGYNFBn9v2VURsrTajTFtcel0F+kN1S20fZf1fP2V8nMd/qn/ZMtHjFhFl2YQYRnd/31kADF7Tpn9DLxn/EtkapZuNBy9Hw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 03:18:19 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.025; Mon, 12 Feb 2024
 03:18:18 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <krzk@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
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
Thread-Index: AQHaWbBvihkf+H6rV0avboHB5Zg4D7EAJ24AgAHrcwCAAAu5gIAAEbKAgAABNQCAA99egA==
Date: Mon, 12 Feb 2024 03:18:18 +0000
Message-ID: <00e7cfa0-ce94-4254-a349-580f9f9c3681@microchip.com>
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-2-dharma.b@microchip.com>
 <2219df60-7235-4c37-b79c-25e7225cb7a9@kernel.org>
 <b314e446-e79c-4fa0-9b86-c58fa96133bc@microchip.com>
 <c82a3843-1b58-46ea-994a-8350544aa30d@microchip.com>
 <e2e1490b-0e07-43ae-ab67-2efd6f21987e@linaro.org>
 <45aa6b3e-5e76-457e-b091-084adf324385@linaro.org>
In-Reply-To: <45aa6b3e-5e76-457e-b091-084adf324385@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|IA0PR11MB7816:EE_
x-ms-office365-filtering-correlation-id: b07acfe5-b86c-427e-542a-08dc2b79428c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1mQdzcQnirq6SaQz4FApiZ+Z6z+VQ8PUYAiF6lNIZa1zfsa2TXSnmg49JHa7EJeNSr2T9GR/0gIKIITscjHrefoBYnG4aUJvZgB/oiTPpRcMaM+NHM9h5/MhwDEPi5ns0dL28NKZmtJ6E5MQkNdp0CMM5noERsKaRX9HgB2HOrBmkdt23nD5wdRxMmN7MBz8pmckMsrr7IMO4gszV+qYV5u2GKQ80wtewwCQnJnlYqKBHFr/xzFmLKpe5cdjitGqPHh3Y3BTsFXsmVqdWezftzbkk9WyvkV3C2EcjcFVsSTURSlg33QnFo1H9aTMBAc0JZLo7T4QOrnwVMk2A1eT4PcV97HfZKl/IC+FqEZRDtMiG5luYVEw+b3d1zz1H6u4KeEkUL3wnu1XVK6JKFdmdNf+GYOpoalC0ueMRVeWC7m6uumHnxS6DVbeN8EQznLTwo4TtS2l1UqHPjhRRwkCfR0K6ilopsvNHn3TUgX9IhLbnhhxQwcgKdJw61n24DMSnPb73kTdssFcIfksbOgM+BhfkkZiUpPOjwH8ltcVC/wFfOs/LZeD8+jFMudOjYMmRqp3FM0TseJJ/VtsNkUy2QSFk+8cziBw1hRzckSNwC+l5sNYUG3trABmpnrcjXkk6QxKyKsE/AJFc1Rsu4nq1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(36756003)(4326008)(38070700009)(921011)(71200400001)(6506007)(53546011)(6486002)(478600001)(26005)(6512007)(2616005)(2906002)(64756008)(66476007)(7406005)(7416002)(5660300002)(110136005)(66446008)(91956017)(66556008)(76116006)(66946007)(8676002)(316002)(8936002)(86362001)(31696002)(122000001)(38100700002)(41300700001)(31686004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0JrOWpXOHMvcUd1eHhVL0RIRXo2dDU1OWFsUGlGR3IrVStoTWoxbzFLeTlF?=
 =?utf-8?B?T2U3Z0ZWNng4MWpReTdIWmY4M01uSnREOTVJZ21qeW83OVlaUnhmNWZyQWxh?=
 =?utf-8?B?akJaY3NRT0JQYlhJbHowb3dvalJDMmFScXViZ1RsMERYM0FPRHRIK2xlSzYr?=
 =?utf-8?B?Q2RRaTkyZUNxUmNnMlloYTZGZVlWa3dQdUJNS2xyeXl0NGRZZXJ1bldVa0lr?=
 =?utf-8?B?TmlkR1JNUFc2bWxjUHRwY3BTZEF1NGhpWThZK24yMHEwOExYOUxwQWUzRlZs?=
 =?utf-8?B?S3lhdlk0Uy9JdG1qK2ZmeWZ5TlZpVzFGTWdpaEJhRWF0dm1wQjl3UzZvRmZF?=
 =?utf-8?B?SDd1YldaWVJ6Mk13bjRIS1ZEOWU1UlBuQmIvY2x5bEV6dkFEZ3prS2xqcldl?=
 =?utf-8?B?R0lyVU5HM0tidlpOK3g3c1cramZZV3J4QkNUbnp0YTg3ZGZjeXBmREc5WDJQ?=
 =?utf-8?B?dk1SUktSV2ErTlBCblhIcGN2bll6OFkxQ2U1L29Sb1NPSktKZVM2QnNwalRn?=
 =?utf-8?B?cGlnMWJiMHdaMjhTdldXN3dRckowNlpXc0p1aTk3NnVFdjRaTklJbU1FNTBy?=
 =?utf-8?B?RDB5VTZHaVMwMVRROEpST2tocDhEcUxHZUl4MDFrNFArTFJNVlBzQXdCbWd4?=
 =?utf-8?B?bFV3MlY1dGRicjd4QU9HWFhnSktDcVJWeUIzL1pNVWE0UnVmdFF6Q2JCeitL?=
 =?utf-8?B?enVXelV6U3dIbUtadXlhb29zQU1FU3gzQWZ3Z2IxY0xqSUZFL2JJa1pkTVRr?=
 =?utf-8?B?RmJEV3BQSDc4OE41dzYrRXJIb01JSXFpMVZ1Z3VQbVpsS1V2dGhwODRrUW1p?=
 =?utf-8?B?aU1hbDhhZElGMUNhNFBDc3hqSENaMTBoTGhvUG9WR2REbVdWZGdCNlVlbC9U?=
 =?utf-8?B?VEVudjNINUI2MlRxa1VZSmhoQXdVbVdVdnNCdy9aL3NpVEMyOFNwQmF6ei9y?=
 =?utf-8?B?SHhJNHB4cFBtcWRMb21oSXY1UFZaTWpYQit4b1BQREwxdkxja2ZHOW96bHNS?=
 =?utf-8?B?VnZlbGdQd1BwS2JucktpdS82eE8rMXpDM2RCR1hia09kQW9nVS80aVRlNlVm?=
 =?utf-8?B?NFd4Y0htMXYrUkpodHNDZDZ6bTd6WGJ1dU1Ebm84bnZGdEIzN1RUK1JwUGlJ?=
 =?utf-8?B?ckppL3NqMGdlWXVQNmtqUUk2cjlhV2tHUERFc25pUHRqbFd1WTJUNW43L083?=
 =?utf-8?B?U0I1TG5JTTZlaXdVTld0RmhXM2pvcGpFTERXM3d0MDN4Y0ZDME9kOGwvSUh0?=
 =?utf-8?B?RCtUdE1EWmx3WGo5VW45azN4bWh2ZVF0WVJoa21nL2MrYkJBOGZGZU56b1Nn?=
 =?utf-8?B?eng3YVhiY2hRTTRwLzhSRVFodUhRbkdWVWlVZHJiOFVhR21leGZKNnlUTSt0?=
 =?utf-8?B?MktncWtjNVFTMmpROWlZMU9WeDhoSHdWQ3N5QlZXQS85bEpFWHRaM2w1dVF2?=
 =?utf-8?B?dWlodGhsb1pISjdEbmh3UHFTNmJTODRGNENpWXNLbjUrYXpGVndoa1puSFhB?=
 =?utf-8?B?NDd6SU5OeFRRRjJFaVN6NjkrR2dDT3Y4ekkxVXdwVko4K2RXbTJRbllMTUMy?=
 =?utf-8?B?VVVvZXltbVJySm5pcW5RZ0poTE5hTGtYbldUMXFiUEt6enpGNm1VdXd1eUx2?=
 =?utf-8?B?bVFZY21qVVUxVDN3VXkxM0E2MUNUWmxhM3NuaUpYM3pUblloYytJcWdURDg4?=
 =?utf-8?B?Si9QdndKYlVhWjV6Vm5ZV2orUzdTbUkzTTFESnhjbFZmUFpSRU1ab1hqbHVi?=
 =?utf-8?B?TkRYNjgxWUZ1cmtUdnZ4Yk81RktlTThuRHBZRFl1U3VHQXJQZHY3RDRKQ2Yx?=
 =?utf-8?B?QkhTWWxiK2NTdHBsRWNUYnYrVFlab2xERmowU3J6bmZ6VkNienhtRUlWOVNx?=
 =?utf-8?B?NlFJdmU0eTNkYUVrak5SeUdkM0t6bHU5UjluL1NROXc4bXVsZlpCclBqMHdj?=
 =?utf-8?B?TlN4WGsvMXhmRTdFSy84bEcwcUJLNWtJRkthNlVXelBtZGNyQVRWS1hNTy9H?=
 =?utf-8?B?TEFORFNjYVZWTUNna1cxQ2JrRHZSRmVsd0pWMEtGSFBCemlUZWpWWkhQYU9Y?=
 =?utf-8?B?aEJKSzBTUEhXZDZPZmlPQUszdm90b1QwekVGUWhheHpqSjZva2pMY2hua2Nt?=
 =?utf-8?Q?PBnFxEfc7R6qBEnD8x3tvyT7F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E39B572FCD07CA4EA815E56C02DB33EE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07acfe5-b86c-427e-542a-08dc2b79428c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 03:18:18.6974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4lgXWkTzPH4pdjLhZ71UZiEB7IjGYJqowc0yAcgtLedWMrEbVtv0Z53dpKTF54Q1D9PEQH7bSch0zYdTe1jxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAwOS8wMi8yNCA5OjQwIHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDA5
LzAyLzIwMjQgMTc6MDUsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBPbiAwOS8wMi8y
MDI0IDE2OjAyLCBEaGFybWEuQkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+IE9uIDA5LzAyLzI0
IDc6NTAgcG0sIERoYXJtYSBCIHdyb3RlOg0KPj4+PiBPbiAwOC8wMi8yNCAyOjMxIHBtLCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdw0KPj4+Pj4gdGhlIGNv
bnRlbnQgaXMgc2FmZQ0KPj4+Pj4NCj4+Pj4+IE9uIDA3LzAyLzIwMjQgMTE6MjcsIERoYXJtYSBC
YWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+Pj4+PiBBZGQgdGhlICdzYW05eDc1LWx2ZHMnIGNvbXBh
dGlibGUgYmluZGluZywgd2hpY2ggZGVzY3JpYmVzIHRoZSBMb3cNCj4+Pj4+PiBWb2x0YWdlDQo+
Pj4+Pj4gRGlmZmVyZW50aWFsIFNpZ25hbGluZyAoTFZEUykgQ29udHJvbGxlciBmb3VuZCBvbiBz
b21lIE1pY3JvY2hpcCdzDQo+Pj4+Pj4gc2FtOXg3DQo+Pj4+Pj4gc2VyaWVzIFN5c3RlbS1vbi1D
aGlwIChTb0MpIGRldmljZXMuIFRoaXMgYmluZGluZyB3aWxsIGJlIHVzZWQgdG8gZGVmaW5lDQo+
Pj4+Pj4gdGhlIHByb3BlcnRpZXMgYW5kIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBMVkRTIENvbnRy
b2xsZXIgaW4gRFQuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1
YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+Pj4+Pg0KPj4+Pj4gTm90IHRlc3Rl
ZC4uLg0KPj4+Pj4NCj4+Pj4+IFBsZWFzZSB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwg
dG8gZ2V0IGEgbGlzdCBvZiBuZWNlc3NhcnkgcGVvcGxlDQo+Pj4+PiBhbmQgbGlzdHMgdG8gQ0Mu
IEl0IG1pZ2h0IGhhcHBlbiwgdGhhdCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyDQo+Pj4+
PiBrZXJuZWwsIGdpdmVzIHlvdSBvdXRkYXRlZCBlbnRyaWVzLiBUaGVyZWZvcmUgcGxlYXNlIGJl
IHN1cmUgeW91IGJhc2UNCj4+Pj4+IHlvdXIgcGF0Y2hlcyBvbiByZWNlbnQgTGludXgga2VybmVs
Lg0KPj4+Pj4NCj4+Pj4+IFRvb2xzIGxpa2UgYjQgb3Igc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5w
bCBwcm92aWRlIHlvdSBwcm9wZXIgbGlzdCBvZg0KPj4+Pj4gcGVvcGxlLCBzbyBmaXggeW91ciB3
b3JrZmxvdy4gVG9vbHMgbWlnaHQgYWxzbyBmYWlsIGlmIHlvdSB3b3JrIG9uIHNvbWUNCj4+Pj4+
IGFuY2llbnQgdHJlZSAoZG9uJ3QsIGluc3RlYWQgdXNlIG1haW5saW5lKSwgd29yayBvbiBmb3Jr
IG9mIGtlcm5lbA0KPj4+Pj4gKGRvbid0LCBpbnN0ZWFkIHVzZSBtYWlubGluZSkgb3IgeW91IGln
bm9yZSBzb21lIG1haW50YWluZXJzIChyZWFsbHkNCj4+Pj4+IGRvbid0KS4gSnVzdCB1c2UgYjQg
YW5kIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlIGZpbmUsIGFsdGhvdWdoIHJlbWVtYmVyDQo+Pj4+PiBh
Ym91dCBgYjQgcHJlcCAtLWF1dG8tdG8tY2NgIGlmIHlvdSBhZGRlZCBuZXcgcGF0Y2hlcyB0byB0
aGUgcGF0Y2hzZXQuDQo+Pj4+Pg0KPj4+Pj4gWW91IG1pc3NlZCBhdCBsZWFzdCBkZXZpY2V0cmVl
IGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJlDQo+Pj4+PiB0ZXN0ZWQgYnkgYXV0
b21hdGVkIHRvb2xpbmcuIFBlcmZvcm1pbmcgcmV2aWV3IG9uIHVudGVzdGVkIGNvZGUgbWlnaHQg
YmUNCj4+Pj4+IGEgd2FzdGUgb2YgdGltZS4NCj4+Pj4NCj4+Pj4gQXBvbG9naWVzIGZvciB0aGUg
b3ZlcnNpZ2h0LCBzb21laG93IGl0IGdvdCBtaXNzZWQuDQo+Pj4NCj4+PiBUaGUgZ2V0X21haW50
YWluZXIucGwgc2VlbXMgdG8gYmUgaW5jb25zaXN0ZW50IHdpdGggdGhlIHJlc3VsdHMuDQo+Pj4N
Cj4+PiBsaW51eCQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsICpwYXRjaCB8IHdjIC1sDQo+
Pj4gLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICcwMDAwLWNvdmVyLWxldHRlci5w
YXRjaCcgZG9lc24ndA0KPj4+IGFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1mIHRvIG9wdGlv
bnM/DQo+Pj4gMzENCj4+PiBsaW51eCQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsICpwYXRj
aCB8IHdjIC1sDQo+Pj4gLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICcwMDAwLWNv
dmVyLWxldHRlci5wYXRjaCcgZG9lc24ndA0KPj4+IGFwcGVhciB0byBiZSBhIHBhdGNoLiAgQWRk
IC1mIHRvIG9wdGlvbnM/DQo+Pj4gMjkNCj4+PiBsaW51eCQgLi9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsICpwYXRjaCB8IHdjIC1sDQo+Pj4gLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBm
aWxlICcwMDAwLWNvdmVyLWxldHRlci5wYXRjaCcgZG9lc24ndA0KPj4+IGFwcGVhciB0byBiZSBh
IHBhdGNoLiAgQWRkIC1mIHRvIG9wdGlvbnM/DQo+Pj4gMzANCj4+PiBsaW51eCQgLi9zY3JpcHRz
L2dldF9tYWludGFpbmVyLnBsICpwYXRjaCB8IHdjIC1sDQo+Pj4gLi9zY3JpcHRzL2dldF9tYWlu
dGFpbmVyLnBsOiBmaWxlICcwMDAwLWNvdmVyLWxldHRlci5wYXRjaCcgZG9lc24ndA0KPj4+IGFw
cGVhciB0byBiZSBhIHBhdGNoLiAgQWRkIC1mIHRvIG9wdGlvbnM/DQo+Pj4gMzANCj4+DQo+PiBX
aHkgd291bGQgeW91IGFkZCAzMCBhZGRyZXNzZXMsIGluY2x1ZGluZyBtYW55IHVucmVsYXRlZCBw
ZW9wbGUsIHRvIHRoZQ0KPj4gY2MtbGlzdD8gWW91IG11c3QgYWRkIG9ubHkgbWFpbnRhaW5lcnMg
KHNvIGFsc28gcmV2aWV3ZXJzKSBhbmQgbWFpbGluZw0KPj4gbGlzdHMuDQo+IA0KPiBSZWFsbHks
IHdoeSBkbyB5b3UgQ2MgTU0gZm9sa3Mgb24gdGhpcyBwYXRjaD8gSnVzdCByZWFkIHdoYXQNCj4g
Z2V0X21haW50YWluZXIucGwgdGVsbHMgeW91LCBlLmcuIHdoZW4gaXQgc2F5cyB0aGF0IHNvbWVv
bmUgbWFkZSBvbmUNCj4gY29tbWl0IHRvIG1haW50YWluZXJzIGZpbGUsIHNoYWxsIHRoaXMgcGVy
c29uIGJlIENjLWVkPyBObywgaXQgc2hvdWxkIGJlDQo+IG9idmlvdXMuLi4NCg0KDQpUaGFuayB5
b3UgZm9yIGJyaW5naW5nIHRoaXMgdG8gbXkgYXR0ZW50aW9uLiBJIHNpbmNlcmVseSBhcG9sb2dp
emUgZm9yIA0KYW55IG92ZXJzaWdodC4gTW92aW5nIGZvcndhcmQsIEkgd2lsbCBlbnN1cmUgdG8g
dXRpbGl6ZSAnYjQgcHJlcCANCi0tYXV0by10by1jYycgdG8gb2J0YWluIHRoZSBhY2N1cmF0ZSBU
byBhbmQgQ0MgbGlzdC4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoN
Ci0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg0K
