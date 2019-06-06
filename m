Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C5371BF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA6D8926B;
	Thu,  6 Jun 2019 10:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49018926B;
 Thu,  6 Jun 2019 10:31:17 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x56AOfEE090289;
 Thu, 6 Jun 2019 10:31:10 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2sugstqkkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2019 10:31:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x56AV4M4026798;
 Thu, 6 Jun 2019 10:31:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2swngmedha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2019 10:31:09 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x56AV5up032634;
 Thu, 6 Jun 2019 10:31:06 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 06 Jun 2019 03:31:05 -0700
Date: Thu, 6 Jun 2019 13:30:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: [PATCH][next] drm/amd/display: remove redundant assignment to
 status
Message-ID: <20190606103055.GJ31203@kadam>
References: <20190530161219.2507-1-colin.king@canonical.com>
 <a190bcd5-cda8-84c6-093a-98438a605032@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a190bcd5-cda8-84c6-093a-98438a605032@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906060076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906060076
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=chC2ESL5ETHD38DyfimbY9RtBdco74fFfMWbdfWI37s=;
 b=sPdb6bVX9Qok6LhENtfhx82iUfg9TJljlGnbqE8wGy5gxt8GL3y4zis/zphkxNW7ytSS
 0z2P5b8rPGUO9RKFph0zdIQnjCXHnzJiqEfOrykw5BfTtZ7Im1n8/I1cJjiWak4KfFtI
 NTM9sGIjh7nOC9SC8gMTVzrNQ2nYW7vdxO0JqrX6ZA2VB8WgAxfghcSYAOw4BXlaScVG
 uQQ8gwS+XcUqunslovdAIwhut5tAYIuzFS9g9iOcIz/UX0+xX1VHS9nGvIS1mJIbXYPf
 QNKshbVFTnwlufNr3Fh5Bxm9RPCSva2zs+7dXYwnQF/XtXepcFf/X9/FBPMq850Ic2fc eg== 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>,
 "Koo, Anthony" <Anthony.Koo@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDg6MTk6MDNQTSArMDAwMCwgSGFycnkgV2VudGxhbmQg
d3JvdGU6Cj4gT24gMjAxOS0wNS0zMCAxMjoxMiBwLm0uLCBDb2xpbiBLaW5nIHdyb3RlOgo+ID4g
RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+IAo+ID4g
VGhlIHZhcmlhYmxlIHN0YXR1cyBpcyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBu
ZXZlciByZWFkCj4gPiBhbmQgc3RhdHVzIGlzIHJlYXNzaWduZWQgc2V2ZXJhbCBzdGF0ZW1lbnRz
IGxhdGVyLiBUaGlzIGluaXRpYWxpemF0aW9uCj4gPiBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSBy
ZW1vdmVkLgo+ID4gCj4gPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKPiA+
IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2RwLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMKPiA+IGluZGV4IDY1ZDZjYWVkYmQ4Mi4uY2Y2MTY2YTFiZTUzIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19k
cC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2RwLmMKPiA+IEBAIC0yMzY3LDcgKzIzNjcsNyBAQCBzdGF0aWMgYm9vbCByZXRyaWV2ZV9saW5r
X2NhcChzdHJ1Y3QgZGNfbGluayAqbGluaykKPiA+ICAJdW5pb24gZG93bl9zdHJlYW1fcG9ydF9j
b3VudCBkb3duX3N0cm1fcG9ydF9jb3VudDsKPiA+ICAJdW5pb24gZWRwX2NvbmZpZ3VyYXRpb25f
Y2FwIGVkcF9jb25maWdfY2FwOwo+ID4gIAl1bmlvbiBkcF9kb3duc3RyZWFtX3BvcnRfcHJlc2Vu
dCBkc19wb3J0ID0geyAwIH07Cj4gPiAtCWVudW0gZGNfc3RhdHVzIHN0YXR1cyA9IERDX0VSUk9S
X1VORVhQRUNURUQ7Cj4gPiArCWVudW0gZGNfc3RhdHVzIHN0YXR1czsKPiAKPiBOb3Qgc3VyZSB0
aGlzIGltcHJvdmVzIHRoZSBzaXR1YXRpb24uCj4gCj4gSSdkIHByZWZlciB0byBoYXZlIGEgZGVm
YXVsdCBoZXJlIGluIGNhc2Ugc29tZW9uZSBjaGFuZ2VzIHRoZSBjb2RlIGJlbG93Cj4gYW5kIGZv
cmdldHMgdG8gc2V0IHRoZSBzdGF0dXMuCgpUaGUgZGVhZCBjb2RlIGNvbmZ1c2VzIGh1bWFuIHJl
YWRlcnMsIGJlY2F1c2UgcGVvcGxlIG5hdHVyYWxseSBhc3N1bWUgaXQKaXMgbm90IGRlYWQuCgpH
Q0MgaGFzIGEgZmVhdHVyZSB0byB3YXJuIGFib3V0IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGFu
ZCB3ZSdyZQpyYW5kb21seSBpbml0aWFsaXppbmcgc3RhdHVzIHRvIGEgYm9ndXMgdmFsdWUgdG8g
ZGlzYWJsZSBzdGF0aWMKYW5hbHlzaXMuLi4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
