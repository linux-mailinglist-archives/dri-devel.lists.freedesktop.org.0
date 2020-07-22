Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E279F229208
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CBC6E5CE;
	Wed, 22 Jul 2020 07:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383DE6E5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 07:20:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLYwQO/0GTnYYWJDdR/WH781OVSDeGPiTlF07gdLco9VMlRi0KZj2/ZEGKvZfZ7eeQVYCX8trUaSSPXJhaabwuGoPU0JOb/ylpbuudurlxVZp+TDj0gTCq+mUkk40r+0bZNiPG5erBWSi1vtxwgYpO7ns6UFCxGNorZRDKYoBgTOPUkT2asD1eTv6k5j+93F/iX0zycUfgOeP4F8bOQhhoWVchZupwkdhi3M0LlExN/janIZgoUF6g5/xfbxpp0mw1KrBaaz0YUQ6rwe6Smtj5xSWH58+70YBfHQdLkuQ/Qy6MuV4KkBmONT3OQG0qQmjJ8vFelymDxW0MQLubULOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0EnvtdGPfOVB4fdjljrxwOxpiR6guvzuS9UiqLGgZ8=;
 b=lxK/PpOEl/l+vPAK0Hx/bobyvVBNMzZM/m1u1l3sZNAXUHhUDWE8qIUwVogu4RE3yPWhYsN9bArZdYNksef204/0JHxU4hkrzRAsXzibNmJSHIS4anSZTGyjjIZb+aAU5QA5cehajkAsPZJFj17h+IUQvZTTWA0/6wRNQK9eVpwG9gCW27Wa2XFNaS409vkGt0dvV/tj1QMuDNpd3MOfbr9JmoYJ4ro+r9PDw2pQr4XOI6eXllOkuWOElY6AD2WkqUh3ehkPuFuzRIE/U4SEg8iWKMxwrT/CycA/fxxsTs/XgxOLWU813gRB987yhqT6rM+K3QjuaHpPRZrjKmAZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0EnvtdGPfOVB4fdjljrxwOxpiR6guvzuS9UiqLGgZ8=;
 b=whaY3e5V497AQR7BwZhmCjXTkXvw8HK1XcbZ6fieTESKox0vjvkPyEO4S+3WMHfe2C7bzxrT6fAiMbCCKh1fcwM+MoUl9QHthu7mGrGwbs0d0zLPhGdv0Y8ZqO5ftT9BhUwGvvtTLFgWoT6b0a3CK26DG8QfGNvGxYm++ToB3OU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 22 Jul
 2020 07:20:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Wed, 22 Jul 2020
 07:20:31 +0000
Subject: Re: pages pinned for BO lifetime and security
To: Gurchetan Singh <gurchetansingh@chromium.org>
References: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
 <CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com>
 <ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <65438234-32b9-7d32-2505-b367b8dfe967@amd.com>
Date: Wed, 22 Jul 2020 09:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Wed, 22 Jul 2020 07:20:29 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f80c579-4750-4784-bd4e-08d82e0fb6c5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43352388D9BE4ABD2B42252A83790@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lH/QgqdqXGdIlpIbC6Tv0uVojU/j4d9xkfdh9vQC5lSy4RAJ6rICeIaBXHnnIIfbNZd8eLOB3cIKqKfm9E3QzcgSrGidv2zAUwkgBPQJ2OxbDJwlcyWxXLmWMay7gVFOrd8TNWRvtqXRvxYn1qmO7nZc/rjupTIVkQmVNA8A6M/AEGagiUAmslhs8GZg/UQ6XHcxcZasI33k5PZ8GtX6cfUO2buT3yAHvGkn/Rk58YOqSohvzp1B31pTVz3/jgzPHZ0knxTrjeL6fp7OrcZOoR2M68vs5w4egxESChhX+kPwyF1ZplEQqXxALmEeeow4IKRP7T7x7iUUJ3gCqwOwrkFLzXBYFvqLM695SoPjukhVvQvwUf3w6RF+CdzQYPPLDqh2uVUUM0mjIBAIQpErvBgKuy9EiZGs3yOgFdUsER394nS+BReUsQTp9ok9lq927kNHGHX0IHEhUtvTq1qhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39850400004)(136003)(376002)(366004)(346002)(5660300002)(316002)(54906003)(53546011)(33964004)(166002)(36756003)(52116002)(4326008)(31696002)(86362001)(2616005)(478600001)(45080400002)(186003)(16526019)(966005)(6666004)(66574015)(8936002)(66556008)(66476007)(6486002)(31686004)(15650500001)(2906002)(83380400001)(6916009)(8676002)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YC8xeoLsfN7JgC5FFNoAvVsl5LvTlpqwNIAF40dqnSx1tecEXPHwndlyyjX4P6HRQbnerxv39i4U6+i9Hmv8zFuNX3aazGVdDSs+D9xcAzJbRhwG5nzi5RIvSar2drqCYhA8YVmgTWxVB1JU73wbCk3oMes7vqjB3DaNrFZvcyj3Y2GoGvKif/ZNawdCAGENdG/yEaitGVptvFCMv5A9y0ZKqYpFhrk6QI4kXRCAingmQatRiv15yZbKp1NnGeBi06ZWcPtvvGoir/dbvi5xyspT4uHjWJXFTZX2XMLL6czsECGOGDKGCISRIw/+IUta0FPG/Pv+tiG/4DMtKk4md15EJ84wm3+5JNtmoga840XLutyqyx4ZbLeAYUnRBB5d+e1P172jCBwQV4I8HIwKEnoxEUYFcVmPPCmkKOJAAJHmTw0MUNygJdp9dijVktVAZ+zExuBFPCflqeoj6TY2PswbOAj/RGxMj8UTV3VQ4tpaH9pr/59rJDphHlBfJqmhXeDL8zY445wlNR5jxHdvsHVzDeUAvd2uTN3jDvzLllB9XzugWR+bm8UdfC4SGGYn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f80c579-4750-4784-bd4e-08d82e0fb6c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 07:20:30.4871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZV7ReBDWEPApn2mhpqhdzeA3lWQQT5zZMbSshsSa1msm6cKwRcCSX0Cm81vduIuG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2113413150=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2113413150==
Content-Type: multipart/alternative;
 boundary="------------4A1BCE2E3EF86C76FFB049E0"
Content-Language: en-US

--------------4A1BCE2E3EF86C76FFB049E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.07.20 um 09:19 schrieb Christian König:
> Am 22.07.20 um 02:22 schrieb Gurchetan Singh:
>> +Christian who added DMABUF_MOVE_NOTIFY which added the relevant blurb:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/Kconfig#n46 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fdma-buf%2FKconfig%23n46&data=02%7C01%7Cchristian.koenig%40amd.com%7C5a933ce308c94d852d9708d82dd55ba6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637309742143442589&sdata=ynsmCVRnd28gmcvQwd8PMAH3838RzbREu0ZfWUdpPpU%3D&reserved=0>
>>
>> Currently, the user seems to amdgpu for P2P dma-buf and it seems to 
>> plumb ttm (*move_notify) callback to dma-buf.  We're not sure if it's 
>> a security issue occurring across DRM drivers, or one more specific 
>> to the new amdgpu use case.
>>
>> On Tue, Jul 21, 2020 at 1:03 PM Chia-I Wu <olvaffe@gmail.com 
>> <mailto:olvaffe@gmail.com>> wrote:
>>
>>     Hi list,
>>
>>     virtio-gpu is moving in the direction where BO pages are pinned for
>>     the lifetime for simplicity.  I am wondering if that is considered a
>>     security issue in general, especially after running into the
>>     description of the new DMABUF_MOVE_NOTIFY config option.
>>
>
> Yes, that is generally considered a deny of service possibility and so 
> far Dave and Daniel have rejected all tries to upstream stuff like 
> this as far as I know.
>
> DMA-buf an pinning for scanout are the only exceptions since the 
> implementation wouldn't have been possible otherwise.

Or better say for scanout pinning is a hardware requirement. For DMA-buf 
we obviously can have a better approach :)

Christian.

>
>>
>>     Most drivers do not have a shrinker, or whether a BO is purgeable is
>>     entirely controlled by the userspace (madvice).  They can be
>>     categorized as "a security problem where userspace is able to pin
>>     unrestricted amounts of memory".  But those drivers are normally
>>     found
>>     on systems without swap.  I don't think the issue applies.
>>
>
> This is completely independent of the availability of swap or not.
>
> Pinning of pages in large quantities can result in all kind of 
> problems and needs to be prevented even without swap.
>
> Otherwise you can ran into problems even with simple I/O operations 
> for example.
>
>>
>>     Of the desktop GPU drivers, i915's shrinker certainly supports
>>     purging
>>     to swap.  TTM is a bit hard to follow.  I can't really tell if amdgpu
>>     or nouveau supports that.  virtio-gpu is more commonly found on
>>     systems with swaps so I think it should follow the desktop practices?
>>
>
> What we do at least in the amdgpu, radeon, i915 and nouveau is to only 
> allow it for scanout and that in turn is limited by the physical 
> number of CRTCs on the board.
>
>>
>>     Truth is, the emulated virtio-gpu device always supports page moves
>>     with VIRTIO_GPU_CMD_RESOURCE_{ATTACH,DETACH}_BACKING.  It is just
>>     that
>>     the driver does not make use of them.  That makes this less of an
>>     issue because the driver can be fixed anytime (finger crossed
>>     that the
>>     emulator won't have bugs in these untested paths).  This issue
>>     becomes
>>     more urgent because we are considering adding a new HW command[1]
>>     where page moves will be disallowed.  We definitely don't want a HW
>>     command that is inherently insecure, if BO pages pinned for the
>>     lifetime is considered a security issue on desktops.
>>
>
> Yeah, that's probably not such a good idea :)
>
> Regards,
> Christian.
>
>>
>>     [1] VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
>>     https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/include/uapi/linux/virtio_gpu.h#L396
>>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fvirgl%2Fdrm-misc-next%2F-%2Fblob%2Fvirtio-gpu-next%2Finclude%2Fuapi%2Flinux%2Fvirtio_gpu.h%23L396&data=02%7C01%7Cchristian.koenig%40amd.com%7C5a933ce308c94d852d9708d82dd55ba6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637309742143452581&sdata=u90WUaJnVMDpc3SzFGHVt9Fjh5laqTr%2BxlFXbLYjp6s%3D&reserved=0>
>>
>


--------------4A1BCE2E3EF86C76FFB049E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 22.07.20 um 09:19 schrieb Christian
      König:<br>
    </div>
    <blockquote type="cite" cite="mid:ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com">
      
      <div class="moz-cite-prefix">Am 22.07.20 um 02:22 schrieb
        Gurchetan Singh:<br>
      </div>
      <blockquote type="cite" cite="mid:CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com">
        
        <div dir="ltr">+Christian who added DMABUF_MOVE_NOTIFY which
          added the relevant blurb:<br>
          <br>
          <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fdma-buf%2FKconfig%23n46&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C5a933ce308c94d852d9708d82dd55ba6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637309742143442589&amp;sdata=ynsmCVRnd28gmcvQwd8PMAH3838RzbREu0ZfWUdpPpU%3D&amp;reserved=0" originalsrc="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/Kconfig#n46" shash="yyaoe2hSEpCmz9gS2ABf68G75NegfDtXQm3ItoR77iWnl+h6sCCgSSEIGOCBjWjVf1bkpl3AKQ0QPsuk6oUAceH0wPQHlMvOTW1cwcqxeCM0lEMf/jaCXJnobjOdnvoUaKNNqT5gJkLxekf8X6iJf2vdFXXVFCGLwRsmLtVCDuU=" target="_blank" moz-do-not-send="true">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/Kconfig#n46</a><br>
          <br>
          Currently, the user seems to amdgpu for P2P dma-buf and it
          seems to plumb ttm (*move_notify) callback to dma-buf.&nbsp; We're
          not sure if it's a security issue occurring across DRM
          drivers, or one more specific to the new amdgpu use case.<br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jul 21, 2020 at 1:03
            PM Chia-I Wu &lt;<a href="mailto:olvaffe@gmail.com" target="_blank" moz-do-not-send="true">olvaffe@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi list,<br>
            <br>
            virtio-gpu is moving in the direction where BO pages are
            pinned for<br>
            the lifetime for simplicity.&nbsp; I am wondering if that is
            considered a<br>
            security issue in general, especially after running into the<br>
            description of the new DMABUF_MOVE_NOTIFY config option.<br>
          </blockquote>
        </div>
      </blockquote>
      <br>
      Yes, that is generally considered a deny of service possibility
      and so far Dave and Daniel have rejected all tries to upstream
      stuff like this as far as I know.<br>
      <br>
      DMA-buf an pinning for scanout are the only exceptions since the
      implementation wouldn't have been possible otherwise.<br>
    </blockquote>
    <br>
    Or better say for scanout pinning is a hardware requirement. For
    DMA-buf we obviously can have a better approach :)<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com"> <br>
      <blockquote type="cite" cite="mid:CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"> <br>
            Most drivers do not have a shrinker, or whether a BO is
            purgeable is<br>
            entirely controlled by the userspace (madvice).&nbsp; They can be<br>
            categorized as &quot;a security problem where userspace is able
            to pin<br>
            unrestricted amounts of memory&quot;.&nbsp; But those drivers are
            normally found<br>
            on systems without swap.&nbsp; I don't think the issue applies.<br>
          </blockquote>
        </div>
      </blockquote>
      <br>
      This is completely independent of the availability of swap or not.<br>
      <br>
      Pinning of pages in large quantities can result in all kind of
      problems and needs to be prevented even without swap.<br>
      <br>
      Otherwise you can ran into problems even with simple I/O
      operations for example.<br>
      <br>
      <blockquote type="cite" cite="mid:CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"> <br>
            Of the desktop GPU drivers, i915's shrinker certainly
            supports purging<br>
            to swap.&nbsp; TTM is a bit hard to follow.&nbsp; I can't really tell
            if amdgpu<br>
            or nouveau supports that.&nbsp; virtio-gpu is more commonly found
            on<br>
            systems with swaps so I think it should follow the desktop
            practices?<br>
          </blockquote>
        </div>
      </blockquote>
      <br>
      What we do at least in the amdgpu, radeon, i915 and nouveau is to
      only allow it for scanout and that in turn is limited by the
      physical number of CRTCs on the board.<br>
      <br>
      <blockquote type="cite" cite="mid:CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"> <br>
            Truth is, the emulated virtio-gpu device always supports
            page moves<br>
            with VIRTIO_GPU_CMD_RESOURCE_{ATTACH,DETACH}_BACKING.&nbsp; It is
            just that<br>
            the driver does not make use of them.&nbsp; That makes this less
            of an<br>
            issue because the driver can be fixed anytime (finger
            crossed that the<br>
            emulator won't have bugs in these untested paths).&nbsp; This
            issue becomes<br>
            more urgent because we are considering adding a new HW
            command[1]<br>
            where page moves will be disallowed.&nbsp; We definitely don't
            want a HW<br>
            command that is inherently insecure, if BO pages pinned for
            the<br>
            lifetime is considered a security issue on desktops.<br>
          </blockquote>
        </div>
      </blockquote>
      <br>
      Yeah, that's probably not such a good idea :)<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      <blockquote type="cite" cite="mid:CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"> <br>
            [1] VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB<br>
            <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fvirgl%2Fdrm-misc-next%2F-%2Fblob%2Fvirtio-gpu-next%2Finclude%2Fuapi%2Flinux%2Fvirtio_gpu.h%23L396&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C5a933ce308c94d852d9708d82dd55ba6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637309742143452581&amp;sdata=u90WUaJnVMDpc3SzFGHVt9Fjh5laqTr%2BxlFXbLYjp6s%3D&amp;reserved=0" originalsrc="https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/include/uapi/linux/virtio_gpu.h#L396" shash="ulg+yfZNfs/CnDBw+4UbI7ZmvExEa9IOR/hAuciCSBshHcDSj5J9plFAwahuQsLXy+TC9/d3rFFC+iiGAImJLe+trO+Og2B7ldlHV6zvFP0KfQQelCqWKWI/PE9eMpP9j83dVHRUKAsD1IIwWyB57/6rZJVClkOeVbTm7PVXWpw=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/include/uapi/linux/virtio_gpu.h#L396</a><br>
          </blockquote>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------4A1BCE2E3EF86C76FFB049E0--

--===============2113413150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2113413150==--
