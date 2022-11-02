Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBE6167A7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 17:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC05D10E4F2;
	Wed,  2 Nov 2022 16:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4299110E4F2;
 Wed,  2 Nov 2022 16:12:28 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 r13-20020a056830418d00b0065601df69c0so10542740otu.7; 
 Wed, 02 Nov 2022 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z7vIW2ZPdKtmwvSjnPCnyJNltgx5dmGmaEed71/1EzY=;
 b=LR6ZQXMJSJ0L4WINnpm9F0OvdWhXsPNOqWYN8PlsGouCRf7BqfwwWwk07fPirnSAD0
 jWjcIyLLDyq40aOTJCaEx9Wo+AaQpVsAPbIsk6U3UsVV2/KqpuYc9kJKdyH6BZgDTFVw
 XPJijFDbCfxAIU+B4TbcBE08wlsroXr5KHJ/eu4oHYI8hKw45ONqDX7bGNEOebfJUB61
 XmzOPDwjWMN9dgz3/Y4RNgJX87bClWeXL+symO7uPezJ6OjK/x51yn0GnhlTyXS1UKdm
 /ABvYrGYTgJbmx6KLjvAp9IYRn4WnXD7/bHuoOGPeT5d+Z4uVZhlTNH4HPAC5xF28J7X
 dF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7vIW2ZPdKtmwvSjnPCnyJNltgx5dmGmaEed71/1EzY=;
 b=kanToUUCn1lwP0uPsTNo5urRgr2Bfa9gb7QZm7u5OU2pSsIQprApZiILf/hOcRLZPi
 5d2j1D/3lDM/iU2FialEUMwXrKU2dYPaAv5uMaqIKrz6Qql51kJUaEk86FIPCoGRm4Gf
 ELv0+rU2wetJQv9gWIKLEyRRVcj7DH+B+jrQyK0a5Tjb2qqezcsE5vKp3wyyTel+KnbZ
 2Did+wfk3Jw13VdsR8FIU2CB5yLCMLrhFRg1PyW55UHlnaqrbvt0ZURugC2OeJ62tkzZ
 3/Tk223B4pa5WT/p+D3CuGYrFx42xkXQZppJiBw0OmKOug3gHiznCev3BOjBF1I+UNq8
 ZVoA==
X-Gm-Message-State: ACrzQf2WpbZSpopq5dR9+MjewLavIi9GYYwO1AlpVpuGssgzAdTL1OgD
 FMoNgjWCbuqXbRSXdo0RLJmi9H9+K7TRUtDTtaY=
X-Google-Smtp-Source: AMsMyM7Zuvi4mA7zyRQSf/ChuxdDKCxCX2EM1sE6SPy5eaAZxlItbrLR6mIvGbAnghWSCEFJp6Lq5z4DPcWB049mY24=
X-Received: by 2002:a9d:4592:0:b0:66c:6922:8629 with SMTP id
 x18-20020a9d4592000000b0066c69228629mr5232697ote.233.1667405547576; Wed, 02
 Nov 2022 09:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <Y1x3MtRJ8ckXxlJn@mail.google.com>
 <Y1yCRHgx15ZOiCL4@mail.google.com>
In-Reply-To: <Y1yCRHgx15ZOiCL4@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Nov 2022 12:12:16 -0400
Message-ID: <CADnq5_NVpsFJdHfizqRxidXqN5CZJ-nQpqfEA3Ngd3viojjBXA@mail.gmail.com>
Subject: Re: [PATCH v2] [next] drm/amdgpu: Replace one-element array with
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
Cc: Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Slark Xiao <slark_xiao@163.com>, Hans de Goede <hdegoede@redhat.com>,
 Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Oct 28, 2022 at 9:31 PM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> refactor the rest of the code accordingly.
>
> Important to mention is that doing a build before/after this patch
> results in no binary output differences.
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
> Changelog:
>
> v2: no binary output differences patch; report binary changes findings
>     on commit log. Res: Kees Cook
> v1: https://lore.kernel.org/lkml/Y1tkWdwPUp+UdpM0@mail.google.com/
> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 7 +++++--
>  drivers/gpu/drm/amd/include/atombios.h         | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index 6be9ac2b9c5b..18ae9433e463 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -2081,8 +2081,11 @@ amdgpu_atombios_encoder_get_lcd_info(struct amdgpu_encoder *encoder)
>                                                 }
>                                         }
>                                         record += fake_edid_record->ucFakeEDIDLength ?
> -                                               fake_edid_record->ucFakeEDIDLength + 2 :
> -                                               sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
> +                                                 struct_size(fake_edid_record,
> +                                                             ucFakeEDIDString,
> +                                                             fake_edid_record->ucFakeEDIDLength) :
> +                                                 /* empty fake edid record must be 3 bytes long */
> +                                                 sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;
>                                         break;
>                                 case LCD_PANEL_RESOLUTION_RECORD_TYPE:
>                                         panel_res_record = (ATOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index 15943bc21bc5..b5b1d073f8e2 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -4107,7 +4107,7 @@ typedef struct _ATOM_FAKE_EDID_PATCH_RECORD
>  {
>    UCHAR ucRecordType;
>    UCHAR ucFakeEDIDLength;       // = 128 means EDID length is 128 bytes, otherwise the EDID length = ucFakeEDIDLength*128
> -  UCHAR ucFakeEDIDString[1];    // This actually has ucFakeEdidLength elements.
> +  UCHAR ucFakeEDIDString[];     // This actually has ucFakeEdidLength elements.
>  } ATOM_FAKE_EDID_PATCH_RECORD;
>
>  typedef struct  _ATOM_PANEL_RESOLUTION_PATCH_RECORD
> --
> 2.37.3
>
