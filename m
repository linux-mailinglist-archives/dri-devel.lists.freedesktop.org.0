Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51BF709B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4B36E86E;
	Mon, 11 Nov 2019 09:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAB76E86E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i10so13759055wrs.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QGA/xqmQWev+0NFe4O1TN1YKQ6mW88MJOuhnNp+1ZuI=;
 b=LgRPzUhxGTiw32h1vGRCu+viy9pF+R3f8GaUBPvjq6Xj9S1ykkLcpCGx0rve25Zt1P
 yPEFvz41JRvcnzoecynya5s6hqLk50zjt9k3tGkg3XDcrpxs6qv3Ci454SzKtQeHdm0f
 OgrQCae/8uKqz1288/OmKK/5HJDR3xcCvB9hUh/tlOa4fLYqjJljp/8sNkhbyk6uNAnG
 vcN4rtmKvi7AO2Td/hjJfnPPhWWCWpJZEqm5DdrqLekOvSWPz9/39N+LjQRpuVvrj9mX
 6YtvgxFCStHDeI9s/DT0OXLdbBNCDSsxutylKukNfej8mtV+gzM9fkKUXPCWkDke5MZF
 6YnQ==
X-Gm-Message-State: APjAAAUgpqYe+0bZrYPuc9Z9qaTszKK+3/d1ItHx9SZMR/ljykWAA2Ad
 zyb6T/FfhNXW2m/gVKFwdeOJVC42bec=
X-Google-Smtp-Source: APXvYqx6jDtFgEhErFSeyKkbV8ZV9CUx1Pyx244vdqrZIIvJ1ES7y4XaSdZ6WWpMzxcI9s4XD6bHhA==
X-Received: by 2002:adf:ef0e:: with SMTP id e14mr4205640wro.204.1573464344370; 
 Mon, 11 Nov 2019 01:25:44 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id x6sm13916940wrw.34.2019.11.11.01.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:43 -0800 (PST)
Date: Mon, 11 Nov 2019 09:25:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 7/8] backlight: qcom-wled: add support for short
 circuit handling.
Message-ID: <20191111092536.GU18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-8-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-8-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=QGA/xqmQWev+0NFe4O1TN1YKQ6mW88MJOuhnNp+1ZuI=;
 b=Dfb6+7G14s79tYoH7BzweIeHFTtFG/h2mFENKgZ0C0904ffsK6FkL59yC85qrY1nR5
 q+uIXQu2za9et+lvd+dfO/dSzilQY7Iit+HH4PRs+fPNg5lruFzEJ1m2cjQHE1gvtLV3
 HigANxoBR/CSRpKK2yMZfdhcM2YUBY11kovpoubO7X5Cu5uVVkGWuWzlQjiii04p+91T
 NbfSb1MFU8zaLi1WFs5y9QM4YIoT7bbAPhzLzmez+UNK1vAbSgIgILevTFRAggx9goFM
 qwon6dX5/ysVYJmJZUP0943hXU4mNrBYplzITJSJRO2e/RvC+5X8WVXsidjpxUXLFR2t
 adbw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IEhhbmRsZSB0aGUgc2hv
cnQgY2lyY3VpdCBpbnRlcnJ1cHQgYW5kIGNoZWNrIGlmIHRoZSBzaG9ydCBjaXJjdWl0Cj4gaW50
ZXJydXB0IGlzIHZhbGlkLiBSZS1lbmFibGUgdGhlIG1vZHVsZSB0byBjaGVjayBpZiBpdCBnb2Vz
Cj4gYXdheS4gRGlzYWJsZSB0aGUgbW9kdWxlIGFsdG9nZXRoZXIgaWYgdGhlIHNob3J0IGNpcmN1
aXQgZXZlbnQKPiBwZXJzaXN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1
bmRhQGNvZGVhdXJvcmEub3JnPgo+IFJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3Ju
LmFuZGVyc3NvbkBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRh
bmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9xY29tLXdsZWQuYyB8IDE0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBw
bGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
