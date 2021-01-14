Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D82F669F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EA76E0F0;
	Thu, 14 Jan 2021 17:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2B86E0F0;
 Thu, 14 Jan 2021 17:04:40 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id d8so5813677otq.6;
 Thu, 14 Jan 2021 09:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DcVRvQEK7ksubu7g+BB/M37uMUpdY8RBvVIUKA9uUCk=;
 b=Qb/35rVZ24JSH6+SSpdwffQ69oePR9MbcclY9d7TRIfrPOBODobGBlt7y9wR78Repb
 6Yze7DGyLsVcimBRs9o8cj6d8OTzXwbVb4evPuCHoc0FqBddRycYiLS255WdgGD0Sa8s
 LhKIDdVy6StZq5J60M+dQZEibkcY6dGm9MbEH2n2BWfTMrYztIrEdpZp+etF4S6WT5Fd
 k86RWyATyMG8W4I7utzTn+RaCNbc/TR+auD6smY5W5o/j31iDb1LiMqIUGtqoUo/7GK0
 AURrCOT38EdlLvH3BpY+Sq9c+A4fGxV2IJcTEXFrUJculfioSQHZX+VafN0Mywga5WZ0
 97xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DcVRvQEK7ksubu7g+BB/M37uMUpdY8RBvVIUKA9uUCk=;
 b=FFkkBqAvXF0Qfc68MUFvHo+mEIWLzVVbrcXr5MYDqUqI43fEMhKqmEV0YIgNt0dZGw
 i+xnII+vcV+IbGy5yC27ubikkOmCo094ztiYjGGcpG9OXt/EfcpDI8mcLlYeJa8Eq88P
 ScRyKQza+e2ocmeBavjULl859JqWRJ9GIwqHEcriTT2cLr9ZloHWYpEq0f0aPIoqJ6oY
 7V8QaC8lLkynbjJDnTLCCqaZNEYbBvTPThKeDOieqP+70rJYoWyDapn5O2TscVABHYoU
 S8tC3bMTeqd0Mlpm/nafz97o2Ab14h6Kn6ropIUiLnD+9iROpzAWCqd8uonc21ey+u+W
 +VvA==
X-Gm-Message-State: AOAM5339Uav8FC1F3BnjyssPYE21bAjp6+P/Bn/wObBkoENvxwpNLouN
 mv5rlV+82rR8/uoH1byhoROVDJvtc0gv4BVy5Cs=
X-Google-Smtp-Source: ABdhPJw+JlA063PAdoTTOEgSfyjqNQT04QxRsju0aUqbDUwPE10f33+nO6AG5esZksVrA15EMTbabwx+1GdJiwhuAXo=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr5433320ote.132.1610643879714; 
 Thu, 14 Jan 2021 09:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-4-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-4-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:04:28 -0500
Message-ID: <CADnq5_O_c1fEd6OFGsjvh09oZwGhaMg1yzVP8cm0NpJwgqERPw@mail.gmail.com>
Subject: Re: [PATCH 03/30] drm/amd/display/dmub/src/dmub_dcn30: Include our
 own header containing prototypes
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZG11
Yi9zcmMvZG11Yl9kY24zMC5jOjgzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBm
b3Ig4oCYZG11Yl9kY24zMF9iYWNrZG9vcl9sb2Fk4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kbXViL3NyYy9kbXViX2Rj
bjMwLmM6MTE4OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZG11Yl9k
Y24zMF9zZXR1cF93aW5kb3dz4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFr
aGFAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIvc3JjL2RtdWJfZGNuMzAuYyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZG11Yi9zcmMvZG11Yl9kY24zMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RtdWIvc3JjL2RtdWJfZGNuMzAuYwo+IGluZGV4IGYwMGRmMDJkZWQ4
MWIuLjdlNmY0ZGJhYmU0NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RtdWIvc3JjL2RtdWJfZGNuMzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kbXViL3NyYy9kbXViX2RjbjMwLmMKPiBAQCAtMjYsNiArMjYsNyBAQAo+ICAjaW5jbHVk
ZSAiLi4vZG11Yl9zcnYuaCIKPiAgI2luY2x1ZGUgImRtdWJfcmVnLmgiCj4gICNpbmNsdWRlICJk
bXViX2RjbjIwLmgiCj4gKyNpbmNsdWRlICJkbXViX2RjbjMwLmgiCj4KPiAgI2luY2x1ZGUgInNp
ZW5uYV9jaWNobGlkX2lwX29mZnNldC5oIgo+ICAjaW5jbHVkZSAiZGNuL2Rjbl8zXzBfMF9vZmZz
ZXQuaCIKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
