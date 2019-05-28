Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF742CA55
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62F89EAC;
	Tue, 28 May 2019 15:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1714689DBD;
 Tue, 28 May 2019 15:28:55 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g13so2564910edu.5;
 Tue, 28 May 2019 08:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBSDehUscYbGuLRQpP1AqssnnZu/Bbdfh1PgsEZ2kBA=;
 b=EdnW863aa2T+v3Koz8tFWMRgkcAjUaHqlq9vPEIwOwexG++xpLBQamlHOgJZotR1qY
 3JqIigolmc72OnI4hQ85SJPmjI89iwXjTy+cnIvG7X+opCDK34Jw/rCmPYG1jCEIQae8
 fqwLLyIo0UfbOr0psMNI4ZGxkLo5y/iyXAEWeRNFo8aEUR/LuZ1ZtgqugddnGEgGf2aD
 qENaTl/riRkd2XWfW/gB7gGEEV6UF7zJnrYF2qJmdhNuQArU+c8MYwP9t/PTEAubgjyk
 8vpzJ3g2mPrBt03JpXSdTjFEhVLJmKepWXu1kKueR+/8yScfuFYiC3JHFkWSwUWc8fir
 Q5/A==
X-Gm-Message-State: APjAAAUddWl4wzQkhY7zBiblhCNw0PBf2i2NMUsMTTX28rgYU6wOgMsX
 QMIIRFmQ1Joz9UIvo0cqLx5HABzj6xvWucfZRx0=
X-Google-Smtp-Source: APXvYqykwWEhvsomeKNbSk+Y2zV3q83HQAGweh6ofeOimoOA48Pu8v/cWFSAL/2wrUrVdmuqNOGwR4r/3wgI5D3blLw=
X-Received: by 2002:a05:6402:7d9:: with SMTP id
 u25mr4343873edy.71.1559057333677; 
 Tue, 28 May 2019 08:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
 <20190528151339.207978-1-sean@poorly.run>
In-Reply-To: <20190528151339.207978-1-sean@poorly.run>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 May 2019 08:28:39 -0700
Message-ID: <CAF6AEGuRBge1Qc7e5CHcgDMPs2ex+zdOMSRXyFcVgxoPF=rDOg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Use provided drm_minor to
 initialize debugfs
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hBSDehUscYbGuLRQpP1AqssnnZu/Bbdfh1PgsEZ2kBA=;
 b=IwC1OjpCneq6amgjigC20vKijFqjuEQgtIBBEywB9KrpzWwZvj6/iVUdznave3qT6u
 6VUKfDciUXLKzqDOLTz6mlZ93ePIaRc0YtMSWN1d8rMX910CdWgO1cpIUi/x+WCpiS3C
 TPmcuGpg2oOu6QvVee+foEHNPqvn2rqmAYK4O+dKOTCrvZB+JUxmcY2JxBE2GaeuIV/g
 psbjM6zPdOCO3D7W1veL/G6klEz91VuyH5VwlgpuAsduSt6uZ6Wm+3yuFKj3AOBPOzBP
 CYclDsxILR7vhsxARAX6PEgL8t5+3hT9tjewUvnfLb4CbkMLdq+X35G7asxbrEw7LSXk
 G2Ag==
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
Cc: Rob Clark <robdclark@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgODoxMyBBTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+
IEluc3RlYWQgb2YgcmVhY2hpbmcgaW50byBkZXYtPnByaW1hcnkgZm9yIGRlYnVnZnNfcm9vdCwg
dXNlIHRoZSBtaW5vcgo+IHBhc3NlZCBpbnRvIGRlYnVnZnNfaW5pdC4KPgo+IFRoaXMgYXZvaWRz
IGNyZWF0aW5nIGEgZGVidWcgZGlyZWN0b3J5IHVuZGVyIC9zeXMva2VybmVsL2RlYnVnL2RlYnVn
Cj4gYW5kIGluc3RlYWQgdXNlcyAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvPG5vZGU+Lwo+Cj4gU2lu
Y2Ugd2UncmUgbm93IHB1dHRpbmcgZXZlcnl0aGluZyB1bmRlciAqL2RyaS88bm9kZT4sIHRoZXJl
J3Mgbm8KPiBuZWVkIHRvIGNyZWF0ZSBhIGR1cGxpY2F0ZSAiZGVidWciIGRpcmVjdG9yeS4gSnVz
dCBwdXQgZXZlcnl0aGluZyBpbgo+IHRoZSByb290Lgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJl
bW92ZSB0aGUgdW5uZWNlc3NhcnkgImRlYnVnIiBkaXJlY3RvcnkgKFN0ZXBoZW4pCj4KPiBMaW5r
IHRvIHYxOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAx
OTA1MjQxNzMyMzEuNTA0MC0xLXNlYW5AcG9vcmx5LnJ1bgo+Cj4gQ2M6IFJvYiBDbGFyayA8cm9i
ZGNsYXJrQGNocm9taXVtLm9yZz4KPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRA
Y2hyb21pdW0ub3JnPgo+IFJldmlld2VkLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2Rl
YXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVt
Lm9yZz4KCm5pY2UhCgpSZXZpZXdlZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29t
PgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDEw
ICsrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKPiBpbmRleCA4
ODViZjg4YWZhM2VjLi5hZDA5NDcwNDYxMGY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9rbXMuYwo+IEBAIC0yMzEsMTggKzIzMSwxNCBAQCB2b2lkICpkcHVfZGVidWdm
c19jcmVhdGVfcmVnc2V0MzIoY29uc3QgY2hhciAqbmFtZSwgdW1vZGVfdCBtb2RlLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ3NldCwgJmRwdV9mb3BzX3JlZ3NldDMyKTsKPiAgfQo+Cj4g
LXN0YXRpYyBpbnQgX2RwdV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCj4g
K3N0YXRpYyBpbnQgX2RwdV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMsIHN0
cnVjdCBkcm1fbWlub3IgKm1pbm9yKQo+ICB7Cj4gICAgICAgICB2b2lkICpwID0gZHB1X2h3X3V0
aWxfZ2V0X2xvZ19tYXNrX3B0cigpOwo+IC0gICAgICAgc3RydWN0IGRlbnRyeSAqZW50cnk7Cj4g
KyAgICAgICBzdHJ1Y3QgZGVudHJ5ICplbnRyeSA9IG1pbm9yLT5kZWJ1Z2ZzX3Jvb3Q7Cj4KPiAg
ICAgICAgIGlmICghcCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAtICAg
ICAgIGVudHJ5ID0gZGVidWdmc19jcmVhdGVfZGlyKCJkZWJ1ZyIsIGRwdV9rbXMtPmRldi0+cHJp
bWFyeS0+ZGVidWdmc19yb290KTsKPiAtICAgICAgIGlmIChJU19FUlJfT1JfTlVMTChlbnRyeSkp
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+IC0KPiAgICAgICAgIC8qIGFsbG93
IHJvb3QgdG8gYmUgTlVMTCAqLwo+ICAgICAgICAgZGVidWdmc19jcmVhdGVfeDMyKERQVV9ERUJV
R0ZTX0hXTUFTS05BTUUsIDA2MDAsIGVudHJ5LCBwKTsKPgo+IEBAIC01ODEsNyArNTc3LDcgQEAg
c3RhdGljIGludCBfZHB1X2ttc19kcm1fb2JqX2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMp
Cj4gICNpZmRlZiBDT05GSUdfREVCVUdfRlMKPiAgc3RhdGljIGludCBkcHVfa21zX2RlYnVnZnNf
aW5pdChzdHJ1Y3QgbXNtX2ttcyAqa21zLCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPiAgewo+
IC0gICAgICAgcmV0dXJuIF9kcHVfZGVidWdmc19pbml0KHRvX2RwdV9rbXMoa21zKSk7Cj4gKyAg
ICAgICByZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQodG9fZHB1X2ttcyhrbXMpLCBtaW5vcik7Cj4g
IH0KPiAgI2VuZGlmCj4KPiAtLQo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2ds
ZSAvIENocm9taXVtIE9TCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IEZyZWVkcmVubyBtYWlsaW5nIGxpc3QKPiBGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9mcmVlZHJlbm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
