Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A990C545F7A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC97D11BB51;
	Fri, 10 Jun 2022 08:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF09112573
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 08:41:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a15so27020982wrh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gp4F46lOEJs9CjqgKCJssnagb+KAUXKCVAwtddttrAM=;
 b=Yfcf4sQ/xLvRCqpwkLC1dQ7mgfWVRHwB3nePBZemTDxt63Me7lIEmg3ytyYA4lGw3B
 10UpkB/N8S/lDgmTTmBKOrO8/B8intkXl9aIYSJleI5T9RD+F2kEs9sE6tzK/UmBFeno
 95kIm/B/uTX4xOvWHfTZgBhO2/muDVK/FCj/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gp4F46lOEJs9CjqgKCJssnagb+KAUXKCVAwtddttrAM=;
 b=5DWtjd/OfGvhzKMXF7jMrNpn85s09rNS50b0GXr2mLftjmKej+ffHmVZoBzDlcEN8F
 HmFR4VlIEAJA9xcpbRETKYjTIGCmxRS78e//TtChyGC1xItpMavfH5s6rvmrKeUk2PGs
 X1406ELeABKQU/dNT6PpJQ2F0lipxy6RGo9isk0+lpyysPPXS5C0x1YNRV9AedpmRQfW
 0bPFzgWcdfVNrpnNF4S6vpWYw5bl8K7u3H/dvjylDITQKu4Apj2j2A0ic6cZcbRas36p
 1NHqH06cGLJd2NkcyEhEiM8BNrvR4P970725fqdB/U6mUPvRxaO6uLYo300MhiQnTgH7
 Ey8Q==
X-Gm-Message-State: AOAM531z1q95hsU6xgME4DyAb+uBbQVOWx4AULaxxFPEJ6atXLfDG98f
 ATxD3PNMi3d33yUvTO+6kh+ehg==
X-Google-Smtp-Source: ABdhPJyuDo4yaIyCriFTslSPqJkvMpiJcUcyrX2noPeKiMJ9skiaI9ZNXQIrQVXg+OGqMZsCm1otyw==
X-Received: by 2002:a05:6000:1acf:b0:218:5a30:9067 with SMTP id
 i15-20020a0560001acf00b002185a309067mr14986491wry.48.1654850467989; 
 Fri, 10 Jun 2022 01:41:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x8-20020adff0c8000000b00210a6bd8019sm26186277wro.8.2022.06.10.01.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 01:41:07 -0700 (PDT)
Date: Fri, 10 Jun 2022 10:41:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 mombasawalam@vmware.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 Pekka Paalanen <ppaalanen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Kinda top post because the thread is sprawling and I think we need a
summary/restart. I think there's at least 3 issues here:

- lack of hotspot property support, which means compositors can't really
  support hotspot with atomic. Which isn't entirely true, because you
  totally can use atomic for the primary planes/crtcs and the legacy
  cursor ioctls, but I understand that people might find that a bit silly :-)

  Anyway this problme is solved by the patch set here, and I think results
  in some nice cleanups to boot.

- the fact that cursors for virtual drivers are not planes, but really
  special things. Which just breaks the universal plane kms uapi. That
  part isn't solved, and I do agree with Simon and Pekka that we really
  should solve this before we unleash even more compositors onto the
  atomic paths of virtual drivers.

  I think the simplest solution for this is:
  1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that for these
  special cursor planes on all virtual drivers
  2. add the new "I understand virtual cursors planes" setparam, filter
  virtual cursor planes for userspace which doesn't set this (like we do
  right now if userspace doesn't set the universal plane mode)
  3. backport the above patches to all stable kernels
  4. make sure the hotspot property is only set on VIRTUAL_CURSOR planes
  and nothing else in the rebased patch series

- third issue: These special virtual display properties arent documented.
  Aside from hotspot there's also suggested X/Y and maybe other stuff. I
  have no idea what suggested X/Y does and what userspace should do with
  it. I think we need a new section for virtualized drivers which:
  - documents all the properties involved
  - documents the new cap for enabling virtual cursor planes
  - documents some of the key flows that compositors should implement for
    best experience
  - documents how exactly the user experience will degrade if compositors
    pretend it's just a normal kms driver (maybe put that into each of the
    special flows that a compositor ideally supports)
  - whatever other comments and gaps I've missed, I'm sure
    Simon/Pekka/others will chime in once the patch exists.

There's a bit of fixing oopsies (virtualized drivers really shouldn't have
enabled universal planes for their cursors) and debt (all these properties
predate the push to document stuff so we need to fix that), but I don't
think it's too much. And I think, from reading the threads, that this
should cover everything?

Anything I've missed? Or got completely wrong?

Cheers, Daniel

On Fri, Jun 03, 2022 at 02:14:59PM +0000, Simon Ser wrote:
> Hi,
> 
> Please, read this thread:
> https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.html#259615
> 
> It has a lot of information about the pitfalls of cursor hotspot and
> other things done by VM software.
> 
> In particular: since the driver will ignore the KMS cursor plane
> position set by user-space, I don't think it's okay to just expose
> without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> 
> cc wayland-devel and Pekka for user-space feedback.
> 
> On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:
> 
> > - all userspace code needs to hardcore a list of drivers which require
> > hotspots because there's no way to query from drm "does this driver
> > require hotspot"
> 
> Can you elaborate? I'm not sure I understand what you mean here.
> 
> Thanks,
> 
> Simon

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
