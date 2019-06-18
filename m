Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A740C4AB17
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D806E22C;
	Tue, 18 Jun 2019 19:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346616E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:42:29 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z15so10175041lfh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q08rZ0X+Ov5vOjpKcso1J6VhCLbDm3HgCEkEWd07xxo=;
 b=h/aH01ONFdCS5Jmg6Pk0sVcqL3mqZtpyQ2h7By7llS30C/4FBhnvscGX+GAhiuX368
 SflbkzDq8rrxd3CElpELqp1LgZPQEFlND4vk2r5C3/rcPAvgHT7GyMi56OKExr8pRTSf
 w13Yk/bMRroC5mOMIky4h/vHHqY+a/sQ7m4wgph0byMmpyWU7EYg+Kvb/qr+L5HinGdG
 ec+gCvexkbe11DinCOd1H1Wzzt8QHomgFbWPc6rejQZ+sEV3X+sG5S2f51KSTPvps4UQ
 d+LCKukSn+SeJrowtfYLixMY7RAQEXQ8SsEGN6R2TJuy7ZWLW1gXoumqb311s5uUcuXg
 diuA==
X-Gm-Message-State: APjAAAXlolHp4604tM4/yQP3Rvx9LN1kc2yWFE4/Y5AYTBH09GkjXEVu
 tbqQGr2TFERBIDIt9//t4mTqwEPiFeKJBrLBH+E=
X-Google-Smtp-Source: APXvYqwB5RgvOwx19Wp+XPSdeq35NuZyVspyT4CVorisn26c8ApQXUNOfEesJrnKm1xjasZbN68VV0Zr1kq7LxbYBls=
X-Received: by 2002:a19:ed0c:: with SMTP id y12mr56929559lfy.191.1560886947247; 
 Tue, 18 Jun 2019 12:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175238.8060-1-andresx7@gmail.com>
In-Reply-To: <20190613175238.8060-1-andresx7@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Jun 2019 05:42:15 +1000
Message-ID: <CAPM=9twKQrzgQkyETAm-D67kOA-s4CEZ+=xTNgMCCFCNDSBEOg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edid: parse CEA blocks embedded in DisplayID
To: Andres Rodriguez <andresx7@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Q08rZ0X+Ov5vOjpKcso1J6VhCLbDm3HgCEkEWd07xxo=;
 b=SY6Uwf4CFoK+GVGOwwx3bFvfAOD8oOcfxkuupkV9QFoAvSU5IvfRz2O4DnzNgOKdpv
 pAegD4Ghl4TB4XflYSFbA8/svHl+VGuHcp8qPWYc1QIhTz3+/Sg0Uy6Fj8wmPJQg2Fjd
 Tb/c/j30GQamvsziD6WTfNkyYSgsU3tse85HvHE9DMJczfJA5VS4jOC9x+xVZYcZ/vYP
 3ruP+bvFh7uAHbC5GDc2NIe18xM9Vf6vsDqmsbWIdBeJybgcdXAVfLgbhEBm97revReZ
 vh/zKbYwxSSRddMlet2JmI6fLil2c/FVeBSvqMuNHL65/G850+d9l4qpsjyVTFaBIVMC
 Fe7g==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSBhdCAwMzo1MiwgQW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdA
Z21haWwuY29tPiB3cm90ZToKPgo+IERpc3BsYXlJRCBibG9ja3MgYWxsb3cgZW1iZWRkaW5nIG9m
IENFQSBibG9ja3MuIFRoZSBwYXlsb2FkcyBhcmUKPiBpZGVudGljYWwgdG8gdHJhZGl0aW9uYWwg
dG9wIGxldmVsIENFQSBleHRlbnNpb24gYmxvY2tzLCBidXQgdGhlIGhlYWRlcgo+IGlzIHNsaWdo
dGx5IGRpZmZlcmVudC4KPgo+IFRoaXMgY2hhbmdlIGFsbG93cyB0aGUgQ0VBIHBhcnNlciB0byBm
aW5kIGEgQ0VBIGJsb2NrIGluc2lkZSBhIERpc3BsYXlJRAo+IGJsb2NrLiBBZGRpdGlvbmFsbHks
IGl0IGFkZHMgc3VwcG9ydCBmb3IgcGFyc2luZyB0aGUgZW1iZWRkZWQgQ1RBCj4gaGVhZGVyLiBO
byBmdXJ0aGVyIGNoYW5nZXMgYXJlIG5lY2Vzc2FyeSBkdWUgdG8gcGF5bG9hZCBwYXJpdHkuCj4K
PiBUaGlzIGNoYW5nZSBlbmFibGVzIGF1ZGlvIHN1cHBvcnQgZm9yIHRoZSBWYWx2ZSBJbmRleCBI
TUQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXMgUm9kcmlndWV6IDxhbmRyZXN4N0BnbWFpbC5j
b20+Cj4gLS0tCj4KPiB2MjogUmV2aWV3IGZlZWRiYWNrIGZyb20gSmFuaS4KPgo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyAgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9kaXNwbGF5aWQuaCB8IDEwICsrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCkkgdGhpbmsgdGhp
cyBpcyBmaW5lLCBzaW5jZSB5b3UgbWlnaHQgd2FudCB0byBjYyBzdGFibGUgYXBhcnQgZnJvbSB0
aGUKY29tbWVudCBiZWxvdy4KCmhvd2V2ZXIgYSBmb2xsb3cgdXAgcGF0Y2ggdG8gdXNlIGZvcl9l
YWNoX2Rpc3BsYXlpZF9kYiBpbiBhIGZldyBtb3JlCnBsYWNlcyBtaWdodCBiZSBnb29kLgoKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCj4gaW5kZXggNjQ5Y2ZkOGI0MjAwLi44ZWNkN2Y3MDgyNWQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYwo+IEBAIC0xMzM5LDYgKzEzMzksOCBAQCBNT0RVTEVfUEFSTV9ERVNDKGVkaWRf
Zml4dXAsCj4KPiAgc3RhdGljIHZvaWQgZHJtX2dldF9kaXNwbGF5aWQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZWRpZCAqZWRpZCk7Cj4gK3N0YXRpYyB1OCAqZHJtX2ZpbmRfZGlzcGxheWlkX2V4dGVuc2lvbihj
b25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCk7CgpJbnN0ZWFkIG9mIGFkZGluZyB0aGF0IGhlcmUsIGkg
dGhpbmsgeW91IGNhbiBtb3ZlCmRybV9maW5kX2NlYV9leHRlbnNpb24gZG93biBiZWxvdyBpdC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
