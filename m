Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B557831134
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 03:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD9D10E0AB;
	Thu, 18 Jan 2024 02:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14CC10E0AB;
 Thu, 18 Jan 2024 02:02:26 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55a064b4871so139391a12.0; 
 Wed, 17 Jan 2024 18:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705543285; x=1706148085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+ORuyfvKPKlivBCBwrn1aG4zMB6FM+NFT/lRf60y+w=;
 b=d/HRrM17r+xJ9hLuTSxHgLNw9m3SI0MjLZ+fd6RFXxp7Fky1nF0C8Fkiga6Lc+REJs
 meJsddIDM2tKfh1YcRvBH/4uwTFeINojqn4QBxCego2qnOhWoUE3gL152M6PEv+QWtYi
 aEyCqe2IjQ2FEABa3sKi2n1SJWhM2QtZ+xzV3gxo3dP9sXrP0Ew3ra7rt/KI+maS3D2Q
 2A2onjVzh0NwbJp7TDvFn/7IjSkSWU3zcqIaXYneq4rSl/A2HbZsIzMlwfZXkTP2Cx5R
 8psRzDM8PXQqifLg8X2iYzuM1W3tcErTFt1ocB6KtAQZWIEePBBLPeUW4g43Xz/zMn+i
 s9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705543285; x=1706148085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+ORuyfvKPKlivBCBwrn1aG4zMB6FM+NFT/lRf60y+w=;
 b=dbuLViFV7hvcupIBGkM7j/CL8LfIYMUUheC9D1HUMDnpCkvt6f3bQLq7mtE3+Im9Um
 QgYHwnRcdjNPlpsKeoSxt+mDOOxi3srlejfrKNlks2nQkoaVjl+HWO+ubtYo1CCinBGR
 mVfr5HVHDIjDkBKqwGDzeAuWow/7+8Fa27EJHPgnO+GPVY8YHT4HwaV69APit05q2W8f
 nnekdtrA0Ep0IJ+zy6IWqaRqd41jWx7gj57QUi2ndQtmdCvAZUldTBRTnFs0oOhS9/V9
 OVImzRolBN5Z2tL85jh++01Owc2cn1QppmcinOqEpjoXMcrFYpON6wWF15VBi0/R+Zoq
 LIZw==
X-Gm-Message-State: AOJu0YxZtlkfrLgCOBxnODSp4Xxn6sKOVJIsvXAl0TmjqaXWnDhTk60d
 X73S/v88EA5/TFeLYoT2Avmz///JLDwLjCVAXkx4x2uYOPv5s0nZ887Q5rURY6j7kYg1zu/Rvsi
 Y8HU7CckIJrv36KhiRdiUfJybTFc=
X-Google-Smtp-Source: AGHT+IFMLQzKS1z+NdIXFGvpFMPMfnfLjyk/zsZHuQ0OYD6RNNRTTG/elCwMSGh3SYfO3ZRlEQK10xOOeARR4/IibAc=
X-Received: by 2002:a17:906:1653:b0:a28:ff59:12eb with SMTP id
 n19-20020a170906165300b00a28ff5912ebmr36518ejd.139.1705543285151; Wed, 17 Jan
 2024 18:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-4-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-4-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 18 Jan 2024 10:01:13 +0800
Message-ID: <CAKGbVbt_1SUmTftqA5H27keCeH+u2ibrevy=cW8KsJSHu8YRdw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] drm/lima: set bus_stop bit before hard reset
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do we need same for GP?

Regards,
Qiang

On Wed, Jan 17, 2024 at 11:12=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
>
> This is required for reliable hard resets. Otherwise, doing a hard reset
> while a task is still running (such as a task which is being stopped by
> the drm_sched timeout handler) may result in random mmu write timeouts
> or lockups which cause the entire gpu to hang.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_pp.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_p=
p.c
> index a8f8f63b8295..ac097dd75072 100644
> --- a/drivers/gpu/drm/lima/lima_pp.c
> +++ b/drivers/gpu/drm/lima/lima_pp.c
> @@ -168,6 +168,11 @@ static void lima_pp_write_frame(struct lima_ip *ip, =
u32 *frame, u32 *wb)
>         }
>  }
>
> +static int lima_pp_bus_stop_poll(struct lima_ip *ip)
> +{
> +       return !!(pp_read(LIMA_PP_STATUS) & LIMA_PP_STATUS_BUS_STOPPED);
> +}
> +
>  static int lima_pp_hard_reset_poll(struct lima_ip *ip)
>  {
>         pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC01A0000);
> @@ -181,6 +186,14 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
>
>         pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC0FFE000);
>         pp_write(LIMA_PP_INT_MASK, 0);
> +
> +       pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_STOP_BUS);
> +       ret =3D lima_poll_timeout(ip, lima_pp_bus_stop_poll, 10, 100);
> +       if (ret) {
> +               dev_err(dev->dev, "pp %s bus stop timeout\n", lima_ip_nam=
e(ip));
> +               return ret;
> +       }
> +
>         pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
>         ret =3D lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
>         if (ret) {
> --
> 2.43.0
>
