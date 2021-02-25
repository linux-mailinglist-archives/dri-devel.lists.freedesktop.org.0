Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D473249CF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 05:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FF76EC35;
	Thu, 25 Feb 2021 04:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3317E6E8D4;
 Thu, 25 Feb 2021 04:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CS8WufoD8sxkSWcR1XZRmapoQrW0YAhOtjcfsk38ACOxZaVAEfRueFsdtIXfzw+hGnkJNX4WPBI8EaatojWJ9Tk+znY0bt8hnbYzF4VZMwGk+aHbM2VfDHEj4VqiYX5cBLLIYZ30AzkJ88czDEsK9POhIAI81fDnX0FGV7lSjFYbAH2rvXc4SU5ZoNwdEmTilpjmII/diTKS7fgY9ncKirm1YuTs4EbSghM+FJ3/Exp3e1WFPZ90rBty65HpVMv//OR8z+06Khow4IB1fftWk8eGTRID3BiuHPqneIT1Kj5aM39kDFh5f8ChXhZQogt6NYJ9kphhzDTKyskNr17fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtVM3A+C5SaKAtH8Yt/HTcGTCUZywIgu/bBvrzo/Tes=;
 b=eKAXXJ3b+GaRR44KFD+mJivh1BEhxM39KeMGYRybcZWZMRLUGJwBOA+ahyxFnvrXv6x2KmicakddxKlrT7WUezxm8QE4xbXPL6YZp2agEGjsKqFw3K3KknKr1NUFOMO4BCstN9UzsVjLf124dEiT+J/jN/vgIm69cpKFoS44Yf497AJvuSOjccRyuTaj18AqEXPQ4/VLgCifLNR/Vo1im2k2h/q8ZxS7wNP/axCDczV4YhaHwrxChOCIzY4l7T7Tj0zfgAWMcCLYoagKhGgIY9BaZ/5cw4qLultz6AAQvebmik+3uXOcmEz5n472oWhfzFqH16Q+AAOmnheJ/LdiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtVM3A+C5SaKAtH8Yt/HTcGTCUZywIgu/bBvrzo/Tes=;
 b=1HkM3gEPrBcrrWMq7j7/msSf8PASNzXM++qOE86aoukQU9tEO/FHiPuiq8Cklf2zDulsKqQFPhBK3KmKqd3luElxgeUwpb6RZhugPI1/GzARXP49SA3ljf2B2EuP7DPzdaRsFfBYwDZHJkxDyS/Qfwdd2xwDLdImFpRIHHNf8Lg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3805.namprd12.prod.outlook.com (2603:10b6:208:15a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Thu, 25 Feb
 2021 04:39:14 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%7]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 04:39:14 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.12
Date: Wed, 24 Feb 2021 23:38:53 -0500
Message-Id: <20210225043853.3880-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [192.161.79.246]
X-ClientProxiedBy: BL1PR13CA0469.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::24) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1PR13CA0469.namprd13.prod.outlook.com (2603:10b6:208:2c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.12 via Frontend
 Transport; Thu, 25 Feb 2021 04:39:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1df1fa98-cda9-4f1f-f656-08d8d9474dd3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB380538BC06557EB79899FEFCF79E9@MN2PR12MB3805.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79qz87us6v875grIWWTZvUFywjZRY1fSTOAa0ftAAAuBq2FXMXmVoq9pwrFhbZn84K5axZxO3IWEUsZu8MGyYT1taIEXnt8jK4RriI0zUSl7PsX/OnTiJRjrKKlUg4G2XCBh6qzCp1ghtsr9p1m30K/JO9Tw3erjBkCdbFIC7n1ec6olacrIiFVykzRhnl2nS7BP8qS/3oB3tTcEOgiPvJilIfa57oVmqebEcUGdr0mnjFYIFUTVSUfcoMT1CWfACq1jhbopuM7+gGzSrnyDZRxdsEdcDTXdFV9cMEQZ7OJoDjxd1dQrynzFkNwjuzhKDgWeRUfxieu/HthTA1zY0IoYW2QwjqptTR3AbTvvqqsidMg0qPHLhJU3kqIMzzCFM9BcohNQRFcseSdPJOUyNhqBbxEtws/loMl9cY77pmxOppsI47xn8gbSlJy5EV+aPk+YNbLi/X5zdRPzv8o+K/I1xa1miuNWviH7iXltJMefRw51bDwRaP+ydiY0noUxyD0f81Ygw7L4HONMUr5ThLMYmyRO1nSb8Tcgq66aRMtmSOuybRoPL8pJBthC3Tms1GTyKguChMhhiiubtNws7LlYeL1E0f3StbWwJomaJBqbYyro7zwKzP024AnTdQR+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(36756003)(186003)(16526019)(66556008)(5660300002)(6506007)(66946007)(66476007)(6666004)(86362001)(2906002)(52116002)(956004)(966005)(69590400012)(316002)(1076003)(2616005)(4326008)(478600001)(6486002)(8936002)(26005)(8676002)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EIpYxWSYpZKuxI06AsR1GeeIyRYW2S9sgnW366pNvjOYYMPkMYeFzn7K0odr?=
 =?us-ascii?Q?HB2hebg7mdPVKTgMB5Xj//zUl2vbeOifcQwlGDX3amEa9QQuzG/g/VfpmN7F?=
 =?us-ascii?Q?Qf2bzpzmrj7atNeLQnUh2S9usp0lqU4x55r6nUp5Z/oPFVtT9tV4CyUro8Vl?=
 =?us-ascii?Q?LS8cDNBEx6ksabjDswBgDXX/7ZiLmALdlI1Y5JyCkCw7v+d1xxwsriMZTlMY?=
 =?us-ascii?Q?jF73P9WoWB//U/cHq7yZF7Mow+SXQoIU1b+nKX05ZZ+bpcOGCeGmsBMs/b8J?=
 =?us-ascii?Q?rGeJsIhGhQVwlwS6JspgMqLelnbWh9YjnFeFesN0A9QuPwo1TX6eBKWUoINs?=
 =?us-ascii?Q?CW2srpY/Zz8FEVXHxdSWLBFx6HmFBHbjQDQAw8BvEDh0dG2Szx1hoPp/4hSt?=
 =?us-ascii?Q?drdBeZTJSIpcQWYxRJ4cZvycz+LuQGx89UN3vs6IVl14AO0StBGcqvvs3S8q?=
 =?us-ascii?Q?tn7RdnLYNkzTVHC5Enhh0AsgMjQLWpy3+zh5Ur7llmADjnSZ8Y3LdH80EW3t?=
 =?us-ascii?Q?N6xc3FG/BES0rsEA6OoUuBziHPDRrsJuxqNY4yDIkZROydZQBYbBlF/Wei/M?=
 =?us-ascii?Q?6wY6n26I/zOqg5NXZTWwbdirnWs/SSj28YLL+nSVvTa8jIiCKn37V7PrESaD?=
 =?us-ascii?Q?bi+l/823KccBIs+mICpQxUbysR/ixOYjkkY8Ad41iiijmxyQx3mBBhxAlOC/?=
 =?us-ascii?Q?zMnA6KOMrhkqnR5cYYhov18VqB5+x9h0TMho4jKmo/xqVIujjxsVEa7GbtP4?=
 =?us-ascii?Q?7qADGAS3BjVMHsw7Siac6fmc1jlg4L/FLe6IjURkuEyMbFZTkw4fEOfyOQrQ?=
 =?us-ascii?Q?CMV+2DiuKiCJF23Q0BILWIDX1E+SGIwyXna39K/vW1seKGSorNbeo444ZTVB?=
 =?us-ascii?Q?0JIeN11NRzG/5HXbtElrJiaM864zIu4q1WdK3IvNHL1oHgxZGc25xan8MRH7?=
 =?us-ascii?Q?ED8GZNL8EBFW6oohbkIorG9YNJo/v7vmZfgoK1ensQcpBaWAALj2EvzVTXNg?=
 =?us-ascii?Q?VqlQIATZqf/cNfMUNLt6rudUWSabuX4to8VGoQR6YRSjyWHiXgFCI94c0Cj4?=
 =?us-ascii?Q?lJHijJ1O0VFr3ha+r7Ftb99OqxTVZ2bNvYWBMWkZ5NZHTEbliNhpW4Um8IDd?=
 =?us-ascii?Q?of0Ok+73dTLTK53kwr50C9V26SG5Q1IWsuVmNMtJkTpDfh8GshkI0Kr64zrU?=
 =?us-ascii?Q?i0rfv2/mny9bYHaqq1bQu0OU+dr/LjFF4JkHCO7T+kXH25xezRnNJs1yZZ4j?=
 =?us-ascii?Q?vJagYmgx6Hw/ePyAxeZwEGngRM0x3pJXVyJv+iV5RjWR6kdC4KH4cZ5ZoFwB?=
 =?us-ascii?Q?rOEH/zg8Vl3/1TSKWHt2YIaY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df1fa98-cda9-4f1f-f656-08d8d9474dd3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 04:39:14.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wP8hgPUoL8oMoPxwVK3eCJvIqFjUTHWNlNHYQi84dpQVqzpv9uuaxdh7LRpvPzmkhNu2yS5EgOk1ioUrlc2h1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3805
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

The following changes since commit f730f39eb981af249d57336b47cfe3925632a7fd:

  Merge tag 'drm-intel-next-fixes-2021-02-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-02-19 13:55:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.12-2021-02-24

for you to fetch changes up to ea3b4242bc9ca197762119382b37e125815bd67f:

  drm/amd/display: Fix system hang after multiple hotplugs (v3) (2021-02-24 09:48:46 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.12-2021-02-24:

amdgpu:
- Clang warning fix
- S0ix platform shutdown/poweroff fix
- Misc display fixes

----------------------------------------------------------------
Anson Jacob (1):
      Revert "drm/amd/display: reuse current context instead of recreating one"

Eric Bernstein (1):
      drm/amd/display: Remove Assert from dcn10_get_dig_frontend

Nathan Chancellor (1):
      drm/amd/pm/swsmu: Avoid using structure_size uninitialized in smu_cmn_init_soft_gpu_metrics

Prike Liang (1):
      drm/amdgpu: fix shutdown and poweroff process failed with s0ix

Qingqing Zhuo (1):
      drm/amd/display: Fix system hang after multiple hotplugs (v3)

Rodrigo Siqueira (1):
      drm/amd/display: Add vupdate_no_lock interrupts for DCN2.1

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 101 ++++++++++++++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  27 ++++++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  27 ++----
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   3 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |   1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   2 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |  22 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   2 +-
 11 files changed, 158 insertions(+), 48 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
