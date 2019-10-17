Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B93DA819
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5414A89C63;
	Thu, 17 Oct 2019 09:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167489C53;
 Thu, 17 Oct 2019 09:12:38 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9H93ugn068229;
 Thu, 17 Oct 2019 09:12:29 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2vk68uvyg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 09:12:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9H98RXO077953;
 Thu, 17 Oct 2019 09:12:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2vp3bk9pac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 09:12:29 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9H9CPgp032685;
 Thu, 17 Oct 2019 09:12:26 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Oct 2019 09:12:25 +0000
Date: Thu, 17 Oct 2019 12:12:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rex Zhu <rex.zhu@amd.com>, Jim Qu <Jim.Qu@amd.com>
Subject: [PATCH] drm/amdgpu/vi: silence an uninitialized variable warning
Message-ID: <20191017091216.GA31278@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9412
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910170082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9412
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910170082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Zrwqg2bLXgsav5RbPkzHmjIiiQ7AKGewzLzk8pHVAxU=;
 b=QI5e57E+HaKyYh//wP9cMvuKgbEn0cAlW2jqkKwDRen6u7svp+dclF2hUgpZkKQeFxyK
 SO9uYymR5P2lm+MekkTrNcU4kZ4j4vtQPTk17cB7hpIzbaM3VURDH3vEXIFmH09CpLoL
 PrR/0t16CdF37Cf8r6gqaG4jQCBFDNOKu8jIMvupeelJYdj37YXCAFsuJC4ocrGpTXgG
 zL5XWQ6N+V3buE0piuz9d7rK8gQm75TmekIPi+SeJhcI33J4NGJhgtzJfPYZEnJQW3nn
 IOQLx+bWqA7hChaQkK2Ai6lcqoalTcoNKCYp6v5kvE93nGygt4ydVHAv/MXtmUJg9KdG WA== 
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U21hdGNoIGNvbXBsYWlucyB0aGF0IHdlIG5lZWQgdG8gaW5pdGlhbGl6ZWQgIipjYXAiIG90aGVy
d2lzZSBpdCBjYW4KbGVhZCB0byBhbiB1bmluaXRpYWxpemVkIHZhcmlhYmxlIGJ1ZyBpbiB0aGUg
Y2FsbGVyLiAgVGhpcyBzZWVtcyBsaWtlIGEKcmVhc29uYWJsZSB3YXJuaW5nIGFuZCBpdCBkb2Vz
bid0IGh1cnQgdG8gc2lsZW5jZSBpdCBhdCBsZWFzdC4KCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3ZpLmM6NzY3IHZpX2FzaWNfcmVzZXRfbWV0aG9kKCkgZXJyb3I6IHVuaW5pdGlhbGl6ZWQg
c3ltYm9sICdiYWNvX3Jlc2V0Jy4KCkZpeGVzOiA0MjVkYjI1NTNlNDMgKCJkcm0vYW1kZ3B1OiBl
eHBvc2UgQkFDTyBpbnRlcmZhY2VzIHRvIHVwcGVyIGxldmVsIGZyb20gUFAiKQpTaWduZWQtb2Zm
LWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRfcG93ZXJwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRfcG93ZXJwbGF5LmMKaW5kZXggODMxOTZiNzllZGQ1Li5mNGZmMTUzNzhlNjEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMKQEAgLTE0MjEsNiAr
MTQyMSw3IEBAIHN0YXRpYyBpbnQgcHBfZ2V0X2FzaWNfYmFjb19jYXBhYmlsaXR5KHZvaWQgKmhh
bmRsZSwgYm9vbCAqY2FwKQogewogCXN0cnVjdCBwcF9od21nciAqaHdtZ3IgPSBoYW5kbGU7CiAK
KwkqY2FwID0gZmFsc2U7CiAJaWYgKCFod21ncikKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
