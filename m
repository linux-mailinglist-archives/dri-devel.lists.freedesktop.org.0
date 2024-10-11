Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95879999B06
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 05:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2610EA25;
	Fri, 11 Oct 2024 03:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQj4cwUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557110EA21;
 Fri, 11 Oct 2024 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728616362; x=1760152362;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=VCQUWrsdXcDMOZMt8VNDG4SYpn6L28Ptchrv0d6rzv8=;
 b=QQj4cwUy/s3JTVAaKGew+JmuvhAUpnRHUGOQSHfRWNuK2fl5YzXlRGao
 rdJjE/8/Wgl2PHF1Yi3wqddxcYaCBrfGzqcImyz70YVbVrHHTNh21xaKZ
 dENkEt7M3jYwufcDGjAHZINlk7JiCghWW0QXVl6ueqtj6OKnlTTqLw0zU
 d7kkZ7BA0tHtlVfVefqwnrTdY/SeQ50dPARPhmtSJ2PM5kyg9q68IBavp
 VHS0MAS693oZ1bLRNKzI+3t0S0JNB5rN01561KUCQW2Sq2mIjmCv2U8Kn
 RvtDISkuGXx9QIfsBmjzSd+gWxEETFH8cze4OQ9mqah/CnK9XNgni3NbA Q==;
X-CSE-ConnectionGUID: vp7Ebo7yRreO/RUqSxoTqA==
X-CSE-MsgGUID: sXvLJoM8TESjtDkoDG2Nqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31908453"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="31908453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:12:42 -0700
X-CSE-ConnectionGUID: x5B6hcawRSOyUZE7X2deFQ==
X-CSE-MsgGUID: q5GaGuvsRNyIskt23Z1Qtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="80785483"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 20:12:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 20:12:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 20:12:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 20:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctSgEj0d+KOsIfeh2DgyldzyoAZjsX/xt/w0RvT6s3E7wurgyd7UPQ7ib9UCayLGfNsYxMLnaS4vNh8pSc90NxrAv84b6J9sKN8Cb8ZedJzu6F1drC3EX+Xc1Brvuxqz2kcwc0n8F3/GYEczQoifpvvzkraq9Qe2uQpfB+6ERd1DMeb/03hSxYmXa7QUG8YOgA1XUEjyXEVRl2IjKt3CYOoaZWf/GDi/btc7MZ/wBpRI5eF6kPZjZPdsHoiH0WhZ9LwagKW1Y6KaTIPt2NMHtl4b1CDgViMCy1YZNKyrQpn1MFO7vHqIKzL50z6b+2E7HE6eRk/X0kC5uZFWVJ9ceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBYHJ6Nfk13FrQxR4Egzh5qhlJNArdbsrd9GDiROdYQ=;
 b=v9RZhIjT7TbxmcedkIzIn+uIK/urDyDejIbBJWq5cjPsyr2DJQut5e8jN0evN//1M4FlyCwS1IAOis/Zx8F5hx0yGWNAouWo97Hf+xUjiq53sIgfD6kEyU+WF3RZiJF2+nGBT3iE00XStTTAHqBjdjHhHbwUpiD6vdSU8UL7W6YXSzrh5C7B5BDQiveB4FLqKMOL0c53o/E+8P4EpuuwV+Lelb2VCoMEniYCfO35EKP9nmggsTvUbHdJrlV86rgAyrbin5K5xZZOz4BNkw/gpSrnkxwabFU29X0OQHrfQ+C1GMB6TOXE46i81O8wKSBFaC7d4PBSv2zeIk/wg0n3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 03:12:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 03:12:38 +0000
Date: Thu, 10 Oct 2024 22:12:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <jri65tmv3bjbhqhxs5smv45nazssxzhtwphojem4uufwtjuliy@gsdhlh6kzsdy>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: fec4aedb-514c-4549-040c-08dce9a28f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+OfO6f37XYldH/137YZ4pbOCXVJXP7NWN9RcAZ4/sFZSLb9EIDwO9SlIcJOW?=
 =?us-ascii?Q?4VwfDSJYWlx7cWiBOO8D29C3IPcZeTQDv56ujiVlrjJMux0UE3rV/Xey7EhL?=
 =?us-ascii?Q?cH/jtWVEF7j8HcKnGsOKa7LvEzVK+x5SgPvvs6bnQchl+/UcevHjY/R+B/vW?=
 =?us-ascii?Q?SR2unmmffO3YdHEoE1TFmeh79njiPsj8NJcEfLL8N/IQXTfgdfwAzh6ljDYv?=
 =?us-ascii?Q?ekQmHo+Gox4WUA7JeMBvmPhYzced51UfpdNx6eI2Xdp9x4YWo1bwHdn4YUND?=
 =?us-ascii?Q?x18XixBeuHRyhvmgWeNUJLhe+YEW3OiX3CWPfzxVA91GfdoxF25lfKbzLdxi?=
 =?us-ascii?Q?EITkyPuVLkM9OfPIs1KH+qhWNfsbmYSiu7hH5DgKpy0+ZWdhqeehPxmOuRa0?=
 =?us-ascii?Q?3XjbgYSEAh97G19IsMNBRJjBN+syjpO6OZVFqjUZABlDBwmnxivJ3vrSsWE7?=
 =?us-ascii?Q?FtOa9rvP+0ONzn/2yr6jVrY2SYlRJl55cHhtYdUIsVwbIOkm/WIZNAzT0BvK?=
 =?us-ascii?Q?U5c56urqlnFmSDN4o13bCdaqX1pS/HL1+wbzlPDm8KKeTFRAF6anKNj9YBS/?=
 =?us-ascii?Q?3PZFqo87h1fEcyGWWmxxSxrrZ8fqJvVs/nL/f5bl3Tx7gXi2sybp1u3ApDh/?=
 =?us-ascii?Q?eBiQCimLtIprHGRAhKuhHPUtu4jV+PT+gMOpAAiV2FcMPBRf6e4fREDKSL6L?=
 =?us-ascii?Q?lPKxPYBeLpcKb8fmxihIh91AIKqBbfszVeeK+Sujnuk2UECXlc8qHuivfDi1?=
 =?us-ascii?Q?vq8rax1nQ/gznVtHyaPBJG3KB3aGoIy8pocNH3+VLvKjWMRTKdfLT8O5UtqR?=
 =?us-ascii?Q?YwgibnJ+sUeiG0lNLw9ww+ouuCDOfjY/NMB0BV1brP9bRh73ssKnG2iFbMD6?=
 =?us-ascii?Q?RvchDQuYXLhrWnksfw3cPmAdZwr+8yPrQ/Uo+Ui/e4lnMvS8kpRRAUXdhc/L?=
 =?us-ascii?Q?AImrUgoG+/uNVb/x4TPHXGUEKGeZqF/nAqVbehzP6UUIG8v9qhUIWeBtVBnJ?=
 =?us-ascii?Q?znatkqem7agm+Ee16MD6CYzhr4gb/F0Y4GgVMY25Kw8gtUH8xDHL3guNDfv+?=
 =?us-ascii?Q?Zp56lXpc7HQKRtd2FbpOz/ESuowAIusvtkd9LjG2UqokemD8m9L4oIYgyds0?=
 =?us-ascii?Q?QQyFavBd/3fZl28LtTTXAQ3U8l93iBeew0Qih7DURx2kJd7td5QPon56gOL4?=
 =?us-ascii?Q?hopJc5YELYc2rQJLE4zmr3nDnwE1DZi4l/hPVB/XutCOlDdCrKzbzn7sHrw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jLSx4Uo3s9jNfOs28wig1OUUACmd7BSkpzScJB2yb1ujt3o/zFmuLZe7u0y?=
 =?us-ascii?Q?iTLS30SA6NsxIYgpCyGUO7a4IRomlzDMe5uvw+LW+JedAy5bL5fy1TtoeMxJ?=
 =?us-ascii?Q?UALcWTBW4LcNXfdd2A1d7rMxnmLW7Qdf7QPNGNUQt0uCHjYaVSfdJ7+jWuLa?=
 =?us-ascii?Q?aC3JLMnGRpxb2gvLdpqMN7EgifZdxRYaE7VnfTO0b+4/BShrf94Vdcz1/FZX?=
 =?us-ascii?Q?Oz6HYGg/688rtydO2ghihPYd1QofFfEtJUgrd93aIo0r2Qgvu5PoRk8a+wjo?=
 =?us-ascii?Q?5vHEIVcjgVu+b8kP+jKht/wGTdXUHx1P7Dat+sVIBV1fnIbfRWB4iOJ7Eu1L?=
 =?us-ascii?Q?4M7iU/tWtjyzTC9KtICUMaGiCjzyJz9aiFP6LlHbyKg+xFT0QJz+smO0/7AY?=
 =?us-ascii?Q?A8Tedx0r+UDQHQ7iin3xBjBtVmmc1+wxcPxYRtRvgXYVgw7Hti+H5W8/pij5?=
 =?us-ascii?Q?VDG326wHdaf5v4pW8XA0lkGMPUM8NB9KmrvFx9kRXWeotRw11ESIVo2kmM8R?=
 =?us-ascii?Q?pJSeazMqIAx2B3MDdbxauhifmiKUq4LWckL4LVO3oqSuaxzIDC9DnNXzzmo7?=
 =?us-ascii?Q?srIPOwshFtMQbb0dvcYoUW5yOlqH3U2pYy4yDUyBnXx67cQAuugGCE6KUYL9?=
 =?us-ascii?Q?KY+/uXD3IHixGxQ5+EKDtTTKjEwKNq4jsjnscXA5SIS/s+nbYP/uviiCD/PY?=
 =?us-ascii?Q?UJ8iP6dDni2/0EJql/mqd9dz19bIMyYZuMMjRs1294+WCO1Fl01agUvwlXyU?=
 =?us-ascii?Q?6wl22nk8C18HP4NCKYGs+v2FYG2FnsU1PpSOxq7rV1bW9Tv3hnHN8CgO1jr/?=
 =?us-ascii?Q?ilm/5MOaMqBiu1h2Weg21Tv+y7vIAqiVGlyNVeDtSlmoKPcraQNRzRJ9lA5i?=
 =?us-ascii?Q?0NHpovIdZinp8O/8Z/KsLoe6UdgK+BbLSR3RA2vEcFlPR9ClFAByJrheEBuC?=
 =?us-ascii?Q?DdBa22RrpMusvj3BPqZ8LgGSB4GNPEQpqm6uGzXFflxo1x+yilUYlfTVbd+u?=
 =?us-ascii?Q?023SjcB2e5N51kjR+FBteVK97Sp9Qgd0SNdHz4femX6DDROepAm5nlFKF8M+?=
 =?us-ascii?Q?RMVE/SQV0J2fDoFKyBd9QYKPRvNNWaOmyjl6kKIqkIaTMnm9pmupH5oasMTS?=
 =?us-ascii?Q?VvTS6tQeAQdKresnL8nLEzq7+dlSRfMDSzU3oEwdzlUDyfvNcZqG9+gUqEz1?=
 =?us-ascii?Q?tcUN2lIP8Z5xGZjcr6knRYn/kcaqQ353mbrvroIRm1hPsEzfnZ1K2052Jgw0?=
 =?us-ascii?Q?8sypRrI2ex1sfRz8f21zYqdK8PZHnQ7ugI6Eg0KWR0Xe4jwDHVV+TETD/axN?=
 =?us-ascii?Q?4+0jFTyO6iBbDFn4MV6bszQEWRu93m7bQ9FCRk75/4DUTyvOsXAFl+FVcMU4?=
 =?us-ascii?Q?avF+R5pCDFgJJFyMdhdO062UfRjiyt1fW2c8TaWN9yDYOsdHyAJKLt3NPnuh?=
 =?us-ascii?Q?gILhBAaUFpy6I2iurjYLIbi0usiIFdY1lcrbpLxPTFxXlfhKUeoG94ZDOMNg?=
 =?us-ascii?Q?aj8LoXCcC8+bKqoRdI2PB9WLB0rg0Ue3NJ1oCIY661ziGVUKr4q2rLDS8voU?=
 =?us-ascii?Q?wO5kl2CaMaJO1504vUs38nlENi7jTI6dr8VLzDVoCfm+/pezgN4FdGqRN64p?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fec4aedb-514c-4549-040c-08dce9a28f7e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 03:12:38.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WudwqBb/UFcDyM+BAg55ZUFBVgNOm4H41Ht2hIKiGOyp4GmysYYqsJAZ5yyllwiJC5OTcw9Pn/Wd5Ly3iUxGfjjos3ZOSO4I36ChuIoUn+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
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

Hi Dave and Simona,

A few drm-xe fixes for 6.12-rc3.

thanks
Lucas De Marchi

drm-xe-fixes-2024-10-10:
Driver Changes:
- Fix error checking with xa_store() (Matthe Auld)
- Fix missing freq restore on GSC load error (Vinay)
- Fix wedged_mode file permission (Matt Roper)
- Fix use-after-free in ct communication (Matthew Auld)
The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

   Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-10-10

for you to fetch changes up to 1badf482816417dca71f8120b4c540cdc82aa03c:

   drm/xe: Make wedged_mode debugfs writable (2024-10-08 18:06:24 -0500)

----------------------------------------------------------------
Driver Changes:
- Fix error checking with xa_store() (Matthe Auld)
- Fix missing freq restore on GSC load error (Vinay)
- Fix wedged_mode file permission (Matt Roper)
- Fix use-after-free in ct communication (Matthew Auld)

----------------------------------------------------------------
Matt Roper (1):
       drm/xe: Make wedged_mode debugfs writable

Matthew Auld (3):
       drm/xe/ct: prevent UAF in send_recv()
       drm/xe/ct: fix xa_store() error checking
       drm/xe/guc_submit: fix xa_store() error checking

Vinay Belgaumkar (1):
       drm/xe: Restore GT freq on GSC load error

  drivers/gpu/drm/xe/xe_debugfs.c    |  2 +-
  drivers/gpu/drm/xe/xe_gt.c         |  4 +++-
  drivers/gpu/drm/xe/xe_guc_ct.c     | 44 ++++++++++++++++++++++----------------
  drivers/gpu/drm/xe/xe_guc_submit.c |  9 +++-----
  4 files changed, 33 insertions(+), 26 deletions(-)
