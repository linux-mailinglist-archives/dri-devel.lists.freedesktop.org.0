Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712D2ED5F2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD66589B83;
	Thu,  7 Jan 2021 17:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C4589B83
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:47:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c133so5862672wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 09:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=FVkiNKl785rRHfkhT0jkIlxfyJmaCj+j7D8f/PwIPwo=;
 b=OCW93FBGDdlW1IO8YOTTOZvpz/xhQubaFj/5ogv9RP2Nx7Y0uGqnVF4q8AWtOeAR7O
 7N1mIeMLEGw9AHisb4KENC7FyrWeJ96lVQLVN1HQLsW05amJNePPz1V8rpB25ujEyxUh
 FIJsHSAQGaWJjVmSVC9JWqR0JsgL8JpKJARS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FVkiNKl785rRHfkhT0jkIlxfyJmaCj+j7D8f/PwIPwo=;
 b=cQ0VWp82/Oi/MM0lPPuII2xZOuXK7cZRQZPFZTB8NPoioZt7sP/YhHXEhvjC3EuA6y
 m8h28gAQxsqU1KxtcaSIwAWs62YKCUP3IGJbIhvLwev0C4ObfkESklE/wr5y2WRbToA7
 j0HtHDnyvCwhnNq4WWEGmY7VX57E7DuFaCQ0+8YmNy0MMXoB/4HBDXcruODJCvnaceL4
 JnB4vome+XmV2W5a+VlKReqHDPzLjss1NjMPMNMNx5kHLtvpd4DaxzNpcPH2//TFPEqj
 ZhZHzaGbuBCvyP1fZK58ETiZr1DJpIl7iBVBvN08A3igkJ7YxkMjtmv0GwMJm3EsE6Qy
 j6qw==
X-Gm-Message-State: AOAM532znddUQLVtyHM5PYGzwx2xZTXUUMQeifQQouQnkjaCK/zqjaFk
 9d8ZwFLybHhJILk3Y4vF24ftxA==
X-Google-Smtp-Source: ABdhPJxCXJdiaSbPhtROxkoiYK0Ot/i0W4Y+zklyQv/Ov1KMlh/j29f2tZQs0FvUnDLFsEzHDc3lWw==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr8998813wmh.101.1610041626648; 
 Thu, 07 Jan 2021 09:47:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q73sm9165220wme.44.2021.01.07.09.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:47:05 -0800 (PST)
Date: Thu, 7 Jan 2021 18:47:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] drm/mipi-dbi: Switch to new kerneldoc syntax for named
 variable macro argument
Message-ID: <X/dJGPDCDjmu1jx/@phenom.ffwll.local>
Mail-Followup-To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20210101211818.1023919-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101211818.1023919-1-j.neuschaefer@gmx.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 01, 2021 at 10:18:17PM +0100, Jonathan Neusch=E4fer wrote:
> The syntax without dots is available since commit 43756e347f21
> ("scripts/kernel-doc: Add support for named variable macro arguments").
> =

> The same HTML output is produced with and without this patch.
> =

> Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_mipi_dbi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index c2827ceaba0d2..f543d6e3e822c 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -172,7 +172,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuff=
er *fb,
>   * mipi_dbi_command - MIPI DCS command with optional parameter(s)
>   * @dbi: MIPI DBI structure
>   * @cmd: Command
> - * @seq...: Optional parameter(s)
> + * @seq: Optional parameter(s)
>   *
>   * Send MIPI DCS command to the controller. Use mipi_dbi_command_read() =
for
>   * get/read.
> --
> 2.29.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
