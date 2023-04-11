Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7D46DDD61
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4BE10E56C;
	Tue, 11 Apr 2023 14:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE9010E56E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681222387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgWHYZJKqiNl4gOA+tqLLIKQpJrOHM98+Ie5Z3qvOjs=;
 b=RYLD57635tWFju9kL/v8Sv+yHOMuUIp2o5NArl7nsW7E3RjN8wToKgmLaHVmOxQ5UXCbiy
 rUcTZ38+Nu/7DX5xfRYZF7N+0r6PhqQGVu0LLM1a3sJzEE1jTJcVT2EGJmxBJvqAA9voIp
 hB0hFKGXsNZvKKkVNRmzy3v2UpHtWyU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-qXs85AzQPemZ1sacdiRn0A-1; Tue, 11 Apr 2023 10:13:04 -0400
X-MC-Unique: qXs85AzQPemZ1sacdiRn0A-1
Received: by mail-lf1-f71.google.com with SMTP id
 q17-20020a05651232b100b004e99d8785f0so3273942lfe.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681222383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgWHYZJKqiNl4gOA+tqLLIKQpJrOHM98+Ie5Z3qvOjs=;
 b=2lZll407EVs6YkuWDqWaaIwY1Csatj+k5Nk0AUXij0fxd/YG9CUW4QSQT1/3ijf8b9
 qpmZedAOL1itvXeKwGoF45c1YZ6gRlhUCvQ9g+wNCXoAeb6ejrQ1xxKL6KexYSufJGCi
 EYOAxWugRaDQSkMHlA8yGUS1n9E+T8uHnjoBMaMZJsZNHXZ3Um1qjnZCxbTUrN5HUVyB
 2Jo+rOPyYiuZxoGRccXyVyIu2fkXE3xZLDKs6vMdzUCWmag2adDS/jphbyoU4GfLRxqJ
 l+BQNxDvseB4xvZ2xhETq6j661OkQmhkiqlobV9VwKoS+luH248We4JXFmgQRBp4fxbX
 1mOA==
X-Gm-Message-State: AAQBX9edGryoKsoixj4VGQvu6wvAmYE3gsiIXXDXLF/dvEHrJ6H8hFf7
 9wk8j5CAhLO7DJIlfbQbRyyDIC/eX+uWLzVRTeMvi4gkuHDwVQIT3NxDZDhqrWrcE/sUdLgEXeO
 CqTfWsSgR1MMRXauJhmeN2dz/neSodErTzZffjpUVCVze
X-Received: by 2002:ac2:54b9:0:b0:4ec:8e1e:60c7 with SMTP id
 w25-20020ac254b9000000b004ec8e1e60c7mr1447475lfk.4.1681222382990; 
 Tue, 11 Apr 2023 07:13:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJNvA1En0899YIptSvqorm8IgX6qDO8OV/Q4M08zulGPBKcyK2yEfUe2F2T6iaJY/jr6uhrRqFH9MWQjDNWMg=
X-Received: by 2002:ac2:54b9:0:b0:4ec:8e1e:60c7 with SMTP id
 w25-20020ac254b9000000b004ec8e1e60c7mr1447459lfk.4.1681222382653; Tue, 11 Apr
 2023 07:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220924073957.4140388-1-ruanjinjie@huawei.com>
In-Reply-To: <20220924073957.4140388-1-ruanjinjie@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 11 Apr 2023 16:12:51 +0200
Message-ID: <CACO55tuDx0khsqgv6MBBnwKtcB-UwVLQYEfFah4f0WhOLHd0-A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/nouveau/disp: make gv100_disp_core_mthd_base
 static
To: ruanjinjie <ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Sep 24, 2022 at 10:00=E2=80=AFAM ruanjinjie <ruanjinjie@huawei.com>=
 wrote:
>
> The symbol is not used outside of the file, so mark it static.
>
> Fixes the following warning:
>
> ./drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c:591:1: warning:
> symbol 'gv100_disp_core_mthd_base' was not declared. Should it be static?
>
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/gv100.c
> index 6b9d49270fa7..347c12a1fcb7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> @@ -587,7 +587,7 @@ gv100_disp_curs =3D {
>         .user =3D 73,
>  };
>
> -const struct nvkm_disp_mthd_list
> +static const struct nvkm_disp_mthd_list
>  gv100_disp_core_mthd_base =3D {
>         .mthd =3D 0x0000,
>         .addr =3D 0x000000,
> --
> 2.25.1
>

