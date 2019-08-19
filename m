Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E929394D3A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 20:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21566E26D;
	Mon, 19 Aug 2019 18:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EB26E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 18:50:55 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id h3so1392708pls.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 11:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C0e2APdFMcCL115V7DOVVJSnlHloFclNY39dd69/lO0=;
 b=TUcbT1L1uZ2ogA94buP1BBmy7oNL8JAJRxic357L4A3+GIP2K4HcdocKBymTQttu48
 d+xI+wzr24fbSzuxTvS/loX8oRywZeDm9Q2Xoe0jLg3ywpxv79YIB4UpV38GW1iFQLWe
 rvh+xmsA1EFDRiHhuGCHRlcv80nlUHwyXXNr5p/tH4lcEiyyEVcb4fIo0Cq/BU6wr3ha
 FzC+dtXmtPcbSVeH/1TLB/Gpy8cgPA3nxP4rclnb7un+XIKmhVX6PYLMnJQlbwDZKxIN
 cOFAyFJa93JVlKdPgUfvN90avNcmFJKsnkTVcA6TzQZV+E5JeAD9leKlKyP8ZDxNao7u
 0ndg==
X-Gm-Message-State: APjAAAW0+XhUx7Zvo2HchJDc6ZsKzO5+eA/6cxbCQ5ZS59zJyEYhX9rm
 sLSpx78tMiCvtjSQTu9pJqIDDw==
X-Google-Smtp-Source: APXvYqxh+E8TFUryXTjcfNmp7eEgV3tGYzniOp22FCvAHtBGpb7ARiJTtlOQVWkRBrXizfRtmjdGHw==
X-Received: by 2002:a17:902:788b:: with SMTP id
 q11mr24093153pll.308.1566240655357; 
 Mon, 19 Aug 2019 11:50:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id x25sm18660949pfa.90.2019.08.19.11.50.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:50:54 -0700 (PDT)
Date: Mon, 19 Aug 2019 11:50:49 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190819185049.GZ250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
 <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
 <20190816175317.GU250418@google.com>
 <20190819100241.5pctjxmsq6crlale@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819100241.5pctjxmsq6crlale@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C0e2APdFMcCL115V7DOVVJSnlHloFclNY39dd69/lO0=;
 b=WbPRIlO58ztUhi7i2oz12gIxghvYFhvGj5detvHL64ciojw1Jbh1rIUinASAN5D8ZH
 oktM00ScxqNk41KTkk3qw/+BHQPD4Q3wJeTI1oV2U3gwQatbTu8PX10ZFmAfuarYSyE2
 ivJrpHi6loe1F9bmEmdOWwWzx2oF50n/ZrQtM=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6MDI6NDFBTSArMDEwMCwgRGFu
aWVsIFRob21wc29uIHdyb3RlOgo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDEwOjUzOjE3QU0g
LTA3MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMTYsIDIwMTkg
YXQgMDQ6NTQ6MThQTSArMDEwMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+ID4gPiBPbiAwNy8w
OC8yMDE5IDIxOjE1LCBNYXR0aGlhcyBLYWVobGNrZSB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEp1
bCAwOSwgMjAxOSBhdCAxMjowMDowNVBNIC0wNzAwLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90ZToK
PiA+ID4gPiA+IEJhY2tsaWdodCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBkaWZmZXJlbnQg
c2hhcGVzLiBUaGUgdHdvIG1haW4KPiA+ID4gPiA+IHR5cGVzIGFyZSBsaW5lYXIgYW5kIG5vbi1s
aW5lYXIgY3VydmVzLiBUaGUgaHVtYW4gZXllIGRvZXNuJ3QKPiA+ID4gPiA+IHBlcmNlaXZlIGxp
bmVhcmx5IGluY3JlYXNpbmcvZGVjcmVhc2luZyBicmlnaHRuZXNzIGFzIGxpbmVhciAoc2VlCj4g
PiA+ID4gPiBhbHNvIDg4YmE5NWJlZGI3OSAiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJp
Z2h0bmVzcyBvZiBMRUQKPiA+ID4gPiA+IGxpbmVhcmx5IHRvIGh1bWFuIGV5ZSIpLCBoZW5jZSBt
YW55IGJhY2tsaWdodHMgdXNlIG5vbi1saW5lYXIgKG9mdGVuCj4gPiA+ID4gPiBsb2dhcml0aG1p
YykgYnJpZ2h0bmVzcyBjdXJ2ZXMuIFRoZSB0eXBlIG9mIGN1cnZlIGN1cnJlbnRseSBpcyBvcGFx
dWUKPiA+ID4gPiA+IHRvIHVzZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9mdGVuIHVzZXMgbW9yZSBv
ciBsZXNzIHJlbGlhYmxlIGhldXJpc3RpY3MKPiA+ID4gPiA+IChsaWtlIHRoZSBudW1iZXIgb2Yg
YnJpZ2h0bmVzcyBsZXZlbHMpIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHRyZWF0IGEKPiA+ID4gPiA+
IGJhY2tsaWdodCBkZXZpY2UgYXMgbGluZWFyIG9yIG5vbi1saW5lYXIuCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IEV4cG9ydCB0aGUgdHlwZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2aWEgdGhlIG5l
dyBzeXNmcyBhdHRyaWJ1dGUKPiA+ID4gPiA+ICdzY2FsZScuIFRoZSB2YWx1ZSBvZiB0aGUgYXR0
cmlidXRlIGNhbiBiZSAnbGluZWFyJywgJ25vbi1saW5lYXInIG9yCj4gPiA+ID4gPiAndW5rbm93
bicuIEZvciBkZXZpY2VzIHRoYXQgZG9uJ3QgcHJvdmlkZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
c2NhbGUKPiA+ID4gPiA+IG9mIHRoZWlyIGJyaWdodG5lc3MgY3VydmUgdGhlIHZhbHVlIG9mIHRo
ZSAnc2NhbGUnIGF0dHJpYnV0ZSBpcyAndW5rbm93bicuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+ID4gPiA+
IAo+ID4gPiA+IERhbmllbCAoZXQgYWwpOiBkbyB5b3UgaGF2ZSBhbnkgbW9yZSBjb21tZW50cyBv
biB0aGlzIHBhdGNoL3NlcmllcyBvcgo+ID4gPiA+IGlzIGl0IHJlYWR5IHRvIGxhbmQ/Cj4gPiA+
IAo+ID4gPiBJIGRlY2lkZWQgdG8gbGVhdmUgaXQgZm9yIGEgbG9uZyB3aGlsZSBmb3Igb3RoZXJz
IHRvIHJldmlldyBzaW5jZSBJJ20gc3RpbGwKPiA+ID4gYSB0aW55IGJpdCB1bmVhc3kgYWJvdXQg
dGhlIGxpbmVhci9ub24tbGluZWFyIHRlcm1pbm9sb2d5Lgo+ID4gPiAKPiA+ID4gSG93ZXZlciB0
aGF0J3MgbXkgb25seSBjb25jZXJuLCBpdHMgZmFpcmx5IG1pbm9yIGFuZCBJJ3ZlIGRyYWdnZWQg
YnkgZmVldAo+ID4gPiBmb3IgbW9yZSB0aGVuIGxvbmcgZW5vdWdoLCBzbzoKPiA+ID4gUmV2aWV3
ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gPiAK
PiA+IFRoYW5rcyEKPiA+IAo+ID4gSWYgeW91IG9yIHNvbWVvbmUgZWxzZSBoYXMgYW5vdGhlciBz
dWdnZXN0aW9uIGZvciB0aGUgdGVybWlub2xvZ3kgdGhhdAo+ID4gd2UgY2FuIGFsbCBhZ3JlZSBv
biBJJ20gaGFwcHkgdG8gY2hhbmdlIGl0Lgo+IAo+IEFzIHlvdSB3aWxsIHNlZSBpbiBteSByZXBs
eSB0byBVd2UuIFRoZSB0ZXJtIEkgdGVuZCB0byBhZG9wdCB3aGVuIEkgd2FudAo+IHRvIGJlIHBy
ZWNpc2UgYWJvdXQgdXNlcnNwYWNlIGJlaGF2aW91ciBpcyAicGVyY2VwdHVhbCIgKGUuZy4gdGhh
dCBhCj4gYmFja2xpZ2h0IGNhbiBiZSBtYXBwZWQgZGlyZWN0bHkgdG8gYSBzbGlkZXIgYW5kIGl0
IHdpbGwgZmVlbCByaWdodCkuCj4gCj4gSG93ZXZlciB0aGF0IHJhaXNlcyBpdHMgb3duIGNvbmNl
cm5zOiBtb3N0bHkgYWJvdXQgd2hhdCBpcyBwZXJjZXB0dWFsCj4gZW5vdWdoLgo+IAo+IENsZWFy
IHRoZSBhdXRvbWF0aWMgYnJpZ2h0bmVzcyBjdXJ2ZSBzdXBwb3J0IGluIHRoZSBQV00gZHJpdmVy
IGlzCj4gcGVyY2VwdHVhbC4KPiAKPiBUbyBiZSBob25lc3QgSSBzdXNwZWN0IHRoYXQgaW4gbW9z
dCBjYXNlcyBhIHRydWUgbG9nYXJpdGhtaWMgY3VydmUgKGdpdmVuIGEKPiBzYW5lIGV4cG9uZW50
KSB3b3VsZCBiZSBwZXJjZXB0dWFsIGVub3VnaC4gSW4gb3RoZXIgd29yZHMgaXQgd2lsbCBmZWVs
Cj4gY29tZm9ydGFibGUgd2l0aCBhIGRpcmVjdCBtYXBwZWQgc2xpZGVyIGFuZCB1c2luZyBpdCBm
b3IgYW5pbWF0aW9uCj4gd29uJ3QgYmUgdG9vIGJhZC4KPiAKPiBIb3dldmVyIHdoZW4gd2UgZ2V0
IHJpZ2h0IGRvd24gdG8gaXQgKnRoYXQqIGlzIHRoZSBpbmZvcm1hdGlvbiB0aGF0IGlzCj4gYWN0
dWFsbHkgbW9zdCB1c2VmdWwgdG8gdXNlcnNwYWNlOiBleHBsaWNpdCBjb25maXJtYXRpb24gdGhh
dCB0aGUgc2NhbGUKPiBjYW4gYmUgbWFwcGVkIGRpcmVjdGx5IHRvIGEgc2xpZGVyLiBJIHRoaW5r
IGl0IGFsc28gYWxpZ25lZCBiZXR0ZXIgd2l0aAo+IFV3ZSdzIGZlZWRiYWNrIChlLmcuIHRvIHN0
YXJ0IHdvcmtpbmcgdG93YXJkcyBoYXZpbmcgYSBwcmVmZXJyZWQgc2NhbGUpLgoKSUlVQyB0aGUg
Y29uY2x1c2lvbiBpcyB0aGF0IHRoZXJlIGlzIG5vIG5lZWQgZm9yIGEgc3RyaW5nIGF0dHJpYnV0
ZQpiZWNhdXNlIHdlIG9ubHkgbmVlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuICdwZXJjZXB0dWFs
JyBhbmQKJ25vbi1wZXJjZXB0dWFsJy4gSWYgdGhhdCBpcyBjb3JyZWN0LCBkbyB5b3UgaGF2ZSBh
bnkgcHJlZmVyZW5jZSBmb3IKdGhlIGF0dHJpYnV0ZSBuYW1lICgncGVyY2VwdHVhbF9zY2FsZScs
ICdwZXJjZXB0dWFsJywgLi4uKT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
