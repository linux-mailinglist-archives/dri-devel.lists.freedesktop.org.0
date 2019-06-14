Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF24531A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA542892DE;
	Fri, 14 Jun 2019 03:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5656892DE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:46:50 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g13so1399254edu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a8hlfPfnXEjBTjeUfjk+FsaluQO4vebhuMrI7tB+55k=;
 b=P7lHT8ymXUV3l0kzaOC19j4lpOsWnpX55vY+FL1GF/54p+r9VcEzgN1cd7qKBsMmUQ
 OidOTU7ppD0zUK4b3qTZ9PQ7QGNU9lkqs5EVK4LA1ce1rHhVA5NvHEVsuUcPRpaYiNMT
 1qTGNIsgaEP2yoQpgm63RXTJ7f8Hlmo3UwSsccmyfUCqddj4JmIiKZmQfXX1QMhZP8EY
 7gTkQzXoraO15S7/oT8dFoYYcoaTVtTa8w1+aP0uzVyVtUlpKa2/bukPRkVtxE/3psDn
 28kSvhX+ID/5eiZPCvdnnpt0GVm1CRNhC88l/TAtFp2BGSU3Am5fuHxqVO82KwBRw+sC
 KoBQ==
X-Gm-Message-State: APjAAAVz3hNXbUZPT3GfGEFBlqwYFCsxem8KlY1KfN8W7eU34bW2BT9j
 t5lqOvTvktCQ+5Xe5m+YUapJ8ytWz5E=
X-Google-Smtp-Source: APXvYqxrq3J/euzIvFkc4mchSbvtejbfUuydLAgVQ3Gq7itdshLwG4xCZzuE4OS8THcN9QU96teJFQ==
X-Received: by 2002:a17:906:1f55:: with SMTP id
 d21mr6789534ejk.87.1560484008681; 
 Thu, 13 Jun 2019 20:46:48 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id 17sm494212edu.21.2019.06.13.20.46.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 20:46:48 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id k11so937370wrl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:46:48 -0700 (PDT)
X-Received: by 2002:a5d:4311:: with SMTP id h17mr64213816wrq.9.1560484007885; 
 Thu, 13 Jun 2019 20:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-6-jagan@amarulasolutions.com>
In-Reply-To: <20190613185241.22800-6-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 11:46:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
Message-ID: <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1NCBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBBY2NvcmRpbmcgdG8gRmlnIDctMi4gVENPTiBUb3Ag
QmxvY2sgRGlhZ3JhbSBpbiBVc2VyIG1hbnVhbC4KPgo+IFRDT04gVE9QIGNhbiBoYXZlIGFuIGhp
ZXJhcmNoeSBmb3IgVENPTl9MQ0QwLCBMQ0QxIGxpa2UKPiBUQ09OX1RWMCwgVFYxIHNvLCB0aGUg
dGNvbiB0b3Agd291bGQgaGFuZGxlIHRoZSBjbG9ja3Mgb2YKPiBUQ09OX0xDRDAsIExDRDEgc2lt
aWxhciBsaWtlIFRWMCwgVFYxLgoKVGhhdCBpcyBub3QgZ3VhcmFudGVlZC4gVGhlIGRpYWdyYW0g
c2hvd3MgdGhlIHBpeGVsIGRhdGEgcGF0aCwKbm90IG5lY2Vzc2FyaWx5IHRoZSBjbG9ja3MuIElu
IGFkZGl0aW9uLCB0aGUgTENEIFRDT05zIGhhdmUgYW4KaW50ZXJuYWwgY2xvY2sgZ2F0ZSBmb3Ig
dGhlIGRvdC1jbG9jayBvdXRwdXQsIHdoaWNoIHRoZSBUViB2YXJpYW50cwpkbyBub3QuIFRoYXQg
bWlnaHQgZXhwbGFpbiB0aGUgbmVlZCBmb3IgdGhlIGdhdGVzIGluIFRDT04gVE9QLgoKPiBCdXQs
IHRoZSBjdXJyZW50IHRjb25fdG9wIG5vZGUgaXMgdXNpbmcgZHNpIGNsb2NrIG5hbWUgd2l0aAo+
IENMS19EU0lfRFBIWSB3aGljaCBpcyBpZGVhbGx5IGhhbmRsZSB2aWEgZHBoeSB3aGljaCBpbmRl
ZWQKPiBhIHNlcGFyYXRlIGludGVyZmFjZSBibG9jay4KPgo+IFNvLCB1c2UgdGNvbi1sY2QwIGlu
c3RlYWQgb2YgZHNpIHdoaWNoIHdvdWxkIHJlZmVyIHRoZQo+IENMS19UQ09OX0xDRDAgc2ltaWxh
ciBsaWtlIENMS19UQ09OX1RWMCB3aXRoIHRjb24tdHYwLgo+Cj4gVGhpcyB3YXkgd2UgY2FuIHJl
ZmVyIENMS19UQ09OX0xDRDAgZnJvbSB0Y29uX3RvcCBjbG9jayBpbgo+IHRjb25fbGNkMCBub2Rl
IGFuZCB0aGUgYWN0dWFsIERTSV9EUEhZIGNsb2NrIG5vZGUgd291bGQKPiByZWZlciBpbiBkcGh5
IG5vZGUuCgpUaGF0IGRvZXNuJ3QgbWFrZSBzZW5zZS4gV2hhdCBhYm91dCBUQ09OX0xDRDE/CgpU
aGUgQ0NVIGFscmVhZHkgaGFzIENMS19UQ09OX0xDRDAgYW5kIENMS19UQ09OX0xDRDEuIFdoYXQg
bWFrZXMKeW91IHRoaW5rIHRoYXQgdGhlIFRDT05zIGRvbid0IHVzZSB0aGVtIGRpcmVjdGx5PwoK
T3IgbWF5YmUgdGhleSBkbyBnbyB0aHJvdWdoIFRDT05fVE9QLCBidXQgdGhlcmUncyBubyBnYXRl
LApzbyB3ZSBkb24ndCBrbm93IGFib3V0IGl0LgoKWW91IG5lZWQgdG8gcmV0aGluayB0aGlzLiBX
aGF0IGFyZSB5b3UgdHJ5aW5nIHRvIGRlYWwgd2l0aD8KCj4gU2lnbmVkLW9mZi1ieTogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N1bjhpLXI0MC5kdHNpICAgICAgICAgICB8IDYgKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV90Y29uX3RvcC5jICAgICB8IDYgKysrLS0tCj4gIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svc3VuOGktdGNvbi10b3AuaCB8IDIgKy0KClRoaXMgaXMgZ29pbmcgdG8gYmUg
YSBwYWluIHRvIG1lcmdlLgoKRmlyc3QsIHlvdSBuZWVkIHRvIHNwbGl0IHRoZSBkcml2ZXIgcGFy
dHMgZnJvbSB0aGUgRFQgcGFydHMuCgpTZWNvbmQsIHlvdSBtaWdodCBuZWVkIHRvIHJldmVydCBD
TEtfRFNJX0RQSFkgYmFjayB0byBhIHJhdwpudW1iZXIgZm9yIG5vdywgc28gdGhhdCB3aGVuIHRo
ZSBwYXRjaGVzIGdldCBtZXJnZWQgdGhyb3VnaApkaWZmZXJlbnQgdHJlZXMsIG5vdGhpbmcgYnJl
YWtzLgoKVGhpcmQsIHlvdSdsbCBjb21lIGJhY2sgYWZ0ZXIgZXZlcnl0aGluZyBpcyBtZXJnZWQs
IGFuZCBjaGFuZ2UKdGhlIHJhdyBudW1iZXIgdG8gdGhlIG5ldyBtYWNyby4KCkNoZW5ZdQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
