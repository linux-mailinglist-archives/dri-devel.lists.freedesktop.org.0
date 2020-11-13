Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A32B1E95
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 16:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201236E51A;
	Fri, 13 Nov 2020 15:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323896E517;
 Fri, 13 Nov 2020 15:26:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so8463305wml.2;
 Fri, 13 Nov 2020 07:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G9TfsPNQuZodnze2hrFlCCZs5bDojQWMiw52AmraRWM=;
 b=uK5SglA4vTQ4iJCcvCvRIJF3mTuXKqt0Hrjt/oUsmnEW+bDApmE7CIAAaWf/qFMRXQ
 q3fXIc8v3pWqYGYNpN1nFaIgOB/pqj+0Lz15lfd1SCdX9iBHBUbbuYNnqf7Rt2lmR82l
 iruZUqUbX9Bp8ny6OW7+pykb/+gFSgxVcZcNA6jkKGmUfxPYRbw7InkjG+LLA3jxnjAw
 /G47Ei7HmI3bfVFiSb70aKeQQOaOx+Gk62rC4SKDmGCYMoQYpq5rjPONmEAtp3uP/Fkn
 ZuS/qVLnBax4KbQ2aEJ0cOH9wU3Pgm2FZadBCyAOas8dFuqA9Ggg1T0ysZebX6qi0G1K
 8+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G9TfsPNQuZodnze2hrFlCCZs5bDojQWMiw52AmraRWM=;
 b=qCxImzuLFKNrP+lyZVg72zFr67KCEGv6y7TilAEKlfWPEcMS1P9/3aMYYjImdEu75y
 23/vDe1Qy+PL6Dwr+aIxD7/gk7y/r+Vcs4ZNS/4hp3omEPpZfSUoIqcs7yAYhfNH+S11
 fyrDAgOF8erKIO4+LBOS8TI8XHKvV/a3HRlWRDQuwjiuV+/bMIkKJqOq4mFpfhPunVDv
 dtyRyyMP4axy7oWU9BOf7lVNzcns6jBEzuQpmoPfKJYzvp9jJ4h0rYNYR6b+mbTNT1hv
 SmxeUWxjj+drl+0sJgcxNmq1GYljofeVE2qqHcRcbMSYGXycFbvthppN3DXT2S6O67F/
 7RJA==
X-Gm-Message-State: AOAM531umdgpjnqSnFEOyhUDliY2jGrDyvYAM/pM1fOYyM/vpqM/XgkI
 eXgEscp75D0xggUIfWtFBOqjfUybpjN2QhspV6Q=
X-Google-Smtp-Source: ABdhPJzEnaDDGa7S6X7M+JzJV1x3tPLpk48+5+IeHGvSTjuAqAT+Y65hF97bdiVMt1b5gc2rf5+BO8xkGi7MdAAi8tc=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr3041461wmb.39.1605281210978;
 Fri, 13 Nov 2020 07:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-3-lee.jones@linaro.org>
 <CADnq5_N6iRUWZ=nYqRFWjUjsDL65WXEOg__n+yvbtqqcRSsWgQ@mail.gmail.com>
In-Reply-To: <CADnq5_N6iRUWZ=nYqRFWjUjsDL65WXEOg__n+yvbtqqcRSsWgQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 10:26:39 -0500
Message-ID: <CADnq5_M8c_BHN+T3T6nzv3FRy9dJ=dwy+6rx5+NGtZnD7o=n1g@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/display/dc/core/dc_link_dp: Move
 DP_VGA_LVDS_CONVERTER_ID_{2, 3} to where they're used
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

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMTA6MjMgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo0OSBBTSBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHBhdGNo
IGZpeGVzID4yMDAgd2FybmluZ3MuCj4gPgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oOjEyMzoyMjogd2FybmluZzog
4oCYRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiA+ICAxMjMgfCBzdGF0aWMgY29uc3QgdWludDhfdCBE
UF9WR0FfTFZEU19DT05WRVJURVJfSURfM1tdID0gImRub21sQSI7Cj4gPiAgfCBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oOjEyMToyMjogd2FybmluZzog4oCYRFBfVkdB
X0xWRFNfQ09OVkVSVEVSX0lEXzLigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNv
bnN0LXZhcmlhYmxlPV0KPiA+ICAxMjEgfCBzdGF0aWMgY29uc3QgdWludDhfdCBEUF9WR0FfTFZE
U19DT05WRVJURVJfSURfMltdID0gInNpdmFyVCI7Cj4gPgo+ID4gTkI6IFJlcGVhdGVkIH4xMDAg
dGltZXMgLSBzbmlwcGVkIGZvciBicmV2aXR5Cj4gPgo+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgo+ID4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
Pgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+ID4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyAgICAgICAgfCA1ICsrKysrCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMuaCB8
IDQgLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Y19saW5rX2RwLmMKPiA+IGluZGV4IDZjNjBjMWZkZWJkYzEuLmYyMDIzZDJiNTMyMzQgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2Rw
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZHAuYwo+ID4gQEAgLTE1LDYgKzE1LDExIEBACj4gPiAgI2luY2x1ZGUgImRjX2RtdWJfc3J2Lmgi
Cj4gPiAgI2luY2x1ZGUgImRjZS9kbXViX2h3X2xvY2tfbWdyLmgiCj4gPgo+ID4gKy8qVHJhdmlz
Ki8KPiA+ICtzdGF0aWMgY29uc3QgdWludDhfdCBEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMltd
ID0gInNpdmFyVCI7Cj4gPiArLypOdXRtZWcqLwo+ID4gK3N0YXRpYyBjb25zdCB1aW50OF90IERQ
X1ZHQV9MVkRTX0NPTlZFUlRFUl9JRF8zW10gPSAiZG5vbWxBIjsKPiA+ICsKPiA+ICAjZGVmaW5l
IERDX0xPR0dFUiBcCj4gPiAgICAgICAgIGxpbmstPmN0eC0+bG9nZ2VyCj4gPiAgI2RlZmluZSBE
Q19UUkFDRV9MRVZFTF9NRVNTQUdFKC4uLikgLyogZG8gbm90aGluZyAqLwo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVz
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBl
cy5oCj4gPiBpbmRleCBjOWJlODk5Y2QyNWNkLi5iNDUzY2U1YTliZmRiIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMu
aAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZp
Y2VfdHlwZXMuaAo+ID4gQEAgLTExNywxMCArMTE3LDYgQEAgc3RydWN0IGF2X3N5bmNfZGF0YSB7
Cj4gPiAgICAgICAgIHVpbnQ4X3QgYXVkX2RlbF9pbnMzOy8qIERQQ0QgMDAwMkRoICovCj4gPiAg
fTsKPiA+Cj4gPiAtLypUcmF2aXMqLwo+ID4gLXN0YXRpYyBjb25zdCB1aW50OF90IERQX1ZHQV9M
VkRTX0NPTlZFUlRFUl9JRF8yW10gPSAic2l2YXJUIjsKPiA+IC0vKk51dG1lZyovCj4gPiAtc3Rh
dGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzNbXSA9ICJkbm9tbEEi
Owo+ID4gIC8qRFAgdG8gRHVhbCBsaW5rIERWSSBjb252ZXJ0ZXIqLwo+ID4gIHN0YXRpYyBjb25z
dCB1aW50OF90IERQX0RWSV9DT05WRVJURVJfSURfNFtdID0gIm0yRFZJYSI7Cj4gPiAgc3RhdGlj
IGNvbnN0IHVpbnQ4X3QgRFBfRFZJX0NPTlZFUlRFUl9JRF81W10gPSAiMzM5M04yIjsKPgo+IENh
biB3ZSBrZWVwIGFsbCBvZiB0aGVzZSBzdHJpbmdzIHRvZ2V0aGVyPwoKTmV2ZXJtaW5kLCBJIGhh
ZG4ndCBzZWVuIHRoZSBsYXRlciBwYXRjaCB0aGF0IGRlYWxzIHdpdGggdGhlIGxhdGVyIG9uZXMu
CgpBbGV4Cgo+Cj4gQWxleAo+Cj4gPiAtLQo+ID4gMi4yNS4xCj4gPgo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
