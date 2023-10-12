Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA927C6A27
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B48310E493;
	Thu, 12 Oct 2023 09:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9826010E48D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:58:06 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39C6Z1JD024048; Thu, 12 Oct 2023 10:57:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=703qoL91yLZMrDAEnlacpCvkhOuisNz09lsbvDujHr0=; b=
 LGf/3YatmzRiFuwHqj/O6yGXsyPAY1lWqedhyrf4RAe/71LW+erzvZx7qlK2+XKV
 H141eGO7Phc4ts7l1RjqG9xGmd4Udi2N4Yz//NZR3U3SUs4Yc4WcXtmo3xVn8q+Y
 WNOJZxlcdtgoGLnJ6nX6J8Vn2lKoxTOXI910/fA7eJcJLX1AhASRI4ml3cVSDMNA
 97IbRGynpOSk32ELCKz/rS2cVFwHRgfbKStYweiMyanTVnKkZI4jWBxMGgmkpWyQ
 Tkr8Uh8aXCBz1nbN3+Kmqb86CQfhImifgyDZyP033MamWVStbh9CxVeJNJzG4p6B
 Vr9S+7Q7sorq+pnlKy34Hg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3tnhtx14ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 12 Oct 2023 10:57:37 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 10:57:35 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Thu, 12 Oct 2023 10:57:35 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xgt565V6js/9SpCbMWYv2yszi2UlC9mv55aTjIbS8lkteF8/V5xSksu6GC/gdMlhJvi3edwD6Diujq3UogprOk3X/BCG4fbgj1K+db5J5B3xuMjrN9zqey2uV3v6pv+7gKsXoEMfnm44X0lotoRr0H3JEdOkJPGZYFgV1EgNSK66xBeRUj+l3YufUWya+hcbcM0miAAyM8nySmnc74ftO2O56+pBNRm2rEiDAcDYUFQUyBnmTB77tGct3+C0IRpUguNKHFCZgUJaQMNCeN5THLkZkQ9oaXjtmIfrQmpp6iE2CeP8riSt/CAJDuVz18Z6ovgQJZRR/FvnwTeYwcJcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=703qoL91yLZMrDAEnlacpCvkhOuisNz09lsbvDujHr0=;
 b=jBfeW4kgbJvXw8mfuqrUi2mx7PLFE3cAU5oJjPHdmCZAsZIbj5bSowXywfCfpcO3s881n30jiYSvzIJf6kXA6baUKfHKcN8pwZyfPudE5vIc1ZBAM+HgZzkiSa8f46ct/AkMuURKR5LoPVh9vB+TgFHlknAtWTxjibGHWdSh1UO1P5Zov9GywlnVECBzddq9Pd8ey0y/gSouvPBi7InQxdjyOWQRd8I7ub9jhEs5nRBy6+asv9U6uj7avVoyGz5+iJsRBro7SLR6x5xj1ZF/B9+aAwyyWsjGnMHyZj7qgJffonbb0PYkoXscpYjHTiHHlxZwUB5r0bE6NEn3bkYJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=703qoL91yLZMrDAEnlacpCvkhOuisNz09lsbvDujHr0=;
 b=DvTs1QgUqskB+Kv1eglrm3lmu0+5rHRjOm+ovu4zDwF4YyrN199Tm8N6M22fppHjGShezarXFMTDo2wqZD1gp2+vMv+kL9zlACyWj5SshE8jgCyNLJ8LzrKt3abHXIOrNYkqP4a2MJC+1brJy0ZCodzRY+huLX0hP5szD3FH/Kk=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6035.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 09:57:33 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::21fc:691a:6af8:5646]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::21fc:691a:6af8:5646%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 09:57:33 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [EXTERNAL] Re: [PATCH v7 02/20] drm/gpuvm: Helper to get range of
 unmap from a remap op.
Thread-Topic: [EXTERNAL] Re: [PATCH v7 02/20] drm/gpuvm: Helper to get range
 of unmap from a remap op.
Thread-Index: AQHZ+37/Mcn6lLATM0OLIiJcwPqyR7BDN4QAgAK2iIA=
Date: Thu, 12 Oct 2023 09:57:33 +0000
Message-ID: <00bd08d8caecad2d684ecdd485cffe6ad79672c2.camel@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
 <20231010133738.35274-3-sarah.walker@imgtec.com>
 <3205eb86-f875-e597-9df6-628d5799cb12@redhat.com>
In-Reply-To: <3205eb86-f875-e597-9df6-628d5799cb12@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB6035:EE_
x-ms-office365-filtering-correlation-id: c42e6d6f-d2c3-4067-4a5a-08dbcb09a808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZnWi74DXoMt/WyajMHXcLsLgrCwKKAUfd8MXyc3TT723VEmkvM0fbSNkeBEAXEmVRML9QsUPY5S9EK/qTArSAt6ibiYTw2a8KUxHbd1MXqxaXWd0hVSC2gjnnLM4px3ArUTqx5RtQZiabTAuaZwYnI3keGanq9QU8DCv5vVSKmVRVhxkYwACvugeMaP3dbS3dLg06RZ344UQExlPnWQhXYVdyHXuvN8eGODV+eupYA5+znWrwa5eCdeFkEhIJ7zFNeh5+6y1jOMdUUPL2e2AeScej499HcRibYCTL4HzaTSkV501TLPRAaj+PbCWwZz6/JylEjL8v00bArMo/uPJ10F2VMFmu0efsgJv8Sw8PKF7IGeBL8ABbpmthPBJXNpD7j1roBPMEsGGuVs3WtUHjOQgGjh7v0RWWfZtfiBeaRUGSJ2+iUefTb8oNd8nYZl4d7qPKgjhjQ59Pb3DsOwFJPHU6EB2E/4wFlyl1Zr9YDBvl0AQZrF4xdF4c4evceO4M59B3NXcPduZtPzBaVzuPQv7P2tXshNCYO5GQjdWqBOeERjl1JqNSt18Kd3Wvbiv7gQryUpA/lnoszR6Ona6fli1+q6uwU/jzIdpwOEz6S1UeF1n+wSuf5m75L8+ebwI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39850400004)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38100700002)(6506007)(53546011)(478600001)(26005)(2616005)(122000001)(6512007)(38070700005)(7416002)(66476007)(66446008)(4001150100001)(2906002)(5660300002)(86362001)(41300700001)(6486002)(4326008)(8676002)(8936002)(71200400001)(316002)(6636002)(66946007)(66556008)(76116006)(54906003)(110136005)(91956017)(36756003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N05ZTld3NkphVzRQSncyUEI5QWgzSEl4YS91WnZrdmZjYkZxQ3hla1d0UHlr?=
 =?utf-8?B?Ui81S3pKS1Znd0w3eVExL29la0lJeEhDb3RETVQ2enlWWDY1ZHAxQ0MybW9H?=
 =?utf-8?B?VllBNVdocVI1TC9DNmp6YURpK0xNdVlydTRnRHo0R3dST2cxakRuZUVTU25H?=
 =?utf-8?B?Ull5bHFvZE9FeVdUUnZQb043enRwZ2cyUmxKSktJN3c1WjhwT1hkc1NsVEJV?=
 =?utf-8?B?R1lzaE5GWWV0UFBPWXkzK0VHYW1rT1hLVFNDWjROdHVvYnpkeU9lSTY4NEta?=
 =?utf-8?B?WFdUNzVmMFBwYmQzTXdwd1lKVkZiNG8ydC9saXRuVncyZmlnd1ZSc21aYTIy?=
 =?utf-8?B?MzBzTmF5UXdvVzdZYkFtTWpVYnF5cXBWOW9LU3hpdXpLVG5IWWtGM1R6Sis5?=
 =?utf-8?B?cCs2cEdlSUdaL2xaUEFqWm1GaWtBZDV4TUZJUFc0MW5rMzdZK1pUWkpUNldI?=
 =?utf-8?B?M0REYnNrSDFSU0R0YU1oaVVIbUlUbGxkYm93ZHJ4WDlXaXNQWXBZWUQyeWsx?=
 =?utf-8?B?QUNNYldaV0dzV3pKczN0ZURXa2tmaVo0SkkrZWtveEFTSzdiTi9teVoxOStX?=
 =?utf-8?B?bVJaalp4YlVEdDY3aFJhcEhDRTd0Wmg3azFNYStjaVl2b3ZiaDhIaE8wcXVC?=
 =?utf-8?B?YVNXZjd5eXFlWXl5Mk1BR2FhYmJUeFVqZDlTY1VjR3NTRWVKZ3pIZEhwMCsz?=
 =?utf-8?B?VnFCZDhVNkhzb2hqSnZpc0F1bGM0cWxJWmJmdDVYUHVGK1dxRjNtcUJ6a253?=
 =?utf-8?B?aTUreHRLNWJmWU5SamRacysyTkFBVlFaTFpIN0Z4bU1MWk8zelpPdUg4Mmg5?=
 =?utf-8?B?MGVZcUpaOUxFYmdQRWs2ZGVjUjBjNXlUZ0k2Tkp6eWQ5UGlXZi9lem9wbDI0?=
 =?utf-8?B?Wmh4VkFDS0xSd3hsM0ZzVkJBVGRmTXpzYjZtMExpcERNQVV5NmhUdU95S20v?=
 =?utf-8?B?WDYyZ0E3aTlKOTVyQmJuMU8zSTZOaVdjS3N2SzJhYXRnNmQvTlZrcGRrYXJE?=
 =?utf-8?B?TmZ6Sm5hT29OWER5ZnMyczN2akZUcUFUakFyeEp5aTYxb01XOG5KQkNEL1A2?=
 =?utf-8?B?TFhOTmJGTnJXRUw2VlgzOUpzUDIxa080K0puL2ZEaEEzdndoeEprUGxtT0dZ?=
 =?utf-8?B?M3FiR3c1WGxZbkxmdlhNUm4xaXllRmNqZHkvYmx2bVdoMlVEdUFINmRNMWF1?=
 =?utf-8?B?bDdiT3UwSU9ZeGFCVzM4N29ZSFRlck9BVnI3MFNVb3dQdTBMb3lndGZBLzJz?=
 =?utf-8?B?MTBuQkd2SzRWVy9qTm1DOWdxOWxJRkQvU2Q5QllQb2lic1AxekZibHZsbFVT?=
 =?utf-8?B?Rjk3em1ybTZnVkpLL0tBUTlBQ3ord0dWb0VzODVGOHRwY2NIaVVrU09JQTYx?=
 =?utf-8?B?MDY2cE9HbStmRTBTZGJhWHpGNDk2UXV6ZExIN3hkSkNWT21uQzNhQUplRjNr?=
 =?utf-8?B?bGhNTVdrRERUc1ROdis5cVNyUmRUVXBGMFNQRlNtdmdsN0RIdUtMajFtUGJ2?=
 =?utf-8?B?ZUZsRHcrdTErTzFnOHptQWU3a2grYlZsdWlhWmRIUWl3d0I5Mmh4SldQMnI0?=
 =?utf-8?B?NVFISXI5WVNscEczVm9ERnFXeE5JVWIvSloxbThWY1pXTnhpeHF0RTkyT3VF?=
 =?utf-8?B?L3VQdGZpZyt2ZnViM3lhZDFCcElSYUxNbzZ1WXlYTVlkR1hRaW9xUWJLaHhi?=
 =?utf-8?B?R1RCdEhTbXBHdDFQM2h3WFhzdmxtSHI3YXh2TFBGektBVEpINndUazZzVjFB?=
 =?utf-8?B?OTRyWURob0phVmFwZDlsWTZwNWx5cW4xM2NGMGpGMlNtQ1VmWWFzb1RXekox?=
 =?utf-8?B?Z0hBaUZ2UmVBNkFtNXdMdy9vZVlJdWFkV0tTTmxUWHZtMzdybEd0S2h3RTJX?=
 =?utf-8?B?c0Z0ckVoUVk4NVpSRC96UU52Q1lVLzkrSHFjcEhjZEdQOGxmNDVXTGNVYU80?=
 =?utf-8?B?RDJuK2sxM0VhVXNSeThWU1M2TXdvVDByOFJuOFFjU3ZGZ0ZadEpUUFg4c01y?=
 =?utf-8?B?M3ByQjNRaGh4YXd2a3RUU1ZuajJqQzVjekNrTCtabDlVWGIrVFJLcHhCZzJk?=
 =?utf-8?B?c1pWYlN3MUl2N3laYi82RGYwMVBTUzVKcnh2QXpmeXpHOHR1MUdzSjVKaEpm?=
 =?utf-8?B?c3RORWZxVVREeXhHanJ5TWZYZS9xeG1ZbEpOUHh3NnFLdkswSzdLQ0pUOUtK?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <825399A976FA1F4189F2F632E95EB8C5@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c42e6d6f-d2c3-4067-4a5a-08dbcb09a808
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 09:57:33.7205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBrYVtgdaGS1eJ+A2F1tCLQIZxLGiksw4JeH12ydV3QKSBifuPvwMJBrEH25S8e11CPU8bdx1n78Hs6codufSvGPLb7pVANSZCv/FsX9S+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6035
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: RfsDpguWuozpxDN6kMm09hc3ugGIDqNh
X-Proofpoint-GUID: RfsDpguWuozpxDN6kMm09hc3ugGIDqNh
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "hns@goldelico.com" <hns@goldelico.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWxvLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gVGhlIGNoYW5nZSBoYXMgYmVl
biBtYWRlIGFuZCB3aWxsIGJlIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCkRvbmFs
ZA0KDQpPbiBUdWUsIDIwMjMtMTAtMTAgYXQgMTg6MzEgKzAyMDAsIERhbmlsbyBLcnVtbXJpY2gg
d3JvdGU6DQo+ICoqKiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNvdXJj
ZSBub3Qga25vd24gdG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUgeW91
IGNsaWNrIGEgbGluayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBPbiAxMC8xMC8y
MyAxNTozNywgU2FyYWggV2Fsa2VyIHdyb3RlOg0KPiA+IEZyb206IERvbmFsZCBSb2Jzb24gPGRv
bmFsZC5yb2Jzb25AaW1ndGVjLmNvbT4NCj4gPiANCj4gPiBEZXRlcm1pbmluZyB0aGUgc3RhcnQg
YW5kIHJhbmdlIG9mIHRoZSB1bm1hcCBzdGFnZSBvZiBhIHJlbWFwIG9wIGlzIGENCj4gPiBjb21t
b24gcGllY2Ugb2YgY29kZSBjdXJyZW50bHkgaW1wbGVtZW50ZWQgYnkgbXVsdGlwbGUgZHJpdmVy
cy4gQWRkIGENCj4gPiBoZWxwZXIgZm9yIHRoaXMuDQo+ID4gDQo+ID4gQ2hhbmdlcyBzaW5jZSB2
NjoNCj4gPiAtIFJlbW92ZSB1c2Ugb2YgX19hbHdheXNfaW5saW5lDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogRG9uYWxkIFJvYnNvbiA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFNhcmFoIFdhbGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+DQo+ID4g
LS0tDQo+ID4gICBpbmNsdWRlL2RybS9kcm1fZ3B1dm0uaCB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dwdXZtLmggYi9pbmNsdWRlL2RybS9k
cm1fZ3B1dm0uaA0KPiA+IGluZGV4IGM3ZWQ2YmY0NDFkNC4uOTMyZTk0MmRhOTIxIDEwMDY0NA0K
PiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9ncHV2bS5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX2dwdXZtLmgNCj4gPiBAQCAtNzAyLDQgKzcwMiwzMSBAQCB2b2lkIGRybV9ncHV2YV9yZW1h
cChzdHJ1Y3QgZHJtX2dwdXZhICpwcmV2LA0KPiA+ICAgDQo+ID4gICB2b2lkIGRybV9ncHV2YV91
bm1hcChzdHJ1Y3QgZHJtX2dwdXZhX29wX3VubWFwICpvcCk7DQo+ID4gICANCj4gPiArLyoqDQo+
ID4gKyAqIGRybV9ncHV2YV9vcF9yZW1hcF9nZXRfdW5tYXBfcmFuZ2UoKSAtIEhlbHBlciB0byBn
ZXQgdGhlIHN0YXJ0IGFuZCByYW5nZSBvZg0KPiANCj4gTm90IGEgc3Ryb25nIG9waW5pb24gb24g
dGhhdCwgYnV0IG1heWJlIGRybV9ncHV2YV9vcF9yZW1hcF90b191bm1hcF9yYW5nZSgpIHdvdWxk
DQo+IGJlIGEgYml0IGJldHRlci4NCj4gDQo+ID4gKyAqIHRoZSB1bm1hcCBzdGFnZSBvZiBhIHJl
bWFwIG9wLg0KPiA+ICsgKiBAb3A6IFJlbWFwIG9wLg0KPiA+ICsgKiBAc3RhcnRfYWRkcjogT3V0
cHV0IHBvaW50ZXIgZm9yIHRoZSBzdGFydCBvZiB0aGUgcmVxdWlyZWQgdW5tYXAuDQo+ID4gKyAq
IEByYW5nZTogT3V0cHV0IHBvaW50ZXIgZm9yIHRoZSBsZW5ndGggb2YgdGhlIHJlcXVpcmVkIHVu
bWFwLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGVzZSBwYXJhbWV0ZXJzIGNhbiB0aGVuIGJlIHVzZWQg
YnkgdGhlIGNhbGxlciB0byB1bm1hcCBtZW1vcnkgcGFnZXMgdGhhdA0KPiA+ICsgKiBhcmUgbm8g
bG9uZ2VyIHJlcXVpcmVkLg0KPiANCj4gSSB0aGluayB3ZSBzaG91bGQgYmUgYSBiaXQgbW9yZSBw
cmVjaXNlIG9uIHdoYXQgdGhpcyBpcyBnb29kIGZvci4gTWF5YmUgc29tZXRoaW5nDQo+IGxpa2U6
ICJUaGUgZ2l2ZW4gc3RhcnQgYWRkcmVzcyBhbmQgcmFuZ2Ugd2lsbCBiZSBzZXQgc3VjaCB0aGF0
IHRoZXkgcmVwcmVzZW50IHRoZQ0KPiByYW5nZSBvZiB0aGUgYWRkcmVzcyBzcGFjZSB0aGF0IHdh
cyBwcmV2aW91c2x5IGNvdmVyZWQgYnkgdGhlIG1hcHBpbmcgZ2V0dGluZw0KPiByZS1tYXBwZWQs
IGJ1dCBpcyBlbXB0eSBub3cuIg0KPiANCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9p
ZA0KPiA+ICtkcm1fZ3B1dmFfb3BfcmVtYXBfZ2V0X3VubWFwX3JhbmdlKGNvbnN0IHN0cnVjdCBk
cm1fZ3B1dmFfb3BfcmVtYXAgKm9wLA0KPiA+ICsJCQkJICAgdTY0ICpzdGFydF9hZGRyLCB1NjQg
KnJhbmdlKQ0KPiA+ICt7DQo+ID4gKwljb25zdCB1NjQgdmFfc3RhcnQgPSBvcC0+cHJldiA/DQo+
ID4gKwkJCSAgICAgb3AtPnByZXYtPnZhLmFkZHIgKyBvcC0+cHJldi0+dmEucmFuZ2UgOg0KPiA+
ICsJCQkgICAgIG9wLT51bm1hcC0+dmEtPnZhLmFkZHI7DQo+ID4gKwljb25zdCB1NjQgdmFfZW5k
ID0gb3AtPm5leHQgPw0KPiA+ICsJCQkgICBvcC0+bmV4dC0+dmEuYWRkciA6DQo+ID4gKwkJCSAg
IG9wLT51bm1hcC0+dmEtPnZhLmFkZHIgKyBvcC0+dW5tYXAtPnZhLT52YS5yYW5nZTsNCj4gPiAr
DQo+ID4gKwlpZiAoc3RhcnRfYWRkcikNCj4gPiArCQkqc3RhcnRfYWRkciA9IHZhX3N0YXJ0Ow0K
PiA+ICsJaWYgKHJhbmdlKQ0KPiA+ICsJCSpyYW5nZSA9IHZhX2VuZCAtIHZhX3N0YXJ0Ow0KPiA+
ICt9DQo+ID4gKw0KPiA+ICAgI2VuZGlmIC8qIF9fRFJNX0dQVVZNX0hfXyAqLw0K
