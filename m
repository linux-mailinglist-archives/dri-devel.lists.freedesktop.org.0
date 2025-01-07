Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD8A0372E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 05:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CBF10EA6A;
	Tue,  7 Jan 2025 04:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jw7QGUMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5BE10EA6A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 04:57:59 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53e399e3310so17743837e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 20:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736225816; x=1736830616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBxv3L4V3CuMLAM6MHNgZpE4ry61STQ8cbQnyRyHnVY=;
 b=jw7QGUMRouLV8Zmg6lRYBjMzPSECLqtJuqweX9KwbauHbcPvpKg+fl/s/3hjeMHWib
 7Ir9EeIOE7LhFXBMxSujGTD/uDkMdg7FbR/zzcMa6zv35a/JCBmbY6qYITa19ht/Zw3L
 fwHvvJ53O/TUWy9AEtTvy2ezn50j8YIWvVYJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736225816; x=1736830616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBxv3L4V3CuMLAM6MHNgZpE4ry61STQ8cbQnyRyHnVY=;
 b=kfJ4HTvfXQVyf9aybsZ9B3tar6Z/2QqjcJc6Dc6cxc8v9wE6I5w0N71a3wojOZI/on
 FhzLk3OmWsZrcIK2txP/4SD53VtbRXI8tbp6Buc/AMQdyVbAYuANspNxuLvXuxMN5fVm
 MCvLxC0nClUTfNcYTzbVLk2SYVJh46bXELKDobBP99CC5JRTaokiLZwPBkm/Xq4dVL1J
 j9OKnRpG3slwPacxSmV7ddma0LmfSZKStKgayz0Kxo8WMRqPDnKMKsF3mv7243WREqz3
 wAVBvelzrOoXbxflKR7aTLwG3ebV6+hM/iTfrNZ/0aAQooaiJucxo8RqTpSvAWOb+HlM
 /sBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV3uYyOPhYkYM7vTZW7dhLEasg2KeN2rJHovb/VdE1UyqFZFdzEh079ePZmRjcgLbAu3kS3R5OKyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcBn2yFbBPSAODPoF4yGlgck4gqisLVwptLV+xAPI6vssVcSPU
 cYOciFSXTSOTRaQsB8CjnGhfLDFNgzysLqPUoCLdkMvNEQLlNA5Lvo3aPMa/yGoG2BVmUpx9h7J
 jHWHr
X-Gm-Gg: ASbGncsL9zPLtuezvvQazdCemhGZgaQHnmw1Np5CBVpSU1BtqaRkAnsh8jIM1K6BkIK
 2CZo4jNQ3p/ghS7mWnG7gIYXmN3MU4fy87mTo2U8vRMxxX29JZqJYtEBM0FASY6gIPS5FvOoapb
 lIu7KLrj4sXbOhVnSkBVwnf54+zfpPhOhFjEHBo3Ide6b4DiFVKKrxMoLZXXGcCdX+FFSqdCiQa
 27cEX0IecAtk73kzbmPT7upHzOQO4cXu6GJ9Rcr/QIHbP878x3NIL1KZhgsf3wErfTwhOHhuqOb
 mppdwS2oMHpt4l3YJ+b3
X-Google-Smtp-Source: AGHT+IFdC7UTHXJxlfSp7nepiv1May0NN8JpeM4cj5jGQmaS2e+lZ5owZuyuP2LePcah+LpKUeW/GQ==
X-Received: by 2002:a2e:b893:0:b0:302:336a:8ada with SMTP id
 38308e7fff4ca-30468607f65mr185912161fa.27.1736225312208; 
 Mon, 06 Jan 2025 20:48:32 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083b26sm57881991fa.103.2025.01.06.20.48.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 20:48:31 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so15419498e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 20:48:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4w2MLD3qjDxCrk/wPq/c6EeouYbPtknJIvAA6wn1YGlpd6eYZjhZy1Xsuu3vWbW7IQdn2BnFeaLk=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3192:b0:540:1f7d:8bc4 with SMTP id
 2adb3069b0e04-5422956ba37mr17338108e87.48.1736225310689; Mon, 06 Jan 2025
 20:48:30 -0800 (PST)
MIME-Version: 1.0
References: <20241223052049.419831-1-tejasvipin76@gmail.com>
 <47738b2b-351b-4df9-a50a-f4dff51441c8@linaro.org>
 <CAD=FV=WEEbC+LB9TM8VHDgO41=XPdgJR6eSYHo=KytDbPTROqw@mail.gmail.com>
 <70f0dbf2-dd84-4a50-94cc-1d388c5c93fe@gmail.com>
In-Reply-To: <70f0dbf2-dd84-4a50-94cc-1d388c5c93fe@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2025 20:48:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XV8D2X98ULLhT0ChAfSxiBgA1uh6tRtzGv8RpXiFYN+Q@mail.gmail.com>
X-Gm-Features: AbW1kvZxrzzgWKkmpuLaU7mDNQ6eHED_pThqKJ9skNO7Vjf5ef0Wnu_bXNH1LQ4
Message-ID: <CAD=FV=XV8D2X98ULLhT0ChAfSxiBgA1uh6tRtzGv8RpXiFYN+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Mon, Jan 6, 2025 at 8:21=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> >>> -     ret =3D xpp055c272_init_sequence(ctx);
> >>> -     if (ret < 0) {
> >>> -             dev_err(ctx->dev, "Panel init sequence failed: %d\n", r=
et);
> >>> -             goto disable_iovcc;
> >>> -     }
> >>> -
> >>> -     ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> >>> -     if (ret < 0) {
> >>> -             dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", re=
t);
> >>> -             goto disable_iovcc;
> >>> -     }
> >>> +     xpp055c272_init_sequence(&dsi_ctx);
> >>> +     dev_dbg(ctx->dev, "Panel init sequence done\n");
> >
> > Should the above print be only if "accum_err" is 0? That would match
> > the previous behavior. I guess I would have also left the print as
> > part of xpp055c272_init_sequence() unless there's a reason for moving
> > it...
>
> I don't think it should print only if accum_err is 0. In the previous
> code, it would just print after all the msleeps and write_seqs are done,
> with no error checking at any point.

How sure are you about this? Remember the reason why we wanted to
deprecate mipi_dsi_dcs_write_seq()? All those dang hidden return
values. So if any one of the old mipi_dsi_dcs_write_seq() got an error
they would have had a non-obvious return out of the function, right?
So the print would have only happened if all of the commands executed
successfully...

:-P


> The reason I've moved the print outside the function is because we are
> able to reduce a couple lines of code by passing dsi_ctx to the function
> instead of ctx. If I'd kept the print inside, it would require us to
> declare a `struct device*` variable which would require ctx as far as
> I've seen and just overall introduces some lines that we could otherwise
> avoid. I've done this in a couple other panels too.

Ah, OK. That's a reasonable reason. Thanks for the explanation...


-Doug
