Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28001E1053
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 05:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C006E0E1;
	Wed, 23 Oct 2019 03:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70216E0E1;
 Wed, 23 Oct 2019 03:04:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l10so19824026wrb.2;
 Tue, 22 Oct 2019 20:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q4CfRog0MybHpd33xvvsOmzsmJVfK1f+7lcEQ24uzZ8=;
 b=GsUVEBOzGH3RqutMOSZ4iSAb2E5BGWzydF+N7s1t9Xp17Ye5M3iMCuErhyrF6VgWGe
 woNv+zYFzkiHQcNe0efmgsUiuUkwMbiuIHRcTbFrIs62YIIF7G3Y1YT9OFrtVJz781gg
 nPmk2EYuhYM1VRdfBXWfAp+U4WBMcKVCFDZjDAC+DjO3aCuuYSQeUaBkyGB+Ug5bGm7g
 lLsAHv6zNbog+wq/dJEuRIo1subGKUEzzXxb/8ehsRtpWdpfsA4LicSFJxobm+taWapB
 Z3q3tLM8+xu9uIKtOdHWpDBWwykmJf3iM1O/jT4YwYmvZF9azmxIJ8m9dp3DMIRURqU+
 NPrA==
X-Gm-Message-State: APjAAAW29oQt/W0wlv4SAZZxhn2Ovet/7Z6mpjsTtISm0W/aVx1KRemS
 QImc4aIJNG/90BMwnyJbDVnSDD0PqTFetmgwTdw=
X-Google-Smtp-Source: APXvYqztAvjAtqydQh3qVE5+OdKOpukVweHLvEfzrx6Z0C3R+qE8o2TVdrePm6jp42LqGgjHfbaOPHO8gcAgHlFfS1A=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr6345858wrw.206.1571799858345; 
 Tue, 22 Oct 2019 20:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <24b5f681-df58-7663-af7c-9fa9b9158be9@linux.ee>
 <61646cbe-c4a9-cef1-d586-f3ac794b998a@daenzer.net>
In-Reply-To: <61646cbe-c4a9-cef1-d586-f3ac794b998a@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Oct 2019 23:04:06 -0400
Message-ID: <CADnq5_OEP8Rwcjok8LbedZ00B=3voEu97ngeOMiGLde=ZjXrHg@mail.gmail.com>
Subject: Re: radeon Disabling GPU acceleration (WB disabled?)
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q4CfRog0MybHpd33xvvsOmzsmJVfK1f+7lcEQ24uzZ8=;
 b=WU8fr+TLm9yuHpH6N+gV6LAmDgoqbijos72FRqSzaClY71OoLb3pPqj6memgmLOJSb
 QJZZryC5qs+4BDAcOHTWhSn9Z+k/kb4lXRCvnq4DnJcsj5OCteYlkJHXWZ+y4yvIp/Rb
 SgpeqIgadcLRwXg/QQteIJOpD6KztWM3NXpSHVrMVXnVnsNBH/wA0U5jVv4Fr8Ix3WWq
 EPVl4v85vofgFKUqYWopCHrbJET8Qs14dSD20CjRp0z7jcrpkXntFox+v90toZJLPOTX
 ldaGpf6N5+DWQUKWA5edRRPVTVl1wQeVJds63Ur+ZGgXHvugye7V/jl46nRc1i+IUaJ6
 yunw==
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
Cc: Meelis Roos <mroos@linux.ee>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTI6MDkgUE0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gd3JvdGU6Cj4KPiBPbiAyMDE5LTEwLTIwIDExOjIxIHAubS4sIE1lZWxpcyBS
b29zIHdyb3RlOgo+ID4gSSB0cmllZCA1LjIsIDUuMyBhbmQgNS40LXJjNCBvbiBteSBvbGQgRnVq
aXRzdSBSWDIyMCB3aXRoIGludGVncmF0ZWQKPiA+IFJhZGVvbiBSVjEwMC4gRG1lc2cgdGVsbHMg
dGhhdCBHUFUgYWNjZWxlcmF0aW9uIGlzIGRpc2FibGVkLiBJIGRvIG5vdAo+ID4ga25vdyBpZiBp
dCBoYXMgYmVlbiBlbmFibGVkIGluIHRoZSBwYXN0IC0gbm8gb2xkIGtlcm5lbHMgaGFuZHkgYXQg
dGhlCj4gPiBtb21lbnQuCj4gPgo+ID4gRnJvbSBkbWVzZyBpdCBsb29rcyBsaWtlIHNvbWV0aGlu
ZyB3aXRoIE1UUlIgbWF5YmU6IFdCIGRpc2FibGVkLgo+Cj4gVGhhdCdzIGhhcm1sZXNzLgo+Cj4K
PiA+IFsgICAgOC41MzU5NzVdIFtkcm1dIERyaXZlciBzdXBwb3J0cyBwcmVjaXNlIHZibGFuayB0
aW1lc3RhbXAgcXVlcnkuCj4gPiBbICAgIDguNTM1OTgxXSByYWRlb24gMDAwMDowMDowNS4wOiBE
aXNhYmxpbmcgR1BVIGFjY2VsZXJhdGlvbgo+Cj4gVGhpcyBsb29rcyBsaWtlIGRybV9pcnFfaW5z
dGFsbCByZXR1cm5zIGFuIGVycm9yIGluIHJhZGVvbl9pcnFfa21zX2luaXQuCj4KCkNoZWNrIHRv
IHNlZSB0aGF0IHRoZSBzYmlvcyBhc3NpZ25zIGFuIGlycSB0byB0aGUgZGV2aWNlLiAgVGhlcmUg
bWF5CmJlIGFuIG9wdGlvbiBpbiB0aGUgc2Jpb3MgY29uZmlndXJhdGlvbiBzZXR0aW5ncy4gIElJ
UkMsIHNvbWUgb2xkCnBsYXRmb3JtcyBkaWRuJ3QgYWx3YXlzIGFzc2lnbiBpbnRlcnJ1cHRzIHRv
IHZnYSBkZXZpY2VzLgoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
