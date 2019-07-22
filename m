Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB1870A67
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192D89E35;
	Mon, 22 Jul 2019 20:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB2889E35
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:12:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id g20so76783253ioc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5VssAIpTuFKmj2zUfyBOJyi8Rg6YT/l3GL1/5vXR4ZQ=;
 b=fNByfqsateA7RzdBj/MSZZkScI7m/BZKrOX4Va3Gvf5SVLrhCzLowHmtN+ZM6roPB8
 w95at4YqYu5Q4PHzdo9OvWD3e4qg0tCpJi/6w8iH145ndja/Vex/fso+k6JCY9hK5mvq
 zgk724wuLbkh7+i4y15gm/PrdpfC/7yNlGI19SKGkd5BuLalH+PJlDOIHRB2gKJM0TQq
 Y2Hc5P++0i6RgE2n7IMfIlaLq/IaXXGZm9Jv+RjkGjDBYYl9tvqK27LFrVkpLAJdThau
 uyuSmiKeh9sS/T+gXLOf6JNlXibs82RK7DGVOMd8KyJ8zxfnNLj+Hrw5jkUeSWkWAnQC
 qO5w==
X-Gm-Message-State: APjAAAW1inD1V4oz1or0x3Y9wiMBwNWq8emO+DnXf3oo+hkXlNXpgbNr
 PJzEjXZjwNeHciYgQ0HEp4bSd6MEvWY=
X-Google-Smtp-Source: APXvYqxmiH6Mtcp3P/88JDAS2oygiW17LxEON3JLb8dUp4ySFmIBgLJyRdEnTOTtPilkuGSBjyMRew==
X-Received: by 2002:a6b:f80e:: with SMTP id o14mr64736908ioh.1.1563826374171; 
 Mon, 22 Jul 2019 13:12:54 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id k5sm45638562ioj.47.2019.07.22.13.12.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 13:12:53 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id f4so76820974ioh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:12:53 -0700 (PDT)
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr66758646iok.52.1563826372789; 
 Mon, 22 Jul 2019 13:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190722181945.244395-1-mka@chromium.org>
In-Reply-To: <20190722181945.244395-1-mka@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2019 13:12:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XP=3z9GWPU+K15jmzHeOWT9uzqgaC6zL3M+Wm7b4jOhQ@mail.gmail.com>
Message-ID: <CAD=FV=XP=3z9GWPU+K15jmzHeOWT9uzqgaC6zL3M+Wm7b4jOhQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
To: Matthias Kaehlcke <mka@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5VssAIpTuFKmj2zUfyBOJyi8Rg6YT/l3GL1/5vXR4ZQ=;
 b=dhcAjgoi9+qQzUWcowFh6AlTVc+cXX7gatGHZHks9JeKOOGWGHE25dYo58g5iTWmrD
 3G/gh1KuafpOXHyPB3O9Kx6l0P+HUGpADF788Pho/ArJ54Y6THO8vkWWltGAd20KH+rG
 +YCXOMQ1JrFmhW9LQuw9Gn91Qi5wwFKaVWueo=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxMToxOSBBTSBNYXR0aGlhcyBLYWVobGNrZSA8
bWthQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBUaGUgRERDL0NJIHByb3RvY29sIGludm9sdmVz
IHNlbmRpbmcgYSBtdWx0aS1ieXRlIHJlcXVlc3QgdG8gdGhlCj4gZGlzcGxheSB2aWEgSTJDLCB3
aGljaCBpcyB0eXBpY2FsbHkgZm9sbG93ZWQgYnkgYSBtdWx0aS1ieXRlCj4gcmVzcG9uc2UuIFRo
ZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBvbmx5IGFsbG93cyBzaW5nbGUgYnl0ZQo+IHJlYWRz
L3dyaXRlcyBvciByZWFkcyBvZiA4IHNlcXVlbnRpYWwgYnl0ZXMsIGhlbmNlIEREQy9DSSBpcyBu
b3QKPiBzdXBwb3J0ZWQgd2hlbiB0aGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgaXMgdXNlZC4g
VGhlIEkyQwo+IHRyYW5zZmVycyBjb21wbGV0ZSB3aXRob3V0IGVycm9ycywgaG93ZXZlciB0aGUg
ZGF0YSBpbiB0aGUgcmVzcG9uc2UKPiBpcyBnYXJiYWdlLiBBYm9ydCB0cmFuc2ZlcnMgdG8vZnJv
bSBzbGF2ZSBhZGRyZXNzIDB4MzcgKEREQykgd2l0aAo+IC1FT1BOT1RTVVBQLCB0byBtYWtlIGl0
IGV2aWRlbnQgdGhhdCB0aGUgY29tbXVuaWNhdGlvbiBpcyBmYWlsaW5nLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MjoKPiAtIGNoYW5nZWQgRERDX0kyQ19BRERSIHRvIEREQ19DSV9BRERSCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgOCArKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IDA0NWIxYjEzZmQwZS4uMjg5MzM2MjlmM2M3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBAQCAt
MzUsNiArMzUsNyBAQAo+Cj4gICNpbmNsdWRlIDxtZWRpYS9jZWMtbm90aWZpZXIuaD4KPgo+ICsj
ZGVmaW5lIEREQ19DSV9BRERSICAgICAgICAgICAgMHgzNwo+ICAjZGVmaW5lIEREQ19TRUdNRU5U
X0FERFIgICAgICAgMHgzMAo+Cj4gICNkZWZpbmUgSERNSV9FRElEX0xFTiAgICAgICAgICA1MTIK
PiBAQCAtMzIyLDYgKzMyMywxMyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJjX3hmZXIoc3RydWN0
IGkyY19hZGFwdGVyICphZGFwLAo+ICAgICAgICAgdTggYWRkciA9IG1zZ3NbMF0uYWRkcjsKPiAg
ICAgICAgIGludCBpLCByZXQgPSAwOwo+Cj4gKyAgICAgICBpZiAoYWRkciA9PSBERENfQ0lfQURE
UikKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogVGhlIGludGVybmFs
IEkyQyBjb250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgdGhlIG11bHRpLWJ5dGUKPiArICAgICAg
ICAgICAgICAgICogcmVhZCBhbmQgd3JpdGUgb3BlcmF0aW9ucyBuZWVkZWQgZm9yIEREQy9DSS4K
PiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQ
UDsKPiArCgpJbiB0aGVvcnkgd2UgY291bGQgYWxzbyBzb2x2ZSB0aGlzIGJ5IGRldGVjdGluZyAo
aW4gb3RoZXIgcGFydHMgb2YgdGhlCmZ1bmN0aW9uKSB0aGUgYmFkIG11bHRpLWJ5dGUgcmVhZC93
cml0ZSBvcGVyYXRpb25zLiAgVGhhdCB3b3VsZCBtYXliZQpiZSBtb3JlIGdlbmVyaWMgKEFLQSBp
dCB3b3VsZCBtb3JlIHByb3Blcmx5IGhhbmRsZSByYW5kb20gdXNlcnNwYWNlCnRvb2xzIGZpZGRs
aW5nIHdpdGggaTJjLWRldikgYnV0IGFkZCBjb21wbGV4aXR5IHRvIHRoZSBjb2RlLgoKLi4ucG9z
c2libHkgYSBiZXR0ZXIgbG9uZy10ZXJtIHNvbHV0aW9uIGlzIHRvIGp1c3QgdG90YWxseSBzdG9w
CmVtdWxhdGluZyBhIHJlZ3VsYXIgaTJjIGFkYXB0ZXIgd2hlbiB0aGUgaGFyZHdhcmUganVzdCBk
b2Vzbid0IHN1cHBvcnQKdGhhdC4gIEluIHRoZW9yeSB3ZSBjb3VsZCByZW1vdmUgdGhlICJkcm1f
Z2V0X2VkaWQoKSIgY2FsbCBpbgpkd19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoKSBhbmQgcmVw
bGFjZSBpdCB3aXRoIGEgZGlyZWN0IGNhbGwgdG8KZHJtX2RvX2dldF9lZGlkKCkgaWYgd2UncmUg
dXNpbmcgdGhlIGJ1aWx0LWluIGFkYXB0ZXIuICBQb3NzaWJseQoidGRhOTk4eF9kcnYuYyIgd291
bGQgYmUgYSBnb29kIHJlZmVyZW5jZS4gIElmIHdlIGRpZCB0aGF0LCB3ZSBjb3VsZApyZW1vdmUg
YWxsIHRoZSB3ZWlyZCAvIGhhY2t5IGkyYyBjb2RlIGluIHRoaXMgZHJpdmVyLgoKClNpbmNlIHRo
ZSBiaWdnZXIgY2xlYW51cCBzZWVtcyBsaWtlIGEgYml0IG11Y2ggdG8gYXNrLCBJJ20gT0sgd2l0
aAp0aGlzIGFzIGEgc3RvcGdhcCB0byBhdCBsZWFzdCBwcmV2ZW50IHVzZXJzcGFjZSB0b29scyBm
cm9tIGdldHRpbmcKY29uZnVzZWQuICBUaHVzOgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
