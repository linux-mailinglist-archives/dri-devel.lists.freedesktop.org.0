Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F7498380
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A41810E257;
	Mon, 24 Jan 2022 15:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E266810E257;
 Mon, 24 Jan 2022 15:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVorS4hvOXigSfbmfpjJla242G0dQ8vHpZE19w2EeNGi81ybBmc9G/mGVGLs2IrfGAyY6Ay21L/HYTM49Qi6lVhR5+BGhmuIyD9gK3rA1Dc/PssP/GzCUxniPSqZMXoo+wYEnqfvh7mvdkU/ysYE4fKFsxrpbT4KQP7zFsSc8CDI57EOPlQ2/oRKdCBz05/hSaFwtoIAu9XLMI7Bq/UmEPqzGHGBE5p2IWm3zBbX+9Z+rs6l8URUk/L6xwJ8x5M6Wo3cx6nm10070PwsT6ZQ3sW/m5YOO5v0VlCj8tvFJAY0VCgUOMd34UzDnNy6XT6R76wvGmj6/mr+F4pzZZCCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKWT3nTgYKjDx0dEEx1Ch7H0tmXCcjpf3vzLUekRljk=;
 b=eJaOpZmlW+QroVBqqmEmxGS0oD+xtTUFz4gTaUv9T51KF/RRX9FHu+1VijVj8+AlMDVRkfb133EYO1L25HdE7QcMO9zcVU9aV2puz6cKvdI5L/AH2qVWLLSZ+WkzzBvfqpNuf4CEnkSbCwP6lEMFN9XwX83YveTGRVoq449MbGUkSUa/FmbLE+zz9I4rMrRkjzq+OR+NuBtmKQ0dL0bTBctdqc3tM4I8PFuYvBPXVhjwXzZ/eTgNHAH66RLr0emHwMooC8DBx/cSrcrmWVs/pi6ZEOp3WkznIfaabbKHVL9Jr7ddyBY4EWbOBvSd2MTsx9l9l/l7ulkCkNPDQZ3w9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKWT3nTgYKjDx0dEEx1Ch7H0tmXCcjpf3vzLUekRljk=;
 b=sXztQImAPD8UeAqsZaTvbzZz/xvvxRBrTPnm+sutt0ur7mUDLhtxSY0LDlcLGMEcM9IXh1GERgoFQ7oN+8ghoC3QZc2DOItpMr3LR2QLOY4IG9X8Z0sX8RmGJwmCAr7IoZ4L5BjzZJhdcNANOK6UbFCIJunMrd08iqKqlliaRYM=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by DS7PR05MB7256.namprd05.prod.outlook.com (2603:10b6:5:2d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.4; Mon, 24 Jan
 2022 15:25:29 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c5b8:e9c7:1cc6:4622]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c5b8:e9c7:1cc6:4622%3]) with mapi id 15.20.4930.014; Mon, 24 Jan 2022
 15:25:29 +0000
From: Zack Rusin <zackr@vmware.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "gustavo@padovan.org"
 <gustavo@padovan.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "ckoenig.leichtzumerken@gmail.com"
 <ckoenig.leichtzumerken@gmail.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 11/11] drm/vmwgfx: remove vmw_wait_dma_fence
Thread-Topic: [PATCH 11/11] drm/vmwgfx: remove vmw_wait_dma_fence
Thread-Index: AQHYESLRzrTkNiAlMUWadJvI74tPV6xySvUA
Date: Mon, 24 Jan 2022 15:25:29 +0000
Message-ID: <a77f69967468eb7e6540f93795d40ad8ca54a02a.camel@vmware.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-12-christian.koenig@amd.com>
In-Reply-To: <20220124130328.2376-12-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28bab5f5-452f-4f26-5357-08d9df4dc0e9
x-ms-traffictypediagnostic: DS7PR05MB7256:EE_
x-microsoft-antispam-prvs: <DS7PR05MB725675930FE0D9D22C16FB58CE5E9@DS7PR05MB7256.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3B1j0DuQXePOl9RUD116p21O4DFlqMCPk7qh1FPp6fD1u9GKy6bu06IW1sqOwEmR0VwLzXyJvNrwEnq+Wl4NMoxw4amiILfN8uo7LymkEJtLvJTFPCaVtWDGlShmX07sdy/0NIubWosPnmQGVkZQmXYxO945pkxwuwSrWLb+GyHBVMdbf7wc6XeMfz+RgKPQj9RlvZcP43iMuTT3PGq7O/8ePcDPAoKuWTWuo95k1nySoQ7U/EWXv6G1VUpyzCR5FnLloYsP5JmK7Lxx2jXuQh3iQIby+SH+KFOJHLSgnko4qKHO3tL0WcvTlU32uJmH/KeAuCPRi0ql96q9Ej1blk8AU5hhUAdU6CADkImIjWqPdNt66vdWCwnXQFeyyfyQG5aVO5KWTio94Tky568pArNqo23kSHTArBrX3l0n04lTVJ+EzM3xE3cGhHzK+SMsV0r2fbxZul6ReayIO/U9HuTsyY937XP4AuKDL2yILFrn/dKoWw0A3EqXmIdZSrt8deu9gqCnOqyLiMk/m+Pu3jT3n4qVSFvo2XalyTl1OLzqPlBZf7kIhpmpFJsZ2nctTYSz+whVbXpo/S17l2gxycQdPXQX0+EokmKCqPmJQUdkJjErm+rUEQSLe6nFh7kWmQSd1Nw6peMuJpefB7W70Ht048BqdDtaID/xuwKJZ0sxeT1PqRGl8yk2apj7tFnm+qOWVTyGNTVUQBkzPhUUkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(186003)(508600001)(6506007)(86362001)(6512007)(2616005)(26005)(38100700002)(122000001)(66946007)(38070700005)(316002)(8936002)(64756008)(66446008)(66476007)(66556008)(8676002)(5660300002)(36756003)(2906002)(76116006)(91956017)(110136005)(6486002)(4744005)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eERkMjhjSVRpQ2Q2ZGZGTStyalhqOWFnZjc3clRyZXhpendLTmFsRTBKaXpR?=
 =?utf-8?B?ZUtSTnUrdVhrbktOOEpzRjFkdVVRcFkyN1R2blhwL2ovZ2hYVjN5V3hwckEy?=
 =?utf-8?B?QlRkRUZpdHZyNVdQV0VEOGZyc2o5SkxKOThWbXdHdnVaNkpubWJFOEdnS0ph?=
 =?utf-8?B?RVZHVjd6V0U5V0VnTWtDWW9vM0xDclZpNGc1c2MyV2kwZ2ZqQmxHaytqalNM?=
 =?utf-8?B?NVpkY1pVTXA2bkZoT1E0TXN5cnl1clNZWDR3cVVBVUR2YUR4dGtxNk93Rjgr?=
 =?utf-8?B?d1JFVVJaSEpJb2lPY0lrSEQ3QVZQckNGSUszSW5BcmI0YkVjRlk4cC9HNjBo?=
 =?utf-8?B?QkZDamVPQkx0dUV3dmE0NzBuVXlCUXp6MDQyS1VoalVYSXlZWURjMmRtWVQw?=
 =?utf-8?B?WFFxeGU4Qm9FZEIxZFFhNFNPUVgvakIreXV4V1JXWVhUU0dkZTZOaFdqKzE2?=
 =?utf-8?B?ZUVPRjVKR1FTZmNNRktvTVhJVUZSNGl2SjBQTS9XRUV4NXltM0xZS05tY2cw?=
 =?utf-8?B?MVZMTzdLSFpPd2R4R2c2VGVXN3p3c1Njd2Z3dytaV254ZWRPK3RPNGZYVURI?=
 =?utf-8?B?ZmVHWTliVXZaT1d3OHBmbTBTMFFQZ1ZmTGMrSW1lMXpabmdEbGYrMXMyMGRm?=
 =?utf-8?B?bm9OZ2Nua24vSWI1N2Ntd0txV1BEeHBxVUk4SGxRYnlCM2ZlZ1JRQW5BY2Uw?=
 =?utf-8?B?Z3owazQ3a0JEZ3Mzd3Y5UXQ5MzdLVDF4T0JzZmtkejNJQjA5eEN0bUFnTHNE?=
 =?utf-8?B?Uk95aEt1bEtDVGRHcE9EWERUeWkzM0VxMUVYVDNsVllpVEk1KzJmV1JwWWUy?=
 =?utf-8?B?L28zRE1mT284M21MbXo0L25jQUJsV29WdWtnUkw1NFJEUHdGK0Z4UFYyaW13?=
 =?utf-8?B?cElhaVVPb0U1OVZKQW5Kdm5kZVpMOHI0NEFNV0I0M3dVdnNZYWRQNDFKS2NI?=
 =?utf-8?B?bkN0SXhrWEkvRU9MZkYwS1RrV2RQbFB2elNOMkYrQ2pGbFM5VGRTNWI1MGJo?=
 =?utf-8?B?Zk94TEoxU3lwNUhUaGhBYVdyeFI0SjRnYWQyZFhBc2hSRjhRZDJmTkF0anRi?=
 =?utf-8?B?M2d3ZjdKOHFRZzB4MUlkbVJHMUw4Z3BveGVRc3laT3IxMmoxYnVLUlBXWG1F?=
 =?utf-8?B?TE84Y1R0S1RPdWVpNkVPNmxsMUFDelo5eFlUbVpPWGM3d0l6ek0yRHNVWE9S?=
 =?utf-8?B?WldmcHFaU3Bya0xXRlc3ZGxUdkJqd1I3OXlzL3N5M2tZa3hPVkRJZ2Y1amlX?=
 =?utf-8?B?M3hjQVgxWmJwMldXQklFS3dxNEk2REpDMGRldVpxeG91cVdtU2xDbUhXZ1BC?=
 =?utf-8?B?bDI0U2dTWW5NcWwydkZRVyt3emppU2xNTVJUV0F4RG1uRWU0U01jZ2VaRnBL?=
 =?utf-8?B?UHNNZW5ibWFWMU1sc0hIa0pTcE4rQmNmd2hUdE11dkpYcEdSNDZMckpCRkNx?=
 =?utf-8?B?MUloYURLT2ZQT2l6NkFkTnpha1BjL3RxZjFab3ZiRnhCSVlkU00vMEJvejd3?=
 =?utf-8?B?c3E0aVdTVGpadmJSb29yT3FvakFYTmE4UkFrT05NNS9Wc0N3MGszTVovZkZu?=
 =?utf-8?B?K1hpVkdCdHNpY1ArT3hMMzBOSHFYTVR5cFUvQkJOemlnNG1pMWdnWnJHL0J5?=
 =?utf-8?B?Y2hHTUlNTkZaRVE3eUVzOFdqVTRNb3hCYlU4ZGhSckJYakZjMFZ4c0JFNkdi?=
 =?utf-8?B?Mnh1WGRQS2REWUtXUHNHV0ptbFZ5QXp6akNxZHY1a3J3RmxzVC82dHRKQmVJ?=
 =?utf-8?B?UlRTTVd6RHIreUh5Y01kRnBkREtBdlJIWTByYmsvcnFkVFp5OXpCQXFEWGhM?=
 =?utf-8?B?MUZ3eVduVlhBQTloRXJkNHZrWis5b2lSQnhqbmdyZ2YxQ1BmR1F2UTNITC94?=
 =?utf-8?B?ZExsOWJud1hDNjk2NEYxa0FYWEY5ai80RmRNN1dRbWtFblREUmIzVmZrem5L?=
 =?utf-8?B?QkJBZmVSNHppU1RSZ1ZxZVl6cXgwKzdvcGJia0xOZ2U5Vm5nTG9FeFB2U3Nt?=
 =?utf-8?B?aE9Iai9WMjFScU9KTm0yajlyVy85V2ZPNHErWDZiY1NoazQrQjRiRmdESE5v?=
 =?utf-8?B?cFE1UWhvdk10VnRpekZUaWxabmVBOUR0OWlnL01YUlFXamFhQnJlbVRSUm5M?=
 =?utf-8?B?dDdkZjcwOXdNOUZ6WFY3RVFqMGcxVmlDZkN6T3gva3RTVjF6MktLOEpkaThi?=
 =?utf-8?Q?riLuyR5GZ8p+6o5i4CLLOyA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86718BF8E3505F4ABC598DBA18BC4D00@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bab5f5-452f-4f26-5357-08d9df4dc0e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 15:25:29.0847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IigvosZvwVVLXDcxx7frQ+0DkkhytaSAStmHLlHsplxrz9HMru2KTaWVHYHZp0UfYRsjRyJ0+7648eLizD0Dhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR05MB7256
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

T24gTW9uLCAyMDIyLTAxLTI0IGF0IDE0OjAzICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBEZWNvbXBvc2luZyBmZW5jZSBjb250YWluZXJzIGRvbid0IHNlZW0gdG8gbWFrZSBhbnkg
c2Vuc2UgaGVyZS4NCj4gDQo+IFNvIGp1c3QgcmVtb3ZlIHRoZSBmdW5jdGlvbiBlbnRpcmVseSBh
bmQgY2FsbCBkbWFfZmVuY2Vfd2FpdCgpDQo+IGRpcmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogVk13
YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+DQo+IENj
OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KDQpMb29rcyBnb29kLiBUaGF0J3MgYSBn
cmVhdCBjbGVhbnVwLg0KDQpSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNv
bT4NCg==
