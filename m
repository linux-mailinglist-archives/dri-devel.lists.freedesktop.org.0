Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9BDEE550
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7B16E61F;
	Mon,  4 Nov 2019 16:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4666E621
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:57:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c22so16849669wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 08:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=VAliMdV9Fdczuha2bJKMxJDT7qOFHHNH6gNdM44i0qU=;
 b=eF2hHJdD6TcIucjQiteTMgC7Y50RpLNEwakAV1frh7vMR5EUVv0sXwnTdmVGcYRiEg
 D4XORMYVYjvvcALmq59gRablNIT/HEzB+Xi76K5GVuCbku9nTZvgncDF8AON2M9Inrkv
 8dq21zquQa4Z58t/mnZh7He8PBuPSnCpSv9upfiM8bDSHkgS2HvIpOS7G5e9mKJT2GdT
 QhceKk8WPynkILHGSL3ofVx82Io2UQWkgh9dSm7Ko3ISZGnmUcM3+D+J9gXePidx5jkG
 zTheBVeMNFQM9ow0j4d/1EJ4j636pjDn0jmPN4b/x+a0eG7E8Igbn5sicRVq3D3bnT7b
 2GyA==
X-Gm-Message-State: APjAAAWSAkc8WvSMQc8SzLOm7OLfdAW5dXeSRgEvL5uyG7Z3odzfkTVO
 r+G8dLq0ltgBSktjewN8viMFCw==
X-Google-Smtp-Source: APXvYqwZZ+E3+UHHjykHpaF1nJBgvLZ2qvjZaEiwV8sNGWUeuZPsY92TMiCBl0oYY4BiKCy+FBjLPA==
X-Received: by 2002:a1c:2e94:: with SMTP id u142mr52433wmu.69.1572886667346;
 Mon, 04 Nov 2019 08:57:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a16sm25010019wmd.11.2019.11.04.08.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 08:57:46 -0800 (PST)
Date: Mon, 4 Nov 2019 17:57:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/todo: Add entry to remove
 load/unload hooks
Message-ID: <20191104165744.GI10326@phenom.ffwll.local>
References: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
 <20191023144953.28190-2-daniel.vetter@ffwll.ch>
 <20191024103552.GB2825247@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024103552.GB2825247@ulmo>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VAliMdV9Fdczuha2bJKMxJDT7qOFHHNH6gNdM44i0qU=;
 b=begU7rKeWpJi7rnoMrQyyW0fy4sHpwYdvdelZfEEqIML/6nH64WZpOhPQJOELBLjA7
 Y63TWA/2e9R/YabePnObrg29MN0kD3WBpQHuJ7cLW4YgsraVSgEXbHqEffqLLUYc87lF
 ajjBRKbc9+o94CgPwxkasmPcXVBNezHmnjWg4=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMTI6MzU6NTJQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDQ6NDk6NTNQTSArMDIwMCwgRGFuaWVs
IFZldHRlciB3cm90ZToKPiA+IFRoZXkncmUgbWlkbGF5ZXIsIGJyb2tlbiwgYW5kIGJlY2F1c2Ug
b2YgdGhlIG9sZCBndW5rLCB3ZSBjYW4ndCBmaXgKPiA+IHRoZW0uIEZvciBleGFtcGxlcyBzZWUg
dGhlIHZhcmlvdXMgY2hlY2tzIGluIGRybV9tb2RlX29iamVjdC5jIGFnYWluc3QKPiA+IGRldi0+
cmVnaXN0ZXJlZCwgd2hpY2ggY2Fubm90IGJlIGVuZm9yY2VkIGlmIHRoZSBkcml2ZXIgc3RpbGwg
dXNlcyB0aGUKPiA+IGxvYWQgaG9vay4KPiA+IAo+ID4gVW5mb3J0dW5hdGVseSBvdXIgYmlnZ2Vz
dCBkcml2ZXIgc3RpbGwgdXNlcyBsb2FkL3VubG9hZCwgc28gdGhpcyB3b3VsZAo+ID4gYmUgcmVh
bGx5IGdyZWF0IHRvIGdldCBmaXhlZC4KPiA+IAo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxh
bmRAYW1kLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAx
NyArKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
Cj4gCj4gUmVtaW5kcyBtZSB0aGF0IEkgbmVlZCB0byBzdGlsbCBkbyB0aGF0IGZvciBUZWdyYToK
PiAKPiBSZXZpZXdlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkJv
dGggcGF0Y2hlcyBhcHBsaWVkLCB0aGFua3MgZm9yIHRha2luZyBhIGxvb2suCi1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
