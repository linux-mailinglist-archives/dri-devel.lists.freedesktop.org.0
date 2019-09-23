Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C058CBB54F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF586E906;
	Mon, 23 Sep 2019 13:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217366E906
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:32:24 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q1so33475387ion.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Gkx6KfsI/v7RjesbZJM0miCqFfmb10UpE9xFSBSG4M=;
 b=Cx/raz/n9p+CPGpap4yWcJGdoTmhxhEfHnsJA7lK+z4khpXCQXStckWvlPUmNiB2JC
 OTPCGqk6lbyz4ucKplORTIyIUVWnlGI7i8L8siS3My611ejrT4cc3gVfqMK2eeSspgl2
 jaxzElqzk4dfnIykwywJT5aC9eCd1EZVTOH0pWv+fwo/RaJ767XO6ttSnAwX4qGb4Fxx
 z08e2GYFOjC0/Xdlvd8aVlPvqWi/lOfr50Usgtk9zMTPxc+GJQcnVM6itdkagpCRJw7x
 e5I5Q3geJQ50WdT+9LXYCg0tdxW71DaTOHjkvkEtwD4bphMyyfDby7Ip2Qi0p59QSgHp
 oxZQ==
X-Gm-Message-State: APjAAAUUBrq+R42GmcjFUpK/LDo7aPCIUCL1X+5VFCOJZmrECs1kT/kq
 5dsQfly+I8T/erXb3mo/euLcoUoFemYmbzcwX+s=
X-Google-Smtp-Source: APXvYqwJR3QJD1jIZYV2jbJW2R5s+jizFtekkek5ZBdhPG1M8UvVC0BL2Whi5uGAdV9CgEENkoGzDWq5OShcNE+n+v8=
X-Received: by 2002:a02:6a22:: with SMTP id l34mr25692766jac.33.1569245543173; 
 Mon, 23 Sep 2019 06:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190917161214.2913-1-aford173@gmail.com>
 <20190917161214.2913-3-aford173@gmail.com>
 <20190921190941.GD32133@ravnborg.org>
In-Reply-To: <20190921190941.GD32133@ravnborg.org>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 23 Sep 2019 08:32:11 -0500
Message-ID: <CAHCN7xKqiNxrR+DVDV_7pE0vmQAXQkhf-0RPS3GGgZU=81RC-A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new
 DRM panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9Gkx6KfsI/v7RjesbZJM0miCqFfmb10UpE9xFSBSG4M=;
 b=XYNE4TvnKpcq7LW/JhTVMgCt4cU8pZLEMVe7XH0UwDBfwwE+o6ExtyHMX7nBaHe8oT
 mI7NYIP5AataRCuGAJ9tg0nC4owo4+fPvB8vTXk8V2I7hcC2NzGbs30N4UdJ3ZLGAUm5
 11l/j7vKPnT6VC3RW/0y71fviHmelkldDJtMmvkB5SSvJNtV5ZE2LUhUL9QK4uY8zvyX
 Vxg3fgCBY+HUMOz63RFY89I3hAIzJYpXfjSRFey6zsSLkPZrBNHkJSnsbkU8U1fp0042
 vBPielQ6d5yeAsaZc2jCoSqLXCtgU6M1IPmsrRcQEqdki+kZtXOmiRP1l8oD/1F8Wq4+
 NyYA==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgMjEsIDIwMTkgYXQgMjowOSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgQWRhbS4KPgo+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDEx
OjEyOjEzQU0gLTA1MDAsIEFkYW0gRm9yZCB3cm90ZToKPiA+IFdpdGggdGhlIHJlbW92YWwgb2Yg
dGhlIHBhbmVsLWRwaSBmcm9tIHRoZSBvbWFwIGRyaXZlcnMsIHRoZQo+ID4gTENEIG5vIGxvbmdl
ciB3b3Jrcy4gIFRoaXMgcGF0Y2ggcG9pbnRzIHRoZSBkZXZpY2UgdHJlZSB0bwo+ID4gYSBuZXds
eSBjcmVhdGVkIHBhbmVsIG5hbWVkICJsb2dpY3BkLHR5cGUyOCIKPiA+Cj4gPiBGaXhlczogOGJm
NGIxNjIxMTc4ICgiZHJtL29tYXA6IFJlbW92ZSBwYW5lbC1kcGkgZHJpdmVyIikKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiBMb29rcyBnb29k
Lgo+IE9uZSBuaXQgYmVsb3cuCj4KPiBXaXRoIHRoaXMgYWRkcmVzc2VkOgo+Cj4gQWNrZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPgo+ICAgICAgICAgU2FtCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2xvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtp
dC0yOC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQt
MjguZHRzCj4gPiBpbmRleCAwN2FjOTliOWNkYTYuLjAwYzQyNmJkNTFhMCAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2xvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC0yOC5kdHMK
PiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2xvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC0y
OC5kdHMKPiA+IEBAIC0xMSwyMiArMTEsOCBAQAo+ID4gICNpbmNsdWRlICJsb2dpY3BkLXRvcnBl
ZG8tMzd4eC1kZXZraXQuZHRzIgo+ID4KPiA+ICAmbGNkMCB7Cj4gPiAtCj4gPiArICAgICAvKiBU
aGlzIGlzbid0IHRoZSBleGFjdCBMQ0QsIGJ1dCB0aGUgdGltaW5ncyBtZWV0IHNwZWMgKi8KPiA+
ICsgICAgIC8qIFRvIG1ha2UgaXQgd29yaywgc2V0IENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19Q
RVJfUENLPTQgKi8KPiA+ICsgICAgIGNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiOwo+ID4g
ICAgICAgbGFiZWwgPSAiMjgiOwo+IFlvdSBsZWZ0IHRoaXMgcHJvcGVydHkgLSBidXQgdXMgaXQg
ZG9jdW1lbnRlZCBhbmQgd2hhdCB1c2UgaGFzIGl0PwoKR29vZCBjYXRjaCwgSSdsbCByZW1vdmUg
aXQgYW5kIHBvc3QgYSBWMiB0b2RheSBvbmNlIEkgY2FuIGZpZ3VyZSBvdXQKdGhlIHlhbWwgc3R1
ZmYuCgphZGFtCj4KPiA+IC0KPiA+IC0gICAgIHBhbmVsLXRpbWluZyB7Cj4gPiAtICAgICAgICAg
ICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw5MDAwMDAwPjsKPiA+IC0gICAgICAgICAgICAgaGFjdGl2
ZSA9IDw0ODA+Owo+ID4gLSAgICAgICAgICAgICB2YWN0aXZlID0gPDI3Mj47Cj4gPiAtICAgICAg
ICAgICAgIGhmcm9udC1wb3JjaCA9IDwzPjsKPiA+IC0gICAgICAgICAgICAgaGJhY2stcG9yY2gg
PSA8Mj47Cj4gPiAtICAgICAgICAgICAgIGhzeW5jLWxlbiA9IDw0Mj47Cj4gPiAtICAgICAgICAg
ICAgIHZiYWNrLXBvcmNoID0gPDM+Owo+ID4gLSAgICAgICAgICAgICB2ZnJvbnQtcG9yY2ggPSA8
Mj47Cj4gPiAtICAgICAgICAgICAgIHZzeW5jLWxlbiA9IDwxMT47Cj4gPiAtICAgICAgICAgICAg
IGhzeW5jLWFjdGl2ZSA9IDwxPjsKPiA+IC0gICAgICAgICAgICAgdnN5bmMtYWN0aXZlID0gPDE+
Owo+ID4gLSAgICAgICAgICAgICBkZS1hY3RpdmUgPSA8MT47Cj4gPiAtICAgICAgICAgICAgIHBp
eGVsY2xrLWFjdGl2ZSA9IDwwPjsKPiA+IC0gICAgIH07Cj4gPiAgfTsKPiA+IC0tCj4gPiAyLjE3
LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
