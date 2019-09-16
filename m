Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DDDB480E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D4C6EAF7;
	Tue, 17 Sep 2019 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D8F6EA16
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 17:47:50 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x8GHlOUD026630;
 Tue, 17 Sep 2019 02:47:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x8GHlOUD026630
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id b1so205778vsr.10;
 Mon, 16 Sep 2019 10:47:25 -0700 (PDT)
X-Gm-Message-State: APjAAAVbiq/KCUuZN3aOoM5Secg/Bj96gW6YEaRFsN6emElIFazf8wdS
 O9OU57lcQgvGc2cLxwoBIj6My4CwAAOGh4h8i8s=
X-Google-Smtp-Source: APXvYqw0crawiGP3RG9x21JW4rmaeJ/jyNDfUIdTYxkF1YqpKyOnmgLelaYfXtHPmP/3VofBZVarCj+rIB0skCe86ZI=
X-Received: by 2002:a67:1e87:: with SMTP id e129mr578937vse.179.1568656044082; 
 Mon, 16 Sep 2019 10:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190916044651.GA72121@LGEARND20B15>
In-Reply-To: <20190916044651.GA72121@LGEARND20B15>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 17 Sep 2019 02:46:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZMr5ZKGufi63GZrZ45k60faAiXr4mBB_mU9h_QifjxQ@mail.gmail.com>
Message-ID: <CAK7LNARZMr5ZKGufi63GZrZ45k60faAiXr4mBB_mU9h_QifjxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix compile error due to 'endif' missing
To: Austin Kim <austindh.kim@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1568656045;
 bh=snSC5CbpUuN1Cw3Ri9XlO0GR3QpMdN6LNC6tbl3IFpw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zlmpEt5sTfPYRKVA5/2rQkTcbsZtkXiTvMkIlsayE1VrEhTaMhEeG8laftJvYEfR1
 3VNxQDEE8Z3FDKVGGqExRg8nMudu2nQAeutKtyU8QA1ZTI5AFebtE1Lft2BW1i5tY6
 oWv40Jg2ztT15sZUv4yN+7Kz+ZxM4tpx3CWIGrSf7Ktva3EYlHeHutFdzHpHjloCXm
 IoHT2/G/0Ly9eCrt5f4fIQhVNQnXCBHafQTK17cFb/fvJEvQHBWjWgNxszmBtKt15a
 8WBtHiRHPjrxaLN+7BbZ3nrwTc3nsY5/W96QzrFjR+5ujrTpG5F8U4bVcISnD5dorL
 syb0XIObdX5hw==
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
Cc: David Airlie <airlied@linux.ie>, Roman.Li@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KCtDQyBTdGVwaGVuIFJvdGh3ZWxsLCBNYXJrIEJyb3duKQoKT24gTW9uLCBTZXAgMTYsIDIwMTkg
YXQgMTo0NiBQTSBBdXN0aW4gS2ltIDxhdXN0aW5kaC5raW1AZ21haWwuY29tPiB3cm90ZToKPgo+
IGdjYyB0aHJvd3MgY29tcGlsZSBlcnJvciB3aXRoIGJlbG93IG1lc3NhZ2U6CgpHTlUgTWFrZSB0
aHJvd3MgLi4uCgoKVGhpcyBpcyBwcm9iYWJseSBhIG1lcmdlIG1pc3Rha2UgaW4gbGludXgtbmV4
dC4KCklmIHNvLCB0aGlzIHNob3VsZCBiZSBkaXJlY3RseSBmaXhlZCBpbiB0aGUgbGludXgtbmV4
dC4KCklmIGl0IGlzIG5vdCBmaXhlZCBpbiB0aW1lLApwbGVhc2UgaW5mb3JtIExpbnVzIHRvICpu
b3QqIGZvbGxvdyB0aGUgbGludXgtbmV4dC4KCgpUaGFua3MuCgoKCj4KPiBIRFJJTlNUIHVzci9p
bmNsdWRlL2RybS9pOTE1X2RybS5oCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kbWwvTWFrZWZpbGU6NzA6ICoqKiBtaXNzaW5nICdlbmRpZicuICBTdG9wLgo+IHNj
cmlwdHMvTWFrZWZpbGUubW9kYnVpbHRpbjo1NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1JyBmYWlsZWQKPiBtYWtlWzNdOiAqKiogW2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1XSBFcnJvciAyCj4gbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNo
ZWQgam9icy4uLi4KPiAgIEhEUklOU1QgdXNyL2luY2x1ZGUvZHJtL29tYXBfZHJtLmgKPiAgIEhE
UklOU1QgdXNyL2luY2x1ZGUvZHJtL3RlZ3JhX2RybS5oCj4gICBIRFJJTlNUIHVzci9pbmNsdWRl
L2RybS9kcm1fc2FyZWEuaAo+ICAgSERSSU5TVCB1c3IvaW5jbHVkZS9kcm0vcGFuZnJvc3RfZHJt
LmgKPiAgIEhEUklOU1QgdXNyL2luY2x1ZGUvZHJtL2RybS5oCj4gc2NyaXB0cy9NYWtlZmlsZS5t
b2RidWlsdGluOjU1OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtJyBmYWlsZWQK
PiBtYWtlWzJdOiAqKiogW2RyaXZlcnMvZ3B1L2RybV0gRXJyb3IgMgo+IHNjcmlwdHMvTWFrZWZp
bGUubW9kYnVpbHRpbjo1NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1JyBmYWlsZWQK
PiBtYWtlWzFdOiAqKiogW2RyaXZlcnMvZ3B1XSBFcnJvciAyCj4gbWFrZVsxXTogKioqIFdhaXRp
bmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPgo+IEFkZCAnZW5kaWYnIHRvIE1ha2VmaWxlIHRv
IHN0b3AgY29tcGlsZSBlcnJvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3Rp
bmRoLmtpbUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbWwvTWFrZWZpbGUgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmls
ZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUKPiBpbmRleCBh
MmViNTllLi41YjJhNjViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kbWwvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZG1sL01ha2VmaWxlCj4gQEAgLTQ0LDYgKzQ0LDcgQEAgQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMv
ZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjAubyA6PSAkKGRtbF9jY2ZsYWdzKQo+ICBDRkxB
R1NfJChBTUREQUxQQVRIKS9kYy9kbWwvZGNuMjAvZGlzcGxheV9ycV9kbGdfY2FsY18yMC5vIDo9
ICQoZG1sX2NjZmxhZ3MpCj4gIENGTEFHU18kKEFNRERBTFBBVEgpL2RjL2RtbC9kY24yMC9kaXNw
bGF5X21vZGVfdmJhXzIwdjIubyA6PSAkKGRtbF9jY2ZsYWdzKQo+ICBDRkxBR1NfJChBTUREQUxQ
QVRIKS9kYy9kbWwvZGNuMjAvZGlzcGxheV9ycV9kbGdfY2FsY18yMHYyLm8gOj0gJChkbWxfY2Nm
bGFncykKPiArZW5kaWYKPiAgaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8xCj4gIENGTEFH
U18kKEFNRERBTFBBVEgpL2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIxLm8gOj0gJChk
bWxfY2NmbGFncykKPiAgQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlf
cnFfZGxnX2NhbGNfMjEubyA6PSAkKGRtbF9jY2ZsYWdzKQo+IC0tCj4gMi42LjIKPgoKCi0tIApC
ZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
