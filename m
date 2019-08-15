Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606791162
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FDC6EA03;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2E86E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 19:13:57 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id go14so1118862plb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNJeuFDzXs0rm+EMxwm6cmYOjrrNXANuIfIgIQ8YbJg=;
 b=muhLCsivKNoHPN1a3a15cKddyhpItDpoJGE4ETf/Oay6wMAaewm7jzAFAd/J95rbdY
 ARQr1aYD4X0ZlMsBiKsHtOnfaTezOOLX+Tx6Bw3hjjMA7fYBmFuYFeh13cM8zO23mI2S
 scuPoz0WBcV4pm/iL6KXa6NkC7bMaL/pefAAzB+JyuvHjItW8VGNrgdFmET+vZ7IcDJi
 8dbzDmrdXaH4V9KaW9Z6A9VH9wadcClcMOpfuo1U3o3HXU8KGIGT/cREVkYpcSbZ8nil
 mG5ZygjbioG2Ep/ztG/xCE8aRFf0dEh2vZQSfAg1iURkE1ZDcRVRJr7oSdGjiNLH65pi
 VWkw==
X-Gm-Message-State: APjAAAUs81Miim9HAaByx9mNJ5/DXzyvBXhG/TJRDGS6p5LUxJZILeUQ
 OV07cuA1BsnG/7xFel6c3gca48jxeNgKfA==
X-Google-Smtp-Source: APXvYqzpYKBvyeZPLAbcVCmGcAeC2Yc1P7WJTIR8eam1vhmJlO7dkkuFb0uf4YkXBuBn1cXsbsQQww==
X-Received: by 2002:a17:902:1e3:: with SMTP id
 b90mr4817605plb.82.1565896437032; 
 Thu, 15 Aug 2019 12:13:57 -0700 (PDT)
Received: from [10.20.93.185] ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id e7sm3766417pfn.72.2019.08.15.12.13.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 12:13:56 -0700 (PDT)
From: Petr Vandrovec <petr@vandrovec.name>
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
To: Vlastimil Babka <vbabka@suse.cz>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
 <20190802225939.GE5597@bombadil.infradead.org>
 <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
 <45258da8-2ce7-68c2-1ba0-84f6c0e634b1@suse.cz>
Message-ID: <0287aace-fec1-d2d1-370f-657e80477717@vandrovec.name>
Date: Thu, 15 Aug 2019 12:13:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 PostboxApp/7.0.0b3
MIME-Version: 1.0
In-Reply-To: <45258da8-2ce7-68c2-1ba0-84f6c0e634b1@suse.cz>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNJeuFDzXs0rm+EMxwm6cmYOjrrNXANuIfIgIQ8YbJg=;
 b=Nyj+GThN3zZyehVt5lvY3xSjZYRcmeJvb6grL2eL2/dff25QEBk1yWfEnGoJzqwUW/
 8/CQoRbjZptIHDBG4jp62oiPJqKJMuzGUwPHOHduAQOHglRCytHCDjMdyERqD3QEDaoD
 sAuRS2tjGyXbTGJApMBGI+peWM/wk+pKQdvuWxdtj0sOuiNs43vWg6Kl1H1JCuF1YJCN
 d0d8GGACex1UXC+cVPm9LYFVBQX550QZG4fH3rI/+fxgpPGE59pJ0GeJmwe499IVAwQW
 ssb8RjLyT8I0v5PgMOxP0Oyjjw2bA21v3oHq2R92J07KFcBl1xHVJXRhuidxWtzPdz35
 ZUhQ==
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Qian Cai <cai@lca.pw>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Petr Vandrovec <petr@vandrovec.name>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vmxhc3RpbWlswqBCYWJrYcKgd3JvdGXCoG9uwqA4LzE1LzIwMTnCoDc6MzLCoEFNOgo+Cj4gRG9l
c8KgdGhlwqBpc3N1ZcKgc3RpbGzCoGhhcHBlbsKgd2l0aMKgcmM0P8KgQ291bGTCoHlvdcKgYXBw
bHnCoHRoZcKgM8KgYXR0YWNoZWQKPiBwYXRjaGVzwqAod29ya8KgaW7CoHByb2dyZXNzKSzCoGNv
bmZpZ3VyZS1lbmFibGXCoENPTkZJR19ERUJVR19QQUdFQUxMT0PCoGFuZAo+IENPTkZJR19QQUdF
X09XTkVSwqBhbmTCoGJvb3TCoGtlcm5lbMKgd2l0aMKgZGVidWdfcGFnZWFsbG9jPW9uwqBwYWdl
X293bmVyPW9uCj4gcGFyYW1ldGVycz/CoFRoYXTCoHNob3VsZMKgcHJpbnTCoHN0YWNrdHJhY2Vz
wqBvZsKgYWxsb2NhdGlvbsKgYW5kwqBmaXJzdAo+IGZyZWVpbmfCoChhc3N1bWluZ8KgdGhpc8Kg
aXPCoGHCoGRvdWJsZcKgZnJlZSkuCgpVbmZvcnR1bmF0ZWx5IC1yYzQgZG9lcyBub3QgZmluZCBh
bnkgbXkgU0FUQSBkaXNrcyBkdWUgdG8gc29tZSAKbWlzdW5kZXJzdGFuZGluZyBiZXR3ZWVuIEFI
Q0kgZHJpdmVyIGFuZCBIUFQ2NDJMIGFkYXB0ZXIgKHRoZXJlIGlzIG5vIApkZXZpY2XCoDA3OjAw
LjEswqBIUFTCoGlzwqBzaW5nbGUtZnVuY3Rpb27CoGRldmljZcKgYXTCoDA3OjAwLjApOgoKW8Kg
wqDCoDE4LjAwMzAxNV3CoHNjc2nCoGhvc3Q2OsKgYWhjaQpbwqDCoMKgMTguMDA2NjA1XcKgRE1B
UjrCoERSSEQ6wqBoYW5kbGluZ8KgZmF1bHTCoHN0YXR1c8KgcmVnwqAyClvCoMKgIDE4LjAwNjYx
OV0gRE1BUjogW0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzA3OjAwLjFdIGZhdWx0IGFkZHIg
CmZmZmUwMDAwwqBbZmF1bHTCoHJlYXNvbsKgMDJdwqBQcmVzZW50wqBiaXTCoGluwqBjb250ZXh0
wqBlbnRyecKgaXPCoGNsZWFyClvCoMKgwqAxOC4wNzY2MTZdwqBETUFSOsKgRFJIRDrCoGhhbmRs
aW5nwqBmYXVsdMKgc3RhdHVzwqByZWfCoDEwMgpbwqDCoCAxOC4wODU5MTBdIERNQVI6IFtETUEg
V3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswNzowMC4xXSBmYXVsdCBhZGRyIApmZmZhMDAwMMKgW2Zh
dWx0wqByZWFzb27CoDAyXcKgUHJlc2VudMKgYml0wqBpbsKgY29udGV4dMKgZW50cnnCoGlzwqBj
bGVhcgpbwqDCoMKgMTguMTAwOTg5XcKgRE1BUjrCoERSSEQ6wqBoYW5kbGluZ8KgZmF1bHTCoHN0
YXR1c8KgcmVnwqAyMDIKW8KgwqAgMTguMTEwOTg1XSBETUFSOiBbRE1BIFdyaXRlXSBSZXF1ZXN0
IGRldmljZSBbMDc6MDAuMV0gZmF1bHQgYWRkciAKZmZmZTAwMDDCoFtmYXVsdMKgcmVhc29uwqAw
Ml3CoFByZXNlbnTCoGJpdMKgaW7CoGNvbnRleHTCoGVudHJ5wqBpc8KgY2xlYXIKCldpdGggaW9t
bXU9b2ZmIGRpc2tzIGFyZSB2aXNpYmxlLCBidXQgVVNCIGtleWJvYXJkIChhbmQgb3RoZXIgVVNC
IApkZXZpY2VzKcKgZG9lc8Kgbm90wqB3b3JrOgoKW8KgwqAgMTguMTc0ODAyXSBlaGNpLXBjaSAw
MDAwOjAwOjFhLjA6IHN3aW90bGIgYnVmZmVyIGlzIGZ1bGwgKHN6OiA4IApieXRlcykswqB0b3Rh
bMKgMMKgKHNsb3RzKSzCoHVzZWTCoDDCoChzbG90cykKW8KgwqAgMTguMTc0ODA0XSBlaGNpLXBj
aSAwMDAwOjAwOjFhLjA6IG92ZXJmbG93IDB4MDAwMDAwMGZmZGM3NWFlOCs4IG9mIApETUHCoG1h
c2vCoGZmZmZmZmZmwqBidXPCoG1hc2vCoDAKW8KgwqAgMTguMTc0ODE1XSBXQVJOSU5HOiBDUFU6
IDIgUElEOiA1MDggYXQga2VybmVsL2RtYS9kaXJlY3QuYzozNSAKcmVwb3J0X2FkZHIrMHgyZS8w
eDUwClvCoMKgwqAxOC4xNzQ4MTZdwqBNb2R1bGVzwqBsaW5rZWTCoGluOgpbwqDCoCAxOC4xNzQ4
MThdIENQVTogMiBQSUQ6IDUwOCBDb21tOiBrd29ya2VyLzI6MSBUYWludGVkOiBHIAogwqDCoFTC
oDUuMy4wLXJjNC02NC0wMDA1OC1nZDcxN2IwOTJlMGIywqAjNzcKW8KgwqAgMTguMTc0ODE5XSBI
YXJkd2FyZSBuYW1lOiBEZWxsIEluYy4gUHJlY2lzaW9uIFQzNjEwLzA5TThZOCwgQklPUyBBMTYg
CjAyLzA1LzIwMTgKW8KgwqDCoDE4LjE3NDgyMl3CoFdvcmtxdWV1ZTrCoHVzYl9odWJfd3HCoGh1
Yl9ldmVudAoKSSdsbMKgdHJ5wqB0b8KgZmluZMKgLXJjNMKgY29uZmlndXJhdGlvbsKgdGhhdMKg
aGFzwqBlbmFibGVkwqBkZWJ1Z2dpbmfCoGFuZMKgY2FuwqBib290LiAKCgpQZXRyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
