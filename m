Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AE2EFA56
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB0489320;
	Fri,  8 Jan 2021 21:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1D289320;
 Fri,  8 Jan 2021 21:23:46 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id o11so11098223ote.4;
 Fri, 08 Jan 2021 13:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aCoAbGKkVysmTlB8nOnLajkPksJNfkFdrsTwnEpGsSI=;
 b=dw8z5uqcP4yfpvEpx9m+W8twaWwhF8X4C4YEoWC+okMrrLSN5v6vdoivlehcwM4w3K
 byA8Y+RzIDsNBmPVhbzKcg3unN/BdvyFfaZCPHVqLD29UWDIjHhjGAjdBe4pdEjOwP18
 4JWdj9ObeNJjTa0/ZtxRXkP7Gx/DgCKBLOda9cDDT2bT1w0yzEuLc54Gq/tMZd4WNxcQ
 sQhnrTmTxgwy+GOTfJkw05hxw7UyvNlshkNR2ZyDdtLIsthz5Man2QrnUowaGSz6tUiU
 lYZbe+E9Thy3pjpjm06DqesLhYnHy5+btBCFzsDf1573SMgRpU9dTN+7zlCb+0IUcAaJ
 /Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aCoAbGKkVysmTlB8nOnLajkPksJNfkFdrsTwnEpGsSI=;
 b=WSow4yDZyoY7v6i3RdNY+Fyd39LEzAR4Mes1wb3v23uk/fSXf4nkKGR5VeEqOPUGXc
 Cfydpkj43AV2JLJxvcvlJ+6FOGcHQQWR8N4v4U05zk1xz+kt+U5L6FqZ/vi2iVlQjeuo
 8e+8nbPNdontbsGT7NW3W2RVNSpw2HFO/jQ+pfQwUEaG/U2EXv7MjIiT5bBWeCoLrGeI
 aQgIQNQrcqTOQTnrErWKTCkDCLWqi3kZa/CFabjlVMs0o85JMM3rAO9HNIJ+rK2t2o46
 1FJyH1kSGgpvZBtLAzqcqABzQMt97pz8rnoCfgOpsu+FkPdPsxlrLxT4XWVD2owUxpwm
 guMA==
X-Gm-Message-State: AOAM533QPhNlrZvTzGVOfdfl6kGg0cDLZxIyAflAquXLwDf3VEbZSC2p
 wFySE6jokjR3u5z+ZjIh897Hc4paqZaW131mVME=
X-Google-Smtp-Source: ABdhPJyKMBdC32hANO1XiAZxwbrpCwG6gelTpkW9IiHXMRtS3Ms+jMC1qMYHR7T93LBlrMvaDocCheQB64ssDHUsBCY=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3902194oti.23.1610141024619; 
 Fri, 08 Jan 2021 13:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-37-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-37-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:23:33 -0500
Message-ID: <CADnq5_PDo2XRMkrhwz52+01r3StpuP7TJHUE=W-8E__kuMtd3A@mail.gmail.com>
Subject: Re: [PATCH 36/40] drm/amd/display/dc/dce/dce_i2c_hw: Make functions
 called by reference static
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
Cc: Lewis Huang <Lewis.Huang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE2IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX2kyY19ody5jOjQzODozNTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhkY2VfaTJjX2h3X2VuZ2luZV93YWl0X29uX29wZXJhdGlvbl9yZXN1bHTigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2RjZS9kY2VfaTJjX2h3LmM6NTA1OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYZGNlX2kyY19od19lbmdpbmVfc3VibWl0X3BheWxvYWTigJkgWy1XbWlzc2luZy1w
cm90b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
Pgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExld2lzIEh1YW5n
IDxMZXdpcy5IdWFuZ0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcu
YyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Uv
ZGNlX2kyY19ody5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJj
X2h3LmMKPiBpbmRleCA3ZmJkOTJmYmM2M2E5Li5hNTI0ZjQ3MWUwZDc1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX2h3LmMKPiBAQCAtNDM1
LDcgKzQzNSw3IEBAIHN0cnVjdCBkY2VfaTJjX2h3ICphY3F1aXJlX2kyY19od19lbmdpbmUoCj4g
ICAgICAgICByZXR1cm4gZGNlX2kyY19odzsKPiAgfQo+Cj4gLWVudW0gaTJjX2NoYW5uZWxfb3Bl
cmF0aW9uX3Jlc3VsdCBkY2VfaTJjX2h3X2VuZ2luZV93YWl0X29uX29wZXJhdGlvbl9yZXN1bHQo
Cj4gK3N0YXRpYyBlbnVtIGkyY19jaGFubmVsX29wZXJhdGlvbl9yZXN1bHQgZGNlX2kyY19od19l
bmdpbmVfd2FpdF9vbl9vcGVyYXRpb25fcmVzdWx0KAo+ICAgICAgICAgc3RydWN0IGRjZV9pMmNf
aHcgKmRjZV9pMmNfaHcsCj4gICAgICAgICB1aW50MzJfdCB0aW1lb3V0LAo+ICAgICAgICAgZW51
bSBpMmNfY2hhbm5lbF9vcGVyYXRpb25fcmVzdWx0IGV4cGVjdGVkX3Jlc3VsdCkKPiBAQCAtNTAy
LDcgKzUwMiw3IEBAIHN0YXRpYyB1aW50MzJfdCBnZXRfdHJhbnNhY3Rpb25fdGltZW91dF9odygK
PiAgICAgICAgIHJldHVybiBwZXJpb2RfdGltZW91dCAqIG51bV9vZl9jbG9ja19zdHJldGNoZXM7
Cj4gIH0KPgo+IC1ib29sIGRjZV9pMmNfaHdfZW5naW5lX3N1Ym1pdF9wYXlsb2FkKAo+ICtzdGF0
aWMgYm9vbCBkY2VfaTJjX2h3X2VuZ2luZV9zdWJtaXRfcGF5bG9hZCgKPiAgICAgICAgIHN0cnVj
dCBkY2VfaTJjX2h3ICpkY2VfaTJjX2h3LAo+ICAgICAgICAgc3RydWN0IGkyY19wYXlsb2FkICpw
YXlsb2FkLAo+ICAgICAgICAgYm9vbCBtaWRkbGVfb2ZfdHJhbnNhY3Rpb24sCj4gLS0KPiAyLjI1
LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
