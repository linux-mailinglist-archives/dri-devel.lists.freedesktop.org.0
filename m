Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E51740F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768C589803;
	Wed,  8 May 2019 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95F689291
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 07:02:50 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x48728Zl044453
 for <dri-devel@lists.freedesktop.org>; Wed, 8 May 2019 03:02:49 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sbq0rrtnf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 03:02:49 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Wed, 8 May 2019 08:02:46 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 08:02:39 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4872cK750200764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 07:02:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18D2242047;
 Wed,  8 May 2019 07:02:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64E874204B;
 Wed,  8 May 2019 07:02:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 07:02:37 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1AAB5A03AA;
 Wed,  8 May 2019 17:02:35 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 1/7] lib/hexdump.c: Fix selftests
Date: Wed,  8 May 2019 17:01:41 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508070148.23130-1-alastair@au1.ibm.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050807-0012-0000-0000-000003196F9F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050807-0013-0000-0000-00002151EFD5
Message-Id: <20190508070148.23130-2-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905080046
X-Mailman-Approved-At: Wed, 08 May 2019 08:41:38 +0000
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>,
 Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+CgpUaGUgb3ZlcmZs
b3cgdGVzdHMgZGlkIG5vdCBhY2NvdW50IGZvciB0aGUgc2l0dWF0aW9uIHdoZXJlIG5vCm92ZXJm
bG93IG9jY3VycyBhbmQgbGVuIDwgcm93c2l6ZS4KClRoaXMgcGF0Y2ggcmVuYW1lcyB0aGUgY3J5
cHRpYyB2YXJpYWJsZXMgYW5kIGFjY291bnRzIGZvciB0aGUKYWJvdmUgY2FzZS4KClRoZSBzZWxm
dGVzdHMgbm93IHBhc3MuCgpTaWduZWQtb2ZmLWJ5OiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFp
ckBkLXNpbHZhLm9yZz4KLS0tCiBsaWIvdGVzdF9oZXhkdW1wLmMgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3Rlc3RfaGV4ZHVt
cC5jIGIvbGliL3Rlc3RfaGV4ZHVtcC5jCmluZGV4IDUxNDQ4OTlkM2M2Yi4uZDc4ZGRkNjJmZmQw
IDEwMDY0NAotLS0gYS9saWIvdGVzdF9oZXhkdW1wLmMKKysrIGIvbGliL3Rlc3RfaGV4ZHVtcC5j
CkBAIC0xNjMsNDUgKzE2Myw1MiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgdGVzdF9oZXhkdW1wX292
ZXJmbG93KHNpemVfdCBidWZsZW4sIHNpemVfdCBsZW4sCiB7CiAJY2hhciB0ZXN0W1RFU1RfSEVY
RFVNUF9CVUZfU0laRV07CiAJY2hhciBidWZbVEVTVF9IRVhEVU1QX0JVRl9TSVpFXTsKLQlpbnQg
cnMgPSByb3dzaXplLCBncyA9IGdyb3Vwc2l6ZTsKLQlpbnQgYWUsIGhlLCBlLCBmLCByOwotCWJv
b2wgYTsKKwlpbnQgYXNjaWlfbGVuLCBoZXhfbGVuLCBleHBlY3RlZF9sZW4sIGZpbGxfcG9pbnQs
IG5ncm91cHMsIHJjOworCWJvb2wgbWF0Y2g7CiAKIAl0b3RhbF90ZXN0cysrOwogCiAJbWVtc2V0
KGJ1ZiwgRklMTF9DSEFSLCBzaXplb2YoYnVmKSk7CiAKLQlyID0gaGV4X2R1bXBfdG9fYnVmZmVy
KGRhdGFfYiwgbGVuLCBycywgZ3MsIGJ1ZiwgYnVmbGVuLCBhc2NpaSk7CisJcmMgPSBoZXhfZHVt
cF90b19idWZmZXIoZGF0YV9iLCBsZW4sIHJvd3NpemUsIGdyb3Vwc2l6ZSwgYnVmLCBidWZsZW4s
IGFzY2lpKTsKIAogCS8qCiAJICogQ2FsbGVyIG11c3QgcHJvdmlkZSB0aGUgZGF0YSBsZW5ndGgg
bXVsdGlwbGUgb2YgZ3JvdXBzaXplLiBUaGUKIAkgKiBjYWxjdWxhdGlvbnMgYmVsb3cgYXJlIG1h
ZGUgd2l0aCB0aGF0IGFzc3VtcHRpb24gaW4gbWluZC4KIAkgKi8KLQlhZSA9IHJzICogMiAvKiBo
ZXggKi8gKyBycyAvIGdzIC8qIHNwYWNlcyAqLyArIDEgLyogc3BhY2UgKi8gKyBsZW4gLyogYXNj
aWkgKi87Ci0JaGUgPSAoZ3MgKiAyIC8qIGhleCAqLyArIDEgLyogc3BhY2UgKi8pICogbGVuIC8g
Z3MgLSAxIC8qIG5vIHRyYWlsaW5nIHNwYWNlICovOworCW5ncm91cHMgPSByb3dzaXplIC8gZ3Jv
dXBzaXplOworCWhleF9sZW4gPSAoZ3JvdXBzaXplICogMiAvKiBoZXggKi8gKyAxIC8qIHNwYWNl
cyAqLykgKiBuZ3JvdXBzCisJCSAgLSAxIC8qIG5vIHRyYWlsaW5nIHNwYWNlICovOworCWFzY2lp
X2xlbiA9IGhleF9sZW4gKyAyIC8qIHNwYWNlICovICsgbGVuIC8qIGFzY2lpICovOworCisJaWYg
KGxlbiA8IHJvd3NpemUpIHsKKwkJbmdyb3VwcyA9IGxlbiAvIGdyb3Vwc2l6ZTsKKwkJaGV4X2xl
biA9IChncm91cHNpemUgKiAyIC8qIGhleCAqLyArIDEgLyogc3BhY2VzICovKSAqIG5ncm91cHMK
KwkJICAtIDEgLyogbm8gdHJhaWxpbmcgc3BhY2UgKi87CisJfQogCi0JaWYgKGFzY2lpKQotCQll
ID0gYWU7Ci0JZWxzZQotCQllID0gaGU7CisJZXhwZWN0ZWRfbGVuID0gKGFzY2lpKSA/IGFzY2lp
X2xlbiA6IGhleF9sZW47CiAKLQlmID0gbWluX3QoaW50LCBlICsgMSwgYnVmbGVuKTsKKwlmaWxs
X3BvaW50ID0gbWluX3QoaW50LCBleHBlY3RlZF9sZW4gKyAxLCBidWZsZW4pOwogCWlmIChidWZs
ZW4pIHsKLQkJdGVzdF9oZXhkdW1wX3ByZXBhcmVfdGVzdChsZW4sIHJzLCBncywgdGVzdCwgc2l6
ZW9mKHRlc3QpLCBhc2NpaSk7Ci0JCXRlc3RbZiAtIDFdID0gJ1wwJzsKKwkJdGVzdF9oZXhkdW1w
X3ByZXBhcmVfdGVzdChsZW4sIHJvd3NpemUsIGdyb3Vwc2l6ZSwgdGVzdCwKKwkJCQkJICBzaXpl
b2YodGVzdCksIGFzY2lpKTsKKwkJdGVzdFtmaWxsX3BvaW50IC0gMV0gPSAnXDAnOwogCX0KLQlt
ZW1zZXQodGVzdCArIGYsIEZJTExfQ0hBUiwgc2l6ZW9mKHRlc3QpIC0gZik7CisJbWVtc2V0KHRl
c3QgKyBmaWxsX3BvaW50LCBGSUxMX0NIQVIsIHNpemVvZih0ZXN0KSAtIGZpbGxfcG9pbnQpOwog
Ci0JYSA9IHIgPT0gZSAmJiAhbWVtY21wKHRlc3QsIGJ1ZiwgVEVTVF9IRVhEVU1QX0JVRl9TSVpF
KTsKKwltYXRjaCA9IHJjID09IGV4cGVjdGVkX2xlbiAmJiAhbWVtY21wKHRlc3QsIGJ1ZiwgVEVT
VF9IRVhEVU1QX0JVRl9TSVpFKTsKIAogCWJ1ZltzaXplb2YoYnVmKSAtIDFdID0gJ1wwJzsKIAot
CWlmICghYSkgewotCQlwcl9lcnIoIkxlbjogJXp1IGJ1ZmxlbjogJXp1IHN0cmxlbjogJXp1XG4i
LAotCQkJbGVuLCBidWZsZW4sIHN0cm5sZW4oYnVmLCBzaXplb2YoYnVmKSkpOwotCQlwcl9lcnIo
IlJlc3VsdDogJWQgJyVzJ1xuIiwgciwgYnVmKTsKLQkJcHJfZXJyKCJFeHBlY3Q6ICVkICclcydc
biIsIGUsIHRlc3QpOworCWlmICghbWF0Y2gpIHsKKwkJcHJfZXJyKCJyb3dzaXplOiAldSBncm91
cHNpemU6ICV1IGFzY2lpOiAlZCBMZW46ICV6dSBidWZsZW46ICV6dSBzdHJsZW46ICV6dVxuIiwK
KwkJCXJvd3NpemUsIGdyb3Vwc2l6ZSwgYXNjaWksIGxlbiwgYnVmbGVuLAorCQkJc3Rybmxlbihi
dWYsIHNpemVvZihidWYpKSk7CisJCXByX2VycigiUmVzdWx0OiAlZCAnJS0uKnMnXG4iLCByYywg
KGludClidWZsZW4sIGJ1Zik7CisJCXByX2VycigiRXhwZWN0OiAlZCAnJS0uKnMnXG4iLCBleHBl
Y3RlZF9sZW4sIChpbnQpYnVmbGVuLCB0ZXN0KTsKIAkJZmFpbGVkX3Rlc3RzKys7CisKIAl9CiB9
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
