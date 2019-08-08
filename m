Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF7D8614C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 14:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FC86E4A0;
	Thu,  8 Aug 2019 12:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C756E4A0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 12:03:01 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h8so2328199edv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 05:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=mjkixiaAxxiFzy53lT4YCqiUuJ/UBCWwzzeoMnM6RlY=;
 b=tC9tnjOyfnui1osJvrKrxayHRroLTIfHz6HI692PwBKt8BSaEmJ0JhIjXnWu6R4pZr
 NKPFDwkv5ijWhUUZhWdjnyOFdbGCq4fFMEnPURWf3MOg7d/R3VYL2U5G1JhBgY93oXqt
 HzEvu5CEKggh4chsypEtyCEGtquDugj7pZIUpJaaVvn6VWcKsi7soH13qoAXydy7LDGU
 In4FHSs+LoHWeMySqNuvEW7TOEvBfsRZZaR64yUDspVCDl3lIis53gEAFK9c7BZ21kEH
 gbd/z9Z1EeXa7uhXygDoelsjDtJ69mSJ0Xp9A1/O7FaFoup8lio8QbHE2BJ9HegGHfvI
 /PwA==
X-Gm-Message-State: APjAAAWRccd+7kHJkAKsrDpVyUTcDf35LQ3WYG193cDZ5Fmlt5/3Td0k
 ajYNgdak31uONTrktc3Tf4nRlg==
X-Google-Smtp-Source: APXvYqzS2rW0Qbp+LlSlJ+X0OO40h6QF5T89vsZiuJ9G7cPdSUcDvRNM2I/k5rBAMmDHONeBm2xZJw==
X-Received: by 2002:a17:906:d201:: with SMTP id
 w1mr4872515ejz.303.1565265780504; 
 Thu, 08 Aug 2019 05:03:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y48sm308925edc.66.2019.08.08.05.02.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 05:02:59 -0700 (PDT)
Date: Thu, 8 Aug 2019 14:02:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/8] ttm: turn ttm_bo_device.vma_manager into a pointer
Message-ID: <20190808120252.GO7444@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@linux.ie>, "Huang, Ray" <Ray.Huang@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190808093702.29512-1-kraxel@redhat.com>
 <20190808093702.29512-3-kraxel@redhat.com>
 <2a90c899-19eb-5be2-3eda-f20efd31aa29@amd.com>
 <20190808103521.u6ggltj4ftns77je@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808103521.u6ggltj4ftns77je@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mjkixiaAxxiFzy53lT4YCqiUuJ/UBCWwzzeoMnM6RlY=;
 b=H0rFW5uZXHZS+RuXNwstBwPPPpRfFQon8ZE5XaQ+FNEGeGJN8mlmawD5YnvL7fL33i
 ewcwGDEBgMQDYZGlhdtrhwb/0YSj6gE7jkmCebU8HJB7XL6fAR8IcyDLN0tjsyXn+zLy
 6dbY4z5KvcQibmXPwl+FLgWKftHbHboPAn3WQ=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTI6MzU6MjFQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwOTo0ODo0OUFNICswMDAwLCBLb2VuaWcs
IENocmlzdGlhbiB3cm90ZToKPiA+IEFtIDA4LjA4LjE5IHVtIDExOjM2IHNjaHJpZWIgR2VyZCBI
b2ZmbWFubjoKPiA+ID4gUmVuYW1lIHRoZSBlbWJlZGRlZCBzdHJ1Y3Qgdm1hX29mZnNldF9tYW5h
Z2VyLCBpdCBpcyBuYW1lZCBfdm1hX21hbmFnZXIKPiA+ID4gbm93LiAgdHRtX2JvX2RldmljZS52
bWFfbWFuYWdlciBpcyBhIHBvaW50ZXIgbm93LCBwb2ludGluZyB0byB0aGUKPiA+ID4gZW1iZWRk
ZWQgdHRtX2JvX2RldmljZS5fdm1hX21hbmFnZXIgYnkgZGVmYXVsdC4KPiA+ID4KPiA+ID4gQWRk
IHR0bV9ib19kZXZpY2VfaW5pdF93aXRoX3ZtYV9tYW5hZ2VyKCkgZnVuY3Rpb24gd2hpY2ggYWxs
b3dzIHRvCj4gPiA+IGluaXRpYWxpemUgdHRtIHdpdGggYSBkaWZmZXJlbnQgdm1hIG1hbmFnZXIu
Cj4gPiAKPiA+IENhbid0IHdlIGdvIGRvd24gdGhlIHJvdXRlIG9mIGNvbXBsZXRlbHkgcmVtb3Zp
bmcgdGhlIHZtYV9tYW5hZ2VyIGZyb20gCj4gPiBUVE0/IHR0bV9ib19tbWFwKCkgd291bGQgZ2V0
IHRoZSBCTyBhcyBwYXJhbWV0ZXIgaW5zdGVhZC4KPiAKPiBJdCBzdXJlbHkgbWFrZXMgc2Vuc2Ug
dG8gdGFyZ2V0IHRoYXQuICBUaGlzIHBhdGNoIGNhbiBiZSBhIGZpcnN0IHN0ZXAKPiBpbnRvIHRo
YXQgZGlyZWN0aW9uLiAgSXQgYWxsb3dzIGdlbSBhbmQgdHRtIHRvIHVzZSB0aGUgc2FtZQo+IHZt
YV9vZmZzZXRfbWFuYWdlciAoc2VlIHBhdGNoICMzKSwgd2hpY2ggaW4gdHVybiBtYWtlcyB2YXJp
b3VzIGdlbQo+IGZ1bmN0aW9ucyB3b3JrIG9uIHR0bSBvYmplY3RzIChzZWUgcGF0Y2ggIzQgZm9y
IHZyYW0gaGVscGVycykuCgorMSBvbiBjbGVhbmluZyB0aGlzIHVwIGZvciBnb29kLCBhdCBsZWFz
dCBsb25nLXRlcm0gLi4uCgo+ID4gVGhhdCB3b3VsZCBhbHNvIG1ha2UgdGhlIHZlcmlmeV9hY2Nl
c3MgY2FsbGJhY2sgY29tcGxldGVseSBzdXBlcmZsdW91cyAKPiA+IGFuZCBsb29rcyBsaWtlIGEg
Z29vZCBzdGVwIGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbiBvZiBkZS1taWRsYXllcmluZy4KPiAK
PiBIbW0sIHJpZ2h0LCBub3RpY2VkIHRoYXQgdG9vIHdoaWxlIHdvcmtpbmcgb24gYW5vdGhlciBw
YXRjaCBzZXJpZXMuCj4gR3Vlc3MgSSdsbCB0cnkgdG8gbWVyZ2UgdGhvc2UgdHdvIGFuZCBzZWUg
d2hlcmUgSSBlbmQgdXAgLi4uCgouLi4gYnV0IGlmIGl0IGdldHMgdG9vIGludmFzaXZlIEknZCB2
b3RlIGZvciBpbmNyZW1lbnRhbCBjaGFuZ2VzLiBFdmVuIGlmCndlIGNvbXBsZXRlbHkgcmlwIG91
dCB0aGUgdm1hL21tYXAgbG9va3VwIHN0dWZmIGZyb20gdHRtLCB3ZSBzdGlsbCBuZWVkIHRvCmtl
ZXAgYSBjb3B5IHNvbWV3aGVyZSBmb3Igdm13Z2Z4LiBPciB3b3VsZCB0aGUgZXZpbCBwbGFuIGJl
IHRoZSB2bXdnZngKd291bGQgdXNlIHRoZSBnZW0gbW1hcCBoZWxwZXJzIHRvbz8KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
