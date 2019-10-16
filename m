Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C307ADCE46
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BDD6EBCC;
	Fri, 18 Oct 2019 18:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716326E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 15:33:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 7so24492519ljw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HD7cxLp0NK/qYesJFUJ+z6fk+ZOrRl+xLhixqrzwrzE=;
 b=sCysopwTp3d14tZfAjrwyFMfLqgsXrS+0FIeKcRwUvRfGn7Ak4PmSptNi0Jq/TIhBm
 B20Q/G+oIgrdTIxCH9ZEslc6A2YcIs7z9SFiqiXczbZof/7yTFHxCIOPRMyR6d/QTMLH
 bdq69p8PGmacNguRYsaQCCsZpq5Pen++Ia6rZjY/FPtX0ml1vO0knhM702lXq5eU481P
 LB02NUcG/YGoUuIf0BqiBhBp5JvXXJXw0bQcKAvVLl2+cKu5000CYNf7CM/LA8bNHgvi
 2P1XbNqKwpd27sneNeD0EJ4LEzDb8oty3q7sfeLGQc4FHR2L18eczREkSFA6MAoRpsnv
 Md9w==
X-Gm-Message-State: APjAAAXxjDlDekHEP4cu8P/FkaF2dpysABZip34VuLSHri5rUpH0Y9dp
 w2LpDOpt1FhpnBgi9mm0LoR4MQ1g
X-Google-Smtp-Source: APXvYqy4KnubgOVWU5lDmJemo48WpbRW/GWI64D7DlGIlHy9vL/+N8yyJucnACMI+HYhydi7tlULfg==
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr1448621ljd.222.1571240032366; 
 Wed, 16 Oct 2019 08:33:52 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id h5sm7700986ljf.83.2019.10.16.08.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2019 08:33:51 -0700 (PDT)
Subject: Re: [PATCH 10/14] drm/tegra: Move IOMMU group into host1x client
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
 <20191014125049.425101-11-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
Date: Wed, 16 Oct 2019 18:33:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014125049.425101-11-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HD7cxLp0NK/qYesJFUJ+z6fk+ZOrRl+xLhixqrzwrzE=;
 b=KTPkMoRR1wmuigRJb21l9Ved9LD0Q3iXgrv9FGT6upyD/FgjEIYc3qA4Z8fPYEuMR0
 PtF6UfHQo9La3A+tJ43xU4SijMrcdZi3uQeF6i2JSyu0zLJnt0QaPCrUIiXXcJnO4rIJ
 bjhy+0QCyNLjEX4OSi6FG7rPF9xMssbXq6Ei8rzKOcZrU+7QI8DFzSwejM28OWEjeAiJ
 D2DlPDOXJXjlcUxLSlr/w6gtENVay8ar8jOZsbuBqldqD0ezq2GdwZZV51fLQFtGMzA7
 g3+X5GhKsJbSMPWNhjZ1SOjoTDaSAugPWYFp708r6A2WyT34H3BwbmNN2wGooW+Z0pjH
 VlHw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTQuMTAuMjAxOSAxNTo1MCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEhhbmRsaW5nIG9mIHRoZSBJT01N
VSBncm91cCBhdHRhY2htZW50IGlzIGNvbW1vbiB0byBhbGwgY2xpZW50cywgc28gbW92ZQo+IHRo
ZSBncm91cCBpbnRvIHRoZSBjbGllbnQgdG8gc2ltcGxpZnkgY29kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuYyAgIHwgIDkgKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kYy5oICAgfCAgMiAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgIHwgMjIg
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggIHwg
IDYgKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjJkLmMgfCAxMCArKysrLS0tLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjNkLmMgfCAxMCArKysrLS0tLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS92aWMuYyAgfCAxMCArKysrLS0tLS0tCj4gIGluY2x1ZGUvbGludXgv
aG9zdDF4LmggICAgICAgfCAgMiArKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDQwIGRlbGV0aW9ucygtKQoKSGVsbG8gVGhpZXJyeSwKCklzIHRoZXJlIGFueSBjaGFuY2Ug
dGhhdCB5b3UgY291bGQgcGljayB1cCB0aGVzZSBwYXRjaGVzIFswXSBhbmQgcmViYXNlCnlvdXJz
IHNlcmllcyBvbiB0b3Agb2YgdGhlbT8KClswXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXgtdGVncmEvbGlzdC8/c2VyaWVzPTExNTYwOApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
