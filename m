Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7D49B13
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369D66E108;
	Tue, 18 Jun 2019 07:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067BD6E108
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:47:02 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id d12so19594345iod.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxKYkLgA5MVuzsXMSMGfzla77yJINMaSigfo4ssAuus=;
 b=IZugIJKRqpwn2N+9mta6UFPRWJLKFf4EYZwxIyBRIK+xqa7xXyLaydmb+wdAXzu/VF
 VfhWeKA0uqZ73H57oiGeT9ERJYCPykmMYWVD/p2k43SSCcnF+7iG+Jm1Mw440QgBn9+9
 j79eO38q0UfK7/f7r+6PfH3nKJafD8DanagAHzkwHjpxxLgqNTa4UItk9xCEZqL+Mgqo
 Og73ETgzBCNpx59mZKpCws/uHqovcOrtUil4vQdHV0vK4pzoRvRjJipz4jesdjoPfgKB
 vufIYVYZrq15H4zWIhjhiWSN1IAemyujOUptMYaW7qTo9LpinrGQG41XpcWItHsQDNfO
 rn4w==
X-Gm-Message-State: APjAAAXahhUg3L6vFwmlhgoIPGvXgctdh8YjvCxGTS2wtsQa2yypOenn
 yPOYct4P3+T6E0gydYl6gy47zUX6F8H8RG9w7JgT1w==
X-Google-Smtp-Source: APXvYqycTbdlGgVagVEKSPFXn3d5LsyT9I6EZwTdqQk/dkFhmrBl6uOW3Kl4M+fU023lwzcVYQVx/JhGLarll+uzkVY=
X-Received: by 2002:a02:380c:: with SMTP id b12mr67109907jaa.85.1560844021305; 
 Tue, 18 Jun 2019 00:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com>
 <20190617114503.pclqsf6bo3ih47nt@flea>
 <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
 <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ@mail.gmail.com>
 <CAGb2v64htYr+iRUnLx0hKkqCtYa0GbzZJEvb-ViyJFAYzU1sig@mail.gmail.com>
In-Reply-To: <CAGb2v64htYr+iRUnLx0hKkqCtYa0GbzZJEvb-ViyJFAYzU1sig@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Jun 2019 13:16:50 +0530
Message-ID: <CAMty3ZBDjNa+Sso4hmKxXOg_LT8giNYQAuJCgjZW8AeVQhAtyQ@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register
 clock gates in probe
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vxKYkLgA5MVuzsXMSMGfzla77yJINMaSigfo4ssAuus=;
 b=RjIbAgrDl9/qI0Gii7VVzjfDkkA4UNrDQYVufYwYf/7w9vv+rUari1Sq1mvxZKpVXv
 HaIXkNWo7j6M5sCPdtYLiEMFaEoOc1VdJf/4sMfMFzLfEb8cS2GpcVmxlv3o5DgQrlIr
 /0peXvokP7Oc2S5VY+81T7ibHogSkES0k5wnA=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTI6NTMgUE0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDM6MTIgUE0gSmFnYW4gVGVr
aSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVu
IDE3LCAyMDE5IGF0IDY6MzEgUE0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNzo0NSBQTSBNYXhpbWUgUmlwYXJk
IDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZy
aSwgSnVuIDE0LCAyMDE5IGF0IDEwOjEzOjIwUE0gKzA1MzAsIEphZ2FuIFRla2kgd3JvdGU6Cj4g
PiA+ID4gPiBUQ09OIFRPUCBoYXZlIGNsb2NrIGdhdGVzIGZvciBUVjAsIFRWMSwgZHNpIGFuZCBy
aWdodAo+ID4gPiA+ID4gbm93IHRoZXNlIGFyZSByZWdpc3RlciBkdXJpbmcgYmluZCBjYWxsLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IE9mIHdoaWNoLCBkc2kgY2xvY2sgZ2F0ZSB3b3VsZCByZXF1aXJl
ZCBkdXJpbmcgRFBIWSBwcm9iZQo+ID4gPiA+ID4gYnV0IHNhbWUgY2FuIG1pc3MgdG8gZ2V0IHNp
bmNlIHRjb24gdG9wIGlzIG5vdCBib3VuZCBhdAo+ID4gPiA+ID4gdGhhdCB0aW1lLgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFRvIHNvbHZlLCB0aGlzIGNpcmN1bGFyIGRlcGVuZGVuY3kgbW92ZSB0aGUg
Y2xvY2sgZ2F0ZQo+ID4gPiA+ID4gcmVnaXN0cmF0aW9uIGZyb20gYmluZCB0byBwcm9iZSBzby10
aGF0IERQSFkgY2FuIGdldCB0aGUKPiA+ID4gPiA+IGRzaSBnYXRlIGNsb2NrIG9uIHRpbWUuCj4g
PiA+ID4KPiA+ID4gPiBJdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2hhdCB0aGUgY2lyY3Vs
YXIgZGVwZW5kZW5jeSBpcz8KPiA+ID4gPgo+ID4gPiA+IGlmIHlvdSBoYXZlIGEgY2hhaW4gdGhh
dCBpczoKPiA+ID4gPgo+ID4gPiA+IHRjb24tdG9wICstPiBEU0kKPiA+ID4gPiAgICAgICAgICAr
LT4gRC1QSFkKPiA+ID4gPgo+ID4gPiA+IFRoZXJlJ3Mgbm8gbG9vcCwgcmlnaHQ/Cj4gPiA+Cj4g
PiA+IExvb2tpbmcgYXQgaG93IHRoZSBEVFNJIHBhdGNoIHN0cnVjdHVyZXMgdGhpbmdzICh3aXRo
b3V0IGdvaW5nIGludG8KPiA+ID4gd2hldGhlciBpdCBpcyBjb3JyZWN0IG9yIGFjY3VyYXRlKToK
PiA+ID4KPiA+ID4gVGhlIEQtUEhZIGlzIG5vdCBwYXJ0IG9mIHRoZSBjb21wb25lbnQgZ3JhcGgu
IEhvd2V2ZXIgaXQgcmVxdWVzdHMKPiA+ID4gdGhlIERTSSBnYXRlIGNsb2NrIGZyb20gdGhlIFRD
T04tVE9QLgo+ID4gPgo+ID4gPiBUaGUgVENPTi1UT1AgZHJpdmVyLCBpbiBpdHMgY3VycmVudCBm
b3JtLCBvbmx5IHJlZ2lzdGVycyB0aGUgY2xvY2tzCj4gPiA+IGl0IHByb3ZpZGVzIGF0IGNvbXBv
bmVudCBiaW5kIHRpbWUuIFRodXMgdGhlIEQtUEhZIGNhbid0IHN1Y2Nlc3NmdWxseQo+ID4gPiBw
cm9iZSB1bnRpbCB0aGUgVENPTi1UT1AgaGFzIGJlZW4gYm91bmQuCj4gPiA+Cj4gPiA+IFRoZSBE
U0kgaW50ZXJmYWNlIHJlcXVpcmVzIHRoZSBELVBIWSB0byBiaW5kLiBJdCB3aWxsIHJldHVybiAt
RVBST0JFX0RFRkVSCj4gPiA+IGlmIGl0IGNhbm5vdCByZXF1ZXN0IGl0LiBUaGlzIGluIHR1cm4g
Z29lcyBpbnRvIHRoZSBlcnJvciBwYXRoIG9mCj4gPiA+IGNvbXBvbmVudF9iaW5kX2FsbCwgd2hp
Y2ggdW5iaW5kcyBhbGwgcHJldmlvdXMgY29tcG9uZW50cy4KPiA+ID4KPiA+ID4gU28gaXQncyBh
Y3R1YWxseQo+ID4gPgo+ID4gPiAgICAgRC1QSFkgLT4gVENPTi1UT1AgLT4gRFNJCj4gPiA+ICAg
ICAgIF4gICAgICAgICAgICAgICAgICAgfAo+ID4gPiAgICAgICB8LS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+ID4KPiA+ID4gSSd2ZSBub3QgY2hlY2tlZCwgYnV0IEkgc3VzcGVjdCB0aGVyZSdzIG5v
IHBvc3NpYmlsaXR5IG9mIGhhdmluZyBvdGhlcgo+ID4gPiBkcml2ZXJzIHByb2JlICh0byBkZWFs
IHdpdGggZGVmZXJyZWQgcHJvYmluZykgd2l0aGluIGNvbXBvbmVudF9iaW5kX2FsbC4KPiA+ID4g
T3RoZXJ3aXNlIHdlIHNob3VsZG4ndCBydW4gaW50byB0aGlzIHdlaXJkIGNpcmN1bGFyIGRlcGVu
ZGVuY3kgaXNzdWUuCj4gPiA+Cj4gPiA+IFNvIHRoZSBxdWVzdGlvbiBmb3IgSmFnYW4gaXMgdGhh
dCBpcyB0aGlzIGluZGVlZCB0aGUgY2FzZT8gRG9lcyB0aGlzCj4gPiA+IHBhdGNoIHNvbHZlIGl0
LCBvciBhdCBsZWFzdCB3b3JrIGFyb3VuZCBpdC4KPiA+Cj4gPiBZZXMsIHRoaXMgaXMgd2hhdCBJ
IHdhcyBtZW50aW9uZWQgaW4gaW5pdGlhbCB2ZXJzaW9uLCBzaW5jZSB0aGUgImRzaSIKPiA+IGdh
dGUgaW4gdGNvbiB0b3AgaXMgcmVnaXN0ZXJpbmcgZHVyaW5nIGJpbmQsIHRoZSBkcGh5IG9mIGRz
aQo+ID4gY29udHJvbGxlciB3b24ndCBnZXQgdGhlIGFzc29jaWF0ZWQgY2xvY2sgZm9yICJtb2Qi
IHNvIGl0IGlzIGtlZXAgb24KPiA+IHJldHVybmluZyAtRVBST0JFX0RFRkVSLiBCeSBtb3Zpbmcg
dGhlIGNsb2NrIGdhdGUgcmVnaXN0cmF0aW9uIHRvCj4gPiBwcm9iZSwgZXZlcnl0aGluZyBib3Vu
ZCBhcyBleHBlY3RlZC4KPgo+IEkgYmVsaWV2ZSB5b3UgZmFpbGVkIHRvIG1lbnRpb24gdGhlIERT
SSBibG9jaywgd2hpY2ggaXMgdGhlIHBhcnQgdGhhdAo+IGNvbXBsZXRlcyB0aGUgY2lyY3VsYXIg
ZGVwZW5kZW5jeS4gRG9uJ3QgZXhwZWN0IG90aGVycyB0byBoYXZlIGZ1bGwKPiBhd2FyZW5lc3Mg
b2YgdGhlIGNvbnRleHQuIFlvdSBoYXZlIHRvIHByb3ZpZGUgaXQgaW4geW91ciBjb21taXQgbG9n
LgoKSSBoYXZlIG1lbnRpb25lZCBEUEhZIGFuZCB5ZXMgaXQgaXMgcG9zc2libGUgdG8gZ2l2ZSBt
b3JlIGluZm9ybWF0aW9uCndpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbiwgbm8gcHJvYmxlbS4g
dGhhbmtzIGZvciBtZW50aW9uaW5nIHRoYXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
