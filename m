Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202177378F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBE08908D;
	Wed, 24 Jul 2019 19:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774F588CFA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:14:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so42786303wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+dgR7D/EXKyMHjC4KOvCZR7USJlIlrVgRqVtNiYm68A=;
 b=bw/y2odUIpTk6im75jQWVKbfnaUwb/kF2MDary5wBiDZkeN83nU77S7Eppu8RuYRB9
 7lFQTgReU32RplJ6Epl2HVrfBeNwEeSRDdoE8FzxHUtk5yMK1D0NGaYTCLZgNbHzQDIy
 H02hzbz2P2jQaPGlsYY8lfPT+8TgbNUlONkzidUmwjcB+6rJ9A7h3URf8HzDsumzLuKW
 qntDjZQSSx/qd3AiHBql16AVNCAykgukv1Ml/mQQofErmk2hX3wfHnbIKZFz4OUCZyUS
 +S0ptLuWBPKbV4xZdUmRiOHIoqoSz28fnlgLvDi9+LlriuwLkVU26fGUwOEo3U78ZcU+
 t9MA==
X-Gm-Message-State: APjAAAWHlGiGZRoCNIOBbVNMVDfCO3pBGiHNObyyZi8R/LFmYIOFE47m
 ir2H3F7ukDskLcXWCqxhfu4=
X-Google-Smtp-Source: APXvYqxr0ifyhVtp91zsXaTGdqxuq3wdKwgnKuWnLCyxSECwcySUMHL3yuZ93uJZ/W8HD1t2wKkzTw==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr69920564wme.74.1563995658727; 
 Wed, 24 Jul 2019 12:14:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id p6sm50559987wrq.97.2019.07.24.12.14.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:14:17 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:14:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 04/11] devfreq: exynos-bus: Clean up code
Message-ID: <20190724191415.GG14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122024eucas1p25a480ccddaa69ee1d0f1a07960ca3f22@eucas1p2.samsung.com>
 <20190723122016.30279-5-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-5-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MDlQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIG1pbm9yIGltcHJvdmVtZW50cyB0byB0aGUgZXh5bm9z
LWJ1cyBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29u
QHBhcnRuZXIuc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVz
LmMgfCA0OSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCkJlc3QgcmVnYXJkcywKS3J6eXN6
dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
