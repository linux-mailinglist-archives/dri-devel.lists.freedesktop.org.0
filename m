Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980DE1E8D9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA189533;
	Wed, 15 May 2019 07:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7A892EE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 07:54:11 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id t15so5858494uao.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 00:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zf8IJjcdPrQOgX1z3j6gO2WdWT6UVn+L7AhNfe6yMi8=;
 b=HzjSYfQ9OoFHGOd2bvKAEeoSYuwttPV4XHCWXKvKhQEetGahnUVAWXtMNJDqtJ0LB0
 6cxMivLzS2jaTDT9Zo7nHBfAgxfkNlv+z+bd+zIafjcLPF9L3RrVTgVitXrKPPlLrzPt
 jciL6e5Zj1jkQmGzS/sT/CPr4D0NzI65xwG97rmDpumH1IzX5voGQLoN2KSVxXOLLR9T
 P97ekZvFS3SeaVIx7STtCuRjp9LlEZgkf4VOl4KWJOWsRmUnzmNBsHNEcDGAGjaT+/hf
 AKC/I2xqd9+VDOIADrzzypEWYY7qGvp9qd9gyd7oP63zxNchzGNj5KUNbJbYmzm0k9Mu
 ajOg==
X-Gm-Message-State: APjAAAVdQkzyD0EjljKqw3G0PoVOxZ7nVc4/cLgO+720fjWtcGKg4YX3
 5/Y/7V8tDJMlCdp9cOqJGy7v1ClADW73OeEhgYHBqA==
X-Google-Smtp-Source: APXvYqw26na4iAl9OES8/pXHjHR4OX/mYE4JxGMYMoMM698JgOYmYEnp2SYDxqwKYvDyL7iTIXPA7w04vcm/XFFuFFI=
X-Received: by 2002:ab0:30a1:: with SMTP id b1mr13121475uam.104.1557820450699; 
 Tue, 14 May 2019 00:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-9-rnayak@codeaurora.org>
In-Reply-To: <20190320094918.20234-9-rnayak@codeaurora.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 May 2019 09:53:34 +0200
Message-ID: <CAPDyKFppirfM7B9TB=jZzo67E=rdMnfVKEjdv0wn1zBAUoY_HA@mail.gmail.com>
Subject: Re: [RFC v2 08/11] arm64: dts: sdm845: Add ufs opps and power-domains
To: Rajendra Nayak <rnayak@codeaurora.org>
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Zf8IJjcdPrQOgX1z3j6gO2WdWT6UVn+L7AhNfe6yMi8=;
 b=IAsJ4EQAYOn036lV8psLdhXQfclTm/pOQHGolyhy+F/M9PN51UF1V/AzbmQ2+szdeA
 50WNp67zAeq6LM46Rm5S8gA77LBMEMw1JsVn/tpSuW3Fmn2xta1oG5hpd6oQAlItiBS0
 V7wGhDfi+6qvy0RGWnt2gDFdS1UQBmLgdXkSmdDpeafokFQHUZoUqTZIOHCETe6JfFAC
 a7PnXUppJHzhn2AVGetOalutM2jS6ypHR9488igXkCBQ8h9ghd/iSRHKRauDRdWVhy3O
 1dBuucve8gsrdUniXl3OAxGA0NC4JSN5HrSsxuOzyO7z9KI/68uSfGyLt3t1vA/hmfgL
 34qw==
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
Cc: Doug Anderson <dianders@chromium.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBNYXIgMjAxOSBhdCAxMDo1MCwgUmFqZW5kcmEgTmF5YWsgPHJuYXlha0Bjb2Rl
YXVyb3JhLm9yZz4gd3JvdGU6Cj4KPiBBZGQgdGhlIGFkZGl0aW9uYWwgcG93ZXIgZG9tYWluIGFu
ZCB0aGUgT1BQIHRhYmxlIGZvciB1ZnMgb24gc2RtODQ1Cj4gc28gdGhlIGRyaXZlciBjYW4gc2V0
IHRoZSBhcHByb3ByaWF0ZSBwZXJmb3JtYW5jZSBzdGF0ZSBvZiB0aGUKPiBwb3dlciBkb21haW4g
d2hpbGUgc2V0dGluZyB0aGUgY2xvY2sgcmF0ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhamVuZHJh
IE5heWFrIDxybmF5YWtAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvcWNvbS9zZG04NDUuZHRzaSB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NkbTg0NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9xY29tL3NkbTg0NS5kdHNpCj4gaW5kZXggMDI3ZmZlNmU5M2U4Li5hM2FmNGExNzU3YjQgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NkbTg0NS5kdHNpCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NkbTg0NS5kdHNpCj4gQEAgLTExNDAsNiArMTE0MCwy
MSBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICAgICAgICAgIH07Cj4K
PiArICAgICAgICAgICAgICAgdWZzX29wcF90YWJsZTogdWZzLW9wcC10YWJsZSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsKPiAr
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3BwLTUwMDAwMDAwIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9wcC1oeiA9IC9iaXRzLyA2NCA8NTAwMDAwMDA+Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVxdWlyZWQtb3BwcyA9IDwmcnBtaHBkX29wcF9t
aW5fc3ZzPjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBvcHAtMjAwMDAwMDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9wcC1oeiA9IC9iaXRzLyA2NCA8MjAwMDAwMDAwPjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlcXVpcmVkLW9wcHMgPSA8JnJwbWhwZF9vcHBfbm9tPjsKPiArCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAgfTsKPiArCj4gICAgICAg
ICAgICAgICAgIHVmc19tZW1faGM6IHVmc2hjQDFkODQwMDAgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxzZG04NDUtdWZzaGMiLCAicWNvbSx1ZnNoYyIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJqZWRlYyx1ZnMtMi4wIjsKPiBA
QCAtMTE0OCw3ICsxMTYzLDcgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzID0gPCZ1
ZnNfbWVtX3BoeV9sYW5lcz47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcGh5LW5hbWVzID0g
InVmc3BoeSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbGFuZXMtcGVyLWRpcmVjdGlvbiA9
IDwyPjsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZnY2MgVUZT
X1BIWV9HRFNDPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZn
Y2MgVUZTX1BIWV9HRFNDPiwgPCZycG1ocGQgU0RNODQ1X0NYPjsKCllvdSBwcm9iYWJseSB3YW50
IHRvIHVzZSAicG93ZXItZG9tYWluLW5hbWVzIiBhcyB3ZWxsLgoKWy4uLl0KCktpbmQgcmVnYXJk
cwpVZmZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
