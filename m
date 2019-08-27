Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADFE9F3C3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 22:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F040894DD;
	Tue, 27 Aug 2019 20:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCB5894DD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 20:07:55 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id o6so237061oic.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bWyl2iisBFJ2oYdkoeRFrWQZ6jcjMOLOjACZ2X7fsGE=;
 b=flxBUqA5v5b1z9Qmu62K2hvy8YssknkEHSgcXGPESONoLii2ZloRf1HJB22g+FqW/N
 cI1ZwAMOBrFAcqoA+QlriqiDbwdPpupF2oMV4wXX4OzxdeppnYqHTY45mt8uNKkwmUEE
 LRTRE/AjPwVJrUN0w4Pmtu7/kDRHw8Ydv+tZPOFXiytwzZqPIfJ6SFVWtZ59ZxXKg2EW
 Ji+YJ2p19+oFaTzzMWOwjQAG7KlmwOpC/RRru+18X/07S9+DM+gQeyBmFlc0jHcZAuM4
 TYve00rM2AOJKOsunIDqmavKgfhsnwmS8xWznUdKUaqW6AsGs+Hf6vhQbHmeeOHJahDi
 8w7g==
X-Gm-Message-State: APjAAAV6yCB3dZbplI6CcnVcZIi1CGLZuFyYf/8Yx/4FbJJNb4mC2q+l
 5Gk++75YYJoFxjLXAziUkQ==
X-Google-Smtp-Source: APXvYqwncVMEJP4yiKHQbSJqXQLy47/hf6kU1kBVORl25CP99fakof14E/vcUdgsmyARx//2Z5umVw==
X-Received: by 2002:aca:190e:: with SMTP id l14mr360835oii.20.1566936474563;
 Tue, 27 Aug 2019 13:07:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm134806otl.21.2019.08.27.13.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 13:07:53 -0700 (PDT)
Date: Tue, 27 Aug 2019 15:07:53 -0500
From: Rob Herring <robh@kernel.org>
To: Wen He <wen.he_1@nxp.com>
Subject: Re: [v4 1/2] dt/bindings: display: Add optional property node define
 for Mali DP500
Message-ID: <20190827200753.GA5081@bogus>
References: <20190822021135.10288-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822021135.10288-1-wen.he_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Wen He <wen.he_1@nxp.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, leoyang.li@nxp.com,
 linux-devel@linux.nxdi.nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMiBBdWcgMjAxOSAxMDoxMTozNCArMDgwMCwgV2VuIEhlIHdyb3RlOgo+IEFkZCBv
cHRpb25hbCBwcm9wZXJ0eSBub2RlICdhcm0sbWFsaWRwLWFycW9zLXZhbHVlJyBmb3IgdGhlIE1h
bGkgRFA1MDAuCj4gVGhpcyBwcm9wZXJ0eSBkZXNjcmliZSB0aGUgQVJRb1MgbGV2ZWxzIG9mIERQ
NTAwJ3MgUW9TIHNpZ25hbGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdlbi5oZV8x
QG54cC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2FybSxtYWxpZHAudHh0IHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
