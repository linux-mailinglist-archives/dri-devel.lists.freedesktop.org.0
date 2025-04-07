Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E61A7DEB8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BFB10E463;
	Mon,  7 Apr 2025 13:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HjJveQlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0A510E462;
 Mon,  7 Apr 2025 13:16:29 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-af90510be2eso246498a12.3; 
 Mon, 07 Apr 2025 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744031789; x=1744636589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7cCR1MuP2kYdCb0YqxaqR0Dqkjekp9ngJLjuSiWMX4=;
 b=HjJveQlZl7VdiH5So+dfDAX5rd121h9I0oWK1cMlzifIY4E8SJ6WcffihXhQ4YUXEY
 9LG6b1svEQeMU5/32G6vmJ3JPHBtIUfZAqMiqkEujnuCRECHNeFrxI4rv4an94Ju64P0
 +NnL/M30QiOK/dQ/6EWhYyexIWxTjWosMTTQ0sITFISuO4/9NwviezA5M6XsvPLGr3KX
 huJ+VDbTjxwAe3KuSmIk5VDITJUiS9I4c5iOo/hf7dW5IVBxzw8hpSos7fU4K7vwmuub
 PK3jYnZ9DIRjQP1dubRBFyURDYfwdgThI+kysCJmhLH6r8rrF7eXkaNx1akYFNKRKC7w
 +GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744031789; x=1744636589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7cCR1MuP2kYdCb0YqxaqR0Dqkjekp9ngJLjuSiWMX4=;
 b=T380vACkNfRYDkF5DKTDykO58+9GrqMNg3bKXwN3R9nXiQ172kX5uHZS1dMH3HwRH9
 HhIJ4LtcGvaB+fXn6NoyeAJJByySsUdRtSkR0RGSTrvfxeGW+N3qfRPsmTAO1OB4E97f
 1C/UO0hqSHEdT6clIkU+5/sG+8bYXpT0XAAaEkSADCJ7ocaSXhMiZgPME8ApJfRNdHUO
 09Igu77bj6ksMnZKfFXl1gJ9wpgICTmSxlz3LEqBwXCDxUwAJ8IsZscj3CqnmpKrlV2w
 VJoweFOK2vu6ck4wnjE9odvWWi5uQoMoDbQyaV8ws1+iymoddTeD6eYy0WOb2nAEmQCr
 Vgog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE56DVhQLqh78lDXH1xrxScTuLjm8vi7sSwQSzjB4nfbBP1O3cFyBrqs7s0BUs5oxFoS70qkzf@lists.freedesktop.org,
 AJvYcCWLJ5R+vxCnTwzQSbixVtnNU2IcCMAK3SzXGmIJPnm5gmpa6Vs3j7r4RngGn2MxoURglaJzQmoKvi+o@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaZwKS60kl9nUP/i1WRJaVneDTQEKvetsu3PwPClABxunEzCGl
 Aq+Omkr9CNSbdXiGFJhR+9xganX28LWUMdhBehzgRxVuSRfwcM8Bmow1aitDFcrrFZPnmx2MNyC
 Cec3aLo0rSa4XMvwwGVaivBtTW4M=
X-Gm-Gg: ASbGncszTmyVKat1BGuNT1dVXXmyYebuAmlPT8jkRrWLs0F2aFqehZCqPePgQQ9O9JH
 QRUoF0hun52uv2aaKW0sIMEFsA7F748ucsnzIU0v9PmGXqsnmyZXdNtDOeszTu5+Q980RkQc7F6
 fPZ22F1nGfrTxaluOJRr6t5qz8nA==
X-Google-Smtp-Source: AGHT+IGWsGXh2awIMFrukeFB4nL/EgfghTCD3qed+lyorBMGb+RwsVzpe4gd5IAuVIA6p04Z35Ji0j4QKUKfQ397qF8=
X-Received: by 2002:a17:90b:4ac7:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-306a49aafa0mr5487508a91.7.1744031788284; Mon, 07 Apr 2025
 06:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250407071627.1666-1-vulab@iscas.ac.cn>
In-Reply-To: <20250407071627.1666-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Apr 2025 09:16:16 -0400
X-Gm-Features: ATxdqUH55S0TFCTeQ1RCmu6WBynu-cBG5VFi3Gz6QmQJXLT7nDsvMJiHqxjBnk4
Message-ID: <CADnq5_MuOUbnxw3qNcUsvvAKVWL-Bx+_2n81bWPXgz4D5fuAeg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, hamza.mahfooz@amd.com, 
 chiahsuan.chung@amd.com, sunil.khatri@amd.com, alex.hung@amd.com, 
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, mario.limonciello@amd.com, 
 mwen@igalia.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 7, 2025 at 8:52=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wro=
te:
>
> The function fill_stream_properties_from_drm_display_mode() calls the
> function drm_hdmi_avi_infoframe_from_display_mode() and the
> function drm_hdmi_vendor_infoframe_from_display_mode(), but does
> not check its return value. Log the error messages to prevent silent
> failure if either function fails.

This description doesn't seem to match the code change below.

Alex

>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0396429a64be..d6feafb8fa3d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6152,8 +6152,8 @@ static void fill_stream_properties_from_drm_display=
_mode(
>
>         if (stream->signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A) {
>                 err =3D drm_hdmi_avi_infoframe_from_display_mode(&avi_fra=
me, (struct drm_connector *)connector, mode_in);
> -                if (err < 0)
> -                        dev_err(connector->dev, "Failed to setup avi inf=
oframe: %zd\n", err);
> +               if (err < 0)
> +                       dev_err(connector->dev, "Failed to setup avi info=
frame: %zd\n", err);
>                 timing_out->vic =3D avi_frame.video_code;
>                 err =3D drm_hdmi_vendor_infoframe_from_display_mode(&hv_f=
rame, (struct drm_connector *)connector, mode_in);
>                 if (err < 0)
> --
> 2.42.0.windows.2
>
