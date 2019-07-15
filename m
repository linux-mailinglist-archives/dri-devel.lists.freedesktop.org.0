Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05938692F1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 16:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FAC89971;
	Mon, 15 Jul 2019 14:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71B089991
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:40:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 190312148D;
 Mon, 15 Jul 2019 10:40:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 15 Jul 2019 10:40:46 -0400
X-ME-Sender: <xms:bZAsXVQR4Izb3YmjCdSIbsAwsZ2vP7AqunbQmw3fwxL_33cunwdLWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheekgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhjgfvuffkffgfgggtgfesthekredttdefjeenucfhrhhomheplfgrnhgpufgv
 sggrshhtihgrnhgpifpnthhtvgcuoehlihhnuhigsehjrghsvghgrdhnvghtqeenucfkph
 epiedtrdejuddrieefrdejheenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugies
 jhgrshgvghdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bZAsXWcILkphFbn4FgZVYwmZJQMc-2UNkghwz3JeCaMf0XMpI07xPw>
 <xmx:bZAsXQq0uEfOudhjryqjFE-ejS_wRkUQxf-kCKoXtdrOIBctWMjxJQ>
 <xmx:bZAsXebmb_vR7nsY9RmrbFgfiQdugjC6mL_m5rEwBTZXTZq1GFMSQg>
 <xmx:bpAsXZYYhskP3tLpzoaWt1nmm5mzOFlM-jbcv66qCxREh-xB1_0Puw>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id 10EA180061;
 Mon, 15 Jul 2019 10:40:44 -0400 (EDT)
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
In-Reply-To: <1562833913-10510-2-git-send-email-preid@electromag.com.au>
To: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/2] Staging: fbtft: Fix probing of gpio descriptor
Message-ID: <5a367a21-deca-2330-dae4-d7a868648cf3@jaseg.net>
Date: Mon, 15 Jul 2019 23:40:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 from:in-reply-to:cc:to:subject:message-id:date:mime-version
 :content-type:content-transfer-encoding; s=fm3; bh=y9CcQsBGG5CnN
 rCRHUTMw0eniRJjB3/Dcznr2NVy3hA=; b=nNeH++LWMS8HIFy6/z0wpKpJalTt6
 e99Y4NBWRkRnJ002h7JoTKqmT+VNIWL9a5JFomPyhvLpneDelbHZ+2GgvIOaLPhP
 Mj1YmXGyN4PKofaazyRLE1P65OV8YeviZuMeJIV1XnrIxOqnszmBpxj11kUJJNOL
 BrE1LP7nqcGfivgYtEpsEePKQV+k4l5/A4dZpldlNW1ggWbegbxoML7F1RSOJ27x
 o6s0iB43Px09EIU88gXpzUHZW4yfTi8NN4rGbxzx4soXLDhDXd6JT5avMn0x971Z
 NBIWCQZB25OXEv6NYIhGoMD47QABur5sgdAGetGw+umAiCS4smQbGpqJw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=y9CcQsBGG5CnNrCRHUTMw0eniRJjB3/Dcznr2NVy3hA=; b=V7Gpr7Oy
 zXpCsy6K/dOCYNW1lcDFo221N3LehwbNdm1gKQL+7IFFUtZ+zqWMdkcQl+thnf1T
 jF1InZpVNJ5uXKtRyMP74aayDE0u196DCnTr8nslWrpnYd6M9s9Vm4qgtZattgag
 vkInoMU6uXj520Fq0TIC35FIBk+xkPYnHcF6QvACY4yQXxgCUPT+cf5FKs1rIf0P
 ss4eOeoD/KtalNixLGfaNkPxcBWiP8BcfRc1tb2bWXSkNsi2/SWXq7yz6shXvIEd
 tSQn4tiIMKs1QCSPYHg/enphNjjglk/+Q7Rjtk5fhmliIHs2QgscEZPx8WWz2Ldj
 gxs9gIpj1khdMA==
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
bHkuCgpSZWdhcmRzLCBKYW4KCk9uIEp1bHkgMTEsIDIwMTksIDg6MzEgYS5tLiwgUGhpbCBSZWlk
IHdyb3RlOgo+IENvbnZlcnNpb24gdG8gdXNlIGdwaW8gZGVzY3JpcHRvcnMgYnJva2UgYWxsIGdw
aW8gbG9va3VwcyBhcwo+IGRldm1fZ3Bpb2RfZ2V0X2luZGV4IHdhcyBjb252ZXJ0ZWQgdG8gdXNl
IGRldi0+ZHJpdmVyLT5uYW1lIGZvcgo+IHRoZSBncGlvIG5hbWUgbG9va3VwLiBGaXggdGhpcyBi
eSB1c2luZyB0aGUgbmFtZSBwYXJhbS4gSW4KPiBhZGRpdGlvbiBncGlvZF9nZXQgcG9zdC1maXhl
cyB0aGUgLWdwaW9zIHRvIHRoZSBuYW1lIHNvIHRoYXQKPiBzaG91bGRuJ3QgYmUgaW5jbHVkZWQg
aW4gdGhlIGNhbGwuIEhvd2V2ZXIgdGhpcyB0aGVuIGJyZWFrcyB0aGUKPiBvZl9maW5kX3Byb3Bl
cnR5IGNhbGwgdG8gc2VlIGlmIHRoZSBncGlvIGVudHJ5IGV4aXN0cyBhcyBhbGwKPiBmYnRmdCB0
cmVhdHMgYWxsIGdwaW9zIGFzIG9wdGlvbmFsLiBTbyB1c2UgZGV2bV9ncGlvZF9nZXRfaW5kZXhf
b3B0aW9uYWwKPiBpbnN0ZWFkIHdoaWNoIGFjaGlldmVzIHRoZSBzYW1lIHRoaW5nIGFuZCBpcyBz
aW1wbGVyLgo+IAo+IE5pc2hhZCBjb25maXJtZWQgdGhlIGNoYW5nZXMgd2hlcmUgb25seSBldmVy
IGNvbXBpbGUgdGVzdGVkLgo+IAo+IEZpeGVzOiBjNDQwZWVlMWE3YTEgKCJTdGFnaW5nOiBmYnRm
dDogU3dpdGNoIHRvIHRoZSBncGlvIGRlc2NyaXB0b3IgaW50ZXJmYWNlIikKPiBTaWduZWQtb2Zm
LWJ5OiBQaGlsIFJlaWQgPHByZWlkQGVsZWN0cm9tYWcuY29tLmF1Pgo+IC0tLQo+ICBkcml2ZXJz
L3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jIHwgMzkgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIxIGRl
bGV0aW9ucygtKQoKVGVzdGVkLWJ5OiBKYW4gU2ViYXN0aWFuIEfDtnR0ZSA8bGludXhAamFzZWcu
bmV0PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
