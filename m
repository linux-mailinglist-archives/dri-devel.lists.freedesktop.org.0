Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A035AD939
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6FC10E4A7;
	Mon,  5 Sep 2022 18:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6221F10E4A7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662403678; x=1693939678;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=mNHEWlVfVq3Z+zxemmY0wVFnO0QYJVQ7YGu3sK/AC/c=;
 b=kpqc9+8WSAYjI1Ob6qveHFRd2TFiuBy80Tf3cj26BOG3/9MMBuAkL7GU
 G35n1hm7OydIf3zZRncIGpKo/HntFnVdBR0niQTSAMTf8/j/9N1pm6r9P
 CLQYm7/ELFNqqvps2hFQqYFSoSxANKB+ZXuEhkQkMxe64lTetjFqjrCOs
 1nvCT8TICcf0T9N/ikccUrqru9M54MHIz0e9U8Ns+4MWFnwMxRd35K8Fc
 YaIrt3r/J5uPmC/6/D4dLLJzY5SA2XVnG3Zewt9MOFaZ4bi7MK8foDDd8
 6uhiAnlIgXKeD9ndD+jkfjhqLm0wojgCXn/51EAnS/mme25fGVUMRU5/6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="360390745"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="360390745"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 11:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; d="scan'208";a="646982450"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 05 Sep 2022 11:47:57 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 11:47:56 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 11:47:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 5 Sep 2022 11:47:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 5 Sep 2022 11:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HV3qeo0xlbVVl0FHPM0kSWEPMOjWQcInpJRrKArJooyiD5O6LotKu1CyJ0PBLISpYWmNubEVzPylguQf7wUGcbAJcOGlpJ8c/eAuQA+YYoj0SmwexfWaSSm/RRnJvhh4t7PfAZAdd24FX7n5jOP+ag4PeWuKCmxmU4C5QLsEi1kV9o5VtWKVWJs/r6B+aVTmhdlDC6ycXRSzGjh0qt/hH8sC4Chnn0CPGzF8HLPHJvt1C57ACJlvL+gbpcSLlk9AfsnqYh0/eEmFJj3WzSlULNyNdNgjnoEzbiqrC0O083gZLn4mgn6YhmQmTZ5C6lhx4fHQVdSyeZ41XgRCscK60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bzDdid4YnPEhRbUtvueNixwSnbi+He/gLdggouIpnU=;
 b=gm9PdNAgww4c1HcjvyP9OqLuI2JbCMtsItUj353MFrKZkGEPeZ9pYA8pfp3+Ra0+nZ6ae5z5iWilLLuJU7+dkcmN24/F1gVImzZEHYXXLg1qxGqqoKacVDa9eHoyazvqSsee51JnOj7o/pbS6uauiedYuiGoRuXbuqhTMaTlkMByA8CTMcppmDGmOFULuIN2ySD1jQGfXiAKgS3ztFUA5Ck5ePqK/igSHMFfnm1ABeEw+LCuX5qziNv8isbv7Hq4Ct4w/juOs2eQrOoCMhxn0V1C6ft+iqfqbeSCSObqBTNBFPIcE475HxCZH9SBnuTGehLMdZjZw8mjXDI0TzIz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5460.namprd11.prod.outlook.com (2603:10b6:610:d3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 18:47:33 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:47:33 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/doc: Custom Kconfig for KUnit is no longer needed
Date: Mon, 5 Sep 2022 20:47:11 +0200
Message-ID: <20220905184711.391022-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 941cb610-a5a9-410f-1ae4-08da8f6f17fc
X-MS-TrafficTypeDiagnostic: CH0PR11MB5460:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dE2IueTn1X6QU0BFZQAiqaWQsSL4i7fH2B2k6OaPAsNFn6ITzEE9ilIV2cK2novbcVyEwetot9aWH3bROEzAm7WHKf8a4GHzSN2xcEt3xgjjVA/t2sWvtf9bv8CuK1emHZDTnHoUqGr5Zi1ddD4rGBJETAr4/bR5Gdp9kCLIijLKYicFH3TOwbk6AukTilUagohHO+XGk2x90c0ne+f36so+jsUpPmBVbCWu9EXBH4NCwsrZa4NwDizL1gvUCxYNnNPjdOX8qW7njqg8kzyg84zujjPckq6AoAVVdRK+AD4G29f3nzVVh459/u7kI5PasV2EJk+grgpnX1AUdsVO464iZszJuqcRUCGSqW3tPI/Kt7V+xeu0bDZtwm9FVqS5UNm35Hd0+h6nXe0pcDBVVwduCMnpzz1gyfO0tkOnUEWSW316IKiaBBWeIgmpyytvEaUXfCnXGqz8/59Oub+OEfgjIS2d74MDvgaE0lu2pYg2veSvFybfNK7wBLR7mevHjG8DbyAEuucfY1+tLhCswu+zyJJNoMzR82k9Mvg7Gnxk+AGpClxfxyV947RjUi307/Zj2r7g6jPwiI3fbNTN+Lj+iPu4cwdKdTumNWLg3Hlm9MvleC3uD3lYaaPWpMvd/cLuxUu8w+iaho6kPC4P0NsUZVUtCtj6ijkRu3q5c9jq3N0h+MzwmnNSSE59OJhL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(346002)(39860400002)(136003)(396003)(82960400001)(54906003)(38100700002)(66476007)(66556008)(8676002)(4326008)(66946007)(316002)(2906002)(83380400001)(7416002)(5660300002)(1076003)(8936002)(2616005)(26005)(186003)(6512007)(6486002)(478600001)(6666004)(6506007)(41300700001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlRLQkJCbnUrLzFXT1dGRDF5TjFIdFQ0MlFuMk5vMit0KzZaMC9ZNjM4MDAy?=
 =?utf-8?B?bURacUxHVFZUS2RGNktWblhSdTlMTUR5b2VadFJMdW5EMnR2Q25OTEJIUEdu?=
 =?utf-8?B?SGRteXFjWWM4TTFRYU5RMTAzQnA5aU04UWJ3M1NRbUYzZFdXSStkVCtJbmhi?=
 =?utf-8?B?K0ZjOXBKOHJNbzRNamMwVjlMOUI2UmtaUnkzTll5Um5HRTloVzBZdkNpTkdz?=
 =?utf-8?B?a0Q4RThQZmlxQVdweVp4cnlBaDkwTEZLbWdhck9MRkhWczNRZWM1WnhjYXVB?=
 =?utf-8?B?dWxwTUxnU2JwbklVYW5HTzZreVNKZHdHa0tIU2Q3OTRTc3k5TDdmN3F3VlI1?=
 =?utf-8?B?QnMxQVZhajhTdE1HZGRQbWtFN1FGUXVhVXBydUpmN0dwME8xMTFQNmlaK3cv?=
 =?utf-8?B?KzZKVlZxWHphRHZnQVdzazlIUTcxaWVqZ05RTWxxRWxLREE0M3pSbVI5aU9C?=
 =?utf-8?B?TDFpY0dxZzNTaVRxZ3RaS3dMYjhBRnZSQWtpc1NuemZCcWtPUzVjUGZ3QWRs?=
 =?utf-8?B?RUJ5aUw3QzJRMXNVN1JCTmh1cFhQYUlWa04ySHhqQXkzN3g5blpSWGs0MTB5?=
 =?utf-8?B?cFpxWEhSM1dUS3lxM01KY2p3enUvSjFoaXBPQ1Z1LytVelJ0Zk81ZWJmVXhz?=
 =?utf-8?B?SUd4bzYwTWVIbjZZdkdocWRETTBlT2tONkM4blF3NGRqZ25JV1VyUnZQRVVT?=
 =?utf-8?B?SmZPNHEzd0NiWHpWMnBVZ28rSnRYSStJZlp1VDcxWi9DVi9UOWpvOVR2ajM2?=
 =?utf-8?B?ZEI1bDlzV0o5Wjh6RFFBRE9HUTVPajlGMzhWUi9wMUZqSVZnc25TQTBOaUQ2?=
 =?utf-8?B?RjNHTUp6eU1ZbkZ6QlBteU9uK0NydldvaTVJT1BGTWlyaFlCeFd5bTVRcXU5?=
 =?utf-8?B?U1ZJRE1jZnF3c01aejgzOVRKOUsrNWdaM1NraW0ySy9lamNyWVI2VHR3aVY4?=
 =?utf-8?B?NTZOeUZuYkFmOHRmTUUzLzZGWlBJL0h2VGE1SDdnV3d5QzZwOGJvYUVHNURJ?=
 =?utf-8?B?dTlBRUtGYVlMMzB1T2lDSDYzWE5Lai9hQXJ5L1NIK1cyZWRxR0tKeEtTTFV1?=
 =?utf-8?B?OUNVQXUweC82WGdNeTJtNVVVSUtzVzBQdmVnSm9PdWFETVJwNi8xM0hOMGNt?=
 =?utf-8?B?aFpRTzRucE8wbWh3NTEzWDQ3aVVQUkJLbEVuSmtLQVBsQXJUb2NrdFdGS2po?=
 =?utf-8?B?d1FOYkVuUWorclB5cFRZcHM1RlBDWGlvY28vUTU3TTh1RDhqZVl5dkhGN1o0?=
 =?utf-8?B?b3hMSkJMNFFLaGg2YWRRbEZxWWgzVUtEQkl2REVOUWJqM1RvS3FHTTViUUxu?=
 =?utf-8?B?VS96czJZYjVMMFpBdktYaWh1MlJoeXRlUjJrUWNDb3BDR2xlRmFIcE9MMjFH?=
 =?utf-8?B?VzBwK2lSTnBsb0t2OHZpbUVhR1VINk5ZN0tNWHJKN0Fkd2ZncDBIVjFvS1hT?=
 =?utf-8?B?MHdkSFpIR28zM0F5dXJBc01EdEEvck5RS21zby8wSmFUaXVxdG1DZkU5YnVX?=
 =?utf-8?B?UG1ZZ3o5OSt6Q1d2R0FXS1VsaFlzdWE2RVJoeGFIbjZYZWtaMS9pcUFpQ1c3?=
 =?utf-8?B?MzhnQWxkN2xEc3ZWYVROVUFOUSs2dHZVZW5OUXRZOTRvVlNWdUlUVEg3VEht?=
 =?utf-8?B?eXVnajlIY0pDckZiM3orUTRuMUhaMjNXRXI0SDRkZVB6OUozS2xFSU5XQ01P?=
 =?utf-8?B?M013ZDU3czFxUTNMSk5WQmdtT3c4OVc3THJDOHJNODdiWEp0YS9CQ1daNjlj?=
 =?utf-8?B?VHdTRmE5bG1pbXJjR01aUisrbENGa1NlRU1LTVBsUm0vSGpzMHpJOG1xdXIy?=
 =?utf-8?B?TXBtWmJ2Ui8zdTd6eCsrMG1RTnJkblRTWFU0Zlc3N0U5ckVyYlBtdGFCMWs1?=
 =?utf-8?B?bUcrVWFobzFqMzJDU2hDcWNvR1JQNVo0SU9LU3NRRTdJU1JpNCsrcjhQMldq?=
 =?utf-8?B?NlFhajZNS2NXRk8yRkhNck9yeCthUGE5aXJWN2lFVzZzSHFqdWNVT3BMNUpw?=
 =?utf-8?B?Z25NdlJ4R3lWeFFlQ0lsMndxeXgrQU54YWpIMmtSSDRMY2tyVHVYVllFRFkx?=
 =?utf-8?B?am9hVnFDUENVQU0vYUJheEU5d3B6TEhwdzRmOGtGWmRIYXp2MG0yLy9ha0Q0?=
 =?utf-8?B?SmtsNjJFb2VudmNEdVlEWFJCNVRkcXhRWjdScm1iMmExQjVBS3ZJVkJLaTNM?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 941cb610-a5a9-410f-1ae4-08da8f6f17fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 18:47:33.3958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rcq2QMsKNGX7BMQwVrItjDXWuWzGngJe7/Hwya8oTXkk/njkQGXlGjWEFntLv6dsdIlugffm3oJyvDxUBmHwJ1ChbfNA/Fv3g8wBbU1LIOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5460
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
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Javier
 Martinez Canillas <javierm@redhat.com>, David Gow <davidgow@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When built for UML, KUnit provides virtio/PCI, which means that the
DMA/IOMEM UML emulation needed by DRM is already present and does not
need to be manually added with --kconfig_add.

References: commit 6fc3a8636a7b ("kunit: tool: Enable virtio/PCI by default on UML")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 Documentation/gpu/drm-internals.rst | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 5fd20a306718..c264a9587d21 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -228,16 +228,11 @@ follows:
 
 .. code-block:: bash
 
-	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
-		--kconfig_add CONFIG_VIRTIO_UML=y \
-		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
+	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests
 
 .. note::
 	The configuration included in ``.kunitconfig`` should be as generic as
 	possible.
-	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
-	included in it because they are only required for User Mode Linux.
-
 
 Legacy Support Code
 ===================
-- 
2.37.3

