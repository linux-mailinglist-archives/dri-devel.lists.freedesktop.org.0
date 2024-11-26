Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF09D9545
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 11:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F7610E814;
	Tue, 26 Nov 2024 10:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g3z2Knzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21BC10E815
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:15:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-434a45f05feso10853415e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 02:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732616131; x=1733220931; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iMHlNehhUeJtZXiuS3qHdRgWnpyVBbD3di8vAnUvhDQ=;
 b=g3z2KnznrNs+RV/E16T9U08AcHFpxd6UeEqLIwSM3njWEhM5y1yxw86Q0MfG1guxhK
 6mLA0yKnpQWeb48SbHJobaDxpcSFx3X8DRuY++b0gubrbsstmts2pLQhoqBxziOgBZcQ
 q0j1qAmHc4L592DvLg0vSsQkmxR4i72nXcQ1qANlUWA1QLlai25e6Ujs6A8RM8QvqR67
 PSE/oDLm3UbX3W839xpdhddEzhp41xzzeXlzL5S2Hk21xFVRvNxhRcTYGDnlBovYMlab
 YvwQm3sJuNw63U+j+mqQ5M5zGNufSPrsiNeMlpTc0VbqybzcQIndxvAAeus7GHneys8P
 TOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732616131; x=1733220931;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iMHlNehhUeJtZXiuS3qHdRgWnpyVBbD3di8vAnUvhDQ=;
 b=BrZKmsnqQbSGnI91Ix5RaEYmt+SzQ1ksYvGQ/Z37UkHIAMcIFLnz1XrwmWCe3GicJr
 v5YMDaiyn90nR8TMwCdvtLyQoOtJnC6KdSyAT9h1I6Vwoh3+3/KbgMb8GkbAyWTPLOJf
 u3GK3rpvQFAbD7BLua33oKBsNrBRIVget3SzWkVOZneMl+HIwaszN6o5Ro9P54R8N1fX
 xa9FWuATiijyRgTKrpFQZCl5xpCNrmCzQVifWaUTGjfq+Rm2rD5Me0mJTVUe4bp7y4AO
 m7bRCmSPNlKiXb75E+imurU+1My6C85Y+a0/6D645UcWAmxNJehR8Ub1O2h1eI68zFNy
 5Y8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrdpJ8MUi1tereZl3IrP4QBd+9Gb9rqkUE09PC+pZDUgUK1oOSWKMp9DMuG9GKT1SGvGIxlU7QqzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxFMxlvz2sVhyPXt2b4Qcj9RI3hjdBRJEJMmWQFcSjMSBNbZMA
 wPLER8X8/ULAUDpKzfuH1U1qVN4GjnEXrJr7VakNUY20uj+FfEqx
X-Gm-Gg: ASbGncvJqCVtJ16v0Y1xzn5QyJ1aMIyvbveqK/nfFJVs6Cw/a2awYb7SGts8FgyL8NU
 ANCTzxWfftM+SxO46SNbfC/I2Ux2OFW7rkYNqdD95V+fG2ljANy1iNy3YLvCmJARoPeKRCPQUy0
 3mM25px0m4jIRloBIhWKnG410LURa8vzvwGGZ+1/fjwk2zaSMPpTNKDp9pn4pt58ls+mSNtZ15K
 7BuLk6CUAf7kKzHqaNn7vYuTtGZs1+7VXzx5+nRvRPcOIL9HjIxPfi49LcyYPXKBp7DApEVBtXh
 yZEZRYYP8dNvYOA6Huxq
X-Google-Smtp-Source: AGHT+IGSUVR4ktjx520waynJHg6uz+q+sQ70n8ebOF0pRuJy89VrdCGC9kyQeWZfvcRuqeeAHVawjA==
X-Received: by 2002:a05:600c:4f06:b0:431:5f8c:ccb9 with SMTP id
 5b1f17b1804b1-433ce426a01mr176891285e9.17.1732616130901; 
 Tue, 26 Nov 2024 02:15:30 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it.
 [188.217.53.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a0876a41sm56191495e9.11.2024.11.26.02.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 02:15:30 -0800 (PST)
Date: Tue, 26 Nov 2024 11:15:28 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieram Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: hints around rcar_lvds.c :)
Message-ID: <Z0WfwMJVCQOEZM3c@tom-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent, All,

Sorry for bothering.
Looking for some feedback :)

I have a similar rcar_lvds.c IP's to handle but in my case:
I have lvds0 and lvds1 that are sharing some common regs (lvds_cmn).

 ----------------------
|    -------------     |
|   |lvds_cmn_regs|    |
|    -------------     |
|                      |
|    -----------       |
|   | lvds0_regs |     |-----> ch0
|    ------------      |
|                      |
|    -----------       |
|   | lvds1_regs |     |-----> ch1
|    ------------      |
 ----------------------


So I'm checking 2 drm dts/driver architecture:

1st architecture:
 - Using a single lvds driver to handle both lvds0 and lvds1.

		 ----------------------
		|                      |
		|                      |
		|                      |
du_lvds0 ------>|                      |----> ch0_lvds
		|      lvds_bridge     |
		|                      |
		|                      |
du_lvds1 ------>|                      |----> ch1_lvds
		|                      |
		 ----------------------


Issue:

Problem here is the 1 single link 2ch mode.
lvds0 and lvds1 can drive 2 display with 2 differents fb (fb0 and fb1).

Having a single drm_bridge to drive both channel give me the following issue:

In single link 2ch mode when for the first time the du encoder drm_attach()
the lvds bridge to the encoder(du) all goes fine and fb0 is created correctly.

Then again the du encoder is trying again to drm_attach() the lvds bridge
but this return -EBUSY obviously because is already attached.

Then I think this is not the way to follow because I need 2 drm_bridges
from the same drm drive, and I think this is not correct.
----------

2nd architecture:
 - Follow rcar_lvds.c way using 2 nodes for lvds0 and lvds1:

		 ------------
du_lvds0 -----> |lvds0_bridge|----> ch0_lvds
		 ------------

		 ------------
du_lvds1 -----> |lvds1_bridge|----> ch1_lvds
		 ------------

Issue:
I thinks this is an optimal approach but in my case here
the problem is that lvds0 and lvds1 share a set of common registers
some common clocks and common reset:

My plan is to manipulate those common regs (lvds_cmn) using
compatible = "simple-mfd", "syscon"; as follow:

lvds_cmn: lvds-cmn {
	compatible = "simple-mfd", "syscon";
	reg = <common_regs>;

	lvds0: lvds0-encoder {

		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			clocks = <&common_clk>, <&dotclok0>, <&phyclock0>;
			resets = <&common_rst>;

			port@0 {
				reg = <0>;
				lvds0_in: endpoint {
					remote-endpoint = <&du_out_lvds0>;
				};
			};

			port@1 {
				reg = <1>;
				lvds_ch0: endpoint {
				};
			};
		};
	};

	lvds1: lvds1-encoder {

		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			clocks = <&common_clk>, <&dotclok1>, <&phyclock1>;
                        resets = <&common_rst>;

			port@0 {
				reg = <0>;
				lvds1_in: endpoint {
					remote-endpoint = <&du_out_lvds1>;
				};
			};

			port@1 {
				reg = <1>;
				lvds_ch1: endpoint {
				};
			};
		};
	};
};
----------

I'm asking to find the best way to represent those IP's.
What do you think?
Any hints/tips would be nice.
Thanks in advance.

Thanks & Regards,
Tommaso
