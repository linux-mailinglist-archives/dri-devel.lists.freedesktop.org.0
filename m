Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BC5AE9FE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D5610E5B3;
	Tue,  6 Sep 2022 13:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B14610E5B3;
 Tue,  6 Sep 2022 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662471558; x=1694007558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YAHABL3kQ1VmVWagX/1Dxa4l2TjLWm34VrwwLjb5SzI=;
 b=N19ciuL69yQ1GMbq2lDIOQCOHSzp7JPFZY8tj8j8dibW6QZE3dOxUggd
 vm9iwE8LrvssXe8k/4WlPbAKOA/JRurjxWeuPcqGJgQQgBBLNxu2iu6Wg
 661eyTMHQZkWwLEEMw518fLkyfoUcauxZ8SvJfMnUJ0Uc6ok3xmLWrnb/
 KgEOgv/wU8z2S9klOX4GLGDMZrBOaunA9zQ6gn6aPOMVDHJS1rqAp6Afa
 Pw9zJqe8O1RJmIc6upUBpsfLhyn3SUCEGb+3JE17qD9w07+NlFYLXzTEL
 rm4fe7DtTKoeH183KYIF/j0p4t9LLfhBsctZ4Gp8QSWBZNtQD+Idi9BQH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="279608023"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="279608023"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 06:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="739903131"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 06 Sep 2022 06:39:17 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 06:39:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 06:39:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 06:39:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 06:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV8bweB14cf5pw1XWTYRzK1i7i3SeLnmijbql4pk8X5YVV9FU5CYT9R9LM0fGSs4IS7X01AkrYMKNCLQEuuR+6q2ecWbE2lwwqB3kk5au5U0aPpUxRgGyaaSXcSRYo4jpNdb4Bb0R7gu83ymcb5FVPhFTj8xkyRCwyiyyxBIdZeaBApGW1NT+wZ/Ei/uQsYFv7aaKJroUKOkYrWukYvPKdyYiN5wdeL9/GXutIeIfx9rJi0l0f7uHFOGz6PIW4D3KBLMTkFiIyh69Bi9wc+hArdsl6bhU+rVQnlMH5+fqXYY/6pD70dvoCEIvDLdG8ZCV1kuKZUkL1xwtH2VbunKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlW/HGg/Ub7gkNgKB9FWz+7i03FQIGQtiwGxzcpQq90=;
 b=g0p63BHiHxvLlkk7EMYsibtUk2KYFqbYAyu45StR6J/AEuuGPNMGzKEgN+6h3qwTGifbPLuUs8XNuSlLwfLU3HrL6LiCSiszHtAQTW8ZVw7IvywsJTZrdGCS2NCjXaS7pWWEzPLI5Vb5KGY+2CTjdMIczcS9pclvv4l33KJW1vlZAhYvPIgFjIp43GVutTGYLHGnWycWLG9rzfKGNgeEnoYeyQ24hiGsUxQmoT8OTfk/S3JHopD+2blAtUeOUIkvuoAbPXEV7mPiujpfTEMPyeJ8sggFZQosSthLw+pOO4MD9XjiKPKvwlC1/18F8J4CdTZo7X/c/qOKgMOEs7OJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Tue, 6 Sep 2022 13:39:14 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 13:39:14 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Thread-Topic: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Thread-Index: AQHYvySGA+xYIMn3Ok2452RCUsf/pq3SbV/Q
Date: Tue, 6 Sep 2022 13:39:14 +0000
Message-ID: <DM5PR11MB13245A45A7277B9548CADFB5C17E9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
 <20220902233257.3088492-2-matthew.d.roper@intel.com>
In-Reply-To: <20220902233257.3088492-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdd4bdd1-1609-4dda-da25-08da900d2fff
x-ms-traffictypediagnostic: IA0PR11MB7355:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pGnJ3ZdX8rq+aCuJg8kHKPVIj6yJBJncM9wTY7TpTPVjItCqvGlTwW554C7bZjPaWAjdRhSkY+lFvQTddN4e4TpOJ1GyeigQstrmn5KtjG5+EuiK4vlZkyAb7zuNcZ8O1hlFH6ayc85fKHWESho+XqMfjv3tPjEpOXUD4PxhOAQMgygLHt5cJXyVL/Zi4dRgdxU1CxjhlLh5Fi1DszkOeHIgwXqmC/amSY0k6vXiBcj3h+RR/pak2aUa4tyFY2UeSAZKntzgwjrdGRlv+4LRngB8r+nJFzzYU5WZxbyl4EOSJliVehVZVXKTRQnP+bZgCXe/xR+fg3g0pu8ps6vNe9+6k9AYFaBdXdgprAMoOfzJWPWAee18kw1EB0e6ZOKsOaaah+QiW18pCGTAMhmsFZEBumoeYBzUHntxLovrlFfcdeGVHqb5Ppml6uppLUjId6bE+jYFFR68RAwS5Co6kEa255unQ999Ad8g0BY6un9laGzyOEPFCw89V54lVADFUdA5hfIENbTlCj8GieF0bMjpewP5YD/8u1mJIzijYI2McDXhBczYD/WvaW2fDmcorTVfGDGg0ta+ZRcFbEoDyYdBNr0buCQEBWKdmegToAE1KRFgQTc8XW6zABUfDagpi599xc1Qwi+NNNUE/CpAevgMQfq9WxSRpepCdLFTycSqk9CZgLDq703Agq9KurMGorbSy3hqNSD352v4JVa9JCGCuBNs1Lc2fgqma/wcEm4GMpLfpinL2RJZXxo5mnRqSIPPd6UPEm66c2RBsGGQkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(366004)(136003)(376002)(4326008)(8936002)(7696005)(186003)(9686003)(6506007)(52536014)(5660300002)(86362001)(33656002)(26005)(478600001)(71200400001)(107886003)(41300700001)(38070700005)(83380400001)(38100700002)(66446008)(76116006)(2906002)(66476007)(54906003)(15650500001)(8676002)(110136005)(316002)(66946007)(66556008)(122000001)(82960400001)(64756008)(55016003)(450100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jS7qyrPPh7b+LtRm2AjaZjXS5KehDX4nlGaPX+0V2k9ztpZNFOgE9ddmFFXf?=
 =?us-ascii?Q?K6+ojU7YhlitksaVzSWq/ak3C2bAHY69TggmzEG0kewejQ+jB6s9z9yccakQ?=
 =?us-ascii?Q?OZwtsZXqGDBk8nvLvOnuRf5juQtD3/pHYQ5zK1KC96BxJHyMGhY6jczJ5qRN?=
 =?us-ascii?Q?Qd8IZhy1oJdVPOwEuKbDN9SnbUk3u6Bwif06kmCfkFBEUolmZYc9ZwexUeRx?=
 =?us-ascii?Q?t3/N0uIqIWfk+B1CdDKpSYqMtH/lJRovslY4iTs9k/QyuEuLaao7OwfGMGdq?=
 =?us-ascii?Q?I7bMnxGw4l7xE7GmTxIHg81Jzae1YEXjJgqZ0B7znHLq08gUgaEiKqgca60p?=
 =?us-ascii?Q?0WEEx3BULoXKx+BQoxyKBy+XwSOr4AuygIjIc4iDf5Jruzr3YE1mWdaXJIz8?=
 =?us-ascii?Q?1binuS5AkiRzLeIuDAZIJFEHpP3vWNDAaT1HEnJHMkzJ7nQKpm/opVHA58Oo?=
 =?us-ascii?Q?82cYP/eJCCq4Aupa5DIgO/E0p2kWRL9sAHOSf/6QS1sEhh0C2YEFB2cLWzH5?=
 =?us-ascii?Q?lhrI5qddEhjYaj4nRxi/eIJ+3n6grPB+AcSDiWrDm0cfxvP+++MNu+5OOOb0?=
 =?us-ascii?Q?vb2eUZ2A/L4d2sfWLpkP02PlUfcBqg56/+07vi6Nf1u0VLtPnDdEvNs6p6Hv?=
 =?us-ascii?Q?r9ORdG82lYhyLzH3cZRZpR8Ek0dq7/PVmLi04Tlun3az0PF2BfxiKk/NSBKu?=
 =?us-ascii?Q?HsO80Ygy66ci6BcZ1nxiAvfXuyxNQ+eKtdDfO05AwbrDRlhtzpTa9+qMlEsi?=
 =?us-ascii?Q?mpxese3pQzZqcZivvRu467CKoXrFIcVWPi4LZ1FR60Fpl7RR8vvdDZ2/G9y4?=
 =?us-ascii?Q?2nE/4QYINDBqSIW/mjLfX6J1FRUPXPJrE+CDDjCvLY8ChCdDORfGSZwL09vH?=
 =?us-ascii?Q?RV6YehGonIPXcSILamrEgrG4SZNCb6VPj+qnPpl8QZ3OSWLV6IECLIdALK1i?=
 =?us-ascii?Q?gozatl0ZHfyG1WX3y7Ac+IxoFrCEE7NpC1KsrkCveb9zy3DHxNlXI6Y+bgMU?=
 =?us-ascii?Q?PB4Bwm1m21/OSjNNSmMZMgPPwRSuuAEyt8P5CjjWBEe/NBsVgUM45E4ABgBR?=
 =?us-ascii?Q?ZRhjxy0vuMatMPAYV3Udh3siP2yrHNjv93mLU8AdxuZ0m4vAsAMriVX/ztqs?=
 =?us-ascii?Q?5X4IWV3oNw0oy2phiwQiBirB+9GHkEVvfpBm39FVWizv7gBCeMpNNdrL62wU?=
 =?us-ascii?Q?syN8ynS5h0OTw+CAlMvSFKdow6Xqspm51fxZH6khEldkNsWSxKZ7JrXK4ISc?=
 =?us-ascii?Q?iwbP+2X9JSCeevo00ZZuxBEfMDnZcFXN9KXusEgZBG6aeEHcXzJy998sb5Va?=
 =?us-ascii?Q?yrIrKYu3Ap4Y8a7HJprY+tsCVOeTD/q3mY5RkA0DNAeIEkjCMEv2I7x11Vdx?=
 =?us-ascii?Q?d863zIbqm4+xK1Gdmi/0BCtb2GW3IYnCGcian8hZWU/SQbhegkorF7N/Sues?=
 =?us-ascii?Q?TeIIjEYwjlSY42Dnkx0xGPO0C+zwHxixP+6iQGBzQQGEI7nWrky/WRPhEIdo?=
 =?us-ascii?Q?wtFsS/dGK6wuLt1T8fXYWGGsOlNLiAQ9NJuyw2rZVrFBL8nA40KZR8F8xzqy?=
 =?us-ascii?Q?hR/l8PcGdo/EdNVounYWIEkgPjl9EUa4o8GpU+Pl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd4bdd1-1609-4dda-da25-08da900d2fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 13:39:14.0461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ezNxGQIdWdbXE46qine2RXg0FPyZwILzjWD6ckQBNgNzlJuR0+8X2yHnl+8ZZU4TVRKv9hfyJ6lKqAX4h4NTRk7TysqwAUumdjZyveHfaPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Matt Roper
>Sent: Friday, September 2, 2022 7:33 PM
>To: intel-gfx@lists.freedesktop.org
>Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
><radhakrishna.sripada@intel.com>
>Subject: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
>mmio_debug_{suspend, resume}
>
>Moving the locking for MMIO debug (and the final check for unclaimed
>accesses when resuming debug after a userspace-initiated forcewake) will
>make it simpler to completely skip MMIO debug handling on uncores that
>don't support it in future patches.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/i915/intel_uncore.c | 41 +++++++++++++++--------------
> 1 file changed, 21 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_uncore.c
>b/drivers/gpu/drm/i915/intel_uncore.c
>index 9b81b2543ce2..e717ea55484a 100644
>--- a/drivers/gpu/drm/i915/intel_uncore.c
>+++ b/drivers/gpu/drm/i915/intel_uncore.c
>@@ -50,23 +50,33 @@ intel_uncore_mmio_debug_init_early(struct
>intel_uncore_mmio_debug *mmio_debug)
> 	mmio_debug->unclaimed_mmio_check =3D 1;
> }
>
>-static void mmio_debug_suspend(struct intel_uncore_mmio_debug
>*mmio_debug)
>+static void mmio_debug_suspend(struct intel_uncore *uncore)

/bike-shedding...

It seems like there has been a tend to name functions with the

_unlocked

postfix when the lock is being taken within the function.

Would this be a reasonable name update for these changes?

M

> {
>-	lockdep_assert_held(&mmio_debug->lock);
>+	spin_lock(&uncore->debug->lock);
>
> 	/* Save and disable mmio debugging for the user bypass */
>-	if (!mmio_debug->suspend_count++) {
>-		mmio_debug->saved_mmio_check =3D mmio_debug-
>>unclaimed_mmio_check;
>-		mmio_debug->unclaimed_mmio_check =3D 0;
>+	if (!uncore->debug->suspend_count++) {
>+		uncore->debug->saved_mmio_check =3D uncore->debug-
>>unclaimed_mmio_check;
>+		uncore->debug->unclaimed_mmio_check =3D 0;
> 	}
>+
>+	spin_unlock(&uncore->debug->lock);
> }
>
>-static void mmio_debug_resume(struct intel_uncore_mmio_debug
>*mmio_debug)
>+static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
>+
>+static void mmio_debug_resume(struct intel_uncore *uncore)
> {
>-	lockdep_assert_held(&mmio_debug->lock);
>+	spin_lock(&uncore->debug->lock);
>+
>+	if (!--uncore->debug->suspend_count)
>+		uncore->debug->unclaimed_mmio_check =3D uncore->debug-
>>saved_mmio_check;
>
>-	if (!--mmio_debug->suspend_count)
>-		mmio_debug->unclaimed_mmio_check =3D mmio_debug-
>>saved_mmio_check;
>+	if (check_for_unclaimed_mmio(uncore))
>+		drm_info(&uncore->i915->drm,
>+			 "Invalid mmio detected during user access\n");
>+
>+	spin_unlock(&uncore->debug->lock);
> }
>
> static const char * const forcewake_domain_names[] =3D {
>@@ -677,9 +687,7 @@ void intel_uncore_forcewake_user_get(struct
>intel_uncore *uncore)
> 	spin_lock_irq(&uncore->lock);
> 	if (!uncore->user_forcewake_count++) {
> 		intel_uncore_forcewake_get__locked(uncore,
>FORCEWAKE_ALL);
>-		spin_lock(&uncore->debug->lock);
>-		mmio_debug_suspend(uncore->debug);
>-		spin_unlock(&uncore->debug->lock);
>+		mmio_debug_suspend(uncore);
> 	}
> 	spin_unlock_irq(&uncore->lock);
> }
>@@ -695,14 +703,7 @@ void intel_uncore_forcewake_user_put(struct
>intel_uncore *uncore)
> {
> 	spin_lock_irq(&uncore->lock);
> 	if (!--uncore->user_forcewake_count) {
>-		spin_lock(&uncore->debug->lock);
>-		mmio_debug_resume(uncore->debug);
>-
>-		if (check_for_unclaimed_mmio(uncore))
>-			drm_info(&uncore->i915->drm,
>-				 "Invalid mmio detected during user
>access\n");
>-		spin_unlock(&uncore->debug->lock);
>-
>+		mmio_debug_resume(uncore);
> 		intel_uncore_forcewake_put__locked(uncore,
>FORCEWAKE_ALL);
> 	}
> 	spin_unlock_irq(&uncore->lock);
>--
>2.37.2

