Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E6A03D2F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8445710E03C;
	Tue,  7 Jan 2025 11:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pIgwc9x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D4110E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:03:16 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so18727366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736247734; x=1736852534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8JZJoaJUaNREKAXmerLK4Rd1hRsVn/PObGVachLq/qE=;
 b=pIgwc9x7smk2FOUI/2QMXBaJ/gP14VNNRoed9vZT4WzOBqfvuQvgYj+H6V0AuLa9av
 5iUt4IvD1U9PnenZmkTxzGBWth+aFI/CPXE4RJSs4hrFyLL6EhAqrXb4OG3D47BT9u+x
 Nnei5zloPc5sQFPRcl8mqxEHm/JmlAhf66XTRfytPmAwv8QEZ8MyutA7MjVfC2o97gng
 1rPL+xj6RuX+IrtXD9vDCBJt5WKZMVb31zfbrfMhPJViD7PD61TLT2jERm6PifieQuQ4
 Q4SR8u9egF6EAKbsUWygyp4q9T5eVtbLaEaq6lStHrtwx9e/IUKN/htTQO/4xeKxveyb
 iscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736247734; x=1736852534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JZJoaJUaNREKAXmerLK4Rd1hRsVn/PObGVachLq/qE=;
 b=qRn1EL4PfMenEpRHx13kvj6+jizuxBzd4LevMV959ROp1eGRLXHs+hRpZ7EO7dP5Qf
 rTlkwyiA00q+sxXs/EGQLMSPIAxA67TXTDWpDSSRNgSzlIwa/RR92f8gcAQEb7KVpOiY
 xVVOYC3jL+xJyvzn6Usq8id4Sco7C86swOUZQOuO7PGTi2dcPy5tZfWxuadi8f7WxUFc
 Rw0pjrcL1rj0SgGXQYlqTeZKu8r4X3+7vOVdSBKzNgekPgXOqxakkFwY19u6WA2WQzlN
 9SvwbO9VwellcZdNHbopGR40ob0gZNjw/txiVYshJ0Jp7HihMwrPE8JaeDfySEioeEWd
 wWWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHHUx32bCOk9gdaQbMtOL+tqa2h4c+yAsDrGKmwATWL9nfAI3GtVt1a42r815IFp2HMhDDxxZswdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS9ZtfoeIxjLjh8ixBtWH5OquucPxtP46+xvrX6NZq67yAaox9
 KJeJLTiOcqHiN32wzakh71F0cOrWvmHaAQgwU8eKBMgnU5WIbPtqQirOaE7zn1LjbV0LxEBIHXU
 Z2wc=
X-Gm-Gg: ASbGncux6nOc1EbOirgXZt0sB9qDWv2rIdVIBTT33AS8WKmx2AZOvUC3Nnteye9yQYn
 XwtPvs/+60B5NuiFsHrCUB2h28xwwdAbjG4Wf1TCgMxr/UoEuzTyRX+etTYaGcpeRhDOpiblwbC
 1Py4xx8OAGlHr7ghkIef8BSf4hL+NFoUxCS7huJUKR75Wjlb6HEEJFgIPVe3lWqJ2tUMZxjTa5U
 KMtyzsXSeQ/IQY6zGt0aiAtkuAN6PVI26Q5cT7VFFaMndwTNhwshPCNdpiq3z7bhv9n1GhOnf2i
 k3NuEp2mtV6ZPzCusDgBIKPqhXXGzpm6OqLA
X-Google-Smtp-Source: AGHT+IGLgKzFbsWmFq6sHxnOSAOcAHZ8LpCXiCvq8SonzUfMjFA3G31B6U5QoMf8+KUqSpyXSGnKNw==
X-Received: by 2002:a05:6512:1392:b0:542:213f:78fa with SMTP id
 2adb3069b0e04-542295224demr17287062e87.7.1736247307140; 
 Tue, 07 Jan 2025 02:55:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832ba9sm5226861e87.277.2025.01.07.02.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 02:55:05 -0800 (PST)
Date: Tue, 7 Jan 2025 12:55:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 07/17] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <pffzxwsqwkklur3b7c7hp6g5wonzam5fs35fwblil3cjfofozk@clwgt5gcb32a>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-8-damon.ding@rock-chips.com>
 <shr7ak7keqza3gw6wra2zra35qht2cxlzkvtuhzl3swzf2fwxy@i2v4o53lhese>
 <96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com>
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

On Tue, Jan 07, 2025 at 11:02:15AM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2024/12/30 20:45, Dmitry Baryshkov wrote:
> > On Thu, Dec 26, 2024 at 02:33:03PM +0800, Damon Ding wrote:
> > > Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> > > pre-emphasis configurations of each link rate have been verified according
> > > to the eDP 1.3 requirements.
> > 
> > Well... Please describe what's happening here. That the HDMI PHY on your
> > platform also provides support for DP / eDP. Please document any design
> > decisions that you had to make.
> > 
> 
> Yes, I will add more relevant descriptions in the next version.
> 
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Add the module author
> > > 
> > > Changes in v3:
> > > - Split this patch into two, one for correction and the other for
> > >    extension
> > > 
> > > Changes in v4:
> > > - Add link_rate and lanes parameters in struct rk_hdptx_phy to store the
> > >    phy_configure() result for &phy_configure_opts.dp.link_rate and
> > >    &phy_configure_opts.dp.lanes
> > > ---
> > >   .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 896 +++++++++++++++++-
> > >   1 file changed, 889 insertions(+), 7 deletions(-)
> > > 
> > > @@ -933,9 +1484,339 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
> > >   	return rk_hdptx_phy_consumer_put(hdptx, false);
> > >   }
> > > +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> > > +				 int submode)
> > > +{
> > > +	return 0;
> > > +}
> > 
> > No need for the stub, please drop it. The host controller driver can
> > still call phy_set_mode() / _ext(), the call will return 0.
> 
> Without the &phy_ops.set_mode(), the phy driver can not get phy_mode to
> distinguish between HDMI and DP mode via the phy_get_mode(), even if the
> host driver calls phy_set_mode() / _ext(). Additionally, the previous
> discussion [0] also mentioned future considerations for dynamic switching.
> Indeed, I should add a related comment before the 'return 0;' to enhance
> understandability.

Oh... I see. Without .set_mode() callback the attrs.mode won't change.
We should probably fix that, there should be no need to add dummy stubs.


-- 
With best wishes
Dmitry
