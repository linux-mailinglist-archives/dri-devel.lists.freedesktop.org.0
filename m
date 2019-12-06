Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D347F114A49
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 01:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7C6F93A;
	Fri,  6 Dec 2019 00:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941C36F93A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 00:50:56 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB60nBgV150539;
 Fri, 6 Dec 2019 00:50:33 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2wkgcqrhwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Dec 2019 00:50:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB60nDUK179321;
 Fri, 6 Dec 2019 00:50:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2wqcbb94bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Dec 2019 00:50:30 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB60m7ve011284;
 Fri, 6 Dec 2019 00:48:08 GMT
Received: from dhcp-10-154-176-80.vpn.oracle.com (/10.154.176.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 05 Dec 2019 16:48:06 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: FAILED - [PATCH v2 3/3] drm/mgag200: Add workaround for HW that
 does not support 'startadd'
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <53967A49-E729-409B-8FDD-019160FFF675@oracle.com>
Date: Thu, 5 Dec 2019 18:48:04 -0600
Message-Id: <68E1D255-8E73-4112-B966-AFE851389A34@oracle.com>
References: <20191126101529.20356-4-tzimmermann@suse.de>
 <20191128142337.1B32A217F5@mail.kernel.org>
 <53967A49-E729-409B-8FDD-019160FFF675@oracle.com>
To: Sasha Levin <sashal@kernel.org>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9462
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912060005
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9462
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912060005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=eFjcBwaYno7mPdQmIPpkjK+tyUgpp/REt++lLVi//+M=;
 b=nqvJn1n4CWUYTPjfwN+cW8s1CoYKg5/eEwU2Gfgfaou///DgSost/JLrLfF/vF0cEpbl
 tUGKG+0PV7HLuaj9HisXvKTT//+zN3GBHocUeK4rlmfU+CcEy34dBTFTRJhrnIzk/Z7W
 k4ozT0fggRH9+sVl7z82Bz+rNisCFBL0qEROLCCXELe4+D8IpkS9lk2FDyMmfARl0WiA
 i8oX1Q91KB+UpwmZ3bu+NfGHWDWtGi7FCd3KpfocnYLJX547o0Dx9a+UwYSs7nuykbm1
 zRiIa2YSbzoOkqm9D6nDXeDtoXWu0FLHlqvLhnwrl9WAjBPWTnUDC42xE8SbzPLWmCx3 ew== 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 stable@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 airlied@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIERlYyAzLCAyMDE5LCBhdCAxMTozMCBBTSwgSm9obiBEb25uZWxseSA8am9obi5wLmRv
bm5lbGx5QG9yYWNsZS5jb20+IHdyb3RlOgo+IAo+IAo+IEhlbGxvIFNhc2hhIGFuZCBUaG9tYXMg
LAo+IAo+IAo+IFRoaXMgcGFydGljdWxhciBwYXRjaCBoYXMgZmFpbGVkIG9uIG9uZSBjbGFzcyBv
ZiBzZXJ2ZXJzIHRoYXQgaGFzIGEgc2xpZ2h0bHkgZGlmZmVyZW50IFN1biBWZW5kb3IuIElEIGZv
ciAgdGhlIEJNQyB2aWRlbyBkZXZpY2U6IAo+IAo+IEkgd2lsbCBmb2xsb3cgdXAgd2l0aCBhZGRp
dGlvbmFsIGRldGFpbHMgaW4gIHRoZSByZXZpZXcgY29tbWVudHMgZm9yIHRoZSBvcmlnaW5hbCBt
ZXNzYWdlLC4gCj4gCj4gCj4gCj4gCj4+IE9uIE5vdiAyOCwgMjAxOSwgYXQgODoyMyBBTSwgU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPiB3cm90ZToKPj4gCj4+IEhpLAo+PiAKPj4gW1Ro
aXMgaXMgYW4gYXV0b21hdGVkIGVtYWlsXQo+PiAKPj4gVGhpcyBjb21taXQgaGFzIGJlZW4gcHJv
Y2Vzc2VkIGJlY2F1c2UgaXQgY29udGFpbnMgYSAiRml4ZXM6IiB0YWcsCj4+IGZpeGluZyBjb21t
aXQ6IDgxZGE4N2Y2M2ExZSAoImRybTogUmVwbGFjZSBkcm1fZ2VtX3ZyYW1fcHVzaF90b19zeXN0
ZW0oKSB3aXRoIGt1bm1hcCArIHVucGluIikuCj4+IAo+PiBUaGUgYm90IGhhcyB0ZXN0ZWQgdGhl
IGZvbGxvd2luZyB0cmVlczogdjUuMy4xMy4KPj4gCj4+IHY1LjMuMTM6IEJ1aWxkIGZhaWxlZCEg
RXJyb3JzOgo+PiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmM6MTA0OjE4
OiBlcnJvcjog4oCYZHJtX3ZyYW1fbW1fZGVidWdmc19pbml04oCZIHVuZGVjbGFyZWQgaGVyZSAo
bm90IGluIGEgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYZHJtX2NsaWVudF9kZWJ1Z2ZzX2lu
aXTigJk/Cj4+IAoKCiAgIEkgaGFkIHRoaXMgc2FtZSBpc3N1ZSBhbmQgcmVtb3ZlZCB0aGF0IGZy
b20gbXkgbG9jYWwgNS40LjAtcmM4IGJ1aWxkIAoKCgoKPj4gCj4+IE5PVEU6IFRoZSBwYXRjaCB3
aWxsIG5vdCBiZSBxdWV1ZWQgdG8gc3RhYmxlIHRyZWVzIHVudGlsIGl0IGlzIHVwc3RyZWFtLgo+
PiAKPj4gSG93IHNob3VsZCB3ZSBwcm9jZWVkIHdpdGggdGhpcyBwYXRjaD8KPj4gCj4+IC0tIAo+
PiBUaGFua3MsCj4+IFNhc2hhCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIv
dXJsP3U9aHR0cHMtM0FfX2xpc3RzLmZyZWVkZXNrdG9wLm9yZ19tYWlsbWFuX2xpc3RpbmZvX2Ry
aS0yRGRldmVsJmQ9RHdJR2FRJmM9Um9QMVl1bUNYQ2dhV0h2bFpZUjhQWmg4QnY3cUlyTVVCNjVl
YXBJX0puRSZyPXQyZlBnOUQ4N0Y3RDhqbTBfM0NHOXlvaUlLZFJnNHFjX3RoQnc0YnpNaGMmbT12
eE1ET0xWNzdyUmUyZWtkTkZIOUl4TVNCUXJUY2NsdFpkOEExSDZ4WUNjJnM9ZWZIczJsY19SUVl2
ekxDODJjLUQzd2E4TXBYNURDVV9Zc0lvNlhydUFRZyZlPQo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
