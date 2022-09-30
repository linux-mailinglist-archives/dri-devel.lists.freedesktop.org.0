Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FEE5F1498
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 23:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45EE10EDB1;
	Fri, 30 Sep 2022 21:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D762D10EDB1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 21:14:27 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id v130so5981540oie.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=zyrqo3fe6r2fKBJRFJO+f+v384tFeIOi5zkuHJHZH38=;
 b=prkWQnRIdStcwacJhjpy0aSsF7rOKoTW7DB4TlFbe1gGpNg7qhKEvGlOnDp+Csu0AC
 4TiGV6lFiA0v6QOUeCZRAadg6ZBrA1lqLYrn3XHPWHO1Z9KTuzbyaArFJ0Kx4DZaYHXn
 dp5Fy6lIpnHw+gv8vcMW3d/xUWBEgHdkiy4Nl00cuogbPlahSvGLGqmfo3dbCL1O2tsG
 gIKnJdrQUGnRpO3qg9NVLsp1AD5WoJtZbfaKdZL7GLSw7ublP3qIUXCHFeFSR72p83HZ
 KGNh0rPrjtPWTxfQIPopmbJbs37Gza7yvxSYlDKOASrbljrwOVBBvAldzdVX+Zu87tCJ
 A+IA==
X-Gm-Message-State: ACrzQf0VNXyezsI7BT98FvJF+YvwMKBPTaxfCwhxMxbGV3h94qBpNtY/
 JLemET76dGdl6a5Len5G9w==
X-Google-Smtp-Source: AMsMyM4f1vIjP1erIeRPHEWE3V3RmdJbC6D7s/Oj6KnSreksnh+8a9HVNRQqiWBkLXhD3T8021Abng==
X-Received: by 2002:a05:6808:181e:b0:350:772c:ed7 with SMTP id
 bh30-20020a056808181e00b00350772c0ed7mr71560oib.126.1664572466828; 
 Fri, 30 Sep 2022 14:14:26 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x16-20020a9d4590000000b00655ca9a109bsm801385ote.36.2022.09.30.14.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:14:25 -0700 (PDT)
Received: (nullmailer pid 1061289 invoked by uid 1000);
 Fri, 30 Sep 2022 21:14:24 -0000
Date: Fri, 30 Sep 2022 16:14:24 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Message-ID: <20220930211424.GA913368-robh@kernel.org>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org>
 <YzbPz8mL0Yo+vgSS@orome>
 <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 01:20:50PM +0200, Krzysztof Kozlowski wrote:
> On 30/09/2022 13:15, Thierry Reding wrote:
> > On Fri, Sep 30, 2022 at 12:51:07PM +0200, Krzysztof Kozlowski wrote:
> >> On 29/09/2022 19:05, Diogo Ivo wrote:
> >>> The Google Pixel C has a JDI LPM102A188A display panel. Add a
> >>> DT node for it. Tested on Pixel C.
> >>>
> >>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> >>> ---
> >>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
> >>>  1 file changed, 72 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> >>> index 20d092812984..271ef70747f1 100644
> >>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> >>> @@ -31,6 +31,39 @@ memory {
> >>>  	};
> >>>  
> >>>  	host1x@50000000 {
> >>> +		dc@54200000 {
> >>> +			status = "okay";
> >>
> >> You should override by labels, not by full path.
> > 
> > Why exactly is that? I've always stayed away from that (and asked others
> > not to do so, at least on Tegra) because I find it impossible to parse
> > for my human brain. Replicating the original full hierarchy makes it
> > much more obvious to me where the changes are happening than the
> > spaghetti-like mess that you get from overriding by label reference.
> 
> Sure, it's entirely up to you. I forgot your preference.
> 
> But it is a really nice way to have duplicated nodes and mistakes (which
> happen from time to time).

We could have a schema or dtc check for that. We already warn for 
duplicate unit-addresses which would catch some typos. Checking for a 
node with only 'status' would probably work when that's the only 
addition. Maybe status without a compatible would be better? We also 
check for nodes without a specific schema, but child nodes in schemas 
aren't handled.

Rob
