Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A247A7F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D7E89173;
	Mon, 17 Jun 2019 07:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07E38916D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 02:06:56 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H26tbf080978
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:06:56 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t5vedyfda-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:06:55 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Mon, 17 Jun 2019 03:06:53 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 03:06:44 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5H26Z9Q30015990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 02:06:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94A11AE059;
 Mon, 17 Jun 2019 02:06:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4FADAE056;
 Mon, 17 Jun 2019 02:06:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 02:06:42 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8E65CA027F;
 Mon, 17 Jun 2019 12:06:41 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 5/7] lib/hexdump.c: Allow multiple groups to be separated
 by lines '|'
Date: Mon, 17 Jun 2019 12:04:28 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617020430.8708-1-alastair@au1.ibm.com>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061702-0020-0000-0000-0000034AA4A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061702-0021-0000-0000-0000219DE733
Message-Id: <20190617020430.8708-6-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170019
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:34 +0000
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
aCBiL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKaW5kZXggOTdkZDI5YTJiZDc3Li5jNmI3NDhmNjZh
ODIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKKysrIGIvaW5jbHVkZS9saW51
eC9wcmludGsuaApAQCAtNDg0LDYgKzQ4NCw5IEBAIGVudW0gewogCiAjZGVmaW5lIEhFWERVTVBf
QVNDSUkJCQlCSVQoMCkKICNkZWZpbmUgSEVYRFVNUF9TVVBQUkVTU19SRVBFQVRFRAlCSVQoMSkK
KyNkZWZpbmUgSEVYRFVNUF8yX0dSUF9MSU5FUwkJQklUKDIpCisjZGVmaW5lIEhFWERVTVBfNF9H
UlBfTElORVMJCUJJVCgzKQorI2RlZmluZSBIRVhEVU1QXzhfR1JQX0xJTkVTCQlCSVQoNCkKIAog
ZXh0ZXJuIGludCBoZXhfZHVtcF90b19idWZmZXIoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVu
LCBpbnQgcm93c2l6ZSwKIAkJCSAgICAgIGludCBncm91cHNpemUsIGNoYXIgKmxpbmVidWYsIHNp
emVfdCBsaW5lYnVmbGVuLApkaWZmIC0tZ2l0IGEvbGliL2hleGR1bXAuYyBiL2xpYi9oZXhkdW1w
LmMKaW5kZXggMDhjNjA4NGQ3ZGFhLi40ZGE3ZDI0ODI2ZmIgMTAwNjQ0Ci0tLSBhL2xpYi9oZXhk
dW1wLmMKKysrIGIvbGliL2hleGR1bXAuYwpAQCAtNzcsNiArNzcsMjMgQEAgY2hhciAqYmluMmhl
eChjaGFyICpkc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IGNvdW50KQogfQogRVhQT1JUX1NZ
TUJPTChiaW4yaGV4KTsKIAorc3RhdGljIGNvbnN0IGNoYXIgKmdyb3VwX3NlcGFyYXRvcihpbnQg
Z3JvdXAsIHU2NCBmbGFncykKK3sKKwlpZiAoZ3JvdXAgPT0gMCkKKwkJcmV0dXJuICIgIjsKKwor
CWlmICgoZmxhZ3MgJiBIRVhEVU1QXzhfR1JQX0xJTkVTKSAmJiAhKChncm91cCkgJSA4KSkKKwkJ
cmV0dXJuICJ8IjsKKworCWlmICgoZmxhZ3MgJiBIRVhEVU1QXzRfR1JQX0xJTkVTKSAmJiAhKChn
cm91cCkgJSA0KSkKKwkJcmV0dXJuICJ8IjsKKworCWlmICgoZmxhZ3MgJiBIRVhEVU1QXzJfR1JQ
X0xJTkVTKSAmJiAhKChncm91cCkgJSAyKSkKKwkJcmV0dXJuICJ8IjsKKworCXJldHVybiAiICI7
Cit9CisKIC8qKgogICogaGV4X2R1bXBfdG9fYnVmZmVyIC0gY29udmVydCBhIGJsb2Igb2YgZGF0
YSB0byAiaGV4IEFTQ0lJIiBpbiBtZW1vcnkKICAqIEBidWY6IGRhdGEgYmxvYiB0byBkdW1wCkBA
IC04Nyw2ICsxMDQsOSBAQCBFWFBPUlRfU1lNQk9MKGJpbjJoZXgpOwogICogQGxpbmVidWZsZW46
IHRvdGFsIHNpemUgb2YgQGxpbmVidWYsIGluY2x1ZGluZyBzcGFjZSBmb3IgdGVybWluYXRpbmcg
TlVMCiAgKiBAZmxhZ3M6IEEgYml0d2lzZSBPUiBvZiB0aGUgZm9sbG93aW5nIGZsYWdzOgogICoJ
SEVYRFVNUF9BU0NJSToJCQlpbmNsdWRlIEFTQ0lJIGFmdGVyIHRoZSBoZXggb3V0cHV0CisgKglI
RVhEVU1QXzJfR1JQX0xJTkVTOgkJaW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDIgZ3JvdXBzCisg
KglIRVhEVU1QXzRfR1JQX0xJTkVTOgkJaW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDQgZ3JvdXBz
CisgKglIRVhEVU1QXzhfR1JQX0xJTkVTOgkJaW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDggZ3Jv
dXBzCiAgKgogICogaGV4X2R1bXBfdG9fYnVmZmVyKCkgd29ya3Mgb24gb25lICJsaW5lIiBvZiBv
dXRwdXQgYXQgYSB0aW1lLCBjb252ZXJ0aW5nCiAgKiA8Z3JvdXBzaXplPiBieXRlcyBvZiBpbnB1
dCB0byBoZXhhZGVjaW1hbCAoYW5kIG9wdGlvbmFsbHkgcHJpbnRhYmxlIEFTQ0lJKQpAQCAtMTE4
LDYgKzEzOCw3IEBAIGludCBoZXhfZHVtcF90b19idWZmZXIoY29uc3Qgdm9pZCAqYnVmLCBzaXpl
X3QgbGVuLCBpbnQgcm93c2l6ZSwgaW50IGdyb3Vwc2l6ZSwKIAlpbnQgaiwgbHggPSAwOwogCWlu
dCBhc2NpaV9jb2x1bW47CiAJaW50IHJldDsKKwlpbnQgbGluZV9jaGFycyA9IDA7CiAKIAlpZiAo
IWlzX3Bvd2VyX29mXzIoZ3JvdXBzaXplKSB8fCBncm91cHNpemUgPiA4KQogCQlncm91cHNpemUg
PSAxOwpAQCAtMTQ0LDcgKzE2NSw4IEBAIGludCBoZXhfZHVtcF90b19idWZmZXIoY29uc3Qgdm9p
ZCAqYnVmLCBzaXplX3QgbGVuLCBpbnQgcm93c2l6ZSwgaW50IGdyb3Vwc2l6ZSwKIAogCQlmb3Ig
KGogPSAwOyBqIDwgbmdyb3VwczsgaisrKSB7CiAJCQlyZXQgPSBzbnByaW50ZihsaW5lYnVmICsg
bHgsIGxpbmVidWZsZW4gLSBseCwKLQkJCQkgICAgICAgIiVzJTE2LjE2bGx4IiwgaiA/ICIgIiA6
ICIiLAorCQkJCSAgICAgICAiJXMlMTYuMTZsbHgiLAorCQkJCSAgICAgICBqID8gZ3JvdXBfc2Vw
YXJhdG9yKGosIGZsYWdzKSA6ICIiLAogCQkJCSAgICAgICBnZXRfdW5hbGlnbmVkKHB0cjggKyBq
KSk7CiAJCQlpZiAocmV0ID49IGxpbmVidWZsZW4gLSBseCkKIAkJCQlnb3RvIG92ZXJmbG93MTsK
QEAgLTE1NSw3ICsxNzcsOCBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1
Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsIGludCBncm91cHNpemUsCiAKIAkJZm9yIChqID0g
MDsgaiA8IG5ncm91cHM7IGorKykgewogCQkJcmV0ID0gc25wcmludGYobGluZWJ1ZiArIGx4LCBs
aW5lYnVmbGVuIC0gbHgsCi0JCQkJICAgICAgICIlcyU4Ljh4IiwgaiA/ICIgIiA6ICIiLAorCQkJ
CSAgICAgICAiJXMlOC44eCIsCisJCQkJICAgICAgIGogPyBncm91cF9zZXBhcmF0b3IoaiwgZmxh
Z3MpIDogIiIsCiAJCQkJICAgICAgIGdldF91bmFsaWduZWQocHRyNCArIGopKTsKIAkJCWlmIChy
ZXQgPj0gbGluZWJ1ZmxlbiAtIGx4KQogCQkJCWdvdG8gb3ZlcmZsb3cxOwpAQCAtMTY2LDcgKzE4
OSw4IEBAIGludCBoZXhfZHVtcF90b19idWZmZXIoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVu
LCBpbnQgcm93c2l6ZSwgaW50IGdyb3Vwc2l6ZSwKIAogCQlmb3IgKGogPSAwOyBqIDwgbmdyb3Vw
czsgaisrKSB7CiAJCQlyZXQgPSBzbnByaW50ZihsaW5lYnVmICsgbHgsIGxpbmVidWZsZW4gLSBs
eCwKLQkJCQkgICAgICAgIiVzJTQuNHgiLCBqID8gIiAiIDogIiIsCisJCQkJICAgICAgICIlcyU0
LjR4IiwKKwkJCQkgICAgICAgaiA/IGdyb3VwX3NlcGFyYXRvcihqLCBmbGFncykgOiAiIiwKIAkJ
CQkgICAgICAgZ2V0X3VuYWxpZ25lZChwdHIyICsgaikpOwogCQkJaWYgKHJldCA+PSBsaW5lYnVm
bGVuIC0gbHgpCiAJCQkJZ290byBvdmVyZmxvdzE7CkBAIC0xOTYsMTEgKzIyMCwyNiBAQCBpbnQg
aGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3Np
emUsIGludCBncm91cHNpemUsCiAJCQlnb3RvIG92ZXJmbG93MjsKIAkJbGluZWJ1ZltseCsrXSA9
ICcgJzsKIAl9CisKKwlpZiAoZmxhZ3MgJiBIRVhEVU1QXzJfR1JQX0xJTkVTKQorCQlsaW5lX2No
YXJzID0gZ3JvdXBzaXplICogMjsKKwlpZiAoZmxhZ3MgJiBIRVhEVU1QXzRfR1JQX0xJTkVTKQor
CQlsaW5lX2NoYXJzID0gZ3JvdXBzaXplICogNDsKKwlpZiAoZmxhZ3MgJiBIRVhEVU1QXzhfR1JQ
X0xJTkVTKQorCQlsaW5lX2NoYXJzID0gZ3JvdXBzaXplICogODsKKwogCWZvciAoaiA9IDA7IGog
PCBsZW47IGorKykgewogCQlpZiAobGluZWJ1ZmxlbiA8IGx4ICsgMikKIAkJCWdvdG8gb3ZlcmZs
b3cyOwogCQljaCA9IHB0cltqXTsKIAkJbGluZWJ1ZltseCsrXSA9IChpc2FzY2lpKGNoKSAmJiBp
c3ByaW50KGNoKSkgPyBjaCA6ICcuJzsKKworCQlpZiAobGluZV9jaGFycyAmJiAoKGogKyAxKSA8
IGxlbikgJiYKKwkJCQkoKGogKyAxKSAlIGxpbmVfY2hhcnMgPT0gMCkpIHsKKwkJCWlmIChsaW5l
YnVmbGVuIDwgbHggKyAyKQorCQkJCWdvdG8gb3ZlcmZsb3cyOworCQkJbGluZWJ1ZltseCsrXSA9
ICd8JzsKKwkJfQogCX0KIG5pbDoKIAlsaW5lYnVmW2x4XSA9ICdcMCc7CkBAIC0yMDgsNyArMjQ3
LDggQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4s
IGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAogb3ZlcmZsb3cyOgogCWxpbmVidWZbbHgrK10g
PSAnXDAnOwogb3ZlcmZsb3cxOgotCXJldHVybiAoZmxhZ3MgJiBIRVhEVU1QX0FTQ0lJKSA/IGFz
Y2lpX2NvbHVtbiArIGxlbiA6CisJcmV0dXJuIChmbGFncyAmIEhFWERVTVBfQVNDSUkpID8gYXNj
aWlfY29sdW1uICsgbGVuICsKKwkJCQkJKGxlbiAtIDEpIC8gbGluZV9jaGFycyA6CiAJCQkJCSAo
Z3JvdXBzaXplICogMiArIDEpICogbmdyb3VwcyAtIDE7CiB9CiBFWFBPUlRfU1lNQk9MKGhleF9k
dW1wX3RvX2J1ZmZlcik7CkBAIC0yNDYsNyArMjg2LDcgQEAgc3RhdGljIHZvaWQgYW5ub3VuY2Vf
c2tpcHBlZChjb25zdCBjaGFyICpsZXZlbCwgY29uc3QgY2hhciAqcHJlZml4X3N0ciwKIAlpZiAo
Y291bnQgPT0gMCkKIAkJcmV0dXJuOwogCi0JcHJpbnRrKCIlcyVzICoqIFNraXBwZWQgJWx1IGJ5
dGVzIG9mIHZhbHVlIDB4JXggKipcbiIsCisJcHJpbnRrKCIlcyVzICoqIFNraXBwZWQgJWx1IGJ5
dGVzIG9mIHZhbHVlIDB4JTAyeCAqKlxuIiwKIAkgICAgICAgbGV2ZWwsIHByZWZpeF9zdHIsIGNv
dW50LCB2YWwpOwogfQogCkBAIC0yNjYsNiArMzA2LDkgQEAgc3RhdGljIHZvaWQgYW5ub3VuY2Vf
c2tpcHBlZChjb25zdCBjaGFyICpsZXZlbCwgY29uc3QgY2hhciAqcHJlZml4X3N0ciwKICAqCUhF
WERVTVBfQVNDSUk6CQkJaW5jbHVkZSBBU0NJSSBhZnRlciB0aGUgaGV4IG91dHB1dAogICoJSEVY
RFVNUF9TVVBQUkVTU19SRVBFQVRFRDoJc3VwcHJlc3MgcmVwZWF0ZWQgbGluZXMgb2YgaWRlbnRp
Y2FsCiAgKgkJCQkJYnl0ZXMKKyAqCUhFWERVTVBfMl9HUlBfTElORVM6CQlpbnNlcnQgYSAnfCcg
YWZ0ZXIgZXZlcnkgMiBncm91cHMKKyAqCUhFWERVTVBfNF9HUlBfTElORVM6CQlpbnNlcnQgYSAn
fCcgYWZ0ZXIgZXZlcnkgNCBncm91cHMKKyAqCUhFWERVTVBfOF9HUlBfTElORVM6CQlpbnNlcnQg
YSAnfCcgYWZ0ZXIgZXZlcnkgOCBncm91cHMKICAqCiAgKiBHaXZlbiBhIGJ1ZmZlciBvZiB1OCBk
YXRhLCBwcmludF9oZXhfZHVtcCgpIHByaW50cyBhIGhleCArIEFTQ0lJIGR1bXAKICAqIHRvIHRo
ZSBrZXJuZWwgbG9nIGF0IHRoZSBzcGVjaWZpZWQga2VybmVsIGxvZyBsZXZlbCwgd2l0aCBhbiBv
cHRpb25hbApAQCAtMjk1LDE0ICszMzgsMTQgQEAgdm9pZCBwcmludF9oZXhfZHVtcF9leHQoY29u
c3QgY2hhciAqbGV2ZWwsIGNvbnN0IGNoYXIgKnByZWZpeF9zdHIsCiAJdTggc2tpcHBlZF92YWwg
PSAwOwogCXNpemVfdCBza2lwcGVkID0gMDsKIAotCiAJaWYgKHJvd3NpemUgJSBncm91cHNpemUp
CiAJCXJvd3NpemUgLT0gcm93c2l6ZSAlIGdyb3Vwc2l6ZTsKIAogCS8qIFdvcnN0IGNhc2UgbGlu
ZSBsZW5ndGg6Ci0JICogMiBoZXggY2hhcnMgKyBzcGFjZSBwZXIgYnl0ZSBpbiwgMiBzcGFjZXMs
IDEgY2hhciBwZXIgYnl0ZSBpbiwgTlVMTAorCSAqIDIgaGV4IGNoYXJzICsgc3BhY2UgcGVyIGJ5
dGUgaW4sIDIgc3BhY2VzLCAxIGNoYXIgcGVyIGJ5dGUgaW4sCisJICogMSBjaGFyIHBlciBOIGdy
b3VwcywgTlVMTAogCSAqLwotCWxpbmVidWZfbGVuID0gcm93c2l6ZSAqIDMgKyAyICsgcm93c2l6
ZSArIDE7CisJbGluZWJ1Zl9sZW4gPSByb3dzaXplICogMyArIDIgKyByb3dzaXplICsgcm93c2l6
ZSAvIGdyb3Vwc2l6ZSArIDE7CiAJbGluZWJ1ZiA9IGt6YWxsb2MobGluZWJ1Zl9sZW4sIEdGUF9L
RVJORUwpOwogCWlmICghbGluZWJ1ZikgewogCQlwcmludGsoIiVzJXNoZXhkdW1wOiBDb3VsZCBu
b3QgYWxsb2MgJXUgYnl0ZXMgZm9yIGJ1ZmZlclxuIiwKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
