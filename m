Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F6E8F41
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697026E511;
	Tue, 29 Oct 2019 18:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2FB6E511
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:26:43 +0000 (UTC)
Received: from mail-yw1-f49.google.com (mail-yw1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8BE120679
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:26:42 +0000 (UTC)
Received: by mail-yw1-f49.google.com with SMTP id d5so5419632ywk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 11:26:42 -0700 (PDT)
X-Gm-Message-State: APjAAAUbmzP7k5dsF4G+EyFKoOJgjpdai/W4Hg0Tfkd2fcS19gTNQgw3
 RJJ3GUwt7qnZV1ICIshApgheJNL6+Hxkz3N6pQ==
X-Google-Smtp-Source: APXvYqxe0cyYS0rpcIKN4B+psqRXIatevBEWQ+yggE1u09NZ+LSCeXtGucKbloYDd1oOdVPJ7pbKjHhhEj684T6V/rc=
X-Received: by 2002:a0d:d307:: with SMTP id v7mr19240164ywd.507.1572373602163; 
 Tue, 29 Oct 2019 11:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191025134143.14324-1-steven.price@arm.com>
In-Reply-To: <20191025134143.14324-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Oct 2019 13:26:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJC8PJqKhsLBUw6COgUyLG7DYV77B8W_XYrKS4CwcY-wQ@mail.gmail.com>
Message-ID: <CAL_JsqJC8PJqKhsLBUw6COgUyLG7DYV77B8W_XYrKS4CwcY-wQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/panfrost: Tidy up the devfreq implementation
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572373603;
 bh=6GrFusxXyDjMh/1O0/cmBvl4ctDIO7se0EOtVnn58wo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cGmKY1nZqCLMsj23br8MAnZ5ebcKbgWnXeCEf7kuMXePOD0lpkhuFMDm8nWDton7+
 fAi7iDg8mJKZpue6+f/6LeWsPcz7hFXuJaX1JKJtCmqatE04zjDBBgcoOaNRvtAR3+
 ORbz9mKX1nqSctWp9C8PU8bmFMLqxEC1s9ZxTVO8=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgODo0MSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IFRoZSBkZXZmcmVxIGltcGxlbWVudGF0aW9uIGluIHBhbmZy
b3N0IGlzIHVubmVjZXNzYXJpbHkgb3BlbiBjb2RlZC4gSXQKPiBhbHNvIHRyYWNrcyB1dGlsaXNh
dGlvbiBtZXRyaWNzIHBlciBzbG90IHdoaWNoIGlzbid0IHZlcnkgdXNlZnVsLiBMZXQncwo+IHRp
ZHkgaXQgdXAhCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICBodHRwOi8vbGttbC5rZXJuZWwub3Jn
L3IvMjAxOTA5MTIxMTI4MDQuMTAxMDQtMS1zdGV2ZW4ucHJpY2UlNDBhcm0uY29tCj4gICogUmVi
YXNlZCBvbnRvIGxhdGVzdCBkcm0tbWlzYy1uZXh0LCBzcGVjaWZpY2FsbHkgYWZ0ZXIKPiAgICBk
MThhOTY2MjA0MTEgKCJkcm0vcGFuZnJvc3Q6IFJlbW92ZSBOVUxMIGNoZWNrcyBmb3IgcmVndWxh
dG9yIikKPiAgKiBBZGRlZCB0YWdzCj4KPiBTdGV2ZW4gUHJpY2UgKDIpOgo+ICAgZHJtL3BhbmZy
b3N0OiBVc2UgZ2VuZXJpYyBjb2RlIGZvciBkZXZmcmVxCj4gICBkcm0vcGFuZnJvc3Q6IFNpbXBs
aWZ5IGRldmZyZXEgdXRpbGlzYXRpb24gdHJhY2tpbmcKClNlcmllcyBhcHBsaWVkLgoKUm9iCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
