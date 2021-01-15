Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BA2F8164
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 18:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18DD6E457;
	Fri, 15 Jan 2021 17:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F216E457;
 Fri, 15 Jan 2021 17:01:49 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id c18so3378496oto.3;
 Fri, 15 Jan 2021 09:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DXpm7GStxN7ueNzJeFZx6YEVIUYzCgEAymjApZ+FU9U=;
 b=Q6bpdDKxD6DnywsBmm3IfecEjuTsSrQ1nfBO/5dCsqKrvBMNE7INqWw3wTX/iJR1DR
 2wo9bAvowhjqzoS2yJisfdMsYFPzX4YaSnJQCMexQMkLz9PUS6nxD8M3k+bJ9svqeRYh
 JE8jN6NotsH2rJ8xES0E+KqoVvn7xrqalHGfF7+wEx7rDjfYYajMGI7JkIyLR9bMX8ST
 yobRGInYf79KmC7lPL6rxL4YWQ8yxKbs8vS3qfhb65LnCgfZu1KLYsODL2Dq5hi6PuVW
 /kAsuSlv7VwDFq0jRJhr1pOFWfP+KNRasx9ZAnTKJCvVXYsnCSifrfL9K2C5ZgSD+IUM
 3oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DXpm7GStxN7ueNzJeFZx6YEVIUYzCgEAymjApZ+FU9U=;
 b=OzIcLi7kMvkQ+I5fSUbrINJJp2N//3nSnQ0XZulNAMAyDT0xg8ZW4g0IAYw8QaQfhs
 PNoh/IYBbrSbloq9NsOwuUNbkPsPxss7hFycb2fA9+Iu93CWzeL4nakQYhacgyp/42/C
 0Gox0Nhij5T+dKqAqezskw/E5Ax5c9Intk0yiuBhH+G72ENwX9zX6qHDIwYYtZHkTS75
 /o3KxY/ea6etex4sjlEmdrxGeDCWFC3v/QAjLOJn9RAwgjvX9pUJ85GQG4TOHTEBSn6C
 MiouCc9oeKCAgtNH1VCa+F2vt8c7RzHNv9qtJyY2kKN83kT/vF60thIJmc9K5vYtXium
 xHnA==
X-Gm-Message-State: AOAM532FJuaXP04Zo21rIyn21Z0DCZjYZ3ZshpX135+5kKlX6e4f8UBI
 kfLpHEJo4YwbLGBmzMX0mq14Cw0vZVJQ4fnBgf8=
X-Google-Smtp-Source: ABdhPJwwI/mFH/Zg+tJABNDI6Rlh7NhHiyEVx4qu+cFvQ5SkSOpOMjM3e6+/YT/hifZC7JYKKQaIAHMbUM1Szun8yMQ=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr8883183otb.23.1610730108728; 
 Fri, 15 Jan 2021 09:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20210114212148.23714-1-alexander.deucher@amd.com>
 <CAPM=9tyS_JyY3=ZSmrmmgfK=Cm1NRcMjpgA3Jj=BZXPH=Ady0w@mail.gmail.com>
 <CADnq5_N5ZwypdZtY8Dp-p+H-ew-X5=dBTgc3p6duBH6=fXTU6g@mail.gmail.com>
In-Reply-To: <CADnq5_N5ZwypdZtY8Dp-p+H-ew-X5=dBTgc3p6duBH6=fXTU6g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 15 Jan 2021 12:01:37 -0500
Message-ID: <CADnq5_Nv_Sy1nZGQbLoxn1F3dT29NaKXnJq=gzdOGqWy+wRypg@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-next-5.12
To: Dave Airlie <airlied@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMTUsIDIwMjEgYXQgOTo1MSBBTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEphbiAxNSwgMjAyMSBhdCAyOjI4IEFNIERh
dmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCAxNSBK
YW4gMjAyMSBhdCAwNzoyMiwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBIaSBEYXZlLCBEYW5pZWwsCj4gPiA+Cj4gPiA+IE1vcmUgbmV3IHN0
dWZmIGZvciA1LjEyLgo+ID4gPgo+ID4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDA0NGE0OGY0MjBiOWQzYzE5YTEzNWI4MjFjMzRkZTViMmJlZTQwNzU6Cj4gPiA+Cj4gPiA+
ICAgZHJtL2FtZGdwdTogZml4IERSTV9JTkZPIGZsb29kIGlmIGRpc3BsYXkgY29yZSBpcyBub3Qg
c3VwcG9ydGVkIChidWcgMjEwOTIxKSAoMjAyMS0wMS0wOCAxNToxODo1NyAtMDUwMCkKPiA+ID4K
PiA+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gPiA+Cj4gPiA+
ICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4LmdpdCB0YWdzL2Ft
ZC1kcm0tbmV4dC01LjEyLTIwMjEtMDEtMTQKPiA+ID4KPiA+ID4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIGRmMWYwNTYwZDI4ZjQ4OTVlMmQ2MWFmODI2NzI4ZWZiNjE5NzZmOWY6Cj4g
PiA+Cj4gPiA+ICAgZHJtL2FtZC9kaXNwbGF5OiBTaW1wbGlmeSBib29sIGNvbXBhcmlzb24gKDIw
MjEtMDEtMTQgMTM6MjA6MjEgLTA1MDApCj4gPgo+ID4gYXJtIDMyLzY0IGJ1aWxkcyBzYXkgbm8u
Cj4gPgo+ID4gICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2lu
c3RtZW0vZ2syMGEubwo+ID4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jOgo+
ID4gSW4gZnVuY3Rpb24g4oCYdmFuZ29naF9nZXRfc211X21ldHJpY3NfZGF0YeKAmToKPiA+IC9o
b21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzozMDA6MTA6Cj4gPiBlcnJvcjog4oCY
Ym9vdF9jcHVfZGF0YeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7
IGRpZAo+ID4geW91IG1lYW4g4oCYYmxfZ2V0X2RhdGHigJk/Cj4gPiAgICAgICAgICAgYm9vdF9j
cHVfZGF0YS54ODZfbWF4X2NvcmVzICogc2l6ZW9mKHVpbnQxNl90KSk7Cj4gPiAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fgo+ID4gICAgICAgICAgIGJsX2dldF9kYXRhCj4gPiAvaG9tZS9haXJsaWVk
L2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3
c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6MzAwOjEwOgo+ID4gbm90ZTogZWFjaCB1bmRlY2xhcmVk
IGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoCj4gPiBmdW5jdGlvbiBp
dCBhcHBlYXJzIGluCj4gPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6Cj4g
PiBJbiBmdW5jdGlvbiDigJh2YW5nb2doX3JlYWRfc2Vuc29y4oCZOgo+ID4gL2hvbWUvYWlybGll
ZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9z
d3NtdS9zbXUxMS92YW5nb2doX3BwdC5jOjEzMjA6MTE6Cj4gPiBlcnJvcjog4oCYYm9vdF9jcHVf
ZGF0YeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZAo+ID4g
eW91IG1lYW4g4oCYYmxfZ2V0X2RhdGHigJk/Cj4gPiAgICAqc2l6ZSA9IGJvb3RfY3B1X2RhdGEu
eDg2X21heF9jb3JlcyAqIHNpemVvZih1aW50MTZfdCk7Cj4gPiAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn4KPiA+ICAgICAgICAgICAgYmxfZ2V0X2RhdGEKPiA+IC9ob21lL2FpcmxpZWQvZGV2ZWwv
a2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211
MTEvdmFuZ29naF9wcHQuYzoKPiA+IEluIGZ1bmN0aW9uIOKAmHZhbmdvZ2hfb2RfZWRpdF9kcG1f
dGFibGXigJk6Cj4gPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6MTQ2MDox
OToKPiA+IGVycm9yOiDigJhib290X2NwdV9kYXRh4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKTsgZGlkCj4gPiB5b3UgbWVhbiDigJhibF9nZXRfZGF0YeKAmT8KPiA+
ICAgIGlmIChpbnB1dFswXSA+PSBib290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMpIHsKPiA+ICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gPiAgICAgICAgICAgICAgICAgICAgYmxf
Z2V0X2RhdGEKPiA+IG1ha2VbNV06ICoqKiBbL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGlt
L3NyYy9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI3OToKPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0Lm9dIEVycm9yIDEKPiA+Cj4gPgo+
ID4gTm90IHN1cmUgdXNpbmcgYm9vdF9jcHVfZGF0YSBpbiBhIGRyaXZlciBpcyB0aGF0IGdvb2Qg
YW4gaWRlYSwgbWF5YmUKPiA+IHRoZXJlIGlzIGEgYmV0dGVyIGludGVyZmFjZSB0byBnZXQgdGhh
dCBzb3J0IG9mIGluZm9ybWF0aW9uLCBidXQgZXZlbgo+ID4gc28gaXQgc2hvdWxkIGJ1aWxkIG9u
IGFybS4KPgo+IEknbSBub3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGdlbmVyaWMgaW50ZXJmYWNlIGZv
ciB0aGlzIG9yIG5vdCwgYnV0IHRoaXMKPiBpcyBmb3IgU09DIHBvd2VyIG1hbmFnZW1lbnQgb24g
YW4gQVBVLCBzbyBpdCdzIG9ubHkgcmVsZXZhbnQgdG8geDg2Lgo+IEknbGwgc2VuZCBvdXQgYSBw
YXRjaCB0byBmaXggdGhlIGJ1aWxkLgoKTG9va3MgbGlrZSBSYXkgYWxyZWFkeSBzZW50IG91dCB0
aGUgZml4LiAgSSdsbCBzZW5kIGEgbmV3IFBSIG9uY2UgdGhpcwppcyBpbnRlZ3JhdGVkLgoKVGhh
bmtzLAoKQWxleAoKPgo+IEFsZXgKPgo+Cj4gPgo+ID4gRGF2ZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
