Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18738EA190
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 17:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031FD6EAA0;
	Wed, 30 Oct 2019 16:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99366EAA0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 16:17:26 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m19so2654168otp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 09:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Cj2/HXDLn8aS6ESVlsFGccn1N9mdAGQmhGwS0g3eOU=;
 b=QBBsIWMsqcQS1FJmYofiIJO1npBgMxgzijA4bkQLERZMOOOAtZj3vV+7eMmcO795e2
 DwCrxk0EIdJ4TgGqPLWOgBiPQu0/WVaMMpBdwgcNaAwNR8tPj+58PRz2Q/GCVYZn6MEk
 1TBHpmcMsqsDPBP2QFFnmFZlhQFTnbDHKqAHAQSN53Hkrc82/LeDVKgzNoOkS7tIy5vB
 TgAFZPjVtpLdgXrSKAxlSM3LSofBECo6yh05OT4lXLAk9Eyik8fPuwzzHeLnv7HRH8T8
 ntnf2NN+I3NjSiNQwU79V1/XkIs69hKJTAFHvL/GvjnDHytdLnSnUeP6jVDgfQmbUYmL
 nMcQ==
X-Gm-Message-State: APjAAAUxTVlKCML+vIyIxSaxQ+d129nHkEnVaF9pgiiQvhAbO2PWrCCl
 38XeDPK0pXQjkDKkNiDrHvLXWym3u80DcLZUQNaBNw==
X-Google-Smtp-Source: APXvYqyGIZXSa+DtUjwBGchbvDWoC92JPTPDAXB5UsVtXZB+/gNvTOEkAQTyhFxO7Jk/E+0BUW/SIrYMDoyFssBoOgQ=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr590885otk.332.1572452245946; 
 Wed, 30 Oct 2019 09:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191029182943.GD17569@mwanda>
In-Reply-To: <20191029182943.GD17569@mwanda>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 30 Oct 2019 09:17:14 -0700
Message-ID: <CALAqxLU7k-z6JXbEFpK0D_7+jZz_Jdk7HxaSWm_rkBFEpQRQtg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix a warning message in
 dma_heap_buffer_destroy()
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9Cj2/HXDLn8aS6ESVlsFGccn1N9mdAGQmhGwS0g3eOU=;
 b=loU8peBfVBq5shNbsqNfvsPiuBIenx6sek1Jikn6Qw5VElJ/47se4ZkXOea0N6HeSa
 9zAyMBnaKpBimNv0jGpE0U91oZAwjjqEThIvGbvEh/b0QLikNWo8VGlAmT/bTAHOUWmU
 3hFjaeUV34lRbrVScSy2IsEY9nR+gpOfVN8SVAGT1gKm0KFAyNXy2TPGmcXzK4srOTZr
 mo1wxLIuM5CHZriAkh9FZKoq3uS6L1IPsJ3HfPK0UYIMrImPc5E73qHHO11WtnN7oMrS
 HEEsXqengkEwOOwf6HOWS0EHde8/2ZyMabv0NgJ1o0X4IcmnChdnnEdjH8uqhxt4oHel
 4NHg==
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
Cc: kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTE6MzEgQU0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPiB3cm90ZToKPgo+IFRoZSBmaXJzdCBhcmd1bWVudCBvZiBXQVJOKCkg
aXMgYSBjb25kaXRpb24gc28gdGhpcyB3aWxsIGp1c3QgcHJpbnQgdGhlCj4gZnVuY3Rpb24gbmFt
ZSBpbnN0ZWFkIG9mIHRoZSB3aG9sZSB3YXJuaW5nIG1lc3NhZ2UuCj4KPiBGaXhlczogN2I4N2Vh
NzA0ZmQ5ICgiZG1hLWJ1ZjogaGVhcHM6IEFkZCBoZWFwIGhlbHBlcnMiKQo+IFNpZ25lZC1vZmYt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVh
cC1oZWxwZXJzLmMKPiBpbmRleCA3NTBiZWY0ZTkwMmQuLmEzMTY4NGMwZDViMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiArKysgYi9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiBAQCAtNTIsNyArNTIsNyBAQCBzdGF0aWMg
dm9pZCAqZG1hX2hlYXBfbWFwX2tlcm5lbChzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpidWZm
ZXIpCj4gIHN0YXRpYyB2b2lkIGRtYV9oZWFwX2J1ZmZlcl9kZXN0cm95KHN0cnVjdCBoZWFwX2hl
bHBlcl9idWZmZXIgKmJ1ZmZlcikKPiAgewo+ICAgICAgICAgaWYgKGJ1ZmZlci0+dm1hcF9jbnQg
PiAwKSB7Cj4gLSAgICAgICAgICAgICAgIFdBUk4oIiVzOiBidWZmZXIgc3RpbGwgbWFwcGVkIGlu
IHRoZSBrZXJuZWxcbiIsIF9fZnVuY19fKTsKPiArICAgICAgICAgICAgICAgV0FSTigxLCAiJXM6
IGJ1ZmZlciBzdGlsbCBtYXBwZWQgaW4gdGhlIGtlcm5lbFxuIiwgX19mdW5jX18pOwo+ICAgICAg
ICAgICAgICAgICB2dW5tYXAoYnVmZmVyLT52YWRkcik7Cj4gICAgICAgICB9CgpUaGFua3MgZm9y
IGNhdGNoaW5nIGFuZCByZXBvcnRpbmcgdGhpcyEKCkFja2VkLWJ5OiBKb2huIFN0dWx0eiA8am9o
bi5zdHVsdHpAbGluYXJvLm9yZz4KClN1bWl0LCBkbyB5b3UgbWluZCBwaWNraW5nIHRoaXMgdXAg
Zm9yIGRybS1taXNjLW5leHQ/Cgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
