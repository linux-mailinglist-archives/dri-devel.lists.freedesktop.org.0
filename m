Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0632C29D1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EF46E41D;
	Tue, 24 Nov 2020 14:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD956E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:39:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r3so4264272wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=epUfeO4AC1EIvywUTH4FATyuakllCC9y8hkvy93TUhQ=;
 b=AwaUcFZ6ZkaIfSuqNGRtkXgW0w4m9qmY3TNhyvv/fHaRvDCo253VCxTlaD63fQYFyD
 HT7cOVJz/alpzd/1F3lTpPEx21EbaSDUsVt9YC4WoPBQ4Zllb2oxKFetsc2JINXsVCN+
 +r6s19tGSJdCFMEjUiU3nfj3ZlQb4FiZHEiUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=epUfeO4AC1EIvywUTH4FATyuakllCC9y8hkvy93TUhQ=;
 b=enoPZJ9M8bwLNsyHPuwKGGiI6wi7Ds32NcysstTLpS+qVoCvXvO4QwsaE/3obqV2zD
 bYzvCMdArozytm1H8S7iU+7tk1JH+90nuPMsM/Uh1narZEJxRxKvM/73Nxa8lg6vYq6K
 GVICDaQpHdoYWFArWS8amF20EbGNIbIrEsrPxWthTgdxZ0WUA1XfDr1NxNoqtRHj6mRR
 wOpIL+84HvFiwX+EPRXy6sboEsJCix9ZzxAr26Y7vQ4KUxDe3XO32P5zGrIeGNlLXvYw
 FcmVagA0wZ5LPvZGImzpH/hbXkDinvftKdco/6Hg4AtY0MNppHKbynYRMJ2ojkbaiiFp
 UaZQ==
X-Gm-Message-State: AOAM531G8tMdM9lNoeJu19j0iu8NZJ22Czi7dQwYrNir1eBFpmFkF7++
 TM9wnwr+iOMr6wxsdga1PpNfCg==
X-Google-Smtp-Source: ABdhPJwcrOqwBovla4lz6xIzxOUFRXevwmyR+IWud9OTGYxJHWo84W+Zu4MJpJxa2IiWJ9pTYH+0Mw==
X-Received: by 2002:adf:8521:: with SMTP id 30mr5548585wrh.265.1606228789975; 
 Tue, 24 Nov 2020 06:39:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b8sm5510680wmj.9.2020.11.24.06.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:39:49 -0800 (PST)
Date: Tue, 24 Nov 2020 15:39:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [BUG] drm/vkms: Failure when using drmGetConnectorCurrent()
Message-ID: <20201124143947.GP401619@phenom.ffwll.local>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 01:19:04PM -0300, Leandro Ribeiro wrote:
> Hello,
> 
> We have a patch in Weston to replace drmGetConnector() calls with
> drmGetConnectorCurrent():
> 
> https://gitlab.freedesktop.org/wayland/weston/-/issues/437
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/518
> 
> Unfortunately this is not working when we use VKMS (upstream version
> tested). Please see
> 
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/518#note_700345

I guess this is without fbdev configured on vkms? That's what usually
papers over this problem for most drivers.

> for more information, and feel free to jump into the discussion. If there's
> more helpful information that I can share, please let me know.

Like Simon suggested, please submit that patch you have for discussion.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
