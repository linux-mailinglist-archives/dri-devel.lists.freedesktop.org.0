Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9091D7F6D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 20:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD7A6E881;
	Tue, 15 Oct 2019 18:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C80C6E881
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:56:42 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id y39so17889836ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=69K9D3r3isAzGWCkl4tXGaPbezJWNQZqBGY3SWlTvH8=;
 b=jKpwxnNC7eKoICpHLQ+SANXZjLdMbzQ+rtzz8QJvYAn7kVnqnQpmV0cQcS83TBdPVu
 w1pDe6yWAjvq35BZoHjvxgedxUV9rQIhEuMECjdybg0FssoxCCVwdaYsDadECeCX9VF9
 wzumOWiKKC2h2p2426Q7mcuJs3tYwDWhgbdEa2/KKNwUriYB5R2kIodjB/cotVcBaWbp
 7tutbRZStCnCWsErSNSAKFZDUK91paOD4tBL866iEItKkYMqSoh/vk0NNAxZzVNyiiow
 LIkh9M3pK+RQGacOIPC9weYlq+W07uEhyIXSfVmPaNNILxZ7sjL+xG52i35ND37pFI0S
 FP9g==
X-Gm-Message-State: APjAAAWqY7QTsiRTdCaK/WNHzoh73f2JxE9srGv5jYBFnjWhUTPzVzko
 2OFTlKmphCHf3yFxFxuM9ulMhvk=
X-Google-Smtp-Source: APXvYqwznC5nnuLw55IrKarIOGDxG0q3cxJ3XaDTBfOOj5rvpnL8DNj9vP4G4i/KrqJyhAGfxRkjCw==
X-Received: by 2002:a9d:684a:: with SMTP id c10mr4682978oto.354.1571165801222; 
 Tue, 15 Oct 2019 11:56:41 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t17sm6601720otk.14.2019.10.15.11.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 11:56:40 -0700 (PDT)
Date: Tue, 15 Oct 2019 13:56:40 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: renesas: lvds: Document
 r8a774b1 bindings
Message-ID: <20191015185640.GA22440@bogus>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
 <1569834905-42868-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569834905-42868-4-git-send-email-biju.das@bp.renesas.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzMCBTZXAgMjAxOSAxMDoxNTowNCArMDEwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gRG9j
dW1lbnQgdGhlIFJaL0cyTiAoUjhBNzc0QjEpIExWRFMgYmluZGluZ3MuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4
dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKCkFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
