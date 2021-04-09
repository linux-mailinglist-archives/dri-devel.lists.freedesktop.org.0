Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDFE35A1A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 17:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13C86EC30;
	Fri,  9 Apr 2021 15:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEEC6EC30
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 15:04:03 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id y12so4376332qtx.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CN21Yx22tqluTv2eFFOQizY10qMwtRjmlldJWQKijn8=;
 b=JJycN5SqcQMvD15IfxE7z0mePp98Z2QQLPBVgoNEZ0vD5ocdeshVJnHrzJ3Ds41cbJ
 BKegY/uPBJqcV1AnIN/I0YD49/JyyQkNJioHAExvYdhyPfd4fwFPJLygGOXwAW1HK9s2
 1GAYm3OTToltAPgm/u2+1i5Jv5dHSGfuZBLbFBtWtLEfTkG7xK/xtj5/4DNQfybjPArT
 KFEAYrTm1hI8afDgu9aC9xzUPMACYITzYS2XMBnmfDOU4WFSzlapuHgN8uCl6+06DNW2
 3EOA5RlObLjR5g2Lt1cJBD+YosRRMC333Ts7U4BGtCOla16THjSpbAdp6KVyWYLv4pNx
 Drxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CN21Yx22tqluTv2eFFOQizY10qMwtRjmlldJWQKijn8=;
 b=igIqNwoM2P0Kv3ynBM3GmyZNkCALA4iet81V9fa8g3hUxYYpVqCr4Kkh2WOl372r3u
 mX69r+PPTeG277Smib/hQVpRVQV5s9cKJOeKePzYtc4vh3/0qdBJKV3p0QHkhF3OVxpt
 OWXv9t8esVwvYiLU3oX9piloXvIk9iKDVeaNueHs5n283u68maqJHD3UuBvk+DeWZPhR
 dPmIn6fI8IDQxCBYkb4m52xGVBuL2GHJwVu+M55P6CiFwFekhRQZPdHtSJF6tPhzm2xP
 dhk8gWQ8/yPXYfM2xf9E3nNLSK1RJvbrqGAo6DkAeJPK9S/KVyXMlkABeVtOFh7b+/jD
 7/Jg==
X-Gm-Message-State: AOAM533xosBKkQOPvpFjq696opmLBjkzdEs//z9kHWJ6EemQQSeTFAo6
 NCu1lGDl7BDYfOav6aghpPUOu28xZoX7sZht0zsLMQVik/k=
X-Google-Smtp-Source: ABdhPJyIlGp/vJjvHFkpiTUUpxktEjhcClJC2oYxOf2xvPfynf0aWb98e+tHNk/nvDQ0PL8MTVc2ciNKBm7uWLaxRac=
X-Received: by 2002:a05:622a:c:: with SMTP id x12mr1589932qtw.95.1617980643025; 
 Fri, 09 Apr 2021 08:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409130113.1459-1-christian.koenig@amd.com>
 <20210409130113.1459-2-christian.koenig@amd.com>
In-Reply-To: <20210409130113.1459-2-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 9 Apr 2021 16:03:36 +0100
Message-ID: <CAM0jSHM1sWsW9bY7HzEL-15hMBeFnN=OrHu-LEeaOzTVb8z=UQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: re-add debugs tt_shrink file
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA5IEFwciAyMDIxIGF0IDE0OjAxLCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGF0IGdvdCBsb3N0IHdoZW4gd2Ug
bW92ZWQgYmFjayB0byBhIHN0YXRpYyBsaW1pdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcg
QXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
