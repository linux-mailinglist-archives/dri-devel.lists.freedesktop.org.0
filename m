Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D7692F0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 16:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3658996E;
	Mon, 15 Jul 2019 14:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80538996E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:40:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C1232229F;
 Mon, 15 Jul 2019 10:40:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 15 Jul 2019 10:40:43 -0400
X-ME-Sender: <xms:apAsXWwsv4cY4ENIy7N3HTpea5GYgvwW003oCzFdIAvdmP-yUlHwKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheekgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhjgfvuffkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:apAsXaGtL0jM7bZyovCbgIoknF_sXbviWp0yGBggPlLH0HZm84jyew>
 <xmx:apAsXTss_Kpfoc02DuJdkh6MQuIcZ-bH9ROibIgBNQmK6CRy9_ELRA>
 <xmx:apAsXWUvRHjPLoyR-9rLUkXn5Fd7olYsq7AlCoJWnF29VC8rOEcGpA>
 <xmx:a5AsXeR8pyTQMGYovuLKHFFc7Kz4TVfuhpABAXJqfkZwAV8TuNKJkQ>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24E0180063;
 Mon, 15 Jul 2019 10:40:40 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
In-Reply-To: <1562833913-10510-3-git-send-email-preid@electromag.com.au>
To: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 2/2] Staging: fbtft: Fix reset assertion when using gpio
 descriptor
Message-ID: <8bea632a-ee51-8e4e-a663-22ee431372d7@jaseg.net>
Date: Mon, 15 Jul 2019 23:40:37 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:in-reply-to:cc:to:subject:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=GC+lruh1d70sg
 jJu3BfC7BAwb8abeufZRhfkLjFT9Mc=; b=e2mvAbacU1riC7bfAvTVvPC12EUgC
 SkcZBF9asZ/wZBmQYkbYmYBMHMpC+YG75LcnuiYI04ieLkobHEkCXfNv3FQZtceG
 zMix792xNlHDmTbglcc+bbrmL8F30yn6p33J7mLIzB7FBGM7uvDHJ41HIwHvZ3MW
 gOj4ZAavKZVtuE/V+6E4c6YD2AhHkIxE/ZNIhSm0FLpxxiVkrO7F9iRWpj4tZngQ
 l5RGK7IuSq2rkerNe/Q4Fv8pgfM+covakQm6MdZqBqVFTdwZbkgZVgJ1GfuybZH5
 2TlbLIzRe4xhO2mu+t2bzojHZvYCXFhg99ZjArtnpJcdxEVW+yjmPmRmw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=GC+lruh1d70sgjJu3BfC7BAwb8abeufZRhfkLjFT9Mc=; b=LriO2xOa
 yellp9ZuOTrA1ynL90XBTZeVIC2wG+vy2RC0emKU2IjrSD6MDmA3NvrzAzbOakI5
 t6JBWwfyeeXBhwmEU3NDMQW0vNCda2syoUWOAjG/z6KI8n8s3tXY6gIm3MReyN85
 c6eMFLjcioOMAk2t2JozC6i+nrpxAf9xBQqtu+5xBeyaf6g5WGgdyBjkfq8QLP2S
 +v57qogLPj6Ot5NrACOhVhr07R3WONeL3xxBuXRSrmbWbNhOrYqezKvzbqav+Kdt
 IAKJsl5agy6bkj7meBEiMdSHPX0OMVFD2+XD5yLGpn+eioqWU/IupmFJaqmQ4Yxz
 VGzkTlk4a9Qt9g==
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
Cc: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBoYXZlIHRlc3RlZCB0aGVzZSBjaGFuZ2VzIG9uIGFuIGlsaTk0ODYtYmFzZWQgZGlzcGxheSBj
b25uZWN0ZWQgdGhyb3VnaCBTUEkgdG8gYSByYXNwYmVycnkgcGkgYW5kIGNhbiBjb25maXJtIHRo
ZXkgd29yayBpbiBjb21iaW5hdGlvbiB3aXRoIGFub3RoZXIgcGF0Y2ggSSdsbCBzZW5kIHNob3J0
bHkuIEkgb25seSBoYWQgdG8gZml4IHRoZSByZXNldCBwaW4gcG9sYXJpdHkgaW4gdGhlIGRldmlj
ZSB0cmVlIG92ZXJsYXkgSSB1c2VkLgoKUmVnYXJkcywgSmFuCgpPbiBKdWx5IDExLCAyMDE5LCA4
OjMxIGEubS4sIFBoaWwgUmVpZCB3cm90ZToKPiBUeXBpY2FsbHkgZ3Bpb2Rfc2V0X3ZhbHVlIGNh
bGxzIHdvdWxkIGFzc2VydCB0aGUgcmVzZXQgbGluZSBhbmQKPiB0aGVuIHJlbGVhc2UgaXQgdXNp
bmcgdGhlIHN5bWFudGljcyBvZjoKPiAJZ3Bpb2Rfc2V0X3ZhbHVlKHBhci0+Z3Bpby5yZXNldCwg
MCk7Cj4gCS4uLiBkZWxheQo+IAlncGlvZF9zZXRfdmFsdWUocGFyLT5ncGlvLnJlc2V0LCAxKTsK
PiBBbmQgdGhlIGdwaW8gYmluZGluZyB3b3VsZCBzcGVjaWZ5IHRoZSBwb2xhcml0eS4KPiAKPiBQ
cmlvciB0byBjb252ZXJzaW9uIHRvIGdwaW9kIGNhbGxzIHRoZSBwb2xhcml0eSBpbiB0aGUgRFQK
PiB3YXMgaWdub3JlZCBhbmQgYXNzdW1lZCB0byBiZSBhY3RpdmUgbG93LiBGaXggaXQgc28gdGhh
dAo+IERUIHBvbGFyaXR5IGlzIHJlc3BlY3RlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIFJl
aWQgPHByZWlkQGVsZWN0cm9tYWcuY29tLmF1Pgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZmJ0
ZnQvZmJ0ZnQtY29yZS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpUZXN0ZWQtYnk6IEphbiBTZWJhc3RpYW4gR8O2dHRlIDxsaW51
eEBqYXNlZy5uZXQ+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
