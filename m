Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B286AF8A40
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332E16EA6F;
	Tue, 12 Nov 2019 08:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2019 11:27:22 UTC
Received: from de-deferred1.bosch-org.com (de-deferred1.bosch-org.com
 [139.15.180.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBE66E8B5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 11:27:22 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
 by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 47BT3N1PkQz7rp
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 12:21:36 +0100 (CET)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
 by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 47BT3H6phlz1XLJTR;
 Mon, 11 Nov 2019 12:21:31 +0100 (CET)
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 47BT3H6X9Tz496;
 Mon, 11 Nov 2019 12:21:31 +0100 (CET)
X-AuditID: 0a3aad16-3a7ff7000000385e-1d-5dc9443b6f82
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id 5B.3A.14430.B3449CD5;
 Mon, 11 Nov 2019 12:21:31 +0100 (CET)
Received: from FE-MBX2052.de.bosch.com (unknown [10.3.231.146])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 47BT3H4VGQzC9W;
 Mon, 11 Nov 2019 12:21:31 +0100 (CET)
Received: from SGPMBX2028.APAC.bosch.com (10.187.83.45) by
 FE-MBX2052.de.bosch.com (10.3.231.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Mon, 11 Nov 2019 12:21:30 +0100
Received: from SGPMBX2024.APAC.bosch.com (10.187.83.44) by
 SGPMBX2028.APAC.bosch.com (10.187.83.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Mon, 11 Nov 2019 19:21:29 +0800
Received: from SGPMBX2024.APAC.bosch.com ([fe80::804e:b424:c437:3fff]) by
 SGPMBX2024.APAC.bosch.com ([fe80::804e:b424:c437:3fff%3]) with mapi id
 15.01.1847.003; Mon, 11 Nov 2019 19:21:29 +0800
From: "Kalakodima Venkata Rajesh (RBEI/ECF3)"
 <VenkataRajesh.Kalakodima@in.bosch.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "horms@verge.net.au" <horms@verge.net.au>,
 "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>
Subject: RE: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Topic: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Index: AQHVg0WU8sl/jGtffUuJZcUH6VN3CqeFyP4w
Date: Mon, 11 Nov 2019 11:21:28 +0000
Message-ID: <e731216a728c4035af88c92b70756197@in.bosch.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.206]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TaVATZxjm290kS8rKshx5pdJpU3tZVMQea+mAdfpjrTrtTMc60wFrKCuk
 hcAk4ID9Uax0CGTscPQg4RAoYKGFIlejHMYgR5hSSgkIWJBqhk7QoWoAwziFJixIfvTPzvO+
 z/s87zHfkjjztXcwqVSl8mqVIlEulhLSN+pDdka8bYkJG24MZc/9ZsHY1bZ8nLUu/iNmLzUu
 SNjZyU6MPdu6iNi+R/US9sGYDrHOkisYm5NfJWFHLpeI2Vb7PMZ2Xzfh7FTjIGJ15+j9vlxx
 5jDBGaeqENe5VE5wlpUiCVes1Yu41fFbOFdX5cQ5c7cWcb8szYi4m7o+jFv6NZ/gSpaXCM7R
 9NR71IfSN+P4ROUpXr078oQ0wal/NmV0Z3pXWwuRiWa35yJvEuhX4Gx7HspFUpKhv8PAMl8q
 EoIfERizGwkhuI/gTE2vWAgcrqDWKBGCawjGl+3IbSamj8FKX/YaEUBPYdDg/EbsJnC6n4DW
 +b1u7E8fgpxbfYQbB9CH4WHNeVzA4aAvKMfcmKCfA8dI1loNRUeAKat4zYehI2H8z761em86
 Cu5nL65hRIdA5UQBIfSSwaTtPCZsR0NVxxAu4ECw314RCfgZKKvW40J9KJS3P1if82WoqbiD
 C339wKK3EXkIDB62Bg+JwUNi8JCUI6IOBWqUYaeSwsPY8F3qWF5zOmzPro+Tk5qQ8GKCjKh6
 4KQZYSQyo1dJTB5I/ftzfwyzJTY5LiNBoUn4SJ2WyGvkwdTnd3NiGP/HaU1abJJSo1Emq8wI
 SFweQBnTXToqTpFxmlcnCzIzepIk5DIqnnw3mqHjFan8pzyfwqs32AiSlAPVsd8Sw/ip+Xg+
 /aQyMXWDlodQyMvLiwnyZDzbYqS3Ge0lfVy9uw64LChNiiJJo4xfl28V5MxGdlM6gA6SefbS
 Spy82lNWiTOEKlnFB8uoS24X2l2fkKZ6PEfwNur9CtdqgR7EptccGkMkkvtTFW6xj+uH3JwA
 qEz30fzWk5ui8EqXhv5LBv0WDOy1ONgmjoM9OxNBmXERQUfWDAH91+0EWLVaEbRZm0Xw1e8V
 YmgszJPAH5cNElipvCGFAt2MFKa1f/tAs7PFF5Y7h31h0TrrC3OrhTR0VAzQ4LTZXJ/Rcj/o
 aGhhYLrVwcCjgpv+kLtcEADWZm0QTFp+kkHZWJMMrLXzAEW1WVvhnrY6eM51W8x1W9Ngr/u2
 qYrU/7ntenZzteBMFB2w7fC+yIbvdS8O+u3udEQden429vgH9XfS6RsHy94qXHid+UI3avrs
 bkCPMvqMLTSu56jBNnJBf/FI7+DYQlLn1ZWjBy5MNN0LH04LOTb2kiEjfV9i1MSX137YfvG2
 SVTneG2lqBIbym/esqoo7TZ921VtPGIfevjCJ1eesE63v3Nix9NyQpOg2LMDV2sU/wHP+3UM
 JwUAAA==
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=in.bosch.com; 
 s=key2-intmail; t=1573471292;
 bh=7XzDe+WseQSWDSgFJTn08UTHwDjcIBssslioIdVvCT4=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=sy3Zc/KtA/us8BN/04chCq6aQFGEjqMFJJAieY5/z+pPRDmppb856HfmVZOBYb0Pn
 w761ZpQ2a7V2WfK21Ekv2f2Ia75aiZb7dtYI8vbz2H66ANJCMiDrGFxNWVhPItLXLf
 nKOdYQFHgalK0vV5dDgwDLxIE/Evyv84ONmMKlPc=
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
Cc: "muroya@ksk.co.jp" <muroya@ksk.co.jp>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "koji.matsuoka.xm@renesas.com" <koji.matsuoka.xm@renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Harsha Manjula Mallikarjun \(RBEI/ECF3\)"
 <Harsha.ManjulaMallikarjun@in.bosch.com>,
 "ezequiel@collabora.com" <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKUGxlYXNlIGZpbmQgY29tbWVudHMgYmVsb3cuCgpCZXN0IHJlZ2FyZHMsCgpS
YWplc2ggS3YKUkJFSS9FQ0YzICAKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9t
OiBsaW51eC1rZXJuZWwtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWwtCj4gb3du
ZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgSmFjb3BvIE1vbmRpCj4gU2VudDogVHVl
c2RheSwgT2N0b2JlciAxNSwgMjAxOSA0OjE2IFBNCj4gVG86IGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbTsKPiBraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb207
IGdlZXJ0QGxpbnV4LW02OGsub3JnOwo+IGhvcm1zQHZlcmdlLm5ldC5hdTsgdWxpK3JlbmVzYXNA
ZnBvbmQuZXU7IEthbGFrb2RpbWEgVmVua2F0YSBSYWplc2gKPiAoUkJFSS9FQ0YzKSA8VmVua2F0
YVJhamVzaC5LYWxha29kaW1hQGluLmJvc2NoLmNvbT4KPiBDYzogSmFjb3BvIE1vbmRpIDxqYWNv
cG8rcmVuZXNhc0BqbW9uZGkub3JnPjsgYWlybGllZEBsaW51eC5pZTsKPiBkYW5pZWxAZmZ3bGwu
Y2g7IGtvamkubWF0c3Vva2EueG1AcmVuZXNhcy5jb207IG11cm95YUBrc2suY28uanA7IEhhcnNo
YQo+IE1hbmp1bGEgTWFsbGlrYXJqdW4gKFJCRUkvRUNGMykgPEhhcnNoYS5NYW5qdWxhTWFsbGlr
YXJqdW5AaW4uYm9zY2guY29tPjsKPiBlemVxdWllbEBjb2xsYWJvcmEuY29tOyBzZWFucGF1bEBj
aHJvbWl1bS5vcmc7IGxpbnV4LXJlbmVzYXMtCj4gc29jQHZnZXIua2VybmVsLm9yZzsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
Zwo+IFN1YmplY3Q6IFtQQVRDSCB2NSAwLzhdIGRybTogcmNhci1kdTogQWRkIENvbG9yIE1hbmFn
ZW1lbnQgTW9kdWxlIChDTU0pCj4gCj4gUmVmZXJlbmNlczoKPiBBIHJlZmVyZW5jZSB0byB0aGUg
djEgY292ZXIgbGV0dGVyLCB3aXRoIHNvbWUgYmFja2dyb3VuZCBvbiB0aGUgQ01NIGlzCj4gYXZh
aWxhYmxlIGhlcmU6Cj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi82LzU4Mwo+IHYyOgo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jLzIwMTkwNzA2MTQwNzQ2
LjI5MTMyLTEwLQo+IGphY29wbytyZW5lc2FzQGptb25kaS5vcmcvCj4gdjM6Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1zb2MvMjAxOTA4MjUxMzUxNTQuMTE0ODgtMS0K
PiBqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnLwo+IHY0Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJlbmVzYXMtc29jLzIwMTkwOTA2MTM1NDM2LjEwNjIyLTEtCj4gamFjb3BvK3Jl
bmVzYXNAam1vbmRpLm9yZy8KPiAKPiBBZ2FpbiwgcXVpdGUgYSBjb25zaXN0ZW50IGNoYW5nZWxv
ZywgbW9zdGx5IGR1ZSB0byB0aGUgZGV2ZWxvcG1lbnRzIGhhcHBlbmVkCj4gb24gRXplcXVpZWwn
cyBWT1AgdW5pdCBmb2xsb3dpbmcgU2VhbidzIGFkdmljZXMuCj4gCj4gSSBoZXJlIGltcGxlbWVu
dGVkIHRoZSBzYW1lLCBhbmQgbW92ZWQgdGhlIENNTSBoYW5kbGluZyB0byB0aGUgY3J0YyBiZWlu
Zwo+IGFuZCBlbmFibGUgY2FsbGJhY2tzLiBBcyBhIHJlc3VsdCB0aGUgb3ZlcmFsbCBpbXBsZW1l
bnRhdGlvbiByZXN1bHRzIHF1aXRlIGEgbG90Cj4gc2ltcGxpZmllZCwgbW9zdGx5IG9uIHRoZSBD
TU0gZHJpdmVyIHNpZGUuCj4gCj4gSSBoYXZlIGRyb3BwZWQgdGFncyBhbmQgYWNrcyBvbiB0aGUg
Q01NIGRyaXZlciBhbmQgQ01NIGVuYWJsZW1lbnQgcGF0Y2hlcwo+IGluIERVIGNydGMgZHJpdmVy
IGJlY2F1c2Ugb2YgdGhlIG51bWJlciBvZiBjaGFuZ2VzLgo+IAo+IEEgbW9yZSBkZXRhaWxlZCBj
aGFuZ2UgbG9nOgo+IAo+IC0gUmViYXNlZCBvbiByZW5lc2FzLWRldmVsLTIwMTktMTAtMDctdjUu
NC1yYzQKPiAKPiAqIEJpbmRpbmdzL0RUCj4gLSBJbmNsdWRlZCBSb2IncyBjb21tZW50cyBvbiB0
aGUgeWFtbCBmaWxlIGxpY2Vuc2UgYW5kIHRoZSB1c2Ugb2YgJ09uZU9mJwo+ICAgaW4gdGhlIGNv
bXBhdGlibGUgcHJvcGVydHkgZGVzY3JpcHRpb24KPiAtIFVzZSB0aGUgYnJhY2tldGVkIHN0eWxl
IHN1Z2dlc3RlZCBieSBLaWVyYW4gZm9yIHRoZSAncmVuZXNhcyxjbW0nIHByb3BlcnR5Cj4gICBp
bnRyb2R1Y2VkIGluIHBhdGNoIDIKPiAtIFJlLW9yZGVyIHRoZSBwcm9wZXJ0aWVzIGluIHRoZSBT
b0MgRFRTIGZpbGVzIGFzIHN1Z2dlc3RlZCBieSBLaWVyYW4KPiAKPiAqIENNTS9EVQo+IC0gQXMg
YW50aWNpcGF0ZWQsIG1vdmVkIENNTSBtYW5hZ2VtZW50IHRvIHRoZSBjcnRjIGZyb20gdGhlIGF0
b21pYyBjb21taXQKPiB0YWlsCj4gICBoZWxwZXIgd2hlcmUgaXQgd2FzIGltcGxlbWVudGVkIGlu
IHY0Cj4gICBUaGlzIGFsbG93IHRvIGNvcnJlY3RseSBzdXBwb3J0IHJlc3VtZS9zdXNwZW5kIGFu
ZCBwcm9wZXIgb3JkZXJpbmcgb2YgdGhlCj4gQ01NCj4gICBlbmFibGUgYW5kIHNldHVwIG9wZXJh
dGlvbnMgKGVuYWJsZSAtYmVmb3JlLSBzZXR1cCkKPiAtIEFzIGEgY29uc2VxdWVuY2UgdGhlIENN
TSBkcml2ZXIgaXMgZ3JlYXRseSBzaW1wbGlmaWVkIGJ5IHJlbW92aW5nIHRoZSBuZWVkCj4gICB0
byBjYWNoZSB0aGUgTFVUIHRhYmxlIGVudHJpZXMgcHJvdmlkZWQgdG8gY21tX3NldHVwKCkgYW5k
IGxhdGVyIHJlLWFwcGx5Cj4gICB0aGVtIGF0IGVuYWJsZSB0aW1lLgo+IC0gQmV0dGVyIHN1cHBv
cnQgaGFuZGxpbmcgb2YgZGlzYWJsZWQgQ01NIGNvbmZpZyBvcHRpb24gYnkgcmV0dXJuaW5nIC1F
Tk9ERVYKPiAgIGF0IGNtbV9pbml0KCkgdGltZSBhcyBzdWdnZXN0ZWQgYnkgS2llcmFuLgo+IAo+
ICogVGVzdGluZwo+IEkgaGF2ZSB0ZXN0ZWQgYnkgaW5qZWN0aW5nIGEgY29sb3IgaW52ZXJzaW9u
IExVVCB0YWJsZSBhbmQgZW5hYmxpbmcvZGlzYWJsaW5nIGl0Cj4gZXZlcnkgNTAgZGlzcGxheWVk
IGZyYW1lczoKPiBodHRwczovL2ptb25kaS5vcmcvY2dpdC9rbXN4eC9sb2cvP2g9Z2FtbWFfbHV0
Cj4gCj4gQ01NIGZ1bmN0aW9uYWxpdGllcyBhcmUgcmV0YWluZWQgYmV0d2VlbiBzdXNwZW5kL3Jl
c3VtZSBjeWNsZXMgKHRlc3RlZCB3aXRoCj4gc3VzcGVuZC10by1pZGxlKSB3aXRob3V0IHJlcXVp
cmluZyBhIHJlLXByb2dyYW1taW5nIG9mIHRoZSBMVVQgdGFibGVzLgo+IAo+IFRlc3Rpbmcgd2l0
aCByZWFsIHdvcmxkIHVzZSBjYXNlcyBtaWdodCBiZSBiZW5lZmljaWFsLiBSYWplc2ggYXJlIHlv
dSBzdGlsbAo+IGludGVyZXN0ZWQgaW4gZ2l2aW5nIHRoaXMgc2VyaWVzIGEgc3BpbgoKSSBoYXZl
IHRlc3RlZCB2ZXJzaW9uIHYzIG9mIENNTSBtb2R1bGUgd2l0aCBhIGRlbW8gYXBwbGljYXRpb24g
YmFzZWQgb24gbGliZHJtIApsaWJyYXJ5LiBJIGNvdWxkIHN1Y2Nlc3NmdWxseSB0ZXN0IHNldHRp
bmcgb2YgR2FtbWEgTFVULgoKTmV4dCBzdGVwIGlzIHRvIHRlc3Qgb24gZnVsbCBmZWF0dXJlZCBn
cmFwaGljcyBzdGFjayBpLmUuIGludm9sdmluZyBXZXN0b24gYW5kIE9wZW5HTC4KV2VzdG9uIGNh
biBzZXQgR2FtbWEuIEkgaGF2ZSB0byBzdG9wIHRoaXMgd29yayBmb3IgYSB3aGlsZSBkdWUgdG8g
b3RoZXIgaGlnaCBwcmlvIGFjdGl2aXRpZXMuCkkgcGxhbiB0byByZXN1bWUgc29vbi4KCj4gCj4g
TGF1cmVudCwgS2llcmFuLCBjb3VsZCB3ZSBmYXN0LXRyYWNrIHJldmlldyBvZiB0aGlzIGFuZCBo
b3BlZnVsbHkgdHJ5IHRvIGhhdmUgaXQKPiBtZXJnZWQgZm9yIHY1LjUgPwo+IAo+IFRoYW5rcyBF
emVxdWllbCBmb3IgaGF2aW5nIHN1Z2dlc3RlZCBtZSB0aGlzIHNvbHV0aW9uLgo+IAo+IFRoYW5r
cwo+ICAgIGoKPiAKPiBKYWNvcG8gTW9uZGkgKDgpOgo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6
IHJlbmVzYXMsY21tOiBBZGQgUi1DYXIgQ01NIGRvY3VtZW50YXRpb24KPiAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5LCByZW5lc2FzLGR1OiBEb2N1bWVudCBjbW1zIHByb3BlcnR5Cj4gICBkcm06IHJj
YXItZHU6IEFkZCBzdXBwb3J0IGZvciBDTU0KPiAgIGRybTogcmNhci1kdToga21zOiBJbml0aWFs
aXplIENNTSBpbnN0YW5jZXMKPiAgIGRybTogcmNhci1kdTogY3J0YzogQ29udHJvbCBDTU0gb3Bl
cmF0aW9ucwo+ICAgZHJtOiByY2FyLWR1OiBjcnRjOiBSZWdpc3RlciBHQU1NQV9MVVQgcHJvcGVy
dGllcwo+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogQWRkIENNTSB1bml0cyB0byBHZW4zIFNvQ3MK
PiAgIGRybTogcmNhci1kdToga21zOiBFeHBhbmQgY29tbWVudCBpbiB2c3BzIHBhcnNpbmcgcm91
dGluZQo+IAo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sICAgICAgICAg
fCAgNjcgKysrKysrCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0ICAgICAg
ICAgICB8ICAgNSArCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kg
ICAgICB8ICAzOSArKysrCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2LmR0
c2kgICAgICB8ICAzMSArKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1
LmR0c2kgICAgIHwgIDMxICsrLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
OTAuZHRzaSAgICAgfCAgMjEgKysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTk1LmR0c2kgICAgIHwgIDIxICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tjb25maWcg
ICAgICAgICAgICAgICB8ICAgNyArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L01ha2VmaWxl
ICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfY21t
LmMgICAgICAgICAgICB8IDE5OCArKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9jbW0uaCAgICAgICAgICAgIHwgIDYwICsrKysrKwo+ICBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyAgICAgICAgfCAgODkgKysrKysrKysKPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmggICAgICAgIHwgICAyICsKPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuaCAgICAgICAgIHwgICAyICsKPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jICAgICAgIHwgICA1ICsKPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5oICAgICAgIHwgICAyICsKPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyAgICAgICAgIHwgIDgyICsrKysrKyst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5oICAgICAgICB8ICAgNSAr
Cj4gIDE4IGZpbGVzIGNoYW5nZWQsIDY2NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKSAg
Y3JlYXRlIG1vZGUgMTAwNjQ0Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxjbW0ueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9jbW0uYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9jbW0uaAo+IAo+IC0tCj4gMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
