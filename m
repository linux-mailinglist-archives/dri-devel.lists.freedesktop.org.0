Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA2A6E078
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 18:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F184A10E0B9;
	Mon, 24 Mar 2025 17:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="In9VKNln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2B10E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 17:03:35 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54acc04516cso5008792e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742835810; x=1743440610;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DeN9WfYxC0Q4TCphxe2JDxLIbtUvxnnWqFPYQRJNGz0=;
 b=In9VKNlnmAnvfeQvEChQ7Udm7pRRyqZnTo9rHSRmVLZW+/UD1wm/q+lUPyojfvzaWv
 GsVPfau+2fWRbaDDz6bhAQ3a6kc9Zm7C8eBvk9dT4YzXOxrohlxijmC5pxiO78TiPua9
 L3D+5wMff6+VM6p+1ZnM+B1YcFimqxuDDOVE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742835810; x=1743440610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DeN9WfYxC0Q4TCphxe2JDxLIbtUvxnnWqFPYQRJNGz0=;
 b=dh9NiA0iROj2Op/lKLk29JtUdcW1X4n1BHnwyD/C57jKEMLgRECV6AK5nXtwpsxXS4
 schWCF2E9LyqGWQR355zDiJK2YHU9YcRaxAJFDxNRLVBJWPdgVp0CVLoCi9Fun6PRLF0
 eypcwgZiwBwvOFxCR0MfsgGdQ6Md9r1yA3R9XpvxMtSQrk4dkge8mWjpnUDaKfDfLamj
 FAC+AtYGWge21UwkvnwqJq4OMmQaqYhrpoVIrIKhCd2q1QRrcyK0+/PotyNr24YbS5Jj
 ejKCXlX1P38RA8jGURH4wpqphxAVdFaXAi/Hbo+TTp2LZxDpp1JMa8liy5AvgTQBboyN
 5dzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8G4Hnz9VbDzIXYoM2x6Jvn1eo7H/mkUO/hhGRLg1god8vU9uiBWty/EnMxXK6GE5uQHwRG6SwQlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO9xnFPYD0GkUnu98QB0MTNoHeNkrC0DHIUPy3WD7wCHHfXZIL
 otloZgFms51xcv9/76tEI6G26ZeNAMhp2I/SWgoFAlI4mWS4Wgm5aDOLy6QF7WY6vsVsZn1CvBi
 OJvFz
X-Gm-Gg: ASbGncv16slMeuFNatbCz3q8kZdm3HUIIU4E7/0y9BYOEs2RpL8T0mdVSlUkol2yhuM
 MGWHdwJkKq13sUyfrTHyYnpDRGay4JDi1dG7tXg/QZ5llmYidXsZ2wDbSGdoNjWNn8vBaMdhJRZ
 WlVg5y/eRRRUxG2Y7a/qTErAbByYLXcHjjvOVs4tpf5qqFVyNlymqw7Y8iJpJREf29e8d49ckgz
 z+qCBGx4vVblbN44+ygA4IlWB+n6oDiw02CHGYwo2AIo3WG1Wom07lpqp/bB9MCOipP88WpEywI
 HvYP+nPsDlPE1oeIJCK4DQKn1eHcQrs8/CEbH5Ev+6R+gmNoOAJxAAcZiJdkSEEipseGVjZ1RhX
 0QwUkaaad
X-Google-Smtp-Source: AGHT+IGrX+0/DEZnr8bpSdcN+4vftbGAmpL8eFHTtuk9q8VcSWlQJq/eo548+esx89dFArbUAyXfCg==
X-Received: by 2002:a05:6512:ea7:b0:545:2eca:863 with SMTP id
 2adb3069b0e04-54ad64f9f7fmr4274494e87.42.1742835809432; 
 Mon, 24 Mar 2025 10:03:29 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad647c52bsm1247008e87.74.2025.03.24.10.03.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 10:03:28 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54acc04516cso5008629e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV2AYQ5KkZSLiwr6bb8H+2iExKNw2tjE4CCcHLPBzGw22DmyJGf8lXL+niDIgi6bs9vuyj1amOXWxE=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b98:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-54ad6479e3bmr3997038e87.10.1742835804312; Mon, 24 Mar 2025
 10:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250323053007.681346-1-tejasvipin76@gmail.com>
In-Reply-To: <20250323053007.681346-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 10:03:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UATxXTwbXo5Dd-dn89hos2qF7agP-v4aHTc8w0J+yyPw@mail.gmail.com>
X-Gm-Features: AQ5f1Jrvf4X9H3KMfnQA-dDxNR8O7-iaJ7OGTYayURB_ZWvj4ShNTJPNpGFxHfg
Message-ID: <CAD=FV=UATxXTwbXo5Dd-dn89hos2qF7agP-v4aHTc8w0J+yyPw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx8394: transition to mipi_dsi wrapped
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 megi@xff.cz, javierm@redhat.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

On Sat, Mar 22, 2025 at 10:30=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> @@ -493,35 +481,28 @@ static int hx8394_enable(struct drm_panel *panel)
>  {
>         struct hx8394 *ctx =3D panel_to_hx8394(panel);
>         struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -       int ret;
> -
> -       ret =3D ctx->desc->init_sequence(ctx);
> -       if (ret) {
> -               dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret=
);
> -               return ret;
> -       }
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret) {
> -               dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret)=
;
> -               return ret;
> -       }
> +       ctx->desc->init_sequence(&dsi_ctx);
>
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>         /* Panel is operational 120 msec after reset */
> -       msleep(120);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret) {
> -               dev_err(ctx->dev, "Failed to turn on the display: %d\n", =
ret);
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +       if (dsi_ctx.accum_err)
>                 goto sleep_in;
> -       }
>
>         return 0;
>
>  sleep_in:
> +       int ret =3D dsi_ctx.accum_err;

I can't quite remember if kernel conventions allow local variables
defined in the middle of code like you're doing. Maybe safer to define
"int ret" at the top of the function?


> +
> +       dsi_ctx.accum_err =3D 0;
> +
>         /* This will probably fail, but let's try orderly power off anywa=
y. */
> -       if (!mipi_dsi_dcs_enter_sleep_mode(dsi))
> -               msleep(50);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 50);
>
>         return ret;
>  }

If I'm reading it right, the above is a slight change in behavior.
Previously if the init_sequence() or mipi_dsi_dcs_exit_sleep_mode()
returned an error then you wouldn't run the
mipi_dsi_dcs_enter_sleep_mode(). Now you will.

If we're certain that this change is correct it should be mentioned in
the commit message. If not then we should make it function the way it
used to.

If we do want to keep it the way you have it, my own personal
preference would also be to rearrange the code and get rid of the
"goto", though I can see some argument for keeping the "goto" to make
it obvious where error handling is... Up to you.
