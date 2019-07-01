Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775E4623E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C12892A6;
	Fri, 14 Jun 2019 15:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B91F892A6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:12:51 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04EC3217D6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:12:51 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id x2so2884616qtr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:12:50 -0700 (PDT)
X-Gm-Message-State: APjAAAWLjcEV0i1zfStOfV02TY26TRDvjFUKMEw4ufDGUtnP6lxlD+Ou
 S46hmUfGhowiN81wIojeqos1DlLMXjQErYFvMg==
X-Google-Smtp-Source: APXvYqxsvzWBrZIsLaq5eG0h1SPxjmx8lUC/1ZM4CBw8Theis6v5V4NDZjLtbM/5bXQ7hhl0eGhT065S1yWmWeQoaN0=
X-Received: by 2002:aed:3b33:: with SMTP id p48mr74213700qte.143.1560525170254; 
 Fri, 14 Jun 2019 08:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190529095233.26277-1-boris.brezillon@collabora.com>
 <20190529151619.GC32127@rosenzweig.io>
In-Reply-To: <20190529151619.GC32127@rosenzweig.io>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 14 Jun 2019 09:12:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLtruq2ZFApGGUADCyEhQrGXOUV9Va-1bNqfCG+AOijGw@mail.gmail.com>
Message-ID: <CAL_JsqLtruq2ZFApGGUADCyEhQrGXOUV9Va-1bNqfCG+AOijGw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/panfrost: Expose perf counters to userspace
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560525171;
 bh=qYR7occjgMpisDSZQIvc3dlm7y68eI/T8MK1pIOruA0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2rUB/wxJsDCIQiePKt3M4+DjlfT8+MSM37J0MjQwy1kWGE4k9WKXAfCRE0O83mrHd
 IxJGLmRJYuZtvB9yETPbCEMxyTpgXgEk2doMwM/SjSZnSRlSgLhoi3k56WfkfWVVmN
 8EWyKWaRQo1xS9Esc5KDFaVllnrsBOVXR9dhceFI=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgOToxNiBBTSBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3Nh
QHJvc2VuendlaWcuaW8+IHdyb3RlOgo+Cj4gV29vaG9vISBQYXRjaGVzIDEtMyBhcmUgUi1iOyBw
YXRjaCA0IGlzIEEtYi4gRXhjaXRpbmcgcHJvZ3Jlc3MhIEhvcGluZwo+IHRvIGhlYXIgd2hhdCBS
b2IgYW5kIFN0ZXZlbiB0aGluayA6KQoKQWxsIGxvb2tzIGZpbmUgdG8gbWUsIGJ1dCB0aGVyZSdz
IGEga2J1aWxkIGVycm9yIG9uIHBhdGNoIDQgdGhhdCBuZWVkcwp0byBiZSBmaXhlZC4KClJvYgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
