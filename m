Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F346B341745
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F94D6E3F0;
	Fri, 19 Mar 2021 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07DC6E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id bf3so9765786edb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=i3ME3RZycqfcfKl/INYO3mj0pc2g5bpS8vxgj1H2Zho=;
 b=P+5LihIKwLgCsx10OfJIAw04qzyiTgtZ+9mVR3WckS2IOAidGoGZL3ddGFqeTyiWrx
 HFNLGJkkIgVaAyVKZXa3FE1/nuP6JHJbyOdedNBMMzQp/iT+6gDLy1aJtYevlvk92o+g
 FOiw14Uq3K23+15kZQxvtt3z0iFriNPPHzkntAqWaThhUj0y5bOV/LkWWvM5vboi3NL6
 nruXC6lGYs+ze7MJBrOuFwiI1j/aNoW14FE/UHwTmaxsYLtiY6iwiT8Nknb+edBW42sw
 /gW2YDfE/zZkyFLp5hFpuBA/KGScPE/fy3K2x45r7r5KCQ161p+ccfRVEUZjHFsRSn6F
 rnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i3ME3RZycqfcfKl/INYO3mj0pc2g5bpS8vxgj1H2Zho=;
 b=QXAevpcEduJnFST6OU6K9x7Faswd1GcMTH3OOBLq5HQcHKG7Pb7MdebGJ95P15Lck+
 WSbIREBdpSbSTvgJZW4RgG3aLeUvM93xzvp3StZANJxWyHjNPyycz6DNnLH4jJLqFxzw
 /sfK+4+u8TEBvZqRPsf7bN6QK4gR+2phZYp1Oy7UPntnY/wdG/W5lywDYDim0xrnU6Fk
 9k7+1pxTFoeweepLGXraFy5q9ZEv1nlfabJjq2WwpJNnJvXR507M6NwhkMlMEhMTe8QD
 izF2/7j7nxsH6C/FdQ/Kb+PNXSrRv9j9EAHUUsup2ScAuMfGRbzZpRLle75+tw3ahnZ2
 yjmQ==
X-Gm-Message-State: AOAM533rYd3ABuxXjxpZjAVdUfgUTEKQErMmc3NPhdvyMjyJfQmsVJIB
 sYPW4PpHPMh/p7ieGaUpFLG5RQ==
X-Google-Smtp-Source: ABdhPJwvsynmGTO200msXpOq0tH3ulqN/PugQIqOCYp1LVOxM4bgeagMgSBC0AYVkGV7Fb9kcROngA==
X-Received: by 2002:a05:6402:17af:: with SMTP id
 j15mr8214688edy.50.1616142250503; 
 Fri, 19 Mar 2021 01:24:10 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id gb4sm3185084ejc.122.2021.03.19.01.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:10 -0700 (PDT)
Date: Fri, 19 Mar 2021 08:24:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <20210319082407.GG2916463@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell> <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell> <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
 <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Jeremy Kolb <jkolb@brandeis.edu>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Leo Li <sunpeng.li@amd.com>, Roland Scheidegger <sroland@vmware.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBNYXIgMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gV2VkLCBNYXIg
MTcsIDIwMjEgYXQgOTozMiBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3Rl
Ogo+ID4KPiA+IE9uIFdlZCwgTWFyIDE3LCAyMDIxIGF0IDk6MTcgQU0gTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgMTEgTWFyIDIwMjEs
IExlZSBKb25lcyB3cm90ZToKPiA+ID4KPiA+ID4gPiBPbiBUaHUsIDExIE1hciAyMDIxLCBEYW5p
ZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBPbiBNb24sIE1hciAwOCwgMjAyMSBh
dCAwOToxOTozMkFNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIEZyaSwg
MDUgTWFyIDIwMjEsIFJvbGFuZCBTY2hlaWRlZ2dlciB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiBUaGUgdm13Z2Z4IG9uZXMgbG9vayBhbGwgZ29vZCB0byBtZSwgc28gZm9yCj4gPiA+
ID4gPiA+ID4gMjMtNTM6IFJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRA
dm13YXJlLmNvbT4KPiA+ID4gPiA+ID4gPiBUaGF0IHNhaWQsIHRoZXkgd2VyZSBhbHJlYWR5IHNp
Z25lZCBvZmYgYnkgWmFjaywgc28gbm90IHN1cmUgd2hhdAo+ID4gPiA+ID4gPiA+IGhhcHBlbmVk
IGhlcmUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgdGhleSB3ZXJlIGFjY2VwdGVkIGF0
IG9uZSBwb2ludCwgdGhlbiBkcm9wcGVkIHdpdGhvdXQgYSByZWFzb24uCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFNpbmNlIEkgcmViYXNlZCBvbnRvIHRoZSBsYXRlc3QgLW5leHQsIEkgaGFkIHRv
IHBsdWNrIHRoZW0gYmFjayBvdXQgb2YKPiA+ID4gPiA+ID4gYSBwcmV2aW91cyBvbmUuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gVGhleSBzaG91bGQgc2hvdyB1cCBpbiBsaW51eC1uZXh0IGFnYWluLiBX
ZSBtZXJnZSBwYXRjaGVzIGZvciBuZXh0IG1lcmdlCj4gPiA+ID4gPiB3aW5kb3cgZXZlbiBkdXJp
bmcgdGhlIGN1cnJlbnQgbWVyZ2Ugd2luZG93LCBidXQgbmVlZCB0byBtYWtlIHN1cmUgdGhleQo+
ID4gPiA+ID4gZG9uJ3QgcG9sbHV0ZSBsaW51eC1uZXh0LiBPY2Nhc2lvbmFsbHkgdGhlIGN1dCBv
ZmYgaXMgd3Jvbmcgc28gcGF0Y2hlcwo+ID4gPiA+ID4gc2hvdyB1cCwgYW5kIHRoZW4gZ2V0IHB1
bGxlZCBhZ2Fpbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBVbmZvcnR1bmF0ZWx5IGVzcGVjaWFsbHkg
dGhlIDUuMTIgbWVyZ2UgY3ljbGUgd2FzIHZlcnkgd29iYmx5IGR1ZSB0byBzb21lCj4gPiA+ID4g
PiBjb25mdXNpb24gaGVyZS4gQnV0IHlvdXIgcGF0Y2hlcyBzaG91bGQgYWxsIGJlIGluIGxpbnV4
LW5leHQgYWdhaW4gKHRoZXkKPiA+ID4gPiA+IGFyZSBxdWV1ZWQgdXAgZm9yIDUuMTMgaW4gZHJt
LW1pc2MtbmV4dCwgSSBjaGVja2VkIHRoYXQpLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvcnJ5IGZv
ciB0aGUgY29uZnVzaW9uIGhlcmUuCj4gPiA+ID4KPiA+ID4gPiBPaCwgSSBzZWUuICBXZWxsIHNv
IGxvbmcgYXMgdGhleSBkb24ndCBnZXQgZHJvcHBlZCwgSSdsbCBiZSBoYXBweS4KPiA+ID4gPgo+
ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uIERhbmllbAo+ID4gPgo+ID4gPiBBZnRl
ciByZWJhc2luZyB0b2RheSwgYWxsIG9mIG15IEdQVSBwYXRjaGVzIGhhdmUgcmVtYWluZWQuICBX
b3VsZAo+ID4gPiBzb21lb25lIGJlIGtpbmQgZW5vdWdoIHRvIGNoZWNrIHRoYXQgZXZlcnl0aGlu
ZyBpcyBzdGlsbCBpbiBvcmRlcgo+ID4gPiBwbGVhc2U/Cj4gPgo+ID4gSXQncyBzdGlsbCBicm9r
ZW4gc29tZWhvdy4gSSd2ZSBraWNlZCBNYXhpbWUgYW5kIE1hYXJ0ZW4gYWdhaW4sCj4gPiB0aGV5
J3JlIGFsc28gb24gdGhpcyB0aHJlYWQuCj4gCj4gWW91J3JlIHBhdGNoZXMgaGF2ZSBtYWRlIGl0
IGludG8gZHJtLW5leHQgbWVhbndoaWxlLCBzbyB0aGV5IHNob3VsZAo+IHNob3cgdXAgaW4gbGlu
dXgtbmV4dCB0aHJvdWdoIHRoYXQgdHJlZSBhdCBsZWFzdC4gRXhjZXB0IGlmIHRoYXQgb25lCj4g
YWxzbyBoYXMgc29tZSB0cm91YmxlLgoKVGhhbmtzIGZvciBsZXR0aW5nIG1lIGtub3cuCgpJIHNl
ZSBzb21lIHBhdGNoZXMgbWFkZSBpdCBiYWNrIGluLCBvdGhlcnMgZGlkbid0LgoKSSdsbCByZXNl
bmQgdGhlIHN0cmFnZ2xlcnMgLSBiZWFyIHdpdGguCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
ClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
