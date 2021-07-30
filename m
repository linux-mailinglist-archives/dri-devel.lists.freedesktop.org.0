Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8083DB0FF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 04:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49856F38A;
	Fri, 30 Jul 2021 02:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C196F38A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 02:07:41 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id x15so11028061oic.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 19:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D0jPV269cYXFuIt6Gg1NVjQqzHNY0R6AeOaqh70FYAY=;
 b=UQ4StuH+DV1mlw3qbMZgZqS0W/jM+IYyKqGTsK7CCyudOFJqjMOPgxs9vsqDnCJoP6
 3pd66K8FNPBlfDWltlnHUrITBiNSdAYHMAkIMF/uihVNT34lYZ1wZQTJoPkulvWH737z
 LqETed/2CQQrr8NO4M78tvKViM2tHQba1IfU4RNitwiI7ZNg7IQlcW8tZ9Imes3oAN1B
 gAoU0lUFYw9Z0UflVLDQ3xNWDkqo988wH+chofI1wx4xmvnD3Vxjg86eRKarVb1SJVpV
 3GViJpAf4i0F3TsyRuAXd/E+0oWzfua/5+WjRVLUBb5NU2Om9H0HD+h6nyrQ2t7aBs21
 C0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D0jPV269cYXFuIt6Gg1NVjQqzHNY0R6AeOaqh70FYAY=;
 b=HizJahTkw1zaePKjocMVkVanDq+8f638w5i9rYUuc3ou5gekYgUcmWAjbHjX/umgLW
 mgutNHnXVCt1nt1yB+A3ZLV3bX2eealW3wNLTHvh2VceQnnrNL8Dow4ZDUkgxf5gOVEL
 8XDy+taSSwRaZj4VUV6NCJWSPcx1PONVhIwqFAX6l5n9isj2N1B47QnFWLhK7DS0K8TL
 +/KFsIhOU4YF8WjTNfX+/oN/cEUC4Z1hzCgyZYOJJFAfMurizGBImspkzvl/PQcwKpW+
 rDQqYjkED7jLMwvgjthjCxZeqa7WCqlxE3YXjSwH1GKBtgeg009BgLNcRENZKK4enCtk
 5s1g==
X-Gm-Message-State: AOAM533YOt4qj1VxhYSbqvEX9sFbGF9uAwmfjnQYcMquiIP2mT9+7Mxi
 RRy3icrdmO2A2jRkssOW9b4Z4mM4bZDFy5WdRzk=
X-Google-Smtp-Source: ABdhPJwn1lXSHIicKah+qYpBUM9Q2Dq+rb8SZH5updqv9NaItUsGju5BLBpFqdH7M/2dvwSSq7cs2Y5/1ISKMzJIlSU=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr178642oiw.123.1627610860403; 
 Thu, 29 Jul 2021 19:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-24-keescook@chromium.org>
In-Reply-To: <20210727205855.411487-24-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Jul 2021 22:07:29 -0400
Message-ID: <CADnq5_Npb8uYvd+R4UHgf-w8-cQj3JoODjviJR_Y9w9wqJ71mQ@mail.gmail.com>
Subject: Re: [PATCH 23/64] drm/amd/pm: Use struct_group() for memcpy() region
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 Network Development <netdev@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 5:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
>
> Use struct_group() in structs:
>         struct atom_smc_dpm_info_v4_5
>         struct atom_smc_dpm_info_v4_6
>         struct atom_smc_dpm_info_v4_7
>         struct atom_smc_dpm_info_v4_10
>         PPTable_t
> so the grouped members can be referenced together. This will allow
> memcpy() and sizeof() to more easily reason about sizes, improve
> readability, and avoid future warnings about writing beyond the end of
> the first member.
>
> "pahole" shows no size nor member offset changes to any structs.
> "objdump -d" shows no object code changes.

These headers represent interfaces with firmware running on
microcontrollers, so if the sizes or offsets change that could cause a
problem.  That doesn't seem to be the case, but something to keep in
mind.  Patch is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this through whatever tree makes sense.

Alex

>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/amd/include/atomfirmware.h           |  9 ++++++++-
>  .../gpu/drm/amd/pm/inc/smu11_driver_if_arcturus.h    |  3 ++-
>  drivers/gpu/drm/amd/pm/inc/smu11_driver_if_navi10.h  |  3 ++-
>  .../gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h   |  3 ++-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c    |  6 +++---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c      | 12 ++++++++----
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c   |  6 +++---
>  7 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
> index 3811e58dd857..694dee9d2691 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -2081,6 +2081,7 @@ struct atom_smc_dpm_info_v4_5
>  {
>    struct   atom_common_table_header  table_header;
>      // SECTION: BOARD PARAMETERS
> +  struct_group(dpm_info,
>      // I2C Control
>    struct smudpm_i2c_controller_config_v2  I2cControllers[8];
>
> @@ -2159,7 +2160,7 @@ struct atom_smc_dpm_info_v4_5
>    uint32_t MvddRatio; // This is used for MVDD Vid workaround. It has 16 fractional bits (Q16.16)
>
>    uint32_t     BoardReserved[9];
> -
> +  );
>  };
>
>  struct atom_smc_dpm_info_v4_6
> @@ -2168,6 +2169,7 @@ struct atom_smc_dpm_info_v4_6
>    // section: board parameters
>    uint32_t     i2c_padding[3];   // old i2c control are moved to new area
>
> +  struct_group(dpm_info,
>    uint16_t     maxvoltagestepgfx; // in mv(q2) max voltage step that smu will request. multiple steps are taken if voltage change exceeds this value.
>    uint16_t     maxvoltagestepsoc; // in mv(q2) max voltage step that smu will request. multiple steps are taken if voltage change exceeds this value.
>
> @@ -2246,12 +2248,14 @@ struct atom_smc_dpm_info_v4_6
>
>    // reserved
>    uint32_t   boardreserved[10];
> +  );
>  };
>
>  struct atom_smc_dpm_info_v4_7
>  {
>    struct   atom_common_table_header  table_header;
>      // SECTION: BOARD PARAMETERS
> +  struct_group(dpm_info,
>      // I2C Control
>    struct smudpm_i2c_controller_config_v2  I2cControllers[8];
>
> @@ -2348,6 +2352,7 @@ struct atom_smc_dpm_info_v4_7
>    uint8_t      Padding8_Psi2;
>
>    uint32_t     BoardReserved[5];
> +  );
>  };
>
>  struct smudpm_i2c_controller_config_v3
> @@ -2478,6 +2483,7 @@ struct atom_smc_dpm_info_v4_10
>    struct   atom_common_table_header  table_header;
>
>    // SECTION: BOARD PARAMETERS
> +  struct_group(dpm_info,
>    // Telemetry Settings
>    uint16_t GfxMaxCurrent; // in Amps
>    uint8_t   GfxOffset;     // in Amps
> @@ -2524,6 +2530,7 @@ struct atom_smc_dpm_info_v4_10
>    uint16_t spare5;
>
>    uint32_t reserved[16];
> +  );
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_arcturus.h b/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_arcturus.h
> index 43d43d6addc0..8093a98800c3 100644
> --- a/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_arcturus.h
> +++ b/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_arcturus.h
> @@ -643,6 +643,7 @@ typedef struct {
>    // SECTION: BOARD PARAMETERS
>
>    // SVI2 Board Parameters
> +  struct_group(v4_6,
>    uint16_t     MaxVoltageStepGfx; // In mV(Q2) Max voltage step that SMU will request. Multiple steps are taken if voltage change exceeds this value.
>    uint16_t     MaxVoltageStepSoc; // In mV(Q2) Max voltage step that SMU will request. Multiple steps are taken if voltage change exceeds this value.
>
> @@ -728,10 +729,10 @@ typedef struct {
>    uint32_t     BoardVoltageCoeffB;    // decode by /1000
>
>    uint32_t     BoardReserved[7];
> +  );
>
>    // Padding for MMHUB - do not modify this
>    uint32_t     MmHubPadding[8]; // SMU internal use
> -
>  } PPTable_t;
>
>  typedef struct {
> diff --git a/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_navi10.h b/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_navi10.h
> index 04752ade1016..0b4e6e907e95 100644
> --- a/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_navi10.h
> +++ b/drivers/gpu/drm/amd/pm/inc/smu11_driver_if_navi10.h
> @@ -725,6 +725,7 @@ typedef struct {
>    uint32_t     Reserved[8];
>
>    // SECTION: BOARD PARAMETERS
> +  struct_group(v4,
>    // I2C Control
>    I2cControllerConfig_t  I2cControllers[NUM_I2C_CONTROLLERS];
>
> @@ -809,10 +810,10 @@ typedef struct {
>    uint8_t      Padding8_Loadline;
>
>    uint32_t     BoardReserved[8];
> +  );
>
>    // Padding for MMHUB - do not modify this
>    uint32_t     MmHubPadding[8]; // SMU internal use
> -
>  } PPTable_t;
>
>  typedef struct {
> diff --git a/drivers/gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h b/drivers/gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h
> index a017983ff1fa..5056d3728da8 100644
> --- a/drivers/gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h
> +++ b/drivers/gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h
> @@ -390,6 +390,7 @@ typedef struct {
>    uint32_t spare3[14];
>
>    // SECTION: BOARD PARAMETERS
> +  struct_group(v4_10,
>    // Telemetry Settings
>    uint16_t GfxMaxCurrent; // in Amps
>    int8_t   GfxOffset;     // in Amps
> @@ -444,7 +445,7 @@ typedef struct {
>
>    //reserved
>    uint32_t reserved[14];
> -
> +  );
>  } PPTable_t;
>
>  typedef struct {
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 6ec8492f71f5..19951399cb33 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -463,11 +463,11 @@ static int arcturus_append_powerplay_table(struct smu_context *smu)
>                         smc_dpm_table->table_header.format_revision,
>                         smc_dpm_table->table_header.content_revision);
>
> +       BUILD_BUG_ON(sizeof(smc_pptable->v4_6) != sizeof(smc_dpm_table->dpm_info));
>         if ((smc_dpm_table->table_header.format_revision == 4) &&
>             (smc_dpm_table->table_header.content_revision == 6))
> -               memcpy(&smc_pptable->MaxVoltageStepGfx,
> -                      &smc_dpm_table->maxvoltagestepgfx,
> -                      sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_6, maxvoltagestepgfx));
> +               memcpy(&smc_pptable->v4_6, &smc_dpm_table->dpm_info,
> +                      sizeof(smc_dpm_table->dpm_info));
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 59ea59acfb00..cb6665fbe319 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -431,16 +431,20 @@ static int navi10_append_powerplay_table(struct smu_context *smu)
>
>         switch (smc_dpm_table->table_header.content_revision) {
>         case 5: /* nv10 and nv14 */
> -               memcpy(smc_pptable->I2cControllers, smc_dpm_table->I2cControllers,
> -                       sizeof(*smc_dpm_table) - sizeof(smc_dpm_table->table_header));
> +               BUILD_BUG_ON(sizeof(smc_pptable->v4) !=
> +                            sizeof(smc_dpm_table->dpm_info));
> +               memcpy(&smc_pptable->v4, &smc_dpm_table->dpm_info,
> +                      sizeof(smc_dpm_table->dpm_info));
>                 break;
>         case 7: /* nv12 */
>                 ret = amdgpu_atombios_get_data_table(adev, index, NULL, NULL, NULL,
>                                               (uint8_t **)&smc_dpm_table_v4_7);
>                 if (ret)
>                         return ret;
> -               memcpy(smc_pptable->I2cControllers, smc_dpm_table_v4_7->I2cControllers,
> -                       sizeof(*smc_dpm_table_v4_7) - sizeof(smc_dpm_table_v4_7->table_header));
> +               BUILD_BUG_ON(sizeof(smc_pptable->v4) !=
> +                            sizeof(smc_dpm_table_v4_7->dpm_info));
> +               memcpy(&smc_pptable->v4, &smc_dpm_table_v4_7->dpm_info,
> +                      sizeof(smc_dpm_table_v4_7->dpm_info));
>                 break;
>         default:
>                 dev_err(smu->adev->dev, "smc_dpm_info with unsupported content revision %d!\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index 856eeaf293b8..c0645302fa50 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -407,11 +407,11 @@ static int aldebaran_append_powerplay_table(struct smu_context *smu)
>                         smc_dpm_table->table_header.format_revision,
>                         smc_dpm_table->table_header.content_revision);
>
> +       BUILD_BUG_ON(sizeof(smc_pptable->v4_10) != sizeof(smc_dpm_table->dpm_info));
>         if ((smc_dpm_table->table_header.format_revision == 4) &&
>             (smc_dpm_table->table_header.content_revision == 10))
> -               memcpy(&smc_pptable->GfxMaxCurrent,
> -                      &smc_dpm_table->GfxMaxCurrent,
> -                      sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_10, GfxMaxCurrent));
> +               memcpy(&smc_pptable->v4_10, &smc_dpm_table->dpm_info,
> +                      sizeof(smc_dpm_table->dpm_info));
>         return 0;
>  }
>
> --
> 2.30.2
>
