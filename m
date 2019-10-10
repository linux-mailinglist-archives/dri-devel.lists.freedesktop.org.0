Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F744D26C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9495C6E150;
	Thu, 10 Oct 2019 09:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DC86E150
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:53:50 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9A9pSWI018551;
 Thu, 10 Oct 2019 09:53:31 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2vektrsudn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 09:53:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9A9hE1Y162309;
 Thu, 10 Oct 2019 09:53:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2vh5ccuj7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 09:53:30 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9A9rO09021352;
 Thu, 10 Oct 2019 09:53:24 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Oct 2019 02:53:23 -0700
Date: Thu, 10 Oct 2019 12:53:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20191010095315.GK13286@kadam>
References: <cover.1570699576.git.xji@analogixsemi.com>
 <43f48a7036e5a2991bd6bd8a7361107b27e48c54.1570699576.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43f48a7036e5a2991bd6bd8a7361107b27e48c54.1570699576.git.xji@analogixsemi.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910100087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910100088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=O9jqPg9T1QShiR+fwjuMaDwdClMkwHtRLy1Yhznc3qU=;
 b=oRIjXMqz/gl3+axIiDCTYCXWfZykg9EDDf0xYzsZ6pcw7Fbt9uEZsFpIOV3RKX+VO4Gd
 7IP42+diWQv2UxnkmIxklf4KTKz9WcBns49+Eiin2dlm6QSMR0pd0A+p0rndj+DT/gVw
 o5L8TB1X0tIXo2cHL5QBsBsJ3GsMxJgLxAK4ExiYcEQAZIwpk+ihRzwFhqdjpE7KuvPB
 TKyZcv0erK+fvT0SzrtyLobfYjpUh/XQNnYSV6URtcsSZKq6w+JP44/t7feZJteE/6cV
 S+6/ZDDrxjlkRaGX8/DBQ82T+SDF7Q6WpVMXZjrLBA8sKRAUEmd2CWiq+/nn8RDjWp5v UQ== 
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb2RlIGlzICpzbyogbXVjaCBuaWNlciB0aGFuIGJlZm9yZS4gIEkgaG9wZSB5b3UgZmVl
bCBnb29kIGFib3V0CnRoZSBjaGFuZ2VzLiAgSXQgbWFrZXMgbWUgaGFwcHkgdG8gbG9vayBhdCB0
aGlzIGNvZGUgbm93LgoKT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDk6MzQ6MTlBTSArMDAwMCwg
WGluIEppIHdyb3RlOgo+ICtzdGF0aWMgaW50IGVkaWRfcmVhZChzdHJ1Y3QgYW54NzYyNV9kYXRh
ICpjdHgsCj4gKwkJICAgICB1OCBvZmZzZXQsIHU4ICpwYmxvY2tfYnVmKQo+ICt7Cj4gKwlpbnQg
cmV0LCBjbnQ7Cj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY3R4LT5jbGllbnQtPmRldjsKPiAr
Cj4gKwlmb3IgKGNudCA9IDA7IGNudCA8IEVESURfVFJZX0NOVDsgY250KyspIHsKPiArCQlzcF90
eF9hdXhfd3IoY3R4LCBvZmZzZXQpOwo+ICsJCS8qIHNldCBJMkMgcmVhZCBjb20gMHgwMSBtb3Qg
PSAwIGFuZCByZWFkIDE2IGJ5dGVzICovCj4gKwkJcmV0ID0gc3BfdHhfYXV4X3JkKGN0eCwgMHhm
MSk7Cj4gKwo+ICsJCWlmIChyZXQpIHsKPiArCQkJc3BfdHhfcnN0X2F1eChjdHgpOwo+ICsJCQlE
Uk1fREVWX0RFQlVHX0RSSVZFUihkZXYsICJlZGlkIHJlYWQgZmFpbGVkLCByZXNldCFcbiIpOwo+
ICsJCQljbnQrKzsKCkkgZG9uJ3QgdGhpbmsgeW91IHNob3VsZCBpbmNyZW1lbnQgY250LiAgSXQn
cyBqdXN0IGEgY291bnRlci4KCj4gKwkJfSBlbHNlIHsKPiArCQkJcmV0ID0gYW54NzYyNV9yZWdf
YmxvY2tfcmVhZChjdHgsIGN0eC0+aTJjLnJ4X3AwX2NsaWVudCwKPiArCQkJCQkJICAgICBBUF9B
VVhfQlVGRl9TVEFSVCwKPiArCQkJCQkJICAgICBNQVhfRFBDRF9CVUZGRVJfU0laRSwKPiArCQkJ
CQkJICAgICBwYmxvY2tfYnVmKTsKPiArCQkJaWYgKCFyZXQpCj4gKwkJCQlicmVhazsKPiArCQl9
Cj4gKwl9Cj4gKwo+ICsJaWYgKGNudCA9PSBFRElEX1RSWV9DTlQpCgpBbmQgaXQgY291bGQgbWVh
biB0aGF0ICJjbnQgPiBFRElEX1RSWV9DTlQiLgoKPiArCQlyZXR1cm4gLUVJTzsKPiArCj4gKwly
ZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGludCBzZWdtZW50c19lZGlkX3JlYWQoc3RydWN0
IGFueDc2MjVfZGF0YSAqY3R4LAo+ICsJCQkgICAgICB1OCBzZWdtZW50LCB1OCAqYnVmLCB1OCBv
ZmZzZXQpCj4gK3sKPiArCXU4IGNudDsKPiArCWludCByZXQ7Cj4gKwlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmY3R4LT5jbGllbnQtPmRldjsKPiArCj4gKwkvKiB3cml0ZSBhZGRyZXNzIG9ubHkgKi8K
PiArCXJldCA9IGFueDc2MjVfcmVnX3dyaXRlKGN0eCwgY3R4LT5pMmMucnhfcDBfY2xpZW50LAo+
ICsJCQkJQVBfQVVYX0FERFJfN18wLCAweDMwKTsKPiArCXJldCB8PSBhbng3NjI1X3JlZ193cml0
ZShjdHgsIGN0eC0+aTJjLnJ4X3AwX2NsaWVudCwKPiArCQkJCSBBUF9BVVhfQ09NTUFORCwgMHgw
NCk7Cj4gKwlyZXQgfD0gYW54NzYyNV9yZWdfd3JpdGUoY3R4LCBjdHgtPmkyYy5yeF9wMF9jbGll
bnQsCj4gKwkJCQkgQVBfQVVYX0NUUkxfU1RBVFVTLAo+ICsJCQkJIEFQX0FVWF9DVFJMX0FERFJP
TkxZIHwgQVBfQVVYX0NUUkxfT1BfRU4pOwo+ICsKPiArCXJldCB8PSB3YWl0X2F1eF9vcF9maW5p
c2goY3R4KTsKPiArCS8qIHdyaXRlIHNlZ21lbnQgYWRkcmVzcyAqLwo+ICsJcmV0IHw9IHNwX3R4
X2F1eF93cihjdHgsIHNlZ21lbnQpOwo+ICsJLyogZGF0YSByZWFkICovCj4gKwlyZXQgfD0gYW54
NzYyNV9yZWdfd3JpdGUoY3R4LCBjdHgtPmkyYy5yeF9wMF9jbGllbnQsCj4gKwkJCQkgQVBfQVVY
X0FERFJfN18wLCAweDUwKTsKPiArCWlmIChyZXQpIHsKPiArCQlEUk1fRVJST1IoIklPIGVycm9y
IDogYXV4IGluaXRpYWwgZmFpbGVkLlxuIik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4g
Kwlmb3IgKGNudCA9IDA7IGNudCA8IEVESURfVFJZX0NOVDsgY250KyspIHsKPiArCQlzcF90eF9h
dXhfd3IoY3R4LCBvZmZzZXQpOwo+ICsJCS8qIHNldCBJMkMgcmVhZCBjb20gMHgwMSBtb3QgPSAw
IGFuZCByZWFkIDE2IGJ5dGVzICovCj4gKwkJcmV0ID0gc3BfdHhfYXV4X3JkKGN0eCwgMHhmMSk7
Cj4gKwo+ICsJCWlmIChyZXQpIHsKPiArCQkJcmV0ID0gc3BfdHhfcnN0X2F1eChjdHgpOwo+ICsJ
CQlEUk1fREVWX0VSUk9SKGRldiwgInNlZ21lbnQgcmVhZCBmYWlsZWQsIHJlc2V0IVxuIik7Cj4g
KwkJCWNudCsrOwoKU2FtZS4KCj4gKwkJfSBlbHNlIHsKPiArCQkJcmV0ID0gYW54NzYyNV9yZWdf
YmxvY2tfcmVhZChjdHgsIGN0eC0+aTJjLnJ4X3AwX2NsaWVudCwKPiArCQkJCQkJICAgICBBUF9B
VVhfQlVGRl9TVEFSVCwKPiArCQkJCQkJICAgICBNQVhfRFBDRF9CVUZGRVJfU0laRSwgYnVmKTsK
PiArCQkJaWYgKCFyZXQpCj4gKwkJCQlicmVhazsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJaWYgKGNu
dCA9PSBFRElEX1RSWV9DTlQpCj4gKwkJcmV0dXJuIC1FSU87Cj4gKwo+ICsJcmV0dXJuIDA7Cj4g
K30KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
