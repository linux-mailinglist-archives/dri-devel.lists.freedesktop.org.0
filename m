Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326C1741F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E5589857;
	Wed,  8 May 2019 08:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C563892C1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 07:02:54 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x487231G020237
 for <dri-devel@lists.freedesktop.org>; Wed, 8 May 2019 03:02:53 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sbrxkm0g3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 03:02:52 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Wed, 8 May 2019 08:02:50 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 08:02:40 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4872dLI58195990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 07:02:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0235A405F;
 Wed,  8 May 2019 07:02:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28D9FA4062;
 Wed,  8 May 2019 07:02:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 07:02:39 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 681BEA03BC;
 Wed,  8 May 2019 17:02:35 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 6/7] lib/hexdump.c: Allow multiple groups to be separated
 by spaces
Date: Wed,  8 May 2019 17:01:46 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508070148.23130-1-alastair@au1.ibm.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050807-0020-0000-0000-0000033A6C76
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050807-0021-0000-0000-0000218D0BCB
Message-Id: <20190508070148.23130-7-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=998 adultscore=0 classifier=spam adjust=0 reason=mlx
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
L2luY2x1ZGUvbGludXgvcHJpbnRrLmgKaW5kZXggZGM2OTNhZWMzOTRjLi41MjMxYTE0ZTQ1OTMg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmgKKysrIGIvaW5jbHVkZS9saW51eC9w
cmludGsuaApAQCAtNDg1LDYgKzQ4NSw5IEBAIGVudW0gewogI2RlZmluZSBIRVhEVU1QXzJfR1JQ
X0xJTkVTCQkoMSA8PCAyKQogI2RlZmluZSBIRVhEVU1QXzRfR1JQX0xJTkVTCQkoMSA8PCAzKQog
I2RlZmluZSBIRVhEVU1QXzhfR1JQX0xJTkVTCQkoMSA8PCA0KQorI2RlZmluZSBIRVhEVU1QXzJf
R1JQX1NQQUNFUwkJKDEgPDwgNSkKKyNkZWZpbmUgSEVYRFVNUF80X0dSUF9TUEFDRVMJCSgxIDw8
IDYpCisjZGVmaW5lIEhFWERVTVBfOF9HUlBfU1BBQ0VTCQkoMSA8PCA3KQogCiBleHRlcm4gaW50
IGhleF9kdW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCByb3dz
aXplLAogCQkJICAgICAgaW50IGdyb3Vwc2l6ZSwgY2hhciAqbGluZWJ1Ziwgc2l6ZV90IGxpbmVi
dWZsZW4sCmRpZmYgLS1naXQgYS9saWIvaGV4ZHVtcC5jIGIvbGliL2hleGR1bXAuYwppbmRleCA2
ZjRkMTE3NmMzMzIuLmZlYmQ2MTQ0MDZkMSAxMDA2NDQKLS0tIGEvbGliL2hleGR1bXAuYworKysg
Yi9saWIvaGV4ZHVtcC5jCkBAIC05MSw5ICs5MSwzNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqZ3Jv
dXBfc2VwYXJhdG9yKGludCBncm91cCwgdTY0IGZsYWdzKQogCWlmICgoZmxhZ3MgJiBIRVhEVU1Q
XzJfR1JQX0xJTkVTKSAmJiAhKChncm91cCkgJSAyKSkKIAkJcmV0dXJuICJ8IjsKIAorCWlmICgo
ZmxhZ3MgJiBIRVhEVU1QXzhfR1JQX1NQQUNFUykgJiYgISgoZ3JvdXApICUgOCkpCisJCXJldHVy
biAiICAiOworCisJaWYgKChmbGFncyAmIEhFWERVTVBfNF9HUlBfU1BBQ0VTKSAmJiAhKChncm91
cCkgJSA0KSkKKwkJcmV0dXJuICIgICI7CisKKwlpZiAoKGZsYWdzICYgSEVYRFVNUF8yX0dSUF9T
UEFDRVMpICYmICEoKGdyb3VwKSAlIDIpKQorCQlyZXR1cm4gIiAgIjsKKwogCXJldHVybiAiICI7
CiB9CiAKK3N0YXRpYyB2b2lkIHNlcGFyYXRvcl9wYXJhbWV0ZXJzKHU2NCBmbGFncywgaW50IGdy
b3Vwc2l6ZSwgaW50ICpzZXBfY2hhcnMsCisJCQkJIGNoYXIgKnNlcCkKK3sKKwlpZiAoZmxhZ3Mg
JiAoSEVYRFVNUF8yX0dSUF9MSU5FUyB8IEhFWERVTVBfMl9HUlBfU1BBQ0VTKSkKKwkJKnNlcF9j
aGFycyA9IGdyb3Vwc2l6ZSAqIDI7CisJaWYgKGZsYWdzICYgKEhFWERVTVBfNF9HUlBfTElORVMg
fCBIRVhEVU1QXzRfR1JQX1NQQUNFUykpCisJCSpzZXBfY2hhcnMgPSBncm91cHNpemUgKiA0Owor
CWlmIChmbGFncyAmIChIRVhEVU1QXzhfR1JQX0xJTkVTIHwgSEVYRFVNUF84X0dSUF9TUEFDRVMp
KQorCQkqc2VwX2NoYXJzID0gZ3JvdXBzaXplICogODsKKworCWlmIChmbGFncyAmIChIRVhEVU1Q
XzJfR1JQX0xJTkVTIHwgSEVYRFVNUF80X0dSUF9MSU5FUyB8CisJCQkJCSAgIEhFWERVTVBfOF9H
UlBfTElORVMpKQorCQkqc2VwID0gJ3wnOworCisJaWYgKGZsYWdzICYgKEhFWERVTVBfMl9HUlBf
U1BBQ0VTIHwgSEVYRFVNUF80X0dSUF9TUEFDRVMgfAorCQkJCQkgICBIRVhEVU1QXzhfR1JQX1NQ
QUNFUykpCisJCSpzZXAgPSAnICc7Cit9CisKIC8qKgogICogaGV4X2R1bXBfdG9fYnVmZmVyIC0g
Y29udmVydCBhIGJsb2Igb2YgZGF0YSB0byAiaGV4IEFTQ0lJIiBpbiBtZW1vcnkKICAqIEBidWY6
IGRhdGEgYmxvYiB0byBkdW1wCkBAIC0xMDcsNiArMTM1LDkgQEAgc3RhdGljIGNvbnN0IGNoYXIg
Kmdyb3VwX3NlcGFyYXRvcihpbnQgZ3JvdXAsIHU2NCBmbGFncykKICAqCUhFWERVTVBfMl9HUlBf
TElORVM6CQlpbnNlcnQgYSAnfCcgYWZ0ZXIgZXZlcnkgMiBncm91cHMKICAqCUhFWERVTVBfNF9H
UlBfTElORVM6CQlpbnNlcnQgYSAnfCcgYWZ0ZXIgZXZlcnkgNCBncm91cHMKICAqCUhFWERVTVBf
OF9HUlBfTElORVM6CQlpbnNlcnQgYSAnfCcgYWZ0ZXIgZXZlcnkgOCBncm91cHMKKyAqCUhFWERV
TVBfMl9HUlBfU1BBQ0VTOgkJaW5zZXJ0IGEgJyAnIGFmdGVyIGV2ZXJ5IDIgZ3JvdXBzCisgKglI
RVhEVU1QXzRfR1JQX1NQQUNFUzoJCWluc2VydCBhICcgJyBhZnRlciBldmVyeSA0IGdyb3Vwcwor
ICoJSEVYRFVNUF84X0dSUF9TUEFDRVM6CQlpbnNlcnQgYSAnICcgYWZ0ZXIgZXZlcnkgOCBncm91
cHMKICAqCiAgKiBoZXhfZHVtcF90b19idWZmZXIoKSB3b3JrcyBvbiBvbmUgImxpbmUiIG9mIG91
dHB1dCBhdCBhIHRpbWUsIGNvbnZlcnRpbmcKICAqIDxncm91cHNpemU+IGJ5dGVzIG9mIGlucHV0
IHRvIGhleGFkZWNpbWFsIChhbmQgb3B0aW9uYWxseSBwcmludGFibGUgQVNDSUkpCkBAIC0xMzgs
NyArMTY5LDggQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVf
dCBsZW4sIGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAogCWludCBqLCBseCA9IDA7CiAJaW50
IGFzY2lpX2NvbHVtbjsKIAlpbnQgcmV0OwotCWludCBsaW5lX2NoYXJzID0gMDsKKwlpbnQgc2Vw
X2NoYXJzID0gMDsKKwljaGFyIHNlcCA9IDA7CiAKIAlpZiAoIWlzX3Bvd2VyX29mXzIoZ3JvdXBz
aXplKSB8fCBncm91cHNpemUgPiA4KQogCQlncm91cHNpemUgPSAxOwpAQCAtMTUyLDggKzE4NCwx
NCBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwg
aW50IHJvd3NpemUsIGludCBncm91cHNpemUsCiAJCWxlbiA9IHJvd3NpemU7CiAKIAluZ3JvdXBz
ID0gbGVuIC8gZ3JvdXBzaXplOworCiAJYXNjaWlfY29sdW1uID0gcm93c2l6ZSAqIDIgKyByb3dz
aXplIC8gZ3JvdXBzaXplICsgMTsKIAorCS8vIHNwYWNlIHNlcGFyYXRvcnMgdXNlIDIgc3BhY2Vz
IGluIHRoZSBoZXggb3V0cHV0CisJc2VwYXJhdG9yX3BhcmFtZXRlcnMoZmxhZ3MsIGdyb3Vwc2l6
ZSwgJnNlcF9jaGFycywgJnNlcCk7CisJaWYgKHNlcCA9PSAnICcpCisJCWFzY2lpX2NvbHVtbiAr
PSByb3dzaXplIC8gc2VwX2NoYXJzOworCiAJaWYgKCFsaW5lYnVmbGVuKQogCQlnb3RvIG92ZXJm
bG93MTsKIApAQCAtMjIxLDI0ICsyNTksMTcgQEAgaW50IGhleF9kdW1wX3RvX2J1ZmZlcihjb25z
dCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAogCQls
aW5lYnVmW2x4KytdID0gJyAnOwogCX0KIAotCWlmIChmbGFncyAmIEhFWERVTVBfMl9HUlBfTElO
RVMpCi0JCWxpbmVfY2hhcnMgPSBncm91cHNpemUgKiAyOwotCWlmIChmbGFncyAmIEhFWERVTVBf
NF9HUlBfTElORVMpCi0JCWxpbmVfY2hhcnMgPSBncm91cHNpemUgKiA0OwotCWlmIChmbGFncyAm
IEhFWERVTVBfOF9HUlBfTElORVMpCi0JCWxpbmVfY2hhcnMgPSBncm91cHNpemUgKiA4OwotCiAJ
Zm9yIChqID0gMDsgaiA8IGxlbjsgaisrKSB7CiAJCWlmIChsaW5lYnVmbGVuIDwgbHggKyAyKQog
CQkJZ290byBvdmVyZmxvdzI7CiAJCWNoID0gcHRyW2pdOwogCQlsaW5lYnVmW2x4KytdID0gKGlz
YXNjaWkoY2gpICYmIGlzcHJpbnQoY2gpKSA/IGNoIDogJy4nOwogCi0JCWlmIChsaW5lX2NoYXJz
ICYmICgoaiArIDEpIDwgbGVuKSAmJgotCQkJCSgoaiArIDEpICUgbGluZV9jaGFycyA9PSAwKSkg
eworCQlpZiAoc2VwX2NoYXJzICYmICgoaiArIDEpIDwgbGVuKSAmJgorCQkJCSgoaiArIDEpICUg
c2VwX2NoYXJzID09IDApKSB7CiAJCQlpZiAobGluZWJ1ZmxlbiA8IGx4ICsgMikKIAkJCQlnb3Rv
IG92ZXJmbG93MjsKLQkJCWxpbmVidWZbbHgrK10gPSAnfCc7CisJCQlsaW5lYnVmW2x4KytdID0g
c2VwOwogCQl9CiAJfQogbmlsOgpAQCAtMjQ3LDkgKzI3OCwxMSBAQCBpbnQgaGV4X2R1bXBfdG9f
YnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsIGludCBncm91
cHNpemUsCiBvdmVyZmxvdzI6CiAJbGluZWJ1ZltseCsrXSA9ICdcMCc7CiBvdmVyZmxvdzE6Ci0J
cmV0dXJuIChmbGFncyAmIEhFWERVTVBfQVNDSUkpID8gYXNjaWlfY29sdW1uICsgbGVuICsKLQkJ
CQkJKGxlbiAtIDEpIC8gbGluZV9jaGFycyA6Ci0JCQkJCSAoZ3JvdXBzaXplICogMiArIDEpICog
bmdyb3VwcyAtIDE7CisJaWYgKGZsYWdzICYgSEVYRFVNUF9BU0NJSSkKKwkJcmV0dXJuIGFzY2lp
X2NvbHVtbiArIGxlbiArIChsZW4gLSAxKSAvIHNlcF9jaGFyczsKKworCXJldHVybiBncm91cHNp
emUgKiAyICogbmdyb3VwcyArCisJCSgoc2VwID09ICcgJykgPyAyIDogMSkgKiAobmdyb3VwcyAt
IDEpOwogfQogRVhQT1JUX1NZTUJPTChoZXhfZHVtcF90b19idWZmZXIpOwogCkBAIC0zNDMsOSAr
Mzc2LDkgQEAgdm9pZCBwcmludF9oZXhfZHVtcF9leHQoY29uc3QgY2hhciAqbGV2ZWwsIGNvbnN0
IGNoYXIgKnByZWZpeF9zdHIsCiAKIAkvKiBXb3JzdCBjYXNlIGxpbmUgbGVuZ3RoOgogCSAqIDIg
aGV4IGNoYXJzICsgc3BhY2UgcGVyIGJ5dGUgaW4sIDIgc3BhY2VzLCAxIGNoYXIgcGVyIGJ5dGUg
aW4sCi0JICogMSBjaGFyIHBlciBOIGdyb3VwcywgTlVMTAorCSAqIDIgY2hhciBwZXIgTiBncm91
cHMsIE5VTEwKIAkgKi8KLQlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsgMiArIHJvd3NpemUg
KyByb3dzaXplIC8gZ3JvdXBzaXplICsgMTsKKwlsaW5lYnVmX2xlbiA9IHJvd3NpemUgKiAzICsg
MiArIHJvd3NpemUgKyAyICogcm93c2l6ZSAvIGdyb3Vwc2l6ZSArIDE7CiAJbGluZWJ1ZiA9IGt6
YWxsb2MobGluZWJ1Zl9sZW4sIEdGUF9LRVJORUwpOwogCWlmICghbGluZWJ1ZikgewogCQlwcmlu
dGsoIiVzJXNoZXhkdW1wOiBDb3VsZCBub3QgYWxsb2MgJXUgYnl0ZXMgZm9yIGJ1ZmZlclxuIiwK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
