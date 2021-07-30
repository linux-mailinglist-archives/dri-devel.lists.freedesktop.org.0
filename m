Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8E3DB0B8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 03:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0F86E220;
	Fri, 30 Jul 2021 01:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32B6E220
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 01:41:56 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id i10so9168112pla.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z2Wamgmh73Y+Ncu8fAmHIQj7M7ZAYEMLRlTXvopvkv0=;
 b=ijAtp7BbL9OeTMvwqZJ4C6mfxUVgFhIHqoi2Bpn7KTv+xzkqR66BceM/5iMj6cpOfn
 epnzVaw1UhfDENDcgJ4dZ7tPhk6gmw29M697vajTqTUL4EanTqtO6s3pVRsJvTdO4U4i
 durS8L9aynseywI9b6j0HfM/aNYNqA/7lc1W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z2Wamgmh73Y+Ncu8fAmHIQj7M7ZAYEMLRlTXvopvkv0=;
 b=JGzXJ3hHdHw/q0WGO6ELvxT520LCKau35Rm7Liw/iRYUEF9AcAaOyEskytKpU09QKw
 HtuX6z84i6QtqQOjVVQnHmPxEb4oNCJupnXNnsu1Rwk7Z+BIonuWXsKBs75UiqJJR/EY
 ma28JrS0zfbSCFNzhdJvU3mQHw6gYaYc+pkk0qhziaZ4JABwTQeMnxtRoSm8qvXQswPx
 gwB2YkHYdsJlH4YX3jIe75sukKikhn16HMlt77c9HAbgULvZ+Ksda7p6mW9QRYxRimcy
 YIgLkFa4ZvO/SzilzANe7/CGh/GmVhGUiTUinGCB+ukT/eSFRc5U/rQqukf9BPxW136K
 MYkw==
X-Gm-Message-State: AOAM532tyqiNWGO95WJAjYKFTURG7Ii3bD7KPBqe/geBcYGoCwRnEnIB
 nLX+Bqu14N/OTOZGLbWQog7VgA==
X-Google-Smtp-Source: ABdhPJw0813YKZxQ8DT1LgMIuVe3PAz9HErWNrX605I57TwGhBJvYb9BvbSpZ8Miqi8+VnzV2jJFmA==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id
 c8-20020a056a000ac8b0290320a6bb880dmr239521pfl.41.1627609316347; 
 Thu, 29 Jul 2021 18:41:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s25sm97149pgv.87.2021.07.29.18.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 18:41:55 -0700 (PDT)
Date: Thu, 29 Jul 2021 18:41:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 62/64] netlink: Avoid false-positive memcpy() warning
Message-ID: <202107291839.6AEFA1E8@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-63-keescook@chromium.org>
 <YQDv+oG7ok0T1L+r@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQDv+oG7ok0T1L+r@kroah.com>
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
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 07:49:46AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 27, 2021 at 01:58:53PM -0700, Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields.
> > 
> > Add a flexible array member to mark the end of struct nlmsghdr, and
> > split the memcpy() to avoid false positive memcpy() warning:
> > 
> > memcpy: detected field-spanning write (size 32) of single field (size 16)
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/uapi/linux/netlink.h | 1 +
> >  net/netlink/af_netlink.c     | 4 +++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
> > index 4c0cde075c27..ddeaa748df5e 100644
> > --- a/include/uapi/linux/netlink.h
> > +++ b/include/uapi/linux/netlink.h
> > @@ -47,6 +47,7 @@ struct nlmsghdr {
> >  	__u16		nlmsg_flags;	/* Additional flags */
> >  	__u32		nlmsg_seq;	/* Sequence number */
> >  	__u32		nlmsg_pid;	/* Sending process port ID */
> > +	__u8		contents[];
> 
> Is this ok to change a public, userspace visable, structure?
> 
> Nothing breaks?

It really shouldn't break anything. Adding a flex array doesn't change
the size. And with Rasmus's suggestion (naming it "nlmsg_content") it
should be safe against weird global macro collisions, etc.

-- 
Kees Cook
