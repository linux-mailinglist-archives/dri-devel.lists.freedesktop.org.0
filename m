Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD367229187
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5EE6E5C3;
	Wed, 22 Jul 2020 07:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3319 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jul 2020 16:02:26 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF006E423
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:02:26 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LF2lq7062987; Tue, 21 Jul 2020 11:06:59 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vqt42x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:06:59 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LF0VuT018746;
 Tue, 21 Jul 2020 15:06:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 32brq7v40a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 15:06:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LF6sv924510804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 15:06:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E067B5204F;
 Tue, 21 Jul 2020 15:06:54 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.205.118])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 38B0C52052;
 Tue, 21 Jul 2020 15:06:54 +0000 (GMT)
Date: Tue, 21 Jul 2020 18:06:52 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH] io-mapping: Indicate mapping failure
Message-ID: <20200721150652.GI802087@linux.ibm.com>
References: <20200721141641.81112-1-michael.j.ruhl@intel.com>
 <20200721141641.81112-2-michael.j.ruhl@intel.com>
 <20200721144722.GH3703480@smile.fi.intel.com>
 <14063C7AD467DE4B82DEDB5C278E866301245DF505@FMSMSX108.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301245DF505@FMSMSX108.amr.corp.intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_09:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210107
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgMDM6MDA6NDFQTSArMDAwMCwgUnVobCwgTWljaGFlbCBK
IHdyb3RlOgo+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID5Gcm9tOiBBbmR5IFNoZXZj
aGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiA+U2VudDogVHVlc2Rh
eSwgSnVseSAyMSwgMjAyMCAxMDo0NyBBTQo+ID5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVs
LmoucnVobEBpbnRlbC5jb20+Cj4gPkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LQo+ID5mb3VuZGF0aW9uLm9yZz47IE1pa2UgUmFw
b3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT47IENocmlzIFdpbHNvbgo+ID48Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPjsgc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID5TdWJqZWN0OiBSZTogW1BB
VENIXSBpby1tYXBwaW5nOiBJbmRpY2F0ZSBtYXBwaW5nIGZhaWx1cmUKPiA+Cj4gPk9uIFR1ZSwg
SnVsIDIxLCAyMDIwIGF0IDEwOjE2OjQxQU0gLTA0MDAsIE1pY2hhZWwgSi4gUnVobCB3cm90ZToK
PiA+PiBTb21ldGltZXMgaXQgaXMgZ29vZCB0byBrbm93IHdoZW4geW91ciBtYXBwaW5nIGZhaWxl
ZC4KCkkgd2FzIGdvaW5nIHRvIHNheSBpdCdzIGFsd2F5cyBhIGdvb2QgaWRlYSA7LSkKCj4gPkNh
biB5b3UgZWxhYm9yYXRlLi4uCj4gCj4gU3VyZSwgZ3Vlc3MgSSB3YXMgdG9vIGdsaWIuIPCfmIoK
PiAKPiBDdXJyZW50bHkgIHRoZSBpb19tYXBwaW5nX2luaXRfd2MgKHRoZSAhQVRPTUlDX0lPTUFQ
IHZlcnNpb24pLCBmdW5jdGlvbiB3aWxsCj4gYWx3YXlzIHJldHVybiBzdWNjZXNzLgo+IAo+IElm
IHRoZSBzZXR0aW5nIG9mIHRoZSBpb21lbSAoZnJvbSBpb3JlbWFwX3djKSBmYWlscywgdGhlIG9u
bHkgd2F5IGZvciB0aGUgCj4gY2FsbGVyIHRvIGtub3cgaXMgdG8gY2hlY2sgdGhlIHZhbHVlIG9m
IGlvbWFwLT5pb21lbS4KPiAKPiBTaW5jZSBhbGwgb2YgdGhlIGNhbGxlcnMgZXhwZWN0IGEgTlVM
TCByZXR1cm4gb24gZXJyb3IsIGFuZCBjaGVjayBmb3IgYSBOVUxMLAo+IEkgZmVsdCB0aGlzIG5l
ZWRlZCBhIGZpeGVzIChpLmUuIHVuZXhwZWN0ZWQgYmVoYXZpb3IpLgo+IAo+ID4+IEZpeGVzOiBj
YWZhZjE0YTVkOGYgKCJpby1tYXBwaW5nOiBBbHdheXMgY3JlYXRlIGEgc3RydWN0IHRvIGhvbGQg
bWV0YWRhdGEKPiA+YWJvdXQgdGhlIGlvLW1hcHBpbmciCj4gPgo+ID4uLi5lc3BlY2lhbGx5IHRh
a2luZyBpbnRvIGFjY291bnQgdGhhdCBGaXhlcyBpbXBsaWVzIHJlZ3Jlc3Npb24gLyBidWc/Cj4g
Cj4gVGhlIGZhaWx1cmUgKGluIG15IGNhc2UgYSBjcmFzaCkgaXMgbm90IHJldmVhbGVkIHVudGls
IHRoZSBhZGRyZXNzIGlzIGFjY2Vzc2VkCj4gbG9uZyBhZnRlciB0aGUgaW5pdC4KPiAKPiBJIHdp
bGwgdXBkYXRlIHRoZSBjb21taXQuCj4gCj4gTWlrZQo+IAo+ID4tLQo+ID5XaXRoIEJlc3QgUmVn
YXJkcywKPiA+QW5keSBTaGV2Y2hlbmtvCj4gPgo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlr
ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
