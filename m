Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC0D13C9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C2A6EA06;
	Wed,  9 Oct 2019 16:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEB76EA06
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 16:14:48 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r4so2561453edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 09:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=0V7oRjm8uLcovmCVvMNf+UbzfqUb/37GyrSPBqEZGcg=;
 b=rpZtYz4ykbuNvBa6r19PeQW3CvReVqdPbjYSU0N8lzOCLqS0hicRVPWApUJ2fwOZLL
 cxHFOFo3rtA/EYXUsRCpsp/aMrCT6Cb3WdWISGB3I35LsSyQIJNtLA2zV8RPU4bZPGPe
 lqJwilm7KQiU8q5sb0POnjz2ME+SOndMK8edsvDfzkj2/X6znSQqtxZW/3rpFxWdRVdD
 KKlc2joY0mSenYdRxIHnwoqEkwCiaZwfQamQKmG9A+ljGJ6vO3dQrmSt4lOlJMFcYGWx
 ydUyDrTE0XGSoDQVvDb13amUQ47PNKR9Jl7TyPl5SJwLDLEb2YbG+KxepvnleNmCi2T2
 kppg==
X-Gm-Message-State: APjAAAWUGYllif/8uFlTc2nPyrEigD+zga1W/d06sRkRDTQGRID0q1uO
 rAmlTqANAjLjmPJ0GPkI+vuJbQ==
X-Google-Smtp-Source: APXvYqxb7GdWbWiUbu49qKaWk0pYYEGMmwbwXmcbsRpYkOya2kEm0gFjwCOxKuayJGJjLGX1YpBoEg==
X-Received: by 2002:aa7:d955:: with SMTP id l21mr3715993eds.179.1570637687120; 
 Wed, 09 Oct 2019 09:14:47 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id oy2sm300863ejb.2.2019.10.09.09.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 09:14:46 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:14:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/2]: Finally delete drmP.h
Message-ID: <20191009161444.GR16989@phenom.ffwll.local>
References: <20191007171224.1581-1-sam@ravnborg.org>
 <20191008165154.GA7988@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008165154.GA7988@ravnborg.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0V7oRjm8uLcovmCVvMNf+UbzfqUb/37GyrSPBqEZGcg=;
 b=RSngwczLGb3BNEtStP17RACn111kxzPG5TyVaISZDCWrzUBlxoHD6tH5L1a3P1OIad
 S4ZDk37xd7UEWyhVnxcKf75WSoFGf9jgOO8jHOWoDNFMuhzsoTvXEghmhQF0NT7yqnyf
 F5QonfPiiHj19Bpp3ZD+6NQV4DdSqun9UGOOY=
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDY6NTE6NTRQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDA3LCAyMDE5IGF0IDA3OjEyOjIyUE0gKzAyMDAsIFNhbSBSYXZu
Ym9yZyB3cm90ZToKPiA+IE9uZSB1c2VyIG9mIGRybVAuaCBzbmVha2VkIGluIGFmdGVyIHRoZSBt
ZXJnZSB3aW5kb3cuCj4gPiBEcm9wIHRoZSB1c2Ugb2YgZHJtUC5oIGFuZCBkZWxldGUgdGhlIGhl
YWRlciBmaWxlIGZvciBnb29kLgo+ID4gCj4gPiBTbWFsbCBiYW5kLWFpZCBvbiB0b3Agb2Ygbm90
IGdvaW5nIHRvIHhkYyA6LSkKPiA+IAo+ID4gQnVpbGQgdGVzdGVkIHdpdGggdmFyaW91cyBhcmNo
aXRlY3R1cmVzIGFuZCBjb25maWdzLgo+IAo+IEFwcGxpZWQgYW5kIHB1c2hlZCB0byBkcm0tbWlz
Yy1uZXh0LgoKWWVhaCBhd2Vzb21lIHN0dWZmLCBsZXQgbWUgcGlsZSBpbiB3aXRoIHRoZSBjb25n
cmF0dWxhdGlvbnMhISEKLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
