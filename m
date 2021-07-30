Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A483DB337
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 08:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402416F3D8;
	Fri, 30 Jul 2021 06:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423D46F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 06:08:43 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id l126so10078349ioa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 23:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Ri7dUSHGhZY2tYqQt9WHv9mXFUqQVec2u9T6YNhEc0=;
 b=Hk2KvJDgF8BJlfdnAPgnRP/64Cvj3rjXJWTFLSCoZY/ulCK5cfAHu+GC9R4s7dLjv1
 SXHgg2P9e0oNTWauzALeEwhhgk7/ggHIrfoPq5Hc4GLwG5+674MQaxWTTLZfh8kQYH3u
 wRzKOWzkcViy4HqhhNIDX9GvLhBCGlyUuB3pFZll1Jq/g9fA0sRFvyxYUmn0ysfs+k7e
 kiBLhsEaBtULrp0PPxxD26BqJnbn2pIG1idgl1mwnIqecv6rweC1oMXKtpafQ5lK2wKC
 uc2X/BH7V5R++ZQlwxav7Hgkd044IyHr5yyySjtzMem0IwpJtbVOj6Zi0KOoxJ0vA7uE
 NvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Ri7dUSHGhZY2tYqQt9WHv9mXFUqQVec2u9T6YNhEc0=;
 b=jSEqE8XA3bwcUDBXnW7/lwMY9Cmr9Bp60jOxW12Mrp1mHtn9j6RtdHacFWkpWdOymT
 0uQ9wLuo7BQQ4HRjMi9qCsptVRRKRkK9Ju5pI+OHPyUCOLfpSPdL0eEU7Slit7n79RcZ
 6cODuBnxVFZ+iDhkczZfNNWxZjN9Td0Fp89LnegHTQdgtP2X4/IDzm941PolTz/i3Vvf
 JXlxvBy3oF92u41r5HpvNMv5+Bzwm6YNMq0KjdRsbU36CYJ29sppf92gUBt8NM3KURWN
 qZ8K+81lugKZaPeYoJCRcde6OfJgAAwHiUm3iBlsu1uNkxOM2xctY4n62k00RPGVYvwZ
 av8A==
X-Gm-Message-State: AOAM533d6INInNk1tONaf3KhjC4MV4JqjHVcXaaTpMNe73gb6bgYUY24
 fyunEzjhDhaWxvDtvEcx7WI=
X-Google-Smtp-Source: ABdhPJyvbk1qFvusNWnTRZMt8D4ZQbtWZ8pYKwuXWyNI5nEsznwSugT2hpZqY56lkSflsl9dw+S/zg==
X-Received: by 2002:a05:6602:218c:: with SMTP id
 b12mr1100588iob.82.1627625322651; 
 Thu, 29 Jul 2021 23:08:42 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id k4sm452212ior.55.2021.07.29.23.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 23:08:42 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id 395E327C0054;
 Fri, 30 Jul 2021 02:08:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Jul 2021 02:08:41 -0400
X-ME-Sender: <xms:ZpcDYX-C7wr8cjhSKq4JR-P_97ZSNgD9_wQWx6irRJ39x5GtIfQimg>
 <xme:ZpcDYTvGQo53XeLl4sr-xdEbcbXcZZUO7TO55mP7md2OYlU3JAf6fWah8FqSJly1E
 xqbqyItL8J1wp8AWQ>
X-ME-Received: <xmr:ZpcDYVDBS3A5BU2_dYrIbuMClFiKw-Dyp6Mb--rkumQHs1OOIvgD6vt1tkG0mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheeggdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhm
 rghilhdrtghomheqnecuggftrfgrthhtvghrnhepvdelieegudfggeevjefhjeevueevie
 etjeeikedvgfejfeduheefhffggedvgeejnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsoh
 hnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhg
 peepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:ZpcDYTebkroJ3dzWUOIvs0XyWbp942eAM9EjIsoS9rpxtiqaXlDIPw>
 <xmx:ZpcDYcNE1ywBbw5FlGyFO4BC19vzjqFp3Li20lmyV41WCoGERWuisw>
 <xmx:ZpcDYVkVGn4knw8H1fwjffd7ezjZ8UkP6P4x7Dvms5zWQg5zMiwdDQ>
 <xmx:aZcDYTmd_Kq16_ZsH3d7aQFuM0nmosDdUZiKtxtqfzNuEvMiP7lmXFNzKM0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 02:08:38 -0400 (EDT)
Date: Fri, 30 Jul 2021 14:08:13 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
Message-ID: <YQOXTW8kSHdNjhiY@boqun-archlinux>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
 <20210730041515.1430237-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730041515.1430237-3-desmondcheongzx@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org, longman@redhat.com,
 will@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 30, 2021 at 12:15:15PM +0800, Desmond Cheong Zhi Xi wrote:
> In drm_is_current_master_locked, accessing drm_file.master should be
> protected by either drm_file.master_lookup_lock or
> drm_device.master_mutex. This was previously awkward to assert with
> lockdep.
> 
> Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
> helpers"), this assertion is now convenient so we add it in.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_auth.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 9c24b8cc8e36..6f4d7ff23c80 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -63,9 +63,9 @@
>  
>  static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  {
> -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> -	 * should be held here.
> -	 */
> +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
> +

I think it's better to also add the lockdep_assert() of & (i.e. both
held) in the updater side, and have comments pointing to each other.

Is it convenient to do in this patchset? If the updater side doesn't
need to put the lockdep_assert() (maybe the lock acquire code and the
update code are in the same function), it's still better to add some
comments like:

	/*
	 * To update drm_file.master, both drm_file.master_lookup_lock
	 * and drm_device.master_mutex are needed, therefore holding
	 * either of them is safe and enough for the read side.
	 */

Just feel it's better to explain the lock design either in the
lockdep_assert() or comments.

Regards,
Boqun

>  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>  }
>  
> -- 
> 2.25.1
> 
