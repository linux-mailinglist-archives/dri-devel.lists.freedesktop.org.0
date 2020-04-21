Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12701B2642
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9F6E0BE;
	Tue, 21 Apr 2020 12:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336C26E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:38:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k13so15093703wrw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dEtMSnugQ0Yz8dEGP0UAZ0gmicmpiHlS1EX56QRmSxU=;
 b=CBU1r5Bh/z0btpExs9JQcV1xmQKPX8pt2qs5S2PKDBCXn+8oq/3Zit1BDOlY7ZtHVB
 ZCt35gvpxp/b8ZMio6jsNpYxm9V49VDog66VLWJzup6N0BP23SIeZGpN1PNnbePNh3t/
 9wA20fyU9sIL6UZfl+s7XPNkO7+Nuxq4JbL00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dEtMSnugQ0Yz8dEGP0UAZ0gmicmpiHlS1EX56QRmSxU=;
 b=m8c5S/b3aj90VfT/y2XIje+TDju/UvbLdrXbrLAGxmzD1JGfTOgjHqQZv2Ujgux27P
 guPLSYvYfPPOcfkLHgsANDa7RCX7XXDLFYfxicwd8qErEipHCmYGDszFurOHPeS4v6q0
 s554V5FzwoZ329sHOf96x+vpFFfxI9jAfGFqC4nOcLe0GdpyP6EALdWgx+Yy+C7pCQlb
 E3kYRkRGf2mWdilJJfbYI55KEEWf19dw7MVxIj/N3/cRKcXFy4aLA8OtCTCLnCvVhatG
 iMcdyNwFaf8PM1Fo++YiKbBLLQ8hJncvZ1sJr5XzoKdcEgS5lEJY9udTWLt3UiRXv+Cb
 c6mg==
X-Gm-Message-State: AGi0PuanVCI9cv1XzoefZzmJyDp4NmtBtNwuTwITXk9TnhDGzIkiiCYA
 ybgdltbiw1D901IYo9PtFHCyfRGQpQw=
X-Google-Smtp-Source: APiQypIzvmkA09MwByYqroH0B7xqF5CSvHdVyYFGv6atnXmAXLQdkPPxOvWpKImiQh189bdrvWfWOA==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr3232873wrx.203.1587472719979; 
 Tue, 21 Apr 2020 05:38:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k3sm4000288wru.90.2020.04.21.05.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:38:39 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:38:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
Message-ID: <20200421123837.GZ3456981@phenom.ffwll.local>
References: <20200420074115.23931-1-galpress@amazon.com>
 <20200420170059.5a42693e@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420170059.5a42693e@lwn.net>
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
Cc: linux-media@vger.kernel.org, Gal Pressman <galpress@amazon.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> On Mon, 20 Apr 2020 10:41:15 +0300
> Gal Pressman <galpress@amazon.com> wrote:
> 
> > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > 
> > Signed-off-by: Gal Pressman <galpress@amazon.com>
> 
> Applied, thanks.

Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
drm. And maybe I actually get around to doing the doc polish for all
things dma-buf that I've been promised to do since months :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
