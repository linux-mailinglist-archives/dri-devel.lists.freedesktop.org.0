Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC01358110
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAE46EA7B;
	Thu,  8 Apr 2021 10:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AA46EA7B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:48:13 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x15so1627734wrq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+tM1VhsR5JLEqrdun2p+pXW1Z3vb1JeVY7BFb7nbnkU=;
 b=EHzcvybM6U0qnPL8I1ULllqLyy0r5s8VzjA8P2lBniI66ca0uJvOvOIZAks/470n3c
 Atyik6/4nGJDy7++YY5ZxQJ/bpjZqkVYFr3NofZ49GWCLaXT7J/vKsMdtg9UQZadN6Cv
 QMrQLlqlSGl8i+jC0+MvrTzEuZpI6NEkHjWgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+tM1VhsR5JLEqrdun2p+pXW1Z3vb1JeVY7BFb7nbnkU=;
 b=FJ7EV73r/ivr4EpO9W86vvdxePyISCPLKwy60hAUPXylLgRIc/Zu886c/kBc6BYtgC
 A9euqdzAnVzpnAawJ5Hj9IBuBn2qNeme/nuZ6dmKevG53oAIRou1KiAD/cg2Z2h5Zk9c
 J5Lqq7CWbYelxDpoZs2E/W8icqFF/UvFrvkNCRhGkFmik3eY1rfUiCtMt0e8vmSj8rWD
 V6ilWHMA4w8BGqnZhQ1J3wc5rg1YL0GPdvsxUYetmlDjUJsC8ifMWETV50NKG4lAF5ya
 Fg+zgvszRgVXKwC+pT6lvfxfOKK5cX6splXtTN/WiBD6KDzCEfi+RK7MiU0bZ4Y3zEEP
 OBtQ==
X-Gm-Message-State: AOAM533E6O/M+xGqH7VDEsiUGgXwx/P3mXpKoLyk6Ur4oLL21HGpRO45
 CPnwqDrOGdN86j3nwpFhxlEZTA==
X-Google-Smtp-Source: ABdhPJw/bvlkDekJeYGfRes6poMpWMhyMw0RCEw+pGcSXHz5+pxpKGabzFdEIvkGxdRniIf/ogbXwA==
X-Received: by 2002:a5d:4009:: with SMTP id n9mr10548226wrp.348.1617878892300; 
 Thu, 08 Apr 2021 03:48:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm14656191wrt.22.2021.04.08.03.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:48:11 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:48:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: Fix 3 typos in the inline doc
Message-ID: <YG7faWxOnsWyFJYQ@phenom.ffwll.local>
References: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
 <BfA-piXji9BZRHnRUxveUb-SF8mAW5piyHW8fZT5o2xy0g-z21gO2Gyu2Iw5pUX7v2K1NpELuornJXEFtH8kBPhDfJFyWsyee4rol2suPZs=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BfA-piXji9BZRHnRUxveUb-SF8mAW5piyHW8fZT5o2xy0g-z21gO2Gyu2Iw5pUX7v2K1NpELuornJXEFtH8kBPhDfJFyWsyee4rol2suPZs=@emersion.fr>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, airlied@linux.ie,
 dafna3@gmail.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 enric.balletbo@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 10:35:33AM +0000, Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>
> 
> I'll push this shortly to drm-misc-next.

I also pushed the 2nd patch, seems to have been lost in the applying?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
