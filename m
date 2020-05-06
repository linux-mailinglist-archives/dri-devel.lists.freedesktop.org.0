Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8D1C831C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EA66E93A;
	Thu,  7 May 2020 07:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90B6E8B7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 17:05:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g4so3194657ljl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 10:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i6DgO5+TRdDJq45v1B/zETVA5zYOWCANdfi6IDZAE08=;
 b=nJ/sVN4kSr6t9IdoSsZPyyOmbUtLWQu7s5b311BEDJvl06V1lFO2Wk5poGrlIbZsWG
 G8EybU7nSnwfFfkbvCXPrcZUZQIqm16wZ+rPp0O3hQE0JEcsYsFTb3O3J/N12j9y2gzY
 RBKwbVGcFBA26M8N0u/dDpO8IVTP26eaMkcKJ0052VehWgaqhfAqoGIcUzS/bm+YkiGh
 Ky74G8aJ+0xjJNlTypLKNlTCx+b/tYENL6cUTpTDZwR/eERinbs/nmOg/5KfmgeHFH8G
 DQemBq3wpqRb34Ade7odH7pdEztMk6j5BPSz1mhgc2rrp7b5WDgNZtw5mGMw6mWcU5J2
 Vzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i6DgO5+TRdDJq45v1B/zETVA5zYOWCANdfi6IDZAE08=;
 b=e8dhcX1dFs4MLqQ9KnwUf9GLqf2tB2cd4OqZgr133ifaPCoRA3lCh5dU50+5DpgmVx
 iLp0cLUtMxFE9Nb34NeoOUWieK4sQmlV8BlU3duJIhvV6Vm39j4JYmy1c0KRLbQnWWjg
 XSBb2oAZ6qZyRo+ecvteF3x01Pv0qCqXfiALMq1SbvGoVZoJwLYhbwGVSuiZbPFm6wNn
 fIh2IpxJFwlYMSOV4hTcnZ2Ij2oFmj58a3lv56ryx3YsgcrgRLkaFsilqwRw++wpd6Ou
 GlKGl29772r9uGnvNPGIBtcdUM3YfN4CgSeZAy5h4wgjfn3GT+6UAT/QPFInV7brXrX1
 u+Lw==
X-Gm-Message-State: AGi0Pua+l9mzvF0OxQAALyWeD3K1cKn+i02fvbQAOgEs7hDogxXy9PI2
 DvOtC0Z+Rs4mFjCNiwcZipscuvpu
X-Google-Smtp-Source: APiQypKTUTxtYqnFPuX+HwJKBbGWBlPEj9Ko1LNSd7vmorqXwvlYb84XnkdhwewUOEpEiJLOYMc43Q==
X-Received: by 2002:a2e:80c1:: with SMTP id r1mr5389478ljg.227.1588784729261; 
 Wed, 06 May 2020 10:05:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id d9sm1971851lfa.77.2020.05.06.10.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 10:05:28 -0700 (PDT)
Subject: Re: [PATCH v5 2/6] drm/of: Make drm_of_find_panel_or_bridge() to
 check graph's presence
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-3-digetx@gmail.com>
 <20200506164133.GB19296@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f288e704-2fdb-d548-9f5b-8016412dfd3f@gmail.com>
Date: Wed, 6 May 2020 20:05:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506164133.GB19296@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDYuMDUuMjAyMCAxOTo0MSwgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gT24gU2F0LCBBcHIg
MTgsIDIwMjAgYXQgMDg6MDY6NTlQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBX
aGVuIGdyYXBoIGlzbid0IGRlZmluZWQgaW4gYSBkZXZpY2UtdHJlZSwgdGhlIG9mX2dyYXBoX2dl
dF9yZW1vdGVfbm9kZSgpCj4+IHByaW50cyBhIG5vaXN5IGVycm9yIG1lc3NhZ2UsIHRlbGxpbmcg
dGhhdCBwb3J0IG5vZGUgaXMgbm90IGZvdW5kLiBUaGlzIGlzCj4+IHVuZGVzaXJhYmxlIGJlaGF2
aW91ciBpbiBvdXIgY2FzZSBiZWNhdXNlIGFic2VuY2Ugb2YgYSBwYW5lbC9icmlkZ2UgZ3JhcGgK
Pj4gaXMgYSB2YWxpZCBjYXNlLiBMZXQncyBjaGVjayBwcmVzZW5jZSBvZiB0aGUgbG9jYWwgcG9y
dCBpbiBhIGRldmljZS10cmVlCj4+IGJlZm9yZSBwcm9jZWVkaW5nIHdpdGggcGFyc2luZyB0aGUg
Z3JhcGguCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWls
LmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKVGhh
bmsgeW91IGFnYWluIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoZXNlIHBhdGNoZXMhCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
