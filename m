Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88747C0023
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D32F6EE7C;
	Fri, 27 Sep 2019 07:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338CB6ECF9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 10:46:01 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x8QAjhdv022755
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 19:45:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x8QAjhdv022755
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id t128so326678vkd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 03:45:43 -0700 (PDT)
X-Gm-Message-State: APjAAAUgJmdcuDl/kzE9dL+ytsUkxdbrPXmxo304stQpiZChRjOhkpZP
 Rj5qCjAgdHUQZ6MEqBYNT4fKReDJQpZKHH8qk0Q=
X-Google-Smtp-Source: APXvYqxq9EI9rMORFaFNyb4BmeKb4WK6iS2aILn0tGeI53ICeWzEirtOjlv7ijdHOlZYtmjDCl7+cULA0UzUmkBvYiM=
X-Received: by 2002:a1f:60c2:: with SMTP id u185mr1298856vkb.0.1569494742579; 
 Thu, 26 Sep 2019 03:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190926101312.32218-1-geert@linux-m68k.org>
In-Reply-To: <20190926101312.32218-1-geert@linux-m68k.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 26 Sep 2019 19:45:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATN5QyC+-_VRZm_ZysYd8Z8aWU0Ys0cTpU2GUdEdrXvPg@mail.gmail.com>
Message-ID: <CAK7LNATN5QyC+-_VRZm_ZysYd8Z8aWU0Ys0cTpU2GUdEdrXvPg@mail.gmail.com>
Subject: Re: [PATCH -next] fbdev: c2p: Fix link failure on non-inlining
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1569494744;
 bh=2bqFCD9HY4bOSAdbvQuBhAL+OdjKk61eDEgGU6Vtqck=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MGH/PDa0fPS4hDwlv5O/+6Pv/I+M0Ihx7N+qCcjMpIu4hvGN7nL80VD8z6Re9ijAJ
 yMOj5tPD6gG17+vUCK+9uxHTUYzsGiaW5HrzHbHVGcNlzQEz/IIxU/LAn6MRFmgOiX
 sPx6wE4YMa6SgxQPoow1CA7QvEi/lmgNb+552BfSu2CyavfAsd8gf1KAD+giQxc6Z/
 y3vEjpc/AcJ5ICRI+cHesOhcmHkEtfe+hU2rbzlLhqA4GZZsaGcgdxRq0T2dJIUd+S
 y43pK4BH9uj6pfZoEIaymNW1eyoOdbIcsgpZgLamCn4iVKhKQSZkox/fmV/fg7N1H4
 TEjp/yp/Ct50Q==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNzoxMyBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IFdoZW4gdGhlIGNvbXBpbGVyIGRlY2lkZXMgbm90
IHRvIGlubGluZSB0aGUgQ2h1bmt5LXRvLVBsYW5hciBjb3JlCj4gZnVuY3Rpb25zLCB0aGUgYnVp
bGQgZmFpbHMgd2l0aDoKPgo+ICAgICBjMnBfcGxhbmFyLmM6KC50ZXh0KzB4ZDYpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQnCj4gICAgIGMycF9wbGFuYXIuYzooLnRl
eHQrMHgxZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQnCj4gICAg
IGMycF9pcGxhbjIuYzooLnRleHQrMHhjNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGMycF91
bnN1cHBvcnRlZCcKPiAgICAgYzJwX2lwbGFuMi5jOigudGV4dCsweDE1MCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGMycF91bnN1cHBvcnRlZCcKPgo+IEZpeCB0aGlzIGJ5IG1hcmtpbmcgdGhl
IGZ1bmN0aW9ucyBfX2Fsd2F5c19pbmxpbmUuCj4KPiBSZXBvcnRlZC1ieTogbm9yZXBseUBlbGxl
cm1hbi5pZC5hdQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+Cj4gLS0tCj4gRml4ZXM6IDAyNWYwNzJlNTgyMzk0N2MgKCJjb21waWxlcjog
ZW5hYmxlIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBmb3JjaWJseSIpCj4KPiBBcyB0aGlzIGlz
IGEgcGF0Y2ggaW4gYWtwbSdzIHRyZWUsIHRoZSBjb21taXQgSUQgaW4gdGhlIEZpeGVzIHRhZyBp
cyBub3QKPiBzdGFibGUuCgpCVFcsIHRoYXQgRml4ZXMgdGFnIGlzIGluY29ycmVjdC4KCklycmVz
cGVjdGl2ZSBvZiAwMjVmMDcyZTU4MjM5NDdjLCB5b3UgY291bGQgbWFudWFsbHkgZW5hYmxlCkNP
TkZJR19PUFRJTUlaRV9JTkxJTklORyBmcm9tIG1lbnVjb25maWcgZXRjLgoKU28sIHRoaXMgYnVp
bGQgZXJyb3Igd291bGQgaGF2ZSBiZWVuIGZvdW5kIG11Y2ggZWFybGllcgppZiBzb21lYm9keSBo
YWQgYmVlbiBydW5uaW5nIHJhbmRjb25maWcgdGVzdHMgb24gbTY4ay4KCkl0IGlzIGltcG9zc2li
bGUgdG8gZGV0ZWN0IHRoaXMgZXJyb3Igb24gb3RoZXIgYXJjaGl0ZWN0dXJlcwpiZWNhdXNlIHRo
ZSBkcml2ZXIgY29uZmlnIG9wdGlvbnMgYXJlIGd1YXJkZWQgYnkKJ2RlcGVuZHMgb24gQVRBUkkn
IG9yICdkZXBlbmRzIG9uIEFNSUdBJy4KCgpUaGUgY29ycmVjdCB0YWcgaXM6CgpGaXhlczogOTAx
MmQwMTE2NjBlICgiY29tcGlsZXI6IGFsbG93IGFsbCBhcmNoZXMgdG8gZW5hYmxlCkNPTkZJR19P
UFRJTUlaRV9JTkxJTklORyIpCgpUaGUgY29tbWl0IGlkIGlzIHN0YWJsZS4KCgoKQXMgYW4gYWRk
aXRpb25hbCB3b3JrLApkZXBlbmRzIG9uIChBTUlHQSB8fCBDT01QSUxFX1RFU1QpCndvdWxkIGJl
IG5pY2UgdW5sZXNzIHRoaXMgZHJpdmVyIGNvbnRhaW5zIG02OGstc3BlY2lmaWMgY29kZS4KCgot
LSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
