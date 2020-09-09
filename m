Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4C2627E2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E0B6E9E1;
	Wed,  9 Sep 2020 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5F76E8C3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 00:16:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a15so1220153ljk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 17:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aHaTSi7fSnGjwBOLQtAuiJEEe/fNGCKc8u+ZcHPxdgQ=;
 b=VM718ikC74EnEAa0HMMO5cWelvhb7XMsshvb+ff2pAt3J9JVEfx0E0CMgTDj5XKe8b
 q90oJr8RNeXDEm4sDX8LORWCSmbKOpQq1vKlVAmWUg7AAUJcSZ79fSddpkakPhU5HZzl
 PSeSbEo0rcY++RKYh1MSTyu3mjPeckkvLf4p0a0r8dgwrpN4qY8SqjUqCQazOaLqPfrr
 GwxgEKmbAQ/pkYid6l9VWOuNUjqhkxS+DZbjJV65tvgnROR+CKlsUw/J4H2no3wYiieh
 TlRTKeElG0wd1LICaDEBAoVbx6MxSrVdGV+lQhcWWZCAtkAgw2mCyZkDqsyvjGPmVegZ
 jE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aHaTSi7fSnGjwBOLQtAuiJEEe/fNGCKc8u+ZcHPxdgQ=;
 b=Rj0EzPBFojNcdddeu90oGB3ug27dXr3CE07Ht/xqFVArhmRbwf4kqze3ht6ZVV9zVr
 IeiSBtPHPH0rQnBqQTkUgtACNhH8kt/EsT2UmOAUtesPIJBSzx+8z6+vkognZUgU9MU0
 GRKD1jrwhQ3PYMGCJvJucmN0Sb/AhSzQ++rihkDhtIrHfxeStjUwwJhtKdGA5HvfZ5fm
 OFaM6nh9pjgsXM6ISTYt3h7arfzmhZXnjRIiygEHzBMjls3S7spukhEvi4tHA4efHP2K
 7DM2FuXYgQC6mRG2wnW9zgQvs5hRUgKRVsCDro8fGJOwpJq7m11hdII3SXFncX4GsY/b
 E1lg==
X-Gm-Message-State: AOAM5326KeOzV9TxXr8eGKjEA3kteD76cHeqqDise/C9OwrXQwF+WQhJ
 6TXLsJ8tYULdPYPJmSeFf7U=
X-Google-Smtp-Source: ABdhPJxMOArydBWMtC63OEwp6cR1nWEkqOX8GOpDv1Sq+yxTNcb+69met/SHeMsuzTx1FZ+aBWIYEg==
X-Received: by 2002:a05:651c:1352:: with SMTP id
 j18mr459685ljb.343.1599610616363; 
 Tue, 08 Sep 2020 17:16:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id e17sm303594ljg.85.2020.09.08.17.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 17:16:55 -0700 (PDT)
Subject: Re: [RFC PATCH v2 15/17] drm/tegra: Add power_on/power_off engine
 callbacks
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-16-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ddaf2ef-e232-7d44-0b08-e190f20297b2@gmail.com>
Date: Wed, 9 Sep 2020 03:16:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-16-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+ICtzdGF0
aWMgaW50IHZpY19wb3dlcl9vbihzdHJ1Y3QgdGVncmFfZHJtX2NsaWVudCAqY2xpZW50KQo+ICt7
Cj4gKwlzdHJ1Y3QgdmljICp2aWMgPSB0b192aWMoY2xpZW50KTsKPiArCj4gKwlyZXR1cm4gcG1f
cnVudGltZV9nZXRfc3luYyh2aWMtPmRldik7CgpQbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQgUlBN
IG5lZWRzIHRvIGJlIHB1dCBpbiBhIGNhc2Ugb2YgZXJyb3IuCgpNYXliZSBpdCB3b3VsZCBiZSBi
ZXR0ZXIgaWYgZHJpdmVyLWNvcmUgY291bGQgdGFrZSBjYXJlIG9mCnJlc3VtaW5nL3N1c3BlbmRp
bmcgY2xpZW50J3MgUlBNIGluc3RlYWQgb2YgcHV0dGluZyB0aGF0IGJ1cmRlbiBvbiBlYWNoCmNs
aWVudCBpbmRpdmlkdWFsbHk/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
