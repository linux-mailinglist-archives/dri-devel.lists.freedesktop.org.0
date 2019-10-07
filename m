Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB4CE87A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A966E0DB;
	Mon,  7 Oct 2019 15:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54BA6E07B;
 Mon,  7 Oct 2019 15:57:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r3so15978038wrj.6;
 Mon, 07 Oct 2019 08:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pv3zbzHRa52jlg0ha3vzroZyZv2t03ZKCGOX1Q6sDuY=;
 b=C/6BCbTOPLHC8pc3HTfoNDFkjNLXLnxSXdtWpZDP3LxI1O/hFgmInr8Uw428EdoStX
 t28g483ALofsmLImkCCZLrQbW2bsujQXOLf3/3aRW5/plBIRutgbXULhSg8ZFp+I3QFx
 1EaFUPFyKBSvfhKjaCNhWWoBVihibtDsOTITE+iWmdROxX8AGMlsqsZcb3roUWS4PstQ
 4xEZ50aMw2N+FHai/qdVSVE5V17RwIRIDUtFDnRLu0MGbTB2XXBarKbxyTRuatH+L1AQ
 dLhrpyo6EtAj1QFofzFTSVSx0+bzbVLHxsEeB6QKKwalPLd4ZsfCIsZW6aRR3kWxwrtx
 pzPA==
X-Gm-Message-State: APjAAAWIxwvhvVNItzjGOGHB/4Ntzc3LznfRVjPBIER6N763vFh4q7vj
 MNxnPKHkbzOQUBdBgWdJFCOaX7u7nJew1mA4VKY=
X-Google-Smtp-Source: APXvYqw/4ecyBOzTC2pj7nSYubj1XPsTw7OxMpAZa1s6+UKfxUBqhUAlxlmmXQImS7B42KVKV9Jx8B87HepbEix+NQ0=
X-Received: by 2002:adf:fc07:: with SMTP id i7mr8227762wrr.50.1570463858274;
 Mon, 07 Oct 2019 08:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191006105735.60708-1-yuehaibing@huawei.com>
 <db644945-24df-7d67-7fc6-880833466593@amd.com>
In-Reply-To: <db644945-24df-7d67-7fc6-880833466593@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 11:57:26 -0400
Message-ID: <CADnq5_M_c90Gd0w4Hp+xChdYjxCE4=nVogsntVD+vd3U4+N36A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove set but not used variable
 'core_freesync'
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pv3zbzHRa52jlg0ha3vzroZyZv2t03ZKCGOX1Q6sDuY=;
 b=GgcxoFlXi+10opvKk9r3xkS9Fe+6LhAhKpIdgDWee0bQNbfnkc15HaccnA/Xsrh7Jo
 FQbsk5iq02nE6EFzmTlg69Hx3XiQHMgUrCcGFy3YgnwUT91syhJHOGo+mAbJhA23dWhs
 f1S6dDl0S0i6+HuBLi6IDz6p5Y7KwCbOWHpFkL2LuzUvHdHqje1wbft7EhZ4NGOhRjep
 TwlZK2VbVksWFg6Nmd+glPEMdo8SlLAIXB6SELimT4miZ1AoaWR2QImtbUbifB8+2haW
 Wn2dEWLbQxRlaQ0IMhm4J/UjhcYNgsyQ62Xyi7Dm/oUzIJoFIQMrCj5fFuMQO8INimtq
 39AA==
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
Cc: "Harmanprit.Tatla@amd.com" <Harmanprit.Tatla@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, YueHaibing <yuehaibing@huawei.com>,
 "Othman, Ahmad" <Ahmad.Othman@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "Amini, Reza" <Reza.Amini@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "bayan.zabihiyan@amd.com" <bayan.zabihiyan@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCAxMDowNiBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTEwLTA2IDY6NTcgYS5tLiwgWXVlSGFpYmluZyB3
cm90ZToKPiA+IEZpeGVzIGdjYyAnLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoK
PiA+Cj4gPiByaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9mcmVl
c3luYy9mcmVlc3luYy5jOgo+ID4gIEluIGZ1bmN0aW9uIG1vZF9mcmVlc3luY19nZXRfc2V0dGlu
Z3M6Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L21vZHVsZXMvZnJl
ZXN5bmMvZnJlZXN5bmMuYzo5ODQ6MjQ6Cj4gPiAgd2FybmluZzogdmFyaWFibGUgY29yZV9mcmVl
c3luYyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4KPiA+
IEl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCA5OGU2NDM2ZDNhZjUgKCJkcm0vYW1kL2Rpc3Bs
YXk6IFJlZmFjdG9yIEZyZWVTeW5jIG1vZHVsZSIpCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8
eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgo+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiBIYXJy
eQo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVl
c3luYy9mcmVlc3luYy5jIHwgNCAtLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9k
dWxlcy9mcmVlc3luYy9mcmVlc3luYy5jCj4gPiBpbmRleCA5Y2U1NmE4Li4yMzdkZGE3IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMv
ZnJlZXN5bmMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMv
ZnJlZXN5bmMvZnJlZXN5bmMuYwo+ID4gQEAgLTk4MSwxMyArOTgxLDkgQEAgdm9pZCBtb2RfZnJl
ZXN5bmNfZ2V0X3NldHRpbmdzKHN0cnVjdCBtb2RfZnJlZXN5bmMgKm1vZF9mcmVlc3luYywKPiA+
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICppbnNlcnRlZF9mcmFtZXMsCj4gPiAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCAqaW5zZXJ0ZWRfZHVyYXRpb25faW5fdXMpCj4gPiAgewo+ID4g
LSAgICAgc3RydWN0IGNvcmVfZnJlZXN5bmMgKmNvcmVfZnJlZXN5bmMgPSBOVUxMOwo+ID4gLQo+
ID4gICAgICAgaWYgKG1vZF9mcmVlc3luYyA9PSBOVUxMKQo+ID4gICAgICAgICAgICAgICByZXR1
cm47Cj4gPgo+ID4gLSAgICAgY29yZV9mcmVlc3luYyA9IE1PRF9GUkVFU1lOQ19UT19DT1JFKG1v
ZF9mcmVlc3luYyk7Cj4gPiAtCj4gPiAgICAgICBpZiAodnJyLT5zdXBwb3J0ZWQpIHsKPiA+ICAg
ICAgICAgICAgICAgKnZfdG90YWxfbWluID0gdnJyLT5hZGp1c3Qudl90b3RhbF9taW47Cj4gPiAg
ICAgICAgICAgICAgICp2X3RvdGFsX21heCA9IHZyci0+YWRqdXN0LnZfdG90YWxfbWF4Owo+ID4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
