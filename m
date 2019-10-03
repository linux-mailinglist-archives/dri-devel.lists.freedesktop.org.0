Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45284C9899
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7DD6E25E;
	Thu,  3 Oct 2019 06:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB806E25E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:50:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id a1so3035770ioc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHYvlpN03aN9XlL85X95NOUwb+VywcBIMog6JdvU8/E=;
 b=VvQSzsJ2tmCqXv9QhN90MnmUBU/G7c0zdt5N4ALjV+glNo4GSBO0LuJjS1875Rmush
 TUS0LA5h1yYkFLULK0iXNHqI/RWqzeabKpJh95yon1xp1NeRoJ5MMQoiz5YEnC1n4l+E
 RzWQ29HvD/NdwN/IpWlspa5itX4d1OeovZv8wlu/cAF8uiNpoJqyrk9nFTB6YPWQ/wTG
 mcG2wxmD7lfuowZz7ARq/oIlg7m5VJ5UaLdwcQ4TTkYiMrSlkBqvrsxc72utZcJOmihJ
 oc2OZP9zcBOgQaarnaO2JiRej8YwnVGV7zhbEOb8lTGPszENDSqCvzLrbCeuh79MrpOj
 pn1w==
X-Gm-Message-State: APjAAAV15onpuLeElPVZQ0z7HN3s2YQN3JY2uWPLnq4kr3DdOPREV+L4
 EjU71eO235Svatu5RoMEAvqg8zbB+gRsLEC65BvqNQ==
X-Google-Smtp-Source: APXvYqxidNtZbs0x8HYndi+juRNw13gBCSF4Pfuk3ENR73KLAzRF4+IeuTb4FHlPvke2H95mbMi4Mwo+TGNlA/lh/QE=
X-Received: by 2002:a6b:2b07:: with SMTP id r7mr7235777ior.173.1570085448370; 
 Wed, 02 Oct 2019 23:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-8-jagan@amarulasolutions.com>
In-Reply-To: <20191003064527.15128-8-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 12:20:37 +0530
Message-ID: <CAMty3ZAHPWOn=h04AjGLf33uGhW4MxqpU4z1izGp0BgUmyOiLQ@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] ARM: dts: sun8i: bananapi-m2m: Enable Bananapi
 S070WV20-CT16 DSI panel
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZHYvlpN03aN9XlL85X95NOUwb+VywcBIMog6JdvU8/E=;
 b=TPFD+Yd6CfTdFITa1ngVIu7bhHHpMGlesUhtu9MDTLyuP4HMgvy5WMD6yyY9KoFNW3
 ULlEEjL/G+DiRVPDmI16XEM5gcI+L9El120dH3U1ZMT0cm1lcBnN6D4y2tXwllLYtcPN
 nc2TkrkJ2eYpF/SLjZO42qi/FTcx1ZBzS8t0E=
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAxMjoxNiBQTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZCBzdXBwb3J0IGZvciBCYW5h
bmFwaSBTMDcwV1YyMC1DVDE2IERTSSBwYW5lbCB0bwo+IEJQSS1NMk0gYm9hcmQuCj4KPiBEU0kg
cGFuZWwgY29ubmVjdGVkIHZpYSBib2FyZCBEU0kgcG9ydCB3aXRoLAo+IC0gRENEQzEgYXMgVkND
LURTSSBzdXBwbHkKPiAtIERMRE8xIGFzIFZERCBzdXBwbHkKPiAtIFBMNSBncGlvIGZvciBsY2Qg
cmVzZXQgZ3BpbyBwaW4KPiAtIFBCNyBncGlvIGZvciBsY2QgZW5hYmxlIGdwaW8gcGluCj4gLSBQ
TDQgZ3BpbyBmb3IgYmFja2xpZ2h0IGVuYWJsZSBwaW4KPgo+IFNpZ25lZC1vZmYtYnk6IEphZ2Fu
IFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQoKVGhpcyB3b3VsZCBiZSBh
biBvdmVybGF5IHBhdGNoLCB3aGljaCBkb2Vzbid0IG5lZWQgdG8gbWVnZS4gcGxlYXNlCmNvcnJl
Y3QgdGhlIHNhbWUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
