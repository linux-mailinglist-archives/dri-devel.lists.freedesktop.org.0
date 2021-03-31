Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020934F666
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 03:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8C26E108;
	Wed, 31 Mar 2021 01:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6DA6E108;
 Wed, 31 Mar 2021 01:52:01 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id d12so18468741oiw.12;
 Tue, 30 Mar 2021 18:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HtluysCGFxvzN56Isuc00e1wSGT37UHuugimY4P6e2Q=;
 b=A+GU4x1wUuvV5UDG2gYxrtQQ0RjNlOlLAz5nYn717+qL+TgARU+SqiN5x2Pykc+1Tc
 umt0O0lcT5NaO5t6mgnryT4lassppRACJ5rilxILRjSekVqWpSUhuctM1l22NSL3OAsF
 npMMUUddpggPbkCod2lpm7yAKA0QNOZrOUIRU1XfYo+XVJFRPh9aLVLin2qoL2wwFLVr
 ktC8sw1D0CQy4OBcU6SkIWFBa643p+bHGe0GR3ApDepo+o5Ui/8NYD0MNDwtnzeltaop
 n2TPoLKCsZSUtfem6heccsWbLaxnzzCkWoTgcVaQffqsYpoEiWjXhp6/NjSi8Bh5IHVb
 2yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HtluysCGFxvzN56Isuc00e1wSGT37UHuugimY4P6e2Q=;
 b=L7O+/3RsAODhjE3GTAtBCaRmNmGKjQLejjglWTRIKIsxQ9Hq0Q9lNpRMx/8Bxh2E9F
 1a07ZD0TQoW6sjrkIQtSWWV3cyRTSLXZx8W/+TNlpfL/FbdKXMPRJD2ObJjXdQhBX0lt
 1yN9oEsQeZko8TCahitnVA4KSnOZpTL5Q2WGXUuvK38Rk/lA2MIc5cibaIBJ4BlQ/2Oj
 xhlDkoTi+gAPgm57uCBcv9ve/z1A5ox6EasTC/wxoDo4LbsgcyPbCspmGO3l7KWcJCcK
 jIdTCqUTOtvFVuOHQNlWeh6mVqlu+qDyKLf4xyqMEyphWq75Vvfo7op7HvscgH7GFpvJ
 dD+w==
X-Gm-Message-State: AOAM531dIn4cA1iYUtAqkSGdShqVsWYlcaThl66j0GhATc/gNoDORuQR
 1wm77YURiP37yWbq8aZYwAnjREYk6nQ9iAvro/A=
X-Google-Smtp-Source: ABdhPJz/7dbdBU45JLef4FhLi4Qwoujuc2g4zJNn2YZIExfKNONOdsC0gaS8kqKALwAuaONuz45RiK2wVvZmj6crRL0=
X-Received: by 2002:aca:4748:: with SMTP id u69mr559928oia.5.1617155520385;
 Tue, 30 Mar 2021 18:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PSnvFAcUt7T9q=L8v6sFGnLM72cot=Lq_+cs8cNHK5sg@mail.gmail.com>
 <ADoALwDyDqqKqolXZoBMHqqQ.3.1617068062644.Hmail.wanjiabing@vivo.com>
In-Reply-To: <ADoALwDyDqqKqolXZoBMHqqQ.3.1617068062644.Hmail.wanjiabing@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Mar 2021 21:51:49 -0400
Message-ID: <CADnq5_OcwwX43cJho_fw5L2VYTt5Jsh3S9H_GVO5_8OM8PoTTA@mail.gmail.com>
Subject: Re: Re: [PATCH] amd: display: dc: struct dc_state is declared twice
To: =?UTF-8?B?5LiH5a625YW1?= <wanjiabing@vivo.com>
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Jacky Liao <ziyu.liao@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 kael_w@yeah.net, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMjksIDIwMjEgYXQgOTozNiBQTSDkuIflrrblhbUgPHdhbmppYWJpbmdAdml2
by5jb20+IHdyb3RlOgo+Cj4KPiA+T24gU2F0LCBNYXIgMjcsIDIwMjEgYXQgMzoyOCBBTSBXYW4g
SmlhYmluZyA8d2FuamlhYmluZ0B2aXZvLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBzdHJ1Y3QgZGNf
c3RhdGUgaGFzIGJlZW4gZGVjbGFyZWQgYXQgMjczcmQgbGluZS4KPiA+PiBSZW1vdmUgdGhlIGR1
cGxpY2F0ZS4KPiA+PiBEZWxldGUgZHVwbGljYXRlIGJsYW5rIGxpbmVzLgo+ID4KPiA+Q2FuIHlv
dSBzcGxpdCB0aGVzZSBpbnRvIHNlcGFyYXRlIHBhdGNoZXM/Cj4gPgo+ID5BbGV4Cj4KPiBPSy4g
QnV0IGluIGZhY3QsIHdoYXQgSSBkaWQgIGlzIHNpbXBsZS4KPiBUaGUgbW9zdCBpbXBvcnRhbnQg
dGhpbmcgaXMgcmVtb3ZpbmcgdGhlIGR1cGxpY2F0ZQo+IHN0cnVjdCBkY19zdGF0ZSBkZWNsYXJh
dGlvbiBhdCA1ODV0aCBsaW5lLgo+IE90aGVycyBhcmUgYWxsIGRlbGV0aW5nIGR1cGxpY2F0ZSBi
bGFuayBsaW5lcy4KPgo+IFNvIG1heWJlIEkgc2hvdWxkIHNlbmQgdHdvIHBhdGNocywgb25lIGlz
IHJlbW92aW5nCj4gZHVwbGljYXRlIGRlY2xhcmF0aW9uLCB0aGUgb3RoZXIgaXMgZGVsZXRpbmcg
YmxhbmsgbGluZXM/Cj4KClllcy4gIFRoZXJlIGFyZSBzbyBtYW55IHdoaXRlc3BhY2UgY2hhbmdl
cyBpbiB0aGUgY29tbWl0IHRoYXQgaXQncwpoYXJkIHRvIHNlZSB0aGUgZnVuY3Rpb25hbCBjaGFu
Z2UuCgpBbGV4CgoKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFdhbiBKaWFiaW5nIDx3YW5qaWFi
aW5nQHZpdm8uY29tPgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGMuaCB8IDEwIC0tLS0tLS0tLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGRlbGV0aW9u
cygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKPiA+PiBpbmRleCAx
OGVkMGQzZjI0N2UuLmRjNjY3Mjk4YWI1YiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kYy5oCj4gPj4gQEAgLTIzNCw3ICsyMzQsNiBAQCBzdHJ1Y3QgZGNfc3RhdGljX3Nj
cmVlbl9wYXJhbXMgewo+ID4+ICAgICAgICAgdW5zaWduZWQgaW50IG51bV9mcmFtZXM7Cj4gPj4g
IH07Cj4gPj4KPiA+PiAtCj4gPj4gIC8qIFN1cmZhY2UgdXBkYXRlIHR5cGUgaXMgdXNlZCBieSBk
Y191cGRhdGVfc3VyZmFjZXNfYW5kX3N0cmVhbQo+ID4+ICAgKiBUaGUgdXBkYXRlIHR5cGUgaXMg
ZGV0ZXJtaW5lZCBhdCB0aGUgdmVyeSBiZWdpbm5pbmcgb2YgdGhlIGZ1bmN0aW9uIGJhc2VkCj4g
Pj4gICAqIG9uIHBhcmFtZXRlcnMgcGFzc2VkIGluIGFuZCBkZWNpZGVzIGhvdyBtdWNoIHByb2dy
YW1taW5nIChvciB1cGRhdGluZykgaXMKPiA+PiBAQCAtMjcyLDcgKzI3MSw2IEBAIHN0cnVjdCBk
YzsKPiA+PiAgc3RydWN0IGRjX3BsYW5lX3N0YXRlOwo+ID4+ICBzdHJ1Y3QgZGNfc3RhdGU7Cj4g
Pj4KPiA+PiAtCj4gPj4gIHN0cnVjdCBkY19jYXBfZnVuY3Mgewo+ID4+ICAgICAgICAgYm9vbCAo
KmdldF9kY2NfY29tcHJlc3Npb25fY2FwKShjb25zdCBzdHJ1Y3QgZGMgKmRjLAo+ID4+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkY19kY2Nfc3VyZmFjZV9wYXJhbSAqaW5w
dXQsCj4gPj4gQEAgLTI4MSw3ICsyNzksNiBAQCBzdHJ1Y3QgZGNfY2FwX2Z1bmNzIHsKPiA+Pgo+
ID4+ICBzdHJ1Y3QgbGlua190cmFpbmluZ19zZXR0aW5nczsKPiA+Pgo+ID4+IC0KPiA+PiAgLyog
U3RydWN0dXJlIHRvIGhvbGQgY29uZmlndXJhdGlvbiBmbGFncyBzZXQgYnkgZG0gYXQgZGMgY3Jl
YXRpb24uICovCj4gPj4gIHN0cnVjdCBkY19jb25maWcgewo+ID4+ICAgICAgICAgYm9vbCBncHVf
dm1fc3VwcG9ydDsKPiA+PiBAQCAtNTgxLDcgKzU3OCw2IEBAIHN0cnVjdCBkY19ib3VuZGluZ19i
b3hfb3ZlcnJpZGVzIHsKPiA+PiAgICAgICAgIGludCBtaW5fZGNmY2xrX21oejsKPiA+PiAgfTsK
PiA+Pgo+ID4+IC1zdHJ1Y3QgZGNfc3RhdGU7Cj4KPiBSZW1vdmluZyB0aGUgZHVwbGljYXRlIGlz
IGhlcmUuCj4gQW5kIG90aGVycyBhcmUgYWxsIGRlbGV0aW5nIGR1cGxpY2F0ZSBibGFuayBsaW5l
Lgo+Cj4gSSB0aGluayB0aGV5IGFyZSBpbiB0aGUgc2FtZSBmaWxlLiBJIHdhbnQgdG8gcmVtb3Zl
IHRoZSBkZWNsYXJhdGlvbiBmaXJzdC4KPiBCeSB0aGUgd2F5LCBJIGRlbGV0ZWQgdGhlIGJsYW5r
IGxpbmUuCj4KPiBZb3VycywKPiBXYW4gSmlhYmluZwo+Cj4gPj4gIHN0cnVjdCByZXNvdXJjZV9w
b29sOwo+ID4+ICBzdHJ1Y3QgZGNlX2h3c2VxOwo+ID4+ICBzdHJ1Y3QgZ3B1X2luZm9fc29jX2Jv
dW5kaW5nX2JveF92MV8wOwo+ID4+IEBAIC03NTcsNyArNzUzLDYgQEAgZW51bSBkY190cmFuc2Zl
cl9mdW5jX3ByZWRlZmluZWQgewo+ID4+ICAgICAgICAgVFJBTlNGRVJfRlVOQ1RJT05fR0FNTUEy
Ngo+ID4+ICB9Owo+ID4+Cj4gPj4gLQo+ID4+ICBzdHJ1Y3QgZGNfdHJhbnNmZXJfZnVuYyB7Cj4g
Pj4gICAgICAgICBzdHJ1Y3Qga3JlZiByZWZjb3VudDsKPiA+PiAgICAgICAgIGVudW0gZGNfdHJh
bnNmZXJfZnVuY190eXBlIHR5cGU7Cj4gPj4gQEAgLTc3MCw3ICs3NjUsNiBAQCBzdHJ1Y3QgZGNf
dHJhbnNmZXJfZnVuYyB7Cj4gPj4gICAgICAgICB9Owo+ID4+ICB9Owo+ID4+Cj4gPj4gLQo+ID4+
ICB1bmlvbiBkY18zZGx1dF9zdGF0ZSB7Cj4gPj4gICAgICAgICBzdHJ1Y3Qgewo+ID4+ICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBpbml0aWFsaXplZDoxOyAgICAgICAgIC8qaWYgM2RsdXQgaXMg
d2VudCB0aHJvdWdoIGNvbG9yIG1vZHVsZSBmb3IgaW5pdGlhbGl6YXRpb24gKi8KPiA+PiBAQCAt
Nzg0LDcgKzc3OCw2IEBAIHVuaW9uIGRjXzNkbHV0X3N0YXRlIHsKPiA+PiAgICAgICAgIHVpbnQz
Ml90IHJhdzsKPiA+PiAgfTsKPiA+Pgo+ID4+IC0KPiA+PiAgc3RydWN0IGRjXzNkbHV0IHsKPiA+
PiAgICAgICAgIHN0cnVjdCBrcmVmIHJlZmNvdW50Owo+ID4+ICAgICAgICAgc3RydWN0IHRldHJh
aGVkcmFsX3BhcmFtcyBsdXRfM2Q7Cj4gPj4gQEAgLTEwMTQsNyArMTAwNyw2IEBAIGVudW0gZGNf
c3RhdHVzIGRjX3ZhbGlkYXRlX2dsb2JhbF9zdGF0ZSgKPiA+PiAgICAgICAgICAgICAgICAgc3Ry
dWN0IGRjX3N0YXRlICpuZXdfY3R4LAo+ID4+ICAgICAgICAgICAgICAgICBib29sIGZhc3RfdmFs
aWRhdGUpOwo+ID4+Cj4gPj4gLQo+ID4+ICB2b2lkIGRjX3Jlc291cmNlX3N0YXRlX2NvbnN0cnVj
dCgKPiA+PiAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRjICpkYywKPiA+PiAgICAgICAg
ICAgICAgICAgc3RydWN0IGRjX3N0YXRlICpkc3RfY3R4KTsKPiA+PiBAQCAtMTE2Nyw3ICsxMTU5
LDYgQEAgc3RydWN0IGRjX2NvbnRhaW5lcl9pZCB7Cj4gPj4gICAgICAgICB1bnNpZ25lZCBzaG9y
dCBwcm9kdWN0Q29kZTsKPiA+PiAgfTsKPiA+Pgo+ID4+IC0KPiA+PiAgc3RydWN0IGRjX3Npbmtf
ZHNjX2NhcHMgewo+ID4+ICAgICAgICAgLy8gJ3RydWUnIGlmIHRoZXNlIGFyZSB2aXJ0dWFsIERQ
Q0QncyBEU0MgY2FwcyAoaW1tZWRpYXRlbHkgdXBzdHJlYW0gb2Ygc2luayBpbiBNU1QgdG9wb2xv
Z3kpLAo+ID4+ICAgICAgICAgLy8gJ2ZhbHNlJyBpZiB0aGV5IGFyZSBzaW5rJ3MgRFNDIGNhcHMK
PiA+PiBAQCAtMTIyOSw3ICsxMjIwLDYgQEAgc3RydWN0IGRjX2N1cnNvciB7Cj4gPj4gICAgICAg
ICBzdHJ1Y3QgZGNfY3Vyc29yX2F0dHJpYnV0ZXMgYXR0cmlidXRlczsKPiA+PiAgfTsKPiA+Pgo+
ID4+IC0KPiA+PiAgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiA+PiAgICogSW50ZXJydXB0IGlu
dGVyZmFjZXMKPiA+PiAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KPiA+PiAtLQo+ID4+IDIuMjUu
MQo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
