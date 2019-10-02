Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF1C8E72
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FE06E8BD;
	Wed,  2 Oct 2019 16:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26526E88B;
 Wed,  2 Oct 2019 16:33:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l3so20412759wru.7;
 Wed, 02 Oct 2019 09:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWuxqHH990fVUCMM6jqcLulz0ftwLl/bnFae9PcvIP8=;
 b=YhNkvDsEXDBhi9X9F6QBlt8XuIN2r0m864AcdvQvOW6BgDuPpzdwy+WDwQznw1X41u
 9ds+emzNggv+wV6RuKC3gxIwMuW5YVz3c4VXuDxJp/GiUjbD8cf4BlmcBhOa4o62TfMG
 4JFzW4GfWymrRG5miwzkfahPORhMg873+GgH3WqceZHYzzfV5cVHmCWKFQNS6lr44NXe
 Sb/jKPbQSH43onk/f78oeN/sYqDO+7qmRfdaFr4VdINdEuJBduNEvnuCdltqqceQQZh3
 m+f+jPcbmNVkSrV/mFXnQ778TeV+96CueFaponkkYrFrOzIbz18YTiUuXAX+PNwvQeRs
 zQBA==
X-Gm-Message-State: APjAAAXecRhL91joSpkfjsSdsM+1p5cIhYiWyiIrhuWFu4htld5kA5W/
 YzN0K1jqZCIWUJ2JxEIAzXvmapMkNMKXbY3Qv94=
X-Google-Smtp-Source: APXvYqyJQ4kvU7WEh3bv0w5uz9bqzf9VG2CQeCEIBlVvoU8s61BA4sw5HD3OOn5Pew/wZJQal7k6gbo/0T3JrPsxt4c=
X-Received: by 2002:adf:e951:: with SMTP id m17mr3421662wrn.154.1570034020467; 
 Wed, 02 Oct 2019 09:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CADnq5_PkTwTBbQY9JatZD2_sWjdU5_hK7V2GLfviEvMh_QB12Q@mail.gmail.com>
 <CAK8P3a0KMT437okhobg=Vzi5LRDgUO7L-x35LczBGXE2jYLg2A@mail.gmail.com>
 <CADnq5_PWWndBomBOXTYgmFqo+U8f8d8+OdJ5Ym3+a2mgO5=E0A@mail.gmail.com>
 <CAK8P3a05ZSWcw=XUZrLyjMLY7wCHLKhpe+MF9p5P3URWpAcj+A@mail.gmail.com>
In-Reply-To: <CAK8P3a05ZSWcw=XUZrLyjMLY7wCHLKhpe+MF9p5P3URWpAcj+A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 12:33:27 -0400
Message-ID: <CADnq5_M9H2R_6KnxutJ2F3ZkZ1FxqPufcyTxwcQ1cdWYFDbdLw@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oWuxqHH990fVUCMM6jqcLulz0ftwLl/bnFae9PcvIP8=;
 b=qNkjivrTES56/Lb0XjDQ2f1+acHL7hCLr0wo1luiHenEDywJXL0H9oRpRStksAoLOu
 5JkCuYENZAc9RXCSLMsmzgabPQRs4LhiuaYbYRJAe9eUEfHceNMGgaovwrUjcSHfSHh6
 85T7OExyO6u1EPyDwTWGIDgv1G8PSbgAEx31jc7IcJMfRJ2+2ywqGo6HQKn+8Zt0ZBOt
 qbwWhnmpWRB9toTjePUwj1LVIG9S9lQ4jyRNaDVj3HRjWBlc4SNGtU9J6G65kmpOg43T
 U96vCFcVMFlQsj/8k/okZgNE9btL+YGbfI30IFIj2fbd74xEHbRtOHDZqh7pNg/awCbb
 iczQ==
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAxMTozOSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgNToxMiBQTSBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAyLCAyMDE5
IGF0IDEwOjUxIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Cj4gPiA+
Cj4gPiA+IE5vdGhpbmcgc2hvdWxkIHJlYWxseSBjaGFuZ2Ugd2l0aCByZWdhcmRzIHRvIHRoZSAt
bXNzZSBmbGFnIGhlcmUsIG9ubHkKPiA+ID4gdGhlIHN0YWNrIGFsaWdubWVudCBmbGFnIGNoYW5n
ZWQuIE1heWJlIHRoZXJlIHdhcyBzb21lIG90aGVyIGNoYW5nZQo+ID4gPiBpbiB5b3VyIE1ha2Vm
aWxlIHRoYXQgY29uZmxpY3RzIHdpdGggbXkgbXkgcGF0Y2g/Cj4gPgo+ID4gVGhpcyBwYXRjaCBv
biB0b3Agb2YgeW91cnMgc2VlbXMgdG8gZml4IGl0IGFuZCBhbGlnbnMgYmV0dGVyIHdpdGggdGhl
Cj4gPiBvdGhlciBNYWtlZmlsZXM6Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiA+IGluZGV4IGVmNjczYmZmYzI0MS4uZTcxZjNl
ZTc2Y2QxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIxL01ha2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvTWFrZWZpbGUKPiA+IEBAIC05LDEwICs5LDEwIEBAIGVsc2UgaWZuZXEgKCQoY2FsbCBjYy1v
cHRpb24sIC1tc3RhY2stYWxpZ25tZW50PTE2KSwpCj4gPiAgICAgICAgIGNjX3N0YWNrX2FsaWdu
IDo9IC1tc3RhY2stYWxpZ25tZW50PTE2Cj4gPiAgZW5kaWYKPiA+Cj4gPiAtQ0ZMQUdTXyQoQU1E
REFMUEFUSCkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UK
PiA+ICQoY2Nfc3RhY2tfYWxpZ24pCj4gPiArQ0ZMQUdTX2RjbjIxX3Jlc291cmNlLm8gOj0gLW1o
YXJkLWZsb2F0IC1tc3NlICQoY2Nfc3RhY2tfYWxpZ24pCj4gPgo+ID4gIGlmZGVmIENPTkZJR19D
Q19JU19DTEFORwo+ID4gLUNGTEFHU18kKEFNRERBTFBBVEgpL2RjL2RjbjIxL2RjbjIxX3Jlc291
cmNlLm8gKz0gLW1zc2UyCj4gPiArQ0ZMQUdTX2RjbjIxX3Jlc291cmNlLm8gKz0gLW1zc2UyCj4g
PiAgZW5kaWYKPgo+IE9rLCBzbyB0aGVyZSBpcyBjbGVhcmx5IGEgZ2xvYmFsIGNoYW5nZSB0aGF0
IHdlbnQgaW50byB5b3VyIHRyZWUsIG9yCj4gaXMgbWlzc2luZyBmcm9tIGl0Ogo+Cj4gSSBzZWUg
dGhhdCBhcyBvZiBsaW51eC01LjQtcmMxLCBJIGhhdmUgY29tbWl0IDU0YjhhZTY2YWUxYSAoImti
dWlsZDogY2hhbmdlCj4gICpGTEFHU188YmFzZXRhcmdldD4ubyB0byB0YWtlIHRoZSBwYXRoIHJl
bGF0aXZlIHRvICQob2JqKSIpLCB3aGljaCBjaGFuZ2VkCj4gYWxsIHRoZXNlIHBhdGggbmFtZXMg
dG8gaW5jbHVkZSB0aGUgQU1EREFMUEFUSC4KPgo+IEl0IHNlZW1zIHlvdSBhcmUgZWl0aGVyIG9u
IGFuIG9sZGVyIGtlcm5lbCB0aGF0IGRvZXMgbm90IHlldCBoYXZlIHRoaXMsCj4gb3IgeW91IGhh
dmUgYXBwbGllZCBhbm90aGVyIHBhdGNoIHRoYXQgcmV2ZXJ0cyBpdC4KCkFoLCBJIGRvbid0IGhh
dmUgdGhhdCBwYXRjaCB5ZXQgaW4gbXkgdHJlZS4gIFRoYXQgZXhwbGFpbnMgaXQuCgpBbGV4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
