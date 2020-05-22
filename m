Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160211DF667
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615B6EA52;
	Sat, 23 May 2020 09:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054CE6E9A4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:09:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id u1so8435438wmn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0aJqkYrdM+sgbvUusxT8hDNKtBoLOQG92w0wNo7M1w4=;
 b=r+FNl2KwIQ7JgjPzvrnUaW17rVNutC2CTeAMUaRHvvsnpUtCkm2JjIRnFLtESPgc98
 bWET8r1VtyWvDebFioaQQdSqQywAIbHbtgWvJCboIHty4zcCRsHDLPEUVn206M/Y/lnC
 L1XGN0wmoFwCyTs5yYSag1A0IG431c3PHrdm9Qz2iQLbemMw7CkeUtG8zXO3x+wt6Saa
 rYi/yzSDTQervbLrgj2+Xr4TS4PITujdbP4xgZ1QXafnuii+JTLb/S1JAhpKwiQbq7ir
 s3qXFCpg/IzTKu9btruMwy1c9ljrzeWgvJHZnKXBTE4hZJk2EWBzK3bIV5Wpg1ZyxbLe
 jFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0aJqkYrdM+sgbvUusxT8hDNKtBoLOQG92w0wNo7M1w4=;
 b=SGPYLI1rm9t5L467Ups6jnsgeKCVmBJl/om6NYnB3j1jTGddJoEiHoA+rf9TJplVJ+
 nhiLgFEpDdxmbHKTEqgX0hl/h74FwaCkcURyRd6W00lwk8Y1KJkMgUffxBZz9sgfWsRw
 jFfi4+OMAOVJ+vOz0blbDHcFYJdLSk9U3hUMf8kuz9zz8gFLdSLXlbDDlrlqU9hjfnpC
 exqLh1yxhBqp6aF0MXqIZlsPecPkTR056SOvxCQ1cvk5gECtaLs5XFBZjrFIb8BFLqJF
 Wdw8f8ne8S9cYLyKwe2ANmExS0FulAZPLJ3sBbZBgm+bn3hTVBZI1SiRTyMHE7x/nzGI
 Yyzw==
X-Gm-Message-State: AOAM533l+uUFRDTWBc6TsBkZzum8Pd1AvEICgsnO1CQ2WxTfNDKw0nsd
 V4z9O7X8S12ImpAc6efMtDI=
X-Google-Smtp-Source: ABdhPJwcDofe/8iI1LchV/4xbq+fLSJ7DSsUdZR+A9tox/LGZa0X/bncsOu4qrCpcFWpKdta9zQA7Q==
X-Received: by 2002:a1c:2013:: with SMTP id g19mr3470829wmg.143.1590149383522; 
 Fri, 22 May 2020 05:09:43 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan
 (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id x17sm9259500wrp.71.2020.05.22.05.09.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 05:09:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 5/5] nand: brcmnand: support v2.1-v2.2 controllers
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200522132211.16c657aa@xps13>
Date: Fri, 22 May 2020 14:09:42 +0200
Message-Id: <4153A581-0894-4A4F-AE8D-22E5A976FE06@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
 <20200522072525.3919332-6-noltari@gmail.com> <20200522132211.16c657aa@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTWlxdWVsLAoKTm8sIG5vdGhpbmcgZWxzZSBjaGFuZ2VkLgpJIHdpbGwgY2hhbmdlIGl0
IGFnYWluIHdpdGggdGhlIHByb3BlciBzdWJqZWN0LCBzb3JyeSBmb3IgdGhhdC4KCkJlc3QgcmVn
YXJkcywKw4FsdmFyby4KCj4gRWwgMjIgbWF5IDIwMjAsIGEgbGFzIDEzOjIyLCBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiBlc2NyaWJpw7M6Cj4gCj4+IHYyLjE6IHRl
c3RlZCBvbiBOZXRnZWFyIERHTkQzNzAwdjEgKEJDTTYzNjgpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
