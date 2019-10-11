Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E9D4154
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECE26EC33;
	Fri, 11 Oct 2019 13:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5104F6EC33
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:33:01 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id i207so3462249ywc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TZTffmmupDFz1doz+bHhDhbAscp+GEPuUpXNsilC2Ho=;
 b=Jchmv90UgBceanVe2ApwyuLycK2UMwepxjJBYSPARa2gP9FUJICrp+/iTRcqU2S2/N
 PGgylP17OOgXSbV6CwVXr4hK7Jfq3AVnHjR30x2Kl+Rpyfd0+Z5teCzDC1aUpEtvk2e2
 bg5T6xmD1icMDcLVsqHmoU7T/qpm/G4blOqbzTTwpFaelqYHu4+BMb8v2X/CF3v2HQRZ
 TZge7TduMtI52RMZ77vqhDsxTkUabdUlyJi6NDJyGRTRbUDbYt1uDdsTYhc6AApIQr4d
 JgdWXQik0o0JdgZJJRVEbTuTTdmqu20PCpsLtnai5cl8uQwOtm3bIXsbS63IXaXytBUL
 K+6Q==
X-Gm-Message-State: APjAAAUXXJgzYEMEhMw+1bAOuEFskELbs6cU5nBqYmg+h5VEx4t5QRDs
 OTRweA6H7AnMfyF8xecBBQliSg==
X-Google-Smtp-Source: APXvYqw7TSPnpy3MWYRruhfAeMHRoulJ8w8nfVVhcNU0/ogVq+g/zJY+92/9O6keIoubCGk38eXy5g==
X-Received: by 2002:a0d:ea56:: with SMTP id t83mr2230445ywe.351.1570800780441; 
 Fri, 11 Oct 2019 06:33:00 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d63sm2234513ywe.55.2019.10.11.06.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:32:59 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:32:59 -0400
From: Sean Paul <sean@poorly.run>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 0/4] drm/msm: Remove four set but not used variables
Message-ID: <20191011133259.GR85762@art_vandelay>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TZTffmmupDFz1doz+bHhDhbAscp+GEPuUpXNsilC2Ho=;
 b=df2UzdDjrnt0N5G/L9ZQ36gK5sN5z3WRz5y/9YYFzPtv0td7DJIKojiK1J7aU5q0Qn
 TCIVpwMBm+qiUZcadW+hJIVkdT6f6JcQN+AQTFTz4D1ZapseNr0kTt3puhmY4Of0+0zf
 ZigYX4YJyDxRN5EgeqhG9pqEMAj+fHFhrORqFQL74tAgeTB9EThimOtOU/aPGsuY+Rq7
 rxTgWoO+T8WVZfF/rWExCkISQIPep8TPhj399CaH9UDBqpw5Lx66kyOvI1E2I9a14zzB
 t+h9Soemp4VJBsyGonBAQCit06isSe510OuvB4T86xZqVS1fWvWRi2QAV1VgVTDDB9Fj
 5zyA==
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDI6NTU6MDJQTSArMDgwMCwgemhlbmdiaW4gd3JvdGU6
Cj4gemhlbmdiaW4gKDQpOgo+ICAgZHJtL21zbS9tZHA1OiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNl
ZCB2YXJpYWJsZSAnZm10Jwo+ICAgZHJtL21zbS9tZHA1OiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNl
ZCB2YXJpYWJsZSAnaHdfY2ZnJyBpbiBibGVuZF9zZXR1cAo+ICAgZHJtL21zbS9kc2k6IFJlbW92
ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdscHgnCj4gICBkcm0vbXNtL2RzaTogUmVtb3Zl
IHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ2xwJwoKQXBwbGllZCB0aGUgc2V0IHRvIG1zbS1u
ZXh0LCB0aGFua3MgZm9yIHRoZSBwYXRjaGVzIQoKU2VhbgoKPiAKPiAgZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMgfCAzIC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X3NtcC5jICB8IDIgLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2hvc3QuYyAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkv
ZHNpX3BoeS5jICAgICB8IDYgKystLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuNy40Cj4gCgotLSAKU2VhbiBQYXVsLCBT
b2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
