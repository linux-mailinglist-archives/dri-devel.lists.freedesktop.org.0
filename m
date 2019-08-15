Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE598E679
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9C06E8D3;
	Thu, 15 Aug 2019 08:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE006E28F;
 Thu, 15 Aug 2019 08:34:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7F8XgSD024871;
 Thu, 15 Aug 2019 08:33:46 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u9nvphr35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 08:33:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7F8Wk1E041808;
 Thu, 15 Aug 2019 08:33:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2ucpys57jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 08:33:45 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7F8Xi44021729;
 Thu, 15 Aug 2019 08:33:44 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Aug 2019 01:33:44 -0700
Date: Thu, 15 Aug 2019 11:33:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: [PATCH] drm/i915/tgl: Fix TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT() macro
Message-ID: <20190815083336.GE27238@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9349
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908150091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9349
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908150091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=gG3j06ACRl/0PxTv3WPW8jRGeeDFbEtjRamT4x02tQQ=;
 b=JldSzA6b3/oxV2saYFnYiFYd23TyeZTQQiYtXi9Q8/Qa4HFWDyjj0Jwg+QX2I8DjrbIr
 2wUoGiAVsMRJdybPh808U3wa5cDYLuCeg04pjSJyGsejDHcJmqs5bfZC52q+CtGCgm5I
 sRSu97ck23QUDxO88IbDfEaqaL9IBjAa5O15343ruXKHtjg4MePcgOdutiqb2H97yzks
 Dwi3T52FOqCsu9xHAGjReW1U1zv1hSbWcF1PQ99GQ6R6iuin78xwDpmnBvEPsyKWWQiY
 OYYXG6ayAUMupEE8ffER8B49EC20Bpmpi7nNRLhMWUATf3muQFNoZyO9BMcGViMpAOWA 2A== 
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWNybyBkb2Vzbid0IHdvcmsgYmVjYXVzZSB0aGUgcmlnaHQgc2hpZnQgaGFzIGhpZ2hl
ciBwcmVjZWRlbmNlCnRoYW4gYml0d2lzZSBBTkQuCgpGaXhlczogOTc0OWE1YjZjMDlmICgiZHJt
L2k5MTUvdGdsOiBGaXggdGhlIHJlYWQgb2YgdGhlIERESSB0aGF0IHRyYW5zY29kZXIgaXMgYXR0
YWNoZWQgdG8iKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3JlZy5oCmluZGV4IDRhOTQ3YmQwYTI5NC4uZGVmNmRiZGM3ZTJlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfcmVnLmgKQEAgLTk0MzMsNyArOTQzMyw3IEBAIGVudW0gc2tsX3Bvd2VyX2dhdGUgewog
I2RlZmluZSAgVFJBTlNfRERJX1NFTEVDVF9QT1JUKHgpCSgoeCkgPDwgVFJBTlNfRERJX1BPUlRf
U0hJRlQpCiAjZGVmaW5lICBUR0xfVFJBTlNfRERJX1NFTEVDVF9QT1JUKHgpCSgoKHgpICsgMSkg
PDwgVEdMX1RSQU5TX0RESV9QT1JUX1NISUZUKQogI2RlZmluZSAgVFJBTlNfRERJX0ZVTkNfQ1RM
X1ZBTF9UT19QT1JUKHZhbCkJICgoKHZhbCkgJiBUUkFOU19ERElfUE9SVF9NQVNLKSA+PiBUUkFO
U19ERElfUE9SVF9TSElGVCkKLSNkZWZpbmUgIFRHTF9UUkFOU19ERElfRlVOQ19DVExfVkFMX1RP
X1BPUlQodmFsKSAoKCh2YWwpICYgVEdMX1RSQU5TX0RESV9QT1JUX01BU0sgPj4gVEdMX1RSQU5T
X0RESV9QT1JUX1NISUZUKSAtIDEpCisjZGVmaW5lICBUR0xfVFJBTlNfRERJX0ZVTkNfQ1RMX1ZB
TF9UT19QT1JUKHZhbCkgKCgoKHZhbCkgJiBUR0xfVFJBTlNfRERJX1BPUlRfTUFTSykgPj4gVEdM
X1RSQU5TX0RESV9QT1JUX1NISUZUKSAtIDEpCiAjZGVmaW5lICBUUkFOU19ERElfTU9ERV9TRUxF
Q1RfTUFTSwkoNyA8PCAyNCkKICNkZWZpbmUgIFRSQU5TX0RESV9NT0RFX1NFTEVDVF9IRE1JCSgw
IDw8IDI0KQogI2RlZmluZSAgVFJBTlNfRERJX01PREVfU0VMRUNUX0RWSQkoMSA8PCAyNCkKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
