Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF28CDF87A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4E210E30F;
	Sat, 27 Dec 2025 11:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g7TIhrpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5937B10E30F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:09:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2192441986;
 Sat, 27 Dec 2025 11:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E0C4CEF1;
 Sat, 27 Dec 2025 11:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766833773;
 bh=JbOZLdmbqKiIXGK3unBmKB2Pa3tI/97z6pwAtInxolY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g7TIhrpI/J7VeLmIj6OuxDyfWwcsMU+tMtYqEfIU2d2WtnJ3uYsB9H+Ugl20FqGe8
 AyfZxubngGH/GhcPbT+momXUlfYPO+lbfmPJ4WOjJp0FxKngGWdiZNQ4TZAcybyzEM
 L87cI3C6mX6nAL0J63zka6I1ONBKTqsovMufIHXmnp5t225uXgtyAkpl0tWf6/n1gd
 qzxJcDJNTnQKhUzCtOdjGubLGwXg//yuO3ASOiyoEFl4NBta6fkoJOTiq9sudsU7Ce
 qjp5/3G8AwY8vd2VK/q4FEhCvNg4Vn1p3jfEAjEVaWEYFiDW/MuAGTaodaLP98TDNA
 SY7hDI8G1vvww==
Date: Sat, 27 Dec 2025 12:09:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Han Gao (Revy)" <rabenda.cn@gmail.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <20251227-gigantic-handsome-falcon-3c31bf@quoll>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
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

On Thu, Dec 25, 2025 at 05:45:00PM +0800, Han Gao (Revy) wrote:
> > +            dpu_out_dp1: endpoint@1 {
> > +              reg = <1>;
> > +              remote-endpoint = <&hdmi_in>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.52.0
> > 
> 
> Tested-by: Han Gao <gaohan@iscas.ac.cn>

NAK, not true. Otherwise explain me how can you test the bindings.


