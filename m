Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A327E304
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D606E578;
	Wed, 30 Sep 2020 07:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AFA89C83
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:45:01 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z19so3962607pfn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GjNJiX6u6EA7eCAwaVO4jYqA+BXpH7vsjCBaaqrjlA8=;
 b=rIxjL/9RpTiJTUUFnwxmMMYOivzFHiq515t+RsiYdY6dT+h2GOWFuXkti572v4SAGR
 UmH9cCZG3/qonGEPbAWTzfgRtTLIdzEB+aeL5i3uaGmSrq+IqvmarqckwSBcg3+R2Z6u
 anaZadOfqIswrlR2BCehr3EatM8iB2OMkHB/EtXEEMZhQMQSZmcIzo/1F9pDOf4j1v2L
 qCLxLcw6FNuXoTl7207NrZUIueG93Qc0/UjN8WCgSyXrQWnG8aUH6uNOUM869MI9+imP
 6qgbzeuLw6r6m1+Fv6Oaowj44IG9uFRMkHkPil0Z9KraN5Jfd1zlXmdL9R15EP8Cy3U/
 4rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GjNJiX6u6EA7eCAwaVO4jYqA+BXpH7vsjCBaaqrjlA8=;
 b=gnDmltxqukn2n8vT2WYXKX0wPao78sr54FfzpIEXvcvEhTyf4NzQLs3An7h3CHuud7
 7xzfyKgQ7w4giYEs7PZTcil7mfB/udu6lobUH6McW9M1KZjbjoqnmMfSKQvSlx+y3HFZ
 7cp5X3ztvpvVeE87fBSJkNd/UGlZupcUEvrs1vxtX4erX47EAWTwxnFmMnKX97iFsibM
 yjZndYpbVd1z/ivqPrxTMf5he4ND6zMW2Ynxf/HrmIsLJw8mI9i4oGDJf+4ooNMuuX2Q
 tJ+KWylODN/SGtSUZx/1NaZoYp07Aa6qoTLm/jB1dsjpFnKH3FUB3SksOJUa3uQH0kYF
 JOBg==
X-Gm-Message-State: AOAM533VPm6OetvHXEukEb0sQzlIxOn8A6PuQ9L42SXD5L7LLx5KxDTo
 UrrvkZ/h/BgxnVKIjwkgRA==
X-Google-Smtp-Source: ABdhPJwdIxwVS1bO6zBzLCzQiN9q63SxQYJU2R5dXf10DiEk1uWsHbyMV9xL37r9CgP/NLOyo+JvYw==
X-Received: by 2002:a63:50e:: with SMTP id 14mr2553275pgf.443.1601372700871;
 Tue, 29 Sep 2020 02:45:00 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id l79sm4674865pfd.210.2020.09.29.02.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:45:00 -0700 (PDT)
Date: Tue, 29 Sep 2020 05:44:52 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200929094452.GA1137889@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200925153509.GA895804@PWN>
 <20200929090945.GH438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929090945.GH438822@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 11:09:45AM +0200, Daniel Vetter wrote:
> If you want to follow along a bit I think would be good to subscribe to
> the dri-devel mailing list. At least for all the fbcon/fbdev/gpu stuff.
> 
> I don't think there's a dedicated list for vt/console stuff, aside from
> Greg's inbox :-)

Ah, I've been checking lore.kernel.org/dri-devel/ once a while. Sure!
I'll subscribe right now :)

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
