Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A058646
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7A76E062;
	Thu, 27 Jun 2019 15:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65FA6E062
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:49:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x17so3137475wrl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=44Mu8dUj9L0ids6Sb6CWNDIoEklnO4VYTdbwKc4aKyc=;
 b=bsBpYjH1TKJSoZD6/4CJT5+L0wnKy0NVvxQ5HqR74M+iJj/7lQhzEXbB5xw5hqjF2/
 jVqqOHOY5ffyl4JYYERczUIoJgrbPcE2aV+mFNP+meDZWQ6YOlRnkfTIUo/xIOYnaczM
 GmmetJjE6dz4JsH4p8mOkrPFKDf1vp+MQGoLMh8UucrTPqHeV5BkWp149VTp4hcrAGez
 A9mLJBZsnc5ixyNIuWN6eO3HPuKR+ZzanECtAgGw4yHF9Lo6Y8p0F/Ei8VP+Y1dMVL+2
 c5M0EZAZ4e7JAfn6Po31godjhaKnAUvbQgNCpYTPW8bGkMMzulMuNyUOuhMXV+laQE60
 Eo/A==
X-Gm-Message-State: APjAAAWciBld8/rfw91Qlp5nPaZ8NMymnryGAZSX39iXvO239DnL8zg/
 EpThqR2gbXb/920+BHHBdad7/w==
X-Google-Smtp-Source: APXvYqysjCQU6AMMnWNSo+srDbMEz+UGbQKDPhC9Sr5nPHf9OFgk/UI30HaXEVLBgefpPDnGRYn9Fw==
X-Received: by 2002:adf:afe8:: with SMTP id y40mr3651106wrd.328.1561650563346; 
 Thu, 27 Jun 2019 08:49:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 35sm3904679wrj.87.2019.06.27.08.49.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:49:22 -0700 (PDT)
Date: Thu, 27 Jun 2019 16:49:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Message-ID: <20190627154920.aucjtaguatd5yd4m@holly.lan>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-4-mka@chromium.org>
 <61ed137c-31bb-c695-4174-0484fe667d6c@linaro.org>
 <20190627092453.GB2000@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627092453.GB2000@dell>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=44Mu8dUj9L0ids6Sb6CWNDIoEklnO4VYTdbwKc4aKyc=;
 b=LnfYL9dENRWp68RK7vG0qlql3IoqqpP/rxklMtbkkjRQYXe39yb7G4ucSqJIgltNt4
 XhSr8NGEnd2Oag74G7xFEbVqtPwuaPpyHD7J8B2GHjzh5DiKFrDPFdQORgv1maS6vjcs
 KX41MbperZUATOEY2X29oQFxm0MvGxCKGw93sVcHgSpilZHjtAGxOU+uYwlvdQe81hqr
 evEnE2CcXdGYVoFT8OFTIqPE+AmdmGtIK7Av7XSSfUnuWJANIeqDkkMDeqwFFAPVW6mq
 CfALUOifrtw7WkfXULktuWj6djEi59osVSAET/syisCCbdFgO44iRn+3Cay10GR1smxJ
 l81A==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTA6MjQ6NTNBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIEZyaSwgMjEgSnVuIDIwMTksIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiAKPiA+IE9u
IDEzLzA2LzIwMTkgMjA6NDMsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gPiBGb3IgYmFj
a2xpZ2h0IGN1cnZlcyBjYWxjdWxhdGVkIHdpdGggdGhlIENJRSAxOTMxIGFsZ29yaXRobSBzZXQK
PiA+ID4gdGhlIGJyaWdodG5lc3Mgc2NhbGUgdHlwZSBwcm9wZXJ0eSBhY2NvcmRpbmdseS4gVGhp
cyBtYWtlcyB0aGUKPiA+ID4gc2NhbGUgdHlwZSBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIHZpYSB0
aGUgJ3NjYWxlJyBzeXNmcyBhdHRyaWJ1dGUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiA+IAo+ID4gSSdkIGxpa2UgdG8g
a2VlcCBkaXNjdXNzaW9uIG9uIHBhdGNoIDIgb3BlbiBhIGJpdCBsb25nZXIgKGl0J3Mgbm90IHBh
cnQgb2YKPiA+IHRoZSB0aHJlYWQgYmVsb3cgcGF0Y2ggMiBidXQgUGF2ZWwgaGFkIGNvbmNlcm5z
IGFib3V0IHRoZSBzeXNmcyBpbnRlcmZhY2UpCj4gPiBzbyB0aGlzIGFjayB3b24ndCByZWFsbHkg
cHVzaCB0aGluZ3MgZm9yd2FyZCBidXQgRldJVzoKPiA+IAo+ID4gQWNrZWQtYnk6IERhbmllbCBU
aG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gCj4gRG9lcyB0aGlzIGRlcGVu
ZCBvbiBwYXRjaCAyLCBvciBpcyBpdCBvcnRob2dvbmFsPwoKSUlSQyBpdCBkZXBlbmRzIG9uIHBh
dGNoIDIgKHNpbmNlIHRoYXQndCB3aGF0IGludHJvZHVjZXMgcHJvcHMuc2NhbGUgKS4KCgpEYW5p
ZWwuCgo+IAo+ID4gPiAtLS0KPiA+ID4gICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwu
YyB8IDUgKysrKy0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ID4gPiBpbmRl
eCBmYjQ1Zjg2NmI5MjMuLmYwNjdmZTdhYTM1ZCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMKPiA+ID4gQEAgLTU1Myw2ICs1NTMsOCBAQCBzdGF0aWMgaW50IHB3bV9iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gICAJCWdvdG8g
ZXJyX2FsbG9jOwo+ID4gPiAgIAl9Cj4gPiA+ICsJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHN0
cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcykpOwo+ID4gPiArCj4gPiA+ICAgCWlmIChkYXRhLT5s
ZXZlbHMpIHsKPiA+ID4gICAJCS8qCj4gPiA+ICAgCQkgKiBGb3IgdGhlIERUIGNhc2UsIG9ubHkg
d2hlbiBicmlnaHRuZXNzIGxldmVscyBpcyBkZWZpbmVkCj4gPiA+IEBAIC01OTEsNiArNTkzLDgg
QEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gPiA+ICAgCQkJcGItPmxldmVscyA9IGRhdGEtPmxldmVsczsKPiA+ID4gICAJCX0K
PiA+ID4gKwo+ID4gPiArCQlwcm9wcy5zY2FsZSA9IEJBQ0tMSUdIVF9TQ0FMRV9DSUUxOTMxOwo+
ID4gPiAgIAl9IGVsc2Ugewo+ID4gPiAgIAkJLyoKPiA+ID4gICAJCSAqIFRoYXQgb25seSBoYXBw
ZW5zIGZvciB0aGUgbm9uLURUIGNhc2UsIHdoZXJlIHBsYXRmb3JtIGRhdGEKPiA+ID4gQEAgLTYw
MSw3ICs2MDUsNiBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+ID4gICAJcGItPmx0aF9icmlnaHRuZXNzID0gZGF0YS0+bHRo
X2JyaWdodG5lc3MgKiAoc3RhdGUucGVyaW9kIC8gcGItPnNjYWxlKTsKPiA+ID4gLQltZW1zZXQo
JnByb3BzLCAwLCBzaXplb2Yoc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzKSk7Cj4gPiA+ICAg
CXByb3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwo+ID4gPiAgIAlwcm9wcy5tYXhfYnJpZ2h0bmVz
cyA9IGRhdGEtPm1heF9icmlnaHRuZXNzOwo+ID4gPiAgIAlibCA9IGJhY2tsaWdodF9kZXZpY2Vf
cmVnaXN0ZXIoZGV2X25hbWUoJnBkZXYtPmRldiksICZwZGV2LT5kZXYsIHBiLAo+ID4gPiAKPiA+
IAo+IAo+IC0tIAo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IExpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZAo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
