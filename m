Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85340D77ED
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F816E828;
	Tue, 15 Oct 2019 14:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BA96E81E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:03:16 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i16so16909066oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOjJLF7sukvj2eKb65vV1HI25D8NmeruWTF/C6krm1Q=;
 b=RtDTH7WSOpDW2eBIrql3rU8pcemdHoL1YeORi3+16C80pYunH+zQfZMMcza3e9wocT
 +70wRS2VJ0bBy3YXgHbN0ONOvw/Tj5n4opierDIfe2RggGasQ+eEG75L50QbAtqNi/Kb
 gt7rmodVDqikkskTDviGnf0kqbzc7Wia+2yh1G6ALoMz6yoXKnsQ5eRkTw5HSFubmvW6
 XxGKnesx6N5Dd3Aej8gD5+BP8y3XIcQsPs85RJJvnrjAMqab4WsqxD+Is7KMOyG3Qc7I
 GKsvdS7M0o6SQUYgFP9P/Of4Z/CV1MfhXu59lmU0wIEQAIWVV0lHZp0bwdL19EIngj40
 0pzw==
X-Gm-Message-State: APjAAAXdvTUYLfMDhejRloz5khGbg0gDF1N7aTNlIg45i7fTsFuy1mKr
 kE7fXDfv0ZQ+LClfhQt0kHNfRW7brM0n3p86wdQ=
X-Google-Smtp-Source: APXvYqyr2Z8Smipppw7iBN2DU7emj0QxlbQzT35YfXNX6ZmXYwoICBBJd/mbfEEWv1S0yH9hYhQVJ4X3dWgp6QTqlV4=
X-Received: by 2002:aca:882:: with SMTP id 124mr29310652oii.54.1571148195408; 
 Tue, 15 Oct 2019 07:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20191015104621.62514-2-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Oct 2019 16:03:04 +0200
Message-ID: <CAMuHMdVr=eVJWMC=oHsfUE8=ODj8aMw2Wq1nr0Cd+ngxW7nuMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
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
Cc: muroya@ksk.co.jp,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
 VenkataRajesh.Kalakodima@in.bosch.com, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>,
 ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTI6NDQgUE0gSmFjb3BvIE1vbmRp
IDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPiB3cm90ZToKPiBBZGQgZGV2aWNlIHRyZWUgYmlu
ZGluZ3MgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFJlbmVzYXMgUi1DYXIgRGlzcGxheQo+IFVuaXQg
Q29sb3IgTWFuYWdlbWVudCBNb2R1bGUuCj4KPiBDTU0gaXMgdGhlIGltYWdlIGVuaGFuY2VtZW50
IG1vZHVsZSBhdmFpbGFibGUgb24gZWFjaCBSLUNhciBEVSB2aWRlbwo+IGNoYW5uZWwgb24gUi1D
YXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCkuCgpWMkggaXMgZXhj
bHVkZWQsIHRvby4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
