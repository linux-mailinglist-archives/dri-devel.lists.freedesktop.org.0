Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D645229495F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B136EA93;
	Wed, 21 Oct 2020 08:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8753C6EA93
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:34:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n18so2022563wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rV3EajEMSYx+1j9OynzDREKWTl5pkyRGP3mdtvbMyPs=;
 b=Yr8YXtWFk2cFFO1sejskPqfThfuPG4s/dCjxZEDh3pRA+xrnMQkGTlwTm7xgkQ8yIG
 xksaJ1WLr/l82QlohUmpiV92jApaSkSWsJxSjENmlkGtndAgSEbZalaWJCjFDUqufs+n
 UsDllMKUBiV5bHua4krO8O3TERw+/L6UsBEvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rV3EajEMSYx+1j9OynzDREKWTl5pkyRGP3mdtvbMyPs=;
 b=oRXw4xyRhGilCSjMOHCtyS+KtCHo3+GnTgVQPaWVj9rVMMCrcpOtYH0of0lR4GoAoJ
 UwYOKp9YHFGAVxAf3rU3T9uCyTwHZuIH8Qd2iHSkZ5L/U5q6dPc/a9W238/xEamwbZ03
 jET2zquRyvgMSq5vS6ODPakM8txi9uuIeF/rDpuqegbF4k64fp8iHsyPETPjmtWXaRU6
 oQMeaRoVjpEPt6Wb5Sa3koqa2fGXtiGZ7JhAlX8a9AAKTTAVyaEhZcwOI6PpXGlk9f9+
 5unBZTJAIy/bSiwTi0malgwBEtFTpCsTidVQ7kqH4j15l9+n8eSdfW992HEl7Qk3dtw4
 J69A==
X-Gm-Message-State: AOAM531NVObPuTB5pYxBrpgG/HE60xOFQT5Eflkb28JEAld4pu8wC9gG
 Jd31ZyJB/sf0pdUynVn6lBCcOA==
X-Google-Smtp-Source: ABdhPJz3IRCF6UY/PwxS6PPuKuWu7V3EPMr4IsxaToP64wJe9089Jol+No65SiStYnr1Xi3Rn2p7bQ==
X-Received: by 2002:adf:f482:: with SMTP id l2mr3328678wro.26.1603269258229;
 Wed, 21 Oct 2020 01:34:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e7sm2641705wrm.6.2020.10.21.01.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:34:17 -0700 (PDT)
Date: Wed, 21 Oct 2020 10:34:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
Message-ID: <20201021083415.GN401619@phenom.ffwll.local>
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Adrian Salido <salidoa@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ken Huang <kenbshuang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 07:40:48AM +0000, Simon Ser wrote:
> On Wednesday, October 21, 2020 8:54 AM, Ken Huang <kenbshuang@google.com> wrote:
> 
> > From: Adrian Salido salidoa@google.com
> >
> > Some displays may support Low Power modes, however, these modes may
> > require special handling as they would usually require lower OPR
> > content on framebuffers.
> 
> I'm not familiar with OPR. Can you explain what it is and what it means
> for user-space?

Also since this is new uapi, I guess best explanation would include the
userspace code that makes sensible use of this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
