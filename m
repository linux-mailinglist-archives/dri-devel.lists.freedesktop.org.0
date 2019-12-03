Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA131110380
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A716EA25;
	Tue,  3 Dec 2019 17:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671096EA29
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:31:31 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3HOOFd050929;
 Tue, 3 Dec 2019 17:31:08 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2wkh2r94xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 17:31:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3HSt0L077617;
 Tue, 3 Dec 2019 17:31:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2wn4qqa5u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 17:31:08 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB3HUtGf030441;
 Tue, 3 Dec 2019 17:30:55 GMT
Received: from dhcp-10-154-129-170.vpn.oracle.com (/10.154.129.170)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Dec 2019 09:30:55 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: FAILED - [PATCH v2 3/3] drm/mgag200: Add workaround for HW that
 does not support 'startadd'
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <20191128142337.1B32A217F5@mail.kernel.org>
Date: Tue, 3 Dec 2019 11:30:50 -0600
Message-Id: <53967A49-E729-409B-8FDD-019160FFF675@oracle.com>
References: <20191126101529.20356-4-tzimmermann@suse.de>
 <20191128142337.1B32A217F5@mail.kernel.org>
To: Sasha Levin <sashal@kernel.org>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912030131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912030131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=iDDV1MNXRn9oPYn0jG/x5P+zH4XXxCnPUsxhYkfKBRE=;
 b=jdb47o9DjrlFKzU7xs7IZLvdvbVXpL7joCaJovJUo34Rwo3nt+dXtZCENMkqcr5cEuNX
 R8UL34ozv/cmu4hvn907uzLRkutls789KxXGAvYer89ymxKvxBsUGZHw3bi4W8+ej3Yt
 gvJn6xgPoG8w5l8+b53uksJsZfm2Atm99tUhykFeSIi51W15uHRr8+qLRZmMsHUE1Bkz
 86GPFuqZaBYHOJI1LB8/oVBJ0ak+goaI/s1Cq9eXgMlxvU0upqzbBpvtVy/B2M49/DH+
 XBSg81/orEwNqzlo/6na0gegiBEBHCg13sch/sos6bk3jAJbfTJkRiXjhcTm4ZyXYkJB mQ== 
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

CkhlbGxvIFNhc2hhIGFuZCBUaG9tYXMgLAoKClRoaXMgcGFydGljdWxhciBwYXRjaCBoYXMgZmFp
bGVkIG9uIG9uZSBjbGFzcyBvZiBzZXJ2ZXJzIHRoYXQgaGFzIGEgc2xpZ2h0bHkgZGlmZmVyZW50
IFN1biBWZW5kb3IuIElEIGZvciAgdGhlIEJNQyB2aWRlbyBkZXZpY2U6IAoKSSB3aWxsIGZvbGxv
dyB1cCB3aXRoIGFkZGl0aW9uYWwgZGV0YWlscyBpbiAgdGhlIHJldmlldyBjb21tZW50cyBmb3Ig
dGhlIG9yaWdpbmFsIG1lc3NhZ2UsLiAKCgoKCj4gT24gTm92IDI4LCAyMDE5LCBhdCA4OjIzIEFN
LCBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+IEhpLAo+IAo+IFtU
aGlzIGlzIGFuIGF1dG9tYXRlZCBlbWFpbF0KPiAKPiBUaGlzIGNvbW1pdCBoYXMgYmVlbiBwcm9j
ZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKPiBmaXhpbmcgY29tbWl0
OiA4MWRhODdmNjNhMWUgKCJkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVt
KCkgd2l0aCBrdW5tYXAgKyB1bnBpbiIpLgo+IAo+IFRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9s
bG93aW5nIHRyZWVzOiB2NS4zLjEzLgo+IAo+IHY1LjMuMTM6IEJ1aWxkIGZhaWxlZCEgRXJyb3Jz
Ogo+ICAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmM6MTA0OjE4OiBlcnJv
cjog4oCYZHJtX3ZyYW1fbW1fZGVidWdmc19pbml04oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGlu
IGEgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYZHJtX2NsaWVudF9kZWJ1Z2ZzX2luaXTigJk/
Cj4gCj4gCj4gTk9URTogVGhlIHBhdGNoIHdpbGwgbm90IGJlIHF1ZXVlZCB0byBzdGFibGUgdHJl
ZXMgdW50aWwgaXQgaXMgdXBzdHJlYW0uCj4gCj4gSG93IHNob3VsZCB3ZSBwcm9jZWVkIHdpdGgg
dGhpcyBwYXRjaD8KPiAKPiAtLSAKPiBUaGFua3MsCj4gU2FzaGEKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly91cmxkZWZlbnNlLnBy
b29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19saXN0cy5mcmVlZGVza3RvcC5vcmdfbWFp
bG1hbl9saXN0aW5mb19kcmktMkRkZXZlbCZkPUR3SUdhUSZjPVJvUDFZdW1DWENnYVdIdmxaWVI4
UFpoOEJ2N3FJck1VQjY1ZWFwSV9KbkUmcj10MmZQZzlEODdGN0Q4am0wXzNDRzl5b2lJS2RSZzRx
Y190aEJ3NGJ6TWhjJm09dnhNRE9MVjc3clJlMmVrZE5GSDlJeE1TQlFyVGNjbHRaZDhBMUg2eFlD
YyZzPWVmSHMybGNfUlFZdnpMQzgyYy1EM3dhOE1wWDVEQ1VfWXNJbzZYcnVBUWcmZT0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
