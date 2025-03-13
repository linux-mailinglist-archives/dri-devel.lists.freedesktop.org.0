Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4BA5FA1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 16:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB4510E1E9;
	Thu, 13 Mar 2025 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nR2l1DJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF64310E1DE;
 Thu, 13 Mar 2025 15:38:25 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2ff62f9b6e4so296540a91.0; 
 Thu, 13 Mar 2025 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741880305; x=1742485105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/IG2UNH9lhkw2/E8UkhZN3j0Io+vt9kP0caOhOAn4M=;
 b=nR2l1DJCrY3bmVYUkf+Z+J0Ynnso/gUHixV6uePiEoNXe0uD93tJuVOJAIWPAXnGLN
 PKpfei+pVh3qW89VEuVjg7pPE5FvG2jF9ApLijFdPbPoGyRtiuB8w9FZgl8+enTEBh8h
 O/ho0U9c3cSYPvYNZOpXO21PAFzN+qkbwYDY6vs8TUnF8S14G8cWhX+d/FWcSoCVtMBN
 wgwM0+4bLKcbU6Vz7X+ukSRg4jbI3Yefmk1n4crHf2uqjcXqXG1RjCmQGR6bNUN6jMjN
 ZZTcO3i4aML/cgah+AlShwUuplkPJOnjhaGlJYjy1wAvFjK/2bWAN2LQtHYG8LHDPmWv
 iccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741880305; x=1742485105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2/IG2UNH9lhkw2/E8UkhZN3j0Io+vt9kP0caOhOAn4M=;
 b=gQh0SIRx2VgRvZB32SAAFrK1BBVbKugWHWivrlPpiZMV6O+4umXACA4fVhltAyPQDL
 f68nDoYniYqBHnov1P2pV/IC0xEtKekdh2nWPoLTyq5Ocii6XkyVl8GpEoLIe952Ufzf
 wtbVN6FsV0aqtmVPU34vBf5IyoU3hDvq0PUcN2w0T+jm59MOV9r7aOjSXjFrc4EHg70F
 y8ivEIQBRxEZe7XwSm7B8NYuTXNz1DEVAXUCdB+JacpqxC670SD6WyjkIH4yQCvTWlKH
 jFJ9G9mzT85j2HO2JvHSBAfWNaelm9QfEoBLFZDEjrJJLLQTr8BwQdHKgXphFI+e6qg6
 toeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgBzNP5xpt4sn/OQVjWg6VDQ0feBVl24n/+djk8Y7XaH3LiUY77QGtUEzmigixDLLdCWIbcZ2C4k7q@lists.freedesktop.org,
 AJvYcCWo8edVF6FIJf4U6vjqm3F5WX2IIF408LYjfIba+lmEzA4Ixe63nLMN3zVZuLNp4ikjMoV468PY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTXqpFxN05ch/20flSzQoqBaHClNfkQTZqp84/FnxWYGu3aszp
 8K6heED5Xb/s3JmCDRLFU77wkuxy5JJVXBUGACA/f1jfSAw9etrpZ/8P+o2oUUqRQwKDCsaJdHV
 +8nEKJZvDuhGZQWi53lx95ksL/zA=
X-Gm-Gg: ASbGnctWRRlMkQVyFQW2UfHCW407y883CyaYs5P20JAmE5xCHSXCgt5qJxQGb7AThhY
 gRkIQc3MFKmOxMbj7Cy+ZS48GyTCJ0isRpKuvDaV77NkDIO2kg/u5oWWILNf3o4p6o/6nZwCodi
 /yOP+Fjg9cQ6FK98kKzbfnE6VFLg==
X-Google-Smtp-Source: AGHT+IF6424p+zrs81oK/FMpNgLrtT9UJ2LVWKyFJVkfm6+/bB/C+cR8PsMtaS4M3CsCMWprNAn/8jFeuEpAYxVJzTI=
X-Received: by 2002:a17:90b:3812:b0:2ff:4a6d:b359 with SMTP id
 98e67ed59e1d1-300ff91fb2fmr5520980a91.7.1741880305351; Thu, 13 Mar 2025
 08:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250312063106.772-1-vulab@iscas.ac.cn>
In-Reply-To: <20250312063106.772-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Mar 2025 11:38:13 -0400
X-Gm-Features: AQ5f1JpzKR_TjlBfb7plqnz-2EyQBV5yCEiQgCqhVC2krXJgZq2oSKe1L_igh0M
Message-ID: <CADnq5_O8s5=bOmQDU=FRLxz75LuNq5BzON_i=-KBM9o8JeSDLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx12: correct cleanup of 'me' field with
 gfx_v12_0_me_fini()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, Hawking.Zhang@amd.com,
 Likun.Gao@amd.com, 
 sunil.khatri@amd.com, kenneth.feng@amd.com, Jack.Xiao@amd.com, 
 marek.olsak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

Applied.  Thanks!

Alex

On Wed, Mar 12, 2025 at 6:09=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> In gfx_v12_0_cp_gfx_load_me_microcode_rs64(), gfx_v12_0_pfp_fini() is
> incorrectly used to free 'me' field of 'gfx', since gfx_v12_0_pfp_fini()
> can only release 'pfp' field of 'gfx'. The release function of 'me' field
> should be gfx_v12_0_me_fini().
>
> Fixes: 52cb80c12e8a ("drm/amdgpu: Add gfx v12_0 ip block support (v6)")
> Cc: stable@vger.kernel.org # 6.11+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v12_0.c
> index da327ab48a57..02bc2eddf0c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
> @@ -2413,7 +2413,7 @@ static int gfx_v12_0_cp_gfx_load_me_microcode_rs64(=
struct amdgpu_device *adev)
>                                       (void **)&adev->gfx.me.me_fw_data_p=
tr);
>         if (r) {
>                 dev_err(adev->dev, "(%d) failed to create me data bo\n", =
r);
> -               gfx_v12_0_pfp_fini(adev);
> +               gfx_v12_0_me_fini(adev);
>                 return r;
>         }
>
> --
> 2.42.0.windows.2
>
