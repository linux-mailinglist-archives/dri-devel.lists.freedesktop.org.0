Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1AE4A6CE2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90B10F948;
	Wed,  2 Feb 2022 08:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394A189F5B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 00:14:46 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA77540153;
 Wed,  2 Feb 2022 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643760885; bh=DjZ9Lgsgm1GrKUDOJbwKJPF33xuyt/GPT/JJkg5rzJw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TnYSEUujoalzzgipRKTYQucKIwcxr1OnKbQ9F3NeldVq5ZsqygfGGs+ZeYDr0BGvr
 WSyI1Y65kX1qGFvuquABGH2drrkqyOeL6tai+Ve8NKBVlztOyC8TX9IjAtvnajzA3T
 8yNgUfUdP2SetPOAwPOAN0Y/itFv8RgTGhiX07BgfkaFkld+OzinHtKXZt8ofnd8j8
 aXzN+zuHDCJWBUnB00R1kFn8zUFn2bQ0SKtFA+zqXj01JKLFTWvY0FBNMYCTsTANvA
 8baQfHBfg51hPapkPiJc/If1z0j/5b1OPlr9SaaGo27WXzacBCgoIMRHl1bGGYuN3/
 Pt0PmrN14rRyw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E1AD5A0080;
 Wed,  2 Feb 2022 00:14:40 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8155E8004B;
 Wed,  2 Feb 2022 00:14:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="v2IsyUsA";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm7EFsrAydJkXsDP7fZfDEBxFySHADC/iSGbcB/LiESm1OeUs52C8+xafWTy072Q5lSBBfPimGs7nowSIzUeIjzUG2WwjIgfeFyZjIEcTJN/VBV5ouFiWom3mHM2RrjvtqHmSLDVDH9k4w9WZOcFESPN35GDDRc3aBStJjlyooE5ynKd0fQ5Zn09mx3L3yBaJOb1+6S36gbeE6nFOuVkBbPpCXW5j9m6j8A+D/hoN2e3L8x7nxIwP3wdlBo/lHIDjcNldxJYvpzAoCXQ41tOi8cWElbZfDcxAp+Fw5MlAZ6deQCeH92XNidGcB3InGSwofAHhTTlEgISyfuEyR/hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjZ9Lgsgm1GrKUDOJbwKJPF33xuyt/GPT/JJkg5rzJw=;
 b=Ys38u4FPyLoU7drfsilaOskeyIVqDMY/VLzViH5IuqeBbemjUT1LyYYpdi6roWTpmH5gXRc8FmEU3T1j7KLuvJPJQzJBiyb5HzDia86uJfUvLWmFXa313Ln9EuKYZKu6TKV4ljV4xW3eIFKteiA2jokkWd7nZ/Q1CQJy8IxvLizTRd9xljpuaFjXdR7WOSwhAscKXjqS1D3Z54406KKMxets+Ey2sXLp1TmxDFHjGQOEL+Uw1z7i3D4fSwAZxSjmRxwO+RCtMpQElUqDtEWT3JVPYMhO8hQaTWlH0Yi7mjsTKPHLGWEM53a3FgcQSR0lTvp27BMHZ5Uk/SeYQFYHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjZ9Lgsgm1GrKUDOJbwKJPF33xuyt/GPT/JJkg5rzJw=;
 b=v2IsyUsARPZvC8FL9qHKLaxZb8nMQXbZS4cW0SY/TMM+oXmjC0xoI22fuhSDHgIF+A38KVNnoLKl7DG/1BSjdc1YkMCMQ7pwP87wTuq4D3i3UjgU1k8sfFnZIjTa9uzBp4x7T1Is+A5dRvDhYhyPLbfbRzEkaAAIpEMnAMpSOTU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN9PR12MB5211.namprd12.prod.outlook.com (2603:10b6:408:11c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Wed, 2 Feb
 2022 00:14:33 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 00:14:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Fabio Estevam <festevam@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAA==
Date: Wed, 2 Feb 2022 00:14:33 +0000
Message-ID: <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
In-Reply-To: <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56513a5f-a2a7-49fb-0cb7-08d9e5e0fd72
x-ms-traffictypediagnostic: BN9PR12MB5211:EE_
x-microsoft-antispam-prvs: <BN9PR12MB521128DD5EACFB7C46BFFADEAA279@BN9PR12MB5211.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eNqhMPm6AWXM0/BtRsG6mXucvT53gIzrxtbQIsAkzMc47byrN7kLbnTFaTPc04iK6wX0xz9Iw7gji9EwY1NwnmPz0FN97cucYUPvx1MJI+sASQpimUpnm3/FytRSetrqcSnOUtKrG5wz5uNxy3A22tiO2cJSskxQryJNrSoj/zK1Lpdp2RpXvnx+L5pf/X0OM92X4oo4HYaRrZCzaGthEhFxgH/kRCIRNR00VOmtL4QPOb/y2PVV1FkzmslEWAnLIYnJrgnjmqVvVzclEO+rCdavRcol50MIn6R3jsH5QqgaIv1TFu+EEkymtu7g8gBZIpirmCsopcGDti82LhQgw7xA/XgiBQY12e1n6OolJbypAh9LLOLbU9aMdUp87uohyeKMLg5mjwXyeFPy33CjBRj+86zN82QUssynn0vZDU8FkUBynNybO5lPbDxiagp49Q4TGGid4uRSy9hWkXnCa4AAs0+sJh1gA+loU6IritmYVBALc8stalys6B4FDuByLKln/toHQigATiwXm5oFOYHWezoAKX6rAlTFBdVfN/7YcaTPGMRMXoBcDLdMPUkqRle1t6NpbHxXvvEMi7o/qHihP3F3d03Y5ClKaWoaBBIyfcVPOS8lV3VApy/YIZo4pfBVRraSw79ZoexiMSFafh5pICYT+UjNkiOQ/6Bb6ulq4htYWs7ertGIzH5l6azNgHpVEnnJLUw34eG6sjPDDG/qd6c4WXEjmhH73xC8iMIRAnofxdzERNpzj4yac2TEaMphT3t5EtFv/j//b1jW7Fkijii3f3AjA/LYIAdAX90Wkbt6pC2ccXIvBS80rX8SloPUoVmNoTUnBlBQyAQvKHDaLkAWjF2UvREaUstlufs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(186003)(2906002)(26005)(122000001)(38070700005)(6506007)(38100700002)(71200400001)(31696002)(53546011)(316002)(36756003)(66476007)(4326008)(66556008)(8936002)(66446008)(64756008)(8676002)(6512007)(86362001)(110136005)(31686004)(508600001)(6486002)(5660300002)(54906003)(76116006)(66946007)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bSsxWm9SWjFBaUVtSmxCM0MrMU1vTUZjc2tPSjhNa1dQdWdNY2cweWtNTzFq?=
 =?utf-8?B?ZzRrVkVKeHRvOGVrRnBiekZnNzVOdVl6RE8xVkxpWHNrekJ3Mkx6UVZmMExC?=
 =?utf-8?B?NmRvazBmNUMxelZVZkVuWHhqSFdUS2VkSzNYR3FlT3hnU3RjVkwxNk1sZGox?=
 =?utf-8?B?OGkvN1lYK3ZIa09YTmxqNEp0OWRlUXV0YUVpV29JdkN4UzZjbG02Ukx5RG5O?=
 =?utf-8?B?SDJRWVhwNEczNUhLZVp4aHVwd2JtSlZNekhXYVZjejJhSFhtSnloaWI4SFpp?=
 =?utf-8?B?Ym9pa0NTSWxPbHYzK09ZcWN6Q3Q0dVRZWlVvWHBWczE4Q1FuV1lCdVYyMlRC?=
 =?utf-8?B?eVNGRmJOL0tJUlUyZ1EzTUFCTHltU2FGRVh3T0FqUnNnZEVkOE92L0pJbjgv?=
 =?utf-8?B?YkI5OUhUaU1VUnRXck9tWHZjV09Odk9jdDIwL2JOTytLdGRTSWZGa0lmbmxR?=
 =?utf-8?B?L214bjJuU0ExVW5lTkRFeCtMMk9YZHRYYmJLbTRaQjFaVTdiV3FzYjk3WTBu?=
 =?utf-8?B?eEQxRVRxdXo2UkdITURqa3BNRTlzUTd1UHhhMTdzQUUrdGo0TTIzekd4Umdx?=
 =?utf-8?B?MHVVZG1UL0tqekR5ZmxUd1dlWU16MzFnOGlkZ0d4azFDd1Z3UnZ1RWxOSk1w?=
 =?utf-8?B?czBBUWl1NlBET1g4SWorSlhXdUlGNEI3Y1FQeFdZdWk5dXUxR1UxTmtYd0hs?=
 =?utf-8?B?OUpZcHFGUXNRaVRWSzBwd0JOVmRGelVGTVp2bXRVS2dpOVFQcDNyTVhJODcz?=
 =?utf-8?B?VElMeXBmNUdtUmJGZHZLS0c3VUhoczZJTmREZlZWbWN5bzRzVS9rWkFDRmZ0?=
 =?utf-8?B?MGdib3VVaktVdEEydW9VVHJFekR1eFM4ZkVrN0VDZEpMRnJKRWFQM2tTb05V?=
 =?utf-8?B?aENOWS9mU3ZGak9oQVEyVi9YMnVvSGM4MFBzeGRnTWtKUFA3RjJpelFqZlFW?=
 =?utf-8?B?N29xc0doUDE4d0hLUUN4cUVEM3l0MFd2YzhDM0daT1dxMEFKeE1jakN1Wm9u?=
 =?utf-8?B?dTNFU05Dc1puSHJLU1gzeUJoUmk5aGtRWWxDSlc4SzArdzhqYWI5MEk1aG9H?=
 =?utf-8?B?WStCZ081OEc5SnZhNWpPSmprcGlVV0JvVFZUcEgxTmhyWG5CdktlSHFlMXJx?=
 =?utf-8?B?WnVGdStxSW1vWHhsZnhSVkVIdVgxUTR2R1VGVXlEMEhFaWNrdnBNQ3Juc3Qz?=
 =?utf-8?B?N2w1Nzg2L3dhUUcvUFZyRkc5TndwMXd6QkJyZjMyZENORmtVMUJPdGNXcVl6?=
 =?utf-8?B?Nmh5ZGhtOVVOcEwxbFZUQSt4YmMwSEpvRzdudHZYOEZHMWVtV0x2UXVwRkNz?=
 =?utf-8?B?djlzWDEvR1Uxc1JZMWlGMUo1ZmtCTEVOcXhOSVdaazA2SytXdDAwM2lWMDg4?=
 =?utf-8?B?K2E4L0NYR3NxRzk2QndJT3cwUVg3Z1VuODNRMXhoZ3hBaTRSQUdPQklOazVU?=
 =?utf-8?B?elBDdzM0aFpzYzZhUHpMdEgwNlhJSGVmbXNISzZ3ejd0SHBmZ0g4UkdCOHQv?=
 =?utf-8?B?R1NzS0E3Y2p1SmNXa3hPYzhlRS94RTFselhYY1lzWW80ZlZDbnZXYkM1dUVE?=
 =?utf-8?B?TUZ1R2FZUi9yUW1IOTNCbm9LTXFVakt5dEhuK2VpNDhDcXcvYUszZllxUWY4?=
 =?utf-8?B?Q1RjOWZ1TGFMdVlrNzdJR2E3TU10Y1A2ZzlacEZsTUpmMUh3RGtIblZwczBB?=
 =?utf-8?B?NlNiR3RBcTVNUWg4UDdqbWhCdTBaTjFEdkdpcTcyUEVwcWZ1cUJhMFhsNEhK?=
 =?utf-8?B?QnM0bVlPditiTFE2aVprZlNib1NLam5ZYWUxaTJnK0x6VTdpRHpWV0xOQW9y?=
 =?utf-8?B?dWtYWDNqNFYxUThiaFQxR1RNNGNSSTdBVTJpdFdkeWhobUdadVhxTnV4MnJT?=
 =?utf-8?B?M29NTzgzU0JPaExGR2N4aCt5UktpdzlINUVGUTM1MkthaWkrQlUvOG5qT3Rm?=
 =?utf-8?B?dEEvQXZhVmFEcFRKSnZKMHZ3NWloTkJyVHk3L0FZMUUzRlFQblpTbEZpWlBz?=
 =?utf-8?B?NkJ2TS8yVzIzbmd5b01TbVdBdm1zTzV0SjF5dVBPMVRoOTNLSzhnVjVEL2RK?=
 =?utf-8?B?ZGhpblBFRThjY3lqczY1ME0xaVNLWG85N081cWNoZythakNBV3BtUHlzTE9G?=
 =?utf-8?B?bXdGbUh6cis2VFdzdDFyS09odWxBNCtZZVRvREJnbENqK1IrODI3REFSK1RL?=
 =?utf-8?Q?kV+YNV6NIFHOnMg40GOS70k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18033865527997489379F5859B10972D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56513a5f-a2a7-49fb-0cb7-08d9e5e0fd72
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 00:14:33.1243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZS1zQcKG8j1OefJ0xW0sTdum7bI4Fnac/dErhmE0hFOGhtsFyIZGQGWOTmr8xZshoo4NXCI5J8qn97xF1DzSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5211
X-Mailman-Approved-At: Wed, 02 Feb 2022 08:24:59 +0000
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kees Cook <keescook@chromium.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCkZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+IEhpIFRoaW5oLA0KPiANCj4gT24gVHVlLCBG
ZWIgMSwgMjAyMiBhdCA4OjA2IFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
PiB3cm90ZToNCj4+DQo+PiBPbiAyLzEvMjIgMTU6MDEsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+
PiBIaSwNCj4+Pg0KPj4+IE9uZSBvZiBvdXIgdGVzdCBzZXR1cHMgaXMgdW5hYmxlIHRvIGJvb3Qg
KHN0dWNrIGF0IGluaXRyYW1mcykuIEdpdA0KPj4+IGJpc2VjdGlvbiBwb2ludHMgdG8gdGhlIGNv
bW1pdCBiZWxvdzoNCj4+Pg0KPj4+IGY2MTFiMWU3NjI0YyAoImRybTogQXZvaWQgY2lyY3VsYXIg
ZGVwZW5kZW5jaWVzIGZvciBDT05GSUdfRkIiKQ0KPj4+DQo+Pj4gUmV2ZXJ0aW5nIHRoaXMgcGF0
Y2ggcmVzb2x2ZXMgdGhlIGlzc3VlLiBUaGlzIGlzc3VlIHBlcnNpc3RzIGluIG1haW5saW5lDQo+
Pj4gYWxzby4gVW5mb3J0dW5hdGVseSB0aGVyZSBpc24ndCBhbnkgbWVhbmluZ2Z1bCBsb2cuIEhv
cGVmdWxseSBzb21lb25lDQo+Pj4gY2FuIGdpdmUgc29tZSBpbnNpZ2h0IGFzIHRvIHdoYXQgY291
bGQgYmUgdGhlIGlzc3VlIGFuZCByZXZlcnQvZml4IHRoaXMNCj4+PiBpc3N1ZS4NCj4+DQo+PiBI
aSwNCj4+IERpZCB5b3UgZW5hYmxlIERSTV9GQkRFVl9FTVVMQVRJT04/DQoNCkkgZGlkIG5vdCBl
bmFibGUgaXQuDQoNCj4+IFBsZWFzZSBwcm92aWRlIHRoZSBmYWlsaW5nIC5jb25maWcgZmlsZS4N
Cj4gDQo+IERvZXMgc2VsZWN0aW5nIENPTkZJR19GQj15IGhlbHA/DQo+IA0KDQpPbiB0aGUgY29u
ZmlnIHRoYXQgaGFzIHRoZSBpc3N1ZSwgdGhpcyBpc24ndCBzZXQuIEFmdGVyIHJldmVydGluZyB0
aGUNCmNvbW1pdCBhYm92ZSwgdGhpcyB3YXMgc2V0LiBNYXliZSB0aGlzIGlzIHdoYXQncyBuZWVk
ZWQ/IEkgbmVlZCB0byB0ZXN0IGl0Lg0KDQo+IFdlIGhhZCB0byBtYW51YWxseSBzZWxlY3QgdGhp
cyBvcHRpb24gaW4gaW14X3Y2X3Y3X2RlZmNvbmZpZyBhZnRlciBmNjExYjFlNzYyNGMuDQo+IA0K
PiBQbGVhc2Ugc2VlOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2Nv
bW1pdC8/aD12NS4xNy1yYzImaWQ9YzU0NDY3NDgyZmZkNDA3YTQ0MDRjOTkwNjk3ZjQzMmJmY2I2
Y2RjNF9fOyEhQTRGMlI5R19wZyFKRGNQZFZYMktIVFRjSUFqUFJFNTdhNG9GOXZ3OGpPQmVjRnM3
MmlhMTNqaEs1cTZHTnRCclN1QS16cE5DWmh1Vlk2dCQgDQoNClRoYW5rcywNClRoaW5oDQo=
