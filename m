Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915716293
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 13:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A91C89BFE;
	Tue,  7 May 2019 11:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10896 seconds by postgrey-1.36 at gabe;
 Tue, 07 May 2019 11:05:55 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C5589BFE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 11:05:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4783bDF075993;
 Tue, 7 May 2019 08:04:15 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2s94bfu9t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 May 2019 08:04:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4783qFf026633;
 Tue, 7 May 2019 08:04:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2sagytswba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 May 2019 08:04:14 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4784ESj031349;
 Tue, 7 May 2019 08:04:14 GMT
Received: from mwanda (/105.53.239.4) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 May 2019 01:04:12 -0700
Date: Tue, 7 May 2019 11:04:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tomeu.vizoso@collabora.com
Subject: [bug report] drm/panfrost: Add sanity checks to submit IOCTL
Message-ID: <20190507080405.GA9436@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=743
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905070053
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=764 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905070053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=BuP/tp034jAagRiNMXD+EVbpGeXNFVSild59UgMbVHs=;
 b=ogvk/B+3zpAHX12dqAoPvpZ5QU1kV0Va6RVYhi00JLmTFnyZVp/tbDQqmCc9dJ43KPyI
 Pr36SSlS+0KC7FFu6uuWqKCDkGjkBjWkOdid1WDXawrZcW3e0hUpl5jR0bT7uySExfbV
 qrVVStl4t+GE0FJMyv2wY1hFYirDJQVl6ODHQpdUsHyVG647qoCwNVZXRgI4TEYH00Ru
 /Ftu86yzvOZBMCYPECnoEotB3iHUIzmx0esDdYQ01mpJVGdverXIUueEGDn9cHbotFNq
 NjBmzslhNbNzynIYzpOBt3lrZ1UfC5X1IndTuPruz2iDdTw8KB3RThkkQB8Ij8b5DR5S 3A== 
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

SGVsbG8gVG9tZXUgVml6b3NvLAoKVGhlIHBhdGNoIDZmZjQwOGU2ZGMyMDogImRybS9wYW5mcm9z
dDogQWRkIHNhbml0eSBjaGVja3MgdG8gc3VibWl0CklPQ1RMIiBmcm9tIEFwciAyNCwgMjAxOSwg
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlcgp3YXJuaW5nOgoKCWRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYzoyMjIgcGFuZnJvc3RfaW9jdGxfc3VibWl0
KCkKCWVycm9yOiB3ZSBwcmV2aW91c2x5IGFzc3VtZWQgJ3N5bmNfb3V0JyBjb3VsZCBiZSBudWxs
IChzZWUgbGluZSAyMTYpCgpkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMK
ICAgMTY4ICBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX3N1Ym1pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAogICAxNjkgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGUpCiAgIDE3MCAgewogICAxNzEgICAgICAgICAgc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogICAxNzIgICAgICAgICAgc3RydWN0IGRybV9w
YW5mcm9zdF9zdWJtaXQgKmFyZ3MgPSBkYXRhOwogICAxNzMgICAgICAgICAgc3RydWN0IGRybV9z
eW5jb2JqICpzeW5jX291dCA9IE5VTEw7CiAgIDE3NCAgICAgICAgICBzdHJ1Y3QgcGFuZnJvc3Rf
am9iICpqb2I7CiAgIDE3NSAgICAgICAgICBpbnQgcmV0ID0gMDsKICAgMTc2ICAKICAgMTc3ICAg
ICAgICAgIGlmICghYXJncy0+amMpCiAgIDE3OCAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwogICAxNzkgIAogICAxODAgICAgICAgICAgaWYgKGFyZ3MtPnJlcXVpcmVtZW50cyAmJiBh
cmdzLT5yZXF1aXJlbWVudHMgIT0gUEFORlJPU1RfSkRfUkVRX0ZTKQogICAxODEgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgMTgyICAKICAgMTgzICAgICAgICAgIGlmIChhcmdz
LT5vdXRfc3luYyA+IDApIHsKICAgMTg0ICAgICAgICAgICAgICAgICAgc3luY19vdXQgPSBkcm1f
c3luY29ial9maW5kKGZpbGUsIGFyZ3MtPm91dF9zeW5jKTsKICAgMTg1ICAgICAgICAgICAgICAg
ICAgaWYgKCFzeW5jX291dCkKICAgMTg2ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0RFVjsKICAgMTg3ICAgICAgICAgIH0KICAgMTg4ICAKICAgMTg5ICAgICAgICAgIGpvYiA9
IGt6YWxsb2Moc2l6ZW9mKCpqb2IpLCBHRlBfS0VSTkVMKTsKICAgMTkwICAgICAgICAgIGlmICgh
am9iKSB7CiAgIDE5MSAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07CiAgIDE5MiAgICAg
ICAgICAgICAgICAgIGdvdG8gZmFpbF9vdXRfc3luYzsKICAgMTkzICAgICAgICAgIH0KICAgMTk0
ICAKICAgMTk1ICAgICAgICAgIGtyZWZfaW5pdCgmam9iLT5yZWZjb3VudCk7CiAgIDE5NiAgCiAg
IDE5NyAgICAgICAgICBqb2ItPnBmZGV2ID0gcGZkZXY7CiAgIDE5OCAgICAgICAgICBqb2ItPmpj
ID0gYXJncy0+amM7CiAgIDE5OSAgICAgICAgICBqb2ItPnJlcXVpcmVtZW50cyA9IGFyZ3MtPnJl
cXVpcmVtZW50czsKICAgMjAwICAgICAgICAgIGpvYi0+Zmx1c2hfaWQgPSBwYW5mcm9zdF9ncHVf
Z2V0X2xhdGVzdF9mbHVzaF9pZChwZmRldik7CiAgIDIwMSAgICAgICAgICBqb2ItPmZpbGVfcHJp
diA9IGZpbGUtPmRyaXZlcl9wcml2OwogICAyMDIgIAogICAyMDMgICAgICAgICAgcmV0ID0gcGFu
ZnJvc3RfY29weV9pbl9zeW5jKGRldiwgZmlsZSwgYXJncywgam9iKTsKICAgMjA0ICAgICAgICAg
IGlmIChyZXQpCiAgIDIwNSAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9qb2I7CiAgIDIwNiAg
CiAgIDIwNyAgICAgICAgICByZXQgPSBwYW5mcm9zdF9sb29rdXBfYm9zKGRldiwgZmlsZSwgYXJn
cywgam9iKTsKICAgMjA4ICAgICAgICAgIGlmIChyZXQpCiAgIDIwOSAgICAgICAgICAgICAgICAg
IGdvdG8gZmFpbF9qb2I7CiAgIDIxMCAgCiAgIDIxMQkJcmV0ID0gcGFuZnJvc3Rfam9iX3B1c2go
am9iKTsKICAgMjEyICAgICAgICAgIGlmIChyZXQpCiAgIDIxMyAgICAgICAgICAgICAgICAgIGdv
dG8gZmFpbF9qb2I7CiAgIDIxNCAgCiAgIDIxNSAgICAgICAgICAvKiBVcGRhdGUgdGhlIHJldHVy
biBzeW5jIG9iamVjdCBmb3IgdGhlIGpvYiAqLwogICAyMTYgICAgICAgICAgaWYgKHN5bmNfb3V0
KQogICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eCkknbSBwcmV0dHkgc3VyZSB0aGlzIGNhbiBi
ZSByZW1vdmVkLgoKCiAgIDIxNyAgICAgICAgICAgICAgICAgIGRybV9zeW5jb2JqX3JlcGxhY2Vf
ZmVuY2Uoc3luY19vdXQsIGpvYi0+cmVuZGVyX2RvbmVfZmVuY2UpOwogICAyMTggIAogICAyMTkg
IGZhaWxfam9iOgogICAyMjAgICAgICAgICAgcGFuZnJvc3Rfam9iX3B1dChqb2IpOwogICAyMjEg
IGZhaWxfb3V0X3N5bmM6CiAgIDIyMiAgICAgICAgICBkcm1fc3luY29ial9wdXQoc3luY19vdXQp
OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eCk90aGVyd2lzZSB3ZSBh
cmUgdG9hc3RlZC4uLgoKICAgMjIzICAKICAgMjI0ICAgICAgICAgIHJldHVybiByZXQ7CiAgIDIy
NSAgfQoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
