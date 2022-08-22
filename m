Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B55959C991
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084B7A17A2;
	Mon, 22 Aug 2022 20:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263BCA1775;
 Mon, 22 Aug 2022 20:05:49 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11c5505dba2so14227779fac.13; 
 Mon, 22 Aug 2022 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1naA9vNk3/eH1I9D52GSl1kXImc5DsL+BHAHMfWytNg=;
 b=FiL9UObuk3rpCWubxZ8WQ+aemJSVWBIbauSNQt/grOIvCnzA79D7l8a00R/sJEoeII
 lcMZJgKezXZ5AXKJzJSiFwtJphdeeRSUBzRwFqCiPCQFBAXwJ0//1YeBpwznoBRQhwrv
 CAchVzvYi3Z/R/49n2gQ0GOAS3n4xbdTjcfNWIsrfkiFZs+cl3DOdWFS0qmc5h1gOBos
 z4x8GnKVitthJaWRr8IfQ79VrvBt8z4dowPq45yXpuhQI7XyvUZVZAik77xaDsFZTRk8
 2UiRHMJo6tiLzthK8QEdovMA1tboLi0ey97QxHLRypsUluIr084U21cdg41j9tk8SiI9
 Vlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1naA9vNk3/eH1I9D52GSl1kXImc5DsL+BHAHMfWytNg=;
 b=7eqy2wr37yZ+GRA20nYI0+a00YYVx1Xgn0aCi+GjtkurSUiCVAoBpM+hQjmY9ouTVp
 oeyU0ultuLFijarg+ivKEDZ5y34o/Tz1dUK+oWdKTMy8j0pbh26luYzA3b77eTHpHc5t
 47oy+YvnhbspTcue4SDXX8+7LXaZ9t9v0JJtXsOTcnmjXUkqmq/tcUGVQtBaY4GhHBGS
 9Ib7D6Q6XeerCCr5KwWZhu9sVFs0LTVq9orreMrSKd5xVyXUc5STAyiGav+OeSNkrPb7
 4xmtRS6nFLn9w804eSJKvJU0mW60O+sV0k+2LplVWyGIRsLJ2uRguoyJq+HFMV/jCvo+
 LMnw==
X-Gm-Message-State: ACgBeo0hR9rnkT/OvNh5zzoCo7mUPy8GuLeqbZ5IpQ5EGBtwOKMUPEyg
 F1ye4n+I3P6SXqCAqGIKo6jfHoCqysW8GlXSPX0=
X-Google-Smtp-Source: AA6agR7sPlq70WfnkK/fn8Kr8gLJ6XcQxfG0rnSlznVKc2vdkpVpZQAvPXLCiRSQSruyWOMySRZTiuZGaBBHxpqsue0=
X-Received: by 2002:a05:6870:e98b:b0:10d:fe5c:f818 with SMTP id
 r11-20020a056870e98b00b0010dfe5cf818mr21365oao.106.1661198749228; Mon, 22 Aug
 2022 13:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220821062528.13416-1-tales.aparecida@gmail.com>
In-Reply-To: <20220821062528.13416-1-tales.aparecida@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Aug 2022 16:05:37 -0400
Message-ID: <CADnq5_MMAjk3-YzgCEtkk9228Mwwnc3oTSXkNG17CdTafYjoGg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unneeded defines from bios parser
To: Tales Aparecida <tales.aparecida@gmail.com>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Aug 21, 2022 at 2:41 AM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Removes DEFINEs that should have been removed after they were
> introduced to ObjectID.h by the commit abea57d70e90
> ("drm/amdgpu: Add BRACKET_LAYOUT_ENUMs to ObjectID.h")
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>  .../drm/amd/display/dc/bios/bios_parser2.c    | 19 -------------------
>  1 file changed, 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 09fbb7ad5362..ead4da11a992 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -44,25 +44,6 @@
>
>  #include "bios_parser_common.h"
>
> -/* Temporarily add in defines until ObjectID.h patch is updated in a few days */
> -#ifndef GENERIC_OBJECT_ID_BRACKET_LAYOUT
> -#define GENERIC_OBJECT_ID_BRACKET_LAYOUT          0x05
> -#endif /* GENERIC_OBJECT_ID_BRACKET_LAYOUT */
> -
> -#ifndef GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1
> -#define GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1  \
> -       (GRAPH_OBJECT_TYPE_GENERIC << OBJECT_TYPE_SHIFT |\
> -       GRAPH_OBJECT_ENUM_ID1 << ENUM_ID_SHIFT |\
> -       GENERIC_OBJECT_ID_BRACKET_LAYOUT << OBJECT_ID_SHIFT)
> -#endif /* GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1 */
> -
> -#ifndef GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID2
> -#define GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID2  \
> -       (GRAPH_OBJECT_TYPE_GENERIC << OBJECT_TYPE_SHIFT |\
> -       GRAPH_OBJECT_ENUM_ID2 << ENUM_ID_SHIFT |\
> -       GENERIC_OBJECT_ID_BRACKET_LAYOUT << OBJECT_ID_SHIFT)
> -#endif /* GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID2 */
> -
>  #define DC_LOGGER \
>         bp->base.ctx->logger
>
> --
> 2.37.2
>
