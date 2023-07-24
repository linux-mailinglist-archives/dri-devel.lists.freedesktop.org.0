Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6AC760248
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 00:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826DA10E0EB;
	Mon, 24 Jul 2023 22:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3AA10E0EB;
 Mon, 24 Jul 2023 22:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RO4cSqxteJC6rdphfCg+hCfT0SKAakIJmd52Ai/HohwQBUrIHJJdslyRJXym+LEoH7S1d8O+MibOqU5EfsJiMlpyh8OjySRHDhfP+LbXxyFjcjYRGjBudLzQl2PlZ71QoYAPD4hqFnMFlzqupPzQM3GRhA/dExIKDKX+/XCYYfdoLZX5aOEvLiTq5Rw/8ldwXje+Yv8IHJKq8HfLP19YvObb30Rb/lToUyzySVU0mOlMiPaSRHQ4BIpKIgGif8vnmFQDNCbOYTykQrEpKeUmvIaFin1B+Cf/k8RwZHpBdX2LHrnuZrwdE3fI2U/UCPgWRs1LSyfwWUjO97g7IjoNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn307u23PHIh2wp0P8GeZmS/qTgWPkKQvnOQun/mhCI=;
 b=UMeKy1qFVhg4wAi3tOE5ANFaXCTk5Lm3KBr1nQ+PW6eP+PZDkFlKcFcZNBbWw37G/KPmPaTFcVQXcAT44HsueALnBS1ztOzIIEwmOR/HCp+ZusnE4WtRHkaovVRBervqiIUnoI07SEbR93niySbOtcADxaekMHN4VWorWNwmJLyIcZd9W3611Bmk40CLbqR7VM8Ux/3yawbaYgUqeCASkOy/EDuRWGMJCX349ilKb3QQRarNrpKTMQ5TK0s0G8zpz1J7+hpSvJTbRf514P+vuw35R65FNomwhUUhl7e04IzyUFLUkq+6FZXpstqgVslzT+9IPlFC7/RsgUY84zjM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn307u23PHIh2wp0P8GeZmS/qTgWPkKQvnOQun/mhCI=;
 b=yC1x5iNUeiNssZ8zElpXbi10koQqvkfwfUBGBI3KT1xc4wBieQtzaa6r8XSYNAGSIMZf0Uyt7osQw4FVBy+aSYCSAG3vJ51JDNg9Tl9ihs5br+ryLDZfsr+URHjv4GDsntO40MJsCCzwKV7htNtJCLcRt5el98UtUnauxEOMpk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by SA1PR12MB8918.namprd12.prod.outlook.com (2603:10b6:806:386::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 22:29:34 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::796c:5cd4:2050:65ca]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::796c:5cd4:2050:65ca%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 22:29:34 +0000
Content-Type: multipart/alternative;
 boundary="------------X4034xdGwFVEVzp1pfDL2mId"
Message-ID: <6f101468-59ff-fb6f-13e9-87775457ae1d@amd.com>
Date: Mon, 24 Jul 2023 18:29:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20230724211428.3831636-4-michal.winiarski@intel.com>
X-ClientProxiedBy: YQZPR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::28) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|SA1PR12MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbb04b7-a1f2-4619-230c-08db8c9574bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3FIxY10tnu0FMMguVg9P1AhWm0i1Tl5hMp9L7Qizy0XLslhhG3lII8kmjiF+l0HRNKMYkOmT3ZAsuLtqf5NWe7jN/aVEhsJ2zjPr+QwgdlmoNb2qHgs7XsCios5eGXQYW13zDKAthFw+qF+xxkR2tuV56ft88+W+yZ43sBZUhXf3W4sMpGyZEBuij5MeYxo2SCTM7ol5zkpc4D3/XIsT/g3woZOQRwO3uTdw/WuBLYjR21pn0JoVFHr3Cc1RwNOz6PD/Zell75LZK+KEZQWYA0/bSHmu7Y+5BGCbhE3nozLg8XcKx0F/AHUcRSxhCwNPtJp9NSLMWcUxXjAVx3Fm95UEtlZqlHguQ+DWEvbWBB6PKyDecLJhBcgrW1FIIh/Lt3jk6IyzYbOvssM3PE1d93gAvQCx+gbKedr1l8EsQemQkCSlWG06AIJDXuLSbFp2Plbn9uK+hrRCwvK8t6Yz8CRe+79JPvFNRT+h2HMdWGmS6BNh/8tSg8loHFU47FQ3GP01TtI1GVDyHRzGjI4jZwhdaHGMdZWnq2FCp/sICaPnlIZ/DLkKdtFgcuwla6vPthYBQY+GlRsgwh9+4PqDTT0/xz95juGnXO3qWByWu/QP8ITpFtxlJKVuiGYtL4e6a6ao2Mb2qY/3XI9BcSYsqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(38100700002)(66556008)(66946007)(53546011)(36756003)(2616005)(83380400001)(7416002)(6512007)(8676002)(8936002)(5660300002)(54906003)(478600001)(66476007)(4326008)(316002)(41300700001)(186003)(26005)(6506007)(33964004)(6486002)(6666004)(36916002)(2906002)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3QrMUZtWFAweXkyQmppRjFPVFJPMURBYWtqN3BuWkl5MGxoQUVNYlEzREpw?=
 =?utf-8?B?L2xYaFU2NGJ2eFRnMFVCcmpOY05VTktiQldyTXlJY1hiT2c4M3VrYy9aRkov?=
 =?utf-8?B?QlRrRjE2ejVxTWdiaTh1Wkk1WXBFcHhiNCtjTzA4NGtBWHB1UU9JWmY0MW13?=
 =?utf-8?B?TGI3Mi9DZVU3aHBER0RWVGZ5Q3FzNHdYb2ZIeVFDckI5R09OTTRWQWdQZFAx?=
 =?utf-8?B?VE1xZVNvTWdDdnRic3lmNCtDS0lkZThZYTB0cGM3bnJZUHFzcmVYSG5kNTBX?=
 =?utf-8?B?SXhhRi90ZEF0elFVRFVLU29iRnZIYWlWWlIzTHM4RXJQb2JZTkR0eXVvSWZu?=
 =?utf-8?B?bVU5UkFhQVhqUUFqZm5lbWJnMEx5YURMSUhFaXJuZEEzZlZ0SGpoTXBJeUd4?=
 =?utf-8?B?RVYyTUdlekJKclQrZk1xNHJhUkJjS0xoeC8zbUJJK2Q0Y0JibThTQWR1Z0Nh?=
 =?utf-8?B?NjNxclhlWDZkdnRXU01QRlZYcXlWejNXTTNQdXlnU01SSFBROXJTWTBtVC8y?=
 =?utf-8?B?YTBGWHE2cGJYMVVxekxYTmc5R29TTjhHQkliTmJtZlZWdDlZMThHallLMEdF?=
 =?utf-8?B?Tkt1eTJTUDVseFdYWWNQMW1BRkV1WFV5YjllWEZmYkZiMDhaZ1lWNmVoUVBm?=
 =?utf-8?B?Skh1bUtZWnEvOWFCUlJ4NmJ2UXVJZnF6bHU3bndac25pcXBPOFlvUWh1RU1i?=
 =?utf-8?B?c210MzhDYUtBaE4wdkNJVUk3YlRVR1l4VlRvTWhLcjJhejZGSmdwWlR6YUJh?=
 =?utf-8?B?RE9iVGxTcUxTSXN4d1ZPYzJQcGw0b21uZkNaazR3VXdvVTQ4cmZQN09EME9s?=
 =?utf-8?B?elVqemttNTZJQTdFdkJybVRMcnQvUjBLRkVFTHg5Q1R5bEgyanN1OEZNWHZu?=
 =?utf-8?B?cng3R211a3Q5VGswa09aMGNjT042eGRuQVdRY3cvQzkxWUovbUVueXJXM2xS?=
 =?utf-8?B?WUpNVDVwK0JBeXlnRDlPdlJwMzBGWWVnbFdST1Nyd3JYeEFuYmVoUWFPbGd3?=
 =?utf-8?B?TU4yQnJ1c1FUU29LU3BnOXhYd2YzYnBDcHdydEEwaGNzdWRwMEtoaFhJck1C?=
 =?utf-8?B?RHJIMlBjUHZxUWJxTE12L2lKNGZuMGRWMjJLSTgwQ2JBeEdoYUNCVERQeTZK?=
 =?utf-8?B?Y3VrTDFvbWI2MCtmNFZuYWM4K2hoSUZEUGhYUkIzMGJFOWFMMFB6UFlLK0h0?=
 =?utf-8?B?S2JKeVVuOTRBTlQ1M25XNmJJbjFFdzU0YmN0K3JMN3kxRlY4VTl3czhzMXJY?=
 =?utf-8?B?M2pENmQwRWUzc1NFWWtzaG4xRFNwd1E3RStXS01JaVdWd1lUcUVGWjgrNjdy?=
 =?utf-8?B?aVlGd3VxUTgya2ZQS3FJSGFnNHZzdkdrUnVteUhDamhaR3k1YmRTdnRZSndO?=
 =?utf-8?B?NDBoTnZZSjl2eW5SdzhGNE9HbXI5bXVMRmptTjNVMng3MC8xcmpyT3BaMHVY?=
 =?utf-8?B?Y004c1B1T1FjdGcwaEZZeEZaeXFNZkNmQ1JsMG1wUGR6SS9lTmVHUUtkbjNq?=
 =?utf-8?B?eVk2WXgwY2xhaXdMZXRyMUlPVVJ6cTcrYXJ0MVBoNTdUTFZZcGxpbWZrOFJD?=
 =?utf-8?B?WnBEMXF1eTlMUjE0TkZmTVgzUldQL1k3VkdDc2d4Myt5cU5zVG5YeUFlUDRK?=
 =?utf-8?B?NER6eGRubjd0WTJ2b29DUENjVEZ5eGRMTVpGVHN0dGRYbkxrdVpSaFlEUEZG?=
 =?utf-8?B?QTQ1Z0VKUUVVSXAzSmh0ZHAyeFdkR2J3aXR5TGloZnphNTBDNmFzTTNrQ2dL?=
 =?utf-8?B?cmlpMVhweDhkaEVzZENRdG81cGN4N29OVlBKcHlQNGdobkVWRFRBMDdKbVY3?=
 =?utf-8?B?ZG9EV1czV0hKRVczV1Y2d3VlOXc2Yzg1OXZvaDZvRmF4TXN2OUhacFB4SVFO?=
 =?utf-8?B?aWx2eTNRT2EyOHV3bEhyS1JTN1pmZ1BHYzEvNHBCTnZIdnEwVG5QN3F0NFRq?=
 =?utf-8?B?NHlGV1hXUS93ZkJzR2YxUkJpRUpZWDlSblJZaTd5ZkM5ZlZKdU4veW1JeGpo?=
 =?utf-8?B?Y3BPYlhDZU1reWtQeEVuVnJxR3Q4V1FaM1ZMa3VpWDdRSDZzRU0vTHMzc2F4?=
 =?utf-8?B?enRsQVQySjZpb1NNT1pNN2N3cnFNZlZSaElMU3FGUU5rOStPM2Era0Z5WlBv?=
 =?utf-8?Q?5psz8g0HXrstI8nDrO6DvIdG4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbb04b7-a1f2-4619-230c-08db8c9574bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 22:29:34.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN/p9dEt/xRk2w7Drhi+FlYl6e06fTUicPJAplILeH0vsWEbjcuty4dcpDyJU/U+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8918
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------X4034xdGwFVEVzp1pfDL2mId
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-07-24 17:14, Michał Winiarski wrote:
> Having a limit of 64 DRM devices is not good enough for modern world
> where we have multi-GPU servers, SR-IOV virtual functions and virtual
> devices used for testing.
> Let's utilize full minor range for DRM devices.
> To avoid regressing the existing userspace, we're still maintaining the
> numbering scheme where 0-63 is used for primary, 64-127 is reserved
> (formerly for control) and 128-191 is used for render.
> For minors >= 192, we're allocating minors dynamically on a first-come,
> first-served basis.

[JZ] Hello Michal,

Do you have libdrm patches for review together with this change?

Especially to support static int drmGetMinorType(int major, int minor).

Thanks and Best Regards!

James Zhu

>
> Signed-off-by: Michał Winiarski<michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/drm_drv.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 34b60196c443..c2c6e80e6b31 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -121,10 +121,19 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>   	xa_erase(drm_minor_get_xa(minor->type), minor->index);
>   }
>   
> +/*
> + * DRM used to support 64 devices, for backwards compatibility we need to maintain the
> + * minor allocation scheme where minors 0-63 are primary nodes, 64-127 are control nodes,
> + * and 128-191 are render nodes.
> + * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
> + * Accel nodes are using a distinct major, so the minors are allocated in continuous 0-MAX
> + * range.
> + */
>   #define DRM_MINOR_LIMIT(t) ({ \
>   	typeof(t) _t = (t); \
>   	_t == DRM_MINOR_ACCEL ? XA_LIMIT(0, ACCEL_MAX_MINORS) : XA_LIMIT(64 * _t, 64 * _t + 63); \
>   })
> +#define DRM_EXTENDED_MINOR_LIMIT XA_LIMIT(192, (1 << MINORBITS) - 1)
>   
>   static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>   {
> @@ -140,6 +149,9 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
>   
>   	r = xa_alloc(drm_minor_get_xa(type), &minor->index,
>   		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
> +	if (r == -EBUSY && (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER))
> +		r = xa_alloc(&drm_minors_xa, &minor->index,
> +			     NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
>   	if (r < 0)
>   		return r;
>   
--------------X4034xdGwFVEVzp1pfDL2mId
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-07-24 17:14, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230724211428.3831636-4-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">Having a limit of 64 DRM devices is not good enough for modern world
where we have multi-GPU servers, SR-IOV virtual functions and virtual
devices used for testing.
Let's utilize full minor range for DRM devices.
To avoid regressing the existing userspace, we're still maintaining the
numbering scheme where 0-63 is used for primary, 64-127 is reserved
(formerly for control) and 128-191 is used for render.
For minors &gt;= 192, we're allocating minors dynamically on a first-come,
first-served basis.</pre>
    </blockquote>
    <p>[JZ] Hello Michal,</p>
    <p>Do you have libdrm patches for review together with this change?</p>
    <p>Especially to support <span style="color: rgb(137, 136, 141);
        font-family: &quot;JetBrains Mono&quot;, Menlo, &quot;DejaVu
        Sans Mono&quot;, &quot;Liberation Mono&quot;, Consolas,
        &quot;Ubuntu Mono&quot;, &quot;Courier New&quot;, &quot;andale
        mono&quot;, &quot;lucida console&quot;, monospace; font-size:
        12.6px; font-style: normal; font-variant-ligatures: none;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(236, 236, 239); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">static int
        drmGetMinorType(int major, int minor).</span></p>
    <p>Thanks and Best Regards!</p>
    <p>James Zhu <span style="color: rgb(137, 136, 141); font-family:
        &quot;JetBrains Mono&quot;, Menlo, &quot;DejaVu Sans Mono&quot;,
        &quot;Liberation Mono&quot;, Consolas, &quot;Ubuntu Mono&quot;,
        &quot;Courier New&quot;, &quot;andale mono&quot;, &quot;lucida
        console&quot;, monospace; font-size: 12.6px; font-style: normal;
        font-variant-ligatures: none; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(236, 236,
        239); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"></span></p>
    <blockquote type="cite" cite="mid:20230724211428.3831636-4-michal.winiarski@intel.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
---
 drivers/gpu/drm/drm_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 34b60196c443..c2c6e80e6b31 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -121,10 +121,19 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 	xa_erase(drm_minor_get_xa(minor-&gt;type), minor-&gt;index);
 }
 
+/*
+ * DRM used to support 64 devices, for backwards compatibility we need to maintain the
+ * minor allocation scheme where minors 0-63 are primary nodes, 64-127 are control nodes,
+ * and 128-191 are render nodes.
+ * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
+ * Accel nodes are using a distinct major, so the minors are allocated in continuous 0-MAX
+ * range.
+ */
 #define DRM_MINOR_LIMIT(t) ({ \
 	typeof(t) _t = (t); \
 	_t == DRM_MINOR_ACCEL ? XA_LIMIT(0, ACCEL_MAX_MINORS) : XA_LIMIT(64 * _t, 64 * _t + 63); \
 })
+#define DRM_EXTENDED_MINOR_LIMIT XA_LIMIT(192, (1 &lt;&lt; MINORBITS) - 1)
 
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
@@ -140,6 +149,9 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 
 	r = xa_alloc(drm_minor_get_xa(type), &amp;minor-&gt;index,
 		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
+	if (r == -EBUSY &amp;&amp; (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER))
+		r = xa_alloc(&amp;drm_minors_xa, &amp;minor-&gt;index,
+			     NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
 	if (r &lt; 0)
 		return r;
 
</pre>
    </blockquote>
  </body>
</html>

--------------X4034xdGwFVEVzp1pfDL2mId--
