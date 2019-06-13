Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD91437C5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156CE89ACC;
	Thu, 13 Jun 2019 15:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA08889ACC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:01:20 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56364)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hbRE4-0003iq-6V; Thu, 13 Jun 2019 16:01:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hbRE2-0001Jo-NW; Thu, 13 Jun 2019 16:01:14 +0100
Date: Thu, 13 Jun 2019 16:01:14 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/18] Armada DRM updates
Message-ID: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmB6+EcRyCm7veyBlsY9CCysvQL/Xu6GOodFV4+BnY4=; b=egsfOa3W2bTawkMJ6aJLwWF1s
 tTMljS6tzi1+fI1wIjxcnNrw0R5VZKNqnSlELHWyTCCdi/0nI5jGwDWdGDHeg7mzXeIIOQLXiGTw1
 0iM06FOxa7fHkvpnoDDl66CFW3jyrzs0ettchPGV6ZLLP3W+EHI8uP8ymBEaGvbogo6H3bKTNrSCu
 TIqUHTtRP4VsE9TTDeNHmLAAwsgWoilSeTA3uZq48vGnWykHL5mJfJzgKMc7aFqFZ3+rxqei9L5bv
 IkaLd/L+u/Yn+t8vXBfFlN8xz/JiB/FHgDreDBD576keIRLfyCDINtPz9TReQ+aTTEWWCeLdt8X7H
 8E0rYcqGw==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHNlcmllcyB1cGRhdGVzIEFybWFkYSBEUk06CgotIEZpeCBpbnRlcmxhY2Ugc3Vw
cG9ydC4KLSB1c2UgX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCBpbiBvdmVybGF5IHJl
c2V0LgotIHNpbmNlIHRoZSBvdmVybGF5IGFuZCB2aWRlbyBwbGFuZXMgdXNlIGVzc2VudGlhbGx5
IHRoZSBzYW1lIGZvcm1hdAogIHJlZ2lzdGVycywgcHJlY29tcHV0ZSB0aGVpciB2YWx1ZXMgd2hp
bGUgdmFsaWRhdGluZy4KLSBmaXggYSBsb25nLXN0YW5kaW5nIGRlZmljaWVuY3kgd2l0aCBvdmVy
bGF5IHBsYW5lcyBhbmQgaW50ZXJsYWNlIG1vZGVzCi0gY2FsY3VsYXRlIHBsYW5lIHN0YXJ0aW5n
IGFkZHJlc3MgYXQgYXRvbWljX2NoZWNrIHN0YWdlIHJhdGhlciB0aGFuCiAgd2hlbiB3ZSdyZSBw
cm9ncmFtbWluZyB0aGUgcmVnaXN0ZXJzLgotIGFkZCBnYW1tYSBzdXBwb3J0LgotIGVuc3VyZSBt
b2RlIGFkanVzdG1lbnRzIG1hZGUgYnkgb3RoZXIgY29tcG9uZW50cyBhcmUgcHJvcGVybHkgaGFu
ZGxlZAogIGluIHRoZSBkcml2ZXIgYW5kIGFwcGxpZWQgdG8gdGhlIENSVEMtcHJvZ3JhbW1lZCBt
b2RlLgotIGFkZCBhbmQgdXNlIHJlZ2lzdGVyIGRlZmluaXRpb25zIGZvciB0aGUgIlJFRzRGIiBy
ZWdpc3Rlci4KLSB1c2UgZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oKSB3aGVuIHRlYXJpbmcg
ZG93biB0byBlbnN1cmUgdGhhdCB0aGUKICBoYXJkd2FyZSBpcyBwcm9wZXJseSBzaHV0ZG93bi4K
LSBhZGQgQ1JUQy1sZXZlbCBtb2RlIHZhbGlkYXRpb24gdG8gZW5zdXJlIHRoYXQgd2UgZG9uJ3Qg
YWxsb3cgYSBtb2RlCiAgdGhhdCB0aGUgQ1JUQy1sZXZlbCBoYXJkd2FyZSBjYW4gbm90IHN1cHBv
cnQuCi0gaW1wcm92ZSB0aGUgY2xvY2tpbmcgc2VsZWN0aW9uIGZvciBBcm1hZGEgNTEwIHN1cHBv
cnQuCi0gbW92ZSBDUlRDIGRlYnVnZnMgZmlsZXMgaW50byB0aGUgY3J0Yy1zcGVjaWZpYyBkaXJl
Y3RvcnksIHVzaW5nIHRoZQogIERSTSBoZWxwZXIgdG8gY3JlYXRlIHRoZXNlIGZpbGVzLgotIHBh
dGNoIGZyb20gTHVib21pciBSaW50ZWwgdG8gcmVwbGFjZSBhIHNpbXBsZSBmcmFtZWJ1ZmZlci4K
LSB1c2UgdGhlIE9GIGdyYXBoIHdhbGtlciByYXRoZXIgdGhhbiBvcGVuLWNvZGluZyB0aGlzLgot
IGVsaW1pbmF0ZSBhIHVzZWxlc3MgY2hlY2sgZm9yIHRoZSBhdmFpbGFiaWxpdHkgb2YgdGhlIHJl
bW90ZSdzIHBhcmVudAogIHdoaWNoIGlzbid0IHJlcXVpcmVkLgoKIGRyaXZlcnMvZ3B1L2RybS9h
cm1hZGEvYXJtYWRhXzUxMC5jICAgICB8IDEzMCArKysrKysrKysrKysrKy0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfY3J0Yy5jICAgIHwgMjEyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmggICAg
fCAgMjEgKysrLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZGVidWdmcy5jIHwgIDk4
ICsrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZHJtLmggICAg
IHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Rydi5jICAgICB8ICAzOCAr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2h3LmggICAgICB8ICAyOSArKyst
LQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIHwgIDU2ICsrKystLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfcGxhbmUuYyAgIHwgMTI0ICsrKysrKysr
KysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX3BsYW5lLmggICB8ICAy
MyArKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCA1MjAgaW5zZXJ0aW9ucygrKSwgMjEyIGRlbGV0aW9u
cygtKQoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVr
L2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1
YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3Bl
ZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
