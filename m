Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCD52492
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8D189FF6;
	Tue, 25 Jun 2019 07:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06578984F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 03:19:34 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P36iEi110705
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:33 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbaagakjt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:33 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Tue, 25 Jun 2019 04:19:31 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 04:19:22 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5P3JLsx37486936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:19:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14F5D52052;
 Tue, 25 Jun 2019 03:19:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6C31F5204F;
 Tue, 25 Jun 2019 03:19:20 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 25523A021C;
 Tue, 25 Jun 2019 13:19:19 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v4 1/7] lib/hexdump.c: Fix selftests
Date: Tue, 25 Jun 2019 13:17:20 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625031726.12173-1-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062503-0016-0000-0000-0000028C0D9B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062503-0017-0000-0000-000032E97D2E
Message-Id: <20190625031726.12173-2-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=933 adultscore=0 classifier=spam adjust=0 reason=mlx
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

RnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+CgpUaGUgb3ZlcmZs
b3cgdGVzdHMgZGlkIG5vdCBhY2NvdW50IGZvciB0aGUgc2l0dWF0aW9uIHdoZXJlIG5vCm92ZXJm
bG93IG9jY3VycyBhbmQgbGVuIDwgcm93c2l6ZS4KClRoaXMgcGF0Y2ggcmVuYW1lcyB0aGUgY3J5
cHRpYyB2YXJpYWJsZXMgYW5kIGFjY291bnRzIGZvciB0aGUKYWJvdmUgY2FzZS4KClRoZSBzZWxm
dGVzdHMgbm93IHBhc3MuCgpTaWduZWQtb2ZmLWJ5OiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFp
ckBkLXNpbHZhLm9yZz4KLS0tCiBsaWIvdGVzdF9oZXhkdW1wLmMgfCA0OCArKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3Rlc3RfaGV4ZHVt
cC5jIGIvbGliL3Rlc3RfaGV4ZHVtcC5jCmluZGV4IDUxNDQ4OTlkM2M2Yi4uYmVmOTdhOTY0NTgy
IDEwMDY0NAotLS0gYS9saWIvdGVzdF9oZXhkdW1wLmMKKysrIGIvbGliL3Rlc3RfaGV4ZHVtcC5j
CkBAIC0xNjMsNDUgKzE2Myw1MyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgdGVzdF9oZXhkdW1wX292
ZXJmbG93KHNpemVfdCBidWZsZW4sIHNpemVfdCBsZW4sCiB7CiAJY2hhciB0ZXN0W1RFU1RfSEVY
RFVNUF9CVUZfU0laRV07CiAJY2hhciBidWZbVEVTVF9IRVhEVU1QX0JVRl9TSVpFXTsKLQlpbnQg
cnMgPSByb3dzaXplLCBncyA9IGdyb3Vwc2l6ZTsKLQlpbnQgYWUsIGhlLCBlLCBmLCByOwotCWJv
b2wgYTsKKwlpbnQgYXNjaWlfbGVuLCBoZXhfbGVuLCBleHBlY3RlZF9sZW4sIGZpbGxfcG9pbnQs
IG5ncm91cHMsIHJjOworCWJvb2wgbWF0Y2g7CiAKIAl0b3RhbF90ZXN0cysrOwogCiAJbWVtc2V0
KGJ1ZiwgRklMTF9DSEFSLCBzaXplb2YoYnVmKSk7CiAKLQlyID0gaGV4X2R1bXBfdG9fYnVmZmVy
KGRhdGFfYiwgbGVuLCBycywgZ3MsIGJ1ZiwgYnVmbGVuLCBhc2NpaSk7CisJcmMgPSBoZXhfZHVt
cF90b19idWZmZXIoZGF0YV9iLCBsZW4sIHJvd3NpemUsIGdyb3Vwc2l6ZSwgYnVmLCBidWZsZW4s
CisJCQkJYXNjaWkpOwogCiAJLyoKIAkgKiBDYWxsZXIgbXVzdCBwcm92aWRlIHRoZSBkYXRhIGxl
bmd0aCBtdWx0aXBsZSBvZiBncm91cHNpemUuIFRoZQogCSAqIGNhbGN1bGF0aW9ucyBiZWxvdyBh
cmUgbWFkZSB3aXRoIHRoYXQgYXNzdW1wdGlvbiBpbiBtaW5kLgogCSAqLwotCWFlID0gcnMgKiAy
IC8qIGhleCAqLyArIHJzIC8gZ3MgLyogc3BhY2VzICovICsgMSAvKiBzcGFjZSAqLyArIGxlbiAv
KiBhc2NpaSAqLzsKLQloZSA9IChncyAqIDIgLyogaGV4ICovICsgMSAvKiBzcGFjZSAqLykgKiBs
ZW4gLyBncyAtIDEgLyogbm8gdHJhaWxpbmcgc3BhY2UgKi87CisJbmdyb3VwcyA9IHJvd3NpemUg
LyBncm91cHNpemU7CisJaGV4X2xlbiA9IChncm91cHNpemUgKiAyIC8qIGhleCAqLyArIDEgLyog
c3BhY2VzICovKSAqIG5ncm91cHMKKwkJICAtIDEgLyogbm8gdHJhaWxpbmcgc3BhY2UgKi87CisJ
YXNjaWlfbGVuID0gaGV4X2xlbiArIDIgLyogc3BhY2UgKi8gKyBsZW4gLyogYXNjaWkgKi87CisK
KwlpZiAobGVuIDwgcm93c2l6ZSkgeworCQluZ3JvdXBzID0gbGVuIC8gZ3JvdXBzaXplOworCQlo
ZXhfbGVuID0gKGdyb3Vwc2l6ZSAqIDIgLyogaGV4ICovICsgMSAvKiBzcGFjZXMgKi8pICogbmdy
b3VwcworCQkgIC0gMSAvKiBubyB0cmFpbGluZyBzcGFjZSAqLzsKKwl9CiAKLQlpZiAoYXNjaWkp
Ci0JCWUgPSBhZTsKLQllbHNlCi0JCWUgPSBoZTsKKwlleHBlY3RlZF9sZW4gPSAoYXNjaWkpID8g
YXNjaWlfbGVuIDogaGV4X2xlbjsKIAotCWYgPSBtaW5fdChpbnQsIGUgKyAxLCBidWZsZW4pOwor
CWZpbGxfcG9pbnQgPSBtaW5fdChpbnQsIGV4cGVjdGVkX2xlbiArIDEsIGJ1Zmxlbik7CiAJaWYg
KGJ1ZmxlbikgewotCQl0ZXN0X2hleGR1bXBfcHJlcGFyZV90ZXN0KGxlbiwgcnMsIGdzLCB0ZXN0
LCBzaXplb2YodGVzdCksIGFzY2lpKTsKLQkJdGVzdFtmIC0gMV0gPSAnXDAnOworCQl0ZXN0X2hl
eGR1bXBfcHJlcGFyZV90ZXN0KGxlbiwgcm93c2l6ZSwgZ3JvdXBzaXplLCB0ZXN0LAorCQkJCQkg
IHNpemVvZih0ZXN0KSwgYXNjaWkpOworCQl0ZXN0W2ZpbGxfcG9pbnQgLSAxXSA9ICdcMCc7CiAJ
fQotCW1lbXNldCh0ZXN0ICsgZiwgRklMTF9DSEFSLCBzaXplb2YodGVzdCkgLSBmKTsKKwltZW1z
ZXQodGVzdCArIGZpbGxfcG9pbnQsIEZJTExfQ0hBUiwgc2l6ZW9mKHRlc3QpIC0gZmlsbF9wb2lu
dCk7CiAKLQlhID0gciA9PSBlICYmICFtZW1jbXAodGVzdCwgYnVmLCBURVNUX0hFWERVTVBfQlVG
X1NJWkUpOworCW1hdGNoID0gcmMgPT0gZXhwZWN0ZWRfbGVuICYmICFtZW1jbXAodGVzdCwgYnVm
LCBURVNUX0hFWERVTVBfQlVGX1NJWkUpOwogCiAJYnVmW3NpemVvZihidWYpIC0gMV0gPSAnXDAn
OwogCi0JaWYgKCFhKSB7Ci0JCXByX2VycigiTGVuOiAlenUgYnVmbGVuOiAlenUgc3RybGVuOiAl
enVcbiIsCi0JCQlsZW4sIGJ1Zmxlbiwgc3RybmxlbihidWYsIHNpemVvZihidWYpKSk7Ci0JCXBy
X2VycigiUmVzdWx0OiAlZCAnJXMnXG4iLCByLCBidWYpOwotCQlwcl9lcnIoIkV4cGVjdDogJWQg
JyVzJ1xuIiwgZSwgdGVzdCk7CisJaWYgKCFtYXRjaCkgeworCQlwcl9lcnIoInJvd3NpemU6ICV1
IGdyb3Vwc2l6ZTogJXUgYXNjaWk6ICVkIExlbjogJXp1IGJ1ZmxlbjogJXp1IHN0cmxlbjogJXp1
XG4iLAorCQkJcm93c2l6ZSwgZ3JvdXBzaXplLCBhc2NpaSwgbGVuLCBidWZsZW4sCisJCQlzdHJu
bGVuKGJ1Ziwgc2l6ZW9mKGJ1ZikpKTsKKwkJcHJfZXJyKCJSZXN1bHQ6ICVkICclLS4qcydcbiIs
IHJjLCAoaW50KWJ1ZmxlbiwgYnVmKTsKKwkJcHJfZXJyKCJFeHBlY3Q6ICVkICclLS4qcydcbiIs
IGV4cGVjdGVkX2xlbiwgKGludClidWZsZW4sIHRlc3QpOwogCQlmYWlsZWRfdGVzdHMrKzsKKwog
CX0KIH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
