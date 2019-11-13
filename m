Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9AFB167
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 14:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723E36E0AD;
	Wed, 13 Nov 2019 13:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF306E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:34:38 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c19so1574183otr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 05:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2BUGmK0Tlnu9PkcroMtQbN3ebq9HP8EWdnAg1PeQPpI=;
 b=BvQB/sGPrIzFA2XN+W1hdRAsXGkxkhlgLXLHbsQC2CsMlpGoN5j8NwLx63CNDhqbid
 ZtBxXeg/uC6Zt3o2QoTflqPyYAyaIEKyQt50T5Hsfdrw+E/dDCd5iPCIyOESTrqH10R+
 7ypscc5KXujAIy4YuBLOspBrZTppFAfLXGeAvIHMv00yqv+vuFyEFjnszLa/rZuPapjp
 qdv98AX/T1rqmF9uUXj7QwLSnSF77U+84NIiVyxaj2I6I2ikKVcC3el1lm4xJdwJcfy/
 JSDrMkxk30tHOpRsfN39n9KhKTNnBCyPY0Ltm4mBcllvx4Ay1O7AYB32TCm5yTrLR402
 omOA==
X-Gm-Message-State: APjAAAWVCHUTpLINBCMY8Es2/hpzW9753NOQVsFAHAMtIqEF7hk6Kiws
 BGkJhVImtj/hcRHecwGrd5uMye5h8loffDy0KWg=
X-Google-Smtp-Source: APXvYqwi7Xw2lfi4sIU7wx1mg128Apj/k00opOCJ9UHzzco7XRYdpN6ucxcgQ3ELDbknwAcBlsN8r36/qkmcXICISpY=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr3161151oth.145.1573652078174; 
 Wed, 13 Nov 2019 05:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
 <20191113100556.15616-3-jacopo+renesas@jmondi.org>
In-Reply-To: <20191113100556.15616-3-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Nov 2019 14:34:27 +0100
Message-ID: <CAMuHMdWAvFfL5gWZVkfan=o2pRygxCKaNwCf=7AbiPJS1r8nAA@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: display, renesas,
 du: Document cmms property
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKU29ycnkgZm9yIHNwb2lsaW5nIHlvdXIgdjcgOy0pCgpPbiBXZWQsIE5vdiAx
MywgMjAxOSBhdCAxMTowNCBBTSBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5v
cmc+IHdyb3RlOgo+IERvY3VtZW50IHRoZSBuZXdseSBhZGRlZCAnY21tcycgcHJvcGVydHkgd2hp
Y2ggYWNjZXB0cyBhIGxpc3Qgb2YgcGhhbmRsZQoKcmVuZXNhcyxjbW1zCgo+IGFuZCBjaGFubmVs
IGluZGV4IHBhaXJzIHRoYXQgcG9pbnQgdG8gdGhlIENNTSB1bml0cyBhdmFpbGFibGUgZm9yIGVh
Y2gKPiBEaXNwbGF5IFVuaXQgb3V0cHV0IHZpZGVvIGNoYW5uZWwuCj4KPiBSZXZpZXdlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdo
YW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiBSZXZpZXdlZC1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
