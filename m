Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79201D0F99
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 15:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97056E99F;
	Wed,  9 Oct 2019 13:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BC36E99F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 13:07:18 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99D4Zs5172377;
 Wed, 9 Oct 2019 13:07:06 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2vek4qm8jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2019 13:07:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99D4ATS088871;
 Wed, 9 Oct 2019 13:07:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2vgefcnett-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2019 13:07:05 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x99D6xac008352;
 Wed, 9 Oct 2019 13:07:00 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Oct 2019 06:06:59 -0700
Date: Wed, 9 Oct 2019 16:06:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20191009130645.GN25098@kadam>
References: <cover.1570588741.git.xji@analogixsemi.com>
 <6ad16e52cd7591d320001a842fc357d976006ef7.1570588741.git.xji@analogixsemi.com>
 <20191009113032.GL25098@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009113032.GL25098@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9404
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910090125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9404
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910090125
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Oks/0v4+cEI4DXjuhEPuS+2hzvux1aGr0Tslm3/CeGs=;
 b=HpC0QAbNwrvFFWfScOjx2tUzw/VQXOGJ5gKbf+n0c/Z2/iCD/EsyXTWht5YQvpHsAJGa
 erYeNEqWgWnxdXDqPhILlYR47u1OTrMVcIpxKJhErgVdCqOA6p4W92ouLlb9rv5c45DT
 xkHaaPQ/rjGrh2Uu/bNmzykrdWGORRNTmUHALyYcbgcDK1oK5q8LgS+Nc5vQo9JsOOc1
 xDJ4Q5cyq1NRr8H/Wkh4bwy5gvchZZMNH/yJFjVaeRMQk1/GTY9qSZ1L/Rvrbs/XIUkj
 fGYq3N+WVEOBzcm7dyUzz9ES3DfzYoI5QqJP2qhE+YvVJ7dl2zXL3agKQhqucbq+9jxh Mg== 
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDI6MzA6MzJQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiA+ICsJcGxhdGZvcm0gPSBremFsbG9jKHNpemVvZigqcGxhdGZvcm0pLCBHRlBfS0VS
TkVMKTsKPiA+ICsJaWYgKCFwbGF0Zm9ybSkgewo+ID4gKwkJRFJNX0RFVl9FUlJPUihkZXYsICJm
YWlsZWQgdG8gYWxsb2NhdGUgZHJpdmVyIGRhdGFcbiIpOwo+ID4gKwkJcmV0ID0gLUVOT01FTTsK
PiA+ICsJCWdvdG8gZXhpdDsKPiAKPiByZXR1cm4gLUVOT01FTTsKPiAKPiA+ICsJfQo+ID4gKwo+
ID4gKwlwZGF0YSA9ICZwbGF0Zm9ybS0+cGRhdGE7Cj4gPiArCj4gPiArCS8qIGRldmljZSB0cmVl
IHBhcnNpbmcgZnVuY3Rpb24gY2FsbCAqLwo+ID4gKwlyZXQgPSBhbng3NjI1X3BhcnNlX2R0KCZj
bGllbnQtPmRldiwgcGRhdGEpOwo+ID4gKwlpZiAocmV0ICE9IDApCS8qIGlmIG9jY3VycyBlcnJv
ciAqLwo+ID4gKwkJZ290byBlcnIwOwo+IAo+ICE9IDAgaXMgZG91YmxlIG5lZ2F0aXZlLiAgQ2hv
b3NlIGJldHRlciBsYWJlbCBuYW1lcy4gIFJlbW92ZSB0aGUgb2J2aW91cwo+IGNvbW1lbnQuCj4g
Cj4gaWYgKHJldCkKPiAJZ290byBmcmVlX3BsYXRmb3JtOwo+IAo+ID4gKwo+ID4gKwlhbng3NjI1
X2luaXRfZ3BpbyhwbGF0Zm9ybSk7Cj4gPiArCj4gPiArCS8qIHRvIGFjY2VzcyBnbG9iYWwgcGxh
dGZvcm0gZGF0YSAqLwo+ID4gKwlwbGF0Zm9ybS0+Y2xpZW50ID0gY2xpZW50Owo+ID4gKwlpMmNf
c2V0X2NsaWVudGRhdGEoY2xpZW50LCBwbGF0Zm9ybSk7Cj4gPiArCj4gPiArCWlmIChwbGF0Zm9y
bS0+cGRhdGEuZXh0Y29uX3N1cHBvcnRlZCkgewo+ID4gKwkJLyogZ2V0IGV4dGNvbiBkZXZpY2Ug
ZnJvbSBEVFMgKi8KPiA+ICsJCXBsYXRmb3JtLT5leHRjb24gPSBleHRjb25fZ2V0X2VkZXZfYnlf
cGhhbmRsZSgmY2xpZW50LT5kZXYsIDApOwo+ID4gKwkJaWYgKFBUUl9FUlIocGxhdGZvcm0tPmV4
dGNvbikgPT0gLUVQUk9CRV9ERUZFUikKPiA+ICsJCQlnb3RvIGVycjA7Cj4gCj4gUHJlc2VydmUg
dGhlIGVycm9yIGNvZGUuCj4gCj4gPiArCQlpZiAoSVNfRVJSKHBsYXRmb3JtLT5leHRjb24pKSB7
Cj4gPiArCQkJRFJNX0RFVl9FUlJPUigmY2xpZW50LT5kZXYsCj4gPiArCQkJCSAgICAgICJjYW4g
bm90IGdldCBleHRjb24gZGV2aWNlISIpOwo+ID4gKwkJCWdvdG8gZXJyMDsKPiAKPiBQcmVydmUg
dGhlIGVycm9yIGNvZGUuCj4gCj4gPiArCQl9Cj4gPiArCj4gPiArCQlyZXQgPSBhbng3NjI1X2V4
dGNvbl9ub3RpZmllcl9pbml0KHBsYXRmb3JtKTsKPiA+ICsJCWlmIChyZXQgPCAwKQo+ID4gKwkJ
CWdvdG8gZXJyMDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlhdG9taWNfc2V0KCZwbGF0Zm9ybS0+cG93
ZXJfc3RhdHVzLCAwKTsKPiA+ICsKPiA+ICsJbXV0ZXhfaW5pdCgmcGxhdGZvcm0tPmxvY2spOwo+
ID4gKwo+ID4gKwlpZiAocGxhdGZvcm0tPnBkYXRhLmdwaW9faW50cl9ocGQpIHsKPiA+ICsJCUlO
SVRfV09SSygmcGxhdGZvcm0tPndvcmssIGFueDc2MjVfd29ya19mdW5jKTsKPiA+ICsJCXBsYXRm
b3JtLT53b3JrcXVldWUgPSBjcmVhdGVfd29ya3F1ZXVlKCJhbng3NjI1X3dvcmsiKTsKPiA+ICsJ
CWlmICghcGxhdGZvcm0tPndvcmtxdWV1ZSkgewo+ID4gKwkJCURSTV9ERVZfRVJST1IoZGV2LCAi
ZmFpbGVkIHRvIGNyZWF0ZSB3b3JrIHF1ZXVlXG4iKTsKPiA+ICsJCQlyZXQgPSAtRU5PTUVNOwo+
ID4gKwkJCWdvdG8gZXJyMTsKPiAKPiBUaGlzIGdvdG8gd2lsbCBjcmFzaC4gIEJlY2F1c2UgeW91
IGhhdmUgZm9yZ290dGVuIHdoYXQgdGhlIG1vc3QgcmVjZW50bHkKPiBhbGxvY2F0ZWQgcmVzb3Vy
Y2Ugd2FzLiAgSXQgc2hvdWxkIGJlICJnb3RvIGZyZWVfcGxhdGZvcm07IiBzdGlsbC4KPiAKPiA+
ICsJCX0KPiA+ICsKPiA+ICsJCXBsYXRmb3JtLT5wZGF0YS5ocGRfaXJxID0KPiA+ICsJCQlncGlv
ZF90b19pcnEocGxhdGZvcm0tPnBkYXRhLmdwaW9faW50cl9ocGQpOwo+ID4gKwkJaWYgKHBsYXRm
b3JtLT5wZGF0YS5ocGRfaXJxIDwgMCkgewo+ID4gKwkJCURSTV9ERVZfRVJST1IoZGV2LCAiZmFp
bGVkIHRvIGdldCBncGlvIGlycVxuIik7Cj4gPiArCQkJZ290byBlcnIxOwo+IAo+IGdvdG8gZnJl
ZV93cTsKPiAKPiA+ICsJCX0KPiA+ICsKPiA+ICsJCXJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJx
KHBsYXRmb3JtLT5wZGF0YS5ocGRfaXJxLAo+ID4gKwkJCQkJICAgTlVMTCwgYW54NzYyNV9pbnRy
X2hwZF9pc3IsCj4gPiArCQkJCQkgICBJUlFGX1RSSUdHRVJfRkFMTElORyB8Cj4gPiArCQkJCQkg
ICBJUlFGX1RSSUdHRVJfUklTSU5HIHwKPiA+ICsJCQkJCSAgIElSUUZfT05FU0hPVCwKPiA+ICsJ
CQkJCSAgICJhbng3NjI1LWhwZCIsIHBsYXRmb3JtKTsKPiA+ICsJCWlmIChyZXQgPCAwKSB7Cj4g
PiArCQkJRFJNX0RFVl9FUlJPUihkZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBpcnFcbiIpOwo+ID4g
KwkJCWdvdG8gZXJyMTsKPiA+ICsJCX0KPiA+ICsKPiA+ICsJCXJldCA9IGlycV9zZXRfaXJxX3dh
a2UocGxhdGZvcm0tPnBkYXRhLmhwZF9pcnEsIDEpOwo+ID4gKwkJaWYgKHJldCA8IDApIHsKPiA+
ICsJCQlEUk1fREVWX0VSUk9SKGRldiwgIlJlcXVlc3QgaXJxIGZvciBocGQiKTsKPiA+ICsJCQlE
Uk1fREVWX0VSUk9SKGRldiwgImludGVycnVwdCB3YWtlIHNldCBmYWlsXG4iKTsKPiA+ICsJCQln
b3RvIGVycjE7Cj4gPiArCQl9Cj4gPiArCj4gPiArCQlyZXQgPSBlbmFibGVfaXJxX3dha2UocGxh
dGZvcm0tPnBkYXRhLmhwZF9pcnEpOwo+ID4gKwkJaWYgKHJldCA8IDApIHsKPiA+ICsJCQlEUk1f
REVWX0VSUk9SKGRldiwgIkVuYWJsZSBpcnEgZm9yIEhQRCIpOwo+ID4gKwkJCURSTV9ERVZfRVJS
T1IoZGV2LCAiaW50ZXJydXB0IHdha2UgZW5hYmxlIGZhaWxcbiIpOwo+ID4gKwkJCWdvdG8gZXJy
MTsKPiA+ICsJCX0KPiA+ICsJfQo+ID4gKwo+ID4gKwlpZiAoYW54NzYyNV9yZWdpc3Rlcl9pMmNf
ZHVtbXlfY2xpZW50cyhwbGF0Zm9ybSwgY2xpZW50KSAhPSAwKSB7Cj4gCj4gUHJlc2VydmUgdGhl
IGVycm9yIGNvZGUuCj4gCj4gCXJldCA9IGFueDc2MjVfcmVnaXN0ZXJfaTJjX2R1bW15X2NsaWVu
dHMoKTsKPiAJaWYgKHJldCkKPiAJCWdvdG8gZnJlZV9wbGF0Zm9ybTsKPiAKCkkgbWVhbnQgZ290
byBmcmVlX3dxIGhlcmUuICBUaGF0J3MgdGhlIG1vc3QgcmVjZW50IGFsbG9jYXRpb24uCgpyZWdh
cmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
