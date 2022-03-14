Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4224D8782
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDD610E8E6;
	Mon, 14 Mar 2022 14:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283510E8E6;
 Mon, 14 Mar 2022 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1647269722; x=1647874522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iVkfYH/aGaFRy+rOK1P6j/iGOEYHu6vCGPXiI0T+qVk=;
 b=qgGkVJ/yNq+fA6GLbdjBbCR8Fpf3563T78tQ4oPayR1kc79EcEtQInbv
 V7Itk74gLXA4LU4+F/wXkThKjnz2f4YloywXZgi+VVfmgo6o6bwItHSUn
 sViPbWh6gW4WpMqmKuVYNhTgxIvR9fF/9O4G98Q1bLZH2B3XSWTKGqYsH M=;
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 14:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAc8uPMIqUpw0p2YLMe/h/s322Bt4BNaF5c5rKxazNbpUybsrGdh+GXgyhGXzEsGa2jcu3xcp0a1u11B+zPCoRJkrIPO9pkh8H1J7caqL/4eBLZmpCWm7ScatJPsBoGbs742iHhxXRX/ayyclC2EWdrC7velxSCcV1BOtmekVRNx5XT92JQ5nfxfvF8f2cUWZLtuujspRdj+yYXW2FZLTnYDNiP/uqfbdUlBs66A1ODc1cHN1O7VZGV3uGEHdwLst6j5rkbk7zXrnpxLTK85vBunjXi6GAk2v682X3OVxggUrZ1BB0GoWj0v9B32R3iy8mVwmfmpNHIObW0Y799Leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVkfYH/aGaFRy+rOK1P6j/iGOEYHu6vCGPXiI0T+qVk=;
 b=hyigz3JLkUmslY7iHulN6hFfM+G/wXZPHVKSgM3YjlcnDzJzbCHyCcASX9PtBHbnthkJG55FFzgc0gcP5bxE01m5LMjPJi1tAP8ib4vKvqAOcR5qi9RKI9BSYvT/FC8gZC0QfahgXi1z5SiodFISJZsX4Vq20x0zHCxcE2dkP/YNtcs9DLrA2j56qSbyH6yzC4tU4fv+QhETGahbPRgKVSCrK4L8P6034l4nLLRfluaV1WC+2emcBMhvLzNhxuIS+EF47w7O2c4C6zBISs8bmJiD4iGh/vZ/1unls/Sx4LxJ/GoVmPEQuLDyPR2+Y/NVdyNqX6aKplM/ZNj/IutG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by MN2PR02MB6957.namprd02.prod.outlook.com (2603:10b6:208:203::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 14:55:15 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 14:55:15 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
Thread-Topic: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
Thread-Index: AQHYMw1MIykDpUV2rUqySF9PFnA3Zay16aiAgAPtSVCAABYMgIAFA+WAgAAPCzA=
Date: Mon, 14 Mar 2022 14:55:15 +0000
Message-ID: <BN0PR02MB8173B941D59E516EADDC30A1E40F9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
 <BN0PR02MB8173F2E408848216D489D503E40C9@BN0PR02MB8173.namprd02.prod.outlook.com>
 <CAA8EJppt_NjOdJWGrP=8zwG1yEAyJBtnv4G5vLW3CHZ8WrGFvw@mail.gmail.com>
 <CAD=FV=Wy-ew3sbsQ_ojoAdAXeZPsRzwGJWqNQqpuZDb1GPknfg@mail.gmail.com>
In-Reply-To: <CAD=FV=Wy-ew3sbsQ_ojoAdAXeZPsRzwGJWqNQqpuZDb1GPknfg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1b49a8d-4852-465e-cfbc-08da05caa664
x-ms-traffictypediagnostic: MN2PR02MB6957:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR02MB6957B226809585EFC59F8A9AE40F9@MN2PR02MB6957.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXOJiTLLsgAU6jvYPRhjCYmxrUBEGpD4m54gaLjEbF8/dZpy1clLTKI1AXvOV/DwVvoRoN6+JVnc1wJdqR7xUaNorKXjJXiHHCRRfOy3lDr0vSAD5EHrQe9Y4Zu5N5TR9p05nJGh6oxpzUy2CXT+cZEFwG/+hS1Kx8JbrvmMldMutAmu9NvG7eHz/Z5cdTgUqTgFK4g12mUB4Lw8CQ2CjyOrCxo47s8lPTwZaYWcmus2B40X69mG9NPRfSPZa2GjkNJWgRFnQOzKvpbVcxLVXOr6mBWciQYF1cVh5xUJWXZqxlGvC+CYLO7nLIVj2o+9SqQioqS3Pwe7PQHfRRQzR29wo5x3PAy1lMSFMIhEyvc3D4MnmX5bASkvD8bud3op3RLLEqwdkluGzWGT9WIXHKBRrp/k4SMhVV4o7pzY+3P4UgHDW4MUuRS+OMbXwHerTTH5tYYUZqjefJ9hX669zr7ZccHwGD5b1wkjMarRZXwhUKawGahIM2SnZw+Tb7vdkKfXmC0ZMmrXeoV2LTopR2q3yCHLI5tOhDo4UGk8VaG0t1B0Co3rGAKMj75qhFRLI9Z7nT8oSnBGuYvQcmMA3zU8QsdSmxKzMv9VxsHkOakaLwcw7ocLbm2eQCCWIiwha3ZFQiSoVONxrFPhdnnG9vE65mATMDtF/hfW31YNLaIK9VUCyGZCpNZzZKNRDoNBOCMPHzsovMMbWou0Oz8+DQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(9686003)(7696005)(5660300002)(26005)(53546011)(55016003)(66556008)(8676002)(52536014)(8936002)(66476007)(66446008)(66946007)(76116006)(64756008)(2906002)(4326008)(38100700002)(316002)(33656002)(508600001)(71200400001)(38070700005)(966005)(107886003)(122000001)(186003)(83380400001)(86362001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWNaQmFQSTFsVUtISExBamgycm5SQkI5WFlrK1FiYVR0c01YSVdnVFh3Q2tU?=
 =?utf-8?B?SEhWSkNtNjE0RzZLcWVRTVVnS21JR2pLb3FSMUFrVjdpQk1yVjRvYWRyUDV6?=
 =?utf-8?B?eitFVkxTbzdvdm1nYm45ZS85ZHJWVk9oUW5nNzFUaGM2RDNBdXpyWVdCaDVG?=
 =?utf-8?B?eVJ5MU9XRk5XZ1NVTE9obmtROGhHZ0U2Qjc0bjExSWM0S3NaSUdxM1NqV2I1?=
 =?utf-8?B?RkpXWmFuVU5lY21NS1Bha1hVSHNySGN1bHo1VWNtcU9JZE51ZEZLdmdlZk9C?=
 =?utf-8?B?N3NycXllZkQyaFRFRGxoTE1zUkErbzhHUGltYlNTRUJTM2U0UzN1V2RLOXpW?=
 =?utf-8?B?SFZndnRCNHRucXQ2T1VSaE5FZGNtdjRSVjZTK29hWk1UUGF5c3BEUlF0ZUFZ?=
 =?utf-8?B?Z3cwdVZoWFlnSFE5TFYyVnp6WXN4Y0ZsdkJ4b0ZqS2tlTHB1VHVjVyt6VHpJ?=
 =?utf-8?B?MW5mMzdNVGFxSFQxcEtUNnYxNmZMVmwra3Q1azNwNGtzS3B3VjNzeDd2a1Fx?=
 =?utf-8?B?RGNLanBLNUFSNTdrd3gzcldwY3F2Z2sxWC9keVhXS2pXOVFrVGJyNjBTdjVJ?=
 =?utf-8?B?d3BoMGx2ZG1NMkFSemx5UTFBb2JyL2M2Y0MzTU42NGVIbEI4NXJ3ZDZ4L1Np?=
 =?utf-8?B?Wm4zWU50dnh6NnVHRnY2Q1cvYzNOcTFGdTFZdFcxakRqWmw4MUtYOENBZU12?=
 =?utf-8?B?bTR2R2kvUHVUN0tVK3AxOHNsejZLRmZCQWlPTXM1aStnVzViTHJRL2FKN3N3?=
 =?utf-8?B?dVI3Z01JTnZoMmNhVk02RmZ2ZWpEVWhXNHdPci9pL3A4Mk1xTDMzcDBIRzNH?=
 =?utf-8?B?YUhCaXg3c0FqTDNwQ0dTYkRtL21kaDBqWU9kT2VXZFVTU2dvOGR6MzFjKzgy?=
 =?utf-8?B?d01GTDRtSkwrUkRRbUxLWDFTQWFiaVl5aVNZOXprR2ZWb1QxdzJTV3VIdjI5?=
 =?utf-8?B?Mkovd3M2cHpvQnYzWTJ2UmdseXpXTG9ZUnFjMzlUUEI3SEhpTldacXBwRjUv?=
 =?utf-8?B?Q3pUVGRPQmt1dzl0akxUelNhSS9ZR1FIVGZkR09yYThhSUFGMVlDTFB6R3dP?=
 =?utf-8?B?UlA2ckxjUUd4SUQ1NTFiNDJCTXVQOGN3dFJPMnlnd1JhTXM3dXgzVW50YWdi?=
 =?utf-8?B?TFVkWGtrVktlNnJUTmtlUUNCaU0yeFlFb1NBak5TSkpXb3Q3V01Ia2RDcTdq?=
 =?utf-8?B?UFhkSnFEY1JGb2lqVjlGOU5hZHU5UG1UMDcwL2NhYkd6T2M3M0QzV01QdTQw?=
 =?utf-8?B?M1IvUVhRcHVYa2dSdkpNcmY2TDZOK0cxRDFFZlhJaU9oUml5TjNIOFhkSTNl?=
 =?utf-8?B?ODJncVFMc0pmWm0xRGg3VjhHdS9MTm12dU8zWjc5dHIrWjVaM3pjaUIyNXhF?=
 =?utf-8?B?c0VlUm5lU1BsUlFQVmtiT0ZRVnAxbVRKR0d0Tk1ueXVCNVJ0Nm1SRkhQY2RW?=
 =?utf-8?B?bHl3Q1Jhbm44bVF1QUYxZjNqMlJCN3A5cGxDdTZUZWhGNUFQVXFlWUp3NmtT?=
 =?utf-8?B?dzdOSHFCbmdGNWxsY0tmdnJVZ3pwMUR1cmVVbE9yelpENFM4alA4VGM5UVZr?=
 =?utf-8?B?aU9TT2NJQVdqeUU2eTUzQXJsYWcxL1l4Q2t4R25ONUs4TGNqeFpxVnUwTnRG?=
 =?utf-8?B?dGgrZG5SVEVJVENXOHdHRWtVRzVOYnI1dDM1SDQySFpQTllKN3FzdTQrQTVh?=
 =?utf-8?B?WGZCWkpvN1oxR3JEaW1yYmNQSFNGaTAwRGFWRWQvNEJGV1RFbkpvbmtDaWtI?=
 =?utf-8?B?TWppYXhYWjBKSUZ3WXlmRjRPdTZBZG5DV2lwNWhPRFY2eVA1eEhneS9Eczdi?=
 =?utf-8?B?cjF6VGdRUE90blpySFVhckhxWEtDODJRbjNwRHRwbHhVUnJIQy9HalNpVXdG?=
 =?utf-8?B?OGZlWUlmcXlyZkFQQVUzVVNnZkQ1c05qWXNJamJNQ1pBVnYwcmlZSTMzbGE4?=
 =?utf-8?B?U0k0R3dRcUpVS0tIWlVPbVgyWDVHWnd0dGp0VW9NM3I0OHNnQkRPZmQ3UENN?=
 =?utf-8?B?NUtGeWg5end3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b49a8d-4852-465e-cfbc-08da05caa664
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 14:55:15.8410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N502X0LNqLB8hsqhEfvIiJoD4HgD3usUadEpHm/ZicHCKhnCS5BswfDkSaMgrBElslYtpSGBo/yXvdxpzawCzJkgmP/ZvQ4gEHMKYPnZ3vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6957
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 quic_vpolimer <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDE0LCAyMDIyIDc6
MjggUE0NCj4gVG86IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZw0KPiBDYzogVmlub2QgUG9s
aW1lcmEgPHZwb2xpbWVyQHF0aS5xdWFsY29tbS5jb20+OyBTdGVwaGVuIEJveWQNCj4gPHN3Ym95
ZEBjaHJvbWl1bS5vcmc+OyBxdWljX3Zwb2xpbWVyIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29t
PjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFybS1t
c21Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9i
ZGNsYXJrQGdtYWlsLmNvbTsgcXVpY19rYWx5YW50DQo+IDxxdWljX2thbHlhbnRAcXVpY2luYy5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS81XSBhcm02NC9kdHMvcWNvbS9zYzcyODA6
IHJlbW92ZSBhc3NpZ25lZC1jbG9jay0NCj4gcmF0ZSBwcm9wZXJ0eSBmb3IgbWRwIGNsaw0KPiAN
Cj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29t
bS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8g
bm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBIaSwNCj4gDQo+IE9uIEZyaSwgTWFyIDExLCAyMDIy
IGF0IDE6MjIgQU0gRG1pdHJ5IEJhcnlzaGtvdg0KPiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8u
b3JnPiB3cm90ZToNCj4gPg0KPiA+IE9uIEZyaSwgMTEgTWFyIDIwMjIgYXQgMTE6MDYsIFZpbm9k
IFBvbGltZXJhDQo+IDx2cG9saW1lckBxdGkucXVhbGNvbW0uY29tPiB3cm90ZToNCj4gPiA+DQo+
ID4gPg0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4g
RnJvbTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPg0KPiA+ID4gPiBTZW50OiBX
ZWRuZXNkYXksIE1hcmNoIDksIDIwMjIgMTozNiBBTQ0KPiA+ID4gPiBUbzogcXVpY192cG9saW1l
ciA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT47DQo+ID4gPiA+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+ID4gPiBmcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9y
Zw0KPiA+ID4gPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9iZGNsYXJrQGdt
YWlsLmNvbTsNCj4gPiA+ID4gZGlhbmRlcnNAY2hyb21pdW0ub3JnOyBxdWljX2thbHlhbnQgPHF1
aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAx
LzVdIGFybTY0L2R0cy9xY29tL3NjNzI4MDogcmVtb3ZlIGFzc2lnbmVkLQ0KPiBjbG9jay0NCj4g
PiA+ID4gcmF0ZSBwcm9wZXJ0eSBmb3IgbWRwIGNsaw0KPiA+ID4gPg0KPiA+ID4gPiBXQVJOSU5H
OiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2Ug
YmUNCj4gd2FyeQ0KPiA+ID4gPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBu
b3QgZW5hYmxlIG1hY3Jvcy4NCj4gPiA+ID4NCj4gPiA+ID4gUXVvdGluZyBWaW5vZCBQb2xpbWVy
YSAoMjAyMi0wMy0wOCAwODo1NDo1NikNCj4gPiA+ID4gPiBLZXJuZWwgY2xvY2sgZHJpdmVyIGFz
c3VtZXMgdGhhdCBpbml0aWFsIHJhdGUgaXMgdGhlDQo+ID4gPiA+ID4gbWF4IHJhdGUgZm9yIHRo
YXQgY2xvY2sgYW5kIHdhcyBub3QgYWxsb3dpbmcgaXQgdG8gc2NhbGUNCj4gPiA+ID4gPiBiZXlv
bmQgdGhlIGFzc2lnbmVkIGNsb2NrIHZhbHVlLg0KPiA+ID4gPg0KPiA+ID4gPiBIb3c/IEkgc2Vl
IGZ0YmxfZGlzcF9jY19tZHNzX21kcF9jbGtfc3JjW10gaGFzIG11bHRpcGxlIGZyZXF1ZW5jaWVz
DQo+IGFuZA0KPiA+ID4gPiBjbGtfcmNnMl9zaGFyZWRfb3BzIHNvIGl0IGRvZXNuJ3QgbG9vayBs
aWtlIGFueXRoaW5nIGluIHRoZSBjbGsgZHJpdmVyDQo+ID4gPiA+IGlzIHByZXZlbnRpbmcgdGhl
IGZyZXF1ZW5jeSBmcm9tIGNoYW5naW5nIGJleW9uZCB0aGUgYXNzaWduZWQgdmFsdWUuDQo+ID4g
Pg0KPiA+ID4gRm9sb3dpbmcgdGhlIGNvbW1lbnQgb2YgU3RlcGhlbiwgaSBoYXZlIGNoZWNrZWQg
YSBiaXQgbW9yZS4gaXQgYXBwZWFycw0KPiB0aGF0IGNsb2NrIGRyaXZlciBpcyBub3Qgc2V0dGlu
ZyB0aGUgbWF4IGNsb2NrIGZyb20gYXNzZ2luZWQgY2xvY2tzLCBkcHUgZHJpdmVyDQo+IGlzIGRv
aW5nIHRoYXQuDQo+ID4gPiBpIGFtIHBsYW5uaW5nIHRvIGZpeCBpdCBhcyBiZWxvdy4NCj4gPiA+
IDEpIGFzc2lnbiBVTE9OR19NQVggdG8gbWF4X3JhdGUgd2hpbGUgaW5pdGlhbGl6aW5nIGNsb2Nr
IGluIGRwdSBkcml2ZXIuDQo+ID4gPiAyKSByZW1vdmUgdW5uZWNlc3NhcnkgY2hlY2tzIGluIHRo
ZSBjb3JlX3BlcmYgbGlicmFyeS4gSWYgcmF0ZSBkb2Vzbid0DQo+IG1hdGNoIHdpdGggdGhlIGVu
dHJpZXMgaW4gdGhlIG9wcCB0YWJsZSwgaXQgd2lsbCB0aHJvdyBlcnJvciwgaGVuY2UgZnVydGh1
cg0KPiBjaGVja3MgYXJlIG5vdCBuZWVkZWQuDQo+ID4gPiAzKSBubyBjaGFuZ2VzIGluIGR0IGFy
ZSByZXF1aXJlZC4gKHdlIGNhbiBkcm9wIGFsbCB0aGUgcG9zdGVkIG9uZXMpDQo+ID4NCj4gPiBX
aHk/IFRoZXkgbWFkZSBwZXJmZWN0IHNlbnNlLiBUaGUgZHRzIGFzc2lnbm1lbnRzIHNob3VsZCBi
ZSByZXBsYWNlZA0KPiA+IGJ5IHRoZSBvcHAgc2V0dGluZyBpbiB0aGUgYmluZCBmdW5jdGlvbiwg
YXMgdGhpcyB3b3VsZCBhbHNvIHNldCB0aGUNCj4gPiBwZXJmb3JtYW5jZSBwb2ludCBvZiB0aGUg
cmVzcGVjdGl2ZSBwb3dlciBkb21haW4uDQo+IA0KPiBSaWdodC4gWW91IHNob3VsZCBzdGlsbCBf
cG9zdF8gdGhlIGR0cyBwYXRjaGVzLiBJdCdzIG5pY2UgdG8gYXZvaWQNCj4gdW5uZWVkZWQgImFz
c2lnbmVkLWNsb2NrcyIgaW4gdGhlIGR0cy4gVGhlIHBhdGNoIGRlc2NyaXB0aW9uIHNob3VsZA0K
PiBqdXN0IGJlIGNsZWFyIHRoYXQgaXQgcmVsaWVzIG9uIHRoZSBkcml2ZXIgcGF0Y2ggYW5kIHNo
b3VsZG4ndCBsYW5kIC8NCj4gYmUgYmFja3BvcnRlZCB3aXRob3V0IHRoZSBkcml2ZXIgcGF0Y2gu
DQo+IA0KPiANCi0gSSBoYXZlIGNoZWNrZWQgdGhlIGxhdGVzdCAgbXNtL25leHQgYmFzZWQgb24g
eW91ciBjb21tZW50IGFuZCBmb3VuZCB0aGF0IGRpc3BfaW9fdXRpbCBmaWxlDQpJcyByZW1vdmVk
LiBGcm9tIHRoZSBsYXRlc3Qgb3JpZ2luLCBJIGhhdmUgbWFkZSBjaGFuZ2VzIHRvIGVhcmxpZXIg
cGF0Y2ggc2VyaWVzIHRvIGFkZHJlc3MgdGhlIGNvbW1lbnRzLg0KDQo+ID4gPiBDaGFuZ2VzIDoN
Cj4gPiA+IGBgYC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3Bl
cmYuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVf
cGVyZi5jDQo+ID4gPiBAQCAtMjg0LDE3ICsyODQsNiBAQCB2b2lkIGRwdV9jb3JlX3BlcmZfY3J0
Y19yZWxlYXNlX2J3KHN0cnVjdA0KPiBkcm1fY3J0YyAqY3J0YykNCj4gPiA+ICAgICAgICAgfQ0K
PiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAtc3RhdGljIGludCBfZHB1X2NvcmVfcGVyZl9zZXRfY29y
ZV9jbGtfcmF0ZShzdHJ1Y3QgZHB1X2ttcyAqa21zLCB1NjQNCj4gcmF0ZSkNCj4gPiA+IC17DQo+
ID4gPiAtICAgICAgIHN0cnVjdCBkc3NfY2xrICpjb3JlX2NsayA9IGttcy0+cGVyZi5jb3JlX2Ns
azsNCj4gPiA+IC0NCj4gPiA+IC0gICAgICAgaWYgKGNvcmVfY2xrLT5tYXhfcmF0ZSAmJiAocmF0
ZSA+IGNvcmVfY2xrLT5tYXhfcmF0ZSkpDQo+ID4gPiAtICAgICAgICAgICAgICAgcmF0ZSA9IGNv
cmVfY2xrLT5tYXhfcmF0ZTsNCj4gPiA+IC0NCj4gPiA+IC0gICAgICAgY29yZV9jbGstPnJhdGUg
PSByYXRlOw0KPiA+ID4gLSAgICAgICByZXR1cm4gZGV2X3BtX29wcF9zZXRfcmF0ZSgma21zLT5w
ZGV2LT5kZXYsIGNvcmVfY2xrLT5yYXRlKTsNCj4gPiA+IC19DQo+ID4gPiAtDQo+ID4gPiAgc3Rh
dGljIHU2NCBfZHB1X2NvcmVfcGVyZl9nZXRfY29yZV9jbGtfcmF0ZShzdHJ1Y3QgZHB1X2ttcyAq
a21zKQ0KPiA+ID4gIHsNCj4gPiA+ICAgICAgICAgdTY0IGNsa19yYXRlID0ga21zLT5wZXJmLnBl
cmZfdHVuZS5taW5fY29yZV9jbGs7DQo+ID4gPiBAQCAtNDA1LDcgKzM5NCw3IEBAIGludCBkcHVf
Y29yZV9wZXJmX2NydGNfdXBkYXRlKHN0cnVjdCBkcm1fY3J0Yw0KPiAqY3J0YywNCj4gPiA+DQo+
ID4gPiAgICAgICAgICAgICAgICAgdHJhY2VfZHB1X2NvcmVfcGVyZl91cGRhdGVfY2xrKGttcy0+
ZGV2LCBzdG9wX3JlcSwNCj4gY2xrX3JhdGUpOw0KPiA+ID4NCj4gPiA+IC0gICAgICAgICAgICAg
ICByZXQgPSBfZHB1X2NvcmVfcGVyZl9zZXRfY29yZV9jbGtfcmF0ZShrbXMsIGNsa19yYXRlKTsN
Cj4gPiA+ICsgICAgICAgICAgICAgICByZXQgPSBkZXZfcG1fb3BwX3NldF9yYXRlKCZrbXMtPnBk
ZXYtPmRldiwgY2xrX3JhdGUpOw0KPiA+ID4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIERQVV9FUlJPUigiZmFpbGVkIHRvIHNldCAlcyBj
bG9jayByYXRlICVsbHVcbiIsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAga21zLT5wZXJmLmNvcmVfY2xrLT5jbGtfbmFtZSwgY2xrX3JhdGUpOw0KPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYw0KPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYw0KPiA+DQo+
ID4gVGhpcyBmaWxlIGhhcyBiZWVuIHJlbW92ZWQgaW4gbXNtL25leHQNCj4gDQo+IFRvIGVjaG8g
RG1pdHJ5LCBwbGVhc2UgbWFrZSBzdXJlIHRoYXQgeW91ciBwYXRjaCBhcHBsaWVzIHRvIG1zbS1u
ZXh0LA0KPiBBcyBJIHVuZGVyc3RhbmQgaXQsIHRoYXQgbWVhbnMgdGhlIGJyYW5jaCBtc20tbmV4
dCBvbjoNCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbXNtLmdpdA0K
PiANCj4gLURvdWcNCg==
