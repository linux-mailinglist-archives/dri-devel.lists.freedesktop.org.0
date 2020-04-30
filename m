Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D31BF8E6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54866E878;
	Thu, 30 Apr 2020 13:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A716E867;
 Thu, 30 Apr 2020 13:07:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so6830579wrq.2;
 Thu, 30 Apr 2020 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r2zMCHRUtF+mE5GucpvjJFnk2Pxvthpofls0YhRLkEw=;
 b=C1EL0yf7KXgCZcsk84Bkd1J2owoJwF9iAeYN43hscjO23C8fHCzG7Ea6EKAJ2Q4EBw
 Fcbk4gByspWdvhAMy1RcmcwmTAX0SDkwquahPyjeUgnNj5wiopVEK0RTvWZHSQJpGqTZ
 dw8TpUXv7ylR0gNtsIffFD/0P5p1i+gH+5NywLwE/gnB+Dx1j46igzv4BlxdAK/uQ/zQ
 +ktVk+FW6mN2wBM60dBjWOMz5BabB24YWjTScTEcTmhRTYI3kzVrXb4YbTvW9tyuIP0c
 BhzsRg+tT+NUXNU4SJZn5WHStMc6QYOEMP3rE2atHO9t5mJ8gkUzGCcvI9dAFOUdYD8x
 9icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r2zMCHRUtF+mE5GucpvjJFnk2Pxvthpofls0YhRLkEw=;
 b=Nm6WXmMjOSLQTdSJOb+tzlwnE4D0vFrtUk+OzXhbtS7HXBP8BzWFnJzX7JCZGTIc9T
 vobwtrTKzSQg8EFKn5Di+TyesUMG0SBiUO1JsuVVIPaDVR1C7ji7UOt11Bot4EK3kOt2
 fR/TmrOmAABnOpFcX+qtFbEh0KprboabsWus1p+0ONfKiVLzTqCNvTWjJM1N5suDxwJY
 SbvS62Dz1tXJI++nZ3Gcajom0DqIogJaxYIFpBWprYanfKmLK2nmaYJdrR2SUCDo1Aiq
 gFkw1wna1rVveTQzC5moNKmamtX3mi4HXiu4H391ujvie9w8h8i6iv8H/VCqCvsqKaBv
 iakQ==
X-Gm-Message-State: AGi0PuaOr0Kt6Yj/9afG9IsPo7QQ8MmtEU4BrwNG2RDiYQ+45fSs8wEi
 YDCt3+6Fv9+xewqp380oGEe0HHV6
X-Google-Smtp-Source: APiQypLdSHa2Tl9RAcLe8Y4V3Ep0F0NuSEKNDDaG/rHKeRSjgYTQ6bOyhJ8xkgZ1+ruOCK3NqzdjJQ==
X-Received: by 2002:a5d:4404:: with SMTP id z4mr3769257wrq.316.1588252028432; 
 Thu, 30 Apr 2020 06:07:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p190sm12315521wmp.38.2020.04.30.06.07.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2020 06:07:07 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm/amdgpu: remove set but not used variables
To: Zheng Bin <zhengbin13@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200430022653.46365-1-zhengbin13@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <38e64a9c-53e4-6010-2d90-3c22d32e6c79@gmail.com>
Date: Thu, 30 Apr 2020 15:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200430022653.46365-1-zhengbin13@huawei.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
Zm9yIHRoZSBzZXJpZXMuCgpBbSAzMC4wNC4yMCB1bSAwNDoyNiBzY2hyaWViIFpoZW5nIEJpbjoK
PiBaaGVuZyBCaW4gKDMpOgo+ICAgIGRybS9hbWRncHU6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2Vk
IHZhcmlhYmxlICdwcmlvcml0eScKPiAgICBkcm0vYW1kZ3B1OiByZW1vdmUgc2V0IGJ1dCBub3Qg
dXNlZCB2YXJpYWJsZSAnZGlyZWN0X3BvbGwnIGluCj4gICAgICB2Y25fdjJfMC5jCj4gICAgZHJt
L2FtZGdwdTogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ2RpcmVjdF9wb2xsJyBp
bgo+ICAgICAgdmNuX3YyXzUuYwo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYyB8IDIgLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMg
IHwgMyAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgIHwgMiAt
LQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjI2LjAuMTA2
Lmc5ZmFkZWRkCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
