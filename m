Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8FB537C6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06D410EB5F;
	Thu, 11 Sep 2025 15:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHMUpHyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBAF10EB5D;
 Thu, 11 Sep 2025 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757604606; x=1789140606;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=elLS8OCQEBHhk2eauL+C2dP02I1wITlKZdLVaFz12sQ=;
 b=fHMUpHyrGDpl/9+OaLR3+/HANGrJNRTcd848sXeymyq8ws7TMosZ33fp
 WMraKeqn+nb+R+BwAtNIxIjAoYiJVCMvMrDkTYcSJWxcvaA6alQLTEmj5
 FG4QrD8O5unoI+3U4XkE9Oh+mnDgxOsK1CKFT3PxlA13VoLHuAd688Ltc
 LE6q/Vef1cPlX1+8PO5zMDfFPm6oqcsQpN5fHaUgZD6mb5i4qVMX0g0TD
 0K1Mz6N3OGZ4xCTZc8rVV1Y+iC/HQVSVwVxhuL0PiWuFuTkU7a/VB6rLL
 BnrgK4p0AdtpCRreIBcccBl/+CZ9E2q+ubTX4PTbyzL83QhXQ7SZBLXO5 w==;
X-CSE-ConnectionGUID: IwHg6qX6QvqMGu/ITq4GiQ==
X-CSE-MsgGUID: qj4SM4VoS9uImymPz607NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59637743"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59637743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:30:05 -0700
X-CSE-ConnectionGUID: Ad2RVTEOR62yDnB/1tHcLw==
X-CSE-MsgGUID: 49iUViGbSfClYNe8Jkh1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204483143"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:30:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:30:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 08:30:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8KyajHpOIGP1MXyybVxxFTbir20N+2ONcdHf3M1KunriDIl8XxjEdBp9eX2nUdchUJsZR/tM3KZhYE4tp2KloZdWegWLk1zK3UgcAgauZzLVyQbf61fNuqfyM8+QLUnkj9WjZ33Jh9ewyRMG/a2dhqyoQ/AtjlhIzd6onyHeYgXrvSVbtCfCga/N95sfk0/cINubvto9d4qhDD7oddj6bRPZF57Lpn5SAvgfC6iShmUiESf+i/VPI0+A3+X+8FSTgSBSRa/rp9bAj4K/bY1K7P5RyC0tk+sPg2XBYBOScgc0r3Wc56ujJSpULOH0iBujeByQBc+5ShoELfbfhDAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNv1vsHnVLPP0x6J5XDNFQFx2horLuaxvwtyY2ZSjSo=;
 b=qXYnwtOKiP2EVPIMXjtLdLu/ZvJLD+xh8NojIU8Km5oNNh/EWNomRpfxPpmf0snfL5+esTTuWQEM+1X4nG1+dEWcUc2xmP8uPkGot2ycEaHLZe7WcQNGK7SOBTc7oLokQQBZoxnvitntZNiE14EL45H9WUbI4BRVkxt6MZuzZydY3yDxY3T/NffHIgnVdvOLYzInseZ4nreqyVwFyEELg6Bs9FhkMUiGc0ra3rQUs0OLyFdPr0ngUmxGK2AzCgyrfWg/A3Y3JZ/LzWY3g7JRzxrpr9VTtRJoRLD3dtaFTIYs3RreJIr75xL8nK8dcd0seT+oRZGTU4u1ju5MkBHSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:29:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 15:29:55 +0000
Date: Thu, 11 Sep 2025 11:29:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aMLq7QlaEPHGKXKX@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 77502a24-dc0c-4d89-ecd4-08ddf1480f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zPPKZs1XQ4psbxfFJnaNUX9XDhlYGH6yb/Ex+QcrntoYAiVBzXbnnJWqKU?=
 =?iso-8859-1?Q?6mW6MQCKgQ6TzDAhMt3ZmPHupgPhMoWpJuiLhcgVlRyrU6iVEXe5hAXQxJ?=
 =?iso-8859-1?Q?S8GU0PVkP9+7HwlMse+iyCM2mVfKm4K0j1QkuUOGrNYe1WCMCb32JvNuSq?=
 =?iso-8859-1?Q?1BjiHbYEDBjGMtpIIXPonAHwqD7a1NQEm793mKgU/W91l54Ce0HTb5RxPe?=
 =?iso-8859-1?Q?P1+cGTajHYK6XdoQ8lPNzIql6+A5WdXHQZ3LrpUxoPSZW4fl8wl2CmA3bS?=
 =?iso-8859-1?Q?zFuVSc28jf5UyvjRJv3YI8MbLqUVmq/dmXxTVUlp8PQiAG1bI0DNJbaoYp?=
 =?iso-8859-1?Q?oeT93EQ1ySGIqL9ZU20a+nIDuPJwjzISaGQUYuWof0gIKZPQ+fnbB2YJ8M?=
 =?iso-8859-1?Q?k7iUAkrRSEurvKoLr9FDtiqZopZmKuaja3EzDaLyUakT5yCIH8pPlGcpyC?=
 =?iso-8859-1?Q?UBeWpOH4ni4DQe/ZQ2L881jQkUCJui3LsDU/Y63qVBH2UB0MLRrq4o/Ucs?=
 =?iso-8859-1?Q?8PMfjrmMSpvCybhELjKqqV7F1p0hicak0IOlzY8cwaVxUpQqKaz3OfGeXn?=
 =?iso-8859-1?Q?sVQ+bZhX8w3KeHTHmAox36sYl/K9ySWYJwRXmWITbwOJCP3ytBUkKQEJ07?=
 =?iso-8859-1?Q?WA/JcbYy4+ydaQBaUgAJeRrvx4VKiSMXkPbDnuJGsQBR70RYDX6hYJW1Yi?=
 =?iso-8859-1?Q?hBQ9xV5IVljwjS2nSjVcm0ucEUFd956d3rFotarJsMbxPgzGRKvr3AdfTw?=
 =?iso-8859-1?Q?L+DvJMpH5TfIxuocP4yCnsFWeQ5ngjkBNY8bq1NLqp7Tk1VFpds+BUbgl4?=
 =?iso-8859-1?Q?yMX4PUqPxD5Z4/501bzkUHviL2twzSidWCjMoolwCC5b/My+09kkNbrw7H?=
 =?iso-8859-1?Q?7K5v4Mm4TKXjrXxmkWNCEPwURshpyOC2bj2YcxJMcf6NHjmkWeKyQ9hNIQ?=
 =?iso-8859-1?Q?ORt46xh+fh7ZNepGzD+SpHwFA6qCkiNU0JkfLcXqQw5q9YVMFtTGhfJXpV?=
 =?iso-8859-1?Q?XZpM0GlZQ5ig39ZBAjQTkjWsUVv9G6mdwhmWpfTgDegVBhhdS2mTpXGppj?=
 =?iso-8859-1?Q?dfhT4tT8yyVxgJTu/YC+Bdl/4qYloXe2yeITwSg+2Gz1sNNXn9x52Klp4L?=
 =?iso-8859-1?Q?qf0uuJWLPZ7YyqLYvc5fDuq7sOuyN4Qbn91JCRbyhfk3jttr3laErEKk5F?=
 =?iso-8859-1?Q?Cho6hJce4x8iAobRpKUwkNxX5g7VjgWmBBLDZcoSu/SMUbpExiU/J5O/k3?=
 =?iso-8859-1?Q?pfyXcOr/LW8Qks086yIHLAeblF1tJJpWaGVSd7OXErnCBc8Idzl556Wq5C?=
 =?iso-8859-1?Q?eZIGhrn8lwe3UrHfgQe2PXd85YCI3+IvjtSCvVxGgPotuUdZ2wp+HkeCyP?=
 =?iso-8859-1?Q?ZqyCWvX2S6ag9VqPSSnIhDWp+F8z8nfrU+EsoYJ/Hdv1Di1g5cDGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qubmb4dk7SVfMIxkb/BDn+abK3CfYWcXpecNLEdk0HJ9+k50j3MDt6Y37B?=
 =?iso-8859-1?Q?2oKNyHfrgEtzWxKkXn6e1tfNKGnE4ptSHExzjlYM5+DERxiAbJkP0dQw0g?=
 =?iso-8859-1?Q?Hc68QCyH8OoCpfwboSWlfE+6sS/pUMObNfvvr4gjEbAqOdfbV4A90YPJLy?=
 =?iso-8859-1?Q?+ANisXxNc/sRGxM0o+AiLU/76OnEmQLq8qmG443atEmdlGIW7mVVfdd1s4?=
 =?iso-8859-1?Q?m0YsQL7kbf+chC7bRrBXqv8V0wO3SHNfNRQ1cJ6ObtafZ4ei7nzSRgA9oQ?=
 =?iso-8859-1?Q?I3Qm+LJEJyvQ11orycwj0x5V5TK6GtsyC/zE5zLqEMAHHJ1hen3cXRHvif?=
 =?iso-8859-1?Q?Apo0Q+foOYq2aDV/t2gU8Wm7qJOQiWt5ydCnNhRdUk4GLPGi4UI7ZUmwgm?=
 =?iso-8859-1?Q?OytlXjSShEYOZMrreA7tGVibTi18QUEv+jw4XUk0tNwyb7Zs+n8tR8fLXg?=
 =?iso-8859-1?Q?3IHSMXmplSNGrJopqF6hnwJBJ9nCXEVQwjKX682C4TuuprHItOKA6sRyia?=
 =?iso-8859-1?Q?hBN6pJQ0c99JL7nYZAmnOTMEztEKfIgtdNNmO25J66I6Cw7kFgxtrgm9sg?=
 =?iso-8859-1?Q?0Bhj/sJOVVf25hie+mc6Joc5NbOh+NPDIUmbH+RkV8C3BPO1QeojLtTI+N?=
 =?iso-8859-1?Q?+MqVB+CHQBEHxJzSfX7lH9Mo5SCi4/TU+FyirgUq81FUQuMjgQwwDTiPR8?=
 =?iso-8859-1?Q?xbDbNvlWi1kHqoZWKagmrSQ2VBTgV2gKNJUHPBXJOZd8/oXSdC+ps377Ma?=
 =?iso-8859-1?Q?WhpiexRY4VvCRjOnkOngbFZrbrK8zJ6RbLnUocCxPmQUHrvmqAlCILTmtN?=
 =?iso-8859-1?Q?JwC2WwElGTT+DkBAZdYnOIbFyDW7d0mE33uKDLC3TeW/yYZCg9hizUrnh+?=
 =?iso-8859-1?Q?icm8VAelP7ddZygZ+6ZXlIO2eXykSrvL9QjOUW5/+epizXtpS2pX0VKDQ+?=
 =?iso-8859-1?Q?00rPu3ORDzRX/8rH1WOtJDia0AK5rZiT3WRLgyb+ffdxt53oN7gqyyXy6v?=
 =?iso-8859-1?Q?4wjslpVvoliIiP8z0iihYYu+CPYvcx5C0qjKV2EZzLfQCzI7Ptw9H8yqUv?=
 =?iso-8859-1?Q?mIaUZAWWnw7tHRR4jdWGFTfWOboS2fTTDY/qYpDmlFhywhnaSJT8AT7qC5?=
 =?iso-8859-1?Q?aZsbU2LlZ7XKKZZahjFUPBsLlXJOXfkZMp6L59fECGjYLqZ8Q/L+t2emzR?=
 =?iso-8859-1?Q?jKKMK8uV/kHbdYrHjOK0+2p3QxEMS/LaFtjriUcoXQPSDpxwBCgJ4vjc54?=
 =?iso-8859-1?Q?YcjmNLcqIQy/iyKI99vE7WQ5sPJ5QWdZ4uozs4kaxGP9QVDc3GXreL9DRa?=
 =?iso-8859-1?Q?oAMIBttVk+kN8xXUjRzQt2OJcrwQ87q3s3LpUzkctgKdk0UiLs2+nDbreU?=
 =?iso-8859-1?Q?sjEkUTCc+PbQZlM0xneiRPrn631yEEh/yt1hICNfvNAiKCS6TEAGPTOVnV?=
 =?iso-8859-1?Q?NkDxY4geCfF4gBSjzvrILCZLco7qr9DOetGxJXMuOEzj15ErV7sfDtZrI6?=
 =?iso-8859-1?Q?4rrS8jcTffAOqAP2sN08M0O0tQAVEhUFyy9+zHxx89mdgiOfZbv81PeEOR?=
 =?iso-8859-1?Q?qKlMD87iaj39WLhpEDJ4WFJ7ofo6LZexRp1s3iVNe453tV6RO5lYS01vv7?=
 =?iso-8859-1?Q?VmaANw99c+R75xCq82qpDUTfUj5yrgLeWaEGW3Py8Lb3V0wZO/u829fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77502a24-dc0c-4d89-ecd4-08ddf1480f79
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:29:55.8350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx6eUArWu9ledcoJWq2ymXysRQwLsqgWJi80bNEGIlc6kx8//Ifkl/dx2JAOU+PBruWBZRvze//X1R/0gwojYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
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

Hi Dave and Sima,

Here goes the xe fixes for this week.

Thanks,
Rodrigo.

drm-xe-fixes-2025-09-11:
- Don't touch survivability_mode on fini (Michal)
- Fixes around eviction and suspend (Thomas)
- Extend Wa_13011645652 to PTL-H, WCL (Julia)
The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-09-11

for you to fetch changes up to fd99415ec8a80866e5e19f7835876e7b4f294946:

  drm/xe: Extend Wa_13011645652 to PTL-H, WCL (2025-09-09 13:20:36 -0400)

----------------------------------------------------------------
- Don't touch survivability_mode on fini (Michal)
- Fixes around eviction and suspend (Thomas)
- Extend Wa_13011645652 to PTL-H, WCL (Julia)

----------------------------------------------------------------
Julia Filipchuk (1):
      drm/xe: Extend Wa_13011645652 to PTL-H, WCL

Michal Wajdeczko (1):
      drm/xe/configfs: Don't touch survivability_mode on fini

Thomas Hellström (3):
      drm/xe: Attempt to bring bos back to VRAM after eviction
      drm/xe: Allow the pm notifier to continue on failure
      drm/xe: Block exec and rebind worker while evicting for suspend / hibernate

 drivers/gpu/drm/xe/tests/xe_bo.c           |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      | 10 +------
 drivers/gpu/drm/xe/xe_bo.c                 | 16 +++++++++---
 drivers/gpu/drm/xe/xe_bo.h                 |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h       |  6 +++++
 drivers/gpu/drm/xe/xe_dma_buf.c            |  2 +-
 drivers/gpu/drm/xe/xe_exec.c               |  9 +++++++
 drivers/gpu/drm/xe/xe_pm.c                 | 42 +++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_survivability_mode.c |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c                 | 42 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h                 |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h           |  5 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules         |  3 ++-
 13 files changed, 115 insertions(+), 29 deletions(-)
