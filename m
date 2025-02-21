Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68979A4005F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8E310E254;
	Fri, 21 Feb 2025 20:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="EDPpOrWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011027.outbound.protection.outlook.com
 [52.103.68.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0812C10E254
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElckfelCnYletNAcR9yZlUuq8s1+rGGAa2J2myg/fAseX0Sq68pFkb8QeT9iEQNPMvzIabLQelu6g/bR94l1kQ+JfJ/TGxf3vwMiWcfkuliweNn1tpFCUD9Iy9Z9UhJLADo0/p+8lWgky18LuEb6+SDOFCEjEeUu0Orh9vLQI17gtfDSwHl8PEsZHQdsTy9dUj0YMQDT1HPEy6ueSf2ABWRZABu3L1TGFR+BmLRQLNGzklaBWSW1sDOTNOTz3N2mnUCn7Y0lbQmO+8ov2Y1ziFeCW7S9LvV9rvMfU1toJo/krdudULAnHRTQQPC5d3WxZdCpQguuXqz++h1+JvmIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lmYSZ+NrnHgnm9knxMUxg00g2w1N4jVpB/20xGNG4w=;
 b=LamarteMzanLKAI0qb06NxxS0IBDQKbFthAZ+3N1KvAvKnvyj911j9b4yC5Gc2gnUJP1msv1pwMRyxWsg5H5L3go0qf8Q1zZycAt4XBlMqpjguU3bWufRcS02SieEsclJY78paPeYGBt4PKFHSG8A274jod8ynYRnpBF18JnuVSVRRqEcsO1Tn2nphyYisq7LPVFswcJWgWhIj/kXQ/JKxyGCPx+HzIRwRkMFty1GHJ+xGXFN1CGJ2FAKZ3LUgT3fCl/TxrqqqS8taYg4ozUR1e+ahJntaIskPrg57ymtvohEz6SOMG96lDK/28O8PWiYjOYvOQrV66hGYGBoJNgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lmYSZ+NrnHgnm9knxMUxg00g2w1N4jVpB/20xGNG4w=;
 b=EDPpOrWZgbgIjgXzFrWbefFqiywsBWOXEHUzk5M3Y/txy0Nhd35mp2nroiDON79mncUR+bWZAwIO9lLqGxFr4RX/0OhAfVjxSmLt1AD/9XkKuV8TYgUfjDMklCgSQRGVsZsrZ5g0V+vs6wS05LGFikOJMhzrwfEksjXwltGZP37vVcQf91PiesOqQC6UibLWqluSZ48pmdI2we+dB0znbQNYOicTmeqSD/+rVOQ82sPhr5pUxifzCFwZkrqrBirr1jn2iYXzCG6XdA6ZOvkvjlT0MaEItukwr82Ij4hoIXOSrGuS0is9LS2zmwtkaoSB7YeyTGr2kqP1Ycs0/Vh96g==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB9077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Fri, 21 Feb
 2025 20:06:51 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 20:06:51 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com"
 <kekrby@gmail.com>, "admin@kodeit.net" <admin@kodeit.net>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, "evepolonium@gmail.com"
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NR4q0AgABFegCAAAi3Xg==
Date: Fri, 21 Feb 2025 20:06:51 +0000
Message-ID: <PNZPR01MB4478C12B911E293C645E6EA6B8C72@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
 <9C31901A-2C5C-478B-BB1C-D4705939EE4D@live.com>
In-Reply-To: <9C31901A-2C5C-478B-BB1C-D4705939EE4D@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB9077:EE_
x-ms-office365-filtering-correlation-id: d80bca38-5a88-4612-b025-08dd52b347d9
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|8060799006|7092599003|461199028|19110799003|8062599003|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?YILHmyBi5ewI+jC4b4ZgolFccMcwXbpT5nzcclMAnH5SLH+qFRwxbhKIoHXk?=
 =?us-ascii?Q?UlBhnSUkGPx7KBgwEm3c1PQKcI6UBQjhFYVBfwz+Salwl2VPhKFACxQDLYqn?=
 =?us-ascii?Q?bP3zVFOUK4iopQaixQGWeA+CH50i5AV/bumK3WgyGJY+Lup4y8KFjP6y6GeL?=
 =?us-ascii?Q?4n2NxVlW9Ln20PvEOqReXR3T9RCl6bKEKBDSfBXLJ2h9O+/RP4eETj73yl+Y?=
 =?us-ascii?Q?7ROwWrRZ6KUjPQZxYX8UvbVtF+x22QCpW/WsdnMzyDocV7wqynd2LPZQR4no?=
 =?us-ascii?Q?F9xMeZI9JEudYXOWBEfjLig43cfdzIq6zlgeI7aTnucNBaRFKFW9WGlEmJkf?=
 =?us-ascii?Q?oHFVu4ZZPwXEi9uR0qGu3FRhWCoxtmEpXWf9EGSJEnFdtaLPFxPDAE78zyYE?=
 =?us-ascii?Q?V40WFCUk5Uwr2jWpUMMWLlMwjCOePfFupjF3z1ui94eqyKDJt63IoX9ZQHxB?=
 =?us-ascii?Q?kktw/vMG5Cb/ZbA6onCV1+NRN+kCLFLG5Gbju7wgHYYNJSTZQTEANRnkFVqo?=
 =?us-ascii?Q?ODTB8uHXhbZ/UyDK4E3sJk4CnZ65RaW7nXFLoV1YSPIz3Of8SRenNEwx/xT+?=
 =?us-ascii?Q?QDVt2ZQintO3VgMBBkxnJXG/cseB9zyyogiwSz6jGhoV8QdsGoVRqzL89Fyd?=
 =?us-ascii?Q?ayRP/NGlK0gvYvJQLI2CEKZw6SDUnGwun50JUeLw7M3JD7mr4Ub6hQR6w6A9?=
 =?us-ascii?Q?P+TCznebM4KB8eitUMACmOtp7PApQnIm4XifECI7sQxO8eh9jPy7HUV9nNCf?=
 =?us-ascii?Q?ufqSr/+BszymIE+M+4sm7DvibnCUgri+LdXeVKUWZvs6JnkEWH/nJoRlFEr5?=
 =?us-ascii?Q?1JIBJQGnuoTTnA64xmpqwMTYgcoZbBl+fO7ZSEFs7IQiOj086pdOJRuRLozH?=
 =?us-ascii?Q?fT2Fzi27quEYiiqkKVXFDXu055Er7kwHLtQMzOas3xZg6i644gYJBwcUOLxJ?=
 =?us-ascii?Q?3dC3NCE7oVRYF9HQCuqkpmdyFFMbKxZWRhCut6zNYCppuz0EmXtdPdRph3z/?=
 =?us-ascii?Q?XwJxx0hDgYFkwr0Zg+NKyqbfZhe3KqH/+qLn6U/MvbB9Pj8/wKNhlBqwMDNP?=
 =?us-ascii?Q?fLsji81raa5Y6wWx/51DuPTSKwPIA3sWOfrwY/tpb/wPL0bjUNI=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K55wqQMOM/lY5vCk10lOz5/RNEVEOlVlnEKxEbgsW3G1MAqVUy7Bk76v4lsB?=
 =?us-ascii?Q?0cCjQK2y7t/RFjB9fmc/46NIYFAPkYOlJ7q/GIwPV9aaRiC6nhlM9Y5thJPw?=
 =?us-ascii?Q?Qwr38NwHgaBBylHcz+qsM2Z1VwsdUuiF5Rc9CCYxlvBZ5Cc9H/vXpZye1Cbl?=
 =?us-ascii?Q?4uAOa8Ugps9p2kzDOLqFfsZ+zSwVc4GeEpQDg6faE2OdG+mfrQi9Z9KT4CG6?=
 =?us-ascii?Q?NN1ut/3BocVj8tB5UDxUKjnPHn8pe5JxPgh1tlDobUx7/cG1fQIBvyTVueB7?=
 =?us-ascii?Q?WTFcr3S9xyjPIO8hMBwJGXRRfnisEBQ5FDU+GaRELMbz/2zg+sIf2MFKn2vv?=
 =?us-ascii?Q?H7QB1rXV2o0CkcFCNzMk4eXTt8MMRipcbQEaKNciYOid1/q7lj0n6HS5WnKY?=
 =?us-ascii?Q?AbH+1+fd6OXKF0Jhkx1RITbT07RTEgruQM6XaS2d+FAl6spQBiisG0mNxKoH?=
 =?us-ascii?Q?P0OUUv992jnZ/eWoEbfweezxDVIBzjJ6BOVe9XbgC22YihWcqNxSAg42QFQW?=
 =?us-ascii?Q?OLdKM8LxYaDmhapNbkvr+hhOy6Dsnaa+LPNvxJRQH8ibokTAcRywDbkXyzPt?=
 =?us-ascii?Q?IPNUsaoNqJZMkKvRvcMHAEay+FNrtD8cQ3UQedP4GyX2tY4/SCWW2qBFRW5M?=
 =?us-ascii?Q?LnXybo2P2DU4lp3Cv506BEighA2lmEx2QEbFCxl+MnRGEfWG/CkUGEP2jL2f?=
 =?us-ascii?Q?PjMEYifCToFeW/DP9k7xeNbzFtQu8WoeF8VMz4wfb78CnCtHZpNF6Dk1wrNO?=
 =?us-ascii?Q?ullozGpXU9lf11meWxwSkxSAHMQF4NwzHDp0PpWi+3u5TJhR4xb1Ec1fA92B?=
 =?us-ascii?Q?7NFSEzkbSeO9oYC1MWbxhtXBGvkUvkOcqHbWnX/VyNvXFH2zjFOOQ3sm7w1u?=
 =?us-ascii?Q?vl48iz9IrMF+OvMxTCUg0y25PoZmNYdf2HGCzVcBO2cqMsRYReUfKyLNZ2Se?=
 =?us-ascii?Q?ifXey0OfC2nUUBQHjFppFugjM7/ULG1cI4J82qpYVVzBRI6fHzpSe4LUkoI4?=
 =?us-ascii?Q?q1ySbDoLZpgZ5otXzSQkSxPLpf5Np7yvfeYHYyTCMG7C1onHesnOzJVxW+Mk?=
 =?us-ascii?Q?+ycTN6IrrLESzIYRWeQ4lVI8K5LkxECTWOrUErWNht1m7NLZ9EwYjsCVpM9C?=
 =?us-ascii?Q?5mVBvO2oGWsni59uzcnTb/w6eGd2E6rMtZ/83xtC9NFcWs2LvihuvLwXV0z+?=
 =?us-ascii?Q?8OUqJ3UQLhz9DkJN5PLebVxjBFgs36qDCKP570dwWnFa6LopWvSYXgAbFcVc?=
 =?us-ascii?Q?UVmB9DXfQ9MBgiqXsfFzvccX0EodW+Rxx8UzEO6YCOGDNlUFEW/tHgknkLA4?=
 =?us-ascii?Q?lOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d80bca38-5a88-4612-b025-08dd52b347d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 20:06:51.3983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9077
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


> Does this look good now? Made orig a union.

Wait, it's messier. Maybe declare data type of val separately in each case?
>=20
> char *fourcc_string(char *buf, char *end, const u32 *fourcc, const char *=
fmt, struct printf_spec spec)
> {
> char output[sizeof("0123 little-endian (0x01234567)")];
> char *p =3D output;
> unsigned int i;
> bool pixel_fmt =3D false;
> u32 val;
>=20
> union {
> u32 raw;
> __le32 le;
> __be32 be;
> } orig;
>=20
> if (fmt[1] !=3D 'c')
> return error_string(buf, end, "(%p4?)", spec);
>=20
> if (check_pointer(&buf, end, fourcc, spec))
> return buf;
>=20
> orig.raw =3D get_unaligned(fourcc);
>=20
> switch (fmt[2]) {
> case 'h':
> val =3D orig.raw;
> break;
> case 'r':
> val =3D swab32(orig.raw);
> break;
> case 'l':
> val =3D le32_to_cpu(orig.le);
> break;
> case 'b':
> val =3D be32_to_cpu(orig.be);
> break;
> case 'c':
> val =3D swab32(orig.raw & ~BIT(31));
> pixel_fmt =3D true;
> break;
> default:
> return error_string(buf, end, "(%p4?)", spec);
> }
>=20
> for (i =3D 0; i < sizeof(u32); i++) {
> unsigned char c =3D val >> ((3 - i) * 8);
> *p++ =3D isascii(c) && isprint(c) ? c : '.';
> }
>=20
> if (pixel_fmt) {
> *p++ =3D ' ';
> strcpy(p, orig.raw & BIT(31) ? "big-endian" : "little-endian");
> p +=3D strlen(p);
> }
>=20
> *p++ =3D ' ';
> *p++ =3D '(';
> p +=3D sprintf(p, "0x%08x", orig.raw);
> *p++ =3D ')';
> *p =3D '\0';
>=20
> return string_nocheck(buf, end, output, spec);
> }
>=20
