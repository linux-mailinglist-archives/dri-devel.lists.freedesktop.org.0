Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC8D5E6F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761648938C;
	Mon, 14 Oct 2019 09:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3508938C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:16:39 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c4so14170425edl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 02:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=d8Jpp+ZNyeMIECLhU8stIu5ojWvnBY0aBAMY/MpsQ2k=;
 b=YSsYn35jsKuUjG75UmOgHZZ5uWcP1AkWoCFC6ZEwfvj1bu2U1kJKWZ0LmU1fT3d5yr
 GYg4ZZNmQExUKSL4JFuHHQ7u0P1TMO7wdQD63mHCOSOOIuXHpwPATvq5aDDAEo9UVVYf
 AKX2t0cKmHcAW4N3pbJylktBQI3r8VqELMXE6MmH/4kkTNzGTffz6u3nLLP0eHl4Je9I
 +6lhjkW6UpAmb2EZovDCO4VqU4PxndFqLguJNkJi88GuZ0SvA/rsRzRcM9yVHwOGozN1
 d8ZzsqAQ7Zn9aTxilTBFZ2Pdpccyc8noZARxGR7I9/d50hPd9gN1M5+HGeLNS9Ir6a4X
 sPKQ==
X-Gm-Message-State: APjAAAURrTp9d2eZ/0T4A1dcff78y00x7q15UYKXfesSxWjo+PiICBIK
 3gXCXAdf1nsA/baXi5dcamBjUw==
X-Google-Smtp-Source: APXvYqzV5ULbBVu4tlr7KIdPTRWorn11s+O/SdFjTBjSfIeo8Hcbdl95adE/jj1Lg/k1T3ENwiaOhg==
X-Received: by 2002:aa7:c556:: with SMTP id s22mr27059909edr.105.1571044598174; 
 Mon, 14 Oct 2019 02:16:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id gx14sm2239181ejb.38.2019.10.14.02.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 02:16:37 -0700 (PDT)
Date: Mon, 14 Oct 2019 11:16:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>
Subject: Re: WARNING in drm_mode_createblob_ioctl
Message-ID: <20191014091635.GI11828@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>, 
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run,
 syzkaller-bugs@googlegroups.com
References: <000000000000b2de3a0594d8b4ca@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000b2de3a0594d8b4ca@google.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=d8Jpp+ZNyeMIECLhU8stIu5ojWvnBY0aBAMY/MpsQ2k=;
 b=b4CjXUhaDh5V5oSXdLp/N67GUtShbU8b5VZIcqzq+wEro6yUGpwdYVnICq9N5M6nhJ
 LlieGbgdTyq7BMwUYDZ/uzN6u+XXNRaLJp9Idz+cgPdc5xMZWiR8EtNKrhuJvWyTvI+H
 JBxzlPf6+MC9ADl4y7sVAeie/ybms+opGMWy4=
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
Cc: airlied@linux.ie, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgMTMsIDIwMTkgYXQgMTE6MDk6MDlQTSAtMDcwMCwgc3l6Ym90IHdyb3RlOgo+
IEhlbGxvLAo+IAo+IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOgo+IAo+IEhF
QUQgY29tbWl0OiAgICA4YWRhMjI4YSBBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3Ig
MjAxOTEwMTEKPiBnaXQgdHJlZTogICAgICAgbGludXgtbmV4dAo+IGNvbnNvbGUgb3V0cHV0OiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNDIzYTg3ZjYwMDAwMAo+
IGtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/
eD03Y2Y0ZWVkNWZlNDJjMzFhCj4gZGFzaGJvYXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL2J1Zz9leHRpZD1mYjc3ZTk3ZWJmMDYxMmVlNjkxNAo+IGNvbXBpbGVyOiAgICAg
ICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1lbnRhbCkKPiAKPiBVbmZvcnR1bmF0
ZWx5LCBJIGRvbid0IGhhdmUgYW55IHJlcHJvZHVjZXIgZm9yIHRoaXMgY3Jhc2ggeWV0LgoKSG0g
b25seSB0aGluZyB0aGF0IGNvdWxkIGdvIHdyb25nIGlzIGhvdyB3ZSBhbGxvY2F0ZSB0aGUgdGFy
Z2V0IGZvciB0aGUKdXNlcl9jb3B5LCB3aGljaCBpcyBhbiBhcmd1bWVudCBkaXJlY3RseSBmcm9t
IHRoZSBpb2N0bCBwYXJhbWV0ZXIgc3RydWN0LgpEb2VzIHN5emJvdCBub3QgdHJhY2sgdGhhdD8g
V2UgdXNlIHRoZSBzdGFuZGFyZCBsaW51eCBpb2N0bCBzdHJ1Y3QKZW5jb2RpbmcgaW4gZHJtLgoK
T3RoZXJ3aXNlIEkgaGF2ZSBubyBpZGVhIHdoeSBpdCBjYW4ndCBjcmVhdGUgYSByZWxpYWJsZSBy
ZXByb2R1Y2VyIGZvcgp0aGlzIC4uLiBJJ20gYWxzbyBub3Qgc2VlaW5nIHRoZSBidWcsIGFsbCB0
aGUgaW5wdXQgdmFsaWRhdGlvbiB3ZSBoYXZlCnNlZW1zIGNvcnJlY3QgOi0vCi1EYW5pZWwKPiAK
PiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGJ1ZywgcGxlYXNlIGFkZCB0aGUgZm9sbG93aW5n
IHRhZyB0byB0aGUgY29tbWl0Ogo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrZmI3N2U5N2ViZjA2MTJl
ZTY5MTRAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IAo+IC0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLQo+IFdBUk5JTkc6IENQVTogMSBQSUQ6IDMwNDQ5IGF0IGluY2x1ZGUv
bGludXgvdGhyZWFkX2luZm8uaDoxNTAKPiBjaGVja19jb3B5X3NpemUgaW5jbHVkZS9saW51eC90
aHJlYWRfaW5mby5oOjE1MCBbaW5saW5lXQo+IFdBUk5JTkc6IENQVTogMSBQSUQ6IDMwNDQ5IGF0
IGluY2x1ZGUvbGludXgvdGhyZWFkX2luZm8uaDoxNTAgY29weV9mcm9tX3VzZXIKPiBpbmNsdWRl
L2xpbnV4L3VhY2Nlc3MuaDoxNDMgW2lubGluZV0KPiBXQVJOSU5HOiBDUFU6IDEgUElEOiAzMDQ0
OSBhdCBpbmNsdWRlL2xpbnV4L3RocmVhZF9pbmZvLmg6MTUwCj4gZHJtX21vZGVfY3JlYXRlYmxv
Yl9pb2N0bCsweDM5OC8weDQ5MCBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmM6ODAwCj4g
S2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IHBhbmljX29uX3dhcm4gc2V0IC4uLgo+IENQVTog
MSBQSUQ6IDMwNDQ5IENvbW06IHN5ei1leGVjdXRvci41IE5vdCB0YWludGVkIDUuNC4wLXJjMi1u
ZXh0LTIwMTkxMDExCj4gIzAKPiBIYXJkd2FyZSBuYW1lOiBHb29nbGUgR29vZ2xlIENvbXB1dGUg
RW5naW5lL0dvb2dsZSBDb21wdXRlIEVuZ2luZSwgQklPUwo+IEdvb2dsZSAwMS8wMS8yMDExCj4g
Q2FsbCBUcmFjZToKPiAgX19kdW1wX3N0YWNrIGxpYi9kdW1wX3N0YWNrLmM6NzcgW2lubGluZV0K
PiAgZHVtcF9zdGFjaysweDE3Mi8weDFmMCBsaWIvZHVtcF9zdGFjay5jOjExMwo+ICBwYW5pYysw
eDJlMy8weDc1YyBrZXJuZWwvcGFuaWMuYzoyMjEKPiAgX193YXJuLmNvbGQrMHgyZi8weDM1IGtl
cm5lbC9wYW5pYy5jOjU4Mgo+ICByZXBvcnRfYnVnKzB4Mjg5LzB4MzAwIGxpYi9idWcuYzoxOTUK
PiAgZml4dXBfYnVnIGFyY2gveDg2L2tlcm5lbC90cmFwcy5jOjE3NCBbaW5saW5lXQo+ICBmaXh1
cF9idWcgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MTY5IFtpbmxpbmVdCj4gIGRvX2Vycm9yX3Ry
YXArMHgxMWIvMHgyMDAgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MjY3Cj4gIGRvX2ludmFsaWRf
b3ArMHgzNy8weDUwIGFyY2gveDg2L2tlcm5lbC90cmFwcy5jOjI4Ngo+ICBpbnZhbGlkX29wKzB4
MjMvMHgzMCBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TOjEwMjgKPiBSSVA6IDAwMTA6Y2hlY2tf
Y29weV9zaXplIGluY2x1ZGUvbGludXgvdGhyZWFkX2luZm8uaDoxNTAgW2lubGluZV0KPiBSSVA6
IDAwMTA6Y29weV9mcm9tX3VzZXIgaW5jbHVkZS9saW51eC91YWNjZXNzLmg6MTQzIFtpbmxpbmVd
Cj4gUklQOiAwMDEwOmRybV9tb2RlX2NyZWF0ZWJsb2JfaW9jdGwrMHgzOTgvMHg0OTAKPiBkcml2
ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmM6ODAwCj4gQ29kZTogYzEgZWEgMDMgODAgM2MgMDIg
MDAgMGYgODUgZWQgMDAgMDAgMDAgNDkgODkgNWQgMDAgZTggM2MgMjggY2IgZmQgNGMKPiA4OSBm
NyBlOCA2NCA5MiA5ZSAwMyAzMSBjMCBlOSA3NSBmZCBmZiBmZiBlOCAyOCAyOCBjYiBmZCA8MGY+
IDBiIGU4IDIxIDI4IGNiCj4gZmQgNGQgODUgZTQgYjggZjIgZmYgZmYgZmYgMGYgODQgNWIgZmQg
ZmYgZmYgODkKPiBSU1A6IDAwMTg6ZmZmZjg4ODA1ODRlZmFhOCBFRkxBR1M6IDAwMDEwMjQ2Cj4g
UkFYOiAwMDAwMDAwMDAwMDQwMDAwIFJCWDogZmZmZjg4ODBhM2E5MDAwMCBSQ1g6IGZmZmZjOTAw
MTA5ZGEwMDAKPiBSRFg6IDAwMDAwMDAwMDAwNDAwMDAgUlNJOiBmZmZmZmZmZjgzYTdlYWY4IFJE
STogMDAwMDAwMDAwMDAwMDAwNwo+IFJCUDogZmZmZjg4ODA1ODRlZmFlOCBSMDg6IGZmZmY4ODgw
OTZjNDAwODAgUjA5OiBmZmZmZWQxMDE0NzUyMTEwCj4gUjEwOiBmZmZmZWQxMDE0NzUyMTBmIFIx
MTogZmZmZjg4ODBhM2E5MDg3ZiBSMTI6IGZmZmZjOTAwMTQ5MDcwMDAKPiBSMTM6IGZmZmY4ODgw
MjhhYTAwMDAgUjE0OiAwMDAwMDAwMDlhNmM3OTY5IFIxNTogZmZmZmM5MDAxNDkwNzA1OAo+IAo+
IAo+IC0tLQo+IFRoaXMgYnVnIGlzIGdlbmVyYXRlZCBieSBhIGJvdC4gSXQgbWF5IGNvbnRhaW4g
ZXJyb3JzLgo+IFNlZSBodHRwczovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5mb3JtYXRpb24g
YWJvdXQgc3l6Ym90Lgo+IHN5emJvdCBlbmdpbmVlcnMgY2FuIGJlIHJlYWNoZWQgYXQgc3l6a2Fs
bGVyQGdvb2dsZWdyb3Vwcy5jb20uCj4gCj4gc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlz
IGJ1ZyByZXBvcnQuIFNlZToKPiBodHRwczovL2dvby5nbC90cHNtRUojc3RhdHVzIGZvciBob3cg
dG8gY29tbXVuaWNhdGUgd2l0aCBzeXpib3QuCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
