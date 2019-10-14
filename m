Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5494D5DD5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55DB6E148;
	Mon, 14 Oct 2019 08:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F3F6E148
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:48:52 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c4so14097505edl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 01:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=xtv8eDUo7LGL8wXNVViezHRuz1eIYtvj8JrfIGcZVug=;
 b=rUwrALkejHxRipo/ZNAdVvk04CEoqDHESGX3s5v1W0Z0Gpy9QEY0R+r2bIAps69fqk
 SNeYpCPgI9I29IsXrULpJIl73tiX0ZyGwg/jcTwsigeXt9ThWskT/UVPKcuGOnEkbCNy
 CfuXkiSRXgzRachxjIQqvJGdpDxM1z1eFow+myHbuxCaiboTJIV9jrpE/oEz3eYD15MR
 nadqJlkXF0ampMwt41Pz+M0vpEdB/TXqHKx+dmhnf86RycINmv96wnPfTgZqqMRvTLXj
 GJenZcGECF5ZRBOY+UdmRo0mQ3xmFj5VgGzl+e5Hgbmgrf8/jNGvBKqYUnUz1YWW/RgB
 myig==
X-Gm-Message-State: APjAAAV4zTR6xuAI+nLJUbXo77cv1mJ7MCXqQulpZHNPuEhTkSDrGADF
 70ilwCSouphr+PIRuLAk4GfheA==
X-Google-Smtp-Source: APXvYqy/ZEwWAWWWTFpXjJ6+8zSYCyYSv2xT+RJWq3EenfofAI17t+WveIWMFS5L/0g7YiaoBEcqkg==
X-Received: by 2002:a17:906:309b:: with SMTP id
 27mr27115276ejv.243.1571042930920; 
 Mon, 14 Oct 2019 01:48:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id bq13sm2215123ejb.25.2019.10.14.01.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 01:48:50 -0700 (PDT)
Date: Mon, 14 Oct 2019 10:48:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191014084847.GD11828@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011093633.GD27819@localhost>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xtv8eDUo7LGL8wXNVViezHRuz1eIYtvj8JrfIGcZVug=;
 b=HrE4MoWhmtc/2ksDE63nOcfdOtX17WLrOzhRQ9QxIpfLhDYJ37xkcRCjeilpHPQbY/
 a9VXf8/BQDX+xVYBdbQxwqJg/4C0nxCllPh4PXFjE6krWeWUAUVaKgU8hoVw1CcGNRUj
 havuz7CsORrPqD7MmaYvGtD/MPGCN3gWB5HRo=
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTE6MzY6MzNBTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDAzOjUwOjQzUE0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMzoxMzoyOVBNICswMjAw
LCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gPiA+IFR3byBvbGQgVVNCIGRyaXZlcnMgaGFkIGEgYnVn
IGluIHRoZW0gd2hpY2ggY291bGQgbGVhZCB0byBtZW1vcnkgbGVha3MKPiA+ID4gaWYgYW4gaW50
ZXJydXB0ZWQgcHJvY2VzcyByYWNlZCB3aXRoIGEgZGlzY29ubmVjdCBldmVudC4KPiA+ID4gCj4g
PiA+IFR1cm5zIG91dCB3ZSBoYWQgYSBmZXcgbW9yZSBkcml2ZXIgaW4gb3RoZXIgc3Vic3lzdGVt
cyB3aXRoIHRoZSBzYW1lCj4gPiA+IGtpbmQgb2YgYnVnIGluIHRoZW0uCj4gCj4gPiBSYW5kb20g
ZnVubnkgaWRlYTogQ291bGQgd2UgZG8gc29tZSBkZWJ1ZyBhbm5vdGF0aW9ucyAoYWtpbiB0bwo+
ID4gbWlnaHRfc2xlZXApIHRoYXQgc3BsYXRzIHdoZW4geW91IG1pZ2h0X3NsZWVwX2ludGVycnVw
dGlibGUgc29tZXdoZXJlCj4gPiB3aGVyZSBpbnRlcnJ1cHRpYmxlIHNsZWVwcyBhcmUgZ2VuZXJh
bGx5IGEgYmFkIGlkZWE/IExpa2UgaW4KPiA+IGZvcHMtPnJlbGVhc2U/Cj4gCj4gVGhlcmUncyBu
b3RoaW5nIHdyb25nIHdpdGggaW50ZXJydXB0aWJsZSBzbGVlcCBpbiBmb3BzLT5yZWxlYXNlIHBl
ciBzZSwKPiBpdCdzIGp1c3QgdGhhdCBkcml2ZXJzIGNhbm5vdCByZXR1cm4gLUVSRVNUQVJUU1lT
IGFuZCBmcmllbmRzIGFuZCBleHBlY3QKPiB0byBiZSBjYWxsZWQgYWdhaW4gbGF0ZXIuCgpEbyB5
b3UgaGF2ZSBhIGxlZ2l0IHVzZWNhc2UgZm9yIGludGVycnVwdGlibGUgc2xlZXBzIGluIGZvcHMt
PnJlbGVhc2U/CgpJJ20gbm90IGV2ZW4gc3VyZSBraWxsYWJsZSBpcyBsZWdpdCBpbiB0aGVyZSwg
c2luY2UgaXQncyBhbiBmZCwgbm90IGEKcHJvY2VzcyBjb250ZXh0IC4uLgoKPiBUaGUgcmV0dXJu
IHZhbHVlIGZyb20gcmVsZWFzZSgpIGlzIGlnbm9yZWQgYnkgdmZzLCBhbmQgYWRkaW5nIGEgc3Bs
YXQgaW4KPiBfX2ZwdXQoKSB0byBjYXRjaCB0aGVzZSBidWdneSBkcml2ZXJzIG1pZ2h0IGJlIG92
ZXJraWxsLgoKSW1lIG9uY2UgeW91IGhhdmUgYSBoYW5kZnVsIG9mIGluc3RhbmNlcyBvZiBhIGJy
b2tlbiBwYXR0ZXJuLCBjcmVhdGluZyBhCmNoZWNrIGZvciBpdCAodW5kZXIgYSBkZWJ1ZyBvcHRp
b24gb25seSBvZmMpIGlzIHZlcnkgbXVjaCBqdXN0aWZpZWQuCk90aGVyd2lzZSB0aGV5IGp1c3Qg
Y29tZSBiYWNrIHRvIGxpZmUgbGlrZSB0aGUgdW5kZWFkLCBhbGwgdGhlIHRpbWUuIEFuZAp0aGVy
ZSdzIGEgX2xvdF8gb2YgZm9wcy0+cmVsZWFzZSBjYWxsYmFja3MgaW4gdGhlIGtlcm5lbC4KLURh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
