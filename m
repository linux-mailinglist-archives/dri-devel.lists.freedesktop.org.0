Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC919994
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B9089A1F;
	Fri, 10 May 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068D898F5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 05:50:10 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4A5YSCp094435;
 Fri, 10 May 2019 05:48:59 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2s94b6evn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 05:48:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4A5lxlR058431;
 Fri, 10 May 2019 05:48:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2sagyvn2nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 05:48:58 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4A5mhCU004058;
 Fri, 10 May 2019 05:48:43 GMT
Received: from asu (/92.220.18.196) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 May 2019 22:48:43 -0700
Message-ID: <a1b88d5add15d43de0468c32d9a2427629337abb.camel@oracle.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Knut Omang <knut.omang@oracle.com>
To: Frank Rowand <frowand.list@gmail.com>, Logan Gunthorpe
 <logang@deltatee.com>, "Theodore Ts'o" <tytso@mit.edu>, Tim.Bird@sony.com,
 gregkh@linuxfoundation.org, brendanhiggins@google.com,
 keescook@google.com, kieran.bingham@ideasonboard.com,
 mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
 Alexander.Levin@microsoft.com, amir73il@gmail.com,
 dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch,
 jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
 khilman@baylibre.com, mpe@ellerman.id.au, pmladek@suse.com,
 richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
Date: Fri, 10 May 2019 07:48:35 +0200
In-Reply-To: <6d6e91ec-33d3-830b-4895-4d7a20ba7d45@gmail.com>
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
 <6d6e91ec-33d3-830b-4895-4d7a20ba7d45@gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905100041
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100040
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=message-id : subject
 : from : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=corp-2018-07-02;
 bh=mW6USFzHD2GNOTvWz0gHOZzcMZNk/gcomd2yEIGo/qM=;
 b=oMgzP39/zn9jTWtr4ZiWiucH1bX+nBrXDsJ1Um7eoYKYZoPl7NmBc8y/sAZcow59DGMz
 K5meobDtbihRLjIWL24N2VTDNodLvROj4EON466lGJDKi+bfDNjpgtrq2mvre+SXyzEg
 D7723EvhLzq4O/oVdeHwWN0HayCNzdbmU7tBIsg1lLytWGQkUwhRZYzwsjUk/XPse8kU
 s1OY0Clpp5Ap2wsCGieAVjLepkRTL3eClJxAs/VS2s7KRzVHxaWjV3TocUtn2vAAF0HA
 N7hqPh47ZrkbCYXXnpvxKjuZWp1S9v9MgCTOGsxy/eCgtnyNXF6DeR7RV2ss7T2gpToW fw== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA1LTA5IGF0IDIyOjE4IC0wNzAwLCBGcmFuayBSb3dhbmQgd3JvdGU6Cj4g
T24gNS85LzE5IDQ6NDAgUE0sIExvZ2FuIEd1bnRob3JwZSB3cm90ZToKPiA+IAo+ID4gCj4gPiBP
biAyMDE5LTA1LTA5IDU6MzAgcC5tLiwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPiA+PiBPbiBUaHUs
IE1heSAwOSwgMjAxOSBhdCAwNDoyMDowNVBNIC0wNjAwLCBMb2dhbiBHdW50aG9ycGUgd3JvdGU6
Cj4gPj4+Cj4gPj4+IFRoZSBzZWNvbmQgaXRlbSwgYXJndWFibHksIGRvZXMgaGF2ZSBzaWduaWZp
Y2FudCBvdmVybGFwIHdpdGgga3NlbGZ0ZXN0Lgo+ID4+PiBXaGV0aGVyIHlvdSBhcmUgcnVubmlu
ZyBzaG9ydCB0ZXN0cyBpbiBhIGxpZ2h0IHdlaWdodCBVTUwgZW52aXJvbm1lbnQgb3IKPiA+Pj4g
aGlnaGVyIGxldmVsIHRlc3RzIGluIGFuIGhlYXZpZXIgVk0gdGhlIHR3byBjb3VsZCBiZSB1c2lu
ZyB0aGUgc2FtZQo+ID4+PiBmcmFtZXdvcmsgZm9yIHdyaXRpbmcgb3IgZGVmaW5pbmcgaW4ta2Vy
bmVsIHRlc3RzLiBJdCAqbWF5KiBhbHNvIGJlIHZhbHVhYmxlCj4gPj4+IGZvciBzb21lIHBlb3Bs
ZSB0byBiZSBhYmxlIHRvIHJ1biBhbGwgdGhlIFVNTCB0ZXN0cyBpbiB0aGUgaGVhdnkgVk0KPiA+
Pj4gZW52aXJvbm1lbnQgYWxvbmcgc2lkZSBvdGhlciBoaWdoZXIgbGV2ZWwgdGVzdHMuCj4gPj4+
Cj4gPj4+IExvb2tpbmcgYXQgdGhlIHNlbGZ0ZXN0cyB0cmVlIGluIHRoZSByZXBvLCB3ZSBhbHJl
YWR5IGhhdmUgc2ltaWxhciBpdGVtcyB0bwo+ID4+PiB3aGF0IEt1bml0IGlzIGFkZGluZyBhcyBJ
IGRlc2NyaWJlZCBpbiBwb2ludCAoMikgYWJvdmUuIGtzZWxmdGVzdF9oYXJuZXNzLmgKPiA+Pj4g
Y29udGFpbnMgbWFjcm9zIGxpa2UgRVhQRUNUXyogYW5kIEFTU0VSVF8qIHdpdGggdmVyeSBzaW1p
bGFyIGludGVudGlvbnMgdG8KPiA+Pj4gdGhlIG5ldyBLVU5JVF9FWEVDUFRfKiBhbmQgS1VOSVRf
QVNTRVJUXyogbWFjcm9zLgo+ID4+Pgo+ID4+PiBIb3dldmVyLCB0aGUgbnVtYmVyIG9mIHVzZXJz
IG9mIHRoaXMgaGFybmVzcyBhcHBlYXJzIHRvIGJlIHF1aXRlIHNtYWxsLiBNb3N0Cj4gPj4+IG9m
IHRoZSBjb2RlIGluIHRoZSBzZWxmdGVzdHMgdHJlZSBzZWVtcyB0byBiZSBhIHJhbmRvbSBtaXNt
YXNoIG9mIHNjcmlwdHMKPiA+Pj4gYW5kIHVzZXJzcGFjZSBjb2RlIHNvIGl0J3Mgbm90IGhhcmQg
dG8gc2VlIGl0IGFzIHNvbWV0aGluZyBjb21wbGV0ZWx5Cj4gPj4+IGRpZmZlcmVudCBmcm9tIHRo
ZSBuZXcgS3VuaXQ6Cj4gPj4+Cj4gPj4+ICQgZ2l0IGdyZXAgLS1maWxlcy13aXRoLW1hdGNoZXMg
a3NlbGZ0ZXN0X2hhcm5lc3MuaCAqCj4gPj4KPiA+PiBUbyB0aGUgZXh0ZW50IHRoYXQgd2UgY2Fu
IHVuaWZ5IGhvdyB0ZXN0cyBhcmUgd3JpdHRlbiwgSSBhZ3JlZSB0aGF0Cj4gPj4gdGhpcyB3b3Vs
ZCBiZSBhIGdvb2QgdGhpbmcuICBIb3dldmVyLCB5b3Ugc2hvdWxkIG5vdGUgdGhhdAo+ID4+IGtz
ZWxmdGVzdF9oYXJuZXNzLmggaXMgY3VycmVudGx5IGFzc3VtcyB0aGF0IGl0IHdpbGwgYmUgaW5j
bHVkZWQgaW4KPiA+PiB1c2Vyc3BhY2UgcHJvZ3JhbXMuICBUaGlzIGlzIG1vc3Qgb2J2aW91c2x5
IHNlZW4gaWYgeW91IGxvb2sgY2xvc2VseQo+ID4+IGF0IHRoZSBmdW5jdGlvbnMgZGVmaW5lZCBp
biB0aGUgaGVhZGVyIGZpbGVzIHdoaWNoIG1ha2VzIGNhbGxzIHRvCj4gPj4gZm9yaygpLCBhYm9y
dCgpIGFuZCBmcHJpbnRmKCkuCj4gPiAKPiA+IEFoLCB5ZXMuIEkgb2J2aW91c2x5IGRpZCBub3Qg
ZGlnIGRlZXAgZW5vdWdoLiBVc2luZyBrdW5pdCBmb3IKPiA+IGluLWtlcm5lbCB0ZXN0cyBhbmQg
a3NlbGZ0ZXN0X2hhcm5lc3MgZm9yIHVzZXJzcGFjZSB0ZXN0cyBzZWVtcyBsaWtlCj4gPiBhIHNl
bnNpYmxlIGxpbmUgdG8gZHJhdyB0byBtZS4gVHJ5aW5nIHRvIHVuaWZ5IGtlcm5lbCBhbmQgdXNl
cnNwYWNlCj4gPiBoZXJlIHNvdW5kcyBsaWtlIGl0IGNvdWxkIGJlIGRpZmZpY3VsdCBzbyBpdCdz
IHByb2JhYmx5IG5vdCB3b3J0aAo+ID4gZm9yY2luZyB0aGUgaXNzdWUgdW5sZXNzIHNvbWVvbmUg
d2FudHMgdG8gZG8gc29tZSByZWFsbHkgZmFuY3kgd29yawo+ID4gdG8gZ2V0IGl0IGRvbmUuCj4g
PiAKPiA+IEJhc2VkIG9uIHNvbWUgb2YgdGhlIG90aGVyIGNvbW1lbnRlcnMsIEkgd2FzIHVuZGVy
IHRoZSBpbXByZXNzaW9uCj4gPiB0aGF0IGtzZWxmdGVzdHMgaGFkIGluLWtlcm5lbCB0ZXN0cyBi
dXQgSSdtIG5vdCBzdXJlIHdoZXJlIG9yIGlmIHRoZXkKPiA+IGV4aXN0Lgo+IAo+IFlFUywga3Nl
bGZ0ZXN0IGhhcyBpbi1rZXJuZWwgdGVzdHMuICAoRXhjdXNlIHRoZSBzaG91dGluZy4uLikKPiAK
PiBIZXJlIGlzIGEgbGlrZWx5IGxpc3Qgb2YgdGhlbSBpbiB0aGUga2VybmVsIHNvdXJjZSB0cmVl
Ogo+IAo+ICQgZ3JlcCBtb2R1bGVfaW5pdCBsaWIvdGVzdF8qLmMKPiBsaWIvdGVzdF9iaXRmaWVs
ZC5jOm1vZHVsZV9pbml0KHRlc3RfYml0ZmllbGRzKQo+IGxpYi90ZXN0X2JpdG1hcC5jOm1vZHVs
ZV9pbml0KHRlc3RfYml0bWFwX2luaXQpOwo+IGxpYi90ZXN0X2JwZi5jOm1vZHVsZV9pbml0KHRl
c3RfYnBmX2luaXQpOwo+IGxpYi90ZXN0X2RlYnVnX3ZpcnR1YWwuYzptb2R1bGVfaW5pdCh0ZXN0
X2RlYnVnX3ZpcnR1YWxfaW5pdCk7Cj4gbGliL3Rlc3RfZmlybXdhcmUuYzptb2R1bGVfaW5pdCh0
ZXN0X2Zpcm13YXJlX2luaXQpOwo+IGxpYi90ZXN0X2hhc2guYzptb2R1bGVfaW5pdCh0ZXN0X2hh
c2hfaW5pdCk7CS8qIERvZXMgZXZlcnl0aGluZyAqLwo+IGxpYi90ZXN0X2hleGR1bXAuYzptb2R1
bGVfaW5pdCh0ZXN0X2hleGR1bXBfaW5pdCk7Cj4gbGliL3Rlc3RfaWRhLmM6bW9kdWxlX2luaXQo
aWRhX2NoZWNrcyk7Cj4gbGliL3Rlc3Rfa2FzYW4uYzptb2R1bGVfaW5pdChrbWFsbG9jX3Rlc3Rz
X2luaXQpOwo+IGxpYi90ZXN0X2xpc3Rfc29ydC5jOm1vZHVsZV9pbml0KGxpc3Rfc29ydF90ZXN0
KTsKPiBsaWIvdGVzdF9tZW1jYXRfcC5jOm1vZHVsZV9pbml0KHRlc3RfbWVtY2F0X3BfaW5pdCk7
Cj4gbGliL3Rlc3RfbW9kdWxlLmM6c3RhdGljIGludCBfX2luaXQgdGVzdF9tb2R1bGVfaW5pdCh2
b2lkKQo+IGxpYi90ZXN0X21vZHVsZS5jOm1vZHVsZV9pbml0KHRlc3RfbW9kdWxlX2luaXQpOwo+
IGxpYi90ZXN0X29iamFnZy5jOm1vZHVsZV9pbml0KHRlc3Rfb2JqYWdnX2luaXQpOwo+IGxpYi90
ZXN0X292ZXJmbG93LmM6c3RhdGljIGludCBfX2luaXQgdGVzdF9tb2R1bGVfaW5pdCh2b2lkKQo+
IGxpYi90ZXN0X292ZXJmbG93LmM6bW9kdWxlX2luaXQodGVzdF9tb2R1bGVfaW5pdCk7Cj4gbGli
L3Rlc3RfcGFybWFuLmM6bW9kdWxlX2luaXQodGVzdF9wYXJtYW5faW5pdCk7Cj4gbGliL3Rlc3Rf
cHJpbnRmLmM6bW9kdWxlX2luaXQodGVzdF9wcmludGZfaW5pdCk7Cj4gbGliL3Rlc3Rfcmhhc2h0
YWJsZS5jOm1vZHVsZV9pbml0KHRlc3Rfcmh0X2luaXQpOwo+IGxpYi90ZXN0X3NpcGhhc2guYzpt
b2R1bGVfaW5pdChzaXBoYXNoX3Rlc3RfaW5pdCk7Cj4gbGliL3Rlc3Rfc29ydC5jOm1vZHVsZV9p
bml0KHRlc3Rfc29ydF9pbml0KTsKPiBsaWIvdGVzdF9zdGFja2luaXQuYzptb2R1bGVfaW5pdCh0
ZXN0X3N0YWNraW5pdF9pbml0KTsKPiBsaWIvdGVzdF9zdGF0aWNfa2V5X2Jhc2UuYzptb2R1bGVf
aW5pdCh0ZXN0X3N0YXRpY19rZXlfYmFzZV9pbml0KTsKPiBsaWIvdGVzdF9zdGF0aWNfa2V5cy5j
Om1vZHVsZV9pbml0KHRlc3Rfc3RhdGljX2tleV9pbml0KTsKPiBsaWIvdGVzdF9zdHJpbmcuYzpt
b2R1bGVfaW5pdChzdHJpbmdfc2VsZnRlc3RfaW5pdCk7Cj4gbGliL3Rlc3RfdWJzYW4uYzptb2R1
bGVfaW5pdCh0ZXN0X3Vic2FuX2luaXQpOwo+IGxpYi90ZXN0X3VzZXJfY29weS5jOm1vZHVsZV9p
bml0KHRlc3RfdXNlcl9jb3B5X2luaXQpOwo+IGxpYi90ZXN0X3V1aWQuYzptb2R1bGVfaW5pdCh0
ZXN0X3V1aWRfaW5pdCk7Cj4gbGliL3Rlc3Rfdm1hbGxvYy5jOm1vZHVsZV9pbml0KHZtYWxsb2Nf
dGVzdF9pbml0KQo+IGxpYi90ZXN0X3hhcnJheS5jOm1vZHVsZV9pbml0KHhhcnJheV9jaGVja3Mp
Owo+IAo+IAo+ID4gSWYgdGhleSBkbyBleGlzdHMsIGl0IHNlZW1zIGxpa2UgaXQgd291bGQgbWFr
ZSBzZW5zZSB0bwo+ID4gY29udmVydCB0aG9zZSB0byBrdW5pdCBhbmQgaGF2ZSBLdW5pdCB0ZXN0
cyBydW4tYWJsZSBpbiBhIFZNIG9yCj4gPiBiYXJlbWV0YWwgaW5zdGFuY2UuCj4gCj4gVGhleSBh
bHJlYWR5IHJ1biBpbiBhIFZNLgo+IAo+IFRoZXkgYWxyZWFkeSBydW4gb24gYmFyZSBtZXRhbC4K
PiAKPiBUaGV5IGFscmVhZHkgcnVuIGluIFVNTC4KPiAKPiBUaGlzIGlzIG5vdCB0byBzYXkgdGhh
dCBLVW5pdCBkb2VzIG5vdCBtYWtlIHNlbnNlLiAgQnV0IEknbSBzdGlsbCB0cnlpbmcKPiB0byBn
ZXQgYSBiZXR0ZXIgZGVzY3JpcHRpb24gb2YgdGhlIEtVbml0IGZlYXR1cmVzIChhbmQgdGhlcmUg
YXJlCj4gc29tZSkuCgpGWUksIEkgaGF2ZSBhIG1hc3RlciBzdHVkZW50IHdobyBsb29rcyBhdCBj
b252ZXJ0aW5nIHNvbWUgb2YgdGhlc2UgdG8gS1RGLCBzdWNoIGFzIGZvcgppbnN0YW5jZSB0aGUg
WEFycmF5IHRlc3RzLCB3aGljaCBsZW5kZWQgdGhlbXNlbHZlcyBxdWl0ZSBnb29kIHRvIGEgc2Vt
aS1hdXRvbWF0ZWQKY29udmVyc2lvbi4gCgpUaGUgcmVzdWx0IGlzIGFsc28gYSBzb21ld2hhdCBt
b3JlIGNvbXBhY3QgY29kZSBhcyB3ZWxsIGFzIHRoZSBmbGV4aWJpbGl0eSAKcHJvdmlkZWQgYnkg
dGhlIEdvb2dsZXRlc3QgZXhlY3V0b3IgYW5kIHRoZSBLVEYgZnJhbWV3b3Jrcywgc3VjaCBhcyBy
dW5uaW5nIHNlbGVjdGVkCnRlc3RzLCBvdXRwdXQgZm9ybWF0dGluZywgZGVidWdnaW5nIGZlYXR1
cmVzIGV0Yy4KCktudXQKCj4gLUZyYW5rCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
