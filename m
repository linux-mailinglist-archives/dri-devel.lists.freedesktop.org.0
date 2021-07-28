Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA293D9980
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 01:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BEF6E095;
	Wed, 28 Jul 2021 23:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9F46E96E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 23:33:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so7370114pjn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hFIkjt/HAKYP2gDSt85Hu9GQQgBuaRL3GoR8pjbA0bw=;
 b=eZq87nPKlWl1J2DEEMJZ0uaEj2HBpzx1uFCKn+eDG74O39BY2fqgYPseftQWhiHZ3p
 3PJNkhirHMnzPm0VwpSUdr5bc9yR+trhFp/MOdtZnE7T7uRicxtGEKbYH49hrFM5DKkn
 1n46Y3AQgPVx/z+eMIRIv1CuZbfnRiL9Xc4bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hFIkjt/HAKYP2gDSt85Hu9GQQgBuaRL3GoR8pjbA0bw=;
 b=TmPMVkqAIR5H07htTEuL72+rOyireNVWn+1EyPNLU2TF4cAeppRpvHnOQiP1pJl5Po
 JfWk3cBanrehKTXRXqYrXb0gMKSitMeWrR97aYnwCkbyrL627FqBVgAydDgJ/RSiwehV
 ZxkmsszATlcHlyMFycZPQBM8cttKv8VuKF5RwkcjRgFDIQ1iUSwHiANeqPqyRdcivuLk
 XOtABSb9vLCdPc6Mp/q+p9eC7PLQ2f3eag7b9U2nSwBDEEC7jy66km8RftchN7juGxZf
 zsnAJp7rleV/OSCTlEpeqiKDPSQCDPUz68+sVcNSrtTMuzbuqCury/0lgd2zygPUkvP+
 iK1Q==
X-Gm-Message-State: AOAM532Vsd0UFHBBgB7dCQJRjiXhQIqsu1oirsPFvSlmd9IKGfCOYCJD
 ZD0EYyAJwH6GRyPEuhEGCk924A==
X-Google-Smtp-Source: ABdhPJyDOQNxc6ttxQhAqGxoxWvmp3MMGc7Zv3gC3yqd9RQT0SfNwJrM7aAomvW+xqq4hMTgYf4FHA==
X-Received: by 2002:a17:90a:fc95:: with SMTP id
 ci21mr12127797pjb.176.1627515200829; 
 Wed, 28 Jul 2021 16:33:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m34sm1068670pgb.85.2021.07.28.16.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 16:33:20 -0700 (PDT)
Date: Wed, 28 Jul 2021 16:33:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 02/64] mac80211: Use flex-array for radiotap header bitmap
Message-ID: <202107281630.B0519DA@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-3-keescook@chromium.org>
 <20210728073556.GP1931@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728073556.GP1931@kadam>
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 10:35:56AM +0300, Dan Carpenter wrote:
> On Tue, Jul 27, 2021 at 01:57:53PM -0700, Kees Cook wrote:
> > [...]
> > -	/**
> > -	 * @it_present: (first) present word
> > -	 */
> > -	__le32 it_present;
> > +	union {
> > +		/**
> > +		 * @it_present: (first) present word
> > +		 */
> > +		__le32 it_present;
> > +
> > +		struct {
> > +			/* The compiler makes it difficult to overlap
> > +			 * a flex-array with an existing singleton,
> > +			 * so we're forced to add an empty named
> > +			 * variable here.
> > +			 */
> > +			struct { } __unused;
> > +
> > +			/**
> > +			 * @bitmap: all presence bitmaps
> > +			 */
> > +			__le32 bitmap[];
> > +		};
> > +	};
> >  } __packed;
> 
> This patch is so confusing...
> 
> Btw, after the end of the __le32 data there is a bunch of other le64,
> u8 and le16 data so the struct is not accurate or complete.
> 
> It might be better to re-write this as something like this:
> 
> diff --git a/include/net/ieee80211_radiotap.h b/include/net/ieee80211_radiotap.h
> index c0854933e24f..0cb5719e9668 100644
> --- a/include/net/ieee80211_radiotap.h
> +++ b/include/net/ieee80211_radiotap.h
> @@ -42,7 +42,10 @@ struct ieee80211_radiotap_header {
>  	/**
>  	 * @it_present: (first) present word
>  	 */
> -	__le32 it_present;
> +	struct {
> +		__le32 it_present;
> +		char buff[];
> +	} data;
>  } __packed;

Ah-ha, got it:

diff --git a/include/net/ieee80211_radiotap.h b/include/net/ieee80211_radiotap.h
index c0854933e24f..6b7274edb3c6 100644
--- a/include/net/ieee80211_radiotap.h
+++ b/include/net/ieee80211_radiotap.h
@@ -43,6 +43,10 @@ struct ieee80211_radiotap_header {
 	 * @it_present: (first) present word
 	 */
 	__le32 it_present;
+	/**
+	 * @it_optional: all remaining presence bitmaps
+	 */
+	__le32 it_optional[];
 } __packed;
 
 /* version is always 0 */
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 2563473b5cf1..b6a960d37278 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -359,7 +359,13 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
 
 	put_unaligned_le32(it_present_val, it_present);
 
-	pos = (void *)(it_present + 1);
+	/*
+	 * This references through an offset into it_optional[] rather
+	 * than via it_present otherwise later uses of pos will cause
+	 * the compiler to think we have walked past the end of the
+	 * struct member.
+	 */
+	pos = (void *)&rthdr->it_optional[it_present - rthdr->it_optional];
 
 	/* the order of the following fields is important */
 
diff --git a/net/wireless/radiotap.c b/net/wireless/radiotap.c
index 36f1b59a78bf..081f0a3bdfe1 100644
--- a/net/wireless/radiotap.c
+++ b/net/wireless/radiotap.c
@@ -115,10 +115,9 @@ int ieee80211_radiotap_iterator_init(
 	iterator->_max_length = get_unaligned_le16(&radiotap_header->it_len);
 	iterator->_arg_index = 0;
 	iterator->_bitmap_shifter = get_unaligned_le32(&radiotap_header->it_present);
-	iterator->_arg = (uint8_t *)radiotap_header + sizeof(*radiotap_header);
+	iterator->_arg = (uint8_t *)radiotap_header->it_optional;
 	iterator->_reset_on_ext = 0;
-	iterator->_next_bitmap = &radiotap_header->it_present;
-	iterator->_next_bitmap++;
+	iterator->_next_bitmap = radiotap_header->it_optional;
 	iterator->_vns = vns;
 	iterator->current_namespace = &radiotap_ns;
 	iterator->is_radiotap_ns = 1;

-- 
Kees Cook
