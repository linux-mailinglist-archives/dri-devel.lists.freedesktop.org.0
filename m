Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421929512C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 18:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550B6EE1A;
	Wed, 21 Oct 2020 16:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5EE6EE1A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603299379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpWDrSQ0xS4iFl6zf0HLMlyff6mhU5Ears3TWXC/4Ho=;
 b=R8oNNqGMz5F+8u4M+CwCPe6aXc7yqrbejnQOAQPOKoKrEjTv9ulzuQZzcXx74Df3Dr+QeO
 n1NUthD23NPICNj0KjpgE7nWRX87zG+ey7R9SIEb0SeCffASZ7Q+UjK6LORv7iR49LHec4
 G4XC6iBvBDAzovwjw2dWqDvhtYMQf3A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-DNUjUCzAM9KeHdaakZJHQQ-1; Wed, 21 Oct 2020 12:56:14 -0400
X-MC-Unique: DNUjUCzAM9KeHdaakZJHQQ-1
Received: by mail-qv1-f69.google.com with SMTP id u17so1686078qvt.23
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YpWDrSQ0xS4iFl6zf0HLMlyff6mhU5Ears3TWXC/4Ho=;
 b=Fh+/fWpgd0TVtxJIk/BKq7+lXUkAInV3QdbIlHzjOPej73JbHTwm6BkrkZ1528mVNZ
 yJlqfrUoZ+j7IzxwTHDQ6bf6xTSQ2w+Mk7LH8Jh2Kry1CM7Q8Pr9JHqcBWWYh+n5oMxc
 1613TTAakv/YUQ3J9qj/P7SNGdtVwK4tsiYg2bXv4DERYlWqCrnDG8c/L+f3c0ICifwU
 QsefakU9XPoazkBBk2W1fh2qMuRY+g8PjTEBB9YForugksOHDJOf5KaVsl5Nzuj//fAa
 eRj29sRLT1G/BiSUX2QZdEgkFLvu+xdJDatoplo4P5xcpqi0R/hxW+InKMz4MHicE+Zg
 930Q==
X-Gm-Message-State: AOAM530L8vSOA3v9YYNPzJUyjYvWeAlLtn57C2XnsPd0/sPXNbtqC1N8
 mXKrim4mu8HDiQCKV6PRg/wWUsenTv65PM7HNRdmNqh4dmX6Z8cmFjaarrfWwmZ38PHZzrbVXNC
 omqqGWxXiL3Wu/gFNu38noWAiHj18
X-Received: by 2002:a05:620a:142d:: with SMTP id
 k13mr3922508qkj.315.1603299373817; 
 Wed, 21 Oct 2020 09:56:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2v8PeoZ/a94ls9zOIyKWksYLW/NAN8enNJ9jX43dkLHUQkSE464KGbP6E/4BzXTqrq+S0iw==
X-Received: by 2002:a05:620a:142d:: with SMTP id
 k13mr3922487qkj.315.1603299373526; 
 Wed, 21 Oct 2020 09:56:13 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 19sm1575196qki.33.2020.10.21.09.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:56:12 -0700 (PDT)
Message-ID: <54b001e1748fd3d80c711181521e5cf1ec6875eb.camel@redhat.com>
Subject: Re: [PATCH v2 12/24] drm/dp: fix a kernel-doc issue at drm_edid.c
From: Lyude Paul <lyude@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Wed, 21 Oct 2020 12:56:11 -0400
In-Reply-To: <20201021121108.51972144@coco.lan>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
 <b7c9b5ddc2bdd5d1a0bb5a000d88681ad0b6fabe.camel@redhat.com>
 <20201021121108.51972144@coco.lan>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, good point. It looks like you've already added the drm-misc-next and drm
maintainers to here so as long as they're aware that should be fine

On Wed, 2020-10-21 at 12:11 +0200, Mauro Carvalho Chehab wrote:
> Hi Lyude,
> 
> Em Tue, 13 Oct 2020 15:49:11 -0400
> Lyude Paul <lyude@redhat.com> escreveu:
> 
> > wait, I think there's some confusion here. these patches have already been
> > pushed
> 
> As the patch adding the warning was merged upstream at the 5.10 merge
> window, the fixup one should also be added there, instead of waiting
> until 5.11 ;-)
> 
> So, if OK for you, I'll send this upstream via my tree by the end of
> the merge window, as our goal is that 5.10 won't have doc warnings.
> 
> Regards,
> Mauro
> > 
> > On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> > > The name of the argument is different, causing those warnings:
> > > 
> > > 	./drivers/gpu/drm/drm_edid.c:3754: warning: Function parameter or
> > > member
> > > 'video_code' not described in 'drm_display_mode_from_cea_vic'
> > > 	./drivers/gpu/drm/drm_edid.c:3754: warning: Excess function parameter
> > > 'vic' description in 'drm_display_mode_from_cea_vic'
> > > 
> > > Fixes: 7af655bce275 ("drm/dp: Add drm_dp_downstream_mode()")
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index a82f37d44258..631125b46e04 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -3741,7 +3741,7 @@ drm_add_cmdb_modes(struct drm_connector
> > > *connector, u8
> > > svd)
> > >  /**
> > >   * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
> > >   * @dev: DRM device
> > > - * @vic: CEA VIC of the mode
> > > + * @video_code: CEA VIC of the mode
> > >   *
> > >   * Creates a new mode matching the specified CEA VIC.
> > >   *  
> 
> 
> Thanks,
> Mauro
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
