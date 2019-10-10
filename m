Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9CD26D9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA63D6E357;
	Thu, 10 Oct 2019 09:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF1E6E357
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:58:43 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9A9pM40018431;
 Thu, 10 Oct 2019 09:58:31 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2vektrsv69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 09:58:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9A9spb1155142;
 Thu, 10 Oct 2019 09:56:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2vh8k2j7g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 09:56:30 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9A9uRMx024510;
 Thu, 10 Oct 2019 09:56:27 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Oct 2019 09:56:26 +0000
Date: Thu, 10 Oct 2019 12:56:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20191010095617.GL13286@kadam>
References: <cover.1570699576.git.xji@analogixsemi.com>
 <43f48a7036e5a2991bd6bd8a7361107b27e48c54.1570699576.git.xji@analogixsemi.com>
 <20191010095315.GK13286@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010095315.GK13286@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910100088
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
 bh=bZLQHgADENUAKtzY+jcRvaI+uF1F1KYVnt4wJndku4I=;
 b=k/hpIkYg9Ktkz0dc2+f3ehhOPH7fd6JWtAhLNq8vRZowj/mYK4SVB7XtMT2CV7D07NwK
 QmJQlluTMewhCX2naksqj1tJfwnty+TQcZjyaPuYhtVBglVGxtydG1r0aUS/Pu0QBiXX
 d6WMbAQDiY8loy6b+bInfYQ3mdb7TtJwXidz8D2ZNCAdzNvmT/jG7qB3KsnD2+nQYbAB
 QKSEdoZCEUkGd101/WkL1MM4j250ellwvGuleftvp30gl8nnDXEKiz3LfXUXZUspMZvk
 Qxg07UPNBUIeWZvfjxqTvRLZe4dmq6FBPVOjvPO6SmyMZQY/DS5mDnE5C7L4aF07oU0H Rw== 
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTI6NTM6MTVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBUaGlzIGNvZGUgaXMgKnNvKiBtdWNoIG5pY2VyIHRoYW4gYmVmb3JlLiAgSSBob3Bl
IHlvdSBmZWVsIGdvb2QgYWJvdXQKPiB0aGUgY2hhbmdlcy4gIEl0IG1ha2VzIG1lIGhhcHB5IHRv
IGxvb2sgYXQgdGhpcyBjb2RlIG5vdy4KPiAKPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwOToz
NDoxOUFNICswMDAwLCBYaW4gSmkgd3JvdGU6Cj4gPiArc3RhdGljIGludCBlZGlkX3JlYWQoc3Ry
dWN0IGFueDc2MjVfZGF0YSAqY3R4LAo+ID4gKwkJICAgICB1OCBvZmZzZXQsIHU4ICpwYmxvY2tf
YnVmKQo+ID4gK3sKPiA+ICsJaW50IHJldCwgY250Owo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmY3R4LT5jbGllbnQtPmRldjsKPiA+ICsKPiA+ICsJZm9yIChjbnQgPSAwOyBjbnQgPCBFRElE
X1RSWV9DTlQ7IGNudCsrKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5eXl5eCgo+ID4gKwkJc3BfdHhfYXV4X3dyKGN0eCwgb2Zmc2V0KTsKPiA+ICsJCS8qIHNl
dCBJMkMgcmVhZCBjb20gMHgwMSBtb3QgPSAwIGFuZCByZWFkIDE2IGJ5dGVzICovCj4gPiArCQly
ZXQgPSBzcF90eF9hdXhfcmQoY3R4LCAweGYxKTsKPiA+ICsKPiA+ICsJCWlmIChyZXQpIHsKPiA+
ICsJCQlzcF90eF9yc3RfYXV4KGN0eCk7Cj4gPiArCQkJRFJNX0RFVl9ERUJVR19EUklWRVIoZGV2
LCAiZWRpZCByZWFkIGZhaWxlZCwgcmVzZXQhXG4iKTsKPiA+ICsJCQljbnQrKzsKICAgICAgICAg
ICAgICAgICAgICAgICAgXl5eXl4KCkkgbWVhbiB0aGF0IGl0J3MgaW5jcmVtZW50ZWQgdHdpY2Us
IHllYWg/CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
