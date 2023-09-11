Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367B79AA04
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9144C10E326;
	Mon, 11 Sep 2023 16:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn20831.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1710E326;
 Mon, 11 Sep 2023 16:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXNUbzDWBLvs4W8yQs3qxFvDerWZW9dRgeTA/eIMfHbbCOzH3TqPeyRuYvuHgfDIBSQbgzM7VFb2fdS7BOyJ8T5q/OtjPAEQ6daj0hBptGnQuwIsbKenUMwTDX+9x0P2K8zqVXkjrl3SxZttisRo4jbARvPxJ1YS9yHMpQBRtFax9i6wb78JdMTHn0Gx0RgQLBXofEsYlHai6sHj1/gmfwAUmnONo3tjAo0U+OuSVsFfGjcZSMkrQjlrABJKSLNqJDaJjyTUWulGC8aRahQx4qTx1WQPPQI8Mcile98oqY8D9OmI5W+Gzy4F3o4PijSDJI+CUS42SxrpLH3CVwj8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KB8EkG4Iq8pPw1U1hO6IkZ2Z3fojgBIfkC9Wmt5qGaI=;
 b=H+Xge4KqOiVotyXS5UWQaMiCqJr6/chmhMFsrAsAEy09etX4V5+G6Iuc0fR23sXHkztAQHE4Ob59uS834ovGOJNjObxg0N9RtjjQVIKb32O3MUn9rUlcD+82+a33J9dYSbUbd2oJmZmZn+aYHFfSaz4cRAPmHtWVamz8GHJqxtg1qYWmgIdCajs0XOhgv/IDmrq490JWRwSmDVRg557kqAJmCFsXzh5+Mr62LEGXcfIwp7BnfbNJdd/tE8fUpMmySufL4prdjkBaabp7aUq8xN1kvMPshy4NDfy7EQBQjf2Akz8wyrqUE6iYgciLwtFVZz3Na0gPtvlkPsEUeChweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB8EkG4Iq8pPw1U1hO6IkZ2Z3fojgBIfkC9Wmt5qGaI=;
 b=oTsvdlIEHszqGfjvtDlyTAlENe6eWfntYTYqR0fB1RZJqNZTUjEfh3+IQUXEbWCut+VOtLVhKq0tmJ6tg2g9OfJWRjZXM7vB2+LbR0t0ofzQrFIkPeQTO7XHLCDkq8XBAlM5lIKcwHN5w7DXNo/mLbYTk1IEsJ+p0eGvocgLgJGjuYo1xQChaX2PNhKXHlT3HnP58/DyG/FhJjYqbwJrgHqzxJEu7h9zPgN+crSCMYTNzoiWfgDl4ojly+Ojk6AqbODYj9wSz+7z8WNWrWBJuyWvGzUD2ls/D16Aj1xZAUju0s6POvWe9kT2P4dXlYjQlaBjVFWLY5lAVdUpwuSFzw==
Received: from DB6P189MB0568.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:31::16) by
 DB9P189MB1721.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:26f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Mon, 11 Sep 2023 16:01:44 +0000
Received: from DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
 ([fe80::4dc2:a591:fbfa:d27d]) by DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
 ([fe80::4dc2:a591:fbfa:d27d%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 16:01:43 +0000
From: David Binderman <dcb314@hotmail.com>
To: "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Xinhui.Pan@amd.com"
 <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: linux-6.6-rc1/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c:2175:26:
 style: Array index 'i' is used before limits check. [arrayIndexThenCheck]
Thread-Topic: linux-6.6-rc1/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c:2175:26:
 style: Array index 'i' is used before limits check. [arrayIndexThenCheck]
Thread-Index: AQHZ5MjY3/KGEO0+iEGQi+iQNhMZww==
Date: Mon, 11 Sep 2023 16:01:43 +0000
Message-ID: <DB6P189MB0568B264D795E66A47FC0EFB9CF2A@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Jo2BmjROJM0BhXtJ9G2/SphacaOt/7PV]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P189MB0568:EE_|DB9P189MB1721:EE_
x-ms-office365-filtering-correlation-id: 2a307586-5e93-4004-7dd8-08dbb2e064ef
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FLsn8f+pmJGtbf2oqa3pUxRSX5efTS2hcZeCST6U2UZVbS+/+ly9RceSmv9NirwsZEnY0yKxkwVmTPolmYlnumi6+8lo0hl342dr5DsYK2KuCRsiV5bF2seH3K/HXLbmfvXAA/15KmRIK+lg30Hcz0Ec/PNSo1WpJAZF0/ViCV7Q5/e4Kil9Otd/DTquwJxJwo9uaK2HmHHXAXjVkFijcWzTuImm+Loc7zZIVAkZJ/0qJ7Y19xbigfZobWjZJip9JT8S/9QNaAWNF4zg5RXhX9G6ouhW7fdsO+pts5Cn9/zls+Midvj/mYefC0rsxhCDWUvz35ba2VfMwU6NsAbvF+BcrPSYRSOKSUCrwlXOHLhTfnkkZBqoqNr6My3Ti03/QL0ChlkaGZnTySu4rGO0wCgEGXYb/RiW+jbAgnEoGNhMk7r83lks+7xB+Fns9P56WT6d+VCWULUCJIKhwt2FihZFBGASei8Jwa+JxisSu+oNON1Ptt26ALu3LGjZYUeDIkBgvOS0OsfGGadRaKyUGVH3VFr3hrzs5rLCoPUCw/eRlbOAyuWoQ9bGpJehhVP0
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B8l1cM9w96j6HS0rC+TR7ostKF/LEDZSFRiVmf1aaUphdfbGObZo08RQ1o?=
 =?iso-8859-1?Q?TiHgKcY0lL5i7cjjJUJeQqdWvIRJV5FEKKWjGPUX2/Og7LP/aBzedQIPpD?=
 =?iso-8859-1?Q?xuVSNvBg1K2b8qGH/NRwzfGmIF+oMlYi9RYZLFMCpjNaJSL7+70BuWLk8a?=
 =?iso-8859-1?Q?SE9pteKJH8l1gPMFQQi3cPFZhUeC0i53Zz8xWE5Ueww9oV6s89W88gHjsv?=
 =?iso-8859-1?Q?Z1bBcHsZ9NcbCPScDttj7+yqgzZWxMJPEtDySVlnMRPvZAikHvtsdwmbkS?=
 =?iso-8859-1?Q?mRpuJvocSRaN6vVG4zMS5bAuoV+GPkUs3u13qot4Fpu7eNGgWPe0/aDkY7?=
 =?iso-8859-1?Q?pGhyW3CsWL0dP97eXfzzEjhhKjYiap1V0kodmlW9HDNmeiOm7ViKI4qxYL?=
 =?iso-8859-1?Q?Gv1kVeVdg5BZeukogLhOmHertOu4jwwgFbK3nJlQcehIlhihMd8/er/aKV?=
 =?iso-8859-1?Q?xMIjiyrgIQRDZbMcqif5T52h1Asr4tofISnTDQWbbrff0BfkuYx1BM4HzR?=
 =?iso-8859-1?Q?0uSv83BP/soX6+wKPasllGlOKtNj9YSH9O5Bhj8oP8pSx0lv/cDjmf5peM?=
 =?iso-8859-1?Q?/BJeYlMF7WT9MMLlAHaR90sHNIcLoYTFORPnGyrbPvNcKkK7KFdJ8o/6h5?=
 =?iso-8859-1?Q?6wWwggMrwz3vLm8BQs/RF+3QOS65YdHH0erSVREOSRyaFtcbZeQcDCi1RI?=
 =?iso-8859-1?Q?WAFRfVYPcv55wikVjPMrdAiuYYABIsv8sRWAjCiBj+yRF974MN1Ffd+Iv5?=
 =?iso-8859-1?Q?6I6F20A0nlPlvaj0irn9SOW1kUKf+QnoL2M5g0rAvBBR6NKyai0wwyfsDB?=
 =?iso-8859-1?Q?5szY75VNBoyxB/RxX45csmaw17A/gMWZa9f0I3ct1BmGuvpMPmxcZ/21nM?=
 =?iso-8859-1?Q?JfRalVd+4JQtOBJxOMmSpomnUUb5STIBu2bu2pp9QL20iBKKFbHS/4F8DS?=
 =?iso-8859-1?Q?4soty8NtFVLFqlUBPpw9e/tzWrqAQmdlsYSJ4XcP5pkLdRKbF/1OBwyPze?=
 =?iso-8859-1?Q?Xt2zEt9/JR0ZNTznQDiCY9KYHcnAFKYoVtKbom5QIqOzUyPb+vDxXGy4MN?=
 =?iso-8859-1?Q?XsOvc8qWX6O7EJdbZjUDj/Sk8zJ1c2yZxD/Y7ceJpxeFiYwzzJU1M9JmqP?=
 =?iso-8859-1?Q?K2Sb2V90EU2/LkbRpuYVhZupanYYymYfPlwvUVz9OQTn6Pg5XfdCCrdV0n?=
 =?iso-8859-1?Q?ZHoA4kYgnEsjIx8iwX7z2np88O1aPBCre/G3uWpRmyboHUyBFSRugXCO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a307586-5e93-4004-7dd8-08dbb2e064ef
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 16:01:43.8583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1721
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

Hello there,=0A=
=0A=
Static analyser cppcheck noticed the above problem. Source code is=0A=
=0A=
            if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < n=
um_dcfclk_sta_targets) {=0A=
=0A=
Suggest new code:=0A=
=0A=
            if (i < num_dcfclk_sta_targets && dcfclk_sta_targets[i] < optim=
al_dcfclk_for_uclk[j]) {=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
