Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AA47A8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053468919A;
	Mon, 17 Jun 2019 07:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8B89186
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 02:55:04 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H27bof081255
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:08:06 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t5q66perw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:08:05 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Mon, 17 Jun 2019 03:06:54 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 03:06:44 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5H26hXE39911824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 02:06:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A51F042045;
 Mon, 17 Jun 2019 02:06:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B53F44203F;
 Mon, 17 Jun 2019 02:06:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 02:06:42 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 960BCA03B5;
 Mon, 17 Jun 2019 12:06:41 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 6/7] lib/hexdump.c: Allow multiple groups to be separated
 by spaces
Date: Mon, 17 Jun 2019 12:04:29 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617020430.8708-1-alastair@au1.ibm.com>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061702-0012-0000-0000-00000329AB19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061702-0013-0000-0000-00002162C06E
Message-Id: <20190617020430.8708-7-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=941 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170019
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:33 +0000
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

RnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+CgpTaW1pbGFyIHRv
IHRoZSBwcmV2aW91cyBwYXRjaCwgdGhpcyBwYXRjaCBzZXBhcmF0ZXMgZ3JvdXBzIGJ5IDIgc3Bh
Y2VzIGZvcgp0aGUgaGV4IGZpZWxkcywgYW5kIDEgc3BhY2UgZm9yIHRoZSBBU0NJSSBmaWVsZC4K
CmVnLgpidWY6MDAwMDAwMDA6IDQ1NGQ0MTRlIDQzNDE1MDUzICA0ZTQ5NWY0NSAwMDU4NDU0NCAg
TkFNRVNQQUMgRV9JTkRFWC4KYnVmOjAwMDAwMDEwOiAwMDAwMDAwMCAwMDAwMDAwMiAgMDAwMDAw
MDAgMDAwMDAwMDAgIC4uLi4uLi4uIC4uLi4uLi4uCgpTaWduZWQtb2ZmLWJ5OiBBbGFzdGFpciBE
J1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KLS0tCiBpbmNsdWRlL2xpbnV4L3ByaW50ay5o
IHwgIDMgKysKIGxpYi9oZXhkdW1wLmMgICAgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygr
KSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wcmludGsuaCBi
L2luY2x1ZGUvbGludXgvcHJpbnRrLmgKaW5kZXggYzZiNzQ4ZjY2YTgyLi4wNDQxNmU3ODg4MDIg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKKysrIGIvaW5jbHVkZS9saW51eC9w
cmludGsuaApAQCAtNDg3LDYgKzQ4Nyw5IEBAIGVudW0gewogI2RlZmluZSBIRVhEVU1QXzJfR1JQ
X0xJTkVTCQlCSVQoMikKICNkZWZpbmUgSEVYRFVNUF80X0dSUF9MSU5FUwkJQklUKDMpCiAjZGVm
aW5lIEhFWERVTVBfOF9HUlBfTElORVMJCUJJVCg0KQorI2RlZmluZSBIRVhEVU1QXzJfR1JQX1NQ
QUNFUwkJQklUKDUpCisjZGVmaW5lIEhFWERVTVBfNF9HUlBfU1BBQ0VTCQlCSVQoNikKKyNkZWZp
bmUgSEVYRFVNUF84X0dSUF9TUEFDRVMJCUJJVCg3KQogCiBleHRlcm4gaW50IGhleF9kdW1wX3Rv
X2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCByb3dzaXplLAogCQkJICAg
ICAgaW50IGdyb3Vwc2l6ZSwgY2hhciAqbGluZWJ1Ziwgc2l6ZV90IGxpbmVidWZsZW4sCmRpZmYg
LS1naXQgYS9saWIvaGV4ZHVtcC5jIGIvbGliL2hleGR1bXAuYwppbmRleCA0ZGE3ZDI0ODI2ZmIu
LmRjODVlZjBkYmIwYSAxMDA2NDQKLS0tIGEvbGliL2hleGR1bXAuYworKysgYi9saWIvaGV4ZHVt
cC5jCkBAIC05MSw5ICs5MSwzNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqZ3JvdXBfc2VwYXJhdG9y
KGludCBncm91cCwgdTY0IGZsYWdzKQogCWlmICgoZmxhZ3MgJiBIRVhEVU1QXzJfR1JQX0xJTkVT
KSAmJiAhKChncm91cCkgJSAyKSkKIAkJcmV0dXJuICJ8IjsKIAorCWlmICgoZmxhZ3MgJiBIRVhE
VU1QXzhfR1JQX1NQQUNFUykgJiYgISgoZ3JvdXApICUgOCkpCisJCXJldHVybiAiICAiOworCisJ
aWYgKChmbGFncyAmIEhFWERVTVBfNF9HUlBfU1BBQ0VTKSAmJiAhKChncm91cCkgJSA0KSkKKwkJ
cmV0dXJuICIgICI7CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF8yX0dSUF9TUEFDRVMpICYmICEo
KGdyb3VwKSAlIDIpKQorCQlyZXR1cm4gIiAgIjsKKwogCXJldHVybiAiICI7CiB9CiAKK3N0YXRp
YyB2b2lkIHNlcGFyYXRvcl9wYXJhbWV0ZXJzKHU2NCBmbGFncywgaW50IGdyb3Vwc2l6ZSwgaW50
ICpzZXBfY2hhcnMsCisJCQkJIGNoYXIgKnNlcCkKK3sKKwlpZiAoZmxhZ3MgJiAoSEVYRFVNUF8y
X0dSUF9MSU5FUyB8IEhFWERVTVBfMl9HUlBfU1BBQ0VTKSkKKwkJKnNlcF9jaGFycyA9IGdyb3Vw
c2l6ZSAqIDI7CisJaWYgKGZsYWdzICYgKEhFWERVTVBfNF9HUlBfTElORVMgfCBIRVhEVU1QXzRf
R1JQX1NQQUNFUykpCisJCSpzZXBfY2hhcnMgPSBncm91cHNpemUgKiA0OworCWlmIChmbGFncyAm
IChIRVhEVU1QXzhfR1JQX0xJTkVTIHwgSEVYRFVNUF84X0dSUF9TUEFDRVMpKQorCQkqc2VwX2No
YXJzID0gZ3JvdXBzaXplICogODsKKworCWlmIChmbGFncyAmIChIRVhEVU1QXzJfR1JQX0xJTkVT
IHwgSEVYRFVNUF80X0dSUF9MSU5FUyB8CisJCQkJCSAgIEhFWERVTVBfOF9HUlBfTElORVMpKQor
CQkqc2VwID0gJ3wnOworCisJaWYgKGZsYWdzICYgKEhFWERVTVBfMl9HUlBfU1BBQ0VTIHwgSEVY
RFVNUF80X0dSUF9TUEFDRVMgfAorCQkJCQkgICBIRVhEVU1QXzhfR1JQX1NQQUNFUykpCisJCSpz
ZXAgPSAnICc7Cit9CisKIC8qKgogICogaGV4X2R1bXBfdG9fYnVmZmVyIC0gY29udmVydCBhIGJs
b2Igb2YgZGF0YSB0byAiaGV4IEFTQ0lJIiBpbiBtZW1vcnkKICAqIEBidWY6IGRhdGEgYmxvYiB0
byBkdW1wCkBAIC0xMDcsNiArMTM1LDkgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmdyb3VwX3NlcGFy
YXRvcihpbnQgZ3JvdXAsIHU2NCBmbGFncykKICAqCUhFWERVTVBfMl9HUlBfTElORVM6CQlpbnNl
cnQgYSAnfCcgYWZ0ZXIgZXZlcnkgMiBncm91cHMKICAqCUhFWERVTVBfNF9HUlBfTElORVM6CQlp
bnNlcnQgYSAnfCcgYWZ0ZXIgZXZlcnkgNCBncm91cHMKICAqCUhFWERVTVBfOF9HUlBfTElORVM6
CQlpbnNlcnQgYSAnfCcgYWZ0ZXIgZXZlcnkgOCBncm91cHMKKyAqCUhFWERVTVBfMl9HUlBfU1BB
Q0VTOgkJaW5zZXJ0IGEgJyAnIGFmdGVyIGV2ZXJ5IDIgZ3JvdXBzCisgKglIRVhEVU1QXzRfR1JQ
X1NQQUNFUzoJCWluc2VydCBhICcgJyBhZnRlciBldmVyeSA0IGdyb3VwcworICoJSEVYRFVNUF84
X0dSUF9TUEFDRVM6CQlpbnNlcnQgYSAnICcgYWZ0ZXIgZXZlcnkgOCBncm91cHMKICAqCiAgKiBo
ZXhfZHVtcF90b19idWZmZXIoKSB3b3JrcyBvbiBvbmUgImxpbmUiIG9mIG91dHB1dCBhdCBhIHRp
bWUsIGNvbnZlcnRpbmcKICAqIDxncm91cHNpemU+IGJ5dGVzIG9mIGlucHV0IHRvIGhleGFkZWNp
bWFsIChhbmQgb3B0aW9uYWxseSBwcmludGFibGUgQVNDSUkpCkBAIC0xMzgsNyArMTY5LDggQEAg
aW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCBy
b3dzaXplLCBpbnQgZ3JvdXBzaXplLAogCWludCBqLCBseCA9IDA7CiAJaW50IGFzY2lpX2NvbHVt
bjsKIAlpbnQgcmV0OwotCWludCBsaW5lX2NoYXJzID0gMDsKKwlpbnQgc2VwX2NoYXJzID0gMDsK
KwljaGFyIHNlcCA9IDA7CiAKIAlpZiAoIWlzX3Bvd2VyX29mXzIoZ3JvdXBzaXplKSB8fCBncm91
cHNpemUgPiA4KQogCQlncm91cHNpemUgPSAxOwpAQCAtMTUyLDggKzE4NCwxNCBAQCBpbnQgaGV4
X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUs
IGludCBncm91cHNpemUsCiAJCWxlbiA9IHJvd3NpemU7CiAKIAluZ3JvdXBzID0gbGVuIC8gZ3Jv
dXBzaXplOworCiAJYXNjaWlfY29sdW1uID0gcm93c2l6ZSAqIDIgKyByb3dzaXplIC8gZ3JvdXBz
aXplICsgMTsKIAorCS8vIHNwYWNlIHNlcGFyYXRvcnMgdXNlIDIgc3BhY2VzIGluIHRoZSBoZXgg
b3V0cHV0CisJc2VwYXJhdG9yX3BhcmFtZXRlcnMoZmxhZ3MsIGdyb3Vwc2l6ZSwgJnNlcF9jaGFy
cywgJnNlcCk7CisJaWYgKHNlcCA9PSAnICcpCisJCWFzY2lpX2NvbHVtbiArPSByb3dzaXplIC8g
c2VwX2NoYXJzOworCiAJaWYgKCFsaW5lYnVmbGVuKQogCQlnb3RvIG92ZXJmbG93MTsKIApAQCAt
MjIxLDI0ICsyNTksMTcgQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYs
IHNpemVfdCBsZW4sIGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAogCQlsaW5lYnVmW2x4Kytd
ID0gJyAnOwogCX0KIAotCWlmIChmbGFncyAmIEhFWERVTVBfMl9HUlBfTElORVMpCi0JCWxpbmVf
Y2hhcnMgPSBncm91cHNpemUgKiAyOwotCWlmIChmbGFncyAmIEhFWERVTVBfNF9HUlBfTElORVMp
Ci0JCWxpbmVfY2hhcnMgPSBncm91cHNpemUgKiA0OwotCWlmIChmbGFncyAmIEhFWERVTVBfOF9H
UlBfTElORVMpCi0JCWxpbmVfY2hhcnMgPSBncm91cHNpemUgKiA4OwotCiAJZm9yIChqID0gMDsg
aiA8IGxlbjsgaisrKSB7CiAJCWlmIChsaW5lYnVmbGVuIDwgbHggKyAyKQogCQkJZ290byBvdmVy
ZmxvdzI7CiAJCWNoID0gcHRyW2pdOwogCQlsaW5lYnVmW2x4KytdID0gKGlzYXNjaWkoY2gpICYm
IGlzcHJpbnQoY2gpKSA/IGNoIDogJy4nOwogCi0JCWlmIChsaW5lX2NoYXJzICYmICgoaiArIDEp
IDwgbGVuKSAmJgotCQkJCSgoaiArIDEpICUgbGluZV9jaGFycyA9PSAwKSkgeworCQlpZiAoc2Vw
X2NoYXJzICYmICgoaiArIDEpIDwgbGVuKSAmJgorCQkJCSgoaiArIDEpICUgc2VwX2NoYXJzID09
IDApKSB7CiAJCQlpZiAobGluZWJ1ZmxlbiA8IGx4ICsgMikKIAkJCQlnb3RvIG92ZXJmbG93MjsK
LQkJCWxpbmVidWZbbHgrK10gPSAnfCc7CisJCQlsaW5lYnVmW2x4KytdID0gc2VwOwogCQl9CiAJ
fQogbmlsOgpAQCAtMjQ3LDkgKzI3OCwxMSBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0
IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsIGludCBncm91cHNpemUsCiBvdmVy
ZmxvdzI6CiAJbGluZWJ1ZltseCsrXSA9ICdcMCc7CiBvdmVyZmxvdzE6Ci0JcmV0dXJuIChmbGFn
cyAmIEhFWERVTVBfQVNDSUkpID8gYXNjaWlfY29sdW1uICsgbGVuICsKLQkJCQkJKGxlbiAtIDEp
IC8gbGluZV9jaGFycyA6Ci0JCQkJCSAoZ3JvdXBzaXplICogMiArIDEpICogbmdyb3VwcyAtIDE7
CisJaWYgKGZsYWdzICYgSEVYRFVNUF9BU0NJSSkKKwkJcmV0dXJuIGFzY2lpX2NvbHVtbiArIGxl
biArIChsZW4gLSAxKSAvIHNlcF9jaGFyczsKKworCXJldHVybiBncm91cHNpemUgKiAyICogbmdy
b3VwcyArCisJCSgoc2VwID09ICcgJykgPyAyIDogMSkgKiAobmdyb3VwcyAtIDEpOwogfQogRVhQ
T1JUX1NZTUJPTChoZXhfZHVtcF90b19idWZmZXIpOwogCkBAIC0zNDMsOSArMzc2LDkgQEAgdm9p
ZCBwcmludF9oZXhfZHVtcF9leHQoY29uc3QgY2hhciAqbGV2ZWwsIGNvbnN0IGNoYXIgKnByZWZp
eF9zdHIsCiAKIAkvKiBXb3JzdCBjYXNlIGxpbmUgbGVuZ3RoOgogCSAqIDIgaGV4IGNoYXJzICsg
c3BhY2UgcGVyIGJ5dGUgaW4sIDIgc3BhY2VzLCAxIGNoYXIgcGVyIGJ5dGUgaW4sCi0JICogMSBj
aGFyIHBlciBOIGdyb3VwcywgTlVMTAorCSAqIDIgY2hhciBwZXIgTiBncm91cHMsIE5VTEwKIAkg
Ki8KLQlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsgMiArIHJvd3NpemUgKyByb3dzaXplIC8g
Z3JvdXBzaXplICsgMTsKKwlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsgMiArIHJvd3NpemUg
KyAyICogcm93c2l6ZSAvIGdyb3Vwc2l6ZSArIDE7CiAJbGluZWJ1ZiA9IGt6YWxsb2MobGluZWJ1
Zl9sZW4sIEdGUF9LRVJORUwpOwogCWlmICghbGluZWJ1ZikgewogCQlwcmludGsoIiVzJXNoZXhk
dW1wOiBDb3VsZCBub3QgYWxsb2MgJXUgYnl0ZXMgZm9yIGJ1ZmZlclxuIiwKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
