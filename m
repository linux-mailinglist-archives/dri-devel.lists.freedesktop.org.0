Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1323AA90
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 18:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56866E2BE;
	Mon,  3 Aug 2020 16:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62B46E2BE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 16:35:18 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B50820722
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596472035;
 bh=8fGI175POQSwr9vMdcHAJq6mcS1esJVi8AWo2KENfmI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PdX1ab29lzG1sPjm+H96BcPsJTriqK7IyQxiIfS7V5jeLMaEA1FceH6auAq8Y58vC
 DpmuSPvSa9LvqkNK+ktA7f84GAI+UbcvGFa3Bbzf3LInrqFWj9+QKKylcWaPIG2bgh
 l9DrNQp5I/I92OP9QiTCZdRYabluFANNGQAI8WH4=
Received: by mail-ed1-f52.google.com with SMTP id i26so24352085edv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 09:27:16 -0700 (PDT)
X-Gm-Message-State: AOAM530WOo2C+m8NAGYKLFdCzhYYoo+Ks9T7YCsRjkbXDUimu6d1Kuut
 CzOtvDskv0hRdAic9XKnAlcX84hpeC+lLc+lug==
X-Google-Smtp-Source: ABdhPJwmr26tBGfUG3yCzxB5PE+9/jAk8zYgW7Y9t7cMMsNd5KQZVjeCrjk6ur9GXKX0V1tF2H164HYtC3dGBNV7c24=
X-Received: by 2002:a50:ccd0:: with SMTP id b16mr16302641edj.148.1596472035168; 
 Mon, 03 Aug 2020 09:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
 <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
 <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
In-Reply-To: <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 00:27:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
Message-ID: <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDPml6Ug6YCx5LiAIOS4i+WNiDY6NDPlr6vpgZPvvJoKPgo+IEhpCj4gPiBH
ZXNlbmRldDogTW9udGFnLCAwMy4gQXVndXN0IDIwMjAgdW0gMDE6NDcgVWhyCj4gPiBWb246ICJD
aHVuLUt1YW5nIEh1IiA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4KPiA+IE5vdyBJIGp1c3Qg
Y2FyZSBhYm91dCB0aGUgYmxzIHRvIGRwaS4gU28gaW4gbWVkaWF0ZWssZGlzcC50eHQsIHlvdQo+
ID4ganVzdCBuZWVkIHRvIGFkZCBhIE9wdGlvbmFsIHByb3BlcnRpZXMgLSBwb3J0IChpbnB1dCBh
bmQgb3V0cHV0KSwgYW5kCj4gPiBtb2RpZnkgbWVkaWF0ZWssZHBpLnR4dCBmb3IgaXRzIGlucHV0
IHBvcnQuCj4KPiB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSB0aGlzIGlzIGVub3VnaDoKPgo+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRpc3AudHh0Cj4KPiAgICBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS50eHQKPiAgICBmb3IgZGV0YWlscy4KPgo+ICtP
cHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIHBvcnQgKGlucHV0IGFuZCBvdXRwdXQpIHNlZSAuLi8u
Li9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ICsKPiAgRXhhbXBsZXM6Cj4KPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGku
dHh0Ogo+Cj4gIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gIC0gcGluY3RybC1uYW1lczogQ29udGFp
biAiZGVmYXVsdCIgYW5kICJzbGVlcCIuCj4gKy0gcG9ydDogSW5wdXQgcG9ydCBub2RlIHdpdGgg
ZW5kcG9pbnQgZGVmaW5pdGlvbiwgdGhpcyBjYW4gYmUgY29ubmVjdGVkIHRvIDxjaGlwaWQ+LWRp
c3AtcHdtCj4KPiAgRXhhbXBsZToKPgo+IHNob3VsZCBpIGxpbmsgdG8gcHdtL3B3bS1tdGstZGlz
cC50eHQgaW4gZG9jPwo+Cj4gcmVnYXJkcyBGcmFuawoKWWVzLCB0aGlzIGlzIHdoYXQgSSBtZWFu
LCBidXQgSSB0aGluayBpdCBuZWVkIG5vdCBvdXRwdXQgdG8gcG13LgpCdXQgbm93IEkgaGF2ZSBh
IHNvbHV0aW9uIHRoYXQgeW91IG5lZWQgbm90IHRvIG1vZGlmeSBiaW5kaW5nIGRvY3VtZW50LgpC
ZWNhdXNlIG5vdyBtdDc2MjMgaGFzIGEgZGlmZmVyZW50IHJvdXRpbmcgdGhhbiBtdDI3MDEsIGFu
ZCB0aGlzCnBhdGNoJ3MgYXBwcm9hY2ggaXMgdG8gdXNlIGRpZmZlcmVudCBwb3J0IHNldHRpbmcg
aW4gZWFjaCBkZXZpY2UgdHJlZS4KTXkgc29sdXRpb24gaXMgdGhhdCB0aGVzZSB0d28gU29DIGhh
cyBkaWZmZXJlbnQgY29tcGF0aWJsZSBzdHJpbmc6CiJtZWRpYXRlayxtdDc2MjMtbW1zeXMiIGFu
ZCAibWVkaWF0ZWssbXQyNzAxLW1tc3lzIi4gRm9yIG5vdywKIm1lZGlhdGVrLG10MjcwMS1tbXN5
cyIgaGFzIGl0cyBkYXRhIGFzCgpzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJf
ZGF0YSBtdDI3MDFfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Ci5tYWluX3BhdGggPSBtdDI3MDFfbXRr
X2RkcF9tYWluLAoubWFpbl9sZW4gPSBBUlJBWV9TSVpFKG10MjcwMV9tdGtfZGRwX21haW4pLAou
ZXh0X3BhdGggPSBtdDI3MDFfbXRrX2RkcF9leHQsCi5leHRfbGVuID0gQVJSQVlfU0laRShtdDI3
MDFfbXRrX2RkcF9leHQpLAouc2hhZG93X3JlZ2lzdGVyID0gdHJ1ZSwKfTsKCkkgdGhpbmsgeW91
IGNvdWxkIGNyZWF0ZSBhIGRhdGEgZm9yICJtZWRpYXRlayxtdDc2MjMtbW1zeXMiIHdoaWNoIGhh
cwphIGRpZmZlcmVudCByb3V0aW5nLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
