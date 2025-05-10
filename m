Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F3AB23A9
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 13:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7610E251;
	Sat, 10 May 2025 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VYmG6gsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31F410E055;
 Sat, 10 May 2025 01:14:20 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-22e3b069f23so27239765ad.2; 
 Fri, 09 May 2025 18:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746839660; x=1747444460; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+cvM3MnBbq4eCfwtWIoXlZBv9YaLpt9+2JHl2NqC+q4=;
 b=VYmG6gsPI7dFFjFjYtl0AraGs4fwD7CRW4d/i09gs0aDq8n2eI/iuJ/YPqCi2Qg9dS
 gtXKqK7K1jb+QhtZuxDOY/cGKeyrKuynjT7RpWwqnAcmSGYQXzbO/RYqi3I4k/BZFRvF
 WdIN3oVj8SNk2gTuN1VMGpFyaKIAxm9KzvrUq3GdcympvWt0FLM2GHiWBplUtA8s4NFQ
 hyuXgS14AqGEa6cyJQbXWiw31nBw1ahZ5HdiEp4MvkJRawPclJkFKDdflvBsYDFCZ76t
 QvSs7YC6UH3gFWSAH+9LCbihEm2Z+9m/P/Ku2/d3G5Mmeg3S8Y3J3RPNCALxqdQPwLby
 W32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746839660; x=1747444460;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+cvM3MnBbq4eCfwtWIoXlZBv9YaLpt9+2JHl2NqC+q4=;
 b=LLV+5VkU3Lw3R8ZW+Dj33043gtywZQFeOikazHX0FfTkdtnX7YEAj0vpQT6EgwoWOs
 zRpPvfa+JEXbKj3MDmrP0ebUPqAogOSNap286BuOjz2lE4lGCyQv4CFe+tw0cdXELT7C
 onWVlPIIR17+A49eLhL2sO32epE9Be0mKLwmIL0j5krkQ73DgPAYoY/2FeNDu3xa54Gq
 uzh280OqRCFbJ8zWOS/2a2ybVVBTrhOzc2muSwz9brFZh63oedeg65sPnXwTdfBQuLsE
 A7RwT7xv2csEG/7rRtK1VCW2wuxkLmMQWukhiA1A6McIc13i3wyXF5stpPktAfjUJKca
 zaBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4VgS2v/fUxvFVfFWwqBMmzuFCOdygNonrYZ7TQj5/+lZmO7H6F85mha4nG36drUxmOZHMA62s@lists.freedesktop.org,
 AJvYcCXhYl9P87b725BhcDiNzXB+eLeu57khsb2pYj0RfU/E9h4R04dqCDFHw3bhhlBY8HjI/IO5cFEdOZx9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIi8CcFU4Wyl01ElF0rUmLTXcsgar3mo8fRZFCFWKnDrK4JEE7
 xZYahxEx2Jwi8hugguJvpNLUnD6NM7GIkl767PGviH3i63sz8k28dMukPMQPsKojkkiBgUEhSkk
 0xXdFCVlm6FsH64FwY5HFZ58+r0iD6EkcE43syn7CdldQu4+2M+5NGA/nqu/0C2mgAu8=
X-Gm-Gg: ASbGnctiiHkx49HMxQdOyW7bvy1gtRQx7kz0X+Y6YmRkcm9evfBAlVJt0pac8gsEdml
 qG4CVcTAtcy6gSDFcv1SskYcaNLMjQY1MTSp5VivVRZoj/dO+U5uypPFwqYVYUp8bNK0h22yFtx
 o0ba8b3lXBEIGe0WZ7Z8tXJbtzWIpY6LJMyYlP4unvJoCXXQ+hxNckfhz1uitm6w==
X-Google-Smtp-Source: AGHT+IEPZ3gKXAh125qw6lD4+jJEMhbcKSOIgaFydPXuzmUZPy5tJoSkPu8+hflweOZzIMiMVvwF6BSZNHMwkAhPh0h4odmSX3f8ws5/
X-Received: by 2002:a17:902:e94d:b0:224:c46:d166 with SMTP id
 d9443c01a7336-22fc9185e22mr85418665ad.40.1746839660000; Fri, 09 May 2025
 18:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250503035949.11132-1-saguileran@ime.usp.br>
 <c75f63b2-b562-4396-8779-145e2642b8aa@amd.com>
 <f8299b44-1a11-431d-8c04-b0cb44b0b832@amd.com>
In-Reply-To: <f8299b44-1a11-431d-8c04-b0cb44b0b832@amd.com>
From: Sebastian Aguilera Novoa <saguileranbr@gmail.com>
Date: Fri, 9 May 2025 22:14:07 -0300
X-Gm-Features: AX0GCFs4YSaLVGnDS4rexa9wwHw7GDYxuNzWEQtOWx7freGcjSZUiewQ8NyxodI
Message-ID: <CADAW+GDN-4Lwd87h793csWF6r5cgqpgrpEPzRyDV9+rfkNPmTA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display/dc/irq: Remove duplications of hpd_ack
 function from IRQ
To: alex.hung@amd.com
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 saguileran@ime.usp.br, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000069fb4a0634bdcd67"
X-Mailman-Approved-At: Sat, 10 May 2025 11:45:19 +0000
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

--00000000000069fb4a0634bdcd67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=91=8D

Sebastian reagiu pelo Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

Em sex., 9 de mai. de 2025, 20:59, Alex Hung <alex.hung@amd.com> escreveu:

> Reviewed-by: Alex Hung <alex.hung@amd.com>
>
> On 5/5/25 12:20, Alex Hung wrote:
> > Thanks. I will send this patch for testing.
> >
> > Note I still see a warning of mismatch of author and SOB as below, but
> > that can be fixed to "Sebastian Aguilera Novoa <saguileran@ime.usp.br>"
> > manually after testing and before merging.
> >
> > $ ./scripts/checkpatch.pl
> v2-drm-amd-display-dc-irq-Remove-duplications-
> > of-hpd_ack-function-from-IRQ.patch.patch
> > WARNING: From:/Signed-off-by: email address mismatch: 'From: Sebastian
> > Aguilera Novoa <saguileranbr@gmail.com>' !=3D 'Signed-off-by: Sebastian
> > Aguilera Novoa <saguileran@ime.usp.br>'
> >
> > total: 0 errors, 1 warnings, 740 lines checked
> >
> >
> > On 5/2/25 21:59, Sebastian Aguilera Novoa wrote:
> >> The major of dcn and dce irqs share a copy-pasted collection
> >> of copy-pasted function, which is: hpd_ack.
> >>
> >> This patch removes the multiple copy-pasted by moving them to
> >> the irq_service.c and make the irq_service's
> >> calls the functions implemented by the irq_service.c
> >> instead.
> >>
> >> The hpd_ack function is replaced by hpd0_ack and hpd1_ack, the
> >> required constants are also added.
> >>
> >> The changes were not tested on actual hardware. I am only able
> >> to verify that the changes keep the code compileable and do my
> >> best to look repeatedly if I am not actually changing any code.
> >>
> >> Signed-off-by: Sebastian Aguilera Novoa <saguileran@ime.usp.br>
> >> ---
> >>   .../dc/irq/dce120/irq_service_dce120.c        | 29 +--------
> >>   .../display/dc/irq/dce60/irq_service_dce60.c  | 31 +--------
> >>   .../display/dc/irq/dce80/irq_service_dce80.c  | 31 +--------
> >>   .../display/dc/irq/dcn10/irq_service_dcn10.c  | 29 +--------
> >>   .../display/dc/irq/dcn20/irq_service_dcn20.c  | 29 +--------
> >>   .../dc/irq/dcn201/irq_service_dcn201.c        | 29 +--------
> >>   .../display/dc/irq/dcn21/irq_service_dcn21.c  | 29 +--------
> >>   .../display/dc/irq/dcn30/irq_service_dcn30.c  | 30 +--------
> >>   .../dc/irq/dcn302/irq_service_dcn302.c        | 19 +-----
> >>   .../dc/irq/dcn303/irq_service_dcn303.c        | 19 +-----
> >>   .../display/dc/irq/dcn31/irq_service_dcn31.c  | 29 +--------
> >>   .../dc/irq/dcn314/irq_service_dcn314.c        | 29 +--------
> >>   .../dc/irq/dcn315/irq_service_dcn315.c        | 29 +--------
> >>   .../display/dc/irq/dcn32/irq_service_dcn32.c  | 29 +--------
> >>   .../display/dc/irq/dcn35/irq_service_dcn35.c  | 29 +--------
> >>   .../dc/irq/dcn351/irq_service_dcn351.c        | 29 +--------
> >>   .../display/dc/irq/dcn36/irq_service_dcn36.c  | 29 +--------
> >>   .../dc/irq/dcn401/irq_service_dcn401.c        | 29 +--------
> >>   .../gpu/drm/amd/display/dc/irq/irq_service.c  | 64 +++++++++++++++++=
++
> >>   .../gpu/drm/amd/display/dc/irq/irq_service.h  |  8 +++
> >>   20 files changed, 90 insertions(+), 489 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce120/
> >> irq_service_dce120.c b/drivers/gpu/drm/amd/display/dc/irq/dce120/
> >> irq_service_dce120.c
> >> index 953f4a4dacad..33ce470e4c88 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> >> @@ -37,36 +37,9 @@
> >>   #include "ivsrcid/ivsrcid_vislands30.h"
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce60/
> >> irq_service_dce60.c b/drivers/gpu/drm/amd/display/dc/irq/dce60/
> >> irq_service_dce60.c
> >> index 2c72074310c7..d777b85e70da 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> >> @@ -46,36 +46,9 @@
> >>   #include "dc_types.h"
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            DC_HPD1_INT_STATUS,
> >> -            DC_HPD1_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        DC_HPD1_INT_CONTROL,
> >> -        DC_HPD1_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd1_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> @@ -391,5 +364,3 @@ struct irq_service *dal_irq_service_dce60_create(
> >>       dce60_irq_construct(irq_service, init_data);
> >>       return irq_service;
> >>   }
> >> -
> >> -
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce80/
> >> irq_service_dce80.c b/drivers/gpu/drm/amd/display/dc/irq/dce80/
> >> irq_service_dce80.c
> >> index 49317934ef4f..3a9163acb49b 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> >> @@ -37,36 +37,9 @@
> >>   #include "dc_types.h"
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            DC_HPD1_INT_STATUS,
> >> -            DC_HPD1_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        DC_HPD1_INT_CONTROL,
> >> -        DC_HPD1_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd1_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> @@ -303,5 +276,3 @@ struct irq_service *dal_irq_service_dce80_create(
> >>       dce80_irq_construct(irq_service, init_data);
> >>       return irq_service;
> >>   }
> >> -
> >> -
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/
> >> irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/
> >> irq_service_dcn10.c
> >> index 9ca28565a9d1..4ce9edd16344 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> >> @@ -129,36 +129,9 @@ static enum dc_irq_source
> >> to_dal_irq_source_dcn10(struct irq_service *irq_servic
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/
> >> irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/
> >> irq_service_dcn20.c
> >> index 916f0c974637..5847af0e66cb 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> >> @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn20=
(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/
> >> irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/
> >> irq_service_dcn201.c
> >> index 1d61d475d36f..6417011d2246 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> >> @@ -80,36 +80,9 @@ static enum dc_irq_source to_dal_irq_source_dcn201(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/
> >> irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/
> >> irq_service_dcn21.c
> >> index 42cdfe6c3538..71d2f065140b 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> >> @@ -132,36 +132,9 @@ static enum dc_irq_source
> >> to_dal_irq_source_dcn21(struct irq_service *irq_servic
> >>       return DC_IRQ_SOURCE_INVALID;
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/
> >> irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/
> >> irq_service_dcn30.c
> >> index a443a8abb1ea..2a4080bdcf6b 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> >> @@ -139,36 +139,9 @@ static enum dc_irq_source to_dal_irq_source_dcn30=
(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> @@ -447,4 +420,3 @@ struct irq_service *dal_irq_service_dcn30_create(
> >>       dcn30_irq_construct(irq_service, init_data);
> >>       return irq_service;
> >>   }
> >> -
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/
> >> irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/
> >> irq_service_dcn302.c
> >> index 8ffc7e2c681a..624f1ac309f8 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> >> @@ -126,26 +126,9 @@ static enum dc_irq_source
> >> to_dal_irq_source_dcn302(struct irq_service *irq_servi
> >>       }
> >>   }
> >> -static bool hpd_ack(struct irq_service *irq_service, const struct
> >> irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D get_reg_field_value(value,
> >> HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(value, current_status ? 0 : 1,
> >> HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>           .set =3D NULL,
> >> -        .ack =3D hpd_ack
> >> +        .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/
> >> irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/
> >> irq_service_dcn303.c
> >> index 262bb8b74b15..137caffae916 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> >> @@ -77,26 +77,9 @@ static enum dc_irq_source
> >> to_dal_irq_source_dcn303(struct irq_service *irq_servi
> >>       }
> >>   }
> >> -static bool hpd_ack(struct irq_service *irq_service, const struct
> >> irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D get_reg_field_value(value,
> >> HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(value, current_status ? 0 : 1,
> >> HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>           .set =3D NULL,
> >> -        .ack =3D hpd_ack
> >> +        .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/
> >> irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/
> >> irq_service_dcn31.c
> >> index 53e78ae7eecf..921cb167d920 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> >> @@ -128,36 +128,9 @@ static enum dc_irq_source
> >> to_dal_irq_source_dcn31(struct irq_service *irq_servic
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn314/
> >> irq_service_dcn314.c b/drivers/gpu/drm/amd/display/dc/irq/dcn314/
> >> irq_service_dcn314.c
> >> index e0563e880432..0118fd6e5db0 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> >> @@ -130,36 +130,9 @@ static enum dc_irq_source
> >> to_dal_irq_source_dcn314(struct irq_service *irq_servi
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/
> >> irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/
> >> irq_service_dcn315.c
> >> index 2ef22299101a..adebfc888618 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> >> @@ -135,36 +135,9 @@ static enum dc_irq_source to_dal_irq_source_dcn31=
5(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/
> >> irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/
> >> irq_service_dcn32.c
> >> index f839afacd5a5..e9e315c75d76 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> >> @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn32=
(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs  =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn35/
> >> irq_service_dcn35.c b/drivers/gpu/drm/amd/display/dc/irq/dcn35/
> >> irq_service_dcn35.c
> >> index ea8c271171bc..79e5e8c137ca 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> >> @@ -127,36 +127,9 @@ static enum dc_irq_source to_dal_irq_source_dcn35=
(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn351/
> >> irq_service_dcn351.c b/drivers/gpu/drm/amd/display/dc/irq/dcn351/
> >> irq_service_dcn351.c
> >> index 7ec8e0de2f01..163b8ee9ebf7 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> >> @@ -106,36 +106,9 @@ static enum dc_irq_source to_dal_irq_source_dcn35=
1(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn36/
> >> irq_service_dcn36.c b/drivers/gpu/drm/amd/display/dc/irq/dcn36/
> >> irq_service_dcn36.c
> >> index ea958628f8b8..f716ab0fd30e 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> >> @@ -105,36 +105,9 @@ static enum dc_irq_source to_dal_irq_source_dcn36=
(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/
> >> irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/
> >> irq_service_dcn401.c
> >> index 8499e505cf3e..fd9bb1950c20 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> >> @@ -109,36 +109,9 @@ static enum dc_irq_source to_dal_irq_source_dcn40=
1(
> >>       }
> >>   }
> >> -static bool hpd_ack(
> >> -    struct irq_service *irq_service,
> >> -    const struct irq_source_info *info)
> >> -{
> >> -    uint32_t addr =3D info->status_reg;
> >> -    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> -    uint32_t current_status =3D
> >> -        get_reg_field_value(
> >> -            value,
> >> -            HPD0_DC_HPD_INT_STATUS,
> >> -            DC_HPD_SENSE_DELAYED);
> >> -
> >> -    dal_irq_service_ack_generic(irq_service, info);
> >> -
> >> -    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> -
> >> -    set_reg_field_value(
> >> -        value,
> >> -        current_status ? 0 : 1,
> >> -        HPD0_DC_HPD_INT_CONTROL,
> >> -        DC_HPD_INT_POLARITY);
> >> -
> >> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> -
> >> -    return true;
> >> -}
> >> -
> >>   static struct irq_source_info_funcs hpd_irq_info_funcs =3D {
> >>       .set =3D NULL,
> >> -    .ack =3D hpd_ack
> >> +    .ack =3D hpd0_ack
> >>   };
> >>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs =3D {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/
> >> drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> >> index eca3d7ee7e4e..b595a11c5eaf 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> >> @@ -41,6 +41,16 @@
> >>   #include "reg_helper.h"
> >>   #include "irq_service.h"
> >> +//HPD0_DC_HPD_INT_STATUS
> >> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK
> >> 0x00000010L
> >> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK
> >> 0x00000100L
> >> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED__SHIFT        0x=
4
> >> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY__SHIFT     0x8
> >> +//HPD1_DC_HPD_INT_STATUS
> >> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK            0x1=
0
> >> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT        0x4
> >> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK            0x1=
00
> >> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT        0x8
> >>   #define CTX \
> >> @@ -177,3 +187,57 @@ enum dc_irq_source dal_irq_service_to_irq_source(
> >>           src_id,
> >>           ext_id);
> >>   }
> >> +
> >> +bool hpd0_ack(
> >> +    struct irq_service *irq_service,
> >> +    const struct irq_source_info *info)
> >> +{
> >> +    uint32_t addr =3D info->status_reg;
> >> +    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> +    uint32_t current_status =3D
> >> +        get_reg_field_value(
> >> +            value,
> >> +            HPD0_DC_HPD_INT_STATUS,
> >> +            DC_HPD_SENSE_DELAYED);
> >> +
> >> +    dal_irq_service_ack_generic(irq_service, info);
> >> +
> >> +    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> +
> >> +    set_reg_field_value(
> >> +        value,
> >> +        current_status ? 0 : 1,
> >> +        HPD0_DC_HPD_INT_CONTROL,
> >> +        DC_HPD_INT_POLARITY);
> >> +
> >> +    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> +
> >> +    return true;
> >> +}
> >> +
> >> +bool hpd1_ack(
> >> +    struct irq_service *irq_service,
> >> +    const struct irq_source_info *info)
> >> +{
> >> +    uint32_t addr =3D info->status_reg;
> >> +    uint32_t value =3D dm_read_reg(irq_service->ctx, addr);
> >> +    uint32_t current_status =3D
> >> +        get_reg_field_value(
> >> +            value,
> >> +            DC_HPD1_INT_STATUS,
> >> +            DC_HPD1_SENSE_DELAYED);
> >> +
> >> +    dal_irq_service_ack_generic(irq_service, info);
> >> +
> >> +    value =3D dm_read_reg(irq_service->ctx, info->enable_reg);
> >> +
> >> +    set_reg_field_value(
> >> +        value,
> >> +        current_status ? 0 : 1,
> >> +        DC_HPD1_INT_CONTROL,
> >> +        DC_HPD1_INT_POLARITY);
> >> +
> >> +    dm_write_reg(irq_service->ctx, info->enable_reg, value);
> >> +
> >> +    return true;
> >> +}
> >> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h b/
> >> drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> >> index b178f85944cd..bbcef3d2fe33 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> >> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> >> @@ -82,4 +82,12 @@ void dal_irq_service_set_generic(
> >>       const struct irq_source_info *info,
> >>       bool enable);
> >> +bool hpd0_ack(
> >> +    struct irq_service *irq_service,
> >> +    const struct irq_source_info *info);
> >> +
> >> +bool hpd1_ack(
> >> +    struct irq_service *irq_service,
> >> +    const struct irq_source_info *info);
> >> +
> >>   #endif
> >
>
>

--00000000000069fb4a0634bdcd67
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=91=8D",
  "version": 1
}
--00000000000069fb4a0634bdcd67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=91=8D<=
/p><p style=3D"margin-top:10px;margin-bottom:0">Sebastian reagiu pelo <a st=
yle=3D"color:unset;text-decoration:underline" href=3D"https://www.google.co=
m/gmail/about/?utm_source=3Dgmail-in-product&amp;utm_medium=3Det&amp;utm_ca=
mpaign=3Demojireactionemail#app">Gmail</a></p></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Em sex.=
, 9 de mai. de 2025, 20:59, Alex Hung &lt;<a href=3D"mailto:alex.hung@amd.c=
om">alex.hung@amd.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Reviewed-by: Alex Hung &lt;<a href=3D"mailto:alex.hung@amd.com" target=
=3D"_blank" rel=3D"noreferrer">alex.hung@amd.com</a>&gt;<br>
<br>
On 5/5/25 12:20, Alex Hung wrote:<br>
&gt; Thanks. I will send this patch for testing.<br>
&gt; <br>
&gt; Note I still see a warning of mismatch of author and SOB as below, but=
 <br>
&gt; that can be fixed to &quot;Sebastian Aguilera Novoa &lt;<a href=3D"mai=
lto:saguileran@ime.usp.br" target=3D"_blank" rel=3D"noreferrer">saguileran@=
ime.usp.br</a>&gt;&quot; <br>
&gt; manually after testing and before merging.<br>
&gt; <br>
&gt; $ ./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer norefer=
rer" target=3D"_blank">checkpatch.pl</a> v2-drm-amd-display-dc-irq-Remove-d=
uplications- <br>
&gt; of-hpd_ack-function-from-IRQ.patch.patch<br>
&gt; WARNING: From:/Signed-off-by: email address mismatch: &#39;From: Sebas=
tian <br>
&gt; Aguilera Novoa &lt;<a href=3D"mailto:saguileranbr@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">saguileranbr@gmail.com</a>&gt;&#39; !=3D &#39;S=
igned-off-by: Sebastian <br>
&gt; Aguilera Novoa &lt;<a href=3D"mailto:saguileran@ime.usp.br" target=3D"=
_blank" rel=3D"noreferrer">saguileran@ime.usp.br</a>&gt;&#39;<br>
&gt; <br>
&gt; total: 0 errors, 1 warnings, 740 lines checked<br>
&gt; <br>
&gt; <br>
&gt; On 5/2/25 21:59, Sebastian Aguilera Novoa wrote:<br>
&gt;&gt; The major of dcn and dce irqs share a copy-pasted collection<br>
&gt;&gt; of copy-pasted function, which is: hpd_ack.<br>
&gt;&gt;<br>
&gt;&gt; This patch removes the multiple copy-pasted by moving them to<br>
&gt;&gt; the irq_service.c and make the irq_service&#39;s<br>
&gt;&gt; calls the functions implemented by the irq_service.c<br>
&gt;&gt; instead.<br>
&gt;&gt;<br>
&gt;&gt; The hpd_ack function is replaced by hpd0_ack and hpd1_ack, the<br>
&gt;&gt; required constants are also added.<br>
&gt;&gt;<br>
&gt;&gt; The changes were not tested on actual hardware. I am only able<br>
&gt;&gt; to verify that the changes keep the code compileable and do my<br>
&gt;&gt; best to look repeatedly if I am not actually changing any code.<br=
>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Sebastian Aguilera Novoa &lt;<a href=3D"mailto:sagu=
ileran@ime.usp.br" target=3D"_blank" rel=3D"noreferrer">saguileran@ime.usp.=
br</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 .../dc/irq/dce120/irq_service_dce120.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 +--------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dce60/irq_service_dce60.c=C2=A0 | 31 +--=
------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dce80/irq_service_dce80.c=C2=A0 | 31 +--=
------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn10/irq_service_dcn10.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn20/irq_service_dcn20.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn201/irq_service_dcn201.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 +--------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn21/irq_service_dcn21.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn30/irq_service_dcn30.c=C2=A0 | 30 +--=
------<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn302/irq_service_dcn302.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 19 +-----<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn303/irq_service_dcn303.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 19 +-----<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn31/irq_service_dcn31.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn314/irq_service_dcn314.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 +--------<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn315/irq_service_dcn315.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 +--------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn32/irq_service_dcn32.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn35/irq_service_dcn35.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn351/irq_service_dcn351.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 +--------<br>
&gt;&gt; =C2=A0 .../display/dc/irq/dcn36/irq_service_dcn36.c=C2=A0 | 29 +--=
------<br>
&gt;&gt; =C2=A0 .../dc/irq/dcn401/irq_service_dcn401.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 +--------<br>
&gt;&gt; =C2=A0 .../gpu/drm/amd/display/dc/irq/irq_service.c=C2=A0 | 64 +++=
++++++++++++++++<br>
&gt;&gt; =C2=A0 .../gpu/drm/amd/display/dc/irq/irq_service.h=C2=A0 |=C2=A0 =
8 +++<br>
&gt;&gt; =C2=A0 20 files changed, 90 insertions(+), 489 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce120/ <br>
&gt;&gt; irq_service_dce120.c b/drivers/gpu/drm/amd/display/dc/irq/dce120/ =
<br>
&gt;&gt; irq_service_dce120.c<br>
&gt;&gt; index 953f4a4dacad..33ce470e4c88 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120=
.c<br>
&gt;&gt; @@ -37,36 +37,9 @@<br>
&gt;&gt; =C2=A0 #include &quot;ivsrcid/ivsrcid_vislands30.h&quot;<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce60/ <br>
&gt;&gt; irq_service_dce60.c b/drivers/gpu/drm/amd/display/dc/irq/dce60/ <b=
r>
&gt;&gt; irq_service_dce60.c<br>
&gt;&gt; index 2c72074310c7..d777b85e70da 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c=
<br>
&gt;&gt; @@ -46,36 +46,9 @@<br>
&gt;&gt; =C2=A0 #include &quot;dc_types.h&quot;<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD1_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD1_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD1_INT_CONTROL,<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD1_INT_POLARITY);=
<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd1_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; @@ -391,5 +364,3 @@ struct irq_service *dal_irq_service_dce60_crea=
te(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce60_irq_construct(irq_service, in=
it_data);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return irq_service;<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce80/ <br>
&gt;&gt; irq_service_dce80.c b/drivers/gpu/drm/amd/display/dc/irq/dce80/ <b=
r>
&gt;&gt; irq_service_dce80.c<br>
&gt;&gt; index 49317934ef4f..3a9163acb49b 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c=
<br>
&gt;&gt; @@ -37,36 +37,9 @@<br>
&gt;&gt; =C2=A0 #include &quot;dc_types.h&quot;<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD1_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD1_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD1_INT_CONTROL,<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD1_INT_POLARITY);=
<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd1_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; @@ -303,5 +276,3 @@ struct irq_service *dal_irq_service_dce80_crea=
te(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce80_irq_construct(irq_service, in=
it_data);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return irq_service;<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/ <br>
&gt;&gt; irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/ <b=
r>
&gt;&gt; irq_service_dcn10.c<br>
&gt;&gt; index 9ca28565a9d1..4ce9edd16344 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c=
<br>
&gt;&gt; @@ -129,36 +129,9 @@ static enum dc_irq_source <br>
&gt;&gt; to_dal_irq_source_dcn10(struct irq_service *irq_servic<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/ <br>
&gt;&gt; irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/ <b=
r>
&gt;&gt; irq_service_dcn20.c<br>
&gt;&gt; index 916f0c974637..5847af0e66cb 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c=
<br>
&gt;&gt; @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn20(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/ <br>
&gt;&gt; irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/ =
<br>
&gt;&gt; irq_service_dcn201.c<br>
&gt;&gt; index 1d61d475d36f..6417011d2246 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201=
.c<br>
&gt;&gt; @@ -80,36 +80,9 @@ static enum dc_irq_source to_dal_irq_source_dcn=
201(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/ <br>
&gt;&gt; irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/ <b=
r>
&gt;&gt; irq_service_dcn21.c<br>
&gt;&gt; index 42cdfe6c3538..71d2f065140b 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c=
<br>
&gt;&gt; @@ -132,36 +132,9 @@ static enum dc_irq_source <br>
&gt;&gt; to_dal_irq_source_dcn21(struct irq_service *irq_servic<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return DC_IRQ_SOURCE_INVALID;<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/ <br>
&gt;&gt; irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/ <b=
r>
&gt;&gt; irq_service_dcn30.c<br>
&gt;&gt; index a443a8abb1ea..2a4080bdcf6b 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c=
<br>
&gt;&gt; @@ -139,36 +139,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn30(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; @@ -447,4 +420,3 @@ struct irq_service *dal_irq_service_dcn30_crea=
te(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dcn30_irq_construct(irq_service, in=
it_data);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return irq_service;<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/ <br>
&gt;&gt; irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/ =
<br>
&gt;&gt; irq_service_dcn302.c<br>
&gt;&gt; index 8ffc7e2c681a..624f1ac309f8 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302=
.c<br>
&gt;&gt; @@ -126,26 +126,9 @@ static enum dc_irq_source <br>
&gt;&gt; to_dal_irq_source_dcn302(struct irq_service *irq_servi<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(struct irq_service *irq_service, const struct=
 <br>
&gt;&gt; irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D get_reg_field_valu=
e(value, <br>
&gt;&gt; HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(value, current_status ? 0 =
: 1, <br>
&gt;&gt; HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NU=
LL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/ <br>
&gt;&gt; irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/ =
<br>
&gt;&gt; irq_service_dcn303.c<br>
&gt;&gt; index 262bb8b74b15..137caffae916 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303=
.c<br>
&gt;&gt; @@ -77,26 +77,9 @@ static enum dc_irq_source <br>
&gt;&gt; to_dal_irq_source_dcn303(struct irq_service *irq_servi<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(struct irq_service *irq_service, const struct=
 <br>
&gt;&gt; irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D get_reg_field_valu=
e(value, <br>
&gt;&gt; HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(value, current_status ? 0 =
: 1, <br>
&gt;&gt; HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NU=
LL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/ <br>
&gt;&gt; irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/ <b=
r>
&gt;&gt; irq_service_dcn31.c<br>
&gt;&gt; index 53e78ae7eecf..921cb167d920 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c=
<br>
&gt;&gt; @@ -128,36 +128,9 @@ static enum dc_irq_source <br>
&gt;&gt; to_dal_irq_source_dcn31(struct irq_service *irq_servic<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn314/ <br>
&gt;&gt; irq_service_dcn314.c b/drivers/gpu/drm/amd/display/dc/irq/dcn314/ =
<br>
&gt;&gt; irq_service_dcn314.c<br>
&gt;&gt; index e0563e880432..0118fd6e5db0 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314=
.c<br>
&gt;&gt; @@ -130,36 +130,9 @@ static enum dc_irq_source <br>
&gt;&gt; to_dal_irq_source_dcn314(struct irq_service *irq_servi<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/ <br>
&gt;&gt; irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/ =
<br>
&gt;&gt; irq_service_dcn315.c<br>
&gt;&gt; index 2ef22299101a..adebfc888618 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315=
.c<br>
&gt;&gt; @@ -135,36 +135,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn315(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/ <br>
&gt;&gt; irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/ <b=
r>
&gt;&gt; irq_service_dcn32.c<br>
&gt;&gt; index f839afacd5a5..e9e315c75d76 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c=
<br>
&gt;&gt; @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn32(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs=C2=
=A0 =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn35/ <br>
&gt;&gt; irq_service_dcn35.c b/drivers/gpu/drm/amd/display/dc/irq/dcn35/ <b=
r>
&gt;&gt; irq_service_dcn35.c<br>
&gt;&gt; index ea8c271171bc..79e5e8c137ca 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c=
<br>
&gt;&gt; @@ -127,36 +127,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn35(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs =3D =
{<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn351/ <br>
&gt;&gt; irq_service_dcn351.c b/drivers/gpu/drm/amd/display/dc/irq/dcn351/ =
<br>
&gt;&gt; irq_service_dcn351.c<br>
&gt;&gt; index 7ec8e0de2f01..163b8ee9ebf7 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351=
.c<br>
&gt;&gt; @@ -106,36 +106,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn351(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs =3D =
{<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn36/ <br>
&gt;&gt; irq_service_dcn36.c b/drivers/gpu/drm/amd/display/dc/irq/dcn36/ <b=
r>
&gt;&gt; irq_service_dcn36.c<br>
&gt;&gt; index ea958628f8b8..f716ab0fd30e 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c=
<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c=
<br>
&gt;&gt; @@ -105,36 +105,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn36(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs =3D =
{<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/ <br>
&gt;&gt; irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/ =
<br>
&gt;&gt; irq_service_dcn401.c<br>
&gt;&gt; index 8499e505cf3e..fd9bb1950c20 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401=
.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401=
.c<br>
&gt;&gt; @@ -109,36 +109,9 @@ static enum dc_irq_source to_dal_irq_source_d=
cn401(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; -static bool hpd_ack(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; -{<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_irq_info_funcs =3D =
{<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set =3D NULL,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 .ack =3D hpd_ack<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 .ack =3D hpd0_ack<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 static struct irq_source_info_funcs hpd_rx_irq_info_funcs =
=3D {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/ <=
br>
&gt;&gt; drivers/gpu/drm/amd/display/dc/irq/irq_service.c<br>
&gt;&gt; index eca3d7ee7e4e..b595a11c5eaf 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c<br>
&gt;&gt; @@ -41,6 +41,16 @@<br>
&gt;&gt; =C2=A0 #include &quot;reg_helper.h&quot;<br>
&gt;&gt; =C2=A0 #include &quot;irq_service.h&quot;<br>
&gt;&gt; +//HPD0_DC_HPD_INT_STATUS<br>
&gt;&gt; +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br>
&gt;&gt; 0x00000010L<br>
&gt;&gt; +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br>
&gt;&gt; 0x00000100L<br>
&gt;&gt; +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED__SHIFT=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4<br>
&gt;&gt; +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY__SHIFT=C2=A0=
=C2=A0=C2=A0=C2=A0 0x8<br>
&gt;&gt; +//HPD1_DC_HPD_INT_STATUS<br>
&gt;&gt; +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x10<br>
&gt;&gt; +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4<br>
&gt;&gt; +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x100<br>
&gt;&gt; +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x8<br>
&gt;&gt; =C2=A0 #define CTX \<br>
&gt;&gt; @@ -177,3 +187,57 @@ enum dc_irq_source dal_irq_service_to_irq_sou=
rce(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_id,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ext_id);<br=
>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +bool hpd0_ack(<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 HPD0_DC_HPD_INT_STATUS,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD_SENSE_DELAYED);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPD0_DC_HPD_INT_CONTRO=
L,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD_INT_POLARITY);<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +bool hpd1_ack(<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t addr =3D info-&gt;status_reg;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t value =3D dm_read_reg(irq_service-&gt=
;ctx, addr);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t current_status =3D<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_reg_field_value(<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD1_INT_STATUS,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DC_HPD1_SENSE_DELAYED);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dal_irq_service_ack_generic(irq_service, info)=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 value =3D dm_read_reg(irq_service-&gt;ctx, inf=
o-&gt;enable_reg);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 set_reg_field_value(<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_status ? 0 : 1=
,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD1_INT_CONTROL,<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DC_HPD1_INT_POLARITY);=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 dm_write_reg(irq_service-&gt;ctx, info-&gt;ena=
ble_reg, value);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;&gt; +}<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h b/ <=
br>
&gt;&gt; drivers/gpu/drm/amd/display/dc/irq/irq_service.h<br>
&gt;&gt; index b178f85944cd..bbcef3d2fe33 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h<br>
&gt;&gt; @@ -82,4 +82,12 @@ void dal_irq_service_set_generic(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info,=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable);<br>
&gt;&gt; +bool hpd0_ack(<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info);<br>
&gt;&gt; +<br>
&gt;&gt; +bool hpd1_ack(<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct irq_service *irq_service,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 const struct irq_source_info *info);<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 #endif<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000069fb4a0634bdcd67--
