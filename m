Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A807142DA31
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8B36E8A3;
	Thu, 14 Oct 2021 13:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D146E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:21:33 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w19so24434035edd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SFoIG8L1vokrBlarScESiVXievYJsJzPK55+p+C11Z0=;
 b=j4zytPQKSAHgDn8yMnxOeU4tZHiraDMhgKKBRV6VBSbenUe3k5zoKrbfVVzbFoktGe
 moxyXMSMBXxSvSLzYj+seXrmVyabXtXpxoSPCM2x+b23i2Sa2f7AQBSMfhdtysFzJBPx
 +i41fdyNGNiFvagrXxKHzrU03uKOxjnsAedZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SFoIG8L1vokrBlarScESiVXievYJsJzPK55+p+C11Z0=;
 b=5BWgtPfDuo15Jw69uWjZTWpyxdN5sUxOfVq2ZPac98B/7UOcEWFoua4LTy/KDpxLtp
 BWd24L9TFYiz9NErhdbLYDtlxUZTzyd5Fnu830Kasroyl1KTr3Km+qR7NNuEHZXez3Ci
 FnPqZh+fK34UPu5lyrxIrOi6NRS6OASulVIggs6znntsuIFUJ3MUBLIgf3oQt1VG5DUE
 szHSG9xlwtZYE4bPZ3b1XYF6djz5b85VF/si3ozb/K6ZlzDip8CACRpl53vF1iRogmOy
 QTLKqWUKdGhDi+Gu9psp+X0ZrNNQtFLobn7gU1BifzMdPk++tuGpMzYmjUTpJeRvsXYn
 ixmw==
X-Gm-Message-State: AOAM530jg8BTaf+3hL2wluK/B0X87k+fNtAWS208pskDk6JYPLGS6ADM
 4Af4m2xZL8b8L4tebHVWntdetQ==
X-Google-Smtp-Source: ABdhPJw7OexEo+uJCxDSjdjD7p3cgaMakIl1im0XCiKUSl/nFZLNIXouZmJT6ZZRlhCR9XdXMLwqJA==
X-Received: by 2002:a17:906:2dc9:: with SMTP id
 h9mr3716563eji.431.1634217685131; 
 Thu, 14 Oct 2021 06:21:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p26sm2143643edu.57.2021.10.14.06.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:21:24 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:21:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH] drm: Increase DRM_OBJECT_MAX_PROPERTY by 18.
Message-ID: <YWgu0v5iPDFViHXS@phenom.ffwll.local>
References: <20211005065151.828922-1-bigeasy@linutronix.de>
 <YWbK8wSxNjVu9OLm@phenom.ffwll.local>
 <20211013123525.5nijgyx5ivnuujes@linutronix.de>
 <YWbXvvTzMF1EZ5c7@phenom.ffwll.local>
 <20211013173548.nldcwheo4t52dgvp@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013173548.nldcwheo4t52dgvp@linutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 07:35:48PM +0200, Sebastian Andrzej Siewior wrote:
> On 2021-10-13 14:57:34 [+0200], Daniel Vetter wrote:
> > Hm there's a pile of commits there, and nothing immediately jumps to
> > light. The thing is, 18 is likely way too much, since if e.g. we have a
> > single new property on a plane and that pushes over the limit on all of
> > them, you get iirc 3x4 already simply because we have that many planes.
> > 
> > So would be good to know the actual culprit.
> > 
> > Can you pls try to bisect the above range, applying the patch as a fixup
> > locally (without commit, that will confuse git bisect a bit I think), so
> > we know what/where went wrong?
> 
> c7fcbf2513973 -> does not boot
> c7fcbf2513973 + 2f425cf5242a0 -> boots, 18 x DRM_OBJECT_MAX_PROPERTY
> 6f11f37459d8f -> boots, 0 x DRM_OBJECT_MAX_PROPERTY
> 6f11f37459d8f + 2f425cf5242a0 -> boots, 18 x DRM_OBJECT_MAX_PROPERTY

Just to check, you've built 6f11f37459d8f, and then you cherry-picked
2f425cf5242a0 on top (not merged), and that already got you the warning
flood?

I'm probably blind, but I'm really not seeing where this pile of
properties is coming from. Can you pls also boot with drm.debug=0xe and
attach full dmesg? Plus your .config please.

Thanks, Daniel

> 
> > I'm still confused why this isn't showing up anywhere in our intel ci ...
> > 
> > Thanks, Daniel
> 
> Sebastian

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
