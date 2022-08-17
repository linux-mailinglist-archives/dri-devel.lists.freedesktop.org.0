Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC35978C4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 23:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C26961A4;
	Wed, 17 Aug 2022 21:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB4EA9421
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 21:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660770785; x=1692306785;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=RwVgcVPUS1L1hSEBr1xmwKGy+CUECHC1Z5zkmigrFEA=;
 b=B+7I5EHEedXjJfTOGv6i9EDF6U1RJhu3XIBeRNo8h5rq76A0egSbBwsA
 pDIqk1Oy8vBLcPITbWq6nCdJQKtKZaHEKxpQ7iJe/+IGm3pkuEX/560p5
 p8JTu2IYHJhvGE7ZUCbE57Y42rejOiglI/W9+OLn8gPnPrfwc+bvmUm+8
 Y1EdHE8yVXpysOeBS5ieXIOWJKwTX5isSIh37fDZ6RnW8k/xpCKLHTura
 KXgIS+GUnO3aBLg+3u7ljEqRxSkpA9+CWrqJlUd/5IuoBlxIzSXXmAah5
 P/YoYO50VhrC+oawPo1w0A7M57sdq2B1GYwQpy+P733Achr4ixNz2EpY+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="272371511"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="272371511"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 14:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="696927738"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2022 14:13:03 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 14:13:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 14:13:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 14:13:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 14:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAQb7zygLT3Qo93e0EkqL/YkmkSMU45ZF9suzY+fNvUDkANJD1X+JV0LCj/l9lbO8fLG4s7LbdylzXH52SLzUuaAcXvnFJLEKwFLomeiXlRLCnmp9X47yybm5Woh71y3xXCs99qQKk0vBGAXoD/rtcN+u3GxeP2YANQWuCX1S0ORg/QAsfuzdx8nllRzyUXlNb/z7b+VDs8plMFdkvLz1/aA4LtQFVJStIHu3i9pyFM7uX8kLl47faDl3Bw8+hYrgNu7uX8MkFL/AO8uq3+BgrqGhzrkBCc3H1o4pr07o6jxqArE2F9KsHj5uEK72CIqYcVOoCf9d/oyFhvqHY35qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nar21nbYFvXK62ERVhFD1m3TzNM1QgL1ui9/zDtlin0=;
 b=ZHoiD0y+UZF90GwmE62wdxAn4/81Cpw7+4AnUnFdnbivYlWDT/8uNdlBrPgKr/AF8mbuKnsGVu0AxJR6R0oFH93/wVOhnThaJ1nrr98CpyMoPdCPUzJCEpThxjIidJhTvOcMxVKXAM7SiEcTf8JCBoIUbp5ZLfUkIDlwFxJuPuZKBAqWXkcGLdvE8jjBpHhjC6yLtttktr6MvRFTixVQwN8t4u6U6h/kJTY7fOsV08wGXszMi9RqGCV7JNf+jM6A+aczV7E94tIKUanuvTsILewWA3raanEHAfGwtkR8TQn2YGN/3o8vG200ur1Ziy3BTN/sKNLDUQW6Tpf9lnmpKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 21:12:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 21:12:59 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/cmdline-parser: Merge negative tests
Date: Wed, 17 Aug 2022 23:12:35 +0200
Message-ID: <20220817211236.252091-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ac850a-8299-4158-8af4-08da80954317
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3xiJlAXg3so8cAzQLlMHmAk0zpZidQEI3BkEWlzQxB6GW210zCQ7Kgm+y0FTblBjayWFqsIE/uteu8/x1MFcgz8tWO+67h69hr7XEENoaoDpO39mI3uYiKytBEFjUAsvEjrrxKqbTWERe1jRM1W9DbpKgIGG3vtqTlVv7bt3rRnHabz0KprOOXuxU4E02F9IXxg01I19OK1xf8sTmkJDks8+rH+q6UZCZASQD3JXvfuDIkynWl1K/axrt3kuuF7I6wPzYeXUDioHmU1M2v1B53fZpsSPBz3gGk9eCYdxVXm7J9M1hmC8AIWkfYS00/yruNDpc/A5GbCaPii+MbJ8mWPVy7zSP/WnRetDlGZjaxXcPCB1QsyOEVicXBv5OVXpUsr1ircucu/6H7wPTaPb3HOUbPI/U+yyKAm3/NyH1C1v2Jci+ccBdF00mdOZIltJTU8Y1bQwr2gWp5ngMAjNAMgS5PqVEAhVzbojheXtNMZgZIGbY5GYyn5n1eXVgvd9LBa/yaF3qClTqu7/Ox2kdeGfTVzKYKVbWTWdSU54WSzl3hDSxKVYtjARwA2ApGvScJKmVKLKevQzccX9c1STFv5iXAJLyALmpDojkrHN6sS/UYlFPZl+rXb1Ascw4js2ek6WpM0w3iW4Sx2e2x/QAz6b+MoL9tG4jt1mBfLXH5hPwK8ShfHBjP7sLiUkFIfXo7Wlln1woY2jjwAsy0luA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(346002)(136003)(366004)(5660300002)(1076003)(2906002)(8936002)(86362001)(26005)(30864003)(6506007)(66476007)(41300700001)(186003)(6666004)(2616005)(82960400001)(6512007)(6916009)(478600001)(83380400001)(38100700002)(316002)(107886003)(4326008)(8676002)(66556008)(54906003)(6486002)(36756003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUM0cEdDNHhVM0JUWHppM2c0UUVZR1dMbkNEc3FDRmRGMUpiZytmemRvdmtr?=
 =?utf-8?B?Rk5tbVo1MmN3dmNDZVpXUmNpWHJGaDlsYlBUUHBGQmhiam1MbEYvMmpMbW8z?=
 =?utf-8?B?MjlSL04vZW55Q2YvT05ibVdISll1eGtvZEtxSWpQWkQ3dHQ4c0srNDNua2h0?=
 =?utf-8?B?K0JkNTk5dTB6OUdoeE0vRDQ3a05uRG15c3p3eU5wQUlXeS9yRGNwY2hoOVky?=
 =?utf-8?B?K1lIVVI2bVMxeTcwUWJWaXVvSlVuUXh1eENWdUZzc3pMdVo3eUJLZlh1dklD?=
 =?utf-8?B?MDZuRUJuTDA2eC9lNG9KUTdScE1xa2lLMi85WTdCN1dXdThjZUY3YllwQ3o2?=
 =?utf-8?B?Q0VhWlp5SUJwU2J5Y09jcTdPa1dJSGRQVGJIOVlSVVp3aUI5Wmc2WnRiSUxL?=
 =?utf-8?B?UDJTL0s1YVNhelB1QmY1U1VkYlNiMWxRek9BdzBEakJkNXBGZEV1MnBIakUz?=
 =?utf-8?B?NVExbjVBeGZDVEoyOFRDNU1rTzJsamgwMU85d2ozM0pSZEJ1UXgwZEJEUThq?=
 =?utf-8?B?NWxpR0VkUmZrWVVLK25XeTBXR2MzREFSZ0l6UExNVkljclVvK2IvWFMzSjR6?=
 =?utf-8?B?UDh3eHRYUXB3YlFLS2kxTThTSmI3bHBDeFdyaHhuRWhBSTFFTjRDYjFZbk15?=
 =?utf-8?B?bHV1ZEtpTU5IYjhoaWYyN1Y1MnlGWlRDS3hRalViTzhjbFlhOHZoejJZR21m?=
 =?utf-8?B?NktVTVFLbjlGcW5DLzEwakNpNUJUOVFqeFFvWEZsVnFnQUlwbjhyclZwM3Rz?=
 =?utf-8?B?MVh4YlJEZGFlN0lodUg3Ny9WcG9qOXRxcU93N0dlK3l0S0ZTamFVc3huOGZq?=
 =?utf-8?B?VnVjMVlHRmdPdGtOeDdJbWhPMTU4TlBPZDFIL2NzQW9uWGg0U25LZVR1NW4y?=
 =?utf-8?B?MG5IekZBZTdIczU0L1djYk9WaGtvMzVsTXdsbVB0Q1ZKUWxHOUJoa0h3dXNB?=
 =?utf-8?B?VytrMmRJNCtlUEdOZndtNkF5UGJnUytDU2tKQUxvZVdzYzdHMlZaRjNDNXAw?=
 =?utf-8?B?ZFFEejNxZGdGcWJyNzVWWW9MaitUUEVCYzRYYk9pUW1hUEc2YmNFRWVTNm1w?=
 =?utf-8?B?UEZQZU5idDUwNmQzM0JlUytlcFV1SnFRQTFkN2o5QWNkNnRPWWVhdjY5TzZV?=
 =?utf-8?B?d1hRV3lqblJUQ3JCeUFTbXBnR1FJV0lNbnA0NVljdkoyWnJGSzNoc3kwKytD?=
 =?utf-8?B?ZTh3QU5vZVVOS1U2dDk1bW04K0pZTjc2U3B2SGhJZmoyV2tVTXk3S2x6bWF5?=
 =?utf-8?B?b3pxYkhXWFd5L0FtUklodmU0WE1WQzZYYkIreXBaUzdjS3NFYUFmWE9EbnZa?=
 =?utf-8?B?U3ZDQ3FXbjYzNWRwTUczR09NU1V1aFdxS1Z3REZ3QU1FNzdhTTJCV05kb0pI?=
 =?utf-8?B?R2JNNk5iNm44cThmcWc0cUo2QXd6WlNGb25WVVhLcHNRM0lXZTl0cXJCVDRq?=
 =?utf-8?B?RGhuYVo5UXZ2ZHdvb0VqUkZHYmlGVXBVbXdlR1dqV0hsYS94SUpydXpjN3BR?=
 =?utf-8?B?UWpicWV6OUIrK1ZvZ2loNmhhS2NZRVB4ZE1MWWd6OEc4TXp2d3cwemNhQkJJ?=
 =?utf-8?B?Y0xSSGVXdzJjL1RkM0VqUVlDMTNOcFAwQWZhUmllRlZHeUZIT0thQU0xUm5O?=
 =?utf-8?B?R2J1OWg1UDlQYk5NSiswVGtjNUF3Q2VSZXhDUjZyZjB2OTBFOVlraUxXRjkz?=
 =?utf-8?B?SVVwQ2dmTEYvbjF4ajlpcjl2dHlzbFMxckx1OXpHbjZKRkhPNTE4N2R1UnFJ?=
 =?utf-8?B?QXhlZzE1QnVMeU5tRWlDSjVpYjJxZlZKb2J6S3A3ekFVNUZJUjJYd3RVc2p2?=
 =?utf-8?B?aGtMV0Jhc3pQOU10bDRKdUxvMnMwdjNadld4Y2llOTNRTGQ5cTlSUDlhR2di?=
 =?utf-8?B?R2VVa0N2TEVEOE9LUG9HMndmNDhjQk5zczRHN0pJUFZsMFRkZ2RsTk03Wk95?=
 =?utf-8?B?WmlnUTZxR0tIcXBNNVRvZnNFdTl5RGV4YlNZVHZmdTVQWWN3QkM4ZHFtaDZV?=
 =?utf-8?B?VDJ4YjJqc0JCSmQxMUM0NG9rUll4ajN1dVdVSmJiV1NQbkRKOXh4SGZkcW43?=
 =?utf-8?B?Mlh1cVlxWlFJeGJyMytNTk1Md2gvTUVVcDJsSDdNdWFlZHZlTDBnWWRQdC9x?=
 =?utf-8?B?NGUzZVV1cEJndTRKUlZNNHlxSUU5YmRWaytNdGxnVUQyK2dUVm4vM1BNVHZ3?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ac850a-8299-4158-8af4-08da80954317
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 21:12:59.1695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/3lgJ3nmp6Bt7ySCWDVQGUpq9QDwWblH2OPoibGjMPqQ9Wu98fpxoyAQaIk6f8X+d+W4W3+1mZSCcKc5hDVjjQPZw9Sav6vzKJmAkp2lok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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
 Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Negative tests can be expressed as a single parameterized test case,
which highlights that we're following the same test logic (passing
invalid cmdline and expecting drm_mode_parse_command_line_for_connector
to fail), which improves readability.

v2: s/negative/invalid to be consistent with other testcases in DRM

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Tested-by: Maíra Canal <mairacanal@riseup.net>
---
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 293 ++++++------------
 1 file changed, 103 insertions(+), 190 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 59b29cdfdd35..3a46c7d6f2aa 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -109,24 +109,6 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
 }
 
-static void drm_cmdline_test_margin_only(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "m";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_interlace_only(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "i";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -149,42 +131,6 @@ static void drm_cmdline_test_res(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_missing_x(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "x480";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_missing_y(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "1024x";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_bad_y(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "1024xtest";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_missing_y_bpp(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "1024x-24";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_vesa(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -274,15 +220,6 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_bad_bpp(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480-test";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_refresh(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -306,15 +243,6 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_bad_refresh(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480@refresh";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -411,15 +339,6 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
 }
 
-static void drm_cmdline_test_res_bpp_refresh_force_on_off(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60de";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -563,24 +482,6 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_invalid_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480f";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_bpp_wrong_place_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480e-24";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_name(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -608,42 +509,6 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.bpp, 24);
 }
 
-static void drm_cmdline_test_name_bpp_refresh(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC-24@60";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_name_refresh(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC@60";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_name_refresh_wrong_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC@60m";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_name_refresh_invalid_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC@60f";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_name_option(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -762,33 +627,6 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_rotate_multiple(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,rotate=0,rotate=90";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_rotate_invalid_val(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,rotate=42";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_rotate_truncated(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,rotate=";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_hmirror(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -885,15 +723,6 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_invalid_option(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,test=42";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -1006,64 +835,148 @@ static void drm_cmdline_test_panel_orientation(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
+struct drm_cmdline_invalid_test {
+	const char *name;
+	const char *cmdline;
+};
+
+static void drm_cmdline_test_invalid(struct kunit *test)
+{
+	const struct drm_cmdline_invalid_test *params = test->param_value;
+	struct drm_cmdline_mode mode = { };
+
+	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
+									   &no_connector,
+									   &mode));
+}
+
+static const struct drm_cmdline_invalid_test drm_cmdline_invalid_tests[] = {
+	{
+		.name = "margin_only",
+		.cmdline = "m",
+	},
+	{
+		.name = "interlace_only",
+		.cmdline = "i",
+	},
+	{
+		.name = "res_missing_x",
+		.cmdline = "x480",
+	},
+	{
+		.name = "res_missing_y",
+		.cmdline = "1024x",
+	},
+	{
+		.name = "res_bad_y",
+		.cmdline = "1024xtest",
+	},
+	{
+		.name = "res_missing_y_bpp",
+		.cmdline = "1024x-24",
+	},
+	{
+		.name = "res_bad_bpp",
+		.cmdline = "720x480-test",
+	},
+	{
+		.name = "res_bad_refresh",
+		.cmdline = "720x480@refresh",
+	},
+	{
+		.name = "res_bpp_refresh_force_on_off",
+		.cmdline = "720x480-24@60de",
+	},
+	{
+		.name = "res_invalid_mode",
+		.cmdline = "720x480f",
+	},
+	{
+		.name = "res_bpp_wrong_place_mode",
+		.cmdline = "720x480e-24",
+	},
+	{
+		.name = "name_bpp_refresh",
+		.cmdline = "NTSC-24@60",
+	},
+	{
+		.name = "name_refresh",
+		.cmdline = "NTSC@60",
+	},
+	{
+		.name = "name_refresh_wrong_mode",
+		.cmdline = "NTSC@60m",
+	},
+	{
+		.name = "name_refresh_invalid_mode",
+		.cmdline = "NTSC@60f",
+	},
+	{
+		.name = "rotate_multiple",
+		.cmdline = "720x480,rotate=0,rotate=90",
+	},
+	{
+		.name = "rotate_invalid_val",
+		.cmdline = "720x480,rotate=42",
+	},
+	{
+		.name = "rotate_truncated",
+		.cmdline = "720x480,rotate=",
+	},
+	{
+		.name = "invalid_option",
+		.cmdline = "720x480,test=42",
+	},
+};
+
+static void drm_cmdline_invalid_desc(const struct drm_cmdline_invalid_test *t,
+				     char *desc)
+{
+	sprintf(desc, "%s", t->name);
+}
+
+KUNIT_ARRAY_PARAM(drm_cmdline_invalid, drm_cmdline_invalid_tests, drm_cmdline_invalid_desc);
+
 static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_cmdline_test_force_d_only),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_dvi),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_hdmi),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_not_digital),
 	KUNIT_CASE(drm_cmdline_test_force_e_only),
-	KUNIT_CASE(drm_cmdline_test_margin_only),
-	KUNIT_CASE(drm_cmdline_test_interlace_only),
 	KUNIT_CASE(drm_cmdline_test_res),
-	KUNIT_CASE(drm_cmdline_test_res_missing_x),
-	KUNIT_CASE(drm_cmdline_test_res_missing_y),
-	KUNIT_CASE(drm_cmdline_test_res_bad_y),
-	KUNIT_CASE(drm_cmdline_test_res_missing_y_bpp),
 	KUNIT_CASE(drm_cmdline_test_res_vesa),
 	KUNIT_CASE(drm_cmdline_test_res_vesa_rblank),
 	KUNIT_CASE(drm_cmdline_test_res_rblank),
 	KUNIT_CASE(drm_cmdline_test_res_bpp),
-	KUNIT_CASE(drm_cmdline_test_res_bad_bpp),
 	KUNIT_CASE(drm_cmdline_test_res_refresh),
-	KUNIT_CASE(drm_cmdline_test_res_bad_refresh),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_margins),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_off),
-	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_off),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_analog),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_digital),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced_margins_force_on),
 	KUNIT_CASE(drm_cmdline_test_res_margins_force_on),
 	KUNIT_CASE(drm_cmdline_test_res_vesa_margins),
-	KUNIT_CASE(drm_cmdline_test_res_invalid_mode),
-	KUNIT_CASE(drm_cmdline_test_res_bpp_wrong_place_mode),
 	KUNIT_CASE(drm_cmdline_test_name),
 	KUNIT_CASE(drm_cmdline_test_name_bpp),
-	KUNIT_CASE(drm_cmdline_test_name_refresh),
-	KUNIT_CASE(drm_cmdline_test_name_bpp_refresh),
-	KUNIT_CASE(drm_cmdline_test_name_refresh_wrong_mode),
-	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),
 	KUNIT_CASE(drm_cmdline_test_name_option),
 	KUNIT_CASE(drm_cmdline_test_name_bpp_option),
 	KUNIT_CASE(drm_cmdline_test_rotate_0),
 	KUNIT_CASE(drm_cmdline_test_rotate_90),
 	KUNIT_CASE(drm_cmdline_test_rotate_180),
 	KUNIT_CASE(drm_cmdline_test_rotate_270),
-	KUNIT_CASE(drm_cmdline_test_rotate_multiple),
-	KUNIT_CASE(drm_cmdline_test_rotate_invalid_val),
-	KUNIT_CASE(drm_cmdline_test_rotate_truncated),
 	KUNIT_CASE(drm_cmdline_test_hmirror),
 	KUNIT_CASE(drm_cmdline_test_vmirror),
 	KUNIT_CASE(drm_cmdline_test_margin_options),
 	KUNIT_CASE(drm_cmdline_test_multiple_options),
-	KUNIT_CASE(drm_cmdline_test_invalid_option),
 	KUNIT_CASE(drm_cmdline_test_bpp_extra_and_option),
 	KUNIT_CASE(drm_cmdline_test_extra_and_option),
 	KUNIT_CASE(drm_cmdline_test_freestanding_options),
 	KUNIT_CASE(drm_cmdline_test_freestanding_force_e_and_options),
 	KUNIT_CASE(drm_cmdline_test_panel_orientation),
+	KUNIT_CASE_PARAM(drm_cmdline_test_invalid, drm_cmdline_invalid_gen_params),
 	{}
 };
 
-- 
2.37.2

