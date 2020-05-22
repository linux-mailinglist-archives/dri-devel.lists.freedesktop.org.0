Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E5D1DF666
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA29F6EA4C;
	Sat, 23 May 2020 09:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6789F6E071
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:33:03 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d3so4540094pln.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3ilcLhqdRQ8Z/PzvBN+C3JsIPM0TNycFGq2+m/w7rOY=;
 b=hka3Aj+j1wlh/rLYg8FbS4/ueTrez8GlaFwP/YGgw5ZNFu81qO806MX6Ij/1TPJdfz
 Mfb1ctOvSjC8e1xnS7o8R4MrH6jCXI3v+kjNs6UWxGLt3m0libyHJeXu6EdJa1QePbJu
 25VKGQp4ERnmPqVlNGWuQIDRKg5EnuJORc0nC0buiCQwD4elhTHs7JXxN76m13KjIOgF
 26LDDzamoEfv6cBf45scUoFCT0tGOhInqL7qZpjKlr4rlutTkYHVQAW/c5Pmpf0O+a/k
 m0CtX/z7KDJ4uMy8lyKBPpxGbEYlaMBfcjD73FMyFE09o5z1uuwP4xbSfyzzjluK8kr2
 SJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ilcLhqdRQ8Z/PzvBN+C3JsIPM0TNycFGq2+m/w7rOY=;
 b=KplmZ1qkDA0Lueb4wnCE/UBawF54tOS0wu3F8kha+b/uB5O+8m91QgYEhaUOu3Osy1
 dTYwkOYJXRv4mrRLMtbW0npZd3gSPTK8L9zubo//ks2ILm6/lxWC8YuNTo3S7qEMpkTZ
 x5NWKs0jS9hgL29puRFismZ+KgMhnpi8A0oPFGKPE9IZMSaAYdT77wf9tlEsAdTl1s+g
 DZEPVoXDx7PW0yINTRnEIjbp38jLSoCm+1zg8YP2RGITNVp+FaFbpa5mxmDMmsmFP8Kp
 +weeWKH+JSLlTarl7hv/Bc7bmaY9QkkwBErRrahfXBZpoN6xWlrdQd0mpP1echx3GfnZ
 v7mg==
X-Gm-Message-State: AOAM531s35kn9+wOAk4vWFlmLixJ8cx7joChcOWg/K1l5MzTQh9Anj8s
 YGwkCF6zpax/ORXBrQ29+Ow=
X-Google-Smtp-Source: ABdhPJyBraQCp8grS+tg/y4C3LTcYKbBhKGr0X+WyySmbzdjk7B6wNgnWH0ZKj2fWGtRGzVtdLo4Dg==
X-Received: by 2002:a17:90a:248:: with SMTP id t8mr5568531pje.67.1590161582985; 
 Fri, 22 May 2020 08:33:02 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id z16sm6650992pfq.125.2020.05.22.08.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:33:02 -0700 (PDT)
Subject: Re: [PATCH v4 1/5] mtd: rawnand: brcmnand: rename v4 registers
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-2-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9568caad-9ac2-44be-d492-3e03f719b0d6@gmail.com>
Date: Fri, 22 May 2020 08:33:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-2-noltari@gmail.com>
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
IFRoZXNlIHJlZ2lzdGVycyBhcmUgYWxzbyB1c2VkIG9uIHYzLjMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPiBSZXZpZXdl
ZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCkFja2VkLWJ5
OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KLS0gCkZsb3JpYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
