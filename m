Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B3B12614
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 23:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99AC10E10B;
	Fri, 25 Jul 2025 21:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="I/DEwNV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C9D10E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 21:16:45 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b34a78bb6e7so2277166a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753478201; x=1754083001;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7cqUBtmisnuPeRZVUL+pQK8RmL59JAS5kkk6fLd2w4=;
 b=I/DEwNV77SY6cS49fa5JrdszCPadP2r83vIB+Ep18Y/KMkCvXf1Nk8gvUA2xMV2H2C
 9+JE68EsxHIom8wHjcXGwqtMSMzI+a+wiJiZmj9zBWk7NoMQohPOIU7BALBmXboNgxq8
 jqXuuNctayqRG+SvLh8x35reqorTa7ucvJn9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753478201; x=1754083001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7cqUBtmisnuPeRZVUL+pQK8RmL59JAS5kkk6fLd2w4=;
 b=mI9P5Fw3XFn5/XBJ3F3iaXKIV4YA4mi/nG3RxqcCu/EoEvOFySyYh5fu1iQcButaGC
 0xKItqQpebva9ys3K6kjtluEdi53CbJbLO/0F02nTQEJi2+ZsA6GEXeCcgieZL8ty8r6
 S86h16Emb6hkiFahPGcd3wD+8hTlPho0xjSuSEbN0+V8uTYL36A5BeJTwU3MaOaw761O
 CbxFgaXWG++s+uNBMu2Kjpiehp4Jn7ZKw/KuZQ/VpA5cXaAh4ywrm4D/aE95ISo2SktN
 R0XNnHkBSRLq/wdEsARg51zZDoRKLOyQJbyE/QeA64U30Yw/l/lFemj/DRcKR4XNfkUh
 BRvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5LACJmRRuDRqN0Xw+NCFj7TIuS4UwvkTr3xJW2NADoYCouOhlF79DBYNgGwWmSdoFHBbchYiHKJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCedbRP7a9ETK5/x5dSLhC9L2z2ap5ckO17bLUI4jxw51w8wtS
 VSncaSzxuBBh83VahaB0tmmTsv6/WDgJ0a/Sqzca6HCg+2UsLycWYEa+khOqLHo43pCi8NWZV1l
 1hY4=
X-Gm-Gg: ASbGnct33f1+dFee6ENWIUhjB9hRDJD+Ej1ZzVVE6qwYrCUWlEqXuypglEck5ceLsjj
 NOAbkoqWVouZAJeZUh0LUzNpdUcSSLIORCdu/NxSHDaW7Bu5HtLIUGRpc7Fnl8P3edI6ySeF8lG
 iikUv64cWZ/DO//8jMMzPYer+cYCXOqOB5R8VEmhJC981I4E2unKFjEwyTsWn+yZv/gP2rOAc4m
 2R9Ef+QNWtNIqBAGF0M09UStwxI77F1jLXUlkudJH6ZGjG1C+vsNE6DvMQcugRHT81zRm017Z0S
 74jbzhwrJcm7p46RSFdE1HYw3RYJGZ/F+0PNaewaXrqh06XdM2YwKfrhscoC+z/loTll/9hvapB
 DQgy+gmcrqc77NNBAIJENUPOU/+FtQxBKzYbgETjkLFvvrmNAwla3CxiMV89PdR3arQ==
X-Google-Smtp-Source: AGHT+IHKwXjYCuvBaBjVuzAvnGsyrM8vKtYlI1ASaee0dWSPcV8p8mRz0Y0X+dDdMHe1uxXpDuwgmw==
X-Received: by 2002:a05:6a20:7285:b0:215:df90:b298 with SMTP id
 adf61e73a8af0-23d7015a371mr5711889637.26.1753478201433; 
 Fri, 25 Jul 2025 14:16:41 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com.
 [209.85.215.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c02e2bsm411490b3a.53.2025.07.25.14.16.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 14:16:39 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso1939492a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXFz0XTfOjDKqBkJkCkXEz/EUkDXGpuuGByj4cwK3VSOuPGOPodrEjn2jNoyNBehhcNNvmb63OUd3k=@lists.freedesktop.org
X-Received: by 2002:a17:90b:53cc:b0:315:c77b:37d6 with SMTP id
 98e67ed59e1d1-31e779fcfb2mr4543990a91.23.1753478198547; Fri, 25 Jul 2025
 14:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-2-me@brighamcampbell.com>
In-Reply-To: <20250724202338.648499-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jul 2025 14:16:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
X-Gm-Features: Ac12FXwuy3K1ITZUFyK7_VvNz0LpuHmryqPozv35YYsEjO_5SuA5IxC-IXYo5jQ
Message-ID: <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Create mipi_dsi_dcs_read_multi()
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
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

Hi,

On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> +void mipi_dsi_dcs_read_multi(struct mipi_dsi_multi_context *ctx, u8 cmd,
> +                            void *data, size_t len)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       struct mipi_dsi_msg msg =3D {
> +               .channel =3D dsi->channel,
> +               .type =3D MIPI_DSI_DCS_READ,
> +               .tx_buf =3D &cmd,
> +               .tx_len =3D 1,
> +               .rx_buf =3D data,
> +               .rx_len =3D len
> +       };
> +       ssize_t ret;
> +
> +       if (ctx->accum_err)
> +               return;
> +
> +       ret =3D mipi_dsi_device_transfer(dsi, &msg);
> +       if (ret < 0) {
> +               ctx->accum_err =3D ret;
> +               dev_err(dev, "transferring dcs message %xh failed: %d\n",=
 cmd,

Format code "%xh" is probably not exactly what you want. If the error
code is 0x10 it will print 10h, which is not very standard. You
probably copied it from the write routine which uses "%*ph". There the
"h" means something. See Documentation/core-api/printk-formats.rst.
Probably you want "%#x".

I'd probably also say "dcs read with cmd" rather than "transferring
dcs message".
