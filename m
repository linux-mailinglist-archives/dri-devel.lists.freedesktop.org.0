Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6261B7E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136E889C2A;
	Mon,  8 Jul 2019 07:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E467489BE8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 07:58:39 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d17so15273693oth.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 00:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StnBZ5X9IU3YfBiysdeAUKuuUOczu/xn5Tp1Ip5xjbA=;
 b=SACYnN7Bh0WTEOO4eckfEyxF8JFDZFOMx79rx+yZBpu5RI/eH/6pLWu4N9CFqOZkYR
 gAEua+AVt0TMBWmeNsN9hHaKsRWVJR5JazuHr91V2qETv7xmLEVjHfbU4aDAeQGLO4JB
 QtAMOAgiVwuYFh8RhrbWFWgdtVGlG0MqQdiXHJM2+VSudvDsBYskm90iSkZNaaqjErq/
 k16uJ2DOWNF/sQTI917kidQU5BEg72Smeduzz9HsThHunAg+9pZZXxtj8kY3vlddit1m
 JHhVB0dFCWwdPVHxShHmRUeb2J5QE72kUzc73DUvat0rjM8jcfYQGnwhx5a+ZtDhEO/9
 kGCQ==
X-Gm-Message-State: APjAAAUyAejZUnsVndkZUoY+w2ugwZispz1em8QCbHQUAMdrlqbJEhso
 jZIGDKt1jMstOSrwcfe4/0lXoo++qhxEtzf1e94=
X-Google-Smtp-Source: APXvYqzUPRCgrUBw97eCjHFCwkgqypz9WTte0c3NlDtkB2BijxQNV9v4lF/EwkMmVsOxNeMUvOg3BbZciubIJ9wch0I=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr1458564otn.297.1562572719133; 
 Mon, 08 Jul 2019 00:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190706140746.29132-2-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2019 09:58:27 +0200
Message-ID: <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gU2F0LCBKdWwgNiwgMjAxOSBhdCA0OjA3IFBNIEphY29wbyBNb25kaSA8
amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4gd3JvdGU6Cj4gQWRkIGRldmljZSB0cmVlIGJpbmRp
bmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFItQ2FyIERpc3BsYXkKPiBVbml0IENv
bG9yIE1hbmFnZW1lbnQgTW9kdWxlLgo+Cj4gQ01NIGlzIHRoZSBpbWFnZSBlbmhhbmNlbWVudCBt
b2R1bGUgYXZhaWxhYmxlIG9uIGVhY2ggUi1DYXIgRFUgdmlkZW8KPiBjaGFubmVsIG9uIFItQ2Fy
IEdlbjIgYW5kIEdlbjMgU29DcyAoVjNIIGFuZCBWM00gZXhjbHVkZWQpLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IFJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKPiBAQCAt
MCwwICsxLDI1IEBACj4gKyogUmVuZXNhcyBSLUNhciBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAo
Q01NKQo+ICsKPiArUmVuZXNhcyBSLUNhciBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgY29ubmVj
dGVkIHRvIFItQ2FyIERVIHZpZGVvIGNoYW5uZWxzLgo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGll
czoKPiArIC0gY29tcGF0aWJsZTogc2hhbGwgYmUgb25lIG9mOgo+ICsgICAtICJyZW5lc2FzLHJj
YXItZ2VuMy1jbW0iCj4gKyAgIC0gInJlbmVzYXMscmNhci1nZW4yLWNtbSIKCldoeSBkbyB5b3Ug
dGhpbmsgeW91IGRvIG5vdCBuZWVkIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHZhbHVlcz8KV2hh
dCBpZiB5b3UgZGlzY292ZXIgYSBkaWZmZXJlbnQgYWNyb3NzIHRoZSBSLUNhciBHZW4zIGxpbmUg
dG9tb3Jyb3c/CkRvZXMgdGhlIElQIGJsb2NrIGhhdmUgYSB2ZXJzaW9uIHJlZ2lzdGVyPwoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
