Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F3D501E
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 15:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404FD6E49B;
	Sat, 12 Oct 2019 13:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EEC6E49B
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 13:36:15 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9CDYH1X190883;
 Sat, 12 Oct 2019 13:36:07 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2vk6sq1976-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Oct 2019 13:36:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9CDYPGo061502;
 Sat, 12 Oct 2019 13:36:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2vk4vrmw1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Oct 2019 13:36:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9CDa47m013122;
 Sat, 12 Oct 2019 13:36:05 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 12 Oct 2019 06:36:03 -0700
Date: Sat, 12 Oct 2019 16:35:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Rohan Garg <rohan.garg@collabora.com>
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
Message-ID: <20191012133557.GV13286@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011143009.17503-1-rohan.garg@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9407
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910120129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9407
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910120129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=5kzOPaQuKgWUkDkGUlBgoixbRx4nf2iwEPxUdWU5UxM=;
 b=qqOg8JoUHqj1i14Wl1hUtOTfmO38fh/qrQYWAhRKEgo7tx99OXc6Czmwc6VmI5epywd5
 3K+mY1c6bHbOEMhlehPQcMQmPSt49sB05C+/xJVlCaRaSOCxGtKNgnfZLolmDZ7FqIJ+
 HJeEVF5TYfnrKVGU/t8kb4YEm6oYy26Ucat2/mr0k7q8nXc/1Fk0Da0PhTloy1winJ7x
 gjjaZZUCOX3W14Ul//rUYdF6XTza1+RuZOa2qXUlNH8W6mGd/uLivkcVHLvJiZ8Dsbql
 pp2g/dEZV6NiLOr8ApLGUt1hyDcUUyPjCtVOwMLtE7CJJHGP5djsYR8qAABRH56hkp6O Ag== 
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
Cc: kernel@collabora.com, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9oYW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEgUGVyaGFwcyBzb21ldGhpbmcgdG8g
aW1wcm92ZToKClthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBsaW51cy9tYXN0ZXJdCltjYW5u
b3QgYXBwbHkgdG8gdjUuNC1yYzIgbmV4dC0yMDE5MTAxMV0KW2lmIHlvdXIgcGF0Y2ggaXMgYXBw
bGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxw
CmltcHJvdmUgdGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNvIHN1Z2dlc3QgdG8gdXNlICctLWJhc2Un
IG9wdGlvbiB0byBzcGVjaWZ5IHRoZQpiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxl
YXNlIHNlZSBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCgp1cmw6ICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvUm9oYW4tR2FyZy9kcm0taW9j
dGwtQWRkLWEtaW9jdGwtdG8tbGFiZWwtR0VNLW9iamVjdHMvMjAxOTEwMTItMDYyOTU1CgpJZiB5
b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnClJlcG9ydGVkLWJ5OiBr
YnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50
ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KCnNtYXRjaCB3YXJuaW5nczoKZHJpdmVycy9n
cHUvZHJtL2RybV9nZW0uYzo5NjcgZHJtX2R1bWJfc2V0X2xhYmVsX2lvY3RsKCkgZXJyb3I6ICds
YWJlbCcgZGVyZWZlcmVuY2luZyBwb3NzaWJsZSBFUlJfUFRSKCkKCiMgaHR0cHM6Ly9naXRodWIu
Y29tLzBkYXktY2kvbGludXgvY29tbWl0LzBmMGNkN2VmOWYzYjE2MjNhYjk4MmYxMmRjNzQ4OTk4
ZjMxZTEwYjQKZ2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS8w
ZGF5LWNpL2xpbnV4CmdpdCByZW1vdGUgdXBkYXRlIGxpbnV4LXJldmlldwpnaXQgY2hlY2tvdXQg
MGYwY2Q3ZWY5ZjNiMTYyM2FiOTgyZjEyZGM3NDg5OThmMzFlMTBiNAp2aW0gKy9sYWJlbCArOTY3
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKCjY3M2EzOTRiMWUzYjY5IEVyaWMgQW5ob2x0IDIw
MDgtMDctMzAgIDk0MyAgCjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAtMTEgIDk0
NCAgaW50IGRybV9kdW1iX3NldF9sYWJlbF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAow
ZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NDUgIAkJCQl2b2lkICpkYXRh
LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKMGYwY2Q3ZWY5ZjNiMTYgUm9oYW4gR2FyZyAg
MjAxOS0xMC0xMSAgOTQ2ICB7CjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAtMTEg
IDk0NyAgCWNoYXIgKmxhYmVsOwowZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTEx
ICA5NDggIAlzdHJ1Y3QgZHJtX2R1bWJfc2V0X2xhYmVsX29iamVjdCAqYXJncyA9IGRhdGE7CjBm
MGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAtMTEgIDk0OSAgCWludCByZXQgPSAwOwow
ZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NTAgIAowZjBjZDdlZjlmM2Ix
NiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NTEgIAlpZiAoIWFyZ3MtPmxlbiB8fCAhYXJncy0+
bmFtZSkKMGYwY2Q3ZWY5ZjNiMTYgUm9oYW4gR2FyZyAgMjAxOS0xMC0xMSAgOTUyICAJCXJldHVy
biAtRUlOVkFMOwowZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NTMgIAow
ZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NTQgIAlpZiAoIWRldi0+ZHJp
dmVyLT5sYWJlbCkKMGYwY2Q3ZWY5ZjNiMTYgUm9oYW4gR2FyZyAgMjAxOS0xMC0xMSAgOTU1ICAJ
CXJldHVybiAtRU9QTk9UU1VQUDsKMGYwY2Q3ZWY5ZjNiMTYgUm9oYW4gR2FyZyAgMjAxOS0xMC0x
MSAgOTU2ICAKMGYwY2Q3ZWY5ZjNiMTYgUm9oYW4gR2FyZyAgMjAxOS0xMC0xMSAgOTU3ICAJbGFi
ZWwgPSBzdHJuZHVwX3VzZXIodTY0X3RvX3VzZXJfcHRyKGFyZ3MtPm5hbWUpLCBhcmdzLT5sZW4p
OwowZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NTggIAowZjBjZDdlZjlm
M2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NTkgIAlpZiAoSVNfRVJSKGxhYmVsKSkgewow
ZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NjAgIAkJcmV0ID0gUFRSX0VS
UihsYWJlbCk7CjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAtMTEgIDk2MSAgCQln
b3RvIGVycjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeXl5eXl5eXgpKdXN0IHJldHVybiBQVFJfRVJSKGxhYmVsKTsKCgowZjBjZDdlZjlm
M2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NjIgIAl9CjBmMGNkN2VmOWYzYjE2IFJvaGFu
IEdhcmcgIDIwMTktMTAtMTEgIDk2MyAgCjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTkt
MTAtMTEgIDk2NCAgCXJldCA9IGRldi0+ZHJpdmVyLT5sYWJlbChkZXYsIGZpbGVfcHJpdiwgYXJn
cy0+aGFuZGxlLCBsYWJlbCk7CjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAtMTEg
IDk2NSAgCjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAtMTEgIDk2NiAgZXJyOgow
ZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExIEA5NjcgIAlrZnJlZShsYWJlbCk7
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl5eXgpUaGlzIHdpbGwgT29wcy4KCjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAt
MTEgIDk2OCAgCXJldHVybiByZXQ7CjBmMGNkN2VmOWYzYjE2IFJvaGFuIEdhcmcgIDIwMTktMTAt
MTEgIDk2OSAgfQowZjBjZDdlZjlmM2IxNiBSb2hhbiBHYXJnICAyMDE5LTEwLTExICA5NzAgIAoK
LS0tCjAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4g
U291cmNlIFRlY2hub2xvZ3kgQ2VudGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9r
YnVpbGQtYWxsICAgICAgICAgICAgICAgICAgIEludGVsIENvcnBvcmF0aW9uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
