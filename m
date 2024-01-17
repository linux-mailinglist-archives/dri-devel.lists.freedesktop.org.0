Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ECC82FEEA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 03:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4677710E5E2;
	Wed, 17 Jan 2024 02:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D74510E5E2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705459413; x=1736995413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TNwoUqM3ow2xyOihWjdKbqZ1a55Y9pUZJ7YY2dmWSkM=;
 b=LbDdBJ8jbIXfku8Uzl4zsDS6vrtRvgqrjEFyor2a/cvTGh5ckNwXQZSG
 ped1gplGMijMGqwcY2N4tvxU//9zuYwAWk4nRmMnvoixSVKJJ1iVDyhoJ
 G8p/oHySVAasKRF/+JZviKz83mLlqqwrI4iB1uuytGd2B6jcQcHoV/bBm
 MCjTzbleDd0o8jmWg+lYeBfjPbc1Ee/vWqvLbQL3BTotF6YIXOZU4Xdhn
 QrHTqy6/dr9yKtFJTqjfiPHMFuyYJfAN9siNshX+IVOcLAuXOLm926Ouq
 PaekzUFfbXSyn9WAjrjMXsO1EE0fUO+qkdjdyyXQEKpEkprypfA7gw/As Q==;
X-CSE-ConnectionGUID: FyhsTooMSY+2roKF1jSQUA==
X-CSE-MsgGUID: NRl6RWlvRYCrUrfu3StfhQ==
X-IronPort-AV: E=Sophos;i="6.05,200,1701154800"; d="scan'208";a="16049455"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 19:43:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 19:43:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 19:43:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwkC/NS6jPs8WoUZbI5Toi8ph7bic/NsDNcP+EjILr4E/tbrPtLI68j+9TCh120ojxoxLHz7B9eFd9WSbGv2XF3s+G8HGgSPrFizR4V5OMmfvaedHwb3EqZFcz3GryfTow7ao+5ODRVelFvePMEepi7qu+1rQKAJNhC4OO+SGRXh3h+PqfGEsWqgKV48URCS2GqH0O8mcMwYO2RX3T/r6oihTEx9HPvRxYWVyR3DggMOWNw1LPgNIPiKZydcumeKvfGaAsO0q1Ywi2Sqb9TIKx7R4Cy8ecIVHmCyfWWT6m9rhU3r2Pjb05bljvC5cb2grIbrXPUuACrB1o1hkQUL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNwoUqM3ow2xyOihWjdKbqZ1a55Y9pUZJ7YY2dmWSkM=;
 b=V2iVmiOkQNipNMOP+zuaEw0CUdbbbPkm4PvnNjb8GTAi/+aSCzOygnHiq852wmHuQWvM2ANnrPejzXRXf0j41B861pmIdZsPG8ftiL27HXpuQxpqu4iNTrDRf5/xgrjH1Zw+Vwf56nNb9UgOROrrsbEY6fqFV7kICQlBnwOHOX9vX8+CVPig5xS2NLJBZt5CxDWsOmwWMY1+ioA8B5cXbmHgfd6VwgweYRLyoio5Ydx/8Y3zpqlUKjD6aaE4R6CJBxEWb+97hLMHAPTO0PeOIE0R9Jy/+1Greq6c3HqCLWspVvU3a12cxbDaZqvx9g7bbT1qL8o+p1s/b/ufHtX7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNwoUqM3ow2xyOihWjdKbqZ1a55Y9pUZJ7YY2dmWSkM=;
 b=08iAyWbirdbGEwpPS8/UO6xdKKqATJx/cCl0IwCxsb786NVdoVta+GdjXJuRlga4qR1b+METAKZrE2zQ0+U+kT8GkVQq0UjH/qam2tZ1bYtTgWfoRhdYwm/yzA5nlglJ6EoGienaKBZ6OJWNvdmMT22/Q82ZfsCe+3Q6okpVLRb7dofHb8K9ndXlRwGN8Aw6ymQlz3nTlx56L/VZTpJDK6jZP7NTrd3dt2QthOBpYDhTQbsHRtz2lhJZ3eeQpmYD7FmCpRLVczCkdliAqSwiCPTdm4q3Z28offwp8eTMt23VYlHq/IpkBXuVMoOtu0KP5+8PkO9oxR2IZhSfQi5Teg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 02:43:00 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 02:43:00 +0000
From: <Dharma.B@microchip.com>
To: <alexandre.belloni@bootlin.com>, <conor@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Thread-Topic: [PATCH v2 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Thread-Index: AQHaSHChSEXrKWltNkmrAKNQoZ+LobDcu7GAgAAjowCAAG2OgA==
Date: Wed, 17 Jan 2024 02:43:00 +0000
Message-ID: <6124f244-23bc-4b84-b678-f7214cf8c48e@microchip.com>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-3-dharma.b@microchip.com>
 <20240116-rising-gap-df4124f191a0@spud> <20240116201052544a0791@mail.local>
In-Reply-To: <20240116201052544a0791@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SN7PR11MB6702:EE_
x-ms-office365-filtering-correlation-id: ba90260f-923f-4e8e-ec98-08dc17060532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rWyxmPp28xCjfk1Dl0svk3W6E/Balg6WBJBkaE+JSg6roARSpqBEpe41k440phXCck4xzJoRek7rw53QpT1xs8sF7tLhpkRkxr4aVYIP6cfznqaSMgoW2NJ5MP37M5cyRTfjVCs/IRtFr6LIGl+NP0UWEUaEXSogbY8A6vVX2NU/+UqnPqs9iJPozyq54UobNHqZtL4+BiG1B+SDxlZDTg84vj+RPw2AKf+Xvk87gyLMWNrnJLdDAfN9CqYra4eClVJq2XvPH+wKHuYuM8Rfk95iXTGn+Gjkm62StX26rpVLDIwgmwZk4ZTBm2LspJgn+Qa3BpOH4dZ3DlVR0//xlbhBdq4OMPLTqh6PBO5+KciFjx1KoTW2mgPxNBxLCDWHsn3sKhJMsYyNar+ZdwvJfuLFbDaHjzTDEcRSSVOuIm2HXDef5R0U9aSEjaVHubetx2W8X7gHuc7Ita/YtazLBrwAQ9pJ/K26d8ZDQWsUCvOXlpDLlXJ31uUFqmcxvqGIRMkTAa3RDE+vdLjZzhgf2iPewBTVHZ/fgLa0tJPd/0HnzCpPaxIq3Qke9ZZsbMfYz6ia0j4HGP61y4ewIayDO+gyPFHL3YhYo0XKSq574WQnE3UY/skRWhKhCnxG8AdveepXkIM5vDRS31lYUqKB/rdCQEgyalYIV2TxYfBm4Cuu/0kccX03HBuTYH+HHMqK9/8OexEDxFLcCrOa1WENuXgUckvgJzHL6YqooPpTGsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(451199024)(186009)(31686004)(6506007)(71200400001)(107886003)(53546011)(6512007)(2616005)(26005)(38100700002)(36756003)(86362001)(31696002)(38070700009)(8936002)(2906002)(41300700001)(8676002)(4326008)(966005)(6486002)(122000001)(83380400001)(7416002)(5660300002)(478600001)(316002)(110136005)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(54906003)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVlxRXA1aUpyMGJCRlJ3OVRtTWovY3d6Q1Z6SFNxZmwzcWZIWC91L2grQTQ1?=
 =?utf-8?B?ZXlGQTVjUEpuUHR2TUZRbWxJbmQ2aURQQUx5L2o0eERVcThsbzl3MmZQMHRV?=
 =?utf-8?B?bWtUam9GTzByMS9KSmZLbHBHWnVWdXcvNXNrZE5VdUd3STNrOUx1Z04wV0dD?=
 =?utf-8?B?K1IxUFhGdnZWTTBlRVE2MHl2aUlmZEdMMEQxVHFiYURodHNrUEh6ZGZlV0d0?=
 =?utf-8?B?NGdQTW9yZEt0eElzdDAwRTZrN094Nko0aTZqSjJKSTVHZW5LT2g4cmF3dk8v?=
 =?utf-8?B?b3dydXcvREpBcUc5YkV3THhrVlRjc2o3d091blRiNzV2dTJSRURHU21CWGhm?=
 =?utf-8?B?SVROQUFXZE1lNXhzK2pzSzlPQ1BCYWYxd2hvSytsQXR5V3Y3aURRYkErRGdI?=
 =?utf-8?B?MXRWak5TcktuVlc3bjg2MEFHOFdiSkhJNUxKUUVpak9GVFpRaDBSR0xoZ09U?=
 =?utf-8?B?bis0MGQzYkFmYk82MklYdmFEZ3Y1MU9Wbm9tYjhXdittUHJSd2luWUk0Tm9y?=
 =?utf-8?B?cmJtTFlaM3BNVDc0cDRKNkcrTVl1cWs3OGhnSjNxUkhhZzlDNnlvb3oySWtl?=
 =?utf-8?B?QSsrVksza0hqQnlSYWN2OGx2bmtuYjdIdGtscWxjSm5rTGFkdk1VcnRTMjJD?=
 =?utf-8?B?VG1JV3pMTlFORm0wMTlHclIrNkY3S1pQSThLMTI2SzNuT1BlVGpMNGFZejQ0?=
 =?utf-8?B?MXhlTGsvM0hGMHBrMlNNd0pYOU1IVm14RVE1cUExWGlpSGlrc2I1T3pQNWtN?=
 =?utf-8?B?Q3BTaU9Dc3J6NXlkcEo5UU43UGJmL2gzV2VMWkliMkpPUTRrOUF3b2FhS1ZY?=
 =?utf-8?B?dTd6K1FPeDZmd3dGS2R2ME1HaGxVU2o0WWViZ1ZiMTc0cmsrM0o4WnZ0QjRG?=
 =?utf-8?B?RCsxcmtsdmhxK0Ixb3llWlZqVmZLZCtsTnFud3JiY1dNOHBuTXRUVWhmL0Z2?=
 =?utf-8?B?MU5NU203dUo5d2Zvd1BoVjBkQWlxOEpERE1ndVdhbmU2OHRuVDU2aEFXOW5P?=
 =?utf-8?B?QU1nTUhLSUtVNnYrWmhIcmtPbElXQmY3SGxqeUFuZU5Xb2MxK2M0SW5wdnk0?=
 =?utf-8?B?YmJVb3ZHc2xtczF3a3liN3REcFpnNzZkdzFoU2pjSnBPaWIvTUYyakJDeHFw?=
 =?utf-8?B?bEZERW9Sb2JINUJzVVVhVHJkUkllNWdUeVBOdlJWMVFMZnQ3L1R4c0REL1hN?=
 =?utf-8?B?VGVZQWxNdHQ4VWxJM3RKd0hhWVhFTzlRUm52b0FQS2IwSTVqY1NnV2pER3dF?=
 =?utf-8?B?MTZZc3czRnRQMi9OTU9UY05DQkdlTGNpMWc3d0VvVWtkRUZVendjQlhPdGtD?=
 =?utf-8?B?SWs1cWtSSkJnWkFOYnFFaCtYQzdaYVFuaXNxclNHRmMzakxPcWg4WElZa2lK?=
 =?utf-8?B?eVI4YmVJdzRnZnAyTUVJRXYzZ0pmQmhsbEJYaXgrMi96RFk1S241Slg1THZK?=
 =?utf-8?B?UjhnU0N5bWlTYmxQeGUwM1BzMzVzTjhOYnVUY3VaVUllbWVqSzl4dHptSUpE?=
 =?utf-8?B?WGxTMFltOW1FMFh2c3JXRHFYSTFVNWZNbWsrQmR4WDZhdlIyZk1UeXFpTmxR?=
 =?utf-8?B?enE4TVZKQ0tjU3pVK25kWUNsQW12SHg0c2ZzR2lPdmNJc0tnbEdOeWRnZEJT?=
 =?utf-8?B?VWZuTkpZblhNSGNrd3lTZFBrQVhDUWYvVnRsVVI3d2lKMWxFQUdpbVJ2TlZT?=
 =?utf-8?B?VzlIQkN0dmtVMmJVaU5NS3pEWTRDUzYrdDI0dWRDMUNnZDcxdFdaTWdjcnQ1?=
 =?utf-8?B?YzZyVEV0ZEI0MVdIMldxd1pJd0RXQkVNYVM5NlRESE1odHBDTll3dXVXeEps?=
 =?utf-8?B?NFVZRGYrcGxET3pMQzV6ZENQVThYK1RqOWtqdTZiZjB0VUN3eHM3ZmpSeUpJ?=
 =?utf-8?B?OFJVdWhLTFMwcFUycjVDbldocFV4ZG5kNUVOTjRmZldvM1dPdnZLUStKWXVS?=
 =?utf-8?B?T0gzNVhpeWswR3hpS3p1N2txL011QTBQamlNTTZqS1RIQVlkSkREQUlVcEV4?=
 =?utf-8?B?b0h1ZkdhdmV2eUNxS0doRSt2QjFzUGtkY3Q0K2Uyc0lHKzBpd2JXU21XRjlW?=
 =?utf-8?B?TFBjYWxta3pyUmlWZUpNT1NtMEIzUWZFTnV6VHFJRjdZRHNmbWhLa0NnMFVI?=
 =?utf-8?Q?/r6LV2S50ezb3bZEAGbJ/Sre+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31B3052F15BB844EB82A1BF4705D4138@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba90260f-923f-4e8e-ec98-08dc17060532
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 02:43:00.3850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s91/PUBoaZMl52kPBQ9jaI1SoY5Ar5i1GnFvI7/mxJbXq2np3AI4VfWgt5I94oe+OC+45Mm+qZ3SMIMZ0Xv6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6702
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
Cc: Linux4Microchip@microchip.com, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas.Ferre@microchip.com,
 Conor.Dooley@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev, airlied@gmail.com,
 sam@ravnborg.org, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDEvMjQgMTo0MCBhbSwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMTYvMDEvMjAyNCAxODowMzoxOSsw
MDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+PiBPbiBUdWUsIEphbiAxNiwgMjAyNCBhdCAwNTow
Nzo1OVBNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+Pj4gQ29udmVydCBk
ZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgQXRtZWwncyBITENEQyBQV00gY29udHJvbGxlciB0byBZ
QU1MDQo+Pj4gZm9ybWF0Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFzdWJp
cmFtYW5pIDxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4+IC0tLQ0KPj4+IGNoYW5nZWxvZw0K
Pj4+IHYxIC0+IHYyDQo+Pj4gLSBSZW1vdmUgdGhlIGV4cGxpY2l0IGNvcHlyaWdodHMuDQo+Pj4g
LSBNb2RpZnkgdGl0bGUgKG5vdCBpbmNsdWRlIHdvcmRzIGxpa2UgYmluZGluZy9kcml2ZXIpLg0K
Pj4+IC0gTW9kaWZ5IGRlc2NyaXB0aW9uIGFjdHVhbGx5IGRlc2NyaWJpbmcgdGhlIGhhcmR3YXJl
IGFuZCBub3QgdGhlIGRyaXZlci4NCj4+PiAtIFJlbW92ZSBwaW5jdHJsIHByb3BlcnRpZXMgd2hp
Y2ggYXJlbid0IHJlcXVpcmVkLg0KPj4+IC0gRHJvcCBwYXJlbnQgbm9kZSBhbmQgaXQncyBvdGhl
ciBzdWItZGV2aWNlIG5vZGUgd2hpY2ggYXJlIG5vdCByZWxhdGVkIGhlcmUuDQo+Pj4gLS0tDQo+
Pj4gICAuLi4vYmluZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1sICAgICAgICAgfCA0NyAr
KysrKysrKysrKysrKysrKysrDQo+Pj4gICAuLi4vYmluZGluZ3MvcHdtL2F0bWVsLWhsY2RjLXB3
bS50eHQgICAgICAgICAgfCAyOSAtLS0tLS0tLS0tLS0NCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
NDcgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pDQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hdG1lbCxobGNkYy1wd20u
eWFtbA0KPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wd20vYXRtZWwtaGxjZGMtcHdtLnR4dA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55
YW1sDQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjc1
MTEyMjMwOWZhOQ0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1sDQo+Pj4gQEAgLTAsMCAr
MSw0NyBAQA0KPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkNCj4+DQo+PiBUaGUgb3JpZ2luYWwgZmlsZSBoYXMgbm8gbGljZW5zZSwg
YnV0IHdhcyBvcmlnaW5hbGx5IHdyaXR0ZW4gYnkgYQ0KPj4gZnJlZS1lbGVjdHJvbnMgZW1wbG95
ZWUsIHNvIHRoZSByZWxpY2Vuc2luZyBoZXJlIGlzIGZpbmUuDQo+Pg0KPiANCj4gSSBjb25maXJt
IHJlbGljZW5zaW5nIGlzIGZpbmUsIGV2ZW4gYXNzaWduaW5nIHRoZSBjb3B5cmlnaHQgdG8NCj4g
TWljcm9jaGlwIChub3RlIHRoYXQgQm9vdGxpbiBpcyBsZWdhbGx5IHRoZSBzYW1lIGVudGl0eSBh
cw0KPiBmcmVlLWVsZWN0cm9ucykNClRoYW5rcyBDb25vciBhbmQgQWxleGFuZHJlLg0KSSB3aWxs
IGFkZCB0aGUgY29weXJpZ2h0cyBiYWNrIGluIHYzLg0KPiANCj4+PiArJVlBTUwgMS4yDQo+Pj4g
Ky0tLQ0KPj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3bS9hdG1lbCxo
bGNkYy1wd20ueWFtbCMNCj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjDQo+Pj4gKw0KPj4+ICt0aXRsZTogQXRtZWwncyBITENEQydzIFBX
TSBjb250cm9sbGVyDQo+Pj4gKw0KPj4+ICttYWludGFpbmVyczoNCj4+PiArICAtIE5pY29sYXMg
RmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4NCj4+PiArICAtIEFsZXhhbmRyZSBC
ZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4+PiArICAtIENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+Pj4gKw0KPj4+ICtkZXNjcmlwdGlv
bjogfA0KPj4NCj4+IEFnYWluLCB0aGUgfCBpcyBub3QgbmVlZGVkIGhlcmUuDQpTdXJlLCBJIHdp
bGwgZHJvcCBpdC4NCj4+DQo+Pj4gKyAgVGhlIExDREMgaW50ZWdyYXRlcyBhIFB1bHNlIFdpZHRo
IE1vZHVsYXRpb24gKFBXTSkgQ29udHJvbGxlci4gVGhpcyBibG9jaw0KPj4+ICsgIGdlbmVyYXRl
cyB0aGUgTENEIGNvbnRyYXN0IGNvbnRyb2wgc2lnbmFsIChMQ0RfUFdNKSB0aGF0IGNvbnRyb2xz
IHRoZQ0KPj4+ICsgIGRpc3BsYXkncyBjb250cmFzdCBieSBzb2Z0d2FyZS4gTENEQ19QV00gaXMg
YW4gOC1iaXQgUFdNIHNpZ25hbCB0aGF0IGNhbiBiZQ0KPj4+ICsgIGNvbnZlcnRlZCB0byBhbiBh
bmFsb2cgdm9sdGFnZSB3aXRoIGEgc2ltcGxlIHBhc3NpdmUgZmlsdGVyLiBMQ0QgZGlzcGxheQ0K
Pj4+ICsgIHBhbmVscyBoYXZlIGRpZmZlcmVudCBiYWNrbGlnaHQgc3BlY2lmaWNhdGlvbnMgaW4g
dGVybXMgb2YgbWluaW11bS9tYXhpbXVtDQo+Pj4gKyAgdmFsdWVzIGZvciBQV00gZnJlcXVlbmN5
LiBJZiB0aGUgTENEQyBQV00gZnJlcXVlbmN5IHJhbmdlIGRvZXMgbm90IG1hdGNoIHRoZQ0KPj4+
ICsgIExDRCBkaXNwbGF5IHBhbmVsLCBpdCBpcyBwb3NzaWJsZSB0byB1c2UgdGhlIHN0YW5kYWxv
bmUgUFdNIENvbnRyb2xsZXIgdG8NCj4+PiArICBkcml2ZSB0aGUgYmFja2xpZ2h0Lg0KPj4+ICsN
Cj4+PiArcHJvcGVydGllczoNCj4+PiArICBjb21wYXRpYmxlOg0KPj4+ICsgICAgY29uc3Q6IGF0
bWVsLGhsY2RjLXB3bQ0KPj4+ICsNCj4+PiArICAiI3B3bS1jZWxscyI6DQo+Pj4gKyAgICBjb25z
dDogMw0KPj4+ICsgICAgZGVzY3JpcHRpb246IHwNCj4+PiArICAgICAgVGhpcyBQV00gY2hpcCB1
c2VzIHRoZSBkZWZhdWx0IDMgY2VsbHMgYmluZGluZ3MgZGVmaW5lZCBpbiBwd20ueWFtbCBpbg0K
Pj4+ICsgICAgICB0aGlzIGRpcmVjdG9yeS4NCj4+DQo+PiBJIHdvdWxkIGRlbGV0ZSB0aGlzIGRl
c2NyaXB0aW9uIHRiaC4NClN1cmUsIEkgd2lsbCByZW1vdmUgaXQuDQo+Pg0KPj4+ICsNCj4+PiAr
cmVxdWlyZWQ6DQo+Pj4gKyAgLSBjb21wYXRpYmxlDQo+Pj4gKyAgLSAiI3B3bS1jZWxscyINCj4+
PiArDQo+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4+ICsNCj4+PiArZXhhbXBs
ZXM6DQo+Pj4gKyAgLSB8DQo+Pj4gKyAgICBwd206IHB3bSB7DQo+Pj4gKyAgICAgIGNvbXBhdGli
bGUgPSAiYXRtZWwsaGxjZGMtcHdtIjsNCj4+PiArICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsNCj4+PiArICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2xjZF9wd20+Ow0KPj4+ICsg
ICAgICAjcHdtLWNlbGxzID0gPDM+Ow0KPj4+ICsgICAgfTsNCj4+DQo+PiBUaGUgbGFiZWwgaGVy
ZSBpcyBub3QgdXNlZCBhbmQgY2FuIGJlIGRyb3BwZWQuIE90aGVyd2lzZSwNCj4+IFJldmlld2Vk
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KU3VyZSwgSSB3
aWxsIHJlbW92ZSB0aGUgbGFiZWwuDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEg
Qi4NCj4+DQo+Pg0KPj4gQ2hlZXJzLA0KPj4gQ29ub3IuDQo+Pg0KPj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2F0bWVsLWhsY2RjLXB3bS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2F0bWVsLWhsY2RjLXB3bS50
eHQNCj4+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCBhZmE1MDFiZjdmOTQu
LjAwMDAwMDAwMDAwMA0KPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vYXRtZWwtaGxjZGMtcHdtLnR4dA0KPj4+ICsrKyAvZGV2L251bGwNCj4+PiBAQCAtMSwy
OSArMCwwIEBADQo+Pj4gLURldmljZS1UcmVlIGJpbmRpbmdzIGZvciBBdG1lbCdzIEhMQ0RDIChI
aWdoLWVuZCBMQ0QgQ29udHJvbGxlcikgUFdNIGRyaXZlcg0KPj4+IC0NCj4+PiAtVGhlIEF0bWVs
IEhMQ0RDIFBXTSBpcyBzdWJkZXZpY2Ugb2YgdGhlIEhMQ0RDIE1GRCBkZXZpY2UuDQo+Pj4gLVNl
ZSAuLi9tZmQvYXRtZWwtaGxjZGMudHh0IGZvciBtb3JlIGRldGFpbHMuDQo+Pj4gLQ0KPj4+IC1S
ZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPj4+IC0gLSBjb21wYXRpYmxlOiB2YWx1ZSBzaG91bGQgYmUg
b25lIG9mIHRoZSBmb2xsb3dpbmc6DQo+Pj4gLSAgICJhdG1lbCxobGNkYy1wd20iDQo+Pj4gLSAt
IHBpbmN0ci1uYW1lczogdGhlIHBpbiBjb250cm9sIHN0YXRlIG5hbWVzLiBTaG91bGQgY29udGFp
biAiZGVmYXVsdCIuDQo+Pj4gLSAtIHBpbmN0cmwtMDogc2hvdWxkIGNvbnRhaW4gdGhlIHBpbmN0
cmwgc3RhdGVzIGRlc2NyaWJlZCBieSBwaW5jdHJsDQo+Pj4gLSAgIGRlZmF1bHQuDQo+Pj4gLSAt
ICNwd20tY2VsbHM6IHNob3VsZCBiZSBzZXQgdG8gMy4gVGhpcyBQV00gY2hpcCB1c2UgdGhlIGRl
ZmF1bHQgMyBjZWxscw0KPj4+IC0gICBiaW5kaW5ncyBkZWZpbmVkIGluIHB3bS55YW1sIGluIHRo
aXMgZGlyZWN0b3J5Lg0KPj4+IC0NCj4+PiAtRXhhbXBsZToNCj4+PiAtDQo+Pj4gLSAgIGhsY2Rj
OiBobGNkY0BmMDAzMDAwMCB7DQo+Pj4gLSAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCxz
YW1hNWQzLWhsY2RjIjsNCj4+PiAtICAgICAgICAgICByZWcgPSA8MHhmMDAzMDAwMCAweDIwMDA+
Ow0KPj4+IC0gICAgICAgICAgIGNsb2NrcyA9IDwmbGNkY19jbGs+LCA8JmxjZGNrPiwgPCZjbGsz
Mms+Ow0KPj4+IC0gICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBlcmlwaF9jbGsiLCJzeXNfY2xr
IiwgInNsb3dfY2xrIjsNCj4+PiAtDQo+Pj4gLSAgICAgICAgICAgaGxjZGNfcHdtOiBobGNkYy1w
d20gew0KPj4+IC0gICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCxobGNkYy1w
d20iOw0KPj4+IC0gICAgICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsN
Cj4+PiAtICAgICAgICAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9sY2RfcHdtPjsN
Cj4+PiAtICAgICAgICAgICAgICAgICAgICNwd20tY2VsbHMgPSA8Mz47DQo+Pj4gLSAgICAgICAg
ICAgfTsNCj4+PiAtICAgfTsNCj4+PiAtLQ0KPj4+IDIuMjUuMQ0KPj4+DQo+IA0KPiANCj4gDQo+
IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09PLCBCb290bGluDQo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNv
bQ0KDQoNCg0K
