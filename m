Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA762B86FE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388E76E4C5;
	Wed, 18 Nov 2020 21:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6D96E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 21:46:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o15so3732458wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ENEK3zdXYIU7XLEGWNuXdD+SQS7bhktVNGwfCYl48/8=;
 b=f+sXtirKpKtJ0xsIiA5gqx3mgw15yC6QyPwgEaZFmP/LlduFBhM8A+qVCcpNyXMT7m
 7uoiUhVXaNrexao9lODoQ/fINZc7gAwE8LNlGYkCCluFgEwtFhHgXz+nqOMKqNRqMYfG
 xZ9crlpmGuAu1qOwBKu7JJ9bTteiy+Hvuz87g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ENEK3zdXYIU7XLEGWNuXdD+SQS7bhktVNGwfCYl48/8=;
 b=kNjPxAH8N7UOhZepQt0b88+N7/2NYv71LBw0BzwoHrO0o8QK5Qa7lTbRV8lx8yBL0J
 ReJ7ghkVV18FhTDS5ncRTgTK6KeWg9IyN2261Rir6tKZFZDaTcXG1vGfsNETSkA0o6HV
 CQ5NpmBM8SF6X5Sv1L2ydRSojGjig5bDrkvYJD29s6mxvJS0WDDtiADLZNbbuEUjs0Fo
 AzdS4cKLZf7JctFTV3YUSwyqcLRu9E120pgpVGoacxf+81yAedh3DlLF72Sd1mkwsIKJ
 hcOIlfxniTItM5LGW86q9UMQBJKCXuz0xFmsaT5YPzMiv3Ejm5R6NEBL1c5KP1OGcHPc
 cDMQ==
X-Gm-Message-State: AOAM533N02dIyveynGyNTEDZs3pUEDMnDSfVnXkAt5MPAOXc+zu8Kz7c
 ac7DDVxyfD3uE9zsqyGN9tZJKA==
X-Google-Smtp-Source: ABdhPJw9E2ejTQhfY9SjbNZKXyjLQiPpIIEbt0l4sb+3YeQdxGuqa5wTpH7Ng7TM5K5W4tX06kcIzw==
X-Received: by 2002:a5d:4991:: with SMTP id r17mr6868916wrq.70.1605736012877; 
 Wed, 18 Nov 2020 13:46:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm36494843wrx.9.2020.11.18.13.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:46:51 -0800 (PST)
Date: Wed, 18 Nov 2020 22:46:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Adam Jackson <ajax@redhat.com>
Subject: Re: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
Message-ID: <20201118214650.GB401619@phenom.ffwll.local>
References: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
 <CAD_bs+ouZZEREo4irNEgb5VBrFJaMPfLhWQG0mnLNMshQac9uA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD_bs+ouZZEREo4irNEgb5VBrFJaMPfLhWQG0mnLNMshQac9uA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 10:55:27AM -0500, Adam Jackson wrote:
> On Tue, Nov 17, 2020 at 4:40 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > It's probably full of bugs ready for exploiting by userspace. And
> > there's not going to be any userspace for this without any of the drm
> > legacy drivers enabled too. So just couple it together.
> 
> Not quite true. The only UMS driver using this is i810, which needs it
> even with DRI disabled. I have difficulty caring though.

TIL.

> In related news, since i810 is only ever attached to 32-bit x86 we
> could disable the frontend unconditionally on amd64 (and everything
> else tbh).
> 
> Acked-by: Adam Jackson <ajax@redhat.com>

Pushed to drm-misc-next, thanks for taking a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
