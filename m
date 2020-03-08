Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85617DA66
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1717E89F31;
	Mon,  9 Mar 2020 08:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F20C89FE3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 19:25:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j17so1337225lfe.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JxZYFn4zeJMpwkX6vuh6I8IQU6SvLZUc8s3XS8zSKTE=;
 b=U72MCeQCix41eb3o4rWSARF6wTqWl1S639veM4bjWY7kuPO7vldX0Qdhu35y4PWhju
 5X0vkP0tbgXTpHkFgYsfkumKAQLNAEJ/mdLJHsD0/FIInxSWYrZFYHHA1bFsOHjfKe8J
 ze8lWJILtx9zmcpLxtKzPVJPWyx52Gc2jXlIOYzZyqlSk/f1JfTP4/9cHMLQ06xP0Cw/
 qWmzN/ebKthDbQxQIPAj5A8tCj0MAPe+W6oLWgkMx0bzFaTA0IUzebJmHtISiXIlcOWd
 Pm1m1ePAEf/fbO8qljMlx/sfX9OV5DX4IBv+m/QbksoFPzG0Rd0kz/WSsJM/G9mY0n0W
 Kn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JxZYFn4zeJMpwkX6vuh6I8IQU6SvLZUc8s3XS8zSKTE=;
 b=ZcTk6BJmfJhSh7pkmrlImI1MICHcAxhyc8aiOFgERQ/JZZYGK92SP6+/ys2tuvE1xq
 ioBRnQZ9tMK0Do5K3pv9jdnW6y6IAHsG1zqKvwgT3jcKz3jXckiVatVqGcwzsZd3WVxy
 T8QVWTNqYbynVYzgumyrdwIdFEx1vU9f1jXxHg4zoOOA2N/PzY+jbZ2z4tlAOhBuDiCR
 273tRsnZa8dguZGghbk7q3rI2H/TpgxddfOODRYxW1rAVHNzmj3/xg2HlhR4GxfiW5V1
 mw9E8bQ+1ofOxHgO5LfIHnFtvPYo+yB1RqjAnpzHxRju3Z0bJj/ZjH2CMOv8G1zaTXDE
 Y/5w==
X-Gm-Message-State: ANhLgQ3zSzllPyPiQHtM8IeRjJyMk4IXpIsJAZW8ZSlbKE4TJFKcYOlN
 w6Ru2WMbe8avHyCcrS0zLDw=
X-Google-Smtp-Source: ADFU+vv6EXBzesa1UohyZfW57/Zw7JVhLpGkJ6whXSKyCZiygwRlWd8TmnbSR4Kzrlv/OWKXDs+a1Q==
X-Received: by 2002:ac2:52b1:: with SMTP id r17mr7528524lfm.205.1583695532480; 
 Sun, 08 Mar 2020 12:25:32 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.googlemail.com with ESMTPSA id j12sm2543932lfp.23.2020.03.08.12.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2020 12:25:31 -0700 (PDT)
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To: Derek Basehore <dbasehore@chromium.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200306002112.255361-1-dbasehore@chromium.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
Date: Sun, 8 Mar 2020 22:25:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306002112.255361-1-dbasehore@chromium.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDYuMDMuMjAyMCAwMzoyMSwgRGVyZWsgQmFzZWhvcmUg0L/QuNGI0LXRgjoKPiBUaGlzIGFkZHMg
dGhlIHBsdW1iaW5nIGZvciByZWFkaW5nIHBhbmVsIHJvdGF0aW9uIGZyb20gdGhlIGRldmljZXRy
ZWUKPiBhbmQgc2V0cyB1cCBhZGRpbmcgYSBwYW5lbCBwcm9wZXJ0eSBmb3IgdGhlIHBhbmVsIG9y
aWVudGF0aW9uIG9uCj4gTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJlc2VudC4K
CkhlbGxvIERlcmVrIGFuZCBldmVyeW9uZSwKCkknbSBsb29raW5nIGF0IGFkZGluZyBkaXNwbGF5
IHJvdGF0aW9uIHN1cHBvcnQgdG8gTlZJRElBIFRlZ3JhIERSTQpkcml2ZXIgYmVjYXVzZSBzb21l
IGRldmljZXMgaGF2ZSBkaXNwbGF5IHBhbmVsIHBoeXNpY2FsbHkgbW91bnRlZAp1cHNpZGUtZG93
biwgYW5kIHRodXMsIGRpc3BsYXkgY29udHJvbGxlcidzIHNjYW4tb3V0IG5lZWRzIHRvIGJlIHJv
dGF0ZWQKYnkgMTgwwrAgaW4gdGhpcyBjYXNlLgoKRGVyZWssIHlvdXJzIHBhbmVsLXJvdGF0aW9u
IHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIGFzc2lnbmluZyBwYW5lbCdzCm9yaWVudGF0aW9uIHRv
IHRoZSBjb25uZWN0b3IsIGJ1dCB0aGVuIG9ubHkgcHJpbWFyeSBkaXNwbGF5IHBsYW5lCnJlY2Vp
dmVzIHJvdGF0aW9uIHZhbHVlIGluIFsxXSwgd2hpbGUgcm90YXRpb24gbmVlZHMgdG8gYmUgYXBw
bGllZCB0bwphbGwgYXZhaWxhYmxlIG92ZXJsYXkvY3Vyc29yIHBsYW5lcyBhbmQgdGhpcyBzaG91
bGQgaGFwcGVuIGluIG90aGVyCnBsYWNlcyB0aGFuIFsxXSBhcyB3ZWxsLgoKWzFdIGRybV9jbGll
bnRfbW9kZXNldF9jb21taXRfYXRvbWljKCkKClBsZWFzZSBhbHNvIG5vdGUgdGhhdCBpbiBhIGNh
c2Ugb2YgdGhlIHNjYW4tb3V0IHJvdGF0aW9uLCBwbGFuZSdzCmNvb3JkaW5hdGVzIG5lZWQgdG8g
YmUgY2hhbmdlZCBpbiBhY2NvcmRhbmNlIHRvIHRoZSBkaXNwbGF5J3Mgcm90YXRpb24uCgpJIGxv
b2tlZCBicmllZmx5IHRocm91Z2ggdGhlIERSTSBjb2RlIGFuZCBteSB1bmRlcnN0YW5kaW5nIHRo
YXQgdGhlIERSTQpjb3JlIGN1cnJlbnRseSBkb2Vzbid0IHN1cHBvcnQgdXNlLWNhc2Ugd2hlcmUg
c2Nhbi1vdXQgbmVlZHMgdG8gcm90YXRlZApiYXNlZCBvbiBhIHBhbmVsJ3Mgb3JpZW50YXRpb24s
IGNvcnJlY3Q/IElzIGl0IHRoZSB1c2UtY2FzZSB5b3UncmUKd29ya2luZyBvbiBmb3IgdGhlIE1l
ZGlhdGVrIGRyaXZlcj8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
