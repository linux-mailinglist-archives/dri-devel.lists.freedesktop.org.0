Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8C4953E8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1CE10E395;
	Thu, 20 Jan 2022 18:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AEE10E395;
 Thu, 20 Jan 2022 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642702431; x=1674238431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SfGia7oc/GRxpGH0pqXek8FoGYlB/NJ+ZQc9Jp/Vsx4=;
 b=AZjo34fgM8cqZX/D6T9Zm36VUm1H5EP8is8mapOKIN8PspHbAzpOguob
 JwFhJkA68MbtAGDp02eVV96zGOSluZY+YlPDnQk52xx4nv+LJruVRQ0sO
 okhhBGWpDlpWXcZY+OZ5O6ifz5C4AT/Kwnq1UtNDLgcnLPSTuTreolFtX
 bks61Jz8Rh8LgpLfem2fG5xblO7DvhXYFTFQkeCCqhoRRVUNVZ1mHc3pc
 P5ElSwnLGf4Cr7vLfRoTRay5FRd/fT37lowWEhlObBW7Ygi9VusrBJntC
 81uFKBLYFFMY9UESS1sgia/LGA3QP7VjiajqUUzLfmcPMhLn25Hy3uAQL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244239762"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="244239762"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672637819"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2022 10:13:50 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 10:13:49 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 10:13:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 10:13:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 10:13:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRun4gW0J76K5qsinQRDd/lUbhRWy1Qs9+fmiuXBA4UEvNcM/Ru4ozRBfARnKLQsdCuep/Qh4CLdyBq5bxvDuIxNnRf+vXJWi2oxP2vjsRAuAtJBR8n7J00i0AiUcz+VbV5feCKSfcxuq5Yq+DKOSqJajghqoeMF1bA52qQjBfP/ct0dQICBwbYBogEH+fNQ2EdL2RH2bJpjEIn6szXgh655iKnr45CdCIFwNmY2mb8U5VGmJs36LOb6N+pND3Z2FCiKP2oxHwkQ7eAW5X2WfoWvPYENPsfIMwBC4BJS+IpBZRa2kJxsLUPjIHc/tlVEXkb04RJT66QE6TpTIC/f+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzM0vh5e7SqrK41LztbwWUZCoxHnYfU+wSWEhbNF8sE=;
 b=Z+SLgr3dvi7o4ZyH2j5AFXteddTWPjvOCR94G15MCN3PnV99XHv3bINfdE91Pi/WDOVMObV3hFvY6lnh62qScGlbH7GPQa6qCmAAKW6me7ArKo6FVGQCYLUz08QdCg9f8xS4RrDMC5w4xtiGrKUbpZrLTrfjvs9djQqffmhuq6IqFz/b4CSLIqz82XaAERTSUgdo4vAzzDW+tFmnVYI5T5DOis0g3pqI9N6vU64H2dTkPavMElFvPFz9fkvaKKnubGj8Mq+MJW5lZxeDQ6jkFQFO72bKFWk0toVhjhF+xo3OTs+SU6pVp2seyXc3AY+GdRsmBHKm0bYUOYAuIqK0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3786.namprd11.prod.outlook.com (2603:10b6:5:142::33)
 by MN2PR11MB3917.namprd11.prod.outlook.com (2603:10b6:208:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 18:13:47 +0000
Received: from DM6PR11MB3786.namprd11.prod.outlook.com
 ([fe80::1456:4aad:3dcc:79fe]) by DM6PR11MB3786.namprd11.prod.outlook.com
 ([fe80::1456:4aad:3dcc:79fe%4]) with mapi id 15.20.4909.012; Thu, 20 Jan 2022
 18:13:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/wopcm: Handle pre-programmed WOPCM registers
Thread-Topic: [PATCH] drm/i915/wopcm: Handle pre-programmed WOPCM registers
Thread-Index: AQHYCX3iIhQeg0fpy0O6yh4FuytWWaxsPZSw
Date: Thu, 20 Jan 2022 18:13:47 +0000
Message-ID: <DM6PR11MB37860211234A897A2EA06F218A5A9@DM6PR11MB3786.namprd11.prod.outlook.com>
References: <20220114193315.3271408-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220114193315.3271408-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e5229a4-6cec-4551-b2f1-08d9dc409a59
x-ms-traffictypediagnostic: MN2PR11MB3917:EE_
x-microsoft-antispam-prvs: <MN2PR11MB39177E19D9FF356639CEFB048A5A9@MN2PR11MB3917.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJs/vxpBDAz+qDDQWrZbTeFcUYpw3OjOc/8zw5SDx1XqaILdGxR5Vo90xRFOvroDqPrhE0sg/60qC7Ne4piwrFxkIRdKUPVPVJ+rdMUx2Q0QChNdIYgYXGRyToQQnMrkakCwFxfVVvfToMPUOCKeKtCTMKUo7iL6ZJsRfWgsGCyQ/8ru3U4PCZ/KiAOoKb4ddMWM9j6/1CyzqY34N50CAGKVcAZWmzHZ0Qavtr4rIMnUjkFeznd/LmmtqmJS20dDpJAZQe3ywR8SWkb/L0aR6kjWe5BWgG9W5/lRRnLmNtE+NX2XY+JpU/AJCVGJMPwSWcRUXT8P9Bdq8fa5Rlxx95nST/Ouhc+KFrZAh/loCFIBl1gFUYqQdCzonyNHNw1SPFN1naLMlqyxOL1VzUvdcBIpZ7+zREtz5BZmeUJ/pg5z59fSrqj1pXebSVLx5ubf92qwwSoZrxZYsh4uVRfunX6J4IKjsdY/pLAZU6lRzbb4LBezAMDafg+oXAsMY9IW1U+957aZMOxoonDffWPglPDsNVCcPGQKQV29wnnlxWQvEjtH4LSlxiCTOMfQzcmj6fnLPHSPmmdE07bnOfAnGb7hueujQaxSBcZxZig02YAccPxwaum6NMZWNRvFbZv893gseZAoZB/BfMwDlBWVMOK9DXM6SP6RAKbL3nkVLb0ctvYRiNPXeheizlTsnJ6M80HbDdWh/OY9WpLoiKP1rw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3786.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66556008)(64756008)(66946007)(38070700005)(508600001)(38100700002)(66446008)(6506007)(450100002)(26005)(54906003)(52536014)(4326008)(5660300002)(8936002)(76116006)(316002)(110136005)(33656002)(122000001)(2906002)(55016003)(86362001)(7696005)(186003)(71200400001)(53546011)(9686003)(82960400001)(83380400001)(8676002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+V+snIeTtmku0TXmbX14QU+4Z+LgpKQFfJBe95O74fdpWe3l8iPS3CEEQ5pZ?=
 =?us-ascii?Q?JP3VrWOuacaFjMTOLVt9ie5Ezq3/B65O0cfZNi/isccHQOx6LJj0bBy94sdm?=
 =?us-ascii?Q?2msRx5r+I/2hCjt6RfZW61gsH20F8UVv4aJc+l2SQW8gBFer2siuTRsHY4dF?=
 =?us-ascii?Q?56+2wGKj+OoZPecYpeMY2Y648ZuoFPwcDirqqzPspY6Y0OyINsQoThAEbS2m?=
 =?us-ascii?Q?hYRavo7N6EUL5ricdgkF9dV3T95BFbob7KsCGfLb3MT+Y/o9sv6le6ux5vVD?=
 =?us-ascii?Q?X7Bu9A6wqRmZIE5ULIuDatHRSl7ZOxj62l03bWPS7pprbHI7hJYagAvBBbKp?=
 =?us-ascii?Q?eRYbxyBuj3qjhwmTCKyWSkGsRZmqw4vt7NMJKSLkCJIRTVziXgPoU+cc4/HL?=
 =?us-ascii?Q?PI26IOk3GefD6PKF4TDbElrqfnkAqr92z2MNTtZiXOi7JnqhwgAcOP0NqzG2?=
 =?us-ascii?Q?Jb7ZtaRe9z521JvrcmV0GKmBR7rS6Eyqfk56pCm9bU0+Loffgiaf+WlWHrVH?=
 =?us-ascii?Q?wo3iAWyjYTcOGMVU2tRSiWn7G396A6ZEuGUkvSr+VoqF5ImGrtuie+UG/SeQ?=
 =?us-ascii?Q?oiiobJ00ITVuzL6ZwIfB4oG7o97yIzVFWjmyq2+uAAy0zR6WASJpFxtIe93N?=
 =?us-ascii?Q?BFdvHJAS25GPDvLW7GVPhDxEpwrTFLTGQa6f+l6r6fOh0fClszbdFegWN0jL?=
 =?us-ascii?Q?wZ0SASJbiEfl8VHmLGHK2FMHIrhnhN014/m09xPPDUQcVTBKjuR+K3j3bg8t?=
 =?us-ascii?Q?12pEGzkYKy5IsCBMyKxwhKSLWf1PbyJjmuyhDkfQlTzTgeN3yKIsZcvw5Fy0?=
 =?us-ascii?Q?wx4zHmbw27zAmKRBmcU/Q0l/NAg4SMX+IZJ9yIH2uq5gcNzhtu0s2BnHE7tW?=
 =?us-ascii?Q?G38HAU9WntwBTwf/pWwlbv+uwHZKTMKoyOohWcFvM/xftxEdhBxBaE0svKzJ?=
 =?us-ascii?Q?zTzjEsMuHTAZDSpaZb06OfKTnlk9/Q6hxgOr/f0VtvtcAlo79FsClx8vg/mZ?=
 =?us-ascii?Q?G3NajogPY+9u8joflsQfnymWnTIDu3rqdTDWY0zbIzAW0Y98+pUMr7C6FCry?=
 =?us-ascii?Q?Y527Bxn7hj/dIkp9ohRMkfeTd8yG8VNhOAf6D5hehel+tX0/SpT0wgOAQwXa?=
 =?us-ascii?Q?QZOh6BCAHwe2e+9h2zXnnd5uFC20nMQeE0S2LKbQNyfDbie22mtlC8Q7cYGf?=
 =?us-ascii?Q?D4SknGVZu7udIFfQYo1IlIh2AZ5REEQseWbhQkPCszfpggrjISjFq+GTfcUi?=
 =?us-ascii?Q?ZXX37m01xG9uLxec34FhHmOScqBN/om5Y8TnS32wwPLY9Jj4oiQGVWRMEFEi?=
 =?us-ascii?Q?uhOdNuT4EqeVtJdjGKyOMxXCnCL/kyr20JQSpPt6YhLuaViR1KUiuzKkTWUL?=
 =?us-ascii?Q?Y+kbIJ4+Aay8RAwPrOvrwIrZHk70wDwQANHjIikf8na8dnn9gUycK7xRx1vK?=
 =?us-ascii?Q?6G1SJoSNX+Ra7x40fgCg8yQcnsg+/mAFLthJA7obU8+lruJ1agH7NMHcmLMB?=
 =?us-ascii?Q?CdT1Ovr2cf9aynlAI+1qH61MhxOlwehFry4cAnmJ6mp9OH4oQM8H1Ib6V+Mg?=
 =?us-ascii?Q?yNyHL0nmnMosU4HSyYhHxQKATI0u1PPaFux+IhgSp8E6jd7f0IJEeD4e54rz?=
 =?us-ascii?Q?KgYWn+9x6ZYkmKEXbEpMA5kmodIs9c7BRJPua4umcO4Wbcbp2lof+fOgmBCs?=
 =?us-ascii?Q?GL/ul6xVYJJnFSmiTAyPMl2c0EMejdku+Y8hCfbg+obWN3j8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5229a4-6cec-4551-b2f1-08d9dc409a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 18:13:47.3973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxBJUTtGkqVQy7U68RYiELlE7EHieKt0xHK6vku6Qy6Q7Rd3Nzc4QbqzWXYCHU2CG+OgZbW9fMYdvMdmgoig+1Q9m6MW6mxoOADNTM4bK2f6Yxnsm2QAAkpm3UkwFXZ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3917
X-OriginatorOrg: intel.com
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just one nit below, (assuming that igt CI failure isnt related - kms flip n=
ot completing)
Reviewed-by Alan Previn <alan.previn.teres.alexis@intel.com>

-----Original Message-----
From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>=20
Sent: Friday, January 14, 2022 11:33 AM
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org; Ceraolo Spurio, Daniele <daniele.cerao=
lospurio@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Harrison, =
John C <john.c.harrison@intel.com>; Teres Alexis, Alan Previn <alan.previn.=
teres.alexis@intel.com>
Subject: [PATCH] drm/i915/wopcm: Handle pre-programmed WOPCM registers

Starting from DG2, some of the programming previously done by i915 and the =
GuC has been moved to the GSC and the relevant registers are no longer writ=
able by either CPU or GuC. This is also referred to as GuC deprivilege.
On the i915 side, this affects the WOPCM registers: these are no longer pro=
grammed by the driver and we do instead expect to find them already set. Th=
is can lead to verification failures because in i915 we cheat a bit with th=
e WOPCM size defines, to keep the code common across platforms, by sometime=
s using a smaller WOPCM size that the actual HW support (which isn't a prob=
lem because the extra size is not needed if the FW fits in the smaller chun=
k), while the pre-programmed values can use the actual size.
Given tha the new programming entity is trusted, relax the amount of the ch=
ecks done on the pre-programmed values by not limiting the max programmed s=
ize. In the extremely unlikely scenario that the registers have been mispro=
grammed, we will still fail later at DMA time.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  3 ++
 drivers/gpu/drm/i915/i915_drv.h            |  3 ++
 drivers/gpu/drm/i915/i915_pci.c            |  1 +
 drivers/gpu/drm/i915/intel_device_info.c   |  8 +++++
 drivers/gpu/drm/i915/intel_device_info.h   |  1 +
 drivers/gpu/drm/i915/intel_wopcm.c         | 42 ++++++++++++++++++----
 6 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i91=
5/intel_device_info.c
index 93b251b25aba..88aad892a0fc 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -394,6 +394,14 @@ void intel_device_info_runtime_init(struct drm_i915_pr=
ivate *dev_priv)
 		memset(runtime->num_sprites, 0, sizeof(runtime->num_sprites));
 		memset(runtime->num_scalers, 0, sizeof(runtime->num_scalers));
 	}
+
+	/*
+	 * Early DG2 steppings don't have the GuC depriv feature. We can't
+	 * rely on the fuse on those platforms because the meaning of the fuse
+	 * bit is inverted on platforms that do have the feature.
+	 */
+	if (IS_DG2_GRAPHICS_STEP(dev_priv, G10, STEP_A0, STEP_A1))
+		info->has_guc_deprivilege =3D 0;

Nit: not sure if it matters if this stepping is not-public (although I am n=
ot 100% sure I am correct in my assumption this is not-public).
 }
