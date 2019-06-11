Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE03CE24
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 16:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E5A890DB;
	Tue, 11 Jun 2019 14:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A3389209
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:11:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s15so3112163wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qc5EFkVTKGr6dYAxoaP7PbGa9RFFb0Yu3NvNTqCuC7g=;
 b=qst9r4+SLJbQ2pmy/LLHIU97J+bLyacdmqfMzPKmmu7e9C84or1wAm6SFiBKLMe/Aa
 LTGTlGtzwXmdmEmzO05M8tj9iZWY1Fb7NR2oHWP96G6veLubXt1g62LkgZtPQl74br6A
 JTblaIAXcPnloE9jasapqd3IuOPFMStbCcxMaYtpgQ5vV2G6szam4Oa4+uciLHesHu3R
 Ad+yzzNKrX1Yzsx4UuRtl10cEXlAn4wZW8JmtcT+Yx2Wfk1I7H80lW0bijPObQeFixfM
 lJj+RZreWygD+xN54/QuRvHcpYE9pTBT0WnrxyIDHPWfv7PJwDIfBQThNSRz+7gc5x0Y
 HamQ==
X-Gm-Message-State: APjAAAXA8gjIcAUGMzHQhW37PpHV08TaQlqvHVAPRzzmXBN+AnjdNqqm
 2V9KYc/z3NWP6Y9l06mDXE3Sig==
X-Google-Smtp-Source: APXvYqxCrGFZDkB6E92/L2zQkhPrLCT80Z0/I9uddbexDlRQYg1pdUdK2tzvVwqbMxgtCW6DRYNgYQ==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr4133085wmh.76.1560262287645;
 Tue, 11 Jun 2019 07:11:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u23sm2501379wmj.33.2019.06.11.07.11.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:11:27 -0700 (PDT)
Date: Tue, 11 Jun 2019 15:11:25 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 33/33] backlight: simplify lcd notifier
Message-ID: <20190611141125.w6vhytsue7toif3g@holly.lan>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
 <20190528090304.9388-34-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528090304.9388-34-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qc5EFkVTKGr6dYAxoaP7PbGa9RFFb0Yu3NvNTqCuC7g=;
 b=PG0OjEu1w3GysO55d1AWF1JxGrKq//m5h/+lqkdUO4kaTlmGHYQkTZfi5j2mYvLMxF
 voKWf4tqIhrTsY9L4GnOTVRdkcQTdMek5MfrPc3nxSNFAMB3Up8vAf2wnBjiv6jDA/f1
 PXrO1HfQn7++uNe2BSjhTwc05BzyqrvgZYUJZrcxBZ4teyFkmmgaBSL5H4Q69nG+PSxm
 z4Fi1g0EI5qm6iG+Yf7J1mEU0kEWIIWJ1YP4tBPqfVzEDWxR65a+AT9PBvZtJLCYK14b
 1bvjtCf/Nug5Zf8GiWEBE8FXdY5lS1vOSZv05gmHphpBN6t40O6TpdSG1ZF0jiWNOJh8
 7NKQ==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Lee Jones <lee.jones@linaro.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jingoo Han <jingoohan1@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTE6MDM6MDRBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXaXRoIGFsbCB0aGUgd29yayBJJ3ZlIGRvbmUgb24gcmVwbGFjaW5nIGZiIG5vdGlm
aWVyIGNhbGxzIHdpdGggZGlyZWN0Cj4gY2FsbHMgaW50byBmYmNvbiB0aGUgYmFja2xpZ2h0L2xj
ZCBub3RpZmllciBpcyB0aGUgb25seSB1c2VyIGxlZnQuCj4gCj4gSXQgd2lsbCBvbmx5IHJlY2Vp
dmUgZXZlbnRzIG5vdyB0aGF0IGl0IGNhcmVzIGFib3V0LCBoZW5jZSB3ZSBjYW4KPiByZW1vdmUg
dGhpcyBjaGVjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgo+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+
IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IENjOiBK
aW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2xjZC5jIHwgMTEgLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sY2Qu
YyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xjZC5jCj4gaW5kZXggZWNkZGEwNjk4OWQwLi5k
NmI2NTNhYTRlZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGNkLmMK
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sY2QuYwo+IEBAIC0zMCwxNyArMzAsNiBA
QCBzdGF0aWMgaW50IGZiX25vdGlmaWVyX2NhbGxiYWNrKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
c2VsZiwKPiAgCXN0cnVjdCBsY2RfZGV2aWNlICpsZDsKPiAgCXN0cnVjdCBmYl9ldmVudCAqZXZk
YXRhID0gZGF0YTsKPiAgCj4gLQkvKiBJZiB3ZSBhcmVuJ3QgaW50ZXJlc3RlZCBpbiB0aGlzIGV2
ZW50LCBza2lwIGl0IGltbWVkaWF0ZWx5IC4uLiAqLwo+IC0Jc3dpdGNoIChldmVudCkgewo+IC0J
Y2FzZSBGQl9FVkVOVF9CTEFOSzoKPiAtCWNhc2UgRkJfRVZFTlRfTU9ERV9DSEFOR0U6Cj4gLQlj
YXNlIEZCX0VBUkxZX0VWRU5UX0JMQU5LOgo+IC0JY2FzZSBGQl9SX0VBUkxZX0VWRU5UX0JMQU5L
Ogo+IC0JCWJyZWFrOwo+IC0JZGVmYXVsdDoKPiAtCQlyZXR1cm4gMDsKPiAtCX0KPiAtCj4gIAls
ZCA9IGNvbnRhaW5lcl9vZihzZWxmLCBzdHJ1Y3QgbGNkX2RldmljZSwgZmJfbm90aWYpOwo+ICAJ
aWYgKCFsZC0+b3BzKQo+ICAJCXJldHVybiAwOwo+IC0tIAo+IDIuMjAuMQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
