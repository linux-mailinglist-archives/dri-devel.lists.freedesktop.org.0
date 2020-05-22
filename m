Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B81DF659
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFF86E3F3;
	Sat, 23 May 2020 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27EC6E071
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:36:18 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y18so5345940pfl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lnZ2WUm5gsoHVGLrikaUs+9dOq4WzhfyiayZ5tcorxY=;
 b=QmiQilkrdsdW7escgA0eMPFnT4ESnOYHA3VvFSSsblONz8F3ljC5oJSjHRSN/Hk5Lz
 H+NK796zZH2R+HfLsSD+MZeu6Gndlde05bXvqHNHRYDgDvNwlvcxRe6Vv546gUbJru4Y
 Qc8RmxHxg5AbG2YJ+J2oof+brW9Bca6apzHVVxT5k/g+L4xXaDcMu815ZiePspVMkHbV
 TxFwE1cPBAUfsch9aGjwBiSomzCTwZGRQutpUyXE97tog3VabZEynqYltU7VA6uWdPnQ
 fQNLnx04gGbYnxS38RsDVol8zMAvtCedd1sKCPuIaZfhSTozJe7mbANv6ObPH6409u/J
 AKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lnZ2WUm5gsoHVGLrikaUs+9dOq4WzhfyiayZ5tcorxY=;
 b=agZeQiAIed8CYT1WWC5li6xSEAPjliJCZTmpWrrUeM6PsB/MxSv1KnIzsbHxw0M4j6
 fJat2yP1SW1JE004OYDFA27b6kopQ2caDHlbpZwTQDTFVhf96U8jfEy8N+F1gVts7f17
 zgoFWdou0nnxhSJDzcj5233KADmqz8kNyHePMKvzdZG9CIfBAJsn1SGDXnHyocruv1+N
 pzPEET+J003TK2cVD/TJ9v3Ovemp58GhCYCwwcpwuvx8TC/9TdAzu9lIyOAXPugvYpB8
 rsitdXRi3h8SodR61DjEUxyTQbi91ElBauvvB6aY2FToRljh8zAFOdDhVen+kmerExLJ
 UYHQ==
X-Gm-Message-State: AOAM532Oq013zlOJphBVTCP/BECG7fiBOdsF8UNbS5g+ZuLVwNn3VVEW
 X1NMjvYmFYcl505L1f/eeXU=
X-Google-Smtp-Source: ABdhPJxCwZDXgvMJcaOXUWcZ2PD97knGPGulsi1s9hQZScdEGIe+g4LIaYmUPWF2UsEdb50ExqvRQA==
X-Received: by 2002:a63:794a:: with SMTP id u71mr13725179pgc.89.1590161778568; 
 Fri, 22 May 2020 08:36:18 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id o25sm6395243pgn.84.2020.05.22.08.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:36:17 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-5-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <742a0b02-6958-608e-1e8e-6da2dbedb2f8@gmail.com>
Date: Fri, 22 May 2020 08:36:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-5-noltari@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA1LzIyLzIwMjAgNToxNSBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+
IEFkZGVkIGJyY20sYnJjbW5hbmQtdjIuMSBhbmQgYnJjbSxicmNtbmFuZC12Mi4yIGFzIHBvc3Np
YmxlIGNvbXBhdGlibGUKPiBzdHJpbmdzIHRvIHN1cHBvcnQgYnJjbW5hbmQgY29udHJvbGxlcnMg
djIuMSBhbmQgdjIuMi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMgPG5vbHRhcmlAZ21haWwuY29tPgoKQWNrZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFp
bmVsbGlAZ21haWwuY29tPgotLQpGbG9yaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
