Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB11FCADA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 17:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D826ECAD;
	Thu, 14 Nov 2019 16:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A636ECAD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 16:38:33 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F7D6206E5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 16:38:32 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id t20so7443044qtn.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:38:32 -0800 (PST)
X-Gm-Message-State: APjAAAW/wjzCq91Iss1nMMunzndQmbxRZXJ3uPfRJTwBTwQCVxNOJGlt
 6g/DTIDjKpbFp4Z4RQWIHk+NcLXGV4Hq5aKrVg==
X-Google-Smtp-Source: APXvYqwDR8S9cYrUYILLP/I2tU3UMGkZtLBmA2zLHpUvplAXjetDE9ennCRPukJ9ArEABqjaXO1HmqiEessy+uBaq+4=
X-Received: by 2002:aed:2706:: with SMTP id n6mr9138767qtd.224.1573749511747; 
 Thu, 14 Nov 2019 08:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20191114131525.3988-1-linus.walleij@linaro.org>
In-Reply-To: <20191114131525.3988-1-linus.walleij@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2019 10:38:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+P6-V2L_JJmwkuoV=DzBzMGdfqsUpZLY6pR_+B-uOF1g@mail.gmail.com>
Message-ID: <CAL_Jsq+P6-V2L_JJmwkuoV=DzBzMGdfqsUpZLY6pR_+B-uOF1g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v6] drm/panel: Add DT bindings for Sony ACX424AKP
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573749512;
 bh=r6239xpNQjiA90Hu7abkz2VVimdZsUkVBgJYAv84NIE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fn2j8MozP/jF5WgRbNYSyQjkyNonioQIgDpSTCQ4mJ5MswbHnv1F5Ff12vXJKXV4R
 guq7Exy1m2ihDuWwt4dAJGRF87bi6okPbtdkDe9yANrjT0bXwZMnSV8+UERIx8+eDU
 S23iqFnPXq+ZPiV7yc0LVGiBZPaq31LcPhB7aO8E=
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgNzoxNSBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmdz
IGZvciB0aGUgU29ueSBBQ1g0MjRBS1AgcGFuZWwuCj4gTGV0J3MgdXNlIFlBTUwuCj4KPiBDYzog
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlTG9nIHY1LT52NjoKPiAt
IEZpeCB0aGUgYmluZGluZyBieSBzaW1wbHkgbm90IHJlZmVyZW5jaW5nIHRoZSBkaXNwbGF5IGNv
bnRyb2xsZXIKPiAgIGJpbmRpbmdzIGZyb20gYSBwYW5lbCBiaW5kaW5nLgo+IENoYW5nZUxvZyB2
NC0+djU6Cj4gLSBGaXggdXAgYWxsIHdhcm5pbmdzIGV0YyBpbmN1cnJlZCBmcm9tIHRoZSBub3cg
d29ya2luZyBzY2hlbWEgY2hlY2sKPiAgIGFuZCBEVFMgY29tcGlsYXRpb24uCj4gLSBJIHN0aWxs
IGhhdmUgYSB2ZXJ0IGFubm95aW5nIGVycm9yIG1lc3NhZ2UgaW4gdGhlIFNvbnkKPiAgIHBhbmVs
IGJpbmRpbmdzIHRoYXQgdXNlcyB0aGlzIHNjaGVtYToKPiAgIHNvbnksYWN4NDI0YWtwLmV4YW1w
bGUuZHQueWFtbDogcGFuZWxAMDogJG5vZGVuYW1lOjA6ICdwYW5lbEAwJyBkb2VzIG5vdCBtYXRj
aCAnXmRzaS1jb250cm9sbGVyKEAuKik/JCcKPiAgIEFzIHRoaXMgaXMgbW9kZWxlZCB2ZXJ5IGNs
b3NlbHkgdG8KPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbWRpby55
YW1sCj4gICBhbmQgdGhhdCBvbmUgZG9lc24ndCBlbWl0IHRoaXMgdHlwZSBvZiB3YXJuaW5nIGZv
ciBpdHMgZXRoZXJuZXQtcGh5QDAKPiAgIGV0YyBJIGFtIHByZXR0eSBtdWNoIGNsdWVsZXNzIGFu
ZCBqdXN0IGNhbid0IHNlZSB3aGF0IHRoZSBwcm9ibGVtCj4gICBpcy4KPiAtIElmIEkgY2FuJ3Qg
ZmlndXJlIHRoaXMgb3V0IHRoZSBvbmx5IHZpYWJsZSBuZXh0IHN0ZXAgaXMgdG8gZHJvcCB0aGUK
PiAgIGFtYml0aW9uIHRvIGNyZWF0ZSB5YW1sIGJpbmRpbmdzIHNpbXBseSBiZWNhdXNlIEknbSB1
bmFibGUgdG8gZG8KPiAgIGl0LCBhbmQgZ28gYmFjayB0byB0cmFkaXRpb25hbCB0ZXh0IGJpbmRp
bmdzIDooCj4gQ2hhbmdlTG9nIHYzLT52NDoKPiAtIEFkanVzdCB0byBhZGp1c3RlZCBEU0kgYmlu
ZGluZ3MuCj4gQ2hhbmdlTG9nIHYyLT52MzoKPiAtIFB1dCB0aGUgZXhhbXBsZSBpbnNpZGUgYSBk
c2ktY29udHJvbGxlciBzbyB3ZSBoYXZlIGEgY29tcGxldGUKPiAgIGV4YW1wbGUgdGhhdCB2ZXJp
ZmllcyB0byB0aGUgRFNJIHBhbmVsIGdlbmVyaWMgYmluZGluZy4KPiBDaGFuZ2VMb2cgdjEtPnYy
Ogo+IC0gU3VnZ2VzdCBhIHN0YW5kLWFsb25lIFlBTUwgYmluZGluZ3MgZmlsZSBmb3IgRFNJIHBh
bmVscyBpbgo+ICAgYSBzZXBhcmF0ZSBwYXRjaCwgYW5kIHVzZSB0aGF0IHRvIHJlZmVyZW5jZSB0
aGUKPiAgIGJvb2xlYW4gImVuZm9yY2UtdmlkZW8tbW9kZSIgYXR0cmlidXRlIGZvciBEU0kgcGFu
ZWxzCj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwgICAgICAg
ICB8IDQ5ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKCkknbGwgdHJ1c3QgdGhhdCB5
b3UgZ2V0IHRoZSBkc2ktY29udHJvbGxlci55YW1sIHNjaGVtYSBkb25lIGFzIHdpdGhvdXQKaXQg
dGhpcyBpcyBpbmNvbXBsZXRlIGV2ZW4gdGhvdWdoIHRoZXJlJ3Mgbm90IGEgZGlyZWN0IGRlcGVu
ZGVuY3kuCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
