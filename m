Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A1934FD6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 17:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568DE10E9A5;
	Thu, 18 Jul 2024 15:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLpNtvLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EA910E9E9;
 Thu, 18 Jul 2024 15:22:19 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7039e4a4a03so501130a34.3; 
 Thu, 18 Jul 2024 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721316138; x=1721920938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQJnSHtMQef7mtUVuS0yssb981i3hZaGT8EB0Q1Pc4E=;
 b=GLpNtvLpIMotUMjMJ8u5834vENC1Bu/SXPlIgRvTOEKbjLRsW77aA6WTUrtK8XFTWp
 Oj0Mu9+gWE3VTf27imx7c2/cRUJTO3z7NluDzgSasA0HuUR5i/zkUoS6O19lN381Xeea
 cUkwTiAK8OjasJdERYiyE9Kjgzu/B0V4c2csPxxfObBsaWFWTdzEbW6woc1bEUCVoOJX
 /gXqAgSCwxNasG/SYLnDKhbYInAEjwqtB9ASrrYGf6nLiN1exfGTIESPnSzWo8DDXsg5
 ZfUf6WFR0P0yTXKIyIKGkordaxGdoUjINGctLYZ5RQi55fzUh937f4A1fUTNtqQPewxy
 NgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721316138; x=1721920938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQJnSHtMQef7mtUVuS0yssb981i3hZaGT8EB0Q1Pc4E=;
 b=wc39qguVsn4hEv/zfQZbRMT6rz7O82QTj3F0utveXdJZi2dqFP9qKuttTB9AxVjuJb
 25f6nxSOPdRhyO3G1R93eZIAU0KBh6JXQgEZMicbsTKNJJBe/Gf84oDGr+VFmWiiC8Bb
 JCpFwKtWZAkHWy/unl93AJYAbo3xtqUCcgmwDKs4/fZEbKTFGh344/3yWHmygXu+XwyV
 U2ITQOJjD5cpHTcb9oxfAA3nObTNQgaUUj6f7WT2+Fgbi/r+N0e4IQlQ7FaQ0B+s+cxi
 /4XfdpljxAben+MLwEeMvaJnlLk9QX4VvEg5uLsUxLIKLALOcdjEPYXpq1ViJlcCzl15
 ncXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWid/JjRS5GZoA5A6Lk3u6NC+sS0IKXOlZDxll5RcpjZfv7pQ1WGSDulc3h7RqXi5di2Oa9R7gsTSDy2OKObB3ZNpqDKAVdfnIqXqI0RCJo0/TMu3g8WukhwqK2sjN4LlvbBD8O4HO7n9+ggQ9Pcw==
X-Gm-Message-State: AOJu0YwysLFGXATmVdo6wn0ogChCIIn6hG5p9sEINaR+mFnMWUExF1Ft
 pYqOJDmAXKO5OFg8EbqR0kd6ICImcKIlvnSe20gdQC0IIsbTg9TkTkEtHUue7rcRfUOg3nhSBqC
 nI4BrH3fh5ssVPjxwCWXzE1ZxIVg=
X-Google-Smtp-Source: AGHT+IEiIcjze2sqfT1hps5RiIp13M1xmJPESEzqUtct0AXla+FiYHuqmHRs8F5ZJiFygKOSV/25hAiBvLnBodoW7Ms=
X-Received: by 2002:a05:6830:908:b0:708:c1e7:912a with SMTP id
 46e09a7af769-708e37889b9mr5937867a34.8.1721316138141; Thu, 18 Jul 2024
 08:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240718141735.884347-1-make24@iscas.ac.cn>
In-Reply-To: <20240718141735.884347-1-make24@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jul 2024 11:22:06 -0400
Message-ID: <CADnq5_MiT9BOdo4cxi=MWABu4u5qTtNvziUbOXsUrEqeUhWPZQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/amdgpu: Fix uninitialized variable warnings
To: Ma Ke <make24@iscas.ac.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com, asad.kamal@amd.com,
 le.ma@amd.com, kenneth.feng@amd.com, evan.quan@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu, Jul 18, 2024 at 10:17=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:
>
> Return 0 to avoid returning an uninitialized variable r.
>
> Cc: stable@vger.kernel.org
> Fixes: 230dd6bb6117 ("drm/amd/amdgpu: implement mode2 reset on smu_v13_0_=
10")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - added Cc stable line.
> ---
>  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c b/drivers/gpu/drm/=
amd/amdgpu/smu_v13_0_10.c
> index 04c797d54511..0af648931df5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
> @@ -91,7 +91,7 @@ static int smu_v13_0_10_mode2_suspend_ip(struct amdgpu_=
device *adev)
>                 adev->ip_blocks[i].status.hw =3D false;
>         }
>
> -       return r;
> +       return 0;
>  }
>
>  static int
> --
> 2.25.1
>
