Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E071A7AA1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334C26E053;
	Tue, 14 Apr 2020 12:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9196E053
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:24:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id z6so13742386wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0FDEWVqVz1x771UuIfGETq4wU09dKK2AQm/aWgRNbsQ=;
 b=d2uUj8QMIVNZ3e+9G9z4FAfuvymWHrc8SSWbJ1RdfDkfnnkqMpfTU1Jen1lBU9qnVT
 T7cILEGfn4dgJptteqBz0FTqcj+JRVJuCq1pqNZAmmJbOB6UCdybUOg18YSZUOINbFBQ
 o0Oc2L2+vtQZR8zghdhLV3sFTWmqPGf8gWt5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0FDEWVqVz1x771UuIfGETq4wU09dKK2AQm/aWgRNbsQ=;
 b=PpKa/+ZJ4plMKMGRD7x694XXvYzIlEfwol81IpZjOivCSbU02dYOjt1li8CmZW4Dkl
 4x94r3KSKFjY/WtyfUCDWC3wZziG4eE1ygrJ0/4LbJVf9U2tXLEu4DL1vEx8Ozl8WXAt
 UzCwIPfPVCRgTqbd9KJJiVRHBbb+FPzwQzL7Z/80C7H5SZXVIYj73a8oir5xqF2SY4VR
 dyweihlN/ngCboO8m94NOfwN7XU0QlteStK4CD2Q7sS1oXgpRSgkX87boKym47f/PvOJ
 pSPMXy3lCLcE7/z4k+YjsjDSDziICP+pRZ5NEiAjev4dXqmD5jo8IrhIE0LQGsO/mmGW
 DHYw==
X-Gm-Message-State: AGi0PuaJVDT5u3QOfdhZCLL9ao0Sbqmc4j64349Q08qTy2Wr6tPh3+5q
 Tt3qEMkd7bz9anfaBTr10FQV/vMhqT8=
X-Google-Smtp-Source: APiQypLTcUaAVYGUqgd8v0LtaSxBa2I+B0hhrOT9/qYRgkyXoT63IefCm+om7MGnU0MoqxhwTr69zA==
X-Received: by 2002:a1c:808c:: with SMTP id
 b134mr13151077wmd.131.1586867044877; 
 Tue, 14 Apr 2020 05:24:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w7sm19305309wrr.60.2020.04.14.05.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:24:03 -0700 (PDT)
Date: Tue, 14 Apr 2020 14:24:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <20200414122402.GS3456981@phenom.ffwll.local>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 10:38:37PM +0000, Simon Ser wrote:
> Daniel Vetter, Ville, any thoughts about this?

Magic 8ball says "unclear", and I feel like I keep flip-flopping around on
this.

I think best-case outcome here is that we're a) consistent across
compositors and b) document that consensus in the kernel's uapi section
(for lack of better places).

I'm not hung up on what exactly that consensus should be, as long as it's
a consistent across projects. If you folks can't figure this out I'll do a
live youtube sessions and throw a dice :-P

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
