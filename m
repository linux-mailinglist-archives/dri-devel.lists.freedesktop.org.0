Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB32B1E86
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 16:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98F6E513;
	Fri, 13 Nov 2020 15:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5E86E4E8;
 Fri, 13 Nov 2020 15:24:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d12so10281665wrr.13;
 Fri, 13 Nov 2020 07:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RlnsgXAqhx5O+gUIkanOxQMyzGK/8K/9bXQ6x1TuhEw=;
 b=g4sghMSloA5MoXSp+2EWSlMNkDdD8L0ikVibSCuQeIb9IHT15BSMCi+lOK6+oKEInx
 AEZ6707+Yxe6+jmtTQATHLh02ny5TwbG4YsZrjQeVvxb903XG1Ii5I2R2DydpzauFvyB
 WS+N12Etx7ht/fb4YfgfTYD2BcREe+XShSPX+ZwcNeTJ3whhRv/fz12FHgZgiLerOiOA
 c3okv+J9JCqqCMFSnvmMc2LC1Vz7BkWa2fFspcGPJS90jejtchbCQZTi08u9CVheo1ah
 5R136pUCqHBEcsmGSJ6G4cLzBofszhR76jjIEfKjOGJsvb9shc88R54seCPjr5qeVDCA
 aORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RlnsgXAqhx5O+gUIkanOxQMyzGK/8K/9bXQ6x1TuhEw=;
 b=kXKd6hlCMtfmr7VJBsZu/LqGqwlDSMOLMRHT487MSOure6GzscxdWOG2kGKB3A8Xmz
 6MUDgNKUFh9vJfS5Ux0uVWaurS6Gkxh5PYHVRzkMUIRcWrlAwTpbdzG7z5Cgn8+eLrP3
 UmrAx9tNX6kDzegTOrFLN0sWDN4mKDL3vwydE6595CEHsV8rpvLUEbMfOZt2CcBUuR77
 TElPhjCf/9rWPKDnx6E8KB8hWsFuOUm+mDlIDKMIserXzce6Xoh9Nycadb4TC0nrqQPu
 QHfpMuPzMhhLWcR6R7GYHjOP5cdqCuOBmmLoHPRDxbTDTH04rcCl9LBBHNk8N2zKz1b5
 v46w==
X-Gm-Message-State: AOAM532jptgiiCbGERCtTI9Rd5gBmO/+KYUTvO2MBqYo0Y6w65fdKfGS
 fV5Ujbjf+4Byr1RMzWq1l6hItG1761V3fWzXV5EK/cze
X-Google-Smtp-Source: ABdhPJyQZCe7HtPJ3bNlUzGKK0DUuW0GKd3K8ifcOW4D4SiAIXLhs+AM0tGomadQ5bbIShqpKa7/HWeVZ37cFfWJWbg=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr4084367wru.362.1605281042319; 
 Fri, 13 Nov 2020 07:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-3-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-3-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 10:23:50 -0500
Message-ID: <CADnq5_N6iRUWZ=nYqRFWjUjsDL65WXEOg__n+yvbtqqcRSsWgQ@mail.gmail.com>
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

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo0OSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggZml4ZXMgPjIwMCB3YXJuaW5ncy4KPgo+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBl
cy5oOjEyMzoyMjogd2FybmluZzog4oCYRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzPigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTIzIHwgc3Rh
dGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzNbXSA9ICJkbm9tbEEi
Owo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oOjEyMToyMjogd2Fy
bmluZzog4oCYRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzLigJkgZGVmaW5lZCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTIxIHwgc3RhdGljIGNvbnN0IHVpbnQ4
X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzJbXSA9ICJzaXZhclQiOwo+Cj4gTkI6IFJlcGVh
dGVkIH4xMDAgdGltZXMgLSBzbmlwcGVkIGZvciBicmV2aXR5Cj4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmtfZHAuYyAgICAgICAgfCA1ICsrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVzLmggfCA0IC0tLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCj4gaW5kZXggNmM2
MGMxZmRlYmRjMS4uZjIwMjNkMmI1MzIzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKPiBAQCAtMTUsNiArMTUsMTEgQEAKPiAg
I2luY2x1ZGUgImRjX2RtdWJfc3J2LmgiCj4gICNpbmNsdWRlICJkY2UvZG11Yl9od19sb2NrX21n
ci5oIgo+Cj4gKy8qVHJhdmlzKi8KPiArc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNf
Q09OVkVSVEVSX0lEXzJbXSA9ICJzaXZhclQiOwo+ICsvKk51dG1lZyovCj4gK3N0YXRpYyBjb25z
dCB1aW50OF90IERQX1ZHQV9MVkRTX0NPTlZFUlRFUl9JRF8zW10gPSAiZG5vbWxBIjsKPiArCj4g
ICNkZWZpbmUgRENfTE9HR0VSIFwKPiAgICAgICAgIGxpbmstPmN0eC0+bG9nZ2VyCj4gICNkZWZp
bmUgRENfVFJBQ0VfTEVWRUxfTUVTU0FHRSguLi4pIC8qIGRvIG5vdGhpbmcgKi8KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlw
ZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5
cGVzLmgKPiBpbmRleCBjOWJlODk5Y2QyNWNkLi5iNDUzY2U1YTliZmRiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVzLmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90
eXBlcy5oCj4gQEAgLTExNywxMCArMTE3LDYgQEAgc3RydWN0IGF2X3N5bmNfZGF0YSB7Cj4gICAg
ICAgICB1aW50OF90IGF1ZF9kZWxfaW5zMzsvKiBEUENEIDAwMDJEaCAqLwo+ICB9Owo+Cj4gLS8q
VHJhdmlzKi8KPiAtc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lE
XzJbXSA9ICJzaXZhclQiOwo+IC0vKk51dG1lZyovCj4gLXN0YXRpYyBjb25zdCB1aW50OF90IERQ
X1ZHQV9MVkRTX0NPTlZFUlRFUl9JRF8zW10gPSAiZG5vbWxBIjsKPiAgLypEUCB0byBEdWFsIGxp
bmsgRFZJIGNvbnZlcnRlciovCj4gIHN0YXRpYyBjb25zdCB1aW50OF90IERQX0RWSV9DT05WRVJU
RVJfSURfNFtdID0gIm0yRFZJYSI7Cj4gIHN0YXRpYyBjb25zdCB1aW50OF90IERQX0RWSV9DT05W
RVJURVJfSURfNVtdID0gIjMzOTNOMiI7CgpDYW4gd2Uga2VlcCBhbGwgb2YgdGhlc2Ugc3RyaW5n
cyB0b2dldGhlcj8KCkFsZXgKCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
