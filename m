Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B72F6744
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6F489FED;
	Thu, 14 Jan 2021 17:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2F389FED;
 Thu, 14 Jan 2021 17:17:18 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q25so6632493oij.10;
 Thu, 14 Jan 2021 09:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o7k9+/ImOTT6+O+qwUq3epvb/TE+j4Ep2dyuyw1DcuA=;
 b=GdRk7PiAEQ2racZn2Yzx9pBj0WEiHaF3uwKHS3reKPG1MTiN6y+MVTLxKkAdvRMha0
 Z3CQVHbWYxlXCeRPxZzv/bTr0cUtQOcXPQy49V8xjgqS5aTznmBg/XUeuBzXuO5XsLHR
 JojfAOML0XuvM3KiZCEt4PDyiM3KOrToOypLxrP7pYN+YuOMyZlS0Fgvhxrlw1/Y8sjC
 FFjlER+x5mHVSWWTkLUWI27PbrO5PWHfhIA1rmsf1f5R0AmjKB+De9RgvsQ9Y7cpwrPh
 zwWxXqNCHeQbzEGGVojA1gizs7EBU6owOXHT+2gaSB4dnWY0uzHDtcBqjm+w9i/u3RPm
 kzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o7k9+/ImOTT6+O+qwUq3epvb/TE+j4Ep2dyuyw1DcuA=;
 b=eHe5bCtRBVIb/jJcVblCixQOCeiqCM4HFHwKqYd8otPpkbzxPkaTrKBG9QQ0BdS42j
 N/Lqb/ZkSq1O7XJpEd0T4upVeF/PXLmXyQp+0WzeAKHtUcq+iNVnJyxmTPF5DD6GFmmm
 AYSpVMNmv5MFqH4WuDFgrVFyumijvFWbOi7qEs0Q3iOSVWMd+Vo5caePG9bgtKCqQKSG
 KWv+su/+G1n3PQON+FiMR6BP7s4kVsnUFZgOKMZa5t7ioL7AXM3RjOOTznH44cg6w2mK
 oy28LksIQiglsYjGLLd04w6JaEF9kU3g9Ea2k49rCT/vetBWBMG8kvEf+pIDXpkOk4p3
 9Xnw==
X-Gm-Message-State: AOAM531AEQICpiBoRgKkEqUZINmbfByoRPuzmPjfhZqNBBLpsi32BCPm
 ohOD0KWwXNqLAkP26yleGxn93CXLC6pbE62WXVo=
X-Google-Smtp-Source: ABdhPJwsFTzqKJOb92K9lMAKQ2TAuKfznueOrtNTEENsEck3k6NwpbJfi1zNkDGWF7xDukXcd1864+GPnAVpno9t1T0=
X-Received: by 2002:aca:6202:: with SMTP id w2mr3020084oib.5.1610644638152;
 Thu, 14 Jan 2021 09:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-19-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-19-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:17:07 -0500
Message-ID: <CADnq5_P7zmV5sTmOTPQHRjnPmr2oTb=rupsBUNXZEDeW7eaz_Q@mail.gmail.com>
Subject: Re: [PATCH 18/30] drm/amd/display/dc/core/dc_link: Move some local
 data from the stack to the heap
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmM6IEluIGZ1bmN0aW9uIOKAmGRjX2xpbmtfY29uc3RydWN04oCZOgo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jOjE1
ODg6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2YgMTE3NiBieXRlcyBpcyBsYXJnZXIgdGhh
biAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFuPV0KPgo+IENjOiBIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5j
b20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAxMiArKysrKysrKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiBpbmRl
eCA4Y2NkYThiOWFjMmViLi4zMzY2YTQ5ZjExZGM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+IEBAIC0xMzY0LDEzICsxMzY0LDE3IEBA
IHN0YXRpYyBib29sIGRjX2xpbmtfY29uc3RydWN0KHN0cnVjdCBkY19saW5rICpsaW5rLAo+ICAg
ICAgICAgc3RydWN0IGRjX2NvbnRleHQgKmRjX2N0eCA9IGluaXRfcGFyYW1zLT5jdHg7Cj4gICAg
ICAgICBzdHJ1Y3QgZW5jb2Rlcl9pbml0X2RhdGEgZW5jX2luaXRfZGF0YSA9IHsgMCB9Owo+ICAg
ICAgICAgc3RydWN0IHBhbmVsX2NudGxfaW5pdF9kYXRhIHBhbmVsX2NudGxfaW5pdF9kYXRhID0g
eyAwIH07Cj4gLSAgICAgICBzdHJ1Y3QgaW50ZWdyYXRlZF9pbmZvIGluZm8gPSB7e3sgMCB9fX07
Cj4gKyAgICAgICBzdHJ1Y3QgaW50ZWdyYXRlZF9pbmZvICppbmZvOwo+ICAgICAgICAgc3RydWN0
IGRjX2Jpb3MgKmJpb3MgPSBpbml0X3BhcmFtcy0+ZGMtPmN0eC0+ZGNfYmlvczsKPiAgICAgICAg
IGNvbnN0IHN0cnVjdCBkY192Ymlvc19mdW5jcyAqYnBfZnVuY3MgPSBiaW9zLT5mdW5jczsKPiAg
ICAgICAgIHN0cnVjdCBicF9kaXNwX2Nvbm5lY3Rvcl9jYXBzX2luZm8gZGlzcF9jb25uZWN0X2Nh
cHNfaW5mbyA9IHsgMCB9Owo+Cj4gICAgICAgICBEQ19MT0dHRVJfSU5JVChkY19jdHgtPmxvZ2dl
cik7Cj4KPiArICAgICAgIGluZm8gPSBremFsbG9jKHNpemVvZihpbmZvKSwgR0ZQX0tFUk5FTCk7
Cj4gKyAgICAgICBpZiAoIWluZm8pCj4gKyAgICAgICAgICAgICAgIGdvdG8gY3JlYXRlX2ZhaWw7
Cj4gKwo+ICAgICAgICAgbGluay0+aXJxX3NvdXJjZV9ocGQgPSBEQ19JUlFfU09VUkNFX0lOVkFM
SUQ7Cj4gICAgICAgICBsaW5rLT5pcnFfc291cmNlX2hwZF9yeCA9IERDX0lSUV9TT1VSQ0VfSU5W
QUxJRDsKPgo+IEBAIC0xNTMyLDEyICsxNTM2LDEyIEBAIHN0YXRpYyBib29sIGRjX2xpbmtfY29u
c3RydWN0KHN0cnVjdCBkY19saW5rICpsaW5rLAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAo
Ymlvcy0+aW50ZWdyYXRlZF9pbmZvKQo+IC0gICAgICAgICAgICAgICBpbmZvID0gKmJpb3MtPmlu
dGVncmF0ZWRfaW5mbzsKPiArICAgICAgICAgICAgICAgbWVtY3B5KGluZm8sIGJpb3MtPmludGVn
cmF0ZWRfaW5mbywgc2l6ZW9mKCppbmZvKSk7Cj4KPiAgICAgICAgIC8qIExvb2sgZm9yIGNoYW5u
ZWwgbWFwcGluZyBjb3JyZXNwb25kaW5nIHRvIGNvbm5lY3RvciBhbmQgZGV2aWNlIHRhZyAqLwo+
ICAgICAgICAgZm9yIChpID0gMDsgaSA8IE1BWF9OVU1CRVJfT0ZfRVhUX0RJU1BMQVlfUEFUSDsg
aSsrKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBleHRlcm5hbF9kaXNwbGF5X3BhdGggKnBh
dGggPQo+IC0gICAgICAgICAgICAgICAgICAgICAgICZpbmZvLmV4dF9kaXNwX2Nvbm5faW5mby5w
YXRoW2ldOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICZpbmZvLT5leHRfZGlzcF9jb25uX2lu
Zm8ucGF0aFtpXTsKPgo+ICAgICAgICAgICAgICAgICBpZiAocGF0aC0+ZGV2aWNlX2Nvbm5lY3Rv
cl9pZC5lbnVtX2lkID09IGxpbmstPmxpbmtfaWQuZW51bV9pZCAmJgo+ICAgICAgICAgICAgICAg
ICAgICAgcGF0aC0+ZGV2aWNlX2Nvbm5lY3Rvcl9pZC5pZCA9PSBsaW5rLT5saW5rX2lkLmlkICYm
Cj4gQEAgLTE1ODQsNiArMTU4OCw4IEBAIHN0YXRpYyBib29sIGRjX2xpbmtfY29uc3RydWN0KHN0
cnVjdCBkY19saW5rICpsaW5rLAo+ICAgICAgICAgICAgICAgICBsaW5rLT5ocGRfZ3BpbyA9IE5V
TEw7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGtmcmVlKGluZm8pOwo+ICsKPiAgICAgICAgIHJl
dHVybiBmYWxzZTsKPiAgfQo+Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
