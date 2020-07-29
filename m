Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF4232C52
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5376E86D;
	Thu, 30 Jul 2020 07:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6303C6E52F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:54:19 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a21so24636410ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=wEw1SR6DPbGGh4PQP13Jf+3gc4eNaUjMsZXlnx4MHz0=;
 b=OeAZhRpG8SXmO0xhUHWLmIOfjX5gqHikRUyRtfF9A2PWwJwjI5qcOuqW72EONMffjJ
 /Dmn05J43IkrboZmglA6Lx4LayvTE0dY412xCQU2iN6whDb436pEfIRS86ImKpokbsoB
 h9h8zDt/UlLsJOaDIeCvIBLZS5+EGx6SnNuG4hevWhI1UY+8gjEHo1vzTu7FdkbIJOEQ
 /Q94pA7Tunh/YTn/d4hyy/damUyblMZBHkjCsFmC10suHzONjJiHtleWV5seBQRFrFfH
 bJ/BLesByd2UD5o+BZ2lnQUsCAo0WoK1KCXOjrQesZHtZUBsPDorbxZtg9QOQEpeUQtQ
 etLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=wEw1SR6DPbGGh4PQP13Jf+3gc4eNaUjMsZXlnx4MHz0=;
 b=fJoyxWBoguBrh+gP33RpaUW4mpCyGdUGDsayfsFuPfhZQNS5QhcxJSLyQ+5YIj9iMA
 uYlfgwHmk7YKZYZQjVS/qU1wVWasAmT7hNEvNcQ8asMC/bMlNLRfvqoFCQQuJSKRVwEX
 CHc6etWkYCnpxARAh3KTsO3R8ggG2MKHbVi5K666S46DAyefYwvRy6BUqKv5h23oO59E
 m61UaHHkYCl50ePIXlwr+qqsO56VrQr/qwfCedZ8cZVush1y5NucPxQ3jz3AgbaHnGI/
 ef+ISF9IpLkCSaPQTePl701Rv8IAE0by09LNnc32yjXUFfwRgVXgYhbePst/i+RQ1hXD
 TeEQ==
X-Gm-Message-State: AOAM5331cVdxd3gIxV/jMk2Pr3/wNVRL8BchW2lWAiK32sWwitFaauwr
 EwqXjG2p0qMPT+JtXMxRwX+lL577
X-Google-Smtp-Source: ABdhPJwS4KempGKvWj/gbyjfByPZqx+iW0+wLylOl+CfhJ3cTxw7vjTXC0JW8cjGXbI2OK4mvT/eZQ==
X-Received: by 2002:a17:906:c2c8:: with SMTP id
 ch8mr2570447ejb.161.1596034457671; 
 Wed, 29 Jul 2020 07:54:17 -0700 (PDT)
Received: from [192.168.1.104] ([86.125.29.188])
 by smtp.gmail.com with ESMTPSA id p21sm2199613eds.11.2020.07.29.07.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 07:54:17 -0700 (PDT)
To: mripard@kernel.org, dri-devel@lists.freedesktop.org
From: Marius Iacob <themariusus@gmail.com>
Subject: [PATCH] Added orientation quirk for ASUS tablet model T103HAF
Message-ID: <7d86140e-cf6b-ba96-c6fd-02f4d3da246e@gmail.com>
Date: Wed, 29 Jul 2020 17:54:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IEZyb20gMDZiYTdkM2U2NGU1NTI2MmJmODE4MDg0OTA0ZWVjN2I3MzIwYTJhZCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogTWFyaXVzIElhY29iIDx0aGVtYXJpdXN1c0BnbWFpbC5jb20+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjAgMTY6NTE6NDEgKzAzMDAKU3ViamVjdDogW1BBVENIXSBB
ZGRlZCBvcmllbnRhdGlvbiBxdWlyayBmb3IgQVNVUyB0YWJsZXQgbW9kZWwgVDEwM0hBRgoKLS0t
CiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgfCA2ICsr
KysrKwogwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyAKYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCmluZGV4IGQwMGVhMzg0ZGNiZi4u
NThmNWRjMmY2ZGQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVu
dGF0aW9uX3F1aXJrcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRp
b25fcXVpcmtzLmMKQEAgLTEyMSw2ICsxMjEsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlf
c3lzdGVtX2lkIApvcmllbnRhdGlvbl9kYXRhW10gPSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiVDEwMUhBIiks
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwKIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2Q4MDB4MTI4MF9yaWdodHNpZGVf
dXAsCivCoMKgwqDCoMKgwqAgfSwge8KgwqDCoCAvKiBBc3VzIFQxMDNIQUYgKi8KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLm1hdGNoZXMgPSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJBU1VTVGVLIENPTVBV
VEVSIElOQy4iKSwKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERNSV9FWEFDVF9N
QVRDSChETUlfUFJPRFVDVF9OQU1FLCAiVDEwM0hBRiIpLAorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9LAorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZsY2Q4MDB4MTI4MF9yaWdodHNpZGVfdXAsCiDCoMKgwqDCoMKgwqDCoCB9LCB7wqDC
oMKgIC8qIEdQRCBNaWNyb1BDIChnZW5lcmljIHN0cmluZ3MsIGFsc28gbWF0Y2ggb24gYmlvcyAK
ZGF0ZSkgKi8KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubWF0Y2hlcyA9IHsKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNf
VkVORE9SLCAiRGVmYXVsdCBzdHJpbmciKSwKLS0KMi4yNy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
