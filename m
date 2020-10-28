Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2029CE2F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 06:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8A6E461;
	Wed, 28 Oct 2020 05:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A7C6E461
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 05:34:31 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id t22so1928005plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o3LdnC6Ytf9c4DWqirvo5UI8m31/cCv50Msd5N5b88E=;
 b=Kf71SoURoZbPK+PTfpdvnSb2QDHbMtDUocxpU73Xm5V5jGamSBODV0w6lYIVnGP0nV
 DZ9Gdjd5BFLVfw5kKlCaR03dC5cXa8EhN79hBIChP81o6QIvCt3WeTJ6Z36GHc0sK8as
 5VJGnPsXbHwajZqU3QZfdcaACxkdjVqQJrKLGa9SfKw5RFFspZAmZoqSHmkX/kLiBgKz
 EABafBm1gpst3U19AYutktoYC/VVn1aIk+uU147O2FzwNnThNMnyL8Mm5/HfWdxMpdFq
 9CX3CfnmQZJbrmns0KcGq5/u0bTWswbBbqF5CUIduXQm+0DpA1rB7M758jtPjYrpaPdl
 53JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o3LdnC6Ytf9c4DWqirvo5UI8m31/cCv50Msd5N5b88E=;
 b=I9UjCYaPkByFxavRi4Gf3aJNPDqE2gDzL/+Z0w1INYwia4gPfytQ9e8USTh+jm6NnG
 vdt7NiFYNGGXBtmfMB7fKxbEhenccGNsQ+gdazwAs8D3VhgmPLBWR90rwKMbdf5k+v6+
 d4cA9NmszExUymyYO5A98j0JZGUGpGF7B6l2+lHUXqfY5Hx7uGAbfuf9GbEBTxDZUeZv
 jmzyAuL68noGfpmI2EMm1hRh05vCau2K1jtoWE/ULa4dINCtGIeFTbSzLtcSaMoDATI5
 Nz1muSDldTWkF4dPEDA7EkE/GSEWR6NTvSh1pMXUEp2gx1KjFbTglOYAaM0LJxpnGu5q
 G+Cg==
X-Gm-Message-State: AOAM532Ob4va8XxEIJKk93nAbOmMqlgc3SPuAe10mginPae7Va8LXWuk
 hMjDMzJ2QX/pslOCEePm/Q==
X-Google-Smtp-Source: ABdhPJyMeXkxKEBeQiHyAtviwtfq3kqG2WHDNhJ1R5euCg8w4YtLIcQ7PkGZIvhWiAeQxnrwQKGzPg==
X-Received: by 2002:a17:90b:4a4f:: with SMTP id
 lb15mr1916524pjb.103.1603863270836; 
 Tue, 27 Oct 2020 22:34:30 -0700 (PDT)
Received: from PWN (n11212042025.netvigator.com. [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id j20sm3771189pgl.40.2020.10.27.22.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 22:34:30 -0700 (PDT)
Date: Wed, 28 Oct 2020 01:34:23 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Following up
Message-ID: <20201028053423.GA1205528@PWN>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <20201027165021.GA1178130@PWN>
 <CAKMK7uH9L9WHBndEnUhAMMh0KsKUcz2zfKdi250gVqJGEG6usQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH9L9WHBndEnUhAMMh0KsKUcz2zfKdi250gVqJGEG6usQ@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 07:36:54PM +0100, Daniel Vetter wrote:
> On Tue, Oct 27, 2020 at 5:50 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >     ...you mentioned code search, where & what should we look at, in order
> >     to confirm it's safe to remove them?
> 
> Way back there was google's code search, which was awesome. Now I just
> put the structure name/ioctl #define/number into
> google/bing/duckduckgo and see if anything turns up. Plus check how
> it's used in fb tools (although I just recently learned that fb-test
> pretty much disappeared from the internet, very hard to find the
> original).
> 
> If you're unsure, we can merge a patch, then wait about 1 year for any
> users to show up with problems. If that's not the case, assume they're
> all gone, or it was never used and just implemented because it was
> copied from somewhere else, or "just in case". There's lots of dead
> uapi around.

I see, it will be my next thing to do. Hopefully this will remove a lot
of console_font occurrences.

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
