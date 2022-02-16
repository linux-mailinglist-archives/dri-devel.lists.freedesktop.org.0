Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AACC4B8E85
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 17:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76710E1EB;
	Wed, 16 Feb 2022 16:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB41E10E1EB;
 Wed, 16 Feb 2022 16:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMaGQrzjnGAhshBjMe4CIQYC3l6vurbkgGhxGfM3ymykaZOWKPGHkZJVNEEVmtg7QZNwzjRh1CSIdG1oJBIJn3QCQ/PSWcX1cVpbtIhmwKYJxhpsEIU9N8/MNZJFi9muhHXw2hSnjKTqAtWWZeWLa741i1FMNTJP8QdGucRego2WVF5RSbrtMMhG1TbQmjZ6KxPlfX7CRGnvQTG/d9MAwVRHQeXxMnqL/CnHf36f20jy4of4ftUs4SEJQKX9g0voLz/Yc8r661jmGMWV/W/nYGZxsH1kgGHdydAp3m7Y0Achd9/c1Jnau6X8iWH63XsVCtnF7f8FkJ75mCZ4XE7Q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfe16UAe5vQ9WWunUIzYw2J1VgfdvdfcfP7X5/Y2amM=;
 b=lveRPL4qk8G6IGpNn0Nk8ia/3a1wZ2ciMbUoDx3RvQk5CV8dSATroipt5hiWMzIyCG6/6OXl9XSntumEwsK4WXf9PsW2MseWHrJJCam6SKefeVVQCfJjVkcYPqbpVNrxzaVi7PQNqvPi5cq/tABRbxl2UyTYAt3NNlMPgMKBVhXSZq/nLRDx93XFah2PDHHw6YN94J/Afubx+7VsoOYYhq1mbXG1jWBeNkvTQiDNL4HmdipwDJrSdBOgaFh2pt41TvizG80mWPUJBbBsNolEB8nsAEFoUVuTNlhv87ItN6VCXymf1ORGuzQoVEjDR+VQB8z33/xvsrwckF1z+QmV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfe16UAe5vQ9WWunUIzYw2J1VgfdvdfcfP7X5/Y2amM=;
 b=B4d8if4d7+Mz1StP4qQ6p/UGEzqCC72fZIbJM26EbCHoxibSOtT1M+t6O7mtALLbtGhD09H32K6TImzXAgVfxAKNO/8wFJPQDq2g/ayiOx5o+v9RyV++vszkIJOyVj64FoZshHwJ29F2UM7A9HZZkeLipOPAJ0H6CMBTBakIUmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM5PR12MB1370.namprd12.prod.outlook.com (2603:10b6:3:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 16:50:34 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%4]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 16:50:34 +0000
Message-ID: <8da992ac-c241-1fe2-41a9-579c845608db@amd.com>
Date: Wed, 16 Feb 2022 10:50:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 00/10] Overhaul `is_thunderbolt`
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
 <20220215072911.GA13892@wunner.de>
 <3078823e-4ab4-27b6-b1c7-c6552fbfdb2e@amd.com> <Yg0LaujhftM0b8N/@lahna>
 <CADnq5_Ov3T9WH29MjgC2byqgTGkn-ux7iUaK3z5s2v4At_b3Ow@mail.gmail.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <CADnq5_Ov3T9WH29MjgC2byqgTGkn-ux7iUaK3z5s2v4At_b3Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0307.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::12) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9604802a-897a-4f24-ae6b-08d9f16c7306
X-MS-TrafficTypeDiagnostic: DM5PR12MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1370215E8C0B429C233E3247E2359@DM5PR12MB1370.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ep/nuLHVy144laOZFQHstgItn+9eAKGSL9j3ONGEI4EJtHD8jKXhBi6RGOwv9KwFLNb2LRujiDRwTwpTjhD88hh+FXc9XkKzqwNG2VNXqAHlgVkI6MhRcW5xuhsouCITgUZDSCw4Yi0k307W2QuA22D/dcRVs/CdP9DXHNkzDMTQMH9+weC2MrnTseFQPeBdR+pPyGim/Yv6AYoIrMGNUXPBMFTciX3YpwbAaPBA9Uk6KqSZ0+DOgdVBdcZWiHLizNutVhWTEJ5sACuaMIgnu+GmvVdwSZXRlUoUA4/4hddYbH5rfjKb7xfiiy89I8hpa6rDduksb8nAqXepYVaYqCyehkPYRDrzyuPk2+r5AVmH0zqo7lG7E2U91/RlS4fW5ioXhFkYIDEuxVjT+v2R7EPbJp9pAYVDMlnSrXdsenEQLuaH+6zGxyqWTr3FKc6eqw9aJ2ILmVQ8hWUeQRvUWR3lqykiNVAS96uk9iZbUaXBM6hxJA4OVveE3rrlNcNMFthS5oLB499aTQgAZ+WsSX78mde+QbG4n1KlG3DLuzzzAoZxmc0VmL3p1Cwe92U18No4L+q628xwNcPo8vrg9GVgwd8TObiXluYeojp9hGA0v0eQ11ZHX99aWOzlr+Rct3uct27XuHf68lom3oCwoOKYx2EwLd9S9xocCPXPIO7vY1SMy0PYE3Yw7iypO+qBINYcak22uCjLiHsO6bJAkLaNkBoweKZGa6qRPd0Bpwv9QX5mvD8BTv44rxHuOs6hDOyYMQcfcPtMF2+wBKXVdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(316002)(31686004)(26005)(110136005)(66476007)(8936002)(66946007)(7416002)(2906002)(54906003)(5660300002)(8676002)(4326008)(31696002)(6486002)(86362001)(508600001)(83380400001)(66556008)(2616005)(36756003)(53546011)(6666004)(6506007)(6512007)(45080400002)(186003)(81973001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktnQzZTbkFTakI3S3NzM1RORWRGL2pRckpTR3BmTDdTTlh2NnFhSFNPamZE?=
 =?utf-8?B?OWJ0NzR5SHViU0VKUmI5L3l5UVlJaSszV1dhTEJGN2RIc2F0c3BCRG9KK3ZJ?=
 =?utf-8?B?MVpvYWlGSDdTWFRLZ010bzF6VmN1djZNU1RtSXk3c1czRTJpR2N5NnFMOGV5?=
 =?utf-8?B?NU9PNWg2Q1lnczlobDlxaE9lckU3Z1UwclJucjJIdVV2N3ZKZkNrZWcxdTNt?=
 =?utf-8?B?VEpWL29SRXZjcFM1THNIQTBXeVptM1BkT1U0dFNVZ2tRVldOdHlJVzVydDA0?=
 =?utf-8?B?bVU4cmhidnZQYVRkdDJ5L2pjVWtCeUFzcEtUYnBtSWtydmxpUWxpNGYzdmRI?=
 =?utf-8?B?a3VrUzUzVnJyMndTOHNYTHF2ZVV1QUZyQk5uWExFZnB6a0RWMXRyeWFUWDdL?=
 =?utf-8?B?TWhIYlY0SGQ5TzN1R2preHJGRjlQaVNPV1dSRFBHNmtoNVFTQUhJVm1KR0hs?=
 =?utf-8?B?aEpRUTN0cEVMTnh5aHQ2R0dYWmZWM0xHNlJpaDNEeFU2MzA1MXQ4aWQ0ejVO?=
 =?utf-8?B?aEp3NjRpY0RSZFJHSzRXTkdDMTZkODRuRGxEUzZDVnVEN0hLaUsvK0x5d0Ux?=
 =?utf-8?B?akFwQ28yQTdDT3g4NzJtZVh0a01zaWo3WFhXanE0R1l1WW1kNjRrSTlFazdS?=
 =?utf-8?B?R1FuWjQrK0NudEI2R2xvSHlySGpiM1RmamYwS0UybmZjU0pKWEhzeHVTTGpX?=
 =?utf-8?B?STEvTGNTb1pYdnJTaFJwazczc2RzWTFxb0dwVjNJWVdNWW5TRFZKemY4OGp6?=
 =?utf-8?B?OWdQRlNGOXpPRDBFMjRBRzBBbnViSTBrTnc3SU51YXM3a0p5N1R6Ykhia1BX?=
 =?utf-8?B?V0huaW55K09HWVM2d0pVbUNhRHhZNVVDRjlzbk1LbVpta092TU9BZ3h2d3VR?=
 =?utf-8?B?ek54NFJuS2lGSjl4b0lXQ295VUVQdmQrYVprMCtDWjVvQlIzcDZGV0J3eFht?=
 =?utf-8?B?U0VoVGJxbnhxbTU4eXFnbnpxb04rQ25FekRVSnZ1Z3NEWFphQWlsdXFXbE8y?=
 =?utf-8?B?ZHZWYVo0V3M4NHFNQWxLWFZQKzU3MDFJVTRKY1ZqV0tZMHprUUpDRVJ3WDVP?=
 =?utf-8?B?ZkIxaDJYSVBzdFg2WlhDRnJWOWNvcHFqbmgyaFQ3LyszN1ZBaHNFOTFoTDRv?=
 =?utf-8?B?dkFpREo0MXRXUjVWNStSelhWdHdIMnQwRHhIL0pTck5KSzMrM2FPT0xKTVZH?=
 =?utf-8?B?ZmNzWmZwWmI4WGRqSjlUMjJwWjNIb29jeVVIdjZMc3lzbUJGWTNSSHUrdnFZ?=
 =?utf-8?B?STY0UXBIMHoxUDFRRExoRmE2Q1hwWFBoS2NQN1NkVTFwZG1WeXc1UUppVVpS?=
 =?utf-8?B?TEJ0Ukp3RUFCanZZRmNnZ0tidnR6c1k4U2VUWnNKQTNublAxSnJ5TzI1MW1M?=
 =?utf-8?B?QmF6R3JVRHNOZnprZEtQTURQSnE1bVFEMm8zenlqaHREZXlUUmViYXZhQWF0?=
 =?utf-8?B?THhUc1RwcjMvYmx6cU5SeFNOUU1Nc1ZUOEtDOTNOYlZUQUtHemlObmFNTjBJ?=
 =?utf-8?B?VkNkQ3hCbWN1YTFQbWE5QWZJTExpYk5FVzdKTnlpN3BrYXRHTTc0YVUrZUF3?=
 =?utf-8?B?TDNYcFdWYjlZN01uWURiOVoyMXhXUEswTW4wTVkzZG1LajZRZUtJdUoySE1v?=
 =?utf-8?B?WURnNWRqb0RMRExWVVdJNXVoVE9idHVIeDNHd0VVRGlpblJ0TUJLaFBGYlps?=
 =?utf-8?B?azhMYWxZM05LKzAwRWNtZEJObldzZnFVQitVNGJvQW9CZHZBUGVuN1I1cGEr?=
 =?utf-8?B?cU1YVjNYL1ZwbkFXVnNCL2RtVzBvVVlyWVRpV21TMlpMRGR4RWExbXBGUVhq?=
 =?utf-8?B?b3RqcEhLdGtQOWpjSE0zdmIyT0JyNEM2aDloTkxCdzdHVnBXSVFEZXNwYUk5?=
 =?utf-8?B?YWNOaitGaUxZbU1uZ3pnRUhwQlI5cDBXaW1rb1dDT1FVUEVRV1A2SUFOODg3?=
 =?utf-8?B?MjJQcUIxT0liTWFVVHUxN0VqUkhUaGdCcGRUQVphR1BrWm55a0FrcEp5ZUZ2?=
 =?utf-8?B?NnNHVFdSVThQL3RrTHJaT2F0Y0ZZUXJrbW44elI2dGdXTEZrVGNLZ0JjTm5Z?=
 =?utf-8?B?UHNhcnlOZ0N3MDVTMEN4amUvbDJaNDNiSklOSzUrdHUrVmpJNnpKYXBwaUpj?=
 =?utf-8?B?cnJKblAwREJsTDJrc090ZnZqNHRtdEEzM1RpWWtScG5FMUJJaExxQjVVZXF1?=
 =?utf-8?Q?3ZVMjme8sfRA4zYZAgzNHv4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9604802a-897a-4f24-ae6b-08d9f16c7306
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:50:34.3695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OVCjB+4bLK+ZEWHQRGctfMW4dc/1gbGLIf9FOBYmmePVxFHqwpLAa31IB2B8BdC15MkfgHNaac6CWQQ58U2Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1370
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/2022 08:44, Alex Deucher wrote:
> On Wed, Feb 16, 2022 at 9:34 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>>
>> Hi all,
>>
>> On Tue, Feb 15, 2022 at 01:07:00PM -0600, Limonciello, Mario wrote:
>>> On 2/15/2022 01:29, Lukas Wunner wrote:
>>>> On Mon, Feb 14, 2022 at 06:01:50PM -0600, Mario Limonciello wrote:
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
>>>>>    drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
>>>>>    drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
>>>>>    drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
>>>>>    drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
>>>>>    drivers/pci/pci-acpi.c                  | 15 ++++-
>>>>>    drivers/pci/pci.c                       | 17 +++--
>>>>>    drivers/pci/probe.c                     | 52 ++++++++++++++-
>>>>>    drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
>>>>>    drivers/platform/x86/apple-gmux.c       |  2 +-
>>>>>    drivers/thunderbolt/nhi.h               |  2 -
>>>>>    include/linux/pci.h                     | 25 +-------
>>>>>    include/linux/pci_ids.h                 |  3 +
>>>>>    14 files changed, 173 insertions(+), 47 deletions(-)
>>>>
>>>> That's an awful lot of additional LoC for what is primarily
>>>> a refactoring job with the intent to simplify things.
>>>
>>> You may recall the first version of this series was just for adding
>>> USB4 matches to the existing code paths, and that's when it was noted
>>> that is_thunderbolt is a bit overloaded.
>>>
>>>>
>>>> Honestly this looks like an attempt to fix something that
>>>> isn't broken.  Specifically, the is_thunderbolt bit apparently
>>>> can't be removed without adding new bits to struct pci_dev.
>>>> Not sure if that can be called progress. >
>>>> Thanks,
>>>>
>>>> Lukas
>>>
>>> Within this series there are two new material patches; setting up root ports
>>> for both integrated and discrete USB4 controllers to behave well with all
>>> the existing drivers that rely upon a hint of how they're connected to
>>> configure devices differently.
>>>
>>> If y'all collectively prefer this direction to not refactor is_thunderbolt
>>> and push into quirks, a simpler version of this series would be to leave all
>>> the quirks in place, just drop dev->is_thunderbolt, and set
>>> dev->external_facing on all 3 cases:
>>>
>>> * Intel TBT controller
>>> * USB4 integrated PCIe tunneling root port/XHCI tunneling root port
>>> * USB4 disctete PCIe tunneling root port/XHCI tunneling root port
>>>
>>> All the other drivers and symbols can stay the same then.
>>
>> If I understand correctly the original intention of this patch series is
>> to be able to differentiate whether the device is "permanently"
>> connected to the motherboard, or it is connected over some hot-pluggable
>> bus (PCIe, USB, USB4 for example but I'm sure there are other buses that
>> fit into this picture too). Specifically this is needed for discrete
>> GPUs because of power management differences or so (please correct me if
>> I'm mistaken).

Correct.  It might be possible to drop the patch for the integrated case 
(patch 3) because I do think that by Microsoft having the _DSD for 
"ExternalFacingPort" it's very likely that most implementations will 
have used it for the appropriate PCIe root ports.  If something shows up 
in the wild that this isn't the case it could be revisited.  If it's 
found pre-production presumably the OEM can still fix it and if it's 
post production and there are problems we can dust it off then.

The discrete USB4 controller I would be more concerned that this isn't 
populated, and that (patch 4) should be more important to let the driver 
core set it removable.

>>
>> If we set the is_thunderbolt debate aside and concentrate on that issue,
>> I think the way to do this is to check whether the root port the GPU is
>> connected to has an ACPI power resource (returned from _PR3() method).
>> IF it is present then most likely the platform has provided all the
>> necessary wiring to move the GPU into D3cold (and the BIOS knows this).
>> If it is not present then the device cannot even go into D3cold as there
>> is not means to power of the device in PCIe spec.
>>
>> Perhaps we can simply use pci_pr3_present() here as nouveau is already
>> doing? Granted it is not too elegant solution either but better than
>> using is_thunderbolt IMHO. Since this seem to be common for many GPUs,
>> perhaps we can have a helper in DRM core that handles this.
> 
> The tricky part is that there were AMD and NVIDIA specific proprietary
> _PR3-like ACPI methods (plus whatever Apple did) prior to GPU power
> control standardizing on _PR3.  Currently those methods are handled in
> the drivers directly, sort of tangled up with vga_switcheroo.  I think
> ideally that logic would move to the ACPI core and be handled the same
> way as _PR3, but I'm not sure how well that would work because of the
> various bios date checks around _PR3 and the lack of general _PR3
> support in those older platforms.  So I think we still need some sort
> of "is this soldered in" check.

Considering that limitation if `dev->external_facing` already exists in 
PCI core may as well use it for this instead of `is_thunderbolt`.

> 
> Alex
> 
> 
>>
>> Then going back to is_thunderbolt debate :) I really don't think the
>> drivers should care whether they are connected over a tunnel or not.
>> They should work regardless of the underlying transport of the native
>> protocol. They should also be prepared for the fact that the hardware
>> can vanish under them at any point (e.g user unplugs the device). For
>> this reason I don't really like to see is_thunderbolt to be used more
>> and prefer to get rid if it completely if possible at all. If there is
>> still need to differentiate whether the device can be hot-removed or
>> not, I think "removable" in the driver core is the way to go. That is
>> not dependent on any single transport.

Hopefully that is what the patch series does right now as of v4. As I

If we really don't want another pci_device attribute we can probably 
invent another device property for the quirked things in patch 2 instead 
of "no_cmd_complete".

