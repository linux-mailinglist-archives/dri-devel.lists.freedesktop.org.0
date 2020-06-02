Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E71ECA28
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11856E4EA;
	Wed,  3 Jun 2020 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 12339 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jun 2020 18:44:27 UTC
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D106E455
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 18:44:27 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052FIBl9080160;
 Tue, 2 Jun 2020 15:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=goh2CjFO2OFs3pZp2oX5aZuGyT+iy3/nHuM1bPl/gaE=;
 b=IHA54byGViv1xA85nmDf/7GQNGXznlHYhlC87CtDLuvViPKOBbwgjJYKoSgJ9XJVCPtE
 jDAJZfHSy34Du3AMicRnbAamyMW5YEbIY8Qce+N+bk9gGmLxN6lt24O1Z//81ERs7c1z
 HgoStbQcltiAor/5/h7iwLlAbSkH2xAJsbNRsRXecOH1Ez9h15iR2fw624er3SUQ02bN
 uu8mMw8+8770HuFHouvBJvQBH04TOEVLyaDLpQ3r5MiiBgm7AeBxN0m3rXVeEUdCswbu
 xmpLmelXOFTDMo0X8oM5SbXKgQJxAevaLJ2CUk/EFBe0e8W3LNpxpBUoEaVhOp1OMCcr 7Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31dkruhngm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 15:18:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052FDvEE006186;
 Tue, 2 Jun 2020 15:18:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 31c25p7g3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 15:18:30 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052FISDW018762;
 Tue, 2 Jun 2020 15:18:28 GMT
Received: from [10.74.110.208] (/10.74.110.208)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 08:18:28 -0700
Subject: Re: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 dri-devel@lists.freedesktop.org, ssantosh@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <cover.1581671951.git.jsarha@ti.com>
 <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
 <973b69f2-bbe1-3c1b-615f-751bb8d5d83e@ti.com>
From: santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <5e4c0754-f347-25d7-e5b6-11bc490dfcc0@oracle.com>
Date: Tue, 2 Jun 2020 08:18:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <973b69f2-bbe1-3c1b-615f-751bb8d5d83e@ti.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020110
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: mark.rutland@arm.com, praneeth@ti.com, robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, peter.ujfalusi@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yLzIwIDE6MTMgQU0sIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+IEhpIFNhbnRvc2gsCj4g
Cj4gT24gMTQvMDIvMjAyMCAxOTo0MCwgc2FudG9zaC5zaGlsaW1rYXJAb3JhY2xlLmNvbSB3cm90
ZToKPj4gT24gMi8xNC8yMCAxOjIyIEFNLCBKeXJpIFNhcmhhIHdyb3RlOgo+Pj4gUmVzZW5kIGJl
Y2F1c2UgdGhlIGVhcmxpZXIgcmVjaXBpZW50IGxpc3Qgd2FzIHdyb25nLgo+Pj4KPj4+IE5vdyB0
aGF0IGRybS90aWRzcyBpcyBxdWV1ZWQgZm9yIG1haW5saW5lLCBsZXRzIGFkZCBkaXNwbGF5IHN1
cHBvcnQgZm9yCj4+PiBrMmctZXZtLiBUaGVyZSBpcyBubyBodXJyeSBzaW5jZSB0aWRzcyBpcyBv
dXQgb25seSBpbiB2NS43LCBidXQgaXQKPj4+IHNob3VsZCBub3QgaGFybSB0byBoYXZlIHRoZSBk
dHMgY2hhbmdlcyBpbiBwbGFjZSBiZWZvcmUgdGhhdC4KPj4+Cj4+PiBKeXJpIFNhcmhhICgyKToK
Pj4+IMKgwqAgQVJNOiBkdHM6IGtleXN0b25lLWsyZzogQWRkIERTUyBub2RlCj4+PiDCoMKgIEFS
TTogZHRzOiBrZXlzdG9uZS1rMmctZXZtOiBhZGQgSERNSSB2aWRlbyBzdXBwb3J0Cj4+Pgo+Pj4g
wqAgYXJjaC9hcm0vYm9vdC9kdHMva2V5c3RvbmUtazJnLWV2bS5kdHMgfCAxMDEgKysrKysrKysr
KysrKysrKysrKysrKysrKwo+Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMva2V5c3RvbmUtazJnLmR0
c2nCoMKgwqAgfMKgIDIyICsrKysrKwo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0
aW9ucygrKQo+Pj4KPj4gT2suIFdpbGwgYWRkIHRoaXMgdG8gdGhlIG5leHQgcXVldWUuCj4gCj4g
V2hhdCBoYXBwZW5lZCB3aXRoIHRoaXMgb25lPyBJdCB1c2VkIHRvIGJlIGluIGxpbnV4LW5leHQs
IGJ1dCBub3cgSSAKPiBkb24ndCBzZWUgaXQgYW55bW9yZS4KPiAKUHVsbCByZXF1ZXN0IFsxXSB3
YXMgc2VudCBkdXJpbmcgbGFzdCBtZXJnZSB3aW5kb3cuIFRob3VnaHQgaXQgd2FzCnBpY2tlZCB1
cCBidXQgZG9lc24ndCBzZWVtcyB0byBiZS4gSGF2ZSBzZW50IHF1ZXN0aW9uIHRvIGFybS1zb2MK
bWFpbnRhaW5lcnMuCgpSZWdhcmRzLApTYW50b3NoCgpbMV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5u
ZXQvbGlzdHMvYXJtLWtlcm5lbC9tc2c3OTEyMjQuaHRtbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
