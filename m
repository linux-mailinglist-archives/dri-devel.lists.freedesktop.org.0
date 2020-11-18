Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439DC2B7B81
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 11:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774926E3F7;
	Wed, 18 Nov 2020 10:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3675589F71
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 10:40:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so1697667wrx.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 02:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=++pPs8jkpJz9Nont+tKJO3PiqC1iJMBxa5uH/V+J9UE=;
 b=Fgu1T/FQw/DaLa1MtZ/Eb3qiJiV+mAVIaZOoDIqD6qmRoHRfQAWIunZYDxPPXVVAmU
 Ryko4oXuwgVzO7Xp7l78q978KPqU0YebheHuk28P2viGJH8jbE5LdsWhERGbNtWtRLjv
 6yOFgzjRPkBhWl7kKs6On/NUGy6kPmtRCvlPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=++pPs8jkpJz9Nont+tKJO3PiqC1iJMBxa5uH/V+J9UE=;
 b=nIJiLLEPb68wdok3JOw99BAu2+xFeTV8Iw87GJgoDsf7anPhv5lUzf9uUi1MYhgSWT
 eJiYHBnUXTxsnXe+QLKjcCqf0674QGChTdm06aV3k+FbK3WjbwtKF/20G8ytBpFreBzc
 ZLLfhtRHf/2q5RMpETF9MTtvVppKzmPGZX0PUfN4lDfnflA3kxdW8F27ojuqNpQ4QSAU
 S4tTt0Ia/1Skbj0HirdUTr0XtzggPiRurGAJuhOx3wNZpzA/4uxza+oOCqogrNZu+3u3
 6qpFIYELWQuE4Vh9yTFz5WRDtryK8npdgRJFlVnWQ/C71C+AEBqaW2Ntv8g5gLAbqab8
 n41Q==
X-Gm-Message-State: AOAM533vNgHE4WcbFWPbbZ0uxpHSQbDXSvvQVKiktCmO6FldiK2CYhXb
 xgU2T1J6dXZojuyetnMUVd7Omcx1QZdVaQ==
X-Google-Smtp-Source: ABdhPJx7op8YkRCAKvwJtyZpyU38qtImhka+ijdrmhCQTL28+g5MuiEFUzssNP8JpWt5xYjrCuq0PQ==
X-Received: by 2002:a5d:514f:: with SMTP id u15mr3946231wrt.385.1605696017897; 
 Wed, 18 Nov 2020 02:40:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m3sm28815288wrv.6.2020.11.18.02.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:40:17 -0800 (PST)
Date: Wed, 18 Nov 2020 11:40:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/docs: Fix todo.rst
Message-ID: <20201118104015.GX401619@phenom.ffwll.local>
References: <20201118073637.597206-1-daniel.vetter@ffwll.ch>
 <jZPv-Syhslxgru5BE84oYRZshAcQb4oTqai9CIWP39ZAwfwcDmIQnoSVGEPARAQ3Fa6F89enSHbQ648O7mkfUuL_2UHpCPmFBcvZzXDJvcA=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jZPv-Syhslxgru5BE84oYRZshAcQb4oTqai9CIWP39ZAwfwcDmIQnoSVGEPARAQ3Fa6F89enSHbQ648O7mkfUuL_2UHpCPmFBcvZzXDJvcA=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 08:04:46AM +0000, Simon Ser wrote:
> On Wednesday, November 18, 2020 8:36 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > I didnt' format the thing correctly :-(
> >
> > Fixes: 39aead8373b3 ("fbcon: Disable accelerated scrolling")
> > Reported-by: Stephen Rothwell sfr@canb.auug.org.au
> > Cc: Stephen Rothwell sfr@canb.auug.org.au
> > Signed-off-by: Daniel Vetter daniel.vetter@intel.com
> 
> Reviewed-by: Simon Ser <contact@emersion.fr>
> 
> Note that a blank line is required before the first item and after the
> last, but is optional between items.

Thanks for reviewing, patch applied.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
