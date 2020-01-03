Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7F12F767
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 12:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0055A6E267;
	Fri,  3 Jan 2020 11:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C036E267
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:38:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103113844euoutp02d750f7dfe6f223e2ecfd12747780ec9e~mXYAguOsB3129031290euoutp02R
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:38:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103113844euoutp02d750f7dfe6f223e2ecfd12747780ec9e~mXYAguOsB3129031290euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578051524;
 bh=arudGcoc+C6m1BJC+20hGHyM7CgsaKpi0vt+2+tPm+Q=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jH9P6cEcXyHw0apwzdHroYuBaielz15VWNmeuwJfBqtK5yq2+WvAo/JgGp5QJ/rYO
 cYqUmDEFpVyQHQabE9CTIILdjkzXATU3M9dGbrFgsBno96IeizvOVWD/zrwtMldzpc
 xOexFeQq9yRxaJatOaYlwTlcSHIu3thBtaXxtjy0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103113843eucas1p13c77707f315ea2ebcc0416cb878ebeaa~mXYALpIwQ2505425054eucas1p1h;
 Fri,  3 Jan 2020 11:38:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 50.E6.61286.3C72F0E5; Fri,  3
 Jan 2020 11:38:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103113843eucas1p2eadd8977c0d32c461145ec04e6033d8b~mXX-vVO2b1942519425eucas1p2y;
 Fri,  3 Jan 2020 11:38:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103113843eusmtrp2d2b911d7fab0bee7173f869ad67bd78a~mXX-uyGzZ0326803268eusmtrp2Q;
 Fri,  3 Jan 2020 11:38:43 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-0e-5e0f27c32c81
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DD.D0.07950.3C72F0E5; Fri,  3
 Jan 2020 11:38:43 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103113843eusmtip12eafddbdc95b285423503f1995a4a78d~mXX-bhVuR1164911649eusmtip1e;
 Fri,  3 Jan 2020 11:38:43 +0000 (GMT)
Subject: Re: [PATCH 2/3] video: fbdev: mmp: add COMPILE_TEST support
To: Andrzej Hajda <a.hajda@samsung.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <21153de6-885a-b52f-e051-0d6070daf2e9@samsung.com>
Date: Fri, 3 Jan 2020 12:38:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <28d91688-6df2-9207-7d88-34d024baf727@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djP87qH1fnjDKZeN7W4te4cq8WVr+/Z
 LE70fWC1uLxrDpsDi8f97uNMHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJVx5uct9oIV/BW3
 D/YwNTA+5uli5OCQEDCReLvArIuRi0NIYAWjRNvvC4wQzhdGiRN3jzJBOJ8ZJTYuvMbexcgJ
 1jF301EWiMRyRomFa3ezQjhvGSXOrZ0NViUs4CIxt38PG4gtIqAuMfvkHWYQm1kgQeLLzc9g
 NpuAlcTE9lWMIDavgJ3Ess03wOIsAioSdyfPZwKxRQUiJD49OMwKUSMocXLmExYQm1PAXmL5
 ownsEDPFJW49gahnFpCXaN46mxnkIAmBbnaJxx8vM0Kc7SJxbO5EJghbWOLV8S1Q78hI/N85
 nwmiYR2jxN+OF1Dd2xkllk/+xwZRZS1x59wvNlCQMQtoSqzfpQ8RdpTYfW0jEyQk+SRuvBWE
 OIJPYtK26cwQYV6JjjYhiGo1iQ3LNrDBrO3auZJ5AqPSLCSvzULyziwk78xC2LuAkWUVo3hq
 aXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYEo5/e/4px2MXy8lHWIU4GBU4uFNUOaPE2JNLCuu
 zD3EKMHBrCTCWx7IGyfEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKY
 LBMHp1QD4/yTUesnBkxcxJiiufqplUTmr53CZhUXmq7+yvz/YJ3Qve3l09s05Nq/M97ZF+Vj
 OiO0bcvSM1dNXQ4uWcPQ8ueylo2N0qKA/e+Oz7ELObaYN57dWbdJemXf1R3WQrXeV8wePbwp
 8rgtcL3Pl8/x9idUb65hfhxumndlpntlLr9xbtOUiWbTjyqxFGckGmoxFxUnAgCJ3f45JQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xu7qH1fnjDJbfkrS4te4cq8WVr+/Z
 LE70fWC1uLxrDpsDi8f97uNMHn1bVjF6fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx5uct9oIV/BW3D/YwNTA+5uli5OSQEDCRmLvp
 KAuILSSwlFHi1k+RLkYOoLiMxPH1ZRAlwhJ/rnWxdTFyAZW8ZpTY+LORDSQhLOAiMbd/D5gt
 IqAuMfvkHWaIouOMEguX3WUGSTALJEhsuj8VrIhNwEpiYvsqRhCbV8BOYtnmG2A1LAIqEncn
 z2cCsUUFIiQO75gFVSMocXLmE7DjOAXsJZY/msAOMVNd4s+8S1DzxSVuPYHoZRaQl2jeOpt5
 AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBEbTt2M8tOxi7
 3gUfYhTgYFTi4eVQ5I8TYk0sK67MPcQowcGsJMJbHsgbJ8SbklhZlVqUH19UmpNafIjRFOi5
 icxSosn5wOjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAqL3i
 oAnDwltT/1pKmfXcc7p4y0Fpw8E60YYDHWuuxU9XU7nh4vXDO8vveYtJ4o3TmQF6CnkveJ6x
 vj80ecLmFAnrmWlyBfdZ7+oab/opJdv7cv+2m3NVJz1W6HAXzHno80f2iO37Dq6DqXp97Xmd
 olOVnk6aOzfMJTGm6MfDSpa5zDrGW5vNlFiKMxINtZiLihMBDbLqXLYCAAA=
X-CMS-MailID: 20200103113843eucas1p2eadd8977c0d32c461145ec04e6033d8b
X-Msg-Generator: CA
X-RootMTR: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
References: <CGME20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c@eucas1p1.samsung.com>
 <d21a19ea-8c18-80df-ae79-76de7c5ee67c@samsung.com>
 <28d91688-6df2-9207-7d88-34d024baf727@samsung.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjAvMTkgMTE6NTYgQU0sIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gT24gMjcuMDYuMjAx
OSAxNjowNywgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPj4gQWRkIENPTVBJTEVf
VEVTVCBzdXBwb3J0IHRvIG1tcCBkaXNwbGF5IHN1YnN5c3RlbSBmb3IgYmV0dGVyIGNvbXBpbGUK
Pj4gdGVzdGluZyBjb3ZlcmFnZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IAo+IAo+IFJldmlld2VkLWJ5
OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKVGhhbmtzLCBJJ3ZlIHF1ZXVl
ZCB0aGUgcGF0Y2ggZm9yIHY1LjYuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNz
Cgo+IMKgLS0KPiBSZWdhcmRzCj4gQW5kcnplago+IAo+IAo+PiAtLS0KPj4gIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvbW1wL0tjb25maWcgICAgfCAgICAyICstCj4+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L21tcC9ody9LY29uZmlnIHwgICAgMyArKy0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L21tcC9LY29uZmlnCj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9t
bXAvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9LY29uZmlnCj4+IEBA
IC0xLDcgKzEsNyBAQAo+PiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
Cj4+ICBtZW51Y29uZmlnIE1NUF9ESVNQCj4+ICAJdHJpc3RhdGUgIk1hcnZlbGwgTU1QIERpc3Bs
YXkgU3Vic3lzdGVtIHN1cHBvcnQiCj4+IC0JZGVwZW5kcyBvbiBDUFVfUFhBOTEwIHx8IENQVV9N
TVAyCj4+ICsJZGVwZW5kcyBvbiBDUFVfUFhBOTEwIHx8IENQVV9NTVAyIHx8IENPTVBJTEVfVEVT
VAo+PiAgCWhlbHAKPj4gIAkgIE1hcnZlbGwgRGlzcGxheSBTdWJzeXN0ZW0gc3VwcG9ydC4KPj4g
IAo+PiBJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9ody9LY29uZmlnCj4+ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvS2NvbmZpZwo+PiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9ody9LY29uZmlnCj4+IEBAIC0xLDcgKzEsOCBAQAo+
PiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4+ICBjb25maWcgTU1Q
X0RJU1BfQ09OVFJPTExFUgo+PiAgCWJvb2wgIm1tcCBkaXNwbGF5IGNvbnRyb2xsZXIgaHcgc3Vw
cG9ydCIKPj4gLQlkZXBlbmRzIG9uIENQVV9QWEE5MTAgfHwgQ1BVX01NUDIKPj4gKwlkZXBlbmRz
IG9uIEhBVkVfQ0xLICYmIEhBU19JT01FTQo+PiArCWRlcGVuZHMgb24gQ1BVX1BYQTkxMCB8fCBD
UFVfTU1QMiB8fCBDT01QSUxFX1RFU1QKPj4gIAloZWxwCj4+ICAJCU1hcnZlbGwgTU1QIGRpc3Bs
YXkgaHcgY29udHJvbGxlciBzdXBwb3J0Cj4+ICAJCXRoaXMgY29udHJvbGxlciBpcyB1c2VkIG9u
IE1hcnZlbGwgUFhBOTEwIGFuZAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
