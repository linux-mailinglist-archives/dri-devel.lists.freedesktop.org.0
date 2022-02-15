Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D14B748C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7D310E51E;
	Tue, 15 Feb 2022 19:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFE310E51C;
 Tue, 15 Feb 2022 19:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HobbYHVHgTuRb4qqagtSypKL9clPeU4O1jydrC5QhT8gKf57tHIxL/sXVT8nh0G3d9TwHdUDWHaLCGSzKUeSJRUeMx3oiHgSUiefXEO9dWL9bdpPmMTWeP/k/0s1eKUnc+aDOQ/9ZjtwyWKCdMhhgHCYCKdVMh85z1vxtGiYI5bCuqPw79LO98A5QN5SEafFyQO+lrOc44SOxguWQ8pJcGt8rk8MrCoFpX6KZBFvCGhjUsYoWudoh2q3SBTwdQphXxBrm0w0VgBQ95YiP2xaV6x3s+Ivip3N/z9VFLy5n94J4vlAYGn1fb/H3ucZNh3xi6P6vUkdi3XxpCKsoV4mJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1ZdfhOnyVsp2lu6RcnmrDRdNpK1A2tfPSmZ3+pInBQ=;
 b=gaJUrIY5VAJSoViuuoNKDk8zvKYe6cSPIUli87Wb2+kKV0G/J+5hgZOtFbcc3NwQgDcfxnU9p5u8NWr9/4H7PT1VOQLX3olPyKHYoXjjsIfgmS5P5Mn3vQkts7U+xPwhBaF7uaE6m1wocVNE3tysLKQGVzTF6k5DZzzvCR/uGyLqvnm6dz705Q10dbMsxBmKDuJqZDZ1m7eZfC9djxMNazEeV45bboYT+HJgnWo5U4pzQ2VPvPCcJ8L7yD/A5DtzcafXnqn1PAvUgFu3yn/xS59r+sLanZW4KpLj7QBa1Tsb2Ll+QNQmYI4w+3Qc55L1ydpgSKc3US2ej+K+2JE51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1ZdfhOnyVsp2lu6RcnmrDRdNpK1A2tfPSmZ3+pInBQ=;
 b=E/fH2jPWbsnGOFPj8SteEaKWCZ1HgCMJmgfzgS6U6+iZTvWBtbNd7B9mcXBvMIxPZhsWtvfXFVLD68MRI5eCjtAjIudTqwzAmUBRinsfe6pNisF/h1zzhhe8VWpFoLAjAoasnR3bBRwKViKDnnqOA/gm8LGe86rI1AoISkbxR9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM5PR12MB4664.namprd12.prod.outlook.com (2603:10b6:4:a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 19:07:04 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 19:07:03 +0000
Message-ID: <3078823e-4ab4-27b6-b1c7-c6552fbfdb2e@amd.com>
Date: Tue, 15 Feb 2022 13:07:00 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 00/10] Overhaul `is_thunderbolt`
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
 <20220215072911.GA13892@wunner.de>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220215072911.GA13892@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:208:23b::9) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb38c478-10c6-40d8-2ce9-08d9f0b65a0d
X-MS-TrafficTypeDiagnostic: DM5PR12MB4664:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB466404B3B7879347B5FCE254E2349@DM5PR12MB4664.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NNEJjvOPX2gkTb+4KyUA9iLsZ8FOVPcKbcNnkvVj+pJDkIZCszi3Z3wpeIm4Q47OetiRBvIrJZz1W2XcUUM4J0YtjMon/Hw5s3RnbrNWQRhcj3yp6rVWdFYPccmnwmxr8cKZO5Rr0NaIk6x0erT45PHoNP/4XGFk4VZd61PXgR8b3k9AZx3R3x3+4gTuTHQOFONniuc7skq7KtGY1CqZfCQ99rejAwPd5zao4lnpv+SY/V0S0Luip5SPQpEkGmyLmkI0Y7PHwIwNXCYBwgOPxrUavqzIFFco4a0CtOrNdElG/fOgQsBaP64Z9FBDZnmlXZFYZLT23i7shx74MfIKRl5KXdVKUQtBNugAhY5FfOcylu/4nCzWzoUyIHnNbDAc5/VeAw7j48x1c6El3bQHv+AjGxedC7Mt5gpmzdP3OctF7bjZWCmVj93z8shIcFsyUGmFwJuEKKyldfarXdQHx8lH3Afe6EohllmWxbPl14jIbHhWLNGYK9dp6OtXrrmRG3BUaJt+u7vNStyRqmYfm7ZYvcbYtH/eNrhNEHLrvXH0OZHJKrIgTophtjascU4zZ5TqWhNQkqGIv5He1437ioeQRocTm8sFP5hgqM4qQmsIISqNkJxw0IP1XwQM/fEwIXZwWi5StVXT7lbtrdqMek+kA8xDZ4ZAuo/Ds0moLMRSI0BIaV37szMo2YR3uQMXCxYJZktecN5YG3wYVYqfxtC17e8yL3F1PCMk/5AP/jDANQGVS6c+jrpWkBtYiFGPUm08c8KFYRc1nrsyg86+3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(7416002)(83380400001)(508600001)(5660300002)(8936002)(2906002)(4326008)(36756003)(53546011)(6506007)(316002)(31696002)(86362001)(186003)(8676002)(6512007)(6916009)(54906003)(6486002)(38100700002)(66946007)(66556008)(66476007)(26005)(2616005)(81973001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T25IbFp0MGlydGlZNVFNMm9SVS84Z3hwdFZEdWQrb0xaY3IzeG9ib2Q1bmND?=
 =?utf-8?B?bTNhL2hzemZZMGtuZm94ZHp5cGo5YmRKeDRWcE1DTWNEdG5aTVFVQU4vL0ho?=
 =?utf-8?B?elNEdnN0WUhuZE93WmRHRStWSysxbHdlbmV3UmduNXIwQUtZSDB4amJzdzZG?=
 =?utf-8?B?QTZ4cGJ5bk1PSGxBdzFqSEVSRzVXZ1hOY3o1cURyUGxGcTF3aDZBbkxjYVl1?=
 =?utf-8?B?WXBndm5EbHh2ZzB6SlFCV1oxTlUvY0t4Q21QUFJiQlBFYTUxanhyS2plMHpJ?=
 =?utf-8?B?N1lHT3VXNi9WR09MRUxxdHhPaVVaYkV0QzRVVWt4SEk2SDcyOW5FTzZ1MllC?=
 =?utf-8?B?WStIRlJFNk5JU0NFbzVBSnlPYW05MUdqakdZWHozQUZYNDB3TDJqVHJNb010?=
 =?utf-8?B?bHlUYXpUdkluZktNYzY1N2FuVjNiUmJtcEFsQUlpeGkxbGZJTHk5VHFKWkw5?=
 =?utf-8?B?bEkxdnRPb1R6SFhjRmIvNjZtbU9Bdy8xaG80ekRDcUJnQ3N1dmRNRER1d2Fw?=
 =?utf-8?B?enNEZ2VuUzF0QjFXQWZYdUFKRnI3M0RDanRFbVlSWm1nY2x0NVhFcHVjQ2cx?=
 =?utf-8?B?ZEw3dEd4dmhCaTFtRitoS1p0U0V2K0pxdTN4MlJtcEVuSEtyamlsSklBOUZC?=
 =?utf-8?B?OHhZTWszUTJlVnNFRlk3bUwrTWVxSCtvTHFEeXpSczZVRGFrSjVOL2laUEM0?=
 =?utf-8?B?YXhJVTRrWFAzYlZKTXdLSFN4RU1oWGQ1UkZuMTh4Z21qdE5zYVZHNmN1T3pW?=
 =?utf-8?B?OUhIb0xaclNXU3VlWWhhbnN4Y0JrRU9rdEtVZFN1QnNaMURYdUloRFlUREZP?=
 =?utf-8?B?ZTZnUnlNU2lUUnpwWG9KSlByVll3eld6bEVHK0E2VTN2Z3dNNFRyZ0U1SzRG?=
 =?utf-8?B?cmlyWTFmUFhjamxZbUJxUnNzS3R3UGJTaEo1SVlMT2NWZmtnRGRUSGdvT1pY?=
 =?utf-8?B?a0o0VkYxZDZOcXdPbGdZZDc5ZENyTjl1V3BUQ1NSYWxQdWpsZjN4QW93UVVs?=
 =?utf-8?B?dTNVY2g3dWplanovNDFzQ1RBU2RHbXJXeUUrQjZkYnZ4a1pvNmtCTkx3Y3Mz?=
 =?utf-8?B?TUhNK09Hays1UGEvWTA4WmxMRVl4Q2xXNDVvMEt2dVVZMXl6ZVpkMmpHRmc2?=
 =?utf-8?B?WVBjc2pBaEFTdkVxWTlWekZ3UFVGZlF3M1BXV1NtM1kzS0h3Vm9xQWViNzJ3?=
 =?utf-8?B?ZEV4TnZpOXJEZVpuekhWdU94SDlsYi81RVlvRVpVTlFyb1dxV3ZVV1crNkh3?=
 =?utf-8?B?YnhCUktHZThlSXVBQnVjd2tMajhVdHZLcU83d3hQZ0ZUSnB2VlU2M3JmcDF4?=
 =?utf-8?B?UG96YlNzNkxDZDZGMzFiSTRUNEY5bUFtYWxRLzlDYTFlT1NqQ0xiaG0rZm9W?=
 =?utf-8?B?VHEwYVFvQktZWmpQWVRMNFVzSlFKditjMDhSRWpjb256dTBsQWxZYy9jeXVK?=
 =?utf-8?B?SDc3UnlpOWpFbUJBb3YzaWkxbUdxb0E4LytIYks0b1JibjJPUi95Y08rNFB6?=
 =?utf-8?B?Vm51d1h6NlFCcjBTSDFqcXhVbjVqYitVR2dkdndCV1BqQ0NMbW1uL1FDWm4x?=
 =?utf-8?B?RXRjYnRwS09HVnFXcnhjeXhMMDJJRGFaMEtKb2lsU2h1dE0rL09aU3FlOGlw?=
 =?utf-8?B?T2llZHZibmJJOXQvSkRsZjFHbzViaUQyQ3ZzUkZXdGdTbFV1aVFNYWlUK3Y2?=
 =?utf-8?B?NytOR2VBREZXa28zdXlSbVJ2K3I3NU5jSFZXNGw5VzQ4NW1FcUdBVHFEVTcx?=
 =?utf-8?B?Y1YwQWZyNitOZHhrcFBpNzdHUjh3NWhRL0pZYnhxWUlad3B2VHJTbm9xaGFG?=
 =?utf-8?B?eUJzMi9WVTZsVDNEcmlqdmJaNnZqcHFlcHdDYzdELzZzdWRaVmJWYllGdk9Z?=
 =?utf-8?B?VmhWcmIyM1NEUXlhRFgvUzF1cm10QjFuKzdwa0IwZ21KNTVOdWJEeForcUdm?=
 =?utf-8?B?M0xkY01ZbjRXbVRKMHorRVRQQytQTEd4WHhVbFVIUm9WSjkySnhpOXBOTVRS?=
 =?utf-8?B?TGxjd0h2eU9UczU1N05Bd0ZSd2tHSzJiam1UTHNsRXp4RFhreHczSjNmNFgx?=
 =?utf-8?B?Mmc5V2FvMk9mbVowZXRHdlE1VVVXUjFwTER0ZjdiT0l4YUNxM01DSGE0Z3JV?=
 =?utf-8?B?S1dMRnBHRGxza2xON1dQNEloZXB3azl6d2gyM3dqRUpCSGZNNDV6VUQ1YlVB?=
 =?utf-8?Q?N45LxrbbMqXESvAdkyBWgPY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb38c478-10c6-40d8-2ce9-08d9f0b65a0d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:07:03.7818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72FGa3RK+3er0IRiXoqzAbI1N+p5jWxlexzZ3bxlPup/LLsW9JbtcLLLEsj5GAZ3bDg8Bx9X1tiq3GI6URQQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4664
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/15/2022 01:29, Lukas Wunner wrote:
> On Mon, Feb 14, 2022 at 06:01:50PM -0600, Mario Limonciello wrote:
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
>>   drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
>>   drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
>>   drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
>>   drivers/pci/pci-acpi.c                  | 15 ++++-
>>   drivers/pci/pci.c                       | 17 +++--
>>   drivers/pci/probe.c                     | 52 ++++++++++++++-
>>   drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
>>   drivers/platform/x86/apple-gmux.c       |  2 +-
>>   drivers/thunderbolt/nhi.h               |  2 -
>>   include/linux/pci.h                     | 25 +-------
>>   include/linux/pci_ids.h                 |  3 +
>>   14 files changed, 173 insertions(+), 47 deletions(-)
> 
> That's an awful lot of additional LoC for what is primarily
> a refactoring job with the intent to simplify things.

You may recall the first version of this series was just for adding
USB4 matches to the existing code paths, and that's when it was noted
that is_thunderbolt is a bit overloaded.

> 
> Honestly this looks like an attempt to fix something that
> isn't broken.  Specifically, the is_thunderbolt bit apparently
> can't be removed without adding new bits to struct pci_dev.
> Not sure if that can be called progress. >
> Thanks,
> 
> Lukas

Within this series there are two new material patches; setting up root 
ports for both integrated and discrete USB4 controllers to behave well 
with all the existing drivers that rely upon a hint of how they're 
connected to configure devices differently.

If y'all collectively prefer this direction to not refactor 
is_thunderbolt and push into quirks, a simpler version of this series 
would be to leave all the quirks in place, just drop 
dev->is_thunderbolt, and set dev->external_facing on all 3 cases:

* Intel TBT controller
* USB4 integrated PCIe tunneling root port/XHCI tunneling root port
* USB4 disctete PCIe tunneling root port/XHCI tunneling root port

All the other drivers and symbols can stay the same then.
