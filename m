Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CFD7BF212
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 07:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996310E154;
	Tue, 10 Oct 2023 05:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E96010E154
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:06:37 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2773f776f49so3816481a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 22:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1696914397; x=1697519197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bOJpq6c6s18P1xv5mPHPFQ059Qqr7Fqb/L8fc3dxEDE=;
 b=lxODBZg9OPSwXKQ5vgxfhLPibS5x/6m2kQmHwyJUawiTXSIq0P6yXKePahOuxeE35N
 J45Ym6wDi95gj6fmHXmgeOctJtI4ftHRhTkDCzxQNgvl4/lu3D7/OQE2KncQnC5wQsiA
 DPius/NtBWipYnQHxGDB3U4m9LwhggxhAGl9lItasQPs5gzQ7ynhw5pa0TpXtzCl2W4A
 vi9ckwh0I+YKHx6VX5NIausPRQdql/SZGw80d+Vo6sI7Hy7U/2WwfTpVsmkxl3k0eHMm
 jgmq/c6JBFwTUU/2/uP1A83ixItEnv21JE+EVtrznjtiQoFwE66GeXDRNNOJhfK22u8N
 KKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696914397; x=1697519197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bOJpq6c6s18P1xv5mPHPFQ059Qqr7Fqb/L8fc3dxEDE=;
 b=QoPUW2Dly3oH0Tz0nTmPCLgcqS6fTToAc0TqxvK6u0VqXx2cbvDz+fhC5RbKppB7ZE
 Xxh+42qjim9Mr7A2/vrnYFBLLsaXg78kEV7zBAVnMCv7ppESBaqCnw9agTA7SYli0IAM
 CONqHsP0CD9Dq+ZXkXnrSwZheoEXJZEanLIMAQgFY4juB+1XA//GJulWiKjmqLqe1HJ0
 301O8fRiRKWnX7zEkcL+1WgAqa7XA4bF7LYR/ccKFXbInQ3eus+wB8QPMW/XQL0Thv9A
 2Vc5uvH8jSklOz8qZfm/t5mUpnay4TJRvfisJW6WHux29SWM3DOVV84rkZWQkQ83rleF
 UEBA==
X-Gm-Message-State: AOJu0YwDoTYQzN8WD88ntzOTfKMUCIumk69mK5fm2CJqjEPZ8QiINF4W
 JmQpxmMa6HO48WkkOHISBk0K7Q==
X-Google-Smtp-Source: AGHT+IHd83jSJ6M1Vx4lr+7TJNkqYPfC9JgUfPbyQX1kIR5I4kFdgIy/DJn5rN9qu2fv2H3MxopU5g==
X-Received: by 2002:a17:90a:5415:b0:279:5a3:d5f with SMTP id
 z21-20020a17090a541500b0027905a30d5fmr22903431pjh.9.1696914396639; 
 Mon, 09 Oct 2023 22:06:36 -0700 (PDT)
Received: from [157.82.206.10] ([157.82.206.10])
 by smtp.gmail.com with ESMTPSA id
 cf9-20020a17090aebc900b00279163e52bbsm9184945pjb.17.2023.10.09.22.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 22:06:36 -0700 (PDT)
Message-ID: <9daf0765-b58c-438f-937c-a8efc0631a66@daynix.com>
Date: Tue, 10 Oct 2023 14:06:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: add definitions for gfxstream and venus
 capset
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
References: <20231010032553.1138036-1-ray.huang@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231010032553.1138036-1-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/10/10 12:25, Huang Rui wrote:
> These definitions are used fro qemu, and qemu imports this marco in the
> headers to enable gfxstream or venus for virtio gpu. So it should add it
> even kernel doesn't use this.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Changes V1 -> V2:
> - Add all capsets including gfxstream and venus in kernel header (Dmitry Osipenko)
> 
> v1: https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
> 
>   include/uapi/linux/virtio_gpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index f556fde07b76..327792658bdc 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
>   
>   #define VIRTIO_GPU_CAPSET_VIRGL 1
>   #define VIRTIO_GPU_CAPSET_VIRGL2 2
> +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> +#define VIRTIO_GPU_CAPSET_VENUS 4
>   
>   /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>   struct virtio_gpu_get_capset_info {

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
