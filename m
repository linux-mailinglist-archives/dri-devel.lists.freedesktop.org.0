Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D61779AD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9C6EA84;
	Tue,  3 Mar 2020 14:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79AA6EA84
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:58:51 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 2so3303718oiz.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 06:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HxYfnK8zgVmnkmuPybEMmldIypjikhPJCdUr+htsJJY=;
 b=FhDBPqavnNv1MKUKDlZf3wT2wN63WwZ737C9dPnijPbyQ8sXTMc3xqGidIgXqFl4o8
 AL22TInI+2v0NRrik7jeuvr2igaO56UymrAKOLwOG58lTEimppruRNLFmgbBNw39ClwR
 a7yVpB+AIK2cgecMG4ndhsTBwX8WUXCzO9FhaNhBk58QPFNMDVLO34PqUnNpgtvNmbH3
 cr660QNRbHt9PLgUgguG58AaHpJjNfL6tNpCiG7qyzHnhkHfRfjZw+b4C0z1z3VgBmmJ
 z4D8gXPUD3keZLNx/HIBpceQ2xoRc+tnBsXzNO/QX9ANFV8JVFUw3frpiIE//HzwDUp7
 tb2A==
X-Gm-Message-State: ANhLgQ33PMN8+ceJu4uGt3pzhcBFFHxLcUiJHNVGJDAwr6S2AEhpGsK6
 OAchtx5b+3x36tgvYqSMLQ==
X-Google-Smtp-Source: ADFU+vsNrW8VLQ1ZuwqDkt7czhKZ/Buqrf2aEO084qIkKlMwfgtTqE0s+XvEn0/xjyizTznoEYeHeg==
X-Received: by 2002:a54:4791:: with SMTP id o17mr2613096oic.70.1583247530753; 
 Tue, 03 Mar 2020 06:58:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c12sm7744056oic.27.2020.03.03.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:58:49 -0800 (PST)
Received: (nullmailer pid 31539 invoked by uid 1000);
 Tue, 03 Mar 2020 14:58:48 -0000
Date: Tue, 3 Mar 2020 08:58:48 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Message-ID: <20200303145848.GA13796@bogus>
References: <cover.1582744379.git.hns@goldelico.com>
 <20200227122325.GA7587@ravnborg.org>
 <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org,
 Sam Ravnborg <sam@ravnborg.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 01:56:56PM +0100, H. Nikolaus Schaller wrote:
> Hi Sam,
> 
> > Am 27.02.2020 um 13:23 schrieb Sam Ravnborg <sam@ravnborg.org>:
> > 
> > Hi Nikolaus.
> > 
> > On Wed, Feb 26, 2020 at 08:12:52PM +0100, H. Nikolaus Schaller wrote:
> >> This patch series adds HDMI output to the jz4780/CI20 board.
> >> 
> >> It is based on taking the old 3.18 vendor kernel and trying
> >> to achieve the same with modern DTS setup and new/modified
> >> drivers.
> >> 
> >> Unfortunately, in this first RFC, only EDID and creation of
> >> /dev/fb0 are working. Also, HDMI hot plugging is detected.
> >> 
> >> But there is no HDMI output signal. So some tiny piece seems
> >> to be missing to enable/configure the Synposys HDMI controller.
> >> 
> >> We need help from the community to fix this.
> >> 
> >> Note: device tree bindings are from 2015 and still seem to
> >> fit - except they are not in yaml format.
> >> 
> >> Original authors of most patches are
> >> * Paul Boddie <paul@boddie.org.uk>
> >> * Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> >> 
> >> 
> >> H. Nikolaus Schaller (2):
> >>  drm: ingenic-drm: add MODULE_DEVICE_TABLE
> >>  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
> >> 
> >> Paul Boddie (4):
> >>  drm: ingenic: add jz4780 Synopsys HDMI driver.
> >>  pinctrl: ingenic: add hdmi-ddc pin control group
> >>  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
> >>  MIPS: DTS: CI20: add HDMI setup
> >> 
> >> Zubair Lutfullah Kakakhel (2):
> >>  dt-bindings: video: Add jz4780-lcd binding
> >>  dt-bindings: video: Add jz4780-hdmi binding
> >> 
> >> .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
> >> .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
> > New bindings in DT Schema format please...
> > We want to have then in a formal launguage so we can use these
> > to verify the DT files.
> 
> Yes, I know. And I fully support the goal.
> 
> But I personally do not have the time to learn the (IMHO brain-twisting)
> way the Schema format is working. Especially, I am not interested
> in becoming volunteer translator for .txt based schemas developed
> by someone else.
> 
> So I hope that someone from the community can and is willing to do
> that.
> 
> Or that there will appear good tools soon. E.g. some GUI
> based editor tool would be very helpful so that you don't have
> to fight with the yaml indentation rules. Like there are XML
> and DTD editors. And even HTML is rarely written manually any more.
> 
> IMHO such tools should have been developed and in place *before*
> the rule to provide DT schemata is enforced.

You mean tools like what is discussed here:

https://www.redhat.com/sysadmin/yaml-tips

There's also yaml-format in the dtschema repo which will reformat a file 
to the desired formatting. It is just a wrapper around ruamel yaml 
library.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
