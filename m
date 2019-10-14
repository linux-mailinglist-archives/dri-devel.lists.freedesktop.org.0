Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5817D5B6A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 08:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2A989F61;
	Mon, 14 Oct 2019 06:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2289F61
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 06:35:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r5so18150781wrm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 23:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GvpQINBRtnsk3Hgc3bizCMfarTOiEUB/HuuJj/ggrWU=;
 b=LXjtXvLdKJk9cWHs5EnzzrNfK4UnlR8F1EgtPp7k6M/A0qXPklijcKD/zYIg5hp8Tm
 7sRwo9FmTl0vHLjONVUNtGb1oU3oBzPkx3+xwzgQJAV5cdfQFkmPp7iNC0mRbJil87Kq
 26MiMFq7/12CRfcGMmHI58CklIlEx4jxyQr+kVsvdtVqbG7MBTy1ZwbzPzxgqOrIdlZB
 jHV8E3x8mtrV1CLyanBr3ufukLzPEbWYKLHP+qfDE57HAAoiWAtpJZ4y3EC4JH46YGvh
 C6/6K1y2gG1dbnGjLA2q3LHvg3xCW+PI0W+BT/P3ZqbEeRTvO3elk0pUQ40EhsSJPlJ+
 s5uw==
X-Gm-Message-State: APjAAAV3uI8blb+DSYz7Ap4quBh/G7IwV711bDU+RHJhz3aRIyJ042As
 zzO4/PRVgFjtwW7TRTUi8v2Yyw==
X-Google-Smtp-Source: APXvYqy3wWPhvikBho5fzy4fPTMUVp7W/hmEmfUL8Jw/xKFwppmve6yfrbW+zi5LpCX9adYitQJ4Dw==
X-Received: by 2002:adf:f452:: with SMTP id f18mr23583380wrp.187.1571034953291; 
 Sun, 13 Oct 2019 23:35:53 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id c17sm20111997wrc.60.2019.10.13.23.35.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 13 Oct 2019 23:35:52 -0700 (PDT)
Date: Mon, 14 Oct 2019 07:35:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V6 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings
Message-ID: <20191014063553.GA4545@dell>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
 <20191013121045.GN5653@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013121045.GN5653@amd>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=GvpQINBRtnsk3Hgc3bizCMfarTOiEUB/HuuJj/ggrWU=;
 b=nOs8xNNfP5A0QMSW5zsDOZjJp+utPBfYPsBSPF/uk3DzbcwiGmcKhanUNGdIYx8E0f
 iQf6iYwosenEaOPuJzeEjdXEzrrZunh/iHI6GdzKCsHq8JcHnaedcnGjzCA6LSL/cRvq
 /F6MXsVF/1XmTNW3fl9RcI/UNjjsNDj46gv1xnFatsz/KBaQJqp5MIhZdJoiD9og9alw
 +808tRm0w5rl9Aram+vg9HWqdjiMgXnYQ3fBI4j4Rvqkgrp4lMxdhG7MZuV6xxmAdarX
 spNze2nlC4WFSJsUxNvi643yqZD7QFR0MMDxCe3yGcj0reqjUMvf86oHXllHgRH031gk
 Orbg==
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
 daniel.thompson@linaro.org, Kiran Gunda <kgunda@codeaurora.org>,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMyBPY3QgMjAxOSwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBPbiBNb24gMjAxOS0w
OS0zMCAxMjowOTowNywgS2lyYW4gR3VuZGEgd3JvdGU6Cj4gPiBSZXN0cnVjdHVyZSB0aGUgcWNv
bS13bGVkIGJpbmRpbmdzIGZvciB0aGUgYmV0dGVyIHJlYWRhYmlsaXR5Lgo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNvZGVhdXJvcmEub3JnPgo+ID4gUmV2aWV3
ZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4gPiBS
ZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4gQWNrZWQtYnk6
IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pgo+IAo+IEkgYXBwbGllZCAxLDIgdG8gbXkgYnJh
bmNoLCBpdCBzaG91bGQgYXBwZWFyIGluIC1uZXh0IHNob3J0bHkuCgpEb2Vzbid0IHBhdGNoIDEg
aGF2ZSBvdXRzdGFuZGluZyByZXZpZXcgY29tbWVudHMgb24gaXQgZnJvbSBEYW4/CgpJZiB5b3Un
cmUgZ29pbmcgdG8gYXBwbHkgdGhlbSwgeW91IG5lZWQgdG8gc2VuZCBvdXQgYW4gaW1tdXRhYmxl
CmJyYW5jaCBmb3IgbWUgdG8gcHVsbCBmcm9tLgoKPiB5YW1sIGNvbnZlcnNpb24gY2FuIGJlIGRv
bmUgaW4gYSBmb2xsb3d1cC4uLgo+IAo+IEJlc3QgcmVnYXJkcywKCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
