Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42C2B467
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6328C89D30;
	Mon, 27 May 2019 12:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829D489D30;
 Mon, 27 May 2019 12:07:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z23so11537898wma.4;
 Mon, 27 May 2019 05:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EkrQ/fRyfaQAGMISR4Nw9gdqxUwLVCTS6XjhfCv0n8o=;
 b=qRJY+3F8BzP4g5+t9Y9pK34uiifD1a9E7OCbd4RhAZuBCJXdpHqc5d2qjC4qvyYb3Y
 stEjLExRGdVLr8xCecoiILszbJFyafjAlQJNFgdHldrJfnO49O4fnySWQRmZbLeYQHpu
 CLklMjN7FBeyDPs7GwIYLiq/uWuHDa1N3rqbVrgU2Mc1Z9LCqjUqZnprRA/5oN47fyqL
 yWdak2MMd997stcx4P1z+3LDUIvL/Af2hUxzmQeMo3DG9DtLLvhTvV1j3S+a4mRK4wX+
 +oFgKYcXxrXEbS+ilolA/6UeS9GiJs5tTwE80bxd36xdEZp2Kuvh/H52L8gqOmrtcyAB
 5m8g==
X-Gm-Message-State: APjAAAX0S9HpMupYUDZBbnhLAWJiNti4UqYYMOlWPBXC7X2MzYnny6Wt
 T+x4hXknGYfxchNcfVllG/Y1wha7
X-Google-Smtp-Source: APXvYqxqcqH4vKuHbhOcwMHsR4XAlXnY6ucq1QGNDJK7v3BpRmiSWaXJbKfjfQcPddPBI+Abq7ndMQ==
X-Received: by 2002:a05:600c:228c:: with SMTP id
 12mr9313540wmf.20.1558958840201; 
 Mon, 27 May 2019 05:07:20 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 65sm19253050wro.85.2019.05.27.05.07.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 05:07:19 -0700 (PDT)
Date: Mon, 27 May 2019 13:05:54 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190527120554.GB15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EkrQ/fRyfaQAGMISR4Nw9gdqxUwLVCTS6XjhfCv0n8o=;
 b=fePrcHeKB+5qOm71it4vemrqM2BTFYXLp0LtVpJ0EW/OF8U9jEr+wr1kYdGTdo43bH
 zMjYnuSfd5e3OXq+JuZviRMCKUNo5H3dbhGnwtgRLG2LAA7cVzLNzWbdnY34mICziXKZ
 7ystiBy75ly58757ZVQs5B8yoWX/2EeUOWnIwmvKa+9MHCp0bOuBynJue3mZoPUoMoFj
 5CuICebPpiUZ8KOL0oOCl0edWqTGQGrO6nIgc13ECbR2obhkSnirsUC2iBEe3/+yIQeu
 Bq2dqTaXY7zXeFlNjZ0mn4WPf0LYmdlb6nsiYtgTYOZZwTEU4YguVz3diivbR2zac0NZ
 x6eQ==
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
MTA6MTcgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4KPiA+IEN1cnJlbnRseSBvbmUgY2FuIGNpcmN1bXZl
bnQgRFJNX0FVVEgsIHdoZW4gdGhlIGlvY3RsIGlzIGV4cG9zZWQgdmlhIHRoZQo+ID4gcmVuZGVy
IG5vZGUuIEEgc2VlbWluZ2x5IGRlbGliZXJhdGUgZGVzaWduIGRlY2lzaW9uLgo+ID4KPiA+IEhl
bmNlIHdlIGNhbiBkcm9wIHRoZSBEUk1fQVVUSCBhbGwgdG9nZXRoZXIgKGRldGFpbHMgaW4gZm9s
bG93LXVwIHBhdGNoKQo+ID4geWV0IG5vdCBhbGwgdXNlcnNwYWNlIGNoZWNrcyBpZiBpdCdzIGF1
dGhlbnRpY2F0ZWQsIGJ1dCBpbnN0ZWFkIHVzZXMKPiA+IHVuY29tbW9uIGFzc3VtcHRpb25zLgo+
ID4KPiA+IEFmdGVyIGRheXMgb2YgZGlnZ2luZyB0aHJvdWdoIGdpdCBsb2cgYW5kIHRlc3Rpbmcs
IG9ubHkgYSBzaW5nbGUgKGFiKXVzZQo+ID4gd2FzIHNwb3R0ZWQgLSB0aGUgTWVzYSBSQURWIGRy
aXZlciwgdXNpbmcgdGhlIEFNREdQVV9JTkZPIGlvY3RsIGFuZAo+ID4gYXNzdW1pbmcgdGhhdCBm
YWlsdXJlIGltcGxpZXMgbGFjayBvZiBhdXRoZW50aWNhdGlvbi4KPiA+Cj4gPiBBZmZlY3RlZCB2
ZXJzaW9ucyBhcmU6Cj4gPiAgIC0gdGhlIHdob2xlIDE4LjIueCBzZXJpZXMsIHdoaWNoIGlzIEVP
TAo+ID4gICAtIHRoZSB3aG9sZSAxOC4zLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiA+ICAgLSB0
aGUgMTkuMC54IHNlcmllcywgcHJpb3IgdG8gMTkuMC40Cj4gCj4gV2VsbCB5b3UgY291bGQgaGF2
ZSBzYXZlZCB5b3VyIHRpbWUsIGNhdXNlIHRoaXMgaXMgc3RpbGwgYSBOQUsuCj4gCkRpZCBJIG1l
bnRpb24gdGhhdCBJJ3ZlIHNwZW50IHF1aXRlIGEgYml0IG9mIHRpbWUgaW4gQU1EVkxLPyBFdmVu
IGZpeGVkIAphIGJ1ZyB3aGlsZSBJIHdhcyB0aGVyZSA6LSkKCj4gRm9yIHRoZSByZWNvcmQ6IEkg
c3Ryb25nbHkgdGhpbmsgdGhhdCB3ZSBkb24ndCB3YW50IHRvIGV4cG9zZSBhbnkgcmVuZGVyIAo+
IGZ1bmN0aW9uYWxpdHkgb24gdGhlIHByaW1hcnkgbm9kZS4KPiAKPiBUbyBldmVuIGdvIGEgc3Rl
cCBmdXJ0aGVyIEkgd291bGQgc2F5IHRoYXQgYXQgbGVhc3Qgb24gQU1EIGhhcmR3YXJlIHdlIAo+
IHNob3VsZCBjb21wbGV0ZWx5IGRpc2FibGUgRFJJMiBmb3Igb25lIG9mIHRoZSBuZXh0IGdlbmVy
YXRpb25zLgo+Ckl0J3MgZG9hYmxlIGFuZCBvdmVyYWxsIHByZXR0eSBuZWF0IGlkZWEuCgpUaGVy
ZSBpcyBhIGNvbnNlcm4gdGhhdCB0aGlzIGFwcHJvYWNoIG1heSBjYXVzZSBmYXIgbW9yZSByZWdy
ZXNzaW9ucwp0aGF0IHRoaXMgc2VyaWVzLiBXZSBhcmUgdGFsa2luZyBhYm91dCB5ZWFycyB3b3J0
aCBvZiBNZXNhIGRyaXZlcnMgKGV0CmFsKSB0aGF0IGRlcGVuZCBvbiByZW5kZXIgZnVuY3Rpb25h
bGl0eSBleHBvc2VkIHZpYSB0aGUgcHJpbWFyeSBub2RlLgoKSSdtIE9LIHdpdGggd3JpdGluZyB0
aGUgcGF0Y2hlcywgYnV0IGl0J2xsIGJlIHVwLXRvIHRoZSBBTURHUFUgdGVhbSB0bwpmb2xsb3ct
dXAgd2l0aCBhbnkgcmVncmVzc2lvbnMuIEFyZSB5b3Ugb2sgd2l0aCB0aGF0PwoKRndpdyBJIGNv
dWxkIGFsc28gbW92ZSB0aGUgRk9SQ0VfQVVUSCBoYWNrIHRvIGNvcmUgZHJtLCBpZiB5b3UgcHJl
ZmVyLgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
