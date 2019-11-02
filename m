Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A27ECDC3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 09:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2A26E397;
	Sat,  2 Nov 2019 08:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7366E397
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 08:45:41 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA28gq1M125162;
 Sat, 2 Nov 2019 08:45:37 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2w117th1bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Nov 2019 08:45:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA28ifCb032971;
 Sat, 2 Nov 2019 08:45:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2w0yucj3k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Nov 2019 08:45:36 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA28jZ0Q001614;
 Sat, 2 Nov 2019 08:45:36 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 02 Nov 2019 01:45:35 -0700
Date: Sat, 2 Nov 2019 11:45:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [bug report] dma-buf: heaps: Add heap helpers
Message-ID: <20191102084528.GA21796@kadam>
References: <20191031110736.GD26612@mwanda>
 <CALAqxLUtnZsw0q_5JFtyVjbnxeMUTND=Vt8XgS44iQ_n391XFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLUtnZsw0q_5JFtyVjbnxeMUTND=Vt8XgS44iQ_n391XFQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9428
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911020086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9428
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911020085
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=JXA7IwfRYACoVI0gOcIjWli8Ze5yTIc2rAel04y01pQ=;
 b=eudkazFwtt1LpojeRNNd4uWYv6AtL7VRDerU5nqLzcRChSzEXK/M7UpleaCcfigp3OSP
 UM3h7IZE2LP8wZJeiXVCpm6wD6KWrX+kJIeqg8oJcc5/Mk9FFpimggN4wr4sPakmPcZK
 OPFKCeaP9MgITvlpM2E+la3ppJV930dJZ3Pxa/1u21WVCd0ebtsIksj25Zk+irvS0pqp
 aqymgVuCpog9SzJE43ETgaV7EOel1hZ3QhX8taM4cwsyUP/M6gBe6E20YZCR70vGpEf9
 xi5LKeBChdMigEzw1PBCzIiDIx/6DWpM+cnJ3eCfHIPKmCy3eDroBTtlyV5B7qOXl7zi cA== 
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMTI6MzE6NTNQTSAtMDcwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgNDowNyBBTSBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4gVGhlIHBhdGNoIDdiODdlYTcwNGZkOTog
ImRtYS1idWY6IGhlYXBzOiBBZGQgaGVhcCBoZWxwZXJzIiBmcm9tIE9jdAo+ID4gMjEsIDIwMTks
IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNrZXIgd2FybmluZzoKPiA+Cj4gPiAg
ICAgICAgIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYzoxNjUgZG1hX2hlYXBf
dm1fZmF1bHQoKQo+ID4gICAgICAgICB3YXJuOiB1bmNhcHBlZCB1c2VyIGluZGV4ICdidWZmZXIt
PnBhZ2VzW3ZtZi0+cGdvZmZdJwo+ID4KPiA+IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhl
bHBlcnMuYwo+ID4gICAgMTYwICBzdGF0aWMgdm1fZmF1bHRfdCBkbWFfaGVhcF92bV9mYXVsdChz
dHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiA+ICAgIDE2MSAgewo+ID4gICAgMTYyICAgICAgICAgIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4gPiAgICAxNjMgICAgICAgICAg
c3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqYnVmZmVyID0gdm1hLT52bV9wcml2YXRlX2RhdGE7
Cj4gPiAgICAxNjQKPiA+ICAgIDE2NSAgICAgICAgICB2bWYtPnBhZ2UgPSBidWZmZXItPnBhZ2Vz
W3ZtZi0+cGdvZmZdOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXl5eXl5eXgo+ID4gU21hdGNoIGZvciBzb21lIHJlYXNvbiB0aGlua3MgdGhpcyBuZWVk
cyB0byBiZSBjaGVja2VkLiAgU21hdGNoIGFsc28KPiA+IGdldHMgY29uZnVzZWQgYnkgdGhlc2Ug
ZmF1bHQgaGFuZGxlcnMgYW5kIHRoaW5rcyB0aGVyZSBpcyBzb21lIHJlY3Vyc2lvbgo+ID4gaW52
b2x2ZWQuLi4KPiAKPiBIcm0sIEknbSBub3QgdG90YWxseSBzdXJlIEkgZ3JvayB3aGF0IGl0J3Mg
bG9va2luZyBmb3IsIGJ1dCBJJ20KPiBndWVzc2luZyBpdCdzIHN1Z2dlc3Rpbmcgd2UgY2hlY2sg
dGhhdCBwZ29mZiBpc24ndCBsYXJnZXIgdGhlbiB0aGUKPiBwYWdlY291bnQ/Cj4gSSdsbCBhZGQg
dGhhdCBjaGVjayBpbiwgYnV0IGxldCBtZSBrbm93IGlmIEkndmUgbWlzdW5kZXJzdG9vZC4KClll
YWgsIHRoYXQncyByaWdodC4gIE9yIG1heWJlIHBnb2ZmIGlzIGNoZWNrZWQgc29tZXdoZXJlIGVs
c2U/CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
