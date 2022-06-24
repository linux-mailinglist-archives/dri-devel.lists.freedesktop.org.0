Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42455A43A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 00:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6310F5CF;
	Fri, 24 Jun 2022 22:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138BA10F5C7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 22:12:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m1so4860211wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8yhNbjErvck0pOEg3bnA1kkRz6NO4xJ2kvU3vr5NWNk=;
 b=Ygx++iURDaY9nN8UFg7C2Lt44vsIlaWDmJJ4oU5wC6paeDqFK6XJWpyhykSzFWGDFI
 7bWnK7eyHDZbFovj3q742E4sc4aHu4J3CETMVh+WwFt04zKB2Y+Dq/wGKSjgV4hs/Rfr
 sIPfJC5/QxPMTTTLjCiHh312B4u4HxNvNXoNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yhNbjErvck0pOEg3bnA1kkRz6NO4xJ2kvU3vr5NWNk=;
 b=Dfi2P2PjfIcXfgZDGK+A6Wd2LRp9SgsIhbmXgsUMi/tgwvWfCcj+xAYPBOnEU46POQ
 KIZMscV1uqDajkq/rq1NtKC73BjER29PgkZ5h5BlqQaVpgVBdClpUwt/dJZPI6HVNgqH
 Prv9aSuK/I/rq1Gfq+n97uglX94ZKaPKewzLj/mM29UKB1xtsBIMLbaqky3Y6WcV6K3I
 oTwcBXV2iNzKlPKXawL1uaFfSYbN1ixe0xQWDK3BoqbaVp/3Um25KFyKypMthtJozlC3
 dg2ZrM9MW4Kf6jsYhD5/Nl4muZrQlxlfCND3pBFWzYwHanzH+7yFs5TKAnWLR2TbgD9o
 T06g==
X-Gm-Message-State: AJIora/JXPc5ixAsO2v8Z0lRGqt1jiW0rTWv+kqEG6o7XH+Bv0qmpCyy
 I+Dxe15OkdaqPL9qfDQSKgQMMg==
X-Google-Smtp-Source: AGRyM1u47setXXuP4XMtxuQzVntWvoSQw2qBhxqyTvF7/IdYgDzYr4YHs/67LV7qxeYTLRjlraYC5A==
X-Received: by 2002:a05:6000:188c:b0:218:5b98:445 with SMTP id
 a12-20020a056000188c00b002185b980445mr1060007wri.465.1656108727478; 
 Fri, 24 Jun 2022 15:12:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j6-20020adff546000000b0021b862ad439sm4035042wrp.9.2022.06.24.15.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 15:12:06 -0700 (PDT)
Date: Sat, 25 Jun 2022 00:12:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <YrY2tRX/kqGtZNC2@phenom.ffwll.local>
References: <YrQeAAVvQ6jxu2dl@linux-uq9g>
 <a3bf32dc-bcae-496c-0c3a-5fe5c5c89c3f@suse.de>
 <87r13frdjl.fsf@intel.com>
 <12471428-9bfb-0249-c305-8009c5af1f25@suse.de>
 <87bkujrc4n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkujrc4n.fsf@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 11:56:56AM +0300, Jani Nikula wrote:
> On Thu, 23 Jun 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi
> >
> > Am 23.06.22 um 10:26 schrieb Jani Nikula:
> >> On Thu, 23 Jun 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> I forgot to mention that we backmerged v5.19-rc2. That's why the list of
> >>> changed files is so long.
> >> 
> >> I thought we should only backmerge Linus' tree via backmerging drm-next,
> >> which avoids this problem altogether.
> >
> > I did backmerge via drm-next.
> 
> Then I'm confused how it all shows up the the diffstat. If you backmerge
> drm-next to drm-misc-next, and then generate your drm-misc-next pull
> request against drm-next (dim pull-request drm-misc-next drm/drm-next),
> I don't think it should show up.

git is shit (tm)

The git commit list will look reasonable, but the diff will make a
complete mess out of non-linear history. I think it's this case here too.

I think the way to fix it is to do a manual test merge and then to a diff
against the first parent (assuming you did the test merge forward, not
backwards). Without the test merge git tries to do some kind of multi-way
diffstat.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
