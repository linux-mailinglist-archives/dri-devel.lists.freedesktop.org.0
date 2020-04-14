Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E426B1A9405
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970276E854;
	Wed, 15 Apr 2020 07:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48896E580
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:32:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y24so15600002wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r6dF4D+wN0hoeI/HD/8hpNX9Zi5cUiRTSVM80fnZiTg=;
 b=fBwO8IzrniZxcSL/9GbflmZPAl8MqOi6BSiWdmNVZDtvwiDrXcJ8sFwXX48lFfCr/X
 wAgnGE8TBRQDx7zep17eczot4owoqocmojJ2B1UIF3996KL5H5yKdjPmNSVnUf4AqjNa
 rln2yoActQTeguQWHfcZC3czrrvZnhzuMvVik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r6dF4D+wN0hoeI/HD/8hpNX9Zi5cUiRTSVM80fnZiTg=;
 b=JB/8p6M4cw3uzThMdMShCxtzyK60VKfKv659k3nkv8anhk1gLlfAWtbUiRltWPQ1nx
 SHTnl648puHo3n52sQ1ovPBobH8SGTNnpa3RuUGGbxpATrciLh6RyV2y96MV2+QqyYbD
 MmlX4BHVqb3Fd722kIMBBXyvokHKGNRhcQ0TpfoKHcetavHgxApdLHDFDSX9LK3vGax0
 hHYwnkl02nJ+uBHPIiBJSvl0CGn6SqoLT8iFc7ahz7HCF/p6/ytH4f7OFXzVonPBFz6e
 B1LXj1Gr8KzWUfYmPOXUbZVI+2E9XpWRACNIECOwSfuN3HpBcLsSPtecOxn9CfvwNpFN
 d++Q==
X-Gm-Message-State: AGi0PuaZdg1+PeCHko3OdkmQKaW3zQzZoAJSpFvxt4a/zF2PSNW5NcMt
 iGfAXp9Z+Us//iyTbL9Qu48Geq9QRaKFD9Y5acgBIw==
X-Google-Smtp-Source: APiQypLlztDYYEwUmNspxfYCm4X+JL6rjJrBiwa1m4IaNyse2DCEG6Vj7c7I41oPprzB2RKLqJ1TOmG77/BhEZSyEk4=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr1303254wmj.12.1586892732880;
 Tue, 14 Apr 2020 12:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
In-Reply-To: <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Tue, 14 Apr 2020 12:32:01 -0700
Message-ID: <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To: Dmitry Osipenko <digetx@gmail.com>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LCBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpPbiBTdW4sIE1hciA4LCAyMDIw
IGF0IDEyOjI1IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6Cj4K
PiAwNi4wMy4yMDIwIDAzOjIxLCBEZXJlayBCYXNlaG9yZSDQv9C40YjQtdGCOgo+ID4gVGhpcyBh
ZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRoZSBkZXZp
Y2V0cmVlCj4gPiBhbmQgc2V0cyB1cCBhZGRpbmcgYSBwYW5lbCBwcm9wZXJ0eSBmb3IgdGhlIHBh
bmVsIG9yaWVudGF0aW9uIG9uCj4gPiBNZWRpYXRlayBTb0NzIHdoZW4gYSByb3RhdGlvbiBpcyBw
cmVzZW50Lgo+Cj4gSGVsbG8gRGVyZWsgYW5kIGV2ZXJ5b25lLAo+Cj4gSSdtIGxvb2tpbmcgYXQg
YWRkaW5nIGRpc3BsYXkgcm90YXRpb24gc3VwcG9ydCB0byBOVklESUEgVGVncmEgRFJNCj4gZHJp
dmVyIGJlY2F1c2Ugc29tZSBkZXZpY2VzIGhhdmUgZGlzcGxheSBwYW5lbCBwaHlzaWNhbGx5IG1v
dW50ZWQKPiB1cHNpZGUtZG93biwgYW5kIHRodXMsIGRpc3BsYXkgY29udHJvbGxlcidzIHNjYW4t
b3V0IG5lZWRzIHRvIGJlIHJvdGF0ZWQKPiBieSAxODDCsCBpbiB0aGlzIGNhc2UuCj4KPiBEZXJl
aywgeW91cnMgcGFuZWwtcm90YXRpb24gcGF0Y2hlcyBhZGQgc3VwcG9ydCBmb3IgYXNzaWduaW5n
IHBhbmVsJ3MKPiBvcmllbnRhdGlvbiB0byB0aGUgY29ubmVjdG9yLCBidXQgdGhlbiBvbmx5IHBy
aW1hcnkgZGlzcGxheSBwbGFuZQo+IHJlY2VpdmVzIHJvdGF0aW9uIHZhbHVlIGluIFsxXSwgd2hp
bGUgcm90YXRpb24gbmVlZHMgdG8gYmUgYXBwbGllZCB0bwo+IGFsbCBhdmFpbGFibGUgb3Zlcmxh
eS9jdXJzb3IgcGxhbmVzIGFuZCB0aGlzIHNob3VsZCBoYXBwZW4gaW4gb3RoZXIKPiBwbGFjZXMg
dGhhbiBbMV0gYXMgd2VsbC4KClRoaXMgaXMgaW50ZW5kZWQuIFdlIGRvbid0IGNvcnJlY3QgdGhl
IG91dHB1dCBpbiB0aGUga2VybmVsLiBXZQppbnN0ZWFkIHJlbHkgb24gbm90aWZ5aW5nIHVzZXJz
cGFjZSB0aGF0IHRoZSBwYW5lbCBpcyByb3RhdGVkLCB0aGVuIHdlCmhhbmRsZSBpdCB0aGVyZS4K
Cj4KPiBbMV0gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMoKQo+Cj4gUGxlYXNlIGFs
c28gbm90ZSB0aGF0IGluIGEgY2FzZSBvZiB0aGUgc2Nhbi1vdXQgcm90YXRpb24sIHBsYW5lJ3MK
PiBjb29yZGluYXRlcyBuZWVkIHRvIGJlIGNoYW5nZWQgaW4gYWNjb3JkYW5jZSB0byB0aGUgZGlz
cGxheSdzIHJvdGF0aW9uLgo+Cj4gSSBsb29rZWQgYnJpZWZseSB0aHJvdWdoIHRoZSBEUk0gY29k
ZSBhbmQgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSBEUk0KPiBjb3JlIGN1cnJlbnRseSBkb2Vz
bid0IHN1cHBvcnQgdXNlLWNhc2Ugd2hlcmUgc2Nhbi1vdXQgbmVlZHMgdG8gcm90YXRlZAo+IGJh
c2VkIG9uIGEgcGFuZWwncyBvcmllbnRhdGlvbiwgY29ycmVjdD8gSXMgaXQgdGhlIHVzZS1jYXNl
IHlvdSdyZQo+IHdvcmtpbmcgb24gZm9yIHRoZSBNZWRpYXRlayBkcml2ZXI/CgpZZXMsIHdlIHJl
bHkgb24gdXNlcnNwYWNlIHRvIHJvdGF0ZSB0aGUgb3V0cHV0LiBUaGUgbWFqb3IgcmVhc29uIGZv
cgp0aGlzIGlzIGJlY2F1c2UgdGhlcmUgbWF5IG5vdCBiZSBhICJmcmVlIiBoYXJkd2FyZSByb3Rh
dGlvbiB0aGF0IGNhbgpiZSBhcHBsaWVkIHRvIHRoZSBvdmVybGF5LiBTZWFuIFBhdWwgYW5kIG90
aGVycyBhbHNvIHByZWZlcnJlZCB0aGF0CnVzZXJzcGFjZSBjb250cm9sIHdoYXQgaXMgb3V0cHV0
IHRvIHRoZSBzY3JlZW4gaW5zdGVhZCBvZiB0aGUga2VybmVsCnRha2luZyBjYXJlIG9mIGl0LiBU
aGlzIGNvZGUganVzdCBhZGRzIHRoZSBkcm0gcHJvcGVydHkgdG8gdGhlIHBhbmVsLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
