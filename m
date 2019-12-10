Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798111A6DA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505E16EAD6;
	Wed, 11 Dec 2019 09:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4239C6E150;
 Tue, 10 Dec 2019 19:08:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r19so21183422ljg.3;
 Tue, 10 Dec 2019 11:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ulX543+9toeatXV1iMTIBBXIHYl2aF/n/HSQV4cdnE=;
 b=krMB+98HHl2ikMxCeSc8JFW1+AKXXIBqxKEUFRZdXCP1YR54Hhair5K6iNLFON53eI
 o5itHuP/xpP/CN2fL1fViuQ7rwaBkWy9TkqHT9/VbB/tqAE/MI6rLGgqzDqhRF4kKSD6
 5HszHqiAvyFUzJBYAGWF5IlNAtJaJ5DZDyQ9TBAy6MdUDUW9GQ6egnY4hozVT3cnyuii
 vWe9LQ5tBDqGquzggHj0MgMvZVY57t0Gx+myVxUW4VwgH0fQYr2g90QtCoT/ciZmoQpO
 ZirSJ4quZaQhbOCIAZZ+FoIBynxoLnBBtCLQKByczBguymQcECvGryJw8oqc1JRFPFT8
 WbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ulX543+9toeatXV1iMTIBBXIHYl2aF/n/HSQV4cdnE=;
 b=PyAE3LB8eCn+DbBFnlvu9jQtdL/1J4smhg1qBWGky3sVPYR9VSC2cL8km2rAjNZRy4
 2RAAYZjChA4NyZeRU4SmGXgW3N6YdSXGOEnpD9mc0smPcTbIbjMRETH8aoatb5Jm1gH0
 1wFk7FBunroV/WpUF6gQLMKu+2x78vcbfxWleM4qEz5B9hn7/DGLQle4xKaFJ1TB4vlS
 w+EqhKlTIz224v21ie7yubSnl8ASwlkuNi3GCaCpfED3MrMxOlJiWrm7yPFV8FtnpY4s
 fVb9z8osDbswVMLzwUCSJEwLjP6h8jnu3pcOuD/3QbTwyclZ/fXAOYYT3E2F9KdJPkoZ
 P3Ow==
X-Gm-Message-State: APjAAAWHeytXjMAl4133pmXEZDBTTBsgkoZx8QYy8u+VWBnsqNWWexqG
 irk9a2o8tZwSvoFTCTidfCc9LGsTeMWXw5hThyc=
X-Google-Smtp-Source: APXvYqwbAv2cElTyCaMQre9NPYKpWiyhQ0WKEV0u6pXHxn6mzg24fDBxfrswSCfVWucaAJwWg2+mx4KbDWo/BeBJe2k=
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr21292120lji.59.1576004892742; 
 Tue, 10 Dec 2019 11:08:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575390740.git.jani.nikula@intel.com>
 <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
 <87pngx4muv.fsf@intel.com>
In-Reply-To: <87pngx4muv.fsf@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Dec 2019 20:08:01 +0100
Message-ID: <CANiq72nPccKZghPM-FrNRnQ8AkN_r40cUmM3ruhyGtiTs_DdyQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
To: Jani Nikula <jani.nikula@intel.com>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 3:04 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> > Now that the fbops member of struct fb_info is const, we can start
> > making the ops const as well.
> >
> > Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
> > Cc: Robin van der Gracht <robin@protonic.nl>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> > Acked-by: Robin van der Gracht <robin@protonic.nl>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Miguel, Robin, just to err on the safe side, were you both okay with me
> merging this through drm-misc? Not very likely to conflict badly.

I think that is fine, go ahead! :)

Cheers,
Miguel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
