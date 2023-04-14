Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789976E28CE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6122C10EE27;
	Fri, 14 Apr 2023 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B475410EE21;
 Fri, 14 Apr 2023 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681491450; x=1713027450;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=M+yubaH8gQEOZ12C+cvbUaT2f2j3xwQSlRxe8t4acrw=;
 b=Px74YQWS5pufoqBZO7TV/x3VuMipAKP1ribDpjgcLLsQfHjd+1wIHl7H
 FEFRRWMYvbVRSrsNR/yuxhMop8l4nl4a0MZMOyAwaKIHY9wO8/UePSh1M
 DtZcpmhKGscfRSDiwrAucWrcVlnIQVpu1Uan9+LFnCGjm6SUdMbajnwj9
 QbxX6x7GqCu7arx7TsIJkE9LXNSkUA/PTSn3TqHCpZ7vQYnUq+bS0IVWI
 CMDP+s0a0LR21EG2+N3EpdS2gLfZfk2uvO094fsRpbsssYYcDYdsG/Zu9
 ptdE8QVSJachofXRuZ+BeAjB8CROTZakM69Qdo0ZcM6gI6kERM4pU/XCt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324862826"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="324862826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754509801"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="754509801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 09:57:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 09:57:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 09:57:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 09:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vs/yBXos0lpaIfCx3lLhBz+g7oa5RwUViyFo1QA4qBpPfM4BymTcRAUBQa9edhmzAoBy7gfIiJt21ws6BI7ob5eMRFMpUstEAZNUgqLS4PPvU5GCjiSKQBf4Wz15w+o1PzHQVE0VpNV22ADHVrhA3pKoSaJinGRvE7Be9pwkeklZdfaWOtYWQsymojpdpoxLu23ssd9NROrmlQGpwW0N6CJ/+vT6J4WsDYVn1pNpPRAvVZZNraDRcCf7CJr5DtFp8F0lXfRxs+FqBBzQxU4IPl1aBIuIereCcBW9Xt+dNzfPFv6I5SR+ic7OzRDLf9aZviZqoYPd3ZBkGtA8YAlarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI+RmyjUeaGF/BVoOiggCjWDoYA3xCcywA8RWwNnn7k=;
 b=Mhg5oUvVq3LuHu/s+jCqwljvUK8dL6O/65F3IUJON28M/RC5pJNhuPPOW/L6IldltL7EBqXJPUVmahZuWe/iiZu28kfAvmAsqCFxIYrCCZRwnOAb01ktopFD3GZONwNCSUC1a5TVXBnbCsdGX8GMiSE0u8A2EZEviq9zpCGL2UVAl9UqBdZjq5ot0sQt3PgH9YVX1boepbDO/sYlhT5mhqWydgeMwz6yXMoTgvNCZSnp1iaJx9JxtlwPvcpd6cgE+AxE8P7cEUkaTMY7+Y/Y3wqaLkBpdbkrGc+nXqk0Rl8ypttKZtPeUxmuTlN3dVDsphSjNMgFSIH/qAV4LCBtsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Fri, 14 Apr
 2023 16:57:27 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534%4]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 16:57:27 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC PATCH v2 0/2] drm/xe: switch to using drm_exec
Date: Fri, 14 Apr 2023 18:57:12 +0200
Message-ID: <20230414165714.2969708-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|MW6PR11MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abfa0a5-7858-4714-dbf4-08db3d09537b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJDm5y4osEWJjlCP1j20cN+AeZOR6bHHaexeo/Bw3iFUjBkcZSMHe7pX5rXT62lBAFZPByYksCY+57NlrtcSNI5lDWTAQQyyhX+Ef7cW1UoyyF4vXTRnT32lyFnPexf5Yvr6W/lUWdHm88s9+NpcVvkpc2mQCVX8YLW8zBE8U/m3FXyH7BDYmew8rPaPmeXAl8GFmfqV0FZPMO5mmfR1e0eaBIX1f4q+9xRIpEnYQvlpzT3EZZl6hctNwnYFjFlgUg6FffDEOaQHhCcqxZpsAfc597DYaZQpzgtx2YGMSTQdn7Z5rOZ5xVTyTcrzXrmLU+KGGWfnCL7UbMTQtU55y0RWYPVi26hf5EDPaT5x1zZXdOVnrbtR2qWYCjsi+nY/G8n4Q0h0OhKcOhteD8tkOXGa2TGfx3xjCxo9j4ABA0nnmS/CloV6CXUkx7xyqKc3j1DpOgGLHIGKqcsxbT30SKC3cuxVsTGRqQDNTglwleVi5UmqbyZbKPRPetmHNRKK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(44832011)(82960400001)(38100700002)(5660300002)(36756003)(2906002)(8936002)(86362001)(6916009)(8676002)(66476007)(66556008)(41300700001)(66946007)(4326008)(2616005)(966005)(83380400001)(186003)(6506007)(316002)(6512007)(26005)(1076003)(6486002)(107886003)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VC9NbmxqdWFaaXNoNzQ0VzR5V2VIU21FTlI2aGwwRVZvczZmUlVOZVY4ZlN5?=
 =?utf-8?B?eXRjaW9tb3VxN1dwOUZhdFZiTytIdXF5dkxNRk1KWFNUc1ZQdlVIWTc5MFp5?=
 =?utf-8?B?S3F4Q1Z0ZDdLQ2FEeHJPM3dUS0NlSjJUTjQxcTVkTUNkWm9yL0UvZFhQS1dr?=
 =?utf-8?B?RkxEQkp6ZHJ6RXR6aTNld0tlMGF3N2tSellrTmRKazlZVWhjL1JTanh1bWxO?=
 =?utf-8?B?ZUgxV1RTN2N6SE51dGdXK2NDWS9UNHJJdXNxaGlRZE1KcHRFaXppVjRLUjM3?=
 =?utf-8?B?eUt0cFVZeSsvQW5pbyt3a2hLS2EySjI1UGpGS1JHWkpQSnBsRVJIUmJZMGhX?=
 =?utf-8?B?QkhBL3ZQSVF1Z0NOZUw1cGUzTmN3dTEzSnplclQzQ2dJOWRXdEg3Mmt2WHFx?=
 =?utf-8?B?OVBmREo3UzkzSkc5SFdpdkpKeFpTTWxWR3EyYktlRllPQURpSHRpODREVTI5?=
 =?utf-8?B?K29HY0MxSzM0SWpFZ2tkb3dteGRuUXRxQ2V2S0gxWjNjSjhPQVk0ZFd3SU1r?=
 =?utf-8?B?UVZFaXlWZy9xa1VoMStFZDQycWJnWW5tUFdrVFFIbThaR2FoZ0gvN2hPU1RT?=
 =?utf-8?B?QkFuaFQ4MWJ2ZFAxZ05Yd3hkWlB3MkErWFBIVE1QUkRsbU44eHBIRytYYWFM?=
 =?utf-8?B?RkpnNmVuMzV2azl0TFpSWUJkRHBKY0QrUjg5NmZhV0pwNE9wYmM4NmlZSWkx?=
 =?utf-8?B?MDlXZGpWMHdwTjJyVUhVQVdqMXZBR2kzU2JSTHBoem4xSEh0YjNmNzdyVmsr?=
 =?utf-8?B?VE82Y3RiQkZaVjFVN0RidVgrczA3YWM4VlIwZjhjNmxKa3NLT3hsYmxFWmF6?=
 =?utf-8?B?ZURKTGl1dVdsY2RVM1RwekFxa2c0MWVab2xUeDkvV0dHeWdTeTE4SUl3UDN3?=
 =?utf-8?B?dk1UVSs3OU1URHMxZzc4aHV0ek9Xb2N0MUd5UFo0QmxxRUF6Y2ZnZ1JMUnpt?=
 =?utf-8?B?V0tQZ1JSYVRnRFZsRHJDN0ZVbHQzOWJJMlZUa1RqZ0crMXpqclY0WDFtWGJM?=
 =?utf-8?B?L3ZtVDI3N3U0cXppUk5FdHlsT2h6R3gwd2J0SHJGbUUyZ3paNkRlWkl5WWxX?=
 =?utf-8?B?ZkVCL0k2MWZuMzRXa250ek5LRTBwT09kRnM1Q2E3b2hhN2syYWE3TjZ0MWFE?=
 =?utf-8?B?OTY2UHJqeXhqOTBLSnNnMDFDdFRCVnBaVENONjQvUmF5WDBGeHE3OVBCUDc0?=
 =?utf-8?B?TFZVSjZZdXpXREpid0h1a3hUeiszNjJ6VjF0L0piKzVQSDgwejhxT0RMN3JS?=
 =?utf-8?B?eFo0ZEZseS9ScmU4L0xJREMyaXVZWGtrejVKNXBFbTlIWHJFMzE0ZGkvWHd5?=
 =?utf-8?B?RXFydzFJYk4xd2g1OHN1cDlGbjBMTllXOHMyZHZOcEg0eThtSkMzcHNzV0h0?=
 =?utf-8?B?eTlvT2wvZkdZVFc4RERTVjlnR1NpaEQzUjJXcGRZdkZZWnUzYmdmSGJEb0Fl?=
 =?utf-8?B?UVhPTkE2b2VFWXlIRVJRbUN1NmpYKzJYd0RnM0dtUjVpQ0Uza083eHFyUXFr?=
 =?utf-8?B?OUp5L0hzaElzNjBFSEF1QmtsQjd2Qm9nenN6UEFOWjRTaVhXbHloZWhzV015?=
 =?utf-8?B?WFlwbk9CeFVaU2RBVVJjSDB0dVMrcFZvVXQxSDJ4UFpEU2pzczRJNCsyWHJn?=
 =?utf-8?B?aXFNYkFWR0RSbmxCVUFXWmY3ZmVFZ0lLRW9kU0xWYlBGWHljSWs2TjlOQjlV?=
 =?utf-8?B?bEJiRDNJaHlqanlDcGxiV0g4V3NTTFJwanN1dFNMSGxoYzJERnFGYWRTblRi?=
 =?utf-8?B?bmc4N0JFZ1RLbi9tWmppSFkwSHA4d0p6aVVNVWRyOG5GNTFoY25DeDZaUmxv?=
 =?utf-8?B?cHJwSDE5eVk5TDEvSzRha3YwZG0rNndTNzVDWWg0LzA3d1UxdmVSV3ZCWWNE?=
 =?utf-8?B?dVEwd1YxQ0phc3UzWHg1WmhqUGFCZmxCVWxydnpLSlJleG9xY0hXL3I2cGNX?=
 =?utf-8?B?akkxNS9ITmh3bDl6QTd2U1NqakpnY1dIZFJrT0dvZG5GVXhIZ1FzSjdPamxB?=
 =?utf-8?B?ejVST1h3TlZua0xZa3pmeHVGRVVYWlBob005WnNVbnhReHJRNW4yd2pCemx2?=
 =?utf-8?B?bXEvM2tHc0pHck1MNGh4OHEySEExaWdYRVdJL1dGM2JpSXA2U21SZ0F1eUlm?=
 =?utf-8?B?eWpTS0dCMkEwR3hzUTdlV2xwTWpzZ1VJeTlFTmgwZEQ0MG9XSHNsZkw4MGdz?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abfa0a5-7858-4714-dbf4-08db3d09537b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 16:57:26.9862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hH5SjdC8TrBm9kGNqS4aq7ztG3K2v5PHA3P6ry5FC5t85l32btdqnALIaNsLCxsIQZfposrl9IBahlUOAphuK7t/QtU2oA6C+pQKlQ5QGA=
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

This makes Xe use the new drm_exec helpers provided
by this series, which is not merged yet:
https://patchwork.freedesktop.org/series/114464/

v2: add a first patch with squashed dependencies

Francois Dugast (2):
  drm/xe: dependencies for next commit
  drm/xe: switch to using drm_exec

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
 drivers/gpu/drm/xe/xe_bo.c                    |  22 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   1 -
 drivers/gpu/drm/xe/xe_exec.c                  |  32 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  67 ++--
 drivers/gpu/drm/xe/xe_vm.c                    | 217 ++++++-------
 drivers/gpu/drm/xe/xe_vm.h                    |  19 +-
 include/drm/drm_exec.h                        | 115 +++++++
 40 files changed, 1083 insertions(+), 819 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
 rename drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c (97%)
 rename {include/drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h (100%)
 create mode 100644 include/drm/drm_exec.h

-- 
2.25.1

