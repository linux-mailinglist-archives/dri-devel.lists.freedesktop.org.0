Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B21524A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1058E6E071;
	Tue, 25 Jun 2019 07:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35089803
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 03:19:35 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P36Qqc110800
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbaaytfu0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:19:34 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Tue, 25 Jun 2019 04:19:31 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 04:19:22 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5P3JLkE57212948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:19:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2310FAE057;
 Tue, 25 Jun 2019 03:19:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76678AE056;
 Tue, 25 Jun 2019 03:19:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 03:19:20 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1790BA01B9;
 Tue, 25 Jun 2019 13:19:19 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v4 0/7] Hexdump Enhancements
Date: Tue, 25 Jun 2019 13:17:19 +1000
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062503-0008-0000-0000-000002F6B5BD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062503-0009-0000-0000-00002263E424
Message-Id: <20190625031726.12173-1-alastair@au1.ibm.com>
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
ZnRlc3RzIGhhdmUgYmUgcnVuICYgY29uZmlybWVkIHBhc3NlZC4KCkNoYW5nZWxvZzoKVjQ6CiAt
IEFkZCBtaXNzaW5nIGhlYWRlciAobGludXgvYml0cy5oKQogLSBGaXggY29tbWVudCBmb3JtYXR0
aW5nCiAtIENyZWF0ZSBoZXhfZHVtcF90b19idWZmZXJfZXh0ICYgbWFrZSBoZXhfZHVtcF90b19i
dWZmZXIgYSB3cmFwcGVyClYzOgogLSBGaXggaW5saW5lIGRvY3VtZW50aW9uCiAtIHVzZSBCSVQg
bWFjcm9zCiAtIHVzZSB1MzIgcmF0aGVyIHRoYW4gdTY0IGZvciBmbGFncwpWMjoKIC0gRml4IGZh
aWxpbmcgc2VsZnRlc3RzCiAtIEZpeCBwcmVjZWRlbmNlIGJ1ZyBpbiAnUmVwbGFjZSBhc2NpaSBi
b29sIGluIGhleF9kdW1wX3RvX2J1ZmZlci4uLicKIC0gUmVtb3ZlIGhhcmRjb2RlZCBuZXcgbGVu
Z3RocyAmIGluc3RlYWQgcmVsYXggdGhlIGNoZWNrcyBpbgogICBoZXhfZHVtcF90b19idWZmZXIs
IGFsbG9jYXRpbmcgdGhlIGJ1ZmZlciBmcm9tIHRoZSBoZWFwIGluc3RlYWQgb2YgdGhlCiAgIHN0
YWNrLgogLSBSZXBsYWNlIHRoZSBza2lwcGluZyBvZiBsaW5lcyBvZiAweDAwLzB4ZmYgd2l0aCBz
a2lwcGluZyBsaW5lcyBvZgogICByZXBlYXRlZCBjaGFyYWN0ZXJzLCBhbm5vdW5jaW5nIHdoYXQg
aGFzIGJlZW4gc2tpcHBlZC4KIC0gQWRkIHNwYWNlcyBhcyBhbiBvcHRpb25hbCBOLWdyb3VwIHNl
cGFyYXRvcgogLSBBbGxvdyBieXRlIG9yZGVyaW5nIHRvIGJlIG1haW50YWluZWQgd2hlbiBIRVhE
VU1QX1JFVEFJTl9CWVRFX09SREVSSU5HCiAgIGlzIHNldC4KIC0gVXBkYXRlZCBzZWxmdGVzdHMg
dG8gY292ZXIgJ1JlbGF4IHJvd3NpemUgY2hlY2tzJyAmCiAgICdPcHRpb25hbGx5IHJldGFpbiBi
eXRlIG9yZGVyaW5nJwoKQWxhc3RhaXIgRCdTaWx2YSAoNyk6CiAgbGliL2hleGR1bXAuYzogRml4
IHNlbGZ0ZXN0cwogIGxpYi9oZXhkdW1wLmM6IFJlbGF4IHJvd3NpemUgY2hlY2tzIGluIGhleF9k
dW1wX3RvX2J1ZmZlcgogIGxpYi9oZXhkdW1wLmM6IE9wdGlvbmFsbHkgc3VwcHJlc3MgbGluZXMg
b2YgcmVwZWF0ZWQgYnl0ZXMKICBsaWIvaGV4ZHVtcC5jOiBSZXBsYWNlIGFzY2lpIGJvb2wgaW4g
aGV4X2R1bXBfdG9fYnVmZmVyIHdpdGggZmxhZ3MKICBsaWIvaGV4ZHVtcC5jOiBBbGxvdyBtdWx0
aXBsZSBncm91cHMgdG8gYmUgc2VwYXJhdGVkIGJ5IGxpbmVzICd8JwogIGxpYi9oZXhkdW1wLmM6
IEFsbG93IG11bHRpcGxlIGdyb3VwcyB0byBiZSBzZXBhcmF0ZWQgYnkgc3BhY2VzCiAgbGliL2hl
eGR1bXAuYzogT3B0aW9uYWxseSByZXRhaW4gYnl0ZSBvcmRlcmluZwoKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX2VuZ2luZV9jcy5jICAgICAgICB8ICAgNSArLQogZHJpdmVycy9pc2RuL2hh
cmR3YXJlL21JU0ROL21JU0ROaXNhci5jICAgICAgIHwgIDEwICstCiBkcml2ZXJzL21haWxib3gv
bWFpbGJveC10ZXN0LmMgICAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L2FtZC94Z2JlL3hnYmUtZHJ2LmMgICAgICB8ICAgMiArLQogLi4uL25ldC9ldGhlcm5ldC9z
eW5vcHN5cy9kd2MteGxnbWFjLWNvbW1vbi5jIHwgICAyICstCiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL2RlYnVnLmMgICAgICAgfCAgIDcgKy0KIC4uLi9uZXQvd2lyZWxlc3MvaW50
ZWwvaXdsZWdhY3kvMzk0NS1tYWMuYyAgICB8ICAgNCArLQogZHJpdmVycy9wbGF0Zm9ybS9jaHJv
bWUvd2lsY29fZWMvZGVidWdmcy5jICAgIHwgIDEwICstCiBkcml2ZXJzL3Njc2kvc2NzaV9sb2dn
aW5nLmMgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9m
YnRmdC1jb3JlLmMgICAgICAgICAgICB8ICAgMiArLQogZnMvc2VxX2ZpbGUuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiBpbmNsdWRlL2xpbnV4L3ByaW50ay5oICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNzUgKysrKy0KIGxpYi9oZXhkdW1wLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDI2NyArKysrKysrKysrKysrKystLS0KIGxpYi90ZXN0
X2hleGR1bXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE1NCArKysrKysrLS0tCiAx
NCBmaWxlcyBjaGFuZ2VkLCA0MzggaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9ucygtKQoKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
