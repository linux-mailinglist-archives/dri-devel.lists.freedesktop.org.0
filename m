Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57604229283
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFBD89E5F;
	Wed, 22 Jul 2020 07:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F4289E5F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 07:47:10 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j11so1057696oiw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yCLyd39bQLlumr6AlaAml/QA6lBeJQv1XOepW1JkfSE=;
 b=FqzuAte1LOt2aX5v5MQuVPWswNeWwAXL7RhPLOu5MFU7jEFJJ58sjODBYd3vsLlDcw
 2LekBNyP1QTDw8IBb1ML6rDSBgwwKP37AAhSltZPACvn8P3Ygnv0E8jn4Tm4CFpoRWHZ
 jAgs+tJW0lPYI2eZpEj/yxiHph5aM1AH4FJxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yCLyd39bQLlumr6AlaAml/QA6lBeJQv1XOepW1JkfSE=;
 b=FVrqMmENc4h4YDy1GLp6K3cBjHDueYhEGejgj2hLEGykd4S5AuW8uu2/i+cXgYCsz3
 TNiPYeqk1jmyXsdwMtrx9NDKoszJtTRuHWUpUAarwl129XH3nd3F6nSX1U2eFPH+8nA6
 Rg69yU5o7yjuzu6QS1qjiQbb0Mwl/9T2TuJ5eyKsgL5KNxxV/8TiqSzpWc8aGHUX04Fh
 7WnRMoaMQtGz1vjRvT5IVdFVT0IiKSpYJPnKWfaPgafFra6uq7jNPiVmVBN+fJ7aMShK
 rPuqKCv5NHFx2OrhgQR/aS1/XPXWg1w56cH5SGxOLm/C7EO4nFvuw7xgJrWdYOGoxaE9
 hwvw==
X-Gm-Message-State: AOAM530Z11yd1tUamrqBWc5TJqiwLaLEi7TJBpSTto118yRmnHTjea8V
 f65b2x6GomtUr2gikv8wL9dNLTnoT0iAIJVCvYYooA==
X-Google-Smtp-Source: ABdhPJyWZJ6kdKGchCusXW9FlbLYovyvoRUpAS5vcVg4X78OzGuXXjIvZ8w6EhV07yForNURNBFpeXJpRKQ7rXUjSkg=
X-Received: by 2002:aca:da03:: with SMTP id r3mr6212469oig.14.1595404029656;
 Wed, 22 Jul 2020 00:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
 <CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com>
 <ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com>
In-Reply-To: <ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 09:46:58 +0200
Message-ID: <CAKMK7uHWM59iMx=MA+4sTxw-8-3qwc_ajw297vPKH+NL7yUBrg@mail.gmail.com>
Subject: Re: pages pinned for BO lifetime and security
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Thomas Hellstrom <thomas.hellstrom@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgOToxOSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+IEFtIDIyLjA3LjIwIHVtIDAyOjIyIHNjaHJpZWIg
R3VyY2hldGFuIFNpbmdoOgo+PiBPZiB0aGUgZGVza3RvcCBHUFUgZHJpdmVycywgaTkxNSdzIHNo
cmlua2VyIGNlcnRhaW5seSBzdXBwb3J0cyBwdXJnaW5nCj4+IHRvIHN3YXAuICBUVE0gaXMgYSBi
aXQgaGFyZCB0byBmb2xsb3cuICBJIGNhbid0IHJlYWxseSB0ZWxsIGlmIGFtZGdwdQo+PiBvciBu
b3V2ZWF1IHN1cHBvcnRzIHRoYXQuICB2aXJ0aW8tZ3B1IGlzIG1vcmUgY29tbW9ubHkgZm91bmQg
b24KPj4gc3lzdGVtcyB3aXRoIHN3YXBzIHNvIEkgdGhpbmsgaXQgc2hvdWxkIGZvbGxvdyB0aGUg
ZGVza3RvcCBwcmFjdGljZXM/Cj4KPgo+IFdoYXQgd2UgZG8gYXQgbGVhc3QgaW4gdGhlIGFtZGdw
dSwgcmFkZW9uLCBpOTE1IGFuZCBub3V2ZWF1IGlzIHRvIG9ubHkgYWxsb3cgaXQgZm9yIHNjYW5v
dXQgYW5kIHRoYXQgaW4gdHVybiBpcyBsaW1pdGVkIGJ5IHRoZSBwaHlzaWNhbCBudW1iZXIgb2Yg
Q1JUQ3Mgb24gdGhlIGJvYXJkLgoKU29tZXdoYXQgYXNpZGUsIGJ1dCBJJ20gbm90IHN1cmUgdGhl
IHR0bSBzaHJpbmtlciByZWFsbHkgd29ya3MgbGlrZQp0aGF0LiBJIHRoaW5rIHRoZXJlJ3MgdHdv
IHBhcnRzOgoxLiBrZXJuZWwgdGhyZWFkIHdoaWNoIHRha2VzIGJ1ZmZlcnMgYW5kIHVuYmluZHMg
dGhlbSB3aGVuIHdlJ3JlIG92ZXIKdGhlIHR0bSBnbG9iYWwgbGltaXQuIFRoaXMgaXMgdGhlIHR0
bV9zaHJpbmtfd29yayBzdHVmZiwgYW5kIGl0IG9ubHkKc2hyaW5rcyBpZiB0aGUgem9uZSBpcyBv
dmVyIGEgaGFyZCBsaW1pdC4gQmVsb3cgdGhhdCBpdCBqdXN0IGxlYXZlcwpidWZmZXJzIHBpbm5l
ZC4KCjIuIEFjdHVhbCBjb3JlIG1tIHNocmlua2VyLCB3aGljaCByZWxlYXNlcyBidWZmZXJzIGhl
bGQgaW4gY2FjaGUgYnkKdHRtX3BhZ2VfYWxsb2NfZG1hLmMuIEJ1dCB0aGF0IG9ubHkgaGFwcGVu
cyB3aGVuIGJ1ZmZlcnMgaGF2ZSBiZWVuCnVuYm91bmQgYnkgdGhlIGZpcnN0IHRocmVhZCwgc28g
YW55dGhpbmcgYmVsb3cgdGhvc2UgaGFyZCBsaW1pdHMgaXMKbm90IHNocmlua2FibGUuIEFuZCBp
aXJjIHRob3NlIGhhcmQgbGltaXRzIGFyZSBsaWtlIGhhbGYgb2Ygc3lzdGVtCm1lbW9yeSBvciBz
byAobGFzdCB0aW1lIEkgbG9va2VkIHRocm91Z2ggdGhpcyBzdHVmZiBhdCBsZWFzdCkuCgpObyBp
ZGVhIHdoeSBleGFjdGx5IHRoaW5ncyBhcmUgbGlrZSB0aGV5IGFyZSwgc2luY2UgdGhlIGZpcnN0
IHRocmVhZAphbHJlYWR5IGRvZXMgYSBkbWFfcmVzdl90cnlsb2NrLCBhbmQgdGhhdCdzIGVub3Vn
aCB0byBhdm9pZCBsb2NraW5nCmludmVyc2lvbnMgd2hlbiBiZWluZyBjYWxsZWQgZnJvbSAyLiBP
ciB3ZWxsLCBzaG91bGQgYmUgYXQgbGVhc3QsIGZvcgpyZWFzb25hYmxlIGRyaXZlciBkZXNpZ24u
CgpUaGUgb25seSBvdGhlciB0aGluZyBJJ20gc2VlaW5nIGlzIHRoZSBnbG9iYWwgbHJ1LCBidXQg
dGhhdCBjb3VsZCBiZQpmaXhlZCBieSBoYXZpbmcgYSBwZXItZGV2aWNlIGNvcmUgbW0gc2hyaW5r
ZXIgaW5zdGFuY2Ugd2hpY2ggZGlyZWN0bHkKc2hyaW5rcyB0aGUgcGVyLWRldmljZSBscnUuIEFu
ZCB0aGVuIHdlIGp1c3QgZ2xvYmFsbHkgYmFsYW5jZSBsaWtlCndpdGggYWxsIHNocmlua2VycyB0
aHJvdWdoIHRoZSBjb3JlIG1tICJzaHJpbmsgZXZlcnlvbmUgZXF1YWxseSIKYXBwcm9hY2guIFlv
dSBjYW4gZXZlbiBrZWVwIHRoZSBzZXBhcmF0ZSBwYWdlIGFsbG9jIHNocmlua2VyLCBzaW5jZQpj
b3JlIG1tIGFsd2F5cyBsb29wcyBvdmVyIGFsbCBzaHJpbmtlcnMgLSB3ZSdyZSBub3QgdGhlIG9u
bHkgb25lcwp3aGVyZSBzaHJpbmtpbmcgb25lIGNhY2hlIG1ha2VzIG1vcmUgbWVtb3J5IGF2YWls
YWJsZSBmb3IgYW5vdGhlcgpjYWNoZSB0byBzaHJpbmssIGUuZy4geW91IGNhbid0IHRocm93IG91
dCBhbiBpbm9kZSB3aXRob3V0IGZpcnN0CnRocm93aW5nIG91dCBhbGwgdGhlIGRlbnRyeSBwb2lu
dGluZyBhdCB0aGVtLgoKQW5vdGhlciBwcm9ibGVtIHdvdWxkIGJlIGFsbG9jYXRpbmcgbWVtb3J5
IHdoaWxlIGhvbGRpbmcgcGVyLWRldmljZQpscnUgbG9ja3MgKHNpbmNlIHRyeWxvY2sgb24gc3Vj
aCBhIGdsb2JhbCBsb2NrIGluIHNocmlua2VycyBpcyBhCnJlYWxseSBiYWQgaWRlYSwgd2Uga25v
dyB0aGF0IGZyb20gYWxsIHRoZSBkZXYtPnN0cnVjdF9tdXRleCBsb2x6IGluCmk5MTUpLiBCdXQg
Zm9yIHR0bSB0aGF0J3Mgbm90IGEgcHJvYmxlbSBzaW5jZSBhbGwgbHJ1IGFyZSBzcGlubG9jaywg
c28Kb25seSBHRlBfQVRPTUlDIGFsbG93ZWQgYW55d2F5LCBoZW5jZSBubyBwcm9ibGVtLgoKQWRk
aW5nIFRob21hcyBmb3IgdGhpcyB0dG0gdGFuZ2VudC4KLURhbmllbAotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
