Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CD16A3CE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 11:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3D26E41B;
	Mon, 24 Feb 2020 10:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF916E41B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 10:23:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c9so9702777wrw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=fQRJvQWg1mssixJXovxZ3IkUS/2s75lvnZU1Yia+Grw=;
 b=ZYQ7ZbcKQa+m/upCgLCvsV4l91hPSWyCnhKP1AlcyyuMPxnQ/dQjccddpKUx3j+Vy7
 SflErcSk4Vx3vpqyZEYXmIzdU/habh32tnwSKd/6yHHRaIngMYESCgbXEapkbhf906+b
 n4uK55VmY+doBM3GzEYJ6pdYUBJ9eNLupUVMiggz+IpVQt43V2/F2VZR5dyyzO8/jHcF
 Fv450c5cThgxAi4koK46McRM8YvVrJVSCx6p1KvCMZ/h9bW2WT3Ka+L84rk82wPGHawF
 HVftrf7sdcJvDyzc7vQRbhitA8ZyXN2PJiZtuwdcv7mWNMSaS+zuNTMjpq0CrxfqUMrn
 linQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fQRJvQWg1mssixJXovxZ3IkUS/2s75lvnZU1Yia+Grw=;
 b=EEUX7UgMilm8bX1lr/F/O4SdWhVzBgbrGMTWgEgoVmqI2DoGrJzn5U60gato+o1GKD
 9n2I06dc+kPsPuaVZf+RW2+7lSyZFv52SkcDtUMOMQd62RC9JQH/aWe9HLgjvyLsVHNP
 KM1HT+NUYs1Ylfe0EgKqMuqq45le+ji52D/ZZzRBX8Se/UjvZhAHfdL0lPq1GpJC8YY3
 +X2OfJkCSqk0Gc7/LpK4AnkD8Lnwd/HLPHcUISyVvcaOWTejpYnI7WVDVS4VqKzqT20n
 RvX8IgyNRiAy5sTYx11wGg85GC6X8Eb6cDe1Xv25hJQaJtLmuFrDUkcFyP4UBYzmtMj/
 HHdQ==
X-Gm-Message-State: APjAAAVwKi4GiuEZxsNSoxvD9xzVBgSBEGDk5h4dKkZhAYWVDqHK3em5
 cLXte9WGfKavOBwxVCxF5GhcYw==
X-Google-Smtp-Source: APXvYqxE9hP5mm5Ydc2KSwrNjx98paaJPPLNdrn5L9Z79TKF1e/KjIAGOvBWGCT2PqJycJom43N/NA==
X-Received: by 2002:adf:c404:: with SMTP id v4mr15204430wrf.53.1582539781481; 
 Mon, 24 Feb 2020 02:23:01 -0800 (PST)
Received: from dell ([2.31.163.122])
 by smtp.gmail.com with ESMTPSA id k7sm17455250wmi.19.2020.02.24.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 02:23:00 -0800 (PST)
Date: Mon, 24 Feb 2020 10:23:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] backlight: pwm_bl: Switch to full GPIO descriptor
Message-ID: <20200224102332.GM3494@dell>
References: <20200210101546.287565-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210101546.287565-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMCBGZWIgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIFBXTSBiYWNr
bGlnaHQgc3RpbGwgc3VwcG9ydHMgcGFzc2luZyBhIGVuYWJsZSBHUElPIGxpbmUgYXMKPiBwbGF0
Zm9ybSBkYXRhIHVzaW5nIHRoZSBsZWdhY3kgPGxpbnV4L2dwaW8uaD4gQVBJLgo+IAo+IEl0IHR1
cm5zIG91dCB0aGF0IGV2ZXIgYm9hcmQgdXNpbmcgdGhpcyBtZWNoYW5pc20gZXhjZXB0IG9uZQo+
IGlzIHBhc3MgLmVuYWJsZV9ncGlvID0gLTEuIFNvIHdlIGRyb3AgYWxsIHRoZXNlIGNhcmdvLWN1
bHRlZCAtMSdzCj4gZnJvbSBhbGwgaW5zdGFuY2VzIG9mIHRoaXMgcGxhdGZvcm0gZGF0YSBpbiB0
aGUga2VybmVsLgo+IAo+IFRoZSByZW1hbmluZyBib2FyZCwgUGFsbSBUQywgaXMgY29udmVydGVk
IHRvIHBhc3MgYSBtYWNoaW5lCj4gZGVzY3JpcHRpb3IgdGFibGUgd2l0aCB0aGUgImVuYWJsZSIg
R1BJTyBpbnN0ZWFkLCBhbmQgZGVsZXRlIHRoZQo+IHBsYXRmb3JtIGRhdGEgZW50cnkgZm9yIGVu
YWJsZV9ncGlvIGFuZCB0aGUgY29kZSBoYW5kbGluZyBpdAo+IGFuZCB0aGluZ3Mgc2hvdWxkIHdv
cmsgc21vb3RobHkgd2l0aCB0aGUgbmV3IEFQSS4KPiAKPiBDYzogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgo+IENjOiBHdWFuIFh1ZXRhbyA8Z3h0QHBrdS5lZHUuY24+Cj4g
QWNrZWQtYnk6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgo+IFJldmll
d2VkLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
CkFyZSB3ZSB3YWl0aW5nIG9uIGFueW9uZSBlbHNlPwoKPiAtLS0KPiBDaGFuZ2VMb2cgdjItPnYz
Ogo+IC0gQ29sbGVjdCBSb2JlcnQncyBBQ0suCj4gQ2hhbmdlTG9nIHYxLT52MjoKPiAtIExvY2F0
ZWQgYSBtaXNzaW5nIHJlbW92YWwgb2YgLmVuYWJsZV9ncGlvIGluIHRoZSBQYWxtIFRDCj4gICBi
b2FyZCBmaWxlLCBwb2ludGVkIG91dCBieSBEYW5pZWwuCj4gLSBHcmVwcGVkIHRvIGFzY2VydGFp
biB0aGVyZSBpcyBub3QgYSBzaW5nbGUgaW5zdGFuY2Ugb2YKPiAgIHRoZSBzdHJpbmcgImVuYWJs
ZV9ncGlvIiBpbiB0aGUgYWZmZWN0ZWQgYm9hcmQgZmlsZXMuCj4gLS0tCj4gIGFyY2gvYXJtL21h
Y2gtcHhhL2NtLXgzMDAuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXB4
YS9jb2xpYnJpLXB4YTI3MC1pbmNvbWUuYyB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1weGEvZXp4
LmMgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtcHhhL2h4NDcwMC5j
ICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXB4YS9scGQyNzAuYyAgICAg
ICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1weGEvbWFnaWNpYW4uYyAgICAgICAg
ICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtcHhhL21haW5zdG9uZS5jICAgICAgICAgICAg
IHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXB4YS9taW9hNzAxLmMgICAgICAgICAgICAgICB8ICAx
IC0KPiAgYXJjaC9hcm0vbWFjaC1weGEvcGFsbTI3eC5jICAgICAgICAgICAgICAgfCAgMSAtCj4g
IGFyY2gvYXJtL21hY2gtcHhhL3BhbG10Yy5jICAgICAgICAgICAgICAgIHwgMTEgKysrKysrKysr
Ky0KPiAgYXJjaC9hcm0vbWFjaC1weGEvcGFsbXRlMi5jICAgICAgICAgICAgICAgfCAgMSAtCj4g
IGFyY2gvYXJtL21hY2gtcHhhL3BjbTk5MC1iYXNlYm9hcmQuYyAgICAgIHwgIDEgLQo+ICBhcmNo
L2FybS9tYWNoLXB4YS90YXZvcmV2Yi5jICAgICAgICAgICAgICB8ICAyIC0tCj4gIGFyY2gvYXJt
L21hY2gtcHhhL3ZpcGVyLmMgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNo
LXB4YS96Mi5jICAgICAgICAgICAgICAgICAgICB8ICAyIC0tCj4gIGFyY2gvYXJtL21hY2gtcHhh
L3p5bG9uaXRlLmMgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgv
bWFjaC1oMTk0MC5jICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gt
cngxOTUwLmMgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9kZXYtYmFja2xp
Z2h0LmMgICAgIHwgIDMgLS0tCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLWNyYWc2NDEw
LmMgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1obXQuYyAgICAgICAg
ICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtc21hcnRxLmMgICAgICAgfCAg
MSAtCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtZGs2NDEwLmMgICAgIHwgIDIgKy0K
PiAgYXJjaC91bmljb3JlMzIva2VybmVsL3B1djMtbmIwOTE2LmMgICAgICAgfCAgMSAtCj4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jICAgICAgICAgIHwgMTkgLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3B3bV9iYWNrbGlnaHQuaCAgICAgICAgICAgICB8ICAy
IC0tCj4gIDI2IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygt
KQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExl
YWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
