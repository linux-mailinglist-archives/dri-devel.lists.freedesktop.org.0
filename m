Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A52C936D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5989C7F;
	Mon, 30 Nov 2020 23:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7777589C7F;
 Mon, 30 Nov 2020 23:57:46 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id t23so3114784oov.4;
 Mon, 30 Nov 2020 15:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vgKRQAiib2gthU/VRaj/WeBHXJVwpbyuOw/X2vXJueI=;
 b=EBsDXBf2rrZUNngQH8wrfhBKvQwjvZtdwWGIJv3CT7KK2X4l7YGGKTTaYksY+SJCad
 tU0F75gkP1RaOYHqs99lUIrVC5ZwBE+IMKxoX8G9XoxxyPbIatH3Kvh2M8ik8Ga/Nn0i
 HFGgSi+VQ5R3Pkm+XHJJupZtg+/gtCBEV2kVRZJh/zg1MLvgCTu1KMi2YaEJ53mPDQ01
 qyI7VykMAEdx5bCu602vB0KDwedCZnnhju6pB3QONTHzFC44bsI0aRURdM44drkECL0C
 iw5X71jRT8UrvWJtd6+K0ZjvF5QPlzWbTZzQ1OwZUkTOof1RlrxmHU/tB+SMsJZQtd1G
 lZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vgKRQAiib2gthU/VRaj/WeBHXJVwpbyuOw/X2vXJueI=;
 b=Qeg/vg3UgLiNtYDzOO7E6zkLAinILjqcumJ/jPPw1xvVzpwrw46Fcj5rL7vEZQAmAo
 ilb+4hvvFHN+eb9mOe8wKov6znxcJE5JoxCJIkn1y/OyI+49vQxFpgbU1MqKeRMrVZlf
 NOaMvL6wL13viAzXMjm5+PliViCJ187XKkz0DT982EVqrtk/WAEWPzZtLIZPiWuem2wX
 iLXAt6Ro9rY1bbxEHYGrrX4qbIOfcvllRQ0UEAm+Z5Gpm60PtzUI+vXX2uOvTvpoMB+z
 DsuOG++ckqzsNOQu8GnY75IJ2OI0SE5ETKGZW6TTqfF7x7yecSSuZhX2Fogr51Zi+vvH
 CURA==
X-Gm-Message-State: AOAM532InfFKwpT8qKv2RWyRartQ5CrX9Cg1deIu/LtbcPfcWZPmxNTF
 ijRJJyx9lF2oWCUIbAWq2XpNhjry6XU+GvCG/Nk=
X-Google-Smtp-Source: ABdhPJw4rZeb/PphtWu4Cl8TtHzvOdOYjiTsuSvu34iEY+jqPxAhUdABssZ2oSFIkmZjy0IuBwel0IN3v8tMXKTbJAE=
X-Received: by 2002:a4a:d5d3:: with SMTP id a19mr48449oot.61.1606780665874;
 Mon, 30 Nov 2020 15:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-33-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-33-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:57:35 -0500
Message-ID: <CADnq5_PtZRwNNV-EvMjkV9k2sYj9jdYBT3oqtS3-hm-pTsaaew@mail.gmail.com>
Subject: Re: [PATCH 32/40] drm/amd/display/amdgpu_dm/amdgpu_dm: Mark
 'link_bandwidth_kbps' as __maybe_unused
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

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+ICdsaW5rX2JhbmR3aWR0aF9rYnBzJyBpcyBhbHdheXMgb2J0YWlu
ZWQsIGJ1dCBvbmx5IHVzZWQgaWYKPiBDT05GSUdfRFJNX0FNRF9EQ19EQ04gaXMgZGVmaW5lZC4K
ClByb2JhYmx5IGJldHRlciB0byBqdXN0IG1vdmUgdGhpcyB1bmRlciBDT05GSUdfRFJNX0FNRF9E
Q19EQ04uICBJJ2xsCnNlbmQgYSBwYXRjaC4KClRoYW5rcywKCkFsZXgKCgo+Cj4gRml4ZXMgdGhl
IGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6IEluIGZ1bmN0
aW9uIOKAmGNyZWF0ZV9zdHJlYW1fZm9yX3NpbmvigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jOjUwODA6MTE6IHdhcm5pbmc6
IHZhcmlhYmxlIOKAmGxpbmtfYmFuZHdpZHRoX2ticHPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKPiBpbmRleCAwODUzOWY0MzE1ODY0Li5hYzc2NDNkNzNiYzY4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
Cj4gQEAgLTUwNzcsNyArNTA3Nyw3IEBAIGNyZWF0ZV9zdHJlYW1fZm9yX3Npbmsoc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IsCj4gICNpZiBkZWZpbmVkKENPTkZJR19EUk1f
QU1EX0RDX0RDTikKPiAgICAgICAgIHN0cnVjdCBkc2NfZGVjX2RwY2RfY2FwcyBkc2NfY2FwczsK
PiAgI2VuZGlmCj4gLSAgICAgICB1aW50MzJfdCBsaW5rX2JhbmR3aWR0aF9rYnBzOwo+ICsgICAg
ICAgdWludDMyX3QgX19tYXliZV91bnVzZWQgbGlua19iYW5kd2lkdGhfa2JwczsKPgo+ICAgICAg
ICAgc3RydWN0IGRjX3NpbmsgKnNpbmsgPSBOVUxMOwo+ICAgICAgICAgaWYgKGFjb25uZWN0b3Ig
PT0gTlVMTCkgewo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
