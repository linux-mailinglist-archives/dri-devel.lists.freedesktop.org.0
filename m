Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F3814142
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 06:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A47F10E322;
	Fri, 15 Dec 2023 05:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96D510E322;
 Fri, 15 Dec 2023 05:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=eGH+77gu0FXXkUseAHfipZghMBnS03gjwpqhBgPZoHQ=; b=SbtJkMQpZoAzWjW62w/zxVm9rA
 PvWTcYFvUfgvpqPMUgSC+yl2UHjaQu/0Z80DbHySmZUfRngkvxrQmymhJEgN/Tv6oj2B+CTlgNUI3
 ytoxCa+RiLdbCN5KIdGf6FoVNnxtXY5xoPZTpmkz8jzy2dPSUiQ22CUr8da2kAln4xWDNjdilBN6a
 H96q8sgG/9UWfBOjC6xSTvXia1klmJMe4z0ivXxpZk/3rtdK0du6+3sXDBQqOOyZf19LqMg2Alszm
 lHRPVppTyI/esklYIIchIpyHWNNS1b2WHAXbyIbntos55U/x9r8Iqh+Nd8qZSAhFDCxuV1I+WOlEa
 cukB6akg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rE0lE-00244d-0e; Fri, 15 Dec 2023 05:29:20 +0000
Message-ID: <5a58e510-e5b4-42ae-95a3-257ca802212a@infradead.org>
Date: Thu, 14 Dec 2023 21:29:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: amd: fixed typos
Content-Language: en-US
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, candice.li@amd.com, Le.Ma@amd.com,
 lijo.lazar@amd.com
References: <20231215052033.550509-1-ghanshyam1898@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231215052033.550509-1-ghanshyam1898@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 12/14/23 21:20, Ghanshyam Agrawal wrote:
> Fixed multiple typos in atomfirmware.h
> 
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
>  drivers/gpu/drm/amd/include/atomfirmware.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
> index fa7d6ced786f..41d553921adf 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -210,7 +210,7 @@ atom_bios_string          = "ATOM"
>  };
>  */
>  
> -#pragma pack(1)                          /* BIOS data must use byte aligment*/
> +#pragma pack(1)                          /* BIOS data must use byte alignment */
>  
>  enum atombios_image_offset{
>    OFFSET_TO_ATOM_ROM_HEADER_POINTER          = 0x00000048,
> @@ -452,7 +452,7 @@ struct atom_dtd_format
>    uint8_t   refreshrate;
>  };
>  
> -/* atom_dtd_format.modemiscinfo defintion */
> +/* atom_dtd_format.modemiscinfo definition */
>  enum atom_dtd_format_modemiscinfo{
>    ATOM_HSYNC_POLARITY    = 0x0002,
>    ATOM_VSYNC_POLARITY    = 0x0004,
> @@ -645,7 +645,7 @@ struct lcd_info_v2_1
>    uint32_t reserved1[8];
>  };
>  
> -/* lcd_info_v2_1.panel_misc defintion */
> +/* lcd_info_v2_1.panel_misc definition */
>  enum atom_lcd_info_panel_misc{
>    ATOM_PANEL_MISC_FPDI            =0x0002,
>  };
> @@ -683,7 +683,7 @@ enum atom_gpio_pin_assignment_gpio_id {
>    /* gpio_id pre-define id for multiple usage */
>    /* GPIO use to control PCIE_VDDC in certain SLT board */
>    PCIE_VDDC_CONTROL_GPIO_PINID = 56,
> -  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swithing feature is enable */
> +  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC switching feature is enable */

s/enable/enabled/

>    PP_AC_DC_SWITCH_GPIO_PINID = 60,
>    /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot feature is enable */

Ditto.
There may be a few more that need this same treatment.

>    VDDC_VRHOT_GPIO_PINID = 61,

The other changes look good as far as they go, but codespell reports
a few more misspellings to consider:

atomfirmware.h:213: aligment ==> alignment
atomfirmware.h:257: Offest ==> Offset
atomfirmware.h:258: Offest ==> Offset
atomfirmware.h:390: Offest ==> Offset
atomfirmware.h:455: defintion ==> definition
atomfirmware.h:648: defintion ==> definition
atomfirmware.h:686: swithing ==> switching
atomfirmware.h:704: calcualted ==> calculated
atomfirmware.h:967: compability ==> compatibility
atomfirmware.h:981: intenal ==> internal
atomfirmware.h:993: intenal ==> internal
atomfirmware.h:3469: sequece ==> sequence
atomfirmware.h:3507: indiate ==> indicate
atomfirmware.h:4429: stucture ==> structure
atomfirmware.h:4430: stucture ==> structure
atomfirmware.h:4462: regiser ==> register


thanks.
-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
