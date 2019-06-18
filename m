Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596DB4A1EC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04516E181;
	Tue, 18 Jun 2019 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1274 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2019 13:20:08 UTC
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FBD6E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:20:07 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5IDE9H1141039;
 Tue, 18 Jun 2019 13:18:57 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t4rmp4e27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 13:18:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5IDHB6s090801;
 Tue, 18 Jun 2019 13:18:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t5cpe1u9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 13:18:56 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5IDIqdR004779;
 Tue, 18 Jun 2019 13:18:53 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 06:18:52 -0700
Date: Tue, 18 Jun 2019 16:18:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2] drm: return -EFAULT if copy_to_user() fails
Message-ID: <20190618131843.GA29463@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618125623.GA24896@mwanda>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2018-07-02; bh=6YGkq/bCxydXzjE3rIrKm6a3Acfpx+eRiztMObFEoXg=;
 b=szGxjT+WzGnmVTHS6PTQ63MPSBOaFfXc5TyDAhbtbG0bTU9QX6VcGaveSH+d/fV4cXyi
 u0jVZXOGh9X1OKvk/KMFOjOgV0s9bCg3gwzHeo2l0GrZ9co94BVo8mNri+25Y0h+S3OO
 ly+KilgEjDo6dQU6swmenO8Hsu1kQiOfbZHvF/Um43HMIuZB/dKDJx6o0+PhlSOpnV3S
 kJ/IVhacdQAUX/3XSZyUYlO+izAOGADcJK1q4Mbn0Df0Pl0NhBZWAkLbAvI/1uuKWmKN
 sZA1MIhUY6pdWbS37zPm8QtCIXxx8H1tQlnxDtj0mMpqCEjwIA2+CrDngTXKv8Z2/CIa tw== 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvcHlfZnJvbV91c2VyKCkgZnVuY3Rpb24gcmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVz
IHJlbWFpbmluZwp0byBiZSBjb3BpZWQgYnV0IHdlIHdhbnQgdG8gcmV0dXJuIGEgbmVnYXRpdmUg
ZXJyb3IgY29kZS4gIE90aGVyd2lzZQp0aGUgY2FsbGVycyB0cmVhdCBpdCBhcyBhIHN1Y2Nlc3Nm
dWwgY29weS4KClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3Jh
Y2xlLmNvbT4KLS0tCnYyOiBUaGUgZmlyc3QgdmVyc2lvbiB3YXMgbWlzc2luZyBhIGNodW5rCgog
ZHJpdmVycy9ncHUvZHJtL2RybV9idWZzLmMgIHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9pb2MzMi5jIHwgNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9idWZzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2J1ZnMuYwppbmRleCA2OGRhY2Y4NDIyYzYuLjhjZTlkNzNmYWI0
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9idWZzLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9idWZzLmMKQEAgLTEzNTEsNyArMTM1MSwxMCBAQCBzdGF0aWMgaW50IGNvcHlf
b25lX2J1Zih2b2lkICpkYXRhLCBpbnQgY291bnQsIHN0cnVjdCBkcm1fYnVmX2VudHJ5ICpmcm9t
KQogCQkJCSAuc2l6ZSA9IGZyb20tPmJ1Zl9zaXplLAogCQkJCSAubG93X21hcmsgPSBmcm9tLT5s
b3dfbWFyaywKIAkJCQkgLmhpZ2hfbWFyayA9IGZyb20tPmhpZ2hfbWFya307Ci0JcmV0dXJuIGNv
cHlfdG9fdXNlcih0bywgJnYsIG9mZnNldG9mKHN0cnVjdCBkcm1fYnVmX2Rlc2MsIGZsYWdzKSk7
CisKKwlpZiAoY29weV90b191c2VyKHRvLCAmdiwgb2Zmc2V0b2Yoc3RydWN0IGRybV9idWZfZGVz
YywgZmxhZ3MpKSkKKwkJcmV0dXJuIC1FRkFVTFQ7CisJcmV0dXJuIDA7CiB9CiAKIGludCBkcm1f
bGVnYWN5X2luZm9idWZzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2lvYzMyLmMKaW5kZXggNTg2YWEyODAyNGM1Li5hMTZiNmRjMmZhNDcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvYzMy
LmMKQEAgLTM3OCw3ICszNzgsMTAgQEAgc3RhdGljIGludCBjb3B5X29uZV9idWYzMih2b2lkICpk
YXRhLCBpbnQgY291bnQsIHN0cnVjdCBkcm1fYnVmX2VudHJ5ICpmcm9tKQogCQkJICAgICAgLnNp
emUgPSBmcm9tLT5idWZfc2l6ZSwKIAkJCSAgICAgIC5sb3dfbWFyayA9IGZyb20tPmxvd19tYXJr
LAogCQkJICAgICAgLmhpZ2hfbWFyayA9IGZyb20tPmhpZ2hfbWFya307Ci0JcmV0dXJuIGNvcHlf
dG9fdXNlcih0byArIGNvdW50LCAmdiwgb2Zmc2V0b2YoZHJtX2J1Zl9kZXNjMzJfdCwgZmxhZ3Mp
KTsKKworCWlmIChjb3B5X3RvX3VzZXIodG8gKyBjb3VudCwgJnYsIG9mZnNldG9mKGRybV9idWZf
ZGVzYzMyX3QsIGZsYWdzKSkpCisJCXJldHVybiAtRUZBVUxUOworCXJldHVybiAwOwogfQogCiBz
dGF0aWMgaW50IGRybV9sZWdhY3lfaW5mb2J1ZnMzMihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
