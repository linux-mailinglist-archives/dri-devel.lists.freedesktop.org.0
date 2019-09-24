Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB9BD8FC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584266EB33;
	Wed, 25 Sep 2019 07:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874DB6EAFD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 21:03:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p7so1875606wmp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 14:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ch/LP+oIAIqtM8PqdGgeodMs4R43bcOkMn+/V+Nlf8I=;
 b=Rhcos62UGtEr/R0nWuWaSomy8un7RPDf4k38rcSG6XSdooT6OuYUWPypdAYiAQ0Cav
 tNe3h0rG49nhud4W5c78dm2kLuba8bwWWiwCPh07PXKRwbPdu+64HYDSRPt6OAmFxc4b
 PaxDnM2J38IT03wsIK3B4+hg8ECpgheWMJJ4u5jTzoQjmnPYnBBtMLMAePxPqk4pWSA7
 1c0+3qy8qumnvQmRTIZz6ttUf0+iuPwcIYHYeT6OGZ/JXWcpyt5wyl0XBaZnV4gOTcjJ
 ht3qGAUGbtGGzKNpbWqWEgJkxi6LPACyUu4u7lc6fcxZLxPGl4znZXuWFi43dNnVzZKm
 dG4g==
X-Gm-Message-State: APjAAAW+SRy1bymVEz+ARXBWcB2ui8+8A1vkeGdgVe/tqc70UhUBLF+i
 o0n0dW6KfYcnfQUh3pIVj0E=
X-Google-Smtp-Source: APXvYqw1r7WzfLU/E5+64DJ2RsjWvu2OQ4NhXaQXbYl+NsgV332Dj07FoKFLZ/BjORtSHQTJ0MsoCg==
X-Received: by 2002:a7b:c758:: with SMTP id w24mr2397200wmk.148.1569359020231; 
 Tue, 24 Sep 2019 14:03:40 -0700 (PDT)
Received: from [192.168.1.19] (bfw157.neoplus.adsl.tpnet.pl. [83.28.60.157])
 by smtp.gmail.com with ESMTPSA id a10sm3717500wrm.52.2019.09.24.14.03.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 14:03:39 -0700 (PDT)
Subject: Re: [PATCH v7 1/5] leds: populate the device's of_node when possible
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-2-jjhiblot@ti.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
Date: Tue, 24 Sep 2019 23:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918145730.22805-2-jjhiblot@ti.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ch/LP+oIAIqtM8PqdGgeodMs4R43bcOkMn+/V+Nlf8I=;
 b=q5uUeTQ1mJXE8Syc2wvenuw0swKpamqS4yXdBzoz+4WoQ5kvumXJClKB+ZlZreJUS+
 rf8BQ3y91GlbI+AHIhDEfSDnQx7KEYkeRK3sDpgW/oBVjHwYvmjqARxsQO8MAFaX28hL
 xWxr7hIWUxRkKkfeNUO8WYRjp4otDp+CxXNqzWPfFHVMNzC7RylI4bFfw0+to3PZnjhA
 5VTyaaKdg52nGtGg7bXlD9WGut0d6jPtQ01qGI0w6Fq0DFyOnGA5Su8gHavk1eLwD+1O
 dQNUrQL7T/azrdbyW6Ulfv0FKgIBhnIy+yzbSmvK17yfVo1GsX8etaELVQzYOdTeTsXe
 WY/g==
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
Cc: dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, dmurphy@ti.com,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVhbiwKClRoYW5rIHlvdSBmb3IgcmViYXNpbmcgdGhlIHNldAoKT24gOS8xOC8xOSA0OjU3
IFBNLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+IElmIGluaXRpYWxpemF0aW9uIGRhdGEg
aXMgYXZhaWxhYmxlIGFuZCBpdHMgZndub2RlIGlzIGFjdHVhbGx5IGEgb2Zfbm9kZSwKPiBzdG9y
ZSB0aGlzIGluZm9ybWF0aW9uIGluIHRoZSBsZWQgZGV2aWNlJ3Mgc3RydWN0dXJlLiBUaGlzIHdp
bGwgYWxsb3cgdGhlCj4gZGV2aWNlIHRvIHVzZSBvciBwcm92aWRlIE9GLWJhc2VkIEFQSSBzdWNo
IChkZXZtX3h4eCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampo
aWJsb3RAdGkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgfCA1ICsrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jIGIvZHJpdmVycy9sZWRzL2xlZC1j
bGFzcy5jCj4gaW5kZXggNjQ3YjEyNjNjNTc5Li5jMjE2N2I2NmI2MWYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCj4gKysrIGIvZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5j
Cj4gQEAgLTI3Niw4ICsyNzYsMTEgQEAgaW50IGxlZF9jbGFzc2Rldl9yZWdpc3Rlcl9leHQoc3Ry
dWN0IGRldmljZSAqcGFyZW50LAo+ICAJCW11dGV4X3VubG9jaygmbGVkX2NkZXYtPmxlZF9hY2Nl
c3MpOwo+ICAJCXJldHVybiBQVFJfRVJSKGxlZF9jZGV2LT5kZXYpOwo+ICAJfQo+IC0JaWYgKGlu
aXRfZGF0YSAmJiBpbml0X2RhdGEtPmZ3bm9kZSkKPiArCWlmIChpbml0X2RhdGEgJiYgaW5pdF9k
YXRhLT5md25vZGUpIHsKPiAgCQlsZWRfY2Rldi0+ZGV2LT5md25vZGUgPSBpbml0X2RhdGEtPmZ3
bm9kZTsKPiArCQlpZiAoaXNfb2Zfbm9kZShpbml0X2RhdGEtPmZ3bm9kZSkpCj4gKwkJCWxlZF9j
ZGV2LT5kZXYtPm9mX25vZGUgPSB0b19vZl9ub2RlKGluaXRfZGF0YS0+Zndub2RlKTsKCkl0IHdv
dWxkIGJlIHN0ZXAgYmFja3dhcmRzLiBZb3UgY2FuIGRvIHRoZSBjb252ZXJzaW9uIGluIHRoZSBw
bGFjZSBvZgp1c2UgaS5lLiBpbiBkZXZtX2xlZF9nZXQoKS4KCj4gKwl9Cj4gIAo+ICAJaWYgKHJl
dCkKPiAgCQlkZXZfd2FybihwYXJlbnQsICJMZWQgJXMgcmVuYW1lZCB0byAlcyBkdWUgdG8gbmFt
ZSBjb2xsaXNpb24iLAo+IAoKLS0gCkJlc3QgcmVnYXJkcywKSmFjZWsgQW5hc3pld3NraQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
