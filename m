Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7381B8FE1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B046E2B0;
	Sun, 26 Apr 2020 12:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABD76E28B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 21:52:02 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f11so9038335ljp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 14:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WTFn6rB9HKermcvkoC+LjOH1uLnCCCkq/7Yk0Bhk1hY=;
 b=ctifTUoW5D6cpHfjxDauyqzluTWYK6w53t0tAtbRJh/7mTvp5osgtao5DHPC2ZCsfy
 0F7bv5j5gdNFDHjT3Uljtsok3FdmdMmVROA9Fh3bFVTvCQM9oCZCHJrh7xinj+xzJ5mf
 2LaIJ7d+q8TCT4nIn5Yk75z0c9HdCZISgMTC9sTxoEu/tUFN6ei8hIOQEPcOqN2ZOU5c
 PPq9FFYlXI8ygNSc62Zt5sDTjtVkX1aKDRXyHxX/54Cf2UDmDH1TSv4KWjf1aL0CMtvF
 PZRZywh0se+wPkMcMPh7zjCzqv7Z2p3H95x9ZIn61s8p3su56DYqCSA9VM9SBo0wbzc4
 hqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WTFn6rB9HKermcvkoC+LjOH1uLnCCCkq/7Yk0Bhk1hY=;
 b=nwAQVbTNAWXrFH3Geg263N8xtMhJNyLz4oMjcOdfdiRyyJ6QwmewSujcSX9DbWueta
 gTx0yJXZodyXDHWaQKg1nsL+rde8oYdm9ShyDh7O3Upz2FzbcpBAPHpb1QNlQhH4aLzh
 VrXSNDyunhtWYcpES6WrVv8YjsVlVaNUIVdU6+IdSHqtCdq8XBVgSUW0J0YSadbSsmHJ
 jBqCWa+YN20vrQ0CXl6COAKg+l3FanRnefQ//7WcYxs9oyz38Jacb8eH8e317AaFnwT9
 Z2hiAD0axJM21ANbVEgS1F+IDHT9xUPGZneZMX1ZuqHkGp/FrJ3nPRi3mkvSwMWqrXqA
 tv0Q==
X-Gm-Message-State: AGi0PuabWjKeQcjDUrGaTvC6f631sjiioSkjdimVIGmzAz2QCq3L+DrE
 +IzogkRdbQS0vYXV9hueI90b1lK6
X-Google-Smtp-Source: APiQypJYgN8HmjiAC+Az+JE+6s5LC3yyQ5KUiUc+DMuLZfUfxWBQXCbPiBkO2LCclFex5yr8qn5c0g==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr9632764ljg.204.1587851520651; 
 Sat, 25 Apr 2020 14:52:00 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id a26sm7599728lfl.66.2020.04.25.14.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 14:51:59 -0700 (PDT)
Subject: Re: [PATCH v5 6/6] drm/tegra: output: rgb: Wrap directly-connected
 panel into DRM bridge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-7-digetx@gmail.com>
 <20200425170237.GA20498@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f03c260b-54ae-93ed-69e8-de434e74ed82@gmail.com>
Date: Sun, 26 Apr 2020 00:51:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425170237.GA20498@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjUuMDQuMjAyMCAyMDowMiwgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5Cj4g
Cj4gT24gU2F0LCBBcHIgMTgsIDIwMjAgYXQgMDg6MDc6MDNQTSArMDMwMCwgRG1pdHJ5IE9zaXBl
bmtvIHdyb3RlOgo+PiBDdXJyZW50bHkgVGVncmEgRFJNIGRyaXZlciBtYW51YWxseSBtYW5hZ2Vz
IGRpc3BsYXkgcGFuZWwsIGJ1dCB0aGlzCj4+IG1hbmFnZW1lbnQgY291bGQgYmUgbW92ZWQgb3V0
IGludG8gRFJNIGNvcmUgaWYgd2UnbGwgd3JhcCBwYW5lbCBpbnRvCj4+IERSTSBicmlkZ2UuIFRo
aXMgcGF0Y2ggd3JhcHMgUkdCIHBhbmVsIGludG8gYSBEUk0gYnJpZGdlIGFuZCByZW1vdmVzCj4+
IG1hbnVhbCBoYW5kbGluZyBvZiB0aGUgcGFuZWwgZnJvbSB0aGUgUkdCIG91dHB1dCBjb2RlLgo+
Pgo+PiBTdWdnZXN0ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPgo+IAo+IFRoaXMgcmVzdWx0ZWQgaW4gdGhlIGV4cGVjdGVkIHNpbXBsaWZpY2F0
aW9ucyAtIGdvb2QuCj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
CkhlbGxvIFNhbSwKClRoYW5rIHlvdSBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIHBhdGNoISA6
KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
