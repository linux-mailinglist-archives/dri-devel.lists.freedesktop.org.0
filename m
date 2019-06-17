Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502C47A8F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F204789176;
	Mon, 17 Jun 2019 07:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6DB8916D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 02:06:57 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H26t6w078597
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:06:57 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t5vdufg43-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:06:56 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Mon, 17 Jun 2019 03:06:51 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 03:06:42 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5H26fB547644892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 02:06:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AEE95204E;
 Mon, 17 Jun 2019 02:06:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C05DD52052;
 Mon, 17 Jun 2019 02:06:40 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C8445A0208;
 Mon, 17 Jun 2019 12:06:37 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 0/7] Hexdump Enhancements
Date: Mon, 17 Jun 2019 12:04:23 +1000
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061702-0012-0000-0000-00000329AB17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061702-0013-0000-0000-00002162C068
Message-Id: <20190617020430.8708-1-alastair@au1.ibm.com>
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

RnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+CgpBcG9sb2dpZXMg
Zm9yIHRoZSBsYXJnZSBDQyBsaXN0LCBpdCdzIGEgaGVhZHMgdXAgZm9yIHRob3NlIHJlc3BvbnNp
YmxlCmZvciBzdWJzeXN0ZW1zIHdoZXJlIGEgcHJvdG90eXBlIGNoYW5nZSBpbiBnZW5lcmljIGNv
ZGUgY2F1c2VzIGEgY2hhbmdlCmluIHRob3NlIHN1YnN5c3RlbXMuCgpUaGlzIHNlcmllcyBlbmhh
bmNlcyBoZXhkdW1wLgoKVGhlc2UgaW1wcm92ZSB0aGUgcmVhZGFiaWxpdHkgb2YgdGhlIGR1bXBl
ZCBkYXRhIGluIGNlcnRhaW4gc2l0dWF0aW9ucwooZWcuIHdpZGUgdGVybWluYWxzIGFyZSBhdmFp
bGFibGUsIG1hbnkgbGluZXMgb2YgZW1wdHkgYnl0ZXMgZXhpc3QsIGV0YykuCgpUaGUgZGVmYXVs
dCBiZWhhdmlvdXIgb2YgaGV4ZHVtcCBpcyB1bmNoYW5nZWQsIGhvd2V2ZXIsIHRoZSBwcm90b3R5
cGUKZm9yIGhleF9kdW1wX3RvX2J1ZmZlcigpIGhhcyBjaGFuZ2VkLCBhbmQgcHJpbnRfaGV4X2R1
bXAoKSBoYXMgYmVlbgpyZW5hbWVkIHRvIHByaW50X2hleF9kdW1wX2V4dCgpLCB3aXRoIGEgd3Jh
cHBlciByZXBsYWNpbmcgaXQgZm9yCmNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBjb2RlLCB3
aGljaCB3b3VsZCBoYXZlIGJlZW4gdG9vIGludmFzaXZlIHRvCmNoYW5nZS4KCkhleGR1bXAgc2Vs
ZnRlc3RzIGhhdmUgYmUgcnVuICYgY29uZmlybWVkIHBhc3NlZC4KCkNoYW5nZWxvZzoKVjM6CiAt
IEZpeCBpbmxpbmUgZG9jdW1lbnRpb24KIC0gdXNlIEJJVCBtYWNyb3MKIC0gdXNlIHUzMiByYXRo
ZXIgdGhhbiB1NjQgZm9yIGZsYWdzClYyOgogLSBGaXggZmFpbGluZyBzZWxmdGVzdHMKIC0gRml4
IHByZWNlZGVuY2UgYnVnIGluICdSZXBsYWNlIGFzY2lpIGJvb2wgaW4gaGV4X2R1bXBfdG9fYnVm
ZmVyLi4uJwogLSBSZW1vdmUgaGFyZGNvZGVkIG5ldyBsZW5ndGhzICYgaW5zdGVhZCByZWxheCB0
aGUgY2hlY2tzIGluCiAgIGhleF9kdW1wX3RvX2J1ZmZlciwgYWxsb2NhdGluZyB0aGUgYnVmZmVy
IGZyb20gdGhlIGhlYXAgaW5zdGVhZCBvZiB0aGUKICAgc3RhY2suCiAtIFJlcGxhY2UgdGhlIHNr
aXBwaW5nIG9mIGxpbmVzIG9mIDB4MDAvMHhmZiB3aXRoIHNraXBwaW5nIGxpbmVzIG9mCiAgIHJl
cGVhdGVkIGNoYXJhY3RlcnMsIGFubm91bmNpbmcgd2hhdCBoYXMgYmVlbiBza2lwcGVkLgogLSBB
ZGQgc3BhY2VzIGFzIGFuIG9wdGlvbmFsIE4tZ3JvdXAgc2VwYXJhdG9yCiAtIEFsbG93IGJ5dGUg
b3JkZXJpbmcgdG8gYmUgbWFpbnRhaW5lZCB3aGVuIEhFWERVTVBfUkVUQUlOX0JZVEVfT1JERVJJ
TkcKICAgaXMgc2V0LgogLSBVcGRhdGVkIHNlbGZ0ZXN0cyB0byBjb3ZlciAnUmVsYXggcm93c2l6
ZSBjaGVja3MnICYKICAgJ09wdGlvbmFsbHkgcmV0YWluIGJ5dGUgb3JkZXJpbmcnCgpBbGFzdGFp
ciBEJ1NpbHZhICg3KToKICBsaWIvaGV4ZHVtcC5jOiBGaXggc2VsZnRlc3RzCiAgbGliL2hleGR1
bXAuYzogUmVsYXggcm93c2l6ZSBjaGVja3MgaW4gaGV4X2R1bXBfdG9fYnVmZmVyCiAgbGliL2hl
eGR1bXAuYzogT3B0aW9uYWxseSBzdXBwcmVzcyBsaW5lcyBvZiByZXBlYXRlZCBieXRlcwogIGxp
Yi9oZXhkdW1wLmM6IFJlcGxhY2UgYXNjaWkgYm9vbCBpbiBoZXhfZHVtcF90b19idWZmZXIgd2l0
aCBmbGFncwogIGxpYi9oZXhkdW1wLmM6IEFsbG93IG11bHRpcGxlIGdyb3VwcyB0byBiZSBzZXBh
cmF0ZWQgYnkgbGluZXMgJ3wnCiAgbGliL2hleGR1bXAuYzogQWxsb3cgbXVsdGlwbGUgZ3JvdXBz
IHRvIGJlIHNlcGFyYXRlZCBieSBzcGFjZXMKICBsaWIvaGV4ZHVtcC5jOiBPcHRpb25hbGx5IHJl
dGFpbiBieXRlIG9yZGVyaW5nCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2Nz
LmMgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2lzZG4vaGFyZHdhcmUvbUlTRE4vbUlTRE5pc2Fy
LmMgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LXRlc3QuYyAgICAgICAg
ICAgICAgICB8ICAgMiArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvYW1kL3hnYmUveGdiZS1kcnYu
YyAgICAgIHwgICAyICstCiAuLi4vbmV0L2V0aGVybmV0L3N5bm9wc3lzL2R3Yy14bGdtYWMtY29t
bW9uLmMgfCAgIDIgKy0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvZGVidWcuYyAg
ICAgICB8ICAgMyArLQogLi4uL25ldC93aXJlbGVzcy9pbnRlbC9pd2xlZ2FjeS8zOTQ1LW1hYy5j
ICAgIHwgICAyICstCiBkcml2ZXJzL3BsYXRmb3JtL2Nocm9tZS93aWxjb19lYy9kZWJ1Z2ZzLmMg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvc2NzaS9zY3NpX2xvZ2dpbmcuYyAgICAgICAgICAgICAgICAg
ICB8ICAgOCArLQogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyAgICAgICAgICAg
IHwgICAyICstCiBmcy9zZXFfZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDMgKy0KIGluY2x1ZGUvbGludXgvcHJpbnRrLmggICAgICAgICAgICAgICAgICAgICAgICB8
ICAzNCArKy0KIGxpYi9oZXhkdW1wLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDI2MCArKysrKysrKysrKysrKystLS0KIGxpYi90ZXN0X2hleGR1bXAuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDE0NiArKysrKysrLS0tCiAxNCBmaWxlcyBjaGFuZ2VkLCAzNzIgaW5z
ZXJ0aW9ucygrKSwgMTAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
