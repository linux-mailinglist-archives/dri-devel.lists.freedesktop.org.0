Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34311AD6A8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42DA6E3A0;
	Fri, 17 Apr 2020 07:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1E6EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 21:15:37 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h25so9402648lja.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSBs/T90dOJCpky6qdYZXn6KBXVKIT11SUHs83vt+Vo=;
 b=onXnSEjMI9WjFRYvFbt3eT/2a0jSap3HpX0s3nmxW7DMwa6jnOXHccjzGBA2c8Q+uU
 Fa1xiLUiSHJVDZKQ0+PPmiiHkJMysyGYeWEtkPDh1k5CQzM6jvK/GxhmnkxjlJWb44JY
 lT1fePiuw1hLLR/O49CloRWyU7wogGM9XT5ilDARM177CHi8aTUfQKpqQt51bNILcV+N
 GpBjMtnYJc67sShFjkUSkz8f64KEaMt9K1/hfYtcWepOy8Df+DUiNxVUSJLK4zr/SmTv
 WG9IyBsodWK43tl8te8yAZ1Nrmf+LNdXIOyEJkLUYWEcJOEyX8QpBoGMDLTT5usT4R0M
 dj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSBs/T90dOJCpky6qdYZXn6KBXVKIT11SUHs83vt+Vo=;
 b=qoafqkCE6eDaOQaNmtViqJo/kdK/5vkjjgiU+QHsqeAur5ihXBLfyUoBUXE2ScUcI3
 XEdNJWawcPHfFYh6bEKMSFhzhLjBTxkXh+wmQYVmofUmyLdNxzt3EH9aD680c/OsNBDk
 jYtSONfPrH8QMwc/5Mi2OebdIKYY99l6Z4nyGdrVmQsVhoXPoOoRqihphZ5pW8PxB8lL
 tIuodGJmqvb7zg7Vgfm+PalWFIoOxNnw8hPFq5so1YGicKQxTeFY0FeoFUznUoiOSkVl
 lFGce9hA5YLx9jNeqGeS4HU/mnwzeUuTWRp3zG7gzHdyUssYpSpRdWl99rYxHgoZ73KM
 IPBg==
X-Gm-Message-State: AGi0Pub1TQDuZBowHl/B5K4fEsiO+iCboG+6VJ9ASyNcgZGfXyPb2UE8
 6l9rE0bAhCDqPPlTZ1K3Np5FU/NP
X-Google-Smtp-Source: APiQypJ39BDu0skpY5uo+qDKfkzWqqaEPWpqB+fHJ6Ay3NgDNLeoyTltY8ziyuE3r5E+NvHOH1YGOA==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr43329ljj.145.1587071735735;
 Thu, 16 Apr 2020 14:15:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id k18sm20331341lfg.81.2020.04.16.14.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 14:15:34 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
 <20200416205012.GA28162@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fbafa641-f2ed-22b5-eaeb-bd2726b53d0a@gmail.com>
Date: Fri, 17 Apr 2020 00:15:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416205012.GA28162@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDQuMjAyMCAyMzo1MCwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBPbiBUaHUsIEFwciAxNiwgMjAyMCBhdCAxMToyMTo0MFBNICswMzAwLCBEbWl0cnkg
T3NpcGVua28gd3JvdGU6Cj4+IDE2LjA0LjIwMjAgMjE6NTIsIERtaXRyeSBPc2lwZW5rbyDQv9C4
0YjQtdGCOgo+PiAuLi4KPj4+PiBNYXkgSSBhbHNvIHJlY29tbWVuZCBzd2l0Y2hpbmcgdG8gdGhl
IERSTSBwYW5lbCBicmlkZ2UgaGVscGVyID8gSXQgd2lsbAo+Pj4+IHNpbXBsaWZ5IHRoZSBjb2Rl
Lgo+Pj4KPj4+IENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3aGF0IGlzIHRoZSAiRFJNIHBhbmVs
IGJyaWRnZSBoZWxwZXIiPwo+Pj4KPj4+IEkgdGhpbmsgd2Ugd29uJ3QgbmVlZCBhbnkgYWRkaXRp
b25hbCBoZWxwZXJzIGFmdGVyIHN3aXRjaGluZyB0byB0aGUKPj4+IGJyaWRnZSBjb25uZWN0b3Ig
aGVscGVyLCBubz8KPj4KPj4gQWN0dWFsbHksIEkgbm93IHNlZSB0aGF0IHRoZSBwYW5lbCBuZWVk
cyB0byBiZSBtYW51YWxseSBhdHRhY2hlZCB0byB0aGUKPj4gY29ubmVjdG9yLgo+IAo+IFRoZSBE
Uk0gcGFuZWwgYnJpZGdlIGhlbHBlciBjcmVhdGVzIGEgYnJpZGdlIGZyb20gYSBwYW5lbCAod2l0
aAo+IGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQoKSkuIFlvdSBjYW4gdGhlbiBhdHRhY2ggdGhh
dCBicmlkZ2UgdG8gdGhlCj4gY2hhaW4sIGxpa2UgYW55IG90aGVyIGJyaWRnZSwgYW5kIHRoZSBl
bmFibGUvZGlzYWJsZSBvcGVyYXRpb25zIHdpbGwgYmUKPiBjYWxsZWQgYXV0b21hdGljYWxseSB3
aXRob3V0IGFueSBuZWVkIHRvIGNhbGwgdGhlIHBhbmVsIGVuYWJsZS9kaXNhYmxlCj4gbWFudWFs
bHkgYXMgZG9uZSBjdXJyZW50bHkuCj4gCj4+IFN0aWxsIGl0J3Mgbm90IGFwcGFyZW50IHRvIG1l
IGhvdyB0byBnZXQgcGFuZWwgb3V0IG9mIHRoZSBicmlkZ2UuIEl0Cj4+IGxvb2tzIGxpa2UgdGhl
cmUgaXMgbm8gc3VjaCAicGFuZWwgaGVscGVyIiBmb3IgdGhlIGJyaWRnZSBBUEkgb3IgSSBqdXN0
Cj4+IGNhbid0IGZpbmQgaXQuCj4gCj4gWW91IGRvbid0IG5lZWQgdG8gZ2V0IGEgcGFuZWwgb3V0
IG9mIHRoZSBicmlkZ2UuIFlvdSBzaG91bGQgZ2V0IHRoZQo+IGJyaWRnZSBhcyBkb25lIHRvZGF5
LAoKWW91IG1lYW4gImdldCB0aGUgcGFuZWwiLCBjb3JyZWN0PwoKPiBhbmQgd3JhcCBpdCBpbiBh
IGJyaWRnZSB3aXRoCj4gZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZCgpLgo+IAoKVGhlIGx2ZHMt
Y29kZWMgYWxyZWFkeSB3cmFwcyBwYW5lbCBpbnRvIHRoZSBicmlkZ2UgdXNpbmcKZGV2bV9kcm1f
cGFuZWxfYnJpZGdlX2FkZCgpIGFuZCBjaGFpbnMgaXQgZm9yIHVzLCBwbGVhc2Ugc2VlCmx2ZHNf
Y29kZWNfcHJvYmUoKSAvIGx2ZHNfY29kZWNfYXR0YWNoKCkuCgpEb2VzIGl0IG1lYW4gdGhhdCBs
dmRzLWNvZGVjIGlzIG5vdCBzdXBwb3J0aW5nIHRoZSBuZXcgbW9kZWw/CgpFdmVyeXRoaW5nIHdv
cmtzIG5pY2VseSB1c2luZyB0aGUgb2xkIG1vZGVsLCB3aGVyZSBicmlkZ2UgY3JlYXRlcwpjb25u
ZWN0b3IgYW5kIGF0dGFjaGVzIHBhbmVsIHRvIGl0IGZvciB1cy4KCltJJ20gc3RpbGwgbm90IHN1
cmUgd2hhdCBpcyB0aGUgcG9pbnQgdG8gdXNlIHRoZSBuZXcgbW9kZWwgaW4gYSBjYXNlIG9mCmEg
c2ltcGxlIGNoYWluIG9mIGJyaWRnZXNdCgpVc2luZyB0aGUgbmV3IG1vZGVsLCB0aGUgY29ubmVj
dG9yIGlzbid0IGNyZWF0ZWQgYnkgdGhlIGJyaWRnZSwgc28gSQpuZWVkIHRvIGR1cGxpY2F0ZSB0
aGF0IGNyZWF0aW9uIGVmZm9ydCBpbiB0aGUgZHJpdmVyLiBPbmNlIHRoZSBicmlkZ2UKY29ubmVj
dG9yIGlzIG1hbnVhbGx5IGNyZWF0ZWQsIEkgbmVlZCB0byBhdHRhY2ggcGFuZWwgdG8gdGhpcyBj
b25uZWN0b3IsCmJ1dCBwYW5lbCBpcyByZWFjaGFibGUgb25seSB2aWEgdGhlIHJlbW90ZSBicmlk
Z2UgKHdoaWNoIHdyYXBzIHRoZSBwYW5lbCkuCgpkcml2ZXIgY29ubmVjdG9yIC0+IExWRFMgYnJp
ZGdlIC0+IHBhbmVsIGJyaWRnZSAtPiBwYW5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
