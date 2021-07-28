Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E83D9775
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EB86E847;
	Wed, 28 Jul 2021 21:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211126E847
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 21:20:59 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so12128758pjm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aCyc2NHOkXGYgjWDmf3vrpmk18fLyVZYd3TxhaXnnVE=;
 b=c6JhMXofkbZ/uaPvfVmC6SEcmKM0PLQ2hKLp4lpFf6E2UFDYQlwI/ajPz92HBukVL7
 3/1t8J3CHxk2Aet0zavrHIrdOV/PTcRtHuZqcxaB93hxu9KzN4rGasiScmM1vQ+xqHu9
 bo2q7n30yNJeOR5zYMX4yKUhbVxnmxalSrXXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aCyc2NHOkXGYgjWDmf3vrpmk18fLyVZYd3TxhaXnnVE=;
 b=VrX6jeS2yXsx7qriHXOVaSvfp5hK+lfy6RbRqCVlN1AZ39PFPiEk1XYVca/aWslWTJ
 4kURk6CDwIyi/NlMqhVUu+TJ2o0eClgfK1Xf9ruD1Qr1+MUTfvuheU0aRBY5x2lg/UGq
 +33kIK/wp62hCpvKVc1w/dMvXsaDPWJ+uS4tpY45G7sXfEwbZAHq6Oth71zTbNyMjQk+
 SHFv1NHcZGOBlyvVDaoMCpfaedOdYZmtcZV7voUHbufM6RRXGPgi89IEI2+7vP4quse3
 0YjJ7Doz+Z6jo0f/qOZA4qAUHeI4PeHvs+cI8vmHCJH8B2wOKnMooXI86lbE5a/FMaNX
 jU9Q==
X-Gm-Message-State: AOAM533Ty1LVehhOcR3fm/21VWJtdFRPV15DDf6IcdPzkSjH0UjSmEmt
 BAk/rwWzBdr2NRkfIp1clmPnZA==
X-Google-Smtp-Source: ABdhPJzpO25ftXdScE+c4moZZIlui/WRunFKdsAHPmjZnWME7bUVC0iDZFA0lX1SRi/VgP0KbMAlxA==
X-Received: by 2002:a17:90a:a78d:: with SMTP id
 f13mr1677183pjq.206.1627507258658; 
 Wed, 28 Jul 2021 14:20:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l2sm908060pfc.157.2021.07.28.14.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 14:20:57 -0700 (PDT)
Date: Wed, 28 Jul 2021 14:20:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 02/64] mac80211: Use flex-array for radiotap header bitmap
Message-ID: <202107281407.52EA0088@keescook>
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
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields.
> > 
> > The it_present member of struct ieee80211_radiotap_header is treated as a
> > flexible array (multiple u32s can be conditionally present). In order for
> > memcpy() to reason (or really, not reason) about the size of operations
> > against this struct, use of bytes beyond it_present need to be treated
> > as part of the flexible array. Add a union/struct to contain the new
> > "bitmap" member, for use with trailing presence bitmaps and arguments.
> > 
> > Additionally improve readability in the iterator code which walks
> > through the bitmaps and arguments.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/net/ieee80211_radiotap.h | 24 ++++++++++++++++++++----
> >  net/mac80211/rx.c                |  2 +-
> >  net/wireless/radiotap.c          |  5 ++---
> >  3 files changed, 23 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/net/ieee80211_radiotap.h b/include/net/ieee80211_radiotap.h
> > index c0854933e24f..101c1e961032 100644
> > --- a/include/net/ieee80211_radiotap.h
> > +++ b/include/net/ieee80211_radiotap.h
> > @@ -39,10 +39,26 @@ struct ieee80211_radiotap_header {
> >  	 */
> >  	__le16 it_len;
> >  
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

Yeah, I agree. I tried a few ways, and was unhappy with all of them. :P

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

Hm, yes, I can try this. I attempted something similar without the
"only a struct" part; I was trying to avoid the identifier churn, but I
guess seeing it again, it's not _that_ bad. :P

>  
>  /* version is always 0 */
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index 771921c057e8..9cc891364a07 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -328,7 +328,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  
>  	rthdr = skb_push(skb, rtap_len);
>  	memset(rthdr, 0, rtap_len - rtap.len - rtap.pad);
> -	it_present = &rthdr->it_present;
> +	it_present = (__le32 *)&rthdr->data;

Hm, interesting way to avoid angering the compiler during the later
it_present++ updates. This is subtle ... a passer-by may not understand
why this isn't just "it_present = &rthdr->data.it_present".

I think this is okay with a comment added. I'll give this a spin.
Thanks!

-Kees

>  
>  	/* radiotap header, set always present flags */
>  	rthdr->it_len = cpu_to_le16(rtap_len);
> @@ -372,7 +372,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  			ieee80211_calculate_rx_timestamp(local, status,
>  							 mpdulen, 0),
>  			pos);
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
>  		pos += 8;
>  	}
>  
> @@ -396,7 +396,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  		*pos = 0;
>  	} else {
>  		int shift = 0;
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_RATE);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_RATE);
>  		if (status->bw == RATE_INFO_BW_10)
>  			shift = 1;
>  		else if (status->bw == RATE_INFO_BW_5)
> @@ -432,7 +432,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  	if (ieee80211_hw_check(&local->hw, SIGNAL_DBM) &&
>  	    !(status->flag & RX_FLAG_NO_SIGNAL_VAL)) {
>  		*pos = status->signal;
> -		rthdr->it_present |=
> +		rthdr->data.it_present |=
>  			cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
>  		pos++;
>  	}
> @@ -459,7 +459,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  	if (status->encoding == RX_ENC_HT) {
>  		unsigned int stbc;
>  
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_MCS);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_MCS);
>  		*pos++ = local->hw.radiotap_mcs_details;
>  		*pos = 0;
>  		if (status->enc_flags & RX_ENC_FLAG_SHORT_GI)
> @@ -482,7 +482,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  		/* ensure 4 byte alignment */
>  		while ((pos - (u8 *)rthdr) & 3)
>  			pos++;
> -		rthdr->it_present |=
> +		rthdr->data.it_present |=
>  			cpu_to_le32(1 << IEEE80211_RADIOTAP_AMPDU_STATUS);
>  		put_unaligned_le32(status->ampdu_reference, pos);
>  		pos += 4;
> @@ -510,7 +510,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  	if (status->encoding == RX_ENC_VHT) {
>  		u16 known = local->hw.radiotap_vht_details;
>  
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_VHT);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_VHT);
>  		put_unaligned_le16(known, pos);
>  		pos += 2;
>  		/* flags */
> @@ -553,7 +553,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  		u16 accuracy = 0;
>  		u8 flags = IEEE80211_RADIOTAP_TIMESTAMP_FLAG_32BIT;
>  
> -		rthdr->it_present |=
> +		rthdr->data.it_present |=
>  			cpu_to_le32(1 << IEEE80211_RADIOTAP_TIMESTAMP);
>  
>  		/* ensure 8 byte alignment */
> @@ -642,7 +642,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  		/* ensure 2 byte alignment */
>  		while ((pos - (u8 *)rthdr) & 1)
>  			pos++;
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE);
>  		memcpy(pos, &he, sizeof(he));
>  		pos += sizeof(he);
>  	}
> @@ -652,13 +652,13 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  		/* ensure 2 byte alignment */
>  		while ((pos - (u8 *)rthdr) & 1)
>  			pos++;
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE_MU);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE_MU);
>  		memcpy(pos, &he_mu, sizeof(he_mu));
>  		pos += sizeof(he_mu);
>  	}
>  
>  	if (status->flag & RX_FLAG_NO_PSDU) {
> -		rthdr->it_present |=
> +		rthdr->data.it_present |=
>  			cpu_to_le32(1 << IEEE80211_RADIOTAP_ZERO_LEN_PSDU);
>  		*pos++ = status->zero_length_psdu_type;
>  	}
> @@ -667,7 +667,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  		/* ensure 2 byte alignment */
>  		while ((pos - (u8 *)rthdr) & 1)
>  			pos++;
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_LSIG);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_LSIG);
>  		memcpy(pos, &lsig, sizeof(lsig));
>  		pos += sizeof(lsig);
>  	}
> diff --git a/net/wireless/radiotap.c b/net/wireless/radiotap.c
> index 36f1b59a78bf..f7852024c011 100644
> --- a/net/wireless/radiotap.c
> +++ b/net/wireless/radiotap.c
> @@ -114,11 +114,10 @@ int ieee80211_radiotap_iterator_init(
>  	iterator->_rtheader = radiotap_header;
>  	iterator->_max_length = get_unaligned_le16(&radiotap_header->it_len);
>  	iterator->_arg_index = 0;
> -	iterator->_bitmap_shifter = get_unaligned_le32(&radiotap_header->it_present);
> +	iterator->_bitmap_shifter = get_unaligned_le32(&radiotap_header->data.it_present);
>  	iterator->_arg = (uint8_t *)radiotap_header + sizeof(*radiotap_header);
>  	iterator->_reset_on_ext = 0;
> -	iterator->_next_bitmap = &radiotap_header->it_present;
> -	iterator->_next_bitmap++;
> +	iterator->_next_bitmap = (__le32 *)&radiotap_header->data.buff;
>  	iterator->_vns = vns;
>  	iterator->current_namespace = &radiotap_ns;
>  	iterator->is_radiotap_ns = 1;

-- 
Kees Cook
