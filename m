Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D68359E5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 04:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2270910E3E6;
	Mon, 22 Jan 2024 03:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654D410E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 03:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705895571; x=1737431571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M+Q/FyyBuiAQ42PGRGLme5onMQ+nOLOtMT/C4QAq5O0=;
 b=ks+XmpfOcJt4tZkBSl9Pf9Q/YTpI0dVDlTsxipqsCyTaOfMqIWN/+iq3
 JYHnEZqyuWDKn62/Uo1APIXOp6TE8M+9MDL0fAjB2xVHxoG5AJRIf7qbJ
 qUwNNXUtBOa7SdYsxVrJqhykoGHrCOMJfDUSPJK37pckExN2VajJKUN/U
 PnCLskCZ7IBEOWYPVUsjAu1M9UuvJKc7g2JI9nZoE12BM5s+/MsaOOEFI
 caPebVd86vxHGztFbUppsC3OLS5evaPVP5xx6v55cUPgioSZixcYJlzvH
 C5Kgm8k2pHrHtQSagaWal2VBW8DPkhP6Qi7t5dnuqBkd5FmmmPdrwgDss g==;
X-CSE-ConnectionGUID: oDbiBdFPR/+pl/c7ThsXog==
X-CSE-MsgGUID: 0UxZBR52QYWDCU6j3pUDoQ==
X-IronPort-AV: E=Sophos;i="6.05,211,1701154800"; d="scan'208";a="15559752"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jan 2024 20:52:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 20:52:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 20:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjrXeBLZDQ1tMbzoLHf4VXtQ8hQgVABA+/O7FoDdZ6bll2FK2tq6z5pQnLVRYdn6oZnZaD2EldnES6Zdhhhs15hVHbMAFhHSDhBSoLyvBVytgxIhAbZqmeaPvGvIJXF4LL6ARfazFzrE+boHtPbH+m9pq0dCRNmHe6XXyP3dvgHpbILgQqTa00fSG5BbhR411aJ6y8/00VchasPc7yJevwS7Bt9PGI8O5901YnLFEF5J3U5DhvhDNINhuThpnXcPozv8Q9OkaGQxDYp4Mx6wQuq+LgkGkbGoXAKdWba5/nN3gdYJ82xCd8nM4e7J3VLd4r9/3RqGj8pofrJAw18g5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+Q/FyyBuiAQ42PGRGLme5onMQ+nOLOtMT/C4QAq5O0=;
 b=Xo2qMOyxnbUndPzw2NpmmmrQTImxT51552Vkf9kS7Ciq4DLMK8kftk/dwz5DEhyrmv8yJi7gBb+zZ1vdYazZWuyd10q39HYjFG8wqUVICvnxdLGtEXR7hP8YCRH1icJOvxefJvNLsJC1k5PHCs9dz4UL5w7Unuqo6lTlM01UvsCvtl40a+rzszqbpHfb8lXCfEByY+NF7x6Bt72zaeiKqVzF7T7ZElznDiXrrdO+n4gZ+2hshHXfK9m7O46oUkAUWJB6CvRcN8ZnV0UoeAfGleiJ33/7nZ7gIyVwvG9Oi8+dOf1IPlB00Yuv2bgt8mhePCQxw0bTRxpUoVLPWF1obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+Q/FyyBuiAQ42PGRGLme5onMQ+nOLOtMT/C4QAq5O0=;
 b=pWp5RX+osxSv86AGI7ETzMVWDOgxzuC0tPem3ScXK1uVQJ1m0/MV+gi0Emmrd/Lk+uauw7cTVC4dsAJ/ON7yExHhNLN2VNmGBW/WUraFAWVjZRF/UtTvSGpF8u6X1GNbYvUILRBseQNnllftHoHJiKD38VyY9/u2/OjLHbWAomatWQQLo/Bd3GwkTgYPuBsdgW4uuzE2sD/1z1TxsZBhdjVPhFrUdIfYRIZrn4l5A3wljuNfK0KtWaDYY+r965B/21k56D83lKq0fryMp/2GORuVJPgWYv7pTT4ndP4XXSUVQaAcqtA3zCIcDH/4RLxK6Zc9/Xk+Os582jYpZrvB3A==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 03:52:17 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 03:52:17 +0000
From: <Dharma.B@microchip.com>
To: <sam@ravnborg.org>, <robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Topic: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Index: AQHaSfBtFpABnI0MwEGuolZ8EVFW4bDf9cIAgAGYQICAASXzAIAChPKA
Date: Mon, 22 Jan 2024 03:52:17 +0000
Message-ID: <6c6e4ddc-b3df-484e-961f-6efbd52defd6@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
 <20240119195151.GB938671-robh@kernel.org>
 <20240120132356.GA345206@ravnborg.org>
In-Reply-To: <20240120132356.GA345206@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|CY5PR11MB6367:EE_
x-ms-office365-filtering-correlation-id: 7abb4529-2189-487c-2f56-08dc1afd8723
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SBsJaf0k1DeA+Bc86V7RSoD/52ygmEwKzva5IImUkiJ2x28ZtDZk4DEGkgadCUiBeyvxIgONPOaVi6tSxZQ8xmca04q77xY1+4SWwKzQXd3ppPveSjll1cS9IaqNqj1StXYPMmhqHG3SIXYUIXu459k71CXsCAIiG0wRnO+FQHfWWFuDUAvhhX+RLoYRcHkuZZAoPyhRAVQVWBcZF6Up0uRrd89HW6KAgV7hFeS6ojZiZZGe9ctcNkIjWbICezuWs+t77TIgWckfPmdcicT7cq/2Fx+0tMTTzm43OBzaKGWiwoDCg0ikuveURshBRW5Uncg4ea1pHyVg4yLYd5BQeasgeMZMfbMHuPhMIkEe2eY2yynrOjDqr0ofGH6/XMl4tHItvzFMlEaDM5f7bw+V2GjOcJvDRtgeaUQRRUUj/kBzYWaFiPX0rJr4cveuo/zpcgKBpZgrlnuxSj36RhuqPmVYd4qbe7Ntia5gvbTTSEEXzWqhZYCtnQsVFy48BBGP4kFA1aPBLJbGK4Qxr8JvmTtu8YhMuaqM2Lyd0lLH5Kh/hmfUfFJ6vBHv0FgSRLEANw+iV36XMt1NzNV1aJLjBWg8KLX8mKf6f7OhquQA/70UMaEmyZbNWFKVcV0eJrZBPQx560ha/arX4NBZR3Yvqj+g8AYd4FolxeTwPsLY7QtCZPAtRMLUdvo9JcQat4jyGco5MfO4UulYh4Rd3b1uHbfLvpMxOgYXf+HWzqh7Mho=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230473577357003)(230922051799003)(230273577357003)(230173577357003)(230373577357003)(1800799012)(451199024)(186009)(64100799003)(2616005)(26005)(6506007)(6512007)(71200400001)(53546011)(83380400001)(122000001)(5660300002)(7416002)(966005)(4326008)(8936002)(41300700001)(8676002)(2906002)(6486002)(91956017)(478600001)(316002)(64756008)(66946007)(66476007)(66446008)(76116006)(54906003)(110136005)(66556008)(31696002)(86362001)(36756003)(38100700002)(38070700009)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a25ndG5zRXEvOG1zeWZWdnZabnhaS1VRbXV4UVZGbjVHY2FNT3BIeTRsMFFR?=
 =?utf-8?B?QnY5bnhucXJPTFFRN28zbUU0cnNrU0dEOXBsRDM2Um5JbEZsZHNuODIrWVFY?=
 =?utf-8?B?Znc0WWxjMHFMczkra1ZubXVtN21IYVJuZE9Nekw2eWlmUFExSGsveERjcmFS?=
 =?utf-8?B?UHptK0czd290MXo3bHJzcEhZcG4yVkdCOVRqVWJ0SmhMckIrTitoL21sZERJ?=
 =?utf-8?B?SjlBcG9tUXVXWDE0bVYvWml3MTYrY2pNNmprWkN1Y1B1TmN3SWxpZlhVb1ZS?=
 =?utf-8?B?ckZ1WU44dE5sUFVpV25DZDd4OWdic29wdWI3MTZoVEo4TjEwdGxvbjRmUE5H?=
 =?utf-8?B?dlo4TXJ2MElMVDJCRkVreFR4cW1qQ1hmaVhxNk9tL1ZjVDVzMGY1SVZYQzNk?=
 =?utf-8?B?SEwrL3I3SVdoeDNZWnJHL2VETUdSb2RRMWZ1WE5kcjVXQ0xTR2hRZUpGWGJo?=
 =?utf-8?B?bkN2THZLVFFTeXFaMWdOZlkwRFBCQjA5dUNYWm5Gb0dJVGRlajR3YTV6Y1Ra?=
 =?utf-8?B?dVlLQ1IzL0s1bzVDYzN4VTArbUVmMHZ4NW9tL3k0bWRicFRKQjh3S2FqS1Jh?=
 =?utf-8?B?a3hSMTI5NWJ5R3JKMVVzd29hYnBkWXBQK1BpMWpjY204YXNRUEo3NHE4RTdY?=
 =?utf-8?B?NU9DMGk0Y2RoWGtXbFBjM2NoOWFFUnloWHRGbmp1YTVsVHQwVHZ4K3NkWVZt?=
 =?utf-8?B?dnZJbkc3ZmJvUlFtNjBFd1A1RWdvTElIeThubFVCaXpHTUJJbnhyNTNETit2?=
 =?utf-8?B?QVU4VnJRWTlBVGRHZ2NhM3grSWpUSlVMRk9sazBmYkFPUTBEZmt2QU9Qbkk0?=
 =?utf-8?B?L2x1cTFZMUEyVGE3Q1BpMDdWT1kwNFJBNFl6ZW50M2ZVQXRIQi9YVmNwM1dE?=
 =?utf-8?B?OERnU3QwYTlRQ3E1WUdTNUQvYTlrYzhwdXZFbjAwWUpuS1JweTNaOGM0S1k3?=
 =?utf-8?B?eEhPazAvNkJPMkQ4T1V0aEcrUWR0OUh6RE9JbDhyQUdpckQvREhualhGdHh5?=
 =?utf-8?B?dkV6TlVBRy8xSkgycTdscWg1WDdpcWZhVEZLWGxiR3drakNjMHYrWldMZ1dj?=
 =?utf-8?B?RGN4VmVIOFgzMzJnQVExWVJ1WXdsc2c2NDFiZFlSR3Y4Z0psRk5TTHFxNGFB?=
 =?utf-8?B?ZzJLNi9UMWo1UWJvVnp6ejhwQldqTC9pK1I5RnNwdmZuSGh1VWlsajBiWmFV?=
 =?utf-8?B?NWh0RGZXUmdzOFZka3ByZUVqdnN3Rzg4aVJ5VGVzcXVXTVpRZ3paM0p6QlVM?=
 =?utf-8?B?M3Q4Q1pQY1ljYy9jOXZCK1hvVWhOa3RMYlpGM0ZQS3F4clJZZmdjOCt2a2g4?=
 =?utf-8?B?QVpjZW83N3oyc2R4YVNNTG5PeC82YU1GZGhHTVV6OEhhQ3B4MlJkMGwySkhR?=
 =?utf-8?B?VlduZXorZnJTWkRmcUFLTVdBejVoSWNUK3JGR29sUXRFTVFJaHZiRDFFMmRi?=
 =?utf-8?B?TzhGNCtMQ0dtR0Z3SEk2Tzg0bE5Da2tqUmRpZ3B4YURCcHVHKzhqY1ZwOXg5?=
 =?utf-8?B?WTBYY29zMzhHNGwwYVFvdUNIU0srUGZtV2p0Rk1jWkZUTVBCUWp3cWFDdHVX?=
 =?utf-8?B?R2dxQmlJRVdxUTNDeG5QaFVuZjd4VmRUWjEzSjFhSUd5KzhualhjUFhkc0Ft?=
 =?utf-8?B?VTdkVE9qcWV2VXBVblZKWEIyb3FSVlh1NlVJeFJ3VnJYWGk3MGJnMStkUTE4?=
 =?utf-8?B?VjdISlp4L1ovUlBvUm8yRkhxV01ZWjFDVGpuQWVDTFBhS0FwNVp5ckR4a3o5?=
 =?utf-8?B?d1N5VHFWQW1VdXNiNHVoT2kxS0lERnl4UVQvQm5Ob3Z4RkQ1U3VuOXExZGtJ?=
 =?utf-8?B?d1FSUG5ZNnUvVVdwT0s1dUVRYThDaHNLM0JtMDRxY2FBNnVFTXhTbktiUlZQ?=
 =?utf-8?B?U0V3ay93VDdWT2RSeHhmcDRiOFc5UDRhVHRjRy9kRW5yUFErVEJ4Qm9wbVhT?=
 =?utf-8?B?MkdpclhFWWZvL2NSYWtNZE4zQi96bXU1L3gvWnVwNUg4VnkvSEc4ZGx5bnNp?=
 =?utf-8?B?bXRvcElHN2dhd0VGRytiTmhzVktHMmNEeTdtNkY2Zk9DdEJwWStKOENBZmty?=
 =?utf-8?B?S09LM0t3QnE1S0x1MVBCZXptK2UySEZ4U21WTTd3Y1UraGJnVjVZcXpuYkEz?=
 =?utf-8?Q?9cUVbdizp3TqfvIfCLUoayb2H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AD9BFEBA31C1740B06BA30A3FD9430F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb4529-2189-487c-2f56-08dc1afd8723
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 03:52:17.5487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zx0YVW152UBrY22HphHV6xE9cpcylKUiJzcYGWGwv/ObGjRFqpKT4Sa7mQ2Skr+jV2RWeDQ1cYjimxMcqo9dJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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
Cc: conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, tzimmermann@suse.de, devicetree@vger.kernel.org,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, mripard@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev,
 u.kleine-koenig@pengutronix.de, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDEvMjQgNjo1MyBwbSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPiBbWW91IGRvbid0IG9m
dGVuIGdldCBlbWFpbCBmcm9tIHNhbUByYXZuYm9yZy5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGlt
cG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24g
XQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IEhpIFNhbSAmIFJv
YiwNCj4gSGkgRGhhcm1hICYgUm9iLg0KPiANCj4+PiBUbyBtYWtlIHRoZSBEVCBiaW5kaW5nIGJh
Y2t3YXJkIGNvbXBhdGlibGUgeW91IGxpa2VseSBuZWVkIHRvIGFkZCBhIGZldw0KPj4+IGNvbXBh
dGlibGUgdGhhdCBvdGhlcndpc2Ugd291bGQgaGF2ZSBiZWVuIGxlZnQgb3V0IC0gYnV0IHRoYXQg
c2hvdWxkIGRvDQo+Pj4gdGhlIHRyaWNrLg0KPj4+DQo+Pj4gVGhlIGN1cnJlbnQgYXRtZWwgaGxj
ZGMgZHJpdmVyIHRoYXQgaXMgc3BsaXQgaW4gdGhyZWUgaXMgSU1PIGFuDQo+Pj4gb3Zlci1lbmdp
bmVlcmluZywgYW5kIHRoZSBkcml2ZXIgY291bGQgYmVuZWZpdCBtZXJnaW5nIGl0IGFsbCBpbiBv
bmUuDQo+Pj4gQW5kIHRoZSBiaW5kaW5nIHNob3VsZCBub3QgcHJldmVudCB0aGlzLg0KPj4NCj4+
IEkgYWdyZWUgb24gYWxsIHRoaXMsIGJ1dCBhIGNvbnZlcnNpb24gaXMgbm90IHJlYWxseSB0aGUg
dGltZSB0byByZWRlc2lnbg0KPj4gdGhpbmdzLiBUcnVzdCBtZSwgSSd2ZSB3YW50ZWQgdG8gb24g
bG90cyBvZiBjb252ZXJzaW9ucy4gSXQgc2hvdWxkIGJlDQo+PiBwb3NzaWJsZSB0byBzaW1wbGlm
eSB0aGUgZHJpdmVyIHNpZGUgd2hpbGUga2VlcGluZyB0aGUgRFQgYXMtaXMuIEp1c3QNCj4+IG1h
a2UgdGhlIGRpc3BsYXkgZHJpdmVyIGJpbmQgdG8gdGhlIE1GRCBub2RlIGluc3RlYWQuIEFmdGVy
IHRoYXQsIHRoZW4NCj4+IG9uZSBjb3VsZCBsb29rIGF0IGZsYXR0ZW5pbmcgZXZlcnl0aGluZyB0
byAxIG5vZGUuDQo+IA0KPiBVbmRlcnN0b29kIGFuZCB0aGlua2luZyBhIGJpdCBhYm91dCBpdCBm
dWxseSBhZ3JlZWQgYXMgd2VsbC4NCj4gRGhhcm1hIC0gcGxlYXNlIHNlZSBteSBjb21tZW50cyBv
bmx5IGFzIGlkZWFzIGZvciB0aGUgZnV0dXJlLCBhbmQNCj4gaWdub3JlIHRoZW0gaW4gdGhpcyBm
aW5lIHJld3JpdGUgeW91IGRvLg0KPiANCj4gICAgICAgICAgU2FtDQpCYXNlZCBvbiB5b3VyIGlu
c2lnaHRzLCBJJ20gY29udGVtcGxhdGluZyB0aGUgZGVjaXNpb24gdG8gbWVyZ2UgUGF0Y2ggMiAN
CltQV00gYmluZGluZ10gd2l0aCBQYXRjaCAzW01GRCBiaW5kaW5nXS4gSXQgc2VlbXMgcmVkdW5k
YW50IGdpdmVuIHRoYXQgDQp3ZSBhbHJlYWR5IGhhdmUgYSBQV00gbm9kZSBleGFtcGxlIGluIHRo
ZSBNRkQgYmluZGluZy4NCg0KSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhIG5ldyBQV00gYmluZGlu
ZywNCiAgIHB3bToNCiAgICAgJHJlZjogL3NjaGVtYXMvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1s
DQoNCkkgd2lsbCB1cGRhdGUgdGhlIGV4aXN0aW5nIE1GRCBiaW5kaW5nIGFzIGZvbGxvd3M6DQoN
CnByb3BlcnRpZXM6DQogICBjb21wYXRpYmxlOg0KICAgICBjb25zdDogYXRtZWwsaGxjZGMtcHdt
DQoNCiAgICIjcHdtLWNlbGxzIjoNCiAgICAgY29uc3Q6IDMNCg0KcmVxdWlyZWQ6DQogICAtIGNv
bXBhdGlibGUNCiAgIC0gIiNwd20tY2VsbHMiDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpE
aGFybWEgQi4NCg0K
