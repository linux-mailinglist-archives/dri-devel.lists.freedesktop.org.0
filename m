Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C66E28D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689A810EE25;
	Fri, 14 Apr 2023 16:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26E710EE21;
 Fri, 14 Apr 2023 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681491458; x=1713027458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wgs7pyF71CSc2cljpdEEopqjXP9sGVTgDKIk7Eplzgg=;
 b=aNKg9YpaWXJV5thtnjPjT04MxdNtfNrPdyGSIeJcT/zlOiMZfSdrahny
 5YV3sBpJ8hzphAQQmR+cKxuuV3PD5Hgmx7QlYKu0u765sqRihrIZYvavr
 uXG6BNn62p6cuTWwWFjLipPN8LtlOonmieZR5V6S3wDAMzhi4jVPQkGh+
 GvhDrxkMuB56Zh6ztKI70wgVkfahbVnZ+ZNDo7fY8LEA2GPJrlwc3HmzY
 mTjb5p5Z0LNCCyqLnoAAtVbXo8mNzoYzbwUQGgku6Timyn9Y0UlhFYanE
 gXXV23KKUY844esKBZEsbJ0v7gllztT0agXqBy7br3jCT2si691o0hrSj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324862866"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="324862866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 09:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754509843"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="754509843"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 09:57:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 09:57:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 09:57:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 09:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9tcd8zhkThknLvT8/kwAzHY4zoQN1Ucd+LFDDaUdGARpoPJ/7kCgGVWReW/KAHZCiEEsk/t1ozZe/gqtw+VY25uV2Ev8DFP34OyGDonU706NrKPs0EcJk5LLAZgJcSp3AD8wYq1hyXnO5mQk1Nq8+H+oyTiEJcoGfhQnj3HY2wq14+4j+9NvOeZ4kz38NVeLisfwlYv2cg+Yz2E0vqA39Zzibhboy0MPspJwCsp7Y0mN4jmNuj9hdhvokWsHda4Jmts+2PP5xeKK+aOMKw8HeuijRmNVl7FLbYcirz/lHObA0wW83FLn8f7X+z1mmdC/ZV4CaVoYvBWrnNJDS6hOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeeEcgTVcZgTsjw2FEZ6piWD3pqPQ1UnxzvcK1StaFg=;
 b=T/kt6yzh2KWsVnEgHbErYbgpk6aG+TY+W/t2p30YlRGxcrrt0jl+0TieTv9QETklTWNYJmxKRH/8IS/o3XKQwFB5HKG5w/1uJtw59tF/jU3TDFSpJH1AS1hg0635u/sRpOa7dTFPj/6vShZUTL6JUUiWNDMJsfRdl4grXrvtvTbGMIJSUMWH10wtchoWuwwYwHsEayMNfrcYOjtekcy4c/ojD6K1EczbmIeqrzAMq61m88cx3VufkTJxVkj0BEeaJrOAZLH4X4Yvhd3KZ88Oc0VtDJZ2qQRnaqxkZ0HwplNVz7Q/KxUCHUmgvkROiACQrEPdwfz5MDaa5vT6LyRKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Fri, 14 Apr
 2023 16:57:31 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534%4]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 16:57:31 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC PATCH v2 1/2] drm/xe: dependencies for next commit
Date: Fri, 14 Apr 2023 18:57:13 +0200
Message-ID: <20230414165714.2969708-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414165714.2969708-1-francois.dugast@intel.com>
References: <20230414165714.2969708-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|MW6PR11MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2922f2-5745-4125-2962-08db3d095615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4t0qYEGJAxl5xebv1K+mLEiKsrUQoyrYY0TrhCvhOh0UkvPiit9gd1AX5iQnlN6fWK23WjgMH3KLEs6t31MK+SAJL2dBmFYOJ0RslOTZQYnTpWtiMHHiiwmpWulS8OJb7Cg8vDxTm9zCHRmD6/yvm3uqyCkdfIYU7m5vtAx1Cdst8/xHKbl5YeTlkGnyXsnLt5M4in08nLaYHSzZgCArakh+afwhhmpZBN25rK5prxNKQT5gLGZn/1w75XNBizJfZi3Sz+tKX/ICX1Rb0QiCpyJVbGGjE4fGpoEZ1tSeljjgQK42GpIIFGj81uS1Vey+Y1jSnRFkz879LUh5q5uPQPqYOuCYCFV9fhJrUwfOHHGVepmvp9p5D2KHZzThwyl7taW6yJ4wIr7BeOHOUD50we7SDiWmdAFsbaAya3hymHjjEWwoy/wgE5nmxGTOxLv/qYNHZKrd+lmOQrEJY8V8twPRa1l0f1uXU/dsF91Ihyr8dGeHjJE7QrIiXI9VItjAjJT7Ezk7vScIpTifIzGgFx3AzypQ5xUFnBmpbv7whvyObB2ttpqE3wDaZtx7kH6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(44832011)(82960400001)(38100700002)(5660300002)(36756003)(30864003)(2906002)(8936002)(86362001)(6916009)(8676002)(66476007)(66556008)(41300700001)(66946007)(4326008)(2616005)(966005)(66574015)(83380400001)(186003)(6506007)(316002)(6512007)(26005)(1076003)(6486002)(107886003)(6666004)(478600001)(579004)(559001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUtQZ0VjenVxTG5xZkNjZVhpQWIwNGtOekl5UXBSM3JWdmg0TTZPUC9MQldj?=
 =?utf-8?B?N3NIU3JxZWFxWktvTnhHMnNJVlNwVlZXMDBoNk1TSGo0ajRLZWxnZVVRaU5C?=
 =?utf-8?B?Q3QwbW84WnlSUTQvamNueDR1dU96eWo2bjd0c0llb3ljOWVvTTY1Vzd0YW5Y?=
 =?utf-8?B?dnIyVFhEUUhRaWFITzdjTUNoQ3ptbHo3TDRiTkM1dGFyeVFWdUJqN1NRcSta?=
 =?utf-8?B?dUR6d1IzcEJ4TGFlWXFBS3JZb3RrVFo2WmtpNVpOcDBMV0QrdHdVN05BZFRy?=
 =?utf-8?B?L2lPaldMWlJRalFXL3RtcmwybXRkcnRDVDhHQSs5OTg3cGxseXQzd2JkaW4z?=
 =?utf-8?B?NStGamQzeUV0VG5vY2txaEZicysrL0lZb0NhRTVKekdXMVloTGJSaHVEeG5r?=
 =?utf-8?B?Yk5STElzQk9JZkRwam9HM3hVdFhwWm0xdUpHSGtyNnZFSWdkNjhvbGJZYURJ?=
 =?utf-8?B?QTF1WFdtcjhsZ1hGOXlGT0VBVFRzOG01WjFtRks3QlJDSGZyMERGQktDTTJj?=
 =?utf-8?B?Q0dCZjJVTURYRDhOOXJaam41L0doTSswR3NRV3ZuVDhWeGFUL1VLVWVQMU43?=
 =?utf-8?B?cDRsTEJnK3doWnZGMGlSSVNZSDZndHkxSHRXV1Izdk5iZi9kNUtFb0VLM3BN?=
 =?utf-8?B?Tlp2Qnp1QW5XL1l4Q25wUWJ1NUtqdERyOU5yMUJoWXI4eWo0Q3RoNjM3S0hK?=
 =?utf-8?B?RnJPRFE3b1FjckduQXlFdnorcldlTUloVFFLTW04dWNHSHhsOUs0S216S2ti?=
 =?utf-8?B?VzJDUlRobzJjSjQ1eVU4OUQwLzdaenhCdS9vU256M0llemlhelM1bjFIaG5M?=
 =?utf-8?B?QjR0U3I4b2YzemdSRlRHTG9COFM4dzJaQzJuU1JISmFjSFlrZFFPQURSNTJh?=
 =?utf-8?B?NVFxTlhhVDlzNk1ETTg1VXQ3TC94SWpCWHdpNkdMUHdtWDBqVitTTkN0RGdu?=
 =?utf-8?B?ZFAxNEhYYktyb1ExTTgwZkRZQ2I4M1RCVHFJNE83ZHNrSjVheWZvaXdxVk9o?=
 =?utf-8?B?MDlYTHJGemZTNFFOYVlWSUlHZFZ4aU41MVdRbEF5a2RISlA0MTc1M05IcUNO?=
 =?utf-8?B?SldhbDgyU2s0VHpMNWdXa0h2YmplKzVxQU9tQTNMbklJL1VtcU5oSDYzV2lZ?=
 =?utf-8?B?RHhueXdPNHFua3FSbUcxcGhoemgxTjRDTGN3eEVxRkhsRzR6TE5xVkd6SVha?=
 =?utf-8?B?Rng1WVU5VVZxZ3dQL2Zlb0lrWEV6VUlxNjdsQ0xwRXQwbkhESFN5WStxOE9I?=
 =?utf-8?B?RDhOWFl0UFovLzJ5dHM0Tm9vUDM2MlpxWkptcEFtQmYvNUpuclpIRmJMMVRy?=
 =?utf-8?B?U0xpclFic0NOQ2doT21ZSGFpaHBsUEZPRHRINnVkTjJLR1FDbndCNGo5QzN6?=
 =?utf-8?B?dUVFYTFDdXI3bFZaYW41S0N1UWNlQ0EwN0lRZlFuQ0U2TE5GTWEwZUJxZC94?=
 =?utf-8?B?SHRIcU1RRW9qVk5qU2x0ek11SEc1WmQzanMySUJ3NzdITGJEVFdMKzhWa01Q?=
 =?utf-8?B?ZE92YXdjT0pDSTZiL1JpenJkTlRJSmwwSjRkVUhKWCtDRityT2ZwR0t6bUZI?=
 =?utf-8?B?Rlpwd0xtNXBvaVFRSS8xUWJ3VFM2M0s0cGFzSDJFSUdSRk5aV2dGL0Fqbktl?=
 =?utf-8?B?NHAvMld5emVWZXBiZmpaM0JiS09kdFFMMzFNZFBzRDVzNEM1SlVPaE9sZHRJ?=
 =?utf-8?B?Q01RNlBLYS95L2ZhbHZXWnQ1YVQwN2xoQ3RyaER2ZDZZTFl2STJ4US9VcVlJ?=
 =?utf-8?B?SERoMkEzNWJSQkxSdGNGbVNlVHR0ZU01cGltYmdRa3ZMSmJDcm85aFFsSFl2?=
 =?utf-8?B?d1NvRG1lY2lPRkpvYitKMklFNGpXK0o1dTJhVUZZL3JBYjNoRHplZnVmR1pH?=
 =?utf-8?B?TUVYeFhZR1pwNmVDUnBIOGtiUldtUGgvbTdpT3dNWWxwS1hWaElGdFVJMHY1?=
 =?utf-8?B?Y1Jsd1B4Nm9iTnNSTGh5bjRUaWFROUF6RkZRVDB5OW9IZW5YNm80S1NYdFU1?=
 =?utf-8?B?Z3BWL3pUMVhFa2NGUHNyZEFIalBEQ2FpdEhJeWF4eUNsR3NxMlZMeGhoNXY0?=
 =?utf-8?B?Y1ljeDBSdTZzWHlpRjFUV1RMTkVmVTRqWUlNUitNUVZwMGxZMEFyUHJlakV0?=
 =?utf-8?B?S3VWcENZRGdKTTBRWE1KeHVoZkhzNCs0Ull2VjhkNlo1U1BHZzk4cDdvWEtE?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2922f2-5745-4125-2962-08db3d095615
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 16:57:31.4944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYEeugh+TyQ9BiZ6nWogxv7YR4lDzWUfzqRKT++Fby0q2bJSXmgGBIVkfJ4o44c3xnBTssuiKkuuuVS6u+6hUY+fPWjQqKTnX9/HbDkdR0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
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
Cc: lucas.demarchi@intel.com, Francois Dugast <francois.dugast@intel.com>,
 dakr@redhat.com, christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit only here for others to test and for CI to build. It
is a squash of work by Christian König and Danilo Krummrich:

https://patchwork.freedesktop.org/series/114464/
https://patchwork.freedesktop.org/patch/530670/?series=112994&rev=4
---
 Documentation/gpu/drm-mm.rst                  |  12 +
 drivers/gpu/drm/Kconfig                       |   7 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 302 +++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c   |  71 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h   |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 210 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  42 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  77 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  86 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  32 +-
 drivers/gpu/drm/drm_exec.c                    | 248 ++++++++++++++
 drivers/gpu/drm/qxl/qxl_drv.h                 |   7 +-
 drivers/gpu/drm/qxl/qxl_release.c             |  67 ++--
 drivers/gpu/drm/radeon/radeon.h               |   7 +-
 drivers/gpu/drm/radeon/radeon_cs.c            |  45 +--
 drivers/gpu/drm/radeon/radeon_gem.c           |  40 ++-
 drivers/gpu/drm/radeon/radeon_object.c        |  25 +-
 drivers/gpu/drm/radeon/radeon_object.h        |   2 +-
 drivers/gpu/drm/radeon/radeon_vm.c            |  10 +-
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_exec_test.c         |  73 +++++
 drivers/gpu/drm/ttm/Makefile                  |   4 +-
 drivers/gpu/drm/vmwgfx/Makefile               |   2 +-
 .../drm/{ttm => vmwgfx}/ttm_execbuf_util.c    |   7 +-
 .../gpu/drm/vmwgfx}/ttm_execbuf_util.h        |   0
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    |   2 +-
 include/drm/drm_exec.h                        | 115 +++++++
 34 files changed, 924 insertions(+), 620 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
 rename drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c (97%)
 rename {include/drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h (100%)
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a79fd3549ff8..a52e6f4117d6 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -493,6 +493,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
 
+DRM Execution context
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =============
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e928284b4357..c15e9aaa0eca 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -80,6 +80,7 @@ config DRM_KUNIT_TEST
 	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_KUNIT_TEST_HELPERS
+	select DRM_EXEC
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
@@ -201,6 +202,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 66dd2c48944a..9c4461f0a665 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 8cf2cc50b3de..ef1994798f89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -53,7 +53,6 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 01ba3589b60a..dfb41d56d236 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -25,13 +25,13 @@
 #ifndef AMDGPU_AMDKFD_H_INCLUDED
 #define AMDGPU_AMDKFD_H_INCLUDED
 
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/kthread.h>
 #include <linux/workqueue.h>
 #include <linux/mmu_notifier.h>
 #include <kgd_kfd_interface.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_vm.h"
 
@@ -69,8 +69,7 @@ struct kgd_mem {
 	struct hmm_range *range;
 	struct list_head attachments;
 	/* protected by amdkfd_process_info.lock */
-	struct ttm_validate_buffer validate_list;
-	struct ttm_validate_buffer resv_list;
+	struct list_head validate_list;
 	uint32_t domain;
 	unsigned int mapped_to_gpu_memory;
 	uint64_t va;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index c87515210c4f..24887bf8709a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -27,6 +27,8 @@
 #include <linux/sched/task.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include <drm/drm_exec.h>
+
 #include "amdgpu_object.h"
 #include "amdgpu_gem.h"
 #include "amdgpu_vm.h"
@@ -905,28 +907,19 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
 				struct amdkfd_process_info *process_info,
 				bool userptr)
 {
-	struct ttm_validate_buffer *entry = &mem->validate_list;
-	struct amdgpu_bo *bo = mem->bo;
-
-	INIT_LIST_HEAD(&entry->head);
-	entry->num_shared = 1;
-	entry->bo = &bo->tbo;
-	mutex_lock(&process_info->lock);
 	if (userptr)
-		list_add_tail(&entry->head, &process_info->userptr_valid_list);
+		list_add_tail(&mem->validate_list,
+			      &process_info->userptr_valid_list);
 	else
-		list_add_tail(&entry->head, &process_info->kfd_bo_list);
+		list_add_tail(&mem->validate_list, &process_info->kfd_bo_list);
 	mutex_unlock(&process_info->lock);
 }
 
 static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
 		struct amdkfd_process_info *process_info)
 {
-	struct ttm_validate_buffer *bo_list_entry;
-
-	bo_list_entry = &mem->validate_list;
 	mutex_lock(&process_info->lock);
-	list_del(&bo_list_entry->head);
+	list_del(&mem->validate_list);
 	mutex_unlock(&process_info->lock);
 }
 
@@ -1013,13 +1006,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
  * object can track VM updates.
  */
 struct bo_vm_reservation_context {
-	struct amdgpu_bo_list_entry kfd_bo; /* BO list entry for the KFD BO */
-	unsigned int n_vms;		    /* Number of VMs reserved	    */
-	struct amdgpu_bo_list_entry *vm_pd; /* Array of VM BO list entries  */
-	struct ww_acquire_ctx ticket;	    /* Reservation ticket	    */
-	struct list_head list, duplicates;  /* BO lists			    */
-	struct amdgpu_sync *sync;	    /* Pointer to sync object	    */
-	bool reserved;			    /* Whether BOs are reserved	    */
+	/* DRM execution context for the reservation */
+	struct drm_exec exec;
+	/* Number of VMs reserved */
+	unsigned int n_vms;
+	/* Pointer to sync object */
+	struct amdgpu_sync *sync;
 };
 
 enum bo_vm_match {
@@ -1043,35 +1035,24 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 
 	WARN_ON(!vm);
 
-	ctx->reserved = false;
 	ctx->n_vms = 1;
 	ctx->sync = &mem->sync;
-
-	INIT_LIST_HEAD(&ctx->list);
-	INIT_LIST_HEAD(&ctx->duplicates);
-
-	ctx->vm_pd = kcalloc(ctx->n_vms, sizeof(*ctx->vm_pd), GFP_KERNEL);
-	if (!ctx->vm_pd)
-		return -ENOMEM;
-
-	ctx->kfd_bo.priority = 0;
-	ctx->kfd_bo.tv.bo = &bo->tbo;
-	ctx->kfd_bo.tv.num_shared = 1;
-	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
-
-	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
-
-	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
-				     false, &ctx->duplicates);
-	if (ret) {
-		pr_err("Failed to reserve buffers in ttm.\n");
-		kfree(ctx->vm_pd);
-		ctx->vm_pd = NULL;
-		return ret;
+	drm_exec_init(&ctx->exec, true);
+	drm_exec_while_not_all_locked(&ctx->exec) {
+		ret = amdgpu_vm_lock_pd(vm, &ctx->exec);
+		if (likely(!ret))
+			ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base,
+						   0);
+		drm_exec_continue_on_contention(&ctx->exec);
+		if (unlikely(ret))
+			goto error;
 	}
-
-	ctx->reserved = true;
 	return 0;
+
+error:
+	pr_err("Failed to reserve buffers in ttm.\n");
+	drm_exec_fini(&ctx->exec);
+	return ret;
 }
 
 /**
@@ -1088,63 +1069,39 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 				struct amdgpu_vm *vm, enum bo_vm_match map_type,
 				struct bo_vm_reservation_context *ctx)
 {
-	struct amdgpu_bo *bo = mem->bo;
 	struct kfd_mem_attachment *entry;
-	unsigned int i;
+	struct amdgpu_bo *bo = mem->bo;
 	int ret;
 
-	ctx->reserved = false;
-	ctx->n_vms = 0;
-	ctx->vm_pd = NULL;
 	ctx->sync = &mem->sync;
+	drm_exec_init(&ctx->exec, true);
+	drm_exec_while_not_all_locked(&ctx->exec) {
+		ctx->n_vms = 0;
+		list_for_each_entry(entry, &mem->attachments, list) {
+			if ((vm && vm != entry->bo_va->base.vm) ||
+				(entry->is_mapped != map_type
+				&& map_type != BO_VM_ALL))
+				continue;
 
-	INIT_LIST_HEAD(&ctx->list);
-	INIT_LIST_HEAD(&ctx->duplicates);
-
-	list_for_each_entry(entry, &mem->attachments, list) {
-		if ((vm && vm != entry->bo_va->base.vm) ||
-			(entry->is_mapped != map_type
-			&& map_type != BO_VM_ALL))
-			continue;
-
-		ctx->n_vms++;
-	}
-
-	if (ctx->n_vms != 0) {
-		ctx->vm_pd = kcalloc(ctx->n_vms, sizeof(*ctx->vm_pd),
-				     GFP_KERNEL);
-		if (!ctx->vm_pd)
-			return -ENOMEM;
-	}
-
-	ctx->kfd_bo.priority = 0;
-	ctx->kfd_bo.tv.bo = &bo->tbo;
-	ctx->kfd_bo.tv.num_shared = 1;
-	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
-
-	i = 0;
-	list_for_each_entry(entry, &mem->attachments, list) {
-		if ((vm && vm != entry->bo_va->base.vm) ||
-			(entry->is_mapped != map_type
-			&& map_type != BO_VM_ALL))
-			continue;
-
-		amdgpu_vm_get_pd_bo(entry->bo_va->base.vm, &ctx->list,
-				&ctx->vm_pd[i]);
-		i++;
-	}
+			ret = amdgpu_vm_lock_pd(vm, &ctx->exec);
+			drm_exec_break_on_contention(&ctx->exec);
+			if (unlikely(ret))
+				goto error;
+			++ctx->n_vms;
+		}
+		drm_exec_continue_on_contention(&ctx->exec);
 
-	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
-				     false, &ctx->duplicates);
-	if (ret) {
-		pr_err("Failed to reserve buffers in ttm.\n");
-		kfree(ctx->vm_pd);
-		ctx->vm_pd = NULL;
-		return ret;
+		ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
+		drm_exec_continue_on_contention(&ctx->exec);
+		if (unlikely(ret))
+			goto error;
 	}
-
-	ctx->reserved = true;
 	return 0;
+
+error:
+	pr_err("Failed to reserve buffers in ttm.\n");
+	drm_exec_fini(&ctx->exec);
+	return ret;
 }
 
 /**
@@ -1165,15 +1122,8 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
 	if (wait)
 		ret = amdgpu_sync_wait(ctx->sync, intr);
 
-	if (ctx->reserved)
-		ttm_eu_backoff_reservation(&ctx->ticket, &ctx->list);
-	kfree(ctx->vm_pd);
-
+	drm_exec_fini(&ctx->exec);
 	ctx->sync = NULL;
-
-	ctx->reserved = false;
-	ctx->vm_pd = NULL;
-
 	return ret;
 }
 
@@ -1763,7 +1713,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	bool use_release_notifier = (mem->bo->kfd_bo == mem);
 	struct kfd_mem_attachment *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
-	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
 	int ret;
 	bool is_imported = false;
@@ -1791,9 +1740,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Make sure restore workers don't access the BO any more */
-	bo_list_entry = &mem->validate_list;
 	mutex_lock(&process_info->lock);
-	list_del(&bo_list_entry->head);
+	list_del(&mem->validate_list);
 	mutex_unlock(&process_info->lock);
 
 	/* Cleanup user pages and MMU notifiers */
@@ -2356,14 +2304,14 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 	/* Move all invalidated BOs to the userptr_inval_list */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_valid_list,
-				 validate_list.head)
+				 validate_list)
 		if (mem->invalid)
-			list_move_tail(&mem->validate_list.head,
+			list_move_tail(&mem->validate_list,
 				       &process_info->userptr_inval_list);
 
 	/* Go through userptr_inval_list and update any invalid user_pages */
 	list_for_each_entry(mem, &process_info->userptr_inval_list,
-			    validate_list.head) {
+			    validate_list) {
 		invalid = mem->invalid;
 		if (!invalid)
 			/* BO hasn't been invalidated since the last
@@ -2441,50 +2389,43 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
  */
 static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 {
-	struct amdgpu_bo_list_entry *pd_bo_list_entries;
-	struct list_head resv_list, duplicates;
-	struct ww_acquire_ctx ticket;
+	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_sync sync;
+	struct drm_exec exec;
 
 	struct amdgpu_vm *peer_vm;
 	struct kgd_mem *mem, *tmp_mem;
 	struct amdgpu_bo *bo;
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	pd_bo_list_entries = kcalloc(process_info->n_vms,
-				     sizeof(struct amdgpu_bo_list_entry),
-				     GFP_KERNEL);
-	if (!pd_bo_list_entries) {
-		pr_err("%s: Failed to allocate PD BO list entries\n", __func__);
-		ret = -ENOMEM;
-		goto out_no_mem;
-	}
-
-	INIT_LIST_HEAD(&resv_list);
-	INIT_LIST_HEAD(&duplicates);
+	int ret;
 
-	/* Get all the page directory BOs that need to be reserved */
-	i = 0;
-	list_for_each_entry(peer_vm, &process_info->vm_list_head,
-			    vm_list_node)
-		amdgpu_vm_get_pd_bo(peer_vm, &resv_list,
-				    &pd_bo_list_entries[i++]);
-	/* Add the userptr_inval_list entries to resv_list */
-	list_for_each_entry(mem, &process_info->userptr_inval_list,
-			    validate_list.head) {
-		list_add_tail(&mem->resv_list.head, &resv_list);
-		mem->resv_list.bo = mem->validate_list.bo;
-		mem->resv_list.num_shared = mem->validate_list.num_shared;
-	}
+	amdgpu_sync_create(&sync);
 
+	drm_exec_init(&exec, true);
 	/* Reserve all BOs and page tables for validation */
-	ret = ttm_eu_reserve_buffers(&ticket, &resv_list, false, &duplicates);
-	WARN(!list_empty(&duplicates), "Duplicates should be empty");
-	if (ret)
-		goto out_free;
+	drm_exec_while_not_all_locked(&exec) {
+		/* Reserve all the page directories */
+		list_for_each_entry(peer_vm, &process_info->vm_list_head,
+				    vm_list_node) {
+			ret = amdgpu_vm_lock_pd(peer_vm, &exec);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto unreserve_out;
+		}
+		drm_exec_continue_on_contention(&exec);
 
-	amdgpu_sync_create(&sync);
+		/* Reserve the userptr_inval_list entries to resv_list */
+		list_for_each_entry(mem, &process_info->userptr_inval_list,
+				    validate_list) {
+			struct drm_gem_object *gobj;
+
+			gobj = &mem->bo->tbo.base;
+			ret = drm_exec_prepare_obj(&exec, gobj, 1);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto unreserve_out;
+		}
+		drm_exec_continue_on_contention(&exec);
+	}
 
 	ret = process_validate_vms(process_info);
 	if (ret)
@@ -2493,7 +2434,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	/* Validate BOs and update GPUVM page tables */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		struct kfd_mem_attachment *attachment;
 
 		bo = mem->bo;
@@ -2535,12 +2476,9 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	ret = process_update_pds(process_info, &sync);
 
 unreserve_out:
-	ttm_eu_backoff_reservation(&ticket, &resv_list);
+	drm_exec_fini(&exec);
 	amdgpu_sync_wait(&sync, false);
 	amdgpu_sync_free(&sync);
-out_free:
-	kfree(pd_bo_list_entries);
-out_no_mem:
 
 	return ret;
 }
@@ -2556,7 +2494,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		bool valid = amdgpu_ttm_tt_get_user_pages_done(
 				mem->bo->tbo.ttm, mem->range);
 
@@ -2568,7 +2506,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 		}
 		WARN(mem->invalid, "Valid BO is marked invalid");
 
-		list_move_tail(&mem->validate_list.head,
+		list_move_tail(&mem->validate_list,
 			       &process_info->userptr_valid_list);
 	}
 
@@ -2678,50 +2616,46 @@ static void amdgpu_amdkfd_restore_userptr_worker(struct work_struct *work)
  */
 int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 {
-	struct amdgpu_bo_list_entry *pd_bo_list;
 	struct amdkfd_process_info *process_info = info;
 	struct amdgpu_vm *peer_vm;
 	struct kgd_mem *mem;
-	struct bo_vm_reservation_context ctx;
 	struct amdgpu_amdkfd_fence *new_fence;
-	int ret = 0, i;
 	struct list_head duplicate_save;
 	struct amdgpu_sync sync_obj;
 	unsigned long failed_size = 0;
 	unsigned long total_size = 0;
+	struct drm_exec exec;
+	int ret;
 
 	INIT_LIST_HEAD(&duplicate_save);
-	INIT_LIST_HEAD(&ctx.list);
-	INIT_LIST_HEAD(&ctx.duplicates);
 
-	pd_bo_list = kcalloc(process_info->n_vms,
-			     sizeof(struct amdgpu_bo_list_entry),
-			     GFP_KERNEL);
-	if (!pd_bo_list)
-		return -ENOMEM;
-
-	i = 0;
 	mutex_lock(&process_info->lock);
-	list_for_each_entry(peer_vm, &process_info->vm_list_head,
-			vm_list_node)
-		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++]);
 
-	/* Reserve all BOs and page tables/directory. Add all BOs from
-	 * kfd_bo_list to ctx.list
-	 */
-	list_for_each_entry(mem, &process_info->kfd_bo_list,
-			    validate_list.head) {
-
-		list_add_tail(&mem->resv_list.head, &ctx.list);
-		mem->resv_list.bo = mem->validate_list.bo;
-		mem->resv_list.num_shared = mem->validate_list.num_shared;
-	}
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		list_for_each_entry(peer_vm, &process_info->vm_list_head,
+				    vm_list_node) {
+			ret = amdgpu_vm_lock_pd(peer_vm, &exec);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto ttm_reserve_fail;
+		}
+		drm_exec_continue_on_contention(&exec);
 
-	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
-				     false, &duplicate_save);
-	if (ret) {
-		pr_debug("Memory eviction: TTM Reserve Failed. Try again\n");
-		goto ttm_reserve_fail;
+		/* Reserve all BOs and page tables/directory. Add all BOs from
+		 * kfd_bo_list to ctx.list
+		 */
+		list_for_each_entry(mem, &process_info->kfd_bo_list,
+				    validate_list) {
+			struct drm_gem_object *gobj;
+
+			gobj = &mem->bo->tbo.base;
+			ret = drm_exec_prepare_obj(&exec, gobj, 1);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto ttm_reserve_fail;
+		}
+		drm_exec_continue_on_contention(&exec);
 	}
 
 	amdgpu_sync_create(&sync_obj);
@@ -2739,7 +2673,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
-			    validate_list.head) {
+			    validate_list) {
 
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
@@ -2812,8 +2746,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	*ef = dma_fence_get(&new_fence->base);
 
 	/* Attach new eviction fence to all BOs except pinned ones */
-	list_for_each_entry(mem, &process_info->kfd_bo_list,
-		validate_list.head) {
+	list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list) {
 		if (mem->bo->tbo.pin_count)
 			continue;
 
@@ -2832,11 +2765,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	}
 
 validate_map_fail:
-	ttm_eu_backoff_reservation(&ctx.ticket, &ctx.list);
 	amdgpu_sync_free(&sync_obj);
 ttm_reserve_fail:
+	drm_exec_fini(&exec);
 	mutex_unlock(&process_info->lock);
-	kfree(pd_bo_list);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 252a876b0725..b6298e901cbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -28,6 +28,7 @@
  *    Christian König <deathsimple@vodafone.de>
  */
 
+#include <linux/sort.h>
 #include <linux/uaccess.h>
 
 #include "amdgpu.h"
@@ -50,13 +51,20 @@ static void amdgpu_bo_list_free(struct kref *ref)
 						   refcount);
 	struct amdgpu_bo_list_entry *e;
 
-	amdgpu_bo_list_for_each_entry(e, list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	amdgpu_bo_list_for_each_entry(e, list)
+		amdgpu_bo_unref(&e->bo);
+	call_rcu(&list->rhead, amdgpu_bo_list_free_rcu);
+}
 
-		amdgpu_bo_unref(&bo);
-	}
+static int amdgpu_bo_list_entry_cmp(const void *_a, const void *_b)
+{
+	const struct amdgpu_bo_list_entry *a = _a, *b = _b;
 
-	call_rcu(&list->rhead, amdgpu_bo_list_free_rcu);
+	if (a->priority > b->priority)
+		return 1;
+	if (a->priority < b->priority)
+		return -1;
+	return 0;
 }
 
 int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
@@ -118,7 +126,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 		entry->priority = min(info[i].bo_priority,
 				      AMDGPU_BO_LIST_MAX_PRIORITY);
-		entry->tv.bo = &bo->tbo;
+		entry->bo = bo;
 
 		if (bo->preferred_domains == AMDGPU_GEM_DOMAIN_GDS)
 			list->gds_obj = bo;
@@ -133,6 +141,8 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 	list->first_userptr = first_userptr;
 	list->num_entries = num_entries;
+	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
+	     amdgpu_bo_list_entry_cmp, NULL);
 
 	trace_amdgpu_cs_bo_status(list->num_entries, total_size);
 
@@ -141,16 +151,10 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	return 0;
 
 error_free:
-	for (i = 0; i < last_entry; ++i) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(array[i].tv.bo);
-
-		amdgpu_bo_unref(&bo);
-	}
-	for (i = first_userptr; i < num_entries; ++i) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(array[i].tv.bo);
-
-		amdgpu_bo_unref(&bo);
-	}
+	for (i = 0; i < last_entry; ++i)
+		amdgpu_bo_unref(&array[i].bo);
+	for (i = first_userptr; i < num_entries; ++i)
+		amdgpu_bo_unref(&array[i].bo);
 	kvfree(list);
 	return r;
 
@@ -182,41 +186,6 @@ int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
 	return -ENOENT;
 }
 
-void amdgpu_bo_list_get_list(struct amdgpu_bo_list *list,
-			     struct list_head *validated)
-{
-	/* This is based on the bucket sort with O(n) time complexity.
-	 * An item with priority "i" is added to bucket[i]. The lists are then
-	 * concatenated in descending order.
-	 */
-	struct list_head bucket[AMDGPU_BO_LIST_NUM_BUCKETS];
-	struct amdgpu_bo_list_entry *e;
-	unsigned i;
-
-	for (i = 0; i < AMDGPU_BO_LIST_NUM_BUCKETS; i++)
-		INIT_LIST_HEAD(&bucket[i]);
-
-	/* Since buffers which appear sooner in the relocation list are
-	 * likely to be used more often than buffers which appear later
-	 * in the list, the sort mustn't change the ordering of buffers
-	 * with the same priority, i.e. it must be stable.
-	 */
-	amdgpu_bo_list_for_each_entry(e, list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-		unsigned priority = e->priority;
-
-		if (!bo->parent)
-			list_add_tail(&e->tv.head, &bucket[priority]);
-
-		e->user_pages = NULL;
-		e->range = NULL;
-	}
-
-	/* Connect the sorted buckets in the output list. */
-	for (i = 0; i < AMDGPU_BO_LIST_NUM_BUCKETS; i++)
-		list_splice(&bucket[i], validated);
-}
-
 void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
 {
 	kref_put(&list->refcount, amdgpu_bo_list_free);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index ededdc01ca28..26c01cb131f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -23,7 +23,6 @@
 #ifndef __AMDGPU_BO_LIST_H__
 #define __AMDGPU_BO_LIST_H__
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/amdgpu_drm.h>
 
 struct hmm_range;
@@ -36,7 +35,7 @@ struct amdgpu_bo_va;
 struct amdgpu_fpriv;
 
 struct amdgpu_bo_list_entry {
-	struct ttm_validate_buffer	tv;
+	struct amdgpu_bo		*bo;
 	struct amdgpu_bo_va		*bo_va;
 	uint32_t			priority;
 	struct page			**user_pages;
@@ -60,8 +59,6 @@ struct amdgpu_bo_list {
 
 int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
 		       struct amdgpu_bo_list **result);
-void amdgpu_bo_list_get_list(struct amdgpu_bo_list *list,
-			     struct list_head *validated);
 void amdgpu_bo_list_put(struct amdgpu_bo_list *list);
 int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 				      struct drm_amdgpu_bo_list_entry **info_param);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 08eced097bd8..9e751f5d4aa7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -65,6 +65,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
 	}
 
 	amdgpu_sync_create(&p->sync);
+	drm_exec_init(&p->exec, true);
 	return 0;
 }
 
@@ -122,7 +123,6 @@ static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
 				   uint32_t *offset)
 {
 	struct drm_gem_object *gobj;
-	struct amdgpu_bo *bo;
 	unsigned long size;
 	int r;
 
@@ -130,21 +130,16 @@ static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
 	if (gobj == NULL)
 		return -EINVAL;
 
-	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
-	p->uf_entry.priority = 0;
-	p->uf_entry.tv.bo = &bo->tbo;
-	/* One for TTM and two for the CS job */
-	p->uf_entry.tv.num_shared = 3;
-
+	p->uf_bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
 	drm_gem_object_put(gobj);
 
-	size = amdgpu_bo_size(bo);
+	size = amdgpu_bo_size(p->uf_bo);
 	if (size != PAGE_SIZE || (data->offset + 8) > size) {
 		r = -EINVAL;
 		goto error_unref;
 	}
 
-	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
+	if (amdgpu_ttm_tt_get_usermm(p->uf_bo->tbo.ttm)) {
 		r = -EINVAL;
 		goto error_unref;
 	}
@@ -154,7 +149,7 @@ static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
 	return 0;
 
 error_unref:
-	amdgpu_bo_unref(&bo);
+	amdgpu_bo_unref(&p->uf_bo);
 	return r;
 }
 
@@ -310,7 +305,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		goto free_all_kdata;
 	}
 
-	if (p->uf_entry.tv.bo)
+	if (p->uf_bo)
 		p->gang_leader->uf_addr = uf_offset;
 	kvfree(chunk_array);
 
@@ -355,7 +350,7 @@ static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
 	ib = &job->ibs[job->num_ibs++];
 
 	/* MM engine doesn't support user fences */
-	if (p->uf_entry.tv.bo && ring->funcs->no_user_fence)
+	if (p->uf_bo && ring->funcs->no_user_fence)
 		return -EINVAL;
 
 	if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
@@ -814,55 +809,18 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	return r;
 }
 
-static int amdgpu_cs_list_validate(struct amdgpu_cs_parser *p,
-			    struct list_head *validated)
-{
-	struct ttm_operation_ctx ctx = { true, false };
-	struct amdgpu_bo_list_entry *lobj;
-	int r;
-
-	list_for_each_entry(lobj, validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(lobj->tv.bo);
-		struct mm_struct *usermm;
-
-		usermm = amdgpu_ttm_tt_get_usermm(bo->tbo.ttm);
-		if (usermm && usermm != current->mm)
-			return -EPERM;
-
-		if (amdgpu_ttm_tt_is_userptr(bo->tbo.ttm) &&
-		    lobj->user_invalidated && lobj->user_pages) {
-			amdgpu_bo_placement_from_domain(bo,
-							AMDGPU_GEM_DOMAIN_CPU);
-			r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-			if (r)
-				return r;
-
-			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm,
-						     lobj->user_pages);
-		}
-
-		r = amdgpu_cs_bo_validate(p, bo);
-		if (r)
-			return r;
-
-		kvfree(lobj->user_pages);
-		lobj->user_pages = NULL;
-	}
-	return 0;
-}
-
 static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct ttm_operation_ctx ctx = { true, false };
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
-	struct list_head duplicates;
+	struct drm_gem_object *obj;
+	unsigned long index;
 	unsigned int i;
 	int r;
 
-	INIT_LIST_HEAD(&p->validated);
-
 	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
 	if (cs->in.bo_list_handle) {
 		if (p->bo_list)
@@ -882,25 +840,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 	mutex_lock(&p->bo_list->bo_list_mutex);
 
-	/* One for TTM and one for the CS job */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 2;
-
-	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
-
-	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
-
-	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
-		list_add(&p->uf_entry.tv.head, &p->validated);
-
 	/* Get userptr backing pages. If pages are updated after registered
 	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
 	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
 	 */
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 		bool userpage_invalidated = false;
+		struct amdgpu_bo *bo = e->bo;
 		int i;
 
 		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
@@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		e->user_invalidated = userpage_invalidated;
 	}
 
-	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
-				   &duplicates);
-	if (unlikely(r != 0)) {
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
-		goto out_free_user_pages;
+	drm_exec_while_not_all_locked(&p->exec) {
+		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
+		drm_exec_continue_on_contention(&p->exec);
+		if (unlikely(r))
+			goto out_free_user_pages;
+
+		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
+			drm_exec_break_on_contention(&p->exec);
+			if (unlikely(r))
+				goto out_free_user_pages;
+
+			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
+			e->range = NULL;
+		}
+		drm_exec_continue_on_contention(&p->exec);
+
+		if (p->uf_bo) {
+			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
+						 2);
+			drm_exec_continue_on_contention(&p->exec);
+			if (unlikely(r))
+				goto out_free_user_pages;
+		}
 	}
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+		struct mm_struct *usermm;
 
-		e->bo_va = amdgpu_vm_bo_find(vm, bo);
+		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
+		if (usermm && usermm != current->mm) {
+			r = -EPERM;
+			goto out_free_user_pages;
+		}
+
+		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
+		    e->user_invalidated && e->user_pages) {
+			amdgpu_bo_placement_from_domain(e->bo,
+							AMDGPU_GEM_DOMAIN_CPU);
+			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
+					    &ctx);
+			if (r)
+				goto out_free_user_pages;
+
+			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
+						     e->user_pages);
+		}
+
+		kvfree(e->user_pages);
+		e->user_pages = NULL;
 	}
 
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
@@ -951,25 +935,21 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				      amdgpu_cs_bo_validate, p);
 	if (r) {
 		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
-		goto error_validate;
+		goto out_free_user_pages;
 	}
 
-	r = amdgpu_cs_list_validate(p, &duplicates);
-	if (r)
-		goto error_validate;
-
-	r = amdgpu_cs_list_validate(p, &p->validated);
-	if (r)
-		goto error_validate;
-
-	if (p->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
+	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
+		if (unlikely(r))
+			goto out_free_user_pages;
+	}
 
-		r = amdgpu_ttm_alloc_gart(&uf->tbo);
-		if (r)
-			goto error_validate;
+	if (p->uf_bo) {
+		r = amdgpu_ttm_alloc_gart(&p->uf_bo->tbo);
+		if (unlikely(r))
+			goto out_free_user_pages;
 
-		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(uf);
+		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
 	}
 
 	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
@@ -981,12 +961,9 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 					 p->bo_list->oa_obj);
 	return 0;
 
-error_validate:
-	ttm_eu_backoff_reservation(&p->ticket, &p->validated);
-
 out_free_user_pages:
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+		struct amdgpu_bo *bo = e->bo;
 
 		if (!e->user_pages)
 			continue;
@@ -1093,7 +1070,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct amdgpu_bo_va *bo_va;
-	struct amdgpu_bo *bo;
 	unsigned int i;
 	int r;
 
@@ -1122,11 +1098,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	}
 
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		/* ignore duplicates */
-		bo = ttm_to_amdgpu_bo(e->tv.bo);
-		if (!bo)
-			continue;
-
 		bo_va = e->bo_va;
 		if (bo_va == NULL)
 			continue;
@@ -1164,7 +1135,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (amdgpu_vm_debug) {
 		/* Invalidate all BOs to test for userspace bugs */
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+			struct amdgpu_bo *bo = e->bo;
 
 			/* ignore duplicates */
 			if (!bo)
@@ -1181,8 +1152,9 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct drm_gpu_scheduler *sched;
-	struct amdgpu_bo_list_entry *e;
+	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	unsigned long index;
 	unsigned int i;
 	int r;
 
@@ -1193,8 +1165,9 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		return r;
 	}
 
-	list_for_each_entry(e, &p->validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
@@ -1258,6 +1231,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
+	struct drm_gem_object *gobj;
+	unsigned long index;
 	unsigned int i;
 	uint64_t seq;
 	int r;
@@ -1296,9 +1271,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	 */
 	r = 0;
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-		r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
+		r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm,
+							e->range);
 		e->range = NULL;
 	}
 	if (r) {
@@ -1307,20 +1281,22 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	p->fence = dma_fence_get(&leader->base.s_fence->finished);
-	list_for_each_entry(e, &p->validated, tv.head) {
+	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
+
+		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
 
 		/* Everybody except for the gang leader uses READ */
 		for (i = 0; i < p->gang_size; ++i) {
 			if (p->jobs[i] == leader)
 				continue;
 
-			dma_resv_add_fence(e->tv.bo->base.resv,
+			dma_resv_add_fence(gobj->resv,
 					   &p->jobs[i]->base.s_fence->finished,
 					   DMA_RESV_USAGE_READ);
 		}
 
-		/* The gang leader is remembered as writer */
-		e->tv.num_shared = 0;
+		/* The gang leader as remembered as writer */
+		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
 	}
 
 	seq = amdgpu_ctx_add_fence(p->ctx, p->entities[p->gang_leader_idx],
@@ -1336,7 +1312,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	cs->out.handle = seq;
 	leader->uf_sequence = seq;
 
-	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
+	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
 	for (i = 0; i < p->gang_size; ++i) {
 		amdgpu_job_free_resources(p->jobs[i]);
 		trace_amdgpu_cs_ioctl(p->jobs[i]);
@@ -1345,7 +1321,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
-	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 
 	mutex_unlock(&p->adev->notifier_lock);
 	mutex_unlock(&p->bo_list->bo_list_mutex);
@@ -1366,6 +1341,8 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 	unsigned i;
 
 	amdgpu_sync_free(&parser->sync);
+	drm_exec_fini(&parser->exec);
+
 	for (i = 0; i < parser->num_post_deps; i++) {
 		drm_syncobj_put(parser->post_deps[i].syncobj);
 		kfree(parser->post_deps[i].chain);
@@ -1386,11 +1363,7 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 		if (parser->jobs[i])
 			amdgpu_job_free(parser->jobs[i]);
 	}
-	if (parser->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(parser->uf_entry.tv.bo);
-
-		amdgpu_bo_unref(&uf);
-	}
+	amdgpu_bo_unref(&parser->uf_bo);
 }
 
 int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
@@ -1451,7 +1424,6 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	return 0;
 
 error_backoff:
-	ttm_eu_backoff_reservation(&parser.ticket, &parser.validated);
 	mutex_unlock(&parser.bo_list->bo_list_mutex);
 
 error_fini:
@@ -1786,7 +1758,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
 	*map = mapping;
 
 	/* Double check that the BO is reserved by this CS */
-	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->ticket)
+	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->exec.ticket)
 		return -EINVAL;
 
 	if (!((*bo)->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index fb3e3d56d427..39c33ad100cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -24,6 +24,7 @@
 #define __AMDGPU_CS_H__
 
 #include <linux/ww_mutex.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_job.h"
 #include "amdgpu_bo_list.h"
@@ -62,11 +63,9 @@ struct amdgpu_cs_parser {
 	struct amdgpu_job	*gang_leader;
 
 	/* buffer objects */
-	struct ww_acquire_ctx		ticket;
+	struct drm_exec			exec;
 	struct amdgpu_bo_list		*bo_list;
 	struct amdgpu_mn		*mn;
-	struct amdgpu_bo_list_entry	vm_pd;
-	struct list_head		validated;
 	struct dma_fence		*fence;
 	uint64_t			bytes_moved_threshold;
 	uint64_t			bytes_moved_vis_threshold;
@@ -74,7 +73,7 @@ struct amdgpu_cs_parser {
 	uint64_t			bytes_moved_vis;
 
 	/* user fence */
-	struct amdgpu_bo_list_entry	uf_entry;
+	struct amdgpu_bo		*uf_bo;
 
 	unsigned			num_post_deps;
 	struct amdgpu_cs_post_dep	*post_deps;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index c6d4d41c4393..ea434c8de047 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -22,6 +22,8 @@
  * * Author: Monk.liu@amd.com
  */
 
+#include <drm/drm_exec.h>
+
 #include "amdgpu.h"
 
 uint64_t amdgpu_csa_vaddr(struct amdgpu_device *adev)
@@ -65,31 +67,25 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			  struct amdgpu_bo *bo, struct amdgpu_bo_va **bo_va,
 			  uint64_t csa_addr, uint32_t size)
 {
-	struct ww_acquire_ctx ticket;
-	struct list_head list;
-	struct amdgpu_bo_list_entry pd;
-	struct ttm_validate_buffer csa_tv;
+	struct drm_exec exec;
 	int r;
 
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&csa_tv.head);
-	csa_tv.bo = &bo->tbo;
-	csa_tv.num_shared = 1;
-
-	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r) {
-		DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
-		return r;
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		r = amdgpu_vm_lock_pd(vm, &exec);
+		if (likely(!r))
+			r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 0);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r)) {
+			DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
+			goto error;
+		}
 	}
 
 	*bo_va = amdgpu_vm_bo_add(adev, vm, bo);
 	if (!*bo_va) {
-		ttm_eu_backoff_reservation(&ticket, &list);
-		DRM_ERROR("failed to create bo_va for static CSA\n");
-		return -ENOMEM;
+		r = -ENOMEM;
+		goto error;
 	}
 
 	r = amdgpu_vm_bo_map(adev, *bo_va, csa_addr, 0, size,
@@ -99,10 +95,10 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r) {
 		DRM_ERROR("failed to do bo_map on static CSA, err=%d\n", r);
 		amdgpu_vm_bo_del(adev, *bo_va);
-		ttm_eu_backoff_reservation(&ticket, &list);
-		return r;
+		goto error;
 	}
 
-	ttm_eu_backoff_reservation(&ticket, &list);
-	return 0;
+error:
+	drm_exec_fini(&exec);
+	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 863cb668e000..c5f74f241366 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_tt.h>
 
@@ -197,29 +198,23 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	struct amdgpu_fpriv *fpriv = file_priv->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
-	struct amdgpu_bo_list_entry vm_pd;
-	struct list_head list, duplicates;
 	struct dma_fence *fence = NULL;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
 	struct amdgpu_bo_va *bo_va;
+	struct drm_exec exec;
 	long r;
 
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&duplicates);
-
-	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
-	list_add(&tv.head, &list);
-
-	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, false, &duplicates);
-	if (r) {
-		dev_err(adev->dev, "leaking bo va because "
-			"we fail to reserve bo (%ld)\n", r);
-		return;
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r)) {
+			dev_err(adev->dev, "leaking bo va (%ld)\n", r);
+			goto out_unlock;
+		}
 	}
+
 	bo_va = amdgpu_vm_bo_find(vm, bo);
 	if (!bo_va || --bo_va->ref_count)
 		goto out_unlock;
@@ -229,6 +224,9 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 		goto out_unlock;
 
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
+	if (unlikely(r < 0))
+		dev_err(adev->dev, "failed to clear page "
+			"tables on GEM object close (%ld)\n", r);
 	if (r || !fence)
 		goto out_unlock;
 
@@ -236,10 +234,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	dma_fence_put(fence);
 
 out_unlock:
-	if (unlikely(r < 0))
-		dev_err(adev->dev, "failed to clear page "
-			"tables on GEM object close (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 }
 
 static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -673,10 +668,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	struct amdgpu_bo *abo;
 	struct amdgpu_bo_va *bo_va;
-	struct amdgpu_bo_list_entry vm_pd;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
-	struct list_head list, duplicates;
+	struct drm_exec exec;
 	uint64_t va_flags;
 	uint64_t vm_size;
 	int r = 0;
@@ -726,36 +718,37 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&duplicates);
 	if ((args->operation != AMDGPU_VA_OP_CLEAR) &&
 	    !(args->flags & AMDGPU_VM_PAGE_PRT)) {
 		gobj = drm_gem_object_lookup(filp, args->handle);
 		if (gobj == NULL)
 			return -ENOENT;
 		abo = gem_to_amdgpu_bo(gobj);
-		tv.bo = &abo->tbo;
-		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
-			tv.num_shared = 1;
-		else
-			tv.num_shared = 0;
-		list_add(&tv.head, &list);
 	} else {
 		gobj = NULL;
 		abo = NULL;
 	}
 
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd);
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		if (gobj) {
+			r = drm_exec_prepare_obj(&exec, gobj, 0);
+			drm_exec_continue_on_contention(&exec);
+			if (unlikely(r))
+				goto error;
+		}
 
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, &duplicates);
-	if (r)
-		goto error_unref;
+		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r))
+			goto error;
+	}
 
 	if (abo) {
 		bo_va = amdgpu_vm_bo_find(&fpriv->vm, abo);
 		if (!bo_va) {
 			r = -ENOENT;
-			goto error_backoff;
+			goto error;
 		}
 	} else if (args->operation != AMDGPU_VA_OP_CLEAR) {
 		bo_va = fpriv->prt_va;
@@ -792,10 +785,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
 					args->operation);
 
-error_backoff:
-	ttm_eu_backoff_reservation(&ticket, &list);
-
-error_unref:
+error:
+	drm_exec_fini(&exec);
 	drm_gem_object_put(gobj);
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f038..95292a65fd25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/firmware.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_mes.h"
 #include "amdgpu.h"
@@ -1126,34 +1127,29 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 				 struct amdgpu_mes_ctx_data *ctx_data)
 {
 	struct amdgpu_bo_va *bo_va;
-	struct ww_acquire_ctx ticket;
-	struct list_head list;
-	struct amdgpu_bo_list_entry pd;
-	struct ttm_validate_buffer csa_tv;
 	struct amdgpu_sync sync;
+	struct drm_exec exec;
 	int r;
 
 	amdgpu_sync_create(&sync);
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&csa_tv.head);
 
-	csa_tv.bo = &ctx_data->meta_data_obj->tbo;
-	csa_tv.num_shared = 1;
-
-	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r) {
-		DRM_ERROR("failed to reserve meta data BO: err=%d\n", r);
-		return r;
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec,
+					 &ctx_data->meta_data_obj->tbo.base,
+					 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+                if (unlikely(r))
+			goto error_fini_exec;
 	}
 
 	bo_va = amdgpu_vm_bo_add(adev, vm, ctx_data->meta_data_obj);
 	if (!bo_va) {
-		ttm_eu_backoff_reservation(&ticket, &list);
 		DRM_ERROR("failed to create bo_va for meta data BO\n");
-		return -ENOMEM;
+		r = -ENOMEM;
+		goto error_fini_exec;
 	}
 
 	r = amdgpu_vm_bo_map(adev, bo_va, ctx_data->meta_data_gpu_addr, 0,
@@ -1163,33 +1159,35 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
 	if (r) {
 		DRM_ERROR("failed to do bo_map on meta data, err=%d\n", r);
-		goto error;
+		goto error_del_bo_va;
 	}
 
 	r = amdgpu_vm_bo_update(adev, bo_va, false);
 	if (r) {
 		DRM_ERROR("failed to do vm_bo_update on meta data\n");
-		goto error;
+		goto error_del_bo_va;
 	}
 	amdgpu_sync_fence(&sync, bo_va->last_pt_update);
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
 	if (r) {
 		DRM_ERROR("failed to update pdes on meta data\n");
-		goto error;
+		goto error_del_bo_va;
 	}
 	amdgpu_sync_fence(&sync, vm->last_update);
 
 	amdgpu_sync_wait(&sync, false);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	amdgpu_sync_free(&sync);
 	ctx_data->meta_data_va = bo_va;
 	return 0;
 
-error:
+error_del_bo_va:
 	amdgpu_vm_bo_del(adev, bo_va);
-	ttm_eu_backoff_reservation(&ticket, &list);
+
+error_fini_exec:
+	drm_exec_fini(&exec);
 	amdgpu_sync_free(&sync);
 	return r;
 }
@@ -1200,34 +1198,28 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 	struct amdgpu_bo_va *bo_va = ctx_data->meta_data_va;
 	struct amdgpu_bo *bo = ctx_data->meta_data_obj;
 	struct amdgpu_vm *vm = bo_va->base.vm;
-	struct amdgpu_bo_list_entry vm_pd;
-	struct list_head list, duplicates;
-	struct dma_fence *fence = NULL;
-	struct ttm_validate_buffer tv;
-	struct ww_acquire_ctx ticket;
-	long r = 0;
-
-	INIT_LIST_HEAD(&list);
-	INIT_LIST_HEAD(&duplicates);
-
-	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
-	list_add(&tv.head, &list);
-
-	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
-
-	r = ttm_eu_reserve_buffers(&ticket, &list, false, &duplicates);
-	if (r) {
-		dev_err(adev->dev, "leaking bo va because "
-			"we fail to reserve bo (%ld)\n", r);
-		return r;
+	struct dma_fence *fence;
+	struct drm_exec exec;
+	long r;
+
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		r = drm_exec_prepare_obj(&exec,
+					 &ctx_data->meta_data_obj->tbo.base,
+					 0);
+		if (likely(!r))
+			r = amdgpu_vm_lock_pd(vm, &exec);
+		drm_exec_continue_on_contention(&exec);
+                if (unlikely(r))
+			goto out_unlock;
 	}
 
 	amdgpu_vm_bo_del(adev, bo_va);
 	if (!amdgpu_vm_ready(vm))
 		goto out_unlock;
 
-	r = dma_resv_get_singleton(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP, &fence);
+	r = dma_resv_get_singleton(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				   &fence);
 	if (r)
 		goto out_unlock;
 	if (fence) {
@@ -1246,7 +1238,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 out_unlock:
 	if (unlikely(r < 0))
 		dev_err(adev->dev, "failed to clear page tables (%ld)\n", r);
-	ttm_eu_backoff_reservation(&ticket, &list);
+	drm_exec_fini(&exec);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 286e326bb4bd..e39ecf4152ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -34,6 +34,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
 #include <drm/ttm/ttm_tt.h>
+#include <drm/drm_exec.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -313,25 +314,16 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 }
 
 /**
- * amdgpu_vm_get_pd_bo - add the VM PD to a validation list
+ * amdgpu_vm_lock_pd - lock PD in drm_exec
  *
  * @vm: vm providing the BOs
- * @validated: head of validation list
- * @entry: entry to add
+ * @exec: drm execution context
  *
- * Add the page directory to the list of BOs to
- * validate for command submission.
+ * Lock the VM root PD in the DRM execution context.
  */
-void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
-			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry)
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec)
 {
-	entry->priority = 0;
-	entry->tv.bo = &vm->root.bo->tbo;
-	/* Two for VM updates, one for TTM and one for the CS job */
-	entry->tv.num_shared = 4;
-	entry->user_pages = NULL;
-	list_add(&entry->tv.head, validated);
+	return drm_exec_prepare_obj(exec, &vm->root.bo->tbo.base, 4);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 6f085f0b4ef3..38902fbce8f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -36,6 +36,8 @@
 #include "amdgpu_ring.h"
 #include "amdgpu_ids.h"
 
+struct drm_exec;
+
 struct amdgpu_bo_va;
 struct amdgpu_job;
 struct amdgpu_bo_list_entry;
@@ -387,9 +389,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
-void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
-			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry);
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			      int (*callback)(void *p, struct amdgpu_bo *bo),
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index dc6fd6967050..6ca3c3ced9f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -24,6 +24,8 @@
 #include <linux/types.h>
 #include <linux/sched/task.h>
 #include <drm/ttm/ttm_tt.h>
+#include <drm/drm_exec.h>
+
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
@@ -1423,9 +1425,7 @@ struct svm_validate_context {
 	struct svm_range *prange;
 	bool intr;
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
-	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE];
-	struct list_head validate_list;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 };
 
 static int svm_range_reserve_bos(struct svm_validate_context *ctx)
@@ -1435,25 +1435,23 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 	uint32_t gpuidx;
 	int r;
 
-	INIT_LIST_HEAD(&ctx->validate_list);
+	drm_exec_init(&ctx->exec, true);
 	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
 		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
 		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
-			return -EINVAL;
+			r = -EINVAL;
+			goto unreserve_out;
 		}
 		vm = drm_priv_to_vm(pdd->drm_priv);
 
-		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
-		ctx->tv[gpuidx].num_shared = 4;
-		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
-	}
-
-	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
-				   ctx->intr, NULL);
-	if (r) {
-		pr_debug("failed %d to reserve bo\n", r);
-		return r;
+		r = amdgpu_vm_lock_pd(vm, &ctx->exec);
+		if (unlikely(r == -EDEADLK))
+			continue;
+		if (unlikely(r)) {
+			pr_debug("failed %d to reserve bo\n", r);
+			goto unreserve_out;
+		}
 	}
 
 	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
@@ -1476,13 +1474,13 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 	return 0;
 
 unreserve_out:
-	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+	drm_exec_fini(&ctx->exec);
 	return r;
 }
 
 static void svm_range_unreserve_bos(struct svm_validate_context *ctx)
 {
-	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+	drm_exec_fini(&ctx->exec);
 }
 
 static void *kfd_svm_page_owner(struct kfd_process *p, int32_t gpuidx)
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..f645d22a0863
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,248 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup procedure
+ * unlocks all previously locked GEM objects and locks the contended one first
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ *	struct drm_gem_object *obj;
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, true);
+ *	drm_exec_while_not_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_lock(&exec, boB, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *	}
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Dummy value used to initially enter the retry loop */
+#define DRM_EXEC_DUMMY (void*)~0
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+
+	if (exec->prelocked) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+	}
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @interruptible: if locks should be acquired interruptible
+ *
+ * Initialize the object and make sure that we can track locked and duplicate
+ * objects.
+ */
+void drm_exec_init(struct drm_exec *exec, bool interruptible)
+{
+	exec->interruptible = interruptible;
+	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->num_objects = 0;
+	exec->contended = DRM_EXEC_DUMMY;
+	exec->prelocked = NULL;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finilize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	kvfree(exec->objects);
+	if (exec->contended != DRM_EXEC_DUMMY) {
+		drm_gem_object_put(exec->contended);
+		ww_acquire_fini(&exec->ticket);
+	}
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_cleanup - cleanup when contention is detected
+ * @exec: the drm_exec object to cleanup
+ *
+ * Cleanup the current state and return true if we should stay inside the retry
+ * loop, false if there wasn't any contention detected and we can keep the
+ * objects locked.
+ */
+bool drm_exec_cleanup(struct drm_exec *exec)
+{
+	if (likely(!exec->contended)) {
+		ww_acquire_done(&exec->ticket);
+		return false;
+	}
+
+	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
+		exec->contended = NULL;
+		ww_acquire_init(&exec->ticket, &reservation_ww_class);
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	exec->num_objects = 0;
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the xa and reserve fences */
+static int drm_exec_obj_locked(struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	if (unlikely(exec->num_objects == exec->max_objects)) {
+		size_t size = exec->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		exec->objects = tmp;
+		exec->max_objects += PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	exec->objects[exec->num_objects++] = obj;
+
+	return 0;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->interruptible) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (unlikely(ret)) {
+		dma_resv_unlock(obj->resv);
+		goto error_dropref;
+	}
+
+	swap(exec->prelocked, obj);
+
+error_dropref:
+	/* Always cleanup the contention so that error handling can kick in */
+	drm_gem_object_put(obj);
+	exec->contended = NULL;
+	return ret;
+}
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots. All
+ * succesfully locked objects are put into the locked container. Duplicates
+ * detected as well and automatically moved into the duplicates container.
+ *
+ * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+
+		return dma_resv_reserve_fences(obj->resv, num_fences);
+	}
+
+	if (exec->interruptible)
+		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret = dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret == -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended = obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret))
+		return ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret)
+		goto error_unlock;
+
+	/* Keep locked when reserving fences fails */
+	return dma_resv_reserve_fences(obj->resv, num_fences);
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index ea993d7162e8..3e732648b332 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -38,12 +38,12 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
 #include <drm/qxl_drm.h>
 #include <drm/ttm/ttm_bo.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
 #include "qxl_dev.h"
@@ -101,7 +101,8 @@ struct qxl_gem {
 };
 
 struct qxl_bo_list {
-	struct ttm_validate_buffer tv;
+	struct qxl_bo		*bo;
+	struct list_head	list;
 };
 
 struct qxl_crtc {
@@ -151,7 +152,7 @@ struct qxl_release {
 	struct qxl_bo *release_bo;
 	uint32_t release_offset;
 	uint32_t surface_release_id;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec	exec;
 	struct list_head bos;
 };
 
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..da7cd9cd58f9 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -121,13 +121,11 @@ qxl_release_free_list(struct qxl_release *release)
 {
 	while (!list_empty(&release->bos)) {
 		struct qxl_bo_list *entry;
-		struct qxl_bo *bo;
 
 		entry = container_of(release->bos.next,
-				     struct qxl_bo_list, tv.head);
-		bo = to_qxl_bo(entry->tv.bo);
-		qxl_bo_unref(&bo);
-		list_del(&entry->tv.head);
+				     struct qxl_bo_list, list);
+		qxl_bo_unref(&entry->bo);
+		list_del(&entry->list);
 		kfree(entry);
 	}
 	release->release_bo = NULL;
@@ -172,8 +170,8 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 {
 	struct qxl_bo_list *entry;
 
-	list_for_each_entry(entry, &release->bos, tv.head) {
-		if (entry->tv.bo == &bo->tbo)
+	list_for_each_entry(entry, &release->bos, list) {
+		if (entry->bo == bo)
 			return 0;
 	}
 
@@ -182,9 +180,8 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 		return -ENOMEM;
 
 	qxl_bo_ref(bo);
-	entry->tv.bo = &bo->tbo;
-	entry->tv.num_shared = 0;
-	list_add_tail(&entry->tv.head, &release->bos);
+	entry->bo = bo;
+	list_add_tail(&entry->list, &release->bos);
 	return 0;
 }
 
@@ -221,21 +218,27 @@ int qxl_release_reserve_list(struct qxl_release *release, bool no_intr)
 	if (list_is_singular(&release->bos))
 		return 0;
 
-	ret = ttm_eu_reserve_buffers(&release->ticket, &release->bos,
-				     !no_intr, NULL);
-	if (ret)
-		return ret;
-
-	list_for_each_entry(entry, &release->bos, tv.head) {
-		struct qxl_bo *bo = to_qxl_bo(entry->tv.bo);
-
-		ret = qxl_release_validate_bo(bo);
-		if (ret) {
-			ttm_eu_backoff_reservation(&release->ticket, &release->bos);
-			return ret;
+	drm_exec_init(&release->exec, !no_intr);
+	drm_exec_while_not_all_locked(&release->exec) {
+		list_for_each_entry(entry, &release->bos, list) {
+			ret = drm_exec_prepare_obj(&release->exec,
+						   &entry->bo->tbo.base,
+						   1);
+			drm_exec_break_on_contention(&release->exec);
+			if (ret)
+				goto error;
 		}
 	}
+
+	list_for_each_entry(entry, &release->bos, list) {
+		ret = qxl_release_validate_bo(entry->bo);
+		if (ret)
+			goto error;
+	}
 	return 0;
+error:
+	drm_exec_fini(&release->exec);
+	return ret;
 }
 
 void qxl_release_backoff_reserve_list(struct qxl_release *release)
@@ -245,7 +248,7 @@ void qxl_release_backoff_reserve_list(struct qxl_release *release)
 	if (list_is_singular(&release->bos))
 		return;
 
-	ttm_eu_backoff_reservation(&release->ticket, &release->bos);
+	drm_exec_fini(&release->exec);
 }
 
 int qxl_alloc_surface_release_reserved(struct qxl_device *qdev,
@@ -404,18 +407,18 @@ void qxl_release_unmap(struct qxl_device *qdev,
 
 void qxl_release_fence_buffer_objects(struct qxl_release *release)
 {
-	struct ttm_buffer_object *bo;
 	struct ttm_device *bdev;
-	struct ttm_validate_buffer *entry;
+	struct qxl_bo_list *entry;
 	struct qxl_device *qdev;
+	struct qxl_bo *bo;
 
 	/* if only one object on the release its the release itself
 	   since these objects are pinned no need to reserve */
 	if (list_is_singular(&release->bos) || list_empty(&release->bos))
 		return;
 
-	bo = list_first_entry(&release->bos, struct ttm_validate_buffer, head)->bo;
-	bdev = bo->bdev;
+	bo = list_first_entry(&release->bos, struct qxl_bo_list, list)->bo;
+	bdev = bo->tbo.bdev;
 	qdev = container_of(bdev, struct qxl_device, mman.bdev);
 
 	/*
@@ -426,14 +429,12 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 		       release->id | 0xf0000000, release->base.seqno);
 	trace_dma_fence_emit(&release->base);
 
-	list_for_each_entry(entry, &release->bos, head) {
+	list_for_each_entry(entry, &release->bos, list) {
 		bo = entry->bo;
 
-		dma_resv_add_fence(bo->base.resv, &release->base,
+		dma_resv_add_fence(bo->tbo.base.resv, &release->base,
 				   DMA_RESV_USAGE_READ);
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-		dma_resv_unlock(bo->base.resv);
+		ttm_bo_move_to_lru_tail_unlocked(&bo->tbo);
 	}
-	ww_acquire_fini(&release->ticket);
+	drm_exec_fini(&release->exec);
 }
-
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index d19a4b1c1a8f..5c1305d31adb 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -75,8 +75,8 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_audio_component.h>
 #include <drm/drm_suballoc.h>
@@ -458,7 +458,8 @@ struct radeon_mman {
 
 struct radeon_bo_list {
 	struct radeon_bo		*robj;
-	struct ttm_validate_buffer	tv;
+	struct list_head		list;
+	bool				shared;
 	uint64_t			gpu_offset;
 	unsigned			preferred_domains;
 	unsigned			allowed_domains;
@@ -1029,6 +1030,7 @@ struct radeon_cs_parser {
 	struct radeon_bo_list	*vm_bos;
 	struct list_head	validated;
 	unsigned		dma_reloc_idx;
+	struct drm_exec		exec;
 	/* indices of various chunks */
 	struct radeon_cs_chunk  *chunk_ib;
 	struct radeon_cs_chunk  *chunk_relocs;
@@ -1042,7 +1044,6 @@ struct radeon_cs_parser {
 	u32			cs_flags;
 	u32			ring;
 	s32			priority;
-	struct ww_acquire_ctx	ticket;
 };
 
 static inline u32 radeon_get_ib_value(struct radeon_cs_parser *p, int idx)
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 46a27ebf4588..5c681a44cec7 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -182,11 +182,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 			}
 		}
 
-		p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
-		p->relocs[i].tv.num_shared = !r->write_domain;
-
-		radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
-				      priority);
+		p->relocs[i].shared = !r->write_domain;
+		radeon_cs_buckets_add(&buckets, &p->relocs[i].list, priority);
 	}
 
 	radeon_cs_buckets_get_list(&buckets, &p->validated);
@@ -197,7 +194,7 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 	if (need_mmap_lock)
 		mmap_read_lock(current->mm);
 
-	r = radeon_bo_list_validate(p->rdev, &p->ticket, &p->validated, p->ring);
+	r = radeon_bo_list_validate(p->rdev, &p->exec, &p->validated, p->ring);
 
 	if (need_mmap_lock)
 		mmap_read_unlock(current->mm);
@@ -253,12 +250,11 @@ static int radeon_cs_sync_rings(struct radeon_cs_parser *p)
 	struct radeon_bo_list *reloc;
 	int r;
 
-	list_for_each_entry(reloc, &p->validated, tv.head) {
+	list_for_each_entry(reloc, &p->validated, list) {
 		struct dma_resv *resv;
 
 		resv = reloc->robj->tbo.base.resv;
-		r = radeon_sync_resv(p->rdev, &p->ib.sync, resv,
-				     reloc->tv.num_shared);
+		r = radeon_sync_resv(p->rdev, &p->ib.sync, resv, reloc->shared);
 		if (r)
 			return r;
 	}
@@ -275,6 +271,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 	s32 priority = 0;
 
 	INIT_LIST_HEAD(&p->validated);
+	drm_exec_init(&p->exec, true);
 
 	if (!cs->num_chunks) {
 		return 0;
@@ -396,8 +393,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 static int cmp_size_smaller_first(void *priv, const struct list_head *a,
 				  const struct list_head *b)
 {
-	struct radeon_bo_list *la = list_entry(a, struct radeon_bo_list, tv.head);
-	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
+	struct radeon_bo_list *la = list_entry(a, struct radeon_bo_list, list);
+	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, list);
 
 	/* Sort A before B if A is smaller. */
 	if (la->robj->tbo.base.size > lb->robj->tbo.base.size)
@@ -416,11 +413,13 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
  * If error is set than unvalidate buffer, otherwise just free memory
  * used by parsing context.
  **/
-static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error, bool backoff)
+static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error)
 {
 	unsigned i;
 
 	if (!error) {
+		struct radeon_bo_list *reloc;
+
 		/* Sort the buffer list from the smallest to largest buffer,
 		 * which affects the order of buffers in the LRU list.
 		 * This assures that the smallest buffers are added first
@@ -432,15 +431,17 @@ static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error, bo
 		 * per frame under memory pressure.
 		 */
 		list_sort(NULL, &parser->validated, cmp_size_smaller_first);
-
-		ttm_eu_fence_buffer_objects(&parser->ticket,
-					    &parser->validated,
-					    &parser->ib.fence->base);
-	} else if (backoff) {
-		ttm_eu_backoff_reservation(&parser->ticket,
-					   &parser->validated);
+		list_for_each_entry(reloc, &parser->validated, list) {
+			dma_resv_add_fence(reloc->robj->tbo.base.resv,
+					   &parser->ib.fence->base,
+					   reloc->shared ?
+					   DMA_RESV_USAGE_READ :
+					   DMA_RESV_USAGE_WRITE);
+		}
 	}
 
+	drm_exec_fini(&parser->exec);
+
 	if (parser->relocs != NULL) {
 		for (i = 0; i < parser->nrelocs; i++) {
 			struct radeon_bo *bo = parser->relocs[i].robj;
@@ -692,7 +693,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	r = radeon_cs_parser_init(&parser, data);
 	if (r) {
 		DRM_ERROR("Failed to initialize parser !\n");
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -706,7 +707,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	}
 
 	if (r) {
-		radeon_cs_parser_fini(&parser, r, false);
+		radeon_cs_parser_fini(&parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
@@ -723,7 +724,7 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		goto out;
 	}
 out:
-	radeon_cs_parser_fini(&parser, r, true);
+	radeon_cs_parser_fini(&parser, r);
 	up_read(&rdev->exclusive_lock);
 	r = radeon_cs_handle_lockup(rdev, r);
 	return r;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 261fcbae88d7..c67b69b3e4d2 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -625,33 +625,41 @@ int radeon_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
 static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 				    struct radeon_bo_va *bo_va)
 {
-	struct ttm_validate_buffer tv, *entry;
-	struct radeon_bo_list *vm_bos;
-	struct ww_acquire_ctx ticket;
+	struct radeon_bo_list *vm_bos, *entry;
 	struct list_head list;
+	struct drm_exec exec;
 	unsigned domain;
 	int r;
 
 	INIT_LIST_HEAD(&list);
 
-	tv.bo = &bo_va->bo->tbo;
-	tv.num_shared = 1;
-	list_add(&tv.head, &list);
-
 	vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
 	if (!vm_bos)
 		return;
 
-	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-	if (r)
-		goto error_free;
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		list_for_each_entry(entry, &list, list) {
+			r = drm_exec_prepare_obj(&exec, &entry->robj->tbo.base,
+						 1);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(r))
+				goto error_cleanup;
+		}
+		drm_exec_continue_on_contention(&exec);
 
-	list_for_each_entry(entry, &list, head) {
-		domain = radeon_mem_type_to_domain(entry->bo->resource->mem_type);
+		r = drm_exec_prepare_obj(&exec, &bo_va->bo->tbo.base, 1);
+		drm_exec_continue_on_contention(&exec);
+		if (unlikely(r))
+			goto error_cleanup;
+	}
+
+	list_for_each_entry(entry, &list, list) {
+		domain = radeon_mem_type_to_domain(entry->robj->tbo.resource->mem_type);
 		/* if anything is swapped out don't swap it in here,
 		   just abort and wait for the next CS */
 		if (domain == RADEON_GEM_DOMAIN_CPU)
-			goto error_unreserve;
+			goto error_cleanup;
 	}
 
 	mutex_lock(&bo_va->vm->mutex);
@@ -665,10 +673,8 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 error_unlock:
 	mutex_unlock(&bo_va->vm->mutex);
 
-error_unreserve:
-	ttm_eu_backoff_reservation(&ticket, &list);
-
-error_free:
+error_cleanup:
+	drm_exec_fini(&exec);
 	kvfree(vm_bos);
 
 	if (r && r != -ERESTARTSYS)
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 10c0fbd9d2b4..508a6e9a2dca 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -468,23 +468,26 @@ static u64 radeon_bo_get_threshold_for_moves(struct radeon_device *rdev)
 }
 
 int radeon_bo_list_validate(struct radeon_device *rdev,
-			    struct ww_acquire_ctx *ticket,
+			    struct drm_exec *exec,
 			    struct list_head *head, int ring)
 {
 	struct ttm_operation_ctx ctx = { true, false };
 	struct radeon_bo_list *lobj;
-	struct list_head duplicates;
-	int r;
 	u64 bytes_moved = 0, initial_bytes_moved;
 	u64 bytes_moved_threshold = radeon_bo_get_threshold_for_moves(rdev);
+	int r;
 
-	INIT_LIST_HEAD(&duplicates);
-	r = ttm_eu_reserve_buffers(ticket, head, true, &duplicates);
-	if (unlikely(r != 0)) {
-		return r;
+	drm_exec_while_not_all_locked(exec) {
+		list_for_each_entry(lobj, head, list) {
+			r = drm_exec_prepare_obj(exec, &lobj->robj->tbo.base,
+						 1);
+			drm_exec_break_on_contention(exec);
+			if (unlikely(r && r != -EALREADY))
+				return r;
+		}
 	}
 
-	list_for_each_entry(lobj, head, tv.head) {
+	list_for_each_entry(lobj, head, list) {
 		struct radeon_bo *bo = lobj->robj;
 		if (!bo->tbo.pin_count) {
 			u32 domain = lobj->preferred_domains;
@@ -523,7 +526,6 @@ int radeon_bo_list_validate(struct radeon_device *rdev,
 					domain = lobj->allowed_domains;
 					goto retry;
 				}
-				ttm_eu_backoff_reservation(ticket, head);
 				return r;
 			}
 		}
@@ -531,11 +533,6 @@ int radeon_bo_list_validate(struct radeon_device *rdev,
 		lobj->tiling_flags = bo->tiling_flags;
 	}
 
-	list_for_each_entry(lobj, &duplicates, tv.head) {
-		lobj->gpu_offset = radeon_bo_gpu_offset(lobj->robj);
-		lobj->tiling_flags = lobj->robj->tiling_flags;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 39cc87a59a9a..d7bbb52db546 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -152,7 +152,7 @@ extern void radeon_bo_force_delete(struct radeon_device *rdev);
 extern int radeon_bo_init(struct radeon_device *rdev);
 extern void radeon_bo_fini(struct radeon_device *rdev);
 extern int radeon_bo_list_validate(struct radeon_device *rdev,
-				   struct ww_acquire_ctx *ticket,
+				   struct drm_exec *exec,
 				   struct list_head *head, int ring);
 extern int radeon_bo_set_tiling_flags(struct radeon_bo *bo,
 				u32 tiling_flags, u32 pitch);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 987cabbf1318..647c4a07d92a 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -142,10 +142,9 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 	list[0].robj = vm->page_directory;
 	list[0].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
 	list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
-	list[0].tv.bo = &vm->page_directory->tbo;
-	list[0].tv.num_shared = 1;
+	list[0].shared = true;
 	list[0].tiling_flags = 0;
-	list_add(&list[0].tv.head, head);
+	list_add(&list[0].list, head);
 
 	for (i = 0, idx = 1; i <= vm->max_pde_used; i++) {
 		if (!vm->page_tables[i].bo)
@@ -154,10 +153,9 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 		list[idx].robj = vm->page_tables[i].bo;
 		list[idx].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
 		list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
-		list[idx].tv.bo = &list[idx].robj->tbo;
-		list[idx].tv.num_shared = 1;
+		list[idx].shared = true;
 		list[idx].tiling_flags = 0;
-		list_add(&list[idx++].tv.head, head);
+		list_add(&list[idx++].list, head);
 	}
 
 	return list;
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index bca726a8f483..ba7baa622675 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o	\
+	drm_exec_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
new file mode 100644
index 000000000000..78eb61eb27cc
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#define pr_fmt(fmt) "drm_exec: " fmt
+
+#include <kunit/test.h>
+
+#include <linux/module.h>
+#include <linux/prime_numbers.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+
+#include "../lib/drm_random.h"
+
+static	struct drm_device dev;
+
+static void drm_exec_sanitycheck(struct kunit *test)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, true);
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static void drm_exec_lock1(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
+		drm_exec_continue_on_contention(&exec);
+		if (ret) {
+			drm_exec_fini(&exec);
+			pr_err("%s - err %d!\n", __func__, ret);
+			return;
+		}
+	}
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static int drm_exec_suite_init(struct kunit_suite *suite)
+{
+	kunit_info(suite, "Testing DRM exec manager\n");
+	return 0;
+}
+
+static struct kunit_case drm_exec_tests[] = {
+	KUNIT_CASE(drm_exec_sanitycheck),
+	KUNIT_CASE(drm_exec_lock1),
+	{}
+};
+
+static struct kunit_suite drm_exec_test_suite = {
+	.name = "drm_exec",
+	.suite_init = drm_exec_suite_init,
+	.test_cases = drm_exec_tests,
+};
+
+kunit_test_suite(drm_exec_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index f906b22959cf..b05a8477d0d0 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -3,8 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
-	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_range_manager.o ttm_resource.o ttm_pool.o ttm_device.o \
+	ttm_sys_manager.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index e94479d9cd5b..e30e10e25c53 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
-	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
+	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o ttm_execbuf_util.o \
 	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o \
 	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
 	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
similarity index 97%
rename from drivers/gpu/drm/ttm/ttm_execbuf_util.c
rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
index f1c60fa80c2d..5e4e28899acd 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
@@ -26,8 +26,13 @@
  *
  **************************************************************************/
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
+#include <linux/wait.h>
+#include <linux/sched.h>
+#include <linux/module.h>
+
+#include "ttm_execbuf_util.h"
 
 static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
 					      struct ttm_validate_buffer *entry)
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
similarity index 100%
rename from include/drm/ttm/ttm_execbuf_util.h
rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index fb8f0c0642c0..49e3dd8c04ec 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -37,11 +37,11 @@
 #include <drm/drm_file.h>
 #include <drm/drm_rect.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
 
+#include "ttm_execbuf_util.h"
 #include "ttm_object.h"
 
 #include "vmwgfx_fence.h"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 240ee0c4ebfd..927fc8afdbfe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -32,7 +32,7 @@
 #include <linux/hashtable.h>
 #include <linux/ww_mutex.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
+#include "ttm_execbuf_util.h"
 
 #define VMW_RES_DIRTY_NONE 0
 #define VMW_RES_DIRTY_SET BIT(0)
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..65e518c01db3
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @interruptible: If locks should be taken interruptible
+	 */
+	bool			interruptible;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @num_objects: number of objects locked
+	 */
+	unsigned int		num_objects;
+
+	/**
+	 * @max_objects: maximum objects in array
+	 */
+	unsigned int		max_objects;
+
+	/**
+	 * @objects: array of the locked objects
+	 */
+	struct drm_gem_object	**objects;
+
+	/**
+	 * @contended: contended GEM object we backet of for
+	 */
+	struct drm_gem_object	*contended;
+
+	/**
+	 * @prelocked: already locked GEM object because of contention
+	 */
+	struct drm_gem_object *prelocked;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])
+
+/**
+ * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * prepared and no more contention exists.
+ *
+ * At the beginning of the loop it is guaranteed that no GEM object is locked.
+ */
+#define drm_exec_while_not_all_locked(exec)	\
+	while (drm_exec_cleanup(exec))
+
+/**
+ * drm_exec_continue_on_contention - continue the loop when we need to cleanup
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_continue_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		continue
+
+/**
+ * drm_exec_break_on_contention - break a subordinal loop on contention
+ * @exec: drm_exec object
+ *
+ * Control flow helper to break a subordinal loop when a contention was detected
+ * and we need to clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_break_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		break
+
+/**
+ * drm_exec_is_contended - check for contention
+ * @exec: drm_exec object
+ *
+ * Returns true if the drm_exec object has run into some contention while
+ * locking a GEM object and needs to clean up.
+ */
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return !!exec->contended;
+}
+
+void drm_exec_init(struct drm_exec *exec, bool interruptible);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+
+#endif
-- 
2.25.1

