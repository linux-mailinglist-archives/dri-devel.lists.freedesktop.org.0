Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46532CB62
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 05:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DFE6E47E;
	Thu,  4 Mar 2021 04:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586B6E47E;
 Thu,  4 Mar 2021 04:33:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUeGVxU+rMzow62RRdYoEkZmR+RblKJCoCYNmaAWFgTnn6t6i6s2i/3TsuRfEXWwNZFLvi0wsl+q0Pw1UyTGQ8GkcdrPgcgTDW9O+Vf6I++5/DdfLWpRb5lO3b7w7NgligtcruOzr8cCMMpahje4R+3tXQhAB+bOFUzinwcjHE145STL+jQkQvj4DXmij2F2d9E6AyBzEap373OkLoLRZ4vPVEf5bu1I5nN/TsPLs7l6pPJFlbIlX6mHjZ3exJpt7h/x7faBZyepyIb2mTWlxYKzkUNWQHFwzLCM2avVYFqRMFzvhzTb9V5sK6VdLk7JJICIg9ZxNvMbdar1F0R26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4eNoIMC1IIO3UvRIxyQ1FLiwLe+HUZOCpmRqG/i9jg=;
 b=ktIbPEtHTc4nXEOvcQC+u/8ipXv7ACUapnMLtTaRIGZ4BRMX5NvdyHM2IhuwtstcEARIXo8DMaxWfXj4ZipTK9faBhNLltXqrQZTfdZTWt5QUyHxfx/OgQlEe62nzEZbpFuMGXR3chDUXfLR/2isElhdVOkbxblR9BkyCvsSsKMp1Y6G0zkqKkeASq439JRFtlNkWgbU3sbwkefnyB0J+PgZD1s+mfBndWcNJP/C3kF7+g5PtGRCkk1v56a+LEZ3IF+TqIplFDHLalSY4DMEfvczCnW9K0hR7ydzTNPdlAhAiKuavC+MxghdSQEZgqjATArAnMa3K9BeDQwHT+1sFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4eNoIMC1IIO3UvRIxyQ1FLiwLe+HUZOCpmRqG/i9jg=;
 b=W6mXcRsiWF9Ek8JpK/MXF50AM0kbjRzEdajRadSktOAgdfwBSbVaBZYzXoltLTFyoQpKlvKVWksZCxQItvdHQkc231lVEU9OE6r9RaSfzv7TUbtfRSO/DVzPEIqOyR25V2mqs3ZiRzFEnD0aWxGvzZdpFkOAvLArWzzDUccA3AI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18)
 by MWHPR1201MB0192.namprd12.prod.outlook.com (2603:10b6:301:5a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 04:33:20 +0000
Received: from MW3PR12MB4491.namprd12.prod.outlook.com
 ([fe80::e0fc:4c91:e080:7b]) by MW3PR12MB4491.namprd12.prod.outlook.com
 ([fe80::e0fc:4c91:e080:7b%3]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 04:33:20 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.12
Date: Wed,  3 Mar 2021 23:32:55 -0500
Message-Id: <20210304043255.3792-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: BL1PR13CA0361.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::6) To MW3PR12MB4491.namprd12.prod.outlook.com
 (2603:10b6:303:5c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 BL1PR13CA0361.namprd13.prod.outlook.com (2603:10b6:208:2c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.16 via Frontend Transport; Thu, 4 Mar 2021 04:33:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48584c9b-e5bf-47a3-338f-08d8dec6a381
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0192:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB019291A753D40CA52B69F77DF7979@MWHPR1201MB0192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xZ1jX4QLpdp5b1WYxN00VlIv4bf8FfjyZpzl4IuWT8+zgVnEZJ4h5qZ7KNZVkam4fM1oNqctHIIHhe0oi4RvXo+rk3fpoRn0xSq7Ut/adIJJOLitI6CKb6nl+/wwrFtosOExL6lH0iu3hYEDjIp+lPfhGaU2LqGh5f6l42ZPOkmVwEp8ofUpDT5XV8o1202EK8YSHbqHcK+f0LDInPLi14BAh5fABuulcCKsqnhQMKDDBt1fxNMbBcGJEjTkipjhhWOOa41/5psU4NUNYoDoPCCv+M1VixALKsiXd7xm1oiMsxIHXzCOZpGKUmhNSaAtLfVF9DhjVaOAhlIeqVXFQPNtu/IzfXTkazrNxmIIZw1X4qpP3iVlMHDP2ONWl+oGM4/ZbTij6NcsGaVr590NI042h8P+/Xwj86qKRNMO4hopJXG1KZMX+ow0o9U1zjlkszHFGSQsnJ1z/y+QKYzIUV8vEQ52fy7gGE5GfX9UvfX6Uqyoixs/HjTuPy8kYR2TCc1jMXFIB5svE1VecmYelbhaGJmG/GXBd5JSuleoNATwa4jZc3ahc9NM4G+46E3fzBM93RsfGCv9GsOrh1qJIjFxo50sq22NSWR8mW/qlhJ3n7STxKN4P/g55CQUBwE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(69590400012)(26005)(186003)(966005)(6506007)(16526019)(5660300002)(8936002)(4326008)(86362001)(6512007)(316002)(956004)(2616005)(6486002)(478600001)(6666004)(52116002)(8676002)(66946007)(36756003)(66556008)(83380400001)(2906002)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K7xnqPFTjxtGOyIK9eKEI1HfsSeC9GG9zjy/wKlUFOc1fl91G1QyUaKY6Nws?=
 =?us-ascii?Q?6bkQ0G0WMB7sUOQsjfpPC3XfWmVhds8FMmnmZ/PsRzjgI2hqLRrZ0oOgdRyC?=
 =?us-ascii?Q?rZsarBfLynEzYVCqPn2AxLKf45yR3czVaV+7AOqev8M0vrTRPA5ZM1n6HbIG?=
 =?us-ascii?Q?9i2+kXV3Gvik8lxlD+/SvPlqOVKc6Oa1Gl0n8DcOPiY5wUzuNQhK/48xu3Dx?=
 =?us-ascii?Q?AG+k9i7Knn0AnfL8uOZzoIstrKwwER83yQRI+IfR8KMj+2Sn2L+QTcERp3y3?=
 =?us-ascii?Q?8LofrFFafvlVXPaPzz4A4LzeZHJ1wjT8J4RX1dKcBR51r7O041wiSBfDjY8m?=
 =?us-ascii?Q?4ZXEvCK4DDT6lU1rWnJPu7mizI8P7KDZu4orNkUjKJYbX7BzuSSB/qDfdEbi?=
 =?us-ascii?Q?khAQSspTsrn/llVpNPUVRjTQiQk1zFM6MBjn3m7QNG2TwUedDe7gIouO/5Iz?=
 =?us-ascii?Q?2N36R5hx28HFEgeG1ysevS3vwgpN0sKYg84oe9JLaOMloPtszudURUkTw78X?=
 =?us-ascii?Q?7Fy3qFivHHpwQXEqKQD9f7/MbcAFFqcI739fKd+YPtp2MZ2U7wx/OECjBXu4?=
 =?us-ascii?Q?eDtLcxnJ2DAWQ97HeV1wMrJCYnWpQ5GbCyz8b/fGK7CX4trvAcH2szIYAeof?=
 =?us-ascii?Q?WAkIApVFiywdeKOijE98dqjU0r3zXYUIJCXwJtR7kEh6oaj9Be6nhI1kimBI?=
 =?us-ascii?Q?/z8x9CouVePHZplkG+Ya+DWQw+4Os/h7Ufc4ZelmJfE3tGAK6DKBZyuN7Cm+?=
 =?us-ascii?Q?GezxtqQcT/5D+DtvKLMw+RGeRlu6USezBB/4jcHlVTXy1yxqz98CUz5tgFHV?=
 =?us-ascii?Q?RUl92PObnTR+o3yDYS+4pFDN/yZuempwuwlYlt7dDTtK+mJo6B73oPZoDRGc?=
 =?us-ascii?Q?hP99J8BjXA9N31114ZyaVXlyx2+OPhIlgqKdZ2gUgSTBfvQ5GhbbPGuMnq2W?=
 =?us-ascii?Q?+lzLhXFje4/oTJGm+djeeMZGnDMiLbZutuVWybLeZ56pLoP8TOhUGR+oAizw?=
 =?us-ascii?Q?YBnZ8wMyy/pk4ZrcaMly9QrkicQ+xw0ZBX1GiccJEpXC02znvPK9qwRyWrHn?=
 =?us-ascii?Q?6fjftMPh5B4hfXI6Jkkgu65Rc+GMBd+e65uK8Zw61MaAq1oBVVpA8fGJGYGn?=
 =?us-ascii?Q?KOlsqMCmrZSmHkZhJpsiwe4CRz5z0kCyxHD7u9a36IKQSsCAH07YfozAwGFH?=
 =?us-ascii?Q?5v8clakA7TewHueLdcx22kDl18NqhpjMABjaY71rC9W4pqfAOnh/pdaNPEIu?=
 =?us-ascii?Q?ElGr/sa/vd8CnAeVs+d2wcyLiZEs4kNVwu/F1HyjJ3Apd9dvLPIMZ+r7YDG4?=
 =?us-ascii?Q?8Wqtt8d9nIgEFrtpCfNuZw0t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48584c9b-e5bf-47a3-338f-08d8dec6a381
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 04:33:20.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsHjiBI4hV5/hcIoNpFC2D4mWJt/PGtPXXA8BkRrpoC4F0fXtqlodIf/irITu1LO+W01S485pGVAWT486UKPgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0192
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.12.

The following changes since commit ea3b4242bc9ca197762119382b37e125815bd67f:

  drm/amd/display: Fix system hang after multiple hotplugs (v3) (2021-02-24 09:48:46 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.12-2021-03-03

for you to fetch changes up to 1aa46901ee51c1c5779b3b239ea0374a50c6d9ff:

  drm/amdgpu: fix parameter error of RREG32_PCIE() in amdgpu_regs_pcie (2021-03-03 23:05:16 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.12-2021-03-03:

amdgpu:
- S0ix fix
- Handle new NV12 SKU
- Misc power fixes
- Display uninitialized value fix
- PCIE debugfs register access fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: Only check for S0ix if AMD_PMC is configured
      drm/amdgpu/pm: make unsupported power profile messages debug
      drm/amdgpu/swsmu/vangogh: Only use RLCPowerNotify msg for disable
      drm/amdgpu: enable BACO runpm by default on sienna cichlid and navy flounder

Asher.Song (1):
      drm/amdgpu:disable VCN for Navi12 SKU

Colin Ian King (1):
      drm/amd/display: fix the return of the uninitialized value in ret

Evan Quan (1):
      drm/amd/pm: correct Arcturus mmTHM_BACO_CNTL register address

Kevin Wang (1):
      drm/amdgpu: fix parameter error of RREG32_PCIE() in amdgpu_regs_pcie

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c                  |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c               |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c                   |  2 --
 drivers/gpu/drm/amd/amdgpu/nv.c                           |  6 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c         |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c            | 15 ++++++++++++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c          |  6 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c           |  2 +-
 9 files changed, 26 insertions(+), 16 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
