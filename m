Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 099031292A2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CED66E1B3;
	Mon, 23 Dec 2019 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6756 seconds by postgrey-1.36 at gabe;
 Thu, 19 Dec 2019 20:17:45 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114EC6E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 20:17:44 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBJKAQWN147199;
 Thu, 19 Dec 2019 20:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=a1qPMnnh35nBOPcRsJtCZSy2QqzLNQSr6WNPg+FspdE=;
 b=kICdn+chNgIim1M6yVYqYDs3in5fFBN0yoYaCjZOuUAist719ERttS19WpLloHq0yQ+g
 MPCQWMGw8xZ7do9G5XjZ33a0kElzMCAKjPSCSID2i1Fm2p/O/F5Dy5mGk26dK0s7QiYF
 MI+02qsGJ20p8McLwBKD+tPjrSXuvzGAfw+C8Ip+o2uwNy9K2v0u+1JIvrSske7Tslwy
 7aMtV0CAnQS0UalEz3yC6llQVHiIbTzV8yL75Ks55Hs+fEhFaiqX4rNkirKcQmiAD10V
 1+WcXiJeP+WmBX6s/w0cVz/JRphZIptDG8GUdZuP7y2yKHneNVozwaVtdzB9I3+bdnhp Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2x01jad3w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 20:17:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBJK8xW5024024;
 Thu, 19 Dec 2019 20:17:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2x0bgmd137-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 20:17:22 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBJKH89b015626;
 Thu, 19 Dec 2019 20:17:09 GMT
Received: from dhcp-10-154-178-61.vpn.oracle.com (/10.154.178.61)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Dec 2019 12:17:08 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re:  IGNORE  --  Patch "drm/mgag200: Flag all G200 SE A machines as
 broken wrt <startadd>" has been added to the 5.4-stable tree
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <A3C95C87-1E44-4F63-AFBC-AFF7BA763E52@oracle.com>
Date: Thu, 19 Dec 2019 14:17:03 -0600
Message-Id: <9B361366-9D7A-45B3-B59C-A33871BDA653@oracle.com>
References: <157675545116151@kroah.com>
 <A3C95C87-1E44-4F63-AFBC-AFF7BA763E52@oracle.com>
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912190148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912190148
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

SSBkaXNjb3ZlcmVkIEkgd2FzIG1pc3NpbmcgYSBjb21taXQgIHdoZW4gSSBtZXJnZWQgLiAKCgpU
aGlzIHNlcmllcyBpcyBmaW5lIC4KCgoKPiBPbiBEZWMgMTksIDIwMTksIGF0IDEyOjI0IFBNLCBK
b2huIERvbm5lbGx5IDxqb2huLnAuZG9ubmVsbHlAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4gSGkg
Cj4gCj4gSSBhbSBoYXZpbmcgZGlmZmljdWx0aWVzIHdpdGggdGhpcyBwYXRjaCBvbiA6IDUuNC4y
ICB2YXJpYW50IDsgIFRoZSBzeXN0ZW0gaXMgbm90IGJvb3Rpbmcgd2l0aCB0aGVzZSBwYXRjaGVz
IGFwcGxpZWQuIAo+IAo+IEkgaGFkIHZlcmlmaWVkIGEgcHJvdG90eXBlIG9mIHRoZSBwYXRjaCBv
biA1LjQuMC1yYzggOyAgICAKPiAKPiBJIGFtIGN1cnJlbnRseSBkZWJ1Z2dpbmcgaXQgLCAgYnV0
IEkgd2lsbCBiZSBPb08gdW50aWwgMS82LzIwMjAgYWZ0ZXIgdG9kYXkgLgo+IAo+IAo+IAo+IAo+
IAo+IAo+IAo+IAo+IAo+IAo+PiBPbiBEZWMgMTksIDIwMTksIGF0IDU6MzcgQU0sIGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnIHdyb3RlOgo+PiAKPj4gCj4+IFRoaXMgaXMgYSBub3RlIHRvIGxl
dCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUgcGF0Y2ggdGl0bGVkCj4+IAo+PiAg
IGRybS9tZ2FnMjAwOiBGbGFnIGFsbCBHMjAwIFNFIEEgbWFjaGluZXMgYXMgYnJva2VuIHdydCA8
c3RhcnRhZGQ+Cj4+IAo+PiB0byB0aGUgNS40LXN0YWJsZSB0cmVlIHdoaWNoIGNhbiBiZSBmb3Vu
ZCBhdDoKPj4gICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cC0zQV9fd3d3Lmtlcm5lbC5vcmdfZ2l0Xy0zRnAtM0RsaW51eF9rZXJuZWxfZ2l0X3N0YWJsZV9z
dGFibGUtMkRxdWV1ZS5naXQtM0JhLTNEc3VtbWFyeSZkPUR3SURhUSZjPVJvUDFZdW1DWENnYVdI
dmxaWVI4UFpoOEJ2N3FJck1VQjY1ZWFwSV9KbkUmcj10MmZQZzlEODdGN0Q4am0wXzNDRzl5b2lJ
S2RSZzRxY190aEJ3NGJ6TWhjJm09TmI1RW56Q1lFcVVDVTQzX0ZQTTkzMERyTjZBLU9yVkJvSXZR
aGwzQTZ4byZzPW1xSEUxRVRieXVjOVFnX1dITlV6RFJCR28wNzNRRkNZd1RBeHB4WEVRSlUmZT0g
Cj4+IAo+PiBUaGUgZmlsZW5hbWUgb2YgdGhlIHBhdGNoIGlzOgo+PiAgICBkcm0tbWdhZzIwMC1m
bGFnLWFsbC1nMjAwLXNlLWEtbWFjaGluZXMtYXMtYnJva2VuLXdydC1zdGFydGFkZC5wYXRjaAo+
PiBhbmQgaXQgY2FuIGJlIGZvdW5kIGluIHRoZSBxdWV1ZS01LjQgc3ViZGlyZWN0b3J5Lgo+PiAK
Pj4gSWYgeW91LCBvciBhbnlvbmUgZWxzZSwgZmVlbHMgaXQgc2hvdWxkIG5vdCBiZSBhZGRlZCB0
byB0aGUgc3RhYmxlIHRyZWUsCj4+IHBsZWFzZSBsZXQgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
IGtub3cgYWJvdXQgaXQuCj4+IAo+PiAKPj4gRnJvbSA0YWRmMGI0OWVlYTkyNmE1NWZkOTU2ZWY3
ZDg2NzUwZjc3MTQzNWZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiBGcm9tOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4gRGF0ZTogRnJpLCA2IERlYyAyMDE5
IDA5OjE5OjAxICswMTAwCj4+IFN1YmplY3Q6IGRybS9tZ2FnMjAwOiBGbGFnIGFsbCBHMjAwIFNF
IEEgbWFjaGluZXMgYXMgYnJva2VuIHdydCA8c3RhcnRhZGQ+Cj4+IE1JTUUtVmVyc2lvbjogMS4w
Cj4+IENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+PiBDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4+IAo+PiBGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KPj4gCj4+IGNvbW1pdCA0YWRmMGI0OWVlYTkyNmE1NWZkOTU2ZWY3
ZDg2NzUwZjc3MTQzNWZmIHVwc3RyZWFtLgo+PiAKPj4gU2V2ZXJhbCBNR0EgRzIwMCBTRSBtYWNo
aW5lcyBkb24ndCByZXNwZWN0IHRoZSB2YWx1ZSBvZiB0aGUgc3RhcnRhZGQKPj4gcmVnaXN0ZXIg
ZmllbGQuIEFmdGVyIG1vcmUgZmVlZGJhY2sgb24gYWZmZWN0ZWQgbWFjaGluZXMsIG5laXRoZXIg
UENJCj4+IHN1YnZlbmRvciBJRCBub3IgdGhlIGludGVybmFsIElEIHNlZW0gdG8gaGludCB0b3dh
cmRzIHRoZSBidWcuIEFsbAo+PiBhZmZlY3RlZCBtYWNoaW5lcyBoYXZlIGEgUENJIElEIG9mIDB4
MDUyMiAoaS5lLiwgRzIwMCBTRSBBKS4gSXQgd2FzCj4+IGRlY2lkZWQgdG8gZmxhZyBhbGwgRzIw
MCBTRSBBIG1hY2hpbmVzIGFzIGJyb2tlbi4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+PiBBY2tlZC1ieTogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+Cj4+IEZpeGVzOiAxNTkxZmFkZjg1N2MgKCJkcm0vbWdhZzIw
MDogQWRkIHdvcmthcm91bmQgZm9yIEhXIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCAnc3RhcnRhZGQn
IikKPj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+PiBDYzog
Sm9obiBEb25uZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+Cj4+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+Cj4+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KPj4gQ2M6ICJZLkMuIENoZW4iIDx5Y19jaGVuQGFzcGVlZHRlY2guY29tPgo+PiBD
YzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiBDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4+IENjOiAiSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSIgPGpvc2Uuc291emFAaW50ZWwuY29tPgo+PiBDYzogQW5kcnplaiBQaWV0cmFzaWV3aWN6
IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjMrCj4+IENjOiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiBDYzogQWxs
aXNvbiBSYW5kYWwgPGFsbGlzb25AbG9odXRvay5uZXQ+Cj4+IENjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+IENjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxm
QHRyb25uZXMub3JnPgo+PiBMaW5rOiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20v
djIvdXJsP3U9aHR0cHMtM0FfX3BhdGNod29yay5mcmVlZGVza3RvcC5vcmdfcGF0Y2hfbXNnaWRf
MjAxOTEyMDYwODE5MDEuOTkzOC0yRDEtMkR0emltbWVybWFubi00MHN1c2UuZGUmZD1Ed0lEYVEm
Yz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhCdjdxSXJNVUI2NWVhcElfSm5FJnI9dDJmUGc5RDg3
RjdEOGptMF8zQ0c5eW9pSUtkUmc0cWNfdGhCdzRiek1oYyZtPU5iNUVuekNZRXFVQ1U0M19GUE05
MzBEck42QS1PclZCb0l2UWhsM0E2eG8mcz1oa3IwV09tZDMxc3ZlQk9ZTVpuTGs4U2IydWpELUp4
bll3amVTTEJ3OWNBJmU9IAo+PiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiAKPj4gLS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZHJ2LmMgfCAgICAzICstLQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+IAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX2Rydi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfZHJ2LmMKPj4gQEAgLTMwLDkgKzMwLDggQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1vZGVzZXQs
IG1nYWcyMDBfbW9kZQo+PiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyOwo+PiAKPj4g
c3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewo+PiAtCXsg
UENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQQ0lfVkVORE9SX0lEX1NVTiwgMHg0ODUyLCAw
LCAwLAo+PiArCXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLAo+PiAJCUcyMDBfU0VfQSB8IE1HQUcyMDBfRkxBR19IV19CVUdfTk9fU1RB
UlRBRER9LAo+PiAtCXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQQ0lfQU5ZX0lELCBQ
Q0lfQU5ZX0lELCAwLCAwLCBHMjAwX1NFX0EgfSwKPj4gCXsgUENJX1ZFTkRPUl9JRF9NQVRST1gs
IDB4NTI0LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBHMjAwX1NFX0IgfSwKPj4gCXsg
UENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTMwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBHMjAwX0VWIH0sCj4+IAl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUzMiwgUENJX0FOWV9J
RCwgUENJX0FOWV9JRCwgMCwgMCwgRzIwMF9XQiB9LAo+PiAKPj4gCj4+IFBhdGNoZXMgY3VycmVu
dGx5IGluIHN0YWJsZS1xdWV1ZSB3aGljaCBtaWdodCBiZSBmcm9tIHR6aW1tZXJtYW5uQHN1c2Uu
ZGUgYXJlCj4+IAo+PiBxdWV1ZS01LjQvZHJtLW1nYWcyMDAtZmxhZy1hbGwtZzIwMC1zZS1hLW1h
Y2hpbmVzLWFzLWJyb2tlbi13cnQtc3RhcnRhZGQucGF0Y2gKPj4gcXVldWUtNS40L2RybS1tZ2Fn
MjAwLXN0b3JlLWZsYWdzLWZyb20tcGNpLWRyaXZlci1kYXRhLWluLWRldmljZS1zdHJ1Y3R1cmUu
cGF0Y2gKPj4gcXVldWUtNS40L2RybS1tZ2FnMjAwLWFkZC13b3JrYXJvdW5kLWZvci1ody10aGF0
LWRvZXMtbm90LXN1cHBvcnQtc3RhcnRhZGQucGF0Y2gKPj4gcXVldWUtNS40L2RybS1tZ2FnMjAw
LWV4dHJhY3QtZGV2aWNlLXR5cGUtZnJvbS1mbGFncy5wYXRjaAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
