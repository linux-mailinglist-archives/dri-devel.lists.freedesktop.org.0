Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA981A5232
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E346E31E;
	Sat, 11 Apr 2020 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA616E267
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586521561;
 bh=YO56BPgYzbHFNxdDwWjsTw/E9oBuPLxFfNzdCIp6mAs=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=D3xjdJq4mpyPp70lIQToTHY0LOpHy79F6cb7GkR92GCu6zTLBLQvpVoDwAogZg9qI
 yDhoHjfLs6zvAN+Q2bzQ/T3HSs0XqJTrBlpHXzyRqeYO4gLO0NaCIf3PnNyhWBIcLd
 VF/crkEeq3V2YtiYbxcv9o/ItBLCzdS2DKnaFTSY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.110.107]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M1G68-1j7Yjg3QUq-00tFCv; Fri, 10
 Apr 2020 14:26:00 +0200
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in
 tve200_probe()
To: Sam Ravnborg <sam@ravnborg.org>, Linus Walleij
 <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
 <20200410101831.GA27723@ravnborg.org>
 <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
 <20200410121406.GA31761@ravnborg.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9971df1b-0651-fac0-847f-cf07eefe8996@web.de>
Date: Fri, 10 Apr 2020 14:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410121406.GA31761@ravnborg.org>
Content-Language: en-US
X-Provags-ID: V03:K1:ENl+PHrRm1maYRXaPLAvlLBNx2LGvgEOXf7qBl9KRvHwsrP7XJp
 hyDlAOgG33Ybok6hbqEaR35n/+SupIv643FvhngtV85k8vebv12fO0SSVDU4ToSSufblfC2
 no1iEQv7Mrf0lZvHNzrBkxg13st8JmsMRG3cY3T94hJev5xeKhxYhBVc6QggxmWIgWkfys4
 4Z9sc4YHAKUv6zrikvgmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRVjjf1/rAA=:3org7h9KR9v+EgHX14Hdhm
 pfc8KsRSqh3iUBmBUk/sbZZX7qTMqkvtIIn1Acu2BZXgvPgXkcHCA7mqjlAHe3SWWjyYx+Umx
 yr6bG/Gy68gX83a7dH68/vuWaIf+y5sRJ7bHIRTQqKiasG1OnahANZ/jAS8Efm5yQ2GpWifOM
 04ooAmGwa5IBCik5lGTYTB691hg3XIlpQK4U+Dtx9ACGhSOjzz6hbLsMiyN27YMMMqK+dnMDn
 dttdekDK+Fsf+JeO9HydOTnnoLdIusVpgAOY3Sjmnqlx0JJKVEBXwrNPxd5PIax3lMd97Kpfi
 pdGOkqksl0fHMIDu/R/XKvRxcAn1j/1PZ0jOKaGv+7OxKRjehf9HTELTvsbUuLMViJjDPirMF
 P/u0ZtnknrgBBM78eMcj8ORZj+e+3r9G3OnBsOtkvZelwjU41YaIzkMuLW4P6hmirLrTEDDDp
 3gZr8LRupQamSrJg+6xywhp5lMIX7SAHejyXm1DpnqWtURHUDX/KnaQ/O+vXP/kCJPX4wuyVZ
 QD/O7KHmX10kU3Bu7L2JnAWtd3MDiWcmfoewozBQC0eKKVnc7/MokYQuWQanQspfon7RZo65c
 ZrZZyjuGOv0dDi5emnPwkjv2znG8mVgo3bX0Jp1kc3YNUomHIYDu7Fnrc9yM085ULFTsfVZqZ
 qjLGtoPW0N5V7bGz+d8zATnK5B4jka0BXkSHDVCHtfysOeDYNz4boZfWSZslGajhkcJ1QnQhJ
 wmf13sGigifKSLRsDkXKY3VZgFVMv4C8DwZPkP8ptOuUWgkvZ/Iia53TdlvTE4u/tmgI2ZEN+
 Z5Q/1VANXNE8QgBNzDI12DqH9FZwMPsRoHtFTwzwhRdktnij00hT03Q5dW05KBmiCXTi0M5lb
 yLm5EsBIsgz+YUI4y5qxAr1H7m1h3WpRV/TAE7AjZHP8i+lwoQheMtJEbZ1M+6tuiL4bgbA0z
 alWriU9YbCNcEhh6SmRZtrHF07p2HPafdPRmecmhY1gv6iyDiGnAGnzICa1FidZJdRVPf1UED
 Q0/Luv8j/XhsefQEv8Z2nPJb21zLRMWGG2wjdHnZUDP9EAWFu3qQ8ehZ870zuyESeeWNyfNiE
 daSGb8127/OZIwHoX6MhQExr+rbpPoWzOKEkAAkeexKJp1ioO+gomgqHNT8/ivDg/bQZhkD+f
 QpCWQO0FFM4guX2cDwc4gQ12QbhK2aGGPeQKMBQaLM1oP1FSsgNqS6I8yIhNg0bMZ1QmRgjCM
 wPknSlwm27t2OAHXJ
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
 LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gSSBmb3VuZCAyMCBzb3VyY2UgZmlsZXMgZnJvbSB0aGUgc29mdHdhcmUg4oCcTGludXggbmV4
dC0yMDIwMDQwOOKAnQo+PiB3aGljaCBzZWVtIHRvIGNvbnRhaW4gc2ltaWxhciB1cGRhdGUgY2Fu
ZGlkYXRlcy4KPj4gV291bGQgeW91IGxpa2UgdG8gY2xhcmlmeSBhbnkgZXh0ZW5zaW9ucyBmb3Ig
aW1wcm92ZWQgYXBwbGljYXRpb25zCj4+IG9mIHNjcmlwdHMgd2l0aCB0aGUgc2VtYW50aWMgcGF0
Y2ggbGFuZ3VhZ2UgKENvY2NpbmVsbGUgc29mdHdhcmUpCj4+IGZvciBjb3JyZXNwb25kaW5nIGFu
YWx5c2lzIGFuZCB0cmFuc2Zvcm1hdGlvbiBwdXJwb3Nlcz8KPiBQbGVhc2UganVzdCBzZW5kIGEg
c2VyaWVzIG9mIHBhdGNoZXMsIG9uZSBmb3IgZWFjaCBkcml2ZXIuCgpJIGFtIHVzZWQgdG8gdGhp
cyBwb3NzaWJpbGl0eSBmb3IgeWVhcnMuCgoKPiBFYWNoIGNoYW5nZWxvZyBuZWVkcyB0byBleHBs
YWluIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoZSBjaGFuZ2UuCgpJIGhvcGUgdG8gYWNoaWV2ZSBo
aWdoZXIgY29uZmlkZW5jZSBhbHNvIGFyb3VuZCBzcGVjaWZpYyBjaGVja3MKZm9yIHJldHVybiB2
YWx1ZXMgb2YgTGludXggZnVuY3Rpb25zIHNvIHRoYXQgdW53YW50ZWQgbWlzdW5kZXJzdGFuZGlu
Z3MKY2FuIGJlIGF2b2lkZWQgZm9yIG1lbnRpb25lZCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzLgoK
Cj4gQXMgZm9yIGNvY2NpbmVsbGUgLSBJIGNhbm5vdCBoZWxwIHlvdS4KCkkgbWlnaHQgaGVscCB5
b3UgbW9yZSBhbHNvIGJ5IHRoZSBtZWFucyBvZiB0aGlzIGRldmVsb3BtZW50IHRvb2wKaWYgcmVs
YXRlZCBzeXN0ZW0gZmFjdG9ycyBjYW4gYmUgaW1wcm92ZWQgc29tZWhvdy4KClJlZ2FyZHMsCk1h
cmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
