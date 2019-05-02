Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026E1242F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 23:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4726089842;
	Thu,  2 May 2019 21:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCDE89834
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 21:36:07 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f23so3503205otl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 14:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QOVychIUmtDG8Tll/ecV8whoYD0pZhfgpjrLj+GI7lA=;
 b=Cuu7QONe27ky1jNVOnUGB69Y9NWlLaCJ4tOd97huZtzbstM9QkIzGrr0Q89xTPbGVF
 +JpeotZ8gosJaRWbFOQyHJsqlAcY1N1zJvwh0CQsLx1AhgQIJnoPIOeeos0RKGIi0pVY
 aeH/gX++RSLn2pALghpVX085ZKyK9WHvY1HiBiQQecRSb/guNw47xQw+um9lMEGpcwPm
 wqS/buzdrOSe1/xx2bt5VnASD/Hh8m2RSGh+GXDDqN8fjsZ+YLMXmy+6DpmQpB1zWQbA
 8N5Hm/j2RK0MBFDeLRhWNDvOjymk6fR/YRTDgLD+DXOVEy1lbfv6GQ3iArVvcNOnKdnh
 JsOA==
X-Gm-Message-State: APjAAAWPa/yGdgCy9j9CGBcwPbUe8KcAKjHzZGUzAFkUdKgVT0Ex/qfM
 mpV2cE7psbxcYFY10LDevg==
X-Google-Smtp-Source: APXvYqzIKpF2SpUiGqboXp/KmEVvROVVZj0uRCj2SNazB/0BEXuociHSUGYQnO9Q7HpLJFsgEabH2g==
X-Received: by 2002:a9d:7d06:: with SMTP id v6mr4009955otn.187.1556832966725; 
 Thu, 02 May 2019 14:36:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n185sm213641oif.8.2019.05.02.14.36.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 14:36:06 -0700 (PDT)
Date: Thu, 2 May 2019 16:36:05 -0500
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add FriendlyELEC HD702E 800x1280
 LCD panel
Message-ID: <20190502213605.GA20606@bogus>
References: <20190501121448.3812-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501121448.3812-1-jagan@amarulasolutions.com>
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAgMSBNYXkgMjAxOSAxNzo0NDo0NyArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiBI
RDcwMkUgbGNkIGlzIEZyaWVuZGx5RUxFQyBkZXZlbG9wZWQgZURQIExDRCBwYW5lbCB3aXRoIDgw
MHgxMjgwCj4gcmVzb2x1dGlvbi4gSXQgaGFzIGJ1aWx0IGluIEdvb2RpeCwgR1Q5MjcxIGNhcHRp
dmUgdG91Y2hzY3JlZW4KPiB3aXRoIGJhY2tsaWdodCBhZGp1c3RhYmxlIHZpYSBQV00uCj4gCj4g
QWRkIHN1cHBvcnQgZm9yIGl0Lgo+IAo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRp
bmdAZ21haWwuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0t
Cj4gIC4uLi9kaXNwbGF5L3BhbmVsL2ZyaWVuZGx5YXJtLGhkNzAyZS50eHQgICAgICB8IDI5ICsr
KysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
ICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmllbmRseWFybSxoZDcwMmUudHh0Cj4gCgpSZXZp
ZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
