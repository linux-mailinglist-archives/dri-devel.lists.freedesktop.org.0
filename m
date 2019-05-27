Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460972B86C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 17:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2DF89AAE;
	Mon, 27 May 2019 15:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334289A59;
 Mon, 27 May 2019 15:33:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i3so16462847wml.4;
 Mon, 27 May 2019 08:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x1KbW/JCX4jFm2Z/LOlcO41g79sgUjMyey79xTbKrvw=;
 b=HBRHNkXTM/0TqNY3CuFqGvFmVJdJhiSFm8BO4TjNBcVtA3QhcvuzhIFjcykFyXanzb
 X4AKJNA17f+w596/yxJ3tbXmaqGcaJjlEIHpPXLOZdx1WephEYa86wXM/NT0judauVGE
 8O2QhCyWA08qqD5rf5h+Ki/CIZct1BxYl6SOktGUWu5izhysZ28ZeQFFF51fUtoJSeig
 hMTNfchg99+C83R/ZY+mYTBP7L27Paj3ObNK37sBAvNkOkOtKPfE/6AijuX6/E3drghm
 yFN4MVAantEGawO444DHES+Dc/8RB0UgaVyWzDofBubjBHxfAvhNTWi7PGyVsT3nYBjl
 XNTQ==
X-Gm-Message-State: APjAAAW8xGZD63bgBhBGQcLBgLQYro51fYnOOcTg0vvDlLRTKbmWM3CF
 0UB4Mw3M8EPo5RIWKYw/Ovo=
X-Google-Smtp-Source: APXvYqxOMNF3DbwM6Ufvp/tfxU9lGjlDnXrRjt1ek/p+UZRoZEX3guOVnMrkwo4uov+aim7vAVMf1A==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr10679703wmj.43.1558971232070; 
 Mon, 27 May 2019 08:33:52 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id p6sm2409961wrn.67.2019.05.27.08.33.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 08:33:51 -0700 (PDT)
Date: Mon, 27 May 2019 16:32:26 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190527153226.GK15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x1KbW/JCX4jFm2Z/LOlcO41g79sgUjMyey79xTbKrvw=;
 b=F2FhymF/eccKJk3+YcmUegSOuOxGViJp2XBY2RCbdubWVvDXHBhn92QylkMr4pDeTk
 VX6iTUw2CiIEqjPDN/G2iXIehRmv/7FlVLuwXoGnMq7pg4ua/+yKLGjwd1oDxLsqRYyd
 kbOMfv5Y9OtvnCmJ3eYApMqKKADL+kpZWFHxZMJi+Zj8ViXx46KhKpN9GImIdNyyFofo
 GjYLgt8YPDNWPSGJOFFRcZUCyH2Aofy6RaI9WrRBBlwX+ktdNRasP5YkHaByAb1FjZrX
 /O6xGjy+48KCxJyBvFESdjc7EpJz0or/ty4WBZrWlxD1d5sDSn3Vy9hfZXWbs0A1owgp
 1aMA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjcuMDUuMTkgdW0g
MTU6MjYgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA1LzI3LCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDEwOjQ3OjM5QU0gKzAwMDAs
IEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+ID4+PiBBbSAyNy4wNS4xOSB1bSAxMDoxNyBzY2hy
aWViIEVtaWwgVmVsaWtvdjoKPiA+Pj4+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+Cj4gPj4+Pgo+ID4+Pj4gQ3VycmVudGx5IG9uZSBjYW4gY2lyY3VtdmVu
dCBEUk1fQVVUSCwgd2hlbiB0aGUgaW9jdGwgaXMgZXhwb3NlZCB2aWEgdGhlCj4gPj4+PiByZW5k
ZXIgbm9kZS4gQSBzZWVtaW5nbHkgZGVsaWJlcmF0ZSBkZXNpZ24gZGVjaXNpb24uCj4gPj4+Pgo+
ID4+Pj4gSGVuY2Ugd2UgY2FuIGRyb3AgdGhlIERSTV9BVVRIIGFsbCB0b2dldGhlciAoZGV0YWls
cyBpbiBmb2xsb3ctdXAgcGF0Y2gpCj4gPj4+PiB5ZXQgbm90IGFsbCB1c2Vyc3BhY2UgY2hlY2tz
IGlmIGl0J3MgYXV0aGVudGljYXRlZCwgYnV0IGluc3RlYWQgdXNlcwo+ID4+Pj4gdW5jb21tb24g
YXNzdW1wdGlvbnMuCj4gPj4+Pgo+ID4+Pj4gQWZ0ZXIgZGF5cyBvZiBkaWdnaW5nIHRocm91Z2gg
Z2l0IGxvZyBhbmQgdGVzdGluZywgb25seSBhIHNpbmdsZSAoYWIpdXNlCj4gPj4+PiB3YXMgc3Bv
dHRlZCAtIHRoZSBNZXNhIFJBRFYgZHJpdmVyLCB1c2luZyB0aGUgQU1ER1BVX0lORk8gaW9jdGwg
YW5kCj4gPj4+PiBhc3N1bWluZyB0aGF0IGZhaWx1cmUgaW1wbGllcyBsYWNrIG9mIGF1dGhlbnRp
Y2F0aW9uLgo+ID4+Pj4KPiA+Pj4+IEFmZmVjdGVkIHZlcnNpb25zIGFyZToKPiA+Pj4+ICAgIC0g
dGhlIHdob2xlIDE4LjIueCBzZXJpZXMsIHdoaWNoIGlzIEVPTAo+ID4+Pj4gICAgLSB0aGUgd2hv
bGUgMTguMy54IHNlcmllcywgd2hpY2ggaXMgRU9MCj4gPj4+PiAgICAtIHRoZSAxOS4wLnggc2Vy
aWVzLCBwcmlvciB0byAxOS4wLjQKPiA+Pj4gV2VsbCB5b3UgY291bGQgaGF2ZSBzYXZlZCB5b3Vy
IHRpbWUsIGNhdXNlIHRoaXMgaXMgc3RpbGwgYSBOQUsuCj4gPj4+Cj4gPj4+IEZvciB0aGUgcmVj
b3JkOiBJIHN0cm9uZ2x5IHRoaW5rIHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBleHBvc2UgYW55IHJl
bmRlcgo+ID4+PiBmdW5jdGlvbmFsaXR5IG9uIHRoZSBwcmltYXJ5IG5vZGUuCj4gPj4+Cj4gPj4+
IFRvIGV2ZW4gZ28gYSBzdGVwIGZ1cnRoZXIgSSB3b3VsZCBzYXkgdGhhdCBhdCBsZWFzdCBvbiBB
TUQgaGFyZHdhcmUgd2UKPiA+Pj4gc2hvdWxkIGNvbXBsZXRlbHkgZGlzYWJsZSBEUkkyIGZvciBv
bmUgb2YgdGhlIG5leHQgZ2VuZXJhdGlvbnMuCj4gPj4+Cj4gPj4+IEFzIGEgZm9sbG93IHVwIEkg
d291bGQgdGhlbiBjb21wbGV0ZWx5IGRpc2FsbG93IHRoZSBEUk0gYXV0aGVudGljYXRpb24KPiA+
Pj4gZm9yIGFtZGdwdSwgc28gdGhhdCB0aGUgY29tbWFuZCBzdWJtaXNzaW9uIGludGVyZmFjZSBv
biB0aGUgcHJpbWFyeSBub2RlCj4gPj4+IGNhbiBvbmx5IGJlIHVzZWQgYnkgdGhlIGRpc3BsYXkg
c2VydmVyLgo+ID4+IFNvIGFtZGdwdSBpcyBydW5uaW5nIGluIG9uZSBkaXJlY3Rpb24sIHdoaWxl
IGV2ZXJ5b25lIGVsc2UgaXMgcnVubmluZyBpbgo+ID4+IHRoZSBvdGhlciBkaXJlY3Rpb24/IFBs
ZWFzZSBub3RlIHRoYXQgeW91ciBwYXRjaCB0byBjaGFuZ2UgaTkxNSBsYW5kZWQKPiA+PiBhbHJl
YWR5LCBzbyB0aGF0IHNoaXAgaXMgc2FpbGluZyAoYnV0IHdlIGNvdWxkIG9mYyByZXZlcnQgdGhh
dCBiYWNrCj4gPj4gYWdhaW4pLgo+ID4+Cj4gPj4gSW1vIHJlYWxseSBub3QgYSBncmVhdCBpZGVh
IGlmIHdlIGRvIGEgYW1kZ3B1IHZzLiBldmVyeW9uZSBlbHNlIHNwbGl0Cj4gPj4gaGVyZS4gSWYg
d2Ugd2FudCB0byBkZXByZWNhdGUgZHJpMi9mbGluay9yZW5kZXJpbmcgb24gcHJpbWFyeSBub2Rl
cyBhY3Jvc3MKPiA+PiB0aGUgc3RhY2ssIHRoZW4gdGhhdCBzaG91bGQgYmUgYSBzdGFjayB3aWRl
IGRlY2lzaW9uLCBub3QgYW4gYW1kZ3B1IG9uZS4KPiA+Pgo+ID4gQ2Fubm90IGFncmVlIG1vcmUg
LSBJIHdvdWxkIGxvdmUgdG8gc2VlIGRyaXZlcnMgc3RheSBjb25zaXN0ZW50Lgo+IAo+IFllYWgs
IGNvbXBsZXRlbHkgYWdyZWUgdG8gdGhhdC4gVGhhdCdzIHdoeSBJIHRoaW5rIHdlIHNob3VsZCBu
b3QgZG8gdGhpcyAKPiBhdCBhbGwgYW5kIGp1c3QgbGV0IEludGVsIGZpeCBpdCdzIHVzZXJzcGFj
ZSBidWdzIDpQCj4gClByZXR0eSBzdXJlIEkgbWVudGlvbmVkIGl0IGJlZm9yZSAtIG1pZ2h0IGhh
dmUgYmVlbiB0b28gc3VidGxlOgoKVGhlIHByb2JsZW0gaXMgX25laXRoZXJfIEludGVsIG5vciBs
aWJ2YSBzcGVjaWZpYy4KCgo+IEFueXdheSBteSBjb25jZXJuIGlzIHJlYWxseSB0aGF0IHdlIHNo
b3VsZCBzdG9wIGV4dGVuZGluZyBmdW5jdGlvbmFsaXR5IAo+IG9uIHRoZSBwcmltYXJ5IG5vZGUu
Cj4gCj4gRS5nLiB0aGUgcmVuZGVyIG5vZGUgaXMgZm9yIHVzZSBieSB0aGUgY2xpZW50cyBhbmQg
dGhlIHByaW1hcnkgbm9kZSBmb3IgCj4gbW9kZSBzZXR0aW5nIGFuZCB1c2UgYnkgdGhlIGRpc3Bs
YXkgc2VydmVyIG9ubHkuCj4gCkZ1bGx5IGFncmVlZC4gSSdtIG5vdCBleHRlbmRpbmcgYW55dGhp
bmcgcmVhbGx5LiBJZiBhbnl0aGluZyAtIGNvZGUgaXMKcmVtb3ZlZCBmcm9tIGRyaXZlcnMgYW5k
IGNvcmUgOi0pCgpUaGFua3MKRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
