Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E99E3CE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5682589834;
	Tue, 27 Aug 2019 09:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73489834
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:18:54 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id l2so14411273oil.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 02:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OVULxG89XFAHB1HH6NIasvz1p9D2uKsiFcCnfRE8CtE=;
 b=Q1nZLbJBKTj1qMJzedOO2xiebVcI/B/8YLyDA5qgExdiU4Ff8IYcSaRk9uXqLZtWet
 FocbmjQiu7AbgzZ6S/U/7uF55yPAIVYN1zBU1ckIVfeYqN6F+R3TEI5NVm1SdvCjLpKF
 edycXd9w5zooP3PGh/mOW+6AyxS8CSupfECTBp0x7dDFqUUv1Tjc15PfPkzCYQHrT0GQ
 acupJ2BgVqBVN3DUIxcG5+qSuIlTzHZa8gwJsJreaST3/uWmhefGD16htUpywp5zQUDb
 1M5AdkuWqopSCtJvqVsLNl6Y4v9WjWziAb1MNfcxTNYTCsGLEY87c3+zb81yJD+lM/Xh
 LVKg==
X-Gm-Message-State: APjAAAX7qhZkHYbmBy1GS8hESz0oEAibrkBM9vO9DFAZuVGEOFTwp3pX
 a7FDMMtdycMukk/qyCgUVjqDl0ksBViu4jXgVSg=
X-Google-Smtp-Source: APXvYqznMhXUExLuIctyuUXvUpp1m+dbcAX8l5N1M3gPdd5A2IghYw0lD32NruIo8f1qmoDoeL8ybGZyqyyUyBwsE0I=
X-Received: by 2002:aca:b154:: with SMTP id a81mr14710961oif.148.1566897533576; 
 Tue, 27 Aug 2019 02:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190826195740.29415-1-peda@axentia.se>
 <20190826195740.29415-3-peda@axentia.se>
 <CAMuHMdVx77aOyUVhZ2_N76VAP+AJ3X8w-gdHLjnjUEeRKcZmOA@mail.gmail.com>
 <a31ff144-f037-3580-08b5-aa368572c69d@axentia.se>
In-Reply-To: <a31ff144-f037-3580-08b5-aa368572c69d@axentia.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 11:18:42 +0200
Message-ID: <CAMuHMdXTm8n=SXyRejT27Q9Vxv0hw5C8DQDXiNM=06aYXq=dgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] fbdev: fbmem: allow overriding the number of
 bootup logos
To: Peter Rosin <peda@axentia.se>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsCgpPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAxMDo1NCBBTSBQZXRlciBSb3NpbiA8
cGVkYUBheGVudGlhLnNlPiB3cm90ZToKPiBPbiAyMDE5LTA4LTI3IDEwOjM2LCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAxMDo0NiBQTSBQZXRl
ciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPiB3cm90ZToKPiA+PiBQcm9iYWJseSBtb3N0IHVzZWZ1
bCBpZiB5b3Ugb25seSB3YW50IG9uZSBsb2dvIHJlZ2FyZGxlc3Mgb2YgaG93IG1hbnkKPiA+PiBD
UFUgY29yZXMgeW91IGhhdmUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb3NpbiA8
cGVkYUBheGVudGlhLnNlPgo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+Cj4gPj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9mYi9mYmNvbi5yc3QKPiA+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2ZiL2ZiY29uLnJzdAo+ID4+IEBAIC0xNzQsNiArMTc0LDExIEBAIEMuIEJvb3Qgb3B0aW9ucwo+
ID4+ICAgICAgICAgZGlzcGxheWVkIGR1ZSB0byBtdWx0aXBsZSBDUFVzLCB0aGUgY29sbGVjdGVk
IGxpbmUgb2YgbG9nb3MgaXMgbW92ZWQKPiA+PiAgICAgICAgIGFzIGEgd2hvbGUuCj4gPj4KPiA+
PiArOS4gZmJjb249bG9nby1jb3VudDo8bj4KPiA+PiArCj4gPj4gKyAgICAgICBUaGUgdmFsdWUg
J24nIG92ZXJyaWRlcyB0aGUgbnVtYmVyIG9mIGJvb3R1cCBsb2dvcy4gWmVybyBnaXZlcyB0aGUK
PiA+PiArICAgICAgIGRlZmF1bHQsIHdoaWNoIGlzIHRoZSBudW1iZXIgb2Ygb25saW5lIGNwdXMu
Cj4gPgo+ID4gSXNuJ3QgdGhhdCBhIGJpdCB1bmV4cGVjdGVkIGZvciB0aGUgdXNlcj8KPiA+IFdo
YXQgYWJvdXQgbWFraW5nIC0xIHRoZSBkZWZhdWx0IChhdXRvKSwgYW5kIHplcm8gbWVhbmluZyBu
byBsb2dvcz8KPgo+IEkganVzdCBuYWl2ZWx5IGFzc3VtZWQgdGhlcmUgd2FzIHNvbWUgb3RoZXIg
bWVjaGFuaXNtIHRvIGRpc2FibGUgaXQuCgpUaGF0IHdhcyBteSBmaXJzdCB0aG91Z2h0LCB0b28s
IGJ1dCBJIGNvdWxkbid0IGZpbmQgb25lLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
