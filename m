Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA81D09E4
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FEA6E8AE;
	Wed, 13 May 2020 07:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C346E480
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:26:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e1so5556624wrt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aB9trSQ6vmIgP/qq1b+Z+lkBfNyDbZ4uKbTIaHNhsVg=;
 b=uD9nRYsh8G8/9MTbtDXx6TXRyTvz8yGSmrGdB5fFerFcUkFvnd3AgyS7aOdYT4CSr7
 1S3QnaKie+gaMXZy+K+GxS5Cx1/LwPKl6CMKcbAJHvz7/0tb3F8QSL17ri4rnD8uYE7a
 bxJuTJ2xCoSQ3CUXlWpaapq2AkV4wCOIViFcpU9CUzS0d/XSC6GW6zGGVpW4Hvs13vap
 T+s/MiNP6BUE8Jt2TT9E+OmzBBSQt7XO5EeKO6Nm6qgfvh0IipAs0XPSRGpcSvN1Mi2T
 sVAQWnjMcqfwa5mj9kdwsRSJp6zEJau+iXkdsVJOv13D7fi3Xyun3ZblAcJbifF3SMtb
 0TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=aB9trSQ6vmIgP/qq1b+Z+lkBfNyDbZ4uKbTIaHNhsVg=;
 b=oCPO9d0la6ZAshS44Kh/VGtI6qloxPPH6AR757WopKvVlKZgMPBxrZvtXCyQjg7Q66
 uqTg4EvyX/KWrO0nLDdRWyTg9WFifC+RihqVI3VgHGJXrj4RzMK1/mVG11rtiWpmBDyj
 xTsQ0npi0+NOK5t7NdNERjSju2TYsqhZTpXaqSGVQaSaoQO89yJaMF8bBSZ3JdspQHH6
 rbbhgaCAqThNrOu7wYcHaNnH7rr/vNgpbCsHRaOVWZaB7NTf1lXE1U0QrYrzr+yXbAu4
 fZVC50lAi3LPNKtk7uIMdWls4Q5kDsIbfUQegEklnVy3WgQeCnhnHkU2izYIzEx+psUq
 96kA==
X-Gm-Message-State: AGi0PuY3HS92n62V2OTo7gnrhJvr6/aV23+4NHK1tTM+Cu6dXhUIL/2Q
 thuY+6FI5NTZ1+oGXUeROf8=
X-Google-Smtp-Source: APiQypK/LaAyNs6zJ+yTLP2XRH+94bn8Fh/gg11Z2AJD9NmyqDcfZAskEH8XlcmXFZnRd7JzFH1xjw==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr17573221wrx.36.1589354770357; 
 Wed, 13 May 2020 00:26:10 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b145sm12667246wme.41.2020.05.13.00.26.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 00:26:09 -0700 (PDT)
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
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
 <CAPM=9tw+Hw4Mkihtf9_+8T_OCbDpUmK07PeWvkf9aqGF9WQmNA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4e4a4274-e987-8959-d16a-9c8bea2c8c8d@gmail.com>
Date: Wed, 13 May 2020 09:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tw+Hw4Mkihtf9_+8T_OCbDpUmK07PeWvkf9aqGF9WQmNA@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDUuMjAgdW0gMjI6MTIgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBXZWQsIDEzIE1h
eSAyMDIwIGF0IDA0OjIxLCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+IE9uIFR1ZSwgTWF5IDEyLCAyMDIwIGF0IDE6MDIgUE0gUnVpIFNhbHZhdGVycmEgPHJz
YWx2YXRlcnJhQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBPbiBUdWUsIDEyIE1heSAyMDIwIGF0IDE3
OjM4LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Pj4+IE90aGVyd2lz
ZSBhbGwgYWdyZWUsIGFncCBpcyBhIG1pZ2h0eSBtZXNzIGFuZCBlc3NlbnRpYWxseSBqdXN0Cj4+
Pj4gY3JhcHNob3Qgb3V0c2lkZSBvZiB4ODYuIEl0IGtpbmRhIHdvcmtlZCBmb3IgdGhlIG11Y2gg
bW9yZSBzdGF0aWMKPj4+PiBhbGxvY2F0aW9ucyBmb3IgZHJpMSwgYnV0IHdpdGggaW4ta2VybmVs
IG1lbW9yeSBtYW5hZ2VycyBhbGwgdGhlIGNhY2hlCj4+Pj4gZmx1c2hpbmcgaXNzdWVzIHNob3dl
ZCB1cCBiaWcgdGltZSBhbmQgaXQgYWxsIGZlbGwgdG8gcGllY2VzLiBQbHVzIGEKPj4+PiBsb3Qg
b2YgdGhlc2UgaG9zdCBjaGlwc2V0IGJhY2sgdGhlbiB3aGVyZSBkZXNpZ25lZCBmb3IgdGhlIHJh
dGhlcgo+Pj4+IHN0YXRpYyB3aW5kb3dzIGdwdSBtYW5hZ2Vycywgc28gZXZlbiBvbiB4ODYgdGhl
IGNvaGVyZW5jeSBpc3N1ZXMgZm9yCj4+Pj4gYWdwIG1vZGUgd2hlbiB1c2VkIHRvZ2V0aGVyIHdp
dGggdHRtIG9yIHNvbWV0aGluZyBlbHNlIHJlYWxseSBkeW5hbWljCj4+Pj4gaXMgcHJldHR5IGJh
ZCBiZWNhdXNlIHRoZSBodyBqdXN0IGRvZXNuJ3QgcmVhbGx5IGNvcGUgYW5kIGhhcyBhbGwKPj4+
PiBraW5kcyBvZiBmbHVzaGluZyB0cm91YmxlcyBhbmQgcmFjZXMuIEkgdGhpbmsgdGhlIGxhdGVy
IGFncCBjaGlwc2V0cwo+Pj4+IHdlcmUgYmV0dGVyLgo+Pj4gVGhhdCB3YXMgcmF0aGVyIGluc2ln
aHRmdWwsIHRoYW5rcy4gSSB3YXMgc3RhcnRpbmcgdG8gZG91YnQgbXkgb3duCj4+PiBtZW1vcnks
IGFzIEkgd2FzIGFsbW9zdCBzdXJlIEkgbmV2ZXIgaGFkIGFueSBoYW5ncyB3aXRoIEFHUCBvbiBQ
b3dlclBDCj4+PiBiZWZvcmUgS01TIHdhcyBhIHRoaW5nLiBCdXQgZXZlbiBvbiB4ODYsIEkgZGlz
dGluY3RseSByZW1lbWJlciBuZXZlcgo+Pj4gYmVpbmcgYWJsZSB0byBnZXQgc2lkZWJhbmQgYWRk
cmVzc2luZyB3b3JraW5nIHdpdGggYW55IEFHUCBjYXJkcywgbXkKPj4+IHN5c3RlbSB3b3VsZCBy
YW5kb21seSBoYW5nIHRvby4KPj4+IEknbSBzdGFydGluZyB0byBiZWxpZXZlIEFHUCB3YXMgc2hv
ZWhvcm5lZCBpbnRvIFBDSSB0aGUgc2FtZSB3YXkgVkxCCj4+PiB3YXMgc2hvZWhvcm5lZCBpbnRv
IElTQSAoYW5kIGZvciB0aGUgc2FtZSByZWFzb24pLiBIaXN0b3J5IHJlcGVhdHMKPj4+IGl0c2Vs
ZuKApiA6KQo+PiBQcmUtS01TLCB0aGUga2VybmVsIGp1c3QgYWxsb2NhdGVkIGEgc3RhdGljIHJl
bGF0aXZlbHkgc21hbGwgKGUuZy4sIDgKPj4gTUIpIEFHUCBidWZmZXIgd2hpY2ggbmV2ZXIgY2hh
bmdlZC4gIEluIHRoYXQgY2FzZSwgdGhpbmdzIHdlcmUKPj4gc29tZXdoYXQgbW9yZSByZWxpYWJs
ZS4KPiBUaGlzIGlzIHdoeSB0aGUgQUdQIGh3IG9uIE1hY3MgaGFzIGlzc3VlcyBJIGJlbGlldmUu
IEl0IHdhcyBkZXNpZ25lZAo+IGFuZCBvbmx5IHRlc3RlZCBhcm91bmQgdGhlIG9uZSBzdGF0aWMg
ZWFybHkgYWxsb2NhdGlvbiwgSSdtIG5vdCBzdXJlCj4gT1NYIGV2ZXIgZGlkIGR5bmFtaWMuCj4K
PiBXaGVuIGl0IHdlbnQgZHluYW1pYyBJIHRoaW5rIHRoZSBBR1AgYml0cyBoYWQgc29tZSBwcm9i
bGVtcyB3aXRoCj4gY29oZXJlbmN5IG9mIHRoZSBHQVJUIHRhYmxlcyB0aGF0IHdlIG5ldmVyIGZp
Z3VyZWQgb3V0LgoKVG8gbWFrZSB0aGluZ3MgZXZlbiB3b3JzZSBBR1AgdXNlZCB0d28gZGlmZmVy
ZW50IHZvbHRhZ2VzIGluIHRoZSAKc3RhbmRhcmQuIEJlZm9yZSAyMDAyIG9ubHkgMy4zViB3YXMg
dXNlZCwgYWZ0ZXIgMjAwMiB0aGlzIGdvdCByZWR1Y2VkIHRvIAoxLjVWLgoKVG8gYXZvaWQgZnJ5
aW5nIHRoZSBuZXcgY2FyZHMgaW4gdGhlIG9sZCBib2FyZHMgb3Igb3RoZXIgd2F5IGFyb3VuZCB5
b3UgCmhhZCBhIG5vdGNoIGF0IGEgZGlmZmVyZW50IHBsYWNlIGRlcGVuZGluZyBvbiB0aGUgdm9s
dGFnZS4gVW5mb3J0dW5hdGVseSAKcXVpdGUgYSBidW5jaCBvZiBtYW51ZmFjdHVyZXJzIGRpZG4n
dCBnb3QgdGhhdCByaWdodC4KClNvIGl0IHdhc24ndCBqdXN0IHByb2JsZW1hdGljIG9uIHRoZSBz
b2Z0d2FyZSBsZXZlbCwgYnV0IGhhZCBhIHJhdGhlciAKYmFkIGhhcmR3YXJlIHNwZWNpZmljYXRp
b24gYXMgd2VsbC4KCkNocmlzdGlhbi4KCj4KPiBEYXZlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
