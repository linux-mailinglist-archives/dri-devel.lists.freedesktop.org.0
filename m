Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102B82EEB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941486E352;
	Tue,  6 Aug 2019 09:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBB36E34E;
 Tue,  6 Aug 2019 09:42:57 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id v6so57940121vsq.4;
 Tue, 06 Aug 2019 02:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNWJ6iduH458WYXym68c6LlDchiYVoZjPNCQTHnsg+g=;
 b=JmIZLFwaZX/XX7+yeT0UreeGuDC8wFD+cMgqMiAC5suz8I97XoPBy/RLCW+wKaNrZh
 kiOVQOSs0myrf9RMmoHAEjkdvULWixBSDs881YnU/j5Qcp/0W3BBNgMa0x/LtYJSqjB6
 yTAQgPQpgxKvGisYpeZhye9Z20YEqNIkliikCczNE2bZR3e2/l+AGnVWQRb11WRe2jT5
 qVY1k7xoE9QuS87Z3O3xignAo1hVfzytff4qUbZFqcfEoVAJM5DLxxly5F6Si9rgWmlY
 KEw+H6FB1O1ijE/lCBRxW55AiRaaaDzUhRrW5JKpw7K8pyoN3wy6v8eAkfCXHS9NmGJP
 huqg==
X-Gm-Message-State: APjAAAWPIiatORitz1/dBU+gOk05TXFEfuq9zqzdxFpf4tlgVL6y5iE2
 offzpNPT18QpJP3ackJKH7DNYJGNs8Boede9XWo=
X-Google-Smtp-Source: APXvYqxp+Zfj3EFQWGDrC+F731SE5uObeZy6SKyWMCQM5v25kxLesZKv1R9ebdqVtHuEJg6a7ckxruSanjbbnUp6bpY=
X-Received: by 2002:a67:79d4:: with SMTP id u203mr1727344vsc.85.1565084576233; 
 Tue, 06 Aug 2019 02:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <20190522150219.13913-2-emil.l.velikov@gmail.com>
 <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
In-Reply-To: <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 6 Aug 2019 10:42:07 +0100
Message-ID: <CACvgo51AHoqgwDw+DMz3p8YAsheBB60+z4jM4ebirAJyZ0zB5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: remove open-coded drm_invalid_op()
To: Ben Skeggs <skeggsb@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rNWJ6iduH458WYXym68c6LlDchiYVoZjPNCQTHnsg+g=;
 b=WXCKd1MyqUWMxmvMjGDym6kNBFqHGWyWrPhGosBE7yL2S/wPDPMybtLQ39LfGtXBgH
 UqH76XrcAnxSCvqkaWB41qrK6ZyI3xMIon+xv14KCB1Qi26hi+VciEIysG6+U4eOVbkp
 DcfgmiaUAZx0sszGsZe6gEhjob13w1Ll1VEinia8v7cMywSfkcDRwvHRGYswr1/tHmA0
 MTwlt/NET0VNkiK7o8h8SgCaFBicgTjqSaLfwG2SiCrpIkuMDNPf+EVMLfR2H9LdElvv
 6mvTxSpRi4vMxbtt65RPfe5drXH/S+9ly5MVLSV2O2Mx5YjGTY2j3NBVSvYAxp3krWW+
 Buzw==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVuLAoKT24gVGh1LCAyMyBNYXkgMjAxOSBhdCAwMToxOSwgQmVuIFNrZWdncyA8c2tlZ2dz
YkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMyBNYXkgMjAxOSBhdCAwMTowMywgRW1p
bCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPgo+ID4gQ2M6IEJl
biBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiA+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4KPiBUaGFua3MhCj4KU2FkbHkgRGF2ZSByZXZlcnRlZCB0aGlzLCBzaW5j
ZSB0aGUgdGhhbmtzIHdhc24ndCBzcGVsbGVkIG91dCBhcwpBY2tlZC1ieS9SLWIvb3RoZXIuCkNh
biB5b3UgYmUgbW9yZSBleHBsaWNpdCwgb3IgYWx0ZXJuYXRpdmVseSBmZWVsIGZyZWUgdG8gcGlj
ayB0aGUgcGF0Y2gKdGhyb3VnaCB5b3VyIHRyZWUuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
