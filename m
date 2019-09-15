Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B62B30A6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 17:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C11A6E08A;
	Sun, 15 Sep 2019 15:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB286E08A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 15:12:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h2so24902765ljk.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 08:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAx9CazxVD+2EMzZ/lZkcxY69ny3xVHSpQj5D2mK4Uw=;
 b=BaScd4CohOUVsnYv39ZHx+UoADCciPotUspbAn+2yWF/pvdE6k5fcre7A5QKj/LiHy
 JuTce/h69gtRulbVPxd11yf0bFYK3m2N17g13mSBShkkCgJ1JBm7p4yhm23LpXtMSqvJ
 22dKjzZWiEr8hZEqBSMwLikPOG7BxqwDd57NOEeVJ04eNzMMiJnzwKlgfkANOelo0TMK
 sRszksB9HC7qPSuFoFCjBeaLbV4b84zduO1L6TDUct9zWhfG6MPnQQxWrdOVo8pDFZwI
 2t4quDn6yYXdn2DSmSIroy0UuyTjeDd9ZdHlfLZ82/gZhfzzS8X6Jvf/Nmnp626Mejcv
 4Bog==
X-Gm-Message-State: APjAAAVsOblDWveYBFfSNo0mzzrTo7eUxn1VcRMohODNvejwxYFcorU0
 DE5EDIK/ktyN5dbEzSIsQGcM2ef52RlkXElsvdLNDw==
X-Google-Smtp-Source: APXvYqwr95m+GptBpafCvbvDk9od9USENUa3h2bzPgCqbJySv3j0EJpADl5I4kac6CF3+FkpCUGWJYEvBoYOqrMGnsQ=
X-Received: by 2002:a2e:95cd:: with SMTP id y13mr34653420ljh.188.1568560361938; 
 Sun, 15 Sep 2019 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tws0GHMQd0Byunw3XJXq2vqsbbkoR-rqOxfL3f+Rptscw@mail.gmail.com>
 <CAHk-=wja+f_PCuibu+NqkTD_YL1AY2x4wgX6EwQ3oxCyMTw_9w@mail.gmail.com>
In-Reply-To: <CAHk-=wja+f_PCuibu+NqkTD_YL1AY2x4wgX6EwQ3oxCyMTw_9w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 16 Sep 2019 01:12:30 +1000
Message-ID: <CAPM=9tzo2HfwPsffe6wXGsyPhE-G+Ha7gpF=ONWUOLidxefV-Q@mail.gmail.com>
Subject: Re: drm fixes for 5.3-rc9
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zAx9CazxVD+2EMzZ/lZkcxY69ny3xVHSpQj5D2mK4Uw=;
 b=Mr5ayy0/TC7tpybu8laITyS6x6IHn/pnad7LiWUGnFq4l9zP8FJPBC2PgQoVnuTECg
 l0atzS7DZ0YR7binUwjXXfFDtw2AIfuGPLcZhpKHHOQMgyuypGe0OJtg0UsDVEa2vo2X
 pisSnLD6s53uOiDcrVzoDWT2CFuQPMrf4wGHczm3k+2XASjNc+TTzP8T+/Or5F8P3pIK
 y5Q19ukwYmt8ebECJ1mQhDr4VyxpLk7qAMWqBk/vGDe7hJmqq0i/4fPuliUcDDowxUyJ
 1otchPoR+K3Tb4DxAACRU027rhO1ZeO/Q2YPT+io687FcQwts7aXohwQvnkmx5ss5RIn
 KSJA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxNSBTZXAgMjAxOSBhdCAwNDo1OCwgTGludXMgVG9ydmFsZHMKPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDEyLCAyMDE5IGF0IDg6
NTYgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIZXkg
TGludXMsCj4gPgo+ID4gRnJvbSB0aGUgbWFpbnRhaW5lciBzdW1taXQsIGp1c3Qgc29tZSBsYXN0
IG1pbnV0ZSBmaXhlcyBmb3IgZmluYWwsCj4gPiBkZXRhaWxzIGluIHRoZSB0YWcuCj4KPiBTbyBi
ZWNhdXNlIG15IG1haWxib3ggd2FzIG1vcmUgdW5ydWx5IHRoYW4gbm9ybWFsIChiZWNhdXNlIG9m
IHNhbWUKPiBtYWludGFpbmVyIHN1bW1pdCB0cmF2ZWwpLCBJIGFsbW9zdCBtaXNzZWQgdGhpcyBl
bWFpbCBlbnRpcmVseS4KPgo+IFdoeT8gQmVjYXVzZSB5b3UgZG9uJ3QgaGF2ZSB0aGUgbm9ybWFs
ICJnaXQgcHVsbCIgYW55d2hlcmUgaW4gdGhlCj4gZW1haWwsIHNvIGl0IGRvZXNuJ3QgdHJpZ2dl
ciBteSBzZWFyY2ggZm9yIGltcG9ydGFudCBlbWFpbHMuCj4KPiBUaGVyZSdzIGEgImdpdCIgaW4g
dGhlIGVtYWlsIGJvZHksIGJ1dCB0aGVyZSdzIG5vdCBhICJwdWxsIiBhbnl3aGVyZS4KPiBDb3Vs
ZCB5b3UgYWRkIGVpdGhlciBhICJwbGVhc2UgcHVsbCIgb3Igc29tZXRoaW5nIHRvIHRoZSBlbWFp
bCBib2R5IC0KPiBvciB0byBtYWtlIHRoaW5ncyBfcmVhbGx5XyBvYnZpb3VzLCBhZGQgdGhlICJb
R0lUIFBVTExdIiBwcmVmaXggdG8gdGhlCj4gc3ViamVjdCBsaW5lPyBPciBhbnl0aGluZywgcmVh
bGx5LCB0byB3aGF0ZXZlciBzY3JpcHQgb3Igd29ya2Zsb3cgeW91Cj4gdXNlIHRvIGdlbmVyYXRl
IHRoZXNlPwoKSSd2ZSBiZWVuIG1hbnVhbGx5IHdyaXRpbmcgdGhlIHN1YmplY3QgbGluZXMsIHNl
ZW1zIEkgbmVlZCB0byBmaXggbXkgYnJhaW4uCgpUaGUgcmVhc29uIEkgZG8gdGhhdCBpcyBJIGdl
bmVyYXRlIG9uIG9uZSBtYWNoaW5lIHRoZSBib2R5LCBhbmQgc2VuZAppdCB2aWEgdGhlIGdtYWls
IHdlYnVpIG9uIHdoYXRldmVyIG1hY2hpbmUgSSdtIHVzaW5nLiBUaGlzIGhlbHBzCmF2b2lkcyBn
b29nbGUgdGFnZ2luZyBteSBlbWFpbHMgYXMgc3BhbSBmb3IgZ2VuZXJhdGluZyB0aGVtIHVzaW5n
CnNvbWVvbmUgZWxzZXMgc210cCBzZXJ2ZXJzLiBJIHNob3VsZCBwcm9iYWJseSBzZXR1cCBwcm9w
ZXJseSBzZW5kaW5nCmdtYWlsIHRvIGF2b2lkIHRoYXQuCgpEYXZlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
