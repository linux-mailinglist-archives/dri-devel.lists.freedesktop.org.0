Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2D9F422
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 22:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9131289C2C;
	Tue, 27 Aug 2019 20:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B9689C2C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 20:29:47 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id n1so317132oic.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 13:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8niDKrVIoqrSXH9oif2WET13kHnIVA/UIc91Gu8SkZM=;
 b=VKrYI1aDJJpCLFYBN94IXm8IrxM9jO1HTfRjSY5dKxRLwfXBHpSDw4JlTcJpEiAJ5n
 eQwIA9fqPiJNMYgU2ZF4l7cmqqApWpCc0T5TIynA089vbPoxjAM3rOyWmBxVU6FQhS3B
 0OllX0EZgooVcEgbNAf1Ft2gXVX9h0JkD7vHQW3V/PnLabjgWCiLxw5dYMz1wbrMShU6
 YnCHnuZGqNpw4k4tmgMPjI1pV6B/V/LAcNWNyT0aocW7QtXzAxYm6r0Uzhj+T16Ke45f
 SwcpDdWYSKPENlkvLOAwL4dqEJ8qz8FSkenSd4s0EpoITWbeF878N4wv7al64F0UbxuP
 SCag==
X-Gm-Message-State: APjAAAUmXnvJCng4rd5fvrCoTqE5XZThisbyfEhhQhAmf7IRreMy5N8I
 sPWt4qexeYLu2X9K00FzNw==
X-Google-Smtp-Source: APXvYqyvi93uz4dBcCcm4cI88A8pdbEVLlyRLkZI+skrt3KOD0/N23uLiDTKZNEwXqB/ZdPpBbIoDg==
X-Received: by 2002:a05:6808:982:: with SMTP id a2mr396001oic.59.1566937786583; 
 Tue, 27 Aug 2019 13:29:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j19sm144026otk.46.2019.08.27.13.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 13:29:46 -0700 (PDT)
Date: Tue, 27 Aug 2019 15:29:45 -0500
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas, du: Document cmms
 property
Message-ID: <20190827202945.GA3488@bogus>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie, mark.rutland@arm.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDM6NTE6NDJQTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOgo+IERvY3VtZW50IHRoZSBuZXdseSBhZGRlZCAnY21tcycgcHJvcGVydHkgd2hpY2ggYWNj
ZXB0cyBhIGxpc3Qgb2YgcGhhbmRsZQo+IGFuZCBjaGFubmVsIGluZGV4IHBhaXJzIHRoYXQgcG9p
bnQgdG8gdGhlIENNTSB1bml0cyBhdmFpbGFibGUgZm9yIGVhY2gKPiBEaXNwbGF5IFVuaXQgb3V0
cHV0IHZpZGVvIGNoYW5uZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNv
cG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0IHwgNSArKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKPiBpbmRl
eCBjOTdkZmFjYWQyODEuLmMyMjY1ZTJhMWFmMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gQEAg
LTQ1LDYgKzQ1LDEwIEBAIFJlcXVpcmVkIFByb3BlcnRpZXM6Cj4gICAgICBpbnN0YW5jZSB0aGF0
IHNlcnZlcyB0aGUgRFUgY2hhbm5lbCwgYW5kIHRoZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMg
dGhlCj4gICAgICBMSUYgaW5zdGFuY2UgaW4gdGhhdCBWU1AuCj4gCj4gKyAgLSBjbW1zOiBBIGxp
c3Qgb2YgcGhhbmRsZXMgdG8gdGhlIENNTSBpbnN0YW5jZXMgcHJlc2VudCBpbiB0aGUgU29DLCBv
bmUKPiArICAgIGZvciBlYWNoIGF2YWlsYWJsZSBEVSBjaGFubmVsLiBUaGUgcHJvcGVydHkgc2hh
bGwgbm90IGJlIHNwZWNpZmllZCBmb3IKPiArICAgIFNvQ3MgdGhhdCBkbyBub3QgcHJvdmlkZSBh
bnkgQ01NIChzdWNoIGFzIFYzTSBhbmQgVjNIKS4KCnJlbmVzYXMsY21tcwoKUGVyaGFwcyBkZWZp
bmUgd2hhdCBDTU0gaXMuCgo+ICsKPiAgUmVxdWlyZWQgbm9kZXM6Cj4gCj4gIFRoZSBjb25uZWN0
aW9ucyB0byB0aGUgRFUgb3V0cHV0IHZpZGVvIHBvcnRzIGFyZSBtb2RlbGVkIHVzaW5nIHRoZSBP
RiBncmFwaAo+IEBAIC05MSw2ICs5NSw3IEBAIEV4YW1wbGU6IFI4QTc3OTUgKFItQ2FyIEgzKSBF
UzIuMCBEVQo+ICAJCQkgPCZjcGcgQ1BHX01PRCA3MjE+Owo+ICAJCWNsb2NrLW5hbWVzID0gImR1
LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwo+ICAJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZz
cGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+Owo+ICsJCWNtbXMgPSA8JmNtbTAgJmNtbTEg
JmNtbTIgJmNtbTM+Owo+IAo+ICAJCXBvcnRzIHsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
Cj4gLS0KPiAyLjIyLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
