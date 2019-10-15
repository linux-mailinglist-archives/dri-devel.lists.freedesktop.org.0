Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7DD7F6A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 20:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5025D6E3AE;
	Tue, 15 Oct 2019 18:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CDB6E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:56:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g13so17891756otp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HHTFz9uSwh4OuUts3UgqslOAVdahwqh8IjC9kodDCZI=;
 b=kGAgk6dtCEqfn5k025TbC3i2nCAZVHnFaZSAwyeKZtuImH4AmMitgOfAjK8J44XP9h
 +hivJOp52bK0EEjiqHl6BTc/tnuLvnZXwbYkixO4o4dUdbkBXL7czFulkjPTJ/q3xveH
 9HzH8PDKrj3Y0+1A3/UMmGNO9fK4+Tn87clBgDC2y8Pc0rNiYb3xTcBhen4tGOSD7GVY
 4CaWbnN0wYFygjdTwKFfVH7GrRAskTqI2fB6xKc1SnNBmsdu0sC68otM8gYDfo5+o9fI
 o5wigcRiTM/kElCteyUcziMY6QZQs4DlTZi+DB4TbEC570BMUn6AozTucPteHYukrEiT
 TEow==
X-Gm-Message-State: APjAAAVgqCSCqiIsmcXGv7lpvru3L00Mv+HYWVw3PPRAP9qw3l/d1Rzp
 ko3GJIq0ztNTV+AZbvK88Q==
X-Google-Smtp-Source: APXvYqzcgr8bvUAb/uvZB4lhcUUCtQIoS4GH/lbZI/6dKUGnytDajQC2KeD4gr+ONlprmtGvzHSmFw==
X-Received: by 2002:a9d:6e92:: with SMTP id a18mr3410641otr.313.1571165783758; 
 Tue, 15 Oct 2019 11:56:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d95sm7324238otb.25.2019.10.15.11.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 11:56:23 -0700 (PDT)
Date: Tue, 15 Oct 2019 13:56:22 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas: du: Document the
 r8a774b1 bindings
Message-ID: <20191015185622.GA21864@bogus>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
 <1569834905-42868-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569834905-42868-2-git-send-email-biju.das@bp.renesas.com>
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

T24gTW9uLCAzMCBTZXAgMjAxOSAxMDoxNTowMiArMDEwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gRG9j
dW1lbnQgdGhlIFJaL0cyTiAoUjhBNzc0QjEpIFNvQyBpbiB0aGUgUi1DYXIgRFUgYmluZGluZ3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPgo+
IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2Fz
LGR1LnR4dCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAoKQWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
