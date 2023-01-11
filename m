Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8D666604
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036A710E157;
	Wed, 11 Jan 2023 22:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223C810E157
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:08:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e3so7188527wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e8jbIWpDks817wZVZe3w7IeAdheSDmxtiCNDLU2yc/E=;
 b=kd5VzRIcol9UrKMRsfR8dn4H6+86H8n9Hgg1PKNRqRXPtZYY7N0xxGgHjGcN+0TdPb
 rCv9HTm5qI6zd+1qolrOQ1nDZAy/JNY1yR8xPSRqdOHSjxK3zMLe1TPPyqDg3B3UAtst
 rmNvJNzC3jiekHaIV5TlN/7beegHdv5J8Lmfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8jbIWpDks817wZVZe3w7IeAdheSDmxtiCNDLU2yc/E=;
 b=dvQqnpybZl2Eq+HleP0g0hWXYGB668+NtveE0ci1nE+1nNcCSfpdFgCAthBF4OxCw4
 tSoeNfm8vbc/C5RT3JCth/rSgwVAS0AvNhiZyHUQpxazfOxg+HQPuXiPhNPb60dvHikq
 66BSn1Xz0fHmTmKRNTrzJsiWIzJ9K6NAWvL2qgcXdbQpMkBkfkAxsh7rf+tc8VXKosxo
 x9ONrFTi1lLH1YCnROxPB6N2Up16BPgoWcTyU4hf6VbZ7IqH0pCcntTek7chfCJaVT1w
 Aog8Zp+vgVk9qOk1b3s8bX58EO0n4Q5tHNsWJHwJvTE/ml1r3DtXwS3H/+A53aqz6RnU
 IfHw==
X-Gm-Message-State: AFqh2krn4Z2QtuM7BHTfiyaQO0cDBSD0v2qSVFzr3FJfStApByO2P6Pu
 DIGJoT8YqwAViyuf1/IgNsA3eA==
X-Google-Smtp-Source: AMrXdXvtasjqIJElmS7fDawuRLxC0eQJU2WOMYSwbDOInJWwxReJH8NpH2yARToadFa5jgb0vBmjsQ==
X-Received: by 2002:a5d:488b:0:b0:242:5563:c3b with SMTP id
 g11-20020a5d488b000000b0024255630c3bmr45402315wrq.59.1673474931536; 
 Wed, 11 Jan 2023 14:08:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d62cf000000b002bbedd60a9asm9125012wrv.77.2023.01.11.14.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:08:50 -0800 (PST)
Date: Wed, 11 Jan 2023 23:08:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <Y78zcBZx1AKt1SgT@phenom.ffwll.local>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
 <Y7frUw39xU70WQkD@phenom.ffwll.local>
 <20230110092839.3mx7dcbhj2w7hm5q@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110092839.3mx7dcbhj2w7hm5q@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 10:28:39AM +0100, Gerd Hoffmann wrote:
> On Fri, Jan 06, 2023 at 10:35:15AM +0100, Daniel Vetter wrote:
> > On Fri, Jan 06, 2023 at 09:56:40AM +0100, Gerd Hoffmann wrote:
> > > On Thu, Nov 17, 2022 at 05:30:54PM -0800, Vivek Kasireddy wrote:
> > > > Setting this property will allow the userspace to look for new modes or
> > > > position info when a hotplug event occurs.
> > > 
> > > This works just fine for modes today.
> > > 
> > > I assume this is this need to have userspace also check for position
> > > info updates added by patch #1)?
> > 
> > What does this thing even do? Quick grep says qxl and vmwgfx also use
> > this, but it's not documented anywhere, and it's also not done with any
> > piece of common code. Which all looks really fishy.
> 
> It's again a virtualization-specific thing.  On physical hardware you
> typically have no idea which of your two monitors stands left and which
> stands right.  On virtual hardware the host knows how the two windows
> for the two heads are arranged and can pass on that information to the
> guest.  suggested_x/y properties added by patch #1 do pass that
> information to userspace so the display server can arrange things
> correctly without manual invention.

Yeah suggested_x/y I know about. Would still be good to fix the
documentation situation for that.

> I have no clue though why this hotplug_mode_update property exists in
> the first place and why mutter checks it.  IMHO mutter could just check
> for suggested_x/y directly.

This one is the complete wtf here. I have no idea why this exists.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
