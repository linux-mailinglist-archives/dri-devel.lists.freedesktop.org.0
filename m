Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42221E920
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2D36E934;
	Tue, 14 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F196EC97
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:11:01 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id d125so1132997oob.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=myKrcYnB9ONGWrZiACvGtAE7VPtZF9mIixa8UnGi6lk=;
 b=N1V7lGaZGWwxiYdD9wOB2b2qeBTGFS7LeCUeOyQDGr77E2QdU1l+pzpFOJsZd7MdbH
 5BZLjBKlMuIpW5aXi2HxkFOY0DXugOgAVEeeRcYv2yL5xtXDHZiZ8suu7RS5pHoNAmYq
 X0EnB73RKYgutPIphvQ258SDBj6jxQPjVupknICdnY9TA0ycqtw92/IFT/tPp9CH3HaJ
 9vIgkz7Vfr8kMd09mIW3tqmlktPNU9aI36bFTh9AyHRb/1MRx6H1xRU9XQ4ZQ7/mBdfR
 KE2rWibNWlq6TEir7pyE6lDz0H8nhkgSuuBm6gtk7gxaBX7D8hd5mrfbBSECypCdxk2V
 4NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=myKrcYnB9ONGWrZiACvGtAE7VPtZF9mIixa8UnGi6lk=;
 b=QhsVv+pUea60I+1sXhd90mzbRblYfpLhgZLo+mmWryM5shuix3xVILW4EoO2a78Vb2
 LX2SaQrsNvbLZZbC8XIc+dPvhwnAJrsUWFmFwX3yJ7p2MUoc4eK2ClCN6Kloh1CUmBsF
 UY6y4nX90Mp5EXjvOqRxbkAJqP5UCIs1+wsXZwX8KiWzyi/+FxSIatZA6DQBxYbOnDXT
 ZIyXL8J7tTFEnnJgpNsf8pTPqJ6fE5ZMUVMgM5m2Bw/9vX7Mdr5N7oFBsb6F3CUy7sBk
 IP7FHw5zTVXQrMtdcS0vLRwdT4T3uJXm9TI6OLmJUGUH0nd/An/LQmsc0nqkQ6Yx4mri
 TJug==
X-Gm-Message-State: AOAM530T42yqsldRaMqHBDf9FbOjyvJOKGnze72w0Byd+LV+B4LuYA92
 2z6u0Icnvmu5PSy2XJIMHhyCzw==
X-Google-Smtp-Source: ABdhPJyjAlrVf6Bdz3VCvEYqB3qfK0eEiCjavF7ooSGh3jbEZrY6tG1/lygDevSV4tm2BlzLIZYJMQ==
X-Received: by 2002:a4a:e381:: with SMTP id l1mr57870309oov.55.1594401060152; 
 Fri, 10 Jul 2020 10:11:00 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id j97sm1184834otj.31.2020.07.10.10.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:10:59 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: Doug Anderson <dianders@chromium.org>
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
 <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
 <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
 <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
 <f81f0d22-85d6-66eb-c8d9-345757f53959@kali.org>
 <CAD=FV=WB_4xLe9UZX3eVemybQ1neXJVZgzrDCW-xUxbAM6hCTA@mail.gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <8e306b6d-246d-aa7f-cb24-923e13afcd04@kali.org>
Date: Fri, 10 Jul 2020 12:10:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WB_4xLe9UZX3eVemybQ1neXJVZgzrDCW-xUxbAM6hCTA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMTAvMjAgOTo0NyBBTSwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiBIaSwKPgo+Cj4gQnV0
IHNob3VsZCBJIGNvbnRpbnVlIG9uIHRoaXMgcGF0aCwKPiBJdCdzIHByb2JhYmx5IHdvcnRoIGdl
dHRpbmcgZGl0aGVyaW5nIHdvcmtpbmcgb24geW91ciBzZG04NDUgYW55d2F5IGluCj4gY2FzZSBh
bnlvbmUgYWN0dWFsbHkgZG9lcyBwdXQgYSA2YnBwIHBhbmVsIG9uIHRoaXMgU29DLgo+Cj4KPj4g
b3Igc2hvdWxkIHdlIGJlIGZpbmRpbmcgb3RoZXJzIHdobwo+PiBoYXZlIGFuIE42MSBhbmQgc2Vl
IHdoYXQgdGhlaXIgRURJRCByZXBvcnRzPwo+IEkgaGF2ZSBhbiBlbWFpbCBvdXQgdG8gQk9FLCBi
dXQgaXQgbWlnaHQgdGFrZSBhIGxpdHRsZSB3aGlsZSB0byBnZXQgYQo+IHJlc3BvbnNlLiAgSSds
bCBzZWUgd2hhdCB0aGV5IHNheS4gIElmIHRoZXkgc2F5IHRoYXQgdGhlIHBhbmVsCj4gYWN0dWFs
bHkgc3VwcG9ydHMgOGJwcCB0aGVuIGl0J3MgYSBuby1icmFpbmVyIGFuZCB3ZSBzaG91bGQganVz
dAo+IHN3aXRjaCB0byA4YnBwIGFuZCBiZSBkb25lLgo+Cj4gLi4uYnV0IGlmIHRoZXkgc2F5IGl0
J3MgYSA2YnBwIHBhbmVsIHRoYXQgaGFzIGl0cyBvd24gZGl0aGVyIGxvZ2ljCj4gdGhlbiBpdCBn
ZXRzIG1vcmUgY29tcGxpY2F0ZWQuICBJbml0aWFsbHkgb25lIHdvdWxkIHRoaW5rIHRoZXJlIHNo
b3VsZAo+IGJlIHZlcnkgbGl0dGxlIGRvd25zaWRlIGluIGRlZmluaW5nIHRoZSBwYW5lbCBhcyBh
biA4YnBwIHBhbmVsIGFuZAo+IGNhbGxpbmcgaXQgZG9uZS4gIC4uLmV4Y2VwdCB0aGF0IGl0IGNv
bmZsaWN0cyB3aXRoIHNvbWUgb3RoZXIgd29yawo+IHRoYXQgSSBoYXZlIGluIHByb2dyZXNzLiAg
Oi1QICBTcGVjaWZpY2FsbHkgaWYgeW91IHRyZWF0IHRoZSBwYW5lbCBhcwo+IDZicHAgYW5kIHRo
ZW4gcmVkdWNlIHRoZSBibGFua2luZyBhIHRpbnkgYml0IHlvdSBjYW4gYWN0dWFsbHkgc2F2ZSA3
NQo+IG1XIG9mIHRvdGFsIHN5c3RlbSBwb3dlciBvbiBteSBib2FyZCAocHJvYmFibHkgc2ltaWxh
ciBvbiB5b3VyIGJvYXJkCj4gc2luY2UgeW91IGhhdmUgdGhlIHNhbWUgYnJpZGdlIGNoaXApLiAg
WW91IGNhbiBzZWUgYSBwYXRjaCB0byBkbyB0aGF0Cj4gaGVyZToKPgo+IGh0dHBzOi8vY3JyZXYu
Y29tL2MvMjI3NjM4NAo+Cj4gLi4uc28gSSdtIGhvcGluZyB0byBnZXQgc29tZSBjbGFyaXR5IGZy
b20gQk9FIGJvdGggb24gdGhlIHRydWUgYml0cwo+IHBlciBwaXhlbCBhbmQgd2hldGhlciBteSBw
cm9wb3NlZCB0aW1pbmdzIGFyZSB2YWxpZCBiZWZvcmUgbW92aW5nCj4gZm9yd2FyZC4gIElzIHRo
YXQgT0s/Cj4KPgo+IC1Eb3VnCgoKSXQncyBmaW5lIGJ5IG1lIC0gdGVzdGluZyBSb2IncyBzdWdn
ZXN0aW9uIG9mIGNoYW5naW5nCk1BWF9IRElTUExBWV9TUExJVCAxMDgwLT4xOTIwIGFsb25nIHdp
dGggdGhlIGNoYW5nZSB0byBhZGRpbmcgSVNfU0RNODQ1CmRvZXMgZ2l2ZSBtZSBhIGZ1bGwgc2Ny
ZWVuIHRoYXQgbG9va3MgbmljZXIsIEknbSBmaW5lIHdpdGggdXNpbmcgdGhlCmhhY2sgbG9jYWxs
eSB1bnRpbCBhIHByb3BlciBzb2x1dGlvbiBpcyBmb3VuZC7CoCBBbmQgSSdtIGFsd2F5cyBhIGZh
biBvZgp1c2luZyBsZXNzIHBvd2VyIG9uIGEgbGFwdG9wLgoKCkknbGwgZ2l2ZSB0aGUgcGF0Y2gg
YSBzcGluIGhlcmUgaWYgeW91IHdhbnQgYXMgd2VsbC4KCgpIb3BlZnVsbHkgQk9FIGdldHMgYmFj
ayB0byB5b3Ugc29vbiwgYW5kIHRoZXJlJ3Mgbm8gcnVzaCwgSSdtIGp1c3QgYW4KZW5kIHVzZXIg
d2hvIGlzIGV4dHJlbWVseSBhcHByZWNpYXRpdmUgb2YgYWxsIHRoZSB3b3JrIGV2ZXJ5b25lIG9u
IHRoZQpsaXN0IGFuZCB0aGUga2VybmVsIGluIGdlbmVyYWwgcHV0IGluIHRvIG1ha2UgbXkgbWFj
aGluZXMgdXNhYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
