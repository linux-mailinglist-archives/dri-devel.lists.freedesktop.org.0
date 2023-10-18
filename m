Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1427CDE0C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887910E0CB;
	Wed, 18 Oct 2023 13:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4D10E0CB;
 Wed, 18 Oct 2023 13:57:31 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1e19cb7829bso4222537fac.1; 
 Wed, 18 Oct 2023 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697637450; x=1698242250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBuadUMoZdX2+d4FKX3AvurIxVLVlW/YP0Lt3ncRpOc=;
 b=mclg+N4CHyBYmMxReNh9FMtsQayB9iT+I8t1pIOGEGk5vbt5kU9TCpUDpsTc8tehgo
 Pzp6h3Gz2Y8/mQmbp22OFf3+nvV+NRcAI+8SDjL91B3Jq28aT9OxdK7KD/w9rnOvmNhS
 w26/1aUvisPwDxdMPK50RVhgQNhL00ri0IFjj465silZU6Xxeq543V7cokivA5eSKiim
 1YxeAOZq9TTiVH8pFbadZTwLjjCA5eTUTW8tpnmKziFjF1QCRP8ZUXy5Ufudq8NG1Pg5
 F4jtXQ0+N6AyRA39FP7hkoqxYqRTZD45D/W5vH4RT2lt/msiRmgI20k+y5R1jGJYIyOX
 jNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697637450; x=1698242250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBuadUMoZdX2+d4FKX3AvurIxVLVlW/YP0Lt3ncRpOc=;
 b=JaE8FT0snlnw8rDrzaFiBa0ysBKJ/D7Jl8PU27ACBQBV9aiPFk1cfQfJdNIAGV4DQL
 2i0TcqDMHn4UdZ3JgMnIMTUFfsLOSFIa+XRRVrj5SwmwnHLkauuovLzBCkP5EpFLvng6
 WxNnG9iJpegdR8Jtv1MNTxW8EkaQ/w6f+tmbLd/70PRLkGZ77xblEs7Ii27+8B4k3mcE
 TulWCny9qfLooBQbaJU5Mh0zTXkLJIpGbDTbDPtwrVUNNtHilDn7T/DpJGKyQ0LnNcUT
 4/UtCuUOfrBk0c2otEyZMCmbulIoAo5gPA7CWBrWVtsMeDYJnoisk32bz6O83ZmAjB4C
 jJSA==
X-Gm-Message-State: AOJu0YyesGJfp3i7RHHnBUCG73Moo8v6IyLTHq8CdUixW95b0O9+f30R
 uLwsMo9LXgGD+7n3jztsS1Rk51BBhrlsHaTb0c0=
X-Google-Smtp-Source: AGHT+IFF0o2PmNbSZo3TsClLBR+UztvtVKhytK8oRPSPGDQcKHK/7AQ70VgMMQwUEbUC1ToXvVKOIMh/JtBrqizqtvY=
X-Received: by 2002:a05:6870:3926:b0:1ea:746d:1703 with SMTP id
 b38-20020a056870392600b001ea746d1703mr6501624oap.7.1697637450690; Wed, 18 Oct
 2023 06:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231018010203.110189-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20231018010203.110189-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Oct 2023 09:57:19 -0400
Message-ID: <CADnq5_OW4ZPV3Sm-8EC0QuVjA35tGtjN1SV4pLBnv1inU9umxQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Remove duplicated include in
 dce110_hwseq.c
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Oct 17, 2023 at 9:02=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c: dce110_hwseq=
.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6897
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/=
drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> index 74602a5fd6dd..51e42cbb3cdb 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> @@ -65,8 +65,6 @@
>
>  #include "dcn10/dcn10_hwseq.h"
>
> -#include "dce110_hwseq.h"
> -
>  #define GAMMA_HW_POINTS_NUM 256
>
>  /*
> --
> 2.20.1.7.g153144c
>
