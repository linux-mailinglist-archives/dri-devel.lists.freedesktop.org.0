Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7CA9E578
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 12:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEACE8997E;
	Tue, 27 Aug 2019 10:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E00B8997E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 10:12:54 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m24so18110442otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXr/N6UgFoqBhJXBYPum2Xxi7qT4YPGKDkbFVNt1Z+s=;
 b=cdf+nLibYiJMnJ0klMiJpFM3VsjN4Ab1S3rc/vPh7xN4QJT89vRozIQxc2TeHCcpM9
 5KcXjInLmSxYoYT2F+iT98t/H/JSWpCRJWUvTIbepOwLli6Wc8nle0BOPZxTBMi2lR9p
 hCy4Nh7D5FbZbP1bBOhcMEPQBPtYdP8xmKknZ1e/2vtow5+PVY6Z8bJvRYYFzh4K1pfm
 e1g6jycD/kF3HsHErGIjVefuUKwJev8nff8vSu0CbpP1CiLlm5K/9i6vo8ABoVdO4rTc
 gKGf8AXUOd4RsVLhToxZRsZQuzw51Z4MK5467GUwU1aHgN46onUj2yUABuMoVflQqxa7
 dCzA==
X-Gm-Message-State: APjAAAVK+QxBr2vWsCeVGL9/w7rzJKaCitm9utV60GRZZ8eEbw1Qs4w2
 pTLCS6JQ/3cFkgb4tbONurxrMMUfM5h1V3RuZ+Y=
X-Google-Smtp-Source: APXvYqwQjA7AvGiWHLmEQWgX4aad74lTLZ6g2giXr2GRvvfGYJpyeYuiAjBgoZ9EQiYgJBi6q8v3OoelPEM01eljDUw=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr16177733otl.145.1566900773750; 
 Tue, 27 Aug 2019 03:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
 <20190826224337.GL5031@pendragon.ideasonboard.com>
 <20190827095508.lpp74fh5capobvcf@uno.localdomain>
In-Reply-To: <20190827095508.lpp74fh5capobvcf@uno.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 12:12:42 +0200
Message-ID: <CAMuHMdWzUcpER2baZU_ysQeSKPA2AQ_5892+uJiUxsyvTYDSvA@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
To: Jacopo Mondi <jacopo@jmondi.org>
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Simon Horman <horms@verge.net.au>, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTE6NTMgQU0gSmFjb3BvIE1vbmRp
IDxqYWNvcG9Aam1vbmRpLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDE6
NDM6MzdBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IFNob3VsZCB5b3Ugc3F1
YXNoIHRoaXMgd2l0aCB0aGUgcGF0Y2hlcyB0aGF0IGFkZCBDTU0gdW5pdHMgdG8gdGhlIG90aGVy
Cj4gPiBTb0NzID8KPgo+IEkgZG9uJ3Qga25vdywgSSBndWVzcyBpdCBkZXBlbmRzIG9uIEdlZXJ0
J3MgcHJlZmVyZW5jZXMuIEdlZXJ0PwoKSWYgeW91IGFkZCBpdCB0byBhbGwgc3VwcG9ydGVkIFNv
Q3MgYXQgdGhlIHNhbWUgdGltZSwgYSBzaW5nbGUgcGF0Y2gKbWFrZXMgc2Vuc2UuCgpBY2NlcHRh
bmNlIHdpbGwgbW9zdGx5IGRlcGVuZHMgb24gd2hvJ3MgYXQgdGhlIGVuZCBvZiB0aGUgYXJtLXNv
YyBwaXBlbGluZToKT2xvZiB3b3VsZCBwcmVmZXIgYSBzaW5nbGUgcGF0Y2ggOy0pCgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
