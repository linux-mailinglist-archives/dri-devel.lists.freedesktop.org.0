Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7D1AD698
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D076E38A;
	Fri, 17 Apr 2020 06:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D06EB60
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:21:44 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id k21so9333763ljh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Toe9EFNHVHf4euVV41c+6ZKdGRmphziwECd1HLN5bj4=;
 b=mp5QjqeXEpzz/RC5864mh4AGvSyk/YJUHBwd8EWL4iUI0WXJUJYYAMWFSnaGjqY8un
 jPNtEMDugufQKUhBS2tU08lsUH5i4vY9DskaTzQGGSkm2Q7zgVfUxiyG13OV86oNJ5oJ
 MneJa5vNL1WtdeQDBn0ZUIsakrJZsNms4JOrcXGjIs36exmCiDc2chUiXBLKvTD+sbix
 yF534TfyCCLwDSFdRBYJrGpesrswqDrO1KOpS3ev7iE966bSLRZBpWCR93HdpMOLVwTH
 BKVnY1WiwYV7htqOa2w/A69S7mNDpCicsLz5oj0LZNKDSKDR6ER4+GH6kzko2zmNuQzD
 ZuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Toe9EFNHVHf4euVV41c+6ZKdGRmphziwECd1HLN5bj4=;
 b=o5d2xcP0PWtY2xpo82eANDzG0uw4wB/VRYKN2cAja9SfjOo60RM0VQSEyU9/kJ8DG2
 vFHyTLNHiRJ4fVyh9fq/HMISYDFBRVQgkNW2RUz/BEmhRe3bpKwtbopXF+Q90oN7YOgg
 P3SZzp3kjVzoQeQqkeDMoeKBjVwCGo6V1AuNs1x2ZW25hbn0ZwsF3o4cVNt67PLmTTn8
 yFRTbRZFEVIU9Zpi4ncWSmFo0ZcLrCW8rneQshGjgcO/IJ7wO3ReMolDb4W9v0C5DM87
 6Npgyvk93m/vdge4iXTzLDPIAOb2ayikruwwc4LLXWO//2UkMOYrW5f+oqjCEfnar9Q1
 I8fQ==
X-Gm-Message-State: AGi0PuaHsasDc4pHiJh2IX7sBEEFDmsN1ifhO8hrPn1yPDeo2wKhkwqM
 G917pOs1HQ2UrN9tkOW7LqI=
X-Google-Smtp-Source: APiQypK9kdZSj1RLjRCfDhqZhxNr3HSkOJSkYEgiA0qwvIDJP5PyK2JI/rWYfPIScCP+cnZWmhS6KQ==
X-Received: by 2002:a2e:8290:: with SMTP id y16mr7587501ljg.186.1587068502429; 
 Thu, 16 Apr 2020 13:21:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id q26sm5684757ljg.47.2020.04.16.13.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 13:21:41 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
From: Dmitry Osipenko <digetx@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
Message-ID: <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
Date: Thu, 16 Apr 2020 23:21:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
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

MTYuMDQuMjAyMCAyMTo1MiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Ci4uLgo+PiBNYXkg
SSBhbHNvIHJlY29tbWVuZCBzd2l0Y2hpbmcgdG8gdGhlIERSTSBwYW5lbCBicmlkZ2UgaGVscGVy
ID8gSXQgd2lsbAo+PiBzaW1wbGlmeSB0aGUgY29kZS4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGNs
YXJpZnkgd2hhdCBpcyB0aGUgIkRSTSBwYW5lbCBicmlkZ2UgaGVscGVyIj8KPiAKPiBJIHRoaW5r
IHdlIHdvbid0IG5lZWQgYW55IGFkZGl0aW9uYWwgaGVscGVycyBhZnRlciBzd2l0Y2hpbmcgdG8g
dGhlCj4gYnJpZGdlIGNvbm5lY3RvciBoZWxwZXIsIG5vPwoKQWN0dWFsbHksIEkgbm93IHNlZSB0
aGF0IHRoZSBwYW5lbCBuZWVkcyB0byBiZSBtYW51YWxseSBhdHRhY2hlZCB0byB0aGUKY29ubmVj
dG9yLgoKU3RpbGwgaXQncyBub3QgYXBwYXJlbnQgdG8gbWUgaG93IHRvIGdldCBwYW5lbCBvdXQg
b2YgdGhlIGJyaWRnZS4gSXQKbG9va3MgbGlrZSB0aGVyZSBpcyBubyBzdWNoICJwYW5lbCBoZWxw
ZXIiIGZvciB0aGUgYnJpZGdlIEFQSSBvciBJIGp1c3QKY2FuJ3QgZmluZCBpdC4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
