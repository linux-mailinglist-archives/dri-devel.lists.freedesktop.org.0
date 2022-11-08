Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510A6218ED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B0610E4AB;
	Tue,  8 Nov 2022 16:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466D10E4AA;
 Tue,  8 Nov 2022 16:00:01 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id m204so15956338oib.6;
 Tue, 08 Nov 2022 08:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rQWR9yg5CMjikZZ2r20JPexBcqtHeW0qLuMNX9N7j+c=;
 b=Sm3Qqvk7rpotxm8tMX6U4k6sAj6XTDWsi2J7WE3eOYE6moWIKRSqyw6AgOgZLjnoVp
 xCC7DmJqJxry4uE/y8F5JWLY0heCgbpPgWxyCgBv/Elq/BgU+/QWxnBqbx5HWu3JBNuB
 DZVXgn3uJugiOpGZuNbKzfEss2x8floIKKoZpnqg6cQKuPFKns8yJa7GGEY+L14UycWb
 S7/a+74tU6vBP6DLHAkOwJSZjFi/QsxaWpPWTBoUWjgk3OI4iy8l1ObMh6WOrbrN1PoS
 E14NThDYcy9X8fz+xjijyL8ZTOQEtjG8Llg7oLOFxJjMGXXc9NVct/rmtTQw2Pbbk9qk
 htaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQWR9yg5CMjikZZ2r20JPexBcqtHeW0qLuMNX9N7j+c=;
 b=igQFYqq/FR+rIdZkmLysm/T0ZcQIoXKaJAkKcD1LF80yg6v4k1zXzwPwtM9t+JBV2Y
 tGXC3IyX5rhFOHPWMYGYdR/y+oyVzVorRDsEqGgibKB5QnqzVbNafvPZ/+9u0KH4cYDS
 /MUlnK/rxpPFI8FZ61NTvMQeRLjX7+scxhepe+lXRGKWSFHl8Z9Tgx5kl2eg84F3t4m4
 b/TRmOBhmwiE9nzrpEYnGdmHyTvC2QVXzfwf6/vmNSs59t6+Rx4vRkzmeIPFcqfzy/vD
 475oed5Tp7wjz/M4kZj9wki5+7pCQp3nWS5nbwYy2jb9JVi7tTWvQ8QbTvxy+Pk54xVw
 HfCQ==
X-Gm-Message-State: ACrzQf14vGcrlgYLeIb42+ek7v0UUtQsXRXeS9BwmgY9rg3EmmNLsCLP
 TZ+iBih9Bp2MTN91bLYgJaHal70n3PH01vQGs1s=
X-Google-Smtp-Source: AMsMyM7xaleGKPoZfpfaoNjmTRNkBto0+MBNOqoaWhcA2auPXlX8DcbOzRaxpoFsCjBS9kgxzXyZxbrD61rVDJXuiqI=
X-Received: by 2002:aca:b655:0:b0:35a:4fb4:c3d2 with SMTP id
 g82-20020acab655000000b0035a4fb4c3d2mr15977595oif.96.1667923200813; Tue, 08
 Nov 2022 08:00:00 -0800 (PST)
MIME-Version: 1.0
References: <Y2jQw6ve83Bvb/D9@mail.google.com>
In-Reply-To: <Y2jQw6ve83Bvb/D9@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Nov 2022 10:59:48 -0500
Message-ID: <CADnq5_Oi0ADZJ=_=DRLvRVF+q2qT_5f1H3nuTnZYh5PKpbXPPw@mail.gmail.com>
Subject: Re: [PATCH] [next] drm/amdgpu: Replace 1-element array with
 flexible-array member
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Slark Xiao <slark_xiao@163.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 7, 2022 at 4:33 AM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in structs _ATOM_GPIO_PIN_ASSIGNMENT,
> _ATOM_DISPLAY_OBJECT_PATH, _ATOM_DISPLAY_OBJECT_PATH_TABLE,
> _ATOM_OBJECT_TABLE and refactor the rest of the code accordingly.
>
> Important to mention is that doing a build before/after this patch results
> in no functional binary output differences.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/238
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>
> Binary difference findings:
>
>         Some changes took more than a single line which changed the line
>         number parameter passed to the drm_dbg function (which leverages
>         kernel's dynamic debugging). Functionally-wise, nothing changed
>         after doing a before/after patch build.
>
> Additional one-element arrays to be changed:
>
>         There are more instances of one-element arrays to be changed but
>         I will keep patches small so they are easy to review. [and I can
>         only dedicate a few hours per day on this :-) ]
>
> ---
>  .../gpu/drm/amd/display/dc/bios/bios_parser.c | 23 ++++++++++++-------
>  drivers/gpu/drm/amd/include/atombios.h        |  8 +++----
>  2 files changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> index 9b8ea6e9a2b9..39dd8b2dc254 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> @@ -138,7 +138,9 @@ static uint8_t get_number_of_objects(struct bios_parser *bp, uint32_t offset)
>
>         uint32_t object_table_offset = bp->object_info_tbl_offset + offset;
>
> -       table = GET_IMAGE(ATOM_OBJECT_TABLE, object_table_offset);
> +       table = ((ATOM_OBJECT_TABLE *) bios_get_image(&bp->base,
> +                               object_table_offset,
> +                               struct_size(table, asObjects, 1)));
>
>         if (!table)
>                 return 0;
> @@ -166,8 +168,9 @@ static struct graphics_object_id bios_parser_get_connector_id(
>         uint32_t connector_table_offset = bp->object_info_tbl_offset
>                 + le16_to_cpu(bp->object_info_tbl.v1_1->usConnectorObjectTableOffset);
>
> -       ATOM_OBJECT_TABLE *tbl =
> -               GET_IMAGE(ATOM_OBJECT_TABLE, connector_table_offset);
> +       ATOM_OBJECT_TABLE *tbl = ((ATOM_OBJECT_TABLE *) bios_get_image(&bp->base,
> +                               connector_table_offset,
> +                               struct_size(tbl, asObjects, 1)));
>
>         if (!tbl) {
>                 dm_error("Can't get connector table from atom bios.\n");
> @@ -1789,11 +1792,13 @@ static enum bp_result bios_parser_get_gpio_pin_info(
>         if (!DATA_TABLES(GPIO_Pin_LUT))
>                 return BP_RESULT_BADBIOSTABLE;
>
> -       header = GET_IMAGE(ATOM_GPIO_PIN_LUT, DATA_TABLES(GPIO_Pin_LUT));
> +       header = ((ATOM_GPIO_PIN_LUT *) bios_get_image(&bp->base,
> +                               DATA_TABLES(GPIO_Pin_LUT),
> +                               struct_size(header, asGPIO_Pin, 1)));
>         if (!header)
>                 return BP_RESULT_BADBIOSTABLE;
>
> -       if (sizeof(ATOM_COMMON_TABLE_HEADER) + sizeof(ATOM_GPIO_PIN_LUT)
> +       if (sizeof(ATOM_COMMON_TABLE_HEADER) + struct_size(header, asGPIO_Pin, 1)
>                         > le16_to_cpu(header->sHeader.usStructureSize))
>                 return BP_RESULT_BADBIOSTABLE;
>
> @@ -1978,7 +1983,8 @@ static ATOM_OBJECT *get_bios_object(struct bios_parser *bp,
>
>         offset += bp->object_info_tbl_offset;
>
> -       tbl = GET_IMAGE(ATOM_OBJECT_TABLE, offset);
> +       tbl = ((ATOM_OBJECT_TABLE *) bios_get_image(&bp->base, offset,
> +                               struct_size(tbl, asObjects, 1)));
>         if (!tbl)
>                 return NULL;
>
> @@ -2709,8 +2715,9 @@ static enum bp_result get_bracket_layout_record(
>
>         genericTableOffset = bp->object_info_tbl_offset +
>                 bp->object_info_tbl.v1_3->usMiscObjectTableOffset;
> -       object_table = (ATOM_OBJECT_TABLE *)
> -               GET_IMAGE(ATOM_OBJECT_TABLE, genericTableOffset);
> +       object_table = ((ATOM_OBJECT_TABLE *) bios_get_image(&bp->base,
> +                               genericTableOffset,
> +                               struct_size(object_table, asObjects, 1)));
>         if (!object_table)
>                 return BP_RESULT_FAILURE;
>
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index b5b1d073f8e2..55ae93c1e365 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -4386,7 +4386,7 @@ typedef struct _ATOM_GPIO_PIN_ASSIGNMENT
>  typedef struct _ATOM_GPIO_PIN_LUT
>  {
>    ATOM_COMMON_TABLE_HEADER  sHeader;
> -  ATOM_GPIO_PIN_ASSIGNMENT   asGPIO_Pin[1];
> +  ATOM_GPIO_PIN_ASSIGNMENT   asGPIO_Pin[];
>  }ATOM_GPIO_PIN_LUT;
>
>  /****************************************************************************/
> @@ -4513,7 +4513,7 @@ typedef struct  _ATOM_DISPLAY_OBJECT_PATH
>    USHORT    usSize;                                        //the size of ATOM_DISPLAY_OBJECT_PATH
>    USHORT    usConnObjectId;                                //Connector Object ID
>    USHORT    usGPUObjectId;                                 //GPU ID
> -  USHORT    usGraphicObjIds[1];                            //1st Encoder Obj source from GPU to last Graphic Obj destinate to connector.
> +  USHORT    usGraphicObjIds[];                            //1st Encoder Obj source from GPU to last Graphic Obj destinate to connector.
>  }ATOM_DISPLAY_OBJECT_PATH;
>
>  typedef struct  _ATOM_DISPLAY_EXTERNAL_OBJECT_PATH
> @@ -4530,7 +4530,7 @@ typedef struct _ATOM_DISPLAY_OBJECT_PATH_TABLE
>    UCHAR                           ucNumOfDispPath;
>    UCHAR                           ucVersion;
>    UCHAR                           ucPadding[2];
> -  ATOM_DISPLAY_OBJECT_PATH        asDispPath[1];
> +  ATOM_DISPLAY_OBJECT_PATH        asDispPath[];
>  }ATOM_DISPLAY_OBJECT_PATH_TABLE;
>
>  typedef struct _ATOM_OBJECT                                //each object has this structure
> @@ -4545,7 +4545,7 @@ typedef struct _ATOM_OBJECT_TABLE                         //Above 4 object table
>  {
>    UCHAR               ucNumberOfObjects;
>    UCHAR               ucPadding[3];
> -  ATOM_OBJECT         asObjects[1];
> +  ATOM_OBJECT         asObjects[];
>  }ATOM_OBJECT_TABLE;
>
>  typedef struct _ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT         //usSrcDstTableOffset pointing to this structure
> --
> 2.37.3
>
