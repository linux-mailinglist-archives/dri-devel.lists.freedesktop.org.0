Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C09743E76B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 19:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181F76E9A2;
	Thu, 28 Oct 2021 17:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65326E9A2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 17:37:09 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l24-20020a9d1c98000000b00552a5c6b23cso9616135ota.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dv0xHNX0jMXCQn3PBuNmjHwkUsq0Js5QufZhTEkxPU=;
 b=LxRQkwLhKdLIazmQtucYNnomp/YDrnUciFvbozqjGVsxHfIMsmtTExSVuKU3MHKAjO
 eSMaQMEjSy6wIS7S1ohImd4MEpIQpMNbj9RE0o9HxpgGjOE1PqeNZWTWOP4jaXHnVvG7
 5KqTqoiRMKxHiXQKRMrv55u9+PVOC6qARDMCh5WNtiNvlBpxR57F8IuzJYorRSLXMsZd
 8HHVbaYImtNP2PvtUCFRdRPVLO0jQhLVdRM+1eunIE15u4ZOKrW49G1Sehs86Fj6/1Jy
 yL0goz9If4tjQfY9k54Nqfif9SvSotPlq12HF4f14QuakSRsU1RZLDqsNRiScS9UlvtC
 6UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dv0xHNX0jMXCQn3PBuNmjHwkUsq0Js5QufZhTEkxPU=;
 b=GFuLNLOKHyUg+OtALJw2ZH8hKKS3+Qeh52b9KwOG0sRnlidmNY5xHdHF3FI/lT1yAW
 3bQGteETpJezp1s4ggUz0pEk/ql2nwdMtgh0nMLrYl0PwOiPXEDd9HuOQZhFp3GMmr6E
 YLSAdfXHDYjvo/ZPtrFIApme2wI8vEDBKZAtCYhodwELmRkuLi7ZXr7rcvKjhs6JnqlD
 slagrugIOFb8c2+e7bQ27dGAAjv/u9cwYFG1x/FoPgl2VtP5HjBtO/I+DQ+/Ru9HFbMd
 KjVteflEkwgVqwGauGDV4b46xjjx3lUUEQHlvR7S039YdhK4CRex93jLuNknZnXe8WVn
 2Rsg==
X-Gm-Message-State: AOAM531ANwMWm0fpzjfLqTEc8WIbAzjIeSKB6C7cQOPGtmTBP2J+s8Hk
 CQoOPmB0QVc6VUY2fjEP1vPE+x9w0ANc2w2kYds=
X-Google-Smtp-Source: ABdhPJyyGCeySYXHByOuG6VRZWtaZD227v6NhOvuLnqqN2ecNu0dnxc9a2wP2VBR+PId9BkXwb3oBFbGZYxYZoET7as=
X-Received: by 2002:a9d:718e:: with SMTP id o14mr4667817otj.299.1635442629284; 
 Thu, 28 Oct 2021 10:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211028170857.4029606-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20211028170857.4029606-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 Oct 2021 13:36:58 -0400
Message-ID: <CADnq5_N8OOx=Sd3mJSb1KjROUFdB2czrQudLN3Dp_p8=CG8BqA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: dri-devel is for all of drivers/gpu
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 1:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Somehow we only have a list of subdirectories, which apparently made
> it harder for folks to find the gpu maintainers. Fix that.
>
> References: https://lore.kernel.org/dri-devel/YXrAAZlxxStNFG%2FK@phenom.ffwll.local/
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Steven Rostedt <rostedt@goodmis.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98aa1f55ed41..fdb1f91c6bb9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6153,8 +6153,7 @@ T:        git git://anongit.freedesktop.org/drm/drm
>  F:     Documentation/devicetree/bindings/display/
>  F:     Documentation/devicetree/bindings/gpu/
>  F:     Documentation/gpu/
> -F:     drivers/gpu/drm/
> -F:     drivers/gpu/vga/
> +F:     drivers/gpu/
>  F:     include/drm/
>  F:     include/linux/vga*
>  F:     include/uapi/drm/
> --
> 2.33.0
>
