Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E5A2F7EF4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 16:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1846E450;
	Fri, 15 Jan 2021 15:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BAB6E43B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 15:08:27 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id q25so8778922otn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 07:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H37KGAYCi6GpCBWPjjQMToPLGzP99YwjcW6c4ftiIIM=;
 b=ZmomQwm+5X1n9F0dXtcZiVWcLPunkdj/T8KgcmX6Bp/4DqVhsCNg+cJ/9OLaHYrAai
 3QKQ97f+99mlwzB5oeYciFxjdiEtr76pySOO1cApLrQvx5jwtHODPz6pCzQAbaxLCvho
 MJQX08vad2RyNc8PC4M/JpfPAjphKo7sgMXx/HC3463RcgvA7O6B/feipZPy+mCtnxqk
 axIJ5Gm4BV2DJAyppE3xmZErQXwmOo4qHyBufwQGA8NLXwH5TalLy38+Zg4cb3jQ6oT6
 KQUyzdU2Wxhz4s+KcaKUV/CUZ1lnJ/dX9X2cyswTBRBAtajTPzh3/qLyT5MSkc30wG+L
 Fglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H37KGAYCi6GpCBWPjjQMToPLGzP99YwjcW6c4ftiIIM=;
 b=uEPIAAznMKEvxpEm3f7WMDEJFlH2A0z747B356bv//aiHMJKrmXFXSIVRama/2g5L4
 R9Iw2R3/zpATAiuQYQUeddSnH4C+qb3h1HVXWCcejXKyyqPHoIXx7OElzOn2LX8Zyhdz
 2qz8iFRkDEAUT01Q2pFqKfsvY3lIdMAsgIlmqqZKNHfsazhSB7W+Q4ps1+F79bVu4uoG
 8FBD62KjIzrA/hmQzSA/nOVtLNXD3v4k4wDr3w2FGZyf0VsUC2LM6TDGz9XTjSf7UW7s
 lZI4bXT3WrO2vSp/6Nsl/IsTddKgzmlpiZ0QvG9O73aTawIWVY50w+DvWdUulrL/tR1j
 XCvg==
X-Gm-Message-State: AOAM531lGXRqrnh43mSxbfxATA2e2j2z651q4HZQKuwCrklhEXgfPwMN
 zqgVGUOhMJPD49uq6ybVtm8FdZBWPL7e0oeRZis1uDV5
X-Google-Smtp-Source: ABdhPJww0LGLfoXG3HFp+0zGWrEtRY4as4jME8h/DG1XNnA44A+jx+2i97NE04JTOFOwwyGMxiUJj1AllkjNm4jM+Ys=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr8493397otb.23.1610723307294; 
 Fri, 15 Jan 2021 07:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20210115122310.7dd6bb11@canb.auug.org.au>
 <20210115150201.34256-1-nirmoy.das@amd.com>
In-Reply-To: <20210115150201.34256-1-nirmoy.das@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 15 Jan 2021 10:08:16 -0500
Message-ID: <CADnq5_P3Q+HS0qax8FNTn5NeaEj2X4jB6DAcEOG3fJCCfsWEWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unused variable
To: Nirmoy Das <nirmoy.das@amd.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 10:02 AM Nirmoy Das <nirmoy.das@amd.com> wrote:
>
> Remove unused adev variable
>
> Fixes:   8f66090b7bb7 ("drm/amdgpu: Remove references to struct drm_device.pdev")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 0150a51b65ef..f764803c53a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -926,7 +926,6 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>                                        struct drm_file *file_priv,
>                                        const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> -       struct amdgpu_device *adev = drm_to_adev(dev);
>         struct drm_gem_object *obj;
>         struct amdgpu_framebuffer *amdgpu_fb;
>         int ret;
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
