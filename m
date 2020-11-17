Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A32B5DF3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 12:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250989F27;
	Tue, 17 Nov 2020 11:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF589F27
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:08:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so22722553wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 03:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=n6eCU59I1t0nmoUX/JMABtcH5UW5JkFeV2XR6hvO1PI=;
 b=wm7D0wAEo/rWM9cDVPNP5RJ17YGDvBs3Tv2wZAk+20keQeqxp782e2psf5adEkIAJw
 sBzqmKCyhVS9E/+1ZFLwEgN3IGBwv06ht4IKnvs3OdAZ/BSIrESIv6+YNUhFSivZUN3g
 bHTUf04wf+adxGk6uiLU0VYv/h2+FF9fe1ba7+XebaHBxy+Fwklt8xJiqTkqh/rgccdz
 6mvX0bJM9e0n3niU4ktFpOUEYcqJZuH1a5cjr8asHLStTp15n0noMZqXMOwpawMzLk34
 UHtHlyUEZlJTjy0VxYitue+UMwBcb7116/uy9rSHCJ7jaNkAygkvzsjFAdahI5uualMJ
 teFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n6eCU59I1t0nmoUX/JMABtcH5UW5JkFeV2XR6hvO1PI=;
 b=AnLlcldtIVZd+LSroMvzw3dWjkKzU5gwUePgqgPrqaR/LS7uaszKpyeCWTvdaw8utM
 40DylTX0i5Nsn/ndWgLVlIn6Mh6AnEwcwEWeKEYVNe7T6dT6Yu+oubWLG/LtOw7FvU3F
 C62eoH7+uxwCbidKZLoNm/njc78jWb+g7oZQkND0Ks1sFYIWaoSp4lDlXXjiOBPXagwu
 84QbRMqoUZFwwHCxuwMspUWmYlTGtOo62pJRFPw26IWpFhbg4/iCuirWcALGf6DwVsSO
 Kl78IPMO89T6LGDFxptcIzZ1yNSNiQKsFvCWoZ27ZctMP0/hpTIfLKF2GWeDsEkYCT1I
 2Ufg==
X-Gm-Message-State: AOAM530M1vy0d6GlyVYOfjXzVkcH3ECKcvOqeXHhHA5Zsw0s5TWdPa+Q
 a/6PWFZWzwpz0Wnj8XDASxNNhYB0SBl26qgD
X-Google-Smtp-Source: ABdhPJyt5w/xfOns8zFWyU7ejsnKVtooG6J4Era6ZK54EsNK4dAphhyhJTCzhXH1vwllX5WPUSGCyQ==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr25144803wrh.288.1605611289487; 
 Tue, 17 Nov 2020 03:08:09 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm2919301wmf.35.2020.11.17.03.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 03:08:08 -0800 (PST)
Date: Tue, 17 Nov 2020 11:08:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
Message-ID: <20201117110807.GG1869941@dell>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
 <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
 <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
 <CAF2Aj3jRFM95R7VaV_4Chi3Tr3ja31EjdVTeHeDkUWETweqCGA@mail.gmail.com>
 <20201117100509.GJ401619@phenom.ffwll.local>
 <20201117103404.GF1869941@dell>
 <20201117104311.GK401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117104311.GK401619@phenom.ffwll.local>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBOb3YgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gVHVlLCBOb3Yg
MTcsIDIwMjAgYXQgMTA6MzQ6MDRBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gRGFuaWVs
LAo+ID4gCj4gPiBGb3Igc29tZSByZWFzb24sIHlvdSdyZSBub3QgYXBwZWFyaW5nIGluIHRoZSBy
ZWNpcGVudHMgbGlzdCB3aGVuIEkKPiA+IHJlcGx5IHRvIGFsbC4gIFlvdSdyZSBub3QgaW4gdGhl
IE1haWwtRm9sbG93dXAtVG8gaGVhZGVyLiAgQW55IGlkZWEKPiA+IHdoeSB0aGlzIG1pZ2h0IGJl
Pwo+IAo+IE5vIGlkZWEgZWl0aGVyLCBjb3VsZCBiZSBteSBtdXR0IG5vdCBzZXR0aW5nIHRoZSBy
ZXBseSBoZWFkZXJzIGxpa2UgaXQKPiBzaG91bGQuIEknbSBnZW5lcmFsbHkgY29uZnVzZWQgd2l0
aCBob3cgZW1haWwgd29ya3MgLi4uCgpZZXMsIGVtYWlsIGlzIGEgbXlzdGVyeSEKCj4gPiBBbnl3
YXksIHBsZWFzZSBzZWUgYmVsb3c6Cj4gPiAKPiA+IE9uIFR1ZSwgMTcgTm92IDIwMjAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTm92IDEzLCAyMDIwIGF0IDEwOjAxOjU3UE0g
KzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+ID4gPiBPbiBGcmksIDEzIE5vdiAyMDIwLCAyMToz
MSBEYW5pZWwgVmV0dGVyLCA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+ID4gPiAKPiA+ID4g
PiA+IE9uIEZyaSwgTm92IDEzLCAyMDIwIGF0IDk6NTMgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IE9uIEZyaSwgMTMgTm92IDIwMjAsIDIwOjUwIERhbmllbCBWZXR0ZXIsIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IE9uIFRodSwgTm92
IDEyLCAyMDIwIGF0IDA5OjI1OjE2UE0gKzAxMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+ID4g
PiA+ID4+ID4gSGkgTGVlLAo+ID4gPiA+ID4gPj4gPgo+ID4gPiA+ID4gPj4gPiBPbiBUaHUsIE5v
diAxMiwgMjAyMCBhdCAwNzowMDoxMVBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4g
PiA+PiA+ID4gVGhlIHByZWNlZGVudCBoYXMgYWxyZWFkeSBiZWVuIHNldCBieSBvdGhlciBtYWNy
b3MgaW4gdGhlIHNhbWUgZmlsZS4KPiA+ID4gPiA+ID4+ID4gPgo+ID4gPiA+ID4gPj4gPiA+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gPiA+ID4g
Pj4gPiA+Cj4gPiA+ID4gPiA+PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmM6
NTU6MTk6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGNydGPigJkKPiA+ID4gPiA+IHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPiA+ID4gPiA+PiA+ID4gIDU1IHwg
c3RydWN0IGRybV9jcnRjICpjcnRjOwo+ID4gPiA+ID4gPj4gPiA+ICB8IF5+fn4KPiA+ID4gPiA+
ID4+ID4gPgo+ID4gPiA+ID4gPj4gPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gPiA+ID4gPj4gPiA+IENjOiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiA+PiA+ID4gQ2M6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gPiA+ID4gPj4gPiA+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+ID4gPiA+PiA+ID4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gPiA+ID4+ID4gPiBDYzogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAZ21haWwuY29tPgo+ID4gPiA+ID4gPj4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiA+PiA+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+ID4gPiA+ID4+ID4KPiA+ID4gPiA+ID4+ID4gQWxzbyBh
cHBsaWVkIHRvIGRybS1taXNjLW5leHQuCj4gPiA+ID4gPiA+PiA+IFRoaXMgd2FzIHRoZSBsYXN0
IHBhdGNoIGZyb20gdGhpcyBiYXRjaCBJIHdpbGwgcHJvY2Vzcy4KPiA+ID4gPiA+ID4+ID4gVGhl
IG90aGVycyBhcmUgbGVmdCBmb3IgdGhlIG1haW50YWluZXJzIHRvIHBpY2sgdXAuCj4gPiA+ID4g
PiA+Pgo+ID4gPiA+ID4gPj4gYnR3IGZvciBwYXRjaGVzIHRoYXQgbWFpbnRhaW5lcnMgZG9uJ3Qg
cGljayB1cCwgdGhlIHVzdWFsIHByb2Nlc3MgaXMKPiA+ID4gPiA+IHRoYXQKPiA+ID4gPiA+ID4+
IHdlIGdpdmUgdGhlbSAyIHdlZWtzLCB0aGVuIGp1c3QgbWFzcyBhcHBseS4gTm93IHlvdSdyZSBw
cm9kdWNpbmcgYSBsb3QKPiA+ID4gPiA+IG9mCj4gPiA+ID4gPiA+PiBwYXRjaGVzLCB0b28gbXVj
aCBmb3IgbWUgdG8ga2VlcCB0cmFjaywgc28gcGxlYXNlIGp1c3QgcGluZyBtZSB3aXRoIGEKPiA+
ID4gPiA+ID4+IHJlc2VuZCBmb3IgdGhvc2UgdGhhdCBleHBpcmVkIGFuZCBJJ2xsIGdvIHRocm91
Z2ggYW5kIHBpY2sgdGhlbSBhbGwgdXAuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IFRoYXQncyBncmVhdCBEYW5pZWwuIFRoYW5rcyBmb3IgeW91ciBzdXBwb3J0Lgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBJIGNhbiBkbyBvbmUgYmV0dGVyIHRoYW4gdGhhdC4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gV291bGQgYSBwdWxsLXJlcXVlc3Qgc3VpdCB5b3U/Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gV2UgaGF2ZSBhIGZldyB0cmVlcyBnb2luZyBvbiwgYW5kIHlvdXIgcGF0Y2hlcyBh
cmUgbGFuZGluZyB0aHJvdWdoIGFsbAo+ID4gPiA+ID4ga2luZHMgb2YgdGhlbS4gU28gdGhpcyBt
aWdodCBiZSBtb3JlIGNvb3JkaW5hdGlvbiBwYWluLiBJZiB5b3UgY2FuCj4gPiA+ID4gPiBleGNs
dWRlIHBhdGNoZXMgZm9yIHRoZSBzZXBhcmF0ZWx5IGFuZCB1c3VhbGx5IGZhaXJseSB3ZWxsIG1h
aW50YWluZWQKPiA+ID4gPiA+IGRyaXZlcnMgb3V0IG9mIHRoZSBwdWxsIGl0IHNob3VsZCB3b3Jr
IChkcm0vYW1kLCBkcm0vcmFkZW9uLCBkcm0vaTkxNSwKPiA+ID4gPiA+IGRybS9ub3V2ZWF1LCBk
cm0vbXNtIGFuZCBkcm0vb21hcGRybSBwcm9iYWJseSB0aGUgdXN1YWwgb25lcykuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gT3IgeW91IGp1c3Qgc2VuZCB0aGUgbmV4dCBwaWxlIGFuZCB3ZSdsbCBzZWUu
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQWxzbyBJIGd1ZXNzIEkgY2FuJ3QgcmVhbGx5IGludGVyZXN0
IHlvdSBpbiBjb21taXQgcmlnaHRzIHNvIHRoaXMKPiA+ID4gPiA+IHBhdGNoIGJvbWJzIGdldCBv
ZmYgbXkgYmFjayBhZ2Fpbj8gOi0pCj4gPiA+ID4gPgo+ID4gPiA+IAo+ID4gPiA+IFdoYXQgZG9l
cyB0aGF0IG1lYW4/IE1lcmdlIG15IG93biBwYXRjaGVzPwo+ID4gPiA+IAo+ID4gPiA+IE5vdCBz
dXJlIGhvdyB0aGF0IHdvcmtzIHdpdGggeW91ciBncm91cCBtYWludGVuYW5jZSBzZXR1cC4KPiA+
ID4gPiAKPiA+ID4gPiBJcyBpdCBqdXN0IGEgYGdpdCBwdXNoYD8KPiA+ID4gCj4gPiA+IEl0J3Mg
YSBidW5jaCBvZiBzY3JpcHRpbmcgYW5kIHNldHVwLCBtaWdodCBub3QgYmUgd29ydGggaXQgZm9y
IGp1c3Qgb25lCj4gPiA+IG9mLiBQbHVzIHdlIHN0aWxsIHRha2UgcHVsbCByZXF1ZXN0cyBmcm9t
IHN1Ym1haW50YWluZXJzIHNvIGl0J3MgYWxsIGp1c3QKPiA+ID4gaWYgeW91IGZlZWwgbGlrZSBp
dC4gU29tZSBkb2NzIGlmIHlvdSdyZSBjdXJpb3VzOgo+ID4gPiAKPiA+ID4gaHR0cHM6Ly9kcm0u
cGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvZ2V0dGluZy1zdGFydGVkLmh0
bWwKPiA+IAo+ID4gQXMgKmZ1biogYXMgdGhhdCBsb29rcywgSSB0aGluayBJJ2xsIGdpdmUgaXQg
YSBtaXNzLCB0aGFua3MuIDopCj4gPiAKPiA+IFNvIGZvciB0aGUgZmluYWwgbWVyZ2Ugb2YgdGhl
IG5vbi1SYWRlb24gc2V0IFswXSB0byBkYXRlIChBbGV4IGp1c3QKPiA+IHB1bGxlZCBpbiBhbGwg
b2YgdGhlIG91dHN0YW5kaW5nIFJhZGVvbiBwYXRjaGVzKSwgd2UgaGF2ZSBhIGZldwo+ID4gb3B0
aW9uczoKPiA+IAo+ID4gIDEuIFRha2UgdGhlbSBkaXJlY3RseSBmcm9tIHRoZSBtb3N0IHJlY2Vu
dCBzZXQgWzBdCj4gPiAgMi4gSSBjYW4gcmViYXNlIGFuZCByZXN1Ym1pdCBhZ2FpbiBpbiBhIGZl
dyBkYXlzCj4gPiAgMy4gSSBjYW4gc3VibWl0IGEgUFIKPiA+IAo+ID4gV2hhdGV2ZXIgd29ya3Mg
Zm9yIHlvdS4KPiA+IAo+ID4gWzBdICJbUEFUQ0ggdjIgMDAvNDJdIFJpZCBXPTEgd2FybmluZ3Mg
ZnJvbSBHUFUgKG5vbi1SYWRlb24pIgo+IAo+IEkgcGxhbm5lZCB0byBnbyB0aHJvdWdoIHRoYXQg
dG9kYXkgYW5kIGFwcGx5IGl0IGFsbC4gV2FudGVkIHRvIHBpbmcgYSBmZXcKPiBtYWludGFpbmVy
cyBmaXJzdCB3aGV0aGVyIHRoZXkgcGljayBhbnl0aGluZyB1cCwgYnV0IGFzaWRlIGZyb20gQWxl
eAo+IHRoZXkncmUgbm9uLWNvbW1pdHRhbCBzbyBJIHRoaW5rIEkganVzdCB2YWN1dW0gdGhlbSBh
bGwgdXAgc28gaXQncyBkb25lLgoKT2theSwgcGVyZmVjdC4gIFRoYW5rcyBhIGJ1bmNoLgoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIg
U2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0Nz
CkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
