Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D094252474
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5205589FD3;
	Tue, 25 Jun 2019 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FAD89819
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 03:19:36 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P36hbM167988
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:36 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tb9r3upv2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:35 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Tue, 25 Jun 2019 04:19:33 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 04:19:24 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5P3JNOT56295624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:19:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EBA352051;
 Tue, 25 Jun 2019 03:19:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4091852050;
 Tue, 25 Jun 2019 03:19:22 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6AD0BA0306;
 Tue, 25 Jun 2019 13:19:19 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v4 5/7] lib/hexdump.c: Allow multiple groups to be separated
 by lines '|'
Date: Tue, 25 Jun 2019 13:17:24 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625031726.12173-1-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062503-0020-0000-0000-0000034D1361
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062503-0021-0000-0000-000021A08030
Message-Id: <20190625031726.12173-6-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250024
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
aCBiL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKaW5kZXggZjA3NjFiM2EyZDVkLi5hZTgwZDdhZjgy
YWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKKysrIGIvaW5jbHVkZS9saW51
eC9wcmludGsuaApAQCAtNDg1LDYgKzQ4NSw5IEBAIGVudW0gewogCiAjZGVmaW5lIEhFWERVTVBf
QVNDSUkJCQlCSVQoMCkKICNkZWZpbmUgSEVYRFVNUF9TVVBQUkVTU19SRVBFQVRFRAlCSVQoMSkK
KyNkZWZpbmUgSEVYRFVNUF8yX0dSUF9MSU5FUwkJQklUKDIpCisjZGVmaW5lIEhFWERVTVBfNF9H
UlBfTElORVMJCUJJVCgzKQorI2RlZmluZSBIRVhEVU1QXzhfR1JQX0xJTkVTCQlCSVQoNCkKIAog
ZXh0ZXJuIGludCBoZXhfZHVtcF90b19idWZmZXJfZXh0KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90
IGxlbiwgaW50IHJvd3NpemUsCiAJCQkgICAgICBpbnQgZ3JvdXBzaXplLCBjaGFyICpsaW5lYnVm
LCBzaXplX3QgbGluZWJ1ZmxlbiwKZGlmZiAtLWdpdCBhL2xpYi9oZXhkdW1wLmMgYi9saWIvaGV4
ZHVtcC5jCmluZGV4IDFiZjgzOGMxYTU2OC4uNGRjZjc1OWZlMDQ4IDEwMDY0NAotLS0gYS9saWIv
aGV4ZHVtcC5jCisrKyBiL2xpYi9oZXhkdW1wLmMKQEAgLTc3LDYgKzc3LDIzIEBAIGNoYXIgKmJp
bjJoZXgoY2hhciAqZHN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBjb3VudCkKIH0KIEVYUE9S
VF9TWU1CT0woYmluMmhleCk7CiAKK3N0YXRpYyBjb25zdCBjaGFyICpncm91cF9zZXBhcmF0b3Io
aW50IGdyb3VwLCB1NjQgZmxhZ3MpCit7CisJaWYgKGdyb3VwID09IDApCisJCXJldHVybiAiICI7
CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF84X0dSUF9MSU5FUykgJiYgISgoZ3JvdXApICUgOCkp
CisJCXJldHVybiAifCI7CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF80X0dSUF9MSU5FUykgJiYg
ISgoZ3JvdXApICUgNCkpCisJCXJldHVybiAifCI7CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF8y
X0dSUF9MSU5FUykgJiYgISgoZ3JvdXApICUgMikpCisJCXJldHVybiAifCI7CisKKwlyZXR1cm4g
IiAiOworfQorCiAvKioKICAqIGhleF9kdW1wX3RvX2J1ZmZlciAtIGNvbnZlcnQgYSBibG9iIG9m
IGRhdGEgdG8gImhleCBBU0NJSSIgaW4gbWVtb3J5CiAgKiBAYnVmOiBkYXRhIGJsb2IgdG8gZHVt
cApAQCAtODcsNiArMTA0LDkgQEAgRVhQT1JUX1NZTUJPTChiaW4yaGV4KTsKICAqIEBsaW5lYnVm
bGVuOiB0b3RhbCBzaXplIG9mIEBsaW5lYnVmLCBpbmNsdWRpbmcgc3BhY2UgZm9yIHRlcm1pbmF0
aW5nIE5VTAogICogQGZsYWdzOiBBIGJpdHdpc2UgT1Igb2YgdGhlIGZvbGxvd2luZyBmbGFnczoK
ICAqCUhFWERVTVBfQVNDSUk6CQkJaW5jbHVkZSBBU0NJSSBhZnRlciB0aGUgaGV4IG91dHB1dAor
ICoJSEVYRFVNUF8yX0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBhZnRlciBldmVyeSAyIGdyb3Vw
cworICoJSEVYRFVNUF80X0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBhZnRlciBldmVyeSA0IGdy
b3VwcworICoJSEVYRFVNUF84X0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBhZnRlciBldmVyeSA4
IGdyb3VwcwogICoKICAqIGhleF9kdW1wX3RvX2J1ZmZlcigpIHdvcmtzIG9uIG9uZSAibGluZSIg
b2Ygb3V0cHV0IGF0IGEgdGltZSwgY29udmVydGluZwogICogPGdyb3Vwc2l6ZT4gYnl0ZXMgb2Yg
aW5wdXQgdG8gaGV4YWRlY2ltYWwgKGFuZCBvcHRpb25hbGx5IHByaW50YWJsZSBBU0NJSSkKQEAg
LTExOSw2ICsxMzksNyBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyX2V4dChjb25zdCB2b2lkICpi
dWYsIHNpemVfdCBsZW4sIGludCByb3dzaXplLAogCWludCBqLCBseCA9IDA7CiAJaW50IGFzY2lp
X2NvbHVtbjsKIAlpbnQgcmV0OworCWludCBsaW5lX2NoYXJzID0gMDsKIAogCWlmICghaXNfcG93
ZXJfb2ZfMihncm91cHNpemUpIHx8IGdyb3Vwc2l6ZSA+IDgpCiAJCWdyb3Vwc2l6ZSA9IDE7CkBA
IC0xNDUsNyArMTY2LDggQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcl9leHQoY29uc3Qgdm9pZCAq
YnVmLCBzaXplX3QgbGVuLCBpbnQgcm93c2l6ZSwKIAogCQlmb3IgKGogPSAwOyBqIDwgbmdyb3Vw
czsgaisrKSB7CiAJCQlyZXQgPSBzbnByaW50ZihsaW5lYnVmICsgbHgsIGxpbmVidWZsZW4gLSBs
eCwKLQkJCQkgICAgICAgIiVzJTE2LjE2bGx4IiwgaiA/ICIgIiA6ICIiLAorCQkJCSAgICAgICAi
JXMlMTYuMTZsbHgiLAorCQkJCSAgICAgICBqID8gZ3JvdXBfc2VwYXJhdG9yKGosIGZsYWdzKSA6
ICIiLAogCQkJCSAgICAgICBnZXRfdW5hbGlnbmVkKHB0cjggKyBqKSk7CiAJCQlpZiAocmV0ID49
IGxpbmVidWZsZW4gLSBseCkKIAkJCQlnb3RvIG92ZXJmbG93MTsKQEAgLTE1Niw3ICsxNzgsOCBA
QCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyX2V4dChjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4s
IGludCByb3dzaXplLAogCiAJCWZvciAoaiA9IDA7IGogPCBuZ3JvdXBzOyBqKyspIHsKIAkJCXJl
dCA9IHNucHJpbnRmKGxpbmVidWYgKyBseCwgbGluZWJ1ZmxlbiAtIGx4LAotCQkJCSAgICAgICAi
JXMlOC44eCIsIGogPyAiICIgOiAiIiwKKwkJCQkgICAgICAgIiVzJTguOHgiLAorCQkJCSAgICAg
ICBqID8gZ3JvdXBfc2VwYXJhdG9yKGosIGZsYWdzKSA6ICIiLAogCQkJCSAgICAgICBnZXRfdW5h
bGlnbmVkKHB0cjQgKyBqKSk7CiAJCQlpZiAocmV0ID49IGxpbmVidWZsZW4gLSBseCkKIAkJCQln
b3RvIG92ZXJmbG93MTsKQEAgLTE2Nyw3ICsxOTAsOCBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVy
X2V4dChjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCByb3dzaXplLAogCiAJCWZvciAo
aiA9IDA7IGogPCBuZ3JvdXBzOyBqKyspIHsKIAkJCXJldCA9IHNucHJpbnRmKGxpbmVidWYgKyBs
eCwgbGluZWJ1ZmxlbiAtIGx4LAotCQkJCSAgICAgICAiJXMlNC40eCIsIGogPyAiICIgOiAiIiwK
KwkJCQkgICAgICAgIiVzJTQuNHgiLAorCQkJCSAgICAgICBqID8gZ3JvdXBfc2VwYXJhdG9yKGos
IGZsYWdzKSA6ICIiLAogCQkJCSAgICAgICBnZXRfdW5hbGlnbmVkKHB0cjIgKyBqKSk7CiAJCQlp
ZiAocmV0ID49IGxpbmVidWZsZW4gLSBseCkKIAkJCQlnb3RvIG92ZXJmbG93MTsKQEAgLTE5Nywx
MSArMjIxLDI2IEBAIGludCBoZXhfZHVtcF90b19idWZmZXJfZXh0KGNvbnN0IHZvaWQgKmJ1Ziwg
c2l6ZV90IGxlbiwgaW50IHJvd3NpemUsCiAJCQlnb3RvIG92ZXJmbG93MjsKIAkJbGluZWJ1Zlts
eCsrXSA9ICcgJzsKIAl9CisKKwlpZiAoZmxhZ3MgJiBIRVhEVU1QXzJfR1JQX0xJTkVTKQorCQls
aW5lX2NoYXJzID0gZ3JvdXBzaXplICogMjsKKwlpZiAoZmxhZ3MgJiBIRVhEVU1QXzRfR1JQX0xJ
TkVTKQorCQlsaW5lX2NoYXJzID0gZ3JvdXBzaXplICogNDsKKwlpZiAoZmxhZ3MgJiBIRVhEVU1Q
XzhfR1JQX0xJTkVTKQorCQlsaW5lX2NoYXJzID0gZ3JvdXBzaXplICogODsKKwogCWZvciAoaiA9
IDA7IGogPCBsZW47IGorKykgewogCQlpZiAobGluZWJ1ZmxlbiA8IGx4ICsgMikKIAkJCWdvdG8g
b3ZlcmZsb3cyOwogCQljaCA9IHB0cltqXTsKIAkJbGluZWJ1ZltseCsrXSA9IChpc2FzY2lpKGNo
KSAmJiBpc3ByaW50KGNoKSkgPyBjaCA6ICcuJzsKKworCQlpZiAobGluZV9jaGFycyAmJiAoKGog
KyAxKSA8IGxlbikgJiYKKwkJCQkoKGogKyAxKSAlIGxpbmVfY2hhcnMgPT0gMCkpIHsKKwkJCWlm
IChsaW5lYnVmbGVuIDwgbHggKyAyKQorCQkJCWdvdG8gb3ZlcmZsb3cyOworCQkJbGluZWJ1Zlts
eCsrXSA9ICd8JzsKKwkJfQogCX0KIG5pbDoKIAlsaW5lYnVmW2x4XSA9ICdcMCc7CkBAIC0yMDks
NyArMjQ4LDggQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcl9leHQoY29uc3Qgdm9pZCAqYnVmLCBz
aXplX3QgbGVuLCBpbnQgcm93c2l6ZSwKIG92ZXJmbG93MjoKIAlsaW5lYnVmW2x4KytdID0gJ1ww
JzsKIG92ZXJmbG93MToKLQlyZXR1cm4gKGZsYWdzICYgSEVYRFVNUF9BU0NJSSkgPyBhc2NpaV9j
b2x1bW4gKyBsZW4gOgorCXJldHVybiAoZmxhZ3MgJiBIRVhEVU1QX0FTQ0lJKSA/IGFzY2lpX2Nv
bHVtbiArIGxlbiArCisJCQkJCShsZW4gLSAxKSAvIGxpbmVfY2hhcnMgOgogCQkJCQkgKGdyb3Vw
c2l6ZSAqIDIgKyAxKSAqIG5ncm91cHMgLSAxOwogfQogRVhQT1JUX1NZTUJPTChoZXhfZHVtcF90
b19idWZmZXJfZXh0KTsKQEAgLTI0Nyw3ICsyODcsNyBAQCBzdGF0aWMgdm9pZCBhbm5vdW5jZV9z
a2lwcGVkKGNvbnN0IGNoYXIgKmxldmVsLCBjb25zdCBjaGFyICpwcmVmaXhfc3RyLAogCWlmIChj
b3VudCA9PSAwKQogCQlyZXR1cm47CiAKLQlwcmludGsoIiVzJXMgKiogU2tpcHBlZCAlbHUgYnl0
ZXMgb2YgdmFsdWUgMHgleCAqKlxuIiwKKwlwcmludGsoIiVzJXMgKiogU2tpcHBlZCAlbHUgYnl0
ZXMgb2YgdmFsdWUgMHglMDJ4ICoqXG4iLAogCSAgICAgICBsZXZlbCwgcHJlZml4X3N0ciwgY291
bnQsIHZhbCk7CiB9CiAKQEAgLTI2Nyw2ICszMDcsOSBAQCBzdGF0aWMgdm9pZCBhbm5vdW5jZV9z
a2lwcGVkKGNvbnN0IGNoYXIgKmxldmVsLCBjb25zdCBjaGFyICpwcmVmaXhfc3RyLAogICoJSEVY
RFVNUF9BU0NJSToJCQlpbmNsdWRlIEFTQ0lJIGFmdGVyIHRoZSBoZXggb3V0cHV0CiAgKglIRVhE
VU1QX1NVUFBSRVNTX1JFUEVBVEVEOglzdXBwcmVzcyByZXBlYXRlZCBsaW5lcyBvZiBpZGVudGlj
YWwKICAqCQkJCQlieXRlcworICoJSEVYRFVNUF8yX0dSUF9MSU5FUzoJCWluc2VydCBhICd8JyBh
ZnRlciBldmVyeSAyIGdyb3VwcworICoJSEVYRFVNUF80X0dSUF9MSU5FUzoJCWluc2VydCBhICd8
JyBhZnRlciBldmVyeSA0IGdyb3VwcworICoJSEVYRFVNUF84X0dSUF9MSU5FUzoJCWluc2VydCBh
ICd8JyBhZnRlciBldmVyeSA4IGdyb3VwcwogICoKICAqIEdpdmVuIGEgYnVmZmVyIG9mIHU4IGRh
dGEsIHByaW50X2hleF9kdW1wKCkgcHJpbnRzIGEgaGV4ICsgQVNDSUkgZHVtcAogICogdG8gdGhl
IGtlcm5lbCBsb2cgYXQgdGhlIHNwZWNpZmllZCBrZXJuZWwgbG9nIGxldmVsLCB3aXRoIGFuIG9w
dGlvbmFsCkBAIC0yOTYsMTUgKzMzOSwxNSBAQCB2b2lkIHByaW50X2hleF9kdW1wX2V4dChjb25z
dCBjaGFyICpsZXZlbCwgY29uc3QgY2hhciAqcHJlZml4X3N0ciwKIAl1OCBza2lwcGVkX3ZhbCA9
IDA7CiAJc2l6ZV90IHNraXBwZWQgPSAwOwogCi0KIAlpZiAocm93c2l6ZSAlIGdyb3Vwc2l6ZSkK
IAkJcm93c2l6ZSAtPSByb3dzaXplICUgZ3JvdXBzaXplOwogCiAJLyoKIAkgKiBXb3JzdCBjYXNl
IGxpbmUgbGVuZ3RoOgotCSAqIDIgaGV4IGNoYXJzICsgc3BhY2UgcGVyIGJ5dGUgaW4sIDIgc3Bh
Y2VzLCAxIGNoYXIgcGVyIGJ5dGUgaW4sIE5VTEwKKwkgKiAyIGhleCBjaGFycyArIHNwYWNlIHBl
ciBieXRlIGluLCAyIHNwYWNlcywgMSBjaGFyIHBlciBieXRlIGluLAorCSAqIDEgY2hhciBwZXIg
TiBncm91cHMsIE5VTEwKIAkgKi8KLQlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsgMiArIHJv
d3NpemUgKyAxOworCWxpbmVidWZfbGVuID0gcm93c2l6ZSAqIDMgKyAyICsgcm93c2l6ZSArIHJv
d3NpemUgLyBncm91cHNpemUgKyAxOwogCWxpbmVidWYgPSBremFsbG9jKGxpbmVidWZfbGVuLCBH
RlBfS0VSTkVMKTsKIAlpZiAoIWxpbmVidWYpIHsKIAkJcHJpbnRrKCIlcyVzaGV4ZHVtcDogQ291
bGQgbm90IGFsbG9jICV1IGJ5dGVzIGZvciBidWZmZXJcbiIsCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
