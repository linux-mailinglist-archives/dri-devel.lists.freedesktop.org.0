Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA32DBE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813A6E0F4;
	Wed, 29 May 2019 11:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176436E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 11:32:44 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBTFkK052198;
 Wed, 29 May 2019 11:32:40 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2spw4th28k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:32:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBVLYU010038;
 Wed, 29 May 2019 11:32:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2ss1fndhaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:32:39 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TBWcAl027985;
 Wed, 29 May 2019 11:32:39 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 May 2019 04:32:38 -0700
Date: Wed, 29 May 2019 14:32:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linus.walleij@linaro.org
Subject: [bug report] drm/mcde: Add new driver for ST-Ericsson MCDE
Message-ID: <20190529113231.GF19119@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=788
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=820 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=UUgLL1h6dxNHXbDQOD+EO0NWSnRJJU+z4INUyklB72s=;
 b=cb/jS+69mPpXeiWV9I1g+dW6yaKohaoXXBXWFaV00FmqzcnwOTZ5JKDlqjCZarOhchd4
 us2y/lppOBH4nKyKSPRg8lZBsjW3Rxb3QsqlIgFJEuEt6KsKpKh2qWNpTp6vMRlesCal
 FwlQhgPGSpewbH5A+1z9AeSN4uO85iyHs+jbKR8Qbzwg9ou+WtStYV67eEc9J4Lnic4L
 O5FFmo9PUBjhS/t8r8IlMfQ4xNe7TLbHSU8nL2RowwLsShxxXVbT4ki5VLhYWzdIZ9hs
 IMSkyoqxAZg4TRuUike41CDYmZumvq2Gf9YCgLvPecEb0VdX2AYVHsL1TsM+dGup0ZFB CQ== 
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
cHUvZHJtL21jZGUvbWNkZV9kcnYuYzo0ODggbWNkZV9wcm9iZSgpCgllcnJvcjogdW5pbml0aWFs
aXplZCBzeW1ib2wgJ21hdGNoJy4KCmRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKICAg
NDcwICAgICAgICAgIHdyaXRlbCgweEZGRkZGRkZGLCBtY2RlLT5yZWdzICsgTUNERV9SSVNFUlIp
OwogICA0NzEgIAogICA0NzIgICAgICAgICAgLyogU3Bhd24gY2hpbGQgZGV2aWNlcyBmb3IgdGhl
IERTSSBwb3J0cyAqLwogICA0NzMgICAgICAgICAgZGV2bV9vZl9wbGF0Zm9ybV9wb3B1bGF0ZShk
ZXYpOwogICA0NzQgIAogICA0NzUgICAgICAgICAgLyogQ3JlYXRlIHNvbWV0aGluZyB0aGF0IHdp
bGwgbWF0Y2ggdGhlIHN1YmRyaXZlcnMgd2hlbiB3ZSBiaW5kICovCiAgIDQ3NiAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShtY2RlX2NvbXBvbmVudF9kcml2ZXJzKTsgaSsrKSB7
CiAgIDQ3NyAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYgPSAmbWNk
ZV9jb21wb25lbnRfZHJpdmVyc1tpXS0+ZHJpdmVyOwogICA0NzggICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZGV2aWNlICpwID0gTlVMTCwgKmQ7CiAgIDQ3OSAgCiAgIDQ4MCAgICAgICAgICAgICAg
ICAgIHdoaWxlICgoZCA9IGJ1c19maW5kX2RldmljZSgmcGxhdGZvcm1fYnVzX3R5cGUsIHAsIGRy
diwKICAgNDgxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2
b2lkICopcGxhdGZvcm1fYnVzX3R5cGUubWF0Y2gpKSkgewogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXgpUaGUgY29uY2VybiB3b3VsZCBiZSB0aGF0IHRoaXMgY29uZGludGlvbiBpcyBuZXZlciBt
ZXQuICBJIHN1c3BldCB0aGF0J3MKbm90IHBvc3NpYmxlPwoKICAgNDgyICAgICAgICAgICAgICAg
ICAgICAgICAgICBwdXRfZGV2aWNlKHApOwogICA0ODMgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBvbmVudF9tYXRjaF9hZGQoZGV2LCAmbWF0Y2gsIG1jZGVfY29tcGFyZV9kZXYsIGQpOwog
ICA0ODQgICAgICAgICAgICAgICAgICAgICAgICAgIHAgPSBkOwogICA0ODUgICAgICAgICAgICAg
ICAgICB9CiAgIDQ4NiAgICAgICAgICAgICAgICAgIHB1dF9kZXZpY2UocCk7CiAgIDQ4NyAgICAg
ICAgICB9CiAgIDQ4OCAgICAgICAgICBpZiAoSVNfRVJSKG1hdGNoKSkgewogICA0ODkgICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgImNvdWxkIG5vdCBjcmVhdGUgY29tcG9uZW50IG1hdGNo
XG4iKTsKICAgNDkwICAgICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihtYXRjaCk7CiAgIDQ5
MSAgICAgICAgICAgICAgICAgIGdvdG8gY2xrX2Rpc2FibGU7CiAgIDQ5MiAgICAgICAgICB9CiAg
IDQ5MyAgICAgICAgICByZXQgPSBjb21wb25lbnRfbWFzdGVyX2FkZF93aXRoX21hdGNoKCZwZGV2
LT5kZXYsICZtY2RlX2RybV9jb21wX29wcywKICAgNDk0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWF0Y2gpOwogICA0OTUgICAgICAgICAgaWYgKHJldCkg
ewoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
