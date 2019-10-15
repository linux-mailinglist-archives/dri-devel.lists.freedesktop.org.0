Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B495D7803
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F42C89160;
	Tue, 15 Oct 2019 14:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E7789160
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:07:31 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h33so18127133edh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=qNZCwssE+agkEqCxaKtKVtylCGvXFSXX5DhiQKaIXpg=;
 b=jif6NCe4HSirgj1QU05rkwOPfKeDxcq206RtOJ8xDNkr/9jgYuYxjjgqjA5OaVXoc9
 vYpg4iLG5ANZvTzqRDBY8Gx2dTzhtYvWWuJUDoedE4ITNLcRBWC01puceefhThlWYl5s
 e0k+LhdwI5VFLzzqd6UYyU2aiPoP0YVAofefm3jLckle4uI1cXHwzI0j/K8vGhdPjXUV
 bDQ1Q7BOeRlp5RGZKGcY1qMv/SYWNudEydyT8byiERQoY25qtox9MsXBE056XK+ye8cV
 3WTjlKQ551rNrMIx2Z+P5B6gx1MP47azFNdCvw1O3rbtgu/0gub337DSvWXOd7b8hVGS
 cABg==
X-Gm-Message-State: APjAAAX7fXk0qkCmuHmAFTKDfnYqxlYRh5zfUkU09YJVKgnEjLxdAWBs
 ixOu+zqKHagyFnVzkSr3+7XmCw==
X-Google-Smtp-Source: APXvYqxwy4bxug6xoJIsFM59wzr8Eu7OLed7aQTfUGOfiWObU9eeM/ertrRHn6MHc5kJuwT0SZQfrw==
X-Received: by 2002:a17:906:6a8e:: with SMTP id
 p14mr34255737ejr.137.1571148449724; 
 Tue, 15 Oct 2019 07:07:29 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d2sm3745355eda.20.2019.10.15.07.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:07:28 -0700 (PDT)
Date: Tue, 15 Oct 2019 16:07:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191015140726.GN11828@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
 <20191011093633.GD27819@localhost>
 <20191014084847.GD11828@phenom.ffwll.local>
 <20191014161326.GO13531@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014161326.GO13531@localhost>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qNZCwssE+agkEqCxaKtKVtylCGvXFSXX5DhiQKaIXpg=;
 b=NPijPlHE9mOZETSF+T0qFTrnynppESRm1hPk8m15z6BtFKp/f35nb6fP0AtxA+vICD
 JOWnOXgGumAnnyCgoxgqcArGuemzJeDfqPdA4LYis0/rmWoNPx8t+Aa38BhPM8yc5J1y
 jTOJ95BLBFELDrUekBUcpVOI1TGYpw9L5o3bg=
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
Cc: freedreno@lists.freedesktop.org, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDY6MTM6MjZQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDE0LCAyMDE5IGF0IDEwOjQ4OjQ3QU0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAxMTozNjozM0FNICswMjAw
LCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gPiA+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDAzOjUw
OjQzUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBPY3QgMTAs
IDIwMTkgYXQgMDM6MTM6MjlQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+ID4gPiA+ID4g
VHdvIG9sZCBVU0IgZHJpdmVycyBoYWQgYSBidWcgaW4gdGhlbSB3aGljaCBjb3VsZCBsZWFkIHRv
IG1lbW9yeSBsZWFrcwo+ID4gPiA+ID4gaWYgYW4gaW50ZXJydXB0ZWQgcHJvY2VzcyByYWNlZCB3
aXRoIGEgZGlzY29ubmVjdCBldmVudC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVHVybnMgb3V0IHdl
IGhhZCBhIGZldyBtb3JlIGRyaXZlciBpbiBvdGhlciBzdWJzeXN0ZW1zIHdpdGggdGhlIHNhbWUK
PiA+ID4gPiA+IGtpbmQgb2YgYnVnIGluIHRoZW0uCj4gPiA+IAo+ID4gPiA+IFJhbmRvbSBmdW5u
eSBpZGVhOiBDb3VsZCB3ZSBkbyBzb21lIGRlYnVnIGFubm90YXRpb25zIChha2luIHRvCj4gPiA+
ID4gbWlnaHRfc2xlZXApIHRoYXQgc3BsYXRzIHdoZW4geW91IG1pZ2h0X3NsZWVwX2ludGVycnVw
dGlibGUgc29tZXdoZXJlCj4gPiA+ID4gd2hlcmUgaW50ZXJydXB0aWJsZSBzbGVlcHMgYXJlIGdl
bmVyYWxseSBhIGJhZCBpZGVhPyBMaWtlIGluCj4gPiA+ID4gZm9wcy0+cmVsZWFzZT8KPiA+ID4g
Cj4gPiA+IFRoZXJlJ3Mgbm90aGluZyB3cm9uZyB3aXRoIGludGVycnVwdGlibGUgc2xlZXAgaW4g
Zm9wcy0+cmVsZWFzZSBwZXIgc2UsCj4gPiA+IGl0J3MganVzdCB0aGF0IGRyaXZlcnMgY2Fubm90
IHJldHVybiAtRVJFU1RBUlRTWVMgYW5kIGZyaWVuZHMgYW5kIGV4cGVjdAo+ID4gPiB0byBiZSBj
YWxsZWQgYWdhaW4gbGF0ZXIuCj4gPiAKPiA+IERvIHlvdSBoYXZlIGEgbGVnaXQgdXNlY2FzZSBm
b3IgaW50ZXJydXB0aWJsZSBzbGVlcHMgaW4gZm9wcy0+cmVsZWFzZT8KPiAKPiBUaGUgdHR5IGxh
eWVyIGRlcGVuZHMgb24gdGhpcyBmb3IgZXhhbXBsZSB3aGVuIHdhaXRpbmcgZm9yIGJ1ZmZlcmVk
Cj4gd3JpdGVzIHRvIGNvbXBsZXRlIChzb21ldGhpbmcgd2hpY2ggbWF5IG5ldmVyIGhhcHBlbiB3
aGVuIHVzaW5nIGZsb3cKPiBjb250cm9sKS4KPiAKPiA+IEknbSBub3QgZXZlbiBzdXJlIGtpbGxh
YmxlIGlzIGxlZ2l0IGluIHRoZXJlLCBzaW5jZSBpdCdzIGFuIGZkLCBub3QgYQo+ID4gcHJvY2Vz
cyBjb250ZXh0IC4uLgo+IAo+IEl0IHdpbGwgYmUgcnVuIGluIHByb2Nlc3MgY29udGV4dCBpbiBt
YW55IGNhc2VzLCBhbmQgZm9yIHR0eXMgd2UncmUgZ29vZAo+IEFGQUlDVC4KCkh1aCwgcmVhZCBp
dCBhIGJpdCwgYWxsIHRoZSAtPnNodXRkb3duIGNhbGxiYWNrcyBoYXZlIHZvaWQgcmV0dXJuIHR5
cGUuCkJ1dCB0aGVyZSdzIGluZGVlZCBpbnRlcnJ1cHRpYmxlIHNsZWVwcyBpbiB0aGVyZS4gRG9l
c24ndCB0aGlzIGJyZWFrCnVzZXJzcGFjZSB0aGF0IGV4cGVjdHMgdGhhdCBhIGNsb3NlKCkgYWN0
dWFsbHkgZmx1c2hlcyB0aGUgdHR5PwoKSW1vIGlmIHlvdSdyZSAtPnJlbGVhc2UgY2FsbGJhY2tz
IGZlZWxzIGxpa2UgaXQgc2hvdWxkIGRvIGEgd2FpdCB0bwpndWFyYW50ZWVkIHNvbWV0aGluZyB1
c2Vyc3BhY2UgZXhwZWN0cywgdGhlbiBkb2luZyBhCndhaXRfaW50ZXJydXB0aWJsZS9raWxsYWJs
ZSBmZWVscyBsaWtlIGEgYnVnLiBPciBhbHRlcm5hdGl2ZWx5LCB0aGUgd2FpdAppc24ndCByZWFs
bHkgbmVlZGVkIGluIHRoZSBmaXJzdCBwbGFjZS4KCj4gPiA+IFRoZSByZXR1cm4gdmFsdWUgZnJv
bSByZWxlYXNlKCkgaXMgaWdub3JlZCBieSB2ZnMsIGFuZCBhZGRpbmcgYSBzcGxhdCBpbgo+ID4g
PiBfX2ZwdXQoKSB0byBjYXRjaCB0aGVzZSBidWdneSBkcml2ZXJzIG1pZ2h0IGJlIG92ZXJraWxs
Lgo+ID4gCj4gPiBJbWUgb25jZSB5b3UgaGF2ZSBhIGhhbmRmdWwgb2YgaW5zdGFuY2VzIG9mIGEg
YnJva2VuIHBhdHRlcm4sIGNyZWF0aW5nIGEKPiA+IGNoZWNrIGZvciBpdCAodW5kZXIgYSBkZWJ1
ZyBvcHRpb24gb25seSBvZmMpIGlzIHZlcnkgbXVjaCBqdXN0aWZpZWQuCj4gPiBPdGhlcndpc2Ug
dGhleSBqdXN0IGNvbWUgYmFjayB0byBsaWZlIGxpa2UgdGhlIHVuZGVhZCwgYWxsIHRoZSB0aW1l
LiBBbmQKPiA+IHRoZXJlJ3MgYSBfbG90XyBvZiBmb3BzLT5yZWxlYXNlIGNhbGxiYWNrcyBpbiB0
aGUga2VybmVsLgo+IAo+IFllYWgsIHlvdSBoYXZlIGEgcG9pbnQuCj4gCj4gQnV0IHRha2UgdHR5
IGFnYWluIGFzIGFuIGV4YW1wbGUsIHRoZSBjbG9zZSB0dHkgb3BlcmF0aW9uIGNhbGxlZCBmcm9t
Cj4gcmVsZWFzZSgpIGlzIGRlY2xhcmVkIHZvaWQgc28gdGhlcmUncyBubyBwcm9wYWdhdGVkIHJl
dHVybiB2YWx1ZSBmb3IgdmZzCj4gdG8gY2hlY2suCj4gCj4gSXQgbWF5IGV2ZW4gYmUgYmV0dGVy
IHRvIGZpeCB1cCB0aGUgMTAwIG9yIHNvIGNhbGxiYWNrcyBwb3RlbnRpYWxseQo+IHJldHVybmlu
ZyBub24temVybyBhbmQgbWFrZSBmb3BzLT5yZWxlYXNlIHZvaWQgc28gdGhhdCB0aGUgY29tcGls
ZXIKPiB3b3VsZCBoZWxwIHVzIGNhdGNoIGFueSBmdXR1cmUgYnVncyBhbmQgYWxzbyBzZXJ2ZSBh
cyBhIGhpbnQgZm9yCj4gZGV2ZWxvcGVycyB0aGF0IHJldHVybmluZyBlcnJub3MgZnJvbSBmb3Bz
LT5yZWxlYXNlIGlzIHByb2JhYmx5IG5vdAo+IHdoYXQgeW91IHdhbnQgdG8gZG8uCj4gCj4gQnV0
IHRoYXQncyBhIGxvdCBvZiBjaHVybiBvZiBjb3Vyc2UuCgpIbSBpbmRlZWQgLT5yZWxlYXNlIGhh
cyBpbnQgYXMgcmV0dXJuIHR5cGUuIEkgZ3Vlc3MgdGhhdCdzIG5lZWRlZCBmb3IKZmlsZSBJL08g
ZXJybm8gYW5kIHNpbWlsYXIgc3R1ZmYgLi4uCgpTdGlsbCB2b2lkIHJldHVybiB2YWx1ZSBkb2Vz
bid0IGNhdGNoIGZ1bm55IHN0dWZmIGxpa2UgZG9pbmcgaW50ZXJydXB0aWJsZQp3YWl0cyBhbmQg
b2NjYXNpb25hbGx5IGZhaWxpbmcgaWYgeW91IGhhdmUgYSBwcm9jZXNzIHRoYXQgbGlrZXMgdG8g
dXNlCnNpZ25hbHMgYW5kIGFsc28gdXNlcyBzb21lIGxpYnJhcnkgc29tZXdoZXJlIHRvIGRvIHNv
bWV0aGluZy4gSW4gZ3JhcGhpY3MKd2UgaGF2ZSB0aGF0LCB3aXRoIFhvcmcgbG92aW5nIHNpZ25h
bHMgZm9yIHZhcmlvdXMgdGhpbmdzLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
