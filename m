Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D3D7203
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 11:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5225D6E35D;
	Tue, 15 Oct 2019 09:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59FA6E34A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 09:19:59 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9F9DCsw015460;
 Tue, 15 Oct 2019 09:19:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vk68ueh7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 09:19:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9F98DWJ147688;
 Tue, 15 Oct 2019 09:19:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vnb0erxc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 09:19:39 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9F9JV6N021786;
 Tue, 15 Oct 2019 09:19:31 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Oct 2019 09:19:30 +0000
Date: Tue, 15 Oct 2019 12:19:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20191015091921.GC21344@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55295c49503a963f3417b917fd7163feb26ed0b6.1570760115.git.xji@analogixsemi.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9410
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910150086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9410
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910150086
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=XOS9EXMDrfcapa0yCPVW2tWQBekI+jT6QODKtdRu1OU=;
 b=Qr7X/dmJF+BJSy/GF+LmiqYPiI+bOcgWHfpXFx/5BLQ6rY4195UOzl0XLlo993ZEA5j3
 6nI7jwwM2pGULD13DKQRxvmtC76O8SlY9peYOEUcdupYGw52asJDIxLFPMdUe7DbdzFZ
 A0Mmjkwxv6LNYGWWYJm+EtDbhSUgOrbbUh4piVJWdYGu7kxyRJbOkk9GzowxQjvFIiNk
 JOMHwxkSnPB1PECWXFjn4AsQnzAnMIht/SOl3vWpQ7cTyn2Tdt8vpIKu1x1/CUvthX6+
 B7jI+RzhhZ6dQxmvyLZenQFzC+707MWvqQEvdezbZSa2KJuveo6jNiFlXKdq3P5noZ1g JA== 
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
 Nicolas Boichat <drinkcat@chromium.org>, kbuild-all@lists.01.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WyAgVGhlc2UgYXJlIGF1dG9tYXRlZCB0ZXh0IGZyb20gdGhlIDAtZGF5IGJvdCAtZGFuIF0KCkhp
IFhpbiwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBQZXJoYXBzIHNvbWV0aGluZyB0byBpbXBy
b3ZlOgoKdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL1hp
bi1KaS9kdC1iaW5kaW5ncy1kcm0tYnJpZGdlLWFueDc2MjUtTUlQSS10by1EUC10cmFuc21pdHRl
ci1iaW5kaW5nLzIwMTkxMDE0LTA0MzAxOQoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZwpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+ClJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+CgpOZXcgc21hdGNoIHdhcm5pbmdzOgpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FueDc2MjUuYzoxMjc0IGFueDc2MjVfc3RhcnRfZHBfd29yaygpIGVycm9yOiB1bmluaXRpYWxp
emVkIHN5bWJvbCAnc3BfdHhfbGFuZV9jb3VudCcuCgojIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5
LWNpL2xpbnV4L2NvbW1pdC8xNTJhODJiNjc0N2YxMGQ2YzEzYzdhNDIyMTczOTQ3YzJmMmUxYWEy
CmdpdCByZW1vdGUgYWRkIGxpbnV4LXJldmlldyBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9s
aW51eApnaXQgcmVtb3RlIHVwZGF0ZSBsaW51eC1yZXZpZXcKZ2l0IGNoZWNrb3V0IDE1MmE4MmI2
NzQ3ZjEwZDZjMTNjN2E0MjIxNzM5NDdjMmYyZTFhYTIKdmltICsvc3BfdHhfbGFuZV9jb3VudCAr
MTI3NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwoKMTUyYTgyYjY3
NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNTMgIHN0YXRpYyB2b2lkIGFueDc2MjVfc3RhcnRf
ZHBfd29yayhzdHJ1Y3QgYW54NzYyNV9kYXRhICpjdHgpCjE1MmE4MmI2NzQ3ZjEwIFhpbiBKaSAy
MDE5LTEwLTExICAxMjU0ICB7CjE1MmE4MmI2NzQ3ZjEwIFhpbiBKaSAyMDE5LTEwLTExICAxMjU1
ICAJaW50IHJldDsKMTUyYTgyYjY3NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNTYgIAl1OCBi
dWZbTUFYX0RQQ0RfQlVGRkVSX1NJWkVdOwoxNTJhODJiNjc0N2YxMCBYaW4gSmkgMjAxOS0xMC0x
MSAgMTI1NyAgCXU4IGhkY3BfY2FwOwoxNTJhODJiNjc0N2YxMCBYaW4gSmkgMjAxOS0xMC0xMSAg
MTI1OCAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjdHgtPmNsaWVudC0+ZGV2OwoxNTJhODJiNjc0
N2YxMCBYaW4gSmkgMjAxOS0xMC0xMSAgMTI1OSAgCXU4IHNwX3R4X2J3OyAvKiBsaW5rdHJhaW5p
bmcgYmFud2lkdGggKi8KMTUyYTgyYjY3NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNjAgIAl1
OCBzcF90eF9sYW5lX2NvdW50OyAvKiBsaW5rIHRyYWluaW5nIGxhbmUgY291bnQgKi8KMTUyYTgy
YjY3NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNjEgIAoxNTJhODJiNjc0N2YxMCBYaW4gSmkg
MjAxOS0xMC0xMSAgMTI2MiAgCWlmIChjdHgtPmhwZF9oaWdoX2NudCA+PSAyKSB7CjE1MmE4MmI2
NzQ3ZjEwIFhpbiBKaSAyMDE5LTEwLTExICAxMjYzICAJCURSTV9ERVZfREVCVUdfRFJJVkVSKGRl
diwgImFueDc2MjUgZmlsdGVyIHVzZWxlc3MgSFBEXG4iKTsKMTUyYTgyYjY3NDdmMTAgWGluIEpp
IDIwMTktMTAtMTEgIDEyNjQgIAkJcmV0dXJuOwoxNTJhODJiNjc0N2YxMCBYaW4gSmkgMjAxOS0x
MC0xMSAgMTI2NSAgCX0KMTUyYTgyYjY3NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNjYgIAox
NTJhODJiNjc0N2YxMCBYaW4gSmkgMjAxOS0xMC0xMSAgMTI2NyAgCWN0eC0+aHBkX2hpZ2hfY250
Kys7CjE1MmE4MmI2NzQ3ZjEwIFhpbiBKaSAyMDE5LTEwLTExICAxMjY4ICAKMTUyYTgyYjY3NDdm
MTAgWGluIEppIDIwMTktMTAtMTEgIDEyNjkgIAlzcF90eF9nZXRfcnhfYncoY3R4LCAmc3BfdHhf
YncpOwoxNTJhODJiNjc0N2YxMCBYaW4gSmkgMjAxOS0xMC0xMSAgMTI3MCAgCjE1MmE4MmI2NzQ3
ZjEwIFhpbiBKaSAyMDE5LTEwLTExICAxMjcxICAJc3BfdHhfYXV4X2RwY2RyZWFkX2J5dGVzKGN0
eCwgMHgwMCwgMHgwMCwgRFBDRF9NQVhfTEFORV9DT1VOVCwKMTUyYTgyYjY3NDdmMTAgWGluIEpp
IDIwMTktMTAtMTEgIDEyNzIgIAkJCQkgMSwgJnNwX3R4X2xhbmVfY291bnQpOwogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KU21hdGNoIHRoaW5rcyBzcF90eF9hdXhfZHBjZHJl
YWRfYnl0ZXMoKSBjYW4gZmFpbCBhbmQgd2UgZG9uJ3QgY2hlY2sKZm9yIGVycm9ycy4KCjE1MmE4
MmI2NzQ3ZjEwIFhpbiBKaSAyMDE5LTEwLTExICAxMjczICAKMTUyYTgyYjY3NDdmMTAgWGluIEpp
IDIwMTktMTAtMTEgQDEyNzQgIAlzcF90eF9sYW5lX2NvdW50ID0gc3BfdHhfbGFuZV9jb3VudCAm
IDB4MWY7CjE1MmE4MmI2NzQ3ZjEwIFhpbiBKaSAyMDE5LTEwLTExICAxMjc1ICAJc3BfdHhfYXV4
X2RwY2RyZWFkX2J5dGVzKGN0eCwgMHgwNiwgMHg4MCwgMHgyOCwgMSwgYnVmKTsvKiByZWFkIEJj
YXAgKi8KMTUyYTgyYjY3NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNzYgIAoxNTJhODJiNjc0
N2YxMCBYaW4gSmkgMjAxOS0xMC0xMSAgMTI3NyAgCWhkY3BfY2FwID0gYnVmWzBdICYgMHgwMTsK
MTUyYTgyYjY3NDdmMTAgWGluIEppIDIwMTktMTAtMTEgIDEyNzggIAoKLS0tCjAtREFZIGtlcm5l
bCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xv
Z3kgQ2VudGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxsICAgICAg
ICAgICAgICAgICAgIEludGVsIENvcnBvcmF0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
