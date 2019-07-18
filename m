Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3CC6E17F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74B66E594;
	Fri, 19 Jul 2019 07:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580D6E39C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:02:42 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6IC2g1c019203
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:02:42 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttp2y62rx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:02:41 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <jremus@linux.ibm.com>;
 Thu, 18 Jul 2019 13:02:28 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 13:02:24 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6IC2Ahe29557076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 12:02:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D05D65206C;
 Thu, 18 Jul 2019 12:02:23 +0000 (GMT)
Received: from [9.152.224.207] (unknown [9.152.224.207])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7030552077;
 Thu, 18 Jul 2019 12:02:23 +0000 (GMT)
Subject: Re: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
Date: Thu, 18 Jul 2019 14:02:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071812-0012-0000-0000-000003340C87
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071812-0013-0000-0000-0000216D8E5C
Message-Id: <d242e41d-04cf-ba0e-2d81-9ed1a9c52195@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180129
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDcuMjAxOSB1bSAxMDowOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gTm90IHJlYWxs
eSBoYXJtZnVsIG5vdCB0bywgYnV0IGFsc28gbm90IGhhcm0gaW4gZ3JhYmJpbmcgdGhlIGxvY2su
IEFuZAo+IHRoaXMgc2h1dHMgdXAgYSBuZXcgV0FSTklORyBJIGludHJvZHVjZWQgaW4gY29tbWl0
IGRkZGUzYzE4YjcwMCAoInZ0Ogo+IE1vcmUgbG9ja2luZyBjaGVja3MiKS4KPiAKPiBSZXBvcnRl
ZC1ieTogSmVucyBSZW11cyA8anJlbXVzQGxpbnV4LmlibS5jb20+Cj4gQ2M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtczM5MEB2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KPiBDYzogTmljb2xhcyBQaXRyZSA8bmljb2xhcy5waXRyZUBsaW5hcm8ub3JnPgo+IENj
OiBNYXJ0aW4gSG9zdGV0dGxlciA8dGV4dHNoZWxsQHVjaHV1amluLmRlPgo+IENjOiBBZGFtIEJv
cm93c2tpIDxraWxvYnl0ZUBhbmdiYW5kLnBsPgo+IENjOiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRv
Y2thQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiAgIGRyaXZl
cnMvdHR5L3Z0L3Z0LmMgfCA2ICsrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKVGhhbmsgeW91IGZvciB0aGUgcXVpY2sgZml4ISBMb29rcyBm
aW5lIHRvIG1lLiBEaWQgdGVzdCB3aXRoIGNhdCBhcyB3ZWxsIAphcyBvdXIgZHVtcDJ0YXIgdXRp
bGl0eS4gVGhlIHdhcm5pbmcgaXMgZ29uZS4KClRlc3RlZC1ieTogSmVucyBSZW11cyA8anJlbXVz
QGxpbnV4LmlibS5jb20+CgpSZWdhcmRzLApKZW5zIFJlbXVzCi0tIApMaW51eCBvbiBaIGFuZCB6
L1ZTRSBEZXZlbG9wbWVudCAmIFNlcnZpY2UgKEQzMjI5KQpJQk0gU3lzdGVtcyAmIFRlY2hub2xv
Z3kgR3JvdXAsIFB1cmUgU3lzdGVtcyAmIE1vZHVsYXIgU29mdHdhcmUgRGV2ZWxvcG1lbnQKCklC
TSBEYXRhIFByaXZhY3kgU3RhdGVtZW50OiBodHRwczovL3d3dy5pYm0uY29tL3ByaXZhY3kvdXMv
ZW4vCgpJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9wbWVudCBHbWJIClZvcnNpdHpl
bmRlciBkZXMgQXVmc2ljaHRzcmF0czogTWF0dGhpYXMgSGFydG1hbm4KR2VzY2jDpGZ0c2bDvGhy
dW5nOiBEaXJrIFdpdHRrb3BwClNpdHogZGVyIEdlc2VsbHNjaGFmdDogQm9lYmxpbmdlbgpSZWdp
c3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2FydCwgSFJCIDI0MzI5NAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
