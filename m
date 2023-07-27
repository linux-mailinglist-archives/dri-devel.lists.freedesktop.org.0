Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FD5765657
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0FC10E599;
	Thu, 27 Jul 2023 14:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64F810E599
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:47:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C0FEE320014C;
 Thu, 27 Jul 2023 10:47:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 27 Jul 2023 10:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1690469254; x=1690555654; bh=yp
 tKnnzdYO9kC3MuWQYqGdVAVznPEvQwg0XTec3AzHc=; b=obg6A7afkIBB8NXonl
 oEUDFq/grYpjoHl0iVvZGVZ1DlInC0xwORwsUWCJ8EwosWxgXqnum7+wiM8lh8QU
 98+1pFU0Yd245MOvJ0+PYXDNyusI3c61J2sQVaH0J3Lj6O73TdKf2G4cTuPNRLEa
 uSfc0DRjc7KeNndRAB969R+kGPZi0Rgt7EKPO38gC/yUqvucVkWngZIJHhDgKJi9
 FqffqdJkj0I3Fme5VLmAOMfktrWkA9hOXB0z2iysVGnUNH1hvaARybzTHfjd0R7d
 4cAXIBB7pCfYcbdsMNDoxLoDHoySgzfcBcRlMDdsstQq0ZA+Y5it5p7xNJXdeh48
 NgNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690469254; x=1690555654; bh=yptKnnzdYO9kC
 3MuWQYqGdVAVznPEvQwg0XTec3AzHc=; b=gW1jjtg8ZlOYDA1DFn040bdNw8jQ0
 ktyYkDe6Uo9zX7OTBofNYZgO34YqyZqzqcI9cPYnWhp4Kbe7w/+rppFhUZi2qvrW
 mYQmfe4A1COZZwjFHsTsKeFVi/TRot4Oi9S5F6zDs3NK+xvPTN4B2d11SpzDg26m
 19bz1ega3JkDNO1b8CIYX9KfbmA0fp4rv70rZP3oj31cqQOLwJldBTx5DRRRedFD
 OF+AWDwZYfRdgVrSthS3nO91xwB18z/ZsCo3/MuUC2akMfzdbCNe22Op4H2KNahL
 +nDv5xPO9sIUZyQICmK7FoKDOV1eW6Hhp/81Iiiqi6gNtQ7YxPcXjQzVA==
X-ME-Sender: <xms:hYPCZAksbsw8KGzO9uYCKOE1UBcb7vGzhjFfdZRe7PaajMCxVTlafA>
 <xme:hYPCZP3xurT_1AM082b-fj12_DlrWDKCz-DGlz63Kh74ivhes4YuBf7BdETRR02DW
 ML4brAtN8ZgAi0__l4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeekudfggedvgfegffeffedvffelgfeludfhueefjeeiveektdevfeehjeffkeeh
 veenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:hYPCZOqunlsZwOJmllGLouZQy_O-e2Q9PxWnmBC5RFLapsy5EJv_iw>
 <xmx:hYPCZMkhUgQ31G7gAXdnZQrTvkHkU2t1A2R5sJZHobZsIE-QAObw9Q>
 <xmx:hYPCZO284lBMOaex3pwl4u99BsArI7cxiBPq3sBYQw2RU9E2gnhIUA>
 <xmx:hoPCZHn1aNKEk60wxLRBI6RK3DXBy_oT9C5pWXhtb9k6djTADeYJ1w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 98090B6008D; Thu, 27 Jul 2023 10:47:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <9d549ed7-69ce-428b-a622-c3a43909937e@app.fastmail.com>
In-Reply-To: <874jlpv45c.fsf@minerva.mail-host-address-is-not-set>
References: <20230727122412.2464210-1-arnd@kernel.org>
 <874jlpv45c.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 27 Jul 2023 16:47:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Maxime Ripard" <mripard@kernel.org>
Subject: Re: [PATCH] drm/ssd130x: drop DRM_GEM_SHADOW_PLANE_FUNCS override
Content-Type: text/plain
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023, at 16:07, Javier Martinez Canillas wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>
> Hello Arnd,
>
> Thanks a lot for your patch.
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> It is not possible for ssd130x_primary_plane_funcs to use both
>> its own reset/duplicate/destroy callbacks and the ones from
>> DRM_GEM_SHADOW_PLANE_FUNCS:
>>
>> In file included from drivers/gpu/drm/solomon/ssd130x.c:29:
>> include/drm/drm_gem_atomic_helper.h:100:18: error: initialized field overwritten [-Werror=override-init]
>>   100 |         .reset = drm_gem_reset_shadow_plane, \
>>   101 |         .atomic_duplicate_state = drm_gem_duplicate_shadow_plane_state, \
>>   102 |         .atomic_destroy_state = drm_gem_destroy_shadow_plane_state
>>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/solomon/ssd130x.c:744:9: note: in expansion of macro 'DRM_GEM_SHADOW_PLANE_FUNCS'
>>   744 |         DRM_GEM_SHADOW_PLANE_FUNCS,
>>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>
> Gah, I missed that. I wonder how this compile warning doesn't show up for me.

The warning is normally disabled, I have it turned on in my local
patch series on top of linux-next.

>> Since the custom callbacks were just added, I assume these are the
>> ones it is meant to use, so remvoe the generic overrides.
>>
>> Fixes: 45b58669e532b ("drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback")
>
> Unfortunately that's not enough, because the plane atomic state handlers
> that were introduced in that commit are broken so removing the macro will
> regress the driver.
>
> I've posted a patch that drops the macro but also fixes the handlers for
> the driver to work with the custom callbacks:
>
> https://lists.freedesktop.org/archives/dri-devel/2023-July/415897.html

Ok, makes sense.

    Arnd
