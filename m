Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5974435DF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 19:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497567371E;
	Tue,  2 Nov 2021 18:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C457371D;
 Tue,  2 Nov 2021 18:41:34 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 r10-20020a056830448a00b0055ac7767f5eso190359otv.3; 
 Tue, 02 Nov 2021 11:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UXZVlbIcIr6QeS8szUfuWZxESqbyLh03FTBfRvGINUo=;
 b=NS2N8Bit28Oj6P/ShfB3eh0SAcXy2ug1SzqIGzDFmiLCYg/VSJgWPGSYr1dfS4C+SF
 MAp0V/IlneDi35qoi8599nW/pLrxHVAHsJn4nclDaDHK8Y2baKzyoc6CPPSpIGjbntxy
 cvmf3xR162U//nNNNGwreppOnx4FOh2ba5J162b44AYTnlLELH4ks3TCl9BVP1v4KN+b
 6jYXu8Y/xfTIqWUxDzhJewr4rwvy4HdV/gBqVgscZF9oC85eJHeNYr5UBEVtLtyxYLzB
 D+Awj+s+y0KgPgbx5OylxLn4TLqr1IE7Pp47H4pd6+BmX7yOS/O2s66ych459qTgEoDb
 GC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXZVlbIcIr6QeS8szUfuWZxESqbyLh03FTBfRvGINUo=;
 b=Ao4PSluOleO6IN3pJwQ8T/lHYxaZBWEYQtykvs9LNE8kvm7c5gTGi9+KBW3il/lVBi
 VwQeyF8NPx4rF49jdVEYxYIJIhrOmxdT1uJ6JhGxuBlXy7R7SWtzAGSU27+6SVW9g9kF
 iL4E8DAL4N7dsRLeG/GDxwMkWyP8JtQKrqHooUVvWTSDAhwqJ3IXmENsxQ1GM60zINzL
 rAO0l+AvhIgimVBK6k2Ja7RpwpnyMPYIejnzjtBZjnlknb+byGlkXQsctyaUTvAaC/EL
 auWX3EINGppEwkWfoXYp0AT5y3LMWH0JFkNpgVTiR1nkRVyQWIuEiNWBqq886Fu93xY4
 YoNw==
X-Gm-Message-State: AOAM530h10csxRPsdKsvL2UYokRXuhUSmcOft9qtSZE5y8ZaHDuthU+d
 68EnWnj9/WmGJ/GzPzODoWCxLi60TsiqigI17Cg=
X-Google-Smtp-Source: ABdhPJziAcADPbVIsQAAtyWVG5CS8dajyXuOXQsN73GniPhhbrAC8irZdGm4pSJuIAs5rwLIRDefz+nCYb9tbvL7mhY=
X-Received: by 2002:a05:6830:2aa5:: with SMTP id
 s37mr17368028otu.299.1635878493358; 
 Tue, 02 Nov 2021 11:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211102070125.4445-1-ye.guojin@zte.com.cn>
 <lvX4AA55dPGJGyFf1ncXCnqomRKljUmW8TXAJV88VrSpYt2gSTrcK3JnCbGl5zsRJ4Gqs7-MAXIuCGr01axsnxkzDO5STy3cMMAo5SL7wOE=@emersion.fr>
In-Reply-To: <lvX4AA55dPGJGyFf1ncXCnqomRKljUmW8TXAJV88VrSpYt2gSTrcK3JnCbGl5zsRJ4Gqs7-MAXIuCGr01axsnxkzDO5STy3cMMAo5SL7wOE=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Nov 2021 14:41:22 -0400
Message-ID: <CADnq5_MnWvefEbYYEJ2NrS6-uFG9pGxrsmTp5c-mVf5t8KgkaA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unnecessary conditional operators
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Roman Li <Roman.Li@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, CGEL <cgel.zte@gmail.com>,
 Zeal Robot <zealci@zte.com.cn>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 syed.hassan@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, George Shen <george.shen@amd.com>,
 Anson Jacob <Anson.Jacob@amd.com>, Nikola Cornij <nikola.cornij@amd.com>,
 ye.guojin@zte.com.cn, Jude Shih <shenshih@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Nov 2, 2021 at 4:58 AM Simon Ser <contact@emersion.fr> wrote:
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
