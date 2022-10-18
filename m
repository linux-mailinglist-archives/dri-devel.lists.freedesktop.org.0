Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F746033E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 22:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8585310F005;
	Tue, 18 Oct 2022 20:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11010005.outbound.protection.outlook.com
 [40.93.198.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259D410F005
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 20:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTDuPhVl7K0ReJrJmU30RKwxOo69qevEaul+FKHhGObtVX9f1RpaF0DmG4T3+y1VH5pzvIF1dFOyi5KHwFB/tkFc9tjslUrFRxRxFmaXcdKaGkfZ8PTs7KjSgmXINQctfJC9ERPfsDH0IX5w8R+1VQ4Se+RrdtB2IbqKIZ4G4tQKYQ2i/be4qsI+3YmoMEAsf6Wft1kTm0tjqSI0gzYtRrdjlJChpaPyCjvC6/q9PgysCadi7mF0kdYSvyGsV0QairE6JSEhvFB0jTrHKE8OJ6tqwoJxfH8BHnm4qj/vs7QJTiRQrmG+hcProsxm/M2Dags1wWa1L56nty/U3Xt2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCdbZ2jrTZzKCteqad/Olcd2u6cUYgnIe0RPi7ymxXU=;
 b=oMtG0lzQqhTrpL8F/Im5z9BHBu5P7cMkEsyrlrrybwHrxpSfMiCQf8/ur9Bgk21mxZgFCNPc/XhIv5WsOOVQ/S6wmrl2Eskyb2yGajyzFHFAbBEmoxgyQiCxcMXBkLW8V87KQd00tD2IOK9WmHC+jv6Kqk0BwVGIIpj3AFGTnquDS3XfVRSm0Gm2ptpnynUdgpviEXDXc8JLNa/OcD80ceaxpYifXCcXF8wtoDBuz3ZLJPh2HNEk140PBdykzs2s1RUInEEvhdr/xDkfJKESWigjQBX5vgpMFlFeYawEg8BsrVEZvZmmLUREHYXp1NHvIZoeNNvfSdrEVxCLp6+lOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCdbZ2jrTZzKCteqad/Olcd2u6cUYgnIe0RPi7ymxXU=;
 b=ima+CG77Ig+LrkEckd0CjJTBqZz8Gey2LmmSUv4EMl0aKis5ImI3rGyMJGZ8vKugo4Zv89Agv+5AGkg0Ry9D5dBbi1yxfW53DXVOVQftXcC4rNlFJKPFb6ebEVGF/lpOFWB8kU0Se7dv6RGh95+9ixhxt/THfhLeDikq5FoQ01E=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BYAPR05MB4118.namprd05.prod.outlook.com (2603:10b6:a02:89::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.9; Tue, 18 Oct
 2022 20:26:17 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5746.017; Tue, 18 Oct 2022
 20:26:17 +0000
From: Zack Rusin <zackr@vmware.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm: Remove drm_mode_config::fb_base
Thread-Topic: [PATCH v2] drm: Remove drm_mode_config::fb_base
Thread-Index: AQHY4wxmh2BkI5MMlEC1jn8uzVOF+q4UmB8AgAABiIA=
Date: Tue, 18 Oct 2022 20:26:17 +0000
Message-ID: <682C6980-00CA-4A86-A9FB-859FF9B3AE1E@vmware.com>
References: <20221018131754.351957-1-zack@kde.org>
 <20221018161201.365897-1-zack@kde.org> <Y08KoKYEd4fzE6wc@smile.fi.intel.com>
In-Reply-To: <Y08KoKYEd4fzE6wc@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|BYAPR05MB4118:EE_
x-ms-office365-filtering-correlation-id: 56b0829e-9eb3-44c4-4c2d-08dab1470319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fz0KeNWlBo09F9DD/1gadCif8nt6a/+T4LKMfLa8vlXnVIFZMOUh3zoWr4HjzVAWaXFKxTCbpKR4q2M1NwZ6iqysQou7TiWU9UGEQmxCMNgy1OJerPeVPwZT/+0dfJo9H4PAu1Z4sf1Srg4pxeWM0o/tYUa4d8WfIjiAe0vwBgbyZXgBl0SbCiKgO6jPvhOXxB9W1mNZHoSarLfCau1Pzp8PI2qPW00tqKO/oRxesoeaVBylLVJdkQrVJhyvkc7TjLeFjiEDGmGFQL9boMxYSUounWq/MNGjXVR0sDAJ0xYQiXUNnOY+H8B9dYJUrya1Ynu8L3hrLr5lrbzIcZ+1HqH77GmFDXsmQsuX8GI3mjjqPZ5D3m/zCTlmAzGuORBMOPzCbrn8hjv/UlEu20VdqC+bYD8srgqMk88amO2s5vB2wgZYfVxiJlkDLpmCuZtQzWNFcKI9SwR9mOmYAVhTefgGWNUObW71MKLzkNn8A7agn8ASM/dqTs1UpQr1/GBq9Ca01MPUnwdBdzmrIuSOXjTGZFNM6MrrkTcLpsfGF5SgSzVdxYMI7/WVjaUgRneIWOcE4aH2Jw1wao/T6S3TAP7f3LOuWM3jlp7oykKQk8RPUsqXB9EYjx8yPFnkWl1CroJNdklmkmjiYXfyCIYHCjRdV+7AzDhx6WDG0k/0Ec4vK9kjzQR6bZJ6IX0QExMk/DrdgdFBmSndL5MAFZmTqg0ohmnwu4xBzQkRMgvVXvzW8rTWmkB+OifW8i//FkVagAMLCMKhLBYO/qvr4JNgjgaD7NMEzdA+JkIgiv0njwE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(66556008)(2616005)(316002)(38070700005)(83380400001)(6506007)(186003)(91956017)(66476007)(122000001)(38100700002)(5660300002)(4326008)(53546011)(4744005)(41300700001)(6512007)(66946007)(66446008)(6486002)(64756008)(6916009)(8936002)(26005)(8676002)(76116006)(71200400001)(33656002)(36756003)(2906002)(86362001)(478600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ny90cGVzaUxibE1zZ3Q1eDNlejFyZGVQSUxNYk56SDdjVmFJQkw0MzZqcVZH?=
 =?utf-8?B?UlNGTyt2c2JRSEV4ckgzOUpwRllyYlhOc21wTG1keDU0NUV0L3pHaVZ6M2Z6?=
 =?utf-8?B?NjRhVWN3ZlJtQXFESEh0SHRZRGFLRWlWOTJqSDhGTWZlSE4yN29BdUVjMzY3?=
 =?utf-8?B?eWR0WURZMXpXTm9KZWx1K0ZNT3kwZ1dDek11VkwyVHJWaUgvTmpRdC85OWpy?=
 =?utf-8?B?c0JwYTlrSmthQ3BVS0Q1cW1uMmdKaGdjMERYSDFNS0l6RVlocjZDT3BUbDJK?=
 =?utf-8?B?MWg0aVFMWVJWOHBOOStxM2hjYzJVQlFMWGZnK0wvNDYvci9OV2szWlV6azJp?=
 =?utf-8?B?ZEc3Z3kwMkZEbU5TR2dYSG1CbkJNOUdWMGhPSDVMU210MXdod3B5NkFrL0M1?=
 =?utf-8?B?ZGthSFlDaE1xNzk2NmxHOEQveXY2d0MyNXZxSHBsNGlwSW1tQkVEdXRGS2Fx?=
 =?utf-8?B?NXpUZEd6anhOOGNGUVZidmpHR1RTVk1CU05yZ2hBMit1dG14aHV3VTNERGlJ?=
 =?utf-8?B?cmlzenhQVVkwa210cDFUakFGU2pSdkxGSStYenlTbWMyUXhTckIyNkVnVDRt?=
 =?utf-8?B?Ty9na1FLMmhqZUZSZHBkU3A0eGp3NGZYQTlYZVZYWGtobHF0bXRJUkN2T3Uz?=
 =?utf-8?B?cFNoUWxjeUdlOUtXYThqOGl4Ui9WUmk2MzlIMmFZR0dzYUxRYXlIaGQ0dXlE?=
 =?utf-8?B?ZEtBOVdaZXpZY1l6RFdKcDFVQ2lvenNBbk5JZ1J6dW9XMENXcy9WYnlBZHY1?=
 =?utf-8?B?TlJDS1RFbmZBcnQ5UDBpNmRPKzNwUDdhMnh2VFVHMkY1bjBjU3NMWGpPdDdv?=
 =?utf-8?B?ZkIyRi9hNkNyZWs0d2FXUFRSU28wN25IODVoYjVXSDN6QWZjK0NXaDZyTFpr?=
 =?utf-8?B?dXNKWlVEbWZXU1dpVTJDQWRYV25WUWpTTEN6d1ZCVDEyY0xrTnR0dTZjZXNo?=
 =?utf-8?B?SHltZkQva1poRk11L1U4YTFBRTdsR3VFSmlPVnZxUndRc01POHI3UnV3cWhq?=
 =?utf-8?B?cnFubVdIUlVrWUoxOEQ3WmR3a09kUndzUHdpY29EU0RiUjBCMm1xdXpzUkpC?=
 =?utf-8?B?OGEzSmxxR1VRVElHUWxrVkIwOERCL0VCWnBFSE5aZ2ZrOWhmZGNJRHdKSVdR?=
 =?utf-8?B?NU5JMkVsRXVMcHpJYUMrelZUb2EzcUxXYmpBREVMNmhEb2g1TWJHcnl6S29a?=
 =?utf-8?B?WndKM2x2cFNaVVpndjhhcjhrSWJBNm1HNVBxaHRFYmxuV2FPRHF5L1RWTXda?=
 =?utf-8?B?ckRPYkY2bU5PdWxxemorR09iaDNpRHZQa3R5SHFrWEFCSXViR21hd25EbVh3?=
 =?utf-8?B?bW9meFY1bkprYm1FS2ovajluRDljSnZvVFBhSjY3cUd1SDFhNDJGWEl2Unln?=
 =?utf-8?B?OXo3R3hFZ0lRSUJuaUJ1V1ZzNmQ2ZGg3Qkg5ZDhyOFB6WndUa3BFVnZlcWph?=
 =?utf-8?B?TEFqRzVpMW5rN1ViNWxVOGZmVVpmOFpXa3JYQWxGekFkRkdkaVBqUmlmSjI4?=
 =?utf-8?B?L0trOFdCREtRNmM4Y2QwWHZEbmQ5MVo3R3cwMjVtdFBaZjlvSmNTNUEweWI2?=
 =?utf-8?B?d0gxME5kK21mMHc5WG5PWU9YdzcwVnVmdEJVUmx2eVViNlJNUklFZ0xaQ0JR?=
 =?utf-8?B?alpsbUpOY3VQOWhIMWxJT3hQMlNUWE9UMW9odkg1QUE5czM5dURYalNzU2R4?=
 =?utf-8?B?d0hqRWJUQUZDWkNzaTR1YzBhODhDY2FLMlJWeGcxdXFocXhhMnQ1V25nb2wr?=
 =?utf-8?B?LzVyR3cyc2hCL0t1d2h2Sm1QWXBEQlpySEVlZENJcWFvc1pHYXJ1OFBYNG9a?=
 =?utf-8?B?VUtBYnQzcUdFZmNZVkdIaHlKUnFxVnlkaytOdHRpc2d0SmlnRmZtNG45NTUr?=
 =?utf-8?B?K0dSTTdsMU9qZkZWWktzVGYwZElUb3cxNVpNalQ3MGRtcUV0azUwTE95RjAx?=
 =?utf-8?B?MVMxb3I5ZXlsTWNkT0g1T04zWGR1dGFKR0pIT3ZGU2VlcVZuTC9naXJvcnRv?=
 =?utf-8?B?am5KcWhRem1IS29GenJMTEROVExRSGJmZ3RmWXF1VVlpay9mcXMxMTdGelRy?=
 =?utf-8?B?VjR1SUordk9tdGZsamM3TnFtSjQxL2MrQ2F6VE5nZlhRZmhwZXd4dDVyUTdt?=
 =?utf-8?Q?zRrBGak0dn+PeOSEvy9FOUn/z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F916D3BB8175841AB57CF3FCED78035@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b0829e-9eb3-44c4-4c2d-08dab1470319
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 20:26:17.8817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vvsbiycp+2dFu1SDSZd1ez9cZpCRfCtqTYpLaJXfYiE0pszXJpnAHcFSNXABFml59O2k3X5a008ZXByJKWia4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4118
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gT2N0IDE4LCAyMDIyLCBhdCA0OjIwIFBNLCBBbmR5IFNoZXZjaGVua28gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiDimqAgRXh0ZXJuYWwg
RW1haWwNCj4gDQo+IE9uIFR1ZSwgT2N0IDE4LCAyMDIyIGF0IDEyOjExOjUxUE0gLTA0MDAsIFph
Y2sgUnVzaW4gd3JvdGU6DQo+PiBGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0K
Pj4gDQo+PiB2MjogVGhvbWFzIGFuZCBMYXVyZW50IG5vdGljZWQgdGhhdCBpbiByYWRlb25fZmIu
YyBJIGZvcmdvdCB0byBzZXQgdGhlDQo+PiBpbmZvLT5hcGVydHVyZXMtPnJhbmdlc1swXS5iYXNl
IGFuZCBMYXVyZW50IG5vdGljZWQgYSBuZWF0IGxpdHRsZSBjbGVhbnVwDQo+PiBpbiB0aGUgaGlz
aWxpY29uIGRyaXZlciBhcyBhIHJlc3VsdCBvZiB0aGUgZHJtX21vZGVfY29uZmlnOjpmYl9iYXNl
DQo+PiByZW1vdmFsLg0KPiANCj4gWW91IG5lZWQgdG8gYWRkcmVzcyBMS1AgY29tbWVudC4NCg0K
VGhhdCBjYW1lIGFmdGVyIHYzLCBhbmQgSSBmaXhlZCBpdCBpbiB0aGUgbWVhbnRpbWUuIEkgd2ls
bCB3YWl0IHdpdGggc2VuZGluZyB2NCB1bnRpbCB0b21vcnJvdyB0byBtYWtlIHN1cmUgSSBnaXZl
IGV2ZXJ5b25lIHRpbWUgdG8gbG9vayBhdCBpbiBjYXNlIHRoZXJl4oCZcyBzb21ldGhpbmcgZWxz
ZS4NCg0Keg==
