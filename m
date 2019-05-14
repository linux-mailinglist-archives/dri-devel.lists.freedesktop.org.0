Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C11D069
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 22:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACA7892B6;
	Tue, 14 May 2019 20:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350F6892B6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 20:17:15 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w144so71886oie.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 13:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vCIo0PtXohxKjB0d7BJFUlaniBQb1hXlIxL8AXnKx2s=;
 b=l8M7jBifkMJhoInZE/uhlb5becUqcw6JuLyppSbGskzcd8OqSRhSn7EqspPXbI6Cpt
 Ndlk/Pwnt5qNYKISYROr+Y4C6YfokrPl/IlTWL7RXYdehZAKnxFctVgIkVTAqWvfllOK
 UP5j77R0cMPsL0LnMBqWVs8XaDkkj/fV/2HNIBFPdycBuEpueNUA0+aZM/EldV3+xHAp
 9yehGv2NXG17iuJlGqssW4JkF/EdbiiIDrfw/cULGNUKn8IVhB4y1LFnwSQWWyjsm4Ne
 8i7r9AGuNft3QG/hFRmzMPlaHa0PILnV0LAL3/CEuZ/DIyhuQPLJx/NT9fe4CNythhLt
 a33A==
X-Gm-Message-State: APjAAAXRu7caj3C7z9A/XNpXvHSOvR2t346t+q12fAVXpb15X2eKGKTs
 pe5FduPnqNq+4XMg28nB1aXb0fM=
X-Google-Smtp-Source: APXvYqxlzufSIdi94CYyBDo86DA3MUke7A1hx6ju2bPmafSngpVcnhTslU8xbt70Z6gVCOZxeByWsg==
X-Received: by 2002:aca:6086:: with SMTP id u128mr44867oib.79.1557865033944;
 Tue, 14 May 2019 13:17:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c24sm1979892otm.75.2019.05.14.13.17.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:17:13 -0700 (PDT)
Date: Tue, 14 May 2019 15:17:12 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190514201712.GA1742@bogus>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMiBNYXkgMjAxOSAwMDowNjo1NCArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToKPiBUaGUgVEhDNjNMVkQxMDI0IExWRFMgZGVjb2RlciBjYW4gb3BlcmF0ZSBpbiB0d28gbW9k
ZXMsIHNpbmdsZS1saW5rIG9yCj4gZHVhbC1saW5rLiBJbiBkdWFsLWxpbmsgbW9kZSBib3RoIGlu
cHV0IHBvcnRzIGFyZSB1c2VkIHRvIGNhcnJ5IGV2ZW4tCj4gYW5kIG9kZC1udW1iZXJlZCBwaXhl
bHMgc2VwYXJhdGVseS4gRG9jdW1lbnQgdGhpcyBpbiB0aGUgRFQgYmluZGluZ3MsCj4gYWxvbmcg
d2l0aCB0aGUgcmVsYXRlZCBydWxlcyBnb3Zlcm5pbmcgcG9ydCBhbmQgdXNhZ2UuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlk
ZWFzb25ib2FyZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5l
LHRoYzYzbHZkMTAyNC50eHQgICAgICAgICAgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
