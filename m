Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD41E62C8
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666376E573;
	Thu, 28 May 2020 13:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494E46E573
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:51:33 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id t23so2050252vkt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Owau2ya3gC/56f2SKOWlhU4477LIjpRkozc6MVc36Qc=;
 b=GYmzIcOlqp0inV6/3Xbibkn3HMcVd4Kh3aWqiEsZZ+94U0XoqmKQnXEFW911vZoxe3
 tqwoC6vF9M01gE2dXUFrB+Ljfs9ALNwtqNC9lI8jyrz87h2pALKsg8cK2UUsJEFMMJ0r
 M3FtrtYW8asIwRfRjJAX4rJxdX5w5qBpjn8NA7VeL7Tp/dvhsVFNkGMcLkvXRq+e49nF
 LNFuGTCOJxOrHz3Ow2ouJpNFYbVUHcOSDg4F7DPUUSS/+Mz65uYZTDTXTbRBiPsWJcL6
 K3ch5G5007j8ORpqaJGFm3zvzMVfY69UTTqQoNyWodKbgqaCJ18Vly1x03KxSkVv8f2W
 oKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Owau2ya3gC/56f2SKOWlhU4477LIjpRkozc6MVc36Qc=;
 b=ry5DdAjEzGwYTLIEpFIBjs5pA7hZ5CP8XusI+/Pv8ffzw3zqsWJctUu+mZuRdGsVLu
 Gy1j+HN3W3dO6v5kHIaZs93dRZ58GpV+UkDtJ7BeAoKmQLNaWl8suiOfJkelutwuoPIj
 z7KCuaf+rqSYWgNrMiPS/MaHWU2UCzpOayP3bRKqCPDErpOV4jWv+EA+1+3/qZ6ikktk
 F4vL8IFsJfv7J2whyuePpDVjsLYIRrZqam9DUaRWg5k+GOkiakl661Whb3nKwWgSF7MB
 h5/I51Gz1+iN3zRC49LRlmsXsVZH35CJ88DjRUn91ImpDW/Q2FMDUhYJ/RHfGhjVVeIB
 5QDA==
X-Gm-Message-State: AOAM530RcRRCkWfQBVqCT3JyNl6FuZJ1rG5242HQFoRA80obsiK0t1X7
 /WQTk+RopAe6udxvV14A6eApZkpOo/PdkGuuMV8=
X-Google-Smtp-Source: ABdhPJz9rpEV9NefPJ4mvmUlFFoe/xH96S5Z/teq9tsa7Ud4tKk4G1rL0ay4Q3TiP/U4WG82nA4Rv2OPTseHsC+Qrrs=
X-Received: by 2002:a1f:9094:: with SMTP id s142mr2205245vkd.6.1590673892337; 
 Thu, 28 May 2020 06:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-4-noralf@tronnes.org>
In-Reply-To: <20200509141619.32970-4-noralf@tronnes.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 14:48:24 +0100
Message-ID: <CACvgo51Cq1ipV_K-NLk9QZ7d1Pweebz2ST6anqrT1q09r0+QEw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] drm/client: Add drm_client_framebuffer_flush()
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSSByZWFsaXNlIHRoaXMgaGFzIGxhbmRlZCwgc28gYSBzbWFsbCBGWUkgY29tbWVu
dC4KCk9uIFNhdCwgOSBNYXkgMjAyMCBhdCAxNToxNiwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+IHdyb3RlOgoKPiAraW50IGRybV9jbGllbnRfZnJhbWVidWZmZXJfZmx1c2go
c3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIsIHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkK
PiArewo+ICsgICAgICAgaWYgKCFidWZmZXIgfHwgIWJ1ZmZlci0+ZmIgfHwgIWJ1ZmZlci0+ZmIt
PmZ1bmNzLT5kaXJ0eSkKCkhtbSBjYW5ub3QgdGhpbmsgb2YgYSBnb29kIHJlYXNvbiB3aHkgYW55
b25lIHdvdWxkIGNhbGwgdGhpcyB3aXRoCiFidWZmZXIgfHwgIWJ1ZmZlci0+ZmI/Ck1pZ2h0IGJl
IGEgZ29vZCBpZGVhIHRvIFdBUk4gaW4gdGhvc2UgY2FzZXMgLSBvdGhlcndpc2UgdGhlIHVzZXIg
aXMKZ2l2ZW4gZmFsc2Ugc2Vuc2UgdG8gc2VjdXJpdHkuCgpMb29raW5nIGF0IHRoZSB1cGNvbWlu
ZyB1c2VyIChkcm0vZ3VkKSBpdCBhbHJlYWR5IGhhcyBib3RoIC0gc28gaXQncwpwZXJmZWN0bHkg
c2FmZS4KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
