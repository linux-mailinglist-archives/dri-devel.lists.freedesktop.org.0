Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BFECFCF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 17:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754D26E121;
	Sat,  2 Nov 2019 16:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6166E121;
 Sat,  2 Nov 2019 16:53:30 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b18so9809803edr.11;
 Sat, 02 Nov 2019 09:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hQ95xlFlsmX8ViImt/+o/Caz03S7IjKb4k3du7kugq0=;
 b=hTx7xj94DhffW4BH2xEKJXXQY5RGc+QOgTssyPg6ulVdiJkCnbcraUscVJUmGOf8Us
 mJYCDdx8LLyru7ZJKqe5Sxbd/jisvVpa13eGQlJAGG5oqaY1Pv+CBheFNs9GD04Mvyt9
 kf3i1jRKZ6RFQko9Dlm7mirlpJScF4YgdQv3V9u+bRirYAuUQ1xoitLtKYgk7YzgHhIP
 XBwpIsFufFa5IA4p9V/n0NLyCIe4M7/MA99HMw7snVB1G0kT4t5pI1WrTrPWHULYhI+9
 FwjiRoNSGbIBNlZ8bDpQjn1PW4lfkFIhdV67ntqSMrD2Izat66PflUjcR3JVrKQyCxAJ
 n9Vg==
X-Gm-Message-State: APjAAAWQU9CltylQhtU0f0sHZxCrJBfB168uH5u9gahpRY5M4oE92e5v
 WwMMXQQt4BBPFgkboIPRwgiQPjYFOgsuETcopBM=
X-Google-Smtp-Source: APXvYqzRSzYk7AgLA5SNH9E7JvC5C1z3aJ6zO9H99iPAVIYt57B4ir9uBqm1Jj0P0MogIz4YaCikgLP5pm+YSl8v2zg=
X-Received: by 2002:a17:906:a44:: with SMTP id
 x4mr15543925ejf.64.1572713609301; 
 Sat, 02 Nov 2019 09:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com>
 <20191031104402.31813-3-kholk11@gmail.com>
In-Reply-To: <20191031104402.31813-3-kholk11@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 2 Nov 2019 09:53:17 -0700
Message-ID: <CAF6AEGv77=zw8GiJOEgg6RkaukxTCGzEd=SdjRr+GLLBdEoRPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: msm/mdp5: Document optional TBU and
 TBU_RT clocks
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hQ95xlFlsmX8ViImt/+o/Caz03S7IjKb4k3du7kugq0=;
 b=oWoGB9I+TyWZJEKlA41P7eYZhu8fouR6ppyfeVMR49gVqocVxwRyKcD6byFEV+kGBy
 E2OMMeIjDakSmCUrgYP+o2CjREIQjmJrRt4IaaFCcYxn9kMeT13s8CflG38EMgND+NoD
 Aan+FYyKLnDWMZWLcxDUeFtUYxH9neEI4ISzngbCZ2penIkmU1j4FEVt73fDkA2LSbpV
 ehnYsRfQZjWiePjT/AnA/zJowVr+vULD/C7m3CPv+EtC/JK/fih2vI4ash1iWCsm0xC5
 e7C1m9JUCpjykQwkXbAm3LM/WtmSQuNoLDaTgsp6UeSUge0lLhhvBbJiIhm+m14+siF5
 HETA==
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
 freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
 Jonathan <jonathan@marek.ca>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KyBkZXZpY2V0cmVlIGxpc3QKCk9uIFRodSwgT2N0IDMxLCAyMDE5IGF0IDM6NDQgQU0gPGtob2xr
MTFAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxraG9sazExQGdtYWlsLmNvbT4KPgo+IFRoZXNlIHR3byBjbG9ja3MgYXJlbid0IHByZXNlbnQg
aW4gYWxsIHZlcnNpb25zIG9mIHRoZSBNRFA1IEhXOgo+IHdoZXJlIHByZXNlbnQsIHRoZXkgYXJl
IG5lZWRlZCB0byBlbmFibGUgdGhlIFRyYW5zbGF0aW9uIEJ1ZmZlcgo+IFVuaXQocykuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8a2hvbGsxMUBnbWFpbC5j
b20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9tZHA1LnR4dCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9tZHA1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9tZHA1LnR4dAo+IGluZGV4IDRlMTEzMzg1NDhhYS4uNDNkMTEyNzljOTI1IDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9tZHA1LnR4
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9t
ZHA1LnR4dAo+IEBAIC03Niw2ICs3Niw4IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIE9wdGlv
bmFsIHByb3BlcnRpZXM6Cj4gIC0gY2xvY2stbmFtZXM6IHRoZSBmb2xsb3dpbmcgY2xvY2tzIGFy
ZSBvcHRpb25hbDoKPiAgICAqICJsdXQiCj4gKyAgKiAidGJ1Igo+ICsgICogInRidV9ydCIKPgo+
ICBFeGFtcGxlOgo+Cj4gLS0KPiAyLjIxLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
