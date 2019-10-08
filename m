Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB45CCFC85
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AE36E7DD;
	Tue,  8 Oct 2019 14:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1B66E7DD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:36:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id y21so3409309wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMXp0FfZp4n8/Lz/3KOIbPZ4+kfqt7SIXFg7xoVqhR8=;
 b=nWf0+UpHHqYck+ykiYe+Idlx7ifUkUxGc3IbUHCTAneQKujt7dfzVFUNzeEbbrDP5W
 xIkjjxbFi+IcdGXwdCNJQZABMd7FDl1s2scux76rc2TpS92wVhKpsSMcai6AldKMJZo8
 XYLHx6nzeh2Gqe5qg/HcFBYRv4gCkJHVY7uCGnv8pabFfRApCixqOGCsbxBexqo6cJDY
 MI+x6fSgNO52AFjv0TXcXeXd++hj10Lub2uQze1EY5/RnrcX9rNJvGyzZnrNYGDLZnPs
 Ou672vLZejvK+4zLjztDSAJwYmSCfUJrTeDPA96UH6NRutSdzvomYo5+VDBVIed0NpjW
 MWGA==
X-Gm-Message-State: APjAAAX0Dw4tUdv1rkubeNx6NrIr+udwWjSnc0yPfzk1o5O2uox9xCdi
 q64WXFbqX/CYuz/GuyyN4HFm7NXPV+YiXgCmngStKLos
X-Google-Smtp-Source: APXvYqyBDrU+XWYfly8igd8ucwCAeX1EZazBxIQV1M3XgLxb/BjJ8U0ebSwCwmbqQTwMsQCCKX8rcb/yLIYtZZ78m9Y=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr4274163wmo.67.1570545361311; 
 Tue, 08 Oct 2019 07:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
 <871rvopgjj.fsf@keithp.com>
 <CAPj87rPe2oLXSU8cLsCPJZG6JXRsijZtpaeSWJy5ZfFbr3i1KA@mail.gmail.com>
In-Reply-To: <CAPj87rPe2oLXSU8cLsCPJZG6JXRsijZtpaeSWJy5ZfFbr3i1KA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Oct 2019 10:35:48 -0400
Message-ID: <CADnq5_P6b16AJPbk1N447z+tQXxuX2KCtKVGXO+4t2596Z5=+Q@mail.gmail.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dMXp0FfZp4n8/Lz/3KOIbPZ4+kfqt7SIXFg7xoVqhR8=;
 b=GBoZ6JSgKgrshxRa8t5O5qIbKCJehdKLp1DIymm1F4ilvoP04gNG1maSe6m9GaURno
 ARLwzXM8Hp5xImH+zdMQrMWdLAQIzp0zDCQyk3ECI5iWscW8cDuraJYWaSAU8jau1wol
 Y9EJkiNDvl4E64N9R5XN07aPKsIYphuRG53zdykrlC4datOm7iQmW+7uhbu0ehkNq2qR
 w4fNDoP5mbCopoIUMhet4VwxAyRgzaYBITOpm1EkcwtVm782uY7YcKeQ1B6Ed+r54Q+k
 aFDGH9p98K+3H4DGPLTUvqNdd5xQ70FKgL01DtBrgZRcDs1Bae3EMoPem8QBS2n5d2zF
 6haw==
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
Cc: Keith Packard <keithp@keithp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA1OjMyIEFNIERhbmllbCBTdG9uZSA8ZGFuaWVsQGZvb2lz
aGJhci5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIDcgT2N0IDIwMTkgYXQgMTk6MTYs
IEtlaXRoIFBhY2thcmQgPGtlaXRocEBrZWl0aHAuY29tPiB3cm90ZToKPiA+IERhbmllbCBTdG9u
ZSA8ZGFuaWVsQGZvb2lzaGJhci5vcmc+IHdyaXRlczoKPiA+ID4gSSB0aGluayB0aGVyZSB3b3Vs
ZCBiZSBhIGxvYWQgb2YgdmFsdWUgaW4gc3RhcnRpbmcgd2l0aCBzaW1wbGUgaGVscGVycwo+ID4g
PiB3aGljaCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVudGx5IG9mIGFueSBsYXJnZXIgc2NoZW1lLCB0
YWNrbGluZyB0aGF0Cj4gPiA+IGxpc3QgYWJvdmUuCj4gPgo+ID4gWWVhaCwgYSBoZWxwZXIgbGli
cmFyeSB0aGF0IGRpZG4ndCBlbmZvcmNlIGF0IHRvbm5lIG9mIHBvbGljeSBhbmQganVzdAo+ID4g
bGV0IHRoZSB1c2VyIGdsdWUgdGhpbmdzIHRvZ2V0aGVyIG9uIHRoZWlyIG93biBpcyBwcm9iYWJs
eSBnb2luZyB0byBiZQo+ID4gbW9yZSBnZW5lcmFsbHkgdXNhYmxlIGJ5IGV4aXN0aW5nIGFuZCBu
ZXcgc3lzdGVtcy4KPgo+IFRvIGVsYWJvcmF0ZSBhIGxpdHRsZSBiaXQsIG9uZSBvZiB0aGUgcmVh
c29ucyBJJ20gbG9hdGggdG8gaGlkZQo+IGNvbXBsZXhpdHkgbGlrZSB0cmFuc2Zvcm1zLCBjb2xv
dXIgbWFuYWdlbWVudCwgYW5kIHRpbWluZyBhd2F5IGluIGFuCj4gZW5jYXBzdWxhdGVkIGxvd2Vy
IGxheWVyLCBpcyBiZWNhdXNlIEkgaGF2ZSB0byBleHBvc2UgYWxsIHRob3NlCj4gZGV0YWlscyBh
bnl3YXkuIFVsdGltYXRlbHkgdG8gbWFrZSB0aG9zZSB3b3JrIHByb3Blcmx5LCB3ZSdsbCByZXF1
aXJlCj4gYXdhcmVuZXNzIG5vdCBqdXN0IGluIHRoZSBjb21wb3NpdG9yIGl0c2VsZiwgYnV0IHB1
c2hlZCB0aHJvdWdoIHRvCj4gY2xpZW50cy4KPgo+IFdheWxhbmQgYWxyZWFkeSBoYXMgZmFjaWxp
dHkgZm9yIGluZm9ybWluZyBjbGllbnRzIGFib3V0IG91dHB1dAo+IHRyYW5zZm9ybXMgc28gdGhl
eSBjYW4gcmVuZGVyIHByZS1yb3RhdGVkIGFuZCBhdm9pZCB0aGUKPiBjb21wb3NpdG9yLXNpZGUg
dHJhbnNmb3JtOyBpbiBvcmRlciB0byBtYWtlIEhEUiBhbmQgb3RoZXIgY29sb3VyCj4gbWFuYWdl
bWVudCAoZS5nLiBqdXN0IHNpbXBsZSBjYWxpYnJhdGlvbikgcHJvcGVybHkgd2UgbmVlZCB0byBo
YXZlCj4gZnVsbCBwbHVtYmluZyBiYWNrIHRocm91Z2ggdG8gY2xpZW50czsgZG9pbmcgdGltaW5n
IHByb3Blcmx5LAo+IHBhcnRpY3VsYXJseSBmb3IgbXVsdGlwbGUgc2ltdWx0YW5lb3VzIGNsaWVu
dHMsIGFsc28gcmVxdWlyZXMgYSBmYWlyCj4gYml0IG9mIG1lY2hhbmljcyBhbmQgYmFjay1hbmQt
Zm9ydGguCj4KPiBUaGVyZSdzIGEgbG90IHRoYXQgd2UgY291bGQgdXNlZnVsbHkgc2hhcmUgYmV0
d2VlbiBhbGwgdGhlIHVzZXJzLCBhbmQKPiBoYXZpbmcgYSBzaGFyZWQgbGlicmFyeSB0byBoZWxw
IHdpdGggdGhhdCB3b3VsZCBiZSBncmVhdC4gQnV0IHRoZQo+IHRob3VnaHQgb2YgdHVja2luZyBp
dCBhbGwgYXdheSBpbiBhbiBvcGFxdWUgbGF5ZXIgd2hpY2ggKCp3YXZlcwo+IGhhbmRzKikganVz
dCBkb2VzIGl0LCBnaXZlcyBtZSBjb2xkIEVHTFN0cmVhbXMgc3dlYXRzLgo+Cj4gTWF5YmUgYSBn
b29kIHBsYWNlIHRvIHN0YXJ0IGlzIGlmIHdlIGFsbCBsaXN0ZWQgdGhlIGJpdHMgb2YgY29kZSB3
aGljaAo+IHdlJ2QgYmUgZGVsaWdodGVkIHRvIGpldHRpc29uPwoKT24gdGhlIGZsaXBzaWRlLCBp
dCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgb25lIHNldCBvZiBjb2RlIHRvIGRvCm1vZGVzZXRzIGZy
b20gdXNlcnNwYWNlLiAgQ2VydGFpbmx5IHNpbXBsaWZpZXMgUUEgc2luY2UgaW4gdGhlb3J5IHdl
CnNob3VsZCBiZSBzZWVpbmcgdGhlIHNhbWUgc2VxdWVuY2VzIGZyb20gYWxsIGFwcHMgdXNpbmcg
dGhlIGhlbHBlcnMKcmF0aGVyIHRoYW4gZXZlcnkgYXBwIHJvbGxpbmcgdGhlaXIgb3duIGFuZCBn
ZXR0aW5nIGl0IHN1YnRseQpkaWZmZXJlbnQgZW5vdWdoIHRoYXQgc3RyYW5nZSB0aGluZ3MgaGFw
cGVuIHdpdGggZGlmZmVyZW50CmNvbXBvc2l0b3JzLgoKV2hpbGUgd2UgYXJlIG9uIHRoZSB0b3Bp
YywgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIGEgY2VudHJhbCBwbGFjZQpmb3Igcm9idXN0bmVz
cy9jb250ZXh0IGxvc3QgaGFuZGxpbmcgZm9yIGNvbXBvc2l0b3JzIHNvIHdlIGNhbgpwcm9wZXJs
eSBoYW5kbGUgR1BVIHJlc2V0cy4gIE5vdCBzdXJlIHRoYXQgaXMgcmVhbGx5IHBvc3NpYmxlIHRo
b3VnaC4KCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
