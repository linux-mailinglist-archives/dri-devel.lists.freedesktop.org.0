Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAFA2F73B2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 08:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809CE6E175;
	Fri, 15 Jan 2021 07:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377B76E175;
 Fri, 15 Jan 2021 07:28:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g12so11892239ejf.8;
 Thu, 14 Jan 2021 23:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NrxgxKZiD/0jpwx+HVWKk4wc/9MDZ8dG252jqB+tr8M=;
 b=i0rMwvY0eVxe8USPf0VxuHA5PJWvWMBQcipMxA8VPozFoAEl4w8aFPw7fKjvZYpmtQ
 wUds0xmVMEtCBLIMuLrWRuMxYeYIvbuKRGZ6hodzivaeC0Jrl/ILUuFfdffCtePRHkid
 xnwqvzUFOhbfVp2FzRo0UpYiG41aquBdfoslPe9oz7P7e1pEcyQwWpG7DYJMr0dP3Efk
 tzW2H+2O2qZsZZvSKSK52pYS4e2cRsY0WC3Nxw0pL7iwU9BHDWM4z2qsCZa+AHSXZJdr
 /uBKV0H3PLUEYPnHJ3i9x+3xn1UEq73NOJ7F9dEDq9534FrR3oKrepSWnUyXcIU14Fid
 JnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NrxgxKZiD/0jpwx+HVWKk4wc/9MDZ8dG252jqB+tr8M=;
 b=ISb4gkYFTcTc10cYRTeqOAHr9qUQpcwRsVSPczQTs+bRG4a4LvgOuf2n0EH4dmSehk
 PFXZb1K8MCTOgr93hxWgNU76bPyp0d+/jXAbz/BlLK6eNVSbSKgp77e/NCqwVPynfsMR
 utZW6/X8lgKlr30m7DR1mBa8MBcxL+3Hj/eXc1CUqfrEZrs9ibZA32UIrfuvkCEifMsg
 RVZZcE9DO0gQ3cduhXBCZmxsr00SaY8FQQtcxxauB2/q/XCzUSxBVyfsotZdd7RQ3uGv
 g9nCa6QYsfu24vACVIYZ/QOuhtZASVUt5PreT5QVPZxIPyKFMfwLJbvsZFVD9/xp2QGF
 bZoA==
X-Gm-Message-State: AOAM532ndh3BYv7Cg6REdxgawMjl5HFeDi/yZ2xwpMNVn1aLSDLGjng8
 4SwcN4WIjmWwIl1rXh/ev0PMo1nMjtA4gq0NgdA=
X-Google-Smtp-Source: ABdhPJxRtZi2TPKS7GQy9ToZQF0N1OPKG+3UV+hDdlLmpRxL7Fzh3E+dHEBV1ZBvpgeRuaw82Gy0ljTH+6sbdNnpQiM=
X-Received: by 2002:a17:907:16a2:: with SMTP id
 hc34mr8026152ejc.9.1610695711768; 
 Thu, 14 Jan 2021 23:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20210114212148.23714-1-alexander.deucher@amd.com>
In-Reply-To: <20210114212148.23714-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Jan 2021 17:28:20 +1000
Message-ID: <CAPM=9tyS_JyY3=ZSmrmmgfK=Cm1NRcMjpgA3Jj=BZXPH=Ady0w@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-next-5.12
To: Alex Deucher <alexdeucher@gmail.com>
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

T24gRnJpLCAxNSBKYW4gMjAyMSBhdCAwNzoyMiwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwgRGFuaWVsLAo+Cj4gTW9yZSBuZXcgc3R1ZmYg
Zm9yIDUuMTIuCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDA0NGE0OGY0
MjBiOWQzYzE5YTEzNWI4MjFjMzRkZTViMmJlZTQwNzU6Cj4KPiAgIGRybS9hbWRncHU6IGZpeCBE
Uk1fSU5GTyBmbG9vZCBpZiBkaXNwbGF5IGNvcmUgaXMgbm90IHN1cHBvcnRlZCAoYnVnIDIxMDky
MSkgKDIwMjEtMDEtMDggMTU6MTg6NTcgLTA1MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Fn
ZDVmL2xpbnV4LmdpdCB0YWdzL2FtZC1kcm0tbmV4dC01LjEyLTIwMjEtMDEtMTQKPgo+IGZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkZjFmMDU2MGQyOGY0ODk1ZTJkNjFhZjgyNjcyOGVm
YjYxOTc2ZjlmOgo+Cj4gICBkcm0vYW1kL2Rpc3BsYXk6IFNpbXBsaWZ5IGJvb2wgY29tcGFyaXNv
biAoMjAyMS0wMS0xNCAxMzoyMDoyMSAtMDUwMCkKCmFybSAzMi82NCBidWlsZHMgc2F5IG5vLgoK
ICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2luc3RtZW0vZ2sy
MGEubwovaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6CkluIGZ1bmN0aW9uIOKA
mHZhbmdvZ2hfZ2V0X3NtdV9tZXRyaWNzX2RhdGHigJk6Ci9ob21lL2FpcmxpZWQvZGV2ZWwva2Vy
bmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEv
dmFuZ29naF9wcHQuYzozMDA6MTA6CmVycm9yOiDigJhib290X2NwdV9kYXRh4oCZIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkCnlvdSBtZWFuIOKAmGJsX2dldF9k
YXRh4oCZPwogICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzICogc2l6ZW9mKHVp
bnQxNl90KSk7CiAgICAgICAgICBefn5+fn5+fn5+fn5+CiAgICAgICAgICBibF9nZXRfZGF0YQov
aG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6MzAwOjEwOgpub3RlOiBlYWNoIHVu
ZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2gKZnVuY3Rp
b24gaXQgYXBwZWFycyBpbgovaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6Cklu
IGZ1bmN0aW9uIOKAmHZhbmdvZ2hfcmVhZF9zZW5zb3LigJk6Ci9ob21lL2FpcmxpZWQvZGV2ZWwv
a2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211
MTEvdmFuZ29naF9wcHQuYzoxMzIwOjExOgplcnJvcjog4oCYYm9vdF9jcHVfZGF0YeKAmSB1bmRl
Y2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZAp5b3UgbWVhbiDigJhibF9n
ZXRfZGF0YeKAmT8KICAgKnNpemUgPSBib290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMgKiBzaXpl
b2YodWludDE2X3QpOwogICAgICAgICAgIF5+fn5+fn5+fn5+fn4KICAgICAgICAgICBibF9nZXRf
ZGF0YQovaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6CkluIGZ1bmN0aW9uIOKA
mHZhbmdvZ2hfb2RfZWRpdF9kcG1fdGFibGXigJk6Ci9ob21lL2FpcmxpZWQvZGV2ZWwva2VybmVs
L2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFu
Z29naF9wcHQuYzoxNDYwOjE5OgplcnJvcjog4oCYYm9vdF9jcHVfZGF0YeKAmSB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZAp5b3UgbWVhbiDigJhibF9nZXRfZGF0
YeKAmT8KICAgaWYgKGlucHV0WzBdID49IGJvb3RfY3B1X2RhdGEueDg2X21heF9jb3Jlcykgewog
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgogICAgICAgICAgICAgICAgICAgYmxfZ2V0
X2RhdGEKbWFrZVs1XTogKioqIFsvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjc5Ogpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
bS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5vXSBFcnJvciAxCgoKTm90IHN1cmUgdXNpbmcgYm9v
dF9jcHVfZGF0YSBpbiBhIGRyaXZlciBpcyB0aGF0IGdvb2QgYW4gaWRlYSwgbWF5YmUKdGhlcmUg
aXMgYSBiZXR0ZXIgaW50ZXJmYWNlIHRvIGdldCB0aGF0IHNvcnQgb2YgaW5mb3JtYXRpb24sIGJ1
dCBldmVuCnNvIGl0IHNob3VsZCBidWlsZCBvbiBhcm0uCgpEYXZlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
