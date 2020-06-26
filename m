Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26120B33C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 16:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81E26ECA2;
	Fri, 26 Jun 2020 14:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C546ECA2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:07:55 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w10so4672785oih.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 07:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zcXV+jYTEKp1CFqugA9KRf6Ug1nkBeka9NVrMbb4NMQ=;
 b=eNEnQ+f8KQxFpC8IhgauCo1rh3AxqfDDd4bb4LFnZXgNUU6qMG3mygXEg+oj+3dBj5
 vWFbW2rCSjD54Pj507r6WJy6Dt4DDBCi3Y1skr9b4uVC2oWDZkHPVWaXKTU8kncqtF0a
 Mz56sc88hXmNnXbAiwVeWCw3p03zMyxvKPsDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zcXV+jYTEKp1CFqugA9KRf6Ug1nkBeka9NVrMbb4NMQ=;
 b=kfLMAH7BGRw6fMUWjgyISp+gmdlqsEj1k5Ah15Ax9CT+bjfDGJCtuDctgzHZruBeOY
 f8MEGbWr11yi8lrlg+4lYu1xEab8z7FF3OBaAWx6GoCsarFS/zf1+/ok1Z+x6HsNjfD8
 7aSB2sKymFUUCeunHvvYw4gft6DH+GksY6c+OOFMjYVERzwYeNbKAJsCC9A/yNadHBQn
 dsAThl1sDNIYSJVXz+CQ1c2FuXWJICeuJyh95CIVchZN4rrdFqm2MAnrxvMpmDWX3p2L
 JKb0NGY5ojrNw+J0q5Ji9yNEToDprdRxHJ+6AtdUDu6TrCQ9/HCc5cORUUYB+pMZhmfi
 WcPw==
X-Gm-Message-State: AOAM5320VnBwlmoS+oqU9L/XDkm8Wx3IRBVkI34X8rIWJigHmsdNZRst
 AQUrhMTg20J8GoG4ABGVOxALUSoqTRSIu0TOdOQVW+lw
X-Google-Smtp-Source: ABdhPJw9fIAQiQ9rmXF7RTMiUXZoTWsPrijrUn4Llo6V/FkBuZYMF/NCiZeFnssPI0G7lmtPrQmjxewUJc2c/PVAwHs=
X-Received: by 2002:aca:cc8e:: with SMTP id c136mr2591664oig.128.1593180475201; 
 Fri, 26 Jun 2020 07:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200626135233.32137-1-brian.starkey@arm.com>
In-Reply-To: <20200626135233.32137-1-brian.starkey@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 26 Jun 2020 16:07:43 +0200
Message-ID: <CAKMK7uGCQV7XptAAycHG_XOW-VOtHpUB2qqp2Kvo+3oUhkmOQA@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
 Liviu Dudau <liviu.dudau@arm.com>, matteo.franchin@arm.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 3:52 PM Brian Starkey <brian.starkey@arm.com> wrote:
>
> In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> describes a generic pixel re-ordering which can be applicable to
> multiple vendors.
>
> Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> used to describe this layout in a vendor-neutral way, and add a
> comment about the expected usage of such "generic" modifiers.
>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> ---
>
> This is based off a suggestion from Daniel here:
> https://lore.kernel.org/dri-devel/20200529115328.GC1630358@phenom.ffwll.local/
>
> If there are future cases where a "generic" modifier is identified
> before merging with a specific vendor code, perhaps we could use
> `fourcc_mod_code(NONE, n)` or add a DRM_FORMAT_MOD_VENDOR_GENERIC.
>
> However, I also think we shouldn't try and "guess" what might be generic
> up-front and end up polluting the generic namespace. It seems fine to
> just alias vendor-specific definitions unless it's very clear-cut.

I think the above two things would also be good additions to the comment.

A totally different thing: I just noticed that we don't pull in all
the comments for modifiers. I think we could convert them to
kerneldoc, and then pull them into a separate section in drm-kms.rst.
Maybe even worth to pull out into a new drm-fourcc.rst document, since
these are officially shared with gl and vk standard extensions. Then
this new modifier's doc could simply point at teh existing one (and
the generated kerneldoc would make that a hyperlink for added
awesomeness).

Aside from that makes sense to me, maybe just add it to your patch
series that will start making use of these.
-Daniel

>
> I typed a version which was s/GENERIC/COMMON/, other suggestions
> welcome.
>
> Cheers,
> -Brian
>
>  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 299f9ac4840b..ef78dc9c3fb0 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -345,8 +345,27 @@ extern "C" {
>   * When adding a new token please document the layout with a code comment,
>   * similar to the fourcc codes above. drm_fourcc.h is considered the
>   * authoritative source for all of these.
> + *
> + * Generic modifier names:
> + *
> + * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
> + * for layouts which are common across multiple vendors. To preserve
> + * compatibility, in cases where a vendor-specific definition already exists and
> + * a generic name for it is desired, the common name is a purely symbolic alias
> + * and must use the same numerical value as the original definition.
> + *
> + * Note that generic names should only be used for modifiers which describe
> + * generic layouts (such as pixel re-ordering), which may have
> + * independently-developed support across multiple vendors.
> + *
> + * Generic names should not be used for cases where multiple hardware vendors
> + * have implementations of the same standardised compression scheme (such as
> + * AFBC). In those cases, all implementations should use the same format
> + * modifier(s), reflecting the vendor of the standard.
>   */
>
> +#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
> +
>  /*
>   * Invalid Modifier
>   *
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
