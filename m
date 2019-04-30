Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9F105CE
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC07D8938F;
	Wed,  1 May 2019 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0189155;
 Tue, 30 Apr 2019 17:00:31 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UGxQ37020232;
 Tue, 30 Apr 2019 16:59:58 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2s4fqq5s2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:59:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UGwg5a154426;
 Tue, 30 Apr 2019 16:59:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2s4d4amt2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:59:57 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3UGxltq008049;
 Tue, 30 Apr 2019 16:59:47 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Apr 2019 09:59:47 -0700
Subject: Re: [PATCH] dma-buf: add struct dma_buf_attach_info v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 xen-devel@lists.xenproject.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sstabellini@kernel.org, jgross@suse.com,
 digetx@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 mchehab@kernel.org, kyungmin.park@samsung.com,
 m.szyprowski@samsung.com, pawel@osciak.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, tomi.valkeinen@ti.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 jani.nikula@linux.intel.com, sean@poorly.run,
 maxime.ripard@bootlin.com, maarten.lankhorst@linux.intel.com,
 linux@armlinux.org.uk, sumit.semwal@linaro.org
References: <20190430111002.106168-1-christian.koenig@amd.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <acaa403e-ad0f-dcf5-bccb-6b7331381889@oracle.com>
Date: Tue, 30 Apr 2019 12:59:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430111002.106168-1-christian.koenig@amd.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=902
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300103
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=931 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300103
X-Mailman-Approved-At: Wed, 01 May 2019 07:18:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=O3ZAt3pwdEEQS+GY/GtCTEFfPCwH7GRC22PR7x8CM1I=;
 b=XFIYQLYQSdFGS54EVDNiAeucEd0luZjIGwe/Tx4MxFXM2RvVV6lsfUh5XWBYVAqXoko3
 68QYVG0pUFB3G9JPJvadr9ngsX59J2i32o41iYiTyj0Q4YFzThnXFgjDGwVMgyS9Nfs1
 PfHuN+ObAJ5retPnNZp87vijki+exHhzYahHJ7IepU56N5E5DRGjQGeWUyuBaD7wom6F
 LOocd3x910G9ohoUU9wG2xxhotEfzm8E7Ykcg5jBD7ubOp5YvtU+ANo7J71X3pp8MxUy
 OK0i98/tbD0pE+K1p3X/qaZA7Q3VV6vpMscLMNWcScsDm/7UZeLY9m8zYSegdk465BQ/ 8g== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC8zMC8xOSA3OjEwIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVm
LmMKPiBpbmRleCAyYzRmMzI0Zjg2MjYuLmNhY2NhODMwYjQ4MiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMKPiArKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVm
LmMKPiBAQCAtNjA4LDYgKzYwOCw3IEBAIGRtYWJ1Zl9pbXBfdG9fcmVmcyhzdHJ1Y3QgZ250ZGV2
X2RtYWJ1Zl9wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJICAgaW50IGZkLCBp
bnQgY291bnQsIGludCBkb21pZCkKPiAgewo+ICAJc3RydWN0IGdudGRldl9kbWFidWYgKmdudGRl
dl9kbWFidWYsICpyZXQ7Cj4gKwlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2hfaW5mbyBhdHRhY2hfaW5m
bzsKPiAgCXN0cnVjdCBkbWFfYnVmICpkbWFfYnVmOwo+ICAJc3RydWN0IGRtYV9idWZfYXR0YWNo
bWVudCAqYXR0YWNoOwo+ICAJc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gQEAgLTYyNyw2ICs2Mjgs
OSBAQCBkbWFidWZfaW1wX3RvX3JlZnMoc3RydWN0IGdudGRldl9kbWFidWZfcHJpdiAqcHJpdiwg
c3RydWN0IGRldmljZSAqZGV2LAo+ICAJZ250ZGV2X2RtYWJ1Zi0+cHJpdiA9IHByaXY7Cj4gIAln
bnRkZXZfZG1hYnVmLT5mZCA9IGZkOwo+ICAKPiArCW1lbXNldCgmYXR0YWNoX2luZm8sIDAsIHNp
emVvZihhdHRhY2hfaW5mbykpOwo+ICsJYXR0YWNoX2luZm8uZGV2ID0gZGV2Owo+ICsJYXR0YWNo
X2luZm8uZG1hYnVmID0gZG1hX2J1ZjsKPiAgCWF0dGFjaCA9IGRtYV9idWZfYXR0YWNoKGRtYV9i
dWYsIGRldik7Cj4gIAlpZiAoSVNfRVJSKGF0dGFjaCkpIHsKPiAgCQlyZXQgPSBFUlJfQ0FTVChh
dHRhY2gpOwoKVGhpcyB3b24ndCBidWlsZC4KCkRpZCB5b3UgbWVhbgoKwqDCoMKgIGF0dGFjaCA9
IGRtYV9idWZfYXR0YWNoKCZhdHRhY2hfaW5mbyk7Cgo/CgotYm9yaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
