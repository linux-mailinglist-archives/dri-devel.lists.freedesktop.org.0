Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65C48B57C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3FA10E260;
	Tue, 11 Jan 2022 18:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF86410E173
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641924718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hgp9TNlhmh2F8YJ1u7gu8AeVl0SpLbsYxPdRZu+7iA=;
 b=HDvJW6P2e5vXEUcKEyVJ7AnKUKsbBgi3WyXoWjFC5eKeZFa7oMDLseMic99If8XPF1K9pu
 hRD9rs4KvW3qRPzPjyzuTNhjheaozAjFOEqSom/niFf8Vm8DbbxRVYGaPrzHOauPEuH78S
 1CJDXoFreOOIptPzSUv/zE8bIF/VocM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-TH1sziktNC-8APoPcxi7vw-1; Tue, 11 Jan 2022 13:11:57 -0500
X-MC-Unique: TH1sziktNC-8APoPcxi7vw-1
Received: by mail-qv1-f69.google.com with SMTP id
 kc15-20020a056214410f00b004152196c16eso167324qvb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=3hgp9TNlhmh2F8YJ1u7gu8AeVl0SpLbsYxPdRZu+7iA=;
 b=XABq7sTGjRluarfA5GvXlVC90s8Os9r3+i6m13P+iggyZT8z1FagKHGLJqVt6L+Hgs
 KpAMjbAn/dYDtX7/JJF0X0PkZYW6o6gwZry/aNAtRPWv4QDiZkxUr/DouN8DUihrtkmC
 iDc+ah6qZAaBVT2Wo/iw44w+X06X+SUEhezrUGl50mnQxZrUDG1vJRpufYWohLV+EMP2
 kddIzALOQxWHtiZMmHM0Al3CAycvMzeoeFQxQ9nWPa9CgDe2EfIgErvJcjEVRMqQ9Pl4
 pNeddI4IFmMGPOD4i8y0Qp5gJa8wvFPEWSQVxpX7G7gW2y2D6nY/oj1rqxxaWZbY6RvG
 JcHg==
X-Gm-Message-State: AOAM533/VXqbHci7lZIcDDWPcZrE3UDvO9KRmyzSnkIZpo5RP2rTle6c
 EgspnsOXM2K3W0qV4Ls/IZud01bYPkZsAAaMd6rz2dl3L/i42VADxVMuE0jPadR4SpLHdrTtDYz
 SWAjUsWc/pSPsduOcveyQqVNNXfBS
X-Received: by 2002:a37:ef17:: with SMTP id j23mr3846391qkk.400.1641924716777; 
 Tue, 11 Jan 2022 10:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvsxA+do5OMy7/Gkj99hwDfSQMXE+E3UHnj4iMm90i8YoXCddk9cREEvoOwLscfzjDtZ8gfg==
X-Received: by 2002:a37:ef17:: with SMTP id j23mr3846376qkk.400.1641924716545; 
 Tue, 11 Jan 2022 10:11:56 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id o17sm7804481qtv.87.2022.01.11.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:11:56 -0800 (PST)
Message-ID: <83a52893a963f37cb1c86f0b95c9a84091620361.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/core/object: Fix the uninitialized use of
 "type"
From: Lyude Paul <lyude@redhat.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 11 Jan 2022 13:11:54 -0500
In-Reply-To: <20211218025632.2514288-1-yzhai003@ucr.edu>
References: <20211218025632.2514288-1-yzhai003@ucr.edu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2021-12-17 at 18:56 -0800, Yizhuo Zhai wrote:
> In function nvkm_ioctl_map(), the variable "type" could be
> uninitialized if "nvkm_object_map()" returns error code, however,
> it does not check the return value and directly use the "type" in
> the if statement, which is potentially unsafe.
> 
> Cc: stable@vger.kernel.org
> Fixes: 01326050391c ("drm/nouveau/core/object: allow arguments to be passed
> to map function")
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index 735cb6816f10..4264d9d79783 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
>                 ret = nvkm_object_map(object, data, size, &type,
>                                       &args->v0.handle,
>                                       &args->v0.length);
> +               if (ret)
> +                       return ret;
>                 if (type == NVKM_OBJECT_MAP_IO)
>                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
>                 else

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

