Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37BEF0D25
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 04:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AFD6E11E;
	Wed,  6 Nov 2019 03:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112286E11E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 03:40:27 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f5so16855807lfp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 19:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUEJnHGJBUc26Nc3vbSx+AAd7Xb+j9SmfJqeArVZ4wc=;
 b=r7ebpWBc28w2GA1C80DSAQgem0qvGaxwZcU3uSaQuhRlqo3+1wWKUVPIDUefV3mJwI
 704/oCvhreuI1yRBFRl5Pf5WkCox4osqjNXXdmKJpLEgzCRszerAnIuMei0f8p4IcZvx
 MUld2HyFl6fuxOHFGLH2IYJY4dur8uL5g54CYX5mAa2RAA07W8wi97Nw1KNaOVYKLkHb
 5kCgTvYA98sWxWX21yKmL+RjaKStTo6N6Aom9zwY/gdFoOKmyvoZ5PPrDlGnVhrehSnV
 f9nfLRIZNM7M9WTVmyDbP4AdsrmkvQ0e2qAVW3CRM52Rm99RT/dUEyE/Res0JJrjzHM9
 aSLw==
X-Gm-Message-State: APjAAAXv3/IdtLG/EZ8M5qk706v1Dc4u9++Y7pgNsFFXZcwjWvPFNYXD
 iX8J1qGz5fivZaw4bAxWnojAnQ+XvM7LfMpxZR+v7Q==
X-Google-Smtp-Source: APXvYqzdG1VVNSg+5/mkdSQKbqCEvzE8x5kQQvnuhkNCh6TZkAaA7yG77mkyIq7by9szMPeJ1TLlS7x7yMM2h/KDRmM=
X-Received: by 2002:a19:e018:: with SMTP id x24mr5392745lfg.191.1573011625264; 
 Tue, 05 Nov 2019 19:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
In-Reply-To: <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 Nov 2019 13:40:13 +1000
Message-ID: <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZUEJnHGJBUc26Nc3vbSx+AAd7Xb+j9SmfJqeArVZ4wc=;
 b=na2Eg6WAp+fji+HEezR9j3LV0cL1htGF7NYf8SOBdLMZEtCQNxK4T29Yl9IYsOproE
 /IzlYhYx9RHHgarHjusR1Yjduv6sHIADr/MVJwDDn+ltf2YJrTkd7hN2T+VqkX6FyCPo
 1EEySVx1zyOTQZ/ZxWXaC7ziwmnGe10SWmBP3twZu7URy1KyXriMtN6opMlNpVXZbVsL
 Cg+pos2aqGQa0HN/PjgT5HnNWAnR7p7lEd4mL6rmyuFhfTNyWUom1e1abYwMEjExXESr
 pNJkTgBlViBJcBF91vpJm0VCOXG9ANsUXVmfvzUl+tbL2RJQgIRcPM4GZyuFE18rfJn+
 kbiQ==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IGF0IDA1OjU2LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gT24gV2VkLCA2IE5vdiAyMDE5IGF0IDA1OjQ5LCBMYXVyZW50IFBpbmNo
YXJ0Cj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
SGkgRGF2ZSwKPiA+Cj4gPiBIYXMgdGhpcyBwdWxsIHJlcXVlc3QgZmFsbGVuIHRocm91Z2ggdGhl
IGNyYWNrcyA/Cj4KPiBJdCBmZWxsIGRvd24gYSBkaWZmZXJlbnQgY3JhY2sgdGhhbiB1c3VhbCwg
aXQgbWFkZSBpdCBmcm9tIHBhdGNod29yawo+IG9udG8gbXkgaGFyZCBkcml2ZSwgYnV0IHRoZW4g
SSBkaWRuJ3QgZXhlY3V0ZSB0aGUgcHVsbC4KPgo+IEkndmUgcHVsbGVkIGl0IGRvd24sIHRoYW5r
cyBmb3IgcmVtaW5kZXIuCgpOb3cgaXQgZmFpbGVkIGFzIEkgbWVudGlvbmVkIG9uIGlyYy4KCkkg
dGhpbmsgdGhlIG5ldyBrY29uZmlnIG9wdGlvbiBuZWVkcyB0byBiZSBhIHRyaXN0YXRlLCBvdGhl
cndpc2UKc2V0dGluZyBpdCB0byBZIGFuZCBoYXZpbmcgcmNhci1kdSBhcyBNIGZhaWxzIHRvIGxp
bmsKCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
