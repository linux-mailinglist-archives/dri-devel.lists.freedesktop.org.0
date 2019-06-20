Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FAC4E129
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D676E841;
	Fri, 21 Jun 2019 07:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22546E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:47:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x4so3543897wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 08:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8+O/FpjGEp5DMwDwlNn6YYVJi0XgVp0kNC/STZbtEU=;
 b=NNWF7JtoCJsEkur2UO/LxiBxA4uFUGAWlMiYQcIwEA95ujnLFvpKhdAGtiwDErHkbM
 FDBhR3Z9WIq2ctt2SEZEoD+2JshkgaYp8CWFNiP5DROs7cPvdejQaRB9C1Of5lKxgzka
 IEACvnWr+rmvhil0q1EV4gpborlzq6r10s57k3GkmwmzUAZY2QxizMb4ltYnIKLTolEa
 F3Q91co3i+FR/m5HH9OYsf6paRL/A58ufUdQHBuWGwYWgZX/k69Xswm1dhjQMlxkRiwt
 e1C/upetM6uwcCrBFn2JZQIyRJ+qOB2S7+xroDt7OZ/wGSTmSa3Kq+IyCqHTxT1Qg7Iq
 4cpg==
X-Gm-Message-State: APjAAAUD9aVyRAjwmYv4yXfN0/dj9mDG22PxK514zpeo9P/DnhZrUmQm
 UdWLGnycQt0ncV3/SsQr/gI=
X-Google-Smtp-Source: APXvYqzHNm9RBSmLyiRY/o0XRv5jhDv7AQySfI5uddGuB8TuFA9tiBLHxxYFpdEKryoOHuXSd1FtIw==
X-Received: by 2002:adf:db4c:: with SMTP id f12mr11932674wrj.342.1561045653597; 
 Thu, 20 Jun 2019 08:47:33 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net.
 [86.58.52.202])
 by smtp.gmail.com with ESMTPSA id f1sm6408689wml.28.2019.06.20.08.47.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 08:47:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, megous@megous.com
Subject: Re: [linux-sunxi] [PATCH v7 5/6] drm: sun4i: Add support for enabling
 DDC I2C bus to sun8i_dw_hdmi glue
Date: Thu, 20 Jun 2019 17:47:29 +0200
Message-ID: <3014360.88acaTKTIR@jernej-laptop>
In-Reply-To: <20190620134748.17866-6-megous@megous.com>
References: <20190620134748.17866-1-megous@megous.com>
 <20190620134748.17866-6-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8+O/FpjGEp5DMwDwlNn6YYVJi0XgVp0kNC/STZbtEU=;
 b=a7G2DL7iS4UbSDyFHlZOt6gKtJamMp/qfpGySB+qvl5QIMgRi8u3Ut0Sa2Dw/k1Pz2
 7iNZ4pUk8GMd46O4PxGk80ppkgFDfnAFNxbKL14h+yTOiF5f3BwkZbir65F4Y7xEGLJ9
 SI8cLSGVyRynl6LsNTsshElVDLAUUteWO9o8hESIO7QPzimF/9fCHcBJlyYhURyy1mHN
 l3bA475pko/ng+rpoWW0GaKL8F9oXrRuIqDLQ6bKdlwMGmGvaDmf1iq8afXYilHH2cN+
 1GrCeS/EuTcD9sOJqC2aUIhCbsJx2E/XvOaN1zKIYif8YqE1a37uYInaoJqf/1f5dM0d
 tVKw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIMSNZXRydGVrLCAyMC4ganVuaWogMjAxOSBvYiAxNTo0Nzo0NyBDRVNUIGplIG1lZ291cyB2
aWEgbGludXgtc3VueGkgCm5hcGlzYWwoYSk6Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3Vz
QG1lZ291cy5jb20+Cj4gCj4gT3JhbmdlIFBpIDMgYm9hcmQgcmVxdWlyZXMgZW5hYmxpbmcgYSB2
b2x0YWdlIHNoaWZ0aW5nIGNpcmN1aXQgdmlhIEdQSU8KPiBmb3IgdGhlIEREQyBidXMgdG8gYmUg
dXNhYmxlLgo+IAo+IEFkZCBzdXBwb3J0IGZvciBoZG1pLWNvbm5lY3RvciBub2RlJ3Mgb3B0aW9u
YWwgZGRjLWVuLWdwaW9zIHByb3BlcnR5IHRvCj4gc3VwcG9ydCB0aGlzIHVzZSBjYXNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgoKUmV2aWV3
ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KCkJlc3QgcmVn
YXJkcywKSmVybmVqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
