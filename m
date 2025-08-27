Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03704B38A92
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 21:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359B10E894;
	Wed, 27 Aug 2025 19:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MeM+qcL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9474710E7C3;
 Wed, 27 Aug 2025 19:57:57 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-248999413easo318305ad.3; 
 Wed, 27 Aug 2025 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756324677; x=1756929477; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rjV0DwmZIW1py3fMx22hVqowrh1QvW3z5IOWwwuGuQ8=;
 b=MeM+qcL24JM9B64zLJVGZPTcc978WCIHJJBXtGwPBztOX+c50uWgMsJLOvunq/zREa
 7WejNh5NMhbcxYZclcQSmuwYzQNaYjXFTsxzHRaTcK5YdW6MRj4Yx9Yt74UQsBpzqhqV
 D5w3LFVo2Jtiu2dZyJ8v1NJZYjiTbbYfyqfkoYUc+McRnGkMLIIEbQCXCjyaVSFo8FVP
 KXK9sdB8JuDH4bsTfGgk9Al3S1zaDeZFPdUUYXP2eQrDLNXoHQboOJxnQHsbHSORYkd6
 cquyjifKAletw6pojD5+RUDcD7Sbp5gga07itFP2o+VfXgFR3aOMleGtyUVaNgUM7Y27
 QAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756324677; x=1756929477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rjV0DwmZIW1py3fMx22hVqowrh1QvW3z5IOWwwuGuQ8=;
 b=e4S3ztfLMbnInPyQX8lqAMbRaMC3Z6Qoe3/zbj5QkyRJCWhNLtbE8LRc+gcrFTC1al
 apbEe7Xl9egI51vKhpu1GYLGNuhAweeaVwNwdGeKjllxSGmjItkznt2rYrjXCcKA2i7O
 EoL2TiEuPzl9l85gG2SGpQi1UAWxnu5qJes9i6AU8vtXEX19vq6uJSdtEa7OSAY6Tchp
 WjZe+1ZFgVN8vXlXSSZC3hK3oefD+qyDKyvXer2P1LZlhlCiTJ7slzVop4/s0nSznOxk
 0uUTETzYmqSRxYsWfwQT/+5LOs3KY3O5Ltir3ifibqFj5RAUXoWedILkqJBlHUJDu0rC
 S12w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCAypqUij6QCeeiTIMMl7J1WqYMNW80AwC0wOymFCVlqTjGDYMRMgurSSyfq2ewl4YCtd/1w6IfSRr@lists.freedesktop.org,
 AJvYcCXPdGveSvZVAo23RJL+K8f2ao1M8rWnVukwo46jt4lgNseKSB1lN1hSXY6qM1do+hilwz3DqE1k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNvUeTmQEEfXvuGtfSg3epE0NlhcqtqlnArPUdY1QN8GKrYMLa
 psoFgJIVKB6F3Mro5/Ozc2yqNZjAMWOzob5bqRlUKvwGy7Qvr+8itSewNl2QoTOIEV3q/17+hlZ
 o55X7LvkCt5jb8QkQ4yN33nOTCCliRTQd+g==
X-Gm-Gg: ASbGncs/mZ2+lLxH7dvpVysobBZtOeAx3pN7m9dGlXCs8z+hfKQMaDhcGH8f5E0oTuw
 bnEXVF690RVnK/DfDRu1YLDCzTNN7Qcb6ja0wJzeloQjLAy810iXyRYNFxo4Q0F6v+gh1jZ1dPh
 eygPsJuDNztZB6WwEq/deQosXN+/CqwFrfiHQ2VE/AK9FHIv52lL0I9v1/Qit+F3tji19hElBxz
 KYZ+gY=
X-Google-Smtp-Source: AGHT+IEEV1DocwEWc3jKPYLKt97a8Md11hVsuQXJBA2qHl6dQpH2Wq0GDXOFqg4EKfvaY1b+PH9cdtggpz40TZcPqPY=
X-Received: by 2002:a17:902:c409:b0:248:a01f:a549 with SMTP id
 d9443c01a7336-248a01fa7aamr20750765ad.11.1756324676898; Wed, 27 Aug 2025
 12:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250824115051.32988-1-mittalyugansh1@gmail.com>
In-Reply-To: <20250824115051.32988-1-mittalyugansh1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Aug 2025 15:57:45 -0400
X-Gm-Features: Ac12FXxqZBGDhYUXeE_2vpNsyc1MPHvuZvg50t-1nPjCv4vA8bIXi2lV2R6gGM0
Message-ID: <CADnq5_MoWjH2j_VyTEvDmYSKQ2Tfjo-B4som9Fwsb6r_dPo4xA@mail.gmail.com>
Subject: Re: [PATCH] atomfirmware.h: fix multiple spelling mistakes
To: Yugansh Mittal <mittalyugansh1@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Sun, Aug 24, 2025 at 7:28=E2=80=AFPM Yugansh Mittal <mittalyugansh1@gmai=
l.com> wrote:
>
> This patch corrects several typographical errors in atomfirmware.h.
> The fixes improve readability and maintain consistency in the codebase.
> No functional changes are introduced.
>
> Corrected terms include:
> - aligment    =E2=86=92 alignment
> - Offest      =E2=86=92 Offset
> - defintion   =E2=86=92 definition
> - swithing    =E2=86=92 switching
> - calcualted  =E2=86=92 calculated
> - compability =E2=86=92 compatibility
> - intenal     =E2=86=92 internal
> - sequece     =E2=86=92 sequence
> - indiate     =E2=86=92 indicate
> - stucture    =E2=86=92 structure
> - regiser     =E2=86=92 register
>
> Signed-off-by: Yugansh Mittal <mittalyugansh1@gmail.com>
> ---
>  drivers/gpu/drm/amd/include/atomfirmware.h | 30 +++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm=
/amd/include/atomfirmware.h
> index 5c86423c2..3d083010e 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -211,7 +211,7 @@ atom_bios_string          =3D "ATOM"
>  };
>  */
>
> -#pragma pack(1)                          /* BIOS data must use byte alig=
ment*/
> +#pragma pack(1)                          /* BIOS data must use byte alig=
nment*/
>
>  enum atombios_image_offset{
>    OFFSET_TO_ATOM_ROM_HEADER_POINTER          =3D 0x00000048,
> @@ -255,8 +255,8 @@ struct atom_rom_header_v2_2
>    uint16_t subsystem_vendor_id;
>    uint16_t subsystem_id;
>    uint16_t pci_info_offset;
> -  uint16_t masterhwfunction_offset;      //Offest for SW to get all comm=
and function offsets, Don't change the position
> -  uint16_t masterdatatable_offset;       //Offest for SW to get all data=
 table offsets, Don't change the position
> +  uint16_t masterhwfunction_offset;      //Offset for SW to get all comm=
and function offsets, Don't change the position
> +  uint16_t masterdatatable_offset;       //Offset for SW to get all data=
 table offsets, Don't change the position
>    uint16_t reserved;
>    uint32_t pspdirtableoffset;
>  };
> @@ -453,7 +453,7 @@ struct atom_dtd_format
>    uint8_t   refreshrate;
>  };
>
> -/* atom_dtd_format.modemiscinfo defintion */
> +/* atom_dtd_format.modemiscinfo definition */
>  enum atom_dtd_format_modemiscinfo{
>    ATOM_HSYNC_POLARITY    =3D 0x0002,
>    ATOM_VSYNC_POLARITY    =3D 0x0004,
> @@ -678,7 +678,7 @@ struct lcd_info_v2_1
>    uint32_t reserved1[8];
>  };
>
> -/* lcd_info_v2_1.panel_misc defintion */
> +/* lcd_info_v2_1.panel_misc definition */
>  enum atom_lcd_info_panel_misc{
>    ATOM_PANEL_MISC_FPDI            =3D0x0002,
>  };
> @@ -716,7 +716,7 @@ enum atom_gpio_pin_assignment_gpio_id {
>    /* gpio_id pre-define id for multiple usage */
>    /* GPIO use to control PCIE_VDDC in certain SLT board */
>    PCIE_VDDC_CONTROL_GPIO_PINID =3D 56,
> -  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swithing =
feature is enable */
> +  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC switching=
 feature is enable */
>    PP_AC_DC_SWITCH_GPIO_PINID =3D 60,
>    /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot feature=
 is enable */
>    VDDC_VRHOT_GPIO_PINID =3D 61,
> @@ -734,7 +734,7 @@ enum atom_gpio_pin_assignment_gpio_id {
>  struct atom_gpio_pin_lut_v2_1
>  {
>    struct  atom_common_table_header  table_header;
> -  /*the real number of this included in the structure is calcualted by u=
sing the (whole structure size - the header size)/size of atom_gpio_pin_lut=
  */
> +  /*the real number of this included in the structure is calculated by u=
sing the (whole structure size - the header size)/size of atom_gpio_pin_lut=
  */
>    struct  atom_gpio_pin_assignment  gpio_pin[];
>  };
>
> @@ -997,7 +997,7 @@ enum atom_connector_layout_info_mini_type_def {
>
>  enum atom_display_device_tag_def{
>    ATOM_DISPLAY_LCD1_SUPPORT            =3D 0x0002, //an embedded display=
 is either an LVDS or eDP signal type of display
> -  ATOM_DISPLAY_LCD2_SUPPORT                           =3D 0x0020, //seco=
nd edp device tag 0x0020 for backward compability
> +  ATOM_DISPLAY_LCD2_SUPPORT            =3D 0x0020, //second edp device t=
ag 0x0020 for backward compatibility
>    ATOM_DISPLAY_DFP1_SUPPORT            =3D 0x0008,
>    ATOM_DISPLAY_DFP2_SUPPORT            =3D 0x0080,
>    ATOM_DISPLAY_DFP3_SUPPORT            =3D 0x0200,
> @@ -1011,7 +1011,7 @@ struct atom_display_object_path_v2
>  {
>    uint16_t display_objid;                  //Connector Object ID or Misc=
 Object ID
>    uint16_t disp_recordoffset;
> -  uint16_t encoderobjid;                   //first encoder closer to the=
 connector, could be either an external or intenal encoder
> +  uint16_t encoderobjid;                   //first encoder closer to the=
 connector, could be either an external or internal encoder
>    uint16_t extencoderobjid;                //2nd encoder after the first=
 encoder, from the connector point of view;
>    uint16_t encoder_recordoffset;
>    uint16_t extencoder_recordoffset;
> @@ -1023,7 +1023,7 @@ struct atom_display_object_path_v2
>  struct atom_display_object_path_v3 {
>         uint16_t display_objid; //Connector Object ID or Misc Object ID
>         uint16_t disp_recordoffset;
> -       uint16_t encoderobjid; //first encoder closer to the connector, c=
ould be either an external or intenal encoder
> +       uint16_t encoderobjid; //first encoder closer to the connector, c=
ould be either an external or internal encoder
>         uint16_t reserved1; //only on USBC case, otherwise always =3D 0
>         uint16_t reserved2; //reserved and always =3D 0
>         uint16_t reserved3; //reserved and always =3D 0
> @@ -3547,7 +3547,7 @@ struct atom_voltage_object_header_v4{
>  enum atom_voltage_object_mode
>  {
>     VOLTAGE_OBJ_GPIO_LUT              =3D  0,        //VOLTAGE and GPIO L=
ookup table ->atom_gpio_voltage_object_v4
> -   VOLTAGE_OBJ_VR_I2C_INIT_SEQ       =3D  3,        //VOLTAGE REGULATOR =
INIT sequece through I2C -> atom_i2c_voltage_object_v4
> +   VOLTAGE_OBJ_VR_I2C_INIT_SEQ       =3D  3,        //VOLTAGE REGULATOR =
INIT sequence through I2C -> atom_i2c_voltage_object_v4
>     VOLTAGE_OBJ_PHASE_LUT             =3D  4,        //Set Vregulator Pha=
se lookup table ->atom_gpio_voltage_object_v4
>     VOLTAGE_OBJ_SVID2                 =3D  7,        //Indicate voltage c=
ontrol by SVID2 ->atom_svid2_voltage_object_v4
>     VOLTAGE_OBJ_EVV                   =3D  8,
> @@ -3585,7 +3585,7 @@ struct atom_gpio_voltage_object_v4
>  {
>     struct atom_voltage_object_header_v4 header;  // voltage mode =3D VOL=
TAGE_OBJ_GPIO_LUT or VOLTAGE_OBJ_PHASE_LUT
>     uint8_t  gpio_control_id;                     // default is 0 which i=
ndicate control through CG VID mode
> -   uint8_t  gpio_entry_num;                      // indiate the entry nu=
mbers of Votlage/Gpio value Look up table
> +   uint8_t  gpio_entry_num;                      // indicate the entry n=
umbers of Votlage/Gpio value Look up table
>     uint8_t  phase_delay_us;                      // phase delay in unit =
of micro second
>     uint8_t  reserved;
>     uint32_t gpio_mask_val;                         // GPIO Mask value
> @@ -4507,8 +4507,8 @@ struct amd_acpi_description_header{
>  struct uefi_acpi_vfct{
>    struct   amd_acpi_description_header sheader;
>    uint8_t  tableUUID[16];    //0x24
> -  uint32_t vbiosimageoffset; //0x34. Offset to the first GOP_VBIOS_CONTE=
NT block from the beginning of the stucture.
> -  uint32_t lib1Imageoffset;  //0x38. Offset to the first GOP_LIB1_CONTEN=
T block from the beginning of the stucture.
> +  uint32_t vbiosimageoffset; //0x34. Offset to the first GOP_VBIOS_CONTE=
NT block from the beginning of the structure.
> +  uint32_t lib1Imageoffset;  //0x38. Offset to the first GOP_LIB1_CONTEN=
T block from the beginning of the structure.
>    uint32_t reserved[4];      //0x3C
>  };
>
> @@ -4540,7 +4540,7 @@ struct gop_lib1_content {
>  /*
>    **********************************************************************=
*****
>                     Scratch Register definitions
> -  Each number below indicates which scratch regiser request, Active and
> +  Each number below indicates which scratch register request, Active and
>    Connect all share the same definitions as display_device_tag defines
>    **********************************************************************=
*****
>  */
> --
> 2.43.0
>
