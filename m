Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012365F9C5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC566E34B;
	Thu,  4 Jul 2019 14:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D536E34B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:09:51 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id 34so1184620uar.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 07:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQ5m8rYbT8Z2US94ZaqcngLhWVtKzNxmo7qmupLUZ7w=;
 b=VuxO1T6ZdGMOEBLvFpYToYRh8eRGHZqbstRLpz1yANgY2oDGsR48zSSLzk1Im9HDaG
 KowrKqxJg5SPEvbwfjrfETmVIaFekVA8Zhc90UqOpPeM+z9zWBFIJhjpQxHzowm8Gd2P
 q/zSB6z8SwxvIYMum+XWa15WC0u5S827fNtrfRwrQPqCsyLlmqoF4FeADqdf2ECUCfPT
 u0rN+5hD0zorNZyNB0CY6iS0v56jr4QHuxjl6i7kZOI8lfJuqvgBQmgmdvIPaaaqnlIJ
 fTnt39Xp3e9sTc+g6wWPO6A+br6xo61LjZ+ZKNlObj6OVJUN7AYfE7LeYbkz3ZrnrDJa
 MKMw==
X-Gm-Message-State: APjAAAWeQo4o6P3+I5SWuwzcaYZvvA10OeBiWfA/WfmW56MuJp1vqTur
 TWoi/NzLMke8HpBlru7WWJ0qTjrsodr5LWSE20s=
X-Google-Smtp-Source: APXvYqw2dNxxbf+8Wi66NiMCCn2WzNJSfu4KOQyo4/Q4ZNqttIe/PSYYLn2ptK9W58HniHDZdcr9VegpbZ4mY00GnBg=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr16501064uan.46.1562249390682; 
 Thu, 04 Jul 2019 07:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190704023436.4456-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190704023436.4456-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 15:09:59 +0100
Message-ID: <CACvgo50s0oh3tRjpUxeTkpFGJXahwB72hW=cc-de=2MG587m3Q@mail.gmail.com>
Subject: Re: [Patch v2 01/10] drm/exynos: using dev_get_drvdata directly
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mQ5m8rYbT8Z2US94ZaqcngLhWVtKzNxmo7qmupLUZ7w=;
 b=oIqiaWuC6upmXjZw83Sk7A7AN228dkex7qLAmW3GCy+0EdImPA38Kk1jNfvfdrZi3V
 bhdR7xb6+PRPFieFo6k5xXWKmR1zWZO2TNP+7r3I4FGpkkwc588AR5j7TJ2l9+07uWmG
 mptGkWYKyHhVPxQUywF6hQOLXeX4k+q4AzscwADbbBwmytmPpN1YtLs1e6RLR/uOVoJO
 e7Lqkp7Ol5BKEYqrzorBo+PvwCgZJrMN6FLWd5OgJgmMDIjmSC/Dtrvj0F6QbItWmz8Q
 GEnvd5zoUJsbxd7atboADB4j8JGLKNWGEET4JkCvbgvTP8bv1aeCrtb10TIA3tScAfw/
 lQ+w==
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA4OjI2LCBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTZXZlcmFsIGRyaXZlcnMgY2FzdCBhIHN0cnVjdCBkZXZp
Y2UgcG9pbnRlciB0byBhIHN0cnVjdAo+IHBsYXRmb3JtX2RldmljZSBwb2ludGVyIG9ubHkgdG8g
dGhlbiBjYWxsIHBsYXRmb3JtX2dldF9kcnZkYXRhKCkuCj4gVG8gaW1wcm92ZSByZWFkYWJpbGl0
eSwgdGhlc2UgY29uc3RydWN0cyBjYW4gYmUgc2ltcGxpZmllZAo+IGJ5IHVzaW5nIGRldl9nZXRf
ZHJ2ZGF0YSgpIGRpcmVjdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFu
Z2ZxLmRheGlhbkBnbWFpbC5jb20+ClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4gVGhpcyBwYXRjaCBp
czoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+
CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
