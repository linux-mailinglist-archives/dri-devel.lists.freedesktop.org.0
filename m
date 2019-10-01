Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9BC4851
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391846E8EF;
	Wed,  2 Oct 2019 07:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427096E852
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 16:43:11 +0000 (UTC)
Received: by mail-yw1-xc32.google.com with SMTP id m13so4521273ywa.11
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 09:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdLG/r7+P2Ngh8ZWtcYEEBy7N3f+Jkee88RnUZ/onlY=;
 b=j1P1/olo9h1Kr2tORjwkeKJqLCZ6VoOtcmeYn5SP/r1Kd5uNrwBp+6WR1A/FrePZYE
 H6K962r6k1fpA6vTUjAYa3TkzZJ1EPFQiLnlBYWHGrZYS73W5M14M+q8iFzi6oWmOTiy
 +T2huNhvt0HdiyVvkBFKBes5wZRkGMPT+GnNQqvwna+Uogf5W3msnjZir9QQtPEIukwf
 oouiup3ziZlkSeY19lLIETFCru+VcxwflysmKYqotxNYxHn6Za4ZCoZ5sPxdqW5U5gwM
 mzMxOHDy2cZhZi8GA641aSaCke6WC/JsNNb4XcopZI6a/Aw7TWQHWBt3qCrOCWghJBO8
 h4Nw==
X-Gm-Message-State: APjAAAU+nxn6rAAd/+WmhQpEfnJiG/7hG87PSCUR7Eq1gLK4UHkdFzce
 KdWuoilt/kwG816sOMgMLEghLuObOICpNbqnoPj8GQ==
X-Google-Smtp-Source: APXvYqw8ExU/R+uf06q48A3Wc10DKEkfY9elTc4ZQLBRVAtnt6bXMEPjFlsfSkkw9RUm1qqJ4HjtU5LK9JF/fO1AX6o=
X-Received: by 2002:a81:a144:: with SMTP id y65mr16843887ywg.437.1569948189853; 
 Tue, 01 Oct 2019 09:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191001162710.GB3526634@kroah.com>
In-Reply-To: <20191001162710.GB3526634@kroah.com>
From: Mat King <mathewk@google.com>
Date: Tue, 1 Oct 2019 10:42:58 -0600
Message-ID: <CAL_quvS4o7rqpjPL2hcJ_-cJWUVNfgaLzzMoymHrswshxYYwKg@mail.gmail.com>
Subject: Re: New sysfs interface for privacy screens
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tdLG/r7+P2Ngh8ZWtcYEEBy7N3f+Jkee88RnUZ/onlY=;
 b=WG8m/x9u6EkqT3rbeISwibZR7wgr+y475s8ZYI+aKyhwk79T6y6VPB35Cs3YbjtDOu
 DMmMM05x8SATtUB1NF3jvKOnIBm+Ma+zsUa1igpmoXAVCEj36LiGlKAZn8XriduTz/+X
 lXFMHVYW3vWZlla1cL3hfo+Ya47QiCoBw+zgqJ17l477sI6j+qm6bmUNF9e2cC+Xekee
 RcWy0oOSfg3sY79agjSWAuQSmKt8Mwf5LSDuwLv3fISsnvpixqEd0RHOkYvTTRNwzJZQ
 JPt/3eSuKe93B93Vts+/m6/wQLLYAFHappRoIYpDavTNDUoJf1WUg1G+EJ56VfVcT672
 4/lg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, rafael@kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rajat Jain <rajatja@google.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxMDoyNyBBTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAwMSwgMjAxOSBhdCAxMDowOTo0NkFN
IC0wNjAwLCBNYXQgS2luZyB3cm90ZToKPiA+IFJlc2VuZGluZyBpbiBwbGFpbiB0ZXh0IG1vZGUK
PiA+Cj4gPiBJIGhhdmUgYmVlbiBsb29raW5nIGludG8gYWRkaW5nIExpbnV4IHN1cHBvcnQgZm9y
IGVsZWN0cm9uaWMgcHJpdmFjeQo+ID4gc2NyZWVucyB3aGljaCBpcyBhIGZlYXR1cmUgb24gc29t
ZSBuZXcgbGFwdG9wcyB3aGljaCBpcyBidWlsdCBpbnRvIHRoZQo+ID4gZGlzcGxheSBhbmQgYWxs
b3dzIHVzZXJzIHRvIHR1cm4gaXQgb24gaW5zdGVhZCBvZiBuZWVkaW5nIHRvIHVzZSBhCj4gPiBw
aHlzaWNhbCBwcml2YWN5IGZpbHRlci4gSW4gZGlzY3Vzc2lvbnMgd2l0aCBteSBjb2xsZWFndWVz
IHRoZSBpZGVhIG9mCj4gPiB1c2luZyBlaXRoZXIgL3N5cy9jbGFzcy9iYWNrbGlnaHQgb3IgL3N5
cy9jbGFzcy9sZWRzIGJ1dCB0aGlzIG5ldwo+ID4gZmVhdHVyZSBkb2VzIG5vdCBzZWVtIHRvIHF1
aXRlIGZpdCBpbnRvIGVpdGhlciBvZiB0aG9zZSBjbGFzc2VzLgo+ID4KPiA+IEkgYW0gcHJvcG9z
aW5nIGFkZGluZyBhIGNsYXNzIGNhbGxlZCAicHJpdmFjeV9zY3JlZW4iIHRvIGludGVyZmFjZQo+
ID4gd2l0aCB0aGVzZSBkZXZpY2VzLiBUaGUgaW5pdGlhbCBBUEkgd291bGQgYmUgc2ltcGxlIGp1
c3QgYSBzaW5nbGUKPiA+IHByb3BlcnR5IGNhbGxlZCAicHJpdmFjeV9zdGF0ZSIgd2hpY2ggd2hl
biBzZXQgdG8gMSB3b3VsZCBtZWFuIHRoYXQKPiA+IHByaXZhY3kgaXMgZW5hYmxlZCBhbmQgMCB3
aGVuIHByaXZhY3kgaXMgZGlzYWJsZWQuCj4gPgo+ID4gQ3VycmVudCBrbm93biB1c2UgY2FzZXMg
d2lsbCB1c2UgQUNQSSBfRFNNIGluIG9yZGVyIHRvIGludGVyZmFjZSB3aXRoCj4gPiB0aGUgcHJp
dmFjeSBzY3JlZW5zLCBidXQgdGhpcyBjbGFzcyB3b3VsZCBhbGxvdyBkZXZpY2UgZHJpdmVyIGF1
dGhvcnMKPiA+IHRvIHVzZSBvdGhlciBpbnRlcmZhY2VzIGFzIHdlbGwuCj4gPgo+ID4gRXhhbXBs
ZToKPiA+Cj4gPiAjIGdldCBwcml2YWN5IHNjcmVlbiBzdGF0ZQo+ID4gY2F0IC9zeXMvY2xhc3Mv
cHJpdmFjeV9zY3JlZW4vY3Jvc19wcml2YWN5L3ByaXZhY3lfc3RhdGUgIyAxOiBwcml2YWN5Cj4g
PiBlbmFibGVkIDA6IHByaXZhY3kgZGlzYWJsZWQKPiA+Cj4gPiAjIHNldCBwcml2YWN5IGVuYWJs
ZWQKPiA+IGVjaG8gMSA+IC9zeXMvY2xhc3MvcHJpdmFjeV9zY3JlZW4vY3Jvc19wcml2YWN5L3By
aXZhY3lfc3RhdGUKPgo+IFdoYXQgaXMgImNyb3NfcHJpdmFjeSIgaGVyZT8KClRoaXMgd291bGQg
YmUgc2V0IGJ5IHRoZSBkZXZpY2UgZHJpdmVyLiBUaGlzIGV4YW1wbGUgd291bGQgYmUgZm9yIGEK
Q2hyb21lIE9TIHByaXZhY3kgc2NyZWVuIGRldmljZSwgYnV0IHRoZSBkcml2ZXIgd291bGQgc2V0
IHRoZSBuYW1lCmp1c3QgbGlrZSBpbiB0aGUgYmFja2xpZ2h0IGNsYXNzLgoKPgo+ID4gIERvZXMg
dGhpcyBhcHByb2FjaCBzZWVtIHRvIGJlIHJlYXNvbmFibGU/Cj4KPiBTZWVtcyBzYW5lIHRvIG1l
LCBkbyB5b3UgaGF2ZSBhbnkgY29kZSB0aGF0IGltcGxlbWVudHMgdGhpcyBzbyB3ZSBjYW4KPiBz
ZWUgaXQ/CgpJdCBpcyBzdGlsbCBlYXJseSBpbiB0aGUgaW1wbGVtZW50YXRpb24gc28gdGhlcmUg
aXMgbm8gY29kZSBxdWl0ZSB5ZXQuCkkgd2FudGVkIHRvIGdldCBzb21lIGdlbmVyYWwgZmVlZGJh
Y2sgb24gdGhlIGFwcHJvYWNoIGZpcnN0LiBBcyBzb29uCmFzIEkgaGF2ZSBjb2RlIHRvIHNoYXJl
IEkgd2lsbCBwb3N0IGl0LgoKPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCgpUaGFuayB5b3UgZm9y
IHRoZSBmZWVkYmFjay4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
