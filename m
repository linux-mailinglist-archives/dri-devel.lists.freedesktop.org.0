Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9356AA52
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 20:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E74112A11;
	Thu,  7 Jul 2022 18:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A42112A7E;
 Thu,  7 Jul 2022 18:17:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u12so33809044eja.8;
 Thu, 07 Jul 2022 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xSMXSdyrhgxe/LPeOG9nwUhQ7bCN6L6RT7Z5TEvSX/k=;
 b=JCNjsSHGeIt/T9GRSU4+KoOf4kHWc+fTg9gE2OTI8ZhDBr/Q7oCXYPkRYVYUVZyGne
 XukdokHNmuNj4N0/jjkqnmwPTOYKzh6WspGHl1mffSUqDHiNMERPBqQnZov9/qk8+jqr
 wsJAf2a7Gr38RVsl9okaxE0FcZ93spRUaXiqJJ7MYOqiYKFi3X2NHqARrMEH+QSo7SZ/
 3H6zfhyAu5YN/F5+xok0AQuN4lUBQqT/eEp4YwSJ4UNXsk2O3wERi8lfVQ3u/ZJ2b7Jx
 2SHWu1lTqP1NZDnNcNsW0b8zVR0ourvq4u58yE/ZNQzmqk+hHCiAmEke4jyg5n+CcIIi
 5Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xSMXSdyrhgxe/LPeOG9nwUhQ7bCN6L6RT7Z5TEvSX/k=;
 b=k26YRuz+Ctk2GDRaLjMsv04kuePcADHxoHNZLrnjfcfEzWxPIwtCAD5niQYcLnrAUU
 V6gnDz/7xjE3y8MeGoFohDgAMOLuJmwefS1uIllYAyqFXQEXzS5hpzFQ0X8DWQAQEP8B
 NXvq+odg5qDvPCzQ8obmAmSQlklGVP/qijc1YVLl5llQtZeu193f06/WqizHvJwsWtJC
 u0S1zm6+tTN9WhyXg8A5dRPQ/adPuCF2eG63F6T9DFEY9hN3hCEzAxzFfsqvZ+fJJZzV
 UwvmC0SD2m7VPOSVeJuOHQ9mlBBLv/YHr0YqCW8bPn/spCZthNuEQLnJkU/1uoa4uV9E
 mRYw==
X-Gm-Message-State: AJIora83+6M72avOZKuAB507vsY1A8yqPaXQNtd5k4LYZTyxi9ff6N6Y
 dkw5vercvgLgEhpR/AksUWZNpRl8BMJG54l13SgZkMgL
X-Google-Smtp-Source: AGRyM1uKhskxc8ShQ8HBDSEUOs9v5bJUfRFy8vHIbrZPDlA+g5jVfZKGLahYkwBWgTJefRsXToP8LLkYvfuDAxYz2mk=
X-Received: by 2002:a17:906:dc93:b0:726:a75b:f60f with SMTP id
 cs19-20020a170906dc9300b00726a75bf60fmr45516409ejc.564.1657217858197; Thu, 07
 Jul 2022 11:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220707013812.64057-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220707013812.64057-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Jul 2022 14:17:26 -0400
Message-ID: <CADnq5_Pe_bOh_=oFFu=zhyR=kXNrcVjwFLj0T5zrtwX_ntpTyw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indenting
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jul 6, 2022 at 9:38 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warnings:
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:405 get_bios_object_from_path_v3() warn: inconsistent indenting
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:611 bios_parser_get_hpd_info() warn: inconsistent indenting
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:818 bios_parser_get_device_tag() warn: inconsistent indenting
> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:1599 bios_parser_is_device_id_supported() warn: inconsistent indenting
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  .../gpu/drm/amd/display/dc/bios/bios_parser2.c   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index c332650b7048..6f514d92b401 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -402,7 +402,7 @@ static struct atom_display_object_path_v3 *get_bios_object_from_path_v3(
>                 return NULL;
>         }
>
> -    return NULL;
> +       return NULL;
>  }
>
>  static enum bp_result bios_parser_get_i2c_info(struct dc_bios *dcb,
> @@ -605,8 +605,8 @@ static enum bp_result bios_parser_get_hpd_info(
>             default:
>                 object = get_bios_object(bp, id);
>
> -                       if (!object)
> -                               return BP_RESULT_BADINPUT;
> +               if (!object)
> +                       return BP_RESULT_BADINPUT;
>
>                 record = get_hpd_record(bp, object);
>
> @@ -810,10 +810,10 @@ static enum bp_result bios_parser_get_device_tag(
>                 /* getBiosObject will return MXM object */
>                 object = get_bios_object(bp, connector_object_id);
>
> -                       if (!object) {
> -                               BREAK_TO_DEBUGGER(); /* Invalid object id */
> -                               return BP_RESULT_BADINPUT;
> -                       }
> +               if (!object) {
> +                       BREAK_TO_DEBUGGER(); /* Invalid object id */
> +                       return BP_RESULT_BADINPUT;
> +               }
>
>                 info->acpi_device = 0; /* BIOS no longer provides this */
>                 info->dev_id = device_type_from_device_id(object->device_tag);
> @@ -1596,7 +1596,7 @@ static bool bios_parser_is_device_id_supported(
>                         break;
>         }
>
> -    return false;
> +       return false;
>  }
>
>  static uint32_t bios_parser_get_ss_entry_number(
> --
> 2.20.1.7.g153144c
>
