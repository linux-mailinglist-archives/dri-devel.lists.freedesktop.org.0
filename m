Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B523BCD3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 17:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8703D6E2B2;
	Tue,  4 Aug 2020 15:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98636E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 15:01:14 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8097E208A9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596553274;
 bh=iTbEpo6hT4ij3tiFeBOJjmAYZg4kRV7aj9Emq+WzyNA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=y6jdF2/fPzm+oVlUu5TOqjL6vqTqk7bQIiPhw6vpc9F+Oeoa+Xm2x90VbQrFtJOhL
 ja7uWx9kM2sRjjqjFYipGu8Xwlp99RV1VnwQ04/TRnyC7Xp+3IWEpcmBPyf3SdWasN
 LpyZ5WRrTa1743/14iEjpAOXEs2BrctkqzUOBOVI=
Received: by mail-ej1-f46.google.com with SMTP id m19so2283330ejd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 08:01:14 -0700 (PDT)
X-Gm-Message-State: AOAM533WCb5qMsXk/csw1Lxuc9qs+8QN8kL1MgHPEZMHpY8sWa1Hu1TZ
 zvSVccV68okVMVg8hEvQxgthE01xNg8+LyMxyQ==
X-Google-Smtp-Source: ABdhPJzJB/NAHbkY8K8FLXLQQxOKbF0xJx2EWEaw7fMZkjsTp92jQYxuFQfO/ANYXKnrA0eT795Wd5eXvPx0hCw5G9Q=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr1337420ejk.94.1596553273100; 
 Tue, 04 Aug 2020 08:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-2-linux@fw-web.de>
 <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
 <trinity-5e5aa82a-c026-4138-9f33-d3776710eb47-1596552262328@3c-app-gmx-bap28>
In-Reply-To: <trinity-5e5aa82a-c026-4138-9f33-d3776710eb47-1596552262328@3c-app-gmx-bap28>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 23:01:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__0HjikMH1iTJOkvt6fYXSao75GQQbVPL75vmVn+hpp5g@mail.gmail.com>
Message-ID: <CAAOTY__0HjikMH1iTJOkvt6fYXSao75GQQbVPL75vmVn+hpp5g@mail.gmail.com>
Subject: Re: Re: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaWvCAyMDIw5bm0OOac
iDTml6Ug6YCx5LqMIOS4i+WNiDEwOjQ05a+r6YGT77yaCj4KPiBIaSwKPgo+ID4gR2VzZW5kZXQ6
IERpZW5zdGFnLCAwNC4gQXVndXN0IDIwMjAgdW0gMTY6MzQgVWhyCj4gPiBWb246ICJDaHVuLUt1
YW5nIEh1IiA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4KPiA+ID4gLXN0YXRpYyBjb25zdCBl
bnVtIG10a19kZHBfY29tcF9pZCBtdDI3MTJfbXRrX2RkcF9tYWluW10gPSB7Cj4gPiA+ICtzdGF0
aWMgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQyNzEyX210a19kZHBfbWFpbltdID0gewo+ID4KPiA+
IFdoeSBkbyB5b3UgcmVtb3ZlICdjb25zdCc/Cj4KPiB3YXMgcmVtb3ZlZCBieSBwcmV2aW91cyBw
YXRjaCBhbmQgbm90IHJlLWFkZGVkIChyZXZlcnQgZmFpbGVkKSwgc29ycnkuIHdpbGwgZml4IGlu
IG5leHQgdmVyc2lvbiwgaWYgYWxsIG90aGVyIGlzIG9rLgoKYWxsIG90aGVyIGlzIG9rLgoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiByZWdhcmRzIEZyYW5rCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
