Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E13094E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B410989235;
	Fri, 31 May 2019 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCB689235
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 07:26:04 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k8so7390213iot.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 00:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HMhkc6QKxghdSk5QTco54OGClXC9USq7mw8yEKC/dZg=;
 b=N59Rm63Gy976mGL4POyOsJAsJUSDUBbd+vNnEutuG2KD62Bv07nTBVO90Q62BCEtzE
 7go2YdwAGZ2l8s0JQHLHJ5GLxe4cnEzBiTIK2REa2yXVFsYpB9vocMQY/7pNEQvm6Iot
 FGzWFtYaKfGdn6BdXL4Li3Wk7wko20MlA+MA9taj3Wf74yNdA8BjslMSZAA0nAVvV2/Y
 Ek7P3L5vI6SHXcGwI8b/HgW2nighn/Yel4V4Q8Sk/rkPqR8HW1+iMgdn0+bbnO+i9juF
 SuwMVgGnXMMJCjQsoKb3UALkeCAvt5zrD4aWoQmkC8jezeUK8rAVdKwsEGjCJOkcNWE+
 DYWw==
X-Gm-Message-State: APjAAAV4eAo3l6Xf76PHD1uEug2nRG20N80FPUXYvyxfsemJGTzRh77M
 ffkIWBK3+8hYnbpRirvU1STJFHVSBNVHl62qN4NgpQ==
X-Google-Smtp-Source: APXvYqy8YqHxgOmJ3DOFMi+1eQvArvIpx0esRPLJUvkl/uppnke9kcE464HrgsrNrktbD8QP8cudbV/NYCsIQU8jwCw=
X-Received: by 2002:a5d:9f46:: with SMTP id u6mr5396749iot.297.1559287563830; 
 Fri, 31 May 2019 00:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
 <20190531065806.fl4y2kex427qtysz@flea>
In-Reply-To: <20190531065806.fl4y2kex427qtysz@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 31 May 2019 12:55:52 +0530
Message-ID: <CAMty3ZCfc=xh1cZrM0PST-=QNT8qFRLkjWb4B=7YtLitXo6MGw@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] drm/sun4i: Allwinner A64 MIPI-DSI support
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HMhkc6QKxghdSk5QTco54OGClXC9USq7mw8yEKC/dZg=;
 b=rlIw17SjQk8R5gRB5MCzkRmy9anIFsuVUiXk7m/NZFMBdboDLKm3UC/EtGvlvNcdZK
 qGrwLQGq2rW4HuRgbv+9cGw863TKwsqhFQ3op+bLbVrW+KqFhhIyI3Y7hEUaUbG4Zmu+
 +Nc3l161TPzewsb6ry+g5GAJ4yqIHiWfjEm/c=
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
Cc: devicetree <devicetree@vger.kernel.org>, Ryan Pannell <ryan@osukl.com>,
 Bhushan Shah <bshah@mykolab.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMTI6MjggUE0gTWF4aW1lIFJpcGFyZAo8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFdlZCwgTWF5IDI5LCAyMDE5
IGF0IDA0OjI2OjA2UE0gKzA1MzAsIEphZ2FuIFRla2kgd3JvdGU6Cj4gPiBUaGlzIGlzIHY5IHZl
cnNpb24gZm9yIEFsbHdpbm5lciBBNjQgTUlQSS1EU0kgc3VwcG9ydAo+ID4gYW5kIGhlcmUgaXMg
dGhlIHByZXZpb3VzIHZlcnNpb24gc2V0WzFdLgo+ID4KPiA+IFRoaXMgZGVwZW5kcyBvbiBkc2kg
aG9zdCBjb250cm9sbGVyIGZpeGVzIHdoaWNoIHdlcmUKPiA+IHN1cHBvcnRlZCBpbiB0aGlzIHNl
cmllc1syXS4KPiA+Cj4gPiBBbGwgdGhlc2UgY2hhbmdlcyBhcmUgdGVzdGVkIGluIEFsbHdpbm5l
ciBBNjQgd2l0aAo+ID4gMiwgNCBsYW5lcyBkZXZpY2VzIGFuZCB3aG9zZSBwaXhlbCBjbG9ja3Mg
YXJlIDI3LjUgTUh6LAo+ID4gMzBNSHosIDU1TUh6IGFuZCAxNDdNSHouCj4KPiBJIHdhbnRlZCB0
byBhcHBseSB0aGlzLCBidXQgaXQgd291bGRuJ3QgYXBwbHksIGNhbiB5b3Ugc2VuZCBpdCB3aXRo
b3V0Cj4gZGVwZW5kZW5jaWVzPwoKSSBjYW4gZG8gdGhhdCBubyBwcm9ibGVtLCBidXQgWzJdIGhh
cyBkc2kgYW5kIGRjbGsgZGl2aWRlciBmaXhlcyB0aGF0CndvdWxkIHJlcXVpcmUgQTY0IE1JUEkt
RFNJIHRvIHdvcmsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
