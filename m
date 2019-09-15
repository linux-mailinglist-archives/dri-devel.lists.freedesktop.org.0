Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B489B30DA
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 18:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F98A89798;
	Sun, 15 Sep 2019 16:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA7A89142
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 16:26:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v24so3890776ljj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 09:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSRXNFoOnxT83Q4uEqJAhbXNykBDhgkHdJqzn7eYJbw=;
 b=Uov5TwH9iN3DdFi5wOSKKu3+oft2Q1rzwx9uOyxE+pq4bJpM0wbA9iTkgcOxcMj8Jn
 eEw3A1RlP+OKEMmj0K3lC3mW1ASSKSDW6Odqyxy7mEnT/50zZx0q1Thokh0XFrFdRuVI
 mad609MTNXtvwfcM3Ro4WbNegiT8D9AYgxCnlCFInx0ZDFBYqvwUTp3UMK0tO/e3mHtP
 zBOR2upnCOJJgNOOSvPYpmtCezE4mcwsw/OUynQDtyw3ttCEZM7iPzzNQ/9Nh2sXDKSx
 jx0DaefaIGn6qIn0ml2DouPicIm1OO2OGUklSr2G97nuVT6ociVe4+LNKRhG5HIsCF/T
 Gl4Q==
X-Gm-Message-State: APjAAAWl/hQornR4C/11YjxiFRyNvfw+7t7vqCwbBUfLOj8dbZJijkOv
 XRIBMyZu40gGwKbIFRfVLu7LDvvK/6Y=
X-Google-Smtp-Source: APXvYqw7mRBhkTItdZR0otpr1K0d/P6nH8RjxavXQhE1RjxMGaeVwDv1LTpZiL8EVbDhTovwW1HOzA==
X-Received: by 2002:a2e:9750:: with SMTP id f16mr2436877ljj.239.1568564801742; 
 Sun, 15 Sep 2019 09:26:41 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id h2sm681068ljm.26.2019.09.15.09.26.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2019 09:26:40 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id c195so10687147lfg.9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 09:26:40 -0700 (PDT)
X-Received: by 2002:a19:741a:: with SMTP id v26mr387146lfe.79.1568564800191;
 Sun, 15 Sep 2019 09:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tws0GHMQd0Byunw3XJXq2vqsbbkoR-rqOxfL3f+Rptscw@mail.gmail.com>
 <CAHk-=wja+f_PCuibu+NqkTD_YL1AY2x4wgX6EwQ3oxCyMTw_9w@mail.gmail.com>
 <CAPM=9tzo2HfwPsffe6wXGsyPhE-G+Ha7gpF=ONWUOLidxefV-Q@mail.gmail.com>
In-Reply-To: <CAPM=9tzo2HfwPsffe6wXGsyPhE-G+Ha7gpF=ONWUOLidxefV-Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Sep 2019 09:26:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whEvtTBXx7No=UMg9gXtqm6gzt3bT960UpoLOctokRB6w@mail.gmail.com>
Message-ID: <CAHk-=whEvtTBXx7No=UMg9gXtqm6gzt3bT960UpoLOctokRB6w@mail.gmail.com>
Subject: Re: drm fixes for 5.3-rc9
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZSRXNFoOnxT83Q4uEqJAhbXNykBDhgkHdJqzn7eYJbw=;
 b=RT6x0zbpw5gGlxXo49Vjm3PD4i2MDTgGda+LlxSnDSs7fdDWeUDCP8oy9xdGhh1c9f
 snEkFY8KRbz0hURGShmMt4eeVgObdBN4dbnlidYjtWJFrGHIUs3oV29CXcxp70TuRIl8
 H14u7j2xbxxex1bJ8krjC72eYs6ZnccC/Wx4k=
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

T24gU3VuLCBTZXAgMTUsIDIwMTkgYXQgODoxMiBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSSd2ZSBiZWVuIG1hbnVhbGx5IHdyaXRpbmcgdGhlIHN1YmplY3Qg
bGluZXMsIHNlZW1zIEkgbmVlZCB0byBmaXggbXkgYnJhaW4uCgpOb3RlIHRoYXQgbXkgImZpbmQg
Z2l0IHB1bGwgcmVxdWVzdHMiIGxvZ2ljIGRvZXNuJ3QgbmVlZCBpdCBpbiB0aGUKc3ViamVjdCBs
aW5lIGF0IGFsbCwgc28gaWYgeW91IGp1c3QgY2hhbmdlIHdoYXRldmVyIHNjcmlwdCB5b3UgdXNl
IHRvCmdlbmVyYXRlIHRoZSBlbWFpbCBib2R5IHRvIGhhdmUgYW4gYWRkaXRpb25hbCAicHVsbCIg
aW4gdGhlcmUKc29tZXdoZXJlLCB0aGF0J3MgcGVyZmVjdGx5IHdvcmthYmxlIHRvby4KCj4gVGhl
IHJlYXNvbiBJIGRvIHRoYXQgaXMgSSBnZW5lcmF0ZSBvbiBvbmUgbWFjaGluZSB0aGUgYm9keSwg
YW5kIHNlbmQKPiBpdCB2aWEgdGhlIGdtYWlsIHdlYnVpIG9uIHdoYXRldmVyIG1hY2hpbmUgSSdt
IHVzaW5nLiBUaGlzIGhlbHBzCj4gYXZvaWRzIGdvb2dsZSB0YWdnaW5nIG15IGVtYWlscyBhcyBz
cGFtIGZvciBnZW5lcmF0aW5nIHRoZW0gdXNpbmcKPiBzb21lb25lIGVsc2VzIHNtdHAgc2VydmVy
cy4gSSBzaG91bGQgcHJvYmFibHkgc2V0dXAgcHJvcGVybHkgc2VuZGluZwo+IGdtYWlsIHRvIGF2
b2lkIHRoYXQuCgpEb24ndCB3b3JyeSB0b28gbXVjaCBhYm91dCBpdCB0b28gbXVjaC4KCkkgX2Rv
XyB0cnkgdG8gYWx3YXlzIHJlYWQgYWxsIG15IGVtYWlsLCBpdCdzIGp1c3QgdGhhdCBJIGZpbmQg
dGhpbmdzCmZhc3RlciB0aGF0IG1hdGNoIHRoYXQgcGF0dGVybi4KCkFuZCBJIGRvbid0IHRoaW5r
IEkndmUgYWN0dWFsbHkgbG9zdCBvbmUgb2YgeW91ciBwdWxsIHJlcXVlc3RzIChrbm9jawp3b29k
KSwgdGhleSBtaWdodCBqdXN0IGVuZCB1cCBkZWxheWVkIGEgYml0LgoKVGhhdCBzYWlkIC0gaGF2
aW5nICJbR0lUIFBVTExdIiBpbiB0aGUgc3ViamVjdCBsaW5lIGlzIGhvdyB0aGUKcHItdHJhY2tl
ci1ib3QgZmluZHMgdGhlIGVtYWlscyB0b28sIHNvIGlmIHlvdSBkbyB0aGUgc3ViamVjdCBsaW5l
CnRoaW5nLCB5b3UnbGwgbm90IG9ubHkgdHJpZ2dlciBteSBzZWFyY2ggdGVybSwgeW91J2xsIGFs
c28gZ2V0IHRoZQpuaWNlIG5vdGlmaWNhdGlvbnMgZnJvbSB0aGUgYm90IHdoZW4gSSd2ZSBwdXNo
ZWQgb3V0IG15IG1lcmdlLgoKICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
