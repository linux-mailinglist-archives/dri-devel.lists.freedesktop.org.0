Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998B397521
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 16:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180396E0DE;
	Tue,  1 Jun 2021 14:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935A6E0DE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 14:10:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso1676341wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=7iGbvcFYMb3tLwZvkHa1Xrgwf6I7yyg/yxMiEiySaC0=;
 b=ejnEUTO1DiWDFagv+Dl6hADRqW7H1logS/cF6NBmsns/CZtF8MMuELJR17uBvI2xCD
 ngbYDadN3KqmTc1Ga64JG9ipPURDyswvZSzXT8SgS+f7+2fznZZ5iWjaYZC/aQASeaFy
 V8hUWaNgJgUeTGGYdT4EErDL9mDPIsVnl+zdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=7iGbvcFYMb3tLwZvkHa1Xrgwf6I7yyg/yxMiEiySaC0=;
 b=Lr3iv9Y3iqRT7lmMuQM2aLU6v/N1BEeSv9t+vFioQomHffmFCsl9dKM29mYnU4cJpw
 dpDEBrPks31itBJz3tgE+j50JnDfEx9LIQhchhRbjCcwWrfF0L5mqGj0YUKWbSK+zMQN
 ADFYffx8ZheOSfrotHQGpZOYgRjdlIV0NI7VLGU1WRS78HUEKx9LJHnWf7D8x4yyYKBW
 lDedignHoaLXHFepOKCcJTB72eWGW3F13BICVOE1tn+GSerEp7yTbckBvEQFjzHBzb7q
 DT6gc/j4DBaR40YOEADqCz9F9bWWpACvU/mjlBFku6OKSJ6EFX/VuQLKv93Fr6rP0kQv
 2jcw==
X-Gm-Message-State: AOAM531MtpdntFvE2huPLAh401DQnFuMRwqu/Ihgr+6odeYJV7mIeTsU
 W8ct7g6qijYx2lt/JlWo/C+08A==
X-Google-Smtp-Source: ABdhPJxmv2iRwq3JXX8sQlPH3fi0l96M70KDiLaBl1d14VByekZy30x12OgkHti6Mr59TGXbgwmE1g==
X-Received: by 2002:a05:600c:2109:: with SMTP id u9mr104645wml.7.1622556635096; 
 Tue, 01 Jun 2021 07:10:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f1sm4206218wrr.63.2021.06.01.07.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:10:34 -0700 (PDT)
Date: Tue, 1 Jun 2021 16:10:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] fb_defio: Remove custom address_space_operations
Message-ID: <YLY/2O16fAjriZGQ@phenom.ffwll.local>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-fbdev@vger.kernel.org,
 linux-mm@kvack.org, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 William Kucharski <william.kucharski@oracle.com>,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210310185530.1053320-1-willy@infradead.org>
 <YLPjwUUmHDRjyPpR@Ryzen-9-3900X.localdomain>
 <YLQALv2YENIDh77N@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLQALv2YENIDh77N@casper.infradead.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-fbdev@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 30, 2021 at 10:14:22PM +0100, Matthew Wilcox wrote:
> On Sun, May 30, 2021 at 12:13:05PM -0700, Nathan Chancellor wrote:
> > Hi Matthew,
> > 
> > On Wed, Mar 10, 2021 at 06:55:30PM +0000, Matthew Wilcox (Oracle) wrote:
> > > There's no need to give the page an address_space.  Leaving the
> > > page->mapping as NULL will cause the VM to handle set_page_dirty()
> > > the same way that it's handled now, and that was the only reason to
> > > set the address_space in the first place.
> > > 
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > 
> > This patch in mainline as commit ccf953d8f3d6 ("fb_defio: Remove custom
> > address_space_operations") causes my Hyper-V based VM to no longer make
> > it to a graphical environment.
> 
> Hi Nathan,
> 
> Thanks for the report.  I sent Daniel a revert patch with a full
> explanation last week, which I assume he'll queue up for a pull soon.
> You can just git revert ccf953d8f3d6 for yourself until that shows up.
> Sorry for the inconvenience.

Uh that patch didn't get cc'ed to any list so I've ignored it. I've found
it now, but lack of lore link is awkward. Can you pls resubmit with
dri-devel on cc? fbdev list is dead, I don't look there.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
