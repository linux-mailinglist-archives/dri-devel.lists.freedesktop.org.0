Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667F44B41
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8936E898A3;
	Thu, 13 Jun 2019 18:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947F8898A4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:15 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e5so8523436pls.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lwM3RQ6rY++wgw7yn5WUFBlppvdw3r+F1ViBjDeHCs=;
 b=FD63WS24JvnfzRYcViPp8ptzjAImn8AGwUQER36W8h+Un1jbt/1wLwRZ0N12VR3DP8
 WIkRE40ASKnJ4B8CoQ8Ur26HLR/6q5VcU/e/4lVAVkMXcCblL9ggR/0AjEat0/IXgU98
 WaI5oFx6Lmp7+szka37JRQhTR0zcBKvCjhSL9imy5z/u/zLAEOhN1RqFc47dbTS6ByCc
 PlYZMuFEHh40lbOh2bmimzUDXe2HTT7U1MQe6o0u7jlbLxuJT9UuIAynZAJqRyOz0Gi1
 sWwzT86sjrrylulbbg77VMX6SBKat/HSU9Z8O32nGKaPFWyZ7Is7WfvzaTDbQ1C9yBIG
 zNWg==
X-Gm-Message-State: APjAAAUz96hxvpj3OFa4HOY6hBP+AuQf/tpA+F24QmUnepY+hct5i4pk
 PEvwP7m6Tk/i3yRZ1Wsb8NzbOg==
X-Google-Smtp-Source: APXvYqwrSEcwAiyWJov4mOAq0qxt+AHhKCRfAadeR4vw9EKNHl7WARJKCDYcPqUSKwH+A1yGV7auMQ==
X-Received: by 2002:a17:902:6a88:: with SMTP id
 n8mr83133009plk.266.1560452055157; 
 Thu, 13 Jun 2019 11:54:15 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.54.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:14 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 6/9] dt-bindings: sun6i-dsi: Add R40 MIPI-DSI compatible (w/
 A64 fallback)
Date: Fri, 14 Jun 2019 00:22:38 +0530
Message-Id: <20190613185241.22800-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lwM3RQ6rY++wgw7yn5WUFBlppvdw3r+F1ViBjDeHCs=;
 b=ECdMR7nsipHVwpuR1tty9HburkoT+7g1MO15MFZjZnEJZmdzoLMuz4qU32PXk398ag
 dQXE/W/Ky1zTaiZvfsHfrtHdez1m4Jn1hXKc+Z43+YdH/+3HToRbQCYVTj+kT4hRt0X2
 Q/qiHEfPhbDBevTUyrBjoTziUZ39wS6hvPfkA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIFI0MCBpcyBzaW1pbGFyIG9uCnRo
ZSBvbmUgb24gQTY0IGxpa2UgZG9lc24ndCBhc3NvY2lhdGUgYW55IERTSV9TQ0xLIGdhdGluZy4K
ClNvLCBhZGQgUjQwIGNvbXBhdGlibGUgYW5kIGFwcGVuZCBBNjQgY29tcGF0aWJsZSBhcyBmYWxs
YmFjay4KCkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogTWFyayBSdXRs
YW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFn
YW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKaW5kZXggZDBjZTUxZmVh
MTAzLi40MzhmMWY5OTlhZWIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dApAQCAtMTMsNiAr
MTMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAtIGNvbXBhdGlibGU6IHZhbHVlIG11c3Qg
YmUgb25lIG9mOgogICAgICogYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaQogICAgICogYWxs
d2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kKKyAgICAqIGFsbHdpbm5lcixzdW44aS1yNDAtbWlw
aS1kc2ksIGFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHNpCiAgIC0gcmVnOiBiYXNlIGFkZHJl
c3MgYW5kIHNpemUgb2YgbWVtb3J5LW1hcHBlZCByZWdpb24KICAgLSBpbnRlcnJ1cHRzOiBpbnRl
cnJ1cHQgYXNzb2NpYXRlZCB0byB0aGlzIElQCiAgIC0gY2xvY2tzOiBwaGFuZGxlcyB0byB0aGUg
Y2xvY2tzIGZlZWRpbmcgdGhlIERTSSBlbmNvZGVyCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
