Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E4B4810
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605E16EAF8;
	Tue, 17 Sep 2019 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5446EA07
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 16:54:28 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t10so145583plr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 09:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FYN4b+NI1YPorAIhhS+f7mmIehASw/nOGjnAcJ1aytg=;
 b=H4V4rcgC4XkMYtgU9AOoc0AkL+Km7X1JWnwU8NyZL70O6cFYKRMunrAnpdE0YQLkxj
 9KW2WeQYsHJwba/1SLHhIRUl1UBjq9sHl3VA+Kr/XxXZCN0PneY/JP3DlDCvjAVs3aqj
 5Cso3QSu1IpswcW6Q9kcmMoToODIxvNSZjx69/rc762izzxAvps4oB/6MCjWtTKVby3+
 OSX6aFUVzGizP/kvmnUzKqEq5hfPv8a+LscQXELkBOUoUWVSIan8b9F/xV3rI8wFPwEf
 fMkjuCQdASLP/PPznwzq6PVg5vIrLPBvZ5x4XfcbuYxMLHjQbGNnzVqrepnNBQbWVOye
 tfEg==
X-Gm-Message-State: APjAAAUY9hKtCquzA6DnCL52d/hEJnwHALOo6TNDw7zPv+r8fxa6WgnQ
 uAvh/2csIrD64szjRlgE68E=
X-Google-Smtp-Source: APXvYqyb4JOTccF6wqRiOtOK+GE+dhorpMejvX9BPOyiIDV5pMYcGVgtc2EYLuKO5XxaGzkJQJMffQ==
X-Received: by 2002:a17:902:54f:: with SMTP id 73mr713782plf.329.1568652867960; 
 Mon, 16 Sep 2019 09:54:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id u65sm42787952pfu.104.2019.09.16.09.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 09:54:27 -0700 (PDT)
Date: Mon, 16 Sep 2019 09:54:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: switch to using devm_gpiod_get_optional
Message-ID: <20190916165424.GD237523@dtor-ws>
References: <20190915071323.GA36596@dtor-ws>
 <20190916135904.GA7488@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916135904.GA7488@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FYN4b+NI1YPorAIhhS+f7mmIehASw/nOGjnAcJ1aytg=;
 b=E0J5dSUvECs/aM2rrVuk0JkvPgMq80hHCTpU3WGdUE1SSFyozYc/GLt9UFqy3rukKV
 L8iBc7mzyDR4W0oAnIGqzC39f9zE779/fywBJsiGtwq3TplJVLHNcrv0dby3HVkDCjpT
 84cTpfkh0fjSfWuLICSzwTmfvOEOE+OmOqeU9lTH5FVEGGKHMVpU0v5o3nepu4VVPhTb
 1hDLqpAiHoA8+AD1fVkG/UCmYNiOGwwziPSQlecnkv/mooIPsreUzgP3q2SGBrz8YfMH
 AgoAnU4snWw0jXQDbkzzQI4be+oCv/PlsvhYysHKUmB6FfrnBybv+GngDrY29kVzWDH2
 GAVw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMDM6NTk6MDRQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gU3VuLCBTZXAgMTUsIDIwMTkgYXQgMTI6MTM6MjNBTSAtMDcwMCwgRG1pdHJ5
IFRvcm9raG92IHdyb3RlOgo+ID4gV2UgZG8gbm90IHJlYWxseSBuZWVkIHRvIHVzZSBBUEkgdGhh
dCBmZXRjaGVzIEdQSU8gZGF0YSBmcm9tIGFuCj4gPiBhcmJpdHJhcnkgZGV2aWNlIHRyZWUgbm9k
ZSwgYXMgd2UgYXJlIGRlYWxpbmcgd2l0aCBkZXZpY2UgdHJlZSBub2RlCj4gPiBhc3NpZ25lZCB0
byB0aGUgZGV2aWNlIHN0cnVjdHVyZS4gV2UgY2FuIGVhc2lseSBzd2l0Y2ggdG8KPiA+IGRldm1f
Z3Bpb2RfZ2V0X29wdGlvbmFsKCkgcGx1cyBncGlvZF9zZXRfY29uc3VtZXJfbmFtZSgpIGFuZCBj
bGVhbiB1cAo+ID4gdGhlIGNvZGUuCj4gPiAKPiA+IE5vdGUgdGhpcyBpcyBwYXJ0IG9mIGVmZm9y
dHMgdG8gZ2V0IHJpZCBvZiBbZGV2bV9dZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZQo+ID4gaW4gZHJp
dmVycyBzbyB0aGF0IGdwaW9saWIgY2FuIGJlIGNsZWFuZWQgdXAuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyB8IDE4ICsrKysrKystLS0tLS0t
LS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQo+IAo+IFdlIGNhbid0IGRvIHRoYXQuIFRoZXJlJ3MgYSBzcGVjaWFsIGNhc2UgaW4gcmdiLmMg
dGhhdCBzZXRzCj4gb3V0cHV0LT5vZl9ub2RlIHRvIHNvbWV0aGluZyBkaWZmZXJlbnQgdGhhbiBv
dXRwdXQtPmRldiwgc28gd2UgYWN0dWFsbHkKPiBuZWVkIHRvIHBhc3MgdGhlIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqIHNlcGFyYXRlbHkuCgpVZ2gsIGJyYWluZmFydCBvbiBteSBwYXJ0LiBJIHRvdGFs
bHkgcmVhZCBpdCBpcyBvdXRwdXQtPmRldi5vZl9ub2RlLApzaW1pbGFyIHRvIGFub3RoZXIgZHJp
dmVyIEkgd2FzIGxvb2tpbmcgYXQuLi4KClBsZWFzZSBkaXNjYXJkLCB0aGVyZSB3aWxsIGJlIGFu
b3RoZXIgcGF0Y2ggY2hhbmdpbmcKZGV2bV9ncGlvZF9nZXRfZnJvbV9vZl9ub2RlKCkgdG8gZGV2
bV9md25vZGVfZ3Bpb2RfZ2V0KCkgb25jZSBMaW51cwptZXJnZXMgdGhpcyBuZXcgR1BJTyBtZXRo
b2QuCgpUaGFua3MuCgotLSAKRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
