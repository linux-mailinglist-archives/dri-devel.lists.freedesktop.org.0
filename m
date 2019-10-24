Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D60FE326D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D986E395;
	Thu, 24 Oct 2019 12:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C56E395
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:33:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so2430372wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=64NWdNYED8JvJnZtRu09mjJYWyYeFaO3knTq7FiPHuM=;
 b=MZBISZn72BgbY55y8M41UKuhHTY3OiOZHMqbMxnBjn96f+RfvW2Ra/vkrtmekp2Gt7
 8k05sSGBKS1AvZaQKPpB5ViBKV4v9PHMOq87IoFOYRzAhXSMls+vxd61nfX/neKiS/jN
 NYIzd3Svb+tUtwvnnVaCTQiRWQLkQ6jasJu8npTU/b4u1Alrj9wcGcAJFqKaec22kHvE
 ZR4M1ISKmcU3kTIqT/C6LenFVQ/ZP+ComgzNf5AaF30APlml+SipstjFi1TP5r7oyLBt
 W9FMFxJTUMf2mrn7Mz2aF8SPXkjYaTW+OL6syhGjjLm4p0TogQym6azxYmN9gNIsoH7S
 /QIQ==
X-Gm-Message-State: APjAAAXmUn8qjkDvLTYWJbRcfu8ITSssamUnyeYX/YD8/Y8QIEj7k3VS
 YID9+g/SxjlRvOECRyEqIoPghw==
X-Google-Smtp-Source: APXvYqxBsL5SdHoZ8NdyDHI6csoWmz2Ze/6zsvMJFXYsqZblExi2/FTit/N97qcLw9VxezLuOEBi9Q==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr4460488wmc.23.1571920386365; 
 Thu, 24 Oct 2019 05:33:06 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a13sm26833519wrf.73.2019.10.24.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 05:33:05 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:33:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bhanusree <bhanusreemahesh@gmail.com>
Subject: Re: [PATCH v2] drm/gpu: Add comment for memory barrier
Message-ID: <20191024123303.GF11828@phenom.ffwll.local>
References: <1571891313-14341-1-git-send-email-bhanusreemahesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571891313-14341-1-git-send-email-bhanusreemahesh@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=64NWdNYED8JvJnZtRu09mjJYWyYeFaO3knTq7FiPHuM=;
 b=IbqPRjIul+AHjLvNZnhp1Vw37aqgSrwgz/fxWI5nYDoM7DYw0YOUlGVNMA/xOzaYu+
 37UXPQOik9RTRaycy7AJhrANuDBuNZ/RnSTiuMmOaWDHVZKsByfKqo4hhPJxgUatOtsl
 Hu3/BCwlo4xv7o0ku2LvyDCbfoSeWqlmmkvN4=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDk6NTg6MzNBTSArMDUzMCwgQmhhbnVzcmVlIHdyb3Rl
Ogo+IC1BZGQgY29tbWVudCBmb3IgbWVtb3J5IGJhcnJpZXIKPiAtSXNzdWUgZm91bmQgdXNpbmcg
Y2hlY2twYXRjaC5wbAo+IAo+IFNpZ25lZC1vZmYtYnk6IEJoYW51c3JlZSA8YmhhbnVzcmVlbWFo
ZXNoQGdtYWlsLmNvbT4KPiAtLS0KPiAKPiB2Mjptb2RpZmllZCBtZW1vcnkgYmFycmllciBjb21t
ZW50cyBhcHByb3ByaWF0ZWx5CgpBcHBsaWVkLCB0aGFua3MuCi1EYW5pZWwKCj4gCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fY2FjaGUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKPiBpbmRleCAzYmQ3
NmU5Li5lNTc0MjYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwo+IEBAIC02MiwxMCArNjIsMTAgQEAg
c3RhdGljIHZvaWQgZHJtX2NhY2hlX2ZsdXNoX2NsZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2VzW10s
Cj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgaTsKPiAgCj4gLQltYigpOwo+ICsJbWIoKTsgLypGdWxs
IG1lbW9yeSBiYXJyaWVyIHVzZWQgYmVmb3JlIHNvIHRoYXQgQ0xGTFVTSCBpcyBvcmRlcmVkKi8K
PiAgCWZvciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykKPiAgCQlkcm1fY2xmbHVzaF9wYWdl
KCpwYWdlcysrKTsKPiAtCW1iKCk7Cj4gKwltYigpOyAvKkFsc28gdXNlZCBhZnRlciBDTEZMVVNI
IHNvIHRoYXQgYWxsIGNhY2hlIGlzIGZsdXNoZWQqLwo+ICB9Cj4gICNlbmRpZgo+ICAKPiAtLSAK
PiAyLjcuNAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
