Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C38E40B8AA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E3C6E5CE;
	Tue, 14 Sep 2021 20:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1410A6E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:03:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l18so738880lji.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z+PxJcPDFHKhLidz43OpQIl4xQ/achkAfQ8Re5y2cOQ=;
 b=fcSz/fDM5ZUPGy3GEMeYii2Mxh/ipolL/v2vDh+qK9ADUjfXlFd3srXHg9A+o8Pmot
 n22YK0z4o/I8BYxXDzQ3BS6AWAC5kHEw+OHh03vX0v2TJL7SqBHx47TacnNtNh92CNRV
 fYIa/5xLSo1HRcb1pxNb1EXaluai7a63A3hPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z+PxJcPDFHKhLidz43OpQIl4xQ/achkAfQ8Re5y2cOQ=;
 b=FJ6LlFEAFtyOhAS4EGWkWxXPOtei3L+oWwbPLu2TXnb8W2dWQG+5IeXefZTECIGj1D
 UVcruPXGOY8z7U4zMI/QlSGIqcgzDxPndRKF7uX/mYdYUbaCbByd4ZKPHe/qUGrrszWZ
 JXmjGrnA5VSPgyEu0grIcUeAkltbsNJg5f2wVAh4VuEdODutXn7XGCf16jmBKMHqoLhk
 Zx478+UMN2KQaGtHeHv2Nn7d/fQN0X33jV1KyoRpuNCsIglWDGZsvMkCd4Gy72kJFgkW
 /YM7v1s4i7wpTs1Do/I6Rpzu5MkkZOFI8CphFucii34aAMXMYt8QNDbvg0pAPv4InGk/
 ZLrA==
X-Gm-Message-State: AOAM530ej/IV/6zTRFEAIJ7JaDC8Gny3HwiQF3Pog/k/vy5ukhw7IPPP
 +ROgtYhcDav5WVaw9ZcFArqYyUCCZdzxvnQKcrY=
X-Google-Smtp-Source: ABdhPJwK3Ijg+SOQfpcBQqrMnVjiBEDpaJwbKhbnFlIzV9wL0C+H8bjLD+P16Uopx0985ty9DxjhKQ==
X-Received: by 2002:a2e:8650:: with SMTP id i16mr17057474ljj.354.1631649807931; 
 Tue, 14 Sep 2021 13:03:27 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id r13sm1396663ljh.61.2021.09.14.13.03.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 13:03:27 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id l11so990845lfe.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:03:26 -0700 (PDT)
X-Received: by 2002:a05:6512:3991:: with SMTP id
 j17mr3057776lfu.280.1631649806277; 
 Tue, 14 Sep 2021 13:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210907100302.3684453-1-ray.huang@amd.com>
 <5e365947-4ae1-47a0-7565-7f0cdde0bd84@amd.com>
 <CADnq5_PXOXiob3k5Z+cZz6K2k5iSCdzwNm0ZxKQOuC+PvdJxxg@mail.gmail.com>
In-Reply-To: <CADnq5_PXOXiob3k5Z+cZz6K2k5iSCdzwNm0ZxKQOuC+PvdJxxg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 13:03:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=rz3trQgOJ76pe1poCtmFkat-Y_Dm9_x=fzb27OszJQ@mail.gmail.com>
Message-ID: <CAHk-=wi=rz3trQgOJ76pe1poCtmFkat-Y_Dm9_x=fzb27OszJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix the type mismatch error on sparc64
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 LKML <linux-kernel@vger.kernel.org>, linux-sparc <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 14, 2021 at 12:48 PM Alex Deucher <alexdeucher@gmail.com> wrote=
:
>
> On Tue, Sep 7, 2021 at 6:25 AM Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> >
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Is one of you going to push this to drm-misc?

I was assuming it was there already.

I guess I'll just apply it directly.

         Linus
