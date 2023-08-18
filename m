Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6957812AC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 20:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6445010E554;
	Fri, 18 Aug 2023 18:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674D410E554
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 18:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692382587; x=1723918587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JxygctJl2dk10SvuZTse3XRb/QqXyw+9R7RG3N168zU=;
 b=cyLYjWcOVVIPSS+S0MT9VHA4ZgRNGvIDDp6cnufAQN3DbtanTAXr7ZHq
 I5L6wzSE5+8M9aSzyDl14tuBE7QDApIlddWrKFQiiost7fM036Q/YUiTN
 C5hoiV1Hd7ycsTHqqNP6DE1OPAO6gk1yAC4VGLTv87bf+XSbs4aNHno3a
 xaYs/56mjIhi7TyI8GrW0AKYSDc4KsoaepMnFfBssdvDSRhP7QSGBFg9Y
 rOPbAeycTY0QeDdZ05VfLqGh2UIZMh5A6MjLoOzgG1HUnltgxiVjgzymW
 oACRTgqsPso/CJ8XX6W35L9/GI0jQjSrzgOrZbmE7bacSTvH05obkVkvp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358139533"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="358139533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770210311"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="770210311"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 11:16:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:16:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkzfDhOLL1rAyhj3BxtcucLQrcU6JQdeNJHnl9QDdL+kgaW24rmiUQtEL1hKPDM5QW3lEuqmJ1DdKA/KDXscVtkeD1Q3ayEefSTwh98CqXlWMO7HQMTs1M25B6s6Em/EaIovtk2Lu75hPVes5m0aVnDjehpvSL2WuFsP5yt5Os3rlXN7/ekJaEiwk7D5YSjuAatJzitoXwG0aPKPmcEwiKPYY1yEWlyaWPCXFaEmLE9s0f3gTrAEgOzU0hIGWXKQ84BpAEqPfoI/HpeG9YrZM5C9/mVubbo1PYe1iO8WVn8j4Ym0EH8KaeoNZRPJ/oL3ozhc0kf8i6RKRY1gD/91vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRwzyZu/YtO/hFU12wOT+q/3EcEfr0XY+JftF5nfTD4=;
 b=F4Jkdj9RAP6Z/iXV8J6hNIcTvB9oSPlmgaOFVSvh6JHO6RKXk4Em39+gB8h4wTzsCO8T6XgJZOyBm/+sHGlppdkgx8RRfjNjpORru/SACPP0BB/W/CRwPn7CGUpCu5z5YkpTIZs+siRJZHeQr5+TwM6QbKZoL01OqFHUyk2HPrO6uE1nzrfGjIqUf6GRkmk9xGuxZiCaIkDj2Ug1L6HP7P6PMSwF1a60btQ3VaidCJ9b3QFcUXX3eGwNd/+N1LmPxAOutqAnSleApT9PlBd1R6nm20nmhs95KfPSearVXfJXHE2hhOuZc8t8gt/B6QEizwwrUCL9yow+EabePaq3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 18:16:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 18:16:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <daniel.vetter@ffwll.ch>
Subject: [PATCH 4/5] drm/doc/rfc: Mark GPU VA as complete.
Date: Fri, 18 Aug 2023 14:16:01 -0400
Message-ID: <20230818181604.507051-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818181604.507051-1-rodrigo.vivi@intel.com>
References: <20230818181604.507051-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: af21f137-e189-4f68-a751-08dba0173b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKw4gMy9wV0Ccb4P0KymBUDVKe+dfPLM8ztM25kJbmbZCwmXyK0gehYrVIPHPKaqMypxQOMwceGQGdWjqKv9CoQp5iKUMH4vVZAFc8pch11TQWzzrbc01G/+J52zIYYzxlOGileVOeipm7KjxjpqFd81doxVLI4cjZEVXIUE0AHN5wukJHN8MuJn9JNa5RJaEx1hBAP41oRLNrjBv7ME1i1n+p/DCLmrLnmm+HZeQBnI4m+t4ONmdhjiOKx1S9oKGOkNyDe/HWY/Fs4orDksVvzNu6u0hkTOdxEuqRsDFYTFs++ldSP/Cy1aHZKco4pH7QIOxh01E7lgKYgax9tJx+Y7kmeuxPnn75nFVwBgu+rXbju9Y21DbVgYgM0sPRbZ6Y6Ts7WzdIANT/iEUm7htbNTGmmqRl1LZWNbrWaSOp1bmsakNJ/iHwFcWrsO7UrN82A39QbjMD7+uAM2V2rE9c8PN2WwmfpoZg/gyqKrf0OEeQChP0bQWihq5BRY4aRgF/9J6Ei4DcywrY8vzlQICApJm01tPIRkk+3ytSLX3ndKr/uJgEWlNcucsqui2lJA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(2906002)(83380400001)(66556008)(66946007)(478600001)(6666004)(316002)(6486002)(6506007)(66476007)(44832011)(2616005)(5660300002)(107886003)(6512007)(1076003)(8676002)(8936002)(41300700001)(4326008)(26005)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ZwAHJIzx0eX8bBF4KDYsx2g2zWiN0KOe4HwGtvba7Rs5lvhTUAxbBNgQ65N?=
 =?us-ascii?Q?std/kb1MIrdrE7xLIuX4Ycoc1qh5XJOiiBoZrjgk3ytjRNYp6/2TO0/7tZsl?=
 =?us-ascii?Q?b4r9dVABjZ92k9kz4npNt/6MnR69kaWvEttuUMpdXTbhTQryub6pbFc6FZEV?=
 =?us-ascii?Q?amPXcr+pWD7WPDiv26UAPkRpaXQCqX9YZi2TKsrrJyLElfYKC8Y1UezdnB++?=
 =?us-ascii?Q?kqCMMR9G6W5FDQGlzBM/LS3a5rKcDIFA7Z2FjzxFB36ja7+tUS4j+IOgw+hs?=
 =?us-ascii?Q?AUtTSLb+MsL1yXRHLO7yJo0qbawI3CftAAguEQ44Jz8hzpP8pUerTwqE8ofA?=
 =?us-ascii?Q?b63JVkIQJW0qyU7y6EMbT/vQNAcNfFRjPNSvg0rw4+ruSuq3swnsj55Ig1uR?=
 =?us-ascii?Q?27PAlUYc7rGBdkXGhzKhANdZN0Oyf2hVksNj0NZp57ET0uNtWEbJuON2xphd?=
 =?us-ascii?Q?L5J7kTI7xcECdZDhm+UFzAgheQg7hQMXfRE40FRaijjL9ZgFXodFbkec4zt6?=
 =?us-ascii?Q?6Eg01j5t1V0/KLn9iOh77lv4/LODoyRMOLsEoH9FWnH54du571Bzq532OZxu?=
 =?us-ascii?Q?Ap2+UgIkVplViJmrDCGhxKiRs0nX1vPLj95RyqxKdYTzBtHloFei3FfnpIuf?=
 =?us-ascii?Q?OTCcJ2IKNnhIIMUA7PxIqsArwMm+z4Kgfb8Y5I+4yLovZEpLH+iM1/U6hTWg?=
 =?us-ascii?Q?i+14qJ024EL5xDWatZPaqQT2+5IZsYqbPTDVil9JJ/jRGNfQn702w2e+xpw2?=
 =?us-ascii?Q?vqWxl0GNrFDlChGaILT/gs3/hFR1WrT7J60UwtnLkeXdtok4j9/8vHt3TpN9?=
 =?us-ascii?Q?vuSeb3y3ZqqcS7REW8lVWLMERo92Gjzgn3OqcoFoxcWSY3/YWeis8l3y/RuT?=
 =?us-ascii?Q?gQ9heKCfKNI9Bcc4V4jXkAeHO7ZQEpcTqmyXgru3zIJMa1IFq+PPZRDbJdgG?=
 =?us-ascii?Q?Ekg9brxnxwZD8Zs3A25Oi6pSj2zyQi8QfOZsAm9PBWJawUDtqnpdhYodyQPx?=
 =?us-ascii?Q?RFD2izPArG2APHPEhaTrw6BYFYG2obDzCGPyhdc97QYKhI7Dbwyurg4Eb5bM?=
 =?us-ascii?Q?koH0N7CmC7VdtmVrJ4AmUkCDhpt5j0h7aR08SUQOYEpzpOU6+OKlJ3Y70yXn?=
 =?us-ascii?Q?y9Lo2f4QheA9ppucqUTi0n/Mo06ro+LhHFDhUjDIy5ex7HJNqZgzPDDbNc44?=
 =?us-ascii?Q?lGW1LRpFlGfw4UnGBIXi/29Z+344l4E5kzMtCUiuMO+EcBHt/aKJYSbPK6Ee?=
 =?us-ascii?Q?yB4mIbuchMHshgOwpQsT9Ba7Unl5bVS/6Y+MQPUWWSG0ZKI3k5omTz2pm1Gj?=
 =?us-ascii?Q?fwB4X0ke/Gj2eaZEkfLaPipnA6bexOfXg0baAQTG0pQ59H7U7iyWO70qvde4?=
 =?us-ascii?Q?iozjDgGvuYi5AVET+85YXz4E8LlQfIGt9NNQC/41wdf0pSAxEAGPI006gD30?=
 =?us-ascii?Q?/rViExFE+RJdqN533arGZpWPqtF+CI3C7C02FMC4zzeHqRaSW/2q0uup2ceM?=
 =?us-ascii?Q?yN+as9ISgE1EUL9aXKaY05/pvLtZtQz+WPNQWNSpuvWbdu4RQqIeR/qtFjIy?=
 =?us-ascii?Q?rzdSf2GNispcIlEw5twcOEC34f8r5Ne1rhUP91zZIuKWIrTli6S6iyDlwuiP?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af21f137-e189-4f68-a751-08dba0173b44
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:16:24.4735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEw3d8SkXC2Y4bQ9nXnytmAhGmEICD5sbQF0JJ9jDrkJdc2xCOLnSbquuIu+xIpwFjxwrU0j1BAX+Sv9PPU90g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nouveau has landed the GPU VA helpers, support and documentation
already and Xe is already aligned with that.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index a115526c03e0..b67f8e6a1825 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -88,24 +88,6 @@ depend on any other patch touching drm_scheduler itself that was not yet merged
 through drm-misc. This, by itself, already includes the reach of an agreement for
 uniform 1 to 1 relationship implementation / usage across drivers.
 
-GPU VA
-------
-Two main goals of Xe are meeting together here:
-
-1) Have an uAPI that aligns with modern UMD needs.
-
-2) Early upstream engagement.
-
-RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
-track of GPU virtual address mappings. This is still not merged upstream, but
-this aligns very well with our goals and with our VM_BIND. The engagement with
-upstream and the port of Xe towards GPUVA is already ongoing.
-
-As a key measurable result, Xe needs to be aligned with the GPU VA and working in
-our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
-related patch should be independent and present on dri-devel or acked by
-maintainers to go along with the first Xe pull request towards drm-next.
-
 ASYNC VM_BIND
 -------------
 Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
@@ -230,3 +212,21 @@ Xe merged, it is mandatory to enforce the overall locking scheme for all major
 structs and list (so vm and vma). So, a consensus is needed, and possibly some
 common helpers. If helpers are needed, they should be also documented in this
 document.
+
+GPU VA
+------
+Two main goals of Xe are meeting together here:
+
+1) Have an uAPI that aligns with modern UMD needs.
+
+2) Early upstream engagement.
+
+RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
+track of GPU virtual address mappings. This is still not merged upstream, but
+this aligns very well with our goals and with our VM_BIND. The engagement with
+upstream and the port of Xe towards GPUVA is already ongoing.
+
+As a key measurable result, Xe needs to be aligned with the GPU VA and working in
+our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
+related patch should be independent and present on dri-devel or acked by
+maintainers to go along with the first Xe pull request towards drm-next.
-- 
2.41.0

