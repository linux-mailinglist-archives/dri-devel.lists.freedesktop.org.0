Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC69587D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB06E5FC;
	Tue, 20 Aug 2019 07:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB31289906
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 18:54:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i63so457136wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 11:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dg+vTJWwF0SC5ZmVktCWggL7FF9o0GnpeAVKAQZcrHw=;
 b=dsTs8z0T2UjpxQ1QHVhbH0J9J0laVUjTa2XWkniSHcAgGUFucqgrfIEIyFW5fFbFv3
 tsEHfNXgCKfbTG3W7tkiGj4A1gcaSqO7SRzHlwe3HiHUfrigE/Zcn2QDTTAING1kjRqQ
 W24mDLH17BhN4z034UxKX9T/JtTwhPiq9jujmoYVeAiYHgZhp7fvM3oEkaj/nHA2ma+M
 4VoJeAG2IBjOxicSl3EKmbiYpwB/R+aCVD6e94lOrD6uGZpe4xROUfidp+1koOnpvsbQ
 hPe3oQ8VysPlwpldy3YF25SQDvfECJ0AURfvqYTlI3CJEd8mXzjdbGMmQROVced1RC/k
 v/SA==
X-Gm-Message-State: APjAAAWWYIWosw3+zExMUm95PYMoQoecAH8xpe8XBAZODw7sD6I16axs
 urHbMp5Rbc3s0Fq3NVEitcI=
X-Google-Smtp-Source: APXvYqw5+rzOdEDCVU9skmAYgtMC7l9GFbyn6rgaAs3/kDGGAmYMsAI7L5QaMNhUNSBXgHX3GpW5VQ==
X-Received: by 2002:a1c:c542:: with SMTP id v63mr21530967wmf.97.1566240889436; 
 Mon, 19 Aug 2019 11:54:49 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net.
 [86.58.59.25])
 by smtp.gmail.com with ESMTPSA id d69sm12353398wmd.4.2019.08.19.11.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 11:54:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [v5,05/12] drm/modes: Rewrite the command line parser
Date: Mon, 19 Aug 2019 20:54:46 +0200
Message-ID: <5978761.uBj7R84RrF@jernej-laptop>
In-Reply-To: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
References: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dg+vTJWwF0SC5ZmVktCWggL7FF9o0GnpeAVKAQZcrHw=;
 b=m87NnomK7ts5hsHoKS3cqfxie5TI/YgdQc5Y77eo31iiskjehKMTHJlvc6AIf95M3B
 LwH7s2aer3Yz0UU9I04mV7Qkeu1DdijsQBGMhtaObWLrKFTm2UiuNvDW8tRORVBrnJT9
 ZHCrAmZ+Mclel/8GI7WEx4BZ+6T8Q7pCZPXhE6+yRo/AuX1OYlvPmDuexpuHLtK3K4of
 ciL1ebW6zVrR3e1Ipuyk3MK57HdmgPWaam7g2NbIzUB4ETQ/zRtj+0U8DvsOcFiFfNPy
 iqQ8u/znexucp2Fn0DzbFtw914dzt8v0OY7vArFmw3DUtsiL8QfvrT4ZL+orKHD7+/zf
 O/WQ==
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 thomas.graichen@gmail.com, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K0NDOiBUaG9tYXMgR3JhaWNoZW4KCkRuZSBwb25lZGVsamVrLCAxNy4ganVuaWogMjAxOSBvYiAx
Njo1MTozMiBDRVNUIGplIE1heGltZSBSaXBhcmQgbmFwaXNhbChhKToKPiBGcm9tOiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KPiAKPiBSZXdyaXRlIHRo
ZSBjb21tYW5kIGxpbmUgcGFyc2VyIGluIG9yZGVyIHRvIGdldCBhd2F5IGZyb20gdGhlIHN0YXRl
IG1hY2hpbmUKPiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+IAo+IEhvcGVmdWxseSwg
dGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVhc2lseSB0byBzdXBwb3J0IG5hbWVk
IG1vZGVzCj4gYW5kIC8gb3IgcHJvcGVydGllcyBzZXQgZGlyZWN0bHkgb24gdGhlIGNvbW1hbmQg
bGluZS4KPiAKPiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVs
ZWN0cm9ucy5jb20+CgpUaG9tYXMgcmVwb3J0ZWQgdG8gbWUgdGhhdCB0aGlzIHBhdGNoIGJyZWFr
cyAidmlkZW89Q09OTkVDVE9SOmUiIGtlcm5lbCAKcGFyYW1ldGVyIHdoaWNoIGhlIGN1cnJlbnRs
eSB1c2VzIGFzIGEgd29ya2Fyb3VuZCBmb3IgSDYgSERNSSBtb25pdG9yIApkZXRlY3Rpb24gaXNz
dWUgb24gb25lIFNUQi4KCkkgc3VwcG9zZSB0aGlzIGlzIHRoZSBzYW1lIGlzc3VlIHRoYXQgRG1p
dHJ5IG5vdGljZWQuCgpUaG9tYXMgR3JhaWNoZW4gKGluIENDKSBjYW4gcHJvdmlkZSBtb3JlIGlu
Zm9ybWF0aW9uIGlmIG5lZWRlZC4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
