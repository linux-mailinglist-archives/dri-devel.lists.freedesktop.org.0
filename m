Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC58E4EC6F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449D66E8E5;
	Fri, 21 Jun 2019 15:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF386E8E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:45:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d11so5428008lfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4fJ2PnraFqUF/JKW5XviEksJ6k/ji8A1pgBHcnkA8+E=;
 b=s9u/EuCX4HcGMXhpr+eboWBE3O2hN1DRJR7iEalC8OxVSmPyOPGlSKq0DMRQHycw7a
 mdSVRaf9nnUbZ1QuTYu0ZDurEawq9GAoCLuBExHnE1mD7k0gpA3926/ZSlTH/vrqZqmT
 mDAoi50QlCF7wKirFTVv4ve93veTzNm27umXVQdNI4wLPOTT/Z8nJ1GPX16vDpU72IXO
 OodGDo98wgTnEvaZFI7m7fEngb3ebVCp7FCy+He9+enQ1fD3gD4iwo3ZoTdnwcJ+KvIl
 RdWqzgAollYvLvEpu0DZTArvErpeuBm3Qd1y7tT/dHNjbeq+l0rZNCk05xFrsaMos+JE
 q0IA==
X-Gm-Message-State: APjAAAU0VhTqPeqGWO8Yj1AVdkpo5M8sHgA8E1Tcjtyi3DOUamVD/tSY
 nBgJvf3P+0Pg/9A7edQsSxDfdtnW/WVOQKC2go5AoDPL
X-Google-Smtp-Source: APXvYqz6D7hHywj9tjfdpfWvZgBxWUEM8p1b8MpTAcYzk1K50zC1HX6fCm6UtxOlAeLLvSEWoWzUM8ZiXDxjqeKAWlY=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr61718401lfk.20.1561131944203; 
 Fri, 21 Jun 2019 08:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
 <1561037428-13855-2-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5DunK3+ovBd0c0X4NTf-zkW1Tjz6KgXFMaRQKMk2SBMiw@mail.gmail.com>
 <1561126587.9328.76.camel@nxp.com>
In-Reply-To: <1561126587.9328.76.camel@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 21 Jun 2019 12:46:02 -0300
Message-ID: <CAOMZO5D+7msAxc99KFi=OWCNeBSxKXtJ8O=J7U+YE6v=xz3cAg@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v3 1/2] dt-bindings: display: panel: Add support
 for Raydium RM67191 panel
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4fJ2PnraFqUF/JKW5XviEksJ6k/ji8A1pgBHcnkA8+E=;
 b=M5u5XAIr4/a9W+EOhbLJumvb8itBVqTB2Ji867d06wxMEN0K/uPSTFU/b9ZGKcMIXY
 YRP8sdd2tIHI53RrppKMThlzKXbPhv3tDlXKQy4i4reEDjcB51u8wPcitp6atGhZi/rp
 oWErBg+ya6fRSw2bFlVMMSSfLLqaB5b4ZMvmnvORkkyKOIEjIiFTazSIxpnxwGATssBR
 WG/WBqOrG1IFzN37qTZlimvtfgbxvmJXPnTrWTk0x2YuuRbWP5K0lzrW73l6aM0uWp5p
 H612FyjZgTBnT5tPGNXyAb31CJkAfoC7M64QEN1VMuTYjWU38OUd+IGzGTbsuR1jm8hB
 4L7A==
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MTYgQU0gUm9iZXJ0IENoaXJh
cyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPiB3cm90ZToKCj4gRnJvbSB3aGF0IEkndmUgc2VlbiBp
biB0aGUgc2NoZW1hdGljcywgdGhlIHBvd2VyIGxpbmVzIG9uIHRoZSBEU0kgcG9ydAo+IG9uIGFs
bCB0aGUgaS5NWDggY29yZXMgYXJlIGNvbWluZyBmcm9tIGEgUE1JQyBwcm92aWRpbmcgcG93ZXIg
Zm9yIGFsbAo+IHRoZSBwZXJpcGhlcmFscy4gU2luY2UgSSBkaWRuJ3QgZmluZCBhIHdheSB0byBj
dXQgdGhlIHBvd2VyIG9uIGEgc2luZ2xlCj4gcGVyaXBoZXJhbCAobGlrZSBEU0ksIGZvciBleGFt
cGxlKSBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgZm9yIHBvd2VyLQo+IHN1cHBseSBwcm9wZXJ0eS4g
Rm9yIG5vdywgYXQgbGVhc3QuCgpUaGlzIHBhbmVsIGRyaXZlciBpcyBub3Qgc3VwcG9zZWQgdG8g
b25seSB3b3JrIHdpdGggaS5NWDggTlhQIHJlZmVyZW5jZSBib2FyZHMuCgpUaGUgZHQtYmluZGlu
Z3Mgc2hvdWxkIGJlIGFzIGFjY3VyYXRlIGFzIHBvc3NpYmxlIGZyb20gZGF5IG9uZSwgc28KZGVz
Y3JpYmluZyB0aGUgcG93ZXItc3VwcGx5IGlzIGltcG9ydGFudC4KClBsZWFzZSBsb29rIGF0IHRo
ZSBwYW5lbCBkYXRhc2hlZXQgYW5kIGRlc2NyaWJlIHRoZSByZXF1aXJlZCBwb3dlcgpzdXBwbGll
cyBhY2NvcmRpbmdseS4KClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
