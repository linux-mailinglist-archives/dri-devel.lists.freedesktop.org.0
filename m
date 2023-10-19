Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3F7CEE98
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 06:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE14D10E09F;
	Thu, 19 Oct 2023 04:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6021410E09F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 04:23:30 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1caa371dcd8so14371955ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 21:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697689410; x=1698294210;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XIOghrBmVZu6lgiOtXXOECZ8n+mlWZ7P1vW/PW8XFuE=;
 b=hvcmLS7+sp1Jl0jYpuwfRcZiwXKqh0Noe1TlMVXvPNdted4WkFt9lyPz4hkz8P/Jpz
 rg3RN8WANK7B+7tnVI9OnJ7QpjyXSRgI984wfyaz+n4CvodkgsEMsSq7zL57121ksxbY
 8ZBV8AvzdheP9ILwZ4jccXNE0jGpOov3rhfgB4VCK+z+wRJyfxyHmYE1uJr0hbusZ9+d
 IRwfgE0Tvw74SXqJZlpYBU0HnMlcnszT6lVx/UARWvwqTuqEUqypDQFPbmNoQCRilcyY
 nsj2e1RhZrrYNTXFDLqyQrJ7rlgSoQ+/gupTSBcUp3iIC3oarsvcskMKweviMwXZjOAo
 iEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697689410; x=1698294210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XIOghrBmVZu6lgiOtXXOECZ8n+mlWZ7P1vW/PW8XFuE=;
 b=rjmMMJvdOfZRZSTGT0//ckUXQ+ZpYnu1+YqtHq9jkFEryDlIRCdHv0KpRHWtaEZiVR
 CEKE4PheuJXcXlE25wfilQVkehVGEGgnZbPkmNPRgTmfPPZPzDWuqP5kyQz7lPTPRuIk
 zVskvmhKWzvE7voQ6h9Oo1tRhHR4HeEFIs9dX5fXgpmkmvlL4ELHnR81Sl/BHvmUo1Mg
 IuuGbuqNMfilpga70ZNM5xA2Hmy9U0oFS2s0CHEWv/wFKlxkcTYrK6O5Y3qf4VSkkCPI
 Qd5CbwCCQ3LaGIleoXoTvKWJxx6PqKb2mVHuDMCFzylPPf6pN8tq1qTdWsSwRPO9s1Gf
 kFCA==
X-Gm-Message-State: AOJu0Yxz/yEdISH7OHjykRik06Ojd8K8AgeeGAs66QGVlRVV5/Ldqo69
 FBtaQrKcy7n6yFXtD3mNRuaXPA==
X-Google-Smtp-Source: AGHT+IEpwj8F0CwiHYwEL/qYEFayCGnPsZ0W41oVGG2vRz+p0X0xMd0PQySyypQbuglemxOUwBY+xg==
X-Received: by 2002:a17:902:ef0e:b0:1ca:362b:1482 with SMTP id
 d14-20020a170902ef0e00b001ca362b1482mr1083218plx.67.1697689409640; 
 Wed, 18 Oct 2023 21:23:29 -0700 (PDT)
Received: from [157.82.207.43] ([157.82.207.43])
 by smtp.gmail.com with ESMTPSA id
 bj11-20020a170902850b00b001bf8779e051sm733646plb.289.2023.10.18.21.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 21:23:29 -0700 (PDT)
Message-ID: <04b6caa4-32c2-40f9-a095-dbabfce6de9a@daynix.com>
Date: Thu, 19 Oct 2023 13:23:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/virtio: add new virtio gpu capset definitions
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Huang Rui <ray.huang@amd.com>
References: <20231010135722.1142265-1-ray.huang@amd.com>
 <2f8bcce1-6551-6c2d-481c-67502c82bc68@collabora.com>
 <2c162058-288c-9e9e-48d5-3b2ddb0cc1fa@collabora.com>
 <ZSYnQbHUecuUlwvr@amd.com>
 <CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/10/19 8:25, Gurchetan Singh wrote:
> 
> 
> On Tue, Oct 10, 2023 at 9:41 PM Huang Rui <ray.huang@amd.com 
> <mailto:ray.huang@amd.com>> wrote:
> 
>     On Tue, Oct 10, 2023 at 11:52:14PM +0800, Dmitry Osipenko wrote:
>      > On 10/10/23 18:40, Dmitry Osipenko wrote:
>      > > On 10/10/23 16:57, Huang Rui wrote:
>      > >> These definitions are used fro qemu, and qemu imports this
>     marco in the
>      > >> headers to enable gfxstream, venus, cross domain, and drm (native
>      > >> context) for virtio gpu. So it should add them even kernel
>     doesn't use
>      > >> this.
>      > >>
>      > >> Signed-off-by: Huang Rui <ray.huang@amd.com
>     <mailto:ray.huang@amd.com>>
>      > >> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>
>      > >> ---
>      > >>
>      > >> Changes V1 -> V2:
>      > >> - Add all capsets including gfxstream and venus in kernel
>     header (Dmitry Osipenko)
>      > >>
>      > >> Changes V2 -> V3:
>      > >> - Add missed capsets including cross domain and drm (native
>     context)
>      > >>   (Dmitry Osipenko)
>      > >>
>      > >> v1:
>     https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/ <https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/>
>      > >> v2:
>     https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/ <https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/>
>      > >>
>      > >>  include/uapi/linux/virtio_gpu.h | 4 ++++
>      > >>  1 file changed, 4 insertions(+)
>      > >>
>      > >> diff --git a/include/uapi/linux/virtio_gpu.h
>     b/include/uapi/linux/virtio_gpu.h
>      > >> index f556fde07b76..240911c8da31 100644
>      > >> --- a/include/uapi/linux/virtio_gpu.h
>      > >> +++ b/include/uapi/linux/virtio_gpu.h
>      > >> @@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {
>      > >>
>      > >>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>      > >>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
>      > >> +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
>      > >
>      > > The GFXSTREAM capset isn't correct, it should be
>     GFXSTREAM_VULKAN in
>      > > accordance to [1] and [2]. There are more capsets for GFXSTREAM.
>      > >
>      > > [1]
>      > >
>     https://github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_utils.rs#L172 <https://github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_utils.rs#L172>
>      > >
>      > > [2]
>      > >
>     https://patchwork.kernel.org/project/qemu-devel/patch/20231006010835.444-7-gurchetansingh@chromium.org/ <https://patchwork.kernel.org/project/qemu-devel/patch/20231006010835.444-7-gurchetansingh@chromium.org/>
>      >
>      > Though, maybe those are "rutabaga" capsets that not related to
>      > virtio-gpu because crosvm has another defs for virtio-gpu capsets
>     [3].
>      > The DRM capset is oddly missing in [3] and code uses "rutabaga"
>     capset
>      > for DRM and virtio-gpu.
>      >
>      > [3]
>      >
>     https://github.com/google/crosvm/blob/main/devices/src/virtio/gpu/protocol.rs#L416 <https://github.com/google/crosvm/blob/main/devices/src/virtio/gpu/protocol.rs#L416>
> 
>     Yes, [3] is the file that I referred to add these capsets
>     definitions. And
>     it's defined as gfxstream not gfxstream_vulkan.
> 
>      >
>      > Gurchetan, could you please clarify which capsets definitions are
>      > related to virtio-gpu and gfxstream. The
>      > GFXSTREAM_VULKAN/GLES/MAGMA/COMPOSER or just the single GFXSTREAM?
> 
> 
> It should be GFXSTREAM_VULKAN.  The rest are more experimental and easy 
> to modify in terms of the enum value, should the need arise.
> 
> I imagine the virtio-spec update to reflect the GFXSTREAM to 
> GFXSTREAM_VULKAN change will happen eventually.

I think this is a matter what the committee should determine, but in 
general I don't think it is OK to change the existing identifier.

I also think even experimental values should be added to virtio spec at 
an early stage unless such an "experiment" is done only on one laptop. 
We can obsolete a capset anytime so it's more important to avoid 
conflicts of capsets.
