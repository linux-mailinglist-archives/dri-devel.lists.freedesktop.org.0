Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE2102BA5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 19:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CB76E8E1;
	Tue, 19 Nov 2019 18:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12106E8E1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 18:21:20 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a17so1760469lfi.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 10:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0dUXKYCswQ0fk3ChDtCHMcNLvLahQKNVxckNHbLK62U=;
 b=rDx114hKOKbT40dDBXz1tTynjKb06cNHNYwQICwhWmW797q/7uvZ4uLJxm+oxyAvz/
 vZW52YHWj+9EgR48pJHCxk4sOb8uXh7LY4n1nvUG39612T6L9sgHJKz5ZV3U99tS/cPW
 qWSgLkqpy9Ut54tgsvhdSs40gfjGtDuU7rzkB55N/58cvKnzESU8+Uez27Y85gRUh+t9
 9gpCCveR9381uA9Tr70pNYktQrwk3MDvQ2ATyuSRN97vb2870EXf+TFmrdKLmRlnBHYN
 qdx3Gg3TrojHWu8RgLAw6MIO5OUe+U1Te/p+w1y95JJJBxZrjdWo3sg1MbRy5wFOy8Zu
 7VGA==
X-Gm-Message-State: APjAAAUGBb34TyfVbuDGlXqNRW67IoQUBl18DuBuRB6a7lAyk76oU8Ym
 AzRbISoVqlhZ93CaeOHoT75avnhxcUrAt2eN5/g=
X-Google-Smtp-Source: APXvYqzVzn1n+QdLBDwkgCKvCRCAJA5gUf/1Cpb09fd0k1gg5uwHXZcpoFJbgiH7FOKqOuf17TVa1Ixb5NlB5WAK620=
X-Received: by 2002:a19:4318:: with SMTP id q24mr5172404lfa.12.1574187679050; 
 Tue, 19 Nov 2019 10:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-4-adrian.ratiu@collabora.com>
In-Reply-To: <20191118152518.3374263-4-adrian.ratiu@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Nov 2019 15:21:14 -0300
Message-ID: <CAOMZO5C5gpW6KF9d-79wd=-7ZGAbXQLAXw3kLi+_5DBW_DYrTw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm: imx: Add i.MX 6 MIPI DSI host driver
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0dUXKYCswQ0fk3ChDtCHMcNLvLahQKNVxckNHbLK62U=;
 b=e5lESrFN8MyoYepnYPws1P7yf4C1dXiYfMOkmezNqIXAiZCpH6SxlKI9ix3SlSORNf
 /5JsXZyp1E+IjqGqwMhUYHulRiSh9QJkMf1GIFQllRE77579xVcB4EDXytX2AWhcMFvQ
 1ksK6LpTugAMceaAYTPHCvwtSWDKN7rqeIueDTbWQtIHR4HQydG5oXkfTtYGFdaIoyjU
 CylOl88XU0mV6aCUOh7u/8Q+Yga6rgxzX3jS4Uzen0MivFUrqkq6uYhpdWXn0ASFSQew
 25whUzIeI6GQW/U3sk+CCl9AnoSAUrolJLK0fI3TEVzTWkTXjIjQqrrTPxWQjG7LKd5E
 juzg==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWFuLAoKT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTI6MjUgUE0gQWRyaWFuIFJhdGl1
CjxhZHJpYW4ucmF0aXVAY29sbGFib3JhLmNvbT4gd3JvdGU6CgpTb21lIG5pdHBpY2tzOgoKPiAr
Cj4gK2NvbmZpZyBEUk1fSU1YX01JUElfRFNJCj4gKyAgICAgICB0cmlzdGF0ZSAiRnJlZXNjYWxl
IGkuTVggRFJNIE1JUEkgRFNJIgoKVGhpcyB0ZXh0IHNlZW1zIHRvbyBnZW5lcmljIGFzIHRoZXJl
IGFyZSBpLk1YIFNvQ3MgdGhhdCB1c2UgZGlmZmVyZW50Ck1JUEkgRFNJIElQLgoKTWF5YmUgIkZy
ZWVzY2FsZSBpLk1YNiBEUk0gTUlQSSBEU0kiIGluc3RlYWQ/Cgo+ICttb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKGlteF9taXBpX2RzaV9kcml2ZXIpOwo+ICsKPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJp
Lk1YIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlciBkcml2ZXIiKTsKCmkuTVg2IE1JUEkgRFNJLCBw
bGVhc2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
