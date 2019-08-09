Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1686F99
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 04:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7C6ECF1;
	Fri,  9 Aug 2019 02:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8E46ECED;
 Fri,  9 Aug 2019 02:29:49 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id p17so90749579ljg.1;
 Thu, 08 Aug 2019 19:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0guyx/ifRgZwafd9nC8tYO5QbekyD+xXEwuNKfx51pY=;
 b=V95j2m+ylxIgZn/4fg3hUpoQZovo27VUldZ6/ip0/lX5FjgMt9HUnE82ysKP2W43sL
 L0Ns/Qq+fa+XTH0IS4GU+8EXXCWQZFnIMQSwEs14Qbjvhe33cRtyWLvSaI4zL8g6nJo8
 h++QaOi9x2PScGFpWvIju/KO3Cw71vklAM42Amg+wb0H3I0hgyqqQ/WXZz5Kw2zM+c9C
 2XD2+VEhPE+/Oo0iyjlRLrWaQhxIw1fZU5odH0tsBH3OPLy81ffbr3Vk8nBH2abWLwlo
 U9oU0+PQzHp8efCPfP8x8TLHlUye28Vjhkf40llG8WZUJN77Ifh0zm8gPnyrVJ0AHU+f
 uzIg==
X-Gm-Message-State: APjAAAUoVPlZoa3KGMUqPK5gmtIlYJNXCcwAiXy9/gqpVXI7J7y7sNsw
 W/mmUdrEagtqXWX3kvQhaCgByfuvW7CIQKDpiqk=
X-Google-Smtp-Source: APXvYqzx1BZxYdjH/6/Bc+cYL426q6X1pLsRJNWMau9jogcbkT5qGZ6Bc8xd0y/mGEuZG8sEySvdpV+AAuQyQIPBo48=
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr10210557ljb.120.1565317787273; 
 Thu, 08 Aug 2019 19:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190806200306.23730-1-alexander.deucher@amd.com>
In-Reply-To: <20190806200306.23730-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Aug 2019 12:29:32 +1000
Message-ID: <CAPM=9tw8GPpnFaFVhduOdm9wx=+5niZ4pi-O_+Dbb7zaSnw8=g@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon, ttm drm-next-5.4
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0guyx/ifRgZwafd9nC8tYO5QbekyD+xXEwuNKfx51pY=;
 b=CdGMX4bx8ye/B39EaC9f9Lzz25SYd3z08ioiZ+l4qedJeCqlV7uyLsAlqwGrjeWgzK
 9ER4LdyfW6Lr2nZN2Kf/zdfo5SHov4hNZxhPulR913i/9TVKm8cNWTfPt+GfW/WCwcxl
 MQQQjWcPNdwKCyy9ynwF5cHNPdDgEBp39k6OUv/2bUwgEBt6oTaHPGQwLMgTaoSCpwdl
 U4pfsxt8V8kk5V2/LDddyONfTun8tL1g1sTP+Yp6av9rOwdwjs1KWZWutSGd5jU/Gp+j
 u/Pu25QM+nj1RVXrxGvQ2epdj5/3lHbt13K7TSrMQp07sMtCzFUeuNNfCEEMXDSEsD44
 7WEg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA3IEF1ZyAyMDE5IGF0IDA2OjAzLCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYXZlLCBEYW5pZWwsCj4KPiBUaGUgYmlnIHVwZGF0ZXMg
aGVyZSBhcmUgc3VwcG9ydCBmb3IgbmV3IGFzaWNzIChuYXZpMTQsIG5hdmkxMiwgYXJjdHVydXMp
LgoKVGhhbmtzIEFsZXgsIGJ1dCBkdWUgdG8gdGhlIHJlYWRxL3dyaXRlcSB0aGlzIGJyZWFrIG15
IGxvY2FsCnZhbGlkYXRpb24gYnVpbGRzIHdoaWNoIG1lYW5zIHdlIG5lZWQgdG8gbGFuZCBhIGZp
eCBmb3IgdGhhdCBzb21laG93CmZpcnN0LgoKQWxzbyB0aGlzIGlzIHByZXR0eSBjb25mbGljdCBo
YXBweSwgc28gaWYgeW91IHdhbnQgdG8gYmFja21lcmdlCjUuMy1yYzMgYmVmb3JlIHNlbmRpbmcg
aXQgSSB3b3VsZG4ndCBvYmplY3QgOi0pIChCdXQgSSB0aGluayBJIGZpZ3VyZWQKdGhlbSBhbGwg
b3V0KS4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
