Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B641CC9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7D892BC;
	Wed, 12 Jun 2019 06:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0564C891E3;
 Wed, 12 Jun 2019 00:05:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so6139112ljg.1;
 Tue, 11 Jun 2019 17:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twnhTVYd7tn35O7vvlIa3XEgKYk2/zieh7kgQ5Ms1VY=;
 b=F/xQZSL6Vko8I2GyNdkWz71xcGUTxQmjl1DkBSCupD4yCHwT6JpBoElaHKMqIfef6e
 zxekzm/JpZ0NGh+T1U4kUExEX1gqlLgpQH7w28divxsXF9lgbHAQhG5fOxysN5wBAXFM
 /iGyFc2M38+EpkurnEy/0wxKbNFDtNsxIXg4Vcxr9ERAyzsSCbcrs3bo1+MJ5uoiV46o
 wDSTDar53zQxMu3hjCoY1y8TfDEJwdufrv9FUg2QLS91NmujBtpDrtrcfLrWXHo0nlq0
 FQLduAbHYwwNcuNBvJvfMznRDV1yCsfQ7h0CYjhnoKuVtEYXqo1cphWZFIZbPCCRvk3y
 /b/w==
X-Gm-Message-State: APjAAAVx8VOw7aUd7com97b27/UJoRf419H2N+qA4I4ymNcc+uMgp1mX
 BIsV7wrYhQnSUTiXZyfAfQUlAM2+sArZMo72VnU=
X-Google-Smtp-Source: APXvYqyO/Oi3PmoK5iJ0YzdPrMw5xZcqUF1R75rhMCOs6SLJy8NUkUXX4LUB1wFJr6ZxPQT0SJAlgxYZrwxAPMCixo8=
X-Received: by 2002:a2e:298a:: with SMTP id p10mr12710225ljp.74.1560297918252; 
 Tue, 11 Jun 2019 17:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
In-Reply-To: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 11 Jun 2019 17:05:06 -0700
Message-ID: <CAADnVQKwvfuoyDEu+rB8=btOi33LdrUvk4EkQM86sDpDG61kew@mail.gmail.com>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
To: Shyam Saini <shyam.saini@amarulasolutions.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=twnhTVYd7tn35O7vvlIa3XEgKYk2/zieh7kgQ5Ms1VY=;
 b=iDBd+Nyh60vWHvSGtVHWVETugM2fnnm+FqmmiJZ56NZHl6V9Aty9AmjFW8CRdEnVVB
 aGKuXc3BMI1WRmMN59ZmT1r6kVO7qzb4q1bDpYmpS/ZUrVuenxbQGoF2Qv4WS5P5xTYu
 MgUGL2vvXlsZ04GvxKv4oWOnyz8mNGE24H+bdBFJTo0aHTJ0k0u+7bh9tcE9VNAMwAtH
 iKtxqCy1DSmKDdJUUU93WbsyygyX8RtwvZ5Owd5cCDJ9ZU6yAlx8+gKU6PDNIGy1Yrds
 5FOvUqOWwAWAd5bt0eEYz6DGK7Ot7sHrl6lNbuwYOmPXTEQ7T1WTuP7Qnyr0A/A07xpx
 QkCw==
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
Cc: Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Network Development <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 linux-sctp@vger.kernel.org, devel@lists.orangefs.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, mayhs11saini@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNTowMCBQTSBTaHlhbSBTYWluaQo8c2h5YW0uc2FpbmlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCB0aGVyZSBhcmUgMyBk
aWZmZXJlbnQgbWFjcm9zLCBuYW1lbHkgc2l6ZW9mX2ZpZWxkLCBTSVpFT0ZfRklFTEQKPiBhbmQg
RklFTERfU0laRU9GIHdoaWNoIGFyZSB1c2VkIHRvIGNhbGN1bGF0ZSB0aGUgc2l6ZSBvZiBhIG1l
bWJlciBvZgo+IHN0cnVjdHVyZSwgc28gdG8gYnJpbmcgdW5pZm9ybWl0eSBpbiBlbnRpcmUga2Vy
bmVsIHNvdXJjZSB0cmVlIGxldHMgdXNlCj4gRklFTERfU0laRU9GIGFuZCByZXBsYWNlIGFsbCBv
Y2N1cnJlbmNlcyBvZiBvdGhlciB0d28gbWFjcm9zIHdpdGggdGhpcy4KPgo+IEZvciB0aGlzIHB1
cnBvc2UsIHJlZGVmaW5lIEZJRUxEX1NJWkVPRiBpbiBpbmNsdWRlL2xpbnV4L3N0ZGRlZi5oIGFu
ZAo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9icGZfdXRpbC5oIGFuZCByZW1vdmUgaXRz
IGRlZmluYXRpb24gZnJvbQo+IGluY2x1ZGUvbGludXgva2VybmVsLmgKCnBsZWFzZSBkb250LiBi
cGZfdXRpbC5oIGlzIGEgdXNlciBzcGFjZSBoZWFkZXIuClBsZWFzZSBsZWF2ZSBpdCBhcy1pcy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
