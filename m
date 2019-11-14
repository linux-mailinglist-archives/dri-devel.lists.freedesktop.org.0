Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970CFBDAB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 02:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF076E112;
	Thu, 14 Nov 2019 01:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4827089338
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 01:52:24 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 22so3779358oip.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mzR6nG67pn8IlqJFDhdjYxot9QbuFGZP+Pet1HLMx08=;
 b=cL+Im3pJ2I8DOkr8gbhujtCdmDZH+nqYA9zQyE7WHWjKfPGjmJlhqTHtrPCM+pyp9o
 asaoKkmis8PhrXAhvuNezJqGay/2DRu31J3jvW58g8IxSYTRQzbO+G2nbd1tIEDPTHJX
 CKhyfe09kcv97VTNqrbd/sh+qkTr4RDALUnc7gBFV8/5pIevM8K/E8Sy2VgKrEz9fKna
 aycVGXp0bZ3v8204Ee/rd1JvlHeoMwhNj2BXz/sd/ox6121T8xB4hlpsELATrD1EeTr/
 BnVxsJ8qgU4LlDglF1pL/uI7rxEvAHTIp9MnVVo0YV33wXzoPTMwu98rY+NJsKIEpmEO
 /FNg==
X-Gm-Message-State: APjAAAVkw3Tnqj/3pap0x9aM1+V0jZBPZQ/Td2TVIK+glnlIY++wu2TR
 8YZ2kJmY0iaUterBSvmJvg==
X-Google-Smtp-Source: APXvYqy1LyXkt7WGiuHxADhPr836dQgZX6Iact41M6WrKpL8aIdlSK3MOwv9B1/LdhtB661imE7fmQ==
X-Received: by 2002:a05:6808:103:: with SMTP id
 b3mr1326000oie.38.1573696343304; 
 Wed, 13 Nov 2019 17:52:23 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e93sm1380668otb.60.2019.11.13.17.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 17:52:22 -0800 (PST)
Date: Wed, 13 Nov 2019 19:52:22 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: display: rockchip-dsi: add px30
 compatible
Message-ID: <20191114015222.GA22800@bogus>
References: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
 <20191108000253.8560-5-heiko.stuebner@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108000253.8560-5-heiko.stuebner@theobroma-systems.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, philippe.cornu@st.com, yannick.fertre@st.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgOCBOb3YgMjAxOSAwMTowMjo1MiArMDEwMCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6
Cj4gVGhlIHB4MzAgU29DIGFsc28gdXNlcyBhIGR3LW1pcGktZHNpIGNvbnRyb2xsZXIsIHNvIGFk
ZCB0aGUKPiBjb21wYXRpYmxlIHZhbHVlIGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWlr
byBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+IC0tLQo+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQg
ICAgICB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
