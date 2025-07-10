Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F4B00603
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8E10E900;
	Thu, 10 Jul 2025 15:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEXK12R1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE51210E8FF;
 Thu, 10 Jul 2025 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160153; x=1783696153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EZ/0H/JOAnvs8/ojf5PXmYW15/TfTFdvctqFfzsfn8w=;
 b=IEXK12R1a3e9Q0tyetcPbOJkkPhamsO98GGGvBe3OgiFqDJ8Qfke87zT
 DTFIvip3L3o9bZ/zlQUpoX7DKte4oNeHiSmFhthRRBeeieGauTLi3i9hE
 471PDWd1KkgFTLpzYRnsyOBztLTPdJL7iXw6Uixggp9yx4Tq9B6iG2q1a
 2uhScAhoNsQb4Lt0tcUe6LKgyqbf0OYxGSLVfK7uwv24fcE/UCtFmWDGp
 CMjaqbM1eTZhHKc4zBTXEdYEM5k1jQNffNkaGa1eiSfp3QYelmMWreFNq
 O4oz/FK/kGX++cnScDfm2/NOQNlbWp/VmTeWNEfV9kRN3NjrTkgkEb1NO A==;
X-CSE-ConnectionGUID: HYYeW0gESHiTep6kcjcy3A==
X-CSE-MsgGUID: 8kpKQmhiR5qvcRCMph+D9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54416416"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54416416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:13 -0700
X-CSE-ConnectionGUID: rzwCjY/9T6KJSDxkfcV3lA==
X-CSE-MsgGUID: NWtwqNA+RHmd4ZqmrBzhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160137839"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:09:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyosrQO19Jd6OfQqExvkIxNjH4speYasOkwicHXYVyEx8PadB/xmNZfQeq/7Te25Ejo8obSDictKT6Gbq9Er4Ny8+bR1OuDrfD0Kph2BisVIU7jnHWUmR7cAlfqli5eTb/MMOFzCZaQKnp7keAi4w7M6ug5KluMjJnrKE/rV8U7NLkhMwpeKQoJnyiVAZe5eDhjAIYaTeDA2Dy9pfyo7Y2IyitWU1mIOou+4L8P09LRC5FsXIKtozeQJGgcp1hZli/09REx9x+7EgiU4df48505J44z5vqh2tUxKXUaMRjQZFAjMlvtTIVqi7tZJ40Ba5tl8f3FAlCZvgAcMhyqrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvbGwcIDkrOr5k9NYO11c4euOeLwNfeiNssYtXgaSo8=;
 b=roiBJUWi0BhkMvSdGjJF1f7aAfYvCZunpV/CDZ2Fy2u3rljm0abBrEbhHGZ06z1AQ064JrVeatzI2cUyRRhqnC4GnCFTvLY6i694MitToV2/rQvbY0cyr0JzN3QYS1XezoYgRYgUpg/V6sL/9YOYkOXaPuojuqoKjkTOq+UpOA6DQS94iUm6id2xq8vH7eoyUJOPVK+ou8+jQHLUscHUlRTcsmUUQL4QE7Tv+BV0vQWr3GJjA91+7fbJam3Qpr8wY4CnXPtYo050Ol1Q4H1ZP6jneiLqx7DJNv0RongGd4V5MRi+b7p2VdUSkI/NgpZA7nK0MvhY8MvQzB8diOItZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:08:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/9] mei: bus: add mei_cldev_mtu interface
Date: Thu, 10 Jul 2025 11:08:32 -0400
Message-ID: <20250710150831.3018674-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7ce202-961e-4dac-0625-08ddbfc3a765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Em7KJ4ah5PYg7dk/HgD5HpsAJX0D7yduz2GDottkf3hr0d4RVWo7f4PF8W/7?=
 =?us-ascii?Q?R7hDXWKLw2cimFYnGDCX9FASNsxjH33vGyEep22jK/dov1KgEGwX2XNO5aPK?=
 =?us-ascii?Q?VNGuimsONYnb1zZ7iFDt0VJvnVzGDbL+ZZlzzLawIskuUoCHtmOwgR5TgVFg?=
 =?us-ascii?Q?CJvilgyXZlPcuSaNigRiOURi9spzp3nx6/ceA9mR1VBC1pAfcPt6dSiViDFM?=
 =?us-ascii?Q?v4I5neEXDxEMODp7+rrP35pQpLnVyPUIoltl1h8HB3soG//LjWsFm5bifC+Q?=
 =?us-ascii?Q?+6QgBeSDsd3a6niNzSJXO6NOJ5YxGDLnfB0im7hgIkkz5LDOBPwlToJxHW4y?=
 =?us-ascii?Q?nH2vaOVkJec9MKt7pyTq5Kdc11g/7kZyiRLPb/v1l3PwC99GwCUuppJ53oL4?=
 =?us-ascii?Q?bIRWdOkyjmBvFZrsMEE7Vg3Wsumd1RSTs9kulJEhbbiDlWGDByU4WixjypAS?=
 =?us-ascii?Q?HFjQrqU7nl5JwkOGcVdobCZZA1eCrir0FQFj+Boaf5aVDC40YKw9BqBU2f6q?=
 =?us-ascii?Q?bPQMDIArABc5QYSa2s2BQ6e9Hu6OZwJiTD5AWGz71tIWPtHV8CkQJPiANWJU?=
 =?us-ascii?Q?m+IzAjs9/JiGxNxvRVp/vd/F/4v9XZFk/DNgW2aEzWtAegYBpXXKETcXYG8A?=
 =?us-ascii?Q?9mtaugRbqJTWhc1Pn3Gmdh2O19h85JnvoP22Qbb0fqGP+5ek0HB0DydAR3sr?=
 =?us-ascii?Q?LlGfKhh+PG7sVGx/9vKLce3eNpXhQuxusKsKOUlQrnb7LIQhafv9fKeRmb36?=
 =?us-ascii?Q?JkLeyBcpTWOUCAE6AmPH4C7hlf8ShXieBINivGMrccVvYVwvzEDq1fwJiyQw?=
 =?us-ascii?Q?/mW1gW9io6+L6Pn43mRtX4dY1IpUfCwpHiPAPfCaJTolW1j1AUssFLiE1DwC?=
 =?us-ascii?Q?8wJoP+f/KjkKf67prf04X3uiWVDcATu75vvq6EwOwJ5iMXPGNnUbaa0EJVQ2?=
 =?us-ascii?Q?Sf9oDGNtKJ1Ub6MB4nSaX/mCNUnpF2quMQNxI7aNhDTJNg6Cd2QtohzvMaVZ?=
 =?us-ascii?Q?FUUzlc/QRBuVwZYs1pxtX/e3IEk+yCiDfJgt6XWGrodUtzX9eB9cDjXLuctu?=
 =?us-ascii?Q?v1bc5OSt3a/F9dtABGteAgnRs9HS5yncXbngDpr2IdlFOc/KoAIiPpqbbCEp?=
 =?us-ascii?Q?LPy/DyAElpILnjOMkNCqisO+m2Gwx+0cxsMJefngupHfjQ2Hw5Yr9nlGFyuM?=
 =?us-ascii?Q?hEb7cXcBvv71m0gcW5YBM4l1doQzni66g/92du8O0vwXSOA0IATubs485ckK?=
 =?us-ascii?Q?/Ec4PwlTi1QMtOYV2RGhIVhQ5OVovWku0/dcZT+9/F2YBvD/6+9jicX18OWG?=
 =?us-ascii?Q?DvTXfSPoMeHMBRDn34BXsr2opZkkJ6ttxu4Kfxb8+Yr7IJgUuHWg6RaKSxYk?=
 =?us-ascii?Q?rjKp5wFOq8OhZ+McJtO0yqry5Y+uV29GDt8AhU5rFRMtZ3tJ45Y5HJBMtGnn?=
 =?us-ascii?Q?lPfMxrQ9A2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MlZP7s6A83+BDR57h5en/Qgl3bioDLM9tO+uv04RHdxvm3HgZa4ARx/Is/u0?=
 =?us-ascii?Q?NN+vGpU+vFw3m+p2+Liek4RNbAByBShL2zKZFFINIs2y0KW4W1HuoVpUu1aI?=
 =?us-ascii?Q?SSj+60ybBq0GmRsgd7NJH0PFz6wB6uxFpGroym7ZtzCnvt5nn15X3ZqqjRKo?=
 =?us-ascii?Q?YN1YB8aLb9dkNHiAhXoMs0ntEwyfR/cYXw4jyrQNCe39CjkQ0bCdoiNEi+Kf?=
 =?us-ascii?Q?fUerAwoET2jPVzNzuNmpk+zfsEgLBvDUcLFpviGWFAALAQO1oNeuzByVf4qR?=
 =?us-ascii?Q?gSXDLcH5pbEStSV9j8KrkBSGniS07qmgNTldSwPOLtJsiyAlvnRLoeLcMola?=
 =?us-ascii?Q?2IjALBBiiu4hlwp9J+q8V7vmzPsCowAzGwdkXTDqm6hrB/ijdO11UXx14hFU?=
 =?us-ascii?Q?bTlz9cTXzechwx4nUQp6YtU9uPH8HEH6vp9bFe1sZuNwtN/d5Ebv8tEINcAT?=
 =?us-ascii?Q?JCSiNj9tsgLIAC4p4BRwi1MNew1sKdPQL5FKIBDeSkuOTor9UPBQjBf55glY?=
 =?us-ascii?Q?x7k4CXK9KdsvJmezebFyjFrc5VCytqKhkC8O9P9Qovo53mpNZtVnOy1sJrEf?=
 =?us-ascii?Q?1bAbyKUUXDZ7yaOFKLVWyeGStvPmRNh2FAPwluEGwxSN13W+nmDuuvBG3jNL?=
 =?us-ascii?Q?kgjWLXkzUyg7qa0E98+RNvoR/GXN3RCV2s1AjcZfBiiL12p6Z0tPtK6fUQA3?=
 =?us-ascii?Q?YYhehFc7q7cS9WL5m5m1Tapk2XAzGDUbVBStUtOY62NFQfAVEMe7O9PxlkCw?=
 =?us-ascii?Q?9m4sshTGdyEsLg3h3TDsZ0EqXxQPHaNsPHOs5n0sD6d0G3jZWyvIn6WBZRrf?=
 =?us-ascii?Q?JnFSFPtn69lxXm2CCeA8epV+PY481O179X9FTXRG/u3KVkVo/dkme/szRs9S?=
 =?us-ascii?Q?OvLuxrklf7sER7f6O/3TzPdC/y72TqWYMpZI1tMsgC11fU6CJJivtcsovO94?=
 =?us-ascii?Q?qd45TRAGo22GQ91hD7SGdj/NFCV6yvy5uJCCw/uKGjV2be9Dd4yUNMg9olCU?=
 =?us-ascii?Q?/o5bViNBn9z+OH3KpjULtI49m9TXFpStndVft3jr8q9LQU5e9LWw3Tqis0dU?=
 =?us-ascii?Q?c7gbz1bKFlrwWdc+lLgkCfvOuSxhRqP5blMLaZlnumSuDqqwu6J5WtL2dyg/?=
 =?us-ascii?Q?SVgl+u71DUVi9NkwsDmACWBph2s/QdYxNUxIDmfsTraDTYMqfWDa7DkqSmSQ?=
 =?us-ascii?Q?iu2DkcNhK31MRUuokqo7ezkMWYTCIfxgGoK7ZUk2rshUrFbuINeaeoqnPqc+?=
 =?us-ascii?Q?GtlDCaLMB4AcwsamfVypZAXSeul9cYoN/MraJ5o1FldVWIidtBVLJnRIyDpP?=
 =?us-ascii?Q?XJHxR1VGk6YFMhYDbO+k8iusD6jTqZKxjrZ0CWixuKs4EJvomaIzPX3zjrCt?=
 =?us-ascii?Q?geqMSrwtckqixS40gWMGtikLnQW1GT/thtduf4wgXF8B8aGQLZIlpxIreziJ?=
 =?us-ascii?Q?gIF0HBaKQ+Uk7fW1wE7KY2Qx/4dsoZbn5OMzw38OLRRfliKy7nGhhdPyAIOD?=
 =?us-ascii?Q?bbQt4cwR4sdt6+8IBc5nCtXo5cDOs/Xw9pbWfJroiD78OTLgrfAhbllUgdcu?=
 =?us-ascii?Q?0NA/Fkthrv5TnTZia5O3sBtqfgAb0tb8TUzx0f4fH39kcWV6nY0Uuj05ymps?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7ce202-961e-4dac-0625-08ddbfc3a765
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:40.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3cS0d89m34c4xCzT3tD9CXk0wVFdZQIIapdONjrLKgaeu3J4917OA5aB6enUi84aGX4MxDGXXu+pziar08TjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add a new helper function that allows MEI client drivers
to query the maximum transmission unit (MTU) for a connected
MEI client.

This is useful for clients that need to transmit large payloads,
such as firmware blobs, allowing them to determine the maximum
message size that can be safely sent before starting transmission and
size of the buffer to allocate when receiving data.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

Change in this revision: Proper commit message.

 drivers/misc/mei/bus.c     | 13 +++++++++++++
 include/linux/mei_cl_bus.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..f860b1b6eda0 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -614,6 +614,19 @@ u8 mei_cldev_ver(const struct mei_cl_device *cldev)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_ver);
 
+/**
+ * mei_cldev_mtu - max message that client can send and receive
+ *
+ * @cldev: mei client device
+ *
+ * Return: mtu or 0 if client is not connected
+ */
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev)
+{
+	return mei_cl_mtu(cldev->cl);
+}
+EXPORT_SYMBOL_GPL(mei_cldev_mtu);
+
 /**
  * mei_cldev_enabled - check whether the device is enabled
  *
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index 725fd7727422..a82755e1fc40 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -113,6 +113,7 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 				mei_cldev_cb_t notif_cb);
 
 u8 mei_cldev_ver(const struct mei_cl_device *cldev);
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev);
 
 void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
 void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
-- 
2.49.0

