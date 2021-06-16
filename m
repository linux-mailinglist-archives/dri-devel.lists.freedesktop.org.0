Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B73AA595
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23FB6E81D;
	Wed, 16 Jun 2021 20:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE576E81D;
 Wed, 16 Jun 2021 20:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV6IKx1y0wHynI5CuUpQVIMDaI/ri6Tv5VAe6iuoe1RGeJ7Y0BK9sX7H5IuKWVhCuJ0/kUMJMWOe0IVBLzCRrn9czL29mV0GMwl5vaA+MBUw5uvAP57FAKZD9TM0T9ru1517oHXwyD2GcchLyfCPfzXefiQx+lgeo70T0zFbTpgfo8QNQif+kthu6m09QLo4oGKD4h6Je0+9x9Ogod/EsXayaw0/ust+pIj/NkmdsrEroWJz3FeUWgX7F7UL+BBzQSvs0vcyAF+NJOSUgNZ+5cZA3jKhi6uqcSVRIiEZfAwEj3ubxWFcB6nxG0/k4QxGyymx08bbOe8t1pMokqeZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4blrLeWrdBMWjat02a00om1+8r8I7KbH5D2UBJBXS/Q=;
 b=kPhvBiF2xwLLqqe3s0of1yGnPnZY+hxY0TDHmI1hdJPyx3yVMC47018Us/uJN+v0LLlOJsJzRebUvZyZLx3uGskrS3xliS0UeBLNok/RRoq9ar5nI5RrBf8BJIbLJHwOUfjO6xY8dMcTBl3BNfRxh6aqI+g2kTVn3HwQq3zsaVIiMoGLmWMZCErC/tniIV8pHq7VgYazxHpS0U864gPP+DpbkzioE3x0DIUruZJXvlvErtMG1Cwaaorkj5LfAXVmnPbSbTqYYjyvnHngmPSom0/p2yCE5UDk/ZguGiZHod41eZIphieeg6K6rPXPbkGC30DlEOUu6sRG+LV51w/PjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4blrLeWrdBMWjat02a00om1+8r8I7KbH5D2UBJBXS/Q=;
 b=HiNQqmyJYgsn7Vo29GzZTxS1JnIg3GBS1aJ8waje6+hSlHJ5Laio3dfgAR6GX8AI0upz+zA8QZavJVSEns41jBHfuossjGiPniFfmw4oXsZJUqaBbEDBFniAOBbabCe/ehWhp8nPtp21HGTYeAm1cKuqkgDrt/3qgEtECWQlcaE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5158.namprd12.prod.outlook.com (2603:10b6:208:31c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 16 Jun
 2021 20:49:28 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047%3]) with mapi id 15.20.4242.016; Wed, 16 Jun 2021
 20:49:28 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.13
Date: Wed, 16 Jun 2021 16:49:13 -0400
Message-Id: <20210616204913.4368-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: MN2PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:208:a8::27) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tr4.amd.com (165.204.84.11) by
 MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 20:49:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c94231c-6001-4e0b-b294-08d931083be0
X-MS-TrafficTypeDiagnostic: BL1PR12MB5158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB515875167714E8B2C640B042F70F9@BL1PR12MB5158.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRsQaUqpkfsVzrAJTZujgKGZM7aJpOqBqlQTv7L/KJO80S0gcNhK4N8DocLMLnp/FZcK3E+wfqqe3RwY+tSLYiDn/SjTki0nC00a5sBceb0UevZGocyW75zW9bg7jdpPC3oa+fCN+YREQIjQCkWNE1f2Tr2+1chLDOamSul4mHHW7CurB52cLaroQrtp4K0Mu4XRH/M/rgcD0L45MCGsr12agG0EY2nEtVVqRJLP4eXjh699UH4+BNR+izm08Egc05IEgxuaY5F+ME8TpQus1s12M88yEVhr05lucSqbs2m/lKqDU21+Jo5a5mXdzDclT2FrnKfdGKCCD7i7cFQD1KCkupzeWaqhDvxpHJRl0B9oVe/QgJjeRPijqMR/dz+76yCSazoSBkZNTFa0nGOAQXiMDZzYrkATOI4uezmHlV5gLPxV+EQMDkdWueFFM/dhcBgxpTfTxgBZkIUIipUaCmKY8qqq5tIdEmUhbGhct8ysmyscpDOj7QcSC8g7IHTaFWE5gPzLHoej5/R73S++gV8Ux+2Z/oNoiJirmcugNGVAxwoO/0pEoRJ59LwyFMpZgGi/5hj0Nnmh0hEdCD/uL4Ju+AU77yXRH35z4MbwJfv3SOFidFL2tztYAlwBiidvE4InciU9juV5c34s+E9HHG4zebaXHca9UFP4oXyChEfpe87jItFLbtnpYahOyJHf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(16526019)(186003)(966005)(2906002)(316002)(26005)(83380400001)(36756003)(6486002)(7696005)(52116002)(86362001)(38350700002)(4326008)(956004)(66476007)(66556008)(8936002)(66946007)(5660300002)(6666004)(1076003)(478600001)(8676002)(2616005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KEjH/WDfAiD+aNGwf+GDNm6a3sM6Sp95q0CcrzUEZuhYN/xe1aiRM5dkkODr?=
 =?us-ascii?Q?ZpsUQZ13SZi4iDSvkAZPDexxeW5pTw0H4CGPBPMEYYH4DgKcTCg8Htv5yJd3?=
 =?us-ascii?Q?FjVqhgz2XVYY+TpnFpOwQ/hgjnA0TurIlTF6wjLKtYLKe0DS04FrbpFFRJPH?=
 =?us-ascii?Q?z4okcy8mwPV0C0WUNCItzT32C84e7ui0NSc2XhiSnU/dSrIOBTy47n+40+H9?=
 =?us-ascii?Q?snKKwjJIK+p7tNUqOiEd+2XNP7CxOeqAIh3uS3jj+vMFujUX7loTd022SSeg?=
 =?us-ascii?Q?R9+SWvHO5ELTdtZP/pXwdcQOMHqGxB+RBE8ZsMI155Txpxq7bMMHxpbb6B9p?=
 =?us-ascii?Q?m/H5w9jD7TQ0gvNy9VB2f/FfIGVRyRlQbcnDCwrLmLBtctXm7qg3bBrjFbSy?=
 =?us-ascii?Q?lgmzecGJjFJqZpjvPFjl0J0frfpzKDE+DPhBQyWjnl9g7tiQR2n+3LDdMI/y?=
 =?us-ascii?Q?DvTMhabh5ArRUk9NjEBr3bU6CpfcMRnIp9RcTPG2aAzDmOSq4YvZUASKiuuR?=
 =?us-ascii?Q?oQ3c/BDqjV4N221kkw04BV9CQsloyePhU6CwDNspUzxTLIews0vynEiT3kIy?=
 =?us-ascii?Q?W2llaa0el7sktxYMIvhd1zZ37xqwDH3tW+iXnAD4ysuDDMyiySPFTDKoWSRm?=
 =?us-ascii?Q?nD0entM9UJsVmdVYm5HQRZvj9984GvqrjljdpeYNe65B3USKQF86ohQVwA3j?=
 =?us-ascii?Q?1ZAYDug+IGhksr4CWAeDy/52tcJwVYJiqAgSIghdzqPxbcD6bSdUEqkWApOT?=
 =?us-ascii?Q?hrXroy3cQpkttKmdK/ACGQ8aLf+s4tJZoA9Ht+P2U5sdeDO52fpPDWiDoQ6v?=
 =?us-ascii?Q?z79cSLTrNHbHqDL63VgpwlOvjKclB+s5eSueU3HmmJ6rAuoWFk3rRxtn+G4K?=
 =?us-ascii?Q?+BACnYyp1/4IOVZqKzRxmk3kDGcYJvpYO05AP4tC6/YpE5Cq6tETFvrDSf+T?=
 =?us-ascii?Q?hfoi2AzS0sXxJSI/T485YTs5vBBiJLZYM6ZM2MxySFUUt5qEptmFMWNFTrrU?=
 =?us-ascii?Q?GP0lVj6Zk30+SyKn14srxgFm+AfwHS3g4M1m6ZmsLofLDsSulVzOX8mbZhGe?=
 =?us-ascii?Q?6+umcpfrzmlbltJuDmREqC5R9Q2N4nG7NjCOHfyW5U7YK624e60bsH/5fEpH?=
 =?us-ascii?Q?LoQWrYifW3mVz06/0idHCvXM5tkgc7yE+A+MSbVQALiDdbXs5ckCg4cUM5vB?=
 =?us-ascii?Q?fc79Deb2iCtM559lD7b/a3LQvnVDibiS9mrJlXFpDom0UyKfqLYLKFXlWGrO?=
 =?us-ascii?Q?SFxhxXZS1lkqElUT+9/XjfzvtnhV3Hhzgp52w2/qsG/7OTG+AO5sXhrO9wsF?=
 =?us-ascii?Q?HP7OvkK+fUg/skDm71AV4fUJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c94231c-6001-4e0b-b294-08d931083be0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 20:49:28.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhDLQZpHgpuUO291VLeJL1mto9WcQRjHShClKEU88zEhfl+tvYBz4BjTrADeXMzEv8O/V+5cjzowor9Zm+5/HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5158
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

Just a couple of small fixes for 5.13.

The following changes since commit 7de5c0d70c779454785dd2431707df5b841eaeaf:

  Merge tag 'amd-drm-fixes-5.13-2021-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-06-11 11:17:10 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.13-2021-06-16

for you to fetch changes up to 1c0b0efd148d5b24c4932ddb3fa03c8edd6097b3:

  drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell. (2021-06-16 16:04:20 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.13-2021-06-16:

amdgpu:
- GFX9 and 10 powergating fixes

----------------------------------------------------------------
Yifan Zhang (2):
      drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.
      drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell.

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)
