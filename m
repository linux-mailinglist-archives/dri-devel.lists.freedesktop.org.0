Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC0FB688
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 18:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F97891D9;
	Wed, 13 Nov 2019 17:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D1E6EDBD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:42:22 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADHdEwd076212;
 Wed, 13 Nov 2019 17:42:21 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2w5ndqe5ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 17:42:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADHcdU0020095;
 Wed, 13 Nov 2019 17:42:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2w7vppndu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 17:42:20 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xADHgIeH031739;
 Wed, 13 Nov 2019 17:42:19 GMT
Received: from dhcp-10-154-116-22.vpn.oracle.com (/10.154.116.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Nov 2019 09:42:18 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics 
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <d448d263-aa5e-35ec-df7c-69cc4828a318@suse.de>
Date: Wed, 13 Nov 2019 11:42:17 -0600
Message-Id: <E0E19A1E-8546-4A94-88D0-C6AA6E20280A@oracle.com>
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
 <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
 <3E3FE3C2-AD75-4F21-A73B-A69A652BC46D@oracle.com>
 <41394290-cc37-07b6-72cd-ea0ef41f2d7f@suse.de>
 <339CFF4F-7128-4749-9673-16518161E09F@oracle.com>
 <d448d263-aa5e-35ec-df7c-69cc4828a318@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=yj/xQM/93Ae71eWqUkKLN1aGlG2eEE8D6xy2kXtSojo=;
 b=e7adJCTEQlp+Nxc8GAyTXC776WvOdTvVyKC3tbgpXvz0oOnM578oEzkAkhZGenilVpsr
 qna7Ufqg7uuope/nt0MbZ+K89uGQqMnv6xFOcqof5OJp7J460D0IKzfnSxGmmxJM4138
 QwreSquJgwekVMYOzrDGEuxRZBHVmZ3IaSs54wWwYJ21Y8j5d0kTpstT5nsy6YVgUAc5
 PBruV6Q7hJiF8G+WO1GGb5EFKCypWygPE+yFHdaE/8fK13bXK1oyDJThwVu+nKni5c1K
 0+oAlImveqoSpTQlQxKuPbc2gwQuDgOOj7Gv31m0W9IcBrCv0XrvV5Ef8yD7f4PAdyBv Pg== 
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
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzOiAgU2VlIGJlbG93IAoKPiBPbiBOb3YgMTMsIDIwMTksIGF0IDI6MTcgQU0sIFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiAKPiBIaSBKb2hu
Cj4gCj4gQW0gMTIuMTEuMTkgdW0gMjA6MTMgc2NocmllYiBKb2huIERvbm5lbGx5Ogo+PiAKPj4g
SW4gc2hvcnQgLiAgSSBzdGFydGVkICAgd2l0aCA6Cj4+IAo+PiBnaXQgYmlzZWN0IHN0YXJ0IAo+
PiAKPj4gZ2l0IGJpc2VjdCBiYWQgYmU4NDU0YWZjNTBmCj4+IAo+PiBnaXQgYmlzZWN0IGdvb2Qg
ZmVjODhhYjBhZjk3Cj4+IAo+PiBBbmQgYXQgdGhlICB0aGUgZW5kIG9mICAgYmlzZWN0cyAgc2hv
d2VkIHRoaXMgd2FzIHRoZSBvZmZlbmRpbmcgY29tbWl0IDoKPj4gCj4+IGMwYTc0YzczMjU2OCAK
Pj4gCj4+IGNvbW1pdCBjMGE3NGM3MzI1NjhhZDM0N2Y3YjNkZTI4MTkyMjgwOGRhYjMwNTA0IChy
ZWZzL2Jpc2VjdC9iYWQpCj4+IEF1dGhvcjogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KPj4gRGF0ZTogICBGcmkgTWF5IDI0IDIwOjM1OjIyIDIwMTkgKzAzMDAKPj4gCj4+ICAg
IGRybS9pOTE1OiBVcGRhdGUgRFJJVkVSX0RBVEUgdG8gMjAxOTA1MjQKPj4gCj4+ICAgIFNpZ25l
ZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+IAo+PiBUaGF0
IGRvZXMgbm90IGhhdmUgYW55IHJlYWwgcmVsZXZhbmNlCj4gCj4gTm8sIHRoYXQgZG9lc24ndCBs
b29rIHJpZ2h0LiBUaGUgb3RoZXIgYmFkIGNvbW1pdHMgeW91IGxpc3QgYmVsb3cgYWxzbwo+IGRv
bid0IHNlZW0gdG8gYmUgcmVsYXRlZC4KCgoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGllbmNlIDsg
IEkgIHN0YXJ0ZWQgb3ZlciBhbmQgdGhlIGJpc2VjdCB0b29rIHRvIG1lIHRvICB0aGlzIGNoYW5n
ZSB0aGF0IGNlcnRhaW5seSByZWZsZWN0cyB0aGUgYmVoYXZpb3IgSSBhbSBzZWVpbmcgOgoKY29t
bWl0IDgxZGE4N2Y2M2ExZWRlYmNmOGNiYjgxMWQzODdlMzUzZDlmODljN2EgKHJlZnMvYmlzZWN0
L2JhZCkKQXV0aG9yOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KRGF0
ZTogICBUdWUgTWF5IDIxIDEzOjA4OjI5IDIwMTkgKzAyMDAKCiAgICBkcm06IFJlcGxhY2UgZHJt
X2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBrdW5tYXAgKyB1bnBpbgogICAgCiAgICBU
aGUgcHVzaC10by1zeXN0ZW0gZnVuY3Rpb24gZm9yY2VzIGEgYnVmZmVyIG91dCBvZiB2aWRlbyBS
QU0uIFRoaXMgZGVjaXNpb24KICAgIHNob3VsZCByYXRoZXIgYmUgbWFkZSBieSB0aGUgbWVtb3J5
IG1hbmFnZXIuIEJ5IHJlcGxhY2luZyB0aGUgZnVuY3Rpb24gd2l0aAogICAgY2FsbHMgdG8gdGhl
IGt1bm1hcCBhbmQgdW5waW4gZnVuY3Rpb25zLCB0aGUgYnVmZmVyJ3MgbWVtb3J5IGJlY29tZXMg
YXZhaWxhYmxlLAogICAgYnV0IHRoZSBidWZmZXIgcmVtYWlucyBpbiBWUkFNIHVudGlsIGl0J3Mg
ZXZpY3RlZCBieSBhIHBpbiBvcGVyYXRpb24uCiAgICAKICAgIFRoaXMgcGF0Y2ggcmVwbGFjZXMg
dGhlIHJlbWFpbmluZyBpbnN0YW5jZXMgb2YgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkK
ICAgIGluIGFzdCBhbmQgbWdhZzIwMCwgYW5kIHJlbW92ZXMgdGhlIGZ1bmN0aW9uIGZyb20gRFJN
LgoKCk15IDFzdCBpbXByZXNzaW9uIGlzIHdlIG5lZWQgYSBtZXRob2QgIHRoYXQgcmVzdG9yZXMg
dGhlIHByZXZpb3VzIGJlaGF2aW9yIHRoYXQgcHVzaGVzIHRoZSBjb250ZW50IHRvIHRoZSBkZXZp
Y2UgLiAgICAKCgoKCj4gCj4gWW91IGNvdWxkIGFsc28gYmlzZWN0IGJldHdlZW4geW91ciBvcmln
aW5hbCB3b3JraW5nIGNvbW1pdCAodjQuMTg/KSBhbmQKPiB0aGUgb25lIHlvdSB3YW50IHRvIHVw
Z3JhZGUgdG8gKHY1LjM/KS4gSXQncyBvbmx5IGEgZmV3IG1vcmUgYnVpbGRzIGJ1dAo+IG1pZ2h0
IGJlIG1pZ2h0IGdpdmUgYmV0dGVyIHJlc3VsdHMuCj4gCj4gQlRXLCBhcmUgeW91IGFsc28gY29u
dmVydGluZyBHbm9tZSBmcm9tIFgxMSB0byBXYXlsYW5kLiBJIGZvdW5kIHRoYXQKPiBHbm9tZSdz
IFdheWxhbmQgY29kZSBpcyBzbyBzbG93IG9uIG1nYWcyMDAgdGhhdCBpdCdzIHVudXNhYmxlLiBU
aGV5Cj4gcmVjZW50bHkgYWRkZWQgYSBzaGFkb3cgRkIgWzFdIHRvIGltcHJvdmUgcGVyZm9ybWFu
Y2UsIGJ1dCBpdCB3b24ndCBiZQo+IGF2YWlsYWJsZSBiZWZvcmUgR25vbWUgMy4zNi4KCgpJIGZv
dW5kIHRoaXMgaXNzdWUgdXNpbmcgCgpnbm9tZS1kZXNrdG9wMy0zLjI4LjItMS5lbDgueDg2XzY0
CgpJZiB0aGVyZSBpcyBhIG1vcmUgc3BlY2lmaWMuIFJQTSAgSSBjYW4gbG9vayBhdCBmb3IgZ3Vp
ZGFuY2UgSSB3aWxsIC4gCgoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPiBbMV0gaHR0
cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci9tZXJnZV9yZXF1ZXN0cy84NzcvZGlm
ZnMKPiAKPj4gCj4+IAo+PiBJIGFtIG5vdCBzdXJlIGlmIEkgZGlkICB0aGUgIGJpc2VjdHMgY29y
cmVjdGx5IC4gICBBZnRlciBlYWNoIHRlc3QgSSBkaWQgOgo+PiAKPj4gCj4+ICMxICBnaXQgYmlz
ZWN0IGJhZCA4Mjc0NDBhOTAxNDYKPj4gCj4+ICMyICBnaXQgYmlzZWN0IGJhZCBmNWIwN2IwNGU1
ZjAKPj4gCj4+ICMzICBnaXQgYmlzZWN0IGJhZCBjMGE3NGM3MzI1NjgKPj4gCj4+ICM0ICBnaXQg
YmlzZWN0IGdvb2QgODE4ZjVjYjNlOGZiCj4+IAo+PiAjNSAgZ2l0IGJpc2VjdCBnb29kIDZjZmU3
ZWMwMmU4NQo+PiAKPj4gIzYgZ2l0IGJpc2VjdCBnb29kIGY3MWUwMWE3OGJlZQo+PiAKPj4gIzcg
IGdpdCBiaXNlY3QgZ29vZCAwOWE5M2VmM2Q2MGYKPj4gCj4+ICM4ICBnaXQgYmlzZWN0IGdvb2Qg
ZjFlNmIzMzZiYWZhCj4+IAo+PiAjOSBnaXQgYmlzZWN0IGdvb2QgZWFmMjBlNjkzM2RjCj4+IAo+
PiAjMTAgIGdpdCBiaXNlY3QgZ29vZCA2M2U4ZGNkYjRmOGUKPj4gCj4+ICMxMSAgZ2l0IGJpc2Vj
dCBnb29kIDM5NzA0OWEwMzAyMgo+PiAKPj4gSeKAmXZlIHJlc3RhcnRlZCB0aGUgYmlzZWN0IHdp
dGhvdXQgYXBwZW5kaW5nIHRoZSAgPGNvbW1pdC1pZD4gYWZ0ZXIgYSAgdGhlIOKAnGJhZHxnb29k
IOKAnCAgLCAgYW5kIHNvIGZhciBnaXQgIGlzIHNob3dpbmcgdGhlIHNhbWUgc2VsZWN0aW9ucy4g
CgoKPT09PT09PT0gc25pcCA9PT09PT09PQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
