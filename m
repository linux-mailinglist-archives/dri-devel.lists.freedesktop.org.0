Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8776B720
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D7D6E25C;
	Wed, 17 Jul 2019 07:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0820C6E174
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:47:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p74so19672655wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 11:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=la7tyf8ZPvrnrjwCqpENoZfGCM6j/pjcLrF4W1pZ+rY=;
 b=qJijubmVY0dpwUXXcZRfSqhVvVjcgzYU5tWsc9aLW7YmbDbhR1YVXfrgGo3rwNTSCJ
 ExaE8iivlofI59w2Br2Yp4Mmd0mxTPrK8PVKjhcvsOChyDdARDtCB7LMDZutMxy1H9W2
 v8DKLYNaOzLUXPvkX44Y2aCYObNNLhD3Tc3NAQi28ZwRfZlPS5EhC33YRLM9eYL4LsOA
 NvCBdOARIMEKXsrEXbo68GmuDjO4Vw2vEVR9r+sa5Lfm6Vh2LlDA+fFlxEm2JRKp+2FI
 9Je1Af1Z1jchthxXpUcIIPkKRWX702sy6ft75ws7P68e4tFAg2SliVlp61/XC/z9JpjT
 0xCQ==
X-Gm-Message-State: APjAAAVgSOP6ZyNkkd8ZKf0av4q6XVzxQiTrDpICIYCOSQMhcBmbzaS1
 /ZKpR4F2maSpysUY8whccOI=
X-Google-Smtp-Source: APXvYqy2/SaHVfv0ZA468Q8Vk4qvCfbFHdaeCRTzyNzYAfwnhcqrN0fEKdlQGtE2FC32qHEJN15Jjw==
X-Received: by 2002:a1c:a7c6:: with SMTP id
 q189mr32313689wme.146.1563302867385; 
 Tue, 16 Jul 2019 11:47:47 -0700 (PDT)
Received: from localhost (smb-adpcdg1-05.hotspot.hub-one.net. [213.174.99.133])
 by smtp.gmail.com with ESMTPSA id y16sm20774858wrw.33.2019.07.16.11.47.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jul 2019 11:47:46 -0700 (PDT)
Date: Tue, 16 Jul 2019 20:47:44 +0200
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Subject: Re: [PATCH v7 2/2] Input: add Apple SPI keyboard and trackpad driver.
Message-ID: <20190716184744.GC1140@penguin>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-3-ronald@innovation.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190419081926.13567-3-ronald@innovation.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=la7tyf8ZPvrnrjwCqpENoZfGCM6j/pjcLrF4W1pZ+rY=;
 b=Rzasgh4koX7egHkPZapYQpqOqr5V0KdP9Amkfg9lgCJK7rw363mdbEp3iWx2c3xvir
 xdX43TR6TrHCZ50yHqFcTt5uDVyaArbRVVAu8AcH0H3ZhsWmu116mXxKkTzHhuN3kJna
 wZ+8QLY3SR0VV+w/eJGZkKUj//jh5o2e5qtKMpgvOVXfd3OeznGIjXLfi9VAPTsHDBDv
 wp2gh+xw6HDAb48gOIn7wNeTb90pv4ASdvju3i2LJXsnGtF9H4hSNRZ6QPOsq+tUD1G2
 G6pynhwrr9HN4O2Rb792Nrc0qz39g8hwNkW4ERLYxMEACZUKkFFyBYuflf+A0/M6Ojm0
 0NOA==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Federico Lorenzi <federico@travelground.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9uYWxkLAoKT24gRnJpLCBBcHIgMTksIDIwMTkgYXQgMDE6MTk6MjZBTSAtMDcwMCwgUm9u
YWxkIFRzY2hhbMOkciB3cm90ZToKPiBUaGUga2V5Ym9hcmQgYW5kIHRyYWNrcGFkIG9uIHJlY2Vu
dCBNYWNCb29rJ3MgKHNpbmNlIDgsMSkgYW5kCj4gTWFjQm9va1BybydzICgxMywqIGFuZCAxNCwq
KSBhcmUgYXR0YWNoZWQgdG8gYW4gU1BJIGNvbnRyb2xsZXIgaW5zdGVhZAo+IG9mIFVTQiwgYXMg
cHJldmlvdXNseS4gVGhlIGhpZ2hlciBsZXZlbCBwcm90b2NvbCBpcyBub3QgcHVibGljbHkKPiBk
b2N1bWVudGVkIGFuZCBoZW5jZSBoYXMgYmVlbiByZXZlcnNlIGVuZ2luZWVyZWQuIEFzIGEgY29u
c2VxdWVuY2UgdGhlcmUKPiBhcmUgc3RpbGwgYSBudW1iZXIgb2YgdW5rbm93biBmaWVsZHMgYW5k
IGNvbW1hbmRzLiBIb3dldmVyLCB0aGUga25vd24KPiBwYXJ0cyBoYXZlIGJlZW4gd29ya2luZyB3
ZWxsIGFuZCByZWNlaXZlZCBleHRlbnNpdmUgdGVzdGluZyBhbmQgdXNlLgo+IAo+IEluIG9yZGVy
IGZvciB0aGlzIGRyaXZlciB0byB3b3JrLCB0aGUgcHJvcGVyIFNQSSBkcml2ZXJzIG5lZWQgdG8g
YmUKPiBsb2FkZWQgdG9vOyBmb3IgTUI4LDEgdGhlc2UgYXJlIHNwaV9weGEyeHhfcGxhdGZvcm0g
YW5kIHNwaV9weGEyeHhfcGNpOwo+IGZvciBhbGwgb3RoZXJzIHRoZXkgYXJlIHNwaV9weGEyeHhf
cGxhdGZvcm0gYW5kIGludGVsX2xwc3NfcGNpLiBGb3IgdGhpcwo+IHJlYXNvbiBlbmFibGluZyB0
aGlzIGRyaXZlciBpbiB0aGUgY29uZmlnIGltcGxpZXMgZW5hYmxpbmcgdGhlIGFib3ZlCj4gZHJp
dmVycy4KCkkgYXBwbGllZCB0aGUgcGF0Y2ggKGJ1dCBjaGFuZ2VkIF9fdTggdG8gdTggYXMgdGhh
dCdzIHByZWZlcnJlZCBmb3JtIGZvcgppbnNpZGUgdGhlIGtlcm5lbCwgYW5kIGFkZGVkIGVycm9y
IGhhbmRsaW5nIGZvciBpbnB1dF9tdF9pbml0X3Nsb3RzKSBidXQKd2UgbmVlZCB0byBkbyBzb21l
IG1vcmUgd29yayBvbiB0aGUgZHJpdmVyLgoKTXkgbWFpbiBpc3N1ZSBpcyB3aXRoIHJlZ2lzdGVy
aW5nIHRvdWNocGFkIGRldmljZSBhc3luY2hyb25vdXNseSwKaW5kZXBlbmRlbnQgZnJvbSB0aGUg
cHJvYmUoKSBmdW5jdGlvbi4gVGhpcyBtZWFucyAoYXMgZmFyIGFzIEkgY2FuIHRlbGwpCnRoYXQg
YW55IGVycm9yIGlzIG5vdCByZWFsbHkgYXBwcm9wcmlhdGVseSBoYW5kbGVkIChhcyBieSB0aGF0
IHRpbWUgaXQKaXMgdG9vIGxhdGUgdG8gc2lnbmFsIGVycm9ycyBmcm9tIHByb2JlKCkpIGFuZCBk
ZXZtIGZ1bmN0aW9ucyBhcmUgbm90CmdvaW5nIHRvIGJlIGNhbGxlZCwgbGVhdmluZyByZW1uYW50
cyBvZiB0aGUgcmVzb3VyY2VzIGluIG1lbW9yeSBvbgpkcml2ZXIgdW5sb2FkLiBJdCBhbHNvIGJy
aW5ncyBpbiBpc3N1ZXMgd2l0aCBzdXNwZW5kL3Jlc3VtZSAod2hhdApoYXBwZW5zIGlmIHlvdSBz
dXNwZW5kIHJlYWxseSBxdWlja2x5IHdoaWxlIGRldmljZSBpcyBub3QgcmVnaXN0ZXJlZAp5ZXQ/
KSwgZXRjLCBldGMuCgpDYW4gd2Ugc3dpdGNoIHRvIGNhbGxpbmcgREVWX0lORk8gY29tbWFuZCBz
eW5jaHJvbm91c2x5IGZyb20gcHJvYmUoKT8gSWYKd2UgYXJlIGNvbmNlcm5lZCBhYm91dCBpdCB0
YWtpbmcgcmVsYXRpdmVseSBsb25nIHRpbWUgd2UgY2FuIGFsd2F5cwphbm5vdGF0ZSB0aGUgZHJp
dmVyIGFzIGhhdmluZyBwcm9iZV90eXBlID0gUFJPQkVfUFJFRkVSX0FTWU5DSFJPTk9VUyBzbwp0
aGF0IG90aGVyIGRldmljZXMgY2FuIGJlIHByb2JlZCBzaW11bHRhbmVvdXNseSB3aXRoIGFwcGxl
c3BpLgoKVGhhbmtzLgoKLS0gCkRtaXRyeQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
