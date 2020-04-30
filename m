Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60431C0EA3
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C104C6EA6C;
	Fri,  1 May 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A26EA6A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1588247784;
 bh=VGV4Fw2sNEq8D8bF6x0dfHewG3Zs/VQNCW6HfTq7oas=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=mhEJE/AaHsHvaVu9RVBT9dwFLjcJo5t6iZUYYxWJbGXHUH1zpxE91K8oHzdVMO7Jh
 YQjbXIUASjX6mioywyIoxm6LNfoDqJlbBidHJqKeeluAMwnHGNeji7J3z2t9HVLeRx
 0fZM2W+fcniXTuJ8ErOJL/+v2tGFT6RUvAUU5xQw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.175.216]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MfTx5-1jnh7j2qRH-00P6vk; Thu, 30
 Apr 2020 13:56:24 +0200
To: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/mcde: dsi: Fix return value check in
 mcde_dsi_bind()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <fa72cc36-0204-fb82-6c62-ae43cb13260f@web.de>
Date: Thu, 30 Apr 2020 13:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:DEI4Ybf3QGbHW/g9A85zayyrGSS3EiwDmRWhy/cGQi/v71ixJv0
 h/uIVuRARce4Y/Cu3ZMNS0x2Zcsa8ztjIESVy6ZTLJ+DE9t2OUSCXS2m50NYcu/HMcrLPtN
 f4X3rD6heutw1MmSp3Pp1jadIO3YSMWtQOvPf2bD53dhbDGgLWKXw1mhg3kPOsErXuzXe+q
 WNyQFPhUuLKlizJXkm9IQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xN50rvvqBe4=:HxdsD/5Nqi7bKsX4PBTDZA
 +5PbDC4/+513BCUXDMJW5nZcBdC87JU40ASscwAOnNtEpxcaG7Khqg0eItCeeb1pNvO7o+HS7
 Ugl5V/7EeJgN/0oCc6Ukfe8YubusxPeh9Jmv4vdUPBttPdoBb9FcIl2h0nu6u4JTsLNa6U/qn
 RZfQBpcBCbNXsAwkDKnct2j91pL+h+hdvmi85kCYuFmciaoiGXmyz3xuzLFBvSrIEZRlVpSu1
 5s0PmWyuffEFVnKu1HjJpCs7/Uga0oiu7mHBf0GDE44YcBD/ZMFNg/Fqer9u3gyW2+xqIbbrY
 u1LpX8pFxTN8xhaRSDepmg/FLvaqBW3H9zgDSTsmtic52+CmaadQ0YP8IEicmTgiST9zwg1q1
 wex9dQPvZK5yHElXC/gPANNdqrwiNGE8lt0HchdwP0UfXY9lI+POhFGfMBHyMZrAc4RnVuRSV
 xPEruE3RLyQ2ElL08VFkwr7H+uGLYcMSv8zgJXAZM/NcP/HEhXND6boeRAUQESHMAK5ItO7Ab
 IGXrLyXi5ZwzrZMZuCblHx/xOia90uILxQIDCViMYEIUEsi3bm7qSTAwRN1wTEJozOd5qtQ5y
 rol+CXKdd958IQrjscRjelnLK+7+wBF6grDgQh0JLMKHBcMJRpa6+lO8wImbppES4uWuW95t2
 xDiXbOalOtIC8n5+10Lna3VXQaF2nf3deFcQWgoU+YC8A4MssRWqHtXfBikcxtU4EevvTQTUj
 OH9F9PmxzOMaUeysbLMNO/Px+ctUBWIVq6l82SOqN7VpE66/S7CVPNbhR4xkffOYBDdpH3MvS
 ttWfmfrGwwa3nHN+rOo5rPMqzGph+pdam9sfSIu4UIC50w3oD7Gdw10Yc+XO4RsWRj7p9gLc4
 aQoGNvoQdlst9GzPeJIRR+JhBih7mX18I9Ak2qPG13Wf3L48lWYaG02KN23SzV4gfLUTT/HA1
 A0UpbqsSxbJ1jEOjkCex2mxRay8iUtgjZciP93qDvM3eDGBs17qwozSSzRKr3pPBN9Ab48CGL
 LYQztoxVh+K19KAR5wXbNcuq5SlIcWYxrRMWMWppHkCUTienCqaEZCCCX7t7hPeazrXpMRVM5
 +s08nL5ZVMO2j8MP1qFSwkyjsMrKzeYIrXS0BHrBvfDytiFMDkU1CbWSZtYgG6jYaYc+FIpyX
 0MiIFV+ZAr8nIMseTYzbuvQj5cm3fk5e2LI8HV73SrV2qEVVaoqBfdI9p2ZjI0CUeEpabyCdb
 Mo5oroFHyXKygpndD
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgZnVuY3Rpb24gcmV0dXJucyBOVUxMIG9uIGVycm9y
LCBpdCBkb2Vzbid0IHJldHVybgo+IGVycm9yIHBvaW50ZXJzIHNvIHRoaXMgY2hlY2sgZG9lc24n
dCB3b3JrLgoKSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdvcmRpbmcgdmFyaWFudCBsaWtlIHRo
ZSBmb2xsb3dpbmc/CgogICBDaGFuZ2UgZGVzY3JpcHRpb246CiAgIEFuIGVycm9yIHBvaW50ZXIg
Y2hlY2sgd2FzIHBlcmZvcm1lZCBhZnRlciBhIGNhbGwgb2YgdGhlCiAgIGZ1bmN0aW9uIOKAnG9m
X2RybV9maW5kX2JyaWRnZeKAnSBkZXNwaXRlIG9mIHRoZSBkZXRhaWwKICAgdGhhdCBmYWlsdXJl
cyBhcmUgaW5kaWNhdGVkIGZvciB0aGUgYnJpZGdlIHNlYXJjaAogICBieSBudWxsIHBvaW50ZXJz
IGluc3RlYWQuCiAgIFRodXMgYWRqdXN0IGEgY2hlY2sgZm9yIHRoZSBmYWlsdXJlIHByZWRpY2F0
ZQogICBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgZXhjZXB0aW9uIGhhbmRsaW5nLgoKClJlZ2FyZHMs
Ck1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
