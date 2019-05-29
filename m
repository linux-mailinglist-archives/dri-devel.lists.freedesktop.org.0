Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBA2DB62
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B243D6E2C2;
	Wed, 29 May 2019 11:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811176E2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 11:07:01 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TB3oRP041048;
 Wed, 29 May 2019 11:06:57 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2spxbq8u2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:06:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TB5LVN132907;
 Wed, 29 May 2019 11:06:57 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ss1fnd3qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:06:56 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TB6tS1026790;
 Wed, 29 May 2019 11:06:55 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 May 2019 04:06:55 -0700
Date: Wed, 29 May 2019 14:06:49 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linus.walleij@linaro.org
Subject: [bug report] drm/mcde: Add new driver for ST-Ericsson MCDE
Message-ID: <20190529110649.GC19119@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=778
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=808 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290075
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=IuvewEfhtmwhhuAW49CDZ0tGOm/q6VlQh6PFQnHaj0Y=;
 b=bjRw0Q73UbEL//Pl2UL9Rq+cM/2IbukS6zi9ECNDeIXA1mjo5th+t3Ko5kqYU9LfapjD
 SNlbaUqQr0fTwPVG3wIfciiJbZzai6kx2CfHNXCUO3liDWa0ACGrsGVKF8phuZKyrV3a
 UEsL8Is5OeOmbLiWSrbkgoYW3KxQ1cLhtPegegyz5WXnu1DJgC4xQHTcxsP1Jl4gFWrA
 SItruSYzwkk22D8YvRMsMqvkrzqaGI0kDwaGkMQ4Cb5v20JO/AUckDLpp7bXtT6IPbP0
 LLOW3cnUWVV4/QJYrVxBjig+SeWftp+DhiZe+6nwjui3IpnyPqs5qPZzPf7/0wzLiNNH uQ== 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTGludXMgV2FsbGVpaiwKClRoZSBwYXRjaCA1ZmM1MzdiZmQwMDA6ICJkcm0vbWNkZTog
QWRkIG5ldyBkcml2ZXIgZm9yIFNULUVyaWNzc29uCk1DREUiIGZyb20gTWF5IDI0LCAyMDE5LCBs
ZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYyBjaGVja2VyCndhcm5pbmc6CgoJZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2kuYzo5MTcgbWNkZV9kc2lfYmluZCgpCgl3YXJuOiAnYnJpZGdl
JyBpc24ndCBhbiBFUlJfUFRSCgpkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCiAgIDg4
MiAgICAgICAgICAvKiBPYnRhaW4gdGhlIGNsb2NrcyAqLwogICA4ODMgICAgICAgICAgZC0+aHNf
Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImhzIik7CiAgIDg4NCAgICAgICAgICBpZiAoSVNfRVJS
KGQtPmhzX2NsaykpIHsKICAgODg1ICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJ1bmFi
bGUgdG8gZ2V0IEhTIGNsb2NrXG4iKTsKICAgODg2ICAgICAgICAgICAgICAgICAgcmV0dXJuIFBU
Ul9FUlIoZC0+aHNfY2xrKTsKICAgODg3ICAgICAgICAgIH0KICAgODg4ICAKICAgODg5ICAgICAg
ICAgIGQtPmxwX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJscCIpOwogICA4OTAgICAgICAgICAg
aWYgKElTX0VSUihkLT5scF9jbGspKSB7CiAgIDg5MSAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAidW5hYmxlIHRvIGdldCBMUCBjbG9ja1xuIik7CiAgIDg5MiAgICAgICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKGQtPmxwX2Nsayk7CiAgIDg5MyAgICAgICAgICB9CiAgIDg5NCAgCiAg
IDg5NSAgICAgICAgICAvKiBBc3NlcnQgUkVTRVQgdGhyb3VnaCB0aGUgUFJDTVUsIGFjdGl2ZSBs
b3cgKi8KICAgODk2ICAgICAgICAgIC8qIEZJWE1FOiB3aGljaCBEU0kgYmxvY2s/ICovCiAgIDg5
NyAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoZC0+cHJjbXUsIFBSQ01fRFNJX1NXX1JFU0VU
LAogICA4OTggICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBSQ01fRFNJX1NXX1JFU0VUX0RT
STBfU1dfUkVTRVROLCAwKTsKICAgODk5ICAKICAgOTAwICAgICAgICAgIHVzbGVlcF9yYW5nZSgx
MDAsIDIwMCk7CiAgIDkwMSAgCiAgIDkwMiAgICAgICAgICAvKiBEZS1hc3NlcnQgUkVTRVQgYWdh
aW4gKi8KICAgOTAzICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhkLT5wcmNtdSwgUFJDTV9E
U0lfU1dfUkVTRVQsCiAgIDkwNCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFJDTV9EU0lf
U1dfUkVTRVRfRFNJMF9TV19SRVNFVE4sCiAgIDkwNSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUFJDTV9EU0lfU1dfUkVTRVRfRFNJMF9TV19SRVNFVE4pOwogICA5MDYgIAogICA5MDcgICAg
ICAgICAgLyogU3RhcnQgdXAgdGhlIGhhcmR3YXJlICovCiAgIDkwOCAgICAgICAgICBtY2RlX2Rz
aV9zdGFydChkKTsKICAgOTA5ICAKICAgOTEwICAgICAgICAgIC8qIExvb2sgZm9yIGEgcGFuZWwg
YXMgYSBjaGlsZCB0byB0aGlzIG5vZGUgKi8KICAgOTExICAgICAgICAgIGZvcl9lYWNoX2F2YWls
YWJsZV9jaGlsZF9vZl9ub2RlKGRldi0+b2Zfbm9kZSwgY2hpbGQpIHsKICAgOTEyICAgICAgICAg
ICAgICAgICAgcGFuZWwgPSBvZl9kcm1fZmluZF9wYW5lbChjaGlsZCk7CiAgIDkxMyAgICAgICAg
ICAgICAgICAgIGlmIChJU19FUlIocGFuZWwpKSB7CiAgIDkxNCAgICAgICAgICAgICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZmluZCBwYW5lbCB0cnkgYnJpZGdlICglbHUp
XG4iLAogICA5MTUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFRSX0VSUihwYW5l
bCkpOwogICA5MTYgICAgICAgICAgICAgICAgICAgICAgICAgIGJyaWRnZSA9IG9mX2RybV9maW5k
X2JyaWRnZShjaGlsZCk7CiAgIDkxNyAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VS
UihicmlkZ2UpKSB7CgpvZl9kcm1fZmluZF9icmlkZ2UoKSByZXR1cm5zIE5VTEwgb24gZXJyb3Is
IG5vdCBlcnJvciBwb2ludGVycy4KCiAgIDkxOCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBmaW5kIGJyaWRnZSAoJWx1KVxuIiwKICAgOTE5
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFRSX0VSUihicmlkZ2Up
KTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5e
Xl5eXl5eXl5eCiAgIDkyMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihicmlkZ2UpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5eXl5eXl5eXl5eXl5eXgpTaG91bGQgdGhpcyBiZSAtRVBST0JFREVGRVI/ICBJJ20g
bm90IHN1cmUgb2YgdGhlIHJ1bGVzLgoKICAgOTIxICAgICAgICAgICAgICAgICAgICAgICAgICB9
CiAgIDkyMiAgICAgICAgICAgICAgICAgIH0KICAgOTIzICAgICAgICAgIH0KCnJlZ2FyZHMsCmRh
biBjYXJwZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
