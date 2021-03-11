Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0B3374D1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 15:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D776ECF3;
	Thu, 11 Mar 2021 14:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806B96ECF3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 14:00:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id 7so1998700wrz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 06:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8bbw8QzyV7O8EZ2ZjRpUDhUPFHdXutF9IJHJXTMvb/M=;
 b=TPAOOpzH47ivxlUqseR7djbOLZOPn07hTLcN0cDAf8wEwoGSR5YWFjdtUfK7HGG+FJ
 ygJBfyDWFCuTxUUYogFVn8kZ25WVPu1hBgYJxr/8C38Y/FkeRNUaShcmmvuPMocRsIg6
 Vfs4RVTkKKrzotvO3Tshy6s9XTTexejgIBdUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8bbw8QzyV7O8EZ2ZjRpUDhUPFHdXutF9IJHJXTMvb/M=;
 b=daVMjtM2PDzLbZysSiZTeQ5nPqCWMDI4JKbKonOWW53NnhIkrYcV8ohhPdtix7Sc1P
 LfY3yaa0kco71AMMOPZiD4SFTYiWFDOuAdrPiIXCNx9atg1rAsrG74Ck7u8pbHBXUF3E
 kIdpz8Y17buRZ9GKlnkuTuDg13GyWSxYlKdLItvrWnrKQBqz9e8hljKf6tPmvoltfLeB
 cNrqQrl4Z9wTY+4tNYbAzKUjIXD0LxrpfFLhwBYOOO9Kbm9RfbKNRrL/UAMqhCYa7Zjm
 xZGHbw/2FNXpPAljUIYn2XLaqlEKrLWxk5ezUXfgcWFTmRg1TpeXqQNKMZlbVZX+8rwH
 XnHw==
X-Gm-Message-State: AOAM533JIN2Gk1/moPKr8lMb99MQGq4TbgbHk9etdjCxSvNlaBVIpBmU
 /TowU9KK0RS/w1STdBBZXCQ2eX8BjZavMPuY
X-Google-Smtp-Source: ABdhPJxnPjleMEXHcWUx7EJ2QbvEMCwrVY2+svcko34uharkluS4h/7AAPEg2wNs9Vjn6TnqJHky2Q==
X-Received: by 2002:a5d:6103:: with SMTP id v3mr8605621wrt.375.1615471216184; 
 Thu, 11 Mar 2021 06:00:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm4042522wml.38.2021.03.11.06.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:00:15 -0800 (PST)
Date: Thu, 11 Mar 2021 15:00:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Query regarding DRM mastership sharing between multiple process
Message-ID: <YEoibZZ8OjbT0AZO@phenom.ffwll.local>
References: <CAESbsVNtvJaPGSYqvgzGGeriH11vcnJrQ=nnCJ4sbfyE1Y1pmQ@mail.gmail.com>
 <20210305174404.1293f25d@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305174404.1293f25d@eldfell>
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
Cc: Hardik Panchal <hardik.panchal@matrixcomsec.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 05:44:04PM +0200, Pekka Paalanen wrote:
> On Thu, 4 Mar 2021 09:43:22 +0530
> Hardik Panchal <hardik.panchal@matrixcomsec.com> wrote:
> 
> > Hello Sir/Madam,
> > 
> > I am trying to render some stuff using DRM with Qt GUI application and
> > decoded stream from Intel H/w decoder.
> > 
> > I have two applications one is for GUI content and another one is for
> > decoded video streams. While doing this I am facing an issue that only
> > singal process acquires DRM mastership while the other one is getting
> > error.
> 
> Hi,
> 
> yes, this is deliberate and by design.
> 
> The idea of having two separate processes simultaneously controlling
> KMS planes of the same CRTC is fundamentally forbidden. Even if it was
> not forbidden, doing so would lead to other technical problems.
> 
> You have to change your architecture so that only one process controls
> KMS. It you need other processes, they have to pass buffers or
> rendering commands to the process that does control KMS. In other
> words, you need a display server.

One option is kms leases, where the main compositor with exclusive control
over the display can pass a select set of resources to another process.
But it's a clear lessor/lessee relationship, and the main compositor can
always revoke the lease if needed.
-Daniel

> 
> > While wondering how to get the privilege to render stuff I came
> > across GET_MAGIC and AUTH_MAGIC.
> > Please refer to this text from the MAN page of DRM.
> 
> Those will not help you with breaking the DRM master concept.
> 
> > > All DRM devices provide authentication mechanisms. Only a DRM-Master is
> > > allowed to perform mode-setting or modify core state and only one user can
> > > be DRM-Master at a time. See drmSetMaster
> > > <https://www.commandlinux.com/man-page/man3/drmSetMaster.3.html>(3) for
> > > information on how to become DRM-Master and what the limitations are. Other
> > > DRM users can be authenticated to the DRM-Master via drmAuthMagic
> > > <https://www.commandlinux.com/man-page/man3/drmAuthMagic.3.html>(3) so
> > > they can perform buffer allocations and rendering.
> > >  
> > 
> > As per this the client which is authenticated using magic code should be
> > able to allocate buffer and rendering.
> > But while doing this I am not able to use drmModeSetPlane() for rendering
> > stuff on display from an authenticated client application. It is giving me
> > Permission Denied.
> > 
> > As per my understanding if the client is authenticated by using
> > GET/AUTH_MAGIC it should be able to set a plane and render stuff on the
> > display.
> 
> No. Authentication gives access to buffer allocation and submitting
> rendering commands to the GPU. It does not give access to KMS.
> 
> 
> Sorry,
> pq



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
