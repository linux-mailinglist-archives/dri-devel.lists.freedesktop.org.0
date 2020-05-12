Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC821D0B91
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D716E9C0;
	Wed, 13 May 2020 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93AC6E946
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 17:02:45 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id u12so5005681uau.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rFhSs4bfKfAFjK1nVQ6lKw0rqUcFTAD/AwmJdoacwrs=;
 b=GFlR6tmvjLRR28xMJHKDjfI9uiwl9KFsG+1paPKm3TzuqoMACx62G0n+JAUwJQe0+f
 xF+jbkOKKZNNKmnt6pZzPVWPdxeWW4dvovaHb3pQ1r1NBUk3+26QGBXqbq1HjZdAI1FQ
 5ByH2GjwCIA1/tUPpYVIzI+T82mb+zk8VaAVvpJUiEJuRuKV+ENv88Zkdulz/cxI7rJm
 kpFYqTN9B0iX6GIipbijyEWPjzA2KftENwsHflsfwUpb8jMU6XdtcCAesyddMP1ipZlH
 4XsrbFglTaYAaxsr+e00YpMiopTmMedgbV+tykfsmd4hi96JQESy78IyXO/GdnR3r+4E
 GL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rFhSs4bfKfAFjK1nVQ6lKw0rqUcFTAD/AwmJdoacwrs=;
 b=npnYj0YqpefL2/9W0P5wOMHDtsiHASOIs9R+vVX0eMQvcWEWngzOv+QYUFSr0tZOzC
 uhdKC8ex8/TOHylD3+6aM36qPvEJdW+FO9KAvD3CMI+8q983gl0iUKKFsals3zwXlfa9
 He2cvlzO5RvDem3Ub1nkBa1Bcnip7auH4pMaLQsmnFBN2CXlKFpsV+ArkYkmT1EwuDtx
 6pPFaUzGFdBjAVjjgiDMTfrj7/xDD8RI/MGyRhcT9mdkcEIrbLrvuOcIU182/ZmIyQcb
 ML7Dx535dl36MSLVPeF7lct6deY2txoe9PjkHEGxF26s7Womuk6y2Jy+4j0T/L6QqE25
 VpQg==
X-Gm-Message-State: AGi0Pubuo68BoPunMR65OCjQxdfpQvWYuI83KhcOPEZO2KsgtvRSPU+c
 nEuPaCmd82OjrZ4JF6EvWW4AkRVvICdIenwUJkkmKoE=
X-Google-Smtp-Source: APiQypLGCmXoBur8Xl3AYDR3E0hXka4pm0npfUdqPNE4b+7f6MPYvcmhzDIpUFGWNVmacFdpApucB41CPWZfxk+M+W0=
X-Received: by 2002:ab0:2917:: with SMTP id v23mr16993289uap.140.1589302964985; 
 Tue, 12 May 2020 10:02:44 -0700 (PDT)
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
In-Reply-To: <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Tue, 12 May 2020 18:02:33 +0100
Message-ID: <CALjTZvabx+-Hg3A1vZ=zt5=zrL8wuOLZ5=BZD6iio+-Oj7qBgQ@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBNYXkgMjAyMCBhdCAxNzozOCwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKPgo+IE90aGVyd2lzZSBhbGwgYWdyZWUsIGFncCBpcyBhIG1pZ2h0eSBtZXNz
IGFuZCBlc3NlbnRpYWxseSBqdXN0Cj4gY3JhcHNob3Qgb3V0c2lkZSBvZiB4ODYuIEl0IGtpbmRh
IHdvcmtlZCBmb3IgdGhlIG11Y2ggbW9yZSBzdGF0aWMKPiBhbGxvY2F0aW9ucyBmb3IgZHJpMSwg
YnV0IHdpdGggaW4ta2VybmVsIG1lbW9yeSBtYW5hZ2VycyBhbGwgdGhlIGNhY2hlCj4gZmx1c2hp
bmcgaXNzdWVzIHNob3dlZCB1cCBiaWcgdGltZSBhbmQgaXQgYWxsIGZlbGwgdG8gcGllY2VzLiBQ
bHVzIGEKPiBsb3Qgb2YgdGhlc2UgaG9zdCBjaGlwc2V0IGJhY2sgdGhlbiB3aGVyZSBkZXNpZ25l
ZCBmb3IgdGhlIHJhdGhlcgo+IHN0YXRpYyB3aW5kb3dzIGdwdSBtYW5hZ2Vycywgc28gZXZlbiBv
biB4ODYgdGhlIGNvaGVyZW5jeSBpc3N1ZXMgZm9yCj4gYWdwIG1vZGUgd2hlbiB1c2VkIHRvZ2V0
aGVyIHdpdGggdHRtIG9yIHNvbWV0aGluZyBlbHNlIHJlYWxseSBkeW5hbWljCj4gaXMgcHJldHR5
IGJhZCBiZWNhdXNlIHRoZSBodyBqdXN0IGRvZXNuJ3QgcmVhbGx5IGNvcGUgYW5kIGhhcyBhbGwK
PiBraW5kcyBvZiBmbHVzaGluZyB0cm91YmxlcyBhbmQgcmFjZXMuIEkgdGhpbmsgdGhlIGxhdGVy
IGFncCBjaGlwc2V0cwo+IHdlcmUgYmV0dGVyLgoKVGhhdCB3YXMgcmF0aGVyIGluc2lnaHRmdWws
IHRoYW5rcy4gSSB3YXMgc3RhcnRpbmcgdG8gZG91YnQgbXkgb3duCm1lbW9yeSwgYXMgSSB3YXMg
YWxtb3N0IHN1cmUgSSBuZXZlciBoYWQgYW55IGhhbmdzIHdpdGggQUdQIG9uIFBvd2VyUEMKYmVm
b3JlIEtNUyB3YXMgYSB0aGluZy4gQnV0IGV2ZW4gb24geDg2LCBJIGRpc3RpbmN0bHkgcmVtZW1i
ZXIgbmV2ZXIKYmVpbmcgYWJsZSB0byBnZXQgc2lkZWJhbmQgYWRkcmVzc2luZyB3b3JraW5nIHdp
dGggYW55IEFHUCBjYXJkcywgbXkKc3lzdGVtIHdvdWxkIHJhbmRvbWx5IGhhbmcgdG9vLgpJJ20g
c3RhcnRpbmcgdG8gYmVsaWV2ZSBBR1Agd2FzIHNob2Vob3JuZWQgaW50byBQQ0kgdGhlIHNhbWUg
d2F5IFZMQgp3YXMgc2hvZWhvcm5lZCBpbnRvIElTQSAoYW5kIGZvciB0aGUgc2FtZSByZWFzb24p
LiBIaXN0b3J5IHJlcGVhdHMKaXRzZWxm4oCmIDopCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
