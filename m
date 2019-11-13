Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E49FB912
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0D6EE3E;
	Wed, 13 Nov 2019 19:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8276EE3E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 19:44:36 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADJTF2O170791;
 Wed, 13 Nov 2019 19:44:36 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2w5ndqeuek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 19:44:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADJXP4f122965;
 Wed, 13 Nov 2019 19:44:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2w8g182x1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 19:44:35 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xADJiYWa022132;
 Wed, 13 Nov 2019 19:44:34 GMT
Received: from dhcp-10-154-116-22.vpn.oracle.com (/10.154.116.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Nov 2019 11:44:34 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <E0E19A1E-8546-4A94-88D0-C6AA6E20280A@oracle.com>
Date: Wed, 13 Nov 2019 13:44:32 -0600
Message-Id: <3452CC40-9A21-45A8-99D1-87B313A55A04@oracle.com>
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
 <E0E19A1E-8546-4A94-88D0-C6AA6E20280A@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130161
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=+xjuoe0iuDSfAIxaqQZRCTi5JXEfZLjs9XA8rfBFskA=;
 b=XV5S9JoEPcnJFpxbnOsnwP7JCDczDJEGC2C2vYxZsvBjW6zfMqzjfOOn5wu9jc3uH27Q
 IvRHrfXYca+iVzbNPRWS3JKZLa9oNK8Yy9mNrRHdStbhXwBAdxBPeWMfsKxZvezQYB+t
 EB92myNrEXuX7BdpHEGc0QsqtnEKiGsfrEk/qLkZpnUqNmOfQwlt65CwPvCVK6LpY0G3
 5vJziIB/ZedCrA/GHzfunWTGvLAucXJ1srRv+mkxUfJYFW4hdO7CdvmgkRkEiREL8f6K
 4lMkWN2GeGXgBsmueIJvBp5XGsqR2Mdp/D7+yMPOgujqQ0zrLPGzV2C9MpnqCsripI0U qg== 
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

Cgo+IE9uIE5vdiAxMywgMjAxOSwgYXQgMTE6NDIgQU0sIEpvaG4gRG9ubmVsbHkgPGpvaG4ucC5k
b25uZWxseUBvcmFjbGUuY29tPiB3cm90ZToKPiAKPiBIaSBUaG9tYXM6ICBTZWUgYmVsb3cgCj4g
Cj4+IE9uIE5vdiAxMywgMjAxOSwgYXQgMjoxNyBBTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+PiAKPj4gSGkgSm9obgo+PiAKPj4gQW0gMTIuMTEuMTkg
dW0gMjA6MTMgc2NocmllYiBKb2huIERvbm5lbGx5Ogo+Pj4gCj4+PiBJbiBzaG9ydCAuICBJIHN0
YXJ0ZWQgICB3aXRoIDoKPj4+IAo+Pj4gZ2l0IGJpc2VjdCBzdGFydCAKPj4+IAo+Pj4gZ2l0IGJp
c2VjdCBiYWQgYmU4NDU0YWZjNTBmCj4+PiAKPj4+IGdpdCBiaXNlY3QgZ29vZCBmZWM4OGFiMGFm
OTcKPj4+IAo+Pj4gQW5kIGF0IHRoZSAgdGhlIGVuZCBvZiAgIGJpc2VjdHMgIHNob3dlZCB0aGlz
IHdhcyB0aGUgb2ZmZW5kaW5nIGNvbW1pdCA6Cj4+PiAKPj4+IGMwYTc0YzczMjU2OCAKPj4+IAo+
Pj4gY29tbWl0IGMwYTc0YzczMjU2OGFkMzQ3ZjdiM2RlMjgxOTIyODA4ZGFiMzA1MDQgKHJlZnMv
YmlzZWN0L2JhZCkKPj4+IEF1dGhvcjogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNv
bT4KPj4+IERhdGU6ICAgRnJpIE1heSAyNCAyMDozNToyMiAyMDE5ICswMzAwCj4+PiAKPj4+ICAg
ZHJtL2k5MTU6IFVwZGF0ZSBEUklWRVJfREFURSB0byAyMDE5MDUyNAo+Pj4gCj4+PiAgIFNpZ25l
ZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+PiAKPj4+IFRo
YXQgZG9lcyBub3QgaGF2ZSBhbnkgcmVhbCByZWxldmFuY2UKPj4gCj4+IE5vLCB0aGF0IGRvZXNu
J3QgbG9vayByaWdodC4gVGhlIG90aGVyIGJhZCBjb21taXRzIHlvdSBsaXN0IGJlbG93IGFsc28K
Pj4gZG9uJ3Qgc2VlbSB0byBiZSByZWxhdGVkLgo+IAo+IAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91
ciBwYXRpZW5jZSA7ICBJICBzdGFydGVkIG92ZXIgYW5kIHRoZSBiaXNlY3QgdG9vayB0byBtZSB0
byAgdGhpcyBjaGFuZ2UgdGhhdCBjZXJ0YWlubHkgcmVmbGVjdHMgdGhlIGJlaGF2aW9yIEkgYW0g
c2VlaW5nIDoKPiAKPiBjb21taXQgODFkYTg3ZjYzYTFlZGViY2Y4Y2JiODExZDM4N2UzNTNkOWY4
OWM3YSAocmVmcy9iaXNlY3QvYmFkKQo+IEF1dGhvcjogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4gRGF0ZTogICBUdWUgTWF5IDIxIDEzOjA4OjI5IDIwMTkgKzAyMDAK
PiAKPiAgICBkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBr
dW5tYXAgKyB1bnBpbgo+IAo+ICAgIFRoZSBwdXNoLXRvLXN5c3RlbSBmdW5jdGlvbiBmb3JjZXMg
YSBidWZmZXIgb3V0IG9mIHZpZGVvIFJBTS4gVGhpcyBkZWNpc2lvbgo+ICAgIHNob3VsZCByYXRo
ZXIgYmUgbWFkZSBieSB0aGUgbWVtb3J5IG1hbmFnZXIuIEJ5IHJlcGxhY2luZyB0aGUgZnVuY3Rp
b24gd2l0aAo+ICAgIGNhbGxzIHRvIHRoZSBrdW5tYXAgYW5kIHVucGluIGZ1bmN0aW9ucywgdGhl
IGJ1ZmZlcidzIG1lbW9yeSBiZWNvbWVzIGF2YWlsYWJsZSwKPiAgICBidXQgdGhlIGJ1ZmZlciBy
ZW1haW5zIGluIFZSQU0gdW50aWwgaXQncyBldmljdGVkIGJ5IGEgcGluIG9wZXJhdGlvbi4KPiAK
PiAgICBUaGlzIHBhdGNoIHJlcGxhY2VzIHRoZSByZW1haW5pbmcgaW5zdGFuY2VzIG9mIGRybV9n
ZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpCj4gICAgaW4gYXN0IGFuZCBtZ2FnMjAwLCBhbmQgcmVt
b3ZlcyB0aGUgZnVuY3Rpb24gZnJvbSBEUk0uCj4gCj4gCj4gTXkgMXN0IGltcHJlc3Npb24gaXMg
d2UgbmVlZCBhIG1ldGhvZCAgdGhhdCByZXN0b3JlcyB0aGUgcHJldmlvdXMgYmVoYXZpb3IgdGhh
dCBwdXNoZXMgdGhlIGNvbnRlbnQgdG8gdGhlIGRldmljZSAuICAgIAoKSXQgYXBwZWFycyAgbWFu
eSBvZiB0aGUgY29kZSBjaGFuZ2VzICB0aGF0IHdlcmUgaW52b2x2ZWQgaW4gODFkYTg3ZjYzYTEg
KCBhYm92ZSApIGhhdmUgYmVlbiBzdXBlcnNlZGVkIGJ5IDoKCgoKY29tbWl0IDVkMTc3MTg5OTcz
NjdjNDM1ZGJlNTM0MWE4ZTI3MGQ5YjE5NDc4ZDMKQXV0aG9yOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KRGF0ZTogICBUaHUgSnVuIDI3IDEwOjA5OjA5IDIwMTkgKzAy
MDAKCiAgICBkcm0vbWdhZzIwMDogUmVwbGFjZSBzdHJ1Y3QgbWdhX2ZyYW1lYnVmZmVyIHdpdGgg
R0VNIGZyYW1lYnVmZmVyIGhlbHBlcnMKCkFyZSB0aGVyZSBhbnkgb3RoZXIgbWV0aG9kcyAgKHRv
b2xzICkgeW91IGNvdWxkIHJlY29tbWVuZCAgb3V0c2lkZSBvZiBzdGFydGluZyBHbm9tZSB0aGF0
IEkgY291bGQgdXNlIHRvIGdldCBhIGRpc3BsYXkgYWN0aXZpdHkgIHNob3duIG9uIHRoZSBjb25z
b2xlID8KICAgIAoKPT09LiBzbmlwcGVkID09PSAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
