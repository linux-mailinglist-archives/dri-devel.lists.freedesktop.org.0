Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889C44684C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 19:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C63E6E329;
	Fri,  5 Nov 2021 18:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DA96E329
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 18:13:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7225457wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 11:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OiHRBkSS5KKLiCHwIOnYxQWh8TFH1YXomOzcC5slsgM=;
 b=HvmOeLzoSeSJNJ19oWBnRi6gr+t06mEQYB6zMXRZBYMqsnQRBzcWRo8fo4JUxjyfSK
 hyQp41BegoBBGMngd75TTpleyTxQVoP5zzayHqdyBUQ7SJVoowVcfgIIylYdVRQsLyDZ
 gG4X25+VL0xsrvKYKVaelZBEl44hUwBl9Xpko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OiHRBkSS5KKLiCHwIOnYxQWh8TFH1YXomOzcC5slsgM=;
 b=LTKaVpPYt/+DWNlLm7agEVXJ684oDKxpfAXHmF1XSC8ijrxXkHYP0WTbkobbUQcDjD
 1Z/d8butzoomOyKU2+nkB3a4/APlyHf/uGGdGJOXFDd3I3u6D/sicFG1X5nLnXrFD5qz
 cMS76r5INtyyJPRYKF5y9vKQcvQVQF2mZfdZPwAy+V3/dQjBsw0euR66DTvm2J0ICKMa
 iJ6CdOhAqGYhCI3OpWw5Ww6vFPHuzJ2eV4rqoRlEICRRSow+VprsNsjJ7k/bUJNT/hCa
 j6jcH8wwYsxHfNyQ0TpC/FkQLdGrofINylWTW421IroXOaykhHEIm2Y80nNC2c9jG35n
 wfSQ==
X-Gm-Message-State: AOAM532bkbb6esbToDZPHcE9glzhjqR2s3qzQRZtDCKGLLMM0qj+hFW8
 rpFsxz7lVrVXFXVbsdSyim/h8qUbrd1pMA==
X-Google-Smtp-Source: ABdhPJzXovUofSxSCkPPi1A4DcBEPyb3pRekMeLyX7q9OilMvbUw3waUcRNlZ+LnsCb6VwcCQrGhcA==
X-Received: by 2002:a7b:cc1a:: with SMTP id f26mr32069427wmh.39.1636136029461; 
 Fri, 05 Nov 2021 11:13:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u16sm11191365wmc.21.2021.11.05.11.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 11:13:48 -0700 (PDT)
Date: Fri, 5 Nov 2021 19:13:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: Questions about KMS flip
Message-ID: <YYV0W1CxT5torU7u@phenom.ffwll.local>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 12:44:34PM -0400, Harry Wentland wrote:
> +Nick
> 
> It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.

Yup plane state holds reference for its entire existing (well this holds
in general as design principle for atomic state structs, just makes life
easier). And the plane state is guaranteed to exist from when we first pin
(prepare_fb plane hook) to when it's getting unpinned (cleanup_fb plane
hook).

Out of curiosity, what's blowing up?
-Daniel

> 
> Harry
> 
> On 2021-11-04 08:51, Christian König wrote:
> > Hi guys,
> > 
> > adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
> > 
> > We are running into warning backtraces from TTM which look more than odd.
> > 
> > Thanks,
> > Christian.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
