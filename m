Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5F2EFA2B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7536E8DE;
	Fri,  8 Jan 2021 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77BD6E8DE;
 Fri,  8 Jan 2021 21:19:07 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id w3so11001517otp.13;
 Fri, 08 Jan 2021 13:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+BVMFNqO9VtQw50JkrleUaGJ0i7fU8M+bV3fNxrSKxc=;
 b=pLgTcndfV6cW6spCSGmjB9Fb3TfBg6Tmw3S+ubIj/B1HgTeqyjz5qA9/Z7BpIp2tVT
 AIAdfrenkZLlqi0vENVzKN5z6sRCG/HRIxDlE7rXaBHDMJ36kgnddELtWGMAWeX+vZVE
 hG47TowHgJIpYX6BIS+tu8ABMiCtX3NfE+4x2yCa2ADEX5cIBZN4BPcu+oLBeXmVBk2I
 O4EZVDZdWPKEtDWDquMvP9o7hq9V4ooPyqjY+vttyNwgIS2+V3ZqjNC4mqBtuDuyhFW+
 xK7g9eBKmIbWjVWdezeRFWB73Rm+B3xjuqs97WTfGUFhIdphaq81fYQ+YLGkggsDVhJq
 JEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+BVMFNqO9VtQw50JkrleUaGJ0i7fU8M+bV3fNxrSKxc=;
 b=Sw/VhTzfWZXZeiYqhs7R04dmNuzthzJmzVOlb5EtrszFc0Z5EAfwEAVOn7WV6b/rGf
 pDYWEdfBAD7eHMMZe+5R7Wnl9SjIQqiZpcRuOtWXgs+6efaFypJ6SLG8E2d0uRO3gADq
 LaUiAtBiRCx4ibCPWvvAbqTPi/EMXDcYiSbDLOXmRCeTcAXNU3hngIB+pATtOTH1TUA3
 aOy+z1kmnfo8BRtAd4nclyRyANpRZUEmUPZ4YVS0O4hCEVseVIlVv50Sd5iwQH95K1gr
 Eejt6/iRPbPvS9N01zK44ACrMIhNgE1a8/vjPgNF2vCd8+P5djnXMlwjvJ/Zr63buwqH
 +Ctg==
X-Gm-Message-State: AOAM530Fndfm1cv15KRC/h/nVZ2Q3DPdhV+3I34P1tKs1HzpS1m9NXAE
 SYONXUeVgaOnfaFYeJbiqKOrqFB6g7+ZHur6scc=
X-Google-Smtp-Source: ABdhPJxeFs1iL9KeAXeDXqdeEvesZuOa6FUbcR/HvCtgBKTdtd+5IUJYYuhMsC+0OFyPkE66/LzhP1w3wx3BwPOu6CU=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr3901460otl.311.1610140747098; 
 Fri, 08 Jan 2021 13:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-31-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-31-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:18:56 -0500
Message-ID: <CADnq5_PcfiXEc=dpOVM+xttj91tnPsw0UT4T-arzxZhvdusiqw@mail.gmail.com>
Subject: Re: [PATCH 30/40] drm/amd/display/dc/dce/dce_dmcu: Move
 'abm_gain_stepsize' to only source file it's used in
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gQW5kIG9ubHkgZGVjbGFyZSBpdCBpZiBpdCdzIHRvIGJlIHVzZWQu
Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPgo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5o
OjMyMDoyMzogd2FybmluZzog4oCYYWJtX2dhaW5fc3RlcHNpemXigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuaDozMjA6MjM6IHdhcm5pbmc6IOKAmGFi
bV9nYWluX3N0ZXBzaXpl4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12
YXJpYWJsZT1dCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNl
L2RjZV9kbWN1Lmg6MzIwOjIzOiB3YXJuaW5nOiDigJhhYm1fZ2Fpbl9zdGVwc2l6ZeKAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5oOjMyMDoyMzogd2Fy
bmluZzog4oCYYWJtX2dhaW5fc3RlcHNpemXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY2UvZGNlX2RtY3UuaDozMjA6MjM6IHdhcm5pbmc6IOKAmGFibV9nYWluX3N0ZXBz
aXpl4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1Lmg6
MzIwOjIzOiB3YXJuaW5nOiDigJhhYm1fZ2Fpbl9zdGVwc2l6ZeKAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5oOjMyMDoyMzogd2FybmluZzog4oCYYWJt
X2dhaW5fc3RlcHNpemXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZh
cmlhYmxlPV0KPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4K
PiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYXVybyBSb3NzaSA8
aXNzb3Iub3J1YW1AZ21haWwuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMg
fCA0ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5o
IHwgMiAtLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9kbWN1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMK
PiBpbmRleCBmYTJiNDdkNDFlZTJmLi4zMDI2NGZjMTUxYTJiIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYwo+IEBAIC02NSw2ICs2NSwxMCBA
QAo+ICAvL1JlZ2lzdGVyIGFjY2VzcyBwb2xpY3kgdmVyc2lvbgo+ICAjZGVmaW5lIG1tTVAwX1NN
Tl9DMlBNU0dfOTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxNjA5Qgo+Cj4gKyNpZiBk
ZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTikKPiArc3RhdGljIGNvbnN0IHVpbnQzMl90IGFi
bV9nYWluX3N0ZXBzaXplID0gMHgwMDYwOwo+ICsjZW5kaWYKPiArCj4gIHN0YXRpYyBib29sIGRj
ZV9kbWN1X2luaXQoc3RydWN0IGRtY3UgKmRtY3UpCj4gIHsKPiAgICAgICAgIC8vIERvIG5vdGhp
bmcKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
ZG1jdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5oCj4g
aW5kZXggOTNlN2YzNGQ0Nzc1ZS4uY2VmYjdmNWJmNDJjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmgKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmgKPiBAQCAtMzE3LDYgKzMxNyw0IEBA
IHN0cnVjdCBkbWN1ICpkY24yMV9kbWN1X2NyZWF0ZSgKPgo+ICB2b2lkIGRjZV9kbWN1X2Rlc3Ry
b3koc3RydWN0IGRtY3UgKipkbWN1KTsKPgo+IC1zdGF0aWMgY29uc3QgdWludDMyX3QgYWJtX2dh
aW5fc3RlcHNpemUgPSAweDAwNjA7Cj4gLQo+ICAjZW5kaWYgLyogX0RDRV9BQk1fSF8gKi8KPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
