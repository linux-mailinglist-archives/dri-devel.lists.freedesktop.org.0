Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C7489346
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C4112A8DB;
	Mon, 10 Jan 2022 08:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9921126FC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 00:44:31 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o6so47163666edc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 16:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d6TeLkgYS1ew8fCJmvh49i3fDk/RLdVzngu08Uax2h4=;
 b=Nuk6V4eDecFZtqH5KuYOv3stWfzk3z30dmeeKoUhD4geZRR7ItYdfH8H3xs1/YL1sC
 f8+KBb7PpXLRi5UWA2pKKHLrev0/LsRTVlS6iX5h4OLCC/3lJeQnoqacQW+eV+DmERru
 HpFqP3hP43vi9J//SvRwoQfrlcNBiFwO5DopN7siK+QaQT9MS98p9GPnn8NmkS2w56Hk
 IomDRqUPJMGIqv/V62YZI1Z4hHFIdBpHw8KyJoSJHxxxWz2pspaLVUnGZQNSo9QH7FEh
 8C+KhgvOH2NG1UBc+KL8/Io1lirgJJ5Hk0618AYRNv8AyJy50DWmbPVaXTn551nOKVww
 TlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d6TeLkgYS1ew8fCJmvh49i3fDk/RLdVzngu08Uax2h4=;
 b=KZ/8tYZy4sD8LRtWKUdxJhIuImriqgf+045vUg/4+yCZN9Jujr+Grsaqr1pT1t6fKz
 rAUnLkVhs+40Tu2DxC+Ke/CcIR+R9wJAZXbTLuvr+OeD08z2blXBdLy0bB0rLTZlyM/G
 l/MOddXXGMqxIB/SumnDpt/wGoEMrLcFgmR+sotNQHHoB2PV5KtQQfeJu86K8Efg1nJB
 YVglM/7r4DmtnJKEhkrWPDtQqKN+2zW4GUjupxUpcBgSYNwVox9ZH6l4JyoHwtY3m+4A
 XNpQIlnMv6lnL5U9aNYAN7xbmpJfOQZoH/1O+pqZyDR3TwSHH/l3icx9yHQkavnQqyCL
 +WYg==
X-Gm-Message-State: AOAM531C7nAVrH7Cnchz0olaQ+C7mXpFLRumBGYzG566kdOmd2UFQuUl
 ad+yqUQ3jBgEzPNOZWEuyLI=
X-Google-Smtp-Source: ABdhPJw9LBaKSD+9yimBA0BUEf+Z1s0gMshG0cPBnRoiNX58JwKhEm6y52sQVaIofS1PA2lIQLoD/Q==
X-Received: by 2002:a05:6402:5216:: with SMTP id
 s22mr3321353edd.132.1641775469982; 
 Sun, 09 Jan 2022 16:44:29 -0800 (PST)
Received: from anparri (host-95-250-60-3.retail.telecomitalia.it.
 [95.250.60.3])
 by smtp.gmail.com with ESMTPSA id 18sm1821263ejo.8.2022.01.09.16.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 16:44:29 -0800 (PST)
Date: Mon, 10 Jan 2022 01:44:19 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Yanming Liu <yanminglr@gmail.com>
Subject: Re: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
Message-ID: <20220110004419.GA435914@anparri>
References: <20220109095516.3250392-1-yanminglr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109095516.3250392-1-yanminglr@gmail.com>
X-Mailman-Approved-At: Mon, 10 Jan 2022 08:27:29 +0000
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com, lkmlabelt@gmail.com,
 airlied@linux.ie, haiyangz@microsoft.com, decui@microsoft.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, drawat.floss@gmail.com,
 Wei Liu <wei.liu@kernel.org>, kys@microsoft.com, mikelley@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Extending Cc: list,)

On Sun, Jan 09, 2022 at 05:55:16PM +0800, Yanming Liu wrote:
> Commit adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-V
> out of the ring buffer") introduced a notion of maximum packet size in
> vmbus channel and used that size to initialize a buffer holding all
> incoming packet along with their vmbus packet header. Currently, some
> vmbus drivers set max_pkt_size to the size of their receive buffer
> passed to vmbus_recvpacket, however vmbus_open expects this size to also
> include vmbus packet header. This leads to corruption of the ring buffer
> state when receiving a maximum sized packet.
> 
> Specifically, in hv_balloon I have observed of a dm_unballoon_request
> message of 4096 bytes being truncated to 4080 bytes. When the driver
> tries to read next packet it starts from a wrong read_index, receives
> garbage and prints a lot of "Unhandled message: type: <garbage>" in
> dmesg.
> 
> The same mismatch also happens in hv_fcopy, hv_kvp, hv_snapshot,
> hv_util, hyperv_drm and hyperv_fb, though bad cases are not observed
> yet.
> 
> Allocate the buffer with HV_HYP_PAGE_SIZE more bytes to make room for
> the descriptor, assuming the vmbus packet header will never be larger
> than HV_HYP_PAGE_SIZE. This is essentially free compared to just adding
> 'sizeof(struct vmpacket_descriptor)' because these buffers are all more
> than HV_HYP_PAGE_SIZE bytes so kmalloc rounds them up anyway.
> 
> Fixes: adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-V out of the ring buffer")
> Suggested-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> Signed-off-by: Yanming Liu <yanminglr@gmail.com>

Thanks for sorting this out; the patch looks good to me:

Reviewed-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>

In future submissions (if any), please include LKML as well as subsystem
lists&maintainers; scripts/get_maintainer.pl can be useful to this end.

  Andrea


> ---
> v2: Changed to modify max_pkt_size in individual drivers instead of in
> vmbus code as suggested by Andrea Parri.
> 
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c |  2 ++
>  drivers/hv/hv_balloon.c                   |  7 +++++++
>  drivers/hv/hv_fcopy.c                     |  2 +-
>  drivers/hv/hv_kvp.c                       |  2 +-
>  drivers/hv/hv_snapshot.c                  |  2 +-
>  drivers/hv/hv_util.c                      | 17 +++++++++++++++++
>  drivers/video/fbdev/hyperv_fb.c           |  2 ++
>  7 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> index c0155c6271bf..bf1548054276 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -478,6 +478,8 @@ int hyperv_connect_vsp(struct hv_device *hdev)
>  	struct drm_device *dev = &hv->dev;
>  	int ret;
>  
> +	hdev->channel->max_pkt_size = HV_HYP_PAGE_SIZE + VMBUS_MAX_PACKET_SIZE;
> +
>  	ret = vmbus_open(hdev->channel, VMBUS_RING_BUFSIZE, VMBUS_RING_BUFSIZE,
>  			 NULL, 0, hyperv_receive, hdev);
>  	if (ret) {
> diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
> index ca873a3b98db..ee2527c3d3b8 100644
> --- a/drivers/hv/hv_balloon.c
> +++ b/drivers/hv/hv_balloon.c
> @@ -1660,6 +1660,13 @@ static int balloon_connect_vsp(struct hv_device *dev)
>  	unsigned long t;
>  	int ret;
>  
> +	/*
> +	 * max_pkt_size should be large enough for one vmbus packet header plus
> +	 * our receive buffer size. We assume vmbus packet header is smaller
> +	 * than HV_HYP_PAGE_SIZE.
> +	 */
> +	dev->channel->max_pkt_size = HV_HYP_PAGE_SIZE * 2;
> +
>  	ret = vmbus_open(dev->channel, dm_ring_size, dm_ring_size, NULL, 0,
>  			 balloon_onchannelcallback, dev);
>  	if (ret)
> diff --git a/drivers/hv/hv_fcopy.c b/drivers/hv/hv_fcopy.c
> index 660036da7449..07a508ce65db 100644
> --- a/drivers/hv/hv_fcopy.c
> +++ b/drivers/hv/hv_fcopy.c
> @@ -349,7 +349,7 @@ int hv_fcopy_init(struct hv_util_service *srv)
>  {
>  	recv_buffer = srv->recv_buffer;
>  	fcopy_transaction.recv_channel = srv->channel;
> -	fcopy_transaction.recv_channel->max_pkt_size = HV_HYP_PAGE_SIZE * 2;
> +	fcopy_transaction.recv_channel->max_pkt_size = HV_HYP_PAGE_SIZE * 3;
>  
>  	/*
>  	 * When this driver loads, the user level daemon that
> diff --git a/drivers/hv/hv_kvp.c b/drivers/hv/hv_kvp.c
> index c698592b83e4..b85d725ae5b1 100644
> --- a/drivers/hv/hv_kvp.c
> +++ b/drivers/hv/hv_kvp.c
> @@ -757,7 +757,7 @@ hv_kvp_init(struct hv_util_service *srv)
>  {
>  	recv_buffer = srv->recv_buffer;
>  	kvp_transaction.recv_channel = srv->channel;
> -	kvp_transaction.recv_channel->max_pkt_size = HV_HYP_PAGE_SIZE * 4;
> +	kvp_transaction.recv_channel->max_pkt_size = HV_HYP_PAGE_SIZE * 5;
>  
>  	/*
>  	 * When this driver loads, the user level daemon that
> diff --git a/drivers/hv/hv_snapshot.c b/drivers/hv/hv_snapshot.c
> index 6018b9d1b1fb..dba6baacbf17 100644
> --- a/drivers/hv/hv_snapshot.c
> +++ b/drivers/hv/hv_snapshot.c
> @@ -375,7 +375,7 @@ hv_vss_init(struct hv_util_service *srv)
>  	}
>  	recv_buffer = srv->recv_buffer;
>  	vss_transaction.recv_channel = srv->channel;
> -	vss_transaction.recv_channel->max_pkt_size = HV_HYP_PAGE_SIZE * 2;
> +	vss_transaction.recv_channel->max_pkt_size = HV_HYP_PAGE_SIZE * 3;
>  
>  	/*
>  	 * When this driver loads, the user level daemon that
> diff --git a/drivers/hv/hv_util.c b/drivers/hv/hv_util.c
> index 835e6039c186..a7b88c067c07 100644
> --- a/drivers/hv/hv_util.c
> +++ b/drivers/hv/hv_util.c
> @@ -112,6 +112,8 @@ static int hv_shutdown_init(struct hv_util_service *srv)
>  
>  	hibernation_supported = hv_is_hibernation_supported();
>  
> +	channel->max_pkt_size = HV_HYP_PAGE_SIZE * 2;
> +
>  	return 0;
>  }
>  
> @@ -133,9 +135,11 @@ static struct hv_util_service util_timesynch = {
>  	.util_deinit = hv_timesync_deinit,
>  };
>  
> +static int heartbeat_init(struct hv_util_service *src);
>  static void heartbeat_onchannelcallback(void *context);
>  static struct hv_util_service util_heartbeat = {
>  	.util_cb = heartbeat_onchannelcallback,
> +	.util_init = heartbeat_init,
>  };
>  
>  static struct hv_util_service util_kvp = {
> @@ -553,6 +557,15 @@ static void heartbeat_onchannelcallback(void *context)
>  	}
>  }
>  
> +static int heartbeat_init(struct hv_util_service *srv)
> +{
> +	struct vmbus_channel *channel = srv->channel;
> +
> +	channel->max_pkt_size = HV_HYP_PAGE_SIZE * 2;
> +
> +	return 0;
> +}
> +
>  #define HV_UTIL_RING_SEND_SIZE VMBUS_RING_SIZE(3 * HV_HYP_PAGE_SIZE)
>  #define HV_UTIL_RING_RECV_SIZE VMBUS_RING_SIZE(3 * HV_HYP_PAGE_SIZE)
>  
> @@ -734,6 +747,8 @@ static struct ptp_clock *hv_ptp_clock;
>  
>  static int hv_timesync_init(struct hv_util_service *srv)
>  {
> +	struct vmbus_channel *channel = srv->channel;
> +
>  	spin_lock_init(&host_ts.lock);
>  
>  	INIT_WORK(&adj_time_work, hv_set_host_time);
> @@ -750,6 +765,8 @@ static int hv_timesync_init(struct hv_util_service *srv)
>  		hv_ptp_clock = NULL;
>  	}
>  
> +	channel->max_pkt_size = HV_HYP_PAGE_SIZE * 2;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 23999df52739..ae4240777f7d 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -636,6 +636,8 @@ static int synthvid_connect_vsp(struct hv_device *hdev)
>  	struct hvfb_par *par = info->par;
>  	int ret;
>  
> +	hdev->channel->max_pkt_size = HV_HYP_PAGE_SIZE + MAX_VMBUS_PKT_SIZE;
> +
>  	ret = vmbus_open(hdev->channel, RING_BUFSIZE, RING_BUFSIZE,
>  			 NULL, 0, synthvid_receive, hdev);
>  	if (ret) {
> -- 
> 2.34.1
> 
