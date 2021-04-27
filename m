Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49836CB38
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 20:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6C36E175;
	Tue, 27 Apr 2021 18:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7EE6E175;
 Tue, 27 Apr 2021 18:38:48 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g14so11488982edy.6;
 Tue, 27 Apr 2021 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=83khRmU3oaDZQ0Eas5rcgIOKcoPuxS3zDWljB+YYJKI=;
 b=ofVltSEgNN10d5nvHgm7zdXo6SlNvaVzXCyq776HW3jE/Bjo/6ArHPJic/8jy9D+Yi
 FCn63V+1rS2DBir43bwWgBk9UDUBq90pKCxAnSzcTM922lHH+Hrn2j0legVTX2rJVa2Q
 YFgprW5TAarcXXONfsvKFmXjYnAJoK1twY1jyVxNIU5p8FCM73Erewb83JzGV4Zkzp3d
 z6Ce9qbospodp1p3chIw/lo79DhMjpLnz6J0oGLFrnet9ulcrfdbk8NBYQqVZo5I5xeh
 E4Er/QUcVFle4xKfa/Ba22vmYBKfTiPTjBo4AHObBKZbS3MWxTgv0+03cR1XsPDsi7N8
 vuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=83khRmU3oaDZQ0Eas5rcgIOKcoPuxS3zDWljB+YYJKI=;
 b=pzmoqK/fOJvA+yuYUsGm0HaJI/txds8tmKI/87YRUGkomWy42Rl7ciudxrfCqxLbQd
 huhG+EKYsjdtYjiF67lD+17/vmUvgxDydEGYSw1ELS8la5hqkOdYcCwwoGDPNSLXswu1
 Qv5XlmI/pQ7nzaRmUTojQ/X8eGp2VkDjN7NrmSHJTw+hwPcm/IznRFLtmXBw29SqJ6nq
 ATxoZaHoDqJjLZfFLHZqXNcK9XAVo+RVvjqLte21db/1/6zK3DDR30ctMtusuhYpm4KG
 lIejURjpPvxGzILyfjmN3NTTBc1PBPIlDYLZWeh8knPyBCa5dphUlp9I4DcLGInrQCuH
 haUw==
X-Gm-Message-State: AOAM532cdqEPGKUyPYUgjs9rcoGHRaEskvodzQpHHC6NNKAxYFD3SjWs
 N6rMxxvaKoVRQXohprvpFXtzzTwRhGaXzAPZcu4=
X-Google-Smtp-Source: ABdhPJyc2iyRkRYnpmbnl+Bn2XEC6NzwI2FW9EHYUNU3rdf3fm8Ov5WAiRzzzwVxfelPhb6opIVTJ+aRc4w8hlCXMY8=
X-Received: by 2002:a05:6402:1d3b:: with SMTP id
 dh27mr6140353edb.220.1619548726905; 
 Tue, 27 Apr 2021 11:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
In-Reply-To: <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 28 Apr 2021 04:38:35 +1000
Message-ID: <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNyBBcHIgMjAyMSBhdCAyMjowNiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ29ycmVjdCwgd2Ugd291bGRuJ3Qg
aGF2ZSBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiBkZXZpY2Ugd2l0aCBhbmQgd2l0aG91dCB1c2Vy
IHF1ZXVlcyBhbnkgbW9yZS4KPgo+IFRoYXQgY291bGQgb25seSBiZSBhIHByb2JsZW0gZm9yIEEr
SSBMYXB0b3BzLgoKU2luY2UgSSB0aGluayB5b3UgbWVudGlvbmVkIHlvdSdkIG9ubHkgYmUgZW5h
YmxpbmcgdGhpcyBvbiBuZXdlcgpjaGlwc2V0cywgd29uJ3QgaXQgYmUgYSBwcm9ibGVtIGZvciBB
K0Egd2hlcmUgb25lIEEgaXMgYSBnZW5lcmF0aW9uCmJlaGluZCB0aGUgb3RoZXI/CgpJJ20gbm90
IHJlYWxseSBsaWtpbmcgd2hlcmUgdGhpcyBpcyBnb2luZyBidHcsIHNlZW1zIGxpa2UgYSBpbGwK
dGhvdWdodCBvdXQgY29uY2VwdCwgaWYgQU1EIGlzIHJlYWxseSBnb2luZyBkb3duIHRoZSByb2Fk
IG9mIGRlc2lnbmluZwpodyB0aGF0IGlzIGN1cnJlbnRseSBMaW51eCBpbmNvbXBhdGlibGUsIHlv
dSBhcmUgZ29pbmcgdG8gaGF2ZSB0bwphY2NlcHQgYSBiaWcgcGFydCBvZiB0aGUgYnVyZGVuIGlu
IGJyaW5naW5nIHRoaXMgc3VwcG9ydCBpbiB0byBtb3JlCnRoYW4ganVzdCBhbWQgZHJpdmVycyBm
b3IgdXBjb21pbmcgZ2VuZXJhdGlvbnMgb2YgZ3B1LgoKRGF2ZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
