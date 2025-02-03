Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B60A2545C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 09:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88A610E093;
	Mon,  3 Feb 2025 08:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="OBGKwzoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191610E093
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 08:26:01 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-21631789fcdso66036765ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 00:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738571161; x=1739175961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t7lQIQ5MioRS7p56iXT3+pmVZjZaMiEEtNeyBXs9W1Y=;
 b=OBGKwzoApM8/HBleE+oLQNqXJsADpO6aZmQI+bIB4jBHvim3mn0OtT+/8mgTDNXzk9
 zvUg4D85KyorADINjg+lykVITIW763XZF/CtRKUPnjdha3z9WZRKGaZJparX1ACIjCCr
 f1T8L83H6/5uFuLrQGUtm+0Oct0PW/OGoKLfAxFyuvU0Y6qzIQMSL4mk6p/k2f+rFCxN
 yiNvmuymy7DNa9H+kO2ZH9pXLWOLvugQh2bwoQjVETCmTIIaSjGNgbnycDyENz7SHMvN
 11zeozptjJyFziY0Y4o08nlwLYkV/bUhZx5rTiFEa4p6cqjX2VS5kYQZI4z+BPwh973w
 iTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738571161; x=1739175961;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7lQIQ5MioRS7p56iXT3+pmVZjZaMiEEtNeyBXs9W1Y=;
 b=uSm/MdhDRhgaSJ/gHK/0GWo9yEhWloNCX5ASslOn6JoPLu/jdzyb1jGLzIp7ocoT91
 TmNItXUsM9qnfeIkxu2AX6+6JGyYJ6K0YQEFxGEy0pYIxageEkNifVYdYif156kC7fHh
 IKsVchMVggkrUPrYhAmKrv+VUijLpCaZNHxT6e1jVsykbxgSfo+pTSMN3+x0kdzpx3/D
 piRfjn441N1xrWaSWrlxyP4VYQB6zipeynf6TFfG8YAkkwumcG0SkYBl7dj/ieFs65CX
 RqPkszBnrhW4A0AHnaJdpUiTf3zl+Qdy6LUlZgQmGl39krnus3sBufEM+KNjcE0n9XCm
 tdig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUJSouazLNH70t1/lIhNXzQ0cC+2FXYBCruCZuh+s/21HjZphoMxLJ0fDQiPk9pUqKbDIDxEqXhqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZIukrWFJyk/EgCabL1vnkDptgegU1oPom15J0L7/Cx6zs8NNU
 RAC+84otYrCgmaV/PL0TkufbRrLNFp7tY8X4FkoId3Mxp9w5+E78C2Bfq4F2WJU=
X-Gm-Gg: ASbGnct53qU9Kfdey3iCWaPbG/FsfNtfIZ46ce5dnwkpAy7TQnb3qs3dVOH+DAT+t5g
 rk9pI6o14soQRtXXvm9evu/O5d7a5Wfjvg3+zYvFTekShxfN/iCOGU/jhudrigVlQy3o5CdMB5O
 BdHkqwvm4XHwKdD5adPC3hMGs86Bf8K9LdMrdACtyoIKeW0TQxX28OsMqXXG7Nzuho86LhGis/P
 4IkPlb5kw9Cc9peKZU3fCi2ho6ehdszCIDl7G4UYqZs9jgqGhG9Kibd47+0Mv+Yv5ih8NTBKHFB
 tubG1t1DDW+yPnqOya7OZL1TLpzV
X-Google-Smtp-Source: AGHT+IHX7wiqWkH9ZcI1oVnOppZdCHPlnSWOncf4WEz8oSiauUBCNlHSvTET6Iebk8Cezdu9r3h0Aw==
X-Received: by 2002:a05:6a21:9004:b0:1e1:e2d8:fd4a with SMTP id
 adf61e73a8af0-1ed872fe623mr26733156637.5.1738571159383; 
 Mon, 03 Feb 2025 00:25:59 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe6424facsm7848454b3a.39.2025.02.03.00.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 00:25:58 -0800 (PST)
Message-ID: <a8bf6c8b-5ee5-4150-a9a2-75345fd07432@daynix.com>
Date: Mon, 3 Feb 2025 17:25:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] virtio-gpu api: add blob userptr resource
To: Honglei Huang <honglei1.huang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Antonio Caggiano <quic_acaggian@quicinc.com>
Cc: Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241220100409.4007346-1-honglei1.huang@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024/12/20 19:04, Honglei Huang wrote:
> From: Honglei Huang <Honglei1.Huang@amd.com>
> 
> Add a new resource for blob resource, called userptr, used for let
> host access guest user space memory, to acquire a simple SVM features
> in virtio GPU.
> 
> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
> in this series patches only HSAKMT context can use the userptr
> feature. HSAKMT is a GPU compute library in HSA stack, like
> the role libdrm in mesa stack.
> - New flag VIRTIO_GPU_BLOB_FLAG_USE_USERPTR used in blob create
> to indicate the blob create ioctl is used for create a userptr
> blob resource.
> 
> Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
> ---
>   include/uapi/linux/virtio_gpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index b9a9783f0b14..0a6b56acbc13 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -323,6 +323,7 @@ struct virtio_gpu_cmd_submit {
>   
>   #define VIRTIO_GPU_CAPSET_VIRGL 1
>   #define VIRTIO_GPU_CAPSET_VIRGL2 2
> +#define VIRTIO_GPU_CAPSET_HSAKMT 7

The changes to add VIRTIO_GPU_CAPSET_VENUS and VIRTIO_GPU_CAPSET_DRM are 
already merged so this should be rebased for clean apply.

Number 7 is also occupied since 2023:
https://chromium.googlesource.com/crosvm/crosvm/+/e4c1878733937042111fca58899a3a94002bfef0%5E%21/rutabaga_gfx/src/rutabaga_utils.rs

VCL, a proposed VirtIO-GPU OpenCL driver, is also going to use that number:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31634/diffs?commit_id=55a1a8a32057e83819b046f2de03aca333b052b4

I think you should talk with Antonio Caggiano, who picked the number for 
VCL, to allocate a number without a conflict with VCL.

Gurchetan (the author of Rutabaga change allocating the number), I think 
you should notify the number usage by sending a patch for Linux or 
virtio-spec.

Regards,
Akihiko Odaki

>   
>   /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>   struct virtio_gpu_get_capset_info {
> @@ -415,6 +416,7 @@ struct virtio_gpu_resource_create_blob {
>   #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
>   #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
>   #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> +#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
>   	/* zero is invalid blob mem */
>   	__le32 blob_mem;
>   	__le32 blob_flags;

