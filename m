Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52B3742E8
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB706EC2C;
	Wed,  5 May 2021 16:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6936E4D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 16:48:40 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id a2so2134995qkh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bJyAQJh+PtsWDNOdYPUXvuq7a52Vhqk+lUePpGWOGok=;
 b=nswP08mlSq80676LHuzrJQsUPAwIf8U/56xgBNHF4yQu2PNh4qSXxYpYN7BC1+MPBf
 q/4yvaMfictQxW7s83wHgZy6h1GisUI3olUuOCgy4OM0s+KP1/yxyhCjPmmVzKK+UVwo
 nFfhiEDgDClNO480zEsan71VUOqLMNjY4mBwU0RsN0Lh7rVfHFAMen9FmU+SOzJD22SH
 AT6qw0dxWqGXpUD7jqxf0m6fLUnpr+iiPbDACdmUhqFL7oxMkWE/PsGJ/FiQrmumaPNj
 vm8TIM8O6hwHVBi1kLDWeg7mVl6O1J68u03Vsd4ey9i9K/XXY3YTmNZ0lUQIyS+TAPJr
 346A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bJyAQJh+PtsWDNOdYPUXvuq7a52Vhqk+lUePpGWOGok=;
 b=Ca17HhdpT+jyGBoZgBhugrHKdm7uwUoCyZAZsnSlSSbNpITZZFKyZI4/V/IbdSo/3B
 1YkfBT+dZcYvksL/DWKlQ39+wrvLigi3yVHXbhWMyI3Ola20DGNTVqFNNwXgcE6h7ift
 +RIALGP5sKTCsedlLl6uNoUqY8qnYFbphxgefVO7y0j6CvuCm1+6YoMK5Ee0mmyyjcBI
 j4X1cC5ig/yRGCA+l3t6MbxJME0rfohbvcL8h/NhSHitxVwi/EpjT7oAyFDOFp3RCipT
 qltgTpPwYaZfiQ/Q2Lq5OsisZgepC45kqotnL57Y3U9Jz09nVLhsbQvW26rXiOclPHmY
 5jfw==
X-Gm-Message-State: AOAM530giETfPlH4eBE+nXDIS14sDpxj/uXvZQu0BF7z238Z7aw1kHZw
 wrR8NaGNiPU+/A9hajTy8b4X0EjLGeQFyDbrjVc=
X-Google-Smtp-Source: ABdhPJyb6nyBY9TNKCNd6HLR2pCRONHSMbTQ4YMSIbCVQpdQ4bNJJ6+WlnWXLWuPz5Q/q5kJvzaN7PCnAT9/wwJH4yo=
X-Received: by 2002:a37:9d58:: with SMTP id g85mr18878392qke.426.1620233319655; 
 Wed, 05 May 2021 09:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-8-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-8-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 May 2021 17:48:13 +0100
Message-ID: <CAM0jSHMR-7KVtm49BfqOGHbvPmBcsDgo7NLMM2SvMEHDwii0pA@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm/amdgpu: revert "drm/amdgpu: stop allocating
 dummy GTT nodes"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMCBBcHIgMjAyMSBhdCAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVFRNIGlzIGdvaW5nIHRvIG5lZWQg
dGhpcyBhZ2FpbiBzaW5jZSB3ZSBhcmUgbW92aW5nIHRoZSByZXNvdXJjZQo+IGFsbG9jYXRpb24g
aW50byB0aGUgYmFja2VuZC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQWNrZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5h
dWxkQGludGVsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
