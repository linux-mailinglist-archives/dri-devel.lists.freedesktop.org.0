Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9A356E83
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 16:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB066E91B;
	Wed,  7 Apr 2021 14:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607986E919;
 Wed,  7 Apr 2021 14:27:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+17hILRY97leP35RYzFDpIL0LZRiLWfKbX7kjpAwdvys0V83sUvP9sqBWUyMPJ4/kSQsw8LzUS99fMyaUI43R2wnj8fDKNcQPnGM3fIQbXg3g2DyzgDaw5Gr4im6+B4iWm7ppljGmSS0YlgdxMnrdaT2LvHXS+USMfbPXvrnNLHcAmCcNSM///o3D6mBY2qGzskCpQohNp/1dxtJjACw41SDXShjN4kuFN8MJwPTrzUlICrW1uMha3r5LiWzZIuduib3N8A26csxD7LPdU06GpVD15tFmVObQsao4Bs+2MpHsoNZcvJwS7+HMVUb84HdVrWwYYhhNPUsE+el9Zz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt880XgQr9vZxwpBjNkQJbNaw6NOYjRyuqdt2rxRVOg=;
 b=AAuE+JinHz+vQpw0RULH+vh0w0yztB6fM2EUeeR5TogSxaoEoWHuRE2XhVvYJFg9A6KqEkN5Nkq2BKXhqdEE8wBNGO0qKQCFH2ferYw21kJa2PZ1ilrDZ31AiIFB56Z66eMpzePbn3wFqUEUPZs/jaK5mudb6PAjsi1JTvAERYNVQy0qhBIF+XDuC6hEhxsGUt33ywniDOOVY1nLsuatv+evWoc2FPtihZxw3LBoZ+cGA4nUenRcJ7Ho7VccVdE0V7KnpOCkrPmClEEbNTQEoj5VdJ7SVlcE/MvPR4wzP3pcSNX21Ykbw0qnMqX5iMFhsSD90nfEMj6ohLPKxh5OsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt880XgQr9vZxwpBjNkQJbNaw6NOYjRyuqdt2rxRVOg=;
 b=gcPgM0bTVDdOCr4LZdftMK4rqpDWsXonyQXETGcSaxt/e6U/nPnLAbGEM0tUenWjMZkt5Tj4Pu61H5a48gKP8W0CTFtfbCE0dnGCJSRCVRoKGYFpqjalAKwCumnGJRoWXheEZU5trOuXV23+32uE75pukj/lpw8MHsSV1E6oWDs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1787.namprd12.prod.outlook.com (2603:10b6:3:113::12)
 by DM6PR12MB3659.namprd12.prod.outlook.com (2603:10b6:5:14a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 14:27:28 +0000
Received: from DM5PR12MB1787.namprd12.prod.outlook.com
 ([fe80::576:3b2d:76db:55ab]) by DM5PR12MB1787.namprd12.prod.outlook.com
 ([fe80::576:3b2d:76db:55ab%3]) with mapi id 15.20.3999.034; Wed, 7 Apr 2021
 14:27:28 +0000
From: Leo Liu <leo.liu@amd.com>
To: amd-gfx@lists.freedesktop.org,
	xorg-announce@lists.x.org
Subject: [ANNOUNCE] libdrm 2.4.105
Date: Wed,  7 Apr 2021 10:26:42 -0400
Message-Id: <20210407142642.11485-1-leo.liu@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [2607:9880:2088:19:3506:a896:d853:273e]
X-ClientProxiedBy: BN6PR19CA0051.namprd19.prod.outlook.com
 (2603:10b6:404:e3::13) To DM5PR12MB1787.namprd12.prod.outlook.com
 (2603:10b6:3:113::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-Golemit-RV.hitronhub.home
 (2607:9880:2088:19:3506:a896:d853:273e) by
 BN6PR19CA0051.namprd19.prod.outlook.com (2603:10b6:404:e3::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 14:27:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313ba628-6695-4e2e-62c6-08d8f9d1453a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3659:
X-Microsoft-Antispam-PRVS: <DM6PR12MB365907681FDE7210F71697B0E5759@DM6PR12MB3659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ac5JcKHstrOTYk7CSB5QU4uHvKZ6A+dJ/6VWIZJIJn5uc/5p/rfulhXTZlOiBwvFDSnsYe1ISlLZ1/4u2mtW7xXZNClc7rSFy2zv5okhtuU3Li10mKB3bjIp5Dfrlzqoq+RiRMMupjMba3MHxoZ1USuI/8EMSYABnW9P7Vzgk7jlVCMQQSeUu84jWeX3EDAwsu34TQ4nBsHqTvKcNhX3UynSa7iVBBtfIfX5YY/tGBmI12ZbBIzyQasLxFTi5dN4HkXUyxN21JWZZBobMPiV/GVgwghcWdDw2XQPVONkTFbKXoYIzzSLluNZhSH3xgZO3LyF3SX8swtPzbiRSvzJaRu26H2oeHR/WRDXhdW3XwBzKrbx46JOLU4BRX5dcwcCvjO+ph+jEHWEK10Xy59l+7GDRqe3K+vQWnIzvP20Zn1d0VTqjsvMzkVN8PjWOcs07K2NDzgYE4XolJ2hxZFuffQqpfb5Eyle5b8F/tKwr8bx7QM50JNNL1v0d8HjAuoKZjzS4Bef2nDncz/9wNz4PdLq2iFHMCjBI7qNINtKDIvpm4fWiA4RLH3enVxVevbid4PrSCiojIpPy4dKz3xiXBIHpzp0cnMPLpjhDw8/+2AuoEp4Z6+778W20HI0VrL2bscMT3SNwqesT0CI5UNZ7D3pDaV+JSL7jOLWWs8eeqPFs026nxbmVutv2BCUv0sAfcLzmFxdF5d0XxBv1N/Hww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1787.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(66946007)(8936002)(6486002)(44832011)(4326008)(86362001)(36756003)(5660300002)(316002)(66556008)(2616005)(1076003)(966005)(66476007)(186003)(478600001)(2906002)(6666004)(16526019)(38100700001)(52116002)(8676002)(6506007)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EnBx8Lkk1KLUgKpB/c2E8MfL19yxUspWwPjNFjYgdXkcUU0SUXSKa3rNmFES?=
 =?us-ascii?Q?snjUQakgkBdfH98ZGpbWiNSIpvG9tfmF0zci6CNnEPfCkv3Sf7V17sI+xLE/?=
 =?us-ascii?Q?BmVRWyuXicvdQ3KZhtmXgsY3EhGjejSkmQcYldLUclqyRRQ5EPF8mp9+AT6g?=
 =?us-ascii?Q?2ng/sanF+s2S+jG7oHVaryUBueJ9OjKipTu7Rmrp9QMrDXQhFgaY3h9VBFVj?=
 =?us-ascii?Q?/qRiZoORmQnNphHl9qx8wj5ZsJWcN+pprbzBl5So3rHjBZ4A2u1Cz9az0+2y?=
 =?us-ascii?Q?pT5LoQDn3JMkekS4WXdKFuoJFIqohSBUVTG3OAq8ZjBa3fvvSlAgmyMeMPyK?=
 =?us-ascii?Q?H4teO2tuUqDkqCuTNaTGw01aKLZL8cU06j0E9ZeXBW70rZesfjIsgqt4DDeU?=
 =?us-ascii?Q?b1rjiUnIbJnovjHD7IH+tg/yQLcUe+OywXL5Ka+K9JII0yp8Dp+HVmrGXGuy?=
 =?us-ascii?Q?qGl/rR3QoYiZNT6fBfqoK6WKwzuLfGlP01aD6zq1vy89NU0XOHmIBkQmLU03?=
 =?us-ascii?Q?znG9oNRyiIum3sgljLIMkCrlQRuzWhHwz/CvTBsOmI4auV9mL4MTl6TMLtm4?=
 =?us-ascii?Q?f3zSQLVSMu8cs+7lC+kV21xXUf6OueHeevKHTQp4tdrtQL8UjfzVF8mqdhmG?=
 =?us-ascii?Q?aJY+ylhJuDy+mWrLvLMc/MnAI+7Cu6Z8wlhk18HFwztrECcrlE4fmKLjksfq?=
 =?us-ascii?Q?lwjsOTavFd/Mp3UaK2IPQ44gMaKDPU4x0ZWv0iKw5Y7XfBFzHCEQFowed+Yx?=
 =?us-ascii?Q?OiLFO9BQJRGFjow2cUG/qTXh/IY524F9V4kchumW/aHUFRgqOlR3RIfrueWb?=
 =?us-ascii?Q?bt+2cui+AZpGT7aA4CsC/AsvCb6IOPpComYB8ygkz7wAmJTFD3dWKg1S4AkD?=
 =?us-ascii?Q?5aog3Py8UsN76s42tZb8iI7ox5kmRqnLz+dKzOvI27NCyJgA4MoUhi5y8ayd?=
 =?us-ascii?Q?QKIMq0q6uhXsCC2azwVKPTfGgISpp4Zf2aP6IVfZkvQ5qIWzI2A0V5kShXI2?=
 =?us-ascii?Q?vFHq1xECx5QoR70HszEiKbw3RlXpF3m5fRrTEfHRoXwtvaLsKRNfXpfHGCT+?=
 =?us-ascii?Q?Sh6wP4F4YHZ48tXCGDqVk0oCqamzBHbrDr/qHHgQ1bvZoQIKRjGRCAma+zn4?=
 =?us-ascii?Q?nlvr8zhAozSXSZGIMivkFslu2CrqzitUAsjrcxpqdbYy9ddv25G/mkVR051z?=
 =?us-ascii?Q?I2tk3kf0C0kMIfvfoC+8WVrHbtaYTuely3zmwaNXZpPuXMMwzsBazAuynULb?=
 =?us-ascii?Q?WAbXHlxbl3d0OI4XJ5rcvjPLXPU2pAxlUbsJjegcdM5b3i3ENuygQCfP3enn?=
 =?us-ascii?Q?ry0FuT454br0bn7fYA0Cf7SrvOt4NooMwgOx8ZVT3TtOLKuycwYlgAaOTU/0?=
 =?us-ascii?Q?TL63GsVxI/dxJ7RKMPyXliNZneoI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313ba628-6695-4e2e-62c6-08d8f9d1453a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 14:27:28.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEfJdnqJUFLt1/GfzXc8Snnp1FjhkS6AoLZ9g0NqKPkJmjHGHqFDZA++tLKbdPaD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3659
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher (1):
      amdgpu: update marketing names

Alistair Delva (1):
      xf86drm: fix null pointer deref in drmGetBufInfo

Ashutosh Dixit (1):
      intel: Keep libdrm working without pread/pwrite ioctls

Emil Velikov (3):
      xf86drm: cap number of reported devices by drmGetDevice(2)
      Revert "xf86drm: cap number of reported devices by drmGetDevice(2)"
      xf86drm: cap number of reported devices by drmGetDevice(2)

Fabio Estevam (1):
      tests/util: Add mxsfb-drm driver

Fang Tan (1):
      meson: use library() instead of shared_library().

Heiko Becker (1):
      meson: Also search for rst2man.py

James Zhu (1):
      tests/amdgpu: add vcn test support for dimgrey_cavefish

Jinzhou Su (1):
      test/amdgpu: remove static varible in Syncobj test

Lang Yu (2):
      drm/tests/amdgpu: fix Metadata test failed issue
      tests/amdgpu: fix bo eviction test issue

Leo Liu (4):
      amdgpu_drm: sync up with the latest amdgpu_drm.h based on drm-next (https://cgit.freedesktop.org/drm/drm)
      amdgpu: sync up amdgpu_drm.h with latest from kernel
      amdgpu: add function of INFO ioctl for querying video caps
      Bump version to 2.4.105

Simon Ser (4):
      xf86drmMode: add drmIsKMS
      xf86drm: warn about GEM handle reference counting
      xf86drmMode: introduce drmModeGetPropertyType
      xf86drmMode: set FB_MODIFIERS flag when modifiers are supplied

Sonny Jiang (1):
      tests/amdgpu/vcn: clean abundant codes

Tao Zhou (1):
      tests/amdgpu: add vcn test support for navy_flounder

Tejas Upadhyay (3):
      intel: sync i915_pciids.h with kernel
      intel: add INTEL_ADLS_IDS to the pciids list
      intel: Add support for JSL

Valentin Churavy (1):
      Use dep_rt in amdgpu/meson.build

Victor Hugo Vianna Silva (1):
      Avoid some compiler errors for tests/util/pattern.c

git tag: libdrm-2.4.105

https://dri.freedesktop.org/libdrm/libdrm-2.4.105.tar.xz
SHA256: 1d1d024b7cadc63e2b59cddaca94f78864940ab440843841113fbac6afaf2a46  libdrm-2.4.105.tar.xz
SHA512: 083a04af7208e58be21b89c6ebdbe2db3ba00cd29f0d271bd38bfe97dfca741edafddaaf9b5b95c20fac2c9b700434ea5b21397de26f7073169ad6f5b090f715  libdrm-2.4.105.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.105.tar.xz.sig

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
