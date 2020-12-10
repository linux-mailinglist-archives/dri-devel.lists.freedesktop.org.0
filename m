Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7346C2D5B4D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 14:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A185C6E500;
	Thu, 10 Dec 2020 13:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3D6E51A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:10:22 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id x13so4763924oto.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5SZx0SF1+bmdIPGDx8XS9Yvh6cMFc1HMujYWwx4oFXo=;
 b=ljmsD/nZGyo/+nDuS0o0wS7bR94cQDN8VGl9oI3x9gF6FY1HbovjAwtbwEL91ATJtm
 1xTzwHF+H8teshZzyQ3IR9ZGQiWUlsBu2AfAUddntFcJyQQeHRNrIFzGacznjrhKTKvg
 zGEZhXmHkuly95lHRKyzmo3PZkbgX74s/29oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5SZx0SF1+bmdIPGDx8XS9Yvh6cMFc1HMujYWwx4oFXo=;
 b=FR5dAW2J3SJEY69RnYojBCBVKUjX/eTJdo0TCAesgz7Mlw14sR5HzLwgja2LywYVpq
 Ocd0I6+LFoYEBMmj/5n3pZyzfaf4hSZxWSNUvukITGocyPWEANVxpxr5h7TSupDs9PMu
 W8soSJalcW3e+nEjK/D82RbS6g1XA3ylCfMdwjfbg3SK1StbrzxlDg0UgLhMrPicPXr7
 0HTtJqfWan2oKZFSRLFLJPOVqmdjCxHK4YxzpH5DNECffgn6BC6PQTl7eyWq1jUfC9Y5
 A7mU9jduHKMZTaT/1UI9iZrJnoczfiPr5sRoWCPz7orVKnz7oa2p69dkanvFwV5EB2M/
 6xJg==
X-Gm-Message-State: AOAM530LGTzGjRt/p8feW5M6dg3V57TerDnLNNyqI7TILR9Wswodxj+p
 9+g6OvlfvkI4jVzIjLHmWio5lG2o+cR4z72Brhu8Fg==
X-Google-Smtp-Source: ABdhPJwe0G/fIm4wrIEbslkY/Xrvlb1182PcLJFrYAgq3Tmq7oxccHPXXb0WkMQH6isTqYmJy19qnmcJPRyIsmZ6nTE=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr5751241otb.281.1607605822145; 
 Thu, 10 Dec 2020 05:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com> <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com>
 <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
 <X9IPhEkcZO+Ut5RH@kroah.com>
In-Reply-To: <X9IPhEkcZO+Ut5RH@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Dec 2020 14:10:10 +0100
Message-ID: <CAKMK7uEM636NjEcxLfsKJa9H71i0mkQ3dsT3yWwHTcVFk4r+Sg@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: Android Kernel Team <kernel-team@android.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMTAsIDIwMjAgYXQgMTowNiBQTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIERlYyAxMCwgMjAyMCBhdCAxMjoyNjowMVBN
ICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVGh1LCBEZWMgMTAsIDIwMjAgYXQg
MTE6NTUgQU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBUaHUsIERlYyAxMCwgMjAyMCBhdCAxMToyNzoyN0FNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgRGVjIDEwLCAyMDIwIGF0IDExOjEwOjQ1QU0g
KzAxMDAsIEdyZWcgS0ggd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIERlYyAxMCwgMjAyMCBhdCAx
MDo1ODo1MEFNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiA+ID4gPiBJbiBn
ZW5lcmFsIGEgZ29vZCBpZGVhLCBidXQgSSBoYXZlIGEgZmV3IGNvbmNlcm4vY29tbWVudHMgaGVy
ZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQW0gMTAuMTIuMjAgdW0gMDU6NDMgc2NocmllYiBI
cmlkeWEgVmFsc2FyYWp1Ogo+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHN0YXRpc3Rp
Y3MgdG8gYmUgZW5hYmxlZCBmb3IgZWFjaCBETUEtQlVGIGluCj4gPiA+ID4gPiA+ID4gc3lzZnMg
YnkgZW5hYmxpbmcgdGhlIGNvbmZpZyBDT05GSUdfRE1BQlVGX1NZU0ZTX1NUQVRTLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhlIGZvbGxvd2luZyBzdGF0cyB3aWxsIGJlIGV4cG9zZWQg
YnkgdGhlIGludGVyZmFjZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IC9zeXMva2VybmVs
L2RtYWJ1Zi88aW5vZGVfbnVtYmVyPi9leHBvcnRlcl9uYW1lCj4gPiA+ID4gPiA+ID4gL3N5cy9r
ZXJuZWwvZG1hYnVmLzxpbm9kZV9udW1iZXI+L3NpemUKPiA+ID4gPiA+ID4gPiAvc3lzL2tlcm5l
bC9kbWFidWYvPGlub2RlX251bWJlcj4vZGV2X21hcF9pbmZvCj4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiBUaGUgaW5vZGVfbnVtYmVyIGlzIHVuaXF1ZSBmb3IgZWFjaCBETUEtQlVGIGFuZCB3
YXMgYWRkZWQgZWFybGllciBbMV0KPiA+ID4gPiA+ID4gPiBpbiBvcmRlciB0byBhbGxvdyB1c2Vy
c3BhY2UgdG8gdHJhY2sgRE1BLUJVRiB1c2FnZSBhY3Jvc3MgZGlmZmVyZW50Cj4gPiA+ID4gPiA+
ID4gcHJvY2Vzc2VzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQ3VycmVudGx5LCB0aGlz
IGluZm9ybWF0aW9uIGlzIGV4cG9zZWQgaW4KPiA+ID4gPiA+ID4gPiAvc3lzL2tlcm5lbC9kZWJ1
Zy9kbWFfYnVmL2J1ZmluZm8uCj4gPiA+ID4gPiA+ID4gSG93ZXZlciwgc2luY2UgZGVidWdmcyBp
cyBjb25zaWRlcmVkIHVuc2FmZSB0byBiZSBtb3VudGVkIGluIHByb2R1Y3Rpb24sCj4gPiA+ID4g
PiA+ID4gaXQgaXMgYmVpbmcgZHVwbGljYXRlZCBpbiBzeXNmcy4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gTWhtLCB0aGlzIG1ha2VzIGl0IHBhcnQgb2YgdGhlIFVBUEkuIFdoYXQgaXMgdGhlIGp1
c3RpZmljYXRpb24gZm9yIHRoaXM/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEluIG90aGVyIHdv
cmRzIGRvIHdlIHJlYWxseSBuZWVkIHRob3NlIGRlYnVnIGluZm9ybWF0aW9uIGluIGEgcHJvZHVj
dGlvbgo+ID4gPiA+ID4gPiBlbnZpcm9ubWVudD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBQcm9kdWN0
aW9uIGVudmlyb25tZW50cyBzZWVtIHRvIHdhbnQgdG8ga25vdyB3aG8gaXMgdXNpbmcgdXAgbWVt
b3J5IDopCj4gPiA+ID4KPiA+ID4gPiBUaGlzIG9ubHkgc2hvd3Mgc2hhcmVkIG1lbW9yeSwgc28g
aXQgZG9lcyBzbWVsbCBhIGxvdCBsaWtlICRzcGVjaWZpY19pc3N1ZQo+ID4gPiA+IGFuZCB3ZSdy
ZSBkZXNpZ25pbmcgYSBuYXJyb3cgc29sdXRpb24gZm9yIHRoYXQgYW5kIHRoZW4gaGF2ZSB0byBj
YXJyeSBpdAo+ID4gPiA+IGZvcmV2ZXIuCj4gPiA+Cj4gPiA+IEkgdGhpbmsgdGhlICJpc3N1ZSIg
aXMgdGhhdCB0aGlzIHdhcyBhIGZlYXR1cmUgZnJvbSBpb24gdGhhdCBwZW9wbGUKPiA+ID4gIm1p
c3NlZCIgaW4gdGhlIGRtYWJ1ZiBtb3ZlLiAgVGFraW5nIGF3YXkgdGhlIGFiaWxpdHkgdG8gc2Vl
IHdoYXQga2luZAo+ID4gPiBvZiBhbGxvY2F0aW9ucyB3ZXJlIGJlaW5nIG1hZGUgZGlkbid0IG1h
a2UgYSBsb3Qgb2YgZGVidWdnaW5nIHRvb2xzCj4gPiA+IGhhcHB5IDooCj4gPgo+ID4gSWYgdGhp
cyBpcyBqdXN0IGZvciBkbWEtaGVhcHMgdGhlbiB3aHkgZG9uJ3Qgd2UgYWRkIHRoZSBzdHVmZiBi
YWNrCj4gPiBvdmVyIHRoZXJlPyBJdCByZWluZm9yY2VzIG1vcmUgdGhhdCB0aGUgYW5kcm9pZCBn
cHUgc3RhY2sgYW5kIHRoZQo+ID4gbm9uLWFuZHJvaWQgZ3B1IHN0YWNrIG9uIGxpbnV4IGFyZSBm
YWlybHkgZGlmZmVyZW50IGluIGZ1bmRhbWVudGFsCj4gPiB3YXlzLCBidXQgdGhhdCdzIG5vdCBy
ZWFsbHkgbmV3Lgo+Cj4gQmFjayAib3ZlciB3aGVyZSI/Cj4KPiBkbWEtYnVmcyBhcmUgbm90IG9u
bHkgdXNlZCBmb3IgdGhlIGdyYXBoaWNzIHN0YWNrIG9uIGFuZHJvaWQgZnJvbSB3aGF0IEkKPiBj
YW4gdGVsbCwgc28gdGhpcyBzaG91bGRuJ3QgYmUgYSBncHUtc3BlY2lmaWMgaXNzdWUuCgpkbWEt
YnVmIGhlYXBzIGV4aXN0IGJlY2F1c2UgYW5kcm9pZCwgbW9zdGx5IGJlY2F1c2UgZ29vZ2xlIG1h
bmRhdGVzCml0LiBUaGVyZSdzIG5vdCBhIHdob2xlIGxvdCAobWVhbmluZyB6ZXJvKSBvZiBhY3R1
YWxseSBvcGVuIGdwdSBzdGFja3MKYXJvdW5kIHRoYXQgcnVuIG9uIGFuZHJvaWQgYW5kIHVzZSBk
bWEtYnVmIGhlYXBzIGxpa2UgYXBwcm92ZWQgZ29vZ2xlCnN5c3RlbXMsIGxhcmdlbHkgYmVjYXVz
ZSB0aGUgZ3JhbGxvYyBpbXBsZW1lbnRhdGlvbiBpbiBtZXNhIGp1c3QKZG9lc250LgoKU28gaWYg
YW5kcm9pZCBuZWVkcyBzb21lIHF1aWNrIGRlYnVnIG91dHB1dCBpbiBzeXNmcywgd2UgY2FuIGp1
c3QgYWRkCnRoYXQgaW4gZG1hLWJ1ZiBoZWFwcywgZm9yIGFuZHJvaWQgb25seSwgcHJvYmxlbSBz
b2x2ZWQuIEFuZCBtdWNoIGxlc3MKYW5ub3lpbmcgcmV2aWV3IHRvIG1ha2Ugc3VyZSBpdCBhY3R1
YWxseSBmaXRzIGludG8gdGhlIHdpZGVyIGVjb3N5c3RlbQpiZWNhdXNlIGFzLWlzIChhbmQgSSdt
IG5vdCBzZWVpbmcgdGhhdCBjaGFuY2UgYW55dGltZSBzb29uKSwgZG1hLWJ1ZgpoZWFwcyBpcyBm
b3IgYW5kcm9pZCBvbmx5LiBkbWEtYnVmIGF0IGxhcmdlIGlzbid0LCBzbyBtZXJnaW5nIGEgZGVi
dWcKb3V0cHV0IHN5c2ZzIGFwaSB0aGF0J3MganVzdCBmb3IgYW5kcm9pZCBidXQgbWlzc2VzIGEg
dG9uIG9mIHRoZSBtb3JlCmdlbmVyaWMgZmVhdHVyZXMgYW5kIHNlbWFudGljcyBvZiBkbWEtYnVm
IGlzIG5vdCBncmVhdC4KLURhbmllbAoKLURhbmllbAotLQpEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
