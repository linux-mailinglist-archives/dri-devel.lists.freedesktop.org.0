Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5BB2702
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 23:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5756F469;
	Fri, 13 Sep 2019 21:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC226F468;
 Fri, 13 Sep 2019 21:05:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o184so4129652wme.3;
 Fri, 13 Sep 2019 14:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2DisDR/cJhM64R78LUA1TAvaEYUe5ftHQT+Ynd0imlo=;
 b=uXMnvMAOqzgAxblVSRyDoJ+4Hd2X60vrLTh3yKQ1UYbYnGYeN4jumK0I0lRkiCAasw
 H61OT/RqxOtmducOKbNCidnA5G7PppU/PNL4c+8c4swJea+y8wQV/gJqn1uDA+uNM1aW
 etXvwXN4VuQDL3cvPLFQiKymEPTLKZ1ANkbe2C0Pil2Mh3cvErDYr0GfrjSSskXInXe0
 VpJMmpbO4xUXuwgzO2m88VZIsSRy6xMxRRXDgOJC6LhlOq7WrSsCPguoN0dy5tZVKVZF
 rP7rRvPpffRhrn3GSmiyrxjSIDXhudVv98lVuxmtGGXE9Ggn9FbBw/AOAvwVP/6r+SVI
 +HUA==
X-Gm-Message-State: APjAAAVk+mPFw31H4aJTCXbRuTruKQG5gEUUDVT7u5y/ZCwZgU4wYqks
 mQaIbHb7DUej3E0th04fd9phxAP5oMF13oMD9iw=
X-Google-Smtp-Source: APXvYqzhhFfWlU3Qj+SLVwzrpNt0iJ1xPnhsEhUTCLbHzdPUlu+CvxRWW4hZ7r1L+sNOPXRvDPP5AXJ5MV+Q/BQE7MM=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr5184148wmo.67.1568408711053; 
 Fri, 13 Sep 2019 14:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <1567491305-18320-1-git-send-email-zhongjiang@huawei.com>
 <62b33279-9ca9-5970-5336-a8511ce54197@web.de> <5D70A196.3020106@huawei.com>
 <dd351754-cb3a-b19a-64e1-f2f583c2a23a@web.de> <5D70CB7A.8040307@huawei.com>
In-Reply-To: <5D70CB7A.8040307@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Sep 2019 17:04:59 -0400
Message-ID: <CADnq5_MH5HnfihRTBRHnSWRzDj5nu_8w0TWf82-999nKCa4wDQ@mail.gmail.com>
Subject: Re: drm/amdgpu: remove the redundant null check
To: zhong jiang <zhongjiang@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2DisDR/cJhM64R78LUA1TAvaEYUe5ftHQT+Ynd0imlo=;
 b=BWwJ61TxX2jZxRKjKsHdxAuRqSXMAKi+BP5djX6lCCI4CTx3viCbHzwg7gvLT9gg+V
 zoP8AL7WvxuKN0W/7l+VlyNCMWUC2d9K+3Od3V/XUmnC8d6+7J7XbQx/WS9UWTtcxfoR
 ozVGPUT1esSZiJWobCSapv6x38//BorJXk0qkg7WCowdeblf3Kvs+1SzodHmSKhcVbkY
 3LdUtdOSmqUt4TOLtB/qEPhM9Kx+LL6MsXBD0TE1Xcv2iJeVIMwRbDQRPvdCyi0hx5gN
 ysXTZQYaqCUR+pkU1z20wkCWmMxbH5CMTrtKhPyZOSqdAcDxdu082jLHAj5dAlJbv7P4
 4HbA==
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
Cc: kernel-janitors@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCAzOjAxIEFNIHpob25nIGppYW5nIDx6aG9uZ2ppYW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS85LzUgMTY6MzgsIE1hcmt1cyBFbGZyaW5nIHdy
b3RlOgo+ID4+PiBXZXJlIGFueSBzb3VyY2UgY29kZSBhbmFseXNpcyB0b29scyBpbnZvbHZlZCBm
b3IgZmluZGluZwo+ID4+PiB0aGVzZSB1cGRhdGUgY2FuZGlkYXRlcz8KPiA+PiBXaXRoIHRoZSBo
ZWxwIG9mIENvY2NpbmVsbGUuIFlvdSBjYW4gZmluZCBvdXQgc29tZSBleGFtcGxlIGluIHNjcmlw
dHMvY29jY2luZWxsZS8uCj4gPiBUaGFua3MgZm9yIHN1Y2ggYmFja2dyb3VuZCBpbmZvcm1hdGlv
bi4KPiA+IFdhcyB0aGUgc2NyaXB0IOKAnGlmbnVsbGZyZWUuY29jY2nigJ0gYXBwbGllZCBoZXJl
Pwo+IFllcAo+ID4gV2lsbCBpdCBiZSBoZWxwZnVsIHRvIGFkZCBhdHRyaWJ1dGlvbiBmb3Igc3Vj
aCB0b29scwo+ID4gdG8gYW55IG1vcmUgZGVzY3JpcHRpb25zIGluIHlvdXIgcGF0Y2hlcz8KPiBT
b21ldGltZXMsIEkgd2lsbCBhZGQgdGhlIGRlc2NyaXB0aW9uIGluIG15IHBhdGNoZXMuIE5vdCBh
bHdheXMuCgpBcHBsaWVkIHdpdGggc29tZSBtaW5vciB0d2Vha3MgdG8gdGhlIGNvbW1pdCBtZXNz
YWdlLgoKVGhhbmtzIQoKQWxleAoKPgo+IFRoYW5rcywKPiB6aG9uZyBqaWFuZwo+ID4gUmVnYXJk
cywKPiA+IE1hcmt1cwo+ID4KPiA+IC4KPiA+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
