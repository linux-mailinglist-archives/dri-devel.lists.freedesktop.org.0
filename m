Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633766B2C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 12:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E1F6E34A;
	Fri, 12 Jul 2019 10:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF6A6E34B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:58:02 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59462)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hltFN-0001Mc-4Y; Fri, 12 Jul 2019 11:57:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hltFJ-0005c2-Nx; Fri, 12 Jul 2019 11:57:45 +0100
Date: Fri, 12 Jul 2019 11:57:45 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v3 1/5] ASoC: hdmi-codec: Add an op to set callback
 function for plug event
Message-ID: <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-2-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712100443.221322-2-cychiang@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9dynlJ3OM9MALiJSBcSG7FKkftfyq54pHYRnzPQTFA=; b=Eyr0dtWhsmlK2Q6BhgmXpUOL/
 qymgs31El0emqh8IFE4WI3vF53WCcBAaX6vLcGPJDEh30I33KI7G6wSoN0u+M/D/BCSA1udbJvErH
 nIDPBlSdgUpnsnRPshqdgvBlwZh+rqeIGCWGpUc+DhpBYN0jaKp9LJpI4PlEv5yRZ/CSfY7Z8HyYq
 tBBBAz5DaPhve6iZyWd/UAkz7y6uKCCXVnCCXr3uYXQZrhzPLLkpOn95j/IOhrviJVxEXV07j5CsA
 RFU80czsdSVH3CRpvfIGSrY4m2mqkYq99uWagRqbIE8jqCXlSABqwIIgCGdgiZ7x8M2xRsZ2I9Q0c
 8ZwvU8lPQ==;
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
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDY6MDQ6MzlQTSArMDgwMCwgQ2hlbmctWWkgQ2hpYW5n
IHdyb3RlOgo+IEFkZCBhbiBvcCBpbiBoZG1pX2NvZGVjX29wcyBzbyBjb2RlYyBkcml2ZXIgY2Fu
IHJlZ2lzdGVyIGNhbGxiYWNrCj4gZnVuY3Rpb24gdG8gaGFuZGxlIHBsdWcgZXZlbnQuCj4gCj4g
RHJpdmVyIGluIERSTSBjYW4gdXNlIHRoaXMgY2FsbGJhY2sgZnVuY3Rpb24gdG8gcmVwb3J0IGNv
bm5lY3RvciBzdGF0dXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNo
aWFuZ0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oICAg
IHwgMTYgKysrKysrKysrKysrKwo+ICBzb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYyB8IDQ1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NjEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL2hkbWktY29k
ZWMuaCBiL2luY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oCj4gaW5kZXggN2ZlYTQ5NmYxZjM0Li45
YTg2NjE2ODAyNTYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgKPiAr
KysgYi9pbmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaAo+IEBAIC00Nyw2ICs0Nyw5IEBAIHN0cnVj
dCBoZG1pX2NvZGVjX3BhcmFtcyB7Cj4gIAlpbnQgY2hhbm5lbHM7Cj4gIH07Cj4gIAo+ICt0eXBl
ZGVmIHZvaWQgKCpoZG1pX2NvZGVjX3BsdWdnZWRfY2IpKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAr
CQkJCSAgICAgIGJvb2wgcGx1Z2dlZCk7Cj4gKwoKSSdkIGxpa2UgdG8gcG9zZSBhIHF1ZXN0aW9u
IGZvciBwZW9wbGUgdG8gdGhpbmsgYWJvdXQuCgpGaXJzdGx5LCB0eXBlZGVmcyBhcmUgZ2VuZXJh
bGx5IHNodW5uZWQgaW4gdGhlIGtlcm5lbC4gIEhvd2V2ZXIsIGZvcgp0aGVzZSBjYXNlcyBpdCBz
ZWVtcyB0byBtYWtlIHNlbnNlLgoKSG93ZXZlciwgc2hvdWxkIHRoZSAicG9pbnRlciItbmVzcyBi
ZSBwYXJ0IG9mIHRoZSB0eXBlZGVmIG9yIG5vdD8gIFRvCnNlZSB3aGF0IEkgbWVhbiwgY29uc2lk
ZXI6CgoJdHlwZWRlZiB2b2lkICgqaGRtaV9mb28pKHZvaWQpOwoKCWludCByZWdpc3Rlcl9mb28o
aGRtaV9mb28gZm9vKTsKCnZzCgoJdHlwZWRlZiB2b2lkIGhkbWlfZm9vKHZvaWQpOwoKCWludCBy
ZWdpc3Rlcl9mb28oaGRtaV9mb28gKmZvbyk7Cgp3aGljaCBpcyBtb3JlIGluIGtlZXBpbmcgd2l0
aCBob3cgd2UgY29kZSBub24tdHlwZWRlZidkIGNvZGUgLSBpdCdzCm9idmlvdXMgdGhhdCBmb28g
aXMgYSBwb2ludGVyIHdoaWxlIHJlYWRpbmcgdGhlIGNvZGUuCgpJdCBzZWVtcyB0byBtZSB0aGF0
IHRoZSBsYXR0ZXIgYmV0dGVyIG1hdGNoZXMgd2hhdCBpcyBpbiB0aGUga2VybmVsJ3MKY29kaW5n
IHN0eWxlLCB3aGljaCBzdGF0ZXM6CgogIEluIGdlbmVyYWwsIGEgcG9pbnRlciwgb3IgYSBzdHJ1
Y3QgdGhhdCBoYXMgZWxlbWVudHMgdGhhdCBjYW4KICByZWFzb25hYmx5IGJlIGRpcmVjdGx5IGFj
Y2Vzc2VkIHNob3VsZCAqKm5ldmVyKiogYmUgYSB0eXBlZGVmLgoKb3IgbWF5YmUgRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QgbmVlZHMgdXBkYXRpbmc/CgotLSAKUk1LJ3Mg
UGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNo
ZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQg
MTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45
TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
