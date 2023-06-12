Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D34A72C924
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB8010E29E;
	Mon, 12 Jun 2023 15:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F01A10E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:00:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f6e1394060so31468315e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686582055; x=1689174055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/UCUFMga2EMcERlpB49Y2fRq+ymUyOKrUgYsHf0ed/0=;
 b=L7nqJsGZJ4kjY557qHqALuPae3RMHgvnYVpXo9/i2LZxf+CHtnV8BP7RS0uaMpPTwT
 X+6kER9YLs5NxP7uKsF8cHFD32Ls6Scn2FTrCk9nnG09Yp6PZMYOkG1tQkgHjBix6xY7
 xuhU29+n8M9LCoUamZ9pqUzT8dDv7DywYHg8fIZMxw8t7F+5VYUwNYFTYo9GfgqeretD
 EmsVU0NZjuohlcKKvHC1OpmyXxOWixpyOSKcW7xV3NEfYWS56ZHkZZAui0yWoIrkt/Qe
 cHuDOT6CHhLJpMAmKvexEECF0ia6zcRfZkBvR9gopfAI64jbHon5ing/2AKGWvSwP9r3
 IlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686582055; x=1689174055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UCUFMga2EMcERlpB49Y2fRq+ymUyOKrUgYsHf0ed/0=;
 b=Fl+iKDHlLMsaeF1DikDFNFGorkShpyIG2tkhic1FTJ2Z/mHjJdtHlh7gEuLxBwwwGB
 c3oZ74uVqEKRQuzUY609JdR7JMmMuncdjuUkDvZm34b+QgCny4Vj+YSlXrDE6/yjEC9X
 OWJdWkA50A9stdporWtAtzfh5LyMvvTjh3jKxuT2At+JNeFZm9J8Nih+4FuBTw/bhYPl
 BZn8wN71s39H/KOXfNv45y42Ky/Ynz1NsYaHClGz9qmei9FGdzX0Y9X1krMO7BgI1GAb
 Sv7uZr+KqHy+A7k5i+bGGxV6wPv/BMckUsPF+F5Ve4k4uhszFyfuQtAbJAv+iDVQFhVK
 P+eA==
X-Gm-Message-State: AC+VfDx4Jr2rNL8gZG8pOvxxDpIXEahGHSN62vYLUuuqleDheqlZPMbI
 7eLzWhq1KI3nfuRn+znOTBJhTw==
X-Google-Smtp-Source: ACHHUZ5u3c8rRm+E7KnayrCIdvayKld94mEi/X7AbulId0IMRsAxTcEdEsJfHEZekp046ksej9BC6w==
X-Received: by 2002:a05:600c:21c4:b0:3f7:e48b:9752 with SMTP id
 x4-20020a05600c21c400b003f7e48b9752mr5759053wmj.32.1686582054775; 
 Mon, 12 Jun 2023 08:00:54 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f9-20020a7bc8c9000000b003f8140763c7sm6545492wml.30.2023.06.12.08.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 08:00:53 -0700 (PDT)
Date: Mon, 12 Jun 2023 18:00:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Message-ID: <573e1bac-57a6-466c-ab69-28366a300143@kadam.mountain>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-2-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 michael.j.ruhl@intel.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 stable@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:39PM +0200, Thomas Zimmermann wrote:
> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
> 
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
> 
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
> 

Thanks.  This helps a lot.  I stared at this for a long time without
seeing the fix.  Then I misunderstood Sam's review comments (my fault,
they were clear in retrospect) so I got completely lost.

regards,
dan carpenter

