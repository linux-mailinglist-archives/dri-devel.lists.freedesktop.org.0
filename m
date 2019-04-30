Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945CEE43
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 03:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6688916B;
	Tue, 30 Apr 2019 01:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71858916B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 01:17:11 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y64so4412549oia.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 18:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xaOdfxdw1hMtS7qaFsh00GiMGk+CxCyglGrKYxmtdsI=;
 b=uHn9+6KsCfU1m6z/R1D2BatWsKGPiHNLp4S5jRu8/q01hXeTY0dPTSempnOf+OzPLD
 t3XAHbTMPMNFfgoi1ZqnoipbIfnYwFXzO9aK6Caj/oYGsT2jI232mtbqQXAw9t7V8n4K
 huMawvnXv14BfTCKL3k47LysOdh17g1DeaTj8wOA9Qu5fPNinX0vXnrfz07X7RwBCfUb
 yS82g/9gdmxcEH9bI80zdE+xRgfNX0yEhV4rJS0w5u81hYUTsKRQimeHrtXl0Jq4VhxR
 Mpe3pOGJXgki9v/aRmLX0RmFXQDvaa4tQJmsJV84GCs5Sb5nE2HfW2UFsf/nrE5G2oiG
 Y8Hg==
X-Gm-Message-State: APjAAAXKSiMW43FAc+CVYSMyVTnubFhGmDQKuViWBvDM/zHBePctC8Ky
 Qq2H0256cQz66NNtKAP1Cw==
X-Google-Smtp-Source: APXvYqw6ntRhc/wbwykwNmMjNvveQySGSHN3ekx1kQx8S+cMQcTxyL7XbYzZewnuRIN19hQXVUioAw==
X-Received: by 2002:aca:ba82:: with SMTP id k124mr1493234oif.110.1556587030763; 
 Mon, 29 Apr 2019 18:17:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e23sm13995060otl.61.2019.04.29.18.17.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 18:17:10 -0700 (PDT)
Date: Mon, 29 Apr 2019 20:17:09 -0500
From: Rob Herring <robh@kernel.org>
To: Florent TOMASIN <tomasin.florent@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add CDTech S050WV43-CT5 panel bindings
Message-ID: <20190430011709.GA25451@bogus>
References: <20190417233846.11880-1-tomasin.florent@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417233846.11880-1-tomasin.florent@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, tomasin.florent@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBBcHIgMjAxOSAwMDozODo0NCArMDEwMCwgRmxvcmVudCBUT01BU0lOIHdyb3Rl
Ogo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBTMDUwV1Y0My1DVDUgcGFuZWwKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGbG9yZW50IFRPTUFTSU4gPHRvbWFzaW4uZmxvcmVudEBnbWFpbC5jb20+Cj4gLS0t
Cj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2NkdGVjaCxzMDUwd3Y0My1jdDUudHh0ICAg
fCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2NkdGVjaCxzMDUwd3Y0My1jdDUudHh0Cj4gCgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
