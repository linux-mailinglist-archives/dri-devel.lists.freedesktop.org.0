Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F08589C7E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108CD11350A;
	Thu,  4 Aug 2022 13:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A941C8B0FE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659619158; x=1691155158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G4zBhaspLwnvat6HbHMbFfOKH4qEqDMrMP/pPVIGqZ8=;
 b=Mh1+mSXGyxT7i2onn9Ilxcnk9vj70Y1XpTWUHLycN4A6UJOMUSDZJ6Zj
 viDxcemHBY4VulMdQhd+Tdua/HYdCQI755l6Hmmg0J3BTR3vtE+Qtasyv
 fIo3DLq7j8ZK6StFLPCFlUmMQv+0w9q19rkuf6PYJH/730YyhWpOGfWJQ
 cmBwcrgzFS6EJSDzulqcyd6QP+FIH35A2VLRfaaQ9bEtZ4PWhahW6uScA
 70Ztn1qa/M7oP72BxRcqcLf1QVI822oDt1OiwnyWhiTzo8XOfA3qZHEFE
 mRT2XGsyyRWAMLqyjZcmdcB8UZkLLX7I/QmY08vntZPhuqRjiEC1ZCnVu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="290703632"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="290703632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 06:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="692623814"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2022 06:19:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 06:19:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 06:19:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 06:19:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 06:19:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYz1/E1nDyiQM5E33jVkAkXYF+s6/3GcK5JCJ28RT6As+4B2yBFL97VPlESpVY1ktD2bVbbA88aMprTalgzeOCseaRmh013cAixhM8maT3bPRPLmFtBYGX7crlDmQSnmKaPYl+yU5VcNofKn4rbLxtxiZsfXs4PUpjv698fbEz5Y8cvJ83i95lgpb9zTZsKSQBvJxjr30qfejlBxrl/lMkwXrmzcxBlYadbpeFRfmAFl41BExRafL3HbgfBXjvoSnnJReMUpn5YbHU0lw+TF8VMiybgwBBqwaxG1NzUTxiXvoot9Pp4VbFGm/hjgmPbMyu2A3khc59CQ3utszMggYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QexP5zAG2G7JtBhLtu0Tr7+IciNvmL1TvmMX7HJo+7M=;
 b=l3wMRBrPGFZ/6ZSmB1IyDakNeSBUtOkHagt2FGvhhG2SnJQYWcq1kvu0QJpZtkaYW2D7BMc11yAPtkIEANSWk+38ggIY1mtZErC9kCiinA2wmk3zznMrHJo+DBsAilhdc9fQlixrlIjMZpUoWM9pvm8GEL+SIFr40i3dV1RCmWL5r/v5VkiDYc8XgJ4qyKEdYgjv/G1P1zWceuIonPpII6/aCP2hNk/BBmdq4lj/O4Pop4JlTAjk6fNnesCSaXs2sUTpYb/0HrWVM4LVdXTTC+OhGHURoaWEo4fR65zVAsvminWKzkZNQNx1bFL5b0uRzHbRMY/8uaBrMN6KThLuzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Thu, 4 Aug 2022 13:19:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%7]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:19:12 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/cmdline-parser: Use assert when needed
Date: Thu, 4 Aug 2022 15:17:04 +0200
Message-ID: <20220804131704.97083-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804131704.97083-1-michal.winiarski@intel.com>
References: <20220804131704.97083-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5975092-7500-4321-5227-08da761bec2d
X-MS-TrafficTypeDiagnostic: MW4PR11MB5934:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8bzIpfJJGNuXAWfp9ynmas7JklQjhJbDXxPVSuyJlDysRPQK5faLjDwsi+GfyICROZFaXSSxHeB0CLqeCdKFrE9bxRwOgVeaKPVp7ZZTDDfNSWOEZcYj4QITSp+B27IGcTIj9UePQ8n87EkZPNgNPqAkVfNtpIvowaWQacv9c4/eZ0SG124UA/PwG1coD5P9reu6T46ovV3H88Q8VvtfF8AaXefvYfhekMnBPIIe/6rwYLaLvnJm9zrx64w9UQINOp7iQaP5EW2haPhBgBAkjGu6NAae25CoNVCz0Bpr1ew0FN2gpUmKjLZIxPr+q35JVFCoIotwhtEPvo9mZiPo9w+U0UkR2DGhs2C5KeOkF89yjLGHtdFyLssHlqxrUPVp4c+AGPwPiiSpT6lQi0PMkjHzb17QV2U2g4uOPGl7+o52B3+6UMExOnFVAwLA4nlhcB1eUt3E8KEYTH3UeeC8EYMcsxPyEmWFoVwOvmd7yITnc/4xoOM6/X2jw6yztbx2xCUoRIheW4uFMNh8arEkkrhEHwjIU1LcI6eEPFwrFaqEypI0z+ptz8eWjqIBLMAUHgHoyW5Advclud+rmmSwhnvtGhIjfJCGYfo+5naDriLato57XpXpvtmrj+ydyf0cWK6isbtgWzmmrMaDa7MCULgl8jJvmZqCTYrXUtB/r+MACbC8pA7FRJj7iwjp8lgCVsTauaCTmmqgQmowTZNIMD7LhVwBACVuSbpuxiH8xgrPgESmQDRstSfIdeNxi+f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(136003)(39860400002)(396003)(6506007)(6666004)(2906002)(82960400001)(107886003)(1076003)(316002)(54906003)(26005)(6512007)(38100700002)(36756003)(6916009)(2616005)(8936002)(86362001)(5660300002)(30864003)(66556008)(66946007)(41300700001)(66476007)(4326008)(8676002)(186003)(83380400001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WncxdlRJbUV1cG9ZTGJsdmFIdUpPdVlxeTlDUW8xZHg0Mjh1ZUExeDlPZk8y?=
 =?utf-8?B?NlliclR0T1BlWWZaNVBjbWdDNSt3NzVBaUo0MlJmWHhCY0VLenhqUEYxK3Fv?=
 =?utf-8?B?VTZ6YlRaTHk2TnV0Y3dDMUpyaUNrSGNVYldjTG10YzIvcDhNbVZPdkJQV3FF?=
 =?utf-8?B?NGdOeVlGcmhxY2lDNFh0QXpVdUNGMFVFRDBvN004VjBSUGFCenVvM1VtZTl2?=
 =?utf-8?B?UnZETXB6UVdFUEVUOUN1S1ZSZ09kaXJIS0pBeDR0QXBTeU5WVSt6L0l6cWp5?=
 =?utf-8?B?bFNSN0FQVW5UaTQ5aGdoUnRiYTR0YVBQWmlwTkNwb1BsNTFEZWpCNExzQS9v?=
 =?utf-8?B?RW1BR3oyRVN5TXpWc092MlBINzEzakpQaHJmQjFudTdxcTBBM0xUbVZhWm96?=
 =?utf-8?B?Z3l6Skc3bm1SUDd5ZUs3RTA4eTR1RW5FeHViZTZwdTNQRjNtNS9PSVZPaEIz?=
 =?utf-8?B?T0V4U0dWL21jZ3ROcXlDWG1rbmJob1VnWk5hYjdhWXNwek1hV1Bqb3NxN2Fw?=
 =?utf-8?B?UHRpdkR1WEhuUFBvb1dUR3Q5SEw0ZURCVG5DVy9Ja3N5VWR2SUpPMU53RVhw?=
 =?utf-8?B?QTZQNmZqOHN4a2ViREh5QkoxalJ3b3ZWMHgrUmR1cHZiUkJ3YkVGUUxqWjRt?=
 =?utf-8?B?SS9GdzhSWUx0bTJVa1VyeGdlb0NCejllV1dXMmVjZXVER0plZ0pnNHVvZlZw?=
 =?utf-8?B?WFBmdmFFM1Rwc04xckN5YlhxTlR5dDdNT0pDc2xCVm9iS1FreWZPWGp5bFdI?=
 =?utf-8?B?KzJ5eXJOZVlMMENYbEIyNlMvSmU3TUsyOEFCUWhyaHdzU3loS0dTbmtqVmtZ?=
 =?utf-8?B?QVpyVjVja01SUUp2VUp1eklMWVpjRUpjV0RKTmMwTkxJUWltYUpaMXIvWjNt?=
 =?utf-8?B?NE5XczZKTGlnTVYyT1ZYY2w3eDBoVzlDazlQOVQrV0cwMFVGQ0dPT3NsSEpB?=
 =?utf-8?B?VExzSWkwczJRNE1HMnd6dnRxczBPNzhnbUN5MjVDUHRra3dkMlJIMS9rL1hy?=
 =?utf-8?B?MndJZ09PanFhNlFpNndEM05CNTB6ZUI2bmYrck5rNVFtZmJpQ0VBSDljVS9s?=
 =?utf-8?B?c2NqekhTR0lST1NsMVh6T3hFNGJvMSsvQ1k0VzZoWVBwZXdFeEcwZ0NXbnd1?=
 =?utf-8?B?bWVLRWdLVnVNYlhUMllhQ0tpV05NamVZdVBiQkhnNjF6OXI1SEQ1Z1dPeU8x?=
 =?utf-8?B?MWlvT0RFZEV0MXdZdFR5MHlZTlBHbE16eGFaUkJKamZlR0ltdnpDdEFmUEVX?=
 =?utf-8?B?UlpLbS9oazBjRDFySE16YXVvMERKQnVickg5K29QN1JTUGNSaXh1SlFuc2FI?=
 =?utf-8?B?SklnREpLWGtNUXhhbHJNUTVIcVRqNEFueXJxQ0JvaVlwV1lVRHRNUlZSMHk0?=
 =?utf-8?B?OTRNYm5IbGRmN1FsN0xxM3ZMZHlVeVNLY3JaaTBKUXZTWW5jZGMyNjBYL1JL?=
 =?utf-8?B?dlB3K2pLSVhyU3RQWjN0M1VSbkNoWmRtMWRpZjVvTVFubHB5NHZwRWFhQmto?=
 =?utf-8?B?bjdDMVViN0FtZlVvNm0wYWJpZ1FlYVgvSE0ra1l3S3RBSTlzNW5keTU1NkFw?=
 =?utf-8?B?QTdYYlY0WFc0K2paY1pzRHVtNmhobytFdnk0Y05URXMzendoTEZtNC9QTWs0?=
 =?utf-8?B?VURFOUhLU0ZwWCtkL1ZVVER0WFJMT20wWkNtWFFGekhSSFdjMFVlM2liVjR4?=
 =?utf-8?B?LzcrMnRvRlRPZ0hTMEVRQkFBak1SUzFRa1R1Z1V5TmdTczRvZW5lY0hySnV6?=
 =?utf-8?B?bzNEZW9acGRObEJDUGNpdldMc2llSCtUWFh6WHJtVnlQTmxwRVJTdjJFWFhK?=
 =?utf-8?B?MjhRRFEyODhNdVNhcnZvcmtlaEh3RWxxaEcxVWl0d0NpcmlpTnk1ZVR6QW1J?=
 =?utf-8?B?QUxKT2J2ZktYaHNGR2RFRzUzeWVIUXJCVUJoLzBKbzh5MEJtaytia0lnKzEv?=
 =?utf-8?B?SVd6TnF5dFAzYXBiZDNUdm9mSFZXNzNlUWtYUURiVllIdEczbk9uMmdnZ1Q3?=
 =?utf-8?B?REtZRll2d29TMXJxU3lsR0pKUHZzQW1ORXY2c0NRMXZmcnlmVHYyc1F3aklG?=
 =?utf-8?B?OVJIblJWMS9IT1N1blBEUDlMV0grZGtUU21iN3hzMVNoaU1hakdjcFl5ckpv?=
 =?utf-8?B?RmhRdWRPL2tNYTJsRWNHK0JtT0NFNUREMVFiM2gzQXlPZC9LWjZrNUVJMzJK?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5975092-7500-4321-5227-08da761bec2d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:19:12.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwbW/pTmoWhS/4CH4qz/8FyJ+4BX8WDsvLZgN/rGXSYADtWqVzeMk8DSEe6nzo4Y7s3dnZVw0TmFcHIH0mtuKFI8cM+BiLhvap4ypbxvWDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthur.grillo@usp.br>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expecting to observe a specific value, when the function responsible for
setting the value has failed will lead to extra noise in test output.
Use assert when the situation calls for it.
Also - very small tidying up around the changed areas (whitespace /
variable locality).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 93 +++++++++----------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 058808faaf4a..7a313e2fd52a 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -16,7 +16,7 @@ static void drm_cmdline_test_force_e_only(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "e";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -34,7 +34,7 @@ static void drm_cmdline_test_force_D_only_not_digital(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -47,16 +47,16 @@ static void drm_cmdline_test_force_D_only_not_digital(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON);
 }
 
-static const struct drm_connector connector_hdmi = {
-	.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
-};
 
 static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
+	const struct drm_connector connector_hdmi = {
+		.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
+	};
 	const char *cmdline = "D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &connector_hdmi, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -69,16 +69,15 @@ static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON_DIGITAL);
 }
 
-static const struct drm_connector connector_dvi = {
-	.connector_type	= DRM_MODE_CONNECTOR_DVII,
-};
-
 static void drm_cmdline_test_force_D_only_dvi(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
+	const struct drm_connector connector_dvi = {
+		.connector_type = DRM_MODE_CONNECTOR_DVII,
+	};
 	const char *cmdline = "D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &connector_dvi, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -96,7 +95,7 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "d";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -114,7 +113,7 @@ static void drm_cmdline_test_res(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -136,7 +135,7 @@ static void drm_cmdline_test_res_vesa(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480M";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -158,7 +157,7 @@ static void drm_cmdline_test_res_vesa_rblank(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480MR";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -180,7 +179,7 @@ static void drm_cmdline_test_res_rblank(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480R";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -202,7 +201,7 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -225,7 +224,7 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480@60";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -248,7 +247,7 @@ static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24@60";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -272,7 +271,7 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24@60i";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -294,9 +293,9 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60m";
+	const char *cmdline = "720x480-24@60m";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -318,9 +317,9 @@ static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60d";
+	const char *cmdline = "720x480-24@60d";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -342,9 +341,9 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60e";
+	const char *cmdline = "720x480-24@60e";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -368,7 +367,7 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_analog(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24@60D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -390,12 +389,12 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_analog(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_force_on_digital(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	static const struct drm_connector connector = {
+	const struct drm_connector connector = {
 		.connector_type = DRM_MODE_CONNECTOR_DVII,
 	};
 	const char *cmdline = "720x480-24@60D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -443,7 +442,7 @@ static void drm_cmdline_test_res_margins_force_on(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480me";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -465,7 +464,7 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480Mm";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -487,7 +486,7 @@ static void drm_cmdline_test_name(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -499,7 +498,7 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC-24";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
 
@@ -514,7 +513,7 @@ static void drm_cmdline_test_name_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
@@ -526,7 +525,7 @@ static void drm_cmdline_test_name_bpp_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC-24,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
@@ -540,7 +539,7 @@ static void drm_cmdline_test_rotate_0(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=0";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -563,7 +562,7 @@ static void drm_cmdline_test_rotate_90(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=90";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -586,7 +585,7 @@ static void drm_cmdline_test_rotate_180(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -609,7 +608,7 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=270";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -632,7 +631,7 @@ static void drm_cmdline_test_hmirror(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,reflect_x";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -655,7 +654,7 @@ static void drm_cmdline_test_vmirror(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,reflect_y";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -679,7 +678,7 @@ static void drm_cmdline_test_margin_options(struct kunit *test)
 	const char *cmdline =
 		"720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -705,7 +704,7 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=270,reflect_x";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -728,7 +727,7 @@ static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24e,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -752,7 +751,7 @@ static void drm_cmdline_test_extra_and_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480e,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -774,7 +773,7 @@ static void drm_cmdline_test_freestanding_options(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -797,7 +796,7 @@ static void drm_cmdline_test_freestanding_force_e_and_options(struct kunit *test
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
-- 
2.37.1

