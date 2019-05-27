Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259432B665
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C333B6E1CE;
	Mon, 27 May 2019 13:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E596E1C4;
 Mon, 27 May 2019 13:27:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u78so3322860wmu.5;
 Mon, 27 May 2019 06:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EVk6Ilq4efqduEcB9vRiTULPk5W/SGneu3h472QGR30=;
 b=irtBVMZ1uLR/hKK4i/2OouJjZ83MPPNtrGKocnqDKoPsDfpDFr9FrFBU++AaZbywoQ
 RqS5tC1b8sqwqZtWmd7hy86eIMFwSwdisk0rMeDknzb1kk7F2+Rk8PfA9arFjIdnha5V
 RS89xgzjearPnopHejuQJYrhEFPiztGQNCWtfTGGyY86S32YrkBdFrnsQJtHXkaKfS1p
 gtrUGnsThFVnuuMFPwlQX7ekCRtdGWwuvNE1ZZ4JLRhry7RCLM5az6vD6G4TtyRKs09Q
 V3s7aKuonHJdN5iC9wEDhahVbLfr4am4EmG+RS+sa2FM5aE1+1pTW2fbRpk+VVFk091T
 jkXA==
X-Gm-Message-State: APjAAAWU5io7AYmrR179s7VOnOR/UaJB1PRquS1BpVTIflQ7r7SSiTfK
 rgkgo9seCLGkNgUcB+IDr+g=
X-Google-Smtp-Source: APXvYqyYcs//eRvy8hymOsi3/1fQvwt5p3v4DRo6S3ljCu079IAFQVX6AQUAwi+YX3SvaYzVzW5dUg==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr17019182wmj.41.1558963652445; 
 Mon, 27 May 2019 06:27:32 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 95sm2728065wrk.70.2019.05.27.06.27.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 06:27:31 -0700 (PDT)
Date: Mon, 27 May 2019 14:26:07 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190527132607.GH15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527132041.GP21222@phenom.ffwll.local>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EVk6Ilq4efqduEcB9vRiTULPk5W/SGneu3h472QGR30=;
 b=mUZStC65WHexIoOCss1r64KsvHYf9LhCX9M+bTj1dNzkMaeq1V39iF6rYt1P+eqiOT
 8sHxzcIZODtRrTVXb/l9YK/kHIcT9U0uPvTfPmcmDidjlsK/F9gG4MZtJ1wTZsHr49Cx
 F6l4xUVSEXPuYnvCnO4yVHTibozI8UeSzXkU/ymPG//QmRXnT8UBsdLlQgi5y3tgEHIO
 me+Wm1q4ABSUhwiE1b7Tf5kiAjozHWxdQhtz0DTwomXB62RoX+mYyTBn/MTLiaLuPCVb
 ECHtOXLrVE7W6lOosXG+jGhdWxMa7WDTost7KI8HNdRmqQmz330/WJzO2zkoHU1ZsBLO
 zXqA==
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIE1heSAyNywgMjAx
OSBhdCAxMDo0NzozOUFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiA+IEFtIDI3
LjA1LjE5IHVtIDEwOjE3IHNjaHJpZWIgRW1pbCBWZWxpa292Ogo+ID4gPiBGcm9tOiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gPgo+ID4gPiBDdXJyZW50bHkg
b25lIGNhbiBjaXJjdW12ZW50IERSTV9BVVRILCB3aGVuIHRoZSBpb2N0bCBpcyBleHBvc2VkIHZp
YSB0aGUKPiA+ID4gcmVuZGVyIG5vZGUuIEEgc2VlbWluZ2x5IGRlbGliZXJhdGUgZGVzaWduIGRl
Y2lzaW9uLgo+ID4gPgo+ID4gPiBIZW5jZSB3ZSBjYW4gZHJvcCB0aGUgRFJNX0FVVEggYWxsIHRv
Z2V0aGVyIChkZXRhaWxzIGluIGZvbGxvdy11cCBwYXRjaCkKPiA+ID4geWV0IG5vdCBhbGwgdXNl
cnNwYWNlIGNoZWNrcyBpZiBpdCdzIGF1dGhlbnRpY2F0ZWQsIGJ1dCBpbnN0ZWFkIHVzZXMKPiA+
ID4gdW5jb21tb24gYXNzdW1wdGlvbnMuCj4gPiA+Cj4gPiA+IEFmdGVyIGRheXMgb2YgZGlnZ2lu
ZyB0aHJvdWdoIGdpdCBsb2cgYW5kIHRlc3RpbmcsIG9ubHkgYSBzaW5nbGUgKGFiKXVzZQo+ID4g
PiB3YXMgc3BvdHRlZCAtIHRoZSBNZXNhIFJBRFYgZHJpdmVyLCB1c2luZyB0aGUgQU1ER1BVX0lO
Rk8gaW9jdGwgYW5kCj4gPiA+IGFzc3VtaW5nIHRoYXQgZmFpbHVyZSBpbXBsaWVzIGxhY2sgb2Yg
YXV0aGVudGljYXRpb24uCj4gPiA+Cj4gPiA+IEFmZmVjdGVkIHZlcnNpb25zIGFyZToKPiA+ID4g
ICAtIHRoZSB3aG9sZSAxOC4yLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiA+ID4gICAtIHRoZSB3
aG9sZSAxOC4zLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiA+ID4gICAtIHRoZSAxOS4wLnggc2Vy
aWVzLCBwcmlvciB0byAxOS4wLjQKPiA+IAo+ID4gV2VsbCB5b3UgY291bGQgaGF2ZSBzYXZlZCB5
b3VyIHRpbWUsIGNhdXNlIHRoaXMgaXMgc3RpbGwgYSBOQUsuCj4gPiAKPiA+IEZvciB0aGUgcmVj
b3JkOiBJIHN0cm9uZ2x5IHRoaW5rIHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBleHBvc2UgYW55IHJl
bmRlciAKPiA+IGZ1bmN0aW9uYWxpdHkgb24gdGhlIHByaW1hcnkgbm9kZS4KPiA+IAo+ID4gVG8g
ZXZlbiBnbyBhIHN0ZXAgZnVydGhlciBJIHdvdWxkIHNheSB0aGF0IGF0IGxlYXN0IG9uIEFNRCBo
YXJkd2FyZSB3ZSAKPiA+IHNob3VsZCBjb21wbGV0ZWx5IGRpc2FibGUgRFJJMiBmb3Igb25lIG9m
IHRoZSBuZXh0IGdlbmVyYXRpb25zLgo+ID4gCj4gPiBBcyBhIGZvbGxvdyB1cCBJIHdvdWxkIHRo
ZW4gY29tcGxldGVseSBkaXNhbGxvdyB0aGUgRFJNIGF1dGhlbnRpY2F0aW9uIAo+ID4gZm9yIGFt
ZGdwdSwgc28gdGhhdCB0aGUgY29tbWFuZCBzdWJtaXNzaW9uIGludGVyZmFjZSBvbiB0aGUgcHJp
bWFyeSBub2RlIAo+ID4gY2FuIG9ubHkgYmUgdXNlZCBieSB0aGUgZGlzcGxheSBzZXJ2ZXIuCj4g
Cj4gU28gYW1kZ3B1IGlzIHJ1bm5pbmcgaW4gb25lIGRpcmVjdGlvbiwgd2hpbGUgZXZlcnlvbmUg
ZWxzZSBpcyBydW5uaW5nIGluCj4gdGhlIG90aGVyIGRpcmVjdGlvbj8gUGxlYXNlIG5vdGUgdGhh
dCB5b3VyIHBhdGNoIHRvIGNoYW5nZSBpOTE1IGxhbmRlZAo+IGFscmVhZHksIHNvIHRoYXQgc2hp
cCBpcyBzYWlsaW5nIChidXQgd2UgY291bGQgb2ZjIHJldmVydCB0aGF0IGJhY2sKPiBhZ2Fpbiku
Cj4gCj4gSW1vIHJlYWxseSBub3QgYSBncmVhdCBpZGVhIGlmIHdlIGRvIGEgYW1kZ3B1IHZzLiBl
dmVyeW9uZSBlbHNlIHNwbGl0Cj4gaGVyZS4gSWYgd2Ugd2FudCB0byBkZXByZWNhdGUgZHJpMi9m
bGluay9yZW5kZXJpbmcgb24gcHJpbWFyeSBub2RlcyBhY3Jvc3MKPiB0aGUgc3RhY2ssIHRoZW4g
dGhhdCBzaG91bGQgYmUgYSBzdGFjayB3aWRlIGRlY2lzaW9uLCBub3QgYW4gYW1kZ3B1IG9uZS4K
PiAKQ2Fubm90IGFncmVlIG1vcmUgLSBJIHdvdWxkIGxvdmUgdG8gc2VlIGRyaXZlcnMgc3RheSBj
b25zaXN0ZW50LgoKRndpdywgdGhpcyBzZXJpZXMgY29uc2lzdGVudGx5IHBhdmVzIHRoZSB3YXkg
dG93YXJkIG51a2luZyBEUk1fQVVUSCA7LSkKClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
