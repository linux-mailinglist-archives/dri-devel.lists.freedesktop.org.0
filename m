Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1465A462
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 20:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2126E180;
	Fri, 28 Jun 2019 18:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC38E6E180;
 Fri, 28 Jun 2019 18:43:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g135so10024646wme.4;
 Fri, 28 Jun 2019 11:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQUhM9r4CIKRmotw4FR58r0gyvTp++xsA9JoTrGG8Uc=;
 b=sX5JLjq4jzEaFhCOBDzjoMFResCKb0omb+oF9ujhKYjn2r42MyTlpgbuvanvnXZmkL
 CFyRHi0gL5h1VlfXmhJlvP6D2fP+AlaojBtoj0ySrbx2wZbFkHpnKIWml/PwKyYt/56k
 bEMHMSFtrg2ROGoU/0z4sv8HTWyWUz/mvrnGSNTAVX4rzUwuofVx4rc5/j5BLPZUSSpF
 NOeOd+fgwB1D3At3ATKn+xAwF2VSFM/+EGhPokFrR+PTvZzAO00sucd00YToAzSfDM2w
 juUXrQU1ep1wFOY+xD7+28E/4nq4Al5v0Kd6P95aIge985I/nRf3xf9ldmU97WYm2h2G
 r4bQ==
X-Gm-Message-State: APjAAAWUk2xuDMLXl2DbjLcexAAcFnndOHKAYtgXIeezRsSILeH7soP/
 hVoYLqdEuatKBaNWESoOEnxcwVtDq3zjh1phTuY=
X-Google-Smtp-Source: APXvYqyBJS1+omg7dVNURS337DZRB0h4Ovl7L3QvhyX2PrqzTwpRSQ3xy8VbXVr+cmFFUxnh3zcWJGf7Qhp9jaQYhYE=
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr8096000wme.29.1561747410274; 
 Fri, 28 Jun 2019 11:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-5-Kenny.Ho@amd.com>
 <20190626160553.GR12905@phenom.ffwll.local>
 <CAOWid-eurCMx1F7ciUwx0e+p=s=NP8=UxQUhhF-hdK-iAna+fA@mail.gmail.com>
 <20190626214113.GA12905@phenom.ffwll.local>
 <CAOWid-egYGijS0a6uuG4mPUmOWaPwF-EKokR=LFNJ=5M+akVZw@mail.gmail.com>
 <20190627054320.GB12905@phenom.ffwll.local>
 <CAOWid-cT4TQ7HGzcSWjmLGjAW_D1hRrkNguEiV8N+baNiKQm_A@mail.gmail.com>
 <20190627212401.GO12905@phenom.ffwll.local>
In-Reply-To: <20190627212401.GO12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 28 Jun 2019 14:43:18 -0400
Message-ID: <CAOWid-dZQhpKHxYEFn+X+WSep+B66M_LtN6v0=4-uO3ecZ0pcg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/11] drm,
 cgroup: Add total GEM buffer allocation limit
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jQUhM9r4CIKRmotw4FR58r0gyvTp++xsA9JoTrGG8Uc=;
 b=Qy9LZUw5CE9q0OFvHGXplF7+5qpKs00X0FyzY3jtZrUagXfDwwdTcYnVBTglDSOji2
 WMGjVKa9BGZEuhPRNYvBSw618iq62H+vcVWW/ojjh4jFoUMLAKtXHl3lJoYmR0Vb9IlC
 nFW6+ARqt7D+4yDnoK8LcMZtyEJf2zf9GuexUTVaZzZ/j1hYF3aJJL657WTs1tFLPuYN
 V+/fLYtX9BzAOiHs6zFeYbgKC25GG4Zb2aLrK5bqxUXl0acGG6r0DUi2GESA/Hk9Amu3
 aDclm7HuDZ0yTA4twM3k7Pbe8G7sJG5v72n4jdkqMUVbUY24AqjnHLrcU0kg5G9TwkM2
 Pjmw==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgNToyNCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+IE9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDAyOjQyOjQzUE0gLTA0MDAs
IEtlbm55IEhvIHdyb3RlOgo+ID4gVW0uLi4gSSBhbSBnb2luZyB0byBnZXQgYSBiaXQgcGhpbG9z
b3BoaWNhbCBoZXJlIGFuZCBzdWdnZXN0IHRoYXQgdGhlCj4gPiBpZGVhIG9mIHNoYXJpbmcgKGVz
cGVjaWFsbHkgdW5jb250cm9sbGVkIHNoYXJpbmcpIGlzIGluaGVyZW50bHkgYXQgb2RkCj4gPiB3
aXRoIGNvbnRhaW5tZW50LiAgSXQncyBsaWtlLCBpZiBldmVyeWJvZHkgaXMgc3BlY2lhbCwgbm8g
b25lIGlzCj4gPiBzcGVjaWFsLiAgUGVyaGFwcyBhbiBhbHRlcm5hdGl2ZSBpcyB0byBtYWtlIHRo
aXMgY29uZmlndXJhYmxlIHNvIHRoYXQKPiA+IHBlb3BsZSBjYW4gYWxsb3cgc2hhcmluZyBrbm93
aW5nIHRoZSBjYXZlYXQ/ICBBbmQganVzdCB0byBiZSBjbGVhciwKPiA+IHRoZSBjdXJyZW50IHNv
bHV0aW9uIGFsbG93cyBmb3Igc2hhcmluZywgZXZlbiBiZXR3ZWVuIGNncm91cC4KPgo+IFRoZSB0
aGluZyBpcywgd2h5IHNob3VsZG4ndCB3ZSBqdXN0IGFsbG93IGl0ICh3aXRoIHNvbWUgZG9jdW1l
bnRlZAo+IGNhdmVhdCk/Cj4KPiBJIG1lYW4gaWYgYWxsIHBlb3BsZSBkbyBpcyBzaGFyZSBpdCBh
cyB5b3VyIGN1cnJlbnQgcGF0Y2hlcyBhbGxvdywgdGhlbgo+IHRoZXJlJ3Mgbm90aGluZyBmdW5u
eSBnb2luZyBvbiAoYXQgbGVhc3QgaWYgd2UgZ28gd2l0aCBqdXN0IGxlYWtpbmcgdGhlCj4gYWxs
b2NhdGlvbnMpLiBJZiB3ZSBhbGxvdyBhZGRpdGlvbmFsIHNoYXJpbmcsIHRoZW4gdGhhdCdzIGEg
cGx1cy4KVW0uLi4gcGVyaGFwcyBJIHdhcyBiZWluZyBvdmVybHkgY29uc2VydmF0aXZlIDopLiAg
U28gbGV0IG1lCmlsbHVzdHJhdGUgd2l0aCBhbiBleGFtcGxlIHRvIGFkZCBtb3JlIGNsYXJpdHkg
YW5kIGdldCBtb3JlIGNvbW1lbnRzCm9uIGl0LgoKTGV0IHNheSB3ZSBoYXZlIHRoZSBmb2xsb3dp
bmcgY2dyb3VwIGhpZXJhcmNoeSAoVGhlIGxldHRlcnMgYXJlCmNncm91cHMgd2l0aCBSIGJlaW5n
IHRoZSByb290IGNncm91cC4gIFRoZSBudW1iZXJzIGluIGJyYWNrZXRzIGFyZQpwcm9jZXNzZXMu
ICBUaGUgcHJvY2Vzc2VzIGFyZSBwbGFjZWQgd2l0aCB0aGUgJ05vIEludGVybmFsIFByb2Nlc3MK
Q29uc3RyYWludCcgaW4gbWluZC4pClIgKDQsIDUpIC0tLS0tLSBBICg2KQogIFwKICAgIEIgLS0t
LSBDICg3LDgpCiAgICAgXAogICAgICAgRCAoOSkKCkhlcmUgaXMgYSBsaXN0IG9mIG9wZXJhdGlv
biBhbmQgdGhlIGFzc29jaWF0ZWQgZWZmZWN0IG9uIHRoZSBzaXplCnRyYWNrIGJ5IHRoZSBjZ3Jv
dXBzIChmb3Igc2ltcGxpY2l0eSwgZWFjaCBidWZmZXIgaXMgMSB1bml0IGluIHNpemUuKQpXaXRo
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gKGNoYXJnZSBvbiBidWZmZXIgY3JlYXRpb24gd2l0aApy
ZXN0cmljdGlvbiBvbiBzaGFyaW5nLikKUiAgIEEgICBCICAgQyAgIEQgICB8T3BzCj09PT09PT09
PT09PT09PT0KMSAgIDAgICAwICAgMCAgIDAgICB8NCBhbGxvY2F0ZWQgYSBidWZmZXIKMSAgIDAg
ICAwICAgMCAgIDAgICB8NCBzaGFyZWQgYSBidWZmZXIgd2l0aCA1CjEgICAwICAgMCAgIDAgICAw
ICAgfDQgc2hhcmVkIGEgYnVmZmVyIHdpdGggOQoyICAgMCAgIDEgICAwICAgMSAgIHw5IGFsbG9j
YXRlZCBhIGJ1ZmZlcgozICAgMCAgIDIgICAxICAgMSAgIHw3IGFsbG9jYXRlZCBhIGJ1ZmZlcgoz
ICAgMCAgIDIgICAxICAgMSAgIHw3IHNoYXJlZCBhIGJ1ZmZlciB3aXRoIDgKMyAgIDAgICAyICAg
MSAgIDEgICB8NyBzaGFyaW5nIHdpdGggOSAobm90IGFsbG93ZWQpCjMgICAwICAgMiAgIDEgICAx
ICAgfDcgc2hhcmluZyB3aXRoIDQgKG5vdCBhbGxvd2VkKQozICAgMCAgIDIgICAxICAgMSAgIHw3
IHJlbGVhc2UgYSBidWZmZXIKMiAgIDAgICAxICAgMCAgIDEgICB8OCByZWxlYXNlIGEgYnVmZmVy
IGZyb20gNwoKVGhlIHN1Z2dlc3Rpb24gYXMgSSB1bmRlcnN0YW5kIGl0IChjaGFyZ2UgcGVyIGJ1
ZmZlciByZWZlcmVuY2Ugd2l0aAp1bnJlc3RyaWN0ZWQgc2hhcmluZy4pClIgICBBICAgQiAgIEMg
ICBEICAgfE9wcwo9PT09PT09PT09PT09PT09CjEgICAwICAgMCAgIDAgICAwICAgfDQgYWxsb2Nh
dGVkIGEgYnVmZmVyCjIgICAwICAgMCAgIDAgICAwICAgfDQgc2hhcmVkIGEgYnVmZmVyIHdpdGgg
NQozICAgMCAgIDAgICAwICAgMSAgIHw0IHNoYXJlZCBhIGJ1ZmZlciB3aXRoIDkKNCAgIDAgICAx
ICAgMCAgIDIgICB8OSBhbGxvY2F0ZWQgYSBidWZmZXIKNSAgIDAgICAyICAgMSAgIDEgICB8NyBh
bGxvY2F0ZWQgYSBidWZmZXIKNiAgIDAgICAzICAgMiAgIDEgICB8NyBzaGFyZWQgYSBidWZmZXIg
d2l0aCA4CjcgICAwICAgNCAgIDIgICAyICAgfDcgc2hhcmluZyB3aXRoIDkKOCAgIDAgICA0ICAg
MiAgIDIgICB8NyBzaGFyaW5nIHdpdGggNAo3ICAgMCAgIDMgICAxICAgMiAgIHw3IHJlbGVhc2Ug
YSBidWZmZXIKNiAgIDAgICAyICAgMCAgIDIgICB8OCByZWxlYXNlIGEgYnVmZmVyIGZyb20gNwoK
SXMgdGhpcyBhIGNvcnJlY3QgdW5kZXJzdGFuZGluZyBvZiB0aGUgc3VnZ2VzdGlvbj8KClJlZ2Fy
ZHMsCktlbm55Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
