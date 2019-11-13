Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD29FBAEA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 22:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EB56EE7D;
	Wed, 13 Nov 2019 21:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747E16EE7D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:36:44 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADLYHZu081883;
 Wed, 13 Nov 2019 21:36:42 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2w5ndqfdct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 21:36:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADLSAkK145999;
 Wed, 13 Nov 2019 21:34:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2w7vbdmkra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 21:34:41 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xADLYeJZ011509;
 Wed, 13 Nov 2019 21:34:41 GMT
Received: from dhcp-10-154-116-22.vpn.oracle.com (/10.154.116.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Nov 2019 13:34:40 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <CAKMK7uEp6ZcHfMi6zcDamaAikbPGQ5ED+VHwUd+Ysv2SMcrgew@mail.gmail.com>
Date: Wed, 13 Nov 2019 15:34:38 -0600
Message-Id: <9E52C102-B6E9-43C2-BAA5-E3197F053024@oracle.com>
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
 <CAKMK7uEp6ZcHfMi6zcDamaAikbPGQ5ED+VHwUd+Ysv2SMcrgew@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130178
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=h2ig+WVGd2SYTuqeJV1tJ/T+ulKpCoFzSeFF4dz4f2A=;
 b=r3oFJbTRUEtHH5p997gGBkbW6sGgJ0/c989CWwdVfE0ZsjlqCnW3ZxvqM7PSA7UN1dfP
 PyAZ7LUJXBHsxuND5rZsbl7MqAbih0jhJ7tmUTSjhMwkxMGxLRwtFr7hUvlFXQUmELTZ
 X4pzbhiv6MBEBeXXhK8HeRWdIQuo7em8WCXCxFhyMD/sy8VdCiW873I4mDNmpJQMMKCo
 gFPfEDqhbuBJ+TpKLP6buqyPyk5dbIcJYr957sarue2w69GYSuSuSqlJljCvgFieSCTN
 jeEvA7wvn+dLFr3+vTsdTybsTikoX4M1HgwhRItZoSe8Q/VSGaW6xHhUrEu2aSp5T9ho zA== 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, allen <allen.pais@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIE5vdiAxMywgMjAxOSwgYXQgMjowNiBQTSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPiAKPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCA2OjQyIFBNIEpvaG4g
RG9ubmVsbHkKPiA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+IHdyb3RlOgo+PiAKPj4gSGkg
VGhvbWFzOiAgU2VlIGJlbG93Cj4+IAo+Pj4gT24gTm92IDEzLCAyMDE5LCBhdCAyOjE3IEFNLCBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4+PiAKPj4+IEhp
IEpvaG4KPj4+IAo+Pj4gQW0gMTIuMTEuMTkgdW0gMjA6MTMgc2NocmllYiBKb2huIERvbm5lbGx5
Ogo+Pj4+IAo+Pj4+IEluIHNob3J0IC4gIEkgc3RhcnRlZCAgIHdpdGggOgo+Pj4+IAo+Pj4+IGdp
dCBiaXNlY3Qgc3RhcnQKPj4+PiAKPj4+PiBnaXQgYmlzZWN0IGJhZCBiZTg0NTRhZmM1MGYKPj4+
PiAKPj4+PiBnaXQgYmlzZWN0IGdvb2QgZmVjODhhYjBhZjk3Cj4+Pj4gCj4+Pj4gQW5kIGF0IHRo
ZSAgdGhlIGVuZCBvZiAgIGJpc2VjdHMgIHNob3dlZCB0aGlzIHdhcyB0aGUgb2ZmZW5kaW5nIGNv
bW1pdCA6Cj4+Pj4gCj4+Pj4gYzBhNzRjNzMyNTY4Cj4+Pj4gCj4+Pj4gY29tbWl0IGMwYTc0Yzcz
MjU2OGFkMzQ3ZjdiM2RlMjgxOTIyODA4ZGFiMzA1MDQgKHJlZnMvYmlzZWN0L2JhZCkKPj4+PiBB
dXRob3I6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+Pj4gRGF0ZTogICBG
cmkgTWF5IDI0IDIwOjM1OjIyIDIwMTkgKzAzMDAKPj4+PiAKPj4+PiAgIGRybS9pOTE1OiBVcGRh
dGUgRFJJVkVSX0RBVEUgdG8gMjAxOTA1MjQKPj4+PiAKPj4+PiAgIFNpZ25lZC1vZmYtYnk6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+Pj4gCj4+Pj4gVGhhdCBkb2VzIG5v
dCBoYXZlIGFueSByZWFsIHJlbGV2YW5jZQo+Pj4gCj4+PiBObywgdGhhdCBkb2Vzbid0IGxvb2sg
cmlnaHQuIFRoZSBvdGhlciBiYWQgY29tbWl0cyB5b3UgbGlzdCBiZWxvdyBhbHNvCj4+PiBkb24n
dCBzZWVtIHRvIGJlIHJlbGF0ZWQuCj4+IAo+PiAKPj4gCj4+IFRoYW5rIHlvdSBmb3IgeW91ciBw
YXRpZW5jZSA7ICBJICBzdGFydGVkIG92ZXIgYW5kIHRoZSBiaXNlY3QgdG9vayB0byBtZSB0byAg
dGhpcyBjaGFuZ2UgdGhhdCBjZXJ0YWlubHkgcmVmbGVjdHMgdGhlIGJlaGF2aW9yIEkgYW0gc2Vl
aW5nIDoKPj4gCj4+IGNvbW1pdCA4MWRhODdmNjNhMWVkZWJjZjhjYmI4MTFkMzg3ZTM1M2Q5Zjg5
YzdhIChyZWZzL2Jpc2VjdC9iYWQpCj4+IEF1dGhvcjogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4+IERhdGU6ICAgVHVlIE1heSAyMSAxMzowODoyOSAyMDE5ICswMjAw
Cj4+IAo+PiAgICBkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0
aCBrdW5tYXAgKyB1bnBpbgo+PiAKPj4gICAgVGhlIHB1c2gtdG8tc3lzdGVtIGZ1bmN0aW9uIGZv
cmNlcyBhIGJ1ZmZlciBvdXQgb2YgdmlkZW8gUkFNLiBUaGlzIGRlY2lzaW9uCj4+ICAgIHNob3Vs
ZCByYXRoZXIgYmUgbWFkZSBieSB0aGUgbWVtb3J5IG1hbmFnZXIuIEJ5IHJlcGxhY2luZyB0aGUg
ZnVuY3Rpb24gd2l0aAo+PiAgICBjYWxscyB0byB0aGUga3VubWFwIGFuZCB1bnBpbiBmdW5jdGlv
bnMsIHRoZSBidWZmZXIncyBtZW1vcnkgYmVjb21lcyBhdmFpbGFibGUsCj4+ICAgIGJ1dCB0aGUg
YnVmZmVyIHJlbWFpbnMgaW4gVlJBTSB1bnRpbCBpdCdzIGV2aWN0ZWQgYnkgYSBwaW4gb3BlcmF0
aW9uLgo+PiAKPj4gICAgVGhpcyBwYXRjaCByZXBsYWNlcyB0aGUgcmVtYWluaW5nIGluc3RhbmNl
cyBvZiBkcm1fZ2VtX3ZyYW1fcHVzaF90b19zeXN0ZW0oKQo+PiAgICBpbiBhc3QgYW5kIG1nYWcy
MDAsIGFuZCByZW1vdmVzIHRoZSBmdW5jdGlvbiBmcm9tIERSTS4KPiAKPiBZZWFoIHRoYXQgbG9v
a3MgYSBsb3QgbW9yZSBwbGF1c2libGUgYXMgdGhlIGN1bHByaXQuCj4gCj4+IE15IDFzdCBpbXBy
ZXNzaW9uIGlzIHdlIG5lZWQgYSBtZXRob2QgIHRoYXQgcmVzdG9yZXMgdGhlIHByZXZpb3VzIGJl
aGF2aW9yIHRoYXQgcHVzaGVzIHRoZSBjb250ZW50IHRvIHRoZSBkZXZpY2UgLgo+IAo+IENhbiB5
b3UgcGxzIGdyYWIgdGhlIGRlYnVnc2ZzIGZvciB0aGUgYWJvdmUgYnJva2VuIGtlcm5lbCAod2l0
aG91dCBhbnkKPiBvZiB0aGUgbGF0ZXIgcmV3b3JrcyBvbiB0b3ApLCBib3RoIGZvciBjb25zb2xl
IG1vZGUgYW5kIGFmdGVyIHlvdQo+IHN0YXJ0ZWQgZ25vbWUuIFBsdXMgSSBndWVzcyBib290aW5n
IHdpdGggZHJtLmRlYnVnPTB4ZmUgYW5kIGZ1bGwgZG1lc2cKPiAocGxlYXNlIG5vdGUgdGhlIHRp
bWVzdGFtcCB3aGVuIHlvdSBzdGFydGVkIGdub21lLCB0aGF0IGhlbHBzIHdpdGgKPiBzaWZ0aW5n
IHRocm91Z2ggaXQgYWxsLCBpdCdzIGdvaW5nIHRvIGJlIGEgbG90KS4gWW91IG1pZ2h0IG5lZWQg
dG8KPiBncmFiIHRoZSBmdWxsIGRtZXNnIGZyb20gbG9ncyBvbiBkaXNrLCBwbGVhc2UgbWFrZSBz
dXJlIGl0IGluY2x1ZGVzCj4gZXZlcnl0aGluZyBmcm9tIGJvb3QtdXAuCj4gCj4gVGhhbmtzLCBE
YW5pZWwKCgogIEhpIAoKIEkgc3RhcnRlZCBhIEJ1Z3ppbGxhIAoKCmh0dHBzOi8vYnVncy5mcmVl
ZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMjI2NQoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
