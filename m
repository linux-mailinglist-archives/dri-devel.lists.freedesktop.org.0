Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7DD58735
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 18:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CFF6E182;
	Thu, 27 Jun 2019 16:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BF36E081;
 Thu, 27 Jun 2019 16:35:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j29so1982908lfk.10;
 Thu, 27 Jun 2019 09:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9RaKRg0jwVS4+MiiO2ZwhxJZpEkgXU9OGzvrXHS5+W0=;
 b=gxf0iGAhT42uIm1zs9CFTIbGNT6qr+n9inySbsDl3sScalvBfmyMxO93beQUmcw+3N
 IzQOR2gXmJ8Nwa2JnxW95CDW1TmK3JnDCqbXPyUelAO9G5mqKTHyu6Gx94JvwdZr691i
 bmusztKQH7R67J6wMLQlvzEntUT3JHXnL55a9EJmOpVdMVAztQ0EkTUcrhOFaQ7p5zMC
 lHgEcEgiHtpdkTHxjkphhRu7upVvqYX6e8/nlhsszr4pQbf+XabR9HkZ//bypSVm/ruu
 5BtQrKouNvBcTqDLLeLodEEFuHo/XD7dDCTfRJC7iT9Ey/MuBYlbHtR5XFUcgUXnkMSS
 iRUA==
X-Gm-Message-State: APjAAAXsfi34mjXEbNtSmyP7SbW0hdoQYWd3j77r8WTa2HIP52fkKTnb
 z+rQefsXnoJC3alTAfoaaMxoOrMzRksS5G/pDoWyA66vp5U=
X-Google-Smtp-Source: APXvYqwrBHgySYpLlNbiJgBQpcqb3J/MS+IchwqY5qgCa8yGQXSQ+6KzZSd61hiZjTJiBnVwIbeNNZpQOmjVnwhyqak=
X-Received: by 2002:a19:5044:: with SMTP id z4mr2437231lfj.80.1561653336432;
 Thu, 27 Jun 2019 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190627144438.2016-1-l.stach@pengutronix.de>
In-Reply-To: <20190627144438.2016-1-l.stach@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Jun 2019 13:35:25 -0300
Message-ID: <CAOMZO5C2wjmzD11eTtYEmPJ4Tvp8Av=kW3zapuZEoWhkzQwY5A@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: add missing failure path to destroy suballoc
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9RaKRg0jwVS4+MiiO2ZwhxJZpEkgXU9OGzvrXHS5+W0=;
 b=u9rkJ3LmfvAV1VEz3NK1jxFHJ2G3a8Q8+11axCUqJsZwo6GTpuSUo69fGInFYioiCE
 qC+L4gbPhkd5ELSzugV5QzpuSEWKNewdgVklSD544dYw52Gjx2dEWIAb3j0H+gN++7WL
 X/yMlWaN8yFr1a2cG8TbF58GMm8nhAWDPTwMxcV61VRNMREcaIa/h+BfuVwhGsJwl1W0
 RnGzoYFIbkagmf3GRyzJ/2ZJeD1zYc0osKXB/WLwqNTQxXB6T1o78TPLzcYlvhh/zVP/
 QqpAxLWgH1XQtuCcgf4R1AWsnlfhRI+8hfUZ/oZQNpZLxhAuG2lioyOJ7qRlSxeGM9Ft
 AE4A==
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
Cc: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgpPbiBUaHUsIEp1biAyNywgMjAxOSBhdCAxMTo0NCBBTSBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBXaGVuIHNvbWV0aGluZyBnb2VzIHdy
b25nIGluIHRoZSBHUFUgaW5pdCBhZnRlciB0aGUgY21kYnVmIHN1YmFsbG9jYXRvcgo+IGhhcyBi
ZWVuIGNvbnN0cnVjdGVkLCB3ZSBmYWlsIHRvIGRlc3RvcnkgaXQgcHJvcGVybHkuIFRoaXMgY2F1
c2VzIGhhdm9rCgpzL2Rlc3RvcnkvZGVzdHJveQoKPiBsYXRlciB3aGVuIHRoZSBHUFUgaXMgdW5i
b3VuZCBkdWUgdG8gYSBtb2R1bGUgdW5sb2FkIG9yIHNpbWlsYXIuCgpTaG91bGQgdGhpcyBvbmUg
aGF2ZSBhIEZpeGVzIHRhZz8KClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
