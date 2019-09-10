Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D6AEBA0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52D6E8E1;
	Tue, 10 Sep 2019 13:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456A16E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:32:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ADTahJ077135;
 Tue, 10 Sep 2019 13:32:40 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2uw1jy3e6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 13:32:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ADTl01139937;
 Tue, 10 Sep 2019 13:32:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2uwpjvtryk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 13:32:39 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8ADWXN0016751;
 Tue, 10 Sep 2019 13:32:33 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Sep 2019 06:32:33 -0700
Date: Tue, 10 Sep 2019 16:32:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190910133226.GD20699@kadam>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
 <20190908160428.GA20115@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190908160428.GA20115@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Ob/VhK2HZWtLu7Kc+t1OnTj43TDNLObrKLKE6lWFC0o=;
 b=eNJQkbiR+h2qsgzorhu6sevTSQ8FBC+028FYSbpDskj2WDflT0Y73n6I83qJYiZ7Z/Df
 eFkq6wKBTDazg6a+8VvJT9gVN1YAZMuxDTGKXN3Dn3+tMMuIaW3itFuoQDbkTcyMDgbj
 gOIvMR2nQIMHGA3eS/JQi7cwKhOKSRxEx+ReUHDgSNQeo46qv7Qn3DVISQJfa34DKh+K
 I5eBRWHpKgi8kZh4x+kippVY3tlkgLq75LS8O0stkDeDxY73L5Iz4mtkdgv9MHe2pgSK
 3yKEWr7pFbwREapJ2HoMidXSpV4r8Uwx9cP4GAwa92ASSoK1QarkErPjr9zfVq5ZOGrw qg== 
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDY6MDQ6MjhQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbi4KPiAKPiBPbiBXZWQsIFNlcCAwNCwgMjAxOSBhdCAwOTo1NTowN1BNICsw
MzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+ID4gVGhlICJsdmRzLT5iYWNrbGlnaHQiIHBvaW50
ZXIgY291bGQgYmUgTlVMTCBpbiBzaXR1YXRpb25zIHdlcmUKPiA+IG9mX3BhcnNlX3BoYW5kbGUo
KSByZXR1cm5zIE5VTEwuICBBbHNvIGl0J3Mgc2xpZ2h0bHkgY2xlYW5lciB0byB1c2UKPiA+IGJh
Y2tsaWdodF9wdXQoKSB3aGljaCBhbHJlYWR5IGhhcyBhIGNoZWNrIGZvciBOVUxMIGJ1aWx0IGlu
Lgo+ID4gCj4gPiBGaXhlczogN2M5ZGZmNWJkNjQzICgiZHJtOiBwYW5lbHM6IEFkZCBMVkRTIHBh
bmVsIGRyaXZlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+Cj4gCj4gQSBtdWNoIGJldHRlciBmaXggd291bGQgYmUgdG8gaW50cm9k
dWNlIHVzZSBvZiBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCkuCj4gVGhlbiB5b3UgZG8gbm90IGhh
dmUgdG8gd29ycnkgYWJvdXQgcHV0KCkuCj4gCj4gQ2FyZSB0byByZXNwaW4gYSB2MyB0aGF0IGRv
ZXMgdGhpcz8KClN1cmUuICBUaGF0IGRvZXMgbG9vayBuaWNlLiAgSSB3aWxsIHJlc2VuZCB0b21v
cnJvdy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
