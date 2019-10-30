Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13625E9D8C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 15:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FA26EA4A;
	Wed, 30 Oct 2019 14:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD5F6EA4A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 14:29:54 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c7so2282250otm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 07:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LMfeOlvx6eLj9u8wcVjU8j/3tqXZ55VLld17C/fRM+o=;
 b=g32PQuwqm1YCRMS+y4FfS/jO5ctQVX+bKibRf8gzs2H9Vi6SQWPimkgcHQMbTabiEt
 wR5QaebgX30vxPhV8CYK+wcbjs3ZyoxHWw3/y4hajLS1PiGWR1bRBlbsWJ8yeI+G7Foc
 CRwCpXJpJCbZgkVBiOrSBEg2zqe3i24ekorObJc4yzbMA4kzZiRIrOW9K+CBXxuXWD9V
 uvuEnPDc9ePMJLNpX6LXzk1+5n69V8Q9t5Ss/C2oD9HnEJUJ7rUFTb6CP32icMeJZOD5
 +YymIBuczkEXxZFMvgSc4o5YrVSW6hF612bHOQmSOV4L3LJgLWVWnDzkyMTv9dmMv9QH
 YZGg==
X-Gm-Message-State: APjAAAUIuXp+HduF5szJAJckcUeO0+sVN7LJc6gQ1GG4R2wFyl94+CG1
 PaWx3L2OoScc9Q2zVKSKsA==
X-Google-Smtp-Source: APXvYqx+eBfjpYHuthtmmpS/yKuaO2Fxm/sTUZz0uJRp1IDCuerAIXzxDA1q1VJzYfDKZiAUqvmNqQ==
X-Received: by 2002:a9d:7ac5:: with SMTP id m5mr138924otn.356.1572445793274;
 Wed, 30 Oct 2019 07:29:53 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w33sm75635otb.68.2019.10.30.07.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 07:29:52 -0700 (PDT)
Date: Wed, 30 Oct 2019 09:29:52 -0500
From: Rob Herring <robh@kernel.org>
To: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: add bindings for
 logic technologies displays
Message-ID: <20191030142952.GB31293@bogus>
References: <20191027142609.12754-1-marcel@ziswiler.com>
 <20191027142609.12754-3-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191027142609.12754-3-marcel@ziswiler.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, j.bauer@endrich.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, info@logictechno.com,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgMjcsIDIwMTkgYXQgMDM6MjY6MDlQTSArMDEwMCwgTWFyY2VsIFppc3dpbGVy
IHdyb3RlOgo+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXgu
Y29tPgo+IAo+IEFkZCBiaW5kaW5ncyBmb3IgdGhlIGZvbGxvd2luZyAzIHByZXZpb3VzbHkgYWRk
ZWQgZGlzcGxheSBwYW5lbHMKPiBtYW51ZmFjdHVyZWQgYnkgTG9naWMgVGVjaG5vbG9naWVzIExp
bWl0ZWQ6Cj4gCj4gLSBMVDE2MTAxMC0yTkhDIGUuZy4gYXMgZm91bmQgaW4gdGhlIFRvcmFkZXgg
Q2FwYWNpdGl2ZSBUb3VjaCBEaXNwbGF5Cj4gNyIgUGFyYWxsZWwgWzFdCj4gLSBMVDE2MTAxMC0y
TkhSIGUuZy4gYXMgZm91bmQgaW4gdGhlIFRvcmFkZXggUmVzaXN0aXZlIFRvdWNoIERpc3BsYXkg
NyIKPiBQYXJhbGxlbCBbMl0KPiAtIExUMTcwNDEwLTJXSEMgZS5nLiBhcyBmb3VuZCBpbiB0aGUg
VG9yYWRleCBDYXBhY2l0aXZlIFRvdWNoIERpc3BsYXkKPiAxMC4xIiBMVkRTIFszXQo+IAo+IFRo
b3NlIHBhbmVscyBtYXkgYWxzbyBiZSBkaXN0cmlidXRlZCBieSBFbmRyaWNoIEJhdWVsZW1lbnRl
IFZlcnRyaWVicwo+IEdtYkggWzRdLgo+IAo+IFsxXSBodHRwczovL2RvY3MudG9yYWRleC5jb20v
MTA0NDk3LTctaW5jaC1wYXJhbGxlbC1jYXBhY2l0aXZlLXRvdWNoLWRpc3BsYXktODAweDQ4MC1k
YXRhc2hlZXQucGRmCj4gWzJdIGh0dHBzOi8vZG9jcy50b3JhZGV4LmNvbS8xMDQ0OTgtNy1pbmNo
LXBhcmFsbGVsLXJlc2lzdGl2ZS10b3VjaC1kaXNwbGF5LTgwMHg0ODAucGRmCj4gWzNdIGh0dHBz
Oi8vZG9jcy50b3JhZGV4LmNvbS8xMDU5NTItMTAtMS1pbmNoLWx2ZHMtY2FwYWNpdGl2ZS10b3Vj
aC1kaXNwbGF5LTEyODB4ODAwLWRhdGFzaGVldC5wZGYKPiBbNF0gaHR0cHM6Ly93d3cuZW5kcmlj
aC5jb20vaXNpNTBfaXNpMzBfdGZ0LWRpc3BsYXlzL2x0MTcwNDEwLTF3aGNfaXNpMzAKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNv
bT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gTmV3IHBhdGNoIGFkZGluZyBkaXNw
bGF5IHBhbmVsIGJpbmRpbmdzIGFzIHdlbGwgYXMgc3VnZ2VzdGVkIGJ5IFJvYi4KPiAKPiAgLi4u
L3BhbmVsL2xvZ2ljdGVjaG5vLGx0MTYxMDEwLTJuaGMueWFtbCAgICAgIHwgNDQgKysrKysrKysr
KysrKysrKysrKwo+ICAuLi4vcGFuZWwvbG9naWN0ZWNobm8sbHQxNjEwMTAtMm5oci55YW1sICAg
ICAgfCA0NCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi9wYW5lbC9sb2dpY3RlY2hubyxsdDE3
MDQxMC0yd2hjLnlhbWwgICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbG9naWN0ZWNobm8sbHQxNjEw
MTAtMm5oYy55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3RlY2hubyxsdDE2MTAxMC0ybmhyLnlhbWwK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2xvZ2ljdGVjaG5vLGx0MTcwNDEwLTJ3aGMueWFtbAo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dp
Y3RlY2hubyxsdDE2MTAxMC0ybmhjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3RlY2hubyxsdDE2MTAxMC0ybmhjLnlhbWwKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGRmZTk0ZDM4YTQ3Cj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2xvZ2ljdGVjaG5vLGx0MTYxMDEwLTJuaGMueWFtbAo+IEBAIC0wLDAgKzEsNDQg
QEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAoKRXhjZXB0IHRoZSBsaWNl
bnNlIGZvciBuZXcgYmluZGluZ3Mgc2hvdWxkIGJlOiAKCihHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
