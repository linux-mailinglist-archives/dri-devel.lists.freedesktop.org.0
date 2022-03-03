Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43E4CB5F6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 05:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488B10EEB4;
	Thu,  3 Mar 2022 04:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F010EEB2;
 Thu,  3 Mar 2022 04:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwS4UPQADQMvtncl7rRr1lsTXD/Xrc8+zMEkzQM/V1R0jNwFTvbJYkCYmL9u4C+tEkZZIsIiY699ZZazyaV47dZyG1/EeCoVSyGb1o70UDhO4jIhP7sz9qyXt3/cMIYl8FxhXmCJwgQ0RYmsVETNZeK0bsmYmtTmJhBL7BA3NHrlKinEv7fEL/fIuRNKfMyQiudu+xGisM+oYbs3Oxsrx/4nBxJXpEXaBA7ryuJc5cU26I1BGW1HEENtnstn4epY+MWgMwCddopXRcmt/2yHPju9B1b207py1Y+7oI01Ue4RexsaCKNcIAo4iUWMi7+PkB2sBsUzjGe7xJY6qZGGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhThnJPhp5eA2RqQctPoWtrLQbpiO89oHMl5CQOu9qs=;
 b=fmbniaEhJsHyN/FB425AAPqgNuqcIukrqDOjYETjVOtju8/epyN3hTunDQhMp8XML1CLGRhsXJ2daMgyb3VdFuro1dFu1/RxYbs948HL7k2fbbjieIBVccVqMLdf4PHBxxlva0NqN0pVA5VcaWURWlw5POGxmgoe260Ukd2MoM/MeCXTeRnSdRsrm71RhQ3st19DK5jy+tRCOIf34sMugkvhjxJq0FcCGJTiDVfVCJjPN5+EB0ALRID3l1fo+hDmtdN7mTDZeWiAqodNIed/3Z0fr3/Zp7nmxmL+opDWZfrIchsRtdrDAzo5TAVUkxSx/SGnSd44BjOEHn6Rm4cQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhThnJPhp5eA2RqQctPoWtrLQbpiO89oHMl5CQOu9qs=;
 b=L6TxBVV8QnHLwLflOYBDzesR5DwWHzxTB5BHlUldF6iT+5wpw54hIp5ttjK8zrHU0FtLueOFrIO67B8v+voMOdnELCyIkHZroJFQ5/h2GWV6pRNSEPDyPBB2HlAD+oHutSzWOJ1Qv2SQUajNXU15jUAjpkdYZp1zj7aGXA4nt7w=
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by CY4PR1201MB0007.namprd12.prod.outlook.com (2603:10b6:903:d4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 04:50:52 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::85) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 04:50:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 04:50:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Mar
 2022 22:50:48 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.17
Date: Wed, 2 Mar 2022 23:50:35 -0500
Message-ID: <20220303045035.5650-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f25e2d5-9516-469a-5cd9-08d9fcd1647c
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0007E2FAF794CA44BAC66AA4F7049@CY4PR1201MB0007.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUNfRstJpaYlxn91apL8ZaLbgrwAaqMmNhA85pcUkH8nFU9Lx4yj72QgRjNcVje7kMCak0qSXlwfL12lFkf7Cdqrp+7J5LcKu2+s+Bm0SjFgdj5w0G9SNU+9MB0KJnt5Er1s2w70HVGztZ8iT/jndY0XizztVfuJe++JsxUKapu5yUkqVjppJ7Zw/isCv+Hdp+qNoFlCzlwONPKzC46N4koFKpZamPavFthQjgjZfn0zg9/YTT2bBNbRukXLOLnaeB07+qNgU6FycYjqH0qFFIkY+76bKVDwhez2TEky5nrpdKuxMvuNW4umuGBFSAa+SouDkfUXNk+ptJW5EZ4OIt58k8+Z6eU14wBdR5Tjy+VoXgXhAt+jyi7LlQ1M0LQx+31qJhD7cl6qCrXsV569mK0j1NcBNQi028dxUUrnJBsqz6acr9eS3O22rFSsmyzD9YE0oQH6/iJ8LvWOYYoWW5x8HxaPzrpcp+SQKmMVPBQr0VVjc3gSzCC2aHiN6cuwHYUcUrk2n55fqrX4ILSCaweUx4UZRU6XC/5mirih6OTOro02Fx3dFQ2B47mbuAGeVVa6JoSb1qcwT9ENRLN8wXcemHm2Lw8NYgFri1MF1WRlDPRyr4gipda9t/7WJeE7+WfjOilfuDx42BR5ZqdSpXbNGssOBDKj4AQW9Frsd+bJMoDBaqHhEGwZBtFyCVP24PeLP9XVD7/7m+y1Fs2new==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(966005)(5660300002)(40460700003)(70206006)(70586007)(47076005)(4744005)(8676002)(336012)(426003)(16526019)(356005)(36756003)(2616005)(81166007)(83380400001)(1076003)(508600001)(8936002)(186003)(26005)(82310400004)(6666004)(2906002)(7696005)(86362001)(110136005)(36860700001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 04:50:51.1997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f25e2d5-9516-469a-5cd9-08d9fcd1647c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0007
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Just one small fix for 5.17.

The following changes since commit e7c470a4b543375d50d88a4c5abd4b9e0f5adcea:

  Merge tag 'exynos-drm-fixes-v5.17-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes (2022-02-28 14:05:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-03-02

for you to fetch changes up to f1ef17011c765495c876fa75435e59eecfdc1ee4:

  drm/amdgpu: fix suspend/resume hang regression (2022-03-02 18:36:43 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-03-02:

amdgpu:
- Suspend regression fix

----------------------------------------------------------------
Qiang Yu (1):
      drm/amdgpu: fix suspend/resume hang regression

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
