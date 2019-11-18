Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47850100DD1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C76E2E9;
	Mon, 18 Nov 2019 21:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A256E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:36:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w24so15432023otk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/0BIKn+o96RBSpk8ZHTuKqS7BjRkQHseFrb4HN/n6hM=;
 b=q3A0wBrQyNgM+J5pNYgKvS1vUHuDd6n6aDBJDXKmCOXlBn8ARdie5ugs0ydyz9wKNt
 D5traINdLQECzhxCFSd1Jg26+TrbiGC9dQGbyIrZSAwnCunYhV03mIYIpppvUtttZvtX
 Nw3PTKdpwDp2OqYxDx0M46quJfNZ+X37ffd3DnQ7+opnPxTKPeRY2FR4SlgaAhFeg9SY
 Un9FolmXQukXrEZKmBrowv20FVkGw+D5eJC821VgAexL+wsndR/MPHYhwH8WRyIziJmA
 ylb8WSLuU5NcDac6oe37KjYdTNgw9/yW34DP3XutUt7U5m+zwXgGDP+qYdgy+r5QpDrz
 Op7g==
X-Gm-Message-State: APjAAAV+ipteNqJYi9F7G+7qa7yvZo6+rzARj/bdYjyuy+CZDs7Odp5H
 YhTWR7cQrnrMNvklmyWldQ==
X-Google-Smtp-Source: APXvYqwmIGg/mph+M+CHBdotYlMsPFBa2R7uinZCHzD9Ud0o5hIMrJlVslhdtsHPYuitryawEvTPaw==
X-Received: by 2002:a05:6830:224c:: with SMTP id
 t12mr1012564otd.299.1574112971130; 
 Mon, 18 Nov 2019 13:36:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n204sm6495968oig.15.2019.11.18.13.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:36:10 -0800 (PST)
Date: Mon, 18 Nov 2019 15:36:09 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: display: bridge: lvds-transmitter:
 Document powerdown-gpios
Message-ID: <20191118213609.GA1484@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBOb3YgMjAxOSAxNTo1MToyMSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3Rl
Ogo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBwcm9wZXJ0eSBwb3dlcmRvd24tZ3Bpb3MuIFRoZSBw
cm9wZXJ0eSBpcwo+IG9wdGlvbmFsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3Ry
byA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYzLT52NDoKPiAq
IE5ldyBwYXRjaAo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9sdmRzLXRyYW5zbWl0dGVyLnlhbWwgICAgICAgICB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
