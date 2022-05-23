Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86515309F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 09:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618B10E4D0;
	Mon, 23 May 2022 07:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B038D10E215;
 Mon, 23 May 2022 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653292155; x=1684828155;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=R5yQ/PTnrLRS0Zf+qdRvPsaKbz9aZZL0JjIgl650nZ8=;
 b=hnIAjrp5uW7+kkjEd2D+su/UjFhp4cFUzCSCCfTnFKfJ2yhsazjhJ9Fv
 qRuEMXEPeKLttUTuguF5ec7qbkvWUdbvWTCZ+9uPH4MJKEe3kJu7okIj8
 kJ3vmOcokR+HE8e/6kCuUibkOwlwcib0dThdIQrZ4x6zRopL8IL5ki/Dt
 OhXj+iEHbCqXRgot07gRqXYVW0pV0Y7ZxmYGKeW3SffI7NhdBJOuiZqko
 vtPgT+soat25C0lMr3lAe4x6rZUq4twcvjkJeVXQudvemAMZVOJogYea/
 zUpJJbhSz1rPQ+L3VQmAI6yxlF8Is0Eppy+WTOZlRke3TcURjwI2ehREZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="255204134"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="255204134"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 00:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="547826872"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 23 May 2022 00:49:10 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 00:49:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 23 May 2022 00:49:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 23 May 2022 00:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqM9Xk7+GGeGaf6G/ADY/w6SwDCMAIeZRFKL75LlTWUWO3y2T+wigD0Ys/riQPXQP+qWXMkYUrlm2D7vvWO0+zAfecg+aq4A9NZmWFcw66kLuiw5MOkbsXYTGhgHFDW0gLa/X893bWXhgING82Dg9OvRhaSUlsL7IWq4bkLIEnIPJR1XmUZcfF6A8kB6ASFDmBlL0r0ZIm8DahTHq0VZeIBNcR7c//g/Kmob7/LJVq1ECfiJ6gpPdIAhGXJfmI9+LneQd+GJaB92auKLKr9e5OjNSou6RbE0OhmlC8qzwkYZS8/gyjtJuiQfLXwX6p85UrUzOPlAjetn/pBamGFqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1CjXPTuObMUSH2+JpNURadH6JjQHaEV+iyceGd74nE=;
 b=RNYnPl+1GVWrRPfcSvhJ4u7HjgtlRiT+YVexdIz9iac7wf6W11TFlt53dlpZ9+b+3CFMsYL48CudpDtE9tQM/Zg7SH4g2ywFD3RQ2lt7e8h1pYV44u7tfHyU+A6qggDEwyHGlyr/aatflFzlfa3I2q3YWH1ktUHn+JDfEkB1VeNNHm2HwxZdxYk2thTfCmDC9wLLNha6csY6v8Y6MPIY07BMS1NJ1PLdv0DMycC2XXr5MA05GBq+O0EJzZEhGIFeono2ZJ89hbOmtl1VZDGOkRo2mrlfoRY31utin8kRX1MhhoqE0K7Qr1EfiwYoygAA2QB3ZPZY54+hMM5Gy6KJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM6PR11MB3017.namprd11.prod.outlook.com (2603:10b6:5:6f::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.16; Mon, 23 May 2022 07:49:08 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13%8]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 07:49:07 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/hwconfig: Report no hwconfig support on ADL-N
Date: Mon, 23 May 2022 13:21:16 +0530
Message-ID: <20220523075116.207677-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a105d4c-0116-46f8-9606-08da3c90b772
X-MS-TrafficTypeDiagnostic: DM6PR11MB3017:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3017BEFD1741A0A22B7EC9C09FD49@DM6PR11MB3017.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4eMB7swggC+TYLTb4rVSyhxfHqRMCzx2JT9yNkMuGRTICC6VIPb4fc3B66z+/MhYHpiwGsL65E39Yi7CfrdbnCPsQX28Px4KeXhXIamiEvbZWOSELaZ+4wPlxM77ijuglIDHUxSB7j6J1Oy+T58bYfmsCa+/aURUwr/3cg+0qjAId6DqwG6hmZLoKNcJxp8z/BUNIB5I4TCP4jZiR0XXmoacpPPsK0F2zqDPj43YEYGTeIVaRxsmu9PYQ6WFyBWDO7XObHuHHwRsS2IivwVQJ/2uznR3HU878JcjYkNT1JDng5dcba/r7Ow5Rvt61FREsZRVy3BCTbhq/nuAK7Of5BD6cJk81TLqo/TGOsp4b62Q6YLJlVujC6T7rS/Z8jWO2fwjTlM6d/q5d1b8EPWNj2/lxjGwX1XZjfWigXdgCK0IkBLBYXCNXIyjx3U8DX1mJxfkUejuJqxxvDYvWLnAnHxxwEJtvTVGi4/9LOxJjOI2pzM0QlMwcpYrC99075uEvkPk1Zg7Yj0SHjke/5nx8B2MB87dPN0Nz2gkqLdSZ2ZHeAY/aOi00sATVZZX/QJDWq86wbEFJJ+eymw8lTTeyR8NV1F/fXnb978W6WRIYWmsqBG3D9APMpnRYla1LLUd7Toj/KNI+JXXYR2ZWN4vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(66556008)(66476007)(83380400001)(8936002)(8676002)(4326008)(2616005)(450100002)(66946007)(1076003)(508600001)(82960400001)(107886003)(6486002)(38100700002)(6506007)(36756003)(44832011)(4744005)(6666004)(6512007)(316002)(86362001)(5660300002)(26005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPh7JU9fCqL4LR1ImoNR0mPIMmWYmLuTkndNXGjIKh6r99nzigvJj12uWhwu?=
 =?us-ascii?Q?t9/080qRJbYqaqfqkEqAqDF3fMXTQt9s4RgEr65wp8Ru2tOCM6Jb9er0t2/2?=
 =?us-ascii?Q?mts/Vd1yuAJftT4p10or0kQJr2ZYb7IeaLtIiyhiwICjtwtIbuq0ZIN/K9np?=
 =?us-ascii?Q?ey/g/emPyxIUHEbiwFlPY0DrRksxsg986O86eft+OieaoSzTpco1nJ0OV6h9?=
 =?us-ascii?Q?B6cc4JlAmH0nsEJmt4qMCFy2j5sJ0JAqdqXVCaKNW/Rv/cGKFI78No0djgKv?=
 =?us-ascii?Q?wf1tOE/HPJs3Mkg1jd8bCQTLjhkjyI7V5Lv+hwuDxck8c4GvUXytcjt9NDfA?=
 =?us-ascii?Q?TYr4qGp/kuR8NNmTBou8R6cfZyp4Gva6d+VtXhsjKFDCRmbrNH/HyGJ602ea?=
 =?us-ascii?Q?XQHT6v7MWwMauY7P3G9TeOsKC/O78mIH8egvhoiEWGf3ztIHVmXPQAFwMrSe?=
 =?us-ascii?Q?xDby4ajBeL6BrO/4+1OyIICQBuoFlGfpEwbU5ez1k/1Evmdh6aQORC3uryTw?=
 =?us-ascii?Q?4I+EetevCKxnblSM7p1I4I2WKgBKZ2YtSErpZzP6o4wp94Lkbk2VtsX2BUc3?=
 =?us-ascii?Q?8q6RUKL0d0Q0dpCBNfIjAl29weI1Sk2k3ppSyY6TKXAD4KEbOKQwOwadT4gl?=
 =?us-ascii?Q?mnKserzjNyglTNvHB83hB9ZqJc+jiaFd3MCAFQArnr/+vV4a0WG7d5Ff5P+1?=
 =?us-ascii?Q?q3vN1GfM1Fw13kLc46rl7/hQe3Tx4COePxJJyt8E5JkzF0hBYoimwjqs8mln?=
 =?us-ascii?Q?sTneEgoaIQ0TyvAW77hwwFm0oVZ2mVcXVqI3Bv9zvlzFBLNjrQETgQ7/3wms?=
 =?us-ascii?Q?oaJTg9RqtPl9grVMTW8g4TbKNFBXFnZk6My8q85ghjANsUWXuHBBNfUuP80m?=
 =?us-ascii?Q?KCagh07jXtn1SrfNQF3s36h5ZR4pPy9LArUf6JOUz4B9PFeMtfWsXxCAEawO?=
 =?us-ascii?Q?EB4LT5q6YqECqEfoHDJu/4Zr8XtG6QfeuQvmJWhcoheBqs3HpThGNcnCkX+x?=
 =?us-ascii?Q?l3xCC+W1XiQbavMWHupsWSbYit3bTazGjCf/S3xWBWpMP4gZnBVXNCgd8rNi?=
 =?us-ascii?Q?NK1pJL6/2etOsEQ97vL83BzOSa74sM19Dc9FSbdQIj4Q8X7wL1G9oIqq0hhH?=
 =?us-ascii?Q?S8PyFpdD+e8bcBE8S5qpCrU+jHCLdO1MOg+dv8kL4rPFk0CI/Ez86RaKxHyv?=
 =?us-ascii?Q?Ac7Go0iZYiUx6BJU+91chqwsXmt+RV59JVMsnuv3W5CZhGmmkKH1zpWlzbs7?=
 =?us-ascii?Q?OgRzE9XW9WnboKWkweItAEVDzvOUck3IJ/n8s+5Qtt7/Oe2Cd+07132RhH9B?=
 =?us-ascii?Q?Up0wWDchrCc+GN+4oIQigpRjixvNWckQOgREQRy3Sc+6WiFUz7DlIebaWJ9M?=
 =?us-ascii?Q?G3hArZQnw9xSA1nhrS3taQujU+YM+zQ8od2dEMUYyFe+k/QWNiGQoWX53Okd?=
 =?us-ascii?Q?aQ5jcderHWXjkaRzKq4lN+iasJ17o3PGpqtkonTuIWClLrqNpTbtcdGET5BO?=
 =?us-ascii?Q?GMO3Oz4k0ol9+0/YGmOvYM13eDduxFNfhM9GQ5Wr2YJJTh9NaPLIQ2VCUQtH?=
 =?us-ascii?Q?Q5bVKXG97bGx7aIPzAamzPiBzUHzFGJ3Z+KAhDKDd9E5SwLIVWFehB1sTwqr?=
 =?us-ascii?Q?5m4EuU+mfzGrd/A6jqfXYKNCTBDhVSO+utqX4weosiXkK93TB80OPQNQcJYm?=
 =?us-ascii?Q?d02Np2ircj/qeNo/CbnIiO+aDCJFMnC0yrtoLabJpvZdODBNo11i5ngB2DPw?=
 =?us-ascii?Q?PL/M2oDvSzs49xkVi9PLIzUzxcyjgHIRnjLKbYmh4+Q4+OXuLAPbKOOMjaai?=
X-MS-Exchange-AntiSpam-MessageData-1: 6Xcx/OKR2aaRGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a105d4c-0116-46f8-9606-08da3c90b772
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 07:49:07.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teGxy+/F6XR5SdJSYlJV4ZdjoCLV6s7Jy89UNK83g3JgsNKdDi8rq4F6uZ/Dohx1wamVfhgdbHzTSm34uKtHS+J3xM5XfyWHanOPPARBgRxA7FiIjm87ElGW4TXYLISr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3017
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
Cc: Balasubramani
 Vivekanandan <balasubramani.vivekanandan@intel.com>, John.C.Harrison@Intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ADL-N being a subplatform of ADL-P, it lacks support for hwconfig
table. Explicit check added to skip ADL-N.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index 79c66b6b51a3..5aaa3948de74 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -94,7 +94,7 @@ static int guc_hwconfig_fill_buffer(struct intel_guc *guc, struct intel_hwconfig
 
 static bool has_table(struct drm_i915_private *i915)
 {
-	if (IS_ALDERLAKE_P(i915))
+	if (IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915))
 		return true;
 	if (IS_DG2(i915))
 		return true;
-- 
2.25.1

