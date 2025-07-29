Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08439B1521B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464EC10E661;
	Tue, 29 Jul 2025 17:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UWa+wGcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9165010E047;
 Tue, 29 Jul 2025 17:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl1AJWjCAZnZkIoMYcHSjvs6p4vqWY+UKb99BBGOX2wHHsOW7erbcUVS6F50EJNnP6BbiQw5NKEoGFATkI83nFhW2zontMnKEFaMyXfglxAjNsaPrCMiBtjXwCJ31ghMqN+Coc3XmSNN2+3idca93d5sotZieVmeXUUubfGJJoDxYVTF0oRlqogSMBjQChLCqSNdmtXcRegQmNoKqtiVF9dUl5p9hIP0gdv6qhjKkMqZp1E/ijgEefLXtoBTXt3kMpnriZi0LWseBq514WG1Hi+zL6S3wrD1gAl9ILJaKXBTLI6Wof7A7VcTK9/F4SEZnkdXbfTJO1ez63hrLpY7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xG9iFLsAUVn+vjIrELaAB/RG9auZh0hFtY4+O/oZ2Y=;
 b=cBRA4oaduf79v5Y6ksj89Rc6KcGQWxsbVgFVL+CCG9v8yfdsRPKh5nebNoC7yK3mlwDLrYo0pHkpCvVk3gnD0cH/onunnIp6ZYDiwZbEfoFyE3wQu5pP3TjGZsNyqCXGh52uawNVh3OgA31fM6ovuWY7mL0FBwg8Xz81+EU3Y3DT0LIvOr0dt58/HffWvKAsrFSr+bDCg/pITRg86l5VRc6bDtosASpqDfxvykirhvaFZtJoZDXm5PdMcfvqwCbmB+yLEraU6Z2EnURavGxobH1/f39+6KOsl+HDliT8n/t04GiZqQRtoStf7KeIirTsizgFlzqwyJZgDwk/ivNbZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xG9iFLsAUVn+vjIrELaAB/RG9auZh0hFtY4+O/oZ2Y=;
 b=UWa+wGcpg5cRc0d+g33NW1a1dZ9/wjGAoIEeN6bYj4wmrkIoLD+D+CBM5OWklzrnmimF//wAgpv71tVkQypLSpP9TJ22mQareAsVv3DuKODb3qG9oV05r7wgR+tPwuCayKX05i59+2QCN4svdcE45MB3ilvSA8JY9j3Lf8aIxYY=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by SA5PPF0EB7D076B.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 29 Jul
 2025 17:32:31 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 17:32:31 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "xorg@lists.x.org"
 <xorg@lists.x.org>, "Limonciello, Mario" <Mario.Limonciello@amd.com>, amd-gfx
 list <amd-gfx@lists.freedesktop.org>, Shashank Sharma
 <contactshashanksharma@gmail.com>
Subject: [ANNOUNCE] xf86-video-amdgpu 25.0.0
Thread-Topic: [ANNOUNCE] xf86-video-amdgpu 25.0.0
Thread-Index: AQHcAK5XNA+pPtQag0Ou4yjIL3aZ9bRJW4kw
Date: Tue, 29 Jul 2025 17:32:31 +0000
Message-ID: <MW4PR12MB5667B1E738F6EEA3BFEC3C1DF225A@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <20250729172901.681337-1-contactshashanksharma@gmail.com>
In-Reply-To: <20250729172901.681337-1-contactshashanksharma@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-29T17:32:30.8050000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|SA5PPF0EB7D076B:EE_
x-ms-office365-filtering-correlation-id: ab0143ad-5639-4469-cd0d-08ddcec5e5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|8096899003|13003099007|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?rSGrYQlG3gwvgBUEsA0IyLwegnrjh3mRQQv5yb+Ee9eMrIx4CDKiKuRh?=
 =?Windows-1252?Q?RVkeW00S8NDn9QR+BPmjpo/hjtUOWsrXW/Xi4jiYMWw+GDcv9pupH2V7?=
 =?Windows-1252?Q?fxOYe6sR0k9sXbG49sww3xY8VVEZbaz1B7/B38G77NdsMY4Xd43fnMpV?=
 =?Windows-1252?Q?spuMQVyxIXnXICqdnAOJAabDBMqRX7BsF1OAgo1/ZqhdPE19xX9RU6P7?=
 =?Windows-1252?Q?4+74yqsJIgK/NfN9cdzDkLdjguazf4OEKuGw1sNv6OP/RZsKcN9UuzmI?=
 =?Windows-1252?Q?y4kj1FfP5UMqMKk5fAcleSbzDL0h8NR+QSpbwIpQGM/hP4L2GJk/hLWK?=
 =?Windows-1252?Q?JVx6MNC7yy7UlTMiF/ne//EIfXDMWMrOWzZ6xTsKXR4HA2KivaoGKJGI?=
 =?Windows-1252?Q?tr1agHewe3skdK7mNwvTYzg7keEavESU/sp8Tc4woIR1UETzofmYnkZJ?=
 =?Windows-1252?Q?/kXCUeOtxuqdgBd7s6mgBT8DwnYbAB+fgmU26DCYJIIyR2IOB9quqBYC?=
 =?Windows-1252?Q?gDTpgs3ArIFv2KySt+XQ5OYGY8VXE/y/NWcdrpDJ9fdbTWvRrq6hvFOr?=
 =?Windows-1252?Q?QRk2BtN2KA30WxsVFjwhlnGiglujLpw4rIzm8DsCE0bJF9DBzKb8fuV9?=
 =?Windows-1252?Q?xPORltvXXImvDtE5k3rnDwTxb5dgT8JzAjVxOMaA8f7PI07PEQRPGASD?=
 =?Windows-1252?Q?1cB8xOY4WIChXyphiQy3tb97/EiCSgtXDBQt3tz4MdWMQD3Yj1VEAUfM?=
 =?Windows-1252?Q?xQqXSxYEYGKTHQgP7Ew/Js1gCKeak6wf0Yi9fspL1DANWdk+VRQx2RJF?=
 =?Windows-1252?Q?j/2DOOOX2JZlfTTUrmzHL8jmSs5URlhtmHwINnPvWSTjPAav0FaP9wMJ?=
 =?Windows-1252?Q?AW6gCD8tJCmeacw+KcVVIJFH5n8sZOh3VB3XoIVGwVkT3PAFLOmaX/U6?=
 =?Windows-1252?Q?/MYb/Io0lXkChw2IqGN477MLwMDgW5SgjxfPaxpABK1uTqPKtUYJiNfi?=
 =?Windows-1252?Q?3Tp91bMr6TXS9/CCLUiNj6j5bUx3uiIHgmljZHcqZTkAmHUGHJ3GA/ix?=
 =?Windows-1252?Q?2crDj2GEjZAaVW6mVJtRcHBnO2cLojBKPu7hFsZuGJoFV0g8N5/WFPTx?=
 =?Windows-1252?Q?/fk3xcNz4SLlbVCmJXwj3seOEvfS+vJv5yqgSgp4OFlhg16vLRWmCwSz?=
 =?Windows-1252?Q?Nca5aRDHlKSuD45yweWBwYDqnoUtHJcS4eHf8BzKS3+GFlLk+PChwPHK?=
 =?Windows-1252?Q?/hCh3tvSMDtvA0MZ5X+lMsGHhDB0upMpeGlD3wJ+kKXZI1KC0frIbeXe?=
 =?Windows-1252?Q?4SgwdJD4vOYqkEWLntK02lQBcc0IyRZ/BIkZxpZ0kxk37zNkRVuXf81N?=
 =?Windows-1252?Q?nI6YGkbLOrAO1FPDAdV6FeeGB15iTrq4ln6L0exAAwks218DyGMRe4Nq?=
 =?Windows-1252?Q?cEPfAE6ttRwSz3oSEspREtZXbT56x+GtSvCDFWw4b6PnRyoiH5nHCGsA?=
 =?Windows-1252?Q?jphRBq4FqgsGFIB7Xo3nHQ6/+IlnP2PqPC0lRxI31k2yqWwvIcQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?1xmsznNVyyjCwjGmI6a2l6mICsqc722z6wydJB8J+qbI8T2f8ZwWBi3U?=
 =?Windows-1252?Q?Slh+7ljeIaCnyValCERpv2djDStI+ySgp5bHavI51PBjAEwkAgHp2cNq?=
 =?Windows-1252?Q?+j+r/xNInJ0wSjvCdKpakZ9viSR5dNDTYUMAd9cbQGvTFQWKK5/7rst/?=
 =?Windows-1252?Q?0Wfzzl9CfpMTgzttAFgnbSV2xhOefcwEknCX4BNH1SQ56Tgs2u8HJxyz?=
 =?Windows-1252?Q?V35wzFL2OoDaB9Gp8UqBg6PetYMNCYJ51iJV+X5P3mYIABL1LKfKHixj?=
 =?Windows-1252?Q?PGQ1Od1UTlVZ2j4tZGDf6gAZmQNStfUr3kwYIh6bvUlgBlbIO4z9Su1X?=
 =?Windows-1252?Q?6xqTtaCh6MBOITIMTVNBZ17XfSFAN7Ak7XPywFq1u46EpPD7/eiecL8U?=
 =?Windows-1252?Q?Q3kOYXi99/0+o7Eu7OhjYQW2VvUCKo+A/bS7ppD5eCUjdXx+Ng6J3dqj?=
 =?Windows-1252?Q?wyuWfVXHnxtg6DLAuUWcjNNo3HH9iJAUfF553Zi2HeB8xWFDBKyszyOC?=
 =?Windows-1252?Q?gmqlFpphfsrno97XGIj1hjj0a8ewljjt2rHmG6lWvWPv/7J9OauuZ18P?=
 =?Windows-1252?Q?yVM+CKdtU98NU+fS4z45xxaAQFbLSPaJvAdmOzhDMQcgPqmDEZQNlulP?=
 =?Windows-1252?Q?1WyOlUxtbbec73n2L5UaIbaQ0GyuwQg6PPGvsCEHF3iPMMdUK0qtPhoB?=
 =?Windows-1252?Q?U+6GNlQ28ywZfZa5rfDhSlt/jUNH3i1kTW7t+vHPvBo/V8Ui/CgH1HrT?=
 =?Windows-1252?Q?Ety93EKs0zmkE8lrE2s9BpymeapJNdtQ0X4jlmdB8tZzkI8LYofyOrnA?=
 =?Windows-1252?Q?SVKaI9Zn3zE+z8Ej3W7O568VJoIC8Ub27uBgmvoldSCj078FFLa0bK9H?=
 =?Windows-1252?Q?it4OKdjA4F792nkWM7INhWw6INLAA7P9UARARKsKlRHaRdqZWaA88xNf?=
 =?Windows-1252?Q?UUWP+rGx46+FCAi3AaKlsGV8Q7ZcNz2JKGvGykIg3nOskX8AzrfE2Bco?=
 =?Windows-1252?Q?kNogrO34bUf9vQwxvpuYPiMb5EBW9ifRgYbBDAeSOYuj0mCHZPEOgVKU?=
 =?Windows-1252?Q?+Nx37YY/mBDstuEQyduymq4OWEOJku2l7A3C3jxqlW5XpyZnctOqO6Kr?=
 =?Windows-1252?Q?3egOxSVRM8oq6VYKHoyAWf91PHTN6miiauK2zZs8QjqJemFvkDCFwgwy?=
 =?Windows-1252?Q?AuLz93CRjxPGcHuYR+lT9cjxOH92kMQX3Hp0qzwX8COYmCQjlHshRpHa?=
 =?Windows-1252?Q?SDtfOJqtjbmc+tT9OP5BCk2dFKAc0PhbuuywmmflWwA7xphs4Y8eW2bA?=
 =?Windows-1252?Q?eXrFMtz7CExd5syxS26EoIDBLALYAPRUTBDR44qfsQeZWXxcWmux2QY5?=
 =?Windows-1252?Q?wwKmLMmjezCm4VDvSox3OpAmO1zCI7PMb2Krra/VQ6K5mK8zb/J47x/1?=
 =?Windows-1252?Q?t3T0wxMB59fufAmslaJxGf+dEWqj93xqWC/qAC6WoHy7uyqGV4NmTU1O?=
 =?Windows-1252?Q?7sxqSRO6XaKioueXH1aYvFXba+KUHbcMtPvFkeDkdT01M75v9tPPuDnh?=
 =?Windows-1252?Q?N8XhgTPx9y8dVFz0KQlDEx6dtJfiQMnJ6IkFKm5pzd247Ciy3wo1HrRY?=
 =?Windows-1252?Q?e/JAo6CvOJw/3x5AdXfHae0PwgxBQChxTUZOGSrCoTPfd06iS1S7iU1F?=
 =?Windows-1252?Q?EHgo9pZLbso=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR12MB5667B1E738F6EEA3BFEC3C1DF225AMW4PR12MB5667namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0143ad-5639-4469-cd0d-08ddcec5e5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 17:32:31.4627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KypESSLBe78td3EJzlq2/nRPwwCNL4MwuVqj3Cys3ih9lWBDdA9+zSuJS/aAyuJ7MVdEecVbTqEDccXiQeLBug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF0EB7D076B
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

--_000_MW4PR12MB5667B1E738F6EEA3BFEC3C1DF225AMW4PR12MB5667namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[Public]

Resending with [ANNOUNCE] in Subject line, for the scripts.

Regards
Shashank
________________________________
From: Shashank Sharma <contactshashanksharma@gmail.com>
Sent: Tuesday, July 29, 2025 7:29 PM
To: xorg-announce@lists.x.org <xorg-announce@lists.x.org>; dri-devel@lists.=
freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; xorg@lists.x.org <xorg@=
lists.x.org>; Sharma, Shashank <Shashank.Sharma@amd.com>; Limonciello, Mari=
o <Mario.Limonciello@amd.com>
Subject:

Subject: [ANNOUNCE] xf86-video-amdgpu 25.0.0
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org

Alan Coopersmith (3):
      gitlab CI: add builds against server-21.1-branch
      Revert "use dixDestroyPixmap() instead of direct driver call"
      Improve man page formatting

Chris Bainbridge (2):
      Fix segfault on dock suspend, unplug, resume
      Free output_ids

Enrico Weigelt, metux IT consult (8):
      bump minimal xorg version to 1.18
      drop compat with ancient xserver versions
      dont check for HAS_DIRTYTRACKING_ROTATION: it's always enabled.
      dont use obsolete pict_f_transform alias anymore
      use XNFalloc() instead of xnfalloc
      use XNFcallocarray() instead of xnfcalloc macro
      use dixDestroyPixmap() instead of direct driver call
      ci: compactify redundant declarations via matrix

Hamza Mahfooz (1):
      Enable TearFree if it's set to auto and VariableRefresh is enabled

Herman Semenov (1):
      Fixed AMDGPUOptions_KMS for align structures 64bit

Marek Ol=9A=E1k (1):
      Check GFX12 swizzle mode correctly

Mario Limonciello (9):
      Fix a crash when initializing with a property with no atoms
      trivial: Add workflow rules
      Add missing xorg-server.h header
      Add support for the meson build system
      Migrate CI over to meson
      Drop support for autotools build system
      trivial: drop unused gitignore
      trivial: ignore .vscode directory
      Bump version for 25.0.0 release

Pierre-Eric Pelloux-Prayer (3):
      ci: switch from testing to bookworm
      ci: use gfx-ci/ci-deb-repo to get latest libdrm
      Use GBM_BO_USE_FRONT_RENDERING on front_buffer alloc

Uday Kiran Pichika (1):
      Handling of color management properties

git tag: xf86-video-amdgpu-25.0.0

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-25=
.0.0.tar.xz
SHA256: 7653cead024a6820ed1139958503278d78b4b3f80befcacf54ce87a5199b0ce2  x=
f86-video-amdgpu-25.0.0.tar.xz
SHA512: d143294fead7073c14100299ccab20d1f5eab8b7e36c1770b12aaade958211e1961=
f4353dc47123c3b9af9f7a911d913def71d25b83dab3dee1d289043869891  xf86-video-a=
mdgpu-25.0.0.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amd=
gpu-25.0.0.tar.xz.sig

BEGIN PGP SIGNATURE:
iQGzBAEBCgAdFiEE8REeSq+YTJdjeV/+SyW1GAUiuNkFAmiI+vwACgkQSyW1GAUi
uNnZQwv9G2dLy/A44yG8iFfrCKt3i7Pk6A2QT5y7Q9j4xhplVv1F0V+3olYxRV4D
uAbBvEExP/qHEtkGeIruEoXdfQ+lMLjIeyAXCVHP6qxgVHBWKwXzsD96dSkm0F+4
lq5kHtKb8gMiFgpvPh2rNa1wlYUvwse4/wX8EJxkXedVVRcQiC/IdHXl8wAZyNdI
4YwedqEKSejBJfCEP/AyGW5k6vNQ+2nz7F/XKb680A/FyUThlL/RYV5RtVzpL03i
b5z/Cesc4oU9mkJprwannma7z5P2Jo6Mf/k5zmieeo+J9lS7tLxgpClyk8pe/Q5q
telItLqWoF7YAJGLFeHgxhYsymHIOXH7OAZvarzIy1qRVjND54GNoLc43WU+y9sR
4AEZkYhCOWZySvBdJ18t7/pYl03f3Q5SMnumDJV3LkmwTnbex2RtL/C5g3FKSAeD
aa3U5HWUoazd3c5o+eKCQfz+VIKYUGn+c0pPeUl3Nmc/6oRNss0aTEKqXIDlYG/u
9gzaKC99
=3Di6RD
END PGP SIGNATURE

--_000_MW4PR12MB5667B1E738F6EEA3BFEC3C1DF225AMW4PR12MB5667namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Resending with [ANNOUNCE]&nbsp;in Subject line, for the scripts.&nbsp;</div=
>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof"><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Shashank</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Shashank Sharma &lt;contactshashanksharma@gmail.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Tuesday, July 29, 2025 7:29 PM<br>
<b>To:</b>&nbsp;xorg-announce@lists.x.org &lt;xorg-announce@lists.x.org&gt;=
; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<b=
r>
<b>Cc:</b>&nbsp;Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; xorg@=
lists.x.org &lt;xorg@lists.x.org&gt;; Sharma, Shashank &lt;Shashank.Sharma@=
amd.com&gt;; Limonciello, Mario &lt;Mario.Limonciello@amd.com&gt;<br>
<b>Subject:</b> </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Subject: [ANNOUNCE] xf86-video-amdgpu 25.0.=
0<br>
To: xorg-announce@lists.x.org<br>
Cc: xorg@lists.x.org<br>
<br>
Alan Coopersmith (3):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gitlab CI: add builds against server-21.1-br=
anch<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Revert &quot;use dixDestroyPixmap() instead =
of direct driver call&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Improve man page formatting<br>
<br>
Chris Bainbridge (2):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fix segfault on dock suspend, unplug, resume=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Free output_ids<br>
<br>
Enrico Weigelt, metux IT consult (8):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bump minimal xorg version to 1.18<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drop compat with ancient xserver versions<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dont check for HAS_DIRTYTRACKING_ROTATION: i=
t's always enabled.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dont use obsolete pict_f_transform alias any=
more<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use XNFalloc() instead of xnfalloc<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use XNFcallocarray() instead of xnfcalloc ma=
cro<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use dixDestroyPixmap() instead of direct dri=
ver call<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ci: compactify redundant declarations via ma=
trix<br>
<br>
Hamza Mahfooz (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable TearFree if it's set to auto and Vari=
ableRefresh is enabled<br>
<br>
Herman Semenov (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fixed AMDGPUOptions_KMS for align structures=
 64bit<br>
<br>
Marek Ol=9A=E1k (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Check GFX12 swizzle mode correctly<br>
<br>
Mario Limonciello (9):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fix a crash when initializing with a propert=
y with no atoms<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trivial: Add workflow rules<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add missing xorg-server.h header<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add support for the meson build system<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Migrate CI over to meson<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Drop support for autotools build system<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trivial: drop unused gitignore<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trivial: ignore .vscode directory<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bump version for 25.0.0 release<br>
<br>
Pierre-Eric Pelloux-Prayer (3):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ci: switch from testing to bookworm<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ci: use gfx-ci/ci-deb-repo to get latest lib=
drm<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Use GBM_BO_USE_FRONT_RENDERING on front_buff=
er alloc<br>
<br>
Uday Kiran Pichika (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Handling of color management properties<br>
<br>
git tag: xf86-video-amdgpu-25.0.0<br>
<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA0885c08e-785b=
-8d8e-ce96-cf277b40fb74" href=3D"https://xorg.freedesktop.org/archive/indiv=
idual/driver/xf86-video-amdgpu-25.0.0.tar.xz">https://xorg.freedesktop.org/=
archive/individual/driver/xf86-video-amdgpu-25.0.0.tar.xz</a><br>
SHA256: 7653cead024a6820ed1139958503278d78b4b3f80befcacf54ce87a5199b0ce2&nb=
sp; xf86-video-amdgpu-25.0.0.tar.xz<br>
SHA512: d143294fead7073c14100299ccab20d1f5eab8b7e36c1770b12aaade958211e1961=
f4353dc47123c3b9af9f7a911d913def71d25b83dab3dee1d289043869891&nbsp; xf86-vi=
deo-amdgpu-25.0.0.tar.xz<br>
PGP:&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA97=
1bc3bd-8ccf-e970-bdf6-ffc0708007dd" href=3D"https://xorg.freedesktop.org/ar=
chive/individual/driver/xf86-video-amdgpu-25.0.0.tar.xz.sig">
https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-25=
.0.0.tar.xz.sig</a><br>
<br>
BEGIN PGP SIGNATURE:<br>
iQGzBAEBCgAdFiEE8REeSq+YTJdjeV/+SyW1GAUiuNkFAmiI+vwACgkQSyW1GAUi<br>
uNnZQwv9G2dLy/A44yG8iFfrCKt3i7Pk6A2QT5y7Q9j4xhplVv1F0V+3olYxRV4D<br>
uAbBvEExP/qHEtkGeIruEoXdfQ+lMLjIeyAXCVHP6qxgVHBWKwXzsD96dSkm0F+4<br>
lq5kHtKb8gMiFgpvPh2rNa1wlYUvwse4/wX8EJxkXedVVRcQiC/IdHXl8wAZyNdI<br>
4YwedqEKSejBJfCEP/AyGW5k6vNQ+2nz7F/XKb680A/FyUThlL/RYV5RtVzpL03i<br>
b5z/Cesc4oU9mkJprwannma7z5P2Jo6Mf/k5zmieeo+J9lS7tLxgpClyk8pe/Q5q<br>
telItLqWoF7YAJGLFeHgxhYsymHIOXH7OAZvarzIy1qRVjND54GNoLc43WU+y9sR<br>
4AEZkYhCOWZySvBdJ18t7/pYl03f3Q5SMnumDJV3LkmwTnbex2RtL/C5g3FKSAeD<br>
aa3U5HWUoazd3c5o+eKCQfz+VIKYUGn+c0pPeUl3Nmc/6oRNss0aTEKqXIDlYG/u<br>
9gzaKC99<br>
=3Di6RD<br>
END PGP SIGNATURE<br>
</div>
</div>
</body>
</html>

--_000_MW4PR12MB5667B1E738F6EEA3BFEC3C1DF225AMW4PR12MB5667namp_--
