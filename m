Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40F29D181
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 19:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE846E16D;
	Wed, 28 Oct 2020 18:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59526E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 18:40:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s9so161936wro.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nMCdu9Rzb/ndcD48Tcjh9B2LFonFTQlfv9eH4WIE5/E=;
 b=F0MCnNXxvfO8m+8X6ysd9pz9RNST9ee2OunsJBFhJ1jACU0VNPR7jRqTcr42Em1B/N
 4RkfEXr/avMA+O9xcQ2WiJud6Px7h8GMje+np40dqlpRDSKXgimNhQtHUuAPltPhyb11
 5fbAF7gudEUJdH7kFcywq06bqCQv1F5USJd8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nMCdu9Rzb/ndcD48Tcjh9B2LFonFTQlfv9eH4WIE5/E=;
 b=LL+iVkK+8CFs2vmva2dRQtcfnPCsXrDUL6FVXDl+0Lv1oMjgn5ETptFTfsF5LE7NPU
 YjOCGzDrBlSSqOQJeCBOt/6CI+ZJuQK0LsklIP52q63tT2wKFYdF1ldOZ25+oy/RcK+2
 I6N9C1jd/D+d4xS98GxEfL39sY0l1phrNxBWi7S1WFQCgOTBWkobm5mFNRLyHLlImwOh
 RmajSaKBwfFqcPAkLfrOlFlGj6CIpAcdCnnLVBVMfpYqYEkBwtL1W6U3UykfwW62NmSK
 ryb5/ofn6FBeMcz7IS/KdFP0uhU9o1Secso4YCdjrjY0YoFut+Def9XQEutg/7/cESNO
 z/IQ==
X-Gm-Message-State: AOAM531jBP+6Recfsj+APNzRjsPXwfGO8TFs+pq6R+jPFRqAt9rkpNeA
 dRydHrMe5EtB7LZgg8QunVPvVQ==
X-Google-Smtp-Source: ABdhPJyrBDGD6E9I6oqu06SgLOB/cJ7qVsKtWh9rtNK4o2kg9zioPQMWZFyxGdfWYjPLun8Im926hQ==
X-Received: by 2002:adf:e685:: with SMTP id r5mr841525wrm.340.1603910429440;
 Wed, 28 Oct 2020 11:40:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm597277wrx.64.2020.10.28.11.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 11:40:28 -0700 (PDT)
Date: Wed, 28 Oct 2020 19:40:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH v2 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201028184026.GX401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <20201028105647.1210161-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028105647.1210161-1-yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 06:56:47AM -0400, Peilin Ye wrote:
> `width` and `height` are defined as unsigned in our UAPI font descriptor
> `struct console_font`. Make them unsigned in our kernel font descriptor
> `struct font_desc`, too.
> 
> Also, change the corresponding printk() format identifiers from `%d` to
> `%u`, in sti_select_fbfont().
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Pushed to drm-misc-next, thanks for the patch.
-Daniel

> ---
> Change in v2:
>   - Mention `struct console_font` in the commit message. (Suggested by
>     Daniel Vetter <daniel@ffwll.ch>)
> 
>  drivers/video/console/sticore.c | 2 +-
>  include/linux/font.h            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
> index 6a26a364f9bd..d1bb5915082b 100644
> --- a/drivers/video/console/sticore.c
> +++ b/drivers/video/console/sticore.c
> @@ -502,7 +502,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
>  	if (!fbfont)
>  		return NULL;
>  
> -	pr_info("STI selected %dx%d framebuffer font %s for sticon\n",
> +	pr_info("STI selected %ux%u framebuffer font %s for sticon\n",
>  			fbfont->width, fbfont->height, fbfont->name);
>  			
>  	bpc = ((fbfont->width+7)/8) * fbfont->height; 
> diff --git a/include/linux/font.h b/include/linux/font.h
> index b5b312c19e46..4f50d736ea72 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -16,7 +16,7 @@
>  struct font_desc {
>      int idx;
>      const char *name;
> -    int width, height;
> +    unsigned int width, height;
>      const void *data;
>      int pref;
>  };
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
