Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64B1292D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6310C6E21C;
	Mon, 23 Dec 2019 08:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358A06EBA3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 22:12:12 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBJIOX2K061314;
 Thu, 19 Dec 2019 18:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=y4BDdTlD/akOnQN6+Y9UPpR/Z8qm1YTxP3oHIMbhj0E=;
 b=BuCqGhUhjw4/21mT4pMN1YVwVzXGrsBeR4l0B4HeQjyWnvf1NwKqEWBJ+qvAverqQSNy
 wEOB0MOQbZksiUAyYurlK0Zi4+qtTln559QO3wZHNJwgqXSkTC2Zcx43x3R8y4AheLAd
 0szX+c3CXXsTXBkoKK9FsuVLVLiAEpqMydcX4Gi6MBvamJtq5pIyx10kmBW2EbCGWqiL
 ZWg8ZJAGf5cnsU4oFkq33RaHxfNDHl0LztFyNLMMSagS+N/Dawp0/Wb9SD0dKtSR87Wq
 9yajZwxdZReAU5CuPNGpR9eZqXilNwWMFKg1JW6rVhMOcu78Vcip3sUBI9uzQfcRSLcX gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2x01jacjgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 18:24:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBJIHctu035518;
 Thu, 19 Dec 2019 18:24:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2wyxqj3dwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 18:24:39 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBJIONRV011966;
 Thu, 19 Dec 2019 18:24:23 GMT
Received: from dhcp-10-154-178-61.vpn.oracle.com (/10.154.178.61)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Dec 2019 10:24:23 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re:   BAD --  Patch "drm/mgag200: Flag all G200 SE A machines as
 broken wrt <startadd>" has been added to the 5.4-stable tree
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <157675545116151@kroah.com>
Date: Thu, 19 Dec 2019 12:24:18 -0600
Message-Id: <A3C95C87-1E44-4F63-AFBC-AFF7BA763E52@oracle.com>
References: <157675545116151@kroah.com>
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912190135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912190135
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, andrzej.p@collabora.com,
 20191206081901.9938-1-tzimmermann@suse.de, jose.souza@intel.com,
 tzimmermann@suse.de, stable-commits@vger.kernel.org, alexander.deucher@amd.com,
 airlied@redhat.com, tglx@linutronix.de, sam@ravnborg.org, allison@lohutok.net,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgCgpJIGFtIGhhdmluZyBkaWZmaWN1bHRpZXMgd2l0aCB0aGlzIHBhdGNoIG9uIDogNS40LjIg
IHZhcmlhbnQgOyAgVGhlIHN5c3RlbSBpcyBub3QgYm9vdGluZyB3aXRoIHRoZXNlIHBhdGNoZXMg
YXBwbGllZC4gCgpJIGhhZCB2ZXJpZmllZCBhIHByb3RvdHlwZSBvZiB0aGUgcGF0Y2ggb24gNS40
LjAtcmM4IDsgICAgCgogSSBhbSBjdXJyZW50bHkgZGVidWdnaW5nIGl0ICwgIGJ1dCBJIHdpbGwg
YmUgT29PIHVudGlsIDEvNi8yMDIwIGFmdGVyIHRvZGF5IC4KCgoKCgoKCgoKCj4gT24gRGVjIDE5
LCAyMDE5LCBhdCA1OjM3IEFNLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToKPiAK
PiAKPiBUaGlzIGlzIGEgbm90ZSB0byBsZXQgeW91IGtub3cgdGhhdCBJJ3ZlIGp1c3QgYWRkZWQg
dGhlIHBhdGNoIHRpdGxlZAo+IAo+ICAgIGRybS9tZ2FnMjAwOiBGbGFnIGFsbCBHMjAwIFNFIEEg
bWFjaGluZXMgYXMgYnJva2VuIHdydCA8c3RhcnRhZGQ+Cj4gCj4gdG8gdGhlIDUuNC1zdGFibGUg
dHJlZSB3aGljaCBjYW4gYmUgZm91bmQgYXQ6Cj4gICAgaHR0cHM6Ly91cmxkZWZlbnNlLnByb29m
cG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX3d3dy5rZXJuZWwub3JnX2dpdF8tM0ZwLTNEbGlu
dXhfa2VybmVsX2dpdF9zdGFibGVfc3RhYmxlLTJEcXVldWUuZ2l0LTNCYS0zRHN1bW1hcnkmZD1E
d0lEYVEmYz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhCdjdxSXJNVUI2NWVhcElfSm5FJnI9dDJm
UGc5RDg3RjdEOGptMF8zQ0c5eW9pSUtkUmc0cWNfdGhCdzRiek1oYyZtPU5iNUVuekNZRXFVQ1U0
M19GUE05MzBEck42QS1PclZCb0l2UWhsM0E2eG8mcz1tcUhFMUVUYnl1YzlRZ19XSE5VekRSQkdv
MDczUUZDWXdUQXhweFhFUUpVJmU9IAo+IAo+IFRoZSBmaWxlbmFtZSBvZiB0aGUgcGF0Y2ggaXM6
Cj4gICAgIGRybS1tZ2FnMjAwLWZsYWctYWxsLWcyMDAtc2UtYS1tYWNoaW5lcy1hcy1icm9rZW4t
d3J0LXN0YXJ0YWRkLnBhdGNoCj4gYW5kIGl0IGNhbiBiZSBmb3VuZCBpbiB0aGUgcXVldWUtNS40
IHN1YmRpcmVjdG9yeS4KPiAKPiBJZiB5b3UsIG9yIGFueW9uZSBlbHNlLCBmZWVscyBpdCBzaG91
bGQgbm90IGJlIGFkZGVkIHRvIHRoZSBzdGFibGUgdHJlZSwKPiBwbGVhc2UgbGV0IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPiBrbm93IGFib3V0IGl0Lgo+IAo+IAo+IEZyb20gNGFkZjBiNDllZWE5
MjZhNTVmZDk1NmVmN2Q4Njc1MGY3NzE0MzVmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBG
cm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBEYXRlOiBGcmks
IDYgRGVjIDIwMTkgMDk6MTk6MDEgKzAxMDAKPiBTdWJqZWN0OiBkcm0vbWdhZzIwMDogRmxhZyBh
bGwgRzIwMCBTRSBBIG1hY2hpbmVzIGFzIGJyb2tlbiB3cnQgPHN0YXJ0YWRkPgo+IE1JTUUtVmVy
c2lvbjogMS4wCj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IAo+IEZyb206IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+IAo+IGNvbW1pdCA0YWRmMGI0OWVlYTkyNmE1NWZkOTU2
ZWY3ZDg2NzUwZjc3MTQzNWZmIHVwc3RyZWFtLgo+IAo+IFNldmVyYWwgTUdBIEcyMDAgU0UgbWFj
aGluZXMgZG9uJ3QgcmVzcGVjdCB0aGUgdmFsdWUgb2YgdGhlIHN0YXJ0YWRkCj4gcmVnaXN0ZXIg
ZmllbGQuIEFmdGVyIG1vcmUgZmVlZGJhY2sgb24gYWZmZWN0ZWQgbWFjaGluZXMsIG5laXRoZXIg
UENJCj4gc3VidmVuZG9yIElEIG5vciB0aGUgaW50ZXJuYWwgSUQgc2VlbSB0byBoaW50IHRvd2Fy
ZHMgdGhlIGJ1Zy4gQWxsCj4gYWZmZWN0ZWQgbWFjaGluZXMgaGF2ZSBhIFBDSSBJRCBvZiAweDA1
MjIgKGkuZS4sIEcyMDAgU0UgQSkuIEl0IHdhcwo+IGRlY2lkZWQgdG8gZmxhZyBhbGwgRzIwMCBT
RSBBIG1hY2hpbmVzIGFzIGJyb2tlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+Cj4gRml4ZXM6IDE1OTFmYWRmODU3YyAoImRybS9tZ2FnMjAwOiBBZGQg
d29ya2Fyb3VuZCBmb3IgSFcgdGhhdCBkb2VzIG5vdCBzdXBwb3J0ICdzdGFydGFkZCciKQo+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogSm9obiBEb25u
ZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiAi
WS5DLiBDaGVuIiA8eWNfY2hlbkBhc3BlZWR0ZWNoLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KPiBDYzogIkpvc8OpIFJvYmVydG8gZGUgU291emEiIDxqb3NlLnNvdXphQGlu
dGVsLmNvbT4KPiBDYzogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3Jh
LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2NS4zKwo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNvbkBsb2h1
dG9rLm5ldD4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+
IENjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgo+IExpbms6IGh0dHBz
Oi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZ19wYXRjaF9tc2dpZF8yMDE5MTIwNjA4MTkwMS45OTM4LTJEMS0yRHR6
aW1tZXJtYW5uLTQwc3VzZS5kZSZkPUR3SURhUSZjPVJvUDFZdW1DWENnYVdIdmxaWVI4UFpoOEJ2
N3FJck1VQjY1ZWFwSV9KbkUmcj10MmZQZzlEODdGN0Q4am0wXzNDRzl5b2lJS2RSZzRxY190aEJ3
NGJ6TWhjJm09TmI1RW56Q1lFcVVDVTQzX0ZQTTkzMERyTjZBLU9yVkJvSXZRaGwzQTZ4byZzPWhr
cjBXT21kMzFzdmVCT1lNWm5MazhTYjJ1akQtSnhuWXdqZVNMQnc5Y0EmZT0gCj4gU2lnbmVkLW9m
Zi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiAK
PiAtLS0KPiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIHwgICAgMyArLS0K
PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPiBAQCAtMzAsOSArMzAsOCBAQCBtb2R1bGVf
cGFyYW1fbmFtZWQobW9kZXNldCwgbWdhZzIwMF9tb2RlCj4gc3RhdGljIHN0cnVjdCBkcm1fZHJp
dmVyIGRyaXZlcjsKPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRs
aXN0W10gPSB7Cj4gLQl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUyMiwgUENJX1ZFTkRPUl9J
RF9TVU4sIDB4NDg1MiwgMCwgMCwKPiArCXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQ
Q0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLAo+IAkJRzIwMF9TRV9BIHwgTUdBRzIwMF9GTEFH
X0hXX0JVR19OT19TVEFSVEFERH0sCj4gLQl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUyMiwg
UENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgRzIwMF9TRV9BIH0sCj4gCXsgUENJX1ZFTkRP
Ul9JRF9NQVRST1gsIDB4NTI0LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBHMjAwX1NF
X0IgfSwKPiAJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MzAsIFBDSV9BTllfSUQsIFBDSV9B
TllfSUQsIDAsIDAsIEcyMDBfRVYgfSwKPiAJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MzIs
IFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcyMDBfV0IgfSwKPiAKPiAKPiBQYXRjaGVz
IGN1cnJlbnRseSBpbiBzdGFibGUtcXVldWUgd2hpY2ggbWlnaHQgYmUgZnJvbSB0emltbWVybWFu
bkBzdXNlLmRlIGFyZQo+IAo+IHF1ZXVlLTUuNC9kcm0tbWdhZzIwMC1mbGFnLWFsbC1nMjAwLXNl
LWEtbWFjaGluZXMtYXMtYnJva2VuLXdydC1zdGFydGFkZC5wYXRjaAo+IHF1ZXVlLTUuNC9kcm0t
bWdhZzIwMC1zdG9yZS1mbGFncy1mcm9tLXBjaS1kcml2ZXItZGF0YS1pbi1kZXZpY2Utc3RydWN0
dXJlLnBhdGNoCj4gcXVldWUtNS40L2RybS1tZ2FnMjAwLWFkZC13b3JrYXJvdW5kLWZvci1ody10
aGF0LWRvZXMtbm90LXN1cHBvcnQtc3RhcnRhZGQucGF0Y2gKPiBxdWV1ZS01LjQvZHJtLW1nYWcy
MDAtZXh0cmFjdC1kZXZpY2UtdHlwZS1mcm9tLWZsYWdzLnBhdGNoCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
