Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2FD0CED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46816E96B;
	Wed,  9 Oct 2019 10:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FE06E96B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:40:07 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f20so1547871edv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 03:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=pu7YyA32IAxSpGaf7UJZEaSuEYYlTRI6oCWAxFzbJXY=;
 b=lgIOk362+b/WV9wnznXZ90/bD2ABNfRaKEjsbMYAt1I6tknSkNtLXOlXl5YcWbH9g0
 9nTPKa7sm7vS4JsuC9bhy7FNiFxNMdJd2nzpwtDt88Rqm7NVwK7JCuJ7wnXIJLBpOy/S
 mjhXWXF7tvqq+3iem+AhweNox+R/1h5JisnZeTzFOgIqgO0KGysak/hH6SPCIYCe/aaE
 FT++esqb9BYudU+kEMj3s/bzjAdLSPukdK+2yqEOgEAHcxzMxHOQ5CiGWLbaXmi+YDsL
 /EX+tPrlSmgAkUtjw9QwWw3LkDt4CwNHkYrdUN+TQTl4zj7iNwZrp0W/4H1yLxy0uRYY
 Fp9w==
X-Gm-Message-State: APjAAAUSP9F5r76kZ7dqNljLtRYuaFd28oq+BSxF3FK8E3TajSXNAjEX
 PTOMzJKs5D8ux6G9lxx1xCrdVw==
X-Google-Smtp-Source: APXvYqwyGOINerZEr5dHBn3PNkXe0aIw+CM4KDKXiIPYgSTADOGQMh/xYZcxW5vRZMAyYKZIEzcc7g==
X-Received: by 2002:a17:906:3488:: with SMTP id
 g8mr2062845ejb.162.1570617605611; 
 Wed, 09 Oct 2019 03:40:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id i63sm293464edi.65.2019.10.09.03.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 03:40:04 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:40:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: zhong jiang <zhongjiang@huawei.com>
Subject: Re: [PATCH v2] drm/vkms: Fix an undefined reference error in
 vkms_composer_worker
Message-ID: <20191009104002.GV16989@phenom.ffwll.local>
Mail-Followup-To: zhong jiang <zhongjiang@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1569201883-18779-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569201883-18779-1-git-send-email-zhongjiang@huawei.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pu7YyA32IAxSpGaf7UJZEaSuEYYlTRI6oCWAxFzbJXY=;
 b=adk4q/LAAbwwFzgWpWMggclWXes1NLlMfwEAu7/GRAECCtq0szTh+ZGk69R3LGBtPs
 n4RyZaacxk/cxSmShZLOjt8g7scuRr2iymwZ00dLTV+rtUYTDLcnulhQ/bmdubzPubQC
 Co+98zwwlg32faR9RwAR/awjgX162VhOr8Dgk=
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDk6MjQ6NDNBTSArMDgwMCwgemhvbmcgamlhbmcgd3Jv
dGU6Cj4gSSBoaXQgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGUgdGhlIGtlcm5lbC4K
PiAKPiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLm86IEluIGZ1bmN0aW9uIGB2
a21zX2NvbXBvc2VyX3dvcmtlcic6Cj4gdmttc19jb21wb3Nlci5jOigudGV4dCsweDVlNCk6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNyYzMyX2xlJwo+IG1ha2U6ICoqKiBbdm1saW51eF0gRXJy
b3IgMQo+IAo+IFNpZ25lZC1vZmYtYnk6IHpob25nIGppYW5nIDx6aG9uZ2ppYW5nQGh1YXdlaS5j
b20+CgpRdWV1ZWQgZm9yIC1uZXh0LCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIv
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiBpbmRleCBlNjdjMTk0Li4yODVkNjQ5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcKPiBAQCAtMjU3LDYgKzI1Nyw3IEBAIGNvbmZpZyBEUk1fVktNUwo+ICAJdHJpc3RhdGUg
IlZpcnR1YWwgS01TIChFWFBFUklNRU5UQUwpIgo+ICAJZGVwZW5kcyBvbiBEUk0KPiAgCXNlbGVj
dCBEUk1fS01TX0hFTFBFUgo+ICsJc2VsZWN0IENSQzMyCj4gIAlkZWZhdWx0IG4KPiAgCWhlbHAK
PiAgCSAgVmlydHVhbCBLZXJuZWwgTW9kZS1TZXR0aW5nIChWS01TKSBpcyB1c2VkIGZvciB0ZXN0
aW5nIG9yIGZvcgo+IC0tIAo+IDIuNy40Cj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
