Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001992C9098
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C716E8F7;
	Mon, 30 Nov 2020 22:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB0D6E8F7;
 Mon, 30 Nov 2020 22:07:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id f12so12860609oto.10;
 Mon, 30 Nov 2020 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rkYzGaKYtcgJzrd8rxQCICVltYGsIDYYTqDHFCgv/PE=;
 b=YaA8VRtUK+iIl6cBZe9uOR0+me09g6RYGUllwhAzQDLkqqpl5KL08khZ4MAYXhU6/E
 +kxdLVIEs0xGEw9yM8OKI+/11p22xgob+b7QPgLXcTvJYkoJo/SWwLBJRiT2zJgOqTTx
 LW6sQ67+Rucxk24VUNDUco20LAoTu55NMLVotn1zwPgKNWNOQPdMqZFCWq/Aksv4noUn
 KMBZfEWQDZx/Is2FljzzwadBdDJ+Xx5aehfTo9BRoRWH9bjsEHshzN1QJniFe3FMPfmL
 UgY+5Rt6Xk5bnRlcVg+KTet+dGuUrz6OaMApwyEshI78h9oKUUPCjk8JvgnZcHtokCf7
 fQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rkYzGaKYtcgJzrd8rxQCICVltYGsIDYYTqDHFCgv/PE=;
 b=dL4Ew7yXZqhNRhPaw/n/7O6vuxvdo+frUvHLWy2bkKBg3lBVjItlPtSpvOSzmVHWJA
 W2SslqG8n3Izkl/CLZpS+sRlWcyd1H0Owgyl3s3OafkYVz2X50mfJNYvZaPPIBfGal+7
 a7xtFA934zEM1fGG74P8Z/Zmfo1TNfaFGh0rqpy59YSeeX9h/xzXiaTqPoeO6Vu34naJ
 O05AZpJTb8PyGjxWH05YEtGXN/V7soDqKvIckjC/GqHwyKbQUicXwi78qXHBn5OPDaQU
 PTINAiWFteA2OKGM+HlO46rwT/nAgRnbgilBGAl1TCzmydDuvZv26OSrlvf1a6wrq5sj
 jTFg==
X-Gm-Message-State: AOAM530RriZ+o1tSGUGSmKn8Wbq1ZNiqlYx0fd0MFgDXhLvIges3Gm7C
 ayDVXmhlAvTTtpFOE2bOm5oSV+TVj5i8AshMeQA=
X-Google-Smtp-Source: ABdhPJz4qk7M7qbcN3RyX8GqU1TJ+GOMG5l8VivGV0OFD+K1aVBufZBR8oAnUQJ86amzXPJBV/ctHDCPMtf78AKwCIw=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr18699152otg.311.1606774070647; 
 Mon, 30 Nov 2020 14:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-8-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:07:39 -0500
Message-ID: <CADnq5_PVL12Jp_vjTvxUd0VF=NbLoDQ0dOcHCP5PM1ngSKjo8A@mail.gmail.com>
Subject: Re: [PATCH 07/40] drm/amd/amdgpu/amdgpu_psp: Make local function
 'parse_ta_bin_descriptor' static
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYzoy
NTc2OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcGFyc2VfdGFfYmlu
X2Rlc2NyaXB0b3LigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFw
cGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYwo+IGluZGV4IDc0Y2JhZjIxMjY5ODIuLjkxMGU4OWRjMzI0YjggMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gQEAgLTI1NzMsOSArMjU3Myw5IEBAIGlu
dCBwc3BfaW5pdF9zb3NfbWljcm9jb2RlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAo+ICAgICAg
ICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4gLWludCBwYXJzZV90YV9iaW5fZGVzY3JpcHRvcihzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IHRhX2Z3X2Jpbl9kZXNjICpkZXNjLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgdGFfZmlybXdhcmVfaGVhZGVyX3YyXzAgKnRhX2hkcikKPiArc3RhdGlj
IGludCBwYXJzZV90YV9iaW5fZGVzY3JpcHRvcihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB0YV9md19iaW5f
ZGVzYyAqZGVzYywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCB0YV9maXJtd2FyZV9oZWFkZXJfdjJfMCAqdGFfaGRyKQo+ICB7Cj4gICAgICAgICB1aW50
OF90ICp1Y29kZV9zdGFydF9hZGRyICA9IE5VTEw7Cj4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
