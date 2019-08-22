Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADCD98EFB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6AA6E449;
	Thu, 22 Aug 2019 09:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AAF6E449
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:15:25 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7M99VLj128070;
 Thu, 22 Aug 2019 09:15:20 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2ue90tv851-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 09:15:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7M9CqjY038910;
 Thu, 22 Aug 2019 09:15:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2uh2q5pp8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 09:15:19 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7M9FIWC014391;
 Thu, 22 Aug 2019 09:15:18 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Aug 2019 02:15:18 -0700
Date: Thu, 22 Aug 2019 12:15:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: steven.price@arm.com
Subject: [bug report] drm/panfrost: Enable devfreq to work without regulator
Message-ID: <20190822091512.GA32661@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=601
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908220101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=661 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908220101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=uj6MX2+6ecPWatshVWK8lRDZ1P53W3aDgZ7/fZmOEGE=;
 b=akGHubi2iYq++kbB6poMMHrLLIl9pvUcRPYxC1qUHRs4OYtgCOrM7QbhfCgzA33TZuZs
 OKnn8WpSdn1OwZyB8R2CF5frsl3KOh6+gCqVzDRqIHArCeqBscQpZkk1Q8zjJCTXsBbL
 YwxnNNF2lT/OFb8lNIgYz6R8BfqToj1fU4IswVzkGd9ecioYL0rzGIoWGEf8UYxTk2FP
 21vkHfyZNq60EWA+iG8iePXqX8kqawi3frmztdW8JBePrCyCoVQWUQM5qrl1QQ59BW97
 P7v8jqy3NjP58luzousZvlEN54Yvg7EYE1nIjBSSuZMltJrZlACoyudCYgFXBRvTbctW DA== 
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

SGVsbG8gU3RldmVuIFByaWNlLAoKVGhpcyBpcyBhIHNlbWktYXV0b21hdGljIGVtYWlsIGFib3V0
IG5ldyBzdGF0aWMgY2hlY2tlciB3YXJuaW5ncy4KClRoZSBwYXRjaCBlMjFkZDI5MDg4MWI6ICJk
cm0vcGFuZnJvc3Q6IEVuYWJsZSBkZXZmcmVxIHRvIHdvcmsgd2l0aG91dCAKcmVndWxhdG9yIiBm
cm9tIEF1ZyAxNiwgMjAxOSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggY29tcGxhaW50
OgoKICAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmM6NTYgcGFu
ZnJvc3RfZGV2ZnJlcV90YXJnZXQoKQogICAgZXJyb3I6IHdlIHByZXZpb3VzbHkgYXNzdW1lZCAn
cGZkZXYtPnJlZ3VsYXRvcicgY291bGQgYmUgbnVsbCAoc2VlIGxpbmUgNDIpCgpkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCiAgICA0MQkJICovCiAgICA0MgkJaWYg
KG9sZF9jbGtfcmF0ZSA8IHRhcmdldF9yYXRlICYmIHBmZGV2LT5yZWd1bGF0b3IpIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5e
Xl5eCldlIGFkZGVkIHNvbWUgbmV3IGNoZWNrcy4KCiAgICA0MwkJCWVyciA9IHJlZ3VsYXRvcl9z
ZXRfdm9sdGFnZShwZmRldi0+cmVndWxhdG9yLCB0YXJnZXRfdm9sdCwKICAgIDQ0CQkJCQkJICAg
IHRhcmdldF92b2x0KTsKICAgIDQ1CQkJaWYgKGVycikgewogICAgNDYJCQkJZGV2X2VycihkZXYs
ICJDYW5ub3Qgc2V0IHZvbHRhZ2UgJWx1IHVWXG4iLAogICAgNDcJCQkJCXRhcmdldF92b2x0KTsK
ICAgIDQ4CQkJCXJldHVybiBlcnI7CiAgICA0OQkJCX0KICAgIDUwCQl9CiAgICA1MQkKICAgIDUy
CQllcnIgPSBjbGtfc2V0X3JhdGUocGZkZXYtPmNsb2NrLCB0YXJnZXRfcmF0ZSk7CiAgICA1MwkJ
aWYgKGVycikgewogICAgNTQJCQlkZXZfZXJyKGRldiwgIkNhbm5vdCBzZXQgZnJlcXVlbmN5ICVs
dSAoJWQpXG4iLCB0YXJnZXRfcmF0ZSwKICAgIDU1CQkJCWVycik7CiAgICA1NgkJCXJlZ3VsYXRv
cl9zZXRfdm9sdGFnZShwZmRldi0+cmVndWxhdG9yLCBwZmRldi0+ZGV2ZnJlcS5jdXJfdm9sdCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5e
Xl5eXl4KQnV0IGhlcmUgaXQgaXNuJ3QgY2hlY2tlZC4KCiAgICA1NwkJCQkJICAgICAgcGZkZXYt
PmRldmZyZXEuY3VyX3ZvbHQpOwogICAgNTgJCQlyZXR1cm4gZXJyOwoKcmVnYXJkcywKZGFuIGNh
cnBlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
