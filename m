Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750FA8464A4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 00:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F73910E187;
	Thu,  1 Feb 2024 23:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="RDF13AQh";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="6zBcR7JC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD0910E187
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 23:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706831618; x=1738367618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eqeOoAL34/x1WbWu5ykgDSd8JRvJfHR5ZlA3cN1fDCU=;
 b=RDF13AQh+6J2+tqAW5UyVClCkFR5uao8T21oGG9apzxIZiym/4YzgRzm
 yjaDElH2Y9eDixUBBhac04PlHGkR0TxXhfY1oE4C5xDJ87ARCBe0gWgL0
 Qh2Kncp/s+PYJfHEa4pHe4RpsJGjHOomUkc4wfovuTAPiB34Kf5nnHZt8
 uA3HaxGpy6rYvelm76VCvMpb7ushu5M+knpStHPRAuJnIGaotcr0gyUBw
 9heRiW8z4uzkd2Q53+hH2wZrQpz4oLkHVkwbCfEV95o5Q/ck7AoOpZuy9
 LkJvwZJoFj9K8n0vVw03wQK7egju9enuyQ6+er9jyxnR/jYz6Jyaalz+/ Q==;
X-CSE-ConnectionGUID: Z6U7DcmBTLuDGzlZqzEQMQ==
X-CSE-MsgGUID: 37d1arG1QR+TFYnlqK91QA==
X-IronPort-AV: E=Sophos;i="6.05,236,1701154800"; d="scan'208";a="246380548"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2024 16:53:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 16:52:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 16:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQRPUqruIffS61qMVpDx+woWrU8K/7eyg2Tm7el5YDqs0Pu9kTAykjxre7dksJBoxRNKynxHDCwOTiW3xOGqN/n8pNUQGrkvHjrIlbOz5b19aFndMYf9Zur/vV8194v/AlIGtCgqzusPatMi/54cN++XmV4rnVPvRl0E3hbjkpNp5mGc/QneP8DWAEl5l5XLZYNYufPw0VzNlwJJ/62tEsrAESkI+ohHAAA6Q2iCw6nX024Gu3DxqrrRH5PPFhmP4UYrT6qwR/72ejW4hTxyX0RBGFljS4Wo3sCbfSQp3tfVk4ZO6tMkcZOlZfvetWRfdkDILFUFbgoUPHd1/R6myA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqeOoAL34/x1WbWu5ykgDSd8JRvJfHR5ZlA3cN1fDCU=;
 b=MrCJiRmVd9TmllXHh8nrIO6hzBhW1cLbKxoJ9lVGH6U3Gl+NNIvgu0GrunS5w2nEXpH/pzuZkHJ5Ur1MirhxA4QTfi4yRFAqstskh4kKtXZ3hya4zz9xtIeT0ZqYVJzF+6EQqkdVV28e3vVdrqpZOxPUaOWxituVnH4s6aI92sCV8UKXz8lZ2V4/3FQksytRA4w6JIlx9fLq8263++cMFg9YAxCqdLlGa0b/AX/KI32eariyBbPYvKE6xcOMAg+EDTPemWLLicv9SA1couroncdYjFMVE/tBziUmzenBnsK0bx42dcpz38vgy3rKscJeHXZMqBtBw9o3EzO8DMo84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqeOoAL34/x1WbWu5ykgDSd8JRvJfHR5ZlA3cN1fDCU=;
 b=6zBcR7JCFf6gxhF+hkVmM/US4v8aIMhi+GsHdEDcvAypInLaCmJdujMisJ/FWQrBg8XA/FPOjqe2hKoOmzpTptbu1bdov0t307qP7zEcWJiud36qnb0hy9KB0nDoLUQyHT9dMEbSP9E/++gWgFCHCWfcxhJUYHzC+cArymAhv8qp7rU8rzH+mpe0okh19KSVVLqpi3AjzdKMxlpTZ/t0PFVG6WxGlo6moi8LgE4NJZSXRD5ykMyqU/q0Ja7u4dfC8/532jmZR8BtVJ2XpDx3vTumO+0RLS2SA39bJIV8j0H/rv3EhyMADkbL1sZTS5K8S2rUE/tZ9EjupN8Oez0azA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 23:52:53 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7249.024; Thu, 1 Feb 2024
 23:52:53 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
CC: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <lee@kernel.org>, <thierry.reding@gmail.com>, 
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>,
 <Hari.PrasathGE@microchip.com>, <Manikandan.M@microchip.com>
Subject: Re: [linux][PATCH v5 0/3] Convert Microchip's HLCDC Text based DT
 bindings to JSON schema
Thread-Topic: [linux][PATCH v5 0/3] Convert Microchip's HLCDC Text based DT
 bindings to JSON schema
Thread-Index: AQHaU/afGNCqaviMx0Sn8Qd7rlUHCrD02FgAgAE93ICAABVmgA==
Date: Thu, 1 Feb 2024 23:52:53 +0000
Message-ID: <912f1b87-e266-47dc-99bd-a32d303e70ce@microchip.com>
References: <20240131033523.577450-1-dharma.b@microchip.com>
 <478cab42-5f30-4fbe-b42d-02d16b81ca11@microchip.com>
 <20240201223615.GA1726520-robh@kernel.org>
In-Reply-To: <20240201223615.GA1726520-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SJ0PR11MB5917:EE_
x-ms-office365-filtering-correlation-id: 92425f90-5657-4188-b7ed-08dc2380e7e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +OOBxcG9AG6xP0Z0jq0Gg6cEqfEZ/+TZF1GtxuXHYDdOYv8+EXVF9WVkDl/vRw5niYuMEnZyO4DKmXLDK6+8EJNaD4vkHC/yq7MUjI+Nj8iyWy4z3i9SDzRS/2JLKh5h5ts3Js6oxnyGC2wzahpWGv7RphLM0jDWlYbPwPcmUT91iGPYmULRZ+8bcJ87Gq+jSZ1LPhilO4drg13+IAqSevn1F8SrBO4+SphT/pm4HsAGbEZX/VFDopL+DAp0cDvMlmUMcJbFXFycTGHAY6iswWe7uDOfErOB4xE1KE+kgdJeKBF1LNxd1JtH1c8hNgKIBRU/G+AD+EHunEcCPQ0pCaqVkUWXWhsBeSBQWtjdK+xRyGBC6zL8CLwA6uES2uqjIFnI8qQXbYM4r/NBIykg3CJZiJIYsy+PmlBorMNy3fJVydfQhXhNDYwK36+dlUxPkBXDcIUAempnYPoDR1hrOHtWgQSSGvdHxeV1OmpwUTlzCdDzhqxWLVHdCyeo4ApNCNKrSRxABhoR29Tjtc8NUtW3Om+thJva1hULn1DFLBkClMtqZN18RCU2My+925xyzn/PJV453Yy5mg3OEc1V7RbAPyxR1ak9aXa/YJpToupZRoAKNVtAWN61WzMO3hCb6AjQpZ5Vw70CEcAtbwnNdye8SvuN+nOB9lamG5+5Ljte2OKeVnCuXtgk2365HjG0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(83380400001)(31686004)(41300700001)(36756003)(31696002)(86362001)(38070700009)(6916009)(122000001)(26005)(6512007)(107886003)(2616005)(38100700002)(478600001)(53546011)(6486002)(6506007)(76116006)(316002)(91956017)(71200400001)(5660300002)(64756008)(2906002)(4326008)(66476007)(54906003)(66946007)(7416002)(8936002)(8676002)(66446008)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STFPUENCNzVpTTVEZWJ6TGdrZkdSOU9XdXhiMW8wSHBQWkZnUUg5UWRiaUgy?=
 =?utf-8?B?Y2N0TzlzdjZqTHNOWElyNDFOK2RZTHd5dW1OaGdhWDVNRm5GcjhNK1VrTEtB?=
 =?utf-8?B?ZWEzK3BMeXZQOUNsQkhDekY3dDNnb1JSZFVYMis1YWtyVDYzWUphcjZGaXNG?=
 =?utf-8?B?b1dGQmZYbkUvV3E4aDIwRXF6T2tGQlF2cXhuQ29iZkF3cTdPZVhaWHc1dTZW?=
 =?utf-8?B?YXZTdmc5R0N0MHFuTkhJSlh4OHk1Vklub3c4VFV2THpkbDBTZURKNnNWVXNZ?=
 =?utf-8?B?SVRoVTVLYkFhWHdwTG9CNU9waGN3RzlKYkN0TzFxQkJFRXJmVGVjMldHeUh6?=
 =?utf-8?B?NVRxK0JLb0lnUHQvUmRKZEtyUjNlQ01JWk02Sm1XRDlGMlp6QUt3MUZBWm11?=
 =?utf-8?B?cm5WajlGNHdBWTBuTU9XSHNjTjV6amtIYUdETVQwVlM4d3JHSzBJeUZUMnJo?=
 =?utf-8?B?Q0EvZjUvU0dOS1h3dVo1azV5V2N3M3U3b1dHMEVPa0pOQlJBRUgwalZZb0JZ?=
 =?utf-8?B?aVpSM25aeVF3R2phTDIxeGprY0pvcUZkdzRCZFdHbmIyWGJvTlZxMllFQ3Vh?=
 =?utf-8?B?Y0hSbTY3YUovL0pMMVZNZ0t1YUVhVGFDUUtmZ1Z0TC9LUVdSRkFnRnF1aDRw?=
 =?utf-8?B?b1BVb2w0SFAvWWVRTkQrSCtCb1cwZUQrT1ovdmVSb1QwK1NhR2hEUlcraFoy?=
 =?utf-8?B?Y0Y5eHhlTWZ6RHZWQU42K3BRNHU1TWdsSC9GeThXVkFQTDJzT01GSDhIOExP?=
 =?utf-8?B?TDVNODJJL24za0ZjYWlmNGpGOC9USlNlQjlVSlJ1dlp1YVEyK3VWdzNZRzlL?=
 =?utf-8?B?Sjl4WDF6V2ZyTzBlUVV4WVdlYXFUaDdTSy9rTHNGcEF1dVNTLy9QSG1yaDJK?=
 =?utf-8?B?RmhvbU5Pa09BTEs0SU81ZTdqMHZJQnFXcGFxY0IzMUtBMFhPN2VmV28wTDcv?=
 =?utf-8?B?MExKZHZ1amFzMjVkV1E0NmZFdTlZRDRHMkRick1hNW1HaVE4eXNpNVhvbWxL?=
 =?utf-8?B?UUxQREczKzZjaHlsMnUrT1pqcFNxZXU1a3hjU0tmbytkajF5OFJ0Q0NLSWJI?=
 =?utf-8?B?Y0ZQcDIvaytlZ3FYdnNuaUJZUnRtRU5tNmtxNlVPSGt5Tkw2SXptK3FZY1p5?=
 =?utf-8?B?SVJoaGs5aytSdmFhNTk3Z09xczh1dExlTEwrSWZkdzI5azZpRHl1ZTJCSjVp?=
 =?utf-8?B?VjNGckNLTWxUc0ZLbyt3VjZiendUZUR2VTBRNVJVOWloUHUzU05qVFZkeXBa?=
 =?utf-8?B?enZyMi9kTnlqZ2hiZkFlS0ZRRVhrM1dNUVFyWjU1ZFBxdFJ3aHlwbXA4bS8y?=
 =?utf-8?B?U2RhQ3MrT08zWk5BRXNiRk1NM3pGSURwYWR2bVBsdmVYVmliOHI4bWpLYnBF?=
 =?utf-8?B?YXRic0VUeFVsM01zeXFBQmkrVkl2aW5sd1RvaDR3WWg4OWhwYmtDUWVLVmtq?=
 =?utf-8?B?WkswUzQ3QWpJSHNIRE1hMUFwSy95eEtxc0EvOHNaMStTRm8zdjZJeC82Wjd1?=
 =?utf-8?B?NVQ3SGdGQlpON1NDMmZWTk5mdE1Rc3p2T3Bmamo2U0ZGR1lBa09PWUxCUnE5?=
 =?utf-8?B?SVNxT0hmdWdxQ3BJUWhwWVYvOVdiWlQ1cm9FR0FnaHhwOUJtM2FycS83Q2ds?=
 =?utf-8?B?R1ljWkJSRi9LSGxoQi9HaXJRU3dESEFQUHVQMnF1aWlKQ1kzbjNBZHJsbUxu?=
 =?utf-8?B?clprU3B5L1hCam1DT1phbm9ybG56SDI0OWt2NGNNZy9NR2pNSDlFVTE3YlFK?=
 =?utf-8?B?K2x1RTBkL1BPenNuTDFOWkdIdW5YczRIaytiR0VwdVRMbXJDVDRaR0dZQTZ5?=
 =?utf-8?B?ZlY3elArektxQkNqYzVOM2ptTTFCM2tsd1ROay9QZURBS3h5Y1JUT2hLNVYx?=
 =?utf-8?B?bGhuZmx3c3dmNGJKcDd2NFViUkRDTmVoZkxzOWxXUy9DRjdlWXRpMXBrMHJw?=
 =?utf-8?B?UUE0Q21USTAvb0Rja1FLUHlxU0srRTFJTmora2hFN1RORDZrUURub2JCMTNz?=
 =?utf-8?B?S2IwRUVaY2M1SEtiamE0UDRETXd2M1AvS3MySDRHdTR1d2JDRFMzVCtyTm8r?=
 =?utf-8?B?YUtkbENSdDlJTERKbnBkL0pmb3BNblFnbllUZ3B1U1RqWEJwU0RqU0xtWVBq?=
 =?utf-8?Q?Q93yG/EJjGtnpaJyQVsYeIgQc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92BFE2B259E7F644A61169D9EF376712@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92425f90-5657-4188-b7ed-08dc2380e7e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 23:52:53.2388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qa0AwoVQeSv3XXgu3FhjnHP9J/if/3erPWHg1KW+C9W+f2C64IMJg7Kw/mFETS/U5irELy3fIIO0ASS+rUcdQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

T24gMDIvMDIvMjQgNDowNiBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVGh1LCBGZWIgMDEsIDIwMjQgYXQgMDM6Mzg6
MzdBTSArMDAwMCwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEhpIFJvYiwNCj4+
DQo+PiBPbiAzMS8wMS8yNCA5OjA1IGFtLCBEaGFybWEgQiAtIEk3MDg0MyB3cm90ZToNCj4+PiBD
b252ZXJ0ZWQgdGhlIHRleHQgYmluZGluZ3MgdG8gWUFNTCBhbmQgdmFsaWRhdGVkIHRoZW0gaW5k
aXZpZHVhbGx5IHVzaW5nIGZvbGxvd2luZyBjb21tYW5kcw0KPj4+DQo+Pj4gJCBtYWtlIGR0X2Jp
bmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy8NCj4+PiAkIG1ha2UgZHRic19jaGVjayBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzLw0KPj4+DQo+Pj4gY2hhbmdlbG9ncyBhcmUgYXZhaWxhYmxl
IGluIHJlc3BlY3RpdmUgcGF0Y2hlcy4NCj4+Pg0KPj4+IEFzIFNhbSBzdWdnZXN0ZWQgSSdtIHNl
bmRpbmcgdGhlIFBXTSBiaW5kaW5nIGFzIGl0IGlzIGluIHRoaXMgcGF0Y2ggc2VyaWVzLCBjbGVh
biB1cCBwYXRjaA0KPj4+IHdpbGwgYmUgc2VudCBhcyBzZXBhcmF0ZSBwYXRjaC4NCj4+Pg0KPj4N
Cj4+IEkgd291bGQgd2FudCB0byBrbm93IGlmIEkgY2FuIGhhdmUgdGhlIGV4YW1wbGVzIGluIGRp
c3BsYXkgYW5kIHB3bQ0KPj4gYmluZGluZ3Mgc2VwYXJhdGVseSBvciBpZiBJIGhhdmUgdG8gZGVs
ZXRlIHRoZW0gZnJvbSBib3RoIGFuZCBoYXZlIGENCj4+IHNpbmdsZSwgY29tcHJlaGVuc2l2ZSBl
eGFtcGxlIGluIG1mZCBiaW5kaW5nLiBJJ20gYSBsaXR0bGUgcHV6emxlZCBhYm91dA0KPj4gdGhp
cy4NCj4gDQo+IFRoZSBzdHJvbmcgcHJlZmVyZW5jZSBpcyAxIGNvbXBsZXRlIGV4YW1wbGUgaW4g
dGhlIE1GRCBiaW5kaW5nLiBUaGF0DQo+IGF2b2lkcyAyIGNvcGllcyBvZiB0aGUgc2FtZSB0aGlu
ZywgaXNzdWVzIHdpdGggaW5jb21wbGV0ZSBleGFtcGxlcywNCj4gYW5kIHRlbXBvcmFyeSB3YXJu
aW5ncyBiaXNlY3RpbmcgdGhlIHNlcmllcy4NCg0KU3VyZSwgSSB3aWxsIGRyb3AgdGhlIGV4YW1w
bGVzIGluIGRpc3BsYXkgYW5kIHB3bSBiaW5kaW5ncyB3aGlsZSBzZW5kaW5nIHY2Lg0KDQotLSAN
ClRoYW5rcywNCkRoYXJtYSBCLg0KDQo+IA0KPiBSb2INCg0KDQo=
