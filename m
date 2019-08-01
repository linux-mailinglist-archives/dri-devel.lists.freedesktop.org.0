Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A77D63E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 09:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB466E3B7;
	Thu,  1 Aug 2019 07:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB06E3B7;
 Thu,  1 Aug 2019 07:26:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s3so63431670wms.2;
 Thu, 01 Aug 2019 00:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ECUhAV5AVJawfiPabhs7SobSHixs1aZdZMgv0q/JZ/w=;
 b=M63jrps2pUFm1OFlkFqOh8b5q12Gcp2xrzaKQO7JNPCqpm2/7PHdj3MVJt7GbmJaVD
 WL/FeU7ejvD0FUR654XeWs1jpp0sCILycN+Nv3bguGzk3yns3sU6TBficqU292NTNQ8N
 fXB3BNXMgeiaOqlqtEJuR74ULw902m5MmGg4VSbGq17SptJ/v8V+m6NDEHCzqKzuOagN
 NkboFXSxmlHmZ8qIGvrzK1MCrMA+a4k0DQnGNp5N7Ris+V17+Y4MtMwR1ByloaJSGHx1
 kMCwbVUjrcNQ3LupUC3WPpUbWTJRFxvyljymxlEHceebjBIpIaBOED8FjzpR5fyS/Dcf
 hkHA==
X-Gm-Message-State: APjAAAUt+h0Zjiwc4HJB3jhuA1jyzmWTYz+Y5y0Y8WwYJJXAznh+Yc0X
 06cCy9YB90s5fufK+CaysBA=
X-Google-Smtp-Source: APXvYqzAnGcWp9SmWSwmYTZXFVmpAXjyZtvt3C9QVH+6X9AEqV4+a53xL3x1F3zdu3S9Bhi2+773vA==
X-Received: by 2002:a1c:6555:: with SMTP id
 z82mr117728064wmb.129.1564644367300; 
 Thu, 01 Aug 2019 00:26:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f17sm66832275wmf.27.2019.08.01.00.26.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 00:26:06 -0700 (PDT)
Subject: Re: [PATCH 1/8] drm/amdgpu: drop drmP.h in amdgpu_amdkfd_arcturus.c
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20190731155246.20603-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <79ee5518-fa3c-27ae-ab8e-e3ebd39508f9@gmail.com>
Date: Thu, 1 Aug 2019 09:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ECUhAV5AVJawfiPabhs7SobSHixs1aZdZMgv0q/JZ/w=;
 b=TIVdbgL4jTyV9+9K6jvIkRD0G58FNgE9Lee/zPBHvt7w3ldZdJe40PUIuOlS2iELR6
 lvda9K3ivMQ6WWstJWACAaWQMn+LbH9H9Yw3Tbda5Vj3l5uFdJQItKwDP9QmMm65dGD6
 HR41R2mxrSewogrg5cjSw53FzSUDdyQAJCvzo24mLrzXqpEZvTggu9SOc1K36ZNZ7ChR
 shsF75l7Tajk6TUG8X1NLbZZBOG7wEHbxA6vwzhEfOZ1X2xUxJ26tuTaEb0ir+loZdhb
 XbtwKD1WaObnVZHMP00UJcr1gcwWA4xIrr355igAQ2A5pzEE++DOvvKxzIIQL4zfyLuv
 HYjA==
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMTkgdW0gMTc6NTIgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gVW51c2VkLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoK
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
Zm9yIHRoZSB3aG9sZSAKc2VyaWVzLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfYXJjdHVydXMuYyB8IDEgLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2FyY3R1cnVzLmMKPiBpbmRleCA0ZDkxMDE4MzRiYTcuLmM3OWFhZWJlZWFmMCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2Fy
Y3R1cnVzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2FyY3R1cnVzLmMKPiBAQCAtMjgsNyArMjgsNiBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nl
c3MuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9tbXVfY29udGV4dC5oPgo+ICAgI2luY2x1ZGUgPGxp
bnV4L2Zpcm13YXJlLmg+Cj4gLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgo+ICAgI2luY2x1ZGUgImFt
ZGdwdS5oIgo+ICAgI2luY2x1ZGUgImFtZGdwdV9hbWRrZmQuaCIKPiAgICNpbmNsdWRlICJzZG1h
MC9zZG1hMF80XzJfMl9vZmZzZXQuaCIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
