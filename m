Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E501B25CA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6006E927;
	Tue, 21 Apr 2020 12:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EE66E927
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:19:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r26so3448256wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=RdYGArEdf7fNq4YWVNuWwxljCEjnbjIB59dLDp+tDME=;
 b=YJOLdK2paZFgMhCZVABVVasiwBvfkEOoc1hrEQAvKPs5+Mg2P6LsSmj6BO40ycvFZE
 1lzUa5qItqZ2YXj6gK1ROdgDQiJBpKBYO8dbxP0ge1g5DaOfeZSR2z5FbAq/KILTaf8C
 lOSRElIey3ImoIIKhGU/AvqunSIyPQvwlw6vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=RdYGArEdf7fNq4YWVNuWwxljCEjnbjIB59dLDp+tDME=;
 b=QmDFyvr//lISiSr9hOOlvlaC9wLU8EBAP8MOczGvW196SmdFpxViEmYB4MKaNAk/3R
 X6Ow+SHnbHhYovebdbo0rWkA+xfB9zcGTpKpIBPACOk0yiQhrrATbO7T1T3VW8xs9JQW
 3UMWyXF3zr4OPH4Nq7aL8QwdKVBhxLqrtwOYud4dFaWKeiCamq7BD8TNSlIeDni1VzP7
 rGrDZjI/28ipizRKYe5ceBneowUjgz+j+uPX+yDkUwDyTC8FbK+26VGiIBWFSYcZuEcE
 WTCycYw9FC8rPbQwyJXtvM5HsjvjivcZrkg7Q56rwGqV6Y02pFpouygch6jQaa18zs+R
 +mtg==
X-Gm-Message-State: AGi0PuYrZyvxNXuLaxe9KuV+Vvy95RP7HsGHQNRAkJDaabeHZa8ebjps
 hiJl2hlm1GYWSgHufdWmXVtrZLtVAAM=
X-Google-Smtp-Source: APiQypJo1ryhFC8BXxo7eBvrM5Xp8MvpJyg2ajxfVjJl5qbaspVkvh4FIH8f6zeBALstF54m2xICYA==
X-Received: by 2002:a1c:3c87:: with SMTP id j129mr4460861wma.157.1587471539888; 
 Tue, 21 Apr 2020 05:18:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t67sm3584098wmg.40.2020.04.21.05.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:18:59 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:18:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge
 driver to make connector optional!
Message-ID: <20200421121857.GV3456981@phenom.ffwll.local>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Maxime Ripard <maxime@cerno.tech>,
 linux-omap <linux-omap@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
References: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 linux-omap <linux-omap@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 02:18:11PM +0200, H. Nikolaus Schaller wrote:
> Hi Maxime,
> I have started to test v5.7-rc1 and can't fully boot the GTA04
> device any more.
> 
> What I see in the log is:
> 
> [   28.567840] [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge driver to make connector optional!

General PSA (and for Laurent et al, i.e. entire team of people working on all
the varios bridge conversions):

Please don't make something an error before all in-tree users are
converted. Even an informational warning is often too much, even only very
few drivers are left using an old pattern.
-Daniel

> [   28.567871] omapdrm omapdrm.0: unable to attach bridge /ocp@68000000/dss@48050000/encoder@48050c00
> [   28.786529] omapdrm omapdrm.0: omap_modeset_init failed: ret=-22
> [   28.841552] omapdrm: probe of omapdrm.0 failed with error -22
> 
> This device uses the ti,opa362 chip which did have a dedicated
> omapdss driver before (which is removed now) and which seems to
> be supported by the simple_bridge now.
> 
> The opa362 is sitting in the video out path from
> 
> 	omapdrm -> venc -> opa362 -> video-out-connector.
> 
> What does this error mean? How can it be fixed?
> 
> BR and thanks,
> Nikolaus
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
