Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00014CDDBD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 10:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C8989B57;
	Mon,  7 Oct 2019 08:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF62A89B57;
 Mon,  7 Oct 2019 08:52:30 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978n6NZ016363;
 Mon, 7 Oct 2019 08:52:24 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2vektr595p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Oct 2019 08:52:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978nRPk168605;
 Mon, 7 Oct 2019 08:52:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2vf4ph51hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Oct 2019 08:52:23 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x978qJsS013670;
 Mon, 7 Oct 2019 08:52:19 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Oct 2019 01:52:18 -0700
Date: Mon, 7 Oct 2019 11:52:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Subject: [PATCH] drm/amdkfd: Fix a && vs || typo
Message-ID: <20191007085210.GC3865@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070092
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Y5VOBdhJYKoOEWNwAuCcUBHYzyxa8LK1tzzam4leBDU=;
 b=c0Ijq4zrQVBB/Q4fuLRAvEIQ73uV8fQTTSwebMH3HJ492aK3BNojbVjOkSvrovKi83Ik
 QqazFaG//MtXU7O9FnKwdP1qxFGfs7yKF+kd7MX94XeDwdqg+0YgdYi7MuHhPmTv3sGB
 Dj7/VEE2D5N8aeK0cOEDwefqWKdCRjuBecNeTVhq+6BPCXEbLn8BG14Pu+s5WFGtnpjf
 2dVKvQphNnyYFaE6C9owConaaLtoVz0hfUxCC9DRXrlmN01LnwyyimJUVL3E+HNSHC11
 vdu3MLE9+PMhzXP6XUzfZSSIq+UWySlDtcO9+9guYw4UANgXS38u/KJX189EKwKQ+xxj CA== 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGN1cnJlbnQgY29kZSBpZiAiZGV2aWNlX2luZm8iIGlzIGV2ZXIgTlVMTCB0aGVuIHRo
ZSBrZXJuZWwgd2lsbApPb3BzIHNvIHByb2JhYmx5IHx8IHdhcyBpbnRlbmRlZCBpbnN0ZWFkIG9m
ICYmLgoKRml4ZXM6IGUzOTJjODg3ZGY5NyAoImRybS9hbWRrZmQ6IFVzZSBhcnJheSB0byBwcm9i
ZSBrZmQya2dkX2NhbGxzIikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwppbmRleCAwZGIyNzM1ODdh
ZjQuLjA3MGM5YjU1OTNjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
YwpAQCAtNDk4LDcgKzQ5OCw3IEBAIHN0cnVjdCBrZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0cnVj
dCBrZ2RfZGV2ICprZ2QsCiAJZGV2aWNlX2luZm8gPSBrZmRfc3VwcG9ydGVkX2RldmljZXNbYXNp
Y190eXBlXVt2Zl07CiAJZjJnID0ga2ZkMmtnZF9mdW5jc1thc2ljX3R5cGVdOwogCi0JaWYgKCFk
ZXZpY2VfaW5mbyAmJiAhZjJnKSB7CisJaWYgKCFkZXZpY2VfaW5mbyB8fCAhZjJnKSB7CiAJCWRl
dl9lcnIoa2ZkX2RldmljZSwgIiVzICVzIG5vdCBzdXBwb3J0ZWQgaW4ga2ZkXG4iLAogCQkJYW1k
Z3B1X2FzaWNfbmFtZVthc2ljX3R5cGVdLCB2ZiA/ICJWRiIgOiAiIik7CiAJCXJldHVybiBOVUxM
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
