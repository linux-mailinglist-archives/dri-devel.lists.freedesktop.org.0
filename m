Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56696552FCB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5E10E838;
	Tue, 21 Jun 2022 10:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0A010E838
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKQnR4ZgRljBYDu84DMFG33/m33ximT9XkHUK0W4eockN+b0SeVaXcPWMa4j+cbostnKapphRKtVjgXkqvgTqE266P52UQQXAE1uN5aqiKjgiRYe8Q0nOuykrpOxi34sX7UcfFgcGrchrTVfeeD8c2b1ILzQAUQsuCj8A4QIkr0n3Mx2U30FudooUaRhCuVlc3nsStyFcnGUOYMrJZ0SW2uay5SFmVQCVFIuXxOEzHR6CY0ybx7FZdp0Llkmhk2pu6XwCErvrMgeXTc2jAyGer3RA7xa+JaxaPsgk4TAQZsODJAqm24BdKTTKfacd1aX8z4jnCRXt9SN3ICad2a1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFxizY1th+Fby5QAwY3x/OwntfX0HQ/w6YaKJKrOM0M=;
 b=a1SwsuEFODp7b2bG51/ZJ0kgJ2mU2sjMopH3yK9MvgRaPs3pSVhIQVNe7wQtelzwhn3hMKK83/MdCd16SMQp6FGCOoWY+BOeVgt4LtYX9IAWL6llxjGc+r/UuQNwOQ5eIkIfsceADQcGoQR/r2R3Pd+Wp1dbSorAhk5eJ/oq3tgOrtV8NZ/lJMF2D4+UWfsGdlNw63t+ck4H1XZvkPb6FswcXk1CfJ2iNYM6X8Ngegl0599OxHW+zr4JipQNw4FbEnmLIt7Yd485QJu3H5ENFOdh5YCrq3Od4bHcq5bXzFbb9v+QJbT/nB3M7PnpN41j4jKWq3sfrJFIinowjXBfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFxizY1th+Fby5QAwY3x/OwntfX0HQ/w6YaKJKrOM0M=;
 b=cOgcbji2DpxN+l/sRxXjMEEjstYbclZ1FxNMXju/NjLCEBLaNUjCJ4QCUBL0UrgH104B3bXU1KqGTagl62eizemuugy4K3lPAviNXu+X0UsfoDvIQgFLviwSDS5xu+ZWy8CO66OCxNKPZDNTuAWWDxSxcNp3bd7YqLeOZi8nItg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3193.namprd12.prod.outlook.com (2603:10b6:5:186::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 10:34:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 10:34:24 +0000
Content-Type: multipart/alternative;
 boundary="------------qd7LExAwEx7iH9oGrU0zxQCn"
Message-ID: <39f7f41a-af8d-4700-37da-9401455afb98@amd.com>
Date: Tue, 21 Jun 2022 12:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: "Andy.Hsieh" <andy.hsieh@mediatek.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <cdb508e49eb1439f4e4c327d2a6738f219e04bf8.camel@ndufresne.ca>
 <5822b325-766e-ce3c-50eb-d7f54f14fd0b@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5822b325-766e-ce3c-50eb-d7f54f14fd0b@mediatek.com>
X-ClientProxiedBy: AM5PR0601CA0046.eurprd06.prod.outlook.com
 (2603:10a6:203:68::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 944aa9e5-e934-4931-b812-08da53719c33
X-MS-TrafficTypeDiagnostic: DM6PR12MB3193:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB319393F748343CA0ED0F919883B39@DM6PR12MB3193.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EMxkiWs+CkF5g8MmVoliEy3+rDxoy0BT3dycBLd4X6gWrbMdYECEaA6wkxvLmszVemWOklB3g0mnBeTnadKEbSB0DRSmcPs24goQcNX6d2l2SZlhhgWQlDJpK2o/WtuoNPIo6Wly58DWvhIlb5t+hAo5v+mkHNEqCk+v2RWKMKzubMuIICE7g8K8LDbxih6I5MHoatJGZqE8+IbC4k38M1xJlYIBk+MAGqof06AOOuDSm9ka414JYOOcwPHHG0abvQ6FAX7s9cWD0tY9uIHG6784WDt+lARIogweqzHJgBE9LnbQ+RE9SW5VkYspuKLhSV0Pj5gRPlrbFpyX2UzTeskJrU8ucDLwEAI/tThQoGzbnZvZf7NYkGDjMDLAaGsuRf2B5PsT67byAUyGvKbN+SokWa3NLOyKIErbOEdwa77vd4tpwnASGxIh7EuB/cDDTPgR77EP10cziJg4xh8nuIi0oYJW7ATSAQXW9XvHR9p86KwIaS2DK4YjAWnv5yiYfjiKyO4EjQCbViHMQChk+GYicdV4L4vxPNIR6zBQn/QZuKoKo9kyz5FCO3MaX5OabJgMXhMO2fNEdYI0it9eampCLQgD5mgnSNnGG0tOoVEqFxnETWCWg/s2uORjSJxpD8U6nZmYRgl2bicjbMQBgdC9/TYcoqaEp3YqGmbg5nVNhjTAM6pJJFI/lxM42/mPO93+eXetGrO4eTVgOdZIf6iPt/m8+Bc8AkdspeUpvG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(2616005)(41300700001)(2906002)(83380400001)(8936002)(66574015)(31686004)(26005)(6512007)(186003)(36756003)(53546011)(33964004)(6506007)(6666004)(6486002)(478600001)(66556008)(31696002)(38100700002)(66946007)(110136005)(316002)(54906003)(5660300002)(66476007)(86362001)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmRxY2NJaTRHMVRnRUJZTEpYcmVkSUJ2TVRQUWVmYVJTVVBFSmdqSDFqbWdT?=
 =?utf-8?B?Qmh0c1BpN0VXblpQZDkrRVN3YS9kL1V4Z1pwZjl6MlhFV2pEYXhCRlVFbmR1?=
 =?utf-8?B?dGhodHp1ZFBrcWVQZ2NjZkxrL0tKbzhlT0FKUmlXY1d4WFQ2WHBmVVI0Z0U0?=
 =?utf-8?B?K1ZDZ0dmWFJPd0ErcGRWR0VEdVhqaGl5cnNDSlRrU2lDN0J3NFJzbXRDMktx?=
 =?utf-8?B?UjJ0ZkVPb0drV29vd01sb2tCbDZpNndTcCs5ZFk5eVc4Ymg3YWMxckhmM2RV?=
 =?utf-8?B?WnFWSGs2Nis1S1VYSHNXdDdsZlF5b2RyYkxnQW5vUi9Kd0kwclBXYk1iMTh1?=
 =?utf-8?B?RDAydXJZdjRXRW42S0NBd3B0OEtKaytweDRIRjFnM0E3QlNsZ3BvTFdlU2ZN?=
 =?utf-8?B?elRnTlRYakpVUk0rTVZDUUFkRTMvYUluUXVXOGNwT3NMZit6aUd0M1I1UGQr?=
 =?utf-8?B?ZHBTU201a1MrcFZPbmdaL0V5NGp0dFhVZVNuQXh5TW0zZStSSDVuV3JZK2Zm?=
 =?utf-8?B?NkJNQWZBci9qV1h2ZDRPNXRxaEl4RTJSTitla2tFdkVzSjJXRFByb3dzWVhm?=
 =?utf-8?B?RFRabHVHMGJQUXVwdjdLYlAzSVRjclZ4OTF6N2pyVU5jRURFS1pTRTAxRnJy?=
 =?utf-8?B?OFZTc3BCaEVuQ1RnMGp4Qi85T0NJZEFaeEU2SllOdzMyRnlITHJROTFKODdn?=
 =?utf-8?B?MHBkbXF5V01qRDM0SU9pY1hLRUpmQUZYV1owazZBajMzK1IyaFB1Y2F3SVcy?=
 =?utf-8?B?WXFMVTYyd2xaaWVtbzNUekRzTmdTYW5YY2RRb2JlWkhDQ2hiOFdWYU92TkV1?=
 =?utf-8?B?dVFjNWNFTG9zS0ducndGcEZrSWNhcWlaUWhEVkppaFd0MjBON3lBOVhibkNV?=
 =?utf-8?B?WnhXMGhJV092dlF5TzgveDdqZThHN2Fsc0tsVzh0WEZ2c2ZiMEpCSUJDVFVR?=
 =?utf-8?B?SVBHYVQzNnAwang0NEZnZGhhWDFvTEFjTEVBK0ZmblEvSXQvaGQ5Y1ZjSWM4?=
 =?utf-8?B?N2lKaEREM1prQ05yWm1XQ3dqczJIMXNtZlVFdlRMdnE5SmJoQmVEcGhwUzgy?=
 =?utf-8?B?THh0YlJ0ZllrSmVzMlQ1NGNwYU9UckxXbkhmd3NhbHZCY1NzdXhnd21xT3NX?=
 =?utf-8?B?WVhVdXFkREM4VDFLdHRkOERQbXI2NllXVk5NdmpEdmJMVkp6NWhWcE5oNjVa?=
 =?utf-8?B?YXIvb1BZdXV5OWI5SXBVTHo0SHEzdTRQaGM0MWUvTlp0M2xQTmZNWmRYSFhR?=
 =?utf-8?B?a3IzSlFHQ1hTY3pjclJ6b1QzMUd6VlRvOGJNK2QxcVpxOThFdGowVzFrT1Vv?=
 =?utf-8?B?NTBVMkxWUzVhMXVMbzJwcG5iZUlaNzl1WC9yeVBjMkZTcEkzMnJ1V2EzQmt1?=
 =?utf-8?B?WjE5Z2ZuMEZpMnJ4YVlXRXFucWliU3NEVzJyRmpTK0FPSzUwMDg2cSs2WTFn?=
 =?utf-8?B?T05iOWFFZ1BXdXQydFptWE9GOERPQnVwUXE5MVA2a3dWWkNJdzdyeVl0eTBE?=
 =?utf-8?B?ZWx2QmFHblJpQ0p0N2hXUElwS2RmUjYyaXZDOWlqV2Ntb1RoRCtVSkVyMDlz?=
 =?utf-8?B?SnNmODUwcjlwR0xxWmtYR21KUFROQ05ZRXB0QmMwdVRKU0FxOW13ZzBRaHpo?=
 =?utf-8?B?YzVkMW9pZ0tLakdlMWlzN1g0ZUJvUDhONUR5YU1IKzZVaEJvUU85ZjFDT01k?=
 =?utf-8?B?RjBjZjZRYk9wTnlhKzFLdVh2ODBrZlVBM2RISnJ2bmNLOHVtd0tDMmxCUVlF?=
 =?utf-8?B?azFZZ2x0K3dxOWVVQ2RCam1GNkhYYXNYWE1GeXNDbE5LU09oeHRlTUR0N2Nw?=
 =?utf-8?B?RTN3UHpxaDQ0aFJuYjhEQTIwQ0lyRkxPb1F3bHdHbWNtamVmZjRrWEVuQ2Jl?=
 =?utf-8?B?VFhPZ3R0WlEvVytWNFBVRXd2VG9PRURROEFuTXBEeXNxa0RCYkNnKzBHaDFn?=
 =?utf-8?B?NUM5NVA3d0ljTkhENGJoL2l1bFZMYXFGMFNLSG5mVXNoZEkwOFdVWjEzandT?=
 =?utf-8?B?ODliZFp3K1p6bU04SkZrQzFFd1JnL25IbzhBNUZja0FadnJxV1FhdVozVkJJ?=
 =?utf-8?B?ME5mYmxWZ0FhSkM5dHNaUkF5OFRJSlJ5T1NvNnZDL3hkREpIT09NbHl0RDY1?=
 =?utf-8?B?WmVKN3dDZFN2ZWJVNzB0QXJYTWdMeWpqaEN3U1EvczNXeTc5RkJ5MlhHc0NL?=
 =?utf-8?B?RHBnL1pjcWIxSjNzUkxnUjVJVXBaRHRmcXdJY0JWblh2d0lDWmdnT05ZdkJ6?=
 =?utf-8?B?a29wN2ZEcGhCV0Q4THBHc05IVTNYNVNTRjdCYXNZNlplWVo4NWI4UWFHWUFx?=
 =?utf-8?B?R01ySk5OSTNFVW1Oak9NdXAwSjNiNEFiVTUxOGU4a2lHNXRPN3lidz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944aa9e5-e934-4931-b812-08da53719c33
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 10:34:24.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmDxcl7YiGw1Ceonw5NEavUfhemcFnlrR1DgFSXWz2ExzKJHOpG9RA9m2xX914vL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3193
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------qd7LExAwEx7iH9oGrU0zxQCn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

Am 21.06.22 um 12:17 schrieb Andy.Hsieh:
> On 2/16/21 4:39 AM, Nicolas Dufresne wrote:
> > Le lundi 15 février 2021 à 09:58 +0100, Christian König a écrit :
> >> Hi guys,
> >>
> >> we are currently working an Freesync and direct scan out from system 
> >> memory on AMD APUs in A+A laptops.
> >>
> >> On problem we stumbled over is that our display hardware needs to scan 
> >> out from uncached system memory and we currently don't have a way to 
> >> communicate that through DMA-buf.
> >>
> >> For our specific use case at hand we are going to implement something 
> >> driver specific, but the question is should we have something more 
> >> generic for this?
> > 
> > Hopefully I'm getting this right, but this makes me think of a long standing
> > issue I've met with Intel DRM and UVC driver. If I let the UVC driver allocate
> > the buffer, and import the resulting DMABuf (cacheable memory written with a cpu
> > copy in the kernel) into DRM, we can see cache artifact being displayed. While
> > if I use the DRM driver memory (dumb buffer in that case) it's clean because
> > there is a driver specific solution to that.
> > 
> > There is no obvious way for userspace application to know what's is right/wrong
> > way and in fact it feels like the kernel could solve this somehow without having
> > to inform userspace (perhaps).
> > 
> >>
> >> After all the system memory access pattern is a PCIe extension and as 
> >> such something generic.
> >>
> >> Regards,
> >> Christian.
> > 
> > 
>
> Hi All,
>
> We also encountered the UVC cache issue on ARMv8 CPU in Mediatek SoC when
> using UVC dmabuf-export and feeding the dmabuf to the DRM display by the
> following GStreamer command:
>
> # gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! kmssink
>
> UVC driver uses videobuf2-vmalloc to allocate buffers and is able to export
> them as dmabuf. But UVC uses memcpy() to fill the frame buffer by CPU without
> flushing the cache. So if the display hardware directly uses the buffer, the
> image shown on the screen will be dirty.
>
> Here are some experiments:
>
> 1. By doing some memory operations (e.g. devmem) when streaming the UVC,
>     the issue is mitigated. I guess the cache is swapped rapidly.
> 2. By replacing the memcpy() with memcpy_flushcache() in the UVC driver,
>     the issue disappears.
> 3. By adding .finish callback in videobuf2-vmalloc.c to flush the cache
>     before returning the buffer, the issue disappears.
>
> It seems to lack a cache flush stage in either UVC or Display. We may also
> need communication between the producer and consumer. Then, they can decide
> who is responsible for the flushing to avoid flushing cache unconditionally
> leading to the performance impact.

Well, that's not what this mail thread was all about.

The issue you are facing is that somebody is forgetting to flush caches, 
but the issue discussed in this thread here is that we have hardware 
which bypasses caches altogether.

As far as I can see in your case UVC just allocates normal cached system 
memory through videobuf2-vmalloc() and it is perfectly valid to fill 
that using memcpy().

If some hardware then accesses those buffers bypassing CPU caches then 
it is the responsibility of the importing driver and/or DMA subsystem to 
flush the caches accordingly.

Regards,
Christian.

>
> Regards,
> Andy Hsieh
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

--------------qd7LExAwEx7iH9oGrU0zxQCn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Andy,<br>
    <br>
    Am 21.06.22 um 12:17 schrieb Andy.Hsieh:<br>
    <blockquote type="cite" cite="mid:5822b325-766e-ce3c-50eb-d7f54f14fd0b@mediatek.com">
      
      <pre>On 2/16/21 4:39 AM, Nicolas Dufresne wrote:
&gt; Le lundi 15 février 2021 à 09:58 +0100, Christian König a écrit&nbsp;:
&gt;&gt; Hi guys,
&gt;&gt;
&gt;&gt; we are currently working an Freesync and direct scan out from system 
&gt;&gt; memory on AMD APUs in A+A laptops.
&gt;&gt;
&gt;&gt; On problem we stumbled over is that our display hardware needs to scan 
&gt;&gt; out from uncached system memory and we currently don't have a way to 
&gt;&gt; communicate that through DMA-buf.
&gt;&gt;
&gt;&gt; For our specific use case at hand we are going to implement something 
&gt;&gt; driver specific, but the question is should we have something more 
&gt;&gt; generic for this?
&gt; 
&gt; Hopefully I'm getting this right, but this makes me think of a long standing
&gt; issue I've met with Intel DRM and UVC driver. If I let the UVC driver allocate
&gt; the buffer, and import the resulting DMABuf (cacheable memory written with a cpu
&gt; copy in the kernel) into DRM, we can see cache artifact being displayed. While
&gt; if I use the DRM driver memory (dumb buffer in that case) it's clean because
&gt; there is a driver specific solution to that.
&gt; 
&gt; There is no obvious way for userspace application to know what's is right/wrong
&gt; way and in fact it feels like the kernel could solve this somehow without having
&gt; to inform userspace (perhaps).
&gt; 
&gt;&gt;
&gt;&gt; After all the system memory access pattern is a PCIe extension and as 
&gt;&gt; such something generic.
&gt;&gt;
&gt;&gt; Regards,
&gt;&gt; Christian.
&gt; 
&gt; 

Hi All,

We also encountered the UVC cache issue on ARMv8 CPU in Mediatek SoC when
using UVC dmabuf-export and feeding the dmabuf to the DRM display by the
following GStreamer command:

# gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! kmssink

UVC driver uses videobuf2-vmalloc to allocate buffers and is able to export
them as dmabuf. But UVC uses memcpy() to fill the frame buffer by CPU without
flushing the cache. So if the display hardware directly uses the buffer, the
image shown on the screen will be dirty.

Here are some experiments:

1. By doing some memory operations (e.g. devmem) when streaming the UVC,
   the issue is mitigated. I guess the cache is swapped rapidly.
2. By replacing the memcpy() with memcpy_flushcache() in the UVC driver,
   the issue disappears.
3. By adding .finish callback in videobuf2-vmalloc.c to flush the cache
   before returning the buffer, the issue disappears.

It seems to lack a cache flush stage in either UVC or Display. We may also
need communication between the producer and consumer. Then, they can decide
who is responsible for the flushing to avoid flushing cache unconditionally
leading to the performance impact.</pre>
    </blockquote>
    <br>
    Well, that's not what this mail thread was all about.<br>
    <br>
    The issue you are facing is that somebody is forgetting to flush
    caches, but the issue discussed in this thread here is that we have
    hardware which bypasses caches altogether.<br>
    <br>
    As far as I can see in your case UVC just allocates normal cached
    system memory through videobuf2-vmalloc() and it is perfectly valid
    to fill that using memcpy().<br>
    <br>
    If some hardware then accesses those buffers bypassing CPU caches
    then it is the responsibility of the importing driver and/or DMA
    subsystem to flush the caches accordingly.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:5822b325-766e-ce3c-50eb-d7f54f14fd0b@mediatek.com">
      <pre>

Regards,
Andy Hsieh

</pre>
      <!--type:text--><!--{-->
      <pre>************* MEDIATEK Confidentiality Notice ********************
The information contained in this e-mail message (including any 
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be 
conveyed only to the designated recipient(s). Any use, dissemination, 
distribution, printing, retaining or copying of this e-mail (including its 
attachments) by unintended recipient(s) is strictly prohibited and may 
be unlawful. If you are not an intended recipient of this e-mail, or believe 
that you have received this e-mail in error, please notify the sender 
immediately (by replying to this e-mail), delete any and all copies of 
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
</pre>
      <!--}--></blockquote>
    <br>
  </body>
</html>

--------------qd7LExAwEx7iH9oGrU0zxQCn--
