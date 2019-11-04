Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C907EE94D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 21:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CD46E85C;
	Mon,  4 Nov 2019 20:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8356E85C;
 Mon,  4 Nov 2019 20:16:41 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF012214D9;
 Mon,  4 Nov 2019 20:16:40 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id u22so25863341qtq.13;
 Mon, 04 Nov 2019 12:16:40 -0800 (PST)
X-Gm-Message-State: APjAAAW8whb6QKZBgZa0CNwoVT9q8GbAj+5K5j7YsW5x5gV61U3/B+r7
 1zt/Z7rGv/yfsNwL3rC03ZCCV7pOGT9EHfKYQg==
X-Google-Smtp-Source: APXvYqy+kxc7d1zPxumnx1r5zwDTIWjMhGPQkAnTVZG1ZSfd3bbuuZj04XZHEpVsnCoQLFtXRw797ot2aiv6Oofk5pM=
X-Received: by 2002:ac8:7612:: with SMTP id t18mr14352572qtq.143.1572898600005; 
 Mon, 04 Nov 2019 12:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com>
 <20191031104402.31813-3-kholk11@gmail.com>
 <CAF6AEGv77=zw8GiJOEgg6RkaukxTCGzEd=SdjRr+GLLBdEoRPw@mail.gmail.com>
In-Reply-To: <CAF6AEGv77=zw8GiJOEgg6RkaukxTCGzEd=SdjRr+GLLBdEoRPw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 Nov 2019 14:16:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTigx-=E4YoAjOJ9TtZpnAq6+=5VagMgBSYAxsncYCeA@mail.gmail.com>
Message-ID: <CAL_JsqKTigx-=E4YoAjOJ9TtZpnAq6+=5VagMgBSYAxsncYCeA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: msm/mdp5: Document optional TBU and
 TBU_RT clocks
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572898601;
 bh=b05dXcuuti/YHfLZVAgLW012W4Cd7uwtx+Uv9cfaXV4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LArOh2yqmAOyihXRGKKn9+QglYUNXuVlu87nkkgOJReelq2tk5zQ1PGsOD2RBCj0W
 m4FQlHk2zZ3XW97iLKD86GB5iiuxRjxp0xplNxJZmq/F4BrnAwgbeJ6V/MZ5PHkP4h
 0To4p6vQ+eZi4+o+4w//LD9NTA1z3Y1VVgy5vQcA=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
 Jonathan <jonathan@marek.ca>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMiwgMjAxOSBhdCAxMTo1MyBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gKyBkZXZpY2V0cmVlIGxpc3QKCkl0IG5lZWRzIHRvIGJlIHJlc2Vu
dCB0byBnZXQgaW50byBteSBxdWV1ZS4KCj4gT24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMzo0NCBB
TSA8a2hvbGsxMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxraG9sazExQGdtYWlsLmNvbT4KPiA+Cj4gPiBUaGVzZSB0d28gY2xvY2tz
IGFyZW4ndCBwcmVzZW50IGluIGFsbCB2ZXJzaW9ucyBvZiB0aGUgTURQNSBIVzoKPiA+IHdoZXJl
IHByZXNlbnQsIHRoZXkgYXJlIG5lZWRlZCB0byBlbmFibGUgdGhlIFRyYW5zbGF0aW9uIEJ1ZmZl
cgo+ID4gVW5pdChzKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERl
bCBSZWdubyA8a2hvbGsxMUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQgfCAyICsrCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cgo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQKPiA+IGluZGV4IDRlMTEzMzg1NDhhYS4uNDNk
MTEyNzljOTI1IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbXNtL21kcDUudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQKPiA+IEBAIC03Niw2ICs3Niw4IEBAIFJl
cXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgT3B0aW9uYWwgcHJvcGVydGllczoKPiA+ICAtIGNsb2Nr
LW5hbWVzOiB0aGUgZm9sbG93aW5nIGNsb2NrcyBhcmUgb3B0aW9uYWw6Cj4gPiAgICAqICJsdXQi
Cj4gPiArICAqICJ0YnUiCj4gPiArICAqICJ0YnVfcnQiCj4gPgo+ID4gIEV4YW1wbGU6Cj4gPgo+
ID4gLS0KPiA+IDIuMjEuMAo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
