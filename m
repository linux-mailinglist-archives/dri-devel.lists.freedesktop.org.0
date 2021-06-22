Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0043B0F33
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 23:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFDF6E1BC;
	Tue, 22 Jun 2021 21:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6E6E1BC;
 Tue, 22 Jun 2021 21:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at0LIy1k0bOiXDhOoAbtx42bf6jv4fJ+QI1NPNOiH3t7v/2MYxoel1tAdXQzkzfVgg/ByiDxrNlDKkGGEumH6Tzpukc/rx1X7iF+105hjTfq8fTodF8ww6yVB7TD8Rh/E3ghh9pH67ssVfI35pq5IU/ar1HgfsZucblFboiirC8Q3YwE8mNXxji0R/mgDYdL61lnr3jrrhUGZLjoRXBFmsqZXPgcBw30DsEyqntpMWHv3EzLYBuYBMwggpmB5ZzaqEMT8bQCVt7muL9LT++qIzVwFy/W2iKTbn83+McONIA0f1PdykUp6EN0qhgMcpueMY5wsXurIm41SwQkP8UG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxSM2xi29xBcFWkoDVwSMVx/0j6YMxrBUB4JAk2IPUw=;
 b=MTudkFh8LQJzxwe4Nzhn4som89bfxpb3XrC3Jv+U+/H2tHZMKSyIMbRe3ZdvlQCtpX0GwCg+bKke4QUU7IxyZYz5+Jw6d7nSF+yhPpC/UYPLsScKxsKipS4fCiSCrW7W8v9wlbxEaehQ6IFGglz5ogzWsqJLs9MSlNhhAP2kaMW2aFrALcXQRW+7QHDze6iZm5FkJz++8wNPiXJ7b4pwrmepVvJC7gV+jbM5/5R3NEaijRjtnGHWeAwvsFsIasUzdkOWvnCARngAJUMzGGvx0jHVkBhHiSq5AYYodpeyE7Yp+CtUuU3kBmtwMm5Z1iVP04nYdA3SY+UwVM3/KJszLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxSM2xi29xBcFWkoDVwSMVx/0j6YMxrBUB4JAk2IPUw=;
 b=S3NyMZ63W6pmMMaNScf2cnHBIQdS/kxm8HFQoCODL+v/CJJWMWCHLiES7j9sELTkbOXgFK0yXmP3qSm1/eT6HqAsSWnvOH3AEJqXDr5KZ3PQeH65eHF5lY7HRKKkRRmcFHDaXKzX/0FAMAfjGwYqR7ERmvFFXMHx8O0wgFapmZk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 21:04:02 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 21:04:02 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.14
Date: Tue, 22 Jun 2021 17:03:45 -0400
Message-Id: <20210622210345.27297-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: BL1PR13CA0375.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::20) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 BL1PR13CA0375.namprd13.prod.outlook.com (2603:10b6:208:2c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Tue, 22 Jun 2021 21:04:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff5dbbab-62d0-4a2b-6eb8-08d935c142fb
X-MS-TrafficTypeDiagnostic: BL1PR12MB5141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB514193BBDFA0B4FB9BED2328F7099@BL1PR12MB5141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNUsNUfyLVemrb4ff+LdMphWSWHJMfOiLyj3R2zfzUWolNBKcw9o4Q2YlzlY5LQ0Te7XD7m8K66FwtDMjINtlIrux/6uZs3PRTiY4CphtWaswJbFn+kMr8ona4iZxmK3bA3zbfpLj9jNd6C+n81h/GCzGD2PnsxulzsaCucP0SIPjwPHm+DT5usJc7wDa5HZsFa2DxcliRAmEl5GFTKRCjMrs6ooEwRFOuwymgAYKIta3oGHIegf3kW9hCG71jXrfMUDJ/DiRp1PF+PG3FIyYle0ossGwvPPsMCUovvYaIkYwtoYc5R3cjYd2HHQqO3NkJd7NkLBg66oIUNue9bQNGJl4RMvIa+2dCx4XCheg/xi3052aaKAL6nNN74hpuJTUF04jzqf/Hu+WF6wOlPbEQMhK+tRpzUNbcGkkEiVEPcyUax4nLO/XAOA6dl2uBxgyal6yg6ERdr2YWySQEwJKTbdu/4++Xvo64gezwoVccV8WUc3hc5nSSbUwtiVt7kSoOcjE5RPb2XH6zsLxR7hoeZa8mre9ecVwUx6ArZ/uky6jmfYPCxIOsnG8QuMhDnlfcNzt/PiN1o1myC9Qgx8VfNnA04kie50or7kv0XVdkckUgksyfy64vNlgWv5FcROjH+Ncw8OradIz8K418NvWlKpjp50L21KHP06RwEP1NSQaJGHXka2xhHjxNb6sGBbszB1zzZj9IEA+5+nD1eijx60chOCqaS1+nO0yyNn/UjVNaZkZe6ZDIx3AuNit8MZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(83380400001)(52116002)(6506007)(66556008)(6512007)(6486002)(66476007)(38100700002)(316002)(66946007)(6666004)(5660300002)(66574015)(38350700002)(1076003)(966005)(478600001)(36756003)(2906002)(2616005)(956004)(26005)(4326008)(16526019)(8676002)(186003)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25WcWNVMFNhRThWa2ZZRnpsNVQ1T3ZNaHo2RTVYWlVtUnp2M0M1dkEwZHgw?=
 =?utf-8?B?WmxUQllCOWIrRnlDNFdOZk9rU3hucm5qaENWb1E1TzdtM3J0RElpNEZ5Rm5P?=
 =?utf-8?B?SUFlUndYRUV6R0RvOTZpb3p5TExHUjI0dkdoaTJZaTQ5S2ZyeDRHcVN3cTkx?=
 =?utf-8?B?UWJlRXpCckNjN090b2VEb1BWYnhQNXBNK3lpdEZjb3U0bXphU3J0NFpXMjJH?=
 =?utf-8?B?Mkdpem1hMjg3czZPbVNlZy9HQk5ENDRKNDNkZllJN2hqWTZGTjMybGZ5ZlhD?=
 =?utf-8?B?elhBbFpBMWxuWFA4Q0VyVXo1SVBhMk01c1RsOFM5U1hDUUpSUXZyNkgxOExT?=
 =?utf-8?B?cUJ6OGxMRTBZWkZNWTV4YjF4NVIvNXBnbm9JOFJGU0RSUE1jRVI3SG02SmRX?=
 =?utf-8?B?M0pOd3l0cnFRYW9tcnVJeGVHWUlXeU1Yc3VSZ3dFemZ0YVhhR0NERGJpREhu?=
 =?utf-8?B?MjNqdWFXbzJsZjMrUXdjOTZqQlk0MVdLUWJUMk9ja1JTcXoxRWZ4MlNUZ3ZE?=
 =?utf-8?B?MzdVUnJ1a240U1pYRURjMDFIMFo2MmZiaVczTVlIZnUxck9Ick1tTzdHZEh5?=
 =?utf-8?B?cXNmVGRCOGJPZ3RYTWVQYTM1Sk1aUmMvNnZRc0IwaUhWbVVYeHA3enJsSVhq?=
 =?utf-8?B?WXdaWUFZbFFzSkFEdjRCQlYxeEZWUFgvZVF1QzJNYTdXVDd3ellVUW5jWnlC?=
 =?utf-8?B?dVJCcHYwcGh1eGM0YTgyNGVwNUtPRWRyWXpvQjMyMmplSkNlOU5OK0ZjNG9a?=
 =?utf-8?B?RWhFYURiVFNlVDJvbHdFU1hIVFdJa2MrQnd4NURXaklGeUZ1cWVkN2pQNjJD?=
 =?utf-8?B?OVhhaFU2SlBsc0k5cWVRQ0pqQldkbm9TMFd6N29kaWY1TGlDN2RSZFRjVUYw?=
 =?utf-8?B?TWxtdml0RVprWmdOWHd5dWIrV1FtUXFJeDdHcThNYmk1NUJ2OUw3R0daUU9S?=
 =?utf-8?B?VWkydjNIcFNMclY4bUhzVnAwbGlCYjI1YUhOTjFadUJQcVljU1M4bjRBeCti?=
 =?utf-8?B?RUxObzBlSUhRRTA4WTFQNElzSldCWjkrMTBMUGFhczZyVEVwaGtOUDlGZFlK?=
 =?utf-8?B?WFdNbk44Ulp4c2ttd2NIbWhMb0lhWmx0R2tRWDhHYWRQL0tkUDd5ZUd1eXY4?=
 =?utf-8?B?RTNXSDFQVFBtM08zL3MzL2dQVnFGY2VYd3I0Wk84amRwaGd3ODRpTHNSWHdj?=
 =?utf-8?B?NGhhMHVWRi9IZjcwWEhRWmJHSkpIVWVZV3oyLzVIeHdVanoxRFZZVlVBZmI0?=
 =?utf-8?B?citwd2Z4aHplR09iZ2VGdWg4aFgvTGZVQWRaWlJkNFpMZ2xHajJtdkQ5WXVr?=
 =?utf-8?B?cjNUUTJjM3hWYmgwV3pCaHBmUEJnQjNPUUd6Rkp1MzcvTmNFc25QT2x1TjJh?=
 =?utf-8?B?U2hUamJLWUU5M0xyMXBSalVsK2tnSGJadmVTNHNub0xFellPb0NYZzVMQ0R0?=
 =?utf-8?B?a1p4QVlmSFREUkkzR3hac1FlZDRVYnZ2d0JTcXVIUlpkdzFPZHNTOXZDbDFo?=
 =?utf-8?B?c2NkVnJ4VlVCNXJkMW1pSU9LNXFpTTNoMTMwRTJoUHhFZ2RUOU9UeFpvV2l6?=
 =?utf-8?B?MCtXbmZLaXVqOEJiMWdIOEEzNklNVFVlNGI4MEZDT1ZkTXFuN203NFRxR0dm?=
 =?utf-8?B?MmJHOFd2bVdLTFEzZnJHc1JLbXdaTm5SbG93WWhmMDBHUUgvbmVvdGs3UUQv?=
 =?utf-8?B?eFR6d2ovczN0S2J1UkMxVWZjU0E4RFJxeVpJcUxJS0pMZExKVWJpcFdXNjVT?=
 =?utf-8?Q?2rvz5CVe6M1T/HU1H4Y25neNeF8FBTEJIaoDE2Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5dbbab-62d0-4a2b-6eb8-08d935c142fb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 21:04:02.0948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5n/uTUibezg3WYZ53nbf+x4KlEWJH5rfBtTfKQZcCBRvuyHpEND/e8EUhpQ/Fv1Bb71AIbNUKxkOoQ1N2g1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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

Fixes for 5.14.

The following changes since commit d472b36efbf8a27dc8a80519db8b5a8caffe42b6:

  Merge tag 'amd-drm-next-5.14-2021-06-16' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-18 12:55:09 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-06-22-1

for you to fetch changes up to 8fe44c080a53ac0ccbe88053a2e40f9acca33091:

  drm/amdgpu/display: fold DRM_AMD_DC_DCN3_1 into DRM_AMD_DC_DCN (2021-06-22 16:51:45 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-06-22-1:

amdgpu:
- Userptr BO fixes
- RAS fixes
- Beige Goby fixes
- Add some missing freesync documentation
- Aldebaran fixes
- SR-IOV fixes
- Potential memory corruption fix in framebuffer handling
- Revert GFX9, 10 doorbell fixes, we just
  end up trading one bug for another
- Multi-plane cursor fixes with rotation
- LTTPR fixes
- Backlight fixes
- eDP fix
- Fold DRM_AMD_DC_DCN3_1 into DRM_AMD_DC_DCN
- Misc code cleanups

amdkfd:
- Topology fix
- Locking fix

radeon:
- Misc code cleanup

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/vcn3: drop extraneous Beige Goby hunk
      drm/amdgpu/display: fold DRM_AMD_DC_DCN3_1 into DRM_AMD_DC_DCN

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.71

Aric Cyr (2):
      drm/amd/display: Multiplane cursor position incorrect when plane rotated
      drm/amd/display: 3.2.141

Ashish Pawar (1):
      drm/amdgpu: PWRBRK sequence changes for Aldebaran

Aurabindo Pillai (2):
      drm/amd/display: Increase stutter watermark for dcn302 and dcn303
      drm/amd/display: get socBB from VBIOS for dcn302 and dcn303

Bernard Zhao (1):
      drm/radeon: delete useless function return values & remove meaningless if(r) check code

Bokun Zhang (1):
      drm/amd/amdgpu: Use IP discovery data to determine VCN enablement instead of MMSCH

Charlene Liu (1):
      drm/amd/display: get refclk from MICROSECOND_TIME_BASE_DIV HW register

Darren Powell (1):
      amdgpu/pm: replaced snprintf usage in amdgpu_pm.c with sysfs_emit

Eric Huang (1):
      drm/amdkfd: Set iolink non-coherent in topology

Gustavo A. R. Silva (1):
      drm/amd/display: Fix fall-through warning for Clang

Josip Pavic (1):
      drm/amd/display: do not compare integers of different widths

Logush Oliver (1):
      drm/amd/display: Fix edp_bootup_bl_level initialization issue

Martin Tsai (1):
      drm/amd/display: Clear lane settings after LTTPRs have been trained

Michel Dänzer (1):
      drm/amdgpu: Call drm_framebuffer_init last for framebuffer init

Nikola Cornij (1):
      drm/amd/display: Clamp VStartup value at DML calculations time

Pu Lehui (2):
      drm/amd/display: Fix gcc unused variable warning
      drm/amd/display: remove unused variable 'dc'

Rodrigo Siqueira (1):
      drm/amd/display: Add Freesync video documentation

Roman Li (1):
      drm/amd/display: Delay PSR entry

Shaokun Zhang (1):
      drm/amd/display: Remove the repeated dpp1_full_bypass declaration

Stanley.Yang (3):
      drm/amdgpu: add vega20 to ras quirk list
      drm/amdgpu: fix bad address translation for sienna_cichlid
      drm/amdgpu: message smu to update hbm bad page number

Stylon Wang (1):
      drm/amd/display: Revert "Guard ASSR with internal display flag"

Wan Jiabing (1):
      drm/display: Fix duplicated argument

Wesley Chalmers (1):
      drm/amd/display: Fix incorrect variable name

Yifan Zha (1):
      drm/amd/pm: Disable SMU messages in navi10 sriov

Yifan Zhang (3):
      drm/amdgpu: remove unused parameter in amdgpu_gart_bind
      Revert "drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell."
      Revert "drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue."

xinhui pan (2):
      drm/amdgpu: Set TTM_PAGE_FLAG_SG earlier for userprt BOs
      drm/amdkfd: Walk through list with dqm lock hold

 Documentation/gpu/amdgpu-dc.rst                    |   6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   8 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  19 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  13 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  23 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  13 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   5 -
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  58 +++---------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  22 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  23 +++++
 drivers/gpu/drm/amd/display/Kconfig                |   7 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  62 +++++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   4 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   2 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |   3 +
 drivers/gpu/drm/amd/display/dc/Makefile            |   2 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   9 +-
 .../amd/display/dc/bios/command_table_helper2.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |   2 -
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   7 --
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  70 ++++++--------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   4 -
 drivers/gpu/drm/amd/display/dc/dc.h                |  16 ++--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   6 --
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |  13 ++-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |   3 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |   2 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   9 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  15 ++-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |   9 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |   8 --
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |   2 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |  10 --
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  19 +---
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  16 +---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   2 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |  24 ++++-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  24 ++++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   2 -
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   2 -
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   6 --
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   6 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   5 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |   9 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   2 -
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   4 -
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |  12 ---
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   6 --
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |   2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |   2 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   6 --
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   6 --
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 -
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |  14 +--
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |   2 -
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   2 -
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   2 -
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |   2 -
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.h   |   3 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   8 --
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 104 ++++++++++++++++++---
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |   6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   4 -
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   2 -
 drivers/gpu/drm/amd/display/include/dal_types.h    |   2 -
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |   2 -
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  18 +---
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |  13 +--
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |  10 --
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  27 +++---
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   6 ++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  15 +++
 drivers/gpu/drm/radeon/cik.c                       |   4 +-
 drivers/gpu/drm/radeon/evergreen.c                 |   4 +-
 drivers/gpu/drm/radeon/ni.c                        |   4 +-
 drivers/gpu/drm/radeon/r100.c                      |   4 +-
 drivers/gpu/drm/radeon/r300.c                      |   4 +-
 drivers/gpu/drm/radeon/r420.c                      |   5 +-
 drivers/gpu/drm/radeon/r520.c                      |   4 +-
 drivers/gpu/drm/radeon/r600.c                      |   4 +-
 drivers/gpu/drm/radeon/radeon.h                    |   2 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |   5 +-
 drivers/gpu/drm/radeon/rs400.c                     |   4 +-
 drivers/gpu/drm/radeon/rs600.c                     |   4 +-
 drivers/gpu/drm/radeon/rs690.c                     |   4 +-
 drivers/gpu/drm/radeon/rv515.c                     |   4 +-
 drivers/gpu/drm/radeon/rv770.c                     |   4 +-
 drivers/gpu/drm/radeon/si.c                        |   4 +-
 110 files changed, 489 insertions(+), 540 deletions(-)
