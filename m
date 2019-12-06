Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A611572F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 19:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580A86FA7D;
	Fri,  6 Dec 2019 18:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCE56FA7D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 18:33:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB6IT5ZH032279;
 Fri, 6 Dec 2019 18:33:11 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2wkh2rwn5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Dec 2019 18:33:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB6ITlwr097481;
 Fri, 6 Dec 2019 18:31:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2wqm0sya7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Dec 2019 18:31:10 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB6IUxn5026531;
 Fri, 6 Dec 2019 18:30:59 GMT
Received: from dhcp-10-154-131-158.vpn.oracle.com (/10.154.131.158)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Dec 2019 10:30:59 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH] drm/mgag200: Flag all G200 SE A machines as broken wrt
 <startadd>
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <20191206100426.anifpqwckuutxxt4@sirius.home.kraxel.org>
Date: Fri, 6 Dec 2019 12:30:56 -0600
Message-Id: <3275C55D-3031-4EBC-9A76-FC0CC0B9CA02@oracle.com>
References: <20191206081901.9938-1-tzimmermann@suse.de>
 <20191206100426.anifpqwckuutxxt4@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9463
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912060150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9463
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912060150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=sAEdw5Q/wvkCrDPbNNSx1a8zJTAVHvqJibGlwhRhhnw=;
 b=d2oi0D+1ml5n6QkteGnMp9C6oEEOrKiU0BNBzQ12PqYgNt/d67CCtCXjsHPh/ZXjQOfS
 bZjvEsuNAXaNpoABFXrIFWfJPspTBlLItOQLJB/uXYeG3tGEPGIC/WDTPtOFfrZpcl1w
 hkhWbB2QN2h6hNgTjXhk1B6F/CmKCGv6ash9DXsVl8sBSZoynJ1c46VSkAaukacb2BFR
 wTYayp/77ReSsTQWC96bFjnQBi8E/TxdGbpYJLp+YZQD+IMKVkpbZKszwnZPeijdSr3u
 KUtisYg6F8u8pRiNg1t57W2O9GbWseJdKljmqacFIEuIFDr18g9Xg2cT3QECRNBz2Dqs Pw== 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, stable@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, airlied@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIERlYyA2LCAyMDE5LCBhdCA0OjA0IEFNLCBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gCj4+IFNldmVyYWwgTUdBIEcyMDAgU0UgbWFjaGluZXMgZG9uJ3Qg
cmVzcGVjdCB0aGUgdmFsdWUgb2YgdGhlIHN0YXJ0YWRkCj4+IHJlZ2lzdGVyIGZpZWxkLiBBZnRl
ciBtb3JlIGZlZWRiYWNrIG9uIGFmZmVjdGVkIG1hY2hpbmVzLCBuZWl0aGVyIFBDSQo+PiBzdWJ2
ZW5kb3IgSUQgbm9yIHRoZSBpbnRlcm5hbCBJRCBzZWVtIHRvIGhpbnQgdG93YXJkcyB0aGUgYnVn
LiBBbGwKPj4gYWZmZWN0ZWQgbWFjaGluZXMgaGF2ZSBhIFBDSSBJRCBvZiAweDA1MjIgKGkuZS4s
IEcyMDAgU0UgQSkuIEl0IHdhcwo+PiBkZWNpZGVkIHRvIGZsYWcgYWxsIEcyMDAgU0UgQSBtYWNo
aW5lcyBhcyBicm9rZW4uCj4gCj4+IC0JeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MjIsIFBD
SV9WRU5ET1JfSURfU1VOLCAweDQ4NTIsIDAsIDAsCj4+ICsJeyBQQ0lfVkVORE9SX0lEX01BVFJP
WCwgMHg1MjIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsCj4+IAkJRzIwMF9TRV9BIHwg
TUdBRzIwMF9GTEFHX0hXX0JVR19OT19TVEFSVEFERH0sCj4+IC0JeyBQQ0lfVkVORE9SX0lEX01B
VFJPWCwgMHg1MjIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcyMDBfU0VfQSB9LAo+
IAo+IEFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCgoKVGVzdGVk
LWJ5OiBKb2huIERvbm5lbGx5IDxKb2huLnAuZG9ubmVsbHlAb3JhY2xlLmNvbT4KCgoKVGhpcyBz
ZXJpZXMgb2YgY29tbWl0cyBhcHBlYXIgdG8gcmVzb2x2ZSB0aGUgZGlzcGxheSBpc3N1ZSAgaW4g
NS40Li1yYzggYXMgcmVwb3J0ZWQgaW4gOgoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9taXNjL2lzc3Vlcy83CgoKNTJjYTIyZGFhZGJiIDIwMTktMTItMDYgfCBkcm0vbWdhZzIw
MDogRmxhZyBhbGwgRzIwMCBTRSBBIG1hY2hpbmVzIGFzIGJyb2tlbiB3cnQgPHN0YXJ0YWRkPgpl
MGYxYTQxYTQ1YjMgMjAxOS0xMi0wNiB8IGRybS9tZ2FnMjAwOiBBZGQgd29ya2Fyb3VuZCBmb3Ig
SFcgdGhhdCBkb2VzIG5vdCBzdXBwb3J0ICdzdGFydGFkZCcKMTFhMjE5YTM4ZjJkIDIwMTktMTIt
MDYgfCBkcm0vbWdhZzIwMDogU3RvcmUgZmxhZ3MgZnJvbSBQQ0kgZHJpdmVyIGRhdGEgaW4gZGV2
aWNlIHN0cnVjdHVyZQphMjM1MTJhY2UwMDggMjAxOS0xMi0wNiB8IGRybS9tZ2FnMjAwOiBFeHRy
YWN0IGRldmljZSB0eXBlIGZyb20gZmxhZ3MKClRoZXJlIGlzIG9uZSBjb21taXQgSSBkaWQgIG5v
dCBhcHBseSA6CgpbUEFUQ0ggdjJdIGRybS9tZ2FnMjAwOiBBZGQgbW9kdWxlIHBhcmFtZXRlciB0
byBwaW4gYWxsIGJ1ZmZlcnMgYXQgb2Zmc2V0IDAKCkkgZG9u4oCZdCBzZWUgYSBuZWVkIGZvciB0
aGF0IG5vdyBzaW5jZSB3ZSB1c2luZyB0aGUgUENJLUlEIG9mIDB4NTIyIGZvciB0aGUgZml4LiAg
CgoKCj4gCj4gY2hlZXJzLAo+ICBHZXJkCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNv
bS92Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMuZnJlZWRlc2t0b3Aub3JnX21haWxtYW5fbGlzdGlu
Zm9fZHJpLTJEZGV2ZWwmZD1Ed0lHYVEmYz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhCdjdxSXJN
VUI2NWVhcElfSm5FJnI9dDJmUGc5RDg3RjdEOGptMF8zQ0c5eW9pSUtkUmc0cWNfdGhCdzRiek1o
YyZtPWNGWW1CNjJsZ0gzV29PV1p1dmdNS2pzZ01YUVVzY21yeXBEbFFoWXBGX0Umcz0yMVpFWm9o
RlpCUXNFcjVibzNzUzRwTXBDZjJjYTVLWEZKcTVYM1hVelF3JmU9CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
