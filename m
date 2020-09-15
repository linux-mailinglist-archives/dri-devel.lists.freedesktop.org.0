Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C726A6DE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B104989CB2;
	Tue, 15 Sep 2020 14:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAAD89CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 14:12:32 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id z22so5277969ejl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0LTMVllaGQUrq4O3U7e3I3lEAouNpnLBGHC9QWWqnBU=;
 b=D9UCV1fTuCT6BzD7W3Vltcv5wb00mMHlsQGhp834I9hQDOpJESwRrq8SP7WAcIiWVo
 unNOplVmvwxSsbuJFa7Q9JuBNB7eaRXDBKCt8TyGR+bIcRpHnxcCmE478QUWM1nY58zP
 IdSeLNqGa+wuPJz/9nMyhxfCZ95GYsb1tCuUi8EhUx1drrZDD91mlHrIejph+MIFiTI9
 w/OvOeyiKZRbgTSICXZItA2+KmQrDxdn8mgGCf9WhWSFpSGBCZDuQolRlDCCOph9azdV
 BG63QXET/pOiZUgVnG0MtDzOwTZAJxKJBOHhY4QeZFILsdf2ZNUSuyBhQdCs20299vSb
 3y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0LTMVllaGQUrq4O3U7e3I3lEAouNpnLBGHC9QWWqnBU=;
 b=pfPeQg0DG2sWm92/bsoysun3vBH6GkwO+Eww3ly9Gyh8ilo1AyasR3MiljggcWtQDV
 mYx4sRgt8ePk3tnzie2wYFhBFCrsP4jzOYbsH5hXecDIF8G5bZHyP2JVS17nc1uWS5+m
 QSXfSSSBloy+ygYh/QsY0667IranZqSkevqo6vAbaFOPKcDYDTX8vsnkGkNZse1rfY70
 yIYIeAgI5Wa1Buh0myM/t/ia3iTABO27ObxavygdagBuTRG+RgdSXbE8+yBNteRmcOhi
 zXyeh7ZtlR5Dqu6f3nx+QF5pcHJQBeeD8NMVIhft1vCK9TIBvW6v6DujSCQV8F4UvWuC
 lpoQ==
X-Gm-Message-State: AOAM5312m5Wnw8qxv1nf4ueXJY/AWFbhC3TXAiZGFYJplPj60WvD+Z+e
 ASeVufpEDkzkUZafWmumLP4i5W1oW7XSVw==
X-Google-Smtp-Source: ABdhPJysqYn3i+0p2aYVBsxuWPR7eEldwLKh3b/8VSGO9DqRk8uCDrh1Zq6aIgostMz9wuTZosnI4w==
X-Received: by 2002:a17:906:f11:: with SMTP id
 z17mr20951276eji.88.1600179150790; 
 Tue, 15 Sep 2020 07:12:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q12sm10349145edj.19.2020.09.15.07.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 07:12:30 -0700 (PDT)
Subject: Re: some half-baked ttm ideas
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
Date: Tue, 15 Sep 2020 16:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

I think we should just completely nuke ttm_tt_bind() and ttm_tt_unbind() 
and all of that.

Drivers can to this from their move_notify() callback now instead.

Regards,
Christian.

Am 15.09.20 um 07:30 schrieb Dave Airlie:
> Hi Christian,
>
> I've been trying to move towards the idea of not having TTM manage the
> global TT, I'm still not sure what the result would look like so I've
> been randomly trying out a direction or two,
>
> There are some patches in :
> https://github.com/airlied/linux/commits/ttm-half-baked-ideas
>
> a) it splits use_tt into two flags, one for system memory backing and
> one for binding, and tries to use them correctly.
> b) adds cpu_pin/unpin hooks for the amdgpu/radeon drivers to use for userptr.
>
> I sort of envision being able to set the use_tt flag to false for
> drivers who don't want TTM to maintain their global TT, but I'm still
> not certain how that would look, I'd welcome any input there.
>
> Thanks,
> Dave.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
