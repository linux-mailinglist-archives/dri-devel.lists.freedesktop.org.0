Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B456CA7C067
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686210EBE7;
	Fri,  4 Apr 2025 15:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="UMmGwRAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68410EBE7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:16:56 +0000 (UTC)
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
 by cmsmtp with ESMTPS
 id 0b24uv397VkcR0imquYzOl; Fri, 04 Apr 2025 15:16:52 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 0impub5VVliBX0impuv7ar; Fri, 04 Apr 2025 15:16:52 +0000
X-Authority-Analysis: v=2.4 cv=bOXdI++Z c=1 sm=1 tr=0 ts=67eff7e4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=DTFsIx2UK63pnHR4iIcA:9 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4pzsQqZc93HniLWNSSUJ840c7jg7svjvDCpXoucpPw=; b=UMmGwRAjyp/9MjeZ377GmzB2sJ
 jy/BqpxloGZ77CXkwAkntodPi+J5nDcpSxz8PmCJke3DA/X4F5JznJFtLuIBA4RQdp7lqBOJvAK27
 7OdOpoweuR0uiak+nv7ab28wRJP8MLWfGTSlq/SEz+XBYGBQk0Ht+IERKVV6ieSpNO80SDBR7MCIi
 QrdP10HbNgZe4wGukE7E+IQftVYkZVT4HEGuDO1SQ/HZi715BPRL7TGMxN1pdrmKSNCjdJV1IGD+S
 3xZhGTSJyl7bdHwADoJEkZKBE4yETHL0wLtpOzb5Kuh3PvoZWqyP0HdCWLQQ//Ix6U9hACbDbME/H
 p9dMgApg==;
Received: from [201.172.174.147] (port=38642 helo=[192.168.15.6])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1u0imo-00000003ya0-3HBT;
 Fri, 04 Apr 2025 10:16:50 -0500
Message-ID: <c2e2c15d-b587-49e9-b05c-2096e2de3c76@embeddedor.com>
Date: Fri, 4 Apr 2025 09:16:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-7IQcWNePAMQEM0@kspp>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Z-7IQcWNePAMQEM0@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1u0imo-00000003ya0-3HBT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [201.172.174.147]:38642
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPOdeDsNDtIXvgDtfNsDIVL8tc9JhSWvRDMWM+TahhFByUVnzh4Q/VfGiJQwgYkMlrbtkWrJZa74rsoUp2QV9COhoPaHTdu0teeSymd0csC5T7saz2HQ
 UlhMba04SZ9uoqjxZpOtVC54te/f0A5jqNuF+ykoJbYSZMCyOsGI3Yij6VPrVajVHTk3zCne46MPSAiKFX9gVXiGOh4X9Wryd4RgYlfh6c+QL+cZ8L/hk3yN
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03/04/25 11:41, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/gpu/drm/nouveau/nvif/fifo.c | 32 ++++++++++++-----------------
>   1 file changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> index a463289962b2..f8772340fec4 100644
> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> @@ -25,33 +25,28 @@ static int
>   nvif_fifo_runlists(struct nvif_device *device)
>   {
>   	struct nvif_object *object = &device->object;
> -	struct {
> -		struct nv_device_info_v1 m;
> -		struct {
> -			struct nv_device_info_v1_data runlists;
> -			struct nv_device_info_v1_data runlist[64];
> -		} v;
> -	} *a;
> +	DEFINE_RAW_FLEX(struct nv_device_info_v1, a, data, 65);
> +	struct nv_device_info_v1_data *runlists = &a->data[0];
> +	struct nv_device_info_v1_data *runlist = &a->data[1];
> +	const u8 rl_cnt = (__struct_size(a) - sizeof(*a)) / sizeof(*a->data) - 1;
>   	int ret, i;
>   
>   	if (device->runlist)
>   		return 0;
>   
> -	if (!(a = kmalloc(sizeof(*a), GFP_KERNEL)))

I'll send v2 preserving the above allocation (with some adjustments to
remove the flex-array-in-the-middle issue), as I just got this report
from the kernel test robot:

https://lore.kernel.org/lkml/202504041254.6e26LBdj-lkp@intel.com/

Thanks
--
Gustavo
