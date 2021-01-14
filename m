Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4060B2F673A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2F689798;
	Thu, 14 Jan 2021 17:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF75889798;
 Thu, 14 Jan 2021 17:15:59 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id b24so5882586otj.0;
 Thu, 14 Jan 2021 09:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DZvV4C4oOxbUt8DFOQqdGw1qrGeev5cm2TlRav0Zgbg=;
 b=Jm2eHceCwQCHn1T1s2o2QxDhEZm8HGU1e+A6qmoo/h0EI4XLjZcGq2ufqEi91NgF7Y
 Q/TTXh3JtWB4ZGLpYnHkP+8BCUSvfunQOps/a+FZnQpyhK68gRKptoZk7dFr67VqSWlV
 7WC/5JYUfehMVvAdEX2pDEa23whOfu8Hp70Y2HvB8AkBR1WUlypA+/eUesJsZrUAOwRo
 xpfOBXu5yz3pm+ZxY17bMHuQGW55lxlc1RnN/jNVMVdf+NhTr0rmAnuvY9LQtMFrQPjo
 zI7LPHGC4Gk59WfeiUKFU0RkZU4ZsZZewqnQBtLMtm0V3tTUXykPg13703H6qC35w5mw
 Twuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DZvV4C4oOxbUt8DFOQqdGw1qrGeev5cm2TlRav0Zgbg=;
 b=BPP+WgFQNtKLJj7fuzPh+lH/7ogu8MxdmFeXMNbxRTR4FBqzvkKZTtRVZe2Mo/4dXd
 rPQ2iCahiINwtK+a6zsI/QkAu9auyD8QPLYeo78Qlhs37kyMbkq5FIKf2bw31HSGSGII
 fmRcJ3C/sAYBZBjRb5O59y4du9Wpse+vpD/PX6Xd9Dqx5ThrFOZhqK4Dpt3dLRNXAOHK
 cio9SWkJRP9YKZkZBBKZAVr2sa1dy6MIX7+6j8Pggjys01MCba2MqB0wTv1Nl46rX8B2
 X4C8/U3jJ0C2Bn5VChDT+n3OoVyu3s1Qrzm7CdumY1EBu/p4UdurRRrfGJ3ctAmS+s2Y
 Pu/w==
X-Gm-Message-State: AOAM533ae/xlJU/0TM2+blrP3o3MzuZzSjtcjatyWNDf5w4eoVJ80O8G
 0rTp7FWlB3W4EtqPLrDoU8tUvxfrz+HkC+ZeCF1X3mmP
X-Google-Smtp-Source: ABdhPJxNPLzWD0PbWkQes1m6LSVXN5I1aVXiz8LrP2RuB2J4vu6EaUpE58YSeUKp6ix+V53hajfXB6+peVv/C1EzISs=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr5208415otb.23.1610644557590; 
 Thu, 14 Jan 2021 09:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-18-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:15:46 -0500
Message-ID: <CADnq5_PYBNHHVR3DGRCRTFU1gWTPNN_z=bQYG_PUp9soq_n94g@mail.gmail.com>
Subject: Re: [PATCH 17/30] drm/amd/display/dc/dce60/dce60_resource: Include
 our own header containing prototypes
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

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlNjAvZGNlNjBfcmVzb3VyY2UuYzoxMTE1OjIzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmGRjZTYwX2NyZWF0ZV9yZXNvdXJjZV9wb29s4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U2
MC9kY2U2MF9yZXNvdXJjZS5jOjEzMTI6MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYZGNlNjFfY3JlYXRlX3Jlc291cmNlX3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTYwL2Rj
ZTYwX3Jlc291cmNlLmM6MTUwNToyMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhkY2U2NF9jcmVhdGVfcmVzb3VyY2VfcG9vbOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTWF1cm8gUm9zc2kgPGlzc29yLm9y
dWFtQGdtYWlsLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTYwL2RjZTYwX3Jlc291cmNlLmMg
fCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlNjAvZGNlNjBfcmVzb3VyY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jCj4g
aW5kZXggNjRmNGEwZGExNDZiZi4uZGNmYTBhM2VmYTAwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlNjAvZGNlNjBfcmVzb3VyY2UuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jCj4gQEAg
LTYwLDYgKzYwLDggQEAKPiAgI2luY2x1ZGUgImRjZS9kY2VfaTJjLmgiCj4gIC8qIFRPRE8gcmVt
b3ZlIHRoaXMgaW5jbHVkZSAqLwo+Cj4gKyNpbmNsdWRlICJkY2U2MF9yZXNvdXJjZS5oIgo+ICsK
PiAgI2lmbmRlZiBtbU1DX0hVQl9SRFJFUV9ETUlGX0xJTUlUCj4gICNpbmNsdWRlICJnbWMvZ21j
XzZfMF9kLmgiCj4gICNpbmNsdWRlICJnbWMvZ21jXzZfMF9zaF9tYXNrLmgiCj4gLS0KPiAyLjI1
LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
