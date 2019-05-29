Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D6E2DBFC
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53FB6E2E3;
	Wed, 29 May 2019 11:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19A66E2E3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 11:35:28 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBT2dH060151;
 Wed, 29 May 2019 11:35:24 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2spxbq8xyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:35:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBYDeb058432;
 Wed, 29 May 2019 11:35:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2srbdxb878-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:35:23 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4TBZM8e017088;
 Wed, 29 May 2019 11:35:22 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 May 2019 04:35:22 -0700
Date: Wed, 29 May 2019 14:35:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linus.walleij@linaro.org
Subject: [bug report] drm/mcde: Add new driver for ST-Ericsson MCDE
Message-ID: <20190529113516.GH19119@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=904
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=932 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=Kvepddph5+yJwnhrf4ZbEvVvY/MbQLhzNXYDiH/on3w=;
 b=r9bQtg8q6+alSKx9OxUTyWni5jeXJgyr0ZejgzcEIrsswuBoYpS/Hr9MuLMba1/289eu
 L1r8MbpimBSxzw1t/sgBskc8YaSD7avd+vjcrGh9MO+dzIMhEniu8fJFef0mnylfMZNK
 g/EMMl0w1xqV1gYujWuE8QimO6KAxsP25hzL5gbdGknMQCU8T/FioFeRXp1jojbosZLU
 KZKT4D5KqhGkMvhxTMlZtUAaDaI77zTHgUl1WRlW7Th8YVBqgqslivY+AhA6yLUN/uAk
 v/vsOMb50y9bbconIHNqjvf/2NS9HTc624YUgeLGhm3YOtSPFiByfysxaBMI+pYjhDgc 1A== 
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

SGVsbG8gTGludXMgV2FsbGVpaiwKClRoaXMgaXMgYSBzZW1pLWF1dG9tYXRpYyBlbWFpbCBhYm91
dCBuZXcgc3RhdGljIGNoZWNrZXIgd2FybmluZ3MuCgpUaGUgcGF0Y2ggNWZjNTM3YmZkMDAwOiAi
ZHJtL21jZGU6IEFkZCBuZXcgZHJpdmVyIGZvciBTVC1Fcmljc3NvbiAKTUNERSIgZnJvbSBNYXkg
MjQsIDIwMTksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoIGNvbXBsYWludDoKCiAgICBk
cml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jOjkwOCBtY2RlX2RzaV9iaW5kKCkKICAgIGVy
cm9yOiB3ZSBwcmV2aW91c2x5IGFzc3VtZWQgJ2QtPm1kc2knIGNvdWxkIGJlIG51bGwgKHNlZSBs
aW5lIDg3OSkKCmRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKICAgODc4CQkvKiBJZiB0
aGUgZGlzcGxheSBhdHRhY2hlZCBiZWZvcmUgYmluZGluZywgc2V0IHRoaXMgdXAgKi8KICAgODc5
CQlpZiAoZC0+bWRzaSkKICAgICAgICAgICAgICAgICAgICBeXl5eXl5eCkNoZWNrIGZvciBOVUxM
CgogICA4ODAJCQlkLT5tY2RlLT5tZHNpID0gZC0+bWRzaTsKICAgODgxCQogICA4ODIJCS8qIE9i
dGFpbiB0aGUgY2xvY2tzICovCiAgIDg4MwkJZC0+aHNfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwg
ImhzIik7CiAgIDg4NAkJaWYgKElTX0VSUihkLT5oc19jbGspKSB7CiAgIDg4NQkJCWRldl9lcnIo
ZGV2LCAidW5hYmxlIHRvIGdldCBIUyBjbG9ja1xuIik7CiAgIDg4NgkJCXJldHVybiBQVFJfRVJS
KGQtPmhzX2Nsayk7CiAgIDg4NwkJfQogICA4ODgJCiAgIDg4OQkJZC0+bHBfY2xrID0gZGV2bV9j
bGtfZ2V0KGRldiwgImxwIik7CiAgIDg5MAkJaWYgKElTX0VSUihkLT5scF9jbGspKSB7CiAgIDg5
MQkJCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIGdldCBMUCBjbG9ja1xuIik7CiAgIDg5MgkJCXJl
dHVybiBQVFJfRVJSKGQtPmxwX2Nsayk7CiAgIDg5MwkJfQogICA4OTQJCiAgIDg5NQkJLyogQXNz
ZXJ0IFJFU0VUIHRocm91Z2ggdGhlIFBSQ01VLCBhY3RpdmUgbG93ICovCiAgIDg5NgkJLyogRklY
TUU6IHdoaWNoIERTSSBibG9jaz8gKi8KICAgODk3CQlyZWdtYXBfdXBkYXRlX2JpdHMoZC0+cHJj
bXUsIFBSQ01fRFNJX1NXX1JFU0VULAogICA4OTgJCQkJICAgUFJDTV9EU0lfU1dfUkVTRVRfRFNJ
MF9TV19SRVNFVE4sIDApOwogICA4OTkJCiAgIDkwMAkJdXNsZWVwX3JhbmdlKDEwMCwgMjAwKTsK
ICAgOTAxCQogICA5MDIJCS8qIERlLWFzc2VydCBSRVNFVCBhZ2FpbiAqLwogICA5MDMJCXJlZ21h
cF91cGRhdGVfYml0cyhkLT5wcmNtdSwgUFJDTV9EU0lfU1dfUkVTRVQsCiAgIDkwNAkJCQkgICBQ
UkNNX0RTSV9TV19SRVNFVF9EU0kwX1NXX1JFU0VUTiwKICAgOTA1CQkJCSAgIFBSQ01fRFNJX1NX
X1JFU0VUX0RTSTBfU1dfUkVTRVROKTsKICAgOTA2CQogICA5MDcJCS8qIFN0YXJ0IHVwIHRoZSBo
YXJkd2FyZSAqLwogICA5MDgJCW1jZGVfZHNpX3N0YXJ0KGQpOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXgpkLT5tZHNpIGlzIGRlcmVmZXJlbmNlZCB3aXRob3V0IGNoZWNraW5nIGZv
ciBOVUxMIGluc2lkZSBoZXJlLgoKICAgOTA5CQogICA5MTAJCS8qIExvb2sgZm9yIGEgcGFuZWwg
YXMgYSBjaGlsZCB0byB0aGlzIG5vZGUgKi8KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
