Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67FB28A1B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 04:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6996010E102;
	Sat, 16 Aug 2025 02:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="GJxybYva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010014.outbound.protection.outlook.com [52.103.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF1B10E102;
 Sat, 16 Aug 2025 02:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wj1iu9MRYEj4rR3fFPxv9apeDlUiHVkjAjSTWzR4jm4hBnV+qb1IoqFbsRz3a+fhJaBBJrRNfxHWk9dl9H5QKuydNgxetzebOfxFNEsMw4QzDSvs4WZf9oROTovcMvAg7QJ7rtYtul3bLOAqxs3d6gCJCURSIDGma1BzBy59cSC1fLk+rZMEEpsGVxdPrhY3Ykd5x/C45/luXoSlaoQ/gzifb2zOf3ln3+zle67muzY5xy6Hie0iq63HxbZ2GNAT8keLdFxWEOL6PKSX/baBKUMORoLtTc6Ry+3mWs0zejEAyrNch203XyudGa7mF8nEtdTAOHoG3IR+vj/r47EfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UhTAer5xisUf7fyw4DA+zgXlh69cY+xT3T+EdSjecY=;
 b=sNb56M+PY0YXCzip8DGRuX6iAQ+Q81pbgnIgkYeB8g+IDaTZq+vgt+fLW8vOcCVA9i17oWPPNxQrzOXaLP4CLOkq56QOgYYyn/8BcZ32BoeH9KA645oIWX4fT286Gh0n9nphQe02CawsgczWvx6BdZnJtl+lEBbTEFOaQegrjo22zuI79EWpr4HVOcLjhFFLIb7IiJaDjV2KUDbQx5cA9ZAeacB0Ol4sUGMF9l5No65dKJ7zOet73nMnyZkwnn5D/cvRLQr3416x3e37Wse6cOL40dVvUJhgmg3Z3grRMaAoNi5gp7tWEHZ2zrT0Mz/lM0lgPFd4+MJn8RFwpGuZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UhTAer5xisUf7fyw4DA+zgXlh69cY+xT3T+EdSjecY=;
 b=GJxybYvappHxHXzPGiVTd0nTJhhW2cFJ3jIdGfvJcid+0iftt+wcbuZHjwxlvgczhSLo/leRJfHohiw7gPoyHEfMH+dsrj2iMJ4KJIHe04Zqo/Na+GF6wlbyH6EdPCodOURMeDYoMc71pi6duUQ/paBPjvmmIVCE3PsGYOpNSwso2oI+p81Slpuf8ER2+7E5Y53HEo/gFEz9ntftVdiTzIXNOjekgEei0FMh/akSFikgg+BJ/f68t8c19ZAZuzwTJra6+WliPyTwGbfIvyXBBFOOuJf0qNNc4Y9/IYdRtb5YVibqCKLXaC2aENlJUJR49UZmP2Lqrz7s8xg09Lxt2Q==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TYWPR01MB10951.jpnprd01.prod.outlook.com
 (2603:1096:400:390::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Sat, 16 Aug
 2025 02:45:17 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9031.018; Sat, 16 Aug 2025
 02:45:17 +0000
Message-ID: <TY4PR01MB144322B1C74D8FCF6370BD12D9837A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Sat, 16 Aug 2025 10:45:04 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
To: Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-32-alex.hung@amd.com>
 <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kY7MnEm7n60zIJhHrfpmp10L"
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <358f72c6-dc89-4585-b56c-dca29b017ecc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TYWPR01MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: eb532097-524e-4571-59e8-08dddc6eeeab
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6092099016|5072599009|15080799012|19110799012|461199028|8060799015|23021999003|26104999006|40105399003|20055399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTU3eXZwbjc3bDZGQjF6dXYvQU85OWxPM3lCK1V3dGY5S2ZLOVFNWU9vaGFN?=
 =?utf-8?B?UFZjOWFIVFJhQmpxSVBlRis3UThURW80d2FnaElPWkhLc0p6aTd5NjR6a3Fh?=
 =?utf-8?B?ZDloZXZwU3d3NWVaaUFSVkFDQk9xbU9rOERRU1phQnhHU1kxMlRxcVRuSnl1?=
 =?utf-8?B?aEhnUkh2dDRYcVBvS041WTZqK3Nyd0J4RFBOaGRlQy93cGVIRTF4K0FSZmhQ?=
 =?utf-8?B?Y0lSdWFRcloxY2tnQ3BjL1dZSHVEa3FKQ2xCUnRJYStaeXU2TDZRdkdHZ0tV?=
 =?utf-8?B?dHdVOW82OG5wSEROTEZDUXRCWFMzL1lXWmx4SEJDTUxKdjE3cU83Zlh3eW5v?=
 =?utf-8?B?UEFVVU1JM0tLUGJ5Y3ZxVVA0c2ZLdVZIejQxUm9qOFdrdkNZNlJnMU0vNUpB?=
 =?utf-8?B?Lzg2eTJLaXZac3ROYnkrWExNK3cwcWhya2Vyak4wbHhGb2JqT1dFRy9rb2h2?=
 =?utf-8?B?ZEZsb25FTC9ESEZEK0dtM0F5VmhCa2JZOHpiYi9DbDZBbzUzNlVHeURFSTd4?=
 =?utf-8?B?OUF0c2dSTlpCSnlCQ3k3TEZaejJkd3o4WlI0TWtWallDNmZZcHpEc3R1blBU?=
 =?utf-8?B?UlI1ajRKbVk5ZXcxeWwzZlNkRGo5Z3hkUzgvc1ZuNUV1S2UvbnlrU1ZoSGxO?=
 =?utf-8?B?aGNDVk9GQUQ1cDNPL0U1a3RIL1BtbG05clFlWk1FTndjeVBaU1RpMnRIVnRs?=
 =?utf-8?B?ckRnRzZ4V1N3Q0k4bDE5TkxqWjk3NTZaZktrS2xRRjZqaDFPejBlbFMwTFhO?=
 =?utf-8?B?bm5ueGhDMlZxUXFKZDl6OWlENlQ2ckZCRU9ud3RPa2VJQUpMcmlpb1Y0Nmpr?=
 =?utf-8?B?TVc2QUYySHFxaVMwK25TdXBLcVBrQWNZZUxwa2ZiVWE2N2JuY3lieGFkbU9Q?=
 =?utf-8?B?Y3pOOGg4YmdIZURqaCswdDlRbnpQdmowT3NTUmdSeGl5Si94MWh4NzlvODM5?=
 =?utf-8?B?bmE3WjRWM1VhWEZGWm1Qc1hPSzVuY1FLZWlrejZwQ3FFQ3UvWVJFLzU5a2xi?=
 =?utf-8?B?azRQL2c2QnhRMU1vUG1oR0F2eDR4blBBazlNai9CZW0rcWJwNnpUbWpCem4w?=
 =?utf-8?B?NDQ3dnFPUktWb2hybU8wNkZBUGlvYTRXL2xQbWtqUEdpN056SnhZWXZ5TmZo?=
 =?utf-8?B?UE9McnFsY2tvMjV3MUhOdXRUb1lVeXh1bDVHWTMrd3V6aXowZ3ZoZDlmUzN5?=
 =?utf-8?B?UkJTajV6WjFiZVRWelM3MTAvV1V1Qmk2K0lpK2o0YUtwTXBLV0Mydk9qZ0p5?=
 =?utf-8?B?SFlmeno1RmwzSGRtSkYxRUVpNHJBc3hrdDlMVjZ3VG13L0p5VUxWMEtzSXZi?=
 =?utf-8?B?czl5My8vWmhJRDg3VnlVT3pVVkF4RW1YZlg5c0xxTEFvYjQ4NkR1Rmk1QjVt?=
 =?utf-8?B?VVZ4VURMb1oyUXA4L0g3WUMzRkdkWFo1YlJ0cjI0S0YwOEtXdU1oVEVBZFZF?=
 =?utf-8?B?RTF6TkdoMzlhVmtPYVM1RGQ4Tis1T1RXcWpWZWtLVExQb2dHSDlVZFllYVJG?=
 =?utf-8?B?VEZvS2E3b2prb2ZsZCtLcFFMWWtVa2c3eU1MRTFrM2ZMbE5Fcy9IYi84Wk91?=
 =?utf-8?B?bVZIbzJDZlRmY0JrSUprRDUwT0I0Q3RTeUszdTFkYXB0bnVSSmJabHJYSVl0?=
 =?utf-8?B?NXJWcTBlL3dNSWdEb1lPdWtOWEd0MlhQWWl1ajZCRHQyU0hBUUdvelQ5VkFr?=
 =?utf-8?Q?4/8L8aH/9/8kS8uimeun?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEdqZTZRUHNoYmhVZXhlaUxHdzk3MnRSa05GZjFuWlI2YTdEZmRaZVdLdTdM?=
 =?utf-8?B?L1VjYitYNnRpT1RMbDFDd3pXZnVCdS9IV3lWc3NDUE5YZm5zZTZIQURzbEE4?=
 =?utf-8?B?UGw1UjgyNDhVSjBLWmpQOVlqUHBzajZiZWpXQ1pMN0dHYUhJN1pjcW9zMVpq?=
 =?utf-8?B?QlFJakM0Q29QQUEybzRLTmRUM2JKVkJBM05MOHhzTFFkQkFvTWlzOHJHdy9v?=
 =?utf-8?B?R3VPMjAvZHBzMUtMbXNuZFFxUzBLdFpHaTNqd0xqb3FSMkNZU3d2a014WTVL?=
 =?utf-8?B?ZUFvcmJlc0tmY1o4d1VFdldja0RVZlZkV3h3Q1BGTE1HZUMvR2haUGdyWUEv?=
 =?utf-8?B?cWcyWXE3elhRK0czR0VZRzYwV3BYYjJ1dTFqc0QrbHo4T0ROTHI4Ny9nRUd1?=
 =?utf-8?B?bTY4Y2RqNHRUVXV0eDlscFRFdnVxOW1zZGYwVC9IODBKMmJiUmw1Yi9oYU1Y?=
 =?utf-8?B?V0llVVV3VzJoQmF5ZWVTVDF6bG0rcXF2MmRnYzZKVGIzejNRSEl3VzQ2WGky?=
 =?utf-8?B?YXR4UEYrRDRnc2E4dzNVbmczZ3lZRTdGbk1tWEJZeWNqVUlOTVJhTUJIYzR4?=
 =?utf-8?B?UnVQcnprcC9kVkFjUFRkL2s4LzZCaTJuOHFZeDdLeHpYSnFRbXNOQkFtcmh2?=
 =?utf-8?B?VVB5dDRMTmllZktVVUlld2tBU2p5bjhlY2M5elI0a0ZxNXRjMTMwc1Y5T09P?=
 =?utf-8?B?VUkzcXhhS0x2aTd6bnZzVVRweThubWwwR1VHUCtiNmhxTVZ3WXdZdzliVnp5?=
 =?utf-8?B?dzlPbzhjQUNia2h5Y1ZXU3laK2NMVFJLVHZLNG5HdWYzUkxMY3dTdG9xMU5h?=
 =?utf-8?B?N3NYSG5qdUFVdXVicGd5cE9FMnV2T0dBMjh3ZWZ5VndkQjk3SDVNK0N5Rkho?=
 =?utf-8?B?ekpDSWk1YUZaVmpqUjVqU291V1FkeGxMbVRvaHZSNXVYUGhkM1MrNkFCZmFF?=
 =?utf-8?B?b2tGanVxa2dQWkVMNmxXOE05NDlQY241NEFxMkxMTWdKSkpqbXpMbVMyRldu?=
 =?utf-8?B?ZDFGaUxqVGZqK1Ryc0hkd2lTeElDazdlVXlUY3djQjlXK2lwUXZYU1d2TEVT?=
 =?utf-8?B?T1laUmRncVM2OWtVVHZtaGx4TnI3NEtCN3ZyWWY2bVFNYlhKRkdRYWwrZGQz?=
 =?utf-8?B?elFNOHU4dEZJbHRleTJ1bUdzR2FFVzB5OTc4Zm80ajVwU2k2ckhXV00vUyta?=
 =?utf-8?B?VVlmQlJvSEF4VG1hSzZBK3ozN0QvTWc1aUoxeW5CT3JDNDZXcTdMdWQvL0FQ?=
 =?utf-8?B?aGRUOGl1TjdpaVZxUmR6eVJJNUpITWFVTlpnV1RvUURDYmQyN3ZqR2M5RG9B?=
 =?utf-8?B?cGRxbEtwODloQy9zN1JnSzZrTnVlVnozMlgxbzhHaklIR2pYbVEwOExIM2ti?=
 =?utf-8?B?bmhwNldtNGNFUzlmYkdxLzZRUFJkOXFPRE1WbWVEcGF1SFFIcVN6VFpYdlBp?=
 =?utf-8?B?UXJQRk5hc0VYSk41eEFhMDROTi9VWkY2bm52dGZmN2FkYi9qRGQwVWRoTkZ0?=
 =?utf-8?B?b3hFS3gyQ0p0V0Exc1NFL095Y09pUWhKZnU0UWRRK1hNZnNlUHBGVEQ3czdl?=
 =?utf-8?B?Q1Fkamppd2NwZFVvK3FaUno5YnhKRmRDUGR1M3A0bFZMZ0E3QnhDMlNuY25B?=
 =?utf-8?Q?4dfHUsQD0U40V7OreW6sMuTfcj4LDOtsIZAHnAC3hmxA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb532097-524e-4571-59e8-08dddc6eeeab
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 02:45:16.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10951
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

--------------kY7MnEm7n60zIJhHrfpmp10L
Content-Type: multipart/mixed; boundary="------------0nskV0rEdmmPnG6fPoikue48";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: wiagn233@outlook.com,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Message-ID: <358f72c6-dc89-4585-b56c-dca29b017ecc@outlook.com>
Subject: Re: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-32-alex.hung@amd.com>
 <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>
In-Reply-To: <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>

--------------0nskV0rEdmmPnG6fPoikue48
Content-Type: multipart/mixed; boundary="------------NuA4jN1Bra1xcwQcXJvTIfKW"

--------------NuA4jN1Bra1xcwQcXJvTIfKW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNClRoYW5rcyBmb3IgcmVwbHkuIEkgZ3Vlc3Mgd2UgbmVlZCB0byBwb2ludCB0aGlz
IG91dCBpbiBkb2N1bWVudGF0aW9uIG9yIA0KY29kZSBjb21tZW50PyBBcyBJIGNhbiBzZWUg
ZGlmZmVyZW50IGRlZmluaXRpb24gc29tZXdoZXJlIGxpa2UgdGhpc1sxXS4NCg0KQmVzdCBy
ZWdhcmRzLA0KU2hlbmd5dQ0KDQpbMV0gaHR0cHM6Ly9jb2xvci5vcmcvY2hhcmRhdGEvcmdi
L0JUMjAyMC54YWx0ZXINCg0K5ZyoIDIwMjUvOC8xNiAzOjI2LCBBbGV4IEh1bmcg5YaZ6YGT
Og0KPiANCj4gDQo+IE9uIDgvMTUvMjUgMTE6NTQsIFF1IFNoZW5neXUgd3JvdGU6DQo+PiBI
ZWxsbywNCj4+DQo+PiBXaGF0IGFjdHVhbGx5IGlzIHRoaXMgT0VURj8gSXMgaXQgcG93ZXIg
MS8yLjQ/IE9yIHJldmVyc2VkIEJULjE4ODY/DQo+IA0KPiBodHRwczovL3d3dy5pdHUuaW50
L2Rtc19wdWJyZWMvaXR1LXIvcmVjL2J0L1ItUkVDLUJULjIwMjAtMi0yMDE1MTAtSSEhIA0K
PiBQREYtRS5wZGYgKFRhYmxlIDQ/KQ0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBT
aGVuZ3l1DQo+IA0KDQo=
--------------NuA4jN1Bra1xcwQcXJvTIfKW
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------NuA4jN1Bra1xcwQcXJvTIfKW--

--------------0nskV0rEdmmPnG6fPoikue48--

--------------kY7MnEm7n60zIJhHrfpmp10L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmif8LEFAwAAAAAACgkQX75KBAfJsRm6
JA/+OvObR8c+qIJwKrRKuN2kv3Jq0Mu9GeiD4M5smMvvxDw/ELFzxe2+oGxlhI3GrXiPjng23NoO
W6URyn903kW0Ph8uAA/zkRYVnMG5VS+TLLCu6y1wlMu5u20TJSP+kTRbLtsBEIbc5vu9eA1g8iM5
id4Qy2DPKQUdFbY8kmjwlStuA2PRMELQtuwBFUkNgt6fpmjFWP03lMaaQWflL4i65iMIKR31xuDe
pjxy66/aChCs3CeEeE7+Bt8XvtfJ2ajHGx7MMGV7hhFKwGYh/kHwrXNGA9F/wer5eMjrOXrlfpMJ
Ga5k9OqMVcKqW2H+qs7T0TWzylIKFaXQHt6WDFmerq5fUFXbW8lewiIohG8NV0Fm9v/RfjwwljIA
lUB9rwwi43AsymlWrNpNVqa+TWXZYNUGFXQ8l2DscIx/aP6yyRRKTwpVokgCVVeFhEEYY8HQ5BmP
BqUw64cLfIJ5Yy4t1e3S8ctKcKHpbzlYnrOLFoRVbOEdQqh8alrctrg492qOb9EVxSy0CaI1uXSv
+ooeFQcg9gHjAC71gTftyChR7/Kljqv/uT/BanN2jVSxP1Hhetg6sWZnOKqLnrhZvGFSAu97REuk
vsxGtDZbfLMhRP0iJdOt1ktji5NuFHQQqQ0pGA5pYk/pOHqPi7VptWQPBGX7rZFXS3RgpIy0EXzo
44k=
=zFZg
-----END PGP SIGNATURE-----

--------------kY7MnEm7n60zIJhHrfpmp10L--
