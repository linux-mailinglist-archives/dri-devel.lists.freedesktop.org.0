Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D585E707D6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF42089CAC;
	Mon, 22 Jul 2019 17:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C03689CAC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:48:55 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s7so75742924iob.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CxrJ1h1Gj9qffdtw6gn6IuFX9kNT09jtgH+ckcJPTWk=;
 b=LebcKIXsjGiEB+afaFr+m60FcbAKitzJ1odMcGvdCQ9j472SWS4nqgqyCPNT4hDz9K
 ecawV2zVBMFSCj3Yi00vn1YSv2CqWA5Rskr/tmllznwG53nnzXvbC5Fnlax9kid1CNcO
 CuTR4T9IVTND5e4VpKMZrvcRs6BdcxryDjVV5XcbhhxO8mIExSzgEkGjJQiy6/VTrEC4
 5ZBWEpXA+f46lm/EUnBsBANc+paBF5LQwfewgXbYZCo6WZ3fPNco1OU2kjjlJuIQQBL3
 G5oB8tmdfI1h8XxZSX0ymz5WBFKwNpzSWZQaTqs1kW5ByBwwQZTP+n8+/UtIYO7jOWMK
 eB0w==
X-Gm-Message-State: APjAAAUX7us/JV2G5hoGfMtM7WYSekPSnso2FIEUtSHLXcdSbItF9PVd
 N330fqWWY3x8mus+3WctgA==
X-Google-Smtp-Source: APXvYqw0FDve9Mw/vkxriVI+KvJ+PlrXuiZ8o2qd7ioxmjQY7NUFYzDL8hVPS4tO0BHR0p8241W5WA==
X-Received: by 2002:a02:90c8:: with SMTP id c8mr75947688jag.22.1563817734501; 
 Mon, 22 Jul 2019 10:48:54 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id c81sm62071726iof.28.2019.07.22.10.48.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:48:54 -0700 (PDT)
Date: Mon, 22 Jul 2019 11:48:53 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 05/10] dt-bindings: display: Add max-res property for mxsfb
Message-ID: <20190722174853.GA31795@bogus>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
 <1561555938-21595-6-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561555938-21595-6-git-send-email-robert.chiras@nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6MzI6MTNQTSArMDMwMCwgUm9iZXJ0IENoaXJhcyB3
cm90ZToKPiBBZGQgbmV3IG9wdGlvbmFsIHByb3BlcnR5ICdtYXgtcmVzJywgdG8gbGltaXQgdGhl
IG1heGltdW0gc3VwcG9ydGVkCj4gcmVzb2x1dGlvbiBieSB0aGUgTVhTRkJfRFJNIGRyaXZlci4K
CkJpbmRpbmdzIGFyZSBmb3IgaC93IGRlc2NyaXB0aW9uLCBub3QgZHJpdmVyIGNvbmZpZy4KCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+
IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50
eHQgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2Zi
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4
dAo+IGluZGV4IDQ3MmUxZWEuLjU1ZTIyZWQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0Cj4gQEAgLTE3LDYgKzE3LDEy
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIFJlcXVpcmVkIHN1Yi1ub2RlczoKPiAgICAtIHBv
cnQ6IFRoZSBjb25uZWN0aW9uIHRvIGFuIGVuY29kZXIgY2hpcC4KPiAgCj4gK09wdGlvbmFsIHBy
b3BlcnRpZXM6Cj4gKy0gbWF4LXJlczoJYW4gYXJyYXkgd2l0aCBhIG1heGltdW0gb2YgdHdvIGlu
dGVnZXJzLCByZXByZXNlbnRpbmcgdGhlCj4gKwkJbWF4aW11bSBzdXBwb3J0ZWQgcmVzb2x1dGlv
biwgaW4gdGhlIGZvcm0gb2YKPiArCQk8bWF4WD4sIDxtYXhZPjsgaWYgb25lIG9mIHRoZSBpdGVt
IGlzIDwwPiwgdGhlIGRlZmF1bHQKPiArCQlkcml2ZXItZGVmaW5lZCBtYXhpbXVtIHJlc29sdXRp
b24gZm9yIHRoYXQgYXhpcyBpcyB1c2VkCgpJIHN1cHBvc2Ugd2hhdCB5b3UgYXJlIGFmdGVyIGlz
IGJhbmR3aWR0aCBsaW1pdHM/IElJUkMsIHRoZXJlJ3MgYWxyZWFkeSAKc29tZSBiaW5kaW5ncyBl
eHByZXNzaW5nIHN1Y2ggbGltaXRzLiBBbHNvLCB3b3VsZG4ndCB5b3UgbmVlZCB0byBhY2NvdW50
IApmb3IgYnBwIGFuZCB1c2luZyB0aGUgMm5kIHBsYW5lIChJSVJDIHRoYXQgdGhlcmUgaXMgb25l
KS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
