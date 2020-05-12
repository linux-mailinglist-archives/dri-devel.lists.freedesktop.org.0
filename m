Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B11CFF12
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 22:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5306E979;
	Tue, 12 May 2020 20:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31FC89C80
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 20:12:55 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e2so12101896eje.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=POEm2SoqW/oCSJfdHzK8ZJGaI8hDS726qRr763qsTzc=;
 b=OB5DrUMtFIPmhXohDMDqC9CPzf0nqYsQnRSttQbVqHLpCsTB2/bTzLzbS7oldZZ/XE
 LL9EcE3EklulQ+PYDzlNqc3xTxmJ7MpBAuxwMpRVyjREDkAMOyTNL9th/UVezs6GeQKr
 7lHqNA4NnVUCg02RUblGvYoSXNBumbPpr799YwRsjTNA4tJC2GefxQixSXN7xMMQAjHi
 oWMFTmsgz+QCYeZlQy/zHocphiFSnQ7qe8Gx0NNFRvqdACUrpBj5SwYZOrROfdRmQVrr
 e5zckc+aGPuiQmLtZtY3OuD5koMgsxNICzKQcf45SKQ6cQh0JbeMqBe3VPZKYX8IkTSm
 slIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=POEm2SoqW/oCSJfdHzK8ZJGaI8hDS726qRr763qsTzc=;
 b=WPoYrlm9J7f2SZbNjxbs16eS5tWbxJyccPgAVvPF0Pf1ooC5u6va1Pb5qzFTcTFY4j
 xkSQwUCQF1ZVCSc13UsBPLICRhyzX7jcyc3KPdyXmS5zdwumvxocYQEEXrn6STRBw/8Z
 vtFZ/hGixAJaF34znUj5ie3kAAR1PmLA4KwnxjOY9QoeIXlkz0MDcwYkUO/qxejsqYKy
 BhMiU5wkcdY+fCxKgVptboaEYbS24pHLgerGCPSvxZ9E8+wT+ILrvkd/zXTA4atx222m
 ApanA4cYe6J6XM+uBs7VooJYhhqvXB5i7Dmgqplc9guIMG34wzOouB3IaL/wXs0Nj4h0
 MOsw==
X-Gm-Message-State: AGi0PuY3lu/rtUZu52DMMzfbhLbHVDGUaDT/3p0CMVmxCtjXw97ybob6
 1qeDBLlHstt5kBmWA0se4eY8hd/9kdh6eSyLhLU=
X-Google-Smtp-Source: APiQypLF6Vl1RrAW/ytPGQ0sQ0fEQNHFI/vPfjy2y6NpDOGTjJDMvg26oDQ++I8ELyK0dkcvvQau9YnUuUly2d5YfJU=
X-Received: by 2002:a17:906:4dd6:: with SMTP id
 f22mr19812287ejw.181.1589314374079; 
 Tue, 12 May 2020 13:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CALjTZvabx+-Hg3A1vZ=zt5=zrL8wuOLZ5=BZD6iio+-Oj7qBgQ@mail.gmail.com>
 <CADnq5_Otu2vVpXysmt7icsVgJ_OyR9VJBEdF0JxTcr8mwWN3TQ@mail.gmail.com>
In-Reply-To: <CADnq5_Otu2vVpXysmt7icsVgJ_OyR9VJBEdF0JxTcr8mwWN3TQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 13 May 2020 06:12:41 +1000
Message-ID: <CAPM=9tw+Hw4Mkihtf9_+8T_OCbDpUmK07PeWvkf9aqGF9WQmNA@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBNYXkgMjAyMCBhdCAwNDoyMSwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMTowMiBQTSBSdWkg
U2FsdmF0ZXJyYSA8cnNhbHZhdGVycmFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IDEyIE1heSAyMDIwIGF0IDE3OjM4LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPdGhlcndpc2UgYWxsIGFncmVlLCBhZ3AgaXMgYSBtaWdodHkgbWVz
cyBhbmQgZXNzZW50aWFsbHkganVzdAo+ID4gPiBjcmFwc2hvdCBvdXRzaWRlIG9mIHg4Ni4gSXQg
a2luZGEgd29ya2VkIGZvciB0aGUgbXVjaCBtb3JlIHN0YXRpYwo+ID4gPiBhbGxvY2F0aW9ucyBm
b3IgZHJpMSwgYnV0IHdpdGggaW4ta2VybmVsIG1lbW9yeSBtYW5hZ2VycyBhbGwgdGhlIGNhY2hl
Cj4gPiA+IGZsdXNoaW5nIGlzc3VlcyBzaG93ZWQgdXAgYmlnIHRpbWUgYW5kIGl0IGFsbCBmZWxs
IHRvIHBpZWNlcy4gUGx1cyBhCj4gPiA+IGxvdCBvZiB0aGVzZSBob3N0IGNoaXBzZXQgYmFjayB0
aGVuIHdoZXJlIGRlc2lnbmVkIGZvciB0aGUgcmF0aGVyCj4gPiA+IHN0YXRpYyB3aW5kb3dzIGdw
dSBtYW5hZ2Vycywgc28gZXZlbiBvbiB4ODYgdGhlIGNvaGVyZW5jeSBpc3N1ZXMgZm9yCj4gPiA+
IGFncCBtb2RlIHdoZW4gdXNlZCB0b2dldGhlciB3aXRoIHR0bSBvciBzb21ldGhpbmcgZWxzZSBy
ZWFsbHkgZHluYW1pYwo+ID4gPiBpcyBwcmV0dHkgYmFkIGJlY2F1c2UgdGhlIGh3IGp1c3QgZG9l
c24ndCByZWFsbHkgY29wZSBhbmQgaGFzIGFsbAo+ID4gPiBraW5kcyBvZiBmbHVzaGluZyB0cm91
YmxlcyBhbmQgcmFjZXMuIEkgdGhpbmsgdGhlIGxhdGVyIGFncCBjaGlwc2V0cwo+ID4gPiB3ZXJl
IGJldHRlci4KPiA+Cj4gPiBUaGF0IHdhcyByYXRoZXIgaW5zaWdodGZ1bCwgdGhhbmtzLiBJIHdh
cyBzdGFydGluZyB0byBkb3VidCBteSBvd24KPiA+IG1lbW9yeSwgYXMgSSB3YXMgYWxtb3N0IHN1
cmUgSSBuZXZlciBoYWQgYW55IGhhbmdzIHdpdGggQUdQIG9uIFBvd2VyUEMKPiA+IGJlZm9yZSBL
TVMgd2FzIGEgdGhpbmcuIEJ1dCBldmVuIG9uIHg4NiwgSSBkaXN0aW5jdGx5IHJlbWVtYmVyIG5l
dmVyCj4gPiBiZWluZyBhYmxlIHRvIGdldCBzaWRlYmFuZCBhZGRyZXNzaW5nIHdvcmtpbmcgd2l0
aCBhbnkgQUdQIGNhcmRzLCBteQo+ID4gc3lzdGVtIHdvdWxkIHJhbmRvbWx5IGhhbmcgdG9vLgo+
ID4gSSdtIHN0YXJ0aW5nIHRvIGJlbGlldmUgQUdQIHdhcyBzaG9laG9ybmVkIGludG8gUENJIHRo
ZSBzYW1lIHdheSBWTEIKPiA+IHdhcyBzaG9laG9ybmVkIGludG8gSVNBIChhbmQgZm9yIHRoZSBz
YW1lIHJlYXNvbikuIEhpc3RvcnkgcmVwZWF0cwo+ID4gaXRzZWxm4oCmIDopCj4KPiBQcmUtS01T
LCB0aGUga2VybmVsIGp1c3QgYWxsb2NhdGVkIGEgc3RhdGljIHJlbGF0aXZlbHkgc21hbGwgKGUu
Zy4sIDgKPiBNQikgQUdQIGJ1ZmZlciB3aGljaCBuZXZlciBjaGFuZ2VkLiAgSW4gdGhhdCBjYXNl
LCB0aGluZ3Mgd2VyZQo+IHNvbWV3aGF0IG1vcmUgcmVsaWFibGUuCgpUaGlzIGlzIHdoeSB0aGUg
QUdQIGh3IG9uIE1hY3MgaGFzIGlzc3VlcyBJIGJlbGlldmUuIEl0IHdhcyBkZXNpZ25lZAphbmQg
b25seSB0ZXN0ZWQgYXJvdW5kIHRoZSBvbmUgc3RhdGljIGVhcmx5IGFsbG9jYXRpb24sIEknbSBu
b3Qgc3VyZQpPU1ggZXZlciBkaWQgZHluYW1pYy4KCldoZW4gaXQgd2VudCBkeW5hbWljIEkgdGhp
bmsgdGhlIEFHUCBiaXRzIGhhZCBzb21lIHByb2JsZW1zIHdpdGgKY29oZXJlbmN5IG9mIHRoZSBH
QVJUIHRhYmxlcyB0aGF0IHdlIG5ldmVyIGZpZ3VyZWQgb3V0LgoKRGF2ZS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
