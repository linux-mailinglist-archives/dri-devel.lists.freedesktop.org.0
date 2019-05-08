Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FA17411
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD14C89815;
	Wed,  8 May 2019 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7BB8926D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 07:02:54 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x487223P020213
 for <dri-devel@lists.freedesktop.org>; Wed, 8 May 2019 03:02:54 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sbrxkm0fy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 03:02:53 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Wed, 8 May 2019 08:02:50 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 08:02:40 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4872dhS48038106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 07:02:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0C4011C04C;
 Wed,  8 May 2019 07:02:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2753A11C050;
 Wed,  8 May 2019 07:02:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 07:02:39 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5D665A03B6;
 Wed,  8 May 2019 17:02:35 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 5/7] lib/hexdump.c: Allow multiple groups to be separated
 by lines '|'
Date: Wed,  8 May 2019 17:01:45 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508070148.23130-1-alastair@au1.ibm.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050807-0012-0000-0000-000003196FA2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050807-0013-0000-0000-00002151EFD6
Message-Id: <20190508070148.23130-6-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
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

RnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+CgpXaXRoIHRoZSB3
aWRlciBkaXNwbGF5IGZvcm1hdCwgaXQgY2FuIGJlY29tZSBoYXJkIHRvIGlkZW50aWZ5IGhvdyBt
YW55CmJ5dGVzIGludG8gdGhlIGxpbmUgeW91IGFyZSBsb29raW5nIGF0LgoKVGhlIHBhdGNoIGFk
ZHMgbmV3IGZsYWdzIHRvIGhleF9kdW1wX3RvX2J1ZmZlcigpIGFuZCBwcmludF9oZXhfZHVtcCgp
IHRvCnByaW50IHZlcnRpY2FsIGxpbmVzIHRvIHNlcGFyYXRlIGV2ZXJ5IE4gZ3JvdXBzIG9mIGJ5
dGVzLgoKZWcuCmJ1ZjowMDAwMDAwMDogNDU0ZDQxNGUgNDM0MTUwNTN8NGU0OTVmNDUgMDA1ODQ1
NDQgIE5BTUVTUEFDfEVfSU5ERVguCmJ1ZjowMDAwMDAxMDogMDAwMDAwMDAgMDAwMDAwMDJ8MDAw
MDAwMDAgMDAwMDAwMDAgIC4uLi4uLi4ufC4uLi4uLi4uCgpTaWduZWQtb2ZmLWJ5OiBBbGFzdGFp
ciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KLS0tCiBpbmNsdWRlL2xpbnV4L3ByaW50
ay5oIHwgIDMgKysrCiBsaWIvaGV4ZHVtcC5jICAgICAgICAgIHwgNTkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wcmludGsu
aCBiL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKaW5kZXggMDBhODJlNDY4NjQzLi5kYzY5M2FlYzM5
NGMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKKysrIGIvaW5jbHVkZS9saW51
eC9wcmludGsuaApAQCAtNDgyLDYgKzQ4Miw5IEBAIGVudW0gewogCiAjZGVmaW5lIEhFWERVTVBf
QVNDSUkJCQkoMSA8PCAwKQogI2RlZmluZSBIRVhEVU1QX1NVUFBSRVNTX1JFUEVBVEVECSgxIDw8
IDEpCisjZGVmaW5lIEhFWERVTVBfMl9HUlBfTElORVMJCSgxIDw8IDIpCisjZGVmaW5lIEhFWERV
TVBfNF9HUlBfTElORVMJCSgxIDw8IDMpCisjZGVmaW5lIEhFWERVTVBfOF9HUlBfTElORVMJCSgx
IDw8IDQpCiAKIGV4dGVybiBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwg
c2l6ZV90IGxlbiwgaW50IHJvd3NpemUsCiAJCQkgICAgICBpbnQgZ3JvdXBzaXplLCBjaGFyICps
aW5lYnVmLCBzaXplX3QgbGluZWJ1ZmxlbiwKZGlmZiAtLWdpdCBhL2xpYi9oZXhkdW1wLmMgYi9s
aWIvaGV4ZHVtcC5jCmluZGV4IGRkZDE2OTdlNWY5Yi4uNmY0ZDExNzZjMzMyIDEwMDY0NAotLS0g
YS9saWIvaGV4ZHVtcC5jCisrKyBiL2xpYi9oZXhkdW1wLmMKQEAgLTc3LDYgKzc3LDIzIEBAIGNo
YXIgKmJpbjJoZXgoY2hhciAqZHN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBjb3VudCkKIH0K
IEVYUE9SVF9TWU1CT0woYmluMmhleCk7CiAKK3N0YXRpYyBjb25zdCBjaGFyICpncm91cF9zZXBh
cmF0b3IoaW50IGdyb3VwLCB1NjQgZmxhZ3MpCit7CisJaWYgKGdyb3VwID09IDApCisJCXJldHVy
biAiICI7CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF84X0dSUF9MSU5FUykgJiYgISgoZ3JvdXAp
ICUgOCkpCisJCXJldHVybiAifCI7CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF80X0dSUF9MSU5F
UykgJiYgISgoZ3JvdXApICUgNCkpCisJCXJldHVybiAifCI7CisKKwlpZiAoKGZsYWdzICYgSEVY
RFVNUF8yX0dSUF9MSU5FUykgJiYgISgoZ3JvdXApICUgMikpCisJCXJldHVybiAifCI7CisKKwly
ZXR1cm4gIiAiOworfQorCiAvKioKICAqIGhleF9kdW1wX3RvX2J1ZmZlciAtIGNvbnZlcnQgYSBi
bG9iIG9mIGRhdGEgdG8gImhleCBBU0NJSSIgaW4gbWVtb3J5CiAgKiBAYnVmOiBkYXRhIGJsb2Ig
dG8gZHVtcApAQCAtODcsNiArMTA0LDkgQEAgRVhQT1JUX1NZTUJPTChiaW4yaGV4KTsKICAqIEBs
aW5lYnVmbGVuOiB0b3RhbCBzaXplIG9mIEBsaW5lYnVmLCBpbmNsdWRpbmcgc3BhY2UgZm9yIHRl
cm1pbmF0aW5nIE5VTAogICogQGZsYWdzOiBBIGJpdHdpc2UgT1Igb2YgdGhlIGZvbGxvd2luZyBm
bGFnczoKICAqCUhFWERVTVBfQVNDSUk6CQkJaW5jbHVkZSBBU0NJSSBhZnRlciB0aGUgaGV4IG91
dHB1dAorICoJSEVYRFVNUF8yX0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBhZnRlciBldmVyeSAy
IGdyb3VwcworICoJSEVYRFVNUF80X0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBhZnRlciBldmVy
eSA0IGdyb3VwcworICoJSEVYRFVNUF84X0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBhZnRlciBl
dmVyeSA4IGdyb3VwcwogICoKICAqIGhleF9kdW1wX3RvX2J1ZmZlcigpIHdvcmtzIG9uIG9uZSAi
bGluZSIgb2Ygb3V0cHV0IGF0IGEgdGltZSwgY29udmVydGluZwogICogPGdyb3Vwc2l6ZT4gYnl0
ZXMgb2YgaW5wdXQgdG8gaGV4YWRlY2ltYWwgKGFuZCBvcHRpb25hbGx5IHByaW50YWJsZSBBU0NJ
SSkKQEAgLTExOCw2ICsxMzgsNyBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQg
KmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsIGludCBncm91cHNpemUsCiAJaW50IGosIGx4
ID0gMDsKIAlpbnQgYXNjaWlfY29sdW1uOwogCWludCByZXQ7CisJaW50IGxpbmVfY2hhcnMgPSAw
OwogCiAJaWYgKCFpc19wb3dlcl9vZl8yKGdyb3Vwc2l6ZSkgfHwgZ3JvdXBzaXplID4gOCkKIAkJ
Z3JvdXBzaXplID0gMTsKQEAgLTE0NCw3ICsxNjUsOCBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVy
KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsIGludCBncm91cHNpemUs
CiAKIAkJZm9yIChqID0gMDsgaiA8IG5ncm91cHM7IGorKykgewogCQkJcmV0ID0gc25wcmludGYo
bGluZWJ1ZiArIGx4LCBsaW5lYnVmbGVuIC0gbHgsCi0JCQkJICAgICAgICIlcyUxNi4xNmxseCIs
IGogPyAiICIgOiAiIiwKKwkJCQkgICAgICAgIiVzJTE2LjE2bGx4IiwKKwkJCQkgICAgICAgaiA/
IGdyb3VwX3NlcGFyYXRvcihqLCBmbGFncykgOiAiIiwKIAkJCQkgICAgICAgZ2V0X3VuYWxpZ25l
ZChwdHI4ICsgaikpOwogCQkJaWYgKHJldCA+PSBsaW5lYnVmbGVuIC0gbHgpCiAJCQkJZ290byBv
dmVyZmxvdzE7CkBAIC0xNTUsNyArMTc3LDggQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25z
dCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAogCiAJ
CWZvciAoaiA9IDA7IGogPCBuZ3JvdXBzOyBqKyspIHsKIAkJCXJldCA9IHNucHJpbnRmKGxpbmVi
dWYgKyBseCwgbGluZWJ1ZmxlbiAtIGx4LAotCQkJCSAgICAgICAiJXMlOC44eCIsIGogPyAiICIg
OiAiIiwKKwkJCQkgICAgICAgIiVzJTguOHgiLAorCQkJCSAgICAgICBqID8gZ3JvdXBfc2VwYXJh
dG9yKGosIGZsYWdzKSA6ICIiLAogCQkJCSAgICAgICBnZXRfdW5hbGlnbmVkKHB0cjQgKyBqKSk7
CiAJCQlpZiAocmV0ID49IGxpbmVidWZsZW4gLSBseCkKIAkJCQlnb3RvIG92ZXJmbG93MTsKQEAg
LTE2Niw3ICsxODksOCBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwg
c2l6ZV90IGxlbiwgaW50IHJvd3NpemUsIGludCBncm91cHNpemUsCiAKIAkJZm9yIChqID0gMDsg
aiA8IG5ncm91cHM7IGorKykgewogCQkJcmV0ID0gc25wcmludGYobGluZWJ1ZiArIGx4LCBsaW5l
YnVmbGVuIC0gbHgsCi0JCQkJICAgICAgICIlcyU0LjR4IiwgaiA/ICIgIiA6ICIiLAorCQkJCSAg
ICAgICAiJXMlNC40eCIsCisJCQkJICAgICAgIGogPyBncm91cF9zZXBhcmF0b3IoaiwgZmxhZ3Mp
IDogIiIsCiAJCQkJICAgICAgIGdldF91bmFsaWduZWQocHRyMiArIGopKTsKIAkJCWlmIChyZXQg
Pj0gbGluZWJ1ZmxlbiAtIGx4KQogCQkJCWdvdG8gb3ZlcmZsb3cxOwpAQCAtMTk2LDExICsyMjAs
MjYgQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4s
IGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAogCQkJZ290byBvdmVyZmxvdzI7CiAJCWxpbmVi
dWZbbHgrK10gPSAnICc7CiAJfQorCisJaWYgKGZsYWdzICYgSEVYRFVNUF8yX0dSUF9MSU5FUykK
KwkJbGluZV9jaGFycyA9IGdyb3Vwc2l6ZSAqIDI7CisJaWYgKGZsYWdzICYgSEVYRFVNUF80X0dS
UF9MSU5FUykKKwkJbGluZV9jaGFycyA9IGdyb3Vwc2l6ZSAqIDQ7CisJaWYgKGZsYWdzICYgSEVY
RFVNUF84X0dSUF9MSU5FUykKKwkJbGluZV9jaGFycyA9IGdyb3Vwc2l6ZSAqIDg7CisKIAlmb3Ig
KGogPSAwOyBqIDwgbGVuOyBqKyspIHsKIAkJaWYgKGxpbmVidWZsZW4gPCBseCArIDIpCiAJCQln
b3RvIG92ZXJmbG93MjsKIAkJY2ggPSBwdHJbal07CiAJCWxpbmVidWZbbHgrK10gPSAoaXNhc2Np
aShjaCkgJiYgaXNwcmludChjaCkpID8gY2ggOiAnLic7CisKKwkJaWYgKGxpbmVfY2hhcnMgJiYg
KChqICsgMSkgPCBsZW4pICYmCisJCQkJKChqICsgMSkgJSBsaW5lX2NoYXJzID09IDApKSB7CisJ
CQlpZiAobGluZWJ1ZmxlbiA8IGx4ICsgMikKKwkJCQlnb3RvIG92ZXJmbG93MjsKKwkJCWxpbmVi
dWZbbHgrK10gPSAnfCc7CisJCX0KIAl9CiBuaWw6CiAJbGluZWJ1ZltseF0gPSAnXDAnOwpAQCAt
MjA4LDcgKzI0Nyw4IEBAIGludCBoZXhfZHVtcF90b19idWZmZXIoY29uc3Qgdm9pZCAqYnVmLCBz
aXplX3QgbGVuLCBpbnQgcm93c2l6ZSwgaW50IGdyb3Vwc2l6ZSwKIG92ZXJmbG93MjoKIAlsaW5l
YnVmW2x4KytdID0gJ1wwJzsKIG92ZXJmbG93MToKLQlyZXR1cm4gKGZsYWdzICYgSEVYRFVNUF9B
U0NJSSkgPyBhc2NpaV9jb2x1bW4gKyBsZW4gOgorCXJldHVybiAoZmxhZ3MgJiBIRVhEVU1QX0FT
Q0lJKSA/IGFzY2lpX2NvbHVtbiArIGxlbiArCisJCQkJCShsZW4gLSAxKSAvIGxpbmVfY2hhcnMg
OgogCQkJCQkgKGdyb3Vwc2l6ZSAqIDIgKyAxKSAqIG5ncm91cHMgLSAxOwogfQogRVhQT1JUX1NZ
TUJPTChoZXhfZHVtcF90b19idWZmZXIpOwpAQCAtMjQ2LDcgKzI4Niw3IEBAIHN0YXRpYyB2b2lk
IGFubm91bmNlX3NraXBwZWQoY29uc3QgY2hhciAqbGV2ZWwsIGNvbnN0IGNoYXIgKnByZWZpeF9z
dHIsCiAJaWYgKGNvdW50ID09IDApCiAJCXJldHVybjsKIAotCXByaW50aygiJXMlcyAqKiBTa2lw
cGVkICVsdSBieXRlcyBvZiB2YWx1ZSAweCV4ICoqXG4iLAorCXByaW50aygiJXMlcyAqKiBTa2lw
cGVkICVsdSBieXRlcyBvZiB2YWx1ZSAweCUwMnggKipcbiIsCiAJICAgICAgIGxldmVsLCBwcmVm
aXhfc3RyLCBjb3VudCwgdmFsKTsKIH0KIApAQCAtMjY2LDYgKzMwNiw5IEBAIHN0YXRpYyB2b2lk
IGFubm91bmNlX3NraXBwZWQoY29uc3QgY2hhciAqbGV2ZWwsIGNvbnN0IGNoYXIgKnByZWZpeF9z
dHIsCiAgKglIRVhEVU1QX0FTQ0lJOgkJCWluY2x1ZGUgQVNDSUkgYWZ0ZXIgdGhlIGhleCBvdXRw
dXQKICAqCUhFWERVTVBfU1VQUFJFU1NfUkVQRUFURUQ6CXN1cHByZXNzIHJlcGVhdGVkIGxpbmVz
IG9mIGlkZW50aWNhbAogICoJCQkJCWJ5dGVzCisgKglIRVhEVU1QXzJfR1JQX0xJTkVTOgkJaW5z
ZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDIgZ3JvdXBzCisgKglIRVhEVU1QXzRfR1JQX0xJTkVTOgkJ
aW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDQgZ3JvdXBzCisgKglIRVhEVU1QXzhfR1JQX0xJTkVT
OgkJaW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDggZ3JvdXBzCiAgKgogICogR2l2ZW4gYSBidWZm
ZXIgb2YgdTggZGF0YSwgcHJpbnRfaGV4X2R1bXAoKSBwcmludHMgYSBoZXggKyBBU0NJSSBkdW1w
CiAgKiB0byB0aGUga2VybmVsIGxvZyBhdCB0aGUgc3BlY2lmaWVkIGtlcm5lbCBsb2cgbGV2ZWws
IHdpdGggYW4gb3B0aW9uYWwKQEAgLTI5NSwxNCArMzM4LDE0IEBAIHZvaWQgcHJpbnRfaGV4X2R1
bXBfZXh0KGNvbnN0IGNoYXIgKmxldmVsLCBjb25zdCBjaGFyICpwcmVmaXhfc3RyLAogCXU4IHNr
aXBwZWRfdmFsID0gMDsKIAlzaXplX3Qgc2tpcHBlZCA9IDA7CiAKLQogCWlmIChyb3dzaXplICUg
Z3JvdXBzaXplKQogCQlyb3dzaXplIC09IHJvd3NpemUgJSBncm91cHNpemU7CiAKIAkvKiBXb3Jz
dCBjYXNlIGxpbmUgbGVuZ3RoOgotCSAqIDIgaGV4IGNoYXJzICsgc3BhY2UgcGVyIGJ5dGUgaW4s
IDIgc3BhY2VzLCAxIGNoYXIgcGVyIGJ5dGUgaW4sIE5VTEwKKwkgKiAyIGhleCBjaGFycyArIHNw
YWNlIHBlciBieXRlIGluLCAyIHNwYWNlcywgMSBjaGFyIHBlciBieXRlIGluLAorCSAqIDEgY2hh
ciBwZXIgTiBncm91cHMsIE5VTEwKIAkgKi8KLQlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsg
MiArIHJvd3NpemUgKyAxOworCWxpbmVidWZfbGVuID0gcm93c2l6ZSAqIDMgKyAyICsgcm93c2l6
ZSArIHJvd3NpemUgLyBncm91cHNpemUgKyAxOwogCWxpbmVidWYgPSBremFsbG9jKGxpbmVidWZf
bGVuLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWxpbmVidWYpIHsKIAkJcHJpbnRrKCIlcyVzaGV4ZHVt
cDogQ291bGQgbm90IGFsbG9jICV1IGJ5dGVzIGZvciBidWZmZXJcbiIsCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
