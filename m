Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DD8A6A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 20:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B878930B;
	Mon, 12 Aug 2019 18:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018848930B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:55:04 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A777521743
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:55:04 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d17so24942168qtj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 11:55:04 -0700 (PDT)
X-Gm-Message-State: APjAAAVzqyGC7814cGFOmQJYmZEBSd5HYsOCaryXODt025YuaNAXZkev
 wtm+zIxyhC1ixjn1GQKCUn1eMuLWGnzdnQ5AOA==
X-Google-Smtp-Source: APXvYqyia1gKPVgjbtUTpnuZBlJgpqSY8tXfsBbv+8QzCcalURscIR5esdg67OirrsSo+tPUqidcyPBuwinY7WnMgWA=
X-Received: by 2002:ac8:7593:: with SMTP id s19mr23649307qtq.136.1565636103871; 
 Mon, 12 Aug 2019 11:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190810231048.1921-3-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Aug 2019 12:54:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLBYL7K8HvT-xXjHiQ9_U_iG41FcJA16Sk+ELuwMH40aQ@mail.gmail.com>
Message-ID: <CAL_JsqLBYL7K8HvT-xXjHiQ9_U_iG41FcJA16Sk+ELuwMH40aQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: Add legacy 'toppoly' vendor prefix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565636104;
 bh=O808RGXqc21FfxyU94RJJst8fUfCJgU7f8MluksfgQM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I0FsRZ76u46uoZitGnjemOLJ8AhpUAZc19JNKfEdN2CyiKDUx4AjihPDTGZVrDECf
 dsU+oq08uMLhilrH4An3WyLB8qxSFQu63eKKCOh/5fDh+3Q3e6N9j2HWd2gAxU3IQG
 yMCVMf1pcpWNN2LSNX9XXpKfDda7VyzNDvim2RQk=
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

T24gU2F0LCBBdWcgMTAsIDIwMTkgYXQgNToxMCBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gVGhlICd0b3Bwb2x5JyB2ZW5k
b3IgcHJlZml4IGlzIGluIHVzZSBhbmQgcmVmZXJzIHRvIFRQTywgd2hvc2UgRFQgdmVuZG9yCj4g
cHJlZml4IGlzIGFscmVhZHkgZGVmaW5lZCBhcyAndHBvJy4gQWRkICd0b3Bwb2x5JyBhcyBhbiBh
bHRlcm5hdGl2ZSBhbmQKPiBkb2N1bWVudCBpdCBhcyBsZWdhY3kuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4g
LS0tCj4gQ2hhbmdlcyBzaW5jZSB2MToKPgo+IC0gTWFyayB0aGUgcHJlZml4IGFzIGRlcHJlY2F0
ZWQKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1sIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
