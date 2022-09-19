Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FFB5BC2EC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 08:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7D10E3C5;
	Mon, 19 Sep 2022 06:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40EB10E3AA;
 Mon, 19 Sep 2022 06:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663569439; x=1695105439;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IkFSxqa/gaExP0K371CdqKExRIgfSrIHqE/hcjhItLo=;
 b=J1hGNse3cVfOyC6AUo0m9Da1u1ZU5tP92rqwOSWjx/a9rHdPVhkQwL0E
 dy2cRlqskOpjgE48KNst4Fn8mFvfDE6IetM2sUmYQFq+VIehSDHa09Xxd
 WOxEHCjJ6BqoYKZt6ML0WUEgDNB75UgibGKH7ev7jqD5GH8VJbSTl1bmF
 adUdcP5DniV+XJczVepFvhsEjxcz9nG7efY99A8h5nZKx81T6THjjQmaW
 A3sMLWTeaqZGT9I8FdF2UCuGsn0+KlOLGOeS9uiY5NcQIT2eSYIOIS3zB
 dxJXhSNJ1IIAD6MK3nQR80fptxDNgt0fDVfRYFB7UrxWCUfCh/dnCnAGJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="296910679"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="296910679"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2022 23:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="649011372"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 18 Sep 2022 23:37:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 18 Sep 2022 23:37:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 18 Sep 2022 23:37:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 18 Sep 2022 23:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgzUn2W0+viH1r5dfsvvgxweZlhJ6K/Cx08qQvDW8e1g/r+OA1y1h94paAkOut6HwqPlzz9KXGNmahHS49fE9HO7wrD5f7Q4BJbpe0S0HEiToZeSIjtZCQbO3lfhbOd6NeNF6C4k3HEPRFQ8BQ9SlpZR38U8gHHuGQgZWrv4Xuwk081ZFrlhEcrUP9MpP4U+W7S2DEPTz5fk/jbtuVp+38p2bNnitSnKpphJ/YbicN1CBvlXshPa/Mc0PYcj/8Rk3mmPKw37URcc4pq3zzUku94kpWm+VLIuB8ftqK264HgRXb3/lXaZU6smqZe0PW362XNKnpW6tdGcMIbS9/O5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OodeVL5CLy2xt9ZYasvkrocJtkujcArHgul06QZNnvw=;
 b=C3ft8MyujgIAL0YwSJJfxOfXH9FtX6e+S3qVMJTbUve69HKz4r1HZVzqUXtwcvGBxrXIgirft2h2h6HMf0xvwo7oFC5Ve4B96sUzlEKL6tZnD3ga4e3vjlJ+dyG1AkChoKJkM/0RN9eHoIlKiCDlmowc5YAdDu43EAqDVAQNCpFio8ke9OeXr/A952QZlhCgXhrGtYYlh9/BA/mjeuW7Kj83u71n8DC/forAYBdzrCRbaaxz7oXJg8RW6019O/S0qhRJZ++ZnqbwLvxhiCnc7B5jAYuMK87QzBf01B6LsdEZ+WdLH9CYM26IetXxVYLo9qdF7SpVH7kSRBXztEQG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 06:37:14 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::c9eb:3a36:5346:5352]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::c9eb:3a36:5346:5352%2]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 06:37:13 +0000
From: "Chegondi, Harish" <harish.chegondi@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/mtl: Add MTL forcewake support
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/mtl: Add MTL forcewake support
Thread-Index: AQHYxKrIa/0sDFMP+0aFz8O4saUVXa3mWowg
Date: Mon, 19 Sep 2022 06:37:13 +0000
Message-ID: <MN0PR11MB6278599BB5ACC09268702454ED4D9@MN0PR11MB6278.namprd11.prod.outlook.com>
References: <20220910001631.1986601-1-matthew.d.roper@intel.com>
In-Reply-To: <20220910001631.1986601-1-matthew.d.roper@intel.com>
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
x-ms-traffictypediagnostic: MN0PR11MB6278:EE_|MW4PR11MB7030:EE_
x-ms-office365-filtering-correlation-id: 5f73857e-41b5-4a24-7edb-08da9a096341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MZLqoYwcpHMZIWtd//C/o05W0O8Mfk8oW93lQCKUYzrFvOmGszexT4BHBN63y4OaiaX1T9hCaEsnHkIY/h0kynXbMG4W1DBFsDPS7bbIYPVx+IhMaI4/jzEJCTArY6JmXlQpE6s/ZaPln2oL/RKZQMxQZKuxRI2+XvcKG0yNjjzQPRF65447LhFPX3lmJxWsZ7J9QblQsqAlGr+ei4PVs59fMHCiSmMI7xbcKy7EMDJPY59vzowYro1CEfchJdoxXvtOHliMEJ7RxDMEuacKP30FB3OKCy/MMdOi0CyXhNQO2SWmRohdWMUtjvTZoJYkN9Ef4Bp3PSud1D7182cD0KLHwEbqcgammx+29dgolLUSNxVDZWDzJ/iFyYlV7vzWjQaXnpaL7uavwF/txzLxTJBGcpRYYW18C+gOvLG4/uv3wVFYOg65q0Co3rOU2JpQk2sHakvqOnQ8FvXxA53a4uBci5HBUm1YECb61ooxwa/4+aJ10MNeuA0nVPbqETuVO1P/ZJCWuUH+MifRiQ3stGtAMS1ep7tE61SdxIfQnkDn2HtUqlJve0Jcghw5ePN982RBiX1sN8A3ILcOY2m/9TGV5VRHuiAYSg7T44UoUJJtljOfanH4eM2perswLpCGTJXIsJw6CChR5WmtaIpq6lsK12+q0xNVmNrIxv58twFCNPQltbf4dnZ7DXS73Hs1vmW4vEE/v4UW4lGfskbQ09T0qn+lbEoTcA8lo31IhRrOUAP8VnLxoUwr0gQFyq8Sz8T5l+YpNGifWbdd5FiOQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199015)(9686003)(53546011)(7696005)(26005)(6506007)(66899012)(38070700005)(82960400001)(38100700002)(478600001)(30864003)(2906002)(5660300002)(66476007)(66446008)(122000001)(86362001)(33656002)(186003)(71200400001)(55016003)(83380400001)(41300700001)(66556008)(4326008)(64756008)(450100002)(316002)(8676002)(52536014)(110136005)(76116006)(66946007)(8936002)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rMTAHREiHk39IPQCuiOZvFJqT9n3A6F7v2zzjuFS3ZERNmrJlycFKPpU1oQG?=
 =?us-ascii?Q?P47US0/3Yb69/0loQ8qgLMnwvtibOWXEsJY7kEfmUCriGfopCfFUxgfwY+xV?=
 =?us-ascii?Q?JFXFHS0KHzjPdNOWQ9HU9KoBOBUjyvNAD9X+xqZPKXMFdWeVKyrkVuUQ9WEF?=
 =?us-ascii?Q?D6j+0vpy9/i7Z0rfXHdiZxy+wgrGiZi9jumG5jOfEo4U64i3051JMORzmcBO?=
 =?us-ascii?Q?CPpzvdXinSnQ/3XiZ1iDNABdP+9/PQIunsluN+ePFgTiNc/itCl55SO2KR2w?=
 =?us-ascii?Q?i7/kqDPFoDMJRolWLYhvzJfT3TErRnRyki3eDCoemW5iC9RhG2a9HeHttNNS?=
 =?us-ascii?Q?GGopx5wPOnljs01x86LwL8p+rjfBtkKUgzhagsBhqn/sYmOUwGg+vzXT7c0/?=
 =?us-ascii?Q?kod58Hrgh3B15DAtLFGTIxZxvAouFji012FSzlCvb69nBt3+4QP9lk1J4Y2A?=
 =?us-ascii?Q?czNK5zmdi6QMsazVl0FaoQ+XunkyjXIL9tDwx7tb5TKRfYg0dtCD9tPYu6xh?=
 =?us-ascii?Q?sxekceHI18lnA9CcHd8y7UN011detnDbbWq8mbEymx3gnb8Z+zx8lugQDLSK?=
 =?us-ascii?Q?ZNSKviP1GqF5wa9o+5CAeTVzHI58IAqKmr/44ZIxfk9LGw9UD6MRULtz5P67?=
 =?us-ascii?Q?2kGGFSSiaJfdWU23iC1/xccb/GfRSBvcgVbVIFZ8VJPv+kwjffH2WPok7/J0?=
 =?us-ascii?Q?cb5ZyjTTgpqUIl3NgXttuUKPwe1EonzN68LPthp/erXOXw6PM38TckgZwedT?=
 =?us-ascii?Q?LtMoW3qkyFsRQ7Uu9ssuJrHF5BIFCCcS+zy6SeYzjtEdnZPfxvfJfTQn7gNQ?=
 =?us-ascii?Q?bCul01AtjpBCYSHeINO5nsjVuHnNdtJaoSo0o4RmlkLlI3ncbF9PnJTwRQ5N?=
 =?us-ascii?Q?HwTghGEmPxAyZ31Q1vu6Vf5/V6RfBzKEloYiKypjF8IIASgIGXUJGazv4lBn?=
 =?us-ascii?Q?A8hfz/PfYawG38mYByBMhyPhSeikIqAr+YfgrswXTxuYuT7Ii/ECWuaLTIj3?=
 =?us-ascii?Q?NXJh1PwAFFZDDed9fqeebJh6593TZk/TEPnlePui7o5YcflOSdrcyEf+GJyA?=
 =?us-ascii?Q?GF78zMJHvi6NXQbTu/9G664hPpnto2amxru6DL+Doc0QrMhydcJMGkCk1ygz?=
 =?us-ascii?Q?uL9ypzZIEdSZnw3tey/g6+Ckg5H8WaGW2FJZ67fkK9y/SDi+QsBiFTG6MUXX?=
 =?us-ascii?Q?45aymUh5WdxZZxHP2kB+fCaMM8/U7GwE8dmljjX2KICGZbVDvRAuxgI56KIC?=
 =?us-ascii?Q?xMnfK+jAmKp4aWecsEMRh9VbMiiNuUin4qr6V/fJeNMlP7irGlv+VY3MgkzH?=
 =?us-ascii?Q?p0D3kouPEZ6nTRVS0+8hdjNlb0zizPoBcwMFnkPUjB8tqGannqDmGdPxFXNp?=
 =?us-ascii?Q?84qlcKx9sX5dcDHjv3Fs36jkWEJDScX/qSot2zI2uCDBa/d2Xls2TNJp6N9N?=
 =?us-ascii?Q?e9cz5zm7zhzx9jlAsgk3ATvVRbYbXig0fJBq1tAyFQ1T8RvCSIajP0fl9TMw?=
 =?us-ascii?Q?/49VGKMXn64MlTzYkSZ+x5iQevJXMLrRFQV45LZCkBS09vLhoQ5D0onOFql1?=
 =?us-ascii?Q?F4KZt6QfxUDElvc5EFH2XSm8sHs/orhsP4v5au2KyYYhIQdkNYiNMtDv3LJ7?=
 =?us-ascii?Q?gg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f73857e-41b5-4a24-7edb-08da9a096341
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:37:13.6341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kg7j2dlCUQQrKrm+PmIOB2XMA1gzUdk5boFAbmEaqphwiiRxVct0I3YtfvqEWZcakaYjUETU3M0Eqh08R7f51OjIsLJAOsgbX/Oo/XoZLgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Harish Chegondi <harish.chegondi@intel.com>

-----Original Message-----
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Matt=
 Roper
Sent: Friday, September 9, 2022 5:17 PM
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [PATCH] drm/i915/mtl: Add MTL forcewake support

MTL has separate forcewake tables for the primary/render GT and the media G=
T; each GT's intel_uncore will use a separate forcewake table and should on=
ly initialize the domains that are relevant to that GT.  The GT ack registe=
r also moves to a new location of (GSI base + 0xDFC) on this platform.

Note that although our uncore handlers take care of transparently redirecti=
ng all register accesses in the media GT's GSI range to their new offset at=
 0x380000, the forcewake ranges listed in the table should use the final, p=
ost-translation offsets.

NOTE:  There are two ranges in the media IP that have multicast registers w=
here the two register instances reside in different power wells (either VD0=
 or VD2).  We don't have an easy way to deal with this today (and in fact w=
e don't even access these register ranges in the driver today), so for now =
we just mark those ranges as FORCEWAKE_ALL which will cause all of the medi=
a power wells to be grabbed, ensuring proper operation.  If we start readin=
g/writing in those ranges in the future, we can re-visit whether it's worth=
 adding extra steering complexity into our forcewake support.

Bspec: 67788, 67789, 52077
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   5 +
 drivers/gpu/drm/i915/intel_uncore.c           | 258 +++++++++++++++++-
 drivers/gpu/drm/i915/intel_uncore.h           |   2 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   4 +
 4 files changed, 258 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915=
/gt/intel_gt_regs.h
index 2275ee47da95..1cbb7226400b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -39,6 +39,9 @@
 #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
 #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
=20
+#define FORCEWAKE_ACK_GSC			_MMIO(0xdf8)
+#define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
+
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
 #define SF_MCR_SELECTOR				_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
@@ -898,6 +901,8 @@
 #define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
=20
+#define FORCEWAKE_REQ_GSC			_MMIO(0xa618)
+
 #define CHV_POWER_SS0_SIG1			_MMIO(0xa720)
 #define CHV_POWER_SS0_SIG2			_MMIO(0xa724)
 #define CHV_POWER_SS1_SIG1			_MMIO(0xa728)
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/int=
el_uncore.c
index 5cd423c7b646..c058cdc6d8a0 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -104,6 +104,7 @@ static const char * const forcewake_domain_names[] =3D =
{
 	"vebox1",
 	"vebox2",
 	"vebox3",
+	"gsc",
 };
=20
 const char *
@@ -888,10 +889,13 @@ void assert_forcewakes_active(struct intel_uncore *un=
core,
 	spin_unlock_irq(&uncore->lock);
 }
=20
-/* We give fast paths for the really cool registers */
+/*
+ * We give fast paths for the really cool registers.  The second range=20
+includes
+ * media domains (and the GSC starting from Xe_LPM+)  */
 #define NEEDS_FORCE_WAKE(reg) ({ \
 	u32 __reg =3D (reg); \
-	__reg < 0x40000 || __reg >=3D GEN11_BSD_RING_BASE; \
+	__reg < 0x40000 || __reg >=3D 0x116000; \
 })
=20
 static int fw_range_cmp(u32 offset, const struct intel_forcewake_range *en=
try) @@ -1131,6 +1135,45 @@ static const struct i915_range pvc_shadowed_reg=
s[] =3D {
 	{ .start =3D 0x1F8510, .end =3D 0x1F8550 },  };
=20
+static const struct i915_range mtl_shadowed_regs[] =3D {
+	{ .start =3D   0x2030, .end =3D   0x2030 },
+	{ .start =3D   0x2510, .end =3D   0x2550 },
+	{ .start =3D   0xA008, .end =3D   0xA00C },
+	{ .start =3D   0xA188, .end =3D   0xA188 },
+	{ .start =3D   0xA278, .end =3D   0xA278 },
+	{ .start =3D   0xA540, .end =3D   0xA56C },
+	{ .start =3D   0xC050, .end =3D   0xC050 },
+	{ .start =3D   0xC340, .end =3D   0xC340 },
+	{ .start =3D   0xC4C8, .end =3D   0xC4C8 },
+	{ .start =3D   0xC4E0, .end =3D   0xC4E0 },
+	{ .start =3D   0xC600, .end =3D   0xC600 },
+	{ .start =3D   0xC658, .end =3D   0xC658 },
+	{ .start =3D   0xCFD4, .end =3D   0xCFDC },
+	{ .start =3D  0x22030, .end =3D  0x22030 },
+	{ .start =3D  0x22510, .end =3D  0x22550 }, };
+
+static const struct i915_range xelpmp_shadowed_regs[] =3D {
+	{ .start =3D 0x1C0030, .end =3D 0x1C0030 },
+	{ .start =3D 0x1C0510, .end =3D 0x1C0550 },
+	{ .start =3D 0x1C8030, .end =3D 0x1C8030 },
+	{ .start =3D 0x1C8510, .end =3D 0x1C8550 },
+	{ .start =3D 0x1D0030, .end =3D 0x1D0030 },
+	{ .start =3D 0x1D0510, .end =3D 0x1D0550 },
+	{ .start =3D 0x38A008, .end =3D 0x38A00C },
+	{ .start =3D 0x38A188, .end =3D 0x38A188 },
+	{ .start =3D 0x38A278, .end =3D 0x38A278 },
+	{ .start =3D 0x38A540, .end =3D 0x38A56C },
+	{ .start =3D 0x38A618, .end =3D 0x38A618 },
+	{ .start =3D 0x38C050, .end =3D 0x38C050 },
+	{ .start =3D 0x38C340, .end =3D 0x38C340 },
+	{ .start =3D 0x38C4C8, .end =3D 0x38C4C8 },
+	{ .start =3D 0x38C4E0, .end =3D 0x38C4E4 },
+	{ .start =3D 0x38C600, .end =3D 0x38C600 },
+	{ .start =3D 0x38C658, .end =3D 0x38C658 },
+	{ .start =3D 0x38CFD4, .end =3D 0x38CFDC }, };
+
 static int mmio_range_cmp(u32 key, const struct i915_range *range)  {
 	if (key < range->start)
@@ -1679,6 +1722,162 @@ static const struct intel_forcewake_range __pvc_fw_=
ranges[] =3D {
 	GEN_FW_RANGE(0x3e0000, 0x3effff, FORCEWAKE_GT),  };
=20
+static const struct intel_forcewake_range __mtl_fw_ranges[] =3D {
+	GEN_FW_RANGE(0x0, 0xaff, 0),
+	GEN_FW_RANGE(0xb00, 0xbff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0xc00, 0xfff, 0),
+	GEN_FW_RANGE(0x1000, 0x1fff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x2000, 0x26ff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0x2700, 0x2fff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x3000, 0x3fff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0x4000, 0x51ff, FORCEWAKE_GT), /*
+		0x4000 - 0x48ff: render
+		0x4900 - 0x51ff: reserved */
+	GEN_FW_RANGE(0x5200, 0x7fff, FORCEWAKE_RENDER), /*
+		0x5200 - 0x53ff: render
+		0x5400 - 0x54ff: reserved
+		0x5500 - 0x7fff: render */
+	GEN_FW_RANGE(0x8000, 0x813f, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x8140, 0x817f, FORCEWAKE_RENDER), /*
+		0x8140 - 0x815f: render
+		0x8160 - 0x817f: reserved */
+	GEN_FW_RANGE(0x8180, 0x81ff, 0),
+	GEN_FW_RANGE(0x8200, 0x94cf, FORCEWAKE_GT), /*
+		0x8200 - 0x87ff: gt
+		0x8800 - 0x8dff: reserved
+		0x8e00 - 0x8f7f: gt
+		0x8f80 - 0x8fff: reserved
+		0x9000 - 0x947f: gt
+		0x9480 - 0x94cf: reserved */
+	GEN_FW_RANGE(0x94d0, 0x955f, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0x9560, 0x967f, 0), /*
+		0x9560 - 0x95ff: always on
+		0x9600 - 0x967f: reserved */
+	GEN_FW_RANGE(0x9680, 0x97ff, FORCEWAKE_RENDER), /*
+		0x9680 - 0x96ff: render
+		0x9700 - 0x97ff: reserved */
+	GEN_FW_RANGE(0x9800, 0xcfff, FORCEWAKE_GT), /*
+		0x9800 - 0xb4ff: gt
+		0xb500 - 0xbfff: reserved
+		0xc000 - 0xcfff: gt */
+	GEN_FW_RANGE(0xd000, 0xd7ff, 0), /*
+		0xd000 - 0xd3ff: always on
+		0xd400 - 0xd7ff: reserved */
+	GEN_FW_RANGE(0xd800, 0xd87f, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0xd880, 0xdbff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0xdc00, 0xdcff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0xdd00, 0xde7f, FORCEWAKE_GT), /*
+		0xdd00 - 0xddff: gt
+		0xde00 - 0xde7f: reserved */
+	GEN_FW_RANGE(0xde80, 0xe8ff, FORCEWAKE_RENDER), /*
+		0xde80 - 0xdfff: render
+		0xe000 - 0xe0ff: reserved
+		0xe100 - 0xe8ff: render */
+	GEN_FW_RANGE(0xe900, 0xe9ff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0xea00, 0x147ff, 0), /*
+		 0xea00 - 0x11fff: reserved
+		0x12000 - 0x127ff: always on
+		0x12800 - 0x147ff: reserved */
+	GEN_FW_RANGE(0x14800, 0x19fff, FORCEWAKE_GT), /*
+		0x14800 - 0x153ff: gt
+		0x15400 - 0x19fff: reserved */
+	GEN_FW_RANGE(0x1a000, 0x21fff, FORCEWAKE_RENDER), /*
+		0x1a000 - 0x1bfff: render
+		0x1c000 - 0x21fff: reserved */
+	GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x24000, 0x2ffff, 0), /*
+		0x24000 - 0x2407f: always on
+		0x24080 - 0x2ffff: reserved */
+	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT) };
+
+/*
+ * Note that the register ranges here are the final offsets after
+ * translation of the GSI block to the 0x380000 offset.
+ *
+ * NOTE:  There are a couple MCR ranges near the bottom of this table
+ * that need to power up either VD0 or VD2 depending on which=20
+replicated
+ * instance of the register we're trying to access.  Our forcewake=20
+logic
+ * at the moment doesn't have a good way to take steering into=20
+consideration,
+ * and the driver doesn't even access any registers in those ranges=20
+today,
+ * so for now we just mark those ranges as FORCEWAKE_ALL.  That will=20
+ensure
+ * proper operation if we do start using the ranges in the future, and=20
+we
+ * can determine at that time whether it's worth adding extra=20
+complexity to
+ * the forcewake handling to take steering into consideration.
+ */
+static const struct intel_forcewake_range __xelpmp_fw_ranges[] =3D {
+	GEN_FW_RANGE(0x0, 0x115fff, 0), /* render GT range */
+	GEN_FW_RANGE(0x116000, 0x11ffff, FORCEWAKE_GSC), /*
+		0x116000 - 0x117fff: gsc
+		0x118000 - 0x119fff: reserved
+		0x11a000 - 0x11efff: gsc
+		0x11f000 - 0x11ffff: reserved */
+	GEN_FW_RANGE(0x120000, 0x1bffff, 0), /* non-GT range */
+	GEN_FW_RANGE(0x1c0000, 0x1c7fff, FORCEWAKE_MEDIA_VDBOX0), /*
+		0x1c0000 - 0x1c3dff: VD0
+		0x1c3e00 - 0x1c3eff: reserved
+		0x1c3f00 - 0x1c3fff: VD0
+		0x1c4000 - 0x1c7fff: reserved */
+	GEN_FW_RANGE(0x1c8000, 0x1cbfff, FORCEWAKE_MEDIA_VEBOX0), /*
+		0x1c8000 - 0x1ca0ff: VE0
+		0x1ca100 - 0x1cbfff: reserved */
+	GEN_FW_RANGE(0x1cc000, 0x1cffff, FORCEWAKE_MEDIA_VDBOX0), /*
+		0x1cc000 - 0x1cdfff: VD0
+		0x1ce000 - 0x1cffff: reserved */
+	GEN_FW_RANGE(0x1d0000, 0x1d7fff, FORCEWAKE_MEDIA_VDBOX2), /*
+		0x1d0000 - 0x1d3dff: VD2
+		0x1d3e00 - 0x1d3eff: reserved
+		0x1d4000 - 0x1d7fff: VD2 */
+	GEN_FW_RANGE(0x1d8000, 0x1da0ff, FORCEWAKE_MEDIA_VEBOX1),
+	GEN_FW_RANGE(0x1da100, 0x380aff, 0), /*
+		0x1da100 - 0x23ffff: reserved
+		0x240000 - 0x37ffff: non-GT range
+		0x380000 - 0x380aff: reserved */
+	GEN_FW_RANGE(0x380b00, 0x380bff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x380c00, 0x380fff, 0),
+	GEN_FW_RANGE(0x381000, 0x38817f, FORCEWAKE_GT), /*
+		0x381000 - 0x381fff: gt
+		0x382000 - 0x383fff: reserved
+		0x384000 - 0x384aff: gt
+		0x384b00 - 0x3851ff: reserved
+		0x385200 - 0x3871ff: gt
+		0x387200 - 0x387fff: reserved
+		0x388000 - 0x38813f: gt
+		0x388140 - 0x38817f: reserved */
+	GEN_FW_RANGE(0x388180, 0x3882ff, 0), /*
+		0x388180 - 0x3881ff: always on
+		0x388200 - 0x3882ff: reserved */
+	GEN_FW_RANGE(0x388300, 0x38955f, FORCEWAKE_GT), /*
+		0x388300 - 0x38887f: gt
+		0x388880 - 0x388fff: reserved
+		0x389000 - 0x38947f: gt
+		0x389480 - 0x38955f: reserved */
+	GEN_FW_RANGE(0x389560, 0x389fff, 0), /*
+		0x389560 - 0x3895ff: always on
+		0x389600 - 0x389fff: reserved */
+	GEN_FW_RANGE(0x38a000, 0x38cfff, FORCEWAKE_GT), /*
+		0x38a000 - 0x38afff: gt
+		0x38b000 - 0x38bfff: reserved
+		0x38c000 - 0x38cfff: gt */
+	GEN_FW_RANGE(0x38d000, 0x38d11f, 0),
+	GEN_FW_RANGE(0x38d120, 0x391fff, FORCEWAKE_GT), /*
+		0x38d120 - 0x38dfff: gt
+		0x38e000 - 0x38efff: reserved
+		0x38f000 - 0x38ffff: gt
+		0x389000 - 0x391fff: reserved */
+	GEN_FW_RANGE(0x392000, 0x392fff, 0), /*
+		0x392000 - 0x3927ff: always on
+		0x392800 - 0x292fff: reserved */
+	GEN_FW_RANGE(0x393000, 0x3931ff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x393200, 0x39323f, FORCEWAKE_ALL), /* instance-based, see n=
ote above */
+	GEN_FW_RANGE(0x393240, 0x3933ff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x393400, 0x3934ff, FORCEWAKE_ALL), /* instance-based, see n=
ote above */
+	GEN_FW_RANGE(0x393500, 0x393c7f, 0), /*
+		0x393500 - 0x393bff: reserved
+		0x393c00 - 0x393c7f: always on */
+	GEN_FW_RANGE(0x393c80, 0x393dff, FORCEWAKE_GT), };
+
 static void
 ilk_dummy_write(struct intel_uncore *uncore)  { @@ -2021,6 +2220,7 @@ stat=
ic int __fw_domain_init(struct intel_uncore *uncore,
 	BUILD_BUG_ON(FORCEWAKE_MEDIA_VEBOX1 !=3D (1 << FW_DOMAIN_ID_MEDIA_VEBOX1)=
);
 	BUILD_BUG_ON(FORCEWAKE_MEDIA_VEBOX2 !=3D (1 << FW_DOMAIN_ID_MEDIA_VEBOX2)=
);
 	BUILD_BUG_ON(FORCEWAKE_MEDIA_VEBOX3 !=3D (1 << FW_DOMAIN_ID_MEDIA_VEBOX3)=
);
+	BUILD_BUG_ON(FORCEWAKE_GSC !=3D (1 << FW_DOMAIN_ID_GSC));
=20
 	d->mask =3D BIT(domain_id);
=20
@@ -2085,17 +2285,26 @@ static int intel_uncore_fw_domains_init(struct inte=
l_uncore *uncore)
 	(ret ?: (ret =3D __fw_domain_init((uncore__), (id__), (set__), (ack__))))
=20
 	if (GRAPHICS_VER(i915) >=3D 11) {
-		/* we'll prune the domains of missing engines later */
-		intel_engine_mask_t emask =3D RUNTIME_INFO(i915)->platform_engine_mask;
+		intel_engine_mask_t emask;
 		int i;
=20
+		/* we'll prune the domains of missing engines later */
+		emask =3D uncore->gt->info.engine_mask;
+
 		uncore->fw_get_funcs =3D &uncore_get_fallback;
-		fw_domain_init(uncore, FW_DOMAIN_ID_RENDER,
-			       FORCEWAKE_RENDER_GEN9,
-			       FORCEWAKE_ACK_RENDER_GEN9);
-		fw_domain_init(uncore, FW_DOMAIN_ID_GT,
-			       FORCEWAKE_GT_GEN9,
-			       FORCEWAKE_ACK_GT_GEN9);
+		if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 70))
+			fw_domain_init(uncore, FW_DOMAIN_ID_GT,
+				       FORCEWAKE_GT_GEN9,
+				       FORCEWAKE_ACK_GT_MTL);
+		else
+			fw_domain_init(uncore, FW_DOMAIN_ID_GT,
+				       FORCEWAKE_GT_GEN9,
+				       FORCEWAKE_ACK_GT_GEN9);
+
+		if (RCS_MASK(uncore->gt) || CCS_MASK(uncore->gt))
+			fw_domain_init(uncore, FW_DOMAIN_ID_RENDER,
+				       FORCEWAKE_RENDER_GEN9,
+				       FORCEWAKE_ACK_RENDER_GEN9);
=20
 		for (i =3D 0; i < I915_MAX_VCS; i++) {
 			if (!__HAS_ENGINE(emask, _VCS(i)))
@@ -2113,6 +2322,10 @@ static int intel_uncore_fw_domains_init(struct intel=
_uncore *uncore)
 				       FORCEWAKE_MEDIA_VEBOX_GEN11(i),
 				       FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(i));
 		}
+
+		if (uncore->gt->type =3D=3D GT_MEDIA)
+			fw_domain_init(uncore, FW_DOMAIN_ID_GSC,
+				       FORCEWAKE_REQ_GSC, FORCEWAKE_ACK_GSC);
 	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
 		uncore->fw_get_funcs =3D &uncore_get_fallback;
 		fw_domain_init(uncore, FW_DOMAIN_ID_RENDER, @@ -2300,6 +2513,22 @@ stati=
c void uncore_raw_init(struct intel_uncore *uncore)
 	}
 }
=20
+static int uncore_media_forcewake_init(struct intel_uncore *uncore) {
+	struct drm_i915_private *i915 =3D uncore->i915;
+
+	if (MEDIA_VER(i915) >=3D 13) {
+		ASSIGN_FW_DOMAINS_TABLE(uncore, __xelpmp_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, xelpmp_shadowed_regs);
+		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
+	} else {
+		MISSING_CASE(MEDIA_VER(i915));
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int uncore_forcewake_init(struct intel_uncore *uncore)  {
 	struct drm_i915_private *i915 =3D uncore->i915; @@ -2314,7 +2543,14 @@ st=
atic int uncore_forcewake_init(struct intel_uncore *uncore)
=20
 	ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
=20
-	if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 60)) {
+	if (uncore->gt->type =3D=3D GT_MEDIA)
+		return uncore_media_forcewake_init(uncore);
+
+	if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 70)) {
+		ASSIGN_FW_DOMAINS_TABLE(uncore, __mtl_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, mtl_shadowed_regs);
+		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
+	} else if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 60)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __pvc_fw_ranges);
 		ASSIGN_SHADOW_TABLE(uncore, pvc_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable); diff --git a/drivers/gpu/drm/=
i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 5022bac80b67..7e1b3b89f689 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -62,6 +62,7 @@ enum forcewake_domain_id {
 	FW_DOMAIN_ID_MEDIA_VEBOX1,
 	FW_DOMAIN_ID_MEDIA_VEBOX2,
 	FW_DOMAIN_ID_MEDIA_VEBOX3,
+	FW_DOMAIN_ID_GSC,
=20
 	FW_DOMAIN_ID_COUNT
 };
@@ -82,6 +83,7 @@ enum forcewake_domains {
 	FORCEWAKE_MEDIA_VEBOX1	=3D BIT(FW_DOMAIN_ID_MEDIA_VEBOX1),
 	FORCEWAKE_MEDIA_VEBOX2	=3D BIT(FW_DOMAIN_ID_MEDIA_VEBOX2),
 	FORCEWAKE_MEDIA_VEBOX3	=3D BIT(FW_DOMAIN_ID_MEDIA_VEBOX3),
+	FORCEWAKE_GSC		=3D BIT(FW_DOMAIN_ID_GSC),
=20
 	FORCEWAKE_ALL =3D BIT(FW_DOMAIN_ID_COUNT) - 1,  }; diff --git a/drivers/g=
pu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel=
_uncore.c
index fda9bb79c049..e4281508d580 100644
--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
@@ -70,6 +70,8 @@ static int intel_shadow_table_check(void)
 		{ gen12_shadowed_regs, ARRAY_SIZE(gen12_shadowed_regs) },
 		{ dg2_shadowed_regs, ARRAY_SIZE(dg2_shadowed_regs) },
 		{ pvc_shadowed_regs, ARRAY_SIZE(pvc_shadowed_regs) },
+		{ mtl_shadowed_regs, ARRAY_SIZE(mtl_shadowed_regs) },
+		{ xelpmp_shadowed_regs, ARRAY_SIZE(xelpmp_shadowed_regs) },
 	};
 	const struct i915_range *range;
 	unsigned int i, j;
@@ -117,6 +119,8 @@ int intel_uncore_mock_selftests(void)
 		{ __gen12_fw_ranges, ARRAY_SIZE(__gen12_fw_ranges), true },
 		{ __xehp_fw_ranges, ARRAY_SIZE(__xehp_fw_ranges), true },
 		{ __pvc_fw_ranges, ARRAY_SIZE(__pvc_fw_ranges), true },
+		{ __mtl_fw_ranges, ARRAY_SIZE(__mtl_fw_ranges), true },
+		{ __xelpmp_fw_ranges, ARRAY_SIZE(__xelpmp_fw_ranges), true },
 	};
 	int err, i;
=20
--
2.37.3

