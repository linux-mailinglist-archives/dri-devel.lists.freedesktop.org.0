Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727B772C0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6492F10E318;
	Mon,  7 Aug 2023 17:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266AA10E318;
 Mon,  7 Aug 2023 17:07:56 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1bb75afeee3so3508553fac.0; 
 Mon, 07 Aug 2023 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428075; x=1692032875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNzZQ+NIGCLYdKkCdgPTcseTFitCm2erAU7nFmqF0U8=;
 b=jZ6OBxB4XRqSubR9akBWwvcxHAoVf7ke4KLmippVdxId+IlLgKzXHSE0R0UHevPSTZ
 261Qa1Xb139hfAFJrFIg7rWkTwUqewhs+gH6pYfjJ3mFUVOKXH+atftAtRtxQaLvquWc
 7/CGWQEpezdGu0r+hiacNHRIzEm++XAfKjHa/HHZGi2umEwOmpICbQpYB0dmfXlNqZh1
 WSxsUDhv+VhtnA13XjgYT6BPbmU3cO4aYCIfugLzKYi5mHghEYE44VP8McYiQv/frTpm
 qcE2bIcOd4V9g2AKdVq5K7wf3Udkt4UkB/XCoF4HXI9ocrMxBDehAOkn1pa+GmZJr7+f
 k8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428075; x=1692032875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNzZQ+NIGCLYdKkCdgPTcseTFitCm2erAU7nFmqF0U8=;
 b=GpY7Usc5n9gnplk9OQpogNcRLOGb+XlfCDXi9R2bpDMcdfmg5KfzsdqRQWordtlPH6
 3wl8UZ3YK6OJBzbyLuWRDF85FU7eVFkiW3H0SwKNJUt7Ao/Szj/xrz3nLfTC0688fxO3
 ilXz46YJv3r1zjgJb5EH9nvYxDcW7ZdDCTVnk9now+cUhRaEsgcB7umnUDtG2MtKroZZ
 ++ecSrXO/sFDAJdrvaAUNG1UlDuavcQWenh6gx8wC7gNreyS4GxU7oTClLc8+AYc1dof
 iutgqGFSBAOg5gF2vQs7xG5vA8omex7xLjtnpKoE23IU+oMqEf57J0td/jWgPP3ZsZw6
 wJfw==
X-Gm-Message-State: AOJu0YyaiKTxRBs3xrdZn3Dr2dAJQa/8wwepI1gMw6GzmNwElkne6GxR
 Pxlfqc+Z7GWkwvBfV2Ty1maVDBEGrS3mnBfqR2E=
X-Google-Smtp-Source: AGHT+IEFUyFd2cT1tI+gNgP1IWErdwV3EmKpBZOnRM0udVvEu2T1rrcA1RTiyVbEtqiDC/DqMmLTo3uKs+aedZXm8P4=
X-Received: by 2002:a05:6870:9109:b0:1bf:1c49:7455 with SMTP id
 o9-20020a056870910900b001bf1c497455mr11109115oae.6.1691428075301; Mon, 07 Aug
 2023 10:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230802024346.10104-1-sunran001@208suo.com>
In-Reply-To: <20230802024346.10104-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:07:44 -0400
Message-ID: <CADnq5_N9SDN5mK_DBdfb-pKkt_+9mzKMDJESb9FyAArf1svzGg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in ddc_regs.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 10:44=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/display/dc/gpio/ddc_regs.h    | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h b/drivers/gpu=
/drm/amd/display/dc/gpio/ddc_regs.h
> index 59884ef651b3..4a2bf81286d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
> @@ -31,21 +31,21 @@
>  /****************************** new register headers */
>  /*** following in header */
>
> -#define DDC_GPIO_REG_LIST_ENTRY(type,cd,id) \
> +#define DDC_GPIO_REG_LIST_ENTRY(type, cd, id) \
>         .type ## _reg =3D   REG(DC_GPIO_DDC ## id ## _ ## type),\
>         .type ## _mask =3D  DC_GPIO_DDC ## id ## _ ## type ## __DC_GPIO_D=
DC ## id ## cd ## _ ## type ## _MASK,\
>         .type ## _shift =3D DC_GPIO_DDC ## id ## _ ## type ## __DC_GPIO_D=
DC ## id ## cd ## _ ## type ## __SHIFT
>
> -#define DDC_GPIO_REG_LIST(cd,id) \
> +#define DDC_GPIO_REG_LIST(cd, id) \
>         {\
> -       DDC_GPIO_REG_LIST_ENTRY(MASK,cd,id),\
> -       DDC_GPIO_REG_LIST_ENTRY(A,cd,id),\
> -       DDC_GPIO_REG_LIST_ENTRY(EN,cd,id),\
> -       DDC_GPIO_REG_LIST_ENTRY(Y,cd,id)\
> +       DDC_GPIO_REG_LIST_ENTRY(MASK, cd, id),\
> +       DDC_GPIO_REG_LIST_ENTRY(A, cd, id),\
> +       DDC_GPIO_REG_LIST_ENTRY(EN, cd, id),\
> +       DDC_GPIO_REG_LIST_ENTRY(Y, cd, id)\
>         }
>
> -#define DDC_REG_LIST(cd,id) \
> -       DDC_GPIO_REG_LIST(cd,id),\
> +#define DDC_REG_LIST(cd, id) \
> +       DDC_GPIO_REG_LIST(cd, id),\
>         .ddc_setup =3D REG(DC_I2C_DDC ## id ## _SETUP)
>
>         #define DDC_REG_LIST_DCN2(cd, id) \
> @@ -54,34 +54,34 @@
>         .phy_aux_cntl =3D REG(PHY_AUX_CNTL), \
>         .dc_gpio_aux_ctrl_5 =3D REG(DC_GPIO_AUX_CTRL_5)
>
> -#define DDC_GPIO_VGA_REG_LIST_ENTRY(type,cd)\
> +#define DDC_GPIO_VGA_REG_LIST_ENTRY(type, cd)\
>         .type ## _reg =3D   REG(DC_GPIO_DDCVGA_ ## type),\
>         .type ## _mask =3D  DC_GPIO_DDCVGA_ ## type ## __DC_GPIO_DDCVGA #=
# cd ## _ ## type ## _MASK,\
>         .type ## _shift =3D DC_GPIO_DDCVGA_ ## type ## __DC_GPIO_DDCVGA #=
# cd ## _ ## type ## __SHIFT
>
>  #define DDC_GPIO_VGA_REG_LIST(cd) \
>         {\
> -       DDC_GPIO_VGA_REG_LIST_ENTRY(MASK,cd),\
> -       DDC_GPIO_VGA_REG_LIST_ENTRY(A,cd),\
> -       DDC_GPIO_VGA_REG_LIST_ENTRY(EN,cd),\
> -       DDC_GPIO_VGA_REG_LIST_ENTRY(Y,cd)\
> +       DDC_GPIO_VGA_REG_LIST_ENTRY(MASK, cd),\
> +       DDC_GPIO_VGA_REG_LIST_ENTRY(A, cd),\
> +       DDC_GPIO_VGA_REG_LIST_ENTRY(EN, cd),\
> +       DDC_GPIO_VGA_REG_LIST_ENTRY(Y, cd)\
>         }
>
>  #define DDC_VGA_REG_LIST(cd) \
>         DDC_GPIO_VGA_REG_LIST(cd),\
>         .ddc_setup =3D mmDC_I2C_DDCVGA_SETUP
>
> -#define DDC_GPIO_I2C_REG_LIST_ENTRY(type,cd) \
> +#define DDC_GPIO_I2C_REG_LIST_ENTRY(type, cd) \
>         .type ## _reg =3D   REG(DC_GPIO_I2CPAD_ ## type),\
>         .type ## _mask =3D  DC_GPIO_I2CPAD_ ## type ## __DC_GPIO_ ## cd #=
# _ ## type ## _MASK,\
>         .type ## _shift =3D DC_GPIO_I2CPAD_ ## type ## __DC_GPIO_ ## cd #=
# _ ## type ## __SHIFT
>
>  #define DDC_GPIO_I2C_REG_LIST(cd) \
>         {\
> -       DDC_GPIO_I2C_REG_LIST_ENTRY(MASK,cd),\
> -       DDC_GPIO_I2C_REG_LIST_ENTRY(A,cd),\
> -       DDC_GPIO_I2C_REG_LIST_ENTRY(EN,cd),\
> -       DDC_GPIO_I2C_REG_LIST_ENTRY(Y,cd)\
> +       DDC_GPIO_I2C_REG_LIST_ENTRY(MASK, cd),\
> +       DDC_GPIO_I2C_REG_LIST_ENTRY(A, cd),\
> +       DDC_GPIO_I2C_REG_LIST_ENTRY(EN, cd),\
> +       DDC_GPIO_I2C_REG_LIST_ENTRY(Y, cd)\
>         }
>
>  #define DDC_I2C_REG_LIST(cd) \
> @@ -150,12 +150,12 @@ struct ddc_sh_mask {
>
>  #define ddc_data_regs(id) \
>  {\
> -       DDC_REG_LIST(DATA,id)\
> +       DDC_REG_LIST(DATA, id)\
>  }
>
>  #define ddc_clk_regs(id) \
>  {\
> -       DDC_REG_LIST(CLK,id)\
> +       DDC_REG_LIST(CLK, id)\
>  }
>
>  #define ddc_vga_data_regs \
> --
> 2.17.1
>
