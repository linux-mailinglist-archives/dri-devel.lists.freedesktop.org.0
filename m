Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104DB72E21
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903EA6E4C5;
	Wed, 24 Jul 2019 11:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AD26E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:49:17 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so12056601edo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Ky6MiqknUauxBZH/dFB9V8N7cSZFbXcp813AEssc034=;
 b=ggdvG3DaNDWYnS1AqRk/nYad7oj7I85Lq3Yud287u22b6epUKTsjaCp/tJoYWYEszu
 j/c3wDVCTBtJAJBz5OE+btV9xU7caFlF0YHFBIZSF9WwE45OIlk+M2Mf/3qEIvo3hC4N
 Q8iMr+cKfacgdS3ADU24ajv1IUp+KXgwGY3ilRdJwyTZ9vQxiFnWbOczPR/eMgagecEO
 +5UTI2gDegs0cc8DbPMTr2hvFNv3b85VaIjvBh1nEWoUxPX8ALaYEmRK2GXtqH6WOFdK
 LXZZuqlFvm6GxPBCqTXe87dtQuq60zKOOJ3jJDV7grzeeoFpoFSrPSx4ZYUibEiy7DuG
 K+yQ==
X-Gm-Message-State: APjAAAWXgfL7LhFK7OKIjlsJ/D3ddZXTGfVTYwMlYiX8eTR8wRqjQvfx
 6uAYu046uuvPT7R1oYbVOcU=
X-Google-Smtp-Source: APXvYqwxJaa6d48jFA2r5dQ4BfamVvHN3hDlPbM+EjOINhA7XXW533p+MIuVnfd7kvr+TWyx1PBo2Q==
X-Received: by 2002:a17:906:a39a:: with SMTP id
 k26mr13973104ejz.82.1563968956237; 
 Wed, 24 Jul 2019 04:49:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x11sm9268496eju.26.2019.07.24.04.49.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:49:15 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:49:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: handle fbdev changes through drm-misc tree
Message-ID: <20190724114913.GZ15868@phenom.ffwll.local>
Mail-Followup-To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <CGME20190723143329eucas1p211688de2902dbac72998fda9e694083d@eucas1p2.samsung.com>
 <d449f697-ed25-8a3f-16d5-b981f1a52217@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d449f697-ed25-8a3f-16d5-b981f1a52217@samsung.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ky6MiqknUauxBZH/dFB9V8N7cSZFbXcp813AEssc034=;
 b=K38QiI9z0UqP/jOGfZgUBdANryYHFccCp4EpAHFXhr18n9XPmRDBNkulDfwEzUlJt6
 zauV896QRGbFz/vfGhitFSXoEG210dh16UprC6STA5QWoi8Q8/fLuF1A7bYa+L/CtiOG
 SsKMSUs0mIzX1EFoodnQBTAEIlWL5lIs1EcVw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDQ6MzM6MjdQTSArMDIwMCwgQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiB3cm90ZToKPiBmYmRldiBwYXRjaGVzIHdpbGwgbm93IGdvIHRvIHVwc3RyZWFt
IHRocm91Z2ggZHJtLW1pc2MgdHJlZSAoSU9XCj4gc3RhcnRpbmcgd2l0aCB2NS40IG1lcmdlIHdp
bmRvdyBmYmRldiBjaGFuZ2VzIHdpbGwgYmUgaW5jbHVkZWQgaW4KPiBEUk0gcHVsbCByZXF1ZXN0
KSBmb3IgaW1wcm92ZWQgbWFpbnRhaW5lcnNoaXAgYW5kIGJldHRlciBpbnRlZ3JhdGlvbgo+IHRl
c3RpbmcuIFVwZGF0ZSBNQUlOVEFJTkVSUyBmaWxlIGFjY29yZGluZ2x5Lgo+IAo+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRs
b21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAg
TUFJTlRBSU5FUlMgfCAgICAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IEluZGV4OiBiL01BSU5UQUlORVJTCj4gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IC0t
LSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNjM4OSw3ICs2Mzg5LDcg
QEAgRlJBTUVCVUZGRVIgTEFZRVIKPiAgTToJQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56
b2xuaWVya2llQHNhbXN1bmcuY29tPgo+ICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gIEw6CWxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IC1UOglnaXQgZ2l0Oi8vZ2l0
aHViLmNvbS9iem9sbmllci9saW51eC5naXQKPiArVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0tbWlzYwo+ICBROglodHRwOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1mYmRldi9saXN0Lwo+ICBTOglNYWludGFpbmVkCj4gIEY6CURvY3VtZW50
YXRpb24vZmIvCgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
