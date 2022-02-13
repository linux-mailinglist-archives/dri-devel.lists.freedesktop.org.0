Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D74B3C8A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 18:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C3310E390;
	Sun, 13 Feb 2022 17:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1680D10E387;
 Sun, 13 Feb 2022 17:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFjeyC3rr3lVyN9Pvvvdb0LScSkmix22wc98IOWyJRYv1qogWT9U48C78Pv/7o13doKH2WtpxVgn2Lb5vUWA4eSiPnR63LMpBhKnghR93iWUvzQKzOl3dn9FV+bR5mqRQfjNXrsDK4j6VJp1FvNqAKdFwF6ntVGWjeQaMBy6Jbt2hGQy59wd1efQGvjuYDlXK5Toq/H2mptfZvYuZHiluGf1VxtntNqghohxrUapJVoJZ5rfYNhv5RQIvGhQ+RB7egV83JK5nKv1ZbbAcgm/uS1DcR12um/xMQd1H7GOyq/SdiqttXIbkDr9w6kaZFscQoSeEHRBnUnDCsYWcVyJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Iw9/mXkP88ohPZxqsKaN2tT6XG3sqms5SR43Ybjq0I=;
 b=MAKVXycIiqCrUk7y9GHCiKX5pG/cARLTFMAmNOaTqBeo9CbddYajd6aPi7zGYevJMUOurMhbAmYDFGybv+aYwKu7C6sBc/Ykp8ormOtz/bpKsy1iXoiIAlybNnxoHi7Zn1XgqHHuzm8OxupJY8naSCFC7HvomwDJ5G9djmGwM+nveU/cVI2goBOGVJz7xg/+aTBvir0ZprJdFAFFNIl8Czfix2cTplaIdmYMfJx9cD0VOc1UN8hpenetSp66USwWfiSgSHJlGPz68488MDt2HyreMN0RLzOQ5ym3Lv+FWuZ1X5cOVczUf6wai9PgAtOabfTQUydcxtvBpLnkMULoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Iw9/mXkP88ohPZxqsKaN2tT6XG3sqms5SR43Ybjq0I=;
 b=l+1OUncDDAwu1yhUMkVuefZDbdQmr8uGMYP90qHICdcKuCF3kM66du5CTKCUxt4IwkdAnjSx8z5at0hMMyNCK0s1iuhB6jQzt7plPQ+JbtnU4IejvQXm7sfZ2uuyyDYxN59tUQ8loEuvPANywt95yb2q034u0xSD5FyBSqtRQrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MWHPR12MB1711.namprd12.prod.outlook.com (2603:10b6:300:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Sun, 13 Feb
 2022 17:27:00 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%4]) with mapi id 15.20.4975.017; Sun, 13 Feb 2022
 17:26:59 +0000
Message-ID: <0ef8f2cb-1978-f469-71d3-2cf7469eb8b6@amd.com>
Date: Sun, 13 Feb 2022 11:26:56 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 04/12] PCI: Drop the `is_thunderbolt` attribute from
 PCI core
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
 <20220211193250.1904843-5-mario.limonciello@amd.com>
 <20220213082056.GA23572@wunner.de>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220213082056.GA23572@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0026.namprd02.prod.outlook.com
 (2603:10b6:803:2e::12) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 425bf962-063f-43e3-b4b4-08d9ef160a84
X-MS-TrafficTypeDiagnostic: MWHPR12MB1711:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB17119CFD6765A2DE9E7D397BE2329@MWHPR12MB1711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FL7bCfrOCDSvwLnj7iQe/wZwxI9QfL3ciVQOWQ5+WhWb74CVbpUi2TuJV1AEQk/RpZTttOS9EemsEUu3paZ3cvmEv6MAK5t5U5FOeCTVcT+QFMNE5NtaKddmOWI2k6W8u6WcYrz5rJRRGv1EISpWOP8brUpk/bUdt87RmQttVOmUoJH7LAQo17pVO6Ssc0CHiUoTjFIRjmvpOiN1tHTK2PTyTTos1kXi0ovkCZaS19vrGhYHFk/Ann5haLapeitjfnimKgzKQqNM18sGQPLWvlNAdMb34OnIcweDzOKTIhgdUckiSLfnBCbdAvgLa1HaNpT056RzPzhFUzTKboYBYx4EU4Wsw5mIrue2DCzTbMLB2XE2kUHoei1R8NDERiqzH0IvMYS6HQ0tMMVmnQwDPSxYKb2sbcObZAPiXHmH+MId3BvZIQnE/zxMR8Rn+uvGd4M3tmAgGGDMu+mAymKj7501nYLoqgIqr12ZYxhYbQTolqaTRrw3ejbtwpR8QDSIDb3SyT+ret9c8rsKDzomwfx7rMSiM1Q8B9mtbYsLHLySFddars/ny/MXIaz/SegwuberQoBa6Dl7Yg2u3Oz+ZMz4Qup5ZLJRDnESJOsXu+vP8GQt2lFERKatR/jnWZynGV0kEW5COR6w3zlBxOST0LaFdM39Hx7tXSCIVizAPJA3f9VBcyW/vmSxxFvtppFiY45zsDqoz5Eqecb+e6hRVgHZSAMQupP/GpAc7Zn3WPvcEt7guHCSNryja8g8NIX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(186003)(7416002)(66946007)(86362001)(8676002)(4326008)(8936002)(66476007)(66556008)(53546011)(31686004)(6512007)(6666004)(508600001)(6506007)(36756003)(2906002)(38100700002)(31696002)(6486002)(5660300002)(6916009)(54906003)(316002)(81973001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpBdjQxd3JXN1hRUkZDQWhOQ2JIZjQzc1hqWEVuZVR2Nms0bnJVZ2FLNHBE?=
 =?utf-8?B?cW9Wd3J0dHhCWHZaMm5CbHJTK1dqT29wek1Dd3RuUktGazVxQXRvcXRuVmkr?=
 =?utf-8?B?NXIwL043YkMrcUFtUm0zSjFoRVhUVDNMZWQwUFJocXVoODJzdlUvSjRFSGVp?=
 =?utf-8?B?eWFac1JLNkVoUWtWYWljaS9EVnk5Q0hlc3g3dkVHeFRwaXJ2TFJwR2lEY05x?=
 =?utf-8?B?T3J5K1Qrdm9yeGJXNGxMaXc2VVZaaWJHYW9abzQyc2loRWUxVzhsS08zRGg2?=
 =?utf-8?B?aVdMdVh6ME5qUkhnNitWWW53WGgxSUNtc0F3czR1MDY4Y1VCdUcwemxiMFZ6?=
 =?utf-8?B?ejQrdWlaTi83VXNZeGsxR3ViZVNLSktSZ25TTWl1MUM5MXZQMTFXTUFyOW0w?=
 =?utf-8?B?REVQUHRoazc5OW1BZXBwdFhkc3RhQVBtclBHVEFtU2N2alhGTWszQzA0VHJI?=
 =?utf-8?B?emxDRExMbjdZU0JISitaL0d5VjJ6SlQvV3h2M0VCcnJ6NElLUG1sNlpGelBh?=
 =?utf-8?B?cVRHZTNoNUNkQktKYzlrVCtDb05YQVJjTkR4S0dkRTE1ekM5Y21TTyszWDJY?=
 =?utf-8?B?a0FCWlRIT2RBbnllWDNqZzRLU1BBYmFZQ3FUMWt4cmFSN2tta0REZ29RLzNC?=
 =?utf-8?B?eGZVSVp5VzlZdm1iSFJXQnh5dy9NUTRoUGRQSmsvZldPNFhHNjh2Z2xOYmN4?=
 =?utf-8?B?Y1F2S0o0MXdHOUYrSkYwcUk5eDNDNTVDVU1GT2k2OU1qM1cwSVVqWUNzK1o3?=
 =?utf-8?B?ck15Z1JSVFlxYUprQ1Mvd3VBM2pVeDhLWGRpejY2dGhkR3pmM21vNHV2ZGZo?=
 =?utf-8?B?WWFYWlFBaElVVFByaW94cUdzRDdBWUdxWlV5cHpMYno4aWFsZldCdVc5ZXRV?=
 =?utf-8?B?TGYxVWdiRG5NWXkzNERxVlBEdExpZjNQNVlqUXYvMDRST25tOFY3Rm1BbzNJ?=
 =?utf-8?B?Vi9VRVFScDFzQkcwdk12eVgwRE9DeUFjOVNMejFYK0p6V0dmUjRPTFJRNmFz?=
 =?utf-8?B?MzY2bEcrRHlaUDJOQkQzeFNGbUgvWGpFaGlOZ1huWVczWUdKNG1aYmxjaXdn?=
 =?utf-8?B?enJZZmk5SDYxMEk2VjJSd2hub0NTcnRJbGJLSGg5VlV6Z0xuNC9iMnhIb1NX?=
 =?utf-8?B?YUlTT1g4SVV0YkNmMjBEaG1qV1Zmdy9tWVUvNmJjbkl0UEduNk51NmxpcDUr?=
 =?utf-8?B?WGpJa2dXSkxTRUZsbkd1Vzk1M0JEd0VLaXJUbUtBc0hucVBLbjRJQzBTYjdl?=
 =?utf-8?B?R1hGVkVoSEJONFhWRlY3NitqQm5JbjRjNUtSYTlaRi9NYjZ3Zk5kNDNmZyt3?=
 =?utf-8?B?YnBSdCsxN3hURUZ5REhhSmRvWEo5TVJPMWQ2RzhSQlp1eitsQ2ZNSUF1bXJP?=
 =?utf-8?B?MmJiSWhPS2tnR042NkNDYVdsUmlZanNIK0dMYnNlK0c3em01SDV5OXNmUWYv?=
 =?utf-8?B?R3RpSjlFNU9CN0dPdmJRM0IyeU05V2lhZUtISmNickxYc0xTS3RqekVxQmxH?=
 =?utf-8?B?aGhxc1RaQXpYM1NFZkEyeFQrL290aUxCS3kzdFpVVGhSd3h0dDVpMHBtQjEy?=
 =?utf-8?B?TlJRaHgxMEtJWkhuZCs3cGNQcFU5Q1pEVkFuN3RqODFkYlA1elZrNjlrOE9o?=
 =?utf-8?B?bW5uM29jUE55U3lDdzJJVkNOMXRnUzdFUG5XSEl5TG9Lc0lEN01QWUlZaTcx?=
 =?utf-8?B?dll0YVBUenBhK1VSNVJ2dTZrUkNjTXNIajZMamZlU3Z4cUpub2tOTm5kcjRv?=
 =?utf-8?B?WmRFYmk1M2lhMTVEcHI1R2wzSXFSZXozVnVMVDlteU9ESWRCRzhaU0lndlZX?=
 =?utf-8?B?aEttZkNtQ0NMdi8vUWhNNFVQQkxPZFRLSUZvNkd1YzVUcUJvRGxtSlMxRXFU?=
 =?utf-8?B?cFhVdFpEbjJpQkppZWk3SEVqcThjS1NVQmVGWmx2SFMvQjRtdHc0U21haGJi?=
 =?utf-8?B?Qmx6Ync5S0d3RG5BcDBzb3dROCt6R1FKekgyei9paUJ5a1BqMGszS2ovSC94?=
 =?utf-8?B?NjhRdVFDbjRmM0Y5WUVDYzB3V3BjdDdibzZUWTZKVXFBbDJxdnlQMHg2U1Zu?=
 =?utf-8?B?VmtpK3hqdkN3V29wdU9yL1hHd2lQTGNmWExKTkhrNyttSkh2MG5tZW8rajJH?=
 =?utf-8?B?MXFSU2ZSdlJ2Ymo1TjdtT1dLMjBGb2RkSHpFcDB0aGxtY2JVVkFLTXVML3pD?=
 =?utf-8?B?a1c5UGpocnVzYWNybm1uUis0T2hNK0tnRVVjWThEdlR1QURHS1JzNDJ4R1Vp?=
 =?utf-8?Q?APaT9OBXLeY4cSM+qLmOyUVx84txHt2ROUZrbZTAU0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425bf962-063f-43e3-b4b4-08d9ef160a84
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2022 17:26:59.7235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dsuK6y0f4zWo6fZRw8aDv/OZTPWPFFWWeHzRyEg58uEqzLgQUXMDuMzHxMCRKqHVdER/qKOoUO6vWlIh7nQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1711
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

On 2/13/2022 02:20, Lukas Wunner wrote:
> On Fri, Feb 11, 2022 at 01:32:42PM -0600, Mario Limonciello wrote:
>> The `is_thunderbolt` attribute is currently a dumping ground for a
>> variety of things.
> 
> It's not as arbitrary as it may seem.  Quite a bit of thought went into
> the current design.
> 
> 
>> Instead use the driver core removable attribute to indicate the
>> detail a device is attached to a thunderbolt or USB4 chain.
> 
> You're missing the point that "is_thunderbolt" is set on the *controller*
> (i.e. its upstream and downstream ports).
> 
> The controller itself is *not* removable if it's the host controller.
> 
> However a device can be assumed to be removable if it has an ancestor
> which has the "is_thunderbolt" flag set.
> 

Ah right... I wonder if really what this series should be about then is 
setting up the the PCIe endpoints for PCIe tunneling and XHCI tunneling 
to be marked as "external" instead then.  It would mean that existing 
code will apply the removable attribute to everything downstream (and 
presumably at least some of those drivers it will continue to make sense 
to drop "pcie_is_thunderbolt_attached" and instead check dev_is_removable.

> 
>>   static void pci_set_removable(struct pci_dev *dev)
>>   {
>>   	struct pci_dev *parent = pci_upstream_bridge(dev);
>> +	u16 vsec;
>> +
>> +	/* Is the device a Thunderbolt controller? */
>> +	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
> 
> This doesn't make any sense because the host controller is not
> removable.
> 
> 
>> @@ -1860,7 +1855,6 @@ int pci_setup_device(struct pci_dev *dev)
>>   	dev->cfg_size = pci_cfg_space_size(dev);
>>   
>>   	/* Need to have dev->cfg_size ready */
>> -	set_pcie_thunderbolt(dev);
>>   
>>   	set_pcie_untrusted(dev);
> 
> Either drop the blank line or drop the code comment if set_pcie_untrusted()
> doesn't need dev->cfg_size.
> 
> 
>> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
>> index 57553f9b4d1d..04232fbc7d56 100644
>> --- a/drivers/platform/x86/apple-gmux.c
>> +++ b/drivers/platform/x86/apple-gmux.c
>> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>>   
>>   static int is_thunderbolt(struct device *dev, void *data)
>>   {
>> -	return to_pci_dev(dev)->is_thunderbolt;
>> +	return pci_is_thunderbolt_attached(to_pci_dev(dev));
>>   }
> 
> No, the gmux driver changes its behavior if a Thunderbolt host
> controller is present.  Not if there's a Thunderbolt-attached
> device present.

Present in the system?  Like not necessarily part of the topology?

> 
> Thanks,
> 
> Lukas

