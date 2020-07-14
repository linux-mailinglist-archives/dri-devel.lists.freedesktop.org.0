Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DD921E636
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 05:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DFD6E87B;
	Tue, 14 Jul 2020 03:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35136E87B;
 Tue, 14 Jul 2020 03:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRU39nSYdqzTRmOx9V6PtPlLi7GJskwW9tM9EOPHbriuBZKCYBGIJ8xQSbrqcD0Av0PYDQrLWi5ljLHd21DZ72XrNpetjMKOIl3F003kOm6ey9Mza/l3C7IrGqSvLj1429nRcsVx5+trmlkU9JSpBvSIl1KTDmuaJbZ+OPvD4StGDtjY7en+j2NhZEX84VXj9H6hgKgBx4KYYiYURTObrAzPgodDHhLyb72QfOdmiM5LkegD5lvWOWS2V7KamZYcCnyD7WFbDllU5phhQq9Xo1bogFeU6eEFd1J2Qbgj02zyKZDgUzu3AViYSSMe6L3/lCFMKCZxYLwfirOedJHCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ/mNhwdbCjCTlePIQxYHLrab3LW76fHEOQVfHi+tac=;
 b=WCTUxwUlArBhbyAEQmrNKGCa//jjmTMYQQ37V4WDevjMFGyQK+smqbLetMpcJCfU06VuMp07CF2XC+jM7ddQbFLTu5pw2cynrlaS5VWW/fRyhu1h1b4dHJFnemEn8ARN9sZtdPTaYFn2EpxJ0WD7uT94jUu/UDIDNyMcV0yPPsyiF6vF7NF3PFUppbwpv3iaq6lxBPZafZ+/OcKRSj5NGObHGqbH455Gw8sCYRpytQqe8mrkfdWwiMW5kWotM5v4AEv42wwPn4g3vnmKBXEgpEcccJhvb0Ujo1+ZQ4ahBNOBq6Pv1PoEDsCInSfNeJTTNDf7GA5olguWyZHa2jDiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ/mNhwdbCjCTlePIQxYHLrab3LW76fHEOQVfHi+tac=;
 b=Vnm1+2z90QCozRGFiXiZqMIpVpekEzqsN98lzPoCkddDCxzPKajjJ9013/g55KqunEYRkFANROtfQkKl6c4ZCKA6uqYIFaJKRG/yGtXQ1g/rSnOfiAyOTf/3OFro/SA9nm4kT73kQKLHBk15sHyBIo8SmcgYyLS6T4RKJSZVSSg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2407.namprd12.prod.outlook.com (2603:10b6:4:b4::24) by
 DM5PR12MB1210.namprd12.prod.outlook.com (2603:10b6:3:75::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Tue, 14 Jul 2020 03:14:48 +0000
Received: from DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::9c20:aa3e:1b50:7ce5]) by DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::9c20:aa3e:1b50:7ce5%4]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 03:14:48 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] Upstreaming the KFD IPC API
Date: Mon, 13 Jul 2020 23:14:34 -0400
Message-Id: <20200714031435.13362-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To DM5PR12MB2407.namprd12.prod.outlook.com
 (2603:10b6:4:b4::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22 via Frontend Transport; Tue, 14 Jul 2020 03:14:47 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f9b8b1b-d66c-49fe-8a18-08d827a41096
X-MS-TrafficTypeDiagnostic: DM5PR12MB1210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1210271D3A06F0F241DED49A92610@DM5PR12MB1210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRsUbjHeH+NdNdDcGFPlx3bDeIzioAlXuCwPXBCchMsFMXh7ccMsfcT/Dvinr1B6AUUrJyGiFErh8So6nJKBdXjb/g/kzvUlNNK9EixFrvx20N3c9MQ5fIMrOBvNu2Q/mrixOxYQWhXzJrBkBEue4EarSbj6SdRcx5bwkG0D09Pa5zHuGKa/zwk9H+T4OH6arTIJ+BAwEWrJMW+ga5Yi/fzez0Y+7W+7W2mqAZ65DDieIUbTeiOkduPiXcWGScxvGlTSCtmZwxPn0SY86lPWQehcHQV2k/CeDB6+xRdmm/iGhSwF0HsQTRcHKgd4jCYH/8Azi25taJiWsIdsAFaU1qpaKthmQvRFwsAnvOpt+qHgSKOijfJhV0NLhCZ3lNLwQE8lZFtlyW0SnRMVeIaxbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2407.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(36756003)(86362001)(1076003)(6666004)(66476007)(66946007)(7696005)(26005)(5660300002)(316002)(478600001)(66556008)(52116002)(966005)(8676002)(8936002)(6486002)(956004)(4326008)(16526019)(2906002)(83380400001)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +n2/V9wQ6Oi7HiPOhp5WXHIdMSD6XOnvfJ3tctHiwbrVxScRY4fiC/8Fl1wkmL7UU9SZZSI/8J03piFFYSihXkv6gNW3wpDG06tYDrMG+waU5wohc17MZA9RRd3pIbXUY0DmY2+ZCDegM+L8muyyIc2g93zY/gU8teitPa2VvJQ/+EtaJOMNqZrMeueXzVCmaL8ZzAXVIQAY0KiVkRenKrHaBB6dDat+2So2Ar3au58oQJcwD/ToFdwGjtZD3KPmpyHrQZCHFbM7/gnNDxl9tnESSPNEcXYx+guzmMcoG0T06iSrO0fQsoiI2Isq/aKEChgwY/lXsPJsOwuHm1lxpg12zdApFhWuYRxmyBc1hUqrnmPJvBhCkW+4mLmuM3UaSNwQXVfX+aRRnyW/oSF9DlL8Uc+QXkZuIpS2b2QQ890+qpUbfyOcB3Md1Si6p+LdXiefHzV72W0n23IkLA0m7CBNfLK7eMITUtjzC9UYqmX64tog5sUCLqgj0HznLX9g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9b8b1b-d66c-49fe-8a18-08d827a41096
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 03:14:48.1165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhJWIQeMihDfv0bbzMSgza/LIetTZmKfQ/nARSxKxGeEoEQeKhqDQxbz9K0PYc1ApvasBaP+KAa/C6h2aMMtRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1210
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This API is used by MPI/UCX for efficiently sharing VRAM between MPI
ranks on the same node. It has been part of the ROCm DKMS branch for a
long time. This code is refactored to be less invasive for upstreaming.
As a result struct kfd_bo and the associated interval tree is not needed
upstream.

The introduction of this API upstream bumps the KFD API version to 1.4.

The corresponding Thunk change that goes with the proposed upstreaming of
this API can be found here:
https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/commit/682922bd405caaab64887e8e702b7d996ba9e2a8

Felix Kuehling (1):
  drm/amdkfd: Add IPC API

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  56 +++-
 drivers/gpu/drm/amd/amdkfd/Makefile           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  74 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_ipc.c          | 263 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_ipc.h          |  55 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_module.c       |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +
 include/uapi/linux/kfd_ioctl.h                |  62 ++++-
 9 files changed, 488 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_ipc.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_ipc.h

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
