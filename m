Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B654791179
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367896EAD7;
	Sat, 17 Aug 2019 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE6E6E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 15:48:34 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id s21so7085496ioa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 08:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/rVwYCxqOr6nRrp3LvLIcdjfULOr8AyFlrBXkong6Uc=;
 b=f9r9noAiYRR2gZB4Va0GDf4AySaMzEY+M8maGnGqSi6OTLtxtJgyYHGlv6Ope3NkFG
 +Qs75GlVezvntooEo8BOIo5YXzOE4drsZV/D1VO6A4P3CA8+Ifhu2mvLXbRiE4et2g+y
 IkeBxijUS/j57CA8Y8EbmzsvAuAJA9kBS6Yc/K//qP5nSXtjGsqlEsGweo9xB1JQDG6/
 UxE4HRkJKnAJ2ouaiTm5vqjF3QsOS/FhxY20hAVOzF/WeI35anDlpObhTQr/B9Q06DdN
 uCA+3i5J93+BQ/ZyhEzZ4RXJQsEN1L1R5MhqD5Eah34i5xlBqsmood/A+kg8zQkMhvgT
 CSCw==
X-Gm-Message-State: APjAAAVT+AKaWWkCk7olsavfmIwRQJY8tv9f2PdNv67CzfjjYQ/xpDxq
 HxHxOTG2tGA8F4mWDy8UdnXOMJrOtABwFz8tnIgn1A==
X-Google-Smtp-Source: APXvYqxDOUjXB1ulEsmlyPghWdRmlQ4HyP8nZKAkjmZq4xfy7xXlP40N1L/haF2XUbz+0fYOxJqch8oW/Je12YfPMR8=
X-Received: by 2002:a5d:8457:: with SMTP id w23mr472306ior.189.1565970513627; 
 Fri, 16 Aug 2019 08:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2019 17:48:22 +0200
Message-ID: <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/rVwYCxqOr6nRrp3LvLIcdjfULOr8AyFlrBXkong6Uc=;
 b=fXFbSidYUWUDlCh4xn1T/uZ5jLY9vlVpMj5VEkuiqHXz+qMOCKxapObfLA3nEgPC7R
 vbKAhlMWcM4J+Eji7i5R6bwo4AeGu9fnIYkpCAzv8oSULwGLPD3LqKmsHrjooKwmPZlg
 CPFFPDdRWkrJe6ua3OTZ34Gz1O0O8vSQoh64ZKeWJzsOfIgCrQ5x1SjgRLt2BFPW6eno
 miP6aVQIgyGJOM2QklUITTu5iuxab7KfiAgaTBKrd+U5OvNlNtDzA+RPScqKLXahRxhU
 onl3wAUB2zIim3HOXqpJCz4CfO6R/P8hrD8OguzyI92HPBSdWK0xd3s2kHKgHsp4TiYl
 +oyQ==
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3p3LiwgOCBzaWUgMjAxOSBvIDEwOjE3IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYu
cGw+IG5hcGlzYcWCKGEpOgo+Cj4gxZtyLiwgMjQgbGlwIDIwMTkgbyAxMDoyNSBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiBuYXBpc2HFgihhKToKPiA+Cj4gPiBGcm9tOiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4KPiA+IFdoaWxl
IHdvcmtpbmcgb24gbXkgb3RoZXIgc2VyaWVzIHJlbGF0ZWQgdG8gZ3Bpby1iYWNrbGlnaHRbMV0g
SSBub3RpY2VkCj4gPiB0aGF0IHdlIGNvdWxkIHNpbXBsaWZ5IHRoZSBkcml2ZXIgaWYgd2UgbWFk
ZSB0aGUgb25seSB1c2VyIG9mIHBsYXRmb3JtCj4gPiBkYXRhIHVzZSBHUElPIGxvb2t1cHMgYW5k
IGRldmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0cmllcyB0byBkbwo+ID4gdGhhdC4KPiA+
Cj4gPiBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBhbGwgbmVjZXNzYXJ5IGRhdGEgc3RydWN0dXJlcyB0
byBlY292ZWMyNC4gUGF0Y2gKPiA+IDIvNyB1bmlmaWVzIG11Y2ggb2YgdGhlIGNvZGUgZm9yIGJv
dGggcGRhdGEgYW5kIG5vbi1wZGF0YSBjYXNlcy4gUGF0Y2hlcwo+ID4gMy00LzcgcmVtb3ZlIHVu
dXNlZCBwbGF0Zm9ybSBkYXRhIGZpZWxkcy4gTGFzdCB0aHJlZSBwYXRjaGVzIGNvbnRhaW4KPiA+
IGFkZGl0aW9uYWwgaW1wcm92ZW1lbnRzIGZvciB0aGUgR1BJTyBiYWNrbGlnaHQgZHJpdmVyIHdo
aWxlIHdlJ3JlIGFscmVhZHkKPiA+IG1vZGlmeWluZyBpdC4KPiA+Cj4gPiBJIGRvbid0IGhhdmUg
YWNjZXNzIHRvIHRoaXMgSFcgYnV0IGhvcGVmdWxseSB0aGlzIHdvcmtzLiBPbmx5IGNvbXBpbGUK
PiA+IHRlc3RlZC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8yNS85
MDAKPiA+Cj4gPiB2MSAtPiB2MjoKPiA+IC0gcmViYXNlZCBvbiB0b3Agb2YgdjUuMy1yYzEgYW5k
IGFkanVzdGVkIHRvIHRoZSByZWNlbnQgY2hhbmdlcyBmcm9tIEFuZHkKPiA+IC0gYWRkZWQgYWRk
aXRpb25hbCB0d28gcGF0Y2hlcyB3aXRoIG1pbm9yIGltcHJvdmVtZW50cwo+ID4KPiA+IHYyIC0+
IHYzOgo+ID4gLSBpbiBwYXRjaCA3Lzc6IHVzZWQgaW5pdGlhbGl6ZXJzIHRvIHNldCB2YWx1ZXMg
Zm9yIHBkYXRhIGFuZCBkZXYgbG9jYWwgdmFycwo+ID4KPiA+IEJhcnRvc3ogR29sYXN6ZXdza2kg
KDcpOgo+ID4gICBzaDogZWNvdmVjMjQ6IGFkZCBhZGRpdGlvbmFsIHByb3BlcnRpZXMgdG8gdGhl
IGJhY2tsaWdodCBkZXZpY2UKPiA+ICAgYmFja2xpZ2h0OiBncGlvOiBzaW1wbGlmeSB0aGUgcGxh
dGZvcm0gZGF0YSBoYW5kbGluZwo+ID4gICBzaDogZWNvdmVjMjQ6IGRvbid0IHNldCB1bnVzZWQg
ZmllbGRzIGluIHBsYXRmb3JtIGRhdGEKPiA+ICAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgdW51
c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKPiA+ICAgYmFja2xpZ2h0OiBncGlvOiByZW1v
dmUgZGV2IGZyb20gc3RydWN0IGdwaW9fYmFja2xpZ2h0Cj4gPiAgIGJhY2tsaWdodDogZ3Bpbzog
cmVtb3ZlIGRlZl92YWx1ZSBmcm9tIHN0cnVjdCBncGlvX2JhY2tsaWdodAo+ID4gICBiYWNrbGln
aHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgo+ID4KPiA+ICBh
cmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMgICAgICAgICB8IDMzICsrKysrKy0t
Cj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyAgICAgfCA4MiAr
KysrKy0tLS0tLS0tLS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlv
X2JhY2tsaWdodC5oIHwgIDMgLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygr
KSwgNzQgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+IDIuMjEuMAo+ID4KPgo+IEhpIFJpY2gs
IFlvc2hpbm9yaSwKPgo+IGNhbiB5b3UgYWNrIHRoZSBzaCBwYXRjaGVzIGluIHRoaXMgc2VyaWVz
Pwo+Cj4gQmFydAoKUGluZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
