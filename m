Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D522248
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 10:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496EE89850;
	Sat, 18 May 2019 08:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5696289850
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 08:42:31 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h13so6948159lfc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 01:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MB+am46zdrQ7/8By7GZdXoN/QVRGNRe/Mkw8jGEPF3g=;
 b=o5Cz/Pp70ztvxlDTwkQIeHuidM0mfoQxzMDnysRsMK1nWiYvF1cd4H+FycwVQ+v8wK
 6htByfmhd2gP6MiG0NyosZYmzTavvcVOV+UySh9MjHbRjRJ7mxrnDAcCmQVzzzCXdebr
 89RG/JcasKySdrTeTur7R1rtFDlW44kl+hEMqSeuy0v3xVPzcmtrUA2fm2NffhS9fxZe
 OClzDEoVhl4cE1zn3QOaS91hfG8ksuOe54dFiqkeOC5uw8N59Lk24vqTmDUFCvPjNJdL
 mCY+PIl5OMIHRtdA6fKbMiAmjmOuWnd5VqNwhbf8K79jewt9wNVCtEiu+mVRoAZbe6xs
 3jOg==
X-Gm-Message-State: APjAAAUzvSHjQXMRDL3ClfFs4YuiXl07ybVryGKp7go1vyM+7a9Q8U5k
 b8vlc7dairwg2fejvL/+yjnYiQ==
X-Google-Smtp-Source: APXvYqyAUNwCfxMxjD9aODqmbrWMY8YATK25Yvddy6GpZFjK4p+l+3r/sZKd8A9gpxU3B/IQIqhQDA==
X-Received: by 2002:a19:e34c:: with SMTP id c12mr8691523lfk.145.1558168949709; 
 Sat, 18 May 2019 01:42:29 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.86.130])
 by smtp.gmail.com with ESMTPSA id z6sm2205931ljh.61.2019.05.18.01.42.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 01:42:29 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: writeback: include interface header
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a61ab53c-4e05-991c-f74f-802bd6222d8a@cogentembedded.com>
Date: Sat, 18 May 2019 11:42:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MB+am46zdrQ7/8By7GZdXoN/QVRGNRe/Mkw8jGEPF3g=;
 b=waXbbgrfqxraHh9Df3iHVcwsQFar+ZalY+dY2SXbBvPF8SudNcrTRizlwedQCPBadz
 oRQTvD1gFAIfKaeSaRzIXu74cJk31iFPIQ+tJUFUIBO25QLEEENYoCAW9aBdjPshnTsM
 qS/56tdXwf0UqZaGZ4M7ylSBHkwUQ58wByLMEnrICDKUA1ss+4xkhIvtFeHXUBWllYsr
 +lUDsDXexV+CyYTgejJAjxGsXD+2Bt6j4excRQxMjawHc/mGIczXkDLHeAl8ktGKGo0t
 /JU2yVfagMBoK1uZLdDKq+3e2s0QLyu/QvVud0kg5YXXdrue6aq8EKf7WphQvYVVzcpe
 RFYQ==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpPbiAxOC4wNS4yMDE5IDA6MjAsIEtpZXJhbiBCaW5naGFtIHdyb3RlOgoKPiBUaGUg
bmV3IHdyaXRlYmFjayBmZWF0dXJlIGlzIGV4cG9ydHMgZnVuY3Rpb25zIHNvIHRoYXQgdGhleSBj
YW4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXiBub3QgbmVlZGVkPwoKPiBpbnRlZ3Jh
dGUgaW50byB0aGUgcmNhcl9kdV9rbXMgbW9kdWxlLgo+IAo+IFRoZSBpbnRlcmZhY2UgZnVuY3Rp
b25zIGFyZSBkZWZpbmVkIGluIHRoZSByY2FyX2R1X3dyaXRlYmFjayBoZWFkZXIsIGJ1dAo+IGl0
IGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgb2JqZWN0IGZpbGUgaXRzZWxmIGxlYWRpbmcgdG8gY29t
cGlsZXIKPiB3YXJuaW5ncyBmb3IgbWlzc2luZyBwcm90b3R5cGVzLgo+IAo+IEluY2x1ZGUgdGhl
IGhlYWRlciBhcyBhcHByb3ByaWF0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4gQmluZ2hh
bSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgpbLi4uXQoKTUJSLCBT
ZXJnZWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
