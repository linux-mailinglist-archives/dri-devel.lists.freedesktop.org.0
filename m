Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87767524B3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E076E06D;
	Tue, 25 Jun 2019 07:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B01F89819
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 03:19:37 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P36Pkf110756
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:37 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbaaytfug-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:36 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Tue, 25 Jun 2019 04:19:32 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 04:19:23 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5P3JDJL17564136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:19:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D54DA52059;
 Tue, 25 Jun 2019 03:19:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 406315204F;
 Tue, 25 Jun 2019 03:19:22 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7DBB5A03B5;
 Tue, 25 Jun 2019 13:19:19 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v4 6/7] lib/hexdump.c: Allow multiple groups to be separated
 by spaces
Date: Tue, 25 Jun 2019 13:17:25 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625031726.12173-1-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062503-0008-0000-0000-000002F6B5C0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062503-0009-0000-0000-00002263E426
Message-Id: <20190625031726.12173-7-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=917 adultscore=0 classifier=spam adjust=0 reason=mlx
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
L2luY2x1ZGUvbGludXgvcHJpbnRrLmgKaW5kZXggYWU4MGQ3YWY4MmFiLi4xZDA4MjI5MWZhY2Yg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKKysrIGIvaW5jbHVkZS9saW51eC9w
cmludGsuaApAQCAtNDg4LDYgKzQ4OCw5IEBAIGVudW0gewogI2RlZmluZSBIRVhEVU1QXzJfR1JQ
X0xJTkVTCQlCSVQoMikKICNkZWZpbmUgSEVYRFVNUF80X0dSUF9MSU5FUwkJQklUKDMpCiAjZGVm
aW5lIEhFWERVTVBfOF9HUlBfTElORVMJCUJJVCg0KQorI2RlZmluZSBIRVhEVU1QXzJfR1JQX1NQ
QUNFUwkJQklUKDUpCisjZGVmaW5lIEhFWERVTVBfNF9HUlBfU1BBQ0VTCQlCSVQoNikKKyNkZWZp
bmUgSEVYRFVNUF84X0dSUF9TUEFDRVMJCUJJVCg3KQogCiBleHRlcm4gaW50IGhleF9kdW1wX3Rv
X2J1ZmZlcl9leHQoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuLCBpbnQgcm93c2l6ZSwKIAkJ
CSAgICAgIGludCBncm91cHNpemUsIGNoYXIgKmxpbmVidWYsIHNpemVfdCBsaW5lYnVmbGVuLApk
aWZmIC0tZ2l0IGEvbGliL2hleGR1bXAuYyBiL2xpYi9oZXhkdW1wLmMKaW5kZXggNGRjZjc1OWZl
MDQ4Li5lMDllM2NmOGU1OTUgMTAwNjQ0Ci0tLSBhL2xpYi9oZXhkdW1wLmMKKysrIGIvbGliL2hl
eGR1bXAuYwpAQCAtOTEsOSArOTEsMzcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmdyb3VwX3NlcGFy
YXRvcihpbnQgZ3JvdXAsIHU2NCBmbGFncykKIAlpZiAoKGZsYWdzICYgSEVYRFVNUF8yX0dSUF9M
SU5FUykgJiYgISgoZ3JvdXApICUgMikpCiAJCXJldHVybiAifCI7CiAKKwlpZiAoKGZsYWdzICYg
SEVYRFVNUF84X0dSUF9TUEFDRVMpICYmICEoKGdyb3VwKSAlIDgpKQorCQlyZXR1cm4gIiAgIjsK
KworCWlmICgoZmxhZ3MgJiBIRVhEVU1QXzRfR1JQX1NQQUNFUykgJiYgISgoZ3JvdXApICUgNCkp
CisJCXJldHVybiAiICAiOworCisJaWYgKChmbGFncyAmIEhFWERVTVBfMl9HUlBfU1BBQ0VTKSAm
JiAhKChncm91cCkgJSAyKSkKKwkJcmV0dXJuICIgICI7CisKIAlyZXR1cm4gIiAiOwogfQogCitz
dGF0aWMgdm9pZCBzZXBhcmF0b3JfcGFyYW1ldGVycyh1NjQgZmxhZ3MsIGludCBncm91cHNpemUs
IGludCAqc2VwX2NoYXJzLAorCQkJCSBjaGFyICpzZXApCit7CisJaWYgKGZsYWdzICYgKEhFWERV
TVBfMl9HUlBfTElORVMgfCBIRVhEVU1QXzJfR1JQX1NQQUNFUykpCisJCSpzZXBfY2hhcnMgPSBn
cm91cHNpemUgKiAyOworCWlmIChmbGFncyAmIChIRVhEVU1QXzRfR1JQX0xJTkVTIHwgSEVYRFVN
UF80X0dSUF9TUEFDRVMpKQorCQkqc2VwX2NoYXJzID0gZ3JvdXBzaXplICogNDsKKwlpZiAoZmxh
Z3MgJiAoSEVYRFVNUF84X0dSUF9MSU5FUyB8IEhFWERVTVBfOF9HUlBfU1BBQ0VTKSkKKwkJKnNl
cF9jaGFycyA9IGdyb3Vwc2l6ZSAqIDg7CisKKwlpZiAoZmxhZ3MgJiAoSEVYRFVNUF8yX0dSUF9M
SU5FUyB8IEhFWERVTVBfNF9HUlBfTElORVMgfAorCQkJCQkgICBIRVhEVU1QXzhfR1JQX0xJTkVT
KSkKKwkJKnNlcCA9ICd8JzsKKworCWlmIChmbGFncyAmIChIRVhEVU1QXzJfR1JQX1NQQUNFUyB8
IEhFWERVTVBfNF9HUlBfU1BBQ0VTIHwKKwkJCQkJICAgSEVYRFVNUF84X0dSUF9TUEFDRVMpKQor
CQkqc2VwID0gJyAnOworfQorCiAvKioKICAqIGhleF9kdW1wX3RvX2J1ZmZlciAtIGNvbnZlcnQg
YSBibG9iIG9mIGRhdGEgdG8gImhleCBBU0NJSSIgaW4gbWVtb3J5CiAgKiBAYnVmOiBkYXRhIGJs
b2IgdG8gZHVtcApAQCAtMTA3LDYgKzEzNSw5IEBAIHN0YXRpYyBjb25zdCBjaGFyICpncm91cF9z
ZXBhcmF0b3IoaW50IGdyb3VwLCB1NjQgZmxhZ3MpCiAgKglIRVhEVU1QXzJfR1JQX0xJTkVTOgkJ
aW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDIgZ3JvdXBzCiAgKglIRVhEVU1QXzRfR1JQX0xJTkVT
OgkJaW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDQgZ3JvdXBzCiAgKglIRVhEVU1QXzhfR1JQX0xJ
TkVTOgkJaW5zZXJ0IGEgJ3wnIGFmdGVyIGV2ZXJ5IDggZ3JvdXBzCisgKglIRVhEVU1QXzJfR1JQ
X1NQQUNFUzoJCWluc2VydCBhICcgJyBhZnRlciBldmVyeSAyIGdyb3VwcworICoJSEVYRFVNUF80
X0dSUF9TUEFDRVM6CQlpbnNlcnQgYSAnICcgYWZ0ZXIgZXZlcnkgNCBncm91cHMKKyAqCUhFWERV
TVBfOF9HUlBfU1BBQ0VTOgkJaW5zZXJ0IGEgJyAnIGFmdGVyIGV2ZXJ5IDggZ3JvdXBzCiAgKgog
ICogaGV4X2R1bXBfdG9fYnVmZmVyKCkgd29ya3Mgb24gb25lICJsaW5lIiBvZiBvdXRwdXQgYXQg
YSB0aW1lLCBjb252ZXJ0aW5nCiAgKiA8Z3JvdXBzaXplPiBieXRlcyBvZiBpbnB1dCB0byBoZXhh
ZGVjaW1hbCAoYW5kIG9wdGlvbmFsbHkgcHJpbnRhYmxlIEFTQ0lJKQpAQCAtMTM5LDcgKzE3MCw4
IEBAIGludCBoZXhfZHVtcF90b19idWZmZXJfZXh0KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxl
biwgaW50IHJvd3NpemUsCiAJaW50IGosIGx4ID0gMDsKIAlpbnQgYXNjaWlfY29sdW1uOwogCWlu
dCByZXQ7Ci0JaW50IGxpbmVfY2hhcnMgPSAwOworCWludCBzZXBfY2hhcnMgPSAwOworCWNoYXIg
c2VwID0gMDsKIAogCWlmICghaXNfcG93ZXJfb2ZfMihncm91cHNpemUpIHx8IGdyb3Vwc2l6ZSA+
IDgpCiAJCWdyb3Vwc2l6ZSA9IDE7CkBAIC0xNTMsOCArMTg1LDE0IEBAIGludCBoZXhfZHVtcF90
b19idWZmZXJfZXh0KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsCiAJ
CWxlbiA9IHJvd3NpemU7CiAKIAluZ3JvdXBzID0gbGVuIC8gZ3JvdXBzaXplOworCiAJYXNjaWlf
Y29sdW1uID0gcm93c2l6ZSAqIDIgKyByb3dzaXplIC8gZ3JvdXBzaXplICsgMTsKIAorCS8vIHNw
YWNlIHNlcGFyYXRvcnMgdXNlIDIgc3BhY2VzIGluIHRoZSBoZXggb3V0cHV0CisJc2VwYXJhdG9y
X3BhcmFtZXRlcnMoZmxhZ3MsIGdyb3Vwc2l6ZSwgJnNlcF9jaGFycywgJnNlcCk7CisJaWYgKHNl
cCA9PSAnICcpCisJCWFzY2lpX2NvbHVtbiArPSByb3dzaXplIC8gc2VwX2NoYXJzOworCiAJaWYg
KCFsaW5lYnVmbGVuKQogCQlnb3RvIG92ZXJmbG93MTsKIApAQCAtMjIyLDI0ICsyNjAsMTcgQEAg
aW50IGhleF9kdW1wX3RvX2J1ZmZlcl9leHQoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuLCBp
bnQgcm93c2l6ZSwKIAkJbGluZWJ1ZltseCsrXSA9ICcgJzsKIAl9CiAKLQlpZiAoZmxhZ3MgJiBI
RVhEVU1QXzJfR1JQX0xJTkVTKQotCQlsaW5lX2NoYXJzID0gZ3JvdXBzaXplICogMjsKLQlpZiAo
ZmxhZ3MgJiBIRVhEVU1QXzRfR1JQX0xJTkVTKQotCQlsaW5lX2NoYXJzID0gZ3JvdXBzaXplICog
NDsKLQlpZiAoZmxhZ3MgJiBIRVhEVU1QXzhfR1JQX0xJTkVTKQotCQlsaW5lX2NoYXJzID0gZ3Jv
dXBzaXplICogODsKLQogCWZvciAoaiA9IDA7IGogPCBsZW47IGorKykgewogCQlpZiAobGluZWJ1
ZmxlbiA8IGx4ICsgMikKIAkJCWdvdG8gb3ZlcmZsb3cyOwogCQljaCA9IHB0cltqXTsKIAkJbGlu
ZWJ1ZltseCsrXSA9IChpc2FzY2lpKGNoKSAmJiBpc3ByaW50KGNoKSkgPyBjaCA6ICcuJzsKIAot
CQlpZiAobGluZV9jaGFycyAmJiAoKGogKyAxKSA8IGxlbikgJiYKLQkJCQkoKGogKyAxKSAlIGxp
bmVfY2hhcnMgPT0gMCkpIHsKKwkJaWYgKHNlcF9jaGFycyAmJiAoKGogKyAxKSA8IGxlbikgJiYK
KwkJCQkoKGogKyAxKSAlIHNlcF9jaGFycyA9PSAwKSkgewogCQkJaWYgKGxpbmVidWZsZW4gPCBs
eCArIDIpCiAJCQkJZ290byBvdmVyZmxvdzI7Ci0JCQlsaW5lYnVmW2x4KytdID0gJ3wnOworCQkJ
bGluZWJ1ZltseCsrXSA9IHNlcDsKIAkJfQogCX0KIG5pbDoKQEAgLTI0OCw5ICsyNzksMTEgQEAg
aW50IGhleF9kdW1wX3RvX2J1ZmZlcl9leHQoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuLCBp
bnQgcm93c2l6ZSwKIG92ZXJmbG93MjoKIAlsaW5lYnVmW2x4KytdID0gJ1wwJzsKIG92ZXJmbG93
MToKLQlyZXR1cm4gKGZsYWdzICYgSEVYRFVNUF9BU0NJSSkgPyBhc2NpaV9jb2x1bW4gKyBsZW4g
KwotCQkJCQkobGVuIC0gMSkgLyBsaW5lX2NoYXJzIDoKLQkJCQkJIChncm91cHNpemUgKiAyICsg
MSkgKiBuZ3JvdXBzIC0gMTsKKwlpZiAoZmxhZ3MgJiBIRVhEVU1QX0FTQ0lJKQorCQlyZXR1cm4g
YXNjaWlfY29sdW1uICsgbGVuICsgKGxlbiAtIDEpIC8gc2VwX2NoYXJzOworCisJcmV0dXJuIGdy
b3Vwc2l6ZSAqIDIgKiBuZ3JvdXBzICsKKwkJKChzZXAgPT0gJyAnKSA/IDIgOiAxKSAqIChuZ3Jv
dXBzIC0gMSk7CiB9CiBFWFBPUlRfU1lNQk9MKGhleF9kdW1wX3RvX2J1ZmZlcl9leHQpOwogCkBA
IC0zNDUsOSArMzc4LDkgQEAgdm9pZCBwcmludF9oZXhfZHVtcF9leHQoY29uc3QgY2hhciAqbGV2
ZWwsIGNvbnN0IGNoYXIgKnByZWZpeF9zdHIsCiAJLyoKIAkgKiBXb3JzdCBjYXNlIGxpbmUgbGVu
Z3RoOgogCSAqIDIgaGV4IGNoYXJzICsgc3BhY2UgcGVyIGJ5dGUgaW4sIDIgc3BhY2VzLCAxIGNo
YXIgcGVyIGJ5dGUgaW4sCi0JICogMSBjaGFyIHBlciBOIGdyb3VwcywgTlVMTAorCSAqIDIgY2hh
ciBwZXIgTiBncm91cHMsIE5VTEwKIAkgKi8KLQlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsg
MiArIHJvd3NpemUgKyByb3dzaXplIC8gZ3JvdXBzaXplICsgMTsKKwlsaW5lYnVmX2xlbiA9IHJv
d3NpemUgKiAzICsgMiArIHJvd3NpemUgKyAyICogcm93c2l6ZSAvIGdyb3Vwc2l6ZSArIDE7CiAJ
bGluZWJ1ZiA9IGt6YWxsb2MobGluZWJ1Zl9sZW4sIEdGUF9LRVJORUwpOwogCWlmICghbGluZWJ1
ZikgewogCQlwcmludGsoIiVzJXNoZXhkdW1wOiBDb3VsZCBub3QgYWxsb2MgJXUgYnl0ZXMgZm9y
IGJ1ZmZlclxuIiwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
