Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE6466F11
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 02:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693436E03D;
	Fri,  3 Dec 2021 01:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2109.outbound.protection.outlook.com [40.107.215.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930E16E071
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 01:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYzvo3zGkAeZoX3+OF1kQ/SvB7TtFqCH6JDMzzw9/G/Qw3NDFhxMO2YcaJo5C2bYrZSBJ82W171RlNQdZ+xkIlREzovyHzDWcHHOsPyTNxXcDl+MylMQltnk2BZHhnRJfqJj3Dtmv/NHe8/99xWAghJWIzLozGpUX4WcCqFwnSgMGkSs6/rIOegcNa5+ycfvhYOlQlKrjGtiwNBSp5VAvSIChNarA3Np4/9eXTrUBoy8MWzJHGnvc1xr45M0x1clqM6ySc+fB7L4cx8ALtudlpB/4gOmyQeXgsFYaygiEYGJPKJOls3AuSW3MrE5GVpyw98hB3noq4T5Hhn1umBqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YldXLMXSBvUBP7pteIDmww5ZrZc8Dzjs/GkyqnQ7c0=;
 b=oD3bmOx5Eh//06LX+k8pP57p/FuYuVkTJcQaXMuTFKfZnBo1YQjBhJghIFpheXT+JcdbxUl4kPLXW8gbZLp7XzFxQOyhJemrCDY7Aijw43LHWtM/8/3Hvl0oK+DC5/uYhwe1qfekNIb/R9HzRTPZ5twtAPSNgNZVmfjx2Hzob13IhCRw+L+u+WHlI8urhqCXOG7ForC+0OTtYspBGpVxqk2zy+X0D0EDthtHTIH2HqugsWI+iJcb4YLYaXtBBRTqUtnuEEULEbsDyuUpckNc7OTIEwpU8hEsb0aupb8qTs8XGf+WKVDZcqmvVicIKG921r5RylrmVpmEqPRqK4ryuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YldXLMXSBvUBP7pteIDmww5ZrZc8Dzjs/GkyqnQ7c0=;
 b=hW4+AMYTMDbhzwJFq8Kg9SpckG1nRGZK4tTp//qXhwchjZCvpvra+lJqkSt32Gd0dasctT+6taZSJHa5HuJe6fZzRsD2Hg21T5Fcn93mrvKQaJyH/aqRfRC8IqOaGW9xmY8/Ogt/RVwWRNLHoTEdssibFOSzlaEq6EYJppZkqVAjoFgqJwBn1dULFpaWv8eDaQAR4iejHq13nA/w+n9hz2wOveXBrUa7E27u04BgH0iTnmhv6Boo4ayb81NRvmNhSTWPAG6aKqPQ/Pd2kdw0QYZT4ejJql+j6ZOrHc0+Ll3qc8LTHb1Q7Dq4JZ3zF2u93eOfAQpt1KlzvtLjd3fb+g==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2324.apcprd06.prod.outlook.com (2603:1096:203:42::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 01:23:40 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::21d4:1030:2fd9:2788]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::21d4:1030:2fd9:2788%5]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 01:23:40 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Topic: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Index: AQHXq5TM0RiIoM3rJkSmAmQ7phtcuqusmKiAgA+eivCAZDgvEA==
Date: Fri, 3 Dec 2021 01:23:40 +0000
Message-ID: <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac8a2ce8-bde7-43b1-eb87-08d9b5fb89e6
x-ms-traffictypediagnostic: HK0PR06MB2324:
x-microsoft-antispam-prvs: <HK0PR06MB23243998DB3DEFDB69F0AD548C6A9@HK0PR06MB2324.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GCZ2IwcYXjyb8nYy6O+yrki03dxRMeOKCq5OAvx258arxvI3OvOAHTKIzMMqlDzTaQaIHoIb5mGpgcsUpCCHSjNPzJeyILb7RjyVjZpobEpgpk99qw3kNumQvGdMFqC046rQ+lzaKy0kxk1t0T2kp6FJvBhbGTJccV1Y2f43IeeQHXP3VtSf9cm/QiVs0UwSrEi+jjVAqTc0GabgG+cPkbznVw75NWTVFTISQes7Ltfsw8FtBgtZM4uKoIwVuSgdpnFQp+MMqlq4Gxpzt+c9srKxu7uAXVH/Uw/79aM0tD/prjwmLMH1O6S0xigeJbrgJQbFbHCOBHF+HRIlJDuMJ/CqOGHcYEPdnSBvyk7TzKg0n+tWMSmJgE8sd80Ro9iROmDyrBJrypL6T18A7VOFb2DOD2MhsYDjJz9OYfLtjHbzRCREdEf4D2uq/Ty3C9EtG3ygKt9WIBrPgnK+xG9vfp3QzIpQDS5YszYf85Ui0PLJnvaWyyhl4QJpCiIN2bHiSd7Wb8xh0qBaOsqEyLgTc1IKb8b7xNFgJLDR186sk9wa8pJIrOcD+Mjk5fCHMSANX5YaiT2cWmKPzBq1ru5SpaccyZDSKjwFjX95UWytGuoSAmbDrOX9G7hf6bSnohb/yUf7rzYWjB6zWsuSGvgdzef3vgeFVrbbI1k4vqHxv/MAApeAQmNvSfGlwBdnGIpPyxvJ1wvBzZhpC5wMir/aZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(376002)(346002)(136003)(366004)(52536014)(33656002)(66946007)(508600001)(76116006)(5660300002)(66476007)(64756008)(66446008)(9686003)(66556008)(38100700002)(8936002)(122000001)(8676002)(7696005)(4326008)(71200400001)(2906002)(55016003)(186003)(83380400001)(6506007)(110136005)(38070700005)(26005)(86362001)(107886003)(53546011)(316002)(54906003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTZkaS82UWlHaUM2Y2F5QVdURzlTaU1qT1dTNnltRkVnalNMaUNuMXgvays3?=
 =?utf-8?B?d0NuRnpOR3FFcmZGY0xrWlM0QStMcjUzUTlZUDdzakNCNlEyQ1g2ZkhqTW1E?=
 =?utf-8?B?SlJDT1RySkhNajhnNkk3WUptVm5JNHRSSGZ6cmQ0aVBjeGpvOVYyL2VxS1VB?=
 =?utf-8?B?bXlRMmtuSytBVUZlM29rYkFQc0txZmpJOGI4MkpMZ1ZxMStYTjFyQnBtT2Uw?=
 =?utf-8?B?dU4xR3dsbGFSYVJGbUJwdmdObGVLcG1LVEZjYldyOGg0Z2NPYm9lQXRRVjdZ?=
 =?utf-8?B?bHJyWTJ3YUkxV1k3ZHc4M2l2b3dlaGxLdXdab3FqSTZ4Z2lBNnBGUFFVMVhF?=
 =?utf-8?B?dGFycDcrWS9SYWNycUVnWlJtU3VNeHhUNitKQSs5ZEdPeVFHZ04vbmFJT3NY?=
 =?utf-8?B?Z1BVUERLYXlBUkdPbDlwTitIbndoL01UMi9qK3Y4SFVza1kvOWx6MFJMTjdw?=
 =?utf-8?B?dnliR3gzOHNZWTJXbTJMSndHZytYSkM4S1lINzNHaExBeUhUMFpielB2MFlw?=
 =?utf-8?B?SGMwUExROTYrSGlMb3VMcUxJa2FWd1JDN1dyRjFIZnVNRVJKS2tIWTlQN29N?=
 =?utf-8?B?MlVXQXpwR3NvWkFFNGN6cWg1bktLVjBTemdnbmkvNTVkMU5IdWxQemQ0VG9C?=
 =?utf-8?B?NUJHTEdlb0R0NjMyd1htNHludjFzdDhjZVA3VTNucVpKenJJYkhaUHRJVTR3?=
 =?utf-8?B?cFZ1NU9QaTluYlkweEp0RWo4M0IyZE5RSlFoWUt1UW54MG1aZ3FhRk5ydzMz?=
 =?utf-8?B?RlkvK05FdW12OWoyTTEvTVIvcjFBSnQyUEdGUlYzalQrQUdENTduWWRDK3lN?=
 =?utf-8?B?U3FkNXMvT2RGcFRvWWIxRWc1Njg0aWJmNWcwRk04NkdkbWhWUEphd0tXaFlv?=
 =?utf-8?B?b0ZqdEtKbndjT1BJMWFacENkVUw2S2VjVGdOT2pEdk8zaWpGaUJaZm9LWjcw?=
 =?utf-8?B?MTg1YmVteFZsUEJFanNqc25YWUNCTW5uenV2Uk91S1pSWnNZU3BaVll4K3F0?=
 =?utf-8?B?M1ZzK2ZheUVRMGNiUytGTVVlbUdmdkpqSkhtbVloNVNGQm9wbDlXR09DUVA4?=
 =?utf-8?B?SG4yL1dIZzlhZ2lLNm9pd2s3SVpES05YakdGdTA4d1djZ291OWI2VnBpSFUz?=
 =?utf-8?B?NjVlVE5FZmlwYUQ5c3J4Ni9EUFBEOGVlWllzMDJKc1J4TE56bFBxSFZzVFl4?=
 =?utf-8?B?aTQwWGdvK2pLOFRDSXJERFd2azJ1TnoremQ2TncvWm5WRmNpbnZGcDFzN0JM?=
 =?utf-8?B?UE5aeGZjWkdXcVdodzlUbHZnc1lnaHJERFF0STVrUHFMbGdXbEh5MzVtRFFv?=
 =?utf-8?B?NW42U3gvczhVMnpKNTV2WlB0NEtFWHBCT2Z0RWRxRm96YllURGdqYm1uTzJ1?=
 =?utf-8?B?QzRDT2RQeTVDTDg0SURuSEZRYlVCTXRoYi9XcUo4VUJXamNCT2dVMXE4cUxt?=
 =?utf-8?B?dmxGMFlSMmEyYlM4aUk1dHBOclpYRUcwNGs5SFVMbW0vcExodG02Y1Z2cEZT?=
 =?utf-8?B?d2g2TFR0ZXh6N3NkcWpERXNoQVB5eFJUdEJGOW92UzdRK21IVDZWcGFPK0ta?=
 =?utf-8?B?Y0VnTi92MFh5SzJsREtzS0dLckxMc2orb1dKbXV0cEZtbVFTUG96MWUwR1N4?=
 =?utf-8?B?ZGc3ZGJYdXZQUHRSY2R0Q1JqYytON2Vuc3JHVXdZalZwdDBMRjBJa2NtcWdi?=
 =?utf-8?B?VjMwQ1ZYL0M3aGxaWEViVGt0cXhVckJ5UG9iZHorZmdLanUwS2VIWHZxUFpk?=
 =?utf-8?B?Ty9TOVpucVBGZVlmNkJiMG1FcjVGV0xvZmJyanJPYVJ0aW9tRm5PUWppRTI4?=
 =?utf-8?B?OEsxSDNBQmZ3MmN4Vk5wNWFRQjBTS0F5L0t2b3dMcnFsYU02Mk8veDAzMHRJ?=
 =?utf-8?B?clg4cFpXSWhIbXlDVVRTeXZ4TU1NUlQwcHY0YlAySUZqRk04NjQ5aENzR3dQ?=
 =?utf-8?B?WUc3NTdxUyswWHhndDV3YzVLeWJscGtnUGlkSEhPdVpJaHA2WXd6emhuWTNr?=
 =?utf-8?B?QkdXdjhBbERxOU5VaXpXSWFhaUdaU0M0UktneTZ4Zmk1SDhPLzkvMzhEcjVr?=
 =?utf-8?B?a2NBSEU2NVhkNDVqbnQvSmR0eVJqWXRTT0kyM0Y5NlZRcmFQenowUjBUcEky?=
 =?utf-8?B?LzFWdDFFVTFRVTVSWnNjc0o2WVB2eXIvalZ3ZDlxTEw3dkJ5RHJtNXlXZC9G?=
 =?utf-8?B?K3V5Qy93cXlnTGM0bFozRkVyTmpiazRpWFRlcFJLTU1tU09Fall5c2p2bFB2?=
 =?utf-8?B?UEI1K1B0TThhTDN1QlE4OXFVTEJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8a2ce8-bde7-43b1-eb87-08d9b5fb89e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 01:23:40.1938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yCYJqglb9hjNF0abLrX31YABffpk+p5z1bNbUZTc5wfD0VBB3p2yEcM0B9+nDpuPHJt6huuXYkiFef0l+m5Ki1Yt/X38HVOvuXIrsS2TyJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2324
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?5riF5rC05L+uKG8tc2hpbWl6dSkt5Y+w54GjTkVD?=
 <o-shimizu@nec.com.tw>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLdW8tSHNpYW5nIENob3UgDQpT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDMwLCAyMDIxIDM6MTkgUE0NClRvOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0hd
IGRybS9hc3Q6IEF0b21pYyBDUi9TUiByZWcgUi9XDQoNCkhpDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiBbbWFpbHRvOnR6aW1tZXJtYW5uQHN1
c2UuZGVdDQpTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMCwgMjAyMSA0OjE3IFBNDQpUbzogS3Vv
LUhzaWFuZyBDaG91IDxrdW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT47IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9hc3Q6IEF0b21pYyBDUi9TUiByZWcgUi9XDQoNCkhpDQoNCkFt
IDE3LjA5LjIxIHVtIDA5OjIyIHNjaHJpZWIgS3VvSHNpYW5nIENob3U6DQo+IDEuIEF2b2lkIElP
LWluZGV4IHJhY2luZw0KPiAyLiBJTy1pbmRleCByYWNpbmcgaGFwcGVuZWQgb24gcmVzb2x1c3Rp
b24gc3dpdGNoaW5nDQo+ICAgICBhbmQgbW91c2UgbW92aW5nIGF0IHRoZSBzYW1lIHRpbWUNCj4g
My4gU3lzdGVtIGh1bmcgd2hpbGUgSU8taW5kZXggcmFjaW5nIG9jY3VycmVkLg0KDQpJJ2Qgc2F5
IHRoYXQgdGhlcmUncyBzb21ldGhpbmcgZWxzZSBnb2luZyBvbmUgaGVyZS4gTW9kZSBzZXR0aW5n
IGFuZCBjdXJzb3IgbW92ZW1lbnQgc2hvdWxkIGJlIHByb3RlY3RlZCBhZ2FpbnN0IGVhY2ggb3Ro
ZXIgYnkgRFJNIGxvY2tpbmcuIA0KQ2hhbmdpbmcgdGhlc2UgbG93LWxldmVsIGZ1bmN0aW9ucyB3
b3VsZCBub3Qgc29sdmUgdGhlIGlzc3Vlcy4gSSdsbCB0cnkgdG8gcmVwcm9kdWNlIHRoZSBwcm9i
bGVtIEFTQVAuDQoNCkhpIFRob21hcywNCg0KU29ycnkgdG8gaW50ZXJydXB0IHlvdSBhZ2FpbiEN
Ck1heSBJIHVuZGVyc3RhbmQgdGhlIHJldmlldydzIHNpdHVhdGlvbj8gVGhhbmtzIQ0KDQpIaSBU
b21hcywgDQpHb29kIGRheSEgDQpNYXkgSSB1bmRlcnN0YW5kIHRoZSByZXZpZXcgc3RhdHVzLCBv
ciBpcyB0aGVyZSBhbnl0aGluZyBJIGNhbiBkbyB0byBpbXByb3ZlIGl0PyBUaGFua3MhDQoNCkJl
c3QgUmVnYXJkcywNCglLdW8tSHNpYW5nIENob3UNCg0KQmVzdCBSZWdhcmRzLA0KIAlLdW8tSHNp
YW5nIENob3UNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
S3VvSHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCA0OCArKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21haW4uYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgaW5kZXggNzlhMzYx
ODY3Li4xZDhmYTcwYzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21h
aW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gQEAgLTQxLDI4
ICs0MSw1MiBAQCB2b2lkIGFzdF9zZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRl
ICphc3QsDQo+ICAgCQkJICAgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5kZXgsDQo+ICAgCQkJ
ICAgIHVpbnQ4X3QgbWFzaywgdWludDhfdCB2YWwpDQo+ICAgew0KPiAtCXU4IHRtcDsNCj4gLQlh
c3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0KPiAtCXRtcCA9IChhc3RfaW9fcmVhZDgo
YXN0LCBiYXNlICsgMSkgJiBtYXNrKSB8IHZhbDsNCj4gLQlhc3Rfc2V0X2luZGV4X3JlZyhhc3Qs
IGJhc2UsIGluZGV4LCB0bXApOw0KPiArCXVpbnQxNl90IHZvbGF0aWxlIHVzRGF0YTsNCj4gKwl1
aW50OF90ICB2b2xhdGlsZSBqRGF0YTsNCj4gKw0KPiArCWRvIHsNCj4gKwkJYXN0X2lvX3dyaXRl
OChhc3QsIGJhc2UsIGluZGV4KTsNCj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJh
c2UpOw0KPiArCX0gd2hpbGUgKCh1aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4gKw0KPiAr
CWpEYXRhICA9ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+ICsJakRhdGEgJj0gbWFzazsNCj4g
KwlqRGF0YSB8PSB2YWw7DQo+ICsJdXNEYXRhID0gKCh1aW50MTZfdCkgakRhdGEgPDwgOCkgfCAo
dWludDE2X3QpIGluZGV4Ow0KPiArCWFzdF9pb193cml0ZTE2KGFzdCwgYmFzZSwgdXNEYXRhKTsN
Cj4gICB9DQo+IA0KPiAgIHVpbnQ4X3QgYXN0X2dldF9pbmRleF9yZWcoc3RydWN0IGFzdF9wcml2
YXRlICphc3QsDQo+ICAgCQkJICB1aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4KQ0KPiAgIHsN
Cj4gLQl1aW50OF90IHJldDsNCj4gLQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFzZSwgaW5kZXgpOw0K
PiAtCXJldCA9IGFzdF9pb19yZWFkOChhc3QsIGJhc2UgKyAxKTsNCj4gLQlyZXR1cm4gcmV0Ow0K
PiArCXVpbnQxNl90IHZvbGF0aWxlIHVzRGF0YTsNCj4gKwl1aW50OF90ICB2b2xhdGlsZSBqRGF0
YTsNCj4gKw0KPiArCWRvIHsNCj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsN
Cj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3QsIGJhc2UpOw0KPiArCX0gd2hpbGUgKCh1
aW50OF90KSh1c0RhdGEpICE9IGluZGV4KTsNCj4gKw0KPiArCWpEYXRhICA9ICh1aW50OF90KSh1
c0RhdGEgPj4gOCk7DQo+ICsNCj4gKwlyZXR1cm4gakRhdGE7DQo+ICAgfQ0KPiANCj4gICB1aW50
OF90IGFzdF9nZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRlICphc3QsDQo+ICAg
CQkJICAgICAgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5kZXgsIHVpbnQ4X3QgbWFzaykNCj4g
ICB7DQo+IC0JdWludDhfdCByZXQ7DQo+IC0JYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4
KTsNCj4gLQlyZXQgPSBhc3RfaW9fcmVhZDgoYXN0LCBiYXNlICsgMSkgJiBtYXNrOw0KPiAtCXJl
dHVybiByZXQ7DQo+ICsJdWludDE2X3Qgdm9sYXRpbGUgdXNEYXRhOw0KPiArCXVpbnQ4X3QgIHZv
bGF0aWxlIGpEYXRhOw0KPiArDQo+ICsJZG8gew0KPiArCQlhc3RfaW9fd3JpdGU4KGFzdCwgYmFz
ZSwgaW5kZXgpOw0KPiArCQl1c0RhdGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwgYmFzZSk7DQo+ICsJ
fSB3aGlsZSAoKHVpbnQ4X3QpKHVzRGF0YSkgIT0gaW5kZXgpOw0KPiArDQo+ICsJakRhdGEgID0g
KHVpbnQ4X3QpKHVzRGF0YSA+PiA4KTsNCj4gKwlqRGF0YSAmPSBtYXNrOw0KPiArDQo+ICsJcmV0
dXJuIGpEYXRhOw0KPiAgIH0NCj4gDQo+ICAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9jb25maWdf
bW9kZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1MzINCj4gKnNjdV9yZXYpDQo+IC0tDQo+IDIu
MTguNA0KPiANCg0KLS0NClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K
