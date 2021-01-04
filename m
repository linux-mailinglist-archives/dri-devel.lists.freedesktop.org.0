Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F672E9422
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 12:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB6389E01;
	Mon,  4 Jan 2021 11:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E289E59;
 Mon,  4 Jan 2021 11:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f39hgusMSXOts6qYK9RxoMxRiQiIRcURMBf16FMo2eQMNyd95HXAbO6WUoH5UAYHPkj2oBdBFXPuQH0ct0NRWDiWLXZm76soZ1E4MqJQa4l0H8U3SJMjzxRSz1NBx2fbiaDDv5A7FzB6R+dRRbwvsGAONPa831FGVizCQcluDL2MSueYhjbnz3G/jRdEhavw7SmMY+A4gr7B8SNLePnJJF7NA0loebNWxTEPooVS+8eGFn/wQakM4TUr2418qswuVzGkkrEx8Ok3zq6rPo0/7urbVZJvu6fnzww/+k2k2s0lIavEG3uaU0FJ1PJgX6fon6GGRa2ZUhyTHJhVrQOvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njljiKasQSb+1KY7AA0qRgaHyrqXP/mgYqD6rx8k9q0=;
 b=JrWN1p5RdqIgnGr1JSogYKCwEhUgEDTgdDK/K3JprXZQ1qFD/Qb0ymZqk3ARwzetu1vQRm6luctw+gZ9SslNGYVWVFZ+VxIeNSE0bjTku9haeVYqeYPx34bePjIZroYF4DDdTBvO2dmIATWBtCkNxfSxR+P1ZIOrXd7gxhpFCU1uMpu/Gl5cw6oqYSD5ThVOc4HyKaQbtqUZHm5AcKa/eRtqjiBEIzcGcARfT/dPQ+ZgKHSbboJMP1IBvCR9xEVhSYikKLNxK62qSzeucRiDMS5NU1x7J1OZ1uxy5FEi2eeXiwymXq4pYQDavPehNxUGU8Cc7KQcv/yoZkSG/9AjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njljiKasQSb+1KY7AA0qRgaHyrqXP/mgYqD6rx8k9q0=;
 b=T9a7j+3AQf/dVM2CJSd6WKry9Fv5yEef+O+iUKjxh6bMYhq/1yw1iP5I6mu3VVlz0OJC4+ZG8B4ViO6GiprPKk1KKjOWJOCuzlCSxloS7tSMivcmYnuy4MdjP4V0cbLtqpAW34HBTpqZ+vq709nxp+70/2S0xXP8rmDfmL4fip4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 11:34:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 11:34:40 +0000
Subject: Re: Couple of issues with amdgpu on my WX4100
To: Maxim Levitsky <mlevitsk@redhat.com>, amd-gfx@lists.freedesktop.org
References: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
Date: Mon, 4 Jan 2021 12:34:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Mon, 4 Jan 2021 11:34:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c28f409-6fdf-48d3-5085-08d8b0a4b95f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3680F4CA76AFF674B673715483D20@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ibs3I+RKKW8NOHfpAGRW/KEZkUdWLfWwMcacZapz2ewgqerg78xyS/Ex4jrj03x6Q2aBvPbwwxg9htLLXkDx/5SPyBT03mJdQk8NvNioeCT3T9+IfVOst6QmQaMjXRJa6JxtqlZwOMyn3y4XuzD8Nq/C2CXAqau4w1R8ITK/Euq5/+EI3yy1XkGEn2xPlaXhHtmpqIewbmPeEVlMek/ivBlkX/sBqZEA+Nsn23FAvFdqqGyxZO4PAOeODoAzyBkpZj3QELSPRY/MLe9WTBaMT5KXgWBqvV6JkzMqlT/2xQ74OdYsThRf/1hRjMUXuRhulaxVlD3RO6gskKaoWNPbogs+PIuEwfGRPdX0DIcDmk9N5zbgZb2N0jR0iJAyxebvYCavHvgbJ9hzbB7mX0CLd1maM1F3jep1/Qqrrn3nbGcfi9pB62nihcaH9NncduXOCv8MIwgUJKFfjbky70vFEn0moF+9zbD9Xx7J45vE+cwwtpJ0tWsiD41uEuLFL2+tVLRYgRhNJqrzNqjQOk3KrBmIIJyFYXtd2kwHT3NXhEx7IrZ7qpY9PIgEeUwiPc7O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(66556008)(16526019)(36756003)(66476007)(2906002)(8936002)(31696002)(166002)(966005)(5660300002)(86362001)(316002)(54906003)(2616005)(30864003)(478600001)(66574015)(52116002)(6666004)(6486002)(83380400001)(33964004)(66946007)(31686004)(8676002)(186003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFJheEFNclVTbFRESmJsY3N5SytFR2N2N3M4bGwvWktHRWkzUFZpRWJ2WDZz?=
 =?utf-8?B?aTdIbEhvQlA5aXR1ZmhKNkV5N0EwYjc0OVJNUFkzVDlLMzh0Q0Z5REkzU3Vj?=
 =?utf-8?B?WkVvWW1CdnhPdll2SWgxN3RhV2IvNUE1WmI1ejJ1cFJLQ1BzZUx1Zi8wTXNG?=
 =?utf-8?B?OVdZdmpYTjdvVGxRTWlHQ3Erc3dxdi9aQWQ4Y0dBN2szTEpuNTVhS08yeDc2?=
 =?utf-8?B?SzdiTEFjZ3ZzQjNDaHhkT2tXT3N2MkVMMVovL2FqOVNvMmZEb2xaVFMzNHVO?=
 =?utf-8?B?THFvdTFhRHl4TUdhRzM0MW50ajUxTTRMalJ4NU5YYitUcCsvdG5DNFg1Y3ZL?=
 =?utf-8?B?N2xTUHFKaHJyNXNJaWh6ZjFoSVR3YVMyd044N052RlFYTVluZmNPV0NKNDQv?=
 =?utf-8?B?TVV2Y3hZbVBnRTBacTg3KzNhWmdKOTZBWEVlTTRueXlJQnVzSUFLcnNCL0ov?=
 =?utf-8?B?aHV1KzVYTDBxWHgrellCc0I5b0Qvd3YvMmFkSDhpRkpwcFpuUU03dlFwUU0y?=
 =?utf-8?B?QVc5L2FJUkcwYVMxN3dmdC9VK3YwMUZHUkgzUXE5SmFDbnJhTHZTY2t3cWRB?=
 =?utf-8?B?eW5pNWYwN2FTaGNBNXYrcFVzYTM4bmVIbkltVGhlUFNadTZRUVladjhRbkVC?=
 =?utf-8?B?WU5yMGM3Wmo0OWhZVHVrb1JsaDBrc3psM2F4SnBEMTBMS2s1YlpaMG1HK3Rx?=
 =?utf-8?B?R0ZiSzdTVDBPaHZZZUtldjJZd3FUWVAzWVRZd3JqOG5pdzhWQkdvU2xVcE9l?=
 =?utf-8?B?dVhOZGV2L2JQamcvQ0xYMHRaQkh3SUhVQ3JPaXB6dHlRdjQzRXdlZ2MrTHRQ?=
 =?utf-8?B?aStXcDI4MXZVeUNTM24yUUVqTDBUVFJ1bUlCaG5jRkRKSG55NG5rSlpQeHZ2?=
 =?utf-8?B?OEtzK3pPZm5FVUx2RVZFS2d3RG5oNnp1dFVEUGhGNkZlbiszTzZUSnk0c01O?=
 =?utf-8?B?SWJZKzArdlJtQUhGZ0c0dTNmQzVOSFQrd09rUm9rMmFIeGlXUDV1Wi9XN3hS?=
 =?utf-8?B?MTR1YWp6SEdlSGdVUWdPQVIzM2VnOUpQS2FjZjhaSDRLajZNZ1pjWk9RU0ZY?=
 =?utf-8?B?NE5FVWJXTHE2YytIV2dFblJsdDlJRkpndXNLcjNBT1hNd0l3Tk4rbC81dlNy?=
 =?utf-8?B?QStOaDNWZ1NHZEJxYnRNZEhiNnFhSFIxb3ZBekZMbEVkMVFPVEVZYlZ1U0pj?=
 =?utf-8?B?TGRyeStWSjI0czFFZ2lIeWZmeXc4N3ZLMk0rRmFHWTI0U3FLcHcvWENxUmtz?=
 =?utf-8?B?YkwvMXlEN29EOTQ3eFNnQU4yaFE4N0wyVm5sVEIydnB6RmxPbGdSSWdSRTBo?=
 =?utf-8?B?dy9vUHg3TldFOGNaRkdqT0hhOHl1MmNKLzEybTVOL09uem5mRnJWTjRLZ0ZI?=
 =?utf-8?B?ZXZxbnYrZ2E0MC9ON0UxN2lkanN6dkdqYVpkcGlEbEltRlFZWXJjRklKdFlk?=
 =?utf-8?Q?WyKbSRDB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 11:34:40.2772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c28f409-6fdf-48d3-5085-08d8b0a4b95f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbCsvJFmghXA4CEdVMWVgy/Uy6ZlPW0F29ySZiiN+kPoHTW8nPNMQQVjCgkqTeOo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Williamson <alwillia@redhat.com>
Content-Type: multipart/mixed; boundary="===============0902341457=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0902341457==
Content-Type: multipart/alternative;
 boundary="------------C3B739F6FD0F2314864E9293"
Content-Language: en-US

--------------C3B739F6FD0F2314864E9293
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxim,

I can't help with the display related stuff. Probably best approach to 
get this fixes would be to open up a bug tracker for this on FDO.

But I'm the one who implemented the resizeable BAR support and your 
analysis of the problem sounds about correct to me.

The reason why this works on Linux is most likely because we restore the 
BAR size on resume (and maybe during initial boot as well).

See this patch for reference:

commit d3252ace0bc652a1a244455556b6a549f969bf99
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Fri Jun 29 19:54:55 2018 -0500

     PCI: Restore resized BAR state on resume

     Resize BARs after resume to the expected size again.

     BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199959
     Fixes: d6895ad39f3b ("drm/amdgpu: resize VRAM BAR for CPU access v6")
     Fixes: 276b738deb5b ("PCI: Add resizable BAR infrastructure")
     Signed-off-by: Christian König <christian.koenig@amd.com>
     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
     CC: stable@vger.kernel.org      # v4.15+


It should be trivial to add this to the reset module as well. Most 
likely even completely vendor independent since I'm not sure what a bus 
reset will do to this configuration and restoring it all the time should 
be the most defensive approach.

Let me know if you got any more questions on this.

Regards,
Christian.

Am 02.01.21 um 23:42 schrieb Maxim Levitsky:
> Hi!
>
> I am using this card for about a year and I would like first to say thanks
> for open source driver that you made for it, for the big navi
> and for the threadripper which brought back fun to the computing.
>
> I bought that card primary to use as a host GPU in VFIO enabled multi-seat
> system I am building, and recently I was able (with a minor issue I managed to
> solve, more about it later) to pass that GPU to both linux and windows guest
> mostly flawlessly.
>   
> I do have experience in kernel development, and debugging so I am willing
> to test patches, etc. Any help is welcome!
>   
> So these are the issues:
>   
> 1.(the biggest issue): The amdgpu driver often crashes when plugging an input.
>
> I tested this now on purpose with 'amdgpu.dc=1' by slowly plugging and unplugging
> an input connector while I wait for the output to stabilize between each cycle,
> and still the issue reproduced after a dozen (or so) tries.
> (It only happens when I plug the connector, and never happens when I unplug it)
>
> Then I unloaded the amdgpu driver and loaded it again with dc=0.
> This does sort of work but takes a lot of time. The dmesg output is attached
> (amdgpu_dc1_plug_bug.txt)
>   
> I did try to increase the number of tries in dm_helpers_read_local_edid, to
> something silly like 1000, but no luck.
>   
> I also tried to remove the code below the
> 'Abort detection for non-DP connectors if we have no EDID'
> Also no luck.
>
>
> This bug pretty much makes it impossible to use the card daily as is
> since I do connect/disconnect monitors often, especially due to VFIO usage.
>   
> 2. I found out that running without the new DC framework (amdgpu.dc=0) solves
> issue 1 completely (but costs HDMI sound - HDMI sound only works with amdgpu.dc=1)
>
> I am using this card like that for about at least half an year and haven't had
> a single connector plug/unplug related crash.
>
> Issue 2 however is that in this mode (I haven't tried to reproduce this
> with amdgpu.dc=1 yet), sometimes when I unbind the amdgpu driver
> the amdgpu complains about a leaked connector and crashes a bit later on.
> I haven't yet tracked the combination of things needed
> to trigger this, but it did happen to me about 3 times already.
>   
> I did put a WARN_ON(1) to __drm_connector_put_safe, to see who
> is the caller that triggers the delayed work that frees the connector when it is
> too late.
>
> I attached a backtrace with the above WARN_ON and the crash (connector_leak_bug.txt)
> I also attached the script 'amdgpu_unbind' for the reference that I use to unbind
> the amdgpu driver.
>   
> 3. When doing VFIO passthrough of this card, I found out that it doesn't
> suffer that much from the reset bug. As long as I shut down the guest
> in clean manner, I can start it again). The vendor_reset module however
> makes the reset work even when I shut down the guest right in the middle
> of a 3D app running and I tested it many times.
>   
> _However_ this only works if I never load the amdgpu linux driver.
> Otherwise a windows guest still boots but all 3D apps in it crash very early.
>
> I tried both the stock drivers that windows auto installs and latest AMD
> workstation drivers from AMD site.
>
> Linux guests do work.
>   
> I found out that amdgpu driver resizes the device bars (I have TRX40 platform,
> so I don't know if this platform supports the AMD Smart Memory or not,
> but according to lspci the device does support resizable BARs).
>
> If I patch the amdgpu's bar resize out, then, the windows guest _does_ work
> regardless if I loaded amdgpu prior or not. Linux guests also still work.
> I haven't measured the performance impact of this.
>
> For debugging this, I did try to hide the PCI_EXT_CAP_ID_REBAR capability
> from the VM, but it made no difference.
>
> I suspect that once the GPU is resetted, the bars
> revert to their original sizes, but VFIO uses the sizes that are cached
> by the kernel, so that the guest thinks that the bars are of one size
> while they are of an another. I don't have an idea though why this
> does work with a Linux guest.
>
> I had attached the pci config with amdgpu running, once with my patch that
> stops it from resizing the bars, and once without that patch for reference.
> (amdgpu_pciconfig_noresize.txt, amdgpu_pciconfig_resize.txt)
>
>
> 4. I found out that amdgpu runtime PM sometimes breaks the card if last
> output is disconnected from it. I didn't debug it much as I just disabled
> it with amdgpu.runpm=0) I will do more debug on this later.
>   
>
> Please let me know if you have any questions,
> Don't hesitate to ask me for more information.
>
> My setup:
> 3 outputs, all HDMI, converted with DP->HDMI adapters, of which 2 are 1080P
> monitors, and 1 is a 1080P TV. The issues I describe above are reproducible
> on all the outputs.
>
>
> I am running 5.10.0 kernel with few patches and kvm-queue branch
> merged for my day to day work on KVM.
>   
> You can find the exact kernel I use and its .config on
> https://gitlab.com/maximlevitsky/linux/-/commits/kernel-starship-5.10
>   
>
> Best regards,
> 	Maxim Levitsky
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------C3B739F6FD0F2314864E9293
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Maxim,<br>
      <br>
      I can't help with the display related stuff. Probably best
      approach to get this fixes would be to open up a bug tracker for
      this on FDO.<br>
      <br>
      But I'm the one who implemented the resizeable BAR support and
      your analysis of the problem sounds about correct to me.<br>
      <br>
      The reason why this works on Linux is most likely because we
      restore the BAR size on resume (and maybe during initial boot as
      well).<br>
      <br>
      See this patch for reference:<br>
      <br>
      commit d3252ace0bc652a1a244455556b6a549f969bf99<br>
      Author: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
      Date:&nbsp;&nbsp; Fri Jun 29 19:54:55 2018 -0500<br>
      <br>
      &nbsp;&nbsp;&nbsp; PCI: Restore resized BAR state on resume<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; Resize BARs after resume to the expected size again.<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; BugLink: <a class="moz-txt-link-freetext" href="https://bugzilla.kernel.org/show_bug.cgi?id=199959">https://bugzilla.kernel.org/show_bug.cgi?id=199959</a><br>
      &nbsp;&nbsp;&nbsp; Fixes: d6895ad39f3b (&quot;drm/amdgpu: resize VRAM BAR for CPU
      access v6&quot;)<br>
      &nbsp;&nbsp;&nbsp; Fixes: 276b738deb5b (&quot;PCI: Add resizable BAR infrastructure&quot;)<br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Christian König
      <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Bjorn Helgaas <a class="moz-txt-link-rfc2396E" href="mailto:bhelgaas@google.com">&lt;bhelgaas@google.com&gt;</a><br>
      &nbsp;&nbsp;&nbsp; CC: <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # v4.15+<br>
      <br>
      <br>
      It should be trivial to add this to the reset module as well. Most
      likely even completely vendor independent since I'm not sure what
      a bus reset will do to this configuration and restoring it all the
      time should be the most defensive approach.<br>
      <br>
      Let me know if you got any more questions on this.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 02.01.21 um 23:42 schrieb Maxim Levitsky:<br>
    </div>
    <blockquote type="cite" cite="mid:4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">Hi!

I am using this card for about a year and I would like first to say thanks
for open source driver that you made for it, for the big navi
and for the threadripper which brought back fun to the computing.

I bought that card primary to use as a host GPU in VFIO enabled multi-seat
system I am building, and recently I was able (with a minor issue I managed to 
solve, more about it later) to pass that GPU to both linux and windows guest 
mostly flawlessly.
 
I do have experience in kernel development, and debugging so I am willing
to test patches, etc. Any help is welcome!
 
So these are the issues:
 
1.(the biggest issue): The amdgpu driver often crashes when plugging an input.

I tested this now on purpose with 'amdgpu.dc=1' by slowly plugging and unplugging 
an input connector while I wait for the output to stabilize between each cycle, 
and still the issue reproduced after a dozen (or so) tries.
(It only happens when I plug the connector, and never happens when I unplug it)

Then I unloaded the amdgpu driver and loaded it again with dc=0.
This does sort of work but takes a lot of time. The dmesg output is attached 
(amdgpu_dc1_plug_bug.txt)
 
I did try to increase the number of tries in dm_helpers_read_local_edid, to 
something silly like 1000, but no luck.
 
I also tried to remove the code below the
'Abort detection for non-DP connectors if we have no EDID'
Also no luck.


This bug pretty much makes it impossible to use the card daily as is
since I do connect/disconnect monitors often, especially due to VFIO usage.
 
2. I found out that running without the new DC framework (amdgpu.dc=0) solves
issue 1 completely (but costs HDMI sound - HDMI sound only works with amdgpu.dc=1)

I am using this card like that for about at least half an year and haven't had 
a single connector plug/unplug related crash.

Issue 2 however is that in this mode (I haven't tried to reproduce this
with amdgpu.dc=1 yet), sometimes when I unbind the amdgpu driver 
the amdgpu complains about a leaked connector and crashes a bit later on. 
I haven't yet tracked the combination of things needed
to trigger this, but it did happen to me about 3 times already.
 
I did put a WARN_ON(1) to __drm_connector_put_safe, to see who
is the caller that triggers the delayed work that frees the connector when it is
too late.

I attached a backtrace with the above WARN_ON and the crash (connector_leak_bug.txt)
I also attached the script 'amdgpu_unbind' for the reference that I use to unbind
the amdgpu driver.
 
3. When doing VFIO passthrough of this card, I found out that it doesn't
suffer that much from the reset bug. As long as I shut down the guest
in clean manner, I can start it again). The vendor_reset module however
makes the reset work even when I shut down the guest right in the middle
of a 3D app running and I tested it many times.
 
_However_ this only works if I never load the amdgpu linux driver. 
Otherwise a windows guest still boots but all 3D apps in it crash very early.

I tried both the stock drivers that windows auto installs and latest AMD 
workstation drivers from AMD site.

Linux guests do work.
 
I found out that amdgpu driver resizes the device bars (I have TRX40 platform,
so I don't know if this platform supports the AMD Smart Memory or not,
but according to lspci the device does support resizable BARs).

If I patch the amdgpu's bar resize out, then, the windows guest _does_ work
regardless if I loaded amdgpu prior or not. Linux guests also still work.
I haven't measured the performance impact of this.

For debugging this, I did try to hide the PCI_EXT_CAP_ID_REBAR capability 
from the VM, but it made no difference. 

I suspect that once the GPU is resetted, the bars
revert to their original sizes, but VFIO uses the sizes that are cached
by the kernel, so that the guest thinks that the bars are of one size
while they are of an another. I don't have an idea though why this
does work with a Linux guest.

I had attached the pci config with amdgpu running, once with my patch that
stops it from resizing the bars, and once without that patch for reference.
(amdgpu_pciconfig_noresize.txt, amdgpu_pciconfig_resize.txt)


4. I found out that amdgpu runtime PM sometimes breaks the card if last
output is disconnected from it. I didn't debug it much as I just disabled
it with amdgpu.runpm=0) I will do more debug on this later.
 

Please let me know if you have any questions,
Don't hesitate to ask me for more information.

My setup:
3 outputs, all HDMI, converted with DP-&gt;HDMI adapters, of which 2 are 1080P
monitors, and 1 is a 1080P TV. The issues I describe above are reproducible
on all the outputs.


I am running 5.10.0 kernel with few patches and kvm-queue branch 
merged for my day to day work on KVM.
 
You can find the exact kernel I use and its .config on
<a class="moz-txt-link-freetext" href="https://gitlab.com/maximlevitsky/linux/-/commits/kernel-starship-5.10">https://gitlab.com/maximlevitsky/linux/-/commits/kernel-starship-5.10</a>
 

Best regards,
	Maxim Levitsky

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C3B739F6FD0F2314864E9293--

--===============0902341457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0902341457==--
