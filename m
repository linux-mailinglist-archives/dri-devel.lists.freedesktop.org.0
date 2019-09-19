Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CAB8C01
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432CA6F7C2;
	Fri, 20 Sep 2019 07:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D05E6F975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919142324euoutp01737edf92bd5b3e21ead3544e7e2caa74~F3PhPLwFn2256022560euoutp01W
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190919142324euoutp01737edf92bd5b3e21ead3544e7e2caa74~F3PhPLwFn2256022560euoutp01W
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190919142323eucas1p19985294982f8a206d190447d9d111ac6~F3Pgvj2m30292702927eucas1p17;
 Thu, 19 Sep 2019 14:23:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 54.0C.04469.B5F838D5; Thu, 19
 Sep 2019 15:23:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142322eucas1p1949ad95468af26698c4c5addc060ce00~F3Pf9116O1888018880eucas1p18;
 Thu, 19 Sep 2019 14:23:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190919142322eusmtrp1d6241a1800bd62d08a28d8a886482408~F3Pfuxx9k0555105551eusmtrp1N;
 Thu, 19 Sep 2019 14:23:22 +0000 (GMT)
X-AuditID: cbfec7f2-994db9c000001175-fe-5d838f5b4888
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3E.55.04117.A5F838D5; Thu, 19
 Sep 2019 15:23:22 +0100 (BST)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142321eusmtip1ddb6ff07278fac49544b852180531b8e~F3Pe9szH-3161631616eusmtip1b;
 Thu, 19 Sep 2019 14:23:21 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 02/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init_passive()
Date: Thu, 19 Sep 2019 16:22:27 +0200
Message-Id: <20190919142236.4071-3-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SeyyVYRjv/W7nI0efo+aJppytNjZKsd6GRqv1ra3Lam2NoVO+0XLrfC6V
 LbdpkVRouYWW5TbDQSFUpxM144RSQsdWVsllrslWy/FR/vu9v8vze57tZUnFJ9qaPRcaIahD
 VcFKxpR61PpL7+hzM9F3x1QhYG1rnQwb8pMQrs6qpPH7ma80LtB10vjt7ASD7zZrGJxuuEVh
 vb5KhksGJ2ms+dxL457GPAZP39AhnKVvIXCFblCG++NLGJyV8Z3xtOA1ZckMP9DbxPCG620E
 X1MUy1eP1xP88/Emgk+rLUP8tMb2GOtt6h4gBJ+LEtTb9542DfrWMUKGP914MX7qFRGH4jek
 IBMWOBcY+FNBGrGCK0HQ0rM2BZku4hkET2pGGekxjeBFwzy1kpjrf0pLQjGCx8WV1L/Iz/xy
 xuhiOC9IvzMkMwrrOR2CjMKJJRfJFRGQlqtfarTk/GD2Rx+RgliW4rZCwjs7Iy3nMJSPliKp
 bjOUVz1bsptwe2CmpYCSPBbwOvvLEiYXPYl1uaRxPnBJLMw96yCl8H54PpFJSNgSRtpqZRLe
 BO0Zqcv3iDDcYKClcBwCzUPdctgNXrR10cblSM4eKhu3S7QX5Ob2UEYaOHP4MGYh7WAO6Y/u
 khIth2tXFRJUQmO2uRQESCjvXZ7NQ2njbeYWsstZdUzOqmNy/tcWIrIMWQmRYkigIDqHCtFO
 oipEjAwNdDobFqJBi7+u/U/bVD2a7T6jRRyLlGbyLdGJvgpaFSVeCtEiYEnlenmea4KvQh6g
 unRZUIf5qyODBVGLbFhKaSWPWTPko+ACVRHCeUEIF9QrKsGaWMehhrqjI9ormR3NJzyPnI7x
 6Gw6m3rK+eVvb7/hB9MHzWz3drvKdyksttTYJQlpB7y2DTlMjt6zHfZQOzq/uRx7yPrAPlm2
 wx37N81d4Yn2Fw8r1J+PZyfX9q+j/dm5lkMLvgvBGupCa9d5K5eondW775/82DdmEz1xuDdr
 vqDU4O4W7aWkxCCVswOpFlV/AfT9tq9xAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7pR/c2xBsueqFgcOraV3eL+vFZG
 i40z1rNaXP/ynNVi/pFzrBZXvr5ns5i+dxObxaT7E1gszp/fwG6x4u5HVotNj6+xWlzeNYfN
 4nPvEUaLGef3MVmsPXKX3eJ24wo2ixmTX7I5CHpsWtXJ5nHn2h42j/vdx5k8Ni+p99j4bgeT
 x8F3e5g8+rasYvT4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
 ziYlNSezLLVI3y5BL+PF2VfMBfslKxo/nWBqYGwU7WLk5JAQMJH4dns/K4gtJLCUUeLeUxWI
 uITEx/U3WCFsYYk/17rYuhi5gGo+MUpMmjGDBSTBJuAoMWnqA3aQhIjAKUaJrcvPgVUxC2xg
 klj+9CVYu7BAjMSSjTeZuhg5OFgEVCWariqChHkFLCRWv1nJCLFBXmL1hgPMIDangKXEl33z
 WSAuspCY+3guI0S9oMTJmU9YQMYwC6hLrJ8nBBJmBmpt3jqbeQKj4CwkVbMQqmYhqVrAyLyK
 USS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMIK3Hfu5ZQdj17vgQ4wCHIxKPLwK5c2xQqyJZcWV
 uYcYJTiYlUR455g2xQrxpiRWVqUW5ccXleakFh9iNAX6bCKzlGhyPjC55JXEG5oamltYGpob
 mxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYFQQ3u1sNGGxUdVs5eNLNj8Wrwn++TTk
 ztZJsl3VRzPeFNxm9f1xOvy4vlRqa94erpXiiftLN0ds27b8yIP2K4727O5pWW1/rvxPnSs8
 49ICKx/VOyrHJrAIpnNbiv/5KHArllGX/bPfPc1+Obbgqqs+3//lfPhbysPncXk7w3Rvb6fH
 O5N1m5VYijMSDbWYi4oTATIk7Rz2AgAA
X-CMS-MailID: 20190919142322eucas1p1949ad95468af26698c4c5addc060ce00
X-Msg-Generator: CA
X-RootMTR: 20190919142322eucas1p1949ad95468af26698c4c5addc060ce00
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190919142322eucas1p1949ad95468af26698c4c5addc060ce00
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142322eucas1p1949ad95468af26698c4c5addc060ce00@eucas1p1.samsung.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568903004;
 bh=g5BuchGjulmMrqHu7UnNWSPjw3PX42w6jYwlR2z1Rfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C6T3JoXrmDr315AUzTCkwRr7TLrJk/JzHE+8ZjeINxyUxVi2O3ZZ/XdmhsTqX8rNd
 /fmKEK8gLqTdUqzVIGBIl4F+bdYD62cdJhcJ6BjlPXP+qFaYDEvD/tZMSIRqz++CCs
 db6LidNrZM+h7Mcai8dEX++P5K4TggX6kGGw8JTA=
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
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>,
 b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+CgpUaGlz
IHBhdGNoIGFkZHMgYSBuZXcgc3RhdGljIGZ1bmN0aW9uLCBleHlub3NfYnVzX3Byb2ZpbGVfaW5p
dF9wYXNzaXZlKCksCmV4dHJhY3RlZCBmcm9tIGV4eW5vc19idXNfcHJvYmUoKS4KClNpZ25lZC1v
ZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBwYXJ0bmVyLnNhbXN1bmcuY29tPgotLS0K
IGRyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMgfCA3MCArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jIGIvZHJp
dmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYwppbmRleCA3OGYzOGI3ZmI1OTYuLmY4NWJlZDI0MTYz
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYworKysgYi9kcml2ZXJz
L2RldmZyZXEvZXh5bm9zLWJ1cy5jCkBAIC0zMzgsMTMgKzMzOCw1MSBAQCBzdGF0aWMgaW50IGV4
eW5vc19idXNfcHJvZmlsZV9pbml0KHN0cnVjdCBleHlub3NfYnVzICpidXMsCiAJcmV0dXJuIHJl
dDsKIH0KIAorc3RhdGljIGludCBleHlub3NfYnVzX3Byb2ZpbGVfaW5pdF9wYXNzaXZlKHN0cnVj
dCBleHlub3NfYnVzICpidXMsCisJCQkJCSAgIHN0cnVjdCBkZXZmcmVxX2Rldl9wcm9maWxlICpw
cm9maWxlKQoreworCXN0cnVjdCBkZXZpY2UgKmRldiA9IGJ1cy0+ZGV2OworCXN0cnVjdCBkZXZm
cmVxX3Bhc3NpdmVfZGF0YSAqcGFzc2l2ZV9kYXRhOworCXN0cnVjdCBkZXZmcmVxICpwYXJlbnRf
ZGV2ZnJlcTsKKwlpbnQgcmV0ID0gMDsKKworCS8qIEluaXRpYWxpemUgdGhlIHN0cnVjdCBwcm9m
aWxlIGFuZCBnb3Zlcm5vciBkYXRhIGZvciBwYXNzaXZlIGRldmljZSAqLworCXByb2ZpbGUtPnRh
cmdldCA9IGV4eW5vc19idXNfdGFyZ2V0OworCXByb2ZpbGUtPmV4aXQgPSBleHlub3NfYnVzX3Bh
c3NpdmVfZXhpdDsKKworCS8qIEdldCB0aGUgaW5zdGFuY2Ugb2YgcGFyZW50IGRldmZyZXEgZGV2
aWNlICovCisJcGFyZW50X2RldmZyZXEgPSBkZXZmcmVxX2dldF9kZXZmcmVxX2J5X3BoYW5kbGUo
ZGV2LCAwKTsKKwlpZiAoSVNfRVJSKHBhcmVudF9kZXZmcmVxKSkgeworCQlyZXQgPSAtRVBST0JF
X0RFRkVSOworCQlnb3RvIGVycjsKKwl9CisKKwlwYXNzaXZlX2RhdGEgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKnBhc3NpdmVfZGF0YSksIEdGUF9LRVJORUwpOworCWlmICghcGFzc2l2ZV9k
YXRhKSB7CisJCXJldCA9IC1FTk9NRU07CisJCWdvdG8gZXJyOworCX0KKwlwYXNzaXZlX2RhdGEt
PnBhcmVudCA9IHBhcmVudF9kZXZmcmVxOworCisJLyogQWRkIGRldmZyZXEgZGV2aWNlIGZvciBl
eHlub3MgYnVzIHdpdGggcGFzc2l2ZSBnb3Zlcm5vciAqLworCWJ1cy0+ZGV2ZnJlcSA9IGRldm1f
ZGV2ZnJlcV9hZGRfZGV2aWNlKGRldiwgcHJvZmlsZSwgREVWRlJFUV9HT1ZfUEFTU0lWRSwKKwkJ
CQkJCXBhc3NpdmVfZGF0YSk7CisJaWYgKElTX0VSUihidXMtPmRldmZyZXEpKSB7CisJCWRldl9l
cnIoZGV2LAorCQkJImZhaWxlZCB0byBhZGQgZGV2ZnJlcSBkZXYgd2l0aCBwYXNzaXZlIGdvdmVy
bm9yXG4iKTsKKwkJcmV0ID0gUFRSX0VSUihidXMtPmRldmZyZXEpOworCQlnb3RvIGVycjsKKwl9
CisKK2VycjoKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgaW50IGV4eW5vc19idXNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2OwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGUsICpub2Rl
OwogCXN0cnVjdCBkZXZmcmVxX2Rldl9wcm9maWxlICpwcm9maWxlOwotCXN0cnVjdCBkZXZmcmVx
X3Bhc3NpdmVfZGF0YSAqcGFzc2l2ZV9kYXRhOwotCXN0cnVjdCBkZXZmcmVxICpwYXJlbnRfZGV2
ZnJlcTsKIAlzdHJ1Y3QgZXh5bm9zX2J1cyAqYnVzOwogCWludCByZXQsIG1heF9zdGF0ZTsKIAl1
bnNpZ25lZCBsb25nIG1pbl9mcmVxLCBtYXhfZnJlcTsKQEAgLTM5MCwzMyArNDI4LDkgQEAgc3Rh
dGljIGludCBleHlub3NfYnVzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAK
IAlnb3RvIG91dDsKIHBhc3NpdmU6Ci0JLyogSW5pdGlhbGl6ZSB0aGUgc3RydWN0IHByb2ZpbGUg
YW5kIGdvdmVybm9yIGRhdGEgZm9yIHBhc3NpdmUgZGV2aWNlICovCi0JcHJvZmlsZS0+dGFyZ2V0
ID0gZXh5bm9zX2J1c190YXJnZXQ7Ci0JcHJvZmlsZS0+ZXhpdCA9IGV4eW5vc19idXNfcGFzc2l2
ZV9leGl0OwotCi0JLyogR2V0IHRoZSBpbnN0YW5jZSBvZiBwYXJlbnQgZGV2ZnJlcSBkZXZpY2Ug
Ki8KLQlwYXJlbnRfZGV2ZnJlcSA9IGRldmZyZXFfZ2V0X2RldmZyZXFfYnlfcGhhbmRsZShkZXYs
IDApOwotCWlmIChJU19FUlIocGFyZW50X2RldmZyZXEpKSB7Ci0JCXJldCA9IC1FUFJPQkVfREVG
RVI7CisJcmV0ID0gZXh5bm9zX2J1c19wcm9maWxlX2luaXRfcGFzc2l2ZShidXMsIHByb2ZpbGUp
OworCWlmIChyZXQgPCAwKQogCQlnb3RvIGVycjsKLQl9Ci0KLQlwYXNzaXZlX2RhdGEgPSBkZXZt
X2t6YWxsb2MoZGV2LCBzaXplb2YoKnBhc3NpdmVfZGF0YSksIEdGUF9LRVJORUwpOwotCWlmICgh
cGFzc2l2ZV9kYXRhKSB7Ci0JCXJldCA9IC1FTk9NRU07Ci0JCWdvdG8gZXJyOwotCX0KLQlwYXNz
aXZlX2RhdGEtPnBhcmVudCA9IHBhcmVudF9kZXZmcmVxOwotCi0JLyogQWRkIGRldmZyZXEgZGV2
aWNlIGZvciBleHlub3MgYnVzIHdpdGggcGFzc2l2ZSBnb3Zlcm5vciAqLwotCWJ1cy0+ZGV2ZnJl
cSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2aWNlKGRldiwgcHJvZmlsZSwgREVWRlJFUV9HT1ZfUEFT
U0lWRSwKLQkJCQkJCXBhc3NpdmVfZGF0YSk7Ci0JaWYgKElTX0VSUihidXMtPmRldmZyZXEpKSB7
Ci0JCWRldl9lcnIoZGV2LAotCQkJImZhaWxlZCB0byBhZGQgZGV2ZnJlcSBkZXYgd2l0aCBwYXNz
aXZlIGdvdmVybm9yXG4iKTsKLQkJcmV0ID0gUFRSX0VSUihidXMtPmRldmZyZXEpOwotCQlnb3Rv
IGVycjsKLQl9CiAKIG91dDoKIAltYXhfc3RhdGUgPSBidXMtPmRldmZyZXEtPnByb2ZpbGUtPm1h
eF9zdGF0ZTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
