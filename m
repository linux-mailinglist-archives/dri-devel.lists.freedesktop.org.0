Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3189CCE2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 22:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED1310EE54;
	Mon,  8 Apr 2024 20:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C5wBo34i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A37410E741;
 Mon,  8 Apr 2024 20:18:25 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6ed2170d89fso1084855b3a.1; 
 Mon, 08 Apr 2024 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712607505; x=1713212305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjywxhKqwhdxKvwBJv3ojTQEEiN0ox1Lv386oTrVMHU=;
 b=C5wBo34iRyQaWuI4N9UhjSF9PPxyJptXHbz+dQfP12kUvL/Yzhq5AyhIG532N/d3gP
 IKRkbGWwy7+x51tqMjQ/4l0D5vLHvU+EkSrMymektZArAOkGN+G6HLYFg4BjjVqAj5lm
 sMrdrIZIpSYd9QHpTlivou7S00zxf8eV8/Bjh3As7aUpY/ZyhzIdf3xMX27e/pAk/iHS
 a20LqRXN92mfAwAsElOxoLTnikvPDSIsEg+7PAeoA65nToV1rmiTcEsNITpEOkINIKBn
 /y2C7cZrswxCtGc4yhNXIXnWyKzY+3bsyNzq77XLZc+e74TL+quL8/nTHzQ5Pq3+2iWU
 2YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712607505; x=1713212305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjywxhKqwhdxKvwBJv3ojTQEEiN0ox1Lv386oTrVMHU=;
 b=MrgLf/3Wdf9L6ylqh85QBrhGA/Vtrx2xfPCCUH9eA0OOy2lUf4nx+cHhC8s5sXj9YD
 ZxegiS6/GU95Nzm+BxGgMJH1Z7t9myGzk07zY558XFpMLvJ0SAw5GF2p1w5AmwIHqqXA
 f+SPm+0UQHRjMKhjRC8SAiFfMfPPcLUlQNFaxuzo3YgsVAK9YVgsLgX1rkkEAkuIVytJ
 hvdlaIXpLnF+bBnfZch84TUCHUrN2DWh79E1LMkLCJNLbLlN6V3T/VSbrr1a2b0PUQsf
 mHHGcmz2ZZ1Jt6ouOoXXbJg5Xu1lFUB324/XP3lvkuyuqHpJU+k2bTT1J2LmfSGgo9Nf
 U1+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvQUQ4TokPpFYWzVBZL69H8vv8qZpxi37IgZx7Ncm6/mFZuXJMNkCu2SBOzcyknoHkumGYO5RgHzOhg2yQAUVo8cLaUAowGMT7p3UA/Hrdn3QRKVInkw193flaNeE5jGjk6pADQ2jnIUGPV/jZ8g==
X-Gm-Message-State: AOJu0YxwWTwjdMmUXU9BtxwZSIysROsFrxpr5UkFv6w2mJ6+BEwdlFzK
 aesgljiB2b9VdGZIsDFANoGqpH6EcmDIddFCjgbf0wKhE9rG010SgbywvYHhc9qUYukXkmifGn+
 DQ5dC2ySOJ6KdbB2ucokj1uS0H94=
X-Google-Smtp-Source: AGHT+IEU/gLpnTbGMR0cEp+1ByYalelfaGmw8RRspkrV99DF0W6hc4XtNjXpCOlWW/B8O+P2F8gR0jLeeo3r95NydEw=
X-Received: by 2002:a17:90a:d249:b0:2a4:b04b:d204 with SMTP id
 o9-20020a17090ad24900b002a4b04bd204mr1043588pjw.7.1712607504932; Mon, 08 Apr
 2024 13:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240407090131.269287-1-xiangyang3@huawei.com>
 <20240407090131.269287-2-xiangyang3@huawei.com>
In-Reply-To: <20240407090131.269287-2-xiangyang3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Apr 2024 16:18:13 -0400
Message-ID: <CADnq5_OVWQDpzsDum1QAtAWAP7oS+CmrXOcdWV26+LN=qk9bnA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: delete the redundant
 initialization in dcn3_51_soc
To: Xiang Yang <xiangyang3@huawei.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, swapnil.patel@amd.com, 
 wayne.lin@amd.com, xi.liu@amd.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

Applied.

Thanks,

Alex

On Mon, Apr 8, 2024 at 3:45=E2=80=AFAM Xiang Yang <xiangyang3@huawei.com> w=
rote:
>
> the dram_clock_change_latency_us in dcn3_51_soc is initialized twice, so
> delete one of them.
>
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/dri=
vers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> index b3ffab77cf88..f1c0d5b77f1b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> @@ -237,7 +237,6 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_51_soc =3D {
>         .urgent_latency_adjustment_fabric_clock_component_us =3D 0,
>         .urgent_latency_adjustment_fabric_clock_reference_mhz =3D 0,
>         .num_chans =3D 4,
> -       .dram_clock_change_latency_us =3D 11.72,
>         .dispclk_dppclk_vco_speed_mhz =3D 2400.0,
>  };
>
> --
> 2.34.1
>
