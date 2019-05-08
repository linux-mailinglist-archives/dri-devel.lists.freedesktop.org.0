Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08B717420
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC73289862;
	Wed,  8 May 2019 08:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93578926D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 07:02:50 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x48728mu123597
 for <dri-devel@lists.freedesktop.org>; Wed, 8 May 2019 03:02:49 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sbr22p50w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 03:02:49 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <alastair@au1.ibm.com>;
 Wed, 8 May 2019 08:02:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 08:02:39 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4872cSV59900032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 07:02:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17E1442045;
 Wed,  8 May 2019 07:02:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 646DD4203F;
 Wed,  8 May 2019 07:02:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 07:02:37 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 04A30A01A2;
 Wed,  8 May 2019 17:02:35 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 0/7] Hexdump Enhancements
Date: Wed,  8 May 2019 17:01:40 +1000
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050807-4275-0000-0000-00000332844B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050807-4276-0000-0000-00003841F1F3
Message-Id: <20190508070148.23130-1-alastair@au1.ibm.com>
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
ZnRlc3RzIGhhdmUgYmUgcnVuICYgY29uZmlybWVkIHBhc3NlZC4KCkNoYW5nZWxvZzoKIC0gRml4
IGZhaWxpbmcgc2VsZnRlc3RzCiAtIEZpeCBwcmVjZWRlbmNlIGJ1ZyBpbiAnUmVwbGFjZSBhc2Np
aSBib29sIGluIGhleF9kdW1wX3RvX2J1ZmZlci4uLicKIC0gUmVtb3ZlIGhhcmRjb2RlZCBuZXcg
bGVuZ3RocyAmIGluc3RlYWQgcmVsYXggdGhlIGNoZWNrcyBpbgogICBoZXhfZHVtcF90b19idWZm
ZXIsIGFsbG9jYXRpbmcgdGhlIGJ1ZmZlciBmcm9tIHRoZSBoZWFwIGluc3RlYWQgb2YgdGhlCiAg
IHN0YWNrLgogLSBSZXBsYWNlIHRoZSBza2lwcGluZyBvZiBsaW5lcyBvZiAweDAwLzB4ZmYgd2l0
aCBza2lwcGluZyBsaW5lcyBvZgogICByZXBlYXRlZCBjaGFyYWN0ZXJzLCBhbm5vdW5jaW5nIHdo
YXQgaGFzIGJlZW4gc2tpcHBlZC4KIC0gQWRkIHNwYWNlcyBhcyBhbiBvcHRpb25hbCBOLWdyb3Vw
IHNlcGFyYXRvcgogLSBBbGxvdyBieXRlIG9yZGVyaW5nIHRvIGJlIG1haW50YWluZWQgd2hlbiBI
RVhEVU1QX1JFVEFJTl9CWVRFX09SREVSSU5HCiAgIGlzIHNldC4KIC0gVXBkYXRlZCBzZWxmdGVz
dHMgdG8gY292ZXIgJ1JlbGF4IHJvd3NpemUgY2hlY2tzJyAmCiAgICdPcHRpb25hbGx5IHJldGFp
biBieXRlIG9yZGVyaW5nJwoKQWxhc3RhaXIgRCdTaWx2YSAoNyk6CiAgbGliL2hleGR1bXAuYzog
Rml4IHNlbGZ0ZXN0cwogIGxpYi9oZXhkdW1wLmM6IFJlbGF4IHJvd3NpemUgY2hlY2tzIGluIGhl
eF9kdW1wX3RvX2J1ZmZlcgogIGxpYi9oZXhkdW1wLmM6IE9wdGlvbmFsbHkgc3VwcHJlc3MgbGlu
ZXMgb2YgcmVwZWF0ZWQgYnl0ZXMKICBsaWIvaGV4ZHVtcC5jOiBSZXBsYWNlIGFzY2lpIGJvb2wg
aW4gaGV4X2R1bXBfdG9fYnVmZmVyIHdpdGggZmxhZ3MKICBsaWIvaGV4ZHVtcC5jOiBBbGxvdyBt
dWx0aXBsZSBncm91cHMgdG8gYmUgc2VwYXJhdGVkIGJ5IGxpbmVzICd8JwogIGxpYi9oZXhkdW1w
LmM6IEFsbG93IG11bHRpcGxlIGdyb3VwcyB0byBiZSBzZXBhcmF0ZWQgYnkgc3BhY2VzCiAgbGli
L2hleGR1bXAuYzogT3B0aW9uYWxseSByZXRhaW4gYnl0ZSBvcmRlcmluZwoKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2VuZ2luZV9jcy5jICAgICAgICB8ICAgMiArLQogZHJpdmVycy9pc2Ru
L2hhcmR3YXJlL21JU0ROL21JU0ROaXNhci5jICAgICAgIHwgICA2ICstCiBkcml2ZXJzL21haWxi
b3gvbWFpbGJveC10ZXN0LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbmV0L2V0
aGVybmV0L2FtZC94Z2JlL3hnYmUtZHJ2LmMgICAgICB8ICAgMiArLQogLi4uL25ldC9ldGhlcm5l
dC9zeW5vcHN5cy9kd2MteGxnbWFjLWNvbW1vbi5jIHwgICAyICstCiBkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL2RlYnVnLmMgICAgICAgfCAgIDMgKy0KIC4uLi9uZXQvd2lyZWxlc3Mv
aW50ZWwvaXdsZWdhY3kvMzk0NS1tYWMuYyAgICB8ICAgMiArLQogZHJpdmVycy9wbGF0Zm9ybS9j
aHJvbWUvd2lsY29fZWMvZGVidWdmcy5jICAgIHwgICAyICstCiBkcml2ZXJzL3Njc2kvc2NzaV9s
b2dnaW5nLmMgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvc3RhZ2luZy9mYnRm
dC9mYnRmdC1jb3JlLmMgICAgICAgICAgICB8ICAgMiArLQogZnMvc2VxX2ZpbGUuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiBpbmNsdWRlL2xpbnV4L3ByaW50ay5o
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzQgKystCiBsaWIvaGV4ZHVtcC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyNjAgKysrKysrKysrKysrKysrLS0tCiBsaWIvdGVz
dF9oZXhkdW1wLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNDYgKysrKysrKy0tLQog
MTQgZmlsZXMgY2hhbmdlZCwgMzcyIGluc2VydGlvbnMoKyksIDEwMiBkZWxldGlvbnMoLSkKCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
