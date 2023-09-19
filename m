Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 588527A7520
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C9C10E447;
	Wed, 20 Sep 2023 08:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1800 seconds by postgrey-1.36 at gabe;
 Tue, 19 Sep 2023 11:51:49 UTC
Received: from 17.mo584.mail-out.ovh.net (17.mo584.mail-out.ovh.net
 [46.105.41.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896D010E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:51:49 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.143.24])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id F168D23B76
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:12:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ql8wh (unknown [10.110.208.79])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 23DBF1FEAC;
 Tue, 19 Sep 2023 11:12:12 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
 by ghost-submission-6684bf9d7b-ql8wh with ESMTPSA
 id LpbEBgyCCWVJ7wcANQvNOQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 19 Sep 2023 11:12:12 +0000
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 14:12:11 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: airlied@redhat.com, kraxel@redhat.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/virtio: clean out_fence on complete_submit
In-Reply-To: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
References: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <36155537ca2f99762bde8bf23b3eb45f@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.251
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9370864926515504806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekuddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddvrddvhedupddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:01:17 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, gurchetansingh@chromium.org,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-12 09:08, José Pekkarinen wrote:
> The removed line prevents the following cleanup function
> to execute a dma_fence_put on the out_fence to free its
> memory, producing the following output in kmemleak:
> 
> unreferenced object 0xffff888126d8ee00 (size 128):
>   comm "kwin_wayland", pid 981, jiffies 4295380296 (age 390.060s)
>   hex dump (first 32 bytes):
>     c8 a1 c2 27 81 88 ff ff e0 14 a9 c0 ff ff ff ff  ...'............
>     30 1a e1 2e a6 00 00 00 28 fc 5b 17 81 88 ff ff  0.......(.[.....
>   backtrace:
>     [<0000000011655661>] kmalloc_trace+0x26/0xa0
>     [<0000000055f15b82>] virtio_gpu_fence_alloc+0x47/0xc0 [virtio_gpu]
>     [<00000000fa6d96f9>] virtio_gpu_execbuffer_ioctl+0x1a8/0x800 
> [virtio_gpu]
>     [<00000000e6cb5105>] drm_ioctl_kernel+0x169/0x240 [drm]
>     [<000000005ad33e27>] drm_ioctl+0x399/0x6b0 [drm]
>     [<00000000a19dbf65>] __x64_sys_ioctl+0xc5/0x100
>     [<0000000011fa801e>] do_syscall_64+0x5b/0xc0
>     [<0000000065c76d8a>] entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> unreferenced object 0xffff888121930500 (size 128):
>   comm "kwin_wayland", pid 981, jiffies 4295380313 (age 390.096s)
>   hex dump (first 32 bytes):
>     c8 a1 c2 27 81 88 ff ff e0 14 a9 c0 ff ff ff ff  ...'............
>     f9 ec d7 2f a6 00 00 00 28 fc 5b 17 81 88 ff ff  .../....(.[.....
>   backtrace:
>     [<0000000011655661>] kmalloc_trace+0x26/0xa0
>     [<0000000055f15b82>] virtio_gpu_fence_alloc+0x47/0xc0 [virtio_gpu]
>     [<00000000fa6d96f9>] virtio_gpu_execbuffer_ioctl+0x1a8/0x800 
> [virtio_gpu]
>     [<00000000e6cb5105>] drm_ioctl_kernel+0x169/0x240 [drm]
>     [<000000005ad33e27>] drm_ioctl+0x399/0x6b0 [drm]
>     [<00000000a19dbf65>] __x64_sys_ioctl+0xc5/0x100
>     [<0000000011fa801e>] do_syscall_64+0x5b/0xc0
>     [<0000000065c76d8a>] entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [...]
> 
> This memleak will grow quickly, being possible to see the
> following line in dmesg after few minutes of life in the
> virtual machine:
> 
> [  706.217388] kmemleak: 10731 new suspected memory leaks (see
> /sys/kernel/debug/kmemleak)
> 
> The patch will remove the line to allow the cleanup
> function do its job.
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c
> b/drivers/gpu/drm/virtio/virtgpu_submit.c
> index 3c00135ead45..5c514946bbad 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -361,7 +361,6 @@ static void virtio_gpu_complete_submit(struct
> virtio_gpu_submit *submit)
>  	submit->buf = NULL;
>  	submit->buflist = NULL;
>  	submit->sync_file = NULL;
> -	submit->out_fence = NULL;
>  	submit->out_fence_fd = -1;
>  }

     Ping.

     José.
