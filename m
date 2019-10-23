Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C021E1478
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63BD6E9E4;
	Wed, 23 Oct 2019 08:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02B6E9E4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:39:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g24so11045517wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 01:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=2Ht+Dq3YAPtcP/5kWk8fJeCAjPfIj2CPqz7fkwrNtNc=;
 b=D6QQT/Kr7d93X/s0ZAMTP8QmyXgca5gRmeVP9ornUEPC8TOJYZ/ILj9OzhTzrxSwco
 ggehTkEUXKEooHJfK1IgyMhZ2pm/hFH7Unghzazn5ehlzmhGVr3do6suYnjqgzwblCcP
 2CG8P/jnXw/8ouh4RaOTJYYTYQRtRgNiWrTC5Gue91mPLJDaeKgfjoXs8lssn9+rbR5f
 wtbuCREnoLiyH+CedS/L//0iEoJQNMkK38Xc0YW7NMHeBCEst/8h9fnIIPK78tbQt26s
 1BBpATI2cU44hLdZOb7CDFyYeMv2e+yfzQc42qvul03SEGMSg72vpttPJYIXEkWWmipv
 pT2A==
X-Gm-Message-State: APjAAAW3AYC3V9hpOlZA+Da5fEnZ+eI3h+oLmfuHpAM/SAxIPFQSRdr9
 aJRTc9CccWmkS21nQAj/QpJL4A==
X-Google-Smtp-Source: APXvYqxb2P1Z2gElidhwJE8A1hcT+NpK1Wl8gtsfY3RZsA2RGoHeJKdGP6SxceLXf1qTbiKoMedCEg==
X-Received: by 2002:a05:600c:143:: with SMTP id
 w3mr6256752wmm.132.1571819972247; 
 Wed, 23 Oct 2019 01:39:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h3sm7133607wrt.88.2019.10.23.01.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 01:39:30 -0700 (PDT)
Date: Wed, 23 Oct 2019 10:39:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191023083928.GR11828@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Mat King <mathewk@google.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rafael@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>,
 Ross Zwisler <zwisler@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@redhat.com>,
 Alexander Schremmer <alex@alexanderweb.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com>
 <20191002102428.zaid63hp6wpd7w34@holly.lan>
 <8736gbbf2b.fsf@intel.com>
 <CAL_quvQkFjkBjJC5wH2t5XmyEq9OKWYSbAv39BJWT1hrKO7j8g@mail.gmail.com>
 <87h84q9pcj.fsf@intel.com>
 <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
 <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
 <CAL_quvTe_v9Vsbd0u4URitojmD-_VFeaOQ1BBYZ_UGwYWynjVA@mail.gmail.com>
 <87sgo3dasg.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sgo3dasg.fsf@intel.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2Ht+Dq3YAPtcP/5kWk8fJeCAjPfIj2CPqz7fkwrNtNc=;
 b=fkuGCaMMMuULzBZ+Q+nhwpzDlsIUndph+HQQvswuirV6/v5SP4LPa3Q0x9aBxlsnwp
 9Mp2VFnKxpjQ7hXEdOc8c/lSjEo0Vv3vXc0PEnkvUfXDpUdCAoCElgWGz8Y1NM8OT8Jf
 b05I+QoF+rbfakQZUTUFesf8MBnTIUtgh4NjE=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, Ross Zwisler <zwisler@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mat King <mathewk@google.com>,
 Sean Paul <seanpaul@chromium.org>, Jingoo Han <jingoohan1@gmail.com>,
 David Airlie <airlied@redhat.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDk6MTM6NTFBTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gTW9uLCAwNyBPY3QgMjAxOSwgTWF0IEtpbmcgPG1hdGhld2tAZ29vZ2xlLmNvbT4g
d3JvdGU6Cj4gPiBUaGF0IG1ha2VzIHNlbnNlOyBqdXN0IHRvIGNvbmZpcm0gY2FuIGEgcHJvcGVy
dHkgYmUgYWRkZWQgb3IgcmVtb3ZlZAo+ID4gYWZ0ZXIgdGhlIGNvbm5lY3RvciBpcyByZWdpc3Rl
cmVkPwo+IAo+IFlvdSBuZWVkIHRvIGNyZWF0ZSB0aGUgcHJvcGVydHkgYmVmb3JlIHJlZ2lzdGVy
aW5nIHRoZSBkcm0gZGV2aWNlLiBZb3UKPiBjYW4gYXR0YWNoL2RldGFjaCB0aGUgcHJvcGVydHkg
bGF0ZXIsIGJ1dCBJIHNob3VsZCB0aGluayB5b3Uga25vdyBieSB0aGUKPiB0aW1lIHlvdSdyZSBy
ZWdpc3RlcmluZyB0aGUgY29ubmVjdG9yIHdoZXRoZXIgaXQgc3VwcG9ydHMgdGhlIHByaXZhY3kK
PiBzY3JlZW4gb3Igbm90LgoKSSBkb24ndCB0aGluayB5b3UgY2FuIGFkZC9yZW1vdmUgYSBwcm9w
ZXJ0eSBhZnRlciB0aGUgb2JqZWN0IHlvdSdyZQphZGRpbmcvcmVtb3ZpbmcgdGhlIHByb3AgZnJv
bSBoYXMgZ29uZSBwdWJsaWMgKGVpdGhlciB3aXRoCmRybV9kZXZfcmVnaXN0ZXIgb3IgZHJtX2Nv
bm5lY3Rvcl9yZWdpc3RlciBmb3IgaG90cGx1Z2dlZCBjb25uZWN0b3JzKS4KCkkgZ3Vlc3MgYW5v
dGhlciBnYXAgd2Ugc2hvdWxkIGNvdmVyIHdpdGggc29tZSBXQVJOX09OPwotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
