Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4921ABB1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 01:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EA46EB4C;
	Thu,  9 Jul 2020 23:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CEE6EB4C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 23:35:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a12so4135171ion.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 16:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xYijZ/BX2Btv1jBhkRuxab/fnOb1MXoDYM/e4XDrW5k=;
 b=KkjHx0U5rIp4KbtgIANvXWuyMDRQ3Y2+LpgFaysEjFNg5U8QaxyHCrOuv8/E1HODU1
 dmOC2JDDzZX9S2xzuiSnuBcjmM/wh0Kdn2B/GskPjqfXTQIAVxDN/p1XuAcgNxv6vE7n
 bvtQKLwyChXLNjil2sbkZeH08TnBTWmD5spLdyiW1bTCAA651/Lj5PIBKJNDvK2u3zem
 XAHkcN01LIZhVHArrTi6xF2iUuvEBXiN35Lzbk/lcNijwtbTV22TSTtLF3ZtRZKixpuA
 6oVTtvVQ5tEI9PYa63IJn1in+9vc4K+wuTCf58FOKULrAM80RFzvW0oWRzr8Zuvp7JEA
 otSg==
X-Gm-Message-State: AOAM532R+xctc0wQ2Vl1bfeb2tnu8ktXIrVOyDAOYSTAuUaIOtkq0Wvq
 KFdfH3wyd06gYinebjYL2j1RhnC/ZfjS
X-Google-Smtp-Source: ABdhPJw6T9j2SNkUn0RZGgUhV6z0vwDieSHApxdWSPZAqjBVATyRXP+wX6l6mdxeKa+1GCidB2K6cw==
X-Received: by 2002:a6b:b4d1:: with SMTP id
 d200mr44270196iof.128.1594337704467; 
 Thu, 09 Jul 2020 16:35:04 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id j28sm2761685ili.76.2020.07.09.16.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 16:35:03 -0700 (PDT)
Received: (nullmailer pid 1109950 invoked by uid 1000);
 Thu, 09 Jul 2020 23:35:02 -0000
Date: Thu, 9 Jul 2020 17:35:02 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to
 DT Schema
Message-ID: <20200709233502.GA1103707@bogus>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704103408.GA735964@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200704103408.GA735964@ravnborg.org>
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
Cc: devicetree@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Zhong <zyw@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 04, 2020 at 12:34:08PM +0200, Sam Ravnborg wrote:
> On Sat, Jul 04, 2020 at 12:28:03PM +0200, Sam Ravnborg wrote:
> > This patch-set convert 3 of the remaining panel bindings to yaml.
> > 
> > This is a follow-up on v2 that converted a lot of panel bindings:
> > https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
> > All was applied except for the reaming three patches included here.
> > 
> > One binding is a DSI binding so just added to panel-simple-dsi.
> > The other two bindings addressed review feedback from Rob.
> > 
> > Sebastian Reichel has a pending patch to address the remaining
> > panel binding in display/panel/
> > 
> > All bindings pass dt-binding-check.
> > Based on top of drm-misc-next.
> > 
> > 	Sam
> > 
> > 
> > Sam Ravnborg (3):
> >       dt-bindings: display: convert innolux,p079zca to DT Schema
> >       dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
> >       dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
> 
> git format-patch adds a space after the ',' - in the subject.
> This is often a good idea, but not for binding files.
> Will fix when I apply - if I do not forget that is..

Sure about that? I'm pretty sure it's dri-devel doing it. Look at 
lore.kernel.org copies for different lists. I've been fighting with that 
first in patchwork (which had this bug) and then in b4 (which is where 
it got nailed down to dri-devel).

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
