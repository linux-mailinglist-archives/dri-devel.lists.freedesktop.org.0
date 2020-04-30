Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373531C0EBF
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C426EC3A;
	Fri,  1 May 2020 07:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DAC6EBA3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:09:24 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03UC90Eb055628;
 Thu, 30 Apr 2020 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=/SIGLtPnlVhzUOAoYJKEiRp4vcG6Bjlr3j14K1XECFM=;
 b=npSOVEn414PM8wAvTKw9J2FH/b+Mh/Rfc1LyqsO74tGYBQXd0Oj5LRGqR40gPALvcjnE
 fx7dLWna3cI9Ph9CHQKQ4F1nDOuzrzbs5zM84P1npWffXAOzvfIJ+FlXpTPDiSZ98fji
 vktQnBcWgUKKSXyagEej9nh6W7bBK9aiaXXW7A2hTlUqiky5KJMrr6gKfi8L1pUr96hV
 3hML5U1hmq4KSONjEFhVD9F+G1XJ16BPEUWiCqHkXl3j6KcbBigU/wuuDKYZaNFX7TAz
 C2SCmc5D+sUIw069rVmmUB5ZIR0WgaxCnIzmZHgG5gplCp2wUmGdi1oEc6t3OFE4AQ8O Hg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 30nucgb14p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 12:09:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03UC7PxB179416;
 Thu, 30 Apr 2020 12:09:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 30qtjwyrxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 12:09:21 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03UC9FhW027413;
 Thu, 30 Apr 2020 12:09:15 GMT
Received: from [192.168.1.126] (/47.220.71.223)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Apr 2020 05:09:15 -0700
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org, sam@ravnborg.org
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
 <8bef6904-8026-fd09-3950-d5fdfcd31bee@suse.de>
From: John Donnelly <John.P.Donnelly@Oracle.com>
Message-ID: <a8464fff-8957-3056-e023-7fcce5288225@Oracle.com>
Date: Thu, 30 Apr 2020 07:09:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8bef6904-8026-fd09-3950-d5fdfcd31bee@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300100
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC8zMC8yMCAzOjI5IEFNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiBIaSBKb2huCj4g
Cj4gQW0gMzAuMDQuMjAgdW0gMDI6MTEgc2NocmllYiBKb2huIERvbm5lbGx5Ogo+PiBPbiA0LzI5
LzIwIDk6MzIgQU0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaHNldCBj
b252ZXJ0cyBtZ2FnMjAwIHRvIGF0b21pYyBtb2Rlc2V0dGluZy4gSXQgdXNlcyBzaW1wbGUKPj4+
IEtNUyBoZWxwZXJzIGFuZCBTSE1FTS4KPj4+Cj4+PiBQYXRjaGVzIDEgdG8gNCBzaW1wbGlmaWVz
IHRoZSBkcml2ZXIgYmVmb3JlIHRoZSBjb252ZXJzaW9uLiBGb3IgZXhhbXBsZSwKPj4+IHRoZSBI
VyBjdXJzb3IgaXMgbm90IHVzYWJsZSB3aXRoIHRoZSB3YXkgdW5pdmVyc2FsIHBsYW5lcyB3b3Jr
LiBBIGZldwo+Pj4gZGF0YSBzdHJ1Y3R1cmVzIGNhbiBiZSBjbGVhbmVkIHVwLgo+Pj4KPj4+IFBh
dGNoZXMgNSB0byAxNSB1bnRhbmdsZSB0aGUgZXhpc3RpbmcgbW9kZXNldHRpbmcgY29kZSBpbnRv
IHNtYWxsZXIKPj4+IGZ1bmN0aW9ucy4gU3BlY2lmaWNhbGx5LCBtb2RlIHNldHRpbmcgYW5kIHBs
YW5lIHVwZGF0ZXMgYXJlIGJlaW5nCj4+PiBzZXBhcmF0ZWQgZnJvbSBlYWNoIG90aGVyLgo+Pj4K
Pj4+IFBhdGNoIDE2IGNvbnZlcnRzIG1nYWcyMDAgdG8gc2ltcGxlIEtNUyBoZWxwZXJzIGFuZCBl
bmFibGVzIGF0b21pYwo+Pj4gbW9kZSBzZXR0aW5nLgo+Pj4KPj4+IEFzIHNvbWUgSFcgc2VlbXMg
dG8gcmVxdWlyZSBhIGZyYW1lYnVmZmVyIG9mZnNldCBvZiAwIHdpdGhpbiB0aGUgdmlkZW8KPj4+
IG1lbW9yeSwgaXQgZG9lcyBub3Qgd29yayB3aXRoIGF0b21pYyBtb2Rlc2V0dGluZy4gQXRvbWlj
YWxseSBzd2l0Y2hpbmcKPj4+IHBsYW5lIGZyYW1lYnVmZmVycywgcmVxdWlyZXMgZWl0aGVyIHNv
dXJjZSBvciB0YXJnZXQgYnVmZmVyIHRvIGJlIGxvY2F0ZWQKPj4+IGF0IGEgbm9uLTAgb2ZmZXQu
IFRvIHJlc29sdmUgdGhpcyBwcm9ibGVtLCBwYXRjaCAxNyBjb252ZXJ0cyBtZ2FnMjAwIGZyb20K
Pj4+IFZSQU0gaGVscGVycyB0byBTSE1FTSBoZWxwZXJzLiBEdXJpbmcgcGxhbmUgdXBkYXRlcywg
dGhlIGNvbnRlbnQgb2YgdGhlCj4+PiBTSE1FTSBCTyBpcyBtZW1jcHknZCB0byBWUkFNLiBGcm9t
IG15IHN1YmplY3RpdmUgb2JlcnNhdGlvbiwgcGVyZm9ybWFuY2UKPj4+IGlzIG5vdCBudWNoIGRp
ZmZlcmVudCBmcm9tIHRoZSBvcmlnaW5hbCBjb2RlLgo+Pj4KPj4+IFRoZSBwYXRjaHNldCBoYXMg
YmVlbiB0ZXN0ZWQgb24gTUdBIEcyMDBFSCBoYXJkd2FyZS4KPj4+Cj4+PiBUaG9tYXMgWmltbWVy
bWFubiAoMTcpOgo+Pj4gIMKgwqAgZHJtL21nYWcyMDA6IFJlbW92ZSBIVyBjdXJzb3IKPj4+ICDC
oMKgIGRybS9tZ2FnMjAwOiBSZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHN0cnVjdCBtZ2FfZGV2
aWNlCj4+PiAgwqDCoCBkcm0vbWdhZzIwMDogRW1iZWQgY29ubmVjdG9yIGluc3RhbmNlIGluIHN0
cnVjdCBtZ2FfZGV2aWNlCj4+PiAgwqDCoCBkcm0vbWdhZzIwMDogVXNlIG1hbmFnZWQgbW9kZS1j
b25maWcgaW5pdGlhbGl6YXRpb24KPj4+ICDCoMKgIGRybS9tZ2FnMjAwOiBDbGVhbiB1cCBtZ2Ff
c2V0X3N0YXJ0X2FkZHJlc3MoKQo+Pj4gIMKgwqAgZHJtL21nYWcyMDA6IENsZWFuIHVwIG1nYV9j
cnRjX2RvX3NldF9iYXNlKCkKPj4+ICDCoMKgIGRybS9tZ2FnMjAwOiBNb3ZlIG1vZGUtc2V0dGlu
ZyBjb2RlIGludG8gc2VwYXJhdGUgaGVscGVyIGZ1bmN0aW9uCj4+PiAgwqDCoCBkcm0vbWdhZzIw
MDogU3BsaXQgTUlTQyByZWdpc3RlciB1cGRhdGUgaW50byBQTEwgc2VsZWN0aW9uLCBTWU5DIGFu
ZAo+Pj4gIMKgwqDCoMKgIEkvTwo+Pj4gIMKgwqAgZHJtL21nYWcyMDA6IFVwZGF0ZSBtb2RlIHJl
Z2lzdGVycyBhZnRlciBwbGFuZSByZWdpc3RlcnMKPj4+ICDCoMKgIGRybS9tZ2FnMjAwOiBTZXQg
cGl0Y2ggaW4gYSBzZXBhcmF0ZSBoZWxwZXIgZnVuY3Rpb24KPj4+ICDCoMKgIGRybS9tZ2FnMjAw
OiBTZXQgcHJpbWFyeSBwbGFuZSdzIGZvcm1hdCBpbiBzZXBhcmF0ZSBoZWxwZXIgZnVuY3Rpb24K
Pj4+ICDCoMKgIGRybS9tZ2FnMjAwOiBNb3ZlIFRBR0ZJRk8gcmVzZXQgaW50byBzZXBhcmF0ZSBm
dW5jdGlvbgo+Pj4gIMKgwqAgZHJtL21nYWcyMDA6IE1vdmUgaGlwcmlsdmwgc2V0dGluZyBpbnRv
IHNlcGFyYXRlIGZ1bmN0aW9ucwo+Pj4gIMKgwqAgZHJtL21nYWcyMDA6IE1vdmUgcmVnaXN0ZXIg
aW5pdGlhbGl6YXRpb24gaW50byBzZXBhcmF0ZSBmdW5jdGlvbgo+Pj4gIMKgwqAgZHJtL21nYWcy
MDA6IFJlbW92ZSB3YWl0aW5nIGZyb20gRFBNUyBjb2RlCj4+PiAgwqDCoCBkcm0vbWdhZzIwMDog
Q29udmVydCB0byBzaW1wbGUgS01TIGhlbHBlcgo+Pj4gIMKgwqAgZHJtL21nYWcyMDA6IFJlcGxh
Y2UgVlJBTSBoZWxwZXJzIHdpdGggU0hNRU0gaGVscGVycwo+Pj4KPj4+ICDCoCBkcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPj4+ICDC
oCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MiArLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCAz
MTkgLS0tLS0tLS0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5j
wqDCoMKgIHzCoCA1MSArLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmjCoMKgwqAgfMKgIDQzICstCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9tYWluLmPCoMKgIHzCoCAyOCAtCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tb2RlLmPCoMKgIHwgOTQ4ICsrKysrKysrKysrKy0tLS0tLS0tLS0tCj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9yZWcuaMKgwqDCoCB8wqDCoCA1ICstCj4+
PiAgwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF90dG0uY8KgwqDCoCB8wqAgMzUg
Ky0KPj4+ICDCoCA5IGZpbGVzIGNoYW5nZWQsIDU2MyBpbnNlcnRpb25zKCspLCA4NzIgZGVsZXRp
b25zKC0pCj4+PiAgwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfY3Vyc29yLmMKPj4+Cj4+PiAtLSAKPj4+IDIuMjYuMAo+Pj4KPj4KPj4KPj4gIMKg
SGkgVGhvbWFzICwKPj4KPj4gIMKgSSB3b3VsZCBsaWtlIHRvIHRlc3QgdGhpcyBvbiBoYXJkd2Fy
ZSB0aGF0IHVzZXMgdGhpcyBkZXZpY2UgaW50ZWdyYXRlZAo+PiBpbnRvIGFzIEJNQ8KgICggaUxv
ICkgdGhhdCBJIGhhdmUgcmFuIGludG8gcHJvYmxlbXMgYmVmb3JlLiBDYW4geW91IHBvc3QKPj4g
eW91ciBzdGFnaW5nIFVSTCBzbyBJIGNhbiBjbG9uZSBpdCA/Cj4gCj4gU3VyZSwgSSdsbCBzZXQg
c29tZXRoaW5nIHVwIGZvciB5b3UuIEJ1dCBpdCBjb3VsZCB0YWtlIHVudGlsIG5leHQgd2Vlay4K
PiBJIHByb21pc2Ugbm90IHRvIG1lcmdlIHRoZSBwYXRjaGVzIGJlZm9yZSB5b3UgaGFkIGEgY2hh
bmNlIHRvIHRlc3QgdGhlbS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKICBIaQoKICAg
IEkgbWF5IHRyeSB0byBhcHBseSB0aGVzZSBwYXRjaGVzIGxvY2FsbHkgLi4gSXQgd29uJ3QgYmUg
dW50aWwgbmV4dCAKd2VlayB0aG91Z2ggLgoKCj4+Cj4+Cj4+ICggVGhhbmsgeW91IGZvciBDQydp
bmcgbWUuIEkgcmVtb3ZlZCBteSBlbWFpbCBmcm9tIG9uIGRsaXN0IHJlY2VudGx5KSAuCj4+Cj4+
Cj4+Cj4+Cj4gCgoKLS0gClRoYW5rIFlvdSwKSm9obgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
